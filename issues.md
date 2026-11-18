# ISSUES.md - Test Run Log Report

**Project:** WorldOfImmortality (TrinityCore 3.3.5a-based, `core-daemon`, Win64)  
**Test run:** 2026-11-17, 19:10:29 - 19:12:17  
**Logs reviewed:** `Server_2026-11-17_19-10-29.log`, `DBErrors.log`, `SQLDriver.log`, `World.log`, `Character_2026-11-17_19-10-29.log`, `Chat_2026-11-17_19-10-29.log`, `RemoteAccess.log`, `ra_commands.log`, `arena.log`, `immortality.pid`  
**Environment:** OpenSSL 1.0.2u, ACE 5.8.3, MySQL 5.7.30 (client and server), World DB TDB 335.11.39, TDBAI 335.0.3, DBC locale enUS, VMaps enabled

> Nothing in the repository was changed to produce this report. It lists problems and recommended fixes only. Where a fix says "verify", the cause could not be proven from the logs alone.

## 1. Summary

The server started in 28 seconds, accepted a login (account 36767, character Lhorath, GUID 88106) and shut down cleanly (`Halting process...`). There were no crashes, no auth failures and no network errors. Every issue below is a data or configuration problem.

| # | Issue | Count | Severity |
|---|---|---|---|
| 2.1 | Table `groups` missing from the character DB | 5 SQL errors | High |
| 2.2 | Custom items missing from `item.dbc` | 50 | High |
| 2.3 | Creature loot IDs with no loot rows | 98 | High |
| 2.4 | Boss scripts with no `ScriptName` in DB | 3 | High |
| 3.1 | Gameobjects with invalid coordinates (skipped) | 230 | Medium |
| 3.2 | Creature templates with `unit_class` 0 | 71 | Medium |
| 3.3 | Gameobject loot problems | 5 | Medium |
| 3.4 | Traps referencing a non-trap gameobject | 9 | Medium |
| 3.5 | Creature template and spawn problems | 11 | Medium |
| 3.6 | Quest data problems | 5 | Medium |
| 3.7 | Gossip menu 51900 missing | 4 lines | Medium |
| 3.8 | Pools, SmartAI and graveyard problems | 5 | Low |
| 3.9 | Item data problems | 8 | Low |
| 3.10 | `game_tele` rows with bad positions | 3 | Low |
| 3.11 | Players with broken zone data | 14 | Low |
| 3.12 | Guild bank items skipped | 3 | Low |
| 4 | Empty tables at load | 13 | Info |
| 5 | Logging and config noise | - | Info |
| 6 | Slow load steps and queries | - | Info |

Total `ERROR:` lines in the server log: **519**. Both the server log and `DBErrors.log` contain the same data errors.

## 2. High priority

### 2.1 Table `groups` does not exist in the character database

- **Log:** `ERROR: [1146] Table 'dack_immortality_char.groups' doesn't exist` (SQLDriver.log, 5 occurrences: 2 at 19:10:31, 3 at 19:10:56).
- **Failing queries:** `SELECT MAX(guid) FROM groups`, `DELETE gi.* FROM group_instance AS gi LEFT JOIN groups AS g ...`, `DELETE FROM groups WHERE leaderGuid NOT IN (...)`, `DELETE FROM groups WHERE guid NOT IN (...)`, and the group load `SELECT leaderGuid, lootMethod, ... FROM groups`.
- **Server log:** `Loaded 0 group definitions. DB table groups is empty!`
- **Effect:** parties and raid groups cannot be saved or loaded. Group-dependent features (loot rules, raid and instance binds) will fail.
- **Fix:**
  1. Import the `groups` table into `dack_immortality_char` from the character base SQL for your core revision.
  2. Verify `group_member` and `group_instance` exist and match the same revision.
  3. Restart and confirm the five 1146 errors are gone.

### 2.2 Custom items are not in `item.dbc`

