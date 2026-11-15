-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.9 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.21.0.7344
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table dev_woi_world.access_requirement
CREATE TABLE IF NOT EXISTS `access_requirement` (
  `mapId` int unsigned NOT NULL,
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `level_min` tinyint unsigned NOT NULL DEFAULT '0',
  `level_max` tinyint unsigned NOT NULL DEFAULT '0',
  `item_level` smallint unsigned NOT NULL DEFAULT '0',
  `item` int unsigned NOT NULL DEFAULT '0',
  `item2` int unsigned NOT NULL DEFAULT '0',
  `quest_done_A` int unsigned NOT NULL DEFAULT '0',
  `quest_done_H` int unsigned NOT NULL DEFAULT '0',
  `completed_achievement` int unsigned NOT NULL DEFAULT '0',
  `quest_failed_text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`mapId`,`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Access Requirements';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.achievement_criteria_data
CREATE TABLE IF NOT EXISTS `achievement_criteria_data` (
  `criteria_id` int NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `value1` int unsigned NOT NULL DEFAULT '0',
  `value2` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`criteria_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Achievment system';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.achievement_dbc
CREATE TABLE IF NOT EXISTS `achievement_dbc` (
  `ID` int unsigned NOT NULL,
  `requiredFaction` int NOT NULL DEFAULT '-1',
  `mapID` int NOT NULL DEFAULT '-1',
  `points` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `count` int unsigned NOT NULL DEFAULT '0',
  `refAchievement` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.achievement_reward
CREATE TABLE IF NOT EXISTS `achievement_reward` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TitleA` int unsigned NOT NULL DEFAULT '0',
  `TitleH` int unsigned NOT NULL DEFAULT '0',
  `ItemID` int unsigned NOT NULL DEFAULT '0',
  `Sender` int unsigned NOT NULL DEFAULT '0',
  `Subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `MailTemplateID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.achievement_reward_locale
CREATE TABLE IF NOT EXISTS `achievement_reward_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Subject` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.areatrigger_involvedrelation
CREATE TABLE IF NOT EXISTS `areatrigger_involvedrelation` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Trigger System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.areatrigger_scripts
CREATE TABLE IF NOT EXISTS `areatrigger_scripts` (
  `entry` int NOT NULL,
  `ScriptName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.areatrigger_tavern
CREATE TABLE IF NOT EXISTS `areatrigger_tavern` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Trigger System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.areatrigger_teleport
CREATE TABLE IF NOT EXISTS `areatrigger_teleport` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `target_map` smallint unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  FULLTEXT KEY `name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Trigger System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.battlefield_template
CREATE TABLE IF NOT EXISTS `battlefield_template` (
  `TypeId` tinyint unsigned NOT NULL,
  `ScriptName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.battleground_template
CREATE TABLE IF NOT EXISTS `battleground_template` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MinPlayersPerTeam` smallint unsigned NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint unsigned NOT NULL DEFAULT '0',
  `MinLvl` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxLvl` tinyint unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` int unsigned NOT NULL,
  `AllianceStartO` float NOT NULL,
  `HordeStartLoc` int unsigned NOT NULL,
  `HordeStartO` float NOT NULL,
  `StartMaxDist` float NOT NULL DEFAULT '0',
  `Weight` tinyint unsigned NOT NULL DEFAULT '1',
  `ScriptName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Comment` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.battlemaster_entry
CREATE TABLE IF NOT EXISTS `battlemaster_entry` (
  `entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` int unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.broadcast_text
CREATE TABLE IF NOT EXISTS `broadcast_text` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `LanguageID` int unsigned NOT NULL DEFAULT '0',
  `Text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `EmoteID1` int unsigned NOT NULL DEFAULT '0',
  `EmoteID2` int unsigned NOT NULL DEFAULT '0',
  `EmoteID3` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3` int unsigned NOT NULL DEFAULT '0',
  `SoundEntriesID` int unsigned NOT NULL DEFAULT '0',
  `EmotesID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.broadcast_text_locale
CREATE TABLE IF NOT EXISTS `broadcast_text_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text1` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.command
CREATE TABLE IF NOT EXISTS `command` (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `help` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chat System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.conditions
CREATE TABLE IF NOT EXISTS `conditions` (
  `SourceTypeOrReferenceId` int NOT NULL DEFAULT '0',
  `SourceGroup` int unsigned NOT NULL DEFAULT '0',
  `SourceEntry` int NOT NULL DEFAULT '0',
  `SourceId` int NOT NULL DEFAULT '0',
  `ElseGroup` int unsigned NOT NULL DEFAULT '0',
  `ConditionTypeOrReference` int NOT NULL DEFAULT '0',
  `ConditionTarget` tinyint unsigned NOT NULL DEFAULT '0',
  `ConditionValue1` int unsigned NOT NULL DEFAULT '0',
  `ConditionValue2` int unsigned NOT NULL DEFAULT '0',
  `ConditionValue3` int unsigned NOT NULL DEFAULT '0',
  `ConditionStringValue1` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `NegativeCondition` tinyint unsigned NOT NULL DEFAULT '0',
  `ErrorType` int unsigned NOT NULL DEFAULT '0',
  `ErrorTextId` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ConditionStringValue1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Condition System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature
CREATE TABLE IF NOT EXISTS `creature` (
  `guid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `areaId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Area Identifier',
  `spawnMask` tinyint unsigned NOT NULL DEFAULT '1',
  `phaseMask` int unsigned NOT NULL DEFAULT '1',
  `modelid` int unsigned NOT NULL DEFAULT '0',
  `equipment_id` tinyint NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int unsigned NOT NULL DEFAULT '120',
  `wander_distance` float NOT NULL DEFAULT '0',
  `currentwaypoint` int unsigned NOT NULL DEFAULT '0',
  `curhealth` int unsigned NOT NULL DEFAULT '1',
  `curmana` int unsigned NOT NULL DEFAULT '0',
  `MovementType` tinyint unsigned NOT NULL DEFAULT '0',
  `npcflag` int unsigned NOT NULL DEFAULT '0',
  `unit_flags` int unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `StringId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VerifiedBuild` int DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1022682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_addon
CREATE TABLE IF NOT EXISTS `creature_addon` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `path_id` int unsigned NOT NULL DEFAULT '0',
  `mount` int unsigned NOT NULL DEFAULT '0',
  `MountCreatureID` int unsigned NOT NULL DEFAULT '0',
  `StandState` tinyint unsigned NOT NULL DEFAULT '0',
  `AnimTier` tinyint unsigned NOT NULL DEFAULT '0',
  `VisFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `SheathState` tinyint unsigned NOT NULL DEFAULT '1',
  `PvPFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` int unsigned NOT NULL DEFAULT '0',
  `visibilityDistanceType` tinyint unsigned NOT NULL DEFAULT '0',
  `auras` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_classlevelstats
CREATE TABLE IF NOT EXISTS `creature_classlevelstats` (
  `level` tinyint unsigned NOT NULL,
  `class` tinyint unsigned NOT NULL,
  `basehp0` int unsigned NOT NULL DEFAULT '1',
  `basehp1` int unsigned NOT NULL DEFAULT '1',
  `basehp2` int unsigned NOT NULL DEFAULT '1',
  `basemana` int unsigned NOT NULL DEFAULT '1',
  `basearmor` int unsigned NOT NULL DEFAULT '1',
  `attackpower` smallint unsigned NOT NULL DEFAULT '0',
  `rangedattackpower` smallint unsigned NOT NULL DEFAULT '0',
  `damage_base` float NOT NULL DEFAULT '0',
  `damage_exp1` float NOT NULL DEFAULT '0',
  `damage_exp2` float NOT NULL DEFAULT '0',
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`level`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_default_trainer
CREATE TABLE IF NOT EXISTS `creature_default_trainer` (
  `CreatureId` int unsigned NOT NULL,
  `TrainerId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_equip_template
CREATE TABLE IF NOT EXISTS `creature_equip_template` (
  `CreatureID` int unsigned NOT NULL DEFAULT '0',
  `ID` tinyint unsigned NOT NULL DEFAULT '1',
  `ItemID1` int unsigned NOT NULL DEFAULT '0',
  `ItemID2` int unsigned NOT NULL DEFAULT '0',
  `ItemID3` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`CreatureID`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_formations
CREATE TABLE IF NOT EXISTS `creature_formations` (
  `leaderGUID` int unsigned NOT NULL DEFAULT '0',
  `memberGUID` int unsigned NOT NULL DEFAULT '0',
  `dist` float unsigned NOT NULL,
  `angle` float unsigned NOT NULL,
  `groupAI` int unsigned NOT NULL,
  `point_1` smallint unsigned NOT NULL DEFAULT '0',
  `point_2` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`memberGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_loot_template
CREATE TABLE IF NOT EXISTS `creature_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_model_info
CREATE TABLE IF NOT EXISTS `creature_model_info` (
  `DisplayID` int unsigned NOT NULL DEFAULT '0',
  `BoundingRadius` float NOT NULL DEFAULT '0',
  `CombatReach` float NOT NULL DEFAULT '0',
  `Gender` tinyint unsigned NOT NULL DEFAULT '2',
  `DisplayID_Other_Gender` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`DisplayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature System (Model related info)';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_movement_info
CREATE TABLE IF NOT EXISTS `creature_movement_info` (
  `MovementID` int unsigned NOT NULL DEFAULT '0' COMMENT 'creature_template.movementId value',
  `WalkSpeed` float unsigned DEFAULT NULL,
  `RunSpeed` float unsigned DEFAULT NULL,
  PRIMARY KEY (`MovementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_movement_override
CREATE TABLE IF NOT EXISTS `creature_movement_override` (
  `SpawnId` int unsigned NOT NULL DEFAULT '0',
  `Ground` tinyint unsigned DEFAULT NULL,
  `Swim` tinyint unsigned DEFAULT NULL,
  `Flight` tinyint unsigned DEFAULT NULL,
  `Rooted` tinyint unsigned DEFAULT NULL,
  `Chase` tinyint unsigned DEFAULT NULL,
  `Random` tinyint unsigned DEFAULT NULL,
  `InteractionPauseTimer` int unsigned DEFAULT NULL COMMENT 'Time (in milliseconds) during which creature will not move after interaction with player',
  PRIMARY KEY (`SpawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_onkill_reputation
CREATE TABLE IF NOT EXISTS `creature_onkill_reputation` (
  `creature_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` int NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` int NOT NULL DEFAULT '0',
  `TeamDependent` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature OnKill Reputation gain';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_questender
CREATE TABLE IF NOT EXISTS `creature_questender` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_questitem
CREATE TABLE IF NOT EXISTS `creature_questitem` (
  `CreatureEntry` int unsigned NOT NULL DEFAULT '0',
  `Idx` int unsigned NOT NULL DEFAULT '0',
  `ItemId` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`CreatureEntry`,`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_queststarter
CREATE TABLE IF NOT EXISTS `creature_queststarter` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_summon_groups
CREATE TABLE IF NOT EXISTS `creature_summon_groups` (
  `summonerId` int unsigned NOT NULL DEFAULT '0',
  `summonerType` tinyint unsigned NOT NULL DEFAULT '0',
  `groupId` tinyint unsigned NOT NULL DEFAULT '0',
  `entry` int unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `summonType` tinyint unsigned NOT NULL DEFAULT '0',
  `summonTime` int unsigned NOT NULL DEFAULT '0',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_template
CREATE TABLE IF NOT EXISTS `creature_template` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_1` int unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_2` int unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_3` int unsigned NOT NULL DEFAULT '0',
  `KillCredit1` int unsigned NOT NULL DEFAULT '0',
  `KillCredit2` int unsigned NOT NULL DEFAULT '0',
  `modelid1` int unsigned NOT NULL DEFAULT '0',
  `modelid2` int unsigned NOT NULL DEFAULT '0',
  `modelid3` int unsigned NOT NULL DEFAULT '0',
  `modelid4` int unsigned NOT NULL DEFAULT '0',
  `name` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `subname` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IconName` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gossip_menu_id` int unsigned NOT NULL DEFAULT '0',
  `minlevel` tinyint unsigned NOT NULL DEFAULT '1',
  `maxlevel` tinyint unsigned NOT NULL DEFAULT '1',
  `exp` smallint NOT NULL DEFAULT '0',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `npcflag` int unsigned NOT NULL DEFAULT '0',
  `speed_walk` float NOT NULL DEFAULT '1' COMMENT 'Result of 2.5/2.5, most common value',
  `speed_run` float NOT NULL DEFAULT '1.14286' COMMENT 'Result of 8.0/7.0, most common value',
  `scale` float NOT NULL DEFAULT '1',
  `rank` tinyint unsigned NOT NULL DEFAULT '0',
  `dmgschool` tinyint NOT NULL DEFAULT '0',
  `BaseAttackTime` int unsigned NOT NULL DEFAULT '0',
  `RangeAttackTime` int unsigned NOT NULL DEFAULT '0',
  `BaseVariance` float NOT NULL DEFAULT '1',
  `RangeVariance` float NOT NULL DEFAULT '1',
  `unit_class` tinyint unsigned NOT NULL DEFAULT '0',
  `unit_flags` int unsigned NOT NULL DEFAULT '0',
  `unit_flags2` int unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int unsigned NOT NULL DEFAULT '0',
  `family` tinyint NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `type_flags` int unsigned NOT NULL DEFAULT '0',
  `lootid` int unsigned NOT NULL DEFAULT '0',
  `pickpocketloot` int unsigned NOT NULL DEFAULT '0',
  `skinloot` int unsigned NOT NULL DEFAULT '0',
  `PetSpellDataId` int unsigned NOT NULL DEFAULT '0',
  `VehicleId` int unsigned NOT NULL DEFAULT '0',
  `mingold` int unsigned NOT NULL DEFAULT '0',
  `maxgold` int unsigned NOT NULL DEFAULT '0',
  `AIName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `MovementType` tinyint unsigned NOT NULL DEFAULT '0',
  `HoverHeight` float NOT NULL DEFAULT '1',
  `HealthModifier` float NOT NULL DEFAULT '1',
  `ManaModifier` float NOT NULL DEFAULT '1',
  `ArmorModifier` float NOT NULL DEFAULT '1',
  `DamageModifier` float NOT NULL DEFAULT '1',
  `ExperienceModifier` float NOT NULL DEFAULT '1',
  `RacialLeader` tinyint unsigned NOT NULL DEFAULT '0',
  `movementId` int unsigned NOT NULL DEFAULT '0',
  `RegenHealth` tinyint unsigned NOT NULL DEFAULT '1',
  `mechanic_immune_mask` int unsigned NOT NULL DEFAULT '0',
  `spell_school_immune_mask` int unsigned NOT NULL DEFAULT '0',
  `flags_extra` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StringId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_template_addon
CREATE TABLE IF NOT EXISTS `creature_template_addon` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `path_id` int unsigned NOT NULL DEFAULT '0',
  `mount` int unsigned NOT NULL DEFAULT '0',
  `MountCreatureID` int unsigned NOT NULL DEFAULT '0',
  `StandState` tinyint unsigned NOT NULL DEFAULT '0',
  `AnimTier` tinyint unsigned NOT NULL DEFAULT '0',
  `VisFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `SheathState` tinyint unsigned NOT NULL DEFAULT '1',
  `PvPFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` int unsigned NOT NULL DEFAULT '0',
  `visibilityDistanceType` tinyint unsigned NOT NULL DEFAULT '0',
  `auras` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_template_locale
CREATE TABLE IF NOT EXISTS `creature_template_locale` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_template_movement
CREATE TABLE IF NOT EXISTS `creature_template_movement` (
  `CreatureId` int unsigned NOT NULL DEFAULT '0',
  `Ground` tinyint unsigned DEFAULT NULL,
  `Swim` tinyint unsigned DEFAULT NULL,
  `Flight` tinyint unsigned DEFAULT NULL,
  `Rooted` tinyint unsigned DEFAULT NULL,
  `Chase` tinyint unsigned DEFAULT NULL,
  `Random` tinyint unsigned DEFAULT NULL,
  `InteractionPauseTimer` int unsigned DEFAULT NULL COMMENT 'Time (in milliseconds) during which creature will not move after interaction with player',
  PRIMARY KEY (`CreatureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_template_resistance
CREATE TABLE IF NOT EXISTS `creature_template_resistance` (
  `CreatureID` int unsigned NOT NULL,
  `School` tinyint unsigned NOT NULL,
  `Resistance` smallint DEFAULT NULL,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`CreatureID`,`School`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_template_spell
CREATE TABLE IF NOT EXISTS `creature_template_spell` (
  `CreatureID` int unsigned NOT NULL,
  `Index` tinyint unsigned NOT NULL DEFAULT '0',
  `Spell` int unsigned NOT NULL,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`CreatureID`,`Index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_text
CREATE TABLE IF NOT EXISTS `creature_text` (
  `CreatureID` int unsigned NOT NULL DEFAULT '0',
  `GroupID` tinyint unsigned NOT NULL DEFAULT '0',
  `ID` tinyint unsigned NOT NULL DEFAULT '0',
  `Text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `Language` tinyint NOT NULL DEFAULT '0',
  `Probability` float unsigned NOT NULL DEFAULT '0',
  `Emote` int unsigned NOT NULL DEFAULT '0',
  `Duration` int unsigned NOT NULL DEFAULT '0',
  `Sound` int unsigned NOT NULL DEFAULT '0',
  `BroadcastTextId` int NOT NULL DEFAULT '0',
  `TextRange` tinyint unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`CreatureID`,`GroupID`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.creature_text_locale
CREATE TABLE IF NOT EXISTS `creature_text_locale` (
  `CreatureID` int unsigned NOT NULL DEFAULT '0',
  `GroupID` tinyint unsigned NOT NULL DEFAULT '0',
  `ID` tinyint unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`CreatureID`,`GroupID`,`ID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.disables
CREATE TABLE IF NOT EXISTS `disables` (
  `sourceType` int unsigned NOT NULL,
  `entry` int unsigned NOT NULL,
  `flags` smallint NOT NULL,
  `params_0` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceType`,`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.disenchant_loot_template
CREATE TABLE IF NOT EXISTS `disenchant_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.event_scripts
CREATE TABLE IF NOT EXISTS `event_scripts` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` int unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.exploration_basexp
CREATE TABLE IF NOT EXISTS `exploration_basexp` (
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `basexp` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Exploration System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.fishing_loot_template
CREATE TABLE IF NOT EXISTS `fishing_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event
CREATE TABLE IF NOT EXISTS `game_event` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NULL DEFAULT NULL COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NULL DEFAULT NULL COMMENT 'Absolute end date, the event will never start after',
  `occurence` bigint unsigned NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint unsigned NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `holiday` int unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `holidayStage` tinyint unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 if normal event, 1 if world event',
  `announce` tinyint unsigned DEFAULT '2' COMMENT '0 dont announce, 1 announce, 2 value from config',
  PRIMARY KEY (`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_arena_seasons
CREATE TABLE IF NOT EXISTS `game_event_arena_seasons` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `season` tinyint unsigned NOT NULL COMMENT 'Arena season number',
  UNIQUE KEY `season` (`season`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_battleground_holiday
CREATE TABLE IF NOT EXISTS `game_event_battleground_holiday` (
  `EventEntry` tinyint unsigned NOT NULL COMMENT 'game_event EventEntry identifier',
  `BattlegroundID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`EventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_condition
CREATE TABLE IF NOT EXISTS `game_event_condition` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `condition_id` int unsigned NOT NULL DEFAULT '0',
  `req_num` float DEFAULT '0',
  `max_world_state_field` smallint unsigned NOT NULL DEFAULT '0',
  `done_world_state_field` smallint unsigned NOT NULL DEFAULT '0',
  `description` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`eventEntry`,`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_creature
CREATE TABLE IF NOT EXISTS `game_event_creature` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` int unsigned NOT NULL,
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_creature_quest
CREATE TABLE IF NOT EXISTS `game_event_creature_quest` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event.',
  `id` int unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_gameobject
CREATE TABLE IF NOT EXISTS `game_event_gameobject` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` int unsigned NOT NULL,
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_gameobject_quest
CREATE TABLE IF NOT EXISTS `game_event_gameobject_quest` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `id` int unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_model_equip
CREATE TABLE IF NOT EXISTS `game_event_model_equip` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event.',
  `guid` int unsigned NOT NULL DEFAULT '0',
  `modelid` int unsigned NOT NULL DEFAULT '0',
  `equipment_id` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_npc_vendor
CREATE TABLE IF NOT EXISTS `game_event_npc_vendor` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event.',
  `guid` int unsigned NOT NULL DEFAULT '0',
  `slot` smallint NOT NULL DEFAULT '0',
  `item` int unsigned NOT NULL DEFAULT '0',
  `maxcount` int unsigned NOT NULL DEFAULT '0',
  `incrtime` int unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`item`),
  KEY `slot` (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_npcflag
CREATE TABLE IF NOT EXISTS `game_event_npcflag` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `guid` int unsigned NOT NULL DEFAULT '0',
  `npcflag` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_pool
CREATE TABLE IF NOT EXISTS `game_event_pool` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `pool_entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Id of the pool',
  PRIMARY KEY (`pool_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_prerequisite
CREATE TABLE IF NOT EXISTS `game_event_prerequisite` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `prerequisite_event` int unsigned NOT NULL,
  PRIMARY KEY (`eventEntry`,`prerequisite_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_quest_condition
CREATE TABLE IF NOT EXISTS `game_event_quest_condition` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event.',
  `quest` int unsigned NOT NULL DEFAULT '0',
  `condition_id` int unsigned NOT NULL DEFAULT '0',
  `num` float DEFAULT '0',
  PRIMARY KEY (`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_event_seasonal_questrelation
CREATE TABLE IF NOT EXISTS `game_event_seasonal_questrelation` (
  `questId` int unsigned NOT NULL COMMENT 'Quest Identifier',
  `eventEntry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of the game event',
  PRIMARY KEY (`questId`,`eventEntry`),
  KEY `idx_quest` (`questId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_tele
CREATE TABLE IF NOT EXISTS `game_tele` (
  `id` int unsigned NOT NULL,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tele Command';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.game_weather
CREATE TABLE IF NOT EXISTS `game_weather` (
  `zone` int unsigned NOT NULL DEFAULT '0',
  `spring_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `spring_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `spring_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `summer_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `summer_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `summer_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `fall_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `fall_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `fall_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `winter_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `winter_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `winter_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `ScriptName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Weather System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gameobject
CREATE TABLE IF NOT EXISTS `gameobject` (
  `guid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `areaId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Area Identifier',
  `spawnMask` tinyint unsigned NOT NULL DEFAULT '1',
  `phaseMask` int unsigned NOT NULL DEFAULT '1',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `rotation0` float NOT NULL DEFAULT '0',
  `rotation1` float NOT NULL DEFAULT '0',
  `rotation2` float NOT NULL DEFAULT '0',
  `rotation3` float NOT NULL DEFAULT '0',
  `spawntimesecs` int NOT NULL DEFAULT '0',
  `animprogress` tinyint unsigned NOT NULL DEFAULT '0',
  `state` tinyint unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `StringId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=2134507 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Gameobject System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gameobject_addon
CREATE TABLE IF NOT EXISTS `gameobject_addon` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `parent_rotation0` float NOT NULL DEFAULT '0',
  `parent_rotation1` float NOT NULL DEFAULT '0',
  `parent_rotation2` float NOT NULL DEFAULT '0',
  `parent_rotation3` float NOT NULL DEFAULT '1',
  `invisibilityType` tinyint unsigned NOT NULL DEFAULT '0',
  `invisibilityValue` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gameobject_loot_template
CREATE TABLE IF NOT EXISTS `gameobject_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gameobject_overrides
CREATE TABLE IF NOT EXISTS `gameobject_overrides` (
  `spawnId` int unsigned NOT NULL DEFAULT '0',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gameobject_questender
CREATE TABLE IF NOT EXISTS `gameobject_questender` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gameobject_questitem
CREATE TABLE IF NOT EXISTS `gameobject_questitem` (
  `GameObjectEntry` int unsigned NOT NULL DEFAULT '0',
  `Idx` int unsigned NOT NULL DEFAULT '0',
  `ItemId` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`GameObjectEntry`,`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gameobject_queststarter
CREATE TABLE IF NOT EXISTS `gameobject_queststarter` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gameobject_template
CREATE TABLE IF NOT EXISTS `gameobject_template` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `displayId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `IconName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `castBarCaption` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unk1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `size` float NOT NULL DEFAULT '1',
  `Data0` int NOT NULL DEFAULT '0',
  `Data1` int NOT NULL DEFAULT '0',
  `Data2` int NOT NULL DEFAULT '0',
  `Data3` int NOT NULL DEFAULT '0',
  `Data4` int NOT NULL DEFAULT '0',
  `Data5` int NOT NULL DEFAULT '0',
  `Data6` int NOT NULL DEFAULT '0',
  `Data7` int NOT NULL DEFAULT '0',
  `Data8` int NOT NULL DEFAULT '0',
  `Data9` int NOT NULL DEFAULT '0',
  `Data10` int NOT NULL DEFAULT '0',
  `Data11` int NOT NULL DEFAULT '0',
  `Data12` int NOT NULL DEFAULT '0',
  `Data13` int NOT NULL DEFAULT '0',
  `Data14` int NOT NULL DEFAULT '0',
  `Data15` int NOT NULL DEFAULT '0',
  `Data16` int NOT NULL DEFAULT '0',
  `Data17` int NOT NULL DEFAULT '0',
  `Data18` int NOT NULL DEFAULT '0',
  `Data19` int NOT NULL DEFAULT '0',
  `Data20` int NOT NULL DEFAULT '0',
  `Data21` int NOT NULL DEFAULT '0',
  `Data22` int NOT NULL DEFAULT '0',
  `Data23` int NOT NULL DEFAULT '0',
  `AIName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ScriptName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StringId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Gameobject System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gameobject_template_addon
CREATE TABLE IF NOT EXISTS `gameobject_template_addon` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `mingold` int unsigned NOT NULL DEFAULT '0',
  `maxgold` int unsigned NOT NULL DEFAULT '0',
  `artkit0` int NOT NULL DEFAULT '0',
  `artkit1` int NOT NULL DEFAULT '0',
  `artkit2` int NOT NULL DEFAULT '0',
  `artkit3` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gameobject_template_locale
CREATE TABLE IF NOT EXISTS `gameobject_template_locale` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `castBarCaption` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gossip_menu
CREATE TABLE IF NOT EXISTS `gossip_menu` (
  `MenuID` smallint unsigned NOT NULL DEFAULT '0',
  `TextID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuID`,`TextID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gossip_menu_option
CREATE TABLE IF NOT EXISTS `gossip_menu_option` (
  `MenuID` smallint unsigned NOT NULL DEFAULT '0',
  `OptionID` smallint unsigned NOT NULL DEFAULT '0',
  `OptionIcon` int unsigned NOT NULL DEFAULT '0',
  `OptionText` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `OptionBroadcastTextID` int NOT NULL DEFAULT '0',
  `OptionType` tinyint unsigned NOT NULL DEFAULT '0',
  `OptionNpcFlag` int unsigned NOT NULL DEFAULT '0',
  `ActionMenuID` int unsigned NOT NULL DEFAULT '0',
  `ActionPoiID` int unsigned NOT NULL DEFAULT '0',
  `BoxCoded` tinyint unsigned NOT NULL DEFAULT '0',
  `BoxMoney` int unsigned NOT NULL DEFAULT '0',
  `BoxText` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BoxBroadcastTextID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuID`,`OptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.gossip_menu_option_locale
CREATE TABLE IF NOT EXISTS `gossip_menu_option_locale` (
  `MenuID` smallint unsigned NOT NULL DEFAULT '0',
  `OptionID` smallint unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `OptionText` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BoxText` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`MenuID`,`OptionID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.graveyard_zone
CREATE TABLE IF NOT EXISTS `graveyard_zone` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `GhostZone` int unsigned NOT NULL DEFAULT '0',
  `Faction` smallint unsigned NOT NULL DEFAULT '0',
  `Comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`,`GhostZone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Trigger System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.holiday_dates
CREATE TABLE IF NOT EXISTS `holiday_dates` (
  `id` int unsigned NOT NULL,
  `date_id` tinyint unsigned NOT NULL,
  `date_value` int unsigned NOT NULL,
  `holiday_duration` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.instance_encounters
CREATE TABLE IF NOT EXISTS `instance_encounters` (
  `entry` int unsigned NOT NULL COMMENT 'Unique entry from DungeonEncounter.dbc',
  `creditType` tinyint unsigned NOT NULL DEFAULT '0',
  `creditEntry` int unsigned NOT NULL DEFAULT '0',
  `lastEncounterDungeon` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'If not 0, LfgDungeon.dbc entry for the instance it is last encounter in',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.instance_spawn_groups
CREATE TABLE IF NOT EXISTS `instance_spawn_groups` (
  `instanceMapId` smallint unsigned NOT NULL,
  `bossStateId` tinyint unsigned NOT NULL,
  `bossStates` tinyint unsigned NOT NULL,
  `spawnGroupId` int unsigned NOT NULL,
  `flags` tinyint unsigned NOT NULL,
  PRIMARY KEY (`instanceMapId`,`bossStateId`,`spawnGroupId`,`bossStates`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.instance_template
CREATE TABLE IF NOT EXISTS `instance_template` (
  `map` smallint unsigned NOT NULL,
  `parent` smallint unsigned NOT NULL,
  `script` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `allowMount` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.item_enchantment_template
CREATE TABLE IF NOT EXISTS `item_enchantment_template` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `ench` int unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`ench`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item Random Enchantment System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.item_loot_template
CREATE TABLE IF NOT EXISTS `item_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.item_set_names
CREATE TABLE IF NOT EXISTS `item_set_names` (
  `entry` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `InventoryType` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.item_set_names_locale
CREATE TABLE IF NOT EXISTS `item_set_names_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.item_template
CREATE TABLE IF NOT EXISTS `item_template` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint unsigned NOT NULL DEFAULT '0',
  `SoundOverrideSubclass` tinyint NOT NULL DEFAULT '-1',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `displayid` int unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `FlagsExtra` int unsigned NOT NULL DEFAULT '0',
  `BuyCount` tinyint unsigned NOT NULL DEFAULT '1',
  `BuyPrice` bigint NOT NULL DEFAULT '0',
  `SellPrice` int unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint unsigned NOT NULL DEFAULT '0',
  `AllowableClass` int NOT NULL DEFAULT '-1',
  `AllowableRace` int NOT NULL DEFAULT '-1',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint unsigned NOT NULL DEFAULT '0',
  `requiredspell` int unsigned NOT NULL DEFAULT '0',
  `requiredhonorrank` int unsigned NOT NULL DEFAULT '0',
  `RequiredCityRank` int unsigned NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredReputationRank` smallint unsigned NOT NULL DEFAULT '0',
  `maxcount` int NOT NULL DEFAULT '0',
  `stackable` int DEFAULT '1',
  `ContainerSlots` tinyint unsigned NOT NULL DEFAULT '0',
  `StatsCount` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_type1` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value1` smallint NOT NULL DEFAULT '0',
  `stat_type2` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value2` smallint NOT NULL DEFAULT '0',
  `stat_type3` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value3` smallint NOT NULL DEFAULT '0',
  `stat_type4` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value4` smallint NOT NULL DEFAULT '0',
  `stat_type5` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value5` smallint NOT NULL DEFAULT '0',
  `stat_type6` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value6` smallint NOT NULL DEFAULT '0',
  `stat_type7` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value7` smallint NOT NULL DEFAULT '0',
  `stat_type8` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value8` smallint NOT NULL DEFAULT '0',
  `stat_type9` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value9` smallint NOT NULL DEFAULT '0',
  `stat_type10` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value10` smallint NOT NULL DEFAULT '0',
  `ScalingStatDistribution` smallint NOT NULL DEFAULT '0',
  `ScalingStatValue` int unsigned NOT NULL DEFAULT '0',
  `dmg_min1` float NOT NULL DEFAULT '0',
  `dmg_max1` float NOT NULL DEFAULT '0',
  `dmg_type1` tinyint unsigned NOT NULL DEFAULT '0',
  `dmg_min2` float NOT NULL DEFAULT '0',
  `dmg_max2` float NOT NULL DEFAULT '0',
  `dmg_type2` tinyint unsigned NOT NULL DEFAULT '0',
  `armor` smallint unsigned NOT NULL DEFAULT '0',
  `holy_res` tinyint unsigned NOT NULL DEFAULT '0',
  `fire_res` tinyint unsigned NOT NULL DEFAULT '0',
  `nature_res` tinyint unsigned NOT NULL DEFAULT '0',
  `frost_res` tinyint unsigned NOT NULL DEFAULT '0',
  `shadow_res` tinyint unsigned NOT NULL DEFAULT '0',
  `arcane_res` tinyint unsigned NOT NULL DEFAULT '0',
  `delay` smallint unsigned NOT NULL DEFAULT '1000',
  `ammo_type` tinyint unsigned NOT NULL DEFAULT '0',
  `RangedModRange` float NOT NULL DEFAULT '0',
  `spellid_1` int NOT NULL DEFAULT '0',
  `spelltrigger_1` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_1` smallint NOT NULL DEFAULT '0',
  `spellppmRate_1` float NOT NULL DEFAULT '0',
  `spellcooldown_1` int NOT NULL DEFAULT '-1',
  `spellcategory_1` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_1` int NOT NULL DEFAULT '-1',
  `spellid_2` int NOT NULL DEFAULT '0',
  `spelltrigger_2` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_2` smallint NOT NULL DEFAULT '0',
  `spellppmRate_2` float NOT NULL DEFAULT '0',
  `spellcooldown_2` int NOT NULL DEFAULT '-1',
  `spellcategory_2` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_2` int NOT NULL DEFAULT '-1',
  `spellid_3` int NOT NULL DEFAULT '0',
  `spelltrigger_3` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_3` smallint NOT NULL DEFAULT '0',
  `spellppmRate_3` float NOT NULL DEFAULT '0',
  `spellcooldown_3` int NOT NULL DEFAULT '-1',
  `spellcategory_3` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_3` int NOT NULL DEFAULT '-1',
  `spellid_4` int NOT NULL DEFAULT '0',
  `spelltrigger_4` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_4` smallint NOT NULL DEFAULT '0',
  `spellppmRate_4` float NOT NULL DEFAULT '0',
  `spellcooldown_4` int NOT NULL DEFAULT '-1',
  `spellcategory_4` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_4` int NOT NULL DEFAULT '-1',
  `spellid_5` int NOT NULL DEFAULT '0',
  `spelltrigger_5` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_5` smallint NOT NULL DEFAULT '0',
  `spellppmRate_5` float NOT NULL DEFAULT '0',
  `spellcooldown_5` int NOT NULL DEFAULT '-1',
  `spellcategory_5` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_5` int NOT NULL DEFAULT '-1',
  `bonding` tinyint unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `PageText` int unsigned NOT NULL DEFAULT '0',
  `LanguageID` tinyint unsigned NOT NULL DEFAULT '0',
  `PageMaterial` tinyint unsigned NOT NULL DEFAULT '0',
  `startquest` int unsigned NOT NULL DEFAULT '0',
  `lockid` int unsigned NOT NULL DEFAULT '0',
  `Material` tinyint NOT NULL DEFAULT '0',
  `sheath` tinyint unsigned NOT NULL DEFAULT '0',
  `RandomProperty` int NOT NULL DEFAULT '0',
  `RandomSuffix` int unsigned NOT NULL DEFAULT '0',
  `block` int unsigned NOT NULL DEFAULT '0',
  `itemset` int unsigned NOT NULL DEFAULT '0',
  `MaxDurability` smallint unsigned NOT NULL DEFAULT '0',
  `area` int unsigned NOT NULL DEFAULT '0',
  `Map` smallint NOT NULL DEFAULT '0',
  `BagFamily` int NOT NULL DEFAULT '0',
  `TotemCategory` int NOT NULL DEFAULT '0',
  `socketColor_1` tinyint NOT NULL DEFAULT '0',
  `socketContent_1` int NOT NULL DEFAULT '0',
  `socketColor_2` tinyint NOT NULL DEFAULT '0',
  `socketContent_2` int NOT NULL DEFAULT '0',
  `socketColor_3` tinyint NOT NULL DEFAULT '0',
  `socketContent_3` int NOT NULL DEFAULT '0',
  `socketBonus` int NOT NULL DEFAULT '0',
  `GemProperties` int NOT NULL DEFAULT '0',
  `RequiredDisenchantSkill` smallint NOT NULL DEFAULT '-1',
  `ArmorDamageModifier` float NOT NULL DEFAULT '0',
  `duration` int unsigned NOT NULL DEFAULT '0',
  `ItemLimitCategory` smallint NOT NULL DEFAULT '0',
  `HolidayId` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `DisenchantID` int unsigned NOT NULL DEFAULT '0',
  `FoodType` tinyint unsigned NOT NULL DEFAULT '0',
  `minMoneyLoot` int unsigned NOT NULL DEFAULT '0',
  `maxMoneyLoot` int unsigned NOT NULL DEFAULT '0',
  `flagsCustom` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`),
  KEY `items_index` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.item_template_locale
CREATE TABLE IF NOT EXISTS `item_template_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.lfg_dungeon_rewards
CREATE TABLE IF NOT EXISTS `lfg_dungeon_rewards` (
  `dungeonId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Dungeon entry from dbc',
  `maxLevel` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Max level at which this reward is rewarded',
  `firstQuestId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for first dungeon this day',
  `otherQuestId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for Nth dungeon this day',
  PRIMARY KEY (`dungeonId`,`maxLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.lfg_dungeon_template
CREATE TABLE IF NOT EXISTS `lfg_dungeon_template` (
  `dungeonId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Unique id from LFGDungeons.dbc',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`dungeonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.linked_respawn
CREATE TABLE IF NOT EXISTS `linked_respawn` (
  `guid` int unsigned NOT NULL COMMENT 'dependent creature',
  `linkedGuid` int unsigned NOT NULL COMMENT 'master creature',
  `linkType` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`linkType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature Respawn Link System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.mail_level_reward
CREATE TABLE IF NOT EXISTS `mail_level_reward` (
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `raceMask` int unsigned NOT NULL DEFAULT '0',
  `mailTemplateId` int unsigned NOT NULL DEFAULT '0',
  `senderEntry` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`,`raceMask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Mail System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.mail_loot_template
CREATE TABLE IF NOT EXISTS `mail_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.milling_loot_template
CREATE TABLE IF NOT EXISTS `milling_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.npc_spellclick_spells
CREATE TABLE IF NOT EXISTS `npc_spellclick_spells` (
  `npc_entry` int unsigned NOT NULL COMMENT 'reference to creature_template',
  `spell_id` int unsigned NOT NULL COMMENT 'spell which should be casted ',
  `cast_flags` tinyint unsigned NOT NULL COMMENT 'first bit defines caster: 1=player, 0=creature; second bit defines target, same mapping as caster bit',
  `user_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'relation with summoner: 0-no 1-friendly 2-raid 3-party player can click',
  PRIMARY KEY (`npc_entry`,`spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.npc_text
CREATE TABLE IF NOT EXISTS `npc_text` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `text0_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text0_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID0` int NOT NULL DEFAULT '0',
  `lang0` tinyint unsigned NOT NULL DEFAULT '0',
  `Probability0` float NOT NULL DEFAULT '0',
  `EmoteDelay0_0` smallint unsigned NOT NULL DEFAULT '0',
  `Emote0_0` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay0_1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote0_1` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay0_2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote0_2` smallint unsigned NOT NULL DEFAULT '0',
  `text1_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text1_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID1` int NOT NULL DEFAULT '0',
  `lang1` tinyint unsigned NOT NULL DEFAULT '0',
  `Probability1` float NOT NULL DEFAULT '0',
  `EmoteDelay1_0` smallint unsigned NOT NULL DEFAULT '0',
  `Emote1_0` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1_1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote1_1` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1_2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote1_2` smallint unsigned NOT NULL DEFAULT '0',
  `text2_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text2_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID2` int NOT NULL DEFAULT '0',
  `lang2` tinyint unsigned NOT NULL DEFAULT '0',
  `Probability2` float NOT NULL DEFAULT '0',
  `EmoteDelay2_0` smallint unsigned NOT NULL DEFAULT '0',
  `Emote2_0` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2_1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote2_1` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2_2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote2_2` smallint unsigned NOT NULL DEFAULT '0',
  `text3_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text3_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID3` int NOT NULL DEFAULT '0',
  `lang3` tinyint unsigned NOT NULL DEFAULT '0',
  `Probability3` float NOT NULL DEFAULT '0',
  `EmoteDelay3_0` smallint unsigned NOT NULL DEFAULT '0',
  `Emote3_0` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3_1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote3_1` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3_2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote3_2` smallint unsigned NOT NULL DEFAULT '0',
  `text4_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text4_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID4` int NOT NULL DEFAULT '0',
  `lang4` tinyint unsigned NOT NULL DEFAULT '0',
  `Probability4` float NOT NULL DEFAULT '0',
  `EmoteDelay4_0` smallint unsigned NOT NULL DEFAULT '0',
  `Emote4_0` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4_1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote4_1` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4_2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote4_2` smallint unsigned NOT NULL DEFAULT '0',
  `text5_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text5_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID5` int NOT NULL DEFAULT '0',
  `lang5` tinyint unsigned NOT NULL DEFAULT '0',
  `Probability5` float NOT NULL DEFAULT '0',
  `EmoteDelay5_0` smallint unsigned NOT NULL DEFAULT '0',
  `Emote5_0` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay5_1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote5_1` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay5_2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote5_2` smallint unsigned NOT NULL DEFAULT '0',
  `text6_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text6_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID6` int NOT NULL DEFAULT '0',
  `lang6` tinyint unsigned NOT NULL DEFAULT '0',
  `Probability6` float NOT NULL DEFAULT '0',
  `EmoteDelay6_0` smallint unsigned NOT NULL DEFAULT '0',
  `Emote6_0` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay6_1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote6_1` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay6_2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote6_2` smallint unsigned NOT NULL DEFAULT '0',
  `text7_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text7_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID7` int NOT NULL DEFAULT '0',
  `lang7` tinyint unsigned NOT NULL DEFAULT '0',
  `Probability7` float NOT NULL DEFAULT '0',
  `EmoteDelay7_0` smallint unsigned NOT NULL DEFAULT '0',
  `Emote7_0` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay7_1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote7_1` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay7_2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote7_2` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.npc_text_locale
CREATE TABLE IF NOT EXISTS `npc_text_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text0_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text0_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text1_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text1_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text2_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text2_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text3_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text3_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text4_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text4_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text5_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text5_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text6_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text6_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text7_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Text7_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.npc_vendor
CREATE TABLE IF NOT EXISTS `npc_vendor` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `slot` smallint NOT NULL DEFAULT '0',
  `item` int NOT NULL DEFAULT '0',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '0',
  `incrtime` int unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`entry`,`item`,`ExtendedCost`),
  KEY `slot` (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Npc System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.outdoorpvp_template
CREATE TABLE IF NOT EXISTS `outdoorpvp_template` (
  `TypeId` tinyint unsigned NOT NULL,
  `ScriptName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OutdoorPvP Templates';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.page_text
CREATE TABLE IF NOT EXISTS `page_text` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NextPageID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.page_text_locale
CREATE TABLE IF NOT EXISTS `page_text_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.pet_levelstats
CREATE TABLE IF NOT EXISTS `pet_levelstats` (
  `creature_entry` int unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `hp` smallint unsigned NOT NULL,
  `mana` smallint unsigned NOT NULL,
  `armor` int unsigned NOT NULL DEFAULT '0',
  `str` smallint unsigned NOT NULL,
  `agi` smallint unsigned NOT NULL,
  `sta` smallint unsigned NOT NULL,
  `inte` smallint unsigned NOT NULL,
  `spi` smallint unsigned NOT NULL,
  `min_dmg` smallint unsigned NOT NULL DEFAULT '0',
  `max_dmg` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_entry`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0 COMMENT='Stores pet levels stats.';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.pet_name_generation
CREATE TABLE IF NOT EXISTS `pet_name_generation` (
  `id` int unsigned NOT NULL,
  `word` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entry` int unsigned NOT NULL DEFAULT '0',
  `half` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.pickpocketing_loot_template
CREATE TABLE IF NOT EXISTS `pickpocketing_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.player_classlevelstats
CREATE TABLE IF NOT EXISTS `player_classlevelstats` (
  `class` tinyint unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `basehp` smallint unsigned NOT NULL,
  `basemana` smallint unsigned NOT NULL,
  PRIMARY KEY (`class`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0 COMMENT='Stores levels stats.';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.player_factionchange_achievement
CREATE TABLE IF NOT EXISTS `player_factionchange_achievement` (
  `alliance_id` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.player_factionchange_items
CREATE TABLE IF NOT EXISTS `player_factionchange_items` (
  `race_A` int unsigned NOT NULL,
  `alliance_id` int unsigned NOT NULL,
  `commentA` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `race_H` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  `commentH` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.player_factionchange_quests
CREATE TABLE IF NOT EXISTS `player_factionchange_quests` (
  `alliance_id` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`),
  UNIQUE KEY `alliance_uniq` (`alliance_id`),
  UNIQUE KEY `horde_uniq` (`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.player_factionchange_reputations
CREATE TABLE IF NOT EXISTS `player_factionchange_reputations` (
  `alliance_id` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.player_factionchange_spells
CREATE TABLE IF NOT EXISTS `player_factionchange_spells` (
  `alliance_id` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.player_factionchange_titles
CREATE TABLE IF NOT EXISTS `player_factionchange_titles` (
  `alliance_id` int NOT NULL,
  `horde_id` int NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.player_levelstats
CREATE TABLE IF NOT EXISTS `player_levelstats` (
  `race` tinyint unsigned NOT NULL,
  `class` tinyint unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `str` smallint unsigned NOT NULL COMMENT 'strength',
  `agi` smallint unsigned NOT NULL COMMENT 'agility',
  `sta` smallint unsigned NOT NULL COMMENT 'stamina',
  `inte` smallint unsigned NOT NULL COMMENT 'intellect',
  `spi` smallint unsigned NOT NULL COMMENT 'spirit',
  PRIMARY KEY (`race`,`class`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0 COMMENT='Stores levels stats.';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.player_totem_model
CREATE TABLE IF NOT EXISTS `player_totem_model` (
  `TotemSlot` tinyint unsigned NOT NULL,
  `RaceId` tinyint unsigned NOT NULL,
  `DisplayId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`TotemSlot`,`RaceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.player_xp_for_level
CREATE TABLE IF NOT EXISTS `player_xp_for_level` (
  `Level` tinyint unsigned NOT NULL,
  `Experience` int unsigned NOT NULL,
  PRIMARY KEY (`Level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.playercreateinfo
CREATE TABLE IF NOT EXISTS `playercreateinfo` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `zone` int unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.playercreateinfo_action
CREATE TABLE IF NOT EXISTS `playercreateinfo_action` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `button` smallint unsigned NOT NULL DEFAULT '0',
  `action` int unsigned NOT NULL DEFAULT '0',
  `type` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`,`button`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.playercreateinfo_cast_spell
CREATE TABLE IF NOT EXISTS `playercreateinfo_cast_spell` (
  `raceMask` int unsigned NOT NULL DEFAULT '0',
  `classMask` int unsigned NOT NULL DEFAULT '0',
  `spell` int unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.playercreateinfo_item
CREATE TABLE IF NOT EXISTS `playercreateinfo_item` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `itemid` int unsigned NOT NULL DEFAULT '0',
  `amount` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`race`,`class`,`itemid`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.playercreateinfo_skills
CREATE TABLE IF NOT EXISTS `playercreateinfo_skills` (
  `raceMask` int unsigned NOT NULL,
  `classMask` int unsigned NOT NULL,
  `skill` smallint unsigned NOT NULL,
  `rank` smallint unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`raceMask`,`classMask`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.playercreateinfo_spell_custom
CREATE TABLE IF NOT EXISTS `playercreateinfo_spell_custom` (
  `racemask` int unsigned NOT NULL DEFAULT '0',
  `classmask` int unsigned NOT NULL DEFAULT '0',
  `Spell` int unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`racemask`,`classmask`,`Spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.points_of_interest
CREATE TABLE IF NOT EXISTS `points_of_interest` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `Icon` int unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `Importance` int unsigned NOT NULL DEFAULT '0',
  `Name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.points_of_interest_locale
CREATE TABLE IF NOT EXISTS `points_of_interest_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.pool_members
CREATE TABLE IF NOT EXISTS `pool_members` (
  `type` smallint unsigned NOT NULL,
  `spawnId` int unsigned NOT NULL,
  `poolSpawnId` int unsigned NOT NULL,
  `chance` float NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`type`,`spawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.pool_template
CREATE TABLE IF NOT EXISTS `pool_template` (
  `entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Pool entry',
  `max_limit` int unsigned NOT NULL DEFAULT '0' COMMENT 'Max number of objects (0) is no limit',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.prospecting_loot_template
CREATE TABLE IF NOT EXISTS `prospecting_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_details
CREATE TABLE IF NOT EXISTS `quest_details` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Emote1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote3` smallint unsigned NOT NULL DEFAULT '0',
  `Emote4` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_greeting
CREATE TABLE IF NOT EXISTS `quest_greeting` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `GreetEmoteType` smallint unsigned NOT NULL DEFAULT '0',
  `GreetEmoteDelay` int unsigned NOT NULL DEFAULT '0',
  `Greeting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`,`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_greeting_locale
CREATE TABLE IF NOT EXISTS `quest_greeting_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Greeting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`,`Type`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_mail_sender
CREATE TABLE IF NOT EXISTS `quest_mail_sender` (
  `QuestId` int unsigned NOT NULL DEFAULT '0',
  `RewardMailSenderEntry` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_offer_reward
CREATE TABLE IF NOT EXISTS `quest_offer_reward` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Emote1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote3` smallint unsigned NOT NULL DEFAULT '0',
  `Emote4` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4` int unsigned NOT NULL DEFAULT '0',
  `RewardText` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_offer_reward_locale
CREATE TABLE IF NOT EXISTS `quest_offer_reward_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RewardText` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_poi
CREATE TABLE IF NOT EXISTS `quest_poi` (
  `QuestID` int unsigned NOT NULL DEFAULT '0',
  `id` int unsigned NOT NULL DEFAULT '0',
  `ObjectiveIndex` int NOT NULL DEFAULT '0',
  `MapID` int unsigned NOT NULL DEFAULT '0',
  `WorldMapAreaId` int unsigned NOT NULL DEFAULT '0',
  `Floor` int unsigned NOT NULL DEFAULT '0',
  `Priority` int unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`QuestID`,`id`),
  KEY `idx` (`QuestID`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_poi_points
CREATE TABLE IF NOT EXISTS `quest_poi_points` (
  `QuestID` int unsigned NOT NULL DEFAULT '0',
  `Idx1` int unsigned NOT NULL DEFAULT '0',
  `Idx2` int unsigned NOT NULL DEFAULT '0',
  `X` int NOT NULL DEFAULT '0',
  `Y` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`QuestID`,`Idx1`,`Idx2`),
  KEY `questId_id` (`QuestID`,`Idx1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_pool_members
CREATE TABLE IF NOT EXISTS `quest_pool_members` (
  `questId` int unsigned NOT NULL,
  `poolId` int unsigned NOT NULL,
  `poolIndex` tinyint unsigned NOT NULL COMMENT 'Multiple quests with the same index will always spawn together!',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`questId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_pool_template
CREATE TABLE IF NOT EXISTS `quest_pool_template` (
  `poolId` int unsigned NOT NULL,
  `numActive` int unsigned NOT NULL COMMENT 'Number of indices to have active at any time',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`poolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_request_items
CREATE TABLE IF NOT EXISTS `quest_request_items` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `EmoteOnComplete` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteOnIncomplete` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteOnCompleteDelay` int unsigned NOT NULL DEFAULT '0',
  `EmoteOnIncompleteDelay` int unsigned NOT NULL DEFAULT '0',
  `CompletionText` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_request_items_locale
CREATE TABLE IF NOT EXISTS `quest_request_items_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CompletionText` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_template
CREATE TABLE IF NOT EXISTS `quest_template` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `QuestType` tinyint unsigned NOT NULL DEFAULT '2',
  `QuestLevel` smallint NOT NULL DEFAULT '1',
  `MinLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `QuestSortID` smallint NOT NULL DEFAULT '0',
  `QuestInfoID` smallint unsigned NOT NULL DEFAULT '0',
  `SuggestedGroupNum` tinyint unsigned NOT NULL DEFAULT '0',
  `RequiredFactionId1` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredFactionId2` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredFactionValue1` int NOT NULL DEFAULT '0',
  `RequiredFactionValue2` int NOT NULL DEFAULT '0',
  `RewardNextQuest` int unsigned NOT NULL DEFAULT '0',
  `RewardXPDifficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `RewardMoney` int NOT NULL DEFAULT '0',
  `RewardBonusMoney` int unsigned NOT NULL DEFAULT '0',
  `RewardDisplaySpell` int unsigned NOT NULL DEFAULT '0',
  `RewardSpell` int NOT NULL DEFAULT '0',
  `RewardHonor` int NOT NULL DEFAULT '0',
  `RewardKillHonor` float NOT NULL DEFAULT '0',
  `StartItem` int unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `RequiredPlayerKills` tinyint unsigned NOT NULL DEFAULT '0',
  `RewardItem1` int unsigned NOT NULL DEFAULT '0',
  `RewardAmount1` smallint unsigned NOT NULL DEFAULT '0',
  `RewardItem2` int unsigned NOT NULL DEFAULT '0',
  `RewardAmount2` smallint unsigned NOT NULL DEFAULT '0',
  `RewardItem3` int unsigned NOT NULL DEFAULT '0',
  `RewardAmount3` smallint unsigned NOT NULL DEFAULT '0',
  `RewardItem4` int unsigned NOT NULL DEFAULT '0',
  `RewardAmount4` smallint unsigned NOT NULL DEFAULT '0',
  `ItemDrop1` int unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity1` smallint unsigned NOT NULL DEFAULT '0',
  `ItemDrop2` int unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity2` smallint unsigned NOT NULL DEFAULT '0',
  `ItemDrop3` int unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity3` smallint unsigned NOT NULL DEFAULT '0',
  `ItemDrop4` int unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity4` smallint unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID1` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity1` smallint unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID2` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity2` smallint unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID3` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity3` smallint unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID4` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity4` smallint unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID5` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity5` smallint unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID6` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity6` smallint unsigned NOT NULL DEFAULT '0',
  `POIContinent` smallint unsigned NOT NULL DEFAULT '0',
  `POIx` float NOT NULL DEFAULT '0',
  `POIy` float NOT NULL DEFAULT '0',
  `POIPriority` int unsigned NOT NULL DEFAULT '0',
  `RewardTitle` tinyint unsigned NOT NULL DEFAULT '0',
  `RewardTalents` tinyint unsigned NOT NULL DEFAULT '0',
  `RewardArenaPoints` smallint unsigned NOT NULL DEFAULT '0',
  `RewardFactionID1` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValue1` int NOT NULL DEFAULT '0',
  `RewardFactionOverride1` int NOT NULL DEFAULT '0',
  `RewardFactionID2` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValue2` int NOT NULL DEFAULT '0',
  `RewardFactionOverride2` int NOT NULL DEFAULT '0',
  `RewardFactionID3` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValue3` int NOT NULL DEFAULT '0',
  `RewardFactionOverride3` int NOT NULL DEFAULT '0',
  `RewardFactionID4` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValue4` int NOT NULL DEFAULT '0',
  `RewardFactionOverride4` int NOT NULL DEFAULT '0',
  `RewardFactionID5` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValue5` int NOT NULL DEFAULT '0',
  `RewardFactionOverride5` int NOT NULL DEFAULT '0',
  `RewardFactionFlags` int unsigned NOT NULL DEFAULT '0',
  `TimeAllowed` int unsigned NOT NULL DEFAULT '0',
  `AllowableRaces` int unsigned NOT NULL DEFAULT '0',
  `LogTitle` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `LogDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `QuestDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `AreaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `QuestCompletionLog` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `RequiredNpcOrGo1` int NOT NULL DEFAULT '0',
  `RequiredNpcOrGo2` int NOT NULL DEFAULT '0',
  `RequiredNpcOrGo3` int NOT NULL DEFAULT '0',
  `RequiredNpcOrGo4` int NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount1` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount2` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount3` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount4` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredItemId1` int unsigned NOT NULL DEFAULT '0',
  `RequiredItemId2` int unsigned NOT NULL DEFAULT '0',
  `RequiredItemId3` int unsigned NOT NULL DEFAULT '0',
  `RequiredItemId4` int unsigned NOT NULL DEFAULT '0',
  `RequiredItemId5` int unsigned NOT NULL DEFAULT '0',
  `RequiredItemId6` int unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount1` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount2` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount3` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount4` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount5` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount6` smallint unsigned NOT NULL DEFAULT '0',
  `ObjectiveText1` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ObjectiveText2` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ObjectiveText3` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ObjectiveText4` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Quest System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_template_addon
CREATE TABLE IF NOT EXISTS `quest_template_addon` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `AllowableClasses` int unsigned NOT NULL DEFAULT '0',
  `SourceSpellID` int unsigned NOT NULL DEFAULT '0',
  `PrevQuestID` int NOT NULL DEFAULT '0',
  `NextQuestID` int unsigned NOT NULL DEFAULT '0',
  `ExclusiveGroup` int NOT NULL DEFAULT '0',
  `BreadcrumbForQuestId` int NOT NULL DEFAULT '0',
  `RewardMailTemplateID` int unsigned NOT NULL DEFAULT '0',
  `RewardMailDelay` int unsigned NOT NULL DEFAULT '0',
  `RequiredSkillID` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkillPoints` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepValue` int NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` int NOT NULL DEFAULT '0',
  `ProvidedItemCount` tinyint unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.quest_template_locale
CREATE TABLE IF NOT EXISTS `quest_template_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LogTitle` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `LogDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `QuestDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `AreaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `QuestCompletionLog` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ObjectiveText1` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ObjectiveText2` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ObjectiveText3` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ObjectiveText4` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.reference_loot_template
CREATE TABLE IF NOT EXISTS `reference_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.reputation_reward_rate
CREATE TABLE IF NOT EXISTS `reputation_reward_rate` (
  `faction` int unsigned NOT NULL DEFAULT '0',
  `quest_rate` float NOT NULL DEFAULT '1',
  `quest_daily_rate` float NOT NULL DEFAULT '1',
  `quest_weekly_rate` float NOT NULL DEFAULT '1',
  `quest_monthly_rate` float NOT NULL DEFAULT '1',
  `quest_repeatable_rate` float NOT NULL DEFAULT '1',
  `creature_rate` float NOT NULL DEFAULT '1',
  `spell_rate` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.reputation_spillover_template
CREATE TABLE IF NOT EXISTS `reputation_spillover_template` (
  `faction` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction entry',
  `faction1` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction to give spillover for',
  `rate_1` float NOT NULL DEFAULT '0' COMMENT 'the given rep points * rate',
  `rank_1` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'max rank,above this will not give any spillover',
  `faction2` smallint unsigned NOT NULL DEFAULT '0',
  `rate_2` float NOT NULL DEFAULT '0',
  `rank_2` tinyint unsigned NOT NULL DEFAULT '0',
  `faction3` smallint unsigned NOT NULL DEFAULT '0',
  `rate_3` float NOT NULL DEFAULT '0',
  `rank_3` tinyint unsigned NOT NULL DEFAULT '0',
  `faction4` smallint unsigned NOT NULL DEFAULT '0',
  `rate_4` float NOT NULL DEFAULT '0',
  `rank_4` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Reputation spillover reputation gain';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.script_spline_chain_meta
CREATE TABLE IF NOT EXISTS `script_spline_chain_meta` (
  `entry` int unsigned NOT NULL,
  `chainId` smallint unsigned NOT NULL,
  `splineId` tinyint unsigned NOT NULL,
  `expectedDuration` int unsigned NOT NULL,
  `msUntilNext` int unsigned NOT NULL,
  `velocity` float unsigned DEFAULT '0',
  PRIMARY KEY (`entry`,`chainId`,`splineId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.script_spline_chain_waypoints
CREATE TABLE IF NOT EXISTS `script_spline_chain_waypoints` (
  `entry` int unsigned NOT NULL,
  `chainId` smallint unsigned NOT NULL,
  `splineId` tinyint unsigned NOT NULL,
  `wpId` tinyint unsigned NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  PRIMARY KEY (`entry`,`chainId`,`splineId`,`wpId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.skill_discovery_template
CREATE TABLE IF NOT EXISTS `skill_discovery_template` (
  `spellId` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` int unsigned NOT NULL DEFAULT '0' COMMENT 'spell requirement',
  `reqSkillValue` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'skill points requirement',
  `chance` float NOT NULL DEFAULT '0' COMMENT 'chance to discover',
  PRIMARY KEY (`spellId`,`reqSpell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Skill Discovery System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.skill_extra_item_template
CREATE TABLE IF NOT EXISTS `skill_extra_item_template` (
  `spellId` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` int unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'max num of adds',
  PRIMARY KEY (`spellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Skill Specialization System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.skill_fishing_base_level
CREATE TABLE IF NOT EXISTS `skill_fishing_base_level` (
  `entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Area identifier',
  `skill` smallint NOT NULL DEFAULT '0' COMMENT 'Base skill level requirement',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Fishing system';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.skill_perfect_item_template
CREATE TABLE IF NOT EXISTS `skill_perfect_item_template` (
  `spellId` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` int unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `perfectCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create the perfect item instead',
  `perfectItemType` int unsigned NOT NULL DEFAULT '0' COMMENT 'perfect item type to create instead',
  PRIMARY KEY (`spellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Crafting Perfection System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.skinning_loot_template
CREATE TABLE IF NOT EXISTS `skinning_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.smart_scripts
CREATE TABLE IF NOT EXISTS `smart_scripts` (
  `entryorguid` int NOT NULL,
  `source_type` tinyint unsigned NOT NULL DEFAULT '0',
  `id` smallint unsigned NOT NULL DEFAULT '0',
  `link` smallint unsigned NOT NULL DEFAULT '0',
  `event_type` tinyint unsigned NOT NULL DEFAULT '0',
  `event_phase_mask` smallint unsigned NOT NULL DEFAULT '0',
  `event_chance` tinyint unsigned NOT NULL DEFAULT '100',
  `event_flags` smallint unsigned NOT NULL DEFAULT '0',
  `event_param1` int unsigned NOT NULL DEFAULT '0',
  `event_param2` int unsigned NOT NULL DEFAULT '0',
  `event_param3` int unsigned NOT NULL DEFAULT '0',
  `event_param4` int unsigned NOT NULL DEFAULT '0',
  `event_param5` int unsigned NOT NULL DEFAULT '0',
  `action_type` tinyint unsigned NOT NULL DEFAULT '0',
  `action_param1` int unsigned NOT NULL DEFAULT '0',
  `action_param2` int unsigned NOT NULL DEFAULT '0',
  `action_param3` int unsigned NOT NULL DEFAULT '0',
  `action_param4` int unsigned NOT NULL DEFAULT '0',
  `action_param5` int unsigned NOT NULL DEFAULT '0',
  `action_param6` int unsigned NOT NULL DEFAULT '0',
  `target_type` tinyint unsigned NOT NULL DEFAULT '0',
  `target_param1` int unsigned NOT NULL DEFAULT '0',
  `target_param2` int unsigned NOT NULL DEFAULT '0',
  `target_param3` int unsigned NOT NULL DEFAULT '0',
  `target_param4` int unsigned NOT NULL DEFAULT '0',
  `target_x` float NOT NULL DEFAULT '0',
  `target_y` float NOT NULL DEFAULT '0',
  `target_z` float NOT NULL DEFAULT '0',
  `target_o` float NOT NULL DEFAULT '0',
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Event Comment',
  PRIMARY KEY (`entryorguid`,`source_type`,`id`,`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spawn_group
CREATE TABLE IF NOT EXISTS `spawn_group` (
  `groupId` int unsigned NOT NULL,
  `spawnType` tinyint unsigned NOT NULL,
  `spawnId` int unsigned NOT NULL,
  PRIMARY KEY (`groupId`,`spawnType`,`spawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spawn_group_template
CREATE TABLE IF NOT EXISTS `spawn_group_template` (
  `groupId` int unsigned NOT NULL,
  `groupName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupFlags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_area
CREATE TABLE IF NOT EXISTS `spell_area` (
  `spell` int unsigned NOT NULL DEFAULT '0',
  `area` int unsigned NOT NULL DEFAULT '0',
  `quest_start` int unsigned NOT NULL DEFAULT '0',
  `quest_end` int unsigned NOT NULL DEFAULT '0',
  `aura_spell` int NOT NULL DEFAULT '0',
  `racemask` int unsigned NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '2',
  `autocast` tinyint unsigned NOT NULL DEFAULT '0',
  `quest_start_status` int NOT NULL DEFAULT '64',
  `quest_end_status` int NOT NULL DEFAULT '11',
  PRIMARY KEY (`spell`,`area`,`quest_start`,`aura_spell`,`racemask`,`gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_bonus_data
CREATE TABLE IF NOT EXISTS `spell_bonus_data` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `direct_bonus` float NOT NULL DEFAULT '0',
  `dot_bonus` float NOT NULL DEFAULT '0',
  `ap_bonus` float NOT NULL DEFAULT '0',
  `ap_dot_bonus` float NOT NULL DEFAULT '0',
  `comments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_custom_attr
CREATE TABLE IF NOT EXISTS `spell_custom_attr` (
  `entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'spell id',
  `attributes` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellCustomAttributes',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='SpellInfo custom attributes';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_dbc
CREATE TABLE IF NOT EXISTS `spell_dbc` (
  `Id` int unsigned NOT NULL,
  `Dispel` int unsigned NOT NULL DEFAULT '0',
  `Mechanic` int unsigned NOT NULL DEFAULT '0',
  `Attributes` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx2` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx3` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx4` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx5` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx6` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx7` int unsigned NOT NULL DEFAULT '0',
  `Stances` int unsigned NOT NULL DEFAULT '0',
  `StancesNot` int unsigned NOT NULL DEFAULT '0',
  `Targets` int unsigned NOT NULL DEFAULT '0',
  `CastingTimeIndex` int unsigned NOT NULL DEFAULT '1',
  `AuraInterruptFlags` int unsigned NOT NULL DEFAULT '0',
  `ProcFlags` int unsigned NOT NULL DEFAULT '0',
  `ProcChance` int unsigned NOT NULL DEFAULT '0',
  `ProcCharges` int unsigned NOT NULL DEFAULT '0',
  `MaxLevel` int unsigned NOT NULL DEFAULT '0',
  `BaseLevel` int unsigned NOT NULL DEFAULT '0',
  `SpellLevel` int unsigned NOT NULL DEFAULT '0',
  `DurationIndex` int unsigned NOT NULL DEFAULT '0',
  `RangeIndex` int unsigned NOT NULL DEFAULT '1',
  `StackAmount` int unsigned NOT NULL DEFAULT '0',
  `EquippedItemClass` int NOT NULL DEFAULT '-1',
  `EquippedItemSubClassMask` int NOT NULL DEFAULT '0',
  `EquippedItemInventoryTypeMask` int NOT NULL DEFAULT '0',
  `Effect1` int unsigned NOT NULL DEFAULT '0',
  `Effect2` int unsigned NOT NULL DEFAULT '0',
  `Effect3` int unsigned NOT NULL DEFAULT '0',
  `EffectDieSides1` int NOT NULL DEFAULT '0',
  `EffectDieSides2` int NOT NULL DEFAULT '0',
  `EffectDieSides3` int NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel1` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel2` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel3` float NOT NULL DEFAULT '0',
  `EffectBasePoints1` int NOT NULL DEFAULT '0',
  `EffectBasePoints2` int NOT NULL DEFAULT '0',
  `EffectBasePoints3` int NOT NULL DEFAULT '0',
  `EffectMechanic1` int unsigned NOT NULL DEFAULT '0',
  `EffectMechanic2` int unsigned NOT NULL DEFAULT '0',
  `EffectMechanic3` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA1` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA2` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA3` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB1` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB2` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB3` int unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex1` int unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex2` int unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex3` int unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName1` int unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName2` int unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName3` int unsigned NOT NULL DEFAULT '0',
  `EffectAmplitude1` int NOT NULL DEFAULT '0',
  `EffectAmplitude2` int NOT NULL DEFAULT '0',
  `EffectAmplitude3` int NOT NULL DEFAULT '0',
  `EffectMultipleValue1` float NOT NULL DEFAULT '0',
  `EffectMultipleValue2` float NOT NULL DEFAULT '0',
  `EffectMultipleValue3` float NOT NULL DEFAULT '0',
  `EffectItemType1` int unsigned NOT NULL DEFAULT '0',
  `EffectItemType2` int unsigned NOT NULL DEFAULT '0',
  `EffectItemType3` int unsigned NOT NULL DEFAULT '0',
  `EffectMiscValue1` int NOT NULL DEFAULT '0',
  `EffectMiscValue2` int NOT NULL DEFAULT '0',
  `EffectMiscValue3` int NOT NULL DEFAULT '0',
  `EffectMiscValueB1` int NOT NULL DEFAULT '0',
  `EffectMiscValueB2` int NOT NULL DEFAULT '0',
  `EffectMiscValueB3` int NOT NULL DEFAULT '0',
  `EffectTriggerSpell1` int unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell2` int unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell3` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA1` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA2` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA3` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB1` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB2` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB3` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC1` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC2` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC3` int unsigned NOT NULL DEFAULT '0',
  `SpellName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MaxTargetLevel` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags1` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags2` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags3` int unsigned NOT NULL DEFAULT '0',
  `MaxAffectedTargets` int unsigned NOT NULL DEFAULT '0',
  `DmgClass` int unsigned NOT NULL DEFAULT '0',
  `PreventionType` int unsigned NOT NULL DEFAULT '0',
  `DmgMultiplier1` float NOT NULL DEFAULT '0',
  `DmgMultiplier2` float NOT NULL DEFAULT '0',
  `DmgMultiplier3` float NOT NULL DEFAULT '0',
  `AreaGroupId` int NOT NULL DEFAULT '0',
  `SchoolMask` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Custom spell.dbc entries';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_enchant_proc_data
CREATE TABLE IF NOT EXISTS `spell_enchant_proc_data` (
  `EnchantID` int unsigned NOT NULL,
  `Chance` float NOT NULL DEFAULT '0',
  `ProcsPerMinute` float NOT NULL DEFAULT '0',
  `HitMask` int unsigned NOT NULL DEFAULT '0',
  `AttributesMask` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`EnchantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Spell enchant proc data';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_group
CREATE TABLE IF NOT EXISTS `spell_group` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `spell_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Spell System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_group_stack_rules
CREATE TABLE IF NOT EXISTS `spell_group_stack_rules` (
  `group_id` int unsigned NOT NULL DEFAULT '0',
  `stack_rule` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_learn_spell
CREATE TABLE IF NOT EXISTS `spell_learn_spell` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `Active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_linked_spell
CREATE TABLE IF NOT EXISTS `spell_linked_spell` (
  `spell_trigger` int NOT NULL,
  `spell_effect` int NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `trigger_effect_type` (`spell_trigger`,`spell_effect`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Spell System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_loot_template
CREATE TABLE IF NOT EXISTS `spell_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Reference` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_pet_auras
CREATE TABLE IF NOT EXISTS `spell_pet_auras` (
  `spell` int unsigned NOT NULL COMMENT 'dummy spell id',
  `effectId` tinyint unsigned NOT NULL DEFAULT '0',
  `pet` int unsigned NOT NULL DEFAULT '0' COMMENT 'pet id; 0 = all',
  `aura` int unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY (`spell`,`effectId`,`pet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_proc
CREATE TABLE IF NOT EXISTS `spell_proc` (
  `SpellId` int NOT NULL DEFAULT '0',
  `SchoolMask` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask0` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask1` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask2` int unsigned NOT NULL DEFAULT '0',
  `ProcFlags` int unsigned NOT NULL DEFAULT '0',
  `SpellTypeMask` int unsigned NOT NULL DEFAULT '0',
  `SpellPhaseMask` int unsigned NOT NULL DEFAULT '0',
  `HitMask` int unsigned NOT NULL DEFAULT '0',
  `AttributesMask` int unsigned NOT NULL DEFAULT '0',
  `DisableEffectsMask` int unsigned NOT NULL DEFAULT '0',
  `ProcsPerMinute` float NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '0',
  `Cooldown` int unsigned NOT NULL DEFAULT '0',
  `Charges` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_ranks
CREATE TABLE IF NOT EXISTS `spell_ranks` (
  `first_spell_id` int unsigned NOT NULL DEFAULT '0',
  `spell_id` int unsigned NOT NULL DEFAULT '0',
  `rank` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`first_spell_id`,`rank`),
  UNIQUE KEY `spell_id` (`spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Spell Rank Data';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_required
CREATE TABLE IF NOT EXISTS `spell_required` (
  `spell_id` int NOT NULL DEFAULT '0',
  `req_spell` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell_id`,`req_spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Spell Additinal Data';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_script_names
CREATE TABLE IF NOT EXISTS `spell_script_names` (
  `spell_id` int NOT NULL,
  `ScriptName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `spell_id` (`spell_id`,`ScriptName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_target_position
CREATE TABLE IF NOT EXISTS `spell_target_position` (
  `ID` int unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `EffectIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `MapID` smallint unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `PositionZ` float NOT NULL DEFAULT '0',
  `Orientation` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`ID`,`EffectIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Spell System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spell_threat
CREATE TABLE IF NOT EXISTS `spell_threat` (
  `entry` int unsigned NOT NULL,
  `flatMod` int DEFAULT NULL,
  `pctMod` float NOT NULL DEFAULT '1' COMMENT 'threat multiplier for damage/healing',
  `apPctMod` float NOT NULL DEFAULT '0' COMMENT 'additional threat bonus from attack power',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.spelldifficulty_dbc
CREATE TABLE IF NOT EXISTS `spelldifficulty_dbc` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `spellid0` int unsigned NOT NULL DEFAULT '0',
  `spellid1` int unsigned NOT NULL DEFAULT '0',
  `spellid2` int unsigned NOT NULL DEFAULT '0',
  `spellid3` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.trainer
CREATE TABLE IF NOT EXISTS `trainer` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '2',
  `Requirement` int unsigned NOT NULL DEFAULT '0',
  `Greeting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.trainer_locale
CREATE TABLE IF NOT EXISTS `trainer_locale` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Greeting_lang` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`Id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.trainer_spell
CREATE TABLE IF NOT EXISTS `trainer_spell` (
  `TrainerId` int unsigned NOT NULL DEFAULT '0',
  `SpellId` int unsigned NOT NULL DEFAULT '0',
  `MoneyCost` int unsigned NOT NULL DEFAULT '0',
  `ReqSkillLine` int unsigned NOT NULL DEFAULT '0',
  `ReqSkillRank` int unsigned NOT NULL DEFAULT '0',
  `ReqAbility1` int unsigned NOT NULL DEFAULT '0',
  `ReqAbility2` int unsigned NOT NULL DEFAULT '0',
  `ReqAbility3` int unsigned NOT NULL DEFAULT '0',
  `ReqLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`TrainerId`,`SpellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.transports
CREATE TABLE IF NOT EXISTS `transports` (
  `guid` int unsigned NOT NULL AUTO_INCREMENT,
  `entry` int unsigned NOT NULL DEFAULT '0',
  `name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ScriptName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `idx_entry` (`entry`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Transports';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.trinity_string
CREATE TABLE IF NOT EXISTS `trinity_string` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `content_default` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_loc1` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_loc2` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_loc3` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_loc4` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_loc5` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_loc6` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_loc7` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_loc8` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.updates
CREATE TABLE IF NOT EXISTS `updates` (
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of all applied updates in this database.';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.updates_include
CREATE TABLE IF NOT EXISTS `updates_include` (
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of directories where we want to include sql updates.';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.vehicle_accessory
CREATE TABLE IF NOT EXISTS `vehicle_accessory` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `accessory_entry` int unsigned NOT NULL DEFAULT '0',
  `seat_id` tinyint NOT NULL DEFAULT '0',
  `minion` tinyint unsigned NOT NULL DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summontype` tinyint unsigned NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int unsigned NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes',
  PRIMARY KEY (`guid`,`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.vehicle_seat_addon
CREATE TABLE IF NOT EXISTS `vehicle_seat_addon` (
  `SeatEntry` int unsigned NOT NULL COMMENT 'VehicleSeatEntry.dbc identifier',
  `SeatOrientation` float DEFAULT '0' COMMENT 'Seat Orientation override value',
  `ExitParamX` float DEFAULT '0',
  `ExitParamY` float DEFAULT '0',
  `ExitParamZ` float DEFAULT '0',
  `ExitParamO` float DEFAULT '0',
  `ExitParamValue` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`SeatEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.vehicle_template
CREATE TABLE IF NOT EXISTS `vehicle_template` (
  `creatureId` int unsigned NOT NULL,
  `despawnDelayMs` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`creatureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.vehicle_template_accessory
CREATE TABLE IF NOT EXISTS `vehicle_template_accessory` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `accessory_entry` int unsigned NOT NULL DEFAULT '0',
  `seat_id` tinyint NOT NULL DEFAULT '0',
  `minion` tinyint unsigned NOT NULL DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summontype` tinyint unsigned NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int unsigned NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes',
  PRIMARY KEY (`entry`,`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.version
CREATE TABLE IF NOT EXISTS `version` (
  `core_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Core revision dumped at startup.',
  `core_revision` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_version` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Version of world DB.',
  `cache_id` int DEFAULT '0',
  PRIMARY KEY (`core_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Version Notes';

-- Data exporting was unselected.

-- Dumping structure for view dev_woi_world.vw_conditions_with_labels
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_conditions_with_labels` (
	`SourceTypeOrReferenceId` VARCHAR(1) NOT NULL COLLATE 'utf8mb3_general_ci',
	`SourceGroup` INT UNSIGNED NOT NULL,
	`SourceEntry` INT NOT NULL,
	`SourceId` INT NOT NULL,
	`ElseGroup` INT UNSIGNED NOT NULL,
	`ConditionTypeOrReference` VARCHAR(1) NOT NULL COLLATE 'utf8mb3_general_ci',
	`ConditionTarget` TINYINT UNSIGNED NOT NULL,
	`ConditionValue1` INT UNSIGNED NOT NULL,
	`ConditionValue2` INT UNSIGNED NOT NULL,
	`ConditionValue3` INT UNSIGNED NOT NULL,
	`NegativeCondition` TINYINT UNSIGNED NOT NULL,
	`ErrorType` INT UNSIGNED NOT NULL,
	`ErrorTextId` INT UNSIGNED NOT NULL,
	`ScriptName` CHAR(64) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`Comment` VARCHAR(1) NULL COLLATE 'utf8mb4_unicode_ci'
);

-- Dumping structure for view dev_woi_world.vw_disables_with_labels
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_disables_with_labels` (
	`sourceType` VARCHAR(1) NOT NULL COLLATE 'utf8mb3_general_ci',
	`entry` INT UNSIGNED NOT NULL,
	`flags` SMALLINT NOT NULL,
	`params_0` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`params_1` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`comment` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci'
);

-- Dumping structure for view dev_woi_world.vw_smart_scripts_with_labels
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_smart_scripts_with_labels` (
	`entryorguid` INT NOT NULL,
	`source_type` TINYINT UNSIGNED NOT NULL,
	`id` SMALLINT UNSIGNED NOT NULL,
	`link` SMALLINT UNSIGNED NOT NULL,
	`event_type` VARCHAR(1) NOT NULL COLLATE 'utf8mb3_general_ci',
	`event_phase_mask` SMALLINT UNSIGNED NOT NULL,
	`event_chance` TINYINT UNSIGNED NOT NULL,
	`event_flags` SMALLINT UNSIGNED NOT NULL,
	`event_param1` INT UNSIGNED NOT NULL,
	`event_param2` INT UNSIGNED NOT NULL,
	`event_param3` INT UNSIGNED NOT NULL,
	`event_param4` INT UNSIGNED NOT NULL,
	`event_param5` INT UNSIGNED NOT NULL,
	`action_type` VARCHAR(1) NOT NULL COLLATE 'utf8mb3_general_ci',
	`action_param1` INT UNSIGNED NOT NULL,
	`action_param2` INT UNSIGNED NOT NULL,
	`action_param3` INT UNSIGNED NOT NULL,
	`action_param4` INT UNSIGNED NOT NULL,
	`action_param5` INT UNSIGNED NOT NULL,
	`action_param6` INT UNSIGNED NOT NULL,
	`target_type` VARCHAR(1) NOT NULL COLLATE 'utf8mb3_general_ci',
	`target_param1` INT UNSIGNED NOT NULL,
	`target_param2` INT UNSIGNED NOT NULL,
	`target_param3` INT UNSIGNED NOT NULL,
	`target_param4` INT UNSIGNED NOT NULL,
	`target_x` FLOAT NOT NULL,
	`target_y` FLOAT NOT NULL,
	`target_z` FLOAT NOT NULL,
	`target_o` FLOAT NOT NULL,
	`comment` MEDIUMTEXT NOT NULL COMMENT 'Event Comment' COLLATE 'utf8mb4_unicode_ci'
);

-- Dumping structure for table dev_woi_world.warden_checks
CREATE TABLE IF NOT EXISTS `warden_checks` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint unsigned DEFAULT NULL,
  `str` varchar(170) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` int unsigned DEFAULT NULL,
  `length` tinyint unsigned DEFAULT NULL,
  `comment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` binary(24) DEFAULT NULL,
  `result` varbinary(24) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=812 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.waypoint_data
CREATE TABLE IF NOT EXISTS `waypoint_data` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Creature GUID',
  `point` int unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float DEFAULT NULL,
  `delay` int unsigned NOT NULL DEFAULT '0',
  `move_type` int NOT NULL DEFAULT '0',
  `action` int NOT NULL DEFAULT '0',
  `action_chance` smallint NOT NULL DEFAULT '100',
  `wpguid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_world.waypoint_scripts
CREATE TABLE IF NOT EXISTS `waypoint_scripts` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` int unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `guid` int NOT NULL DEFAULT '0',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_conditions_with_labels`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `dev_woi_world`.`vw_conditions_with_labels` AS select (case when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 0) then 'CONDITION_SOURCE_TYPE_NONE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 1) then 'CONDITION_SOURCE_TYPE_CREATURE_LOOT_TEMPLATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 2) then 'CONDITION_SOURCE_TYPE_DISENCHANT_LOOT_TEMPLATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 3) then 'CONDITION_SOURCE_TYPE_FISHING_LOOT_TEMPLATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 4) then 'CONDITION_SOURCE_TYPE_GAMEOBJECT_LOOT_TEMPLATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 5) then 'CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 6) then 'CONDITION_SOURCE_TYPE_MAIL_LOOT_TEMPLATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 7) then 'CONDITION_SOURCE_TYPE_MILLING_LOOT_TEMPLATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 8) then 'CONDITION_SOURCE_TYPE_PICKPOCKETING_LOOT_TEMPLATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 9) then 'CONDITION_SOURCE_TYPE_PROSPECTING_LOOT_TEMPLATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 10) then 'CONDITION_SOURCE_TYPE_REFERENCE_LOOT_TEMPLATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 11) then 'CONDITION_SOURCE_TYPE_SKINNING_LOOT_TEMPLATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 12) then 'CONDITION_SOURCE_TYPE_SPELL_LOOT_TEMPLATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 13) then 'CONDITION_SOURCE_TYPE_SPELL_IMPLICIT_TARGET' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 14) then 'CONDITION_SOURCE_TYPE_GOSSIP_MENU' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 15) then 'CONDITION_SOURCE_TYPE_GOSSIP_MENU_OPTION' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 16) then 'CONDITION_SOURCE_TYPE_CREATURE_TEMPLATE_VEHICLE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 17) then 'CONDITION_SOURCE_TYPE_SPELL' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 18) then 'CONDITION_SOURCE_TYPE_SPELL_CLICK_EVENT' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 19) then 'CONDITION_SOURCE_TYPE_QUEST_AVAILABLE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 21) then 'CONDITION_SOURCE_TYPE_VEHICLE_SPELL' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 22) then 'CONDITION_SOURCE_TYPE_SMART_EVENT' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 23) then 'CONDITION_SOURCE_TYPE_NPC_VENDOR' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 24) then 'CONDITION_SOURCE_TYPE_SPELL_PROC' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 25) then 'CONDITION_SOURCE_TYPE_TERRAIN_SWAP' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 26) then 'CONDITION_SOURCE_TYPE_PHASE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 27) then 'CONDITION_SOURCE_TYPE_GRAVEYARD' else `dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` end) AS `SourceTypeOrReferenceId`,`dev_woi_world`.`conditions`.`SourceGroup` AS `SourceGroup`,`dev_woi_world`.`conditions`.`SourceEntry` AS `SourceEntry`,`dev_woi_world`.`conditions`.`SourceId` AS `SourceId`,`dev_woi_world`.`conditions`.`ElseGroup` AS `ElseGroup`,(case when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 0) then 'CONDITION_NONE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 1) then 'CONDITION_AURA' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 2) then 'CONDITION_ITEM' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 3) then 'CONDITION_ITEM_EQUIPPED' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 4) then 'CONDITION_ZONEID' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 5) then 'CONDITION_REPUTATION_RANK' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 6) then 'CONDITION_TEAM' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 7) then 'CONDITION_SKILL' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 8) then 'CONDITION_QUESTREWARDED' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 9) then 'CONDITION_QUESTTAKEN' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 10) then 'CONDITION_DRUNKENSTATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 11) then 'CONDITION_WORLD_STATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 12) then 'CONDITION_ACTIVE_EVENT' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 13) then 'CONDITION_INSTANCE_INFO' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 14) then 'CONDITION_QUEST_NONE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 15) then 'CONDITION_CLASS' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 16) then 'CONDITION_RACE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 17) then 'CONDITION_ACHIEVEMENT' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 18) then 'CONDITION_TITLE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 19) then 'CONDITION_SPAWNMASK' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 20) then 'CONDITION_GENDER' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 21) then 'CONDITION_UNIT_STATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 22) then 'CONDITION_MAPID' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 23) then 'CONDITION_AREAID' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 24) then 'CONDITION_CREATURE_TYPE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 25) then 'CONDITION_SPELL' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 26) then 'CONDITION_PHASEMASK' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 27) then 'CONDITION_LEVEL' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 28) then 'CONDITION_QUEST_COMPLETE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 29) then 'CONDITION_NEAR_CREATURE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 30) then 'CONDITION_NEAR_GAMEOBJECT' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 31) then 'CONDITION_OBJECT_ENTRY_GUID' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 32) then 'CONDITION_TYPE_MASK' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 33) then 'CONDITION_RELATION_TO' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 34) then 'CONDITION_REACTION_TO' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 35) then 'CONDITION_DISTANCE_TO' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 36) then 'CONDITION_ALIVE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 37) then 'CONDITION_HP_VAL' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 38) then 'CONDITION_HP_PCT' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 39) then 'CONDITION_REALM_ACHIEVEMENT' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 40) then 'CONDITION_IN_WATER' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 41) then 'CONDITION_TERRAIN_SWAP' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 42) then 'CONDITION_STAND_STATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 43) then 'CONDITION_DAILY_QUEST_DONE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 44) then 'CONDITION_CHARMED' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 45) then 'CONDITION_PET_TYPE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 46) then 'CONDITION_TAXI' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 47) then 'CONDITION_QUESTSTATE' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 48) then 'CONDITION_QUEST_OBJECTIVE_PROGRESS' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 49) then 'CONDITION_DIFFICULTY_ID' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 50) then 'CONDITION_GAMEMASTER' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 51) then 'CONDITION_OBJECT_ENTRY_GUID_MASTER' when (`dev_woi_world`.`conditions`.`SourceTypeOrReferenceId` = 52) then 'CONDITION_TYPE_MASK_MASTER' else `dev_woi_world`.`conditions`.`ConditionTypeOrReference` end) AS `ConditionTypeOrReference`,`dev_woi_world`.`conditions`.`ConditionTarget` AS `ConditionTarget`,`dev_woi_world`.`conditions`.`ConditionValue1` AS `ConditionValue1`,`dev_woi_world`.`conditions`.`ConditionValue2` AS `ConditionValue2`,`dev_woi_world`.`conditions`.`ConditionValue3` AS `ConditionValue3`,`dev_woi_world`.`conditions`.`NegativeCondition` AS `NegativeCondition`,`dev_woi_world`.`conditions`.`ErrorType` AS `ErrorType`,`dev_woi_world`.`conditions`.`ErrorTextId` AS `ErrorTextId`,`dev_woi_world`.`conditions`.`ScriptName` AS `ScriptName`,`dev_woi_world`.`conditions`.`Comment` AS `Comment` from `dev_woi_world`.`conditions`
;

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_disables_with_labels`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `dev_woi_world`.`vw_disables_with_labels` AS select (case when (`dev_woi_world`.`disables`.`sourceType` = 0) then 'DISABLE_TYPE_SPELL' when (`dev_woi_world`.`disables`.`sourceType` = 1) then 'DISABLE_TYPE_QUEST' when (`dev_woi_world`.`disables`.`sourceType` = 2) then 'DISABLE_TYPE_MAP' when (`dev_woi_world`.`disables`.`sourceType` = 3) then 'DISABLE_TYPE_BATTLEGROUND' when (`dev_woi_world`.`disables`.`sourceType` = 4) then 'DISABLE_TYPE_ACHIEVEMENT_CRITERIA' when (`dev_woi_world`.`disables`.`sourceType` = 5) then 'DISABLE_TYPE_OUTDOORPVP' when (`dev_woi_world`.`disables`.`sourceType` = 6) then 'DISABLE_TYPE_VMAP' when (`dev_woi_world`.`disables`.`sourceType` = 7) then 'DISABLE_TYPE_MMAP' when (`dev_woi_world`.`disables`.`sourceType` = 8) then 'DISABLE_TYPE_LFG_MAP' else `dev_woi_world`.`disables`.`sourceType` end) AS `sourceType`,`dev_woi_world`.`disables`.`entry` AS `entry`,`dev_woi_world`.`disables`.`flags` AS `flags`,`dev_woi_world`.`disables`.`params_0` AS `params_0`,`dev_woi_world`.`disables`.`params_1` AS `params_1`,`dev_woi_world`.`disables`.`comment` AS `comment` from `dev_woi_world`.`disables`
;

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_smart_scripts_with_labels`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `dev_woi_world`.`vw_smart_scripts_with_labels` AS select `dev_woi_world`.`smart_scripts`.`entryorguid` AS `entryorguid`,`dev_woi_world`.`smart_scripts`.`source_type` AS `source_type`,`dev_woi_world`.`smart_scripts`.`id` AS `id`,`dev_woi_world`.`smart_scripts`.`link` AS `link`,(case when (`dev_woi_world`.`smart_scripts`.`event_type` = 0) then 'SMART_EVENT_UPDATE_IC' when (`dev_woi_world`.`smart_scripts`.`event_type` = 1) then 'SMART_EVENT_UPDATE_OOC' when (`dev_woi_world`.`smart_scripts`.`event_type` = 2) then 'SMART_EVENT_HEALTH_PCT' when (`dev_woi_world`.`smart_scripts`.`event_type` = 3) then 'SMART_EVENT_MANA_PCT' when (`dev_woi_world`.`smart_scripts`.`event_type` = 4) then 'SMART_EVENT_AGGRO' when (`dev_woi_world`.`smart_scripts`.`event_type` = 5) then 'SMART_EVENT_KILL' when (`dev_woi_world`.`smart_scripts`.`event_type` = 6) then 'SMART_EVENT_DEATH' when (`dev_woi_world`.`smart_scripts`.`event_type` = 7) then 'SMART_EVENT_EVADE' when (`dev_woi_world`.`smart_scripts`.`event_type` = 8) then 'SMART_EVENT_SPELLHIT' when (`dev_woi_world`.`smart_scripts`.`event_type` = 9) then 'SMART_EVENT_RANGE' when (`dev_woi_world`.`smart_scripts`.`event_type` = 10) then 'SMART_EVENT_OOC_LOS' when (`dev_woi_world`.`smart_scripts`.`event_type` = 11) then 'SMART_EVENT_RESPAWN' when (`dev_woi_world`.`smart_scripts`.`event_type` = 12) then 'SMART_EVENT_TARGET_HEALTH_PCT' when (`dev_woi_world`.`smart_scripts`.`event_type` = 13) then 'SMART_EVENT_VICTIM_CASTING' when (`dev_woi_world`.`smart_scripts`.`event_type` = 14) then 'SMART_EVENT_FRIENDLY_HEALTH' when (`dev_woi_world`.`smart_scripts`.`event_type` = 15) then 'SMART_EVENT_FRIENDLY_IS_CC' when (`dev_woi_world`.`smart_scripts`.`event_type` = 16) then 'SMART_EVENT_FRIENDLY_MISSING_BUFF' when (`dev_woi_world`.`smart_scripts`.`event_type` = 17) then 'SMART_EVENT_SUMMONED_UNIT' when (`dev_woi_world`.`smart_scripts`.`event_type` = 18) then 'SMART_EVENT_TARGET_MANA_PCT' when (`dev_woi_world`.`smart_scripts`.`event_type` = 19) then 'SMART_EVENT_ACCEPTED_QUEST' when (`dev_woi_world`.`smart_scripts`.`event_type` = 20) then 'SMART_EVENT_REWARD_QUEST' when (`dev_woi_world`.`smart_scripts`.`event_type` = 21) then 'SMART_EVENT_REACHED_HOME' when (`dev_woi_world`.`smart_scripts`.`event_type` = 22) then 'SMART_EVENT_RECEIVE_EMOTE' when (`dev_woi_world`.`smart_scripts`.`event_type` = 23) then 'SMART_EVENT_HAS_AURA' when (`dev_woi_world`.`smart_scripts`.`event_type` = 24) then 'SMART_EVENT_TARGET_BUFFED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 25) then 'SMART_EVENT_RESET' when (`dev_woi_world`.`smart_scripts`.`event_type` = 26) then 'SMART_EVENT_IC_LOS' when (`dev_woi_world`.`smart_scripts`.`event_type` = 27) then 'SMART_EVENT_PASSENGER_BOARDED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 28) then 'SMART_EVENT_PASSENGER_REMOVED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 29) then 'SMART_EVENT_CHARMED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 30) then 'SMART_EVENT_CHARMED_TARGET' when (`dev_woi_world`.`smart_scripts`.`event_type` = 31) then 'SMART_EVENT_SPELLHIT_TARGET' when (`dev_woi_world`.`smart_scripts`.`event_type` = 32) then 'SMART_EVENT_DAMAGED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 33) then 'SMART_EVENT_DAMAGED_TARGET' when (`dev_woi_world`.`smart_scripts`.`event_type` = 34) then 'SMART_EVENT_MOVEMENTINFORM' when (`dev_woi_world`.`smart_scripts`.`event_type` = 35) then 'SMART_EVENT_SUMMON_DESPAWNED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 36) then 'SMART_EVENT_CORPSE_REMOVED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 37) then 'SMART_EVENT_AI_INIT' when (`dev_woi_world`.`smart_scripts`.`event_type` = 38) then 'SMART_EVENT_DATA_SET' when (`dev_woi_world`.`smart_scripts`.`event_type` = 39) then 'SMART_EVENT_WAYPOINT_START' when (`dev_woi_world`.`smart_scripts`.`event_type` = 40) then 'SMART_EVENT_WAYPOINT_REACHED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 41) then 'SMART_EVENT_TRANSPORT_ADDPLAYER' when (`dev_woi_world`.`smart_scripts`.`event_type` = 42) then 'SMART_EVENT_TRANSPORT_ADDCREATURE' when (`dev_woi_world`.`smart_scripts`.`event_type` = 43) then 'SMART_EVENT_TRANSPORT_REMOVE_PLAYER' when (`dev_woi_world`.`smart_scripts`.`event_type` = 44) then 'SMART_EVENT_TRANSPORT_RELOCATE' when (`dev_woi_world`.`smart_scripts`.`event_type` = 45) then 'SMART_EVENT_INSTANCE_PLAYER_ENTER' when (`dev_woi_world`.`smart_scripts`.`event_type` = 46) then 'SMART_EVENT_AREATRIGGER_ONTRIGGER' when (`dev_woi_world`.`smart_scripts`.`event_type` = 47) then 'SMART_EVENT_QUEST_ACCEPTED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 48) then 'SMART_EVENT_QUEST_OBJ_COPLETETION' when (`dev_woi_world`.`smart_scripts`.`event_type` = 49) then 'SMART_EVENT_QUEST_COMPLETION' when (`dev_woi_world`.`smart_scripts`.`event_type` = 50) then 'SMART_EVENT_QUEST_REWARDED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 51) then 'SMART_EVENT_QUEST_FAIL' when (`dev_woi_world`.`smart_scripts`.`event_type` = 52) then 'SMART_EVENT_TEXT_OVER' when (`dev_woi_world`.`smart_scripts`.`event_type` = 53) then 'SMART_EVENT_RECEIVE_HEAL' when (`dev_woi_world`.`smart_scripts`.`event_type` = 54) then 'SMART_EVENT_JUST_SUMMONED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 55) then 'SMART_EVENT_WAYPOINT_PAUSED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 56) then 'SMART_EVENT_WAYPOINT_RESUMED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 57) then 'SMART_EVENT_WAYPOINT_STOPPED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 58) then 'SMART_EVENT_WAYPOINT_ENDED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 59) then 'SMART_EVENT_TIMED_EVENT_TRIGGERED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 60) then 'SMART_EVENT_UPDATE' when (`dev_woi_world`.`smart_scripts`.`event_type` = 61) then 'SMART_EVENT_LINK' when (`dev_woi_world`.`smart_scripts`.`event_type` = 62) then 'SMART_EVENT_GOSSIP_SELECT' when (`dev_woi_world`.`smart_scripts`.`event_type` = 63) then 'SMART_EVENT_JUST_CREATED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 64) then 'SMART_EVENT_GOSSIP_HELLO' when (`dev_woi_world`.`smart_scripts`.`event_type` = 65) then 'SMART_EVENT_FOLLOW_COMPLETED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 66) then 'SMART_EVENT_EVENT_PHASE_CHANGE' when (`dev_woi_world`.`smart_scripts`.`event_type` = 67) then 'SMART_EVENT_IS_BEHIND_TARGET' when (`dev_woi_world`.`smart_scripts`.`event_type` = 68) then 'SMART_EVENT_GAME_EVENT_START' when (`dev_woi_world`.`smart_scripts`.`event_type` = 69) then 'SMART_EVENT_GAME_EVENT_END' when (`dev_woi_world`.`smart_scripts`.`event_type` = 70) then 'SMART_EVENT_GO_LOOT_STATE_CHANGED' when (`dev_woi_world`.`smart_scripts`.`event_type` = 71) then 'SMART_EVENT_GO_EVENT_INFORM' when (`dev_woi_world`.`smart_scripts`.`event_type` = 72) then 'SMART_EVENT_ACTION_DONE' when (`dev_woi_world`.`smart_scripts`.`event_type` = 73) then 'SMART_EVENT_ON_SPELLCLICK' when (`dev_woi_world`.`smart_scripts`.`event_type` = 74) then 'SMART_EVENT_FRIENDLY_HEALTH_PCT' when (`dev_woi_world`.`smart_scripts`.`event_type` = 75) then 'SMART_EVENT_DISTANCE_CREATURE' when (`dev_woi_world`.`smart_scripts`.`event_type` = 76) then 'SMART_EVENT_DISTANCE_GAMEOBJECT' when (`dev_woi_world`.`smart_scripts`.`event_type` = 77) then 'SMART_EVENT_COUNTER_SET' when (`dev_woi_world`.`smart_scripts`.`event_type` = 78) then 'SMART_EVENT_SCENE_START' when (`dev_woi_world`.`smart_scripts`.`event_type` = 79) then 'SMART_EVENT_SCENE_TRIGGER' when (`dev_woi_world`.`smart_scripts`.`event_type` = 80) then 'SMART_EVENT_SCENE_CANCEL' when (`dev_woi_world`.`smart_scripts`.`event_type` = 81) then 'SMART_EVENT_SCENE_COMPLETE' when (`dev_woi_world`.`smart_scripts`.`event_type` = 82) then 'SMART_EVENT_SUMMONED_UNIT_DIES' else `dev_woi_world`.`smart_scripts`.`event_type` end) AS `event_type`,`dev_woi_world`.`smart_scripts`.`event_phase_mask` AS `event_phase_mask`,`dev_woi_world`.`smart_scripts`.`event_chance` AS `event_chance`,`dev_woi_world`.`smart_scripts`.`event_flags` AS `event_flags`,`dev_woi_world`.`smart_scripts`.`event_param1` AS `event_param1`,`dev_woi_world`.`smart_scripts`.`event_param2` AS `event_param2`,`dev_woi_world`.`smart_scripts`.`event_param3` AS `event_param3`,`dev_woi_world`.`smart_scripts`.`event_param4` AS `event_param4`,`dev_woi_world`.`smart_scripts`.`event_param5` AS `event_param5`,(case when (`dev_woi_world`.`smart_scripts`.`action_type` = 0) then 'SMART_ACTION_NONE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 1) then 'SMART_ACTION_TALK' when (`dev_woi_world`.`smart_scripts`.`action_type` = 2) then 'SMART_ACTION_SET_FACTION' when (`dev_woi_world`.`smart_scripts`.`action_type` = 3) then 'SMART_ACTION_MORPH_TO_ENTRY_OR_MODEL' when (`dev_woi_world`.`smart_scripts`.`action_type` = 4) then 'SMART_ACTION_SOUND' when (`dev_woi_world`.`smart_scripts`.`action_type` = 5) then 'SMART_ACTION_PLAY_EMOTE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 6) then 'SMART_ACTION_FAIL_QUEST' when (`dev_woi_world`.`smart_scripts`.`action_type` = 7) then 'SMART_ACTION_OFFER_QUEST' when (`dev_woi_world`.`smart_scripts`.`action_type` = 8) then 'SMART_ACTION_SET_REACT_STATE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 9) then 'SMART_ACTION_ACTIVATE_GOBJECT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 10) then 'SMART_ACTION_RANDOM_EMOTE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 11) then 'SMART_ACTION_CAST' when (`dev_woi_world`.`smart_scripts`.`action_type` = 12) then 'SMART_ACTION_SUMMON_CREATURE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 13) then 'SMART_ACTION_THREAT_SINGLE_PCT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 14) then 'SMART_ACTION_THREAT_ALL_PCT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 15) then 'SMART_ACTION_CALL_AREAEXPLOREDOREVENTHAPPENS' when (`dev_woi_world`.`smart_scripts`.`action_type` = 16) then 'SMART_ACTION_RESERVED_16' when (`dev_woi_world`.`smart_scripts`.`action_type` = 17) then 'SMART_ACTION_SET_EMOTE_STATE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 18) then 'SMART_ACTION_SET_UNIT_FLAG' when (`dev_woi_world`.`smart_scripts`.`action_type` = 19) then 'SMART_ACTION_REMOVE_UNIT_FLAG' when (`dev_woi_world`.`smart_scripts`.`action_type` = 20) then 'SMART_ACTION_AUTO_ATTACK' when (`dev_woi_world`.`smart_scripts`.`action_type` = 21) then 'SMART_ACTION_ALLOW_COMBAT_MOVEMENT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 22) then 'SMART_ACTION_SET_EVENT_PHASE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 23) then 'SMART_ACTION_INC_EVENT_PHASE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 24) then 'SMART_ACTION_EVADE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 25) then 'SMART_ACTION_FLEE_FOR_ASSIST' when (`dev_woi_world`.`smart_scripts`.`action_type` = 26) then 'SMART_ACTION_CALL_GROUPEVENTHAPPENS' when (`dev_woi_world`.`smart_scripts`.`action_type` = 27) then 'SMART_ACTION_COMBAT_STOP' when (`dev_woi_world`.`smart_scripts`.`action_type` = 28) then 'SMART_ACTION_REMOVEAURASFROMSPELL' when (`dev_woi_world`.`smart_scripts`.`action_type` = 29) then 'SMART_ACTION_FOLLOW' when (`dev_woi_world`.`smart_scripts`.`action_type` = 30) then 'SMART_ACTION_RANDOM_PHASE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 31) then 'SMART_ACTION_RANDOM_PHASE_RANGE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 32) then 'SMART_ACTION_RESET_GOBJECT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 33) then 'SMART_ACTION_CALL_KILLEDMONSTER' when (`dev_woi_world`.`smart_scripts`.`action_type` = 34) then 'SMART_ACTION_SET_INST_DATA' when (`dev_woi_world`.`smart_scripts`.`action_type` = 35) then 'SMART_ACTION_SET_INST_DATA64' when (`dev_woi_world`.`smart_scripts`.`action_type` = 36) then 'SMART_ACTION_UPDATE_TEMPLATE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 37) then 'SMART_ACTION_DIE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 38) then 'SMART_ACTION_SET_IN_COMBAT_WITH_ZONE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 39) then 'SMART_ACTION_CALL_FOR_HELP' when (`dev_woi_world`.`smart_scripts`.`action_type` = 40) then 'SMART_ACTION_SET_SHEATH' when (`dev_woi_world`.`smart_scripts`.`action_type` = 41) then 'SMART_ACTION_FORCE_DESPAWN' when (`dev_woi_world`.`smart_scripts`.`action_type` = 42) then 'SMART_ACTION_SET_INVINCIBILITY_HP_LEVEL' when (`dev_woi_world`.`smart_scripts`.`action_type` = 43) then 'SMART_ACTION_MOUNT_TO_ENTRY_OR_MODEL' when (`dev_woi_world`.`smart_scripts`.`action_type` = 44) then 'SMART_ACTION_SET_INGAME_PHASE_MASK' when (`dev_woi_world`.`smart_scripts`.`action_type` = 45) then 'SMART_ACTION_SET_DATA' when (`dev_woi_world`.`smart_scripts`.`action_type` = 46) then 'SMART_ACTION_ATTACK_STOP' when (`dev_woi_world`.`smart_scripts`.`action_type` = 47) then 'SMART_ACTION_SET_VISIBILITY' when (`dev_woi_world`.`smart_scripts`.`action_type` = 48) then 'SMART_ACTION_SET_ACTIVE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 49) then 'SMART_ACTION_ATTACK_START' when (`dev_woi_world`.`smart_scripts`.`action_type` = 50) then 'SMART_ACTION_SUMMON_GO' when (`dev_woi_world`.`smart_scripts`.`action_type` = 51) then 'SMART_ACTION_KILL_UNIT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 52) then 'SMART_ACTION_ACTIVATE_TAXI' when (`dev_woi_world`.`smart_scripts`.`action_type` = 53) then 'SMART_ACTION_WP_START' when (`dev_woi_world`.`smart_scripts`.`action_type` = 54) then 'SMART_ACTION_WP_PAUSE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 55) then 'SMART_ACTION_WP_STOP' when (`dev_woi_world`.`smart_scripts`.`action_type` = 56) then 'SMART_ACTION_ADD_ITEM' when (`dev_woi_world`.`smart_scripts`.`action_type` = 57) then 'SMART_ACTION_REMOVE_ITEM' when (`dev_woi_world`.`smart_scripts`.`action_type` = 58) then 'SMART_ACTION_INSTALL_AI_TEMPLATE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 59) then 'SMART_ACTION_SET_RUN' when (`dev_woi_world`.`smart_scripts`.`action_type` = 60) then 'SMART_ACTION_SET_DISABLE_GRAVITY' when (`dev_woi_world`.`smart_scripts`.`action_type` = 61) then 'SMART_ACTION_SET_SWIM' when (`dev_woi_world`.`smart_scripts`.`action_type` = 62) then 'SMART_ACTION_TELEPORT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 63) then 'SMART_ACTION_SET_COUNTER' when (`dev_woi_world`.`smart_scripts`.`action_type` = 64) then 'SMART_ACTION_STORE_TARGET_LIST' when (`dev_woi_world`.`smart_scripts`.`action_type` = 65) then 'SMART_ACTION_WP_RESUME' when (`dev_woi_world`.`smart_scripts`.`action_type` = 66) then 'SMART_ACTION_SET_ORIENTATION' when (`dev_woi_world`.`smart_scripts`.`action_type` = 67) then 'SMART_ACTION_CREATE_TIMED_EVENT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 68) then 'SMART_ACTION_PLAYMOVIE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 69) then 'SMART_ACTION_MOVE_TO_POS' when (`dev_woi_world`.`smart_scripts`.`action_type` = 70) then 'SMART_ACTION_ENABLE_TEMP_GOBJ' when (`dev_woi_world`.`smart_scripts`.`action_type` = 71) then 'SMART_ACTION_EQUIP' when (`dev_woi_world`.`smart_scripts`.`action_type` = 72) then 'SMART_ACTION_CLOSE_GOSSIP' when (`dev_woi_world`.`smart_scripts`.`action_type` = 73) then 'SMART_ACTION_TRIGGER_TIMED_EVENT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 74) then 'SMART_ACTION_REMOVE_TIMED_EVENT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 75) then 'SMART_ACTION_ADD_AURA' when (`dev_woi_world`.`smart_scripts`.`action_type` = 76) then 'SMART_ACTION_OVERRIDE_SCRIPT_BASE_OBJECT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 77) then 'SMART_ACTION_RESET_SCRIPT_BASE_OBJECT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 78) then 'SMART_ACTION_CALL_SCRIPT_RESET' when (`dev_woi_world`.`smart_scripts`.`action_type` = 79) then 'SMART_ACTION_SET_RANGED_MOVEMENT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 80) then 'SMART_ACTION_CALL_TIMED_ACTIONLIST' when (`dev_woi_world`.`smart_scripts`.`action_type` = 81) then 'SMART_ACTION_SET_NPC_FLAG' when (`dev_woi_world`.`smart_scripts`.`action_type` = 82) then 'SMART_ACTION_ADD_NPC_FLAG' when (`dev_woi_world`.`smart_scripts`.`action_type` = 83) then 'SMART_ACTION_REMOVE_NPC_FLAG' when (`dev_woi_world`.`smart_scripts`.`action_type` = 84) then 'SMART_ACTION_SIMPLE_TALK' when (`dev_woi_world`.`smart_scripts`.`action_type` = 85) then 'SMART_ACTION_SELF_CAST' when (`dev_woi_world`.`smart_scripts`.`action_type` = 86) then 'SMART_ACTION_CROSS_CAST' when (`dev_woi_world`.`smart_scripts`.`action_type` = 87) then 'SMART_ACTION_CALL_RANDOM_TIMED_ACTIONLIST' when (`dev_woi_world`.`smart_scripts`.`action_type` = 88) then 'SMART_ACTION_CALL_RANDOM_RANGE_TIMED_ACTIONLIST' when (`dev_woi_world`.`smart_scripts`.`action_type` = 89) then 'SMART_ACTION_RANDOM_MOVE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 90) then 'SMART_ACTION_SET_UNIT_FIELD_BYTES_1' when (`dev_woi_world`.`smart_scripts`.`action_type` = 91) then 'SMART_ACTION_REMOVE_UNIT_FIELD_BYTES_1' when (`dev_woi_world`.`smart_scripts`.`action_type` = 92) then 'SMART_ACTION_INTERRUPT_SPELL' when (`dev_woi_world`.`smart_scripts`.`action_type` = 93) then 'SMART_ACTION_SEND_GO_CUSTOM_ANIM' when (`dev_woi_world`.`smart_scripts`.`action_type` = 94) then 'SMART_ACTION_SET_DYNAMIC_FLAG' when (`dev_woi_world`.`smart_scripts`.`action_type` = 95) then 'SMART_ACTION_ADD_DYNAMIC_FLAG' when (`dev_woi_world`.`smart_scripts`.`action_type` = 96) then 'SMART_ACTION_REMOVE_DYNAMIC_FLAG' when (`dev_woi_world`.`smart_scripts`.`action_type` = 97) then 'SMART_ACTION_JUMP_TO_POS' when (`dev_woi_world`.`smart_scripts`.`action_type` = 98) then 'SMART_ACTION_SEND_GOSSIP_MENU' when (`dev_woi_world`.`smart_scripts`.`action_type` = 99) then 'SMART_ACTION_GO_SET_LOOT_STATE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 100) then 'SMART_ACTION_SEND_TARGET_TO_TARGET' when (`dev_woi_world`.`smart_scripts`.`action_type` = 101) then 'SMART_ACTION_SET_HOME_POS' when (`dev_woi_world`.`smart_scripts`.`action_type` = 102) then 'SMART_ACTION_SET_HEALTH_REGEN' when (`dev_woi_world`.`smart_scripts`.`action_type` = 103) then 'SMART_ACTION_SET_ROOT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 104) then 'SMART_ACTION_SET_GO_FLAG' when (`dev_woi_world`.`smart_scripts`.`action_type` = 105) then 'SMART_ACTION_ADD_GO_FLAG' when (`dev_woi_world`.`smart_scripts`.`action_type` = 106) then 'SMART_ACTION_REMOVE_GO_FLAG' when (`dev_woi_world`.`smart_scripts`.`action_type` = 107) then 'SMART_ACTION_SUMMON_CREATURE_GROUP' when (`dev_woi_world`.`smart_scripts`.`action_type` = 108) then 'SMART_ACTION_SET_POWER' when (`dev_woi_world`.`smart_scripts`.`action_type` = 109) then 'SMART_ACTION_ADD_POWER' when (`dev_woi_world`.`smart_scripts`.`action_type` = 110) then 'SMART_ACTION_REMOVE_POWER' when (`dev_woi_world`.`smart_scripts`.`action_type` = 111) then 'SMART_ACTION_GAME_EVENT_STOP' when (`dev_woi_world`.`smart_scripts`.`action_type` = 112) then 'SMART_ACTION_GAME_EVENT_START' when (`dev_woi_world`.`smart_scripts`.`action_type` = 113) then 'SMART_ACTION_START_CLOSEST_WAYPOINT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 114) then 'SMART_ACTION_MOVE_OFFSET' when (`dev_woi_world`.`smart_scripts`.`action_type` = 115) then 'SMART_ACTION_RANDOM_SOUND' when (`dev_woi_world`.`smart_scripts`.`action_type` = 116) then 'SMART_ACTION_SET_CORPSE_DELAY' when (`dev_woi_world`.`smart_scripts`.`action_type` = 117) then 'SMART_ACTION_DISABLE_EVADE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 118) then 'SMART_ACTION_GO_SET_GO_STATE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 119) then 'SMART_ACTION_SET_CAN_FLY' when (`dev_woi_world`.`smart_scripts`.`action_type` = 120) then 'SMART_ACTION_REMOVE_AURAS_BY_TYPE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 121) then 'SMART_ACTION_SET_SIGHT_DIST' when (`dev_woi_world`.`smart_scripts`.`action_type` = 122) then 'SMART_ACTION_FLEE' when (`dev_woi_world`.`smart_scripts`.`action_type` = 123) then 'SMART_ACTION_ADD_THREAT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 124) then 'SMART_ACTION_LOAD_EQUIPMENT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 125) then 'SMART_ACTION_TRIGGER_RANDOM_TIMED_EVENT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 126) then 'SMART_ACTION_REMOVE_ALL_GAMEOBJECTS' when (`dev_woi_world`.`smart_scripts`.`action_type` = 127) then 'SMART_ACTION_PAUSE_MOVEMENT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 128) then 'SMART_ACTION_PLAY_ANIMKIT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 129) then 'SMART_ACTION_SCENE_PLAY' when (`dev_woi_world`.`smart_scripts`.`action_type` = 130) then 'SMART_ACTION_SCENE_CANCEL' when (`dev_woi_world`.`smart_scripts`.`action_type` = 131) then 'SMART_ACTION_SPAWN_SPAWNGROUP' when (`dev_woi_world`.`smart_scripts`.`action_type` = 132) then 'SMART_ACTION_DESPAWN_SPAWNGROUP' when (`dev_woi_world`.`smart_scripts`.`action_type` = 133) then 'SMART_ACTION_RESPAWN_BY_SPAWNID' when (`dev_woi_world`.`smart_scripts`.`action_type` = 134) then 'SMART_ACTION_INVOKER_CAST' when (`dev_woi_world`.`smart_scripts`.`action_type` = 135) then 'SMART_ACTION_PLAY_CINEMATIC' when (`dev_woi_world`.`smart_scripts`.`action_type` = 136) then 'SMART_ACTION_SET_MOVEMENT_SPEED' when (`dev_woi_world`.`smart_scripts`.`action_type` = 137) then 'SMART_ACTION_PLAY_SPELL_VISUAL_KIT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 138) then 'SMART_ACTION_OVERRIDE_LIGHT' when (`dev_woi_world`.`smart_scripts`.`action_type` = 139) then 'SMART_ACTION_OVERRIDE_WEATHER' else `dev_woi_world`.`smart_scripts`.`action_type` end) AS `action_type`,`dev_woi_world`.`smart_scripts`.`action_param1` AS `action_param1`,`dev_woi_world`.`smart_scripts`.`action_param2` AS `action_param2`,`dev_woi_world`.`smart_scripts`.`action_param3` AS `action_param3`,`dev_woi_world`.`smart_scripts`.`action_param4` AS `action_param4`,`dev_woi_world`.`smart_scripts`.`action_param5` AS `action_param5`,`dev_woi_world`.`smart_scripts`.`action_param6` AS `action_param6`,(case when (`dev_woi_world`.`smart_scripts`.`target_type` = 0) then 'SMART_TARGET_NONE' when (`dev_woi_world`.`smart_scripts`.`target_type` = 1) then 'SMART_TARGET_SELF' when (`dev_woi_world`.`smart_scripts`.`target_type` = 2) then 'SMART_TARGET_VICTIM' when (`dev_woi_world`.`smart_scripts`.`target_type` = 3) then 'SMART_TARGET_HOSTILE_SECOND_AGGRO' when (`dev_woi_world`.`smart_scripts`.`target_type` = 4) then 'SMART_TARGET_HOSTILE_LAST_AGGRO' when (`dev_woi_world`.`smart_scripts`.`target_type` = 5) then 'SMART_TARGET_HOSTILE_RANDOM' when (`dev_woi_world`.`smart_scripts`.`target_type` = 6) then 'SMART_TARGET_HOSTILE_RANDOM_NOT_TOP' when (`dev_woi_world`.`smart_scripts`.`target_type` = 7) then 'SMART_TARGET_ACTION_INVOKER' when (`dev_woi_world`.`smart_scripts`.`target_type` = 8) then 'SMART_TARGET_POSITION' when (`dev_woi_world`.`smart_scripts`.`target_type` = 9) then 'SMART_TARGET_CREATURE_RANGE' when (`dev_woi_world`.`smart_scripts`.`target_type` = 10) then 'SMART_TARGET_CREATURE_GUID' when (`dev_woi_world`.`smart_scripts`.`target_type` = 11) then 'SMART_TARGET_CREATURE_DISTANCE' when (`dev_woi_world`.`smart_scripts`.`target_type` = 12) then 'SMART_TARGET_STORED' when (`dev_woi_world`.`smart_scripts`.`target_type` = 13) then 'SMART_TARGET_GAMEOBJECT_RANGE' when (`dev_woi_world`.`smart_scripts`.`target_type` = 14) then 'SMART_TARGET_GAMEOBJECT_GUID' when (`dev_woi_world`.`smart_scripts`.`target_type` = 15) then 'SMART_TARGET_GAMEOBJECT_DISTANCE' when (`dev_woi_world`.`smart_scripts`.`target_type` = 16) then 'SMART_TARGET_INVOKER_PARTY' when (`dev_woi_world`.`smart_scripts`.`target_type` = 17) then 'SMART_TARGET_PLAYER_RANGE' when (`dev_woi_world`.`smart_scripts`.`target_type` = 18) then 'SMART_TARGET_PLAYER_DISTANCE' when (`dev_woi_world`.`smart_scripts`.`target_type` = 19) then 'SMART_TARGET_CLOSEST_CREATURE' when (`dev_woi_world`.`smart_scripts`.`target_type` = 20) then 'SMART_TARGET_CLOSEST_GAMEOBJECT' when (`dev_woi_world`.`smart_scripts`.`target_type` = 21) then 'SMART_TARGET_CLOSEST_PLAYER' when (`dev_woi_world`.`smart_scripts`.`target_type` = 22) then 'SMART_TARGET_ACTION_INVOKER_VEHICLE' when (`dev_woi_world`.`smart_scripts`.`target_type` = 23) then 'SMART_TARGET_OWNER_OR_SUMMONER' when (`dev_woi_world`.`smart_scripts`.`target_type` = 24) then 'SMART_TARGET_THREAT_LIST' when (`dev_woi_world`.`smart_scripts`.`target_type` = 25) then 'SMART_TARGET_CLOSEST_ENEMY' when (`dev_woi_world`.`smart_scripts`.`target_type` = 26) then 'SMART_TARGET_CLOSEST_FRIENDLY' when (`dev_woi_world`.`smart_scripts`.`target_type` = 27) then 'SMART_TARGET_LOOT_RECIPIENTS' when (`dev_woi_world`.`smart_scripts`.`target_type` = 28) then 'SMART_TARGET_FARTHEST' when (`dev_woi_world`.`smart_scripts`.`target_type` = 29) then 'SMART_TARGET_VEHICLE_PASSENGER' when (`dev_woi_world`.`smart_scripts`.`target_type` = 30) then 'SMART_TARGET_CLOSEST_UNSPAWNED_GAMEOBJECT' else `dev_woi_world`.`smart_scripts`.`target_type` end) AS `target_type`,`dev_woi_world`.`smart_scripts`.`target_param1` AS `target_param1`,`dev_woi_world`.`smart_scripts`.`target_param2` AS `target_param2`,`dev_woi_world`.`smart_scripts`.`target_param3` AS `target_param3`,`dev_woi_world`.`smart_scripts`.`target_param4` AS `target_param4`,`dev_woi_world`.`smart_scripts`.`target_x` AS `target_x`,`dev_woi_world`.`smart_scripts`.`target_y` AS `target_y`,`dev_woi_world`.`smart_scripts`.`target_z` AS `target_z`,`dev_woi_world`.`smart_scripts`.`target_o` AS `target_o`,`dev_woi_world`.`smart_scripts`.`comment` AS `comment` from `dev_woi_world`.`smart_scripts`
;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
