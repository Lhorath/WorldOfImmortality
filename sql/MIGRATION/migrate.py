#!/usr/bin/env python3
"""Copy compatible rows from configured legacy MySQL databases."""

from __future__ import annotations

import argparse
import json
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parent
GROUPS = ("AUTH", "CHARACTERS", "WORLD")
OLD_TDB_VERSION = "335.11.39"
NEW_TDB_VERSION = "335.26091"
TABLE_MARKER = re.compile(r"^-- Dumping structure for table [^.]+\.([^\s]+)\s*$", re.MULTILINE)
IDENTIFIER = re.compile(r"^[A-Za-z0-9_$]+$")
BATCH_SIZE = 500


@dataclass
class TablePlan:
    group: str
    table: str
    source_database: str
    target_database: str
    status: str
    classification: str = "LEGACY / UNCLASSIFIED"
    reason: str = ""
    columns: list[str] = field(default_factory=list)
    source_only: list[str] = field(default_factory=list)
    custom_source_common: list[str] = field(default_factory=list)
    custom_source_only: list[str] = field(default_factory=list)
    core_restructured_source_only: list[str] = field(default_factory=list)
    ignored_core_columns: list[str] = field(default_factory=list)
    core_drift_source_only: list[str] = field(default_factory=list)
    target_only: list[str] = field(default_factory=list)
    target_only_core: list[str] = field(default_factory=list)
    target_only_nonstock: list[str] = field(default_factory=list)
    required_custom_missing: list[str] = field(default_factory=list)
    type_differences: list[str] = field(default_factory=list)
    source_rows: int | None = None
    inserted_rows: int = 0


def load_env(path: Path) -> dict[str, str]:
    if not path.is_file():
        raise RuntimeError(f"Configuration file not found: {path}")

    values: dict[str, str] = {}
    for line_number, raw_line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        line = raw_line.strip()
        if not line or line.startswith("#"):
            continue
        if "=" not in line:
            raise RuntimeError(f"Invalid .env entry on line {line_number}")
        key, value = line.split("=", 1)
        key = key.strip()
        value = value.strip()
        if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", key):
            raise RuntimeError(f"Invalid .env key on line {line_number}")
        if len(value) >= 2 and value[0] == value[-1] and value[0] in ("'", '"'):
            value = value[1:-1]
        values[key] = value
    return values


def schema_tables(path: Path) -> set[str]:
    if not path.is_file():
        raise RuntimeError(f"Schema file not found: {path}")
    tables = set(TABLE_MARKER.findall(path.read_text(encoding="utf-8")))
    if not tables:
        raise RuntimeError(f"No table definitions found in {path.name}")
    return tables


def load_schema_baselines(path: Path, old_version: str, new_version: str) -> dict[str, Any]:
    try:
        manifest = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise RuntimeError(f"Unable to read TrinityCore schema baseline {path}: {exc}") from exc
    versions = manifest.get("versions", {})
    if versions.get("old") != old_version or versions.get("new") != new_version:
        raise RuntimeError(
            f"Schema baseline versions do not match configured TDB profile "
            f"{old_version} -> {new_version}"
        )
    if not all(group in manifest.get("schemas", {}) for group in ("auth", "characters", "world")):
        raise RuntimeError("TrinityCore schema baseline is missing one or more database groups")
    return manifest


def validate_identifier(value: str, label: str) -> str:
    if not IDENTIFIER.fullmatch(value):
        raise RuntimeError(f"{label} must contain only letters, digits, underscores, or dollar signs")
    return value


def parse_override_list(value: str, label: str, expected_parts: int) -> set[tuple[str, ...]]:
    entries: set[tuple[str, ...]] = set()
    for raw_entry in value.split(","):
        entry = raw_entry.strip()
        if not entry:
            continue
        parts = tuple(part.strip() for part in entry.split("."))
        if len(parts) != expected_parts or parts[0].upper() not in GROUPS:
            raise RuntimeError(f"{label} entries must use " + ("GROUP.table" if expected_parts == 2 else "GROUP.table.column"))
        for part in parts[1:]:
            validate_identifier(part, label)
        entries.add((parts[0].upper(), *(part.casefold() for part in parts[1:])))
    return entries


def quote_identifier(value: str) -> str:
    return f"`{validate_identifier(value, 'MySQL identifier')}`"


