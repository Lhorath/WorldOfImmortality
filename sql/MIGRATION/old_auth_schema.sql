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

-- Dumping structure for table woi_auth.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `gmlevel` tinyint unsigned NOT NULL DEFAULT '0',
  `sessionkey` longtext,
  `v` longtext,
  `s` longtext,
  `email` text,
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `failed_logins` int unsigned NOT NULL DEFAULT '0',
  `locked` tinyint unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint NOT NULL DEFAULT '0',
  `expansion` tinyint unsigned NOT NULL DEFAULT '0',
  `mutetime` bigint unsigned NOT NULL DEFAULT '0',
  `locale` tinyint unsigned NOT NULL DEFAULT '0',
  `recruiter` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `idx_gmlevel` (`gmlevel`)
) ENGINE=MyISAM AUTO_INCREMENT=108689 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Account System';

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.account_access
CREATE TABLE IF NOT EXISTS `account_access` (
  `id` int unsigned NOT NULL,
  `gmlevel` tinyint unsigned NOT NULL,
  `RealmID` int NOT NULL,
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.account_banned
CREATE TABLE IF NOT EXISTS `account_banned` (
  `id` int NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` bigint NOT NULL DEFAULT '0',
  `unbandate` bigint NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Ban List';

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.account_passhistory
CREATE TABLE IF NOT EXISTS `account_passhistory` (
  `id` int unsigned NOT NULL,
  `sha_pass_hash` varchar(40) NOT NULL,
  `date_changed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.aowow_account
CREATE TABLE IF NOT EXISTS `aowow_account` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` longtext,
  `v` longtext,
  `s` longtext,
  `email` text,
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(30) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int unsigned NOT NULL DEFAULT '0',
  `locked` tinyint unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint NOT NULL DEFAULT '0',
  `expansion` tinyint unsigned NOT NULL DEFAULT '2',
  `mutetime` bigint unsigned NOT NULL DEFAULT '0',
  `locale` tinyint unsigned NOT NULL DEFAULT '0',
  `recruiter` int NOT NULL DEFAULT '0',
  `gmlevel` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Account System';

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.autobroadcast
CREATE TABLE IF NOT EXISTS `autobroadcast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `next` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.donated_for
CREATE TABLE IF NOT EXISTS `donated_for` (
  `vote_id` int unsigned NOT NULL AUTO_INCREMENT,
  `acc_id` int NOT NULL DEFAULT '0',
  `char_name` varchar(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `item` bigint NOT NULL DEFAULT '0',
  `num_of_item` bigint NOT NULL DEFAULT '0',
  UNIQUE KEY `vote_id` (`vote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.donation_coins
CREATE TABLE IF NOT EXISTS `donation_coins` (
  `id` bigint unsigned NOT NULL,
  `coins` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.donation_history
CREATE TABLE IF NOT EXISTS `donation_history` (
  `entry` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int unsigned NOT NULL,
  `comment` text,
  `gear_status` longblob,
  `gm_comments` text,
  UNIQUE KEY `entry` (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.donation_log
CREATE TABLE IF NOT EXISTS `donation_log` (
  `entry` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(32) DEFAULT NULL,
  `txn_id` varchar(32) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `amount` float unsigned DEFAULT NULL,
  `info` blob,
  `account_id` int unsigned DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB AUTO_INCREMENT=1345 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.donation_packages
CREATE TABLE IF NOT EXISTS `donation_packages` (
  `entry` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `discription` varchar(128) NOT NULL,
  `items` longblob,
  PRIMARY KEY (`entry`),
  UNIQUE KEY `entry` (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.donation_sets
CREATE TABLE IF NOT EXISTS `donation_sets` (
  `setguid` bigint NOT NULL AUTO_INCREMENT,
  `guid` int NOT NULL DEFAULT '0',
  `setindex` tinyint NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `item0` int NOT NULL DEFAULT '0',
  `item1` int NOT NULL DEFAULT '0',
  `item2` int NOT NULL DEFAULT '0',
  `item3` int NOT NULL DEFAULT '0',
  `item4` int NOT NULL DEFAULT '0',
  `item5` int NOT NULL DEFAULT '0',
  `item6` int NOT NULL DEFAULT '0',
  `item7` int NOT NULL DEFAULT '0',
  `item8` int NOT NULL DEFAULT '0',
  `item9` int NOT NULL DEFAULT '0',
  `item10` int NOT NULL DEFAULT '0',
  `item11` int NOT NULL DEFAULT '0',
  `item12` int NOT NULL DEFAULT '0',
  `item13` int NOT NULL DEFAULT '0',
  `item14` int NOT NULL DEFAULT '0',
  `item15` int NOT NULL DEFAULT '0',
  `item16` int NOT NULL DEFAULT '0',
  `item17` int NOT NULL DEFAULT '0',
  `item18` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`setguid`),
  UNIQUE KEY `idx_set` (`guid`,`setguid`,`setindex`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.gm_perform
CREATE TABLE IF NOT EXISTS `gm_perform` (
  `name` varchar(50) NOT NULL,
  `b_totaltime` int unsigned NOT NULL,
  `f_totaltime` int unsigned NOT NULL,
  `b_time_week` int unsigned NOT NULL,
  `f_time_week` int unsigned NOT NULL,
  `totaltime_week` int unsigned NOT NULL,
  `b_tickettotal` int unsigned NOT NULL,
  `f_tickettotal` int unsigned NOT NULL,
  `b_ticket_week` int unsigned NOT NULL,
  `f_ticket_week` int unsigned NOT NULL,
  `tickettotal_week` int unsigned NOT NULL,
  `points_total` int unsigned NOT NULL,
  `points_week` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.instance_purge_login
CREATE TABLE IF NOT EXISTS `instance_purge_login` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.instance_purge_logs
CREATE TABLE IF NOT EXISTS `instance_purge_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reason` varchar(255) NOT NULL,
  `realm` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.ip_banned
CREATE TABLE IF NOT EXISTS `ip_banned` (
  `ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `bandate` bigint NOT NULL,
  `unbandate` bigint NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Banned IPs';

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `time` int NOT NULL,
  `realm` int NOT NULL,
  `type` int NOT NULL,
  `string` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.quality_assurance
CREATE TABLE IF NOT EXISTS `quality_assurance` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `rank` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `player_name` varchar(100) NOT NULL,
  `ticket_number` varchar(100) NOT NULL,
  `proper_scripting` varchar(11) NOT NULL,
  `probing_questions` varchar(11) NOT NULL,
  `troubleshooting` varchar(11) NOT NULL,
  `further_assist` varchar(11) NOT NULL,
  `proper_closing` varchar(11) NOT NULL,
  `issue_resolved` varchar(11) NOT NULL,
  `deadair` varchar(11) NOT NULL,
  `deadair_extend` varchar(11) NOT NULL,
  `profanity` varchar(11) NOT NULL,
  `dont_know` varchar(11) NOT NULL,
  `unauth_port` varchar(11) NOT NULL,
  `rude` varchar(11) NOT NULL,
  `lied` varchar(11) NOT NULL,
  `total` varchar(11) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `assessor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`deadair`,`deadair_extend`,`profanity`,`dont_know`,`unauth_port`,`rude`,`lied`,`total`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.realmcharacters
CREATE TABLE IF NOT EXISTS `realmcharacters` (
  `realmid` int unsigned NOT NULL DEFAULT '0',
  `acctid` bigint unsigned NOT NULL,
  `numchars` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`),
  KEY `acctid_2` (`acctid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Realm Character Tracker';

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.realmlist
CREATE TABLE IF NOT EXISTS `realmlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(32) NOT NULL DEFAULT '127.0.0.1',
  `port` int NOT NULL DEFAULT '8085',
  `icon` tinyint unsigned NOT NULL DEFAULT '0',
  `color` tinyint unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int unsigned NOT NULL DEFAULT '11159',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Realm System';

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.uptime
CREATE TABLE IF NOT EXISTS `uptime` (
  `realmid` int unsigned NOT NULL,
  `starttime` bigint unsigned NOT NULL DEFAULT '0',
  `startstring` varchar(64) NOT NULL DEFAULT '',
  `uptime` bigint unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Uptime system';

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.voted_for
CREATE TABLE IF NOT EXISTS `voted_for` (
  `vote_id` int unsigned NOT NULL AUTO_INCREMENT,
  `acc_id` int NOT NULL DEFAULT '0',
  `char_name` varchar(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `item` bigint NOT NULL DEFAULT '0',
  `num_of_item` bigint NOT NULL DEFAULT '0',
  UNIQUE KEY `vote_id` (`vote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95968 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.voting
CREATE TABLE IF NOT EXISTS `voting` (
  `user_ip` varchar(30) NOT NULL,
  `sites` int unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table woi_auth.voting_points
CREATE TABLE IF NOT EXISTS `voting_points` (
  `id` bigint unsigned NOT NULL,
  `points` smallint unsigned NOT NULL DEFAULT '0',
  `date` varchar(12) NOT NULL DEFAULT '20081214',
  `date_points` mediumint unsigned NOT NULL DEFAULT '0',
  `voted_sites` smallint NOT NULL DEFAULT '0',
  `user_ip` varchar(12) NOT NULL DEFAULT '0.0.0.0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `sites` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
