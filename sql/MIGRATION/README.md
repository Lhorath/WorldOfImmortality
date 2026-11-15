# Database migration tool

This tool copies rows from the configured old MySQL databases into already-created new databases. Its configured profile is **TDB 335.11.39 → TDB 335.26091**. It uses the `old_*_schema.sql` and `new_*_schema.sql` files as table allowlists; it does **not** execute schema SQL or make/alter tables.

## Configure

1. Install Python 3.10 or later.
2. Edit `.env` with the MySQL host, port, user, password, and all six database names. Keep the two TDB version values at the versions above; the tool rejects a different pair until its schema profile is reviewed. The configured user needs read access to the old databases and read/write access to the new ones. The `.env` file is ignored by Git.
3. Install the dependency from this folder:

   ```powershell
   python -m pip install -r requirements.txt
   ```

4. Back up the old and new databases and stop the game servers/services so data is not changing during the copy.

## Run

From this folder, run a preflight first:

```powershell
python migrate.py
```

This is a dry run and copies no rows. It creates `report.txt`, including the configured TDB pair, tables missing from the new schema/database, tables that cannot be safely inserted, and columns that do not have a same-name counterpart.

Review the report carefully. It compares old structures with the bundled stock table/column inventories. Tables or columns absent from the stock 335.11.39 inventory are classified as custom/fork-specific and MUST be migrated; if the matching destination does not exist, the table is blocked. Stock old-version columns absent from the 335.26091 inventory are reported separately as TrinityCore-removed/restructured rather than mislabeled as custom. Such a field blocks its table until you either add a mapping or explicitly approve dropping it via `IGNORED_CORE_COLUMNS`. Review these fields before execution; same-name columns are the only ones copied automatically.

The old stock inventory uses the closest available upstream schema snapshot before the 335.11.39 version marker (the old release itself is not archived as a tagged release asset); the new inventory comes from the 335.26091 release. The supplied old fork differs from stock in places, including `account.gmlevel` and the `game_event` key name. These are treated as fork-specific data and must be preserved through a matching destination or explicit mapping.

To designate data that must be migrated, add comma-separated entries to `.env`:

```text
CUSTOM_TABLES=AUTH.account_passhistory,WORLD.donation_items
CUSTOM_COLUMNS=AUTH.account.gmlevel,WORLD.game_event.eventEntry
```

Use `AUTH`, `CHARACTERS`, or `WORLD` prefixes. A custom table or custom source column is skipped if its destination table/column is missing from the new schema. Add the custom destination table/column or implement an explicit mapping before retrying. Only same-name columns are copied; renamed fields are not inferred. A table is also skipped if a required target column has no source value, the supplied new schema disagrees with a stock TDB column, or the target table is not InnoDB. Column type differences are reported, and MySQL strict mode is enabled during inserts to reject invalid conversions.

Only after reviewing the data and deciding a removed TrinityCore field is safe to omit, add it to `IGNORED_CORE_COLUMNS`, for example `IGNORED_CORE_COLUMNS=WORLD.creature.spawndist`. The tool validates that each ignored field existed in the old stock baseline and is absent from the new one; custom/fork-specific fields cannot be ignored this way.

When ready, run:

```powershell
python migrate.py --execute
```

The tool displays a preflight and asks you to type `MIGRATE` before inserting. Inserts are transactional per table. Existing target rows are never updated or replaced; a duplicate-key error rolls back that table and is recorded as `FAILED`. This is not a merge/resume operation: resolve failures and inspect the report before deciding how to proceed. Do not treat skipped tables or unmatched columns as migrated.

## Safety notes

- The tool never connects to a database unless you run it.
- The target databases must already exist and have their new schema applied.
- Run against a staging copy first. Verify account authentication and character data, and retain backups until verified.
- The old/new account schemas have incompatible fields (for example, password data); this tool deliberately does not invent a conversion for renamed or semantically different fields.
- `tdb_schema_baselines.json` records upstream table/column inventories and their source references. If you change either TDB version, the tool refuses to run until the inventory is updated and reviewed.
- `report.txt` is regenerated on each run and does not contain credentials.