def make_connection(pymysql: Any, values: dict[str, Any], database: str) -> Any:
    return pymysql.connect(
        host=values["MYSQL_HOST"],
        port=int(values["MYSQL_PORT"]),
        user=values["MYSQL_USER"],
        password=values["MYSQL_PASSWORD"],
        database=database,
        charset="utf8mb4",
        autocommit=False,
        connect_timeout=15,
    )


def table_metadata(connection: Any, database: str) -> tuple[dict[str, str], dict[str, list[dict[str, Any]]]]:
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT TABLE_NAME, ENGINE FROM information_schema.TABLES "
            "WHERE TABLE_SCHEMA = %s AND TABLE_TYPE = 'BASE TABLE'",
            (database,),
        )
        engines = {row["TABLE_NAME"]: (row["ENGINE"] or "").upper() for row in cursor.fetchall()}
        cursor.execute(
            "SELECT TABLE_NAME, COLUMN_NAME, IS_NULLABLE, COLUMN_DEFAULT, EXTRA, "
            "DATA_TYPE, COLUMN_TYPE FROM information_schema.COLUMNS "
            "WHERE TABLE_SCHEMA = %s ORDER BY TABLE_NAME, ORDINAL_POSITION",
            (database,),
        )
        columns: dict[str, list[dict[str, Any]]] = {}
        for row in cursor.fetchall():
            columns.setdefault(row["TABLE_NAME"], []).append(row)
    return engines, columns


def required_configuration(values: dict[str, Any]) -> dict[str, Any]:
    needed = [
        "MYSQL_HOST",
        "MYSQL_PORT",
        "MYSQL_USER",
        "MYSQL_PASSWORD",
        "OLD_TDB_VERSION",
        "NEW_TDB_VERSION",
    ]
    for group in GROUPS:
        needed.extend((f"{group}_OLD_DATABASE", f"{group}_NEW_DATABASE"))
    missing = [key for key in needed if key not in values or values[key] == ""]
    if missing:
        raise RuntimeError("Missing .env settings: " + ", ".join(missing))

    try:
        port = int(values["MYSQL_PORT"])
    except ValueError as exc:
        raise RuntimeError("MYSQL_PORT must be an integer") from exc
    if not 1 <= port <= 65535:
        raise RuntimeError("MYSQL_PORT must be between 1 and 65535")
    values["MYSQL_PORT"] = str(port)
    if values["OLD_TDB_VERSION"] != OLD_TDB_VERSION or values["NEW_TDB_VERSION"] != NEW_TDB_VERSION:
        raise RuntimeError(
            f"This migration profile supports TDB {OLD_TDB_VERSION} -> {NEW_TDB_VERSION}; "
            "update the tool's verified schema profile before changing these values"
        )

    for group in GROUPS:
        old_database = validate_identifier(values[f"{group}_OLD_DATABASE"], f"{group}_OLD_DATABASE")
        new_database = validate_identifier(values[f"{group}_NEW_DATABASE"], f"{group}_NEW_DATABASE")
        if old_database.casefold() == new_database.casefold():
            raise RuntimeError(f"{group} old and new databases must be different")
    values["_CUSTOM_TABLES"] = parse_override_list(values.get("CUSTOM_TABLES", ""), "CUSTOM_TABLES", 2)
    values["_CUSTOM_COLUMNS"] = parse_override_list(values.get("CUSTOM_COLUMNS", ""), "CUSTOM_COLUMNS", 3)
    values["_IGNORED_CORE_COLUMNS"] = parse_override_list(
        values.get("IGNORED_CORE_COLUMNS", ""),
        "IGNORED_CORE_COLUMNS",
        3,
    )
    overlap = values["_CUSTOM_COLUMNS"] & values["_IGNORED_CORE_COLUMNS"]
    if overlap:
        raise RuntimeError("A column cannot be both MUST MIGRATE and explicitly ignored")
    ignored_custom_table = {
        entry
        for entry in values["_IGNORED_CORE_COLUMNS"]
        if entry[:2] in values["_CUSTOM_TABLES"]
    }
    if ignored_custom_table:
        raise RuntimeError("Core columns cannot be ignored on a table marked MUST MIGRATE")
    return values