- **Log:** `Item (Entry: N) does not exist in item.dbc! (not correct id?)`, **50 items**, range 60001 to 100667.
- **Entries:** 60001, 60002, 60003, 60004, 60005, 60006, 60007, 60008, 60009, 60010, 60011, 60012, 60013, 60014, 60015, 60016, 66660, 66661, 66666, 66667, 66668, 66669, 66670, 66671, 90000, 99784, 100000, 100001, 100002, 100003, 100004, 100005, 100006, 100007, 100008, 100009, 100010, 100011, 100012, 100013, 100014, 100015, 100016, 100017, 100018, 100461, 100462, 100463, 100666, 100667
- **Effect:** the server cannot validate these items against DBC data. The client will not show them correctly unless its patch also contains them.
- **Fix:** add the items to `Item.dbc` in the server `dbc` folder and in the client patch (MPQ). If the items are not needed yet, remove them from `item_template`.

### 2.3 Creature loot IDs have no rows in `creature_loot_template`

- **Log:** `Table 'creature_loot_template' entry N (creature entry) not exist but used as loot id in DB.`, **98 entries**.
- **Entries:** 37007, 3672402, 3672403, 3672502, 3672503, 3680502, 3680503, 3680702, 3680703, 3680802, 3680803, 3681102, 3681103, 3682902, 3682903, 3688002, 3688003, 3699802, 3699803, 3700302, 3700303, 3700402, 3700403, 3700702, 3700703, 3701102, 3701103, 3701202, 3701203, 3701602, 3701603, 3701702, 3701703, 3702102, 3702103, 3702202, 3702203, 3702302, 3702303, 3702502, 3702503, 3702702, 3702703, 3703002, 3703003, 3703102, 3703103, 3703202, 3703203, 3703302, 3703303, 3703402, 3703403, 3703502, 3703503, 3703802, 3703803, 3709802, 3709803, 3712602, 3712603, 3714402, 3714403, 3714602, 3714603, 3714802, 3714803, 3714902, 3714903, 3721702, 3721703, 3723002, 3723003, 3750102, 3750103, 3750202, 3750203, 3754402, 3754403, 3754502, 3754503, 3754602, 3754603, 3757102, 3757103, 3759502, 3759503, 3766202, 3766203, 3766302, 3766303, 3766402, 3766403, 3766502, 3766503, 3766602, 3766603, 4000000
- **Pattern:** all but `37007` end in 02 or 03. These look like heroic or 25-man variants whose `lootid` points at an entry that was never created.
- **Effect:** these creatures drop nothing.
- **Fix:** either create loot rows for each ID, or point `creature_template.lootid` on those templates at an existing loot entry (for example the normal-mode loot). Verify the pattern before bulk-updating.

### 2.4 Boss scripts have no `ScriptName` in the database

- **Log:** `Script named 'X' does not have a script name assigned in database.` for `boss_epoch`, `boss_mal_ganis`, `boss_tyrannus`.
- **Effect:** the compiled scripts for these three bosses (Culling of Stratholme and Pit of Saron) never run. The encounters fall back to default AI.
- **Fix:** set `creature_template.ScriptName` to each script name on the matching creature entries. Confirm the script names are registered in `ScriptLoader` and the DB uses exactly the same spelling.

## 3. Medium and low priority

### 3.1 Gameobjects with invalid coordinates (skipped)

- **Log:** `Table gameobject has gameobject (GUID: N Entry: N) with invalid coordinates, skip`, **230 spawns**, 22 distinct entries.
- **Count by entry:**

| Entry | Spawns |
|---|---|
| 190692 | 113 |
| 171728 | 27 |
| 181087 | 12 |
| 192862 | 12 |
| 192350 | 10 |
| 182260 | 9 |
| 191746 | 9 |
| 195087 | 7 |
| 180324 | 6 |
| 180322 | 5 |
| 180472 | 5 |
| 187980 | 3 |
| 192058 | 3 |
| 170592 | 1 |
| 183859 | 1 |
| 183874 | 1 |
| 185567 | 1 |
| 186610 | 1 |
| 188072 | 1 |
| 188481 | 1 |
| 194487 | 1 |
| 201378 | 1 |

