import unittest
from pathlib import Path
from tempfile import TemporaryDirectory

from migrate import (
    build_plans,
    load_env,
    load_schema_baselines,
    required_configuration,
    render_report,
    schema_tables,
)


class MigrationToolTests(unittest.TestCase):
    class CountCursor:
        def __enter__(self):
            return self

        def __exit__(self, *_):
            return None

        def execute(self, *_):
            return None

        def fetchone(self):
            return {"row_count": 1}

    class CountConnection:
        def cursor(self):
            return MigrationToolTests.CountCursor()

    def test_schema_table_parser_ignores_views_and_reads_table_markers(self):
        with TemporaryDirectory() as temp_dir:
            schema = Path(temp_dir) / "schema.sql"
            schema.write_text(
                "-- Dumping structure for table example.account\n"
                "CREATE TABLE `account` (`id` int);\n"
                "-- Dumping structure for view example.account_summary\n"
                "CREATE VIEW `account_summary` AS SELECT 1;\n",
                encoding="utf-8",
            )
            self.assertEqual(schema_tables(schema), {"account"})

    def test_configuration_rejects_same_source_and_target_database(self):
        config = {
            "MYSQL_HOST": "localhost",
            "MYSQL_PORT": "3306",
            "MYSQL_USER": "user",
            "MYSQL_PASSWORD": "password",
            "OLD_TDB_VERSION": "335.11.39",
            "NEW_TDB_VERSION": "335.26091",
        }
        for group in ("AUTH", "CHARACTERS", "WORLD"):
            config[f"{group}_OLD_DATABASE"] = f"old_{group.lower()}"
            config[f"{group}_NEW_DATABASE"] = f"new_{group.lower()}"
        config["AUTH_NEW_DATABASE"] = config["AUTH_OLD_DATABASE"]

        with self.assertRaisesRegex(RuntimeError, "must be different"):
            required_configuration(config)

    def test_configuration_rejects_unprofiled_tdb_version(self):
        config = {
            "MYSQL_HOST": "localhost",
            "MYSQL_PORT": "3306",
            "MYSQL_USER": "user",
            "MYSQL_PASSWORD": "password",
            "OLD_TDB_VERSION": "335.11.39",
            "NEW_TDB_VERSION": "335.26091",
        }
        for group in ("AUTH", "CHARACTERS", "WORLD"):
            config[f"{group}_OLD_DATABASE"] = f"old_{group.lower()}"
            config[f"{group}_NEW_DATABASE"] = f"new_{group.lower()}"
        config["NEW_TDB_VERSION"] = "335.26092"

        with self.assertRaisesRegex(RuntimeError, "supports TDB"):
            required_configuration(config)

    def test_env_loader_reads_quoted_values_and_ignores_comments(self):
        with TemporaryDirectory() as temp_dir:
            env_file = Path(temp_dir) / ".env"
            env_file.write_text('# local config\nMYSQL_PASSWORD="a=b#c"\n', encoding="utf-8")
            self.assertEqual(load_env(env_file), {"MYSQL_PASSWORD": "a=b#c"})

    def test_baseline_loader_requires_matching_tdb_versions(self):
        with TemporaryDirectory() as temp_dir:
            baseline = Path(temp_dir) / "baseline.json"
            baseline.write_text(
                '{"versions":{"old":"335.11.39","new":"335.26091"},'
                '"schemas":{"auth":{},"characters":{},"world":{}}}',
                encoding="utf-8",
            )
            result = load_schema_baselines(baseline, "335.11.39", "335.26091")
            self.assertIn("auth", result["schemas"])
            with self.assertRaisesRegex(RuntimeError, "do not match"):
                load_schema_baselines(baseline, "335.11.39", "335.26092")

    def test_missing_target_schema_table_is_reported_as_not_migrated(self):
        plans = build_plans(
            None,
            "AUTH",
            "old_auth",
            "new_auth",
            {"account"},
            set(),
            {},
            {},
            {},
            {},
            set(),
            set(),
            set(),
            {},
            {},
        )

        self.assertEqual(plans[0].status, "NOT MIGRATED")
        self.assertIn("CUSTOM/FORK-SPECIFIC - MUST MIGRATE", render_report(plans, False))
        self.assertIn("335.11.39 -> 335.26091", render_report(plans, False))

    def test_required_new_column_prevents_partial_table_copy(self):
        source_columns = {
            "account": [
                {"COLUMN_NAME": "id", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": "auto_increment"}
            ]
        }
        target_columns = {
            "account": [
                {"COLUMN_NAME": "id", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": "auto_increment"},
                {"COLUMN_NAME": "verifier", "COLUMN_TYPE": "binary(32)", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": ""},
            ]
        }
        plans = build_plans(
            None,
            "AUTH",
            "old_auth",
            "new_auth",
            {"account"},
            {"account"},
            {"account": "MYISAM"},
            {"account": "INNODB"},
            source_columns,
            target_columns,
            set(),
            set(),
            set(),
            {},
            {},
        )

        self.assertEqual(plans[0].status, "NOT MIGRATED")
        self.assertIn("verifier", plans[0].reason)

    def test_required_custom_column_missing_target_blocks_table(self):
        source_columns = {
            "account": [
                {"COLUMN_NAME": "id", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": "auto_increment"},
                {"COLUMN_NAME": "gmlevel", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": "0", "EXTRA": ""},
            ]
        }
        target_columns = {
            "account": [
                {"COLUMN_NAME": "id", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": "auto_increment"}
            ]
        }
        plans = build_plans(
            None,
            "AUTH",
            "old_auth",
            "new_auth",
            {"account"},
            {"account"},
            {"account": "MYISAM"},
            {"account": "INNODB"},
            source_columns,
            target_columns,
            set(),
            set(),
            set(),
            {"account": ["id"]},
            {"account": ["id"]},
        )

        self.assertEqual(plans[0].status, "NOT MIGRATED")
        self.assertIn("gmlevel", plans[0].reason)
        self.assertIn("MUST MIGRATE", plans[0].classification)

    def test_mysql_column_names_match_case_insensitively(self):
        source_columns = {
            "account": [
                {"COLUMN_NAME": "id", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": "auto_increment"},
                {"COLUMN_NAME": "gmLevel", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": "0", "EXTRA": ""},
            ]
        }
        target_columns = {
            "account": [
                {"COLUMN_NAME": "id", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": "auto_increment"},
                {"COLUMN_NAME": "GMLEVEL", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": "0", "EXTRA": ""},
            ]
        }
        plans = build_plans(
            self.CountConnection(),
            "AUTH",
            "old_auth",
            "new_auth",
            {"account"},
            {"account"},
            {"account": "MYISAM"},
            {"account": "INNODB"},
            source_columns,
            target_columns,
            set(),
            set(),
            set(),
            {"account": ["id", "gmLevel"]},
            {"account": ["id", "GMLEVEL"]},
        )

        self.assertEqual(plans[0].columns, ["id", "gmLevel"])
        self.assertFalse(plans[0].source_only)
        self.assertFalse(plans[0].target_only)

    def test_custom_source_column_present_in_target_is_reported_as_copied(self):
        source_columns = {
            "account": [
                {"COLUMN_NAME": "id", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": "auto_increment"},
                {"COLUMN_NAME": "gmlevel", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": "0", "EXTRA": ""},
            ]
        }
        target_columns = {
            "account": [
                {"COLUMN_NAME": "id", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": "auto_increment"},
                {"COLUMN_NAME": "gmlevel", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": "0", "EXTRA": ""},
            ]
        }
        plans = build_plans(
            self.CountConnection(),
            "AUTH",
            "old_auth",
            "new_auth",
            {"account"},
            {"account"},
            {"account": "MYISAM"},
            {"account": "INNODB"},
            source_columns,
            target_columns,
            set(),
            set(),
            set(),
            {"account": ["id"]},
            {"account": ["id", "gmlevel"]},
        )

        self.assertIn("gmlevel", plans[0].custom_source_common)
        self.assertIn("CUSTOM/FORK-SPECIFIC columns copied", render_report(plans, False))

    def test_stock_old_column_removed_from_new_is_not_classed_as_custom(self):
        source_columns = {
            "account": [
                {"COLUMN_NAME": "id", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": "auto_increment"},
                {"COLUMN_NAME": "legacy", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": "0", "EXTRA": ""},
            ]
        }
        target_columns = {
            "account": [
                {"COLUMN_NAME": "id", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": "auto_increment"},
            ]
        }
        plans = build_plans(
            None,
            "AUTH",
            "old_auth",
            "new_auth",
            {"account"},
            {"account"},
            {"account": "MYISAM"},
            {"account": "INNODB"},
            source_columns,
            target_columns,
            set(),
            set(),
            set(),
            {"account": ["id", "legacy"]},
            {"account": ["id"]},
        )

        self.assertIn("legacy", plans[0].core_restructured_source_only)
        self.assertFalse(plans[0].custom_source_only)
        self.assertIn("TRINITYCORE", plans[0].classification)
        self.assertEqual(plans[0].status, "NOT MIGRATED")
        self.assertIn("IGNORED_CORE_COLUMNS", plans[0].reason)

    def test_explicitly_ignored_core_column_is_not_copied(self):
        source_columns = {
            "account": [
                {"COLUMN_NAME": "id", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": "auto_increment"},
                {"COLUMN_NAME": "legacy", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": "0", "EXTRA": ""},
            ]
        }
        target_columns = {
            "account": [
                {"COLUMN_NAME": "id", "COLUMN_TYPE": "int", "IS_NULLABLE": "NO", "COLUMN_DEFAULT": None, "EXTRA": "auto_increment"}
            ]
        }
        plans = build_plans(
            self.CountConnection(),
            "AUTH",
            "old_auth",
            "new_auth",
            {"account"},
            {"account"},
            {"account": "MYISAM"},
            {"account": "INNODB"},
            source_columns,
            target_columns,
            set(),
            set(),
            {("AUTH", "account", "legacy")},
            {"account": ["id", "legacy"]},
            {"account": ["id"]},
        )

        self.assertEqual(plans[0].status, "READY")
        self.assertEqual(plans[0].columns, ["id"])
        self.assertEqual(plans[0].ignored_core_columns, ["legacy"])


if __name__ == "__main__":
    unittest.main()