def build_plans(
    source_connection: Any,
    group: str,
    source_database: str,
    target_database: str,
    source_schema_tables: set[str],
    target_schema_tables: set[str],
    source_engines: dict[str, str],
    target_engines: dict[str, str],
    source_columns: dict[str, list[dict[str, Any]]],
    target_columns: dict[str, list[dict[str, Any]]],
    custom_tables: set[tuple[str, ...]],
    custom_columns: set[tuple[str, ...]],
    ignored_core_columns: set[tuple[str, ...]],
    old_stock_tables: dict[str, list[str]],
    new_stock_tables: dict[str, list[str]],
) -> list[TablePlan]:
    old_stock = {
        table.casefold(): {column.casefold() for column in columns}
        for table, columns in old_stock_tables.items()
    }
    new_stock = {
        table.casefold(): {column.casefold() for column in columns}
        for table, columns in new_stock_tables.items()
    }
    plans: list[TablePlan] = []
    for table in sorted(source_schema_tables):
        table_key = (group, table.casefold())
        is_required_custom_table = table_key in custom_tables
        is_old_stock_table = table.casefold() in old_stock
        is_new_stock_table = table.casefold() in new_stock
        plan = TablePlan(
            group,
            table,
            source_database,
            target_database,
            "READY",
            classification=(
                "CUSTOM - MUST MIGRATE"
                if is_required_custom_table
                else "CUSTOM/FORK-SPECIFIC - MUST MIGRATE"
                if not is_old_stock_table
                else "TRINITYCORE OLD-ONLY - REMOVED/RENAMED"
                if not is_new_stock_table
                else "TRINITYCORE TABLE"
            ),
        )
        plans.append(plan)
        if table not in target_schema_tables:
            plan.status = "NOT MIGRATED"
            if is_required_custom_table:
                plan.reason = "custom table is marked MUST MIGRATE but is absent from the new schema file"
            elif not is_old_stock_table:
                plan.reason = "custom/fork-specific table MUST MIGRATE but is absent from the new schema file"
            elif not is_new_stock_table:
                plan.reason = "old TrinityCore table is absent from the new schema; it may have been removed or renamed"
            else:
                plan.reason = "TrinityCore table is missing from the new schema file"
            continue
        if table not in source_engines:
            plan.status, plan.reason = "NOT MIGRATED", "table is absent from the old database"
            continue
        if table not in target_engines:
            plan.status, plan.reason = "NOT MIGRATED", "table is absent from the target database"
            continue
        if target_engines[table] != "INNODB":
            plan.status, plan.reason = "NOT MIGRATED", f"target engine is {target_engines[table] or 'unknown'}, not transactional InnoDB"
            continue

        old_columns = source_columns.get(table, [])
        new_columns = target_columns.get(table, [])
        if any(
            custom_group == group and custom_table == table.casefold()
            for custom_group, custom_table, _ in custom_columns
        ):
            plan.classification = "CUSTOM COLUMN - MUST MIGRATE"
        old_names = [column["COLUMN_NAME"] for column in old_columns]
        new_names = [column["COLUMN_NAME"] for column in new_columns]
        old_name_set = {name.casefold() for name in old_names}
        new_name_set = {name.casefold() for name in new_names}
        plan.ignored_core_columns = [
            name
            for name in old_names
            if (group, table.casefold(), name.casefold()) in ignored_core_columns
        ]
        ignored_names = {name.casefold() for name in plan.ignored_core_columns}
        plan.columns = [
            name
            for name in old_names
            if name.casefold() in new_name_set and name.casefold() not in ignored_names
        ]
        plan.source_only = [name for name in old_names if name.casefold() not in new_name_set]
        plan.target_only = [name for name in new_names if name.casefold() not in old_name_set]
        old_stock_columns = old_stock.get(table.casefold(), set())
        new_stock_columns = new_stock.get(table.casefold(), set())
        plan.custom_source_common = [
            name
            for name in plan.columns
            if (group, table.casefold(), name.casefold()) in custom_columns
            or (
                not is_required_custom_table
                and (
                    not is_old_stock_table
                    or name.casefold() not in old_stock_columns
                )
            )
        ]
        for name in plan.source_only:
            column_key = (group, table.casefold(), name.casefold())
            if (
                is_required_custom_table
                or not is_old_stock_table
                or name.casefold() not in old_stock_columns
                or column_key in custom_columns
            ):
                plan.custom_source_only.append(name)
            elif not is_new_stock_table or name.casefold() not in new_stock_columns:
                if column_key not in ignored_core_columns:
                    plan.core_restructured_source_only.append(name)
            else:
                plan.core_drift_source_only.append(name)
        plan.required_custom_missing = list(plan.custom_source_only)
        plan.target_only_core = [name for name in plan.target_only if name.casefold() in new_stock_columns]
        plan.target_only_nonstock = [name for name in plan.target_only if name.casefold() not in new_stock_columns]
        if plan.custom_source_only:
            plan.classification = "CUSTOM/FORK-SPECIFIC - MUST MIGRATE"
        elif plan.custom_source_common:
            plan.classification = "CUSTOM/FORK-SPECIFIC - MUST MIGRATE"
        if any((group, table.casefold(), name.casefold()) in custom_columns for name in plan.columns):
            plan.classification = "CUSTOM COLUMN - MUST MIGRATE"

        old_by_name = {column["COLUMN_NAME"].casefold(): column for column in old_columns}
        new_by_name = {column["COLUMN_NAME"].casefold(): column for column in new_columns}
        copied_name_set = {name.casefold() for name in plan.columns}
        for name in plan.columns:
            old_type = old_by_name[name.casefold()]["COLUMN_TYPE"]
            new_type = new_by_name[name.casefold()]["COLUMN_TYPE"]
            if old_type.lower() != new_type.lower():
                plan.type_differences.append(f"{name}: {old_type} -> {new_type}")

        required_missing = [
            column["COLUMN_NAME"]
            for column in new_columns
            if column["COLUMN_NAME"].casefold() not in copied_name_set
            and column["IS_NULLABLE"] == "NO"
            and column["COLUMN_DEFAULT"] is None
            and "auto_increment" not in column["EXTRA"].lower()
            and "generated" not in column["EXTRA"].lower()
        ]
        if required_missing:
            plan.status = "NOT MIGRATED"
            plan.reason = "target has required columns with no same-name source value: " + ", ".join(required_missing)
            continue
        if plan.required_custom_missing:
            plan.status = "NOT MIGRATED"
            plan.reason = (
                "custom data is marked MUST MIGRATE but target columns are absent; "
                "add target columns or define an explicit mapping: "
                + ", ".join(plan.required_custom_missing)
            )
            continue
        if plan.core_drift_source_only:
            plan.status = "NOT MIGRATED"
            plan.reason = (
                "source columns are in both TDB baselines but missing from the supplied new schema: "
                + ", ".join(plan.core_drift_source_only)
            )
            continue
        if plan.core_restructured_source_only:
            plan.status = "NOT MIGRATED"
            plan.reason = (
                "old TrinityCore fields are absent from the new baseline; map them or explicitly list them "
                "in IGNORED_CORE_COLUMNS: "
                + ", ".join(plan.core_restructured_source_only)
            )
            continue
        if not plan.columns:
            plan.status, plan.reason = "NOT MIGRATED", "no same-name columns to copy"
            continue

        with source_connection.cursor() as cursor:
            cursor.execute(f"SELECT COUNT(*) AS row_count FROM {quote_identifier(table)}")
            plan.source_rows = int(cursor.fetchone()["row_count"])
    return plans