- **Spawn GUIDs (all):** 1986214, 2097741, 2097744, 2097747, 2097749, 2097752, 2097754, 2097757, 2097759, 2097763, 2097765, 2097767, 2097770, 2097772, 2097774, 2097776, 2097778, 2097784, 2097786, 2097789, 2097791, 2097795, 2097798, 2097800, 2097803, 2097806, 2097808, 2097811, 2097813, 2097816, 2097818, 2097820, 2097823, 2097825, 2097828, 2097830, 2097832, 2097834, 2097837, 2097844, 2097868, 2097871, 2097873, 2097875, 2097878, 2097880, 2097883, 2097885, 2097888, 2097892, 2097896, 2097899, 2097902, 2097905, 2097907, 2097910, 2097912, 2097915, 2097917, 2097920, 2097922, 2097924, 2097927, 2097929, 2097935, 2097938, 2097940, 2097942, 2097944, 2097946, 2097948, 2097951, 2097954, 2097956, 2097958, 2097960, 2097962, 2097964, 2097966, 2097971, 2097974, 2098160, 2098162, 2098165, 2098168, 2098172, 2098174, 2098180, 2098182, 2098185, 2098189, 2098191, 2098193, 2098195, 2098197, 2098199, 2098201, 2098203, 2098217, 2098219, 2098221, 2098223, 2098225, 2098228, 2098230, 2098233, 2098235, 2098238, 2098240, 2098242, 2098244, 2098247, 2098249, 2098251, 2098295, 2098297, 2098304, 2098306, 2098308, 2098311, 2098342, 2098349, 2098351, 2098353, 2098355, 2098359, 2098361, 2098363, 2098365, 2098367, 2098369, 2098371, 2098373, 2098375, 2098377, 2098379, 2098381, 2098383, 2098385, 2098387, 2098390, 2098392, 2098394, 2098398, 2098401, 2098405, 2098407, 2098410, 2098412, 2098414, 2098416, 2098418, 2098420, 2098422, 2098424, 2098426, 2098429, 2098431, 2098433, 2098437, 2098881, 2099201, 2099203, 2099205, 2099286, 2099288, 2099290, 2099306, 2099310, 2099312, 2099314, 2099316, 2099318, 2099320, 2099986, 2100059, 2100061, 2100337, 2100533, 2100535, 2100537, 2100539, 2100545, 2161137, 2161144, 2161147, 2161150, 2161156, 2161165, 2161184, 2161207, 2161209, 2161704, 2161708, 2161959, 2162037, 2162205, 2162207, 2162216, 2162288, 2162290, 2162296, 2162327, 2162330, 2162335, 2162338, 2162360, 2162362, 2162373, 2162375, 2162378, 2162380, 2162389, 2162391, 2162399, 2162401, 2162403, 2162405, 2162407, 2205218, 2205251, 2205253, 2205255, 2205257, 2205259, 2205261, 2205284, 2205286, 2205288, 2205290
- **Effect:** these objects do not spawn.
- **Fix:** correct `position_x/y/z` and `map` in `gameobject` for these GUIDs, or delete the rows. Fixing entries 190692, 171728, 192862, 181087 and 192350 clears most of them.

### 3.2 Creature templates with invalid `unit_class` (0)

- **Log:** `Creature (Entry: N) has invalid unit_class (0) in creature_template. Set to 1 (UNIT_CLASS_WARRIOR).`, **71 creatures**.
- **Entries:** 66691, 66698, 190000, 600000, 600001, 600002, 600003, 600004, 600005, 600006, 600007, 600008, 600009, 600010, 600011, 600012, 600013, 600014, 600015, 600016, 600017, 600018, 600019, 600020, 600021, 600022, 600023, 600024, 600025, 600026, 600027, 600028, 600029, 600030, 600031, 600032, 600033, 600034, 600035, 600036, 600037, 600038, 600039, 600040, 600041, 600042, 600043, 600044, 600045, 600046, 600047, 600048, 600049, 600050, 600051, 3399801, 3514301, 5000000, 5500000, 5500001, 5500002, 5500003, 5500004, 5500005, 5500006, 5500007, 5500008, 5500009, 5500010, 5500011, 9999998
- **Effect:** the core silently treats them as Warriors, which may be wrong for casters or healers.
- **Fix:** set `unit_class` to 1 (Warrior), 2 (Paladin), 4 (Rogue) or 8 (Mage) in `creature_template` as appropriate.

### 3.3 Gameobject loot problems

- `gameobject_loot_template` entries used as loot IDs but missing: **3459, 27725, 27985** (27985 is reported twice).
- `gameobject_loot_template` entry **201384** is not a gameobject entry and is not referenced from any loot, so it is unused.
- **Fix:** add loot rows for the missing IDs or correct the gameobject `data1` loot reference. Delete 201384 if it is a leftover.

