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

-- Dumping structure for table woi_world.access_requirement
CREATE TABLE IF NOT EXISTS `access_requirement` (
  `mapId` mediumint unsigned NOT NULL,
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `level_min` tinyint unsigned NOT NULL DEFAULT '0',
  `level_max` tinyint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `item2` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_done_A` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_done_H` mediumint unsigned NOT NULL DEFAULT '0',
  `completed_achievement` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_failed_text` text,
  `comment` text,
  PRIMARY KEY (`mapId`,`difficulty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Access Requirements';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.achievement_criteria_data
CREATE TABLE IF NOT EXISTS `achievement_criteria_data` (
  `criteria_id` mediumint NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `value1` mediumint unsigned NOT NULL DEFAULT '0',
  `value2` mediumint unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`criteria_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Achievment system';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.achievement_reward
CREATE TABLE IF NOT EXISTS `achievement_reward` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `title_A` mediumint unsigned NOT NULL DEFAULT '0',
  `title_H` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `sender` mediumint unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.areatrigger_involvedrelation
CREATE TABLE IF NOT EXISTS `areatrigger_involvedrelation` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.areatrigger_scripts
CREATE TABLE IF NOT EXISTS `areatrigger_scripts` (
  `entry` mediumint NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.areatrigger_tavern
CREATE TABLE IF NOT EXISTS `areatrigger_tavern` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.areatrigger_teleport
CREATE TABLE IF NOT EXISTS `areatrigger_teleport` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  `target_map` smallint unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.autobroadcast
CREATE TABLE IF NOT EXISTS `autobroadcast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.battleground_template
CREATE TABLE IF NOT EXISTS `battleground_template` (
  `id` mediumint unsigned NOT NULL,
  `MinPlayersPerTeam` smallint unsigned NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint unsigned NOT NULL DEFAULT '0',
  `MinLvl` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxLvl` tinyint unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` mediumint unsigned NOT NULL,
  `AllianceStartO` float NOT NULL,
  `HordeStartLoc` mediumint unsigned NOT NULL,
  `HordeStartO` float NOT NULL,
  `Weight` tinyint unsigned NOT NULL DEFAULT '1',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `Comment` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.battlemaster_entry
CREATE TABLE IF NOT EXISTS `battlemaster_entry` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.command
CREATE TABLE IF NOT EXISTS `command` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `security` tinyint unsigned NOT NULL DEFAULT '0',
  `help` longtext,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Chat System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.conditions
CREATE TABLE IF NOT EXISTS `conditions` (
  `SourceTypeOrReferenceId` mediumint NOT NULL DEFAULT '0',
  `SourceGroup` mediumint unsigned NOT NULL DEFAULT '0',
  `SourceEntry` mediumint unsigned NOT NULL DEFAULT '0',
  `ElseGroup` mediumint unsigned NOT NULL DEFAULT '0',
  `ConditionTypeOrReference` mediumint NOT NULL DEFAULT '0',
  `ConditionValue1` mediumint unsigned NOT NULL DEFAULT '0',
  `ConditionValue2` mediumint unsigned NOT NULL DEFAULT '0',
  `ConditionValue3` mediumint unsigned NOT NULL DEFAULT '0',
  `ErrorTextId` mediumint unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Condition System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature
CREATE TABLE IF NOT EXISTS `creature` (
  `guid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `spawnMask` tinyint unsigned NOT NULL DEFAULT '1',
  `phaseMask` smallint unsigned NOT NULL DEFAULT '1',
  `modelid` mediumint unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int unsigned NOT NULL DEFAULT '120',
  `spawndist` float NOT NULL DEFAULT '0',
  `currentwaypoint` mediumint unsigned NOT NULL DEFAULT '0',
  `curhealth` int unsigned NOT NULL DEFAULT '1',
  `curmana` int unsigned NOT NULL DEFAULT '0',
  `DeathState` tinyint unsigned NOT NULL DEFAULT '0',
  `MovementType` tinyint unsigned NOT NULL DEFAULT '0',
  `npcflag` int unsigned NOT NULL DEFAULT '0',
  `unit_flags` int unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9977988 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Creature System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_addon
CREATE TABLE IF NOT EXISTS `creature_addon` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `path_id` int unsigned NOT NULL DEFAULT '0',
  `mount` mediumint unsigned NOT NULL DEFAULT '0',
  `bytes1` int unsigned NOT NULL DEFAULT '0',
  `bytes2` int unsigned NOT NULL DEFAULT '0',
  `emote` int unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_ai_scripts
CREATE TABLE IF NOT EXISTS `creature_ai_scripts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `creature_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Template Identifier',
  `event_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type',
  `event_inverse_phase_mask` int NOT NULL DEFAULT '0' COMMENT 'Mask which phases this event will not trigger in',
  `event_chance` int unsigned NOT NULL DEFAULT '100',
  `event_flags` int unsigned NOT NULL DEFAULT '0',
  `event_param1` int NOT NULL DEFAULT '0',
  `event_param2` int NOT NULL DEFAULT '0',
  `event_param3` int NOT NULL DEFAULT '0',
  `event_param4` int NOT NULL DEFAULT '0',
  `action1_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action1_param1` int NOT NULL DEFAULT '0',
  `action1_param2` int NOT NULL DEFAULT '0',
  `action1_param3` int NOT NULL DEFAULT '0',
  `action2_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action2_param1` int NOT NULL DEFAULT '0',
  `action2_param2` int NOT NULL DEFAULT '0',
  `action2_param3` int NOT NULL DEFAULT '0',
  `action3_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action3_param1` int NOT NULL DEFAULT '0',
  `action3_param2` int NOT NULL DEFAULT '0',
  `action3_param3` int NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Event Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28256004 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='EventAI Scripts';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_ai_summons
CREATE TABLE IF NOT EXISTS `creature_ai_summons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Location Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int unsigned NOT NULL DEFAULT '120',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Summon Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='EventAI Summoning Locations';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_ai_texts
CREATE TABLE IF NOT EXISTS `creature_ai_texts` (
  `entry` mediumint NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `language` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` smallint unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Script Texts';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_classlevelstats
CREATE TABLE IF NOT EXISTS `creature_classlevelstats` (
  `level` tinyint(1) NOT NULL,
  `class` tinyint(1) NOT NULL,
  `basehp0` smallint NOT NULL,
  `basehp1` smallint NOT NULL,
  `basehp2` smallint NOT NULL,
  `basemana` smallint NOT NULL,
  `basearmor` smallint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_equip_template
CREATE TABLE IF NOT EXISTS `creature_equip_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Unique entry',
  `equipentry1` mediumint unsigned NOT NULL DEFAULT '0',
  `equipentry2` mediumint unsigned NOT NULL DEFAULT '0',
  `equipentry3` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Creature System (Equipment)';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_formations
CREATE TABLE IF NOT EXISTS `creature_formations` (
  `leaderGUID` int unsigned NOT NULL,
  `memberGUID` int unsigned NOT NULL,
  `dist` float unsigned NOT NULL,
  `angle` float unsigned NOT NULL,
  `groupAI` int unsigned NOT NULL,
  PRIMARY KEY (`memberGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_involvedrelation
CREATE TABLE IF NOT EXISTS `creature_involvedrelation` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_loot_template
CREATE TABLE IF NOT EXISTS `creature_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_model_info
CREATE TABLE IF NOT EXISTS `creature_model_info` (
  `modelid` mediumint unsigned NOT NULL DEFAULT '0',
  `bounding_radius` float NOT NULL DEFAULT '0',
  `combat_reach` float NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '2',
  `modelid_other_gender` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`modelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Creature System (Model related info)';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_onkill_reputation
CREATE TABLE IF NOT EXISTS `creature_onkill_reputation` (
  `creature_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` mediumint NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` mediumint NOT NULL DEFAULT '0',
  `TeamDependent` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Creature OnKill Reputation gain';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_questrelation
CREATE TABLE IF NOT EXISTS `creature_questrelation` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_template
CREATE TABLE IF NOT EXISTS `creature_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_1` mediumint unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_2` mediumint unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_3` mediumint unsigned NOT NULL DEFAULT '0',
  `KillCredit1` int unsigned NOT NULL DEFAULT '0',
  `KillCredit2` int unsigned NOT NULL DEFAULT '0',
  `modelid1` mediumint unsigned NOT NULL DEFAULT '0',
  `modelid2` mediumint unsigned NOT NULL DEFAULT '0',
  `modelid3` mediumint unsigned NOT NULL DEFAULT '0',
  `modelid4` mediumint unsigned NOT NULL DEFAULT '0',
  `name` char(100) NOT NULL DEFAULT '0',
  `subname` char(100) DEFAULT NULL,
  `IconName` char(100) DEFAULT NULL,
  `gossip_menu_id` mediumint unsigned NOT NULL DEFAULT '0',
  `minlevel` tinyint unsigned NOT NULL DEFAULT '1',
  `maxlevel` tinyint unsigned NOT NULL DEFAULT '1',
  `exp` smallint NOT NULL DEFAULT '0',
  `faction_A` smallint unsigned NOT NULL DEFAULT '0',
  `faction_H` smallint unsigned NOT NULL DEFAULT '0',
  `npcflag` int unsigned NOT NULL DEFAULT '0',
  `speed_walk` float NOT NULL DEFAULT '1' COMMENT 'Result of 2.5/2.5, most common value',
  `speed_run` float NOT NULL DEFAULT '1.14286' COMMENT 'Result of 8.0/7.0, most common value',
  `scale` float NOT NULL DEFAULT '1',
  `rank` tinyint unsigned NOT NULL DEFAULT '0',
  `mindmg` float NOT NULL DEFAULT '0',
  `maxdmg` float NOT NULL DEFAULT '0',
  `dmgschool` tinyint NOT NULL DEFAULT '0',
  `attackpower` int unsigned NOT NULL DEFAULT '0',
  `dmg_multiplier` float NOT NULL DEFAULT '1',
  `baseattacktime` int unsigned NOT NULL DEFAULT '0',
  `rangeattacktime` int unsigned NOT NULL DEFAULT '0',
  `unit_class` tinyint unsigned NOT NULL DEFAULT '0',
  `unit_flags` int unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int unsigned NOT NULL DEFAULT '0',
  `family` tinyint NOT NULL DEFAULT '0',
  `trainer_type` tinyint NOT NULL DEFAULT '0',
  `trainer_spell` mediumint unsigned NOT NULL DEFAULT '0',
  `trainer_class` tinyint unsigned NOT NULL DEFAULT '0',
  `trainer_race` tinyint unsigned NOT NULL DEFAULT '0',
  `minrangedmg` float NOT NULL DEFAULT '0',
  `maxrangedmg` float NOT NULL DEFAULT '0',
  `rangedattackpower` smallint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `type_flags` int unsigned NOT NULL DEFAULT '0',
  `lootid` mediumint unsigned NOT NULL DEFAULT '0',
  `pickpocketloot` mediumint unsigned NOT NULL DEFAULT '0',
  `skinloot` mediumint unsigned NOT NULL DEFAULT '0',
  `resistance1` smallint NOT NULL DEFAULT '0',
  `resistance2` smallint NOT NULL DEFAULT '0',
  `resistance3` smallint NOT NULL DEFAULT '0',
  `resistance4` smallint NOT NULL DEFAULT '0',
  `resistance5` smallint NOT NULL DEFAULT '0',
  `resistance6` smallint NOT NULL DEFAULT '0',
  `spell1` mediumint unsigned NOT NULL DEFAULT '0',
  `spell2` mediumint unsigned NOT NULL DEFAULT '0',
  `spell3` mediumint unsigned NOT NULL DEFAULT '0',
  `spell4` mediumint unsigned NOT NULL DEFAULT '0',
  `spell5` mediumint unsigned NOT NULL DEFAULT '0',
  `spell6` mediumint unsigned NOT NULL DEFAULT '0',
  `spell7` mediumint unsigned NOT NULL DEFAULT '0',
  `spell8` mediumint unsigned NOT NULL DEFAULT '0',
  `PetSpellDataId` mediumint unsigned NOT NULL DEFAULT '0',
  `VehicleId` mediumint unsigned NOT NULL DEFAULT '0',
  `mingold` mediumint unsigned NOT NULL DEFAULT '0',
  `maxgold` mediumint unsigned NOT NULL DEFAULT '0',
  `AIName` char(64) NOT NULL DEFAULT '',
  `MovementType` tinyint unsigned NOT NULL DEFAULT '0',
  `InhabitType` tinyint unsigned NOT NULL DEFAULT '3',
  `Health_mod` float NOT NULL DEFAULT '1',
  `Mana_mod` float NOT NULL DEFAULT '1',
  `Armor_mod` float NOT NULL DEFAULT '1',
  `RacialLeader` tinyint unsigned NOT NULL DEFAULT '0',
  `questItem1` int unsigned NOT NULL DEFAULT '0',
  `questItem2` int unsigned NOT NULL DEFAULT '0',
  `questItem3` int unsigned NOT NULL DEFAULT '0',
  `questItem4` int unsigned NOT NULL DEFAULT '0',
  `questItem5` int unsigned NOT NULL DEFAULT '0',
  `questItem6` int unsigned NOT NULL DEFAULT '0',
  `movementId` int unsigned NOT NULL DEFAULT '0',
  `RegenHealth` tinyint unsigned NOT NULL DEFAULT '1',
  `equipment_id` mediumint unsigned NOT NULL DEFAULT '0',
  `mechanic_immune_mask` int unsigned NOT NULL DEFAULT '0',
  `flags_extra` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `WDBVerified` smallint DEFAULT '1',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_template_addon
CREATE TABLE IF NOT EXISTS `creature_template_addon` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `path_id` int unsigned NOT NULL DEFAULT '0',
  `mount` mediumint unsigned NOT NULL DEFAULT '0',
  `bytes1` int unsigned NOT NULL DEFAULT '0',
  `bytes2` int unsigned NOT NULL DEFAULT '0',
  `emote` mediumint unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_text
CREATE TABLE IF NOT EXISTS `creature_text` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `id` tinyint unsigned NOT NULL DEFAULT '0',
  `text` longtext,
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `language` tinyint unsigned NOT NULL DEFAULT '0',
  `probability` float NOT NULL DEFAULT '0',
  `emote` mediumint unsigned NOT NULL DEFAULT '0',
  `duration` mediumint unsigned NOT NULL DEFAULT '0',
  `sound` mediumint unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT '',
  PRIMARY KEY (`entry`,`groupid`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.creature_transport
CREATE TABLE IF NOT EXISTS `creature_transport` (
  `guid` int NOT NULL AUTO_INCREMENT COMMENT 'GUID of NPC on transport - not the same as creature.guid',
  `transport_entry` int NOT NULL COMMENT 'Transport entry',
  `npc_entry` int NOT NULL COMMENT 'NPC entry',
  `TransOffsetX` float NOT NULL DEFAULT '0',
  `TransOffsetY` float NOT NULL DEFAULT '0',
  `TransOffsetZ` float NOT NULL DEFAULT '0',
  `TransOffsetO` float NOT NULL DEFAULT '0',
  `emote` int NOT NULL,
  PRIMARY KEY (`transport_entry`,`guid`),
  UNIQUE KEY `entry` (`transport_entry`,`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.custom_texts
CREATE TABLE IF NOT EXISTS `custom_texts` (
  `entry` mediumint NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `language` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` smallint unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Custom Texts';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.db_script_string
CREATE TABLE IF NOT EXISTS `db_script_string` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.disables
CREATE TABLE IF NOT EXISTS `disables` (
  `sourceType` int unsigned NOT NULL,
  `entry` int unsigned NOT NULL,
  `flags` tinyint unsigned NOT NULL DEFAULT '0',
  `params_0` varchar(255) NOT NULL DEFAULT '',
  `params_1` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceType`,`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.disenchant_loot_template
CREATE TABLE IF NOT EXISTS `disenchant_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Recommended id selection: item_level*100 + item_quality',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.donation_items
CREATE TABLE IF NOT EXISTS `donation_items` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `displayid` mediumint unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `requiredspell` mediumint unsigned NOT NULL DEFAULT '0',
  `requiredhonorrank` mediumint unsigned NOT NULL DEFAULT '0',
  `RequiredCityRank` mediumint unsigned NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredReputationRank` smallint unsigned NOT NULL DEFAULT '0',
  `lockid` mediumint unsigned NOT NULL DEFAULT '0',
  `area` mediumint unsigned NOT NULL DEFAULT '0',
  `Map` smallint NOT NULL DEFAULT '0',
  `Duration` int NOT NULL DEFAULT '0' COMMENT 'Duration in seconds. Negative value means realtime, postive value ingame time',
  `HolidayId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.donation_items_copy
CREATE TABLE IF NOT EXISTS `donation_items_copy` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `displayid` mediumint unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `requiredspell` mediumint unsigned NOT NULL DEFAULT '0',
  `requiredhonorrank` mediumint unsigned NOT NULL DEFAULT '0',
  `RequiredCityRank` mediumint unsigned NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredReputationRank` smallint unsigned NOT NULL DEFAULT '0',
  `lockid` mediumint unsigned NOT NULL DEFAULT '0',
  `area` mediumint unsigned NOT NULL DEFAULT '0',
  `Map` smallint NOT NULL DEFAULT '0',
  `Duration` int NOT NULL DEFAULT '0' COMMENT 'Duration in seconds. Negative value means realtime, postive value ingame time',
  `HolidayId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.event_scripts
CREATE TABLE IF NOT EXISTS `event_scripts` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.exploration_basexp
CREATE TABLE IF NOT EXISTS `exploration_basexp` (
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `basexp` mediumint NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Exploration System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.fishing_loot_template
CREATE TABLE IF NOT EXISTS `fishing_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event
CREATE TABLE IF NOT EXISTS `game_event` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint unsigned NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint unsigned NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `holiday` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 if normal event, 1 if world event',
  PRIMARY KEY (`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_arena_seasons
CREATE TABLE IF NOT EXISTS `game_event_arena_seasons` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `season` tinyint unsigned NOT NULL COMMENT 'Arena season number',
  UNIQUE KEY `season` (`season`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_battleground_holiday
CREATE TABLE IF NOT EXISTS `game_event_battleground_holiday` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `bgflag` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_condition
CREATE TABLE IF NOT EXISTS `game_event_condition` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `req_num` float DEFAULT '0',
  `max_world_state_field` smallint unsigned NOT NULL DEFAULT '0',
  `done_world_state_field` smallint unsigned NOT NULL DEFAULT '0',
  `description` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`eventEntry`,`condition_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_creature
CREATE TABLE IF NOT EXISTS `game_event_creature` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` int unsigned NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_creature_quest
CREATE TABLE IF NOT EXISTS `game_event_creature_quest` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event.',
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `quest` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_gameobject
CREATE TABLE IF NOT EXISTS `game_event_gameobject` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` int unsigned NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_gameobject_quest
CREATE TABLE IF NOT EXISTS `game_event_gameobject_quest` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `quest` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_model_equip
CREATE TABLE IF NOT EXISTS `game_event_model_equip` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event.',
  `guid` int unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_npc_vendor
CREATE TABLE IF NOT EXISTS `game_event_npc_vendor` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event.',
  `guid` mediumint unsigned NOT NULL DEFAULT '0',
  `slot` smallint NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `maxcount` mediumint unsigned NOT NULL DEFAULT '0',
  `incrtime` mediumint unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`item`),
  KEY `slot` (`slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_npcflag
CREATE TABLE IF NOT EXISTS `game_event_npcflag` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `guid` mediumint unsigned NOT NULL DEFAULT '0',
  `npcflag` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_pool
CREATE TABLE IF NOT EXISTS `game_event_pool` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `pool_entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Id of the pool',
  PRIMARY KEY (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_prerequisite
CREATE TABLE IF NOT EXISTS `game_event_prerequisite` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `prerequisite_event` mediumint unsigned NOT NULL,
  PRIMARY KEY (`eventEntry`,`prerequisite_event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_event_quest_condition
CREATE TABLE IF NOT EXISTS `game_event_quest_condition` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event.',
  `quest` mediumint unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `num` float DEFAULT '0',
  PRIMARY KEY (`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_graveyard_zone
CREATE TABLE IF NOT EXISTS `game_graveyard_zone` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `ghost_zone` mediumint unsigned NOT NULL DEFAULT '0',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`ghost_zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Trigger System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_tele
CREATE TABLE IF NOT EXISTS `game_tele` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8mb3 COMMENT='Tele Command';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.game_weather
CREATE TABLE IF NOT EXISTS `game_weather` (
  `zone` mediumint unsigned NOT NULL DEFAULT '0',
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
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Weather System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.gameobject
CREATE TABLE IF NOT EXISTS `gameobject` (
  `guid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `spawnMask` tinyint unsigned NOT NULL DEFAULT '1',
  `phaseMask` smallint unsigned NOT NULL DEFAULT '1',
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
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM AUTO_INCREMENT=6406794 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Gameobject System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.gameobject_involvedrelation
CREATE TABLE IF NOT EXISTS `gameobject_involvedrelation` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.gameobject_loot_template
CREATE TABLE IF NOT EXISTS `gameobject_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.gameobject_questrelation
CREATE TABLE IF NOT EXISTS `gameobject_questrelation` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.gameobject_scripts
CREATE TABLE IF NOT EXISTS `gameobject_scripts` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.gameobject_template
CREATE TABLE IF NOT EXISTS `gameobject_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `displayId` mediumint unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `IconName` varchar(100) NOT NULL DEFAULT '',
  `castBarCaption` varchar(100) NOT NULL DEFAULT '',
  `unk1` varchar(100) NOT NULL DEFAULT '',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `size` float NOT NULL DEFAULT '1',
  `questItem1` int unsigned NOT NULL DEFAULT '0',
  `questItem2` int unsigned NOT NULL DEFAULT '0',
  `questItem3` int unsigned NOT NULL DEFAULT '0',
  `questItem4` int unsigned NOT NULL DEFAULT '0',
  `questItem5` int unsigned NOT NULL DEFAULT '0',
  `questItem6` int unsigned NOT NULL DEFAULT '0',
  `data0` int unsigned NOT NULL DEFAULT '0',
  `data1` int NOT NULL DEFAULT '-1',
  `data2` int unsigned NOT NULL DEFAULT '0',
  `data3` int unsigned NOT NULL DEFAULT '0',
  `data4` int unsigned NOT NULL DEFAULT '0',
  `data5` int unsigned NOT NULL DEFAULT '0',
  `data6` int NOT NULL DEFAULT '-1',
  `data7` int unsigned NOT NULL DEFAULT '0',
  `data8` int unsigned NOT NULL DEFAULT '0',
  `data9` int unsigned NOT NULL DEFAULT '0',
  `data10` int unsigned NOT NULL DEFAULT '0',
  `data11` int unsigned NOT NULL DEFAULT '0',
  `data12` int unsigned NOT NULL DEFAULT '0',
  `data13` int unsigned NOT NULL DEFAULT '0',
  `data14` int unsigned NOT NULL DEFAULT '0',
  `data15` int unsigned NOT NULL DEFAULT '0',
  `data16` int unsigned NOT NULL DEFAULT '0',
  `data17` int unsigned NOT NULL DEFAULT '0',
  `data18` int unsigned NOT NULL DEFAULT '0',
  `data19` int unsigned NOT NULL DEFAULT '0',
  `data20` int unsigned NOT NULL DEFAULT '0',
  `data21` int unsigned NOT NULL DEFAULT '0',
  `data22` int unsigned NOT NULL DEFAULT '0',
  `data23` int unsigned NOT NULL DEFAULT '0',
  `AIName` char(64) NOT NULL DEFAULT '',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `WDBVerified` smallint DEFAULT '1',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Gameobject System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.gossip_menu
CREATE TABLE IF NOT EXISTS `gossip_menu` (
  `entry` smallint unsigned NOT NULL DEFAULT '0',
  `text_id` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`text_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.gossip_menu_option
CREATE TABLE IF NOT EXISTS `gossip_menu_option` (
  `menu_id` smallint unsigned NOT NULL DEFAULT '0',
  `id` smallint unsigned NOT NULL DEFAULT '0',
  `option_icon` mediumint unsigned NOT NULL DEFAULT '0',
  `option_text` text,
  `option_id` tinyint unsigned NOT NULL DEFAULT '0',
  `npc_option_npcflag` int unsigned NOT NULL DEFAULT '0',
  `action_menu_id` int unsigned NOT NULL DEFAULT '0',
  `action_poi_id` mediumint unsigned NOT NULL DEFAULT '0',
  `action_script_id` mediumint unsigned NOT NULL DEFAULT '0',
  `box_coded` tinyint unsigned NOT NULL DEFAULT '0',
  `box_money` int unsigned NOT NULL DEFAULT '0',
  `box_text` text,
  PRIMARY KEY (`menu_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.gossip_scripts
CREATE TABLE IF NOT EXISTS `gossip_scripts` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.instance_encounters
CREATE TABLE IF NOT EXISTS `instance_encounters` (
  `entry` int unsigned NOT NULL COMMENT 'Unique entry from DungeonEncounter.dbc',
  `creditType` tinyint unsigned NOT NULL DEFAULT '0',
  `creditEntry` int unsigned NOT NULL DEFAULT '0',
  `lastEncounterDungeon` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'If not 0, LfgDungeon.dbc entry for the instance it is last encounter in',
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.instance_template
CREATE TABLE IF NOT EXISTS `instance_template` (
  `map` smallint unsigned NOT NULL,
  `parent` int unsigned NOT NULL,
  `startLocX` float DEFAULT NULL,
  `startLocY` float DEFAULT NULL,
  `startLocZ` float DEFAULT NULL,
  `startLocO` float DEFAULT NULL,
  `script` varchar(128) NOT NULL DEFAULT '',
  `allowMount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.item_enchantment_template
CREATE TABLE IF NOT EXISTS `item_enchantment_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `ench` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`ench`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Item Random Enchantment System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.item_loot_template
CREATE TABLE IF NOT EXISTS `item_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` smallint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.item_set_names
CREATE TABLE IF NOT EXISTS `item_set_names` (
  `entry` mediumint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `InventoryType` tinyint unsigned NOT NULL DEFAULT '0',
  `WDBVerified` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.item_template
CREATE TABLE IF NOT EXISTS `item_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint unsigned NOT NULL DEFAULT '0',
  `unk0` int NOT NULL DEFAULT '-1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `displayid` mediumint unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` bigint NOT NULL DEFAULT '0',
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
  `requiredspell` mediumint unsigned NOT NULL DEFAULT '0',
  `requiredhonorrank` mediumint unsigned NOT NULL DEFAULT '0',
  `RequiredCityRank` mediumint unsigned NOT NULL DEFAULT '0',
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
  `spellid_1` mediumint NOT NULL DEFAULT '0',
  `spelltrigger_1` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_1` smallint DEFAULT NULL,
  `spellppmRate_1` float NOT NULL DEFAULT '0',
  `spellcooldown_1` int NOT NULL DEFAULT '-1',
  `spellcategory_1` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_1` int NOT NULL DEFAULT '-1',
  `spellid_2` mediumint NOT NULL DEFAULT '0',
  `spelltrigger_2` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_2` smallint DEFAULT NULL,
  `spellppmRate_2` float NOT NULL DEFAULT '0',
  `spellcooldown_2` int NOT NULL DEFAULT '-1',
  `spellcategory_2` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_2` int NOT NULL DEFAULT '-1',
  `spellid_3` mediumint NOT NULL DEFAULT '0',
  `spelltrigger_3` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_3` smallint DEFAULT NULL,
  `spellppmRate_3` float NOT NULL DEFAULT '0',
  `spellcooldown_3` int NOT NULL DEFAULT '-1',
  `spellcategory_3` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_3` int NOT NULL DEFAULT '-1',
  `spellid_4` mediumint NOT NULL DEFAULT '0',
  `spelltrigger_4` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_4` smallint DEFAULT NULL,
  `spellppmRate_4` float NOT NULL DEFAULT '0',
  `spellcooldown_4` int NOT NULL DEFAULT '-1',
  `spellcategory_4` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_4` int NOT NULL DEFAULT '-1',
  `spellid_5` mediumint NOT NULL DEFAULT '0',
  `spelltrigger_5` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_5` smallint DEFAULT NULL,
  `spellppmRate_5` float NOT NULL DEFAULT '0',
  `spellcooldown_5` int NOT NULL DEFAULT '-1',
  `spellcategory_5` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_5` int NOT NULL DEFAULT '-1',
  `bonding` tinyint unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `PageText` mediumint unsigned NOT NULL DEFAULT '0',
  `LanguageID` tinyint unsigned NOT NULL DEFAULT '0',
  `PageMaterial` tinyint unsigned NOT NULL DEFAULT '0',
  `startquest` mediumint unsigned NOT NULL DEFAULT '0',
  `lockid` mediumint unsigned NOT NULL DEFAULT '0',
  `Material` tinyint NOT NULL DEFAULT '0',
  `sheath` tinyint unsigned NOT NULL DEFAULT '0',
  `RandomProperty` mediumint NOT NULL DEFAULT '0',
  `RandomSuffix` mediumint unsigned NOT NULL DEFAULT '0',
  `block` mediumint unsigned NOT NULL DEFAULT '0',
  `itemset` mediumint unsigned NOT NULL DEFAULT '0',
  `MaxDurability` smallint unsigned NOT NULL DEFAULT '0',
  `area` mediumint unsigned NOT NULL DEFAULT '0',
  `Map` smallint NOT NULL DEFAULT '0',
  `BagFamily` mediumint NOT NULL DEFAULT '0',
  `TotemCategory` mediumint NOT NULL DEFAULT '0',
  `socketColor_1` tinyint NOT NULL DEFAULT '0',
  `socketContent_1` mediumint NOT NULL DEFAULT '0',
  `socketColor_2` tinyint NOT NULL DEFAULT '0',
  `socketContent_2` mediumint NOT NULL DEFAULT '0',
  `socketColor_3` tinyint NOT NULL DEFAULT '0',
  `socketContent_3` mediumint NOT NULL DEFAULT '0',
  `socketBonus` mediumint NOT NULL DEFAULT '0',
  `GemProperties` mediumint NOT NULL DEFAULT '0',
  `RequiredDisenchantSkill` smallint NOT NULL DEFAULT '-1',
  `ArmorDamageModifier` float NOT NULL DEFAULT '0',
  `Duration` int NOT NULL DEFAULT '0' COMMENT 'Duration in seconds. Negative value means realtime, postive value ingame time',
  `ItemLimitCategory` smallint NOT NULL DEFAULT '0',
  `HolidayId` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `DisenchantID` mediumint unsigned NOT NULL DEFAULT '0',
  `FoodType` tinyint unsigned NOT NULL DEFAULT '0',
  `minMoneyLoot` int unsigned NOT NULL DEFAULT '0',
  `maxMoneyLoot` int unsigned NOT NULL DEFAULT '0',
  `WDBVerified` smallint DEFAULT '1',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`),
  KEY `items_index` (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Item System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.lfg_dungeon_rewards
CREATE TABLE IF NOT EXISTS `lfg_dungeon_rewards` (
  `dungeonId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Dungeon entry from dbc',
  `maxLevel` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Max level at which this reward is rewarded',
  `firstQuestId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for first dungeon this day',
  `firstMoneyVar` int unsigned NOT NULL DEFAULT '0' COMMENT 'Money multiplier for completing the dungeon first time in a day with less players than max',
  `firstXPVar` int unsigned NOT NULL DEFAULT '0' COMMENT 'Experience multiplier for completing the dungeon first time in a day with less players than max',
  `otherQuestId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for Nth dungeon this day',
  `otherMoneyVar` int unsigned NOT NULL DEFAULT '0' COMMENT 'Money multiplier for completing the dungeon Nth time in a day with less players than max',
  `otherXPVar` int unsigned NOT NULL DEFAULT '0' COMMENT 'Experience multiplier for completing the dungeon Nth time in a day with less players than max',
  PRIMARY KEY (`dungeonId`,`maxLevel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.linked_respawn
CREATE TABLE IF NOT EXISTS `linked_respawn` (
  `guid` int unsigned NOT NULL COMMENT 'dependent creature',
  `linkedGuid` int unsigned NOT NULL COMMENT 'master creature',
  `linkType` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`linkType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Creature Respawn Link System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.locales_achievement_reward
CREATE TABLE IF NOT EXISTS `locales_achievement_reward` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `subject_loc1` varchar(100) NOT NULL DEFAULT '',
  `subject_loc2` varchar(100) NOT NULL DEFAULT '',
  `subject_loc3` varchar(100) NOT NULL DEFAULT '',
  `subject_loc4` varchar(100) NOT NULL DEFAULT '',
  `subject_loc5` varchar(100) NOT NULL DEFAULT '',
  `subject_loc6` varchar(100) NOT NULL DEFAULT '',
  `subject_loc7` varchar(100) NOT NULL DEFAULT '',
  `subject_loc8` varchar(100) NOT NULL DEFAULT '',
  `text_loc1` text,
  `text_loc2` text,
  `text_loc3` text,
  `text_loc4` text,
  `text_loc5` text,
  `text_loc6` text,
  `text_loc7` text,
  `text_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.locales_creature
CREATE TABLE IF NOT EXISTS `locales_creature` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `subname_loc1` varchar(100) DEFAULT NULL,
  `subname_loc2` varchar(100) DEFAULT NULL,
  `subname_loc3` varchar(100) DEFAULT NULL,
  `subname_loc4` varchar(100) DEFAULT NULL,
  `subname_loc5` varchar(100) DEFAULT NULL,
  `subname_loc6` varchar(100) DEFAULT NULL,
  `subname_loc7` varchar(100) DEFAULT NULL,
  `subname_loc8` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.locales_gameobject
CREATE TABLE IF NOT EXISTS `locales_gameobject` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc1` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc2` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc3` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc4` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc5` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc6` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc7` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc8` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.locales_gossip_menu_option
CREATE TABLE IF NOT EXISTS `locales_gossip_menu_option` (
  `menu_id` smallint unsigned NOT NULL DEFAULT '0',
  `id` smallint unsigned NOT NULL DEFAULT '0',
  `option_text_loc1` text,
  `option_text_loc2` text,
  `option_text_loc3` text,
  `option_text_loc4` text,
  `option_text_loc5` text,
  `option_text_loc6` text,
  `option_text_loc7` text,
  `option_text_loc8` text,
  `box_text_loc1` text,
  `box_text_loc2` text,
  `box_text_loc3` text,
  `box_text_loc4` text,
  `box_text_loc5` text,
  `box_text_loc6` text,
  `box_text_loc7` text,
  `box_text_loc8` text,
  PRIMARY KEY (`menu_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.locales_item
CREATE TABLE IF NOT EXISTS `locales_item` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `description_loc1` varchar(255) DEFAULT NULL,
  `description_loc2` varchar(255) DEFAULT NULL,
  `description_loc3` varchar(255) DEFAULT NULL,
  `description_loc4` varchar(255) DEFAULT NULL,
  `description_loc5` varchar(255) DEFAULT NULL,
  `description_loc6` varchar(255) DEFAULT NULL,
  `description_loc7` varchar(255) DEFAULT NULL,
  `description_loc8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.locales_item_set_names
CREATE TABLE IF NOT EXISTS `locales_item_set_names` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.locales_npc_text
CREATE TABLE IF NOT EXISTS `locales_npc_text` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Text0_0_loc1` longtext,
  `Text0_0_loc2` longtext,
  `Text0_0_loc3` longtext,
  `Text0_0_loc4` longtext,
  `Text0_0_loc5` longtext,
  `Text0_0_loc6` longtext,
  `Text0_0_loc7` longtext,
  `Text0_0_loc8` longtext,
  `Text0_1_loc1` longtext,
  `Text0_1_loc2` longtext,
  `Text0_1_loc3` longtext,
  `Text0_1_loc4` longtext,
  `Text0_1_loc5` longtext,
  `Text0_1_loc6` longtext,
  `Text0_1_loc7` longtext,
  `Text0_1_loc8` longtext,
  `Text1_0_loc1` longtext,
  `Text1_0_loc2` longtext,
  `Text1_0_loc3` longtext,
  `Text1_0_loc4` longtext,
  `Text1_0_loc5` longtext,
  `Text1_0_loc6` longtext,
  `Text1_0_loc7` longtext,
  `Text1_0_loc8` longtext,
  `Text1_1_loc1` longtext,
  `Text1_1_loc2` longtext,
  `Text1_1_loc3` longtext,
  `Text1_1_loc4` longtext,
  `Text1_1_loc5` longtext,
  `Text1_1_loc6` longtext,
  `Text1_1_loc7` longtext,
  `Text1_1_loc8` longtext,
  `Text2_0_loc1` longtext,
  `Text2_0_loc2` longtext,
  `Text2_0_loc3` longtext,
  `Text2_0_loc4` longtext,
  `Text2_0_loc5` longtext,
  `Text2_0_loc6` longtext,
  `Text2_0_loc7` longtext,
  `Text2_0_loc8` longtext,
  `Text2_1_loc1` longtext,
  `Text2_1_loc2` longtext,
  `Text2_1_loc3` longtext,
  `Text2_1_loc4` longtext,
  `Text2_1_loc5` longtext,
  `Text2_1_loc6` longtext,
  `Text2_1_loc7` longtext,
  `Text2_1_loc8` longtext,
  `Text3_0_loc1` longtext,
  `Text3_0_loc2` longtext,
  `Text3_0_loc3` longtext,
  `Text3_0_loc4` longtext,
  `Text3_0_loc5` longtext,
  `Text3_0_loc6` longtext,
  `Text3_0_loc7` longtext,
  `Text3_0_loc8` longtext,
  `Text3_1_loc1` longtext,
  `Text3_1_loc2` longtext,
  `Text3_1_loc3` longtext,
  `Text3_1_loc4` longtext,
  `Text3_1_loc5` longtext,
  `Text3_1_loc6` longtext,
  `Text3_1_loc7` longtext,
  `Text3_1_loc8` longtext,
  `Text4_0_loc1` longtext,
  `Text4_0_loc2` longtext,
  `Text4_0_loc3` longtext,
  `Text4_0_loc4` longtext,
  `Text4_0_loc5` longtext,
  `Text4_0_loc6` longtext,
  `Text4_0_loc7` longtext,
  `Text4_0_loc8` longtext,
  `Text4_1_loc1` longtext,
  `Text4_1_loc2` longtext,
  `Text4_1_loc3` longtext,
  `Text4_1_loc4` longtext,
  `Text4_1_loc5` longtext,
  `Text4_1_loc6` longtext,
  `Text4_1_loc7` longtext,
  `Text4_1_loc8` longtext,
  `Text5_0_loc1` longtext,
  `Text5_0_loc2` longtext,
  `Text5_0_loc3` longtext,
  `Text5_0_loc4` longtext,
  `Text5_0_loc5` longtext,
  `Text5_0_loc6` longtext,
  `Text5_0_loc7` longtext,
  `Text5_0_loc8` longtext,
  `Text5_1_loc1` longtext,
  `Text5_1_loc2` longtext,
  `Text5_1_loc3` longtext,
  `Text5_1_loc4` longtext,
  `Text5_1_loc5` longtext,
  `Text5_1_loc6` longtext,
  `Text5_1_loc7` longtext,
  `Text5_1_loc8` longtext,
  `Text6_0_loc1` longtext,
  `Text6_0_loc2` longtext,
  `Text6_0_loc3` longtext,
  `Text6_0_loc4` longtext,
  `Text6_0_loc5` longtext,
  `Text6_0_loc6` longtext,
  `Text6_0_loc7` longtext,
  `Text6_0_loc8` longtext,
  `Text6_1_loc1` longtext,
  `Text6_1_loc2` longtext,
  `Text6_1_loc3` longtext,
  `Text6_1_loc4` longtext,
  `Text6_1_loc5` longtext,
  `Text6_1_loc6` longtext,
  `Text6_1_loc7` longtext,
  `Text6_1_loc8` longtext,
  `Text7_0_loc1` longtext,
  `Text7_0_loc2` longtext,
  `Text7_0_loc3` longtext,
  `Text7_0_loc4` longtext,
  `Text7_0_loc5` longtext,
  `Text7_0_loc6` longtext,
  `Text7_0_loc7` longtext,
  `Text7_0_loc8` longtext,
  `Text7_1_loc1` longtext,
  `Text7_1_loc2` longtext,
  `Text7_1_loc3` longtext,
  `Text7_1_loc4` longtext,
  `Text7_1_loc5` longtext,
  `Text7_1_loc6` longtext,
  `Text7_1_loc7` longtext,
  `Text7_1_loc8` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.locales_page_text
CREATE TABLE IF NOT EXISTS `locales_page_text` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Text_loc1` longtext,
  `Text_loc2` longtext,
  `Text_loc3` longtext,
  `Text_loc4` longtext,
  `Text_loc5` longtext,
  `Text_loc6` longtext,
  `Text_loc7` longtext,
  `Text_loc8` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.locales_points_of_interest
CREATE TABLE IF NOT EXISTS `locales_points_of_interest` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `icon_name_loc1` text,
  `icon_name_loc2` text,
  `icon_name_loc3` text,
  `icon_name_loc4` text,
  `icon_name_loc5` text,
  `icon_name_loc6` text,
  `icon_name_loc7` text,
  `icon_name_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.locales_quest
CREATE TABLE IF NOT EXISTS `locales_quest` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Title_loc1` text,
  `Title_loc2` text,
  `Title_loc3` text,
  `Title_loc4` text,
  `Title_loc5` text,
  `Title_loc6` text,
  `Title_loc7` text,
  `Title_loc8` text,
  `Details_loc1` text,
  `Details_loc2` text,
  `Details_loc3` text,
  `Details_loc4` text,
  `Details_loc5` text,
  `Details_loc6` text,
  `Details_loc7` text,
  `Details_loc8` text,
  `Objectives_loc1` text,
  `Objectives_loc2` text,
  `Objectives_loc3` text,
  `Objectives_loc4` text,
  `Objectives_loc5` text,
  `Objectives_loc6` text,
  `Objectives_loc7` text,
  `Objectives_loc8` text,
  `OfferRewardText_loc1` text,
  `OfferRewardText_loc2` text,
  `OfferRewardText_loc3` text,
  `OfferRewardText_loc4` text,
  `OfferRewardText_loc5` text,
  `OfferRewardText_loc6` text,
  `OfferRewardText_loc7` text,
  `OfferRewardText_loc8` text,
  `RequestItemsText_loc1` text,
  `RequestItemsText_loc2` text,
  `RequestItemsText_loc3` text,
  `RequestItemsText_loc4` text,
  `RequestItemsText_loc5` text,
  `RequestItemsText_loc6` text,
  `RequestItemsText_loc7` text,
  `RequestItemsText_loc8` text,
  `EndText_loc1` text,
  `EndText_loc2` text,
  `EndText_loc3` text,
  `EndText_loc4` text,
  `EndText_loc5` text,
  `EndText_loc6` text,
  `EndText_loc7` text,
  `EndText_loc8` text,
  `CompletedText_loc1` text,
  `CompletedText_loc2` text,
  `CompletedText_loc3` text,
  `CompletedText_loc4` text,
  `CompletedText_loc5` text,
  `CompletedText_loc6` text,
  `CompletedText_loc7` text,
  `CompletedText_loc8` text,
  `ObjectiveText1_loc1` text,
  `ObjectiveText1_loc2` text,
  `ObjectiveText1_loc3` text,
  `ObjectiveText1_loc4` text,
  `ObjectiveText1_loc5` text,
  `ObjectiveText1_loc6` text,
  `ObjectiveText1_loc7` text,
  `ObjectiveText1_loc8` text,
  `ObjectiveText2_loc1` text,
  `ObjectiveText2_loc2` text,
  `ObjectiveText2_loc3` text,
  `ObjectiveText2_loc4` text,
  `ObjectiveText2_loc5` text,
  `ObjectiveText2_loc6` text,
  `ObjectiveText2_loc7` text,
  `ObjectiveText2_loc8` text,
  `ObjectiveText3_loc1` text,
  `ObjectiveText3_loc2` text,
  `ObjectiveText3_loc3` text,
  `ObjectiveText3_loc4` text,
  `ObjectiveText3_loc5` text,
  `ObjectiveText3_loc6` text,
  `ObjectiveText3_loc7` text,
  `ObjectiveText3_loc8` text,
  `ObjectiveText4_loc1` text,
  `ObjectiveText4_loc2` text,
  `ObjectiveText4_loc3` text,
  `ObjectiveText4_loc4` text,
  `ObjectiveText4_loc5` text,
  `ObjectiveText4_loc6` text,
  `ObjectiveText4_loc7` text,
  `ObjectiveText4_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.mail_level_reward
CREATE TABLE IF NOT EXISTS `mail_level_reward` (
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `raceMask` mediumint unsigned NOT NULL DEFAULT '0',
  `mailTemplateId` mediumint unsigned NOT NULL DEFAULT '0',
  `senderEntry` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`,`raceMask`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Mail System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.mail_loot_template
CREATE TABLE IF NOT EXISTS `mail_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.milling_loot_template
CREATE TABLE IF NOT EXISTS `milling_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.npc_spellclick_spells
CREATE TABLE IF NOT EXISTS `npc_spellclick_spells` (
  `npc_entry` int unsigned NOT NULL COMMENT 'reference to creature_template',
  `spell_id` int unsigned NOT NULL COMMENT 'spell which should be casted ',
  `quest_start` mediumint unsigned NOT NULL COMMENT 'reference to quest_template',
  `quest_start_active` tinyint unsigned NOT NULL DEFAULT '0',
  `quest_end` mediumint unsigned NOT NULL DEFAULT '0',
  `cast_flags` tinyint unsigned NOT NULL COMMENT 'first bit defines caster: 1=player, 0=creature; second bit defines target, same mapping as caster bit',
  `aura_required` int unsigned NOT NULL DEFAULT '0' COMMENT 'player without aura cant click',
  `aura_forbidden` int unsigned NOT NULL DEFAULT '0' COMMENT 'player with aura cant click',
  `user_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'relation with summoner: 0-no 1-friendly 2-raid 3-party player can click'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.npc_text
CREATE TABLE IF NOT EXISTS `npc_text` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `text0_0` longtext,
  `text0_1` longtext,
  `lang0` tinyint unsigned NOT NULL DEFAULT '0',
  `prob0` float NOT NULL DEFAULT '0',
  `em0_0` smallint unsigned NOT NULL DEFAULT '0',
  `em0_1` smallint unsigned NOT NULL DEFAULT '0',
  `em0_2` smallint unsigned NOT NULL DEFAULT '0',
  `em0_3` smallint unsigned NOT NULL DEFAULT '0',
  `em0_4` smallint unsigned NOT NULL DEFAULT '0',
  `em0_5` smallint unsigned NOT NULL DEFAULT '0',
  `text1_0` longtext,
  `text1_1` longtext,
  `lang1` tinyint unsigned NOT NULL DEFAULT '0',
  `prob1` float NOT NULL DEFAULT '0',
  `em1_0` smallint unsigned NOT NULL DEFAULT '0',
  `em1_1` smallint unsigned NOT NULL DEFAULT '0',
  `em1_2` smallint unsigned NOT NULL DEFAULT '0',
  `em1_3` smallint unsigned NOT NULL DEFAULT '0',
  `em1_4` smallint unsigned NOT NULL DEFAULT '0',
  `em1_5` smallint unsigned NOT NULL DEFAULT '0',
  `text2_0` longtext,
  `text2_1` longtext,
  `lang2` tinyint unsigned NOT NULL DEFAULT '0',
  `prob2` float NOT NULL DEFAULT '0',
  `em2_0` smallint unsigned NOT NULL DEFAULT '0',
  `em2_1` smallint unsigned NOT NULL DEFAULT '0',
  `em2_2` smallint unsigned NOT NULL DEFAULT '0',
  `em2_3` smallint unsigned NOT NULL DEFAULT '0',
  `em2_4` smallint unsigned NOT NULL DEFAULT '0',
  `em2_5` smallint unsigned NOT NULL DEFAULT '0',
  `text3_0` longtext,
  `text3_1` longtext,
  `lang3` tinyint unsigned NOT NULL DEFAULT '0',
  `prob3` float NOT NULL DEFAULT '0',
  `em3_0` smallint unsigned NOT NULL DEFAULT '0',
  `em3_1` smallint unsigned NOT NULL DEFAULT '0',
  `em3_2` smallint unsigned NOT NULL DEFAULT '0',
  `em3_3` smallint unsigned NOT NULL DEFAULT '0',
  `em3_4` smallint unsigned NOT NULL DEFAULT '0',
  `em3_5` smallint unsigned NOT NULL DEFAULT '0',
  `text4_0` longtext,
  `text4_1` longtext,
  `lang4` tinyint unsigned NOT NULL DEFAULT '0',
  `prob4` float NOT NULL DEFAULT '0',
  `em4_0` smallint unsigned NOT NULL DEFAULT '0',
  `em4_1` smallint unsigned NOT NULL DEFAULT '0',
  `em4_2` smallint unsigned NOT NULL DEFAULT '0',
  `em4_3` smallint unsigned NOT NULL DEFAULT '0',
  `em4_4` smallint unsigned NOT NULL DEFAULT '0',
  `em4_5` smallint unsigned NOT NULL DEFAULT '0',
  `text5_0` longtext,
  `text5_1` longtext,
  `lang5` tinyint unsigned NOT NULL DEFAULT '0',
  `prob5` float NOT NULL DEFAULT '0',
  `em5_0` smallint unsigned NOT NULL DEFAULT '0',
  `em5_1` smallint unsigned NOT NULL DEFAULT '0',
  `em5_2` smallint unsigned NOT NULL DEFAULT '0',
  `em5_3` smallint unsigned NOT NULL DEFAULT '0',
  `em5_4` smallint unsigned NOT NULL DEFAULT '0',
  `em5_5` smallint unsigned NOT NULL DEFAULT '0',
  `text6_0` longtext,
  `text6_1` longtext,
  `lang6` tinyint unsigned NOT NULL DEFAULT '0',
  `prob6` float NOT NULL DEFAULT '0',
  `em6_0` smallint unsigned NOT NULL DEFAULT '0',
  `em6_1` smallint unsigned NOT NULL DEFAULT '0',
  `em6_2` smallint unsigned NOT NULL DEFAULT '0',
  `em6_3` smallint unsigned NOT NULL DEFAULT '0',
  `em6_4` smallint unsigned NOT NULL DEFAULT '0',
  `em6_5` smallint unsigned NOT NULL DEFAULT '0',
  `text7_0` longtext,
  `text7_1` longtext,
  `lang7` tinyint unsigned NOT NULL DEFAULT '0',
  `prob7` float NOT NULL DEFAULT '0',
  `em7_0` smallint unsigned NOT NULL DEFAULT '0',
  `em7_1` smallint unsigned NOT NULL DEFAULT '0',
  `em7_2` smallint unsigned NOT NULL DEFAULT '0',
  `em7_3` smallint unsigned NOT NULL DEFAULT '0',
  `em7_4` smallint unsigned NOT NULL DEFAULT '0',
  `em7_5` smallint unsigned NOT NULL DEFAULT '0',
  `WDBVerified` smallint DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.npc_trainer
CREATE TABLE IF NOT EXISTS `npc_trainer` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `spell` mediumint NOT NULL DEFAULT '0',
  `spellcost` int unsigned NOT NULL DEFAULT '0',
  `reqskill` smallint unsigned NOT NULL DEFAULT '0',
  `reqskillvalue` smallint unsigned NOT NULL DEFAULT '0',
  `reqlevel` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.npc_vendor
CREATE TABLE IF NOT EXISTS `npc_vendor` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `slot` smallint NOT NULL DEFAULT '0',
  `item` mediumint NOT NULL DEFAULT '0',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '0',
  `incrtime` int unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`,`ExtendedCost`),
  KEY `slot` (`slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Npc System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.outdoorpvp_template
CREATE TABLE IF NOT EXISTS `outdoorpvp_template` (
  `TypeId` tinyint unsigned NOT NULL,
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `comment` text,
  PRIMARY KEY (`TypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='OutdoorPvP Templates';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.page_text
CREATE TABLE IF NOT EXISTS `page_text` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `next_page` mediumint unsigned NOT NULL DEFAULT '0',
  `WDBVerified` smallint DEFAULT '1',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Item System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.pet_levelstats
CREATE TABLE IF NOT EXISTS `pet_levelstats` (
  `creature_entry` mediumint unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `hp` smallint unsigned NOT NULL,
  `mana` smallint unsigned NOT NULL,
  `armor` int unsigned NOT NULL DEFAULT '0',
  `str` smallint unsigned NOT NULL,
  `agi` smallint unsigned NOT NULL,
  `sta` smallint unsigned NOT NULL,
  `inte` smallint unsigned NOT NULL,
  `spi` smallint unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 COMMENT='Stores pet levels stats.';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.pet_name_generation
CREATE TABLE IF NOT EXISTS `pet_name_generation` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `word` tinytext NOT NULL,
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `half` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.pickpocketing_loot_template
CREATE TABLE IF NOT EXISTS `pickpocketing_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.player_classlevelstats
CREATE TABLE IF NOT EXISTS `player_classlevelstats` (
  `class` tinyint unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `basehp` smallint unsigned NOT NULL,
  `basemana` smallint unsigned NOT NULL,
  PRIMARY KEY (`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 COMMENT='Stores levels stats.';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.player_factionchange_achievement
CREATE TABLE IF NOT EXISTS `player_factionchange_achievement` (
  `alliance_id` int NOT NULL,
  `horde_id` int NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.player_factionchange_items
CREATE TABLE IF NOT EXISTS `player_factionchange_items` (
  `race_A` int NOT NULL,
  `alliance_id` int NOT NULL,
  `commentA` text,
  `race_H` int NOT NULL,
  `horde_id` int NOT NULL,
  `commentH` text,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.player_factionchange_reputations
CREATE TABLE IF NOT EXISTS `player_factionchange_reputations` (
  `alliance_id` int NOT NULL,
  `horde_id` int NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.player_factionchange_spells
CREATE TABLE IF NOT EXISTS `player_factionchange_spells` (
  `alliance_id` int NOT NULL,
  `horde_id` int NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.player_levelstats
CREATE TABLE IF NOT EXISTS `player_levelstats` (
  `race` tinyint unsigned NOT NULL,
  `class` tinyint unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `str` tinyint unsigned NOT NULL,
  `agi` tinyint unsigned NOT NULL,
  `sta` tinyint unsigned NOT NULL,
  `inte` tinyint unsigned NOT NULL,
  `spi` tinyint unsigned NOT NULL,
  PRIMARY KEY (`race`,`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 COMMENT='Stores levels stats.';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.player_xp_for_level
CREATE TABLE IF NOT EXISTS `player_xp_for_level` (
  `lvl` int unsigned NOT NULL,
  `xp_for_next_level` int unsigned NOT NULL,
  PRIMARY KEY (`lvl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.playercreateinfo
CREATE TABLE IF NOT EXISTS `playercreateinfo` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `zone` mediumint unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.playercreateinfo_action
CREATE TABLE IF NOT EXISTS `playercreateinfo_action` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `button` smallint unsigned NOT NULL DEFAULT '0',
  `action` int unsigned NOT NULL DEFAULT '0',
  `type` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`,`button`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.playercreateinfo_item
CREATE TABLE IF NOT EXISTS `playercreateinfo_item` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint unsigned NOT NULL DEFAULT '0',
  `amount` tinyint NOT NULL DEFAULT '1',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.playercreateinfo_spell
CREATE TABLE IF NOT EXISTS `playercreateinfo_spell` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `Spell` mediumint unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.playercreateinfo_spell_custom
CREATE TABLE IF NOT EXISTS `playercreateinfo_spell_custom` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `Spell` mediumint unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL,
  `Active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.points_of_interest
CREATE TABLE IF NOT EXISTS `points_of_interest` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `icon` mediumint unsigned NOT NULL DEFAULT '0',
  `flags` mediumint unsigned NOT NULL DEFAULT '0',
  `data` mediumint unsigned NOT NULL DEFAULT '0',
  `icon_name` text NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.pool_creature
CREATE TABLE IF NOT EXISTS `pool_creature` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.pool_gameobject
CREATE TABLE IF NOT EXISTS `pool_gameobject` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.pool_pool
CREATE TABLE IF NOT EXISTS `pool_pool` (
  `pool_id` mediumint unsigned NOT NULL DEFAULT '0',
  `mother_pool` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pool_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.pool_quest
CREATE TABLE IF NOT EXISTS `pool_quest` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`),
  KEY `idx_guid` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.pool_template
CREATE TABLE IF NOT EXISTS `pool_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Pool entry',
  `max_limit` int unsigned NOT NULL DEFAULT '0' COMMENT 'Max number of objects (0) is no limit',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.prospecting_loot_template
CREATE TABLE IF NOT EXISTS `prospecting_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.quest_end_scripts
CREATE TABLE IF NOT EXISTS `quest_end_scripts` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.quest_poi
CREATE TABLE IF NOT EXISTS `quest_poi` (
  `questId` int unsigned NOT NULL DEFAULT '0',
  `id` int unsigned NOT NULL DEFAULT '0',
  `objIndex` int NOT NULL DEFAULT '0',
  `mapid` int unsigned NOT NULL DEFAULT '0',
  `WorldMapAreaId` int unsigned NOT NULL DEFAULT '0',
  `FloorId` int unsigned NOT NULL DEFAULT '0',
  `unk3` int unsigned NOT NULL DEFAULT '0',
  `unk4` int unsigned NOT NULL DEFAULT '0',
  KEY `questId` (`questId`,`id`),
  KEY `id` (`id`,`questId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.quest_poi_points
CREATE TABLE IF NOT EXISTS `quest_poi_points` (
  `questId` int unsigned NOT NULL DEFAULT '0',
  `id` int unsigned NOT NULL DEFAULT '0',
  `idx` int unsigned NOT NULL DEFAULT '0',
  `x` int NOT NULL DEFAULT '0',
  `y` int NOT NULL DEFAULT '0',
  KEY `questId_id` (`questId`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.quest_start_scripts
CREATE TABLE IF NOT EXISTS `quest_start_scripts` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.quest_template
CREATE TABLE IF NOT EXISTS `quest_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Method` tinyint unsigned NOT NULL DEFAULT '2',
  `ZoneOrSort` smallint NOT NULL DEFAULT '0',
  `SkillOrClassMask` mediumint NOT NULL DEFAULT '0',
  `MinLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `QuestLevel` smallint NOT NULL DEFAULT '1',
  `Type` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredRaces` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkillValue` smallint unsigned NOT NULL DEFAULT '0',
  `RepObjectiveFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RepObjectiveValue` mediumint NOT NULL DEFAULT '0',
  `RepObjectiveFaction2` smallint unsigned NOT NULL DEFAULT '0',
  `RepObjectiveValue2` mediumint NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepValue` mediumint NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` mediumint NOT NULL DEFAULT '0',
  `SuggestedPlayers` tinyint unsigned NOT NULL DEFAULT '0',
  `LimitTime` int unsigned NOT NULL DEFAULT '0',
  `QuestFlags` int unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `CharTitleId` tinyint unsigned NOT NULL DEFAULT '0',
  `PlayersSlain` tinyint unsigned NOT NULL DEFAULT '0',
  `BonusTalents` tinyint unsigned NOT NULL DEFAULT '0',
  `RewardArenaPoints` smallint unsigned NOT NULL DEFAULT '0',
  `PrevQuestId` mediumint NOT NULL DEFAULT '0',
  `NextQuestId` mediumint NOT NULL DEFAULT '0',
  `ExclusiveGroup` mediumint NOT NULL DEFAULT '0',
  `NextQuestInChain` mediumint unsigned NOT NULL DEFAULT '0',
  `RewXPId` tinyint unsigned NOT NULL DEFAULT '0',
  `SrcItemId` mediumint unsigned NOT NULL DEFAULT '0',
  `SrcItemCount` tinyint unsigned NOT NULL DEFAULT '0',
  `SrcSpell` mediumint unsigned NOT NULL DEFAULT '0',
  `Title` text,
  `Details` text,
  `Objectives` text,
  `OfferRewardText` text,
  `RequestItemsText` text,
  `EndText` text,
  `CompletedText` text,
  `ObjectiveText1` text,
  `ObjectiveText2` text,
  `ObjectiveText3` text,
  `ObjectiveText4` text,
  `ReqItemId1` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqItemId2` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqItemId3` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqItemId4` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqItemId5` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqItemId6` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqItemCount1` smallint unsigned NOT NULL DEFAULT '0',
  `ReqItemCount2` smallint unsigned NOT NULL DEFAULT '0',
  `ReqItemCount3` smallint unsigned NOT NULL DEFAULT '0',
  `ReqItemCount4` smallint unsigned NOT NULL DEFAULT '0',
  `ReqItemCount5` smallint unsigned NOT NULL DEFAULT '0',
  `ReqItemCount6` smallint unsigned NOT NULL DEFAULT '0',
  `ReqSourceId1` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSourceId2` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSourceId3` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSourceId4` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount1` smallint unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount2` smallint unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount3` smallint unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount4` smallint unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId1` mediumint NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId2` mediumint NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId3` mediumint NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId4` mediumint NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount1` smallint unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount2` smallint unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount3` smallint unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount4` smallint unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast1` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast2` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast3` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast4` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId1` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId2` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId3` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId4` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId5` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId6` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount1` smallint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount2` smallint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount3` smallint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount4` smallint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount5` smallint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount6` smallint unsigned NOT NULL DEFAULT '0',
  `RewItemId1` mediumint unsigned NOT NULL DEFAULT '0',
  `RewItemId2` mediumint unsigned NOT NULL DEFAULT '0',
  `RewItemId3` mediumint unsigned NOT NULL DEFAULT '0',
  `RewItemId4` mediumint unsigned NOT NULL DEFAULT '0',
  `RewItemCount1` smallint unsigned NOT NULL DEFAULT '0',
  `RewItemCount2` smallint unsigned NOT NULL DEFAULT '0',
  `RewItemCount3` smallint unsigned NOT NULL DEFAULT '0',
  `RewItemCount4` smallint unsigned NOT NULL DEFAULT '0',
  `RewRepFaction1` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction2` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction3` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction4` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction5` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepValueId1` mediumint NOT NULL DEFAULT '0',
  `RewRepValueId2` mediumint NOT NULL DEFAULT '0',
  `RewRepValueId3` mediumint NOT NULL DEFAULT '0',
  `RewRepValueId4` mediumint NOT NULL DEFAULT '0',
  `RewRepValueId5` mediumint NOT NULL DEFAULT '0',
  `RewRepValue1` mediumint NOT NULL DEFAULT '0',
  `RewRepValue2` mediumint NOT NULL DEFAULT '0',
  `RewRepValue3` mediumint NOT NULL DEFAULT '0',
  `RewRepValue4` mediumint NOT NULL DEFAULT '0',
  `RewRepValue5` mediumint NOT NULL DEFAULT '0',
  `RewHonorAddition` int NOT NULL DEFAULT '0',
  `RewHonorMultiplier` float NOT NULL DEFAULT '1',
  `unk0` tinyint unsigned NOT NULL DEFAULT '0',
  `RewOrReqMoney` int NOT NULL DEFAULT '0',
  `RewMoneyMaxLevel` int unsigned NOT NULL DEFAULT '0',
  `RewSpell` mediumint unsigned NOT NULL DEFAULT '0',
  `RewSpellCast` int NOT NULL DEFAULT '0',
  `RewMailTemplateId` mediumint unsigned NOT NULL DEFAULT '0',
  `RewMailDelaySecs` int unsigned NOT NULL DEFAULT '0',
  `PointMapId` smallint unsigned NOT NULL DEFAULT '0',
  `PointX` float NOT NULL DEFAULT '0',
  `PointY` float NOT NULL DEFAULT '0',
  `PointOpt` mediumint unsigned NOT NULL DEFAULT '0',
  `DetailsEmote1` smallint unsigned NOT NULL DEFAULT '0',
  `DetailsEmote2` smallint unsigned NOT NULL DEFAULT '0',
  `DetailsEmote3` smallint unsigned NOT NULL DEFAULT '0',
  `DetailsEmote4` smallint unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay1` int unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay2` int unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay3` int unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay4` int unsigned NOT NULL DEFAULT '0',
  `IncompleteEmote` smallint unsigned NOT NULL DEFAULT '0',
  `CompleteEmote` smallint unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote1` smallint unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote2` smallint unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote3` smallint unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote4` smallint unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay1` int unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay2` int unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay3` int unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay4` int unsigned NOT NULL DEFAULT '0',
  `StartScript` mediumint unsigned NOT NULL DEFAULT '0',
  `CompleteScript` mediumint unsigned NOT NULL DEFAULT '0',
  `WDBVerified` smallint DEFAULT '1',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Quest System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.reference_loot_template
CREATE TABLE IF NOT EXISTS `reference_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.reputation_reward_rate
CREATE TABLE IF NOT EXISTS `reputation_reward_rate` (
  `faction` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_rate` float NOT NULL DEFAULT '1',
  `creature_rate` float NOT NULL DEFAULT '1',
  `spell_rate` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.reputation_spillover_template
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Reputation spillover reputation gain';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.reserved_name
CREATE TABLE IF NOT EXISTS `reserved_name` (
  `name` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Player Reserved Names';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.script_texts
CREATE TABLE IF NOT EXISTS `script_texts` (
  `npc_entry` mediumint NOT NULL DEFAULT '0' COMMENT 'creature_template entry',
  `entry` mediumint NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `language` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` smallint unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`npc_entry`,`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Script Texts';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.script_waypoint
CREATE TABLE IF NOT EXISTS `script_waypoint` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'creature_template entry',
  `pointid` mediumint unsigned NOT NULL DEFAULT '0',
  `location_x` float NOT NULL DEFAULT '0',
  `location_y` float NOT NULL DEFAULT '0',
  `location_z` float NOT NULL DEFAULT '0',
  `waittime` int unsigned NOT NULL DEFAULT '0' COMMENT 'waittime in millisecs',
  `point_comment` text,
  PRIMARY KEY (`entry`,`pointid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Script Creature waypoints';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.skill_discovery_template
CREATE TABLE IF NOT EXISTS `skill_discovery_template` (
  `spellId` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'spell requirement',
  `reqSkillValue` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'skill points requirement',
  `chance` float NOT NULL DEFAULT '0' COMMENT 'chance to discover',
  PRIMARY KEY (`spellId`,`reqSpell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Skill Discovery System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.skill_extra_item_template
CREATE TABLE IF NOT EXISTS `skill_extra_item_template` (
  `spellId` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'max num of adds',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Skill Specialization System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.skill_fishing_base_level
CREATE TABLE IF NOT EXISTS `skill_fishing_base_level` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Area identifier',
  `skill` smallint NOT NULL DEFAULT '0' COMMENT 'Base skill level requirement',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Fishing system';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.skinning_loot_template
CREATE TABLE IF NOT EXISTS `skinning_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.smart_scripts
CREATE TABLE IF NOT EXISTS `smart_scripts` (
  `entryorguid` int NOT NULL,
  `source_type` tinyint unsigned NOT NULL DEFAULT '0',
  `id` smallint unsigned NOT NULL DEFAULT '0',
  `link` smallint unsigned NOT NULL DEFAULT '0',
  `event_type` tinyint unsigned NOT NULL DEFAULT '0',
  `event_phase_mask` tinyint unsigned NOT NULL DEFAULT '0',
  `event_chance` tinyint unsigned NOT NULL DEFAULT '100',
  `event_flags` tinyint unsigned NOT NULL DEFAULT '0',
  `event_param1` int unsigned NOT NULL DEFAULT '0',
  `event_param2` int unsigned NOT NULL DEFAULT '0',
  `event_param3` int unsigned NOT NULL DEFAULT '0',
  `event_param4` int unsigned NOT NULL DEFAULT '0',
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
  `target_x` float NOT NULL DEFAULT '0',
  `target_y` float NOT NULL DEFAULT '0',
  `target_z` float NOT NULL DEFAULT '0',
  `target_o` float NOT NULL DEFAULT '0',
  `comment` text NOT NULL COMMENT 'Event Comment',
  PRIMARY KEY (`entryorguid`,`source_type`,`id`,`link`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_area
CREATE TABLE IF NOT EXISTS `spell_area` (
  `spell` mediumint unsigned NOT NULL DEFAULT '0',
  `area` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_start` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_start_active` tinyint unsigned NOT NULL DEFAULT '0',
  `quest_end` mediumint unsigned NOT NULL DEFAULT '0',
  `aura_spell` mediumint NOT NULL DEFAULT '0',
  `racemask` mediumint unsigned NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '2',
  `autocast` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell`,`area`,`quest_start`,`quest_start_active`,`aura_spell`,`racemask`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_bonus_data
CREATE TABLE IF NOT EXISTS `spell_bonus_data` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `direct_bonus` float NOT NULL DEFAULT '0',
  `dot_bonus` float NOT NULL DEFAULT '0',
  `ap_bonus` float NOT NULL DEFAULT '0',
  `ap_dot_bonus` float NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_dbc
CREATE TABLE IF NOT EXISTS `spell_dbc` (
  `Id` int unsigned NOT NULL,
  `Dispel` tinyint unsigned NOT NULL DEFAULT '0',
  `Mechanic` tinyint unsigned NOT NULL DEFAULT '0',
  `Attributes` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx2` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx3` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx4` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx5` int unsigned NOT NULL DEFAULT '0',
  `Stances` int unsigned NOT NULL DEFAULT '0',
  `StancesNot` int unsigned NOT NULL DEFAULT '0',
  `Targets` int unsigned NOT NULL DEFAULT '0',
  `CastingTimeIndex` tinyint unsigned NOT NULL DEFAULT '1',
  `AuraInterruptFlags` int unsigned NOT NULL DEFAULT '0',
  `ProcFlags` int unsigned NOT NULL DEFAULT '0',
  `ProcChance` tinyint unsigned NOT NULL DEFAULT '0',
  `ProcCharges` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `BaseLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `DurationIndex` smallint unsigned NOT NULL DEFAULT '0',
  `RangeIndex` tinyint unsigned NOT NULL DEFAULT '1',
  `StackAmount` tinyint unsigned NOT NULL DEFAULT '0',
  `EquippedItemClass` int NOT NULL DEFAULT '-1',
  `EquippedItemSubClassMask` int NOT NULL DEFAULT '0',
  `EquippedItemInventoryTypeMask` int NOT NULL DEFAULT '0',
  `Effect1` tinyint unsigned NOT NULL DEFAULT '0',
  `Effect2` tinyint unsigned NOT NULL DEFAULT '0',
  `Effect3` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectDieSides1` int NOT NULL DEFAULT '0',
  `EffectDieSides2` int NOT NULL DEFAULT '0',
  `EffectDieSides3` int NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel1` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel2` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel3` float NOT NULL DEFAULT '0',
  `EffectBasePoints1` int NOT NULL DEFAULT '0',
  `EffectBasePoints2` int NOT NULL DEFAULT '0',
  `EffectBasePoints3` int NOT NULL DEFAULT '0',
  `EffectMechanic1` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectMechanic2` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectMechanic3` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA1` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA2` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA3` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB1` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB2` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB3` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex1` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex2` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex3` tinyint unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName1` smallint unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName2` smallint unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName3` smallint unsigned NOT NULL DEFAULT '0',
  `EffectAmplitude1` int NOT NULL DEFAULT '0',
  `EffectAmplitude2` int NOT NULL DEFAULT '0',
  `EffectAmplitude3` int NOT NULL DEFAULT '0',
  `EffectMultipleValue1` float NOT NULL DEFAULT '0',
  `EffectMultipleValue2` float NOT NULL DEFAULT '0',
  `EffectMultipleValue3` float NOT NULL DEFAULT '0',
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
  `MaxTargetLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags1` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags2` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags3` int unsigned NOT NULL DEFAULT '0',
  `MaxAffectedTargets` tinyint unsigned NOT NULL DEFAULT '0',
  `DmgClass` tinyint unsigned NOT NULL DEFAULT '0',
  `PreventionType` tinyint unsigned NOT NULL DEFAULT '0',
  `DmgMultiplier1` float NOT NULL DEFAULT '0',
  `DmgMultiplier2` float NOT NULL DEFAULT '0',
  `DmgMultiplier3` float NOT NULL DEFAULT '0',
  `AreaGroupId` int NOT NULL DEFAULT '0',
  `SchoolMask` int unsigned NOT NULL DEFAULT '0',
  `Comment` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Custom spell.dbc entries';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_enchant_proc_data
CREATE TABLE IF NOT EXISTS `spell_enchant_proc_data` (
  `entry` int unsigned NOT NULL,
  `customChance` int unsigned NOT NULL DEFAULT '0',
  `PPMChance` float unsigned NOT NULL DEFAULT '0',
  `procEx` float unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Spell enchant proc data';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_group
CREATE TABLE IF NOT EXISTS `spell_group` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `spell_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Spell System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_group_stack_rules
CREATE TABLE IF NOT EXISTS `spell_group_stack_rules` (
  `group_id` int unsigned NOT NULL DEFAULT '0',
  `stack_rule` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_learn_spell
CREATE TABLE IF NOT EXISTS `spell_learn_spell` (
  `entry` smallint unsigned NOT NULL DEFAULT '0',
  `SpellID` smallint unsigned NOT NULL DEFAULT '0',
  `Active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Item System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_linked_spell
CREATE TABLE IF NOT EXISTS `spell_linked_spell` (
  `spell_trigger` mediumint NOT NULL,
  `spell_effect` mediumint NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  UNIQUE KEY `trigger_effect_type` (`spell_trigger`,`spell_effect`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Spell System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_loot_template
CREATE TABLE IF NOT EXISTS `spell_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` smallint unsigned NOT NULL DEFAULT '1',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_pet_auras
CREATE TABLE IF NOT EXISTS `spell_pet_auras` (
  `spell` mediumint unsigned NOT NULL COMMENT 'dummy spell id',
  `effectId` tinyint unsigned NOT NULL DEFAULT '0',
  `pet` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY (`spell`,`effectId`,`pet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_proc_event
CREATE TABLE IF NOT EXISTS `spell_proc_event` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `SchoolMask` tinyint NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask0` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask1` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask2` int unsigned NOT NULL DEFAULT '0',
  `procFlags` int unsigned NOT NULL DEFAULT '0',
  `procEx` int unsigned NOT NULL DEFAULT '0',
  `ppmRate` float NOT NULL DEFAULT '0',
  `CustomChance` float NOT NULL DEFAULT '0',
  `Cooldown` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_ranks
CREATE TABLE IF NOT EXISTS `spell_ranks` (
  `first_spell_id` int unsigned NOT NULL DEFAULT '0',
  `spell_id` int unsigned NOT NULL DEFAULT '0',
  `rank` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`first_spell_id`,`rank`),
  UNIQUE KEY `spell_id` (`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Spell Rank Data';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_required
CREATE TABLE IF NOT EXISTS `spell_required` (
  `spell_id` mediumint NOT NULL DEFAULT '0',
  `req_spell` mediumint NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell_id`,`req_spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Spell Additinal Data';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_script_names
CREATE TABLE IF NOT EXISTS `spell_script_names` (
  `spell_id` int NOT NULL,
  `ScriptName` char(64) NOT NULL,
  UNIQUE KEY `spell_id` (`spell_id`,`ScriptName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_scripts
CREATE TABLE IF NOT EXISTS `spell_scripts` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `effIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_target_position
CREATE TABLE IF NOT EXISTS `spell_target_position` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `target_map` smallint unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Spell System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spell_threat
CREATE TABLE IF NOT EXISTS `spell_threat` (
  `entry` mediumint unsigned NOT NULL,
  `Threat` smallint NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.spelldifficulty_dbc
CREATE TABLE IF NOT EXISTS `spelldifficulty_dbc` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `spellid0` int unsigned NOT NULL DEFAULT '0',
  `spellid1` int unsigned NOT NULL DEFAULT '0',
  `spellid2` int unsigned NOT NULL DEFAULT '0',
  `spellid3` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.transports
CREATE TABLE IF NOT EXISTS `transports` (
  `guid` int unsigned NOT NULL AUTO_INCREMENT,
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `name` text,
  `period` mediumint unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `idx_entry` (`entry`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Transports';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.trinity_string
CREATE TABLE IF NOT EXISTS `trinity_string` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.vehicle_accessory
CREATE TABLE IF NOT EXISTS `vehicle_accessory` (
  `guid` mediumint unsigned NOT NULL DEFAULT '0',
  `accessory_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `seat_id` tinyint(1) NOT NULL DEFAULT '0',
  `minion` tinyint unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `summontype` tinyint unsigned NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int unsigned NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes',
  PRIMARY KEY (`guid`,`seat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.vehicle_scaling_info
CREATE TABLE IF NOT EXISTS `vehicle_scaling_info` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `baseItemLevel` float NOT NULL DEFAULT '0',
  `scalingFactor` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.vehicle_template_accessory
CREATE TABLE IF NOT EXISTS `vehicle_template_accessory` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `accessory_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `seat_id` tinyint(1) NOT NULL DEFAULT '0',
  `minion` tinyint unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `summontype` tinyint unsigned NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int unsigned NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes',
  PRIMARY KEY (`entry`,`seat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.version
CREATE TABLE IF NOT EXISTS `version` (
  `core_version` varchar(120) DEFAULT NULL COMMENT 'Core revision dumped at startup.',
  `core_revision` varchar(120) DEFAULT NULL,
  `db_version` varchar(120) DEFAULT NULL COMMENT 'Version of world DB.',
  `script_version` varchar(120) DEFAULT NULL COMMENT 'Version of scripts DB.',
  `cache_id` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Version Notes';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.vote_items
CREATE TABLE IF NOT EXISTS `vote_items` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `displayid` mediumint unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `requiredspell` mediumint unsigned NOT NULL DEFAULT '0',
  `requiredhonorrank` mediumint unsigned NOT NULL DEFAULT '0',
  `RequiredCityRank` mediumint unsigned NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredReputationRank` smallint unsigned NOT NULL DEFAULT '0',
  `lockid` mediumint unsigned NOT NULL DEFAULT '0',
  `area` mediumint unsigned NOT NULL DEFAULT '0',
  `Map` smallint NOT NULL DEFAULT '0',
  `Duration` int NOT NULL DEFAULT '0' COMMENT 'Duration in seconds. Negative value means realtime, postive value ingame time',
  `HolidayId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Item System';

-- Data exporting was unselected.

-- Dumping structure for table woi_world.waypoint_data
CREATE TABLE IF NOT EXISTS `waypoint_data` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Creature GUID',
  `point` mediumint unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `move_flag` tinyint(1) NOT NULL DEFAULT '0',
  `action` int NOT NULL DEFAULT '0',
  `action_chance` smallint NOT NULL DEFAULT '100',
  `wpguid` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.waypoint_scripts
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
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_world.waypoints
CREATE TABLE IF NOT EXISTS `waypoints` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `pointid` mediumint unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `point_comment` text,
  PRIMARY KEY (`entry`,`pointid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature waypoints';

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