def render_report(plans: list[TablePlan], executing: bool) -> str:
    lines = [
        "World of Immortality database migration report",
        f"TDB profile: {OLD_TDB_VERSION} -> {NEW_TDB_VERSION}",
        "Classification uses the bundled stock table/column inventories for this profile.",
        f"Mode: {'EXECUTION' if executing else 'DRY RUN (no rows copied)'}",
        "Only same-name columns are copied. Existing target rows are never updated or replaced.",
        "",
    ]
    for plan in plans:
        row_count = "" if plan.source_rows is None else f"; source rows={plan.source_rows}"
        if executing and plan.status == "MIGRATED":
            row_count += f"; inserted rows={plan.inserted_rows}"
        lines.append(
            f"[{plan.status}] {plan.group.lower()}.{plan.table} "
            f"({plan.source_database} -> {plan.target_database}){row_count}"
        )
        lines.append(f"  Classification: {plan.classification}")
        if plan.reason:
            lines.append(f"  Reason: {plan.reason}")
        if plan.source_only:
            lines.append("  Source-only columns not copied: " + ", ".join(plan.source_only))
        if plan.custom_source_common:
            lines.append("  CUSTOM/FORK-SPECIFIC columns copied by same-name match: " + ", ".join(plan.custom_source_common))
        if plan.custom_source_only:
            lines.append("  CUSTOM/FORK-SPECIFIC columns marked MUST MIGRATE: " + ", ".join(plan.custom_source_only))
        if plan.core_restructured_source_only:
            lines.append(
                "  TrinityCore old-version columns absent from the new baseline (removed/restructured): "
                + ", ".join(plan.core_restructured_source_only)
            )
        if plan.ignored_core_columns:
            lines.append("  Old core columns explicitly ignored by configuration: " + ", ".join(plan.ignored_core_columns))
        if plan.target_only_core:
            lines.append("  New TDB core columns not in source; target defaults used: " + ", ".join(plan.target_only_core))
        if plan.target_only_nonstock:
            lines.append("  New non-stock target columns not in source: " + ", ".join(plan.target_only_nonstock))
        if plan.required_custom_missing:
            lines.append("  MUST-MIGRATE custom columns missing from target: " + ", ".join(plan.required_custom_missing))
        if plan.target_only:
            lines.append("  Target-only columns left at defaults: " + ", ".join(plan.target_only))
        if plan.type_differences:
            lines.append("  Column type differences (checked under strict SQL mode): " + "; ".join(plan.type_differences))
    lines.extend(
        [
            "",
            "Important: review skipped tables and columns. Renamed or semantically changed fields require a deliberate mapping.",
            "Take verified backups and stop application writes before running a migration.",
        ]
    )
    return "\n".join(lines) + "\n"


def write_report(plans: list[TablePlan], executing: bool) -> None:
    report_path = ROOT / "report.txt"
    report_path.write_text(render_report(plans, executing), encoding="utf-8")
    print(f"Report written to {report_path}")


def migrate_table(pymysql: Any, source: Any, target: Any, plan: TablePlan) -> None:
    fields = ", ".join(quote_identifier(name) for name in plan.columns)
    query = f"SELECT {fields} FROM {quote_identifier(plan.table)}"
    insert = (
        f"INSERT INTO {quote_identifier(plan.table)} ({fields}) "
        f"VALUES ({', '.join(['%s'] * len(plan.columns))})"
    )

    source_cursor = source.cursor(pymysql.cursors.SSCursor)
    target_cursor = target.cursor()
    copied = 0
    try:
        source_cursor.execute(query)
        target.begin()
        while True:
            rows = source_cursor.fetchmany(BATCH_SIZE)
            if not rows:
                break
            target_cursor.executemany(insert, rows)
            copied += len(rows)
        target.commit()
        plan.inserted_rows = copied
        plan.status = "MIGRATED"
    except pymysql.MySQLError as exc:
        plan.status = "FAILED"
        plan.reason = f"table insert failed; transaction rollback requested: {exc}"
        try:
            target.rollback()
        except pymysql.MySQLError as rollback_error:
            plan.reason += f"; rollback failed: {rollback_error}"
    finally:
        source_cursor.close()
        target_cursor.close()


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Safely copy compatible data from the old MySQL databases to the new databases."
    )
    parser.add_argument(
        "--execute",
        action="store_true",
        help="perform inserts after preflight; without this option the tool only reports a dry run",
    )
    args = parser.parse_args()

    try:
        import pymysql
    except ImportError:
        print("PyMySQL is missing. Install it with: python -m pip install -r requirements.txt", file=sys.stderr)
        return 2

    try:
        values = required_configuration(load_env(ROOT / ".env"))
        baseline = load_schema_baselines(
            ROOT / "tdb_schema_baselines.json",
            values["OLD_TDB_VERSION"],
            values["NEW_TDB_VERSION"],
        )
        schema_pairs = {}
        for group in GROUPS:
            stem = group.lower()
            schema_pairs[group] = (
                schema_tables(ROOT / f"old_{stem}_schema.sql"),
                schema_tables(ROOT / f"new_{stem}_schema.sql"),
            )

        for group, table in values["_CUSTOM_TABLES"]:
            old_tables = {name.casefold() for name in schema_pairs[group][0]}
            if table not in old_tables:
                raise RuntimeError(f"CUSTOM_TABLES entry {group}.{table} is not in the old schema file")
        for group, table, column in values["_CUSTOM_COLUMNS"]:
            old_tables = {name.casefold() for name in schema_pairs[group][0]}
            if table not in old_tables:
                raise RuntimeError(f"CUSTOM_COLUMNS entry {group}.{table}.{column} is not in the old schema file")
        for group, table, column in values["_IGNORED_CORE_COLUMNS"]:
            old_tables = {name.casefold() for name in schema_pairs[group][0]}
            if table not in old_tables:
                raise RuntimeError(f"IGNORED_CORE_COLUMNS table {group}.{table} is not in the old schema file")
            old_stock = baseline["schemas"][group.lower()]["old"]
            new_stock = baseline["schemas"][group.lower()]["new"]
            old_stock_columns = {
                column.casefold()
                for name, columns in old_stock.items()
                if name.casefold() == table
                for column in columns
            }
            new_stock_columns = {
                column.casefold()
                for name, columns in new_stock.items()
                if name.casefold() == table
                for column in columns
            }
            if column not in old_stock_columns or column in new_stock_columns:
                raise RuntimeError(
                    f"IGNORED_CORE_COLUMNS entry {group}.{table}.{column} is not an old stock column removed from the new baseline"
                )

        plans: list[TablePlan] = []
        for group in GROUPS:
            source_database = values[f"{group}_OLD_DATABASE"]
            target_database = values[f"{group}_NEW_DATABASE"]
            source = make_connection(pymysql, values, source_database)
            target = None
            try:
                target = make_connection(pymysql, values, target_database)
                with target.cursor() as cursor:
                    cursor.execute(
                        "SET SESSION sql_mode = CONCAT_WS(',', "
                        "NULLIF(@@SESSION.sql_mode, ''), 'STRICT_ALL_TABLES')"
                    )
                source_engines, source_columns = table_metadata(source, source_database)
                target_engines, target_columns = table_metadata(target, target_database)
                for custom_group, table, column in values["_CUSTOM_COLUMNS"]:
                    if custom_group != group:
                        continue
                    available_columns = {
                        item["COLUMN_NAME"].casefold()
                        for item in source_columns.get(table, [])
                    }
                    if column not in available_columns:
                        raise RuntimeError(
                            f"CUSTOM_COLUMNS entry {group}.{table}.{column} is absent from the source database"
                        )
                for ignored_group, table, column in values["_IGNORED_CORE_COLUMNS"]:
                    if ignored_group != group:
                        continue
                    available_columns = {
                        item["COLUMN_NAME"].casefold()
                        for item in source_columns.get(table, [])
                    }
                    if column not in available_columns:
                        raise RuntimeError(
                            f"IGNORED_CORE_COLUMNS entry {group}.{table}.{column} is absent from the source database"
                        )
                group_plans = build_plans(
                    source,
                    group,
                    source_database,
                    target_database,
                    schema_pairs[group][0],
                    schema_pairs[group][1],
                    source_engines,
                    target_engines,
                    source_columns,
                    target_columns,
                    values["_CUSTOM_TABLES"],
                    values["_CUSTOM_COLUMNS"],
                    values["_IGNORED_CORE_COLUMNS"],
                    baseline["schemas"][group.lower()]["old"],
                    baseline["schemas"][group.lower()]["new"],
                )
                plans.extend(group_plans)
            finally:
                source.close()
                if target is not None:
                    target.close()

        print(render_report(plans, False))
        write_report(plans, False)
        if not args.execute:
            print("Dry run only. No database rows were changed.")
            return 0

        target_names = ", ".join(values[f"{group}_NEW_DATABASE"] for group in GROUPS)
        confirmation = input(
            f"Type MIGRATE to insert into target databases [{target_names}]: "
        ).strip()
        if confirmation != "MIGRATE":
            print("Confirmation did not match; no rows were copied.")
            return 1

        write_report(plans, True)
        for plan_index, plan in enumerate(plans):
            if plan.status != "READY":
                continue
            source = None
            target = None
            try:
                source = make_connection(pymysql, values, plan.source_database)
                target = make_connection(pymysql, values, plan.target_database)
                with target.cursor() as cursor:
                    cursor.execute(
                        "SET SESSION sql_mode = CONCAT_WS(',', "
                        "NULLIF(@@SESSION.sql_mode, ''), 'STRICT_ALL_TABLES')"
                    )
                migrate_table(pymysql, source, target, plan)
            except pymysql.MySQLError as exc:
                plan.status = "FAILED"
                plan.reason = f"database connection or session setup failed: {exc}"
            finally:
                if source is not None:
                    source.close()
                if target is not None:
                    target.close()
            write_report(plans, True)
            print(f"[{plan.status}] {plan.group.lower()}.{plan.table}: {plan.reason or plan.inserted_rows}")
            if plan.status == "FAILED" and plan.reason.startswith("database connection or session setup failed:"):
                for unattempted in plans[plan_index + 1:]:
                    if unattempted.status == "READY":
                        unattempted.status = "NOT MIGRATED"
                        unattempted.reason = "execution stopped after a database connection or session setup failure"
                write_report(plans, True)
                break

        failed = any(plan.status == "FAILED" for plan in plans)
        print(render_report(plans, True))
        return 1 if failed else 0
    except (OSError, RuntimeError, ValueError, pymysql.MySQLError) as exc:
        print(f"Migration tool error: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