### 3.4 Gameobject traps pointing at a non-trap object

- **Log:** `Gameobject (Entry: E GoType: T) have dataN=4 but GO (Entry 4) have not GAMEOBJECT_TYPE_TRAP (6) type.`
- **Entries:** 126337, 126338, 126339, 126340, 126341, 126342, 126345 (type 8, `data2=4`); 181168, 181169 (type 10, `data12=4`).
- **Fix:** set the trap field to a real trap gameobject entry, or to 0 if no trap is meant.

### 3.5 Creature template and spawn problems

| Issue | Entry or GUID | Fix |
|---|---|---|
| Faction A and H template 0 does not exist | Entry 4000000 | Set a valid `faction` in `creature_template` |
| Wrong `auras` data in `creature_template_addon` | Entry 190000 | Fix the aura IDs (space-separated, valid spells) |
| Spawn references a missing template | GUID 214209, entry 66699 | Add the template or delete the spawn |
| Spawn uses a difficulty-template entry | GUID 5560646, entry 31215 | Delete the spawn, or use the base entry |
| Idle creature has a wander distance | GUID 120692, entry 68 | Set `spawndist` to 0 or `MovementType` to 1 (the core already forces 0) |
| Difficulty entry has `ScriptName` set | Entries 39746 (to 39805), 39747 (to 39823), 39751 (to 39920), 39863 (to 39864) | Clear `ScriptName` on the difficulty entries; the base entry's script is used |
| Gameobject `spawntimesecs` is 0 but marked despawnable | GUID 6188239, entry 175708 | Set a non-zero `spawntimesecs` |

### 3.6 Quest data problems

- **Quest 10839:** `ReqSpellCast1` = 38736 and no required creature or object, but spell 38736 has neither `SPELL_EFFECT_QUEST_COMPLETE` nor `SPELL_EFFECT_SEND_EVENT`, so the quest cannot be completed. Fix the required spell or objective.
- **Quest 10447:** `ReqSourceId1` = 0 but `ReqSourceCount1` = 1. Set the source item or set the count to 0.
- **Quest 13571:** creature 32516 is listed in `creature_questrelation` (starter) and `creature_involvedrelation` (ender), but its `npcflag` lacks `UNIT_NPC_FLAG_QUESTGIVER`. Add the flag (2) to the creature template.
- **Quest 600000:** `creature_involvedrelation` references creature entry **16777215**, which does not exist. Correct the entry or delete the row.

### 3.7 Gossip menu 51900 is missing

- **Log:** `addToGossipMenus: GossipMenu 51900 not found` (2x) and `Not handled grouped condition, SourceGroup 51900` (2x).
- **Effect:** conditions attached to gossip menu 51900 have nothing to apply to. This looks like a custom menu that was never created.
- **Fix:** add menu 51900 to `gossip_menu`, or delete the matching rows from `conditions`.

### 3.8 Pools, SmartAI and graveyards

- **Pool 1099:** `pool_creature` references creature GUID **151988**, which does not exist. Delete the row or restore the spawn.
- **Pool 1079:** no equal-chance entries and the explicit chances do not add to 100, so the pool never spawns. Fix the chances.
- **SmartAI:** scripts for creature GUIDs **88791** and **88779** are skipped because those creatures do not exist. Delete the `smart_scripts` rows or restore the spawns.
- **Graveyard:** `game_graveyard_zone` references `WorldSafeLocs.dbc` id **2000**, which does not exist. Add it to `WorldSafeLocs.dbc` or delete the link.

### 3.9 Item data problems

- **BuyCount 0 (auto-set to 1):** items 90000, 100007, 100008, 100009, 100010, 100461. Set `BuyCount` to 1 in `item_template`.
- **Item 66671:** wrong subclass (14) for class 0. Correct `class` and `subclass`.
- **Item 32768:** used in `creature_equip_template.equipentry2` for creature 1807, but it cannot be held in a hand (forced to 0). Replace it with a weapon or shield.

### 3.10 `game_tele` rows with bad positions (ignored)

| ID | Name |
|---|---|
| 1581 | RevelationGaming |
| 1590 | outish |
| 2000 | DirtyRabbitZ |

Fix the map and coordinates, or delete the rows.

### 3.11 Players with broken zone data

- **Log:** `Player (GUID: N) has broken zone-data`, 14 players. The core resets the zone on load.
- **GUIDs:** 13657, 19960, 23773, 34384, 70879, 73035, 73093, 86574, 86619, 89274, 91579, 91981, 96655, 98859
- **Fix:** harmless if it happens once. If it repeats on every start, correct `characters.zone` for these GUIDs.

### 3.12 Guild bank items skipped

- **Log:** `Unknown item (GUID: N, id: 41091) in guild bank, skipped.`
- **Item GUIDs:** 30762711, 30762721, 30762849 (all id 41091).
- **Fix:** restore the item template 41091, or delete the matching `guild_bank_item` and `item_instance` rows.

## 4. Empty tables at load

These are normal for a fresh or test realm. They are listed for completeness.

| Message | Table |
|---|---|
| Vehicle Accessories: 0 | `vehicle_accessory` |
| Achievement reward locale strings: 0 | `locales_achievement_reward` |
| Custom Texts: 0 (reported twice) | `custom_texts` |
| Auction items: 0 | `auctionhouse` or `item_instance` |
| Auctions: 0 | `auctionhouse` |
| Corpses: 0 (reported against `pet_name_generation`) | `pet_name_generation` |
| Gameobject respawn times: 0 | `gameobject_respawn` |
| Game event gameobject quests: 0 | `game_event_gameobject_quest` |
| Group definitions: 0 | `groups` (see 2.1) |
| Pools for game events: 0 | `game_event_pool` |
| Reserved player names: 0 | `reserved_name` |
| Expired mails: none | `mail` |

Of these, only `groups` needs action. `pet_name_generation` being empty means hunter pets cannot get random names; import it if you want that.

## 5. Logging and configuration notes

- **`World.log` is a full packet log** (6,980 lines for a 3-minute session, from `CMSG_AUTH_SESSION` onward). Disable packet logging in `worldserver.conf` outside debugging.
- **`SQLDriver.log` records every query** (4,577 lines). Lower the SQL driver log level in `worldserver.conf` for normal use.
- **Debug-level lines in `Server_*.log`:** `Remove object ... from grid`, `Unloading grid ... finished` (231 `Remove object` lines at shutdown), `Object N enters grid`, `Active object nearby triggers loading of grid`. Raise the log level to hide them.
- **Version row:** `TrinityCore Rev: 0 Release Hash: Archive`. The build embeds no git revision (typical of a source archive build). Cosmetic, but it makes it impossible to tell which core build wrote to the DB.
- **`immortality.pid` is stale:** it contains PID 120556 but the server logged `Daemon PID: 120640`. The file is zero lines long (no trailing newline). Harmless, but do not rely on it.
- **Chat, RemoteAccess, ra_commands and arena logs** are empty or contain no errors. `Character_*.log` shows one clean login (19:11:40) and logout (19:11:58).

## 6. Slow load steps and queries (informational)

| Step | Time |
|---|---|
| Guild bank tab items (81,074) | 5,461 ms |
| Gameobject loot templates (18,351) | 3,469 ms |
| Arena team definitions (2,186) | 3,188 ms |
| Gameobjects (152,881) | 2,844 ms |
| Creatures (140,434) | 1,862 ms |
| Item prototypes (37,342) | 1,422 ms |
| Trainers (78,620) | 1,172 ms |
| Creature loot templates (337,967) | 1,125 ms |

Slowest queries: `UPDATE account SET online = 0 ... IN (SELECT acctid FROM realmcharacters ...)` took 1,235 ms at startup and 1,250 ms at shutdown; the `npc_trainer` self-join took about 1,000 ms; `SELECT achievement FROM character_achievement GROUP BY achievement` took 844 ms. None are errors. If startup time matters, add indexes on the columns used in these queries and trim unused guild bank and arena rows.

## 7. Suggested order of work

1. Import the `groups` table (2.1).
2. Decide how to handle custom items 60001-100667: patch `Item.dbc` or remove them (2.2).
3. Fix creature loot IDs ending in 02/03 (2.3).
4. Assign `ScriptName` to the three bosses (2.4).
5. Clean up gameobject coordinates, `unit_class` and loot rows (3.1-3.3).
6. Work through the remaining quest, creature, pool and item rows (3.4-3.12).
7. Turn off packet and SQL logging, then re-run a test and compare the new `DBErrors.log` against this report (5).