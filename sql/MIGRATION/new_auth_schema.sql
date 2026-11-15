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

-- Dumping structure for table dev_woi_auth.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` binary(32) NOT NULL,
  `verifier` binary(32) NOT NULL,
  `session_key_auth` binary(40) DEFAULT NULL,
  `session_key_bnet` varbinary(64) DEFAULT NULL,
  `totp_secret` varbinary(128) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reg_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int unsigned NOT NULL DEFAULT '0',
  `locked` tinyint unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint unsigned NOT NULL DEFAULT '2',
  `mutetime` bigint NOT NULL DEFAULT '0',
  `mutereason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `muteby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `locale` tinyint unsigned NOT NULL DEFAULT '0',
  `os` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timezone_offset` smallint NOT NULL DEFAULT '0',
  `recruiter` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.account_access
CREATE TABLE IF NOT EXISTS `account_access` (
  `AccountID` int unsigned NOT NULL,
  `SecurityLevel` tinyint unsigned NOT NULL,
  `RealmID` int NOT NULL DEFAULT '-1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AccountID`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.account_banned
CREATE TABLE IF NOT EXISTS `account_banned` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int unsigned NOT NULL DEFAULT '0',
  `unbandate` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ban List';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.account_muted
CREATE TABLE IF NOT EXISTS `account_muted` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mutedate` int unsigned NOT NULL DEFAULT '0',
  `mutetime` int unsigned NOT NULL DEFAULT '0',
  `mutedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mutereason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='mute List';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.autobroadcast
CREATE TABLE IF NOT EXISTS `autobroadcast` (
  `realmid` int NOT NULL DEFAULT '-1',
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint unsigned DEFAULT '1',
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.build_auth_key
CREATE TABLE IF NOT EXISTS `build_auth_key` (
  `build` int NOT NULL,
  `platform` char(4) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `arch` char(4) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `type` char(4) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `key` binary(16) NOT NULL,
  PRIMARY KEY (`build`,`platform`,`arch`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.build_executable_hash
CREATE TABLE IF NOT EXISTS `build_executable_hash` (
  `build` int NOT NULL,
  `platform` char(4) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `executableHash` binary(20) NOT NULL,
  PRIMARY KEY (`build`,`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.build_info
CREATE TABLE IF NOT EXISTS `build_info` (
  `build` int NOT NULL,
  `majorVersion` int DEFAULT NULL,
  `minorVersion` int DEFAULT NULL,
  `bugfixVersion` int DEFAULT NULL,
  `hotfixVersion` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.ip_banned
CREATE TABLE IF NOT EXISTS `ip_banned` (
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `bandate` int unsigned NOT NULL,
  `unbandate` int unsigned NOT NULL,
  `bannedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Banned IPs';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `time` int unsigned NOT NULL,
  `realm` int unsigned NOT NULL,
  `type` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.logs_ip_actions
CREATE TABLE IF NOT EXISTS `logs_ip_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier',
  `account_id` int unsigned NOT NULL COMMENT 'Account ID',
  `character_guid` bigint unsigned NOT NULL COMMENT 'Character Guid',
  `realm_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Realm ID',
  `type` tinyint unsigned NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `systemnote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Notes inserted by system',
  `unixtime` int unsigned NOT NULL COMMENT 'Unixtime',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Allows users to add a comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Used to log ips of individual actions';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.rbac_account_permissions
CREATE TABLE IF NOT EXISTS `rbac_account_permissions` (
  `accountId` int unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_account_permissions__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account-Permission relation';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.rbac_default_permissions
CREATE TABLE IF NOT EXISTS `rbac_default_permissions` (
  `secId` int unsigned NOT NULL COMMENT 'Security Level id',
  `permissionId` int unsigned NOT NULL COMMENT 'permission id',
  `realmId` int NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`secId`,`permissionId`,`realmId`),
  KEY `fk__rbac_default_permissions__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_default_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Default permission to assign to different account security levels';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.rbac_linked_permissions
CREATE TABLE IF NOT EXISTS `rbac_linked_permissions` (
  `id` int unsigned NOT NULL COMMENT 'Permission id',
  `linkedId` int unsigned NOT NULL COMMENT 'Linked Permission id',
  PRIMARY KEY (`id`,`linkedId`),
  KEY `fk__rbac_linked_permissions__rbac_permissions1` (`id`),
  KEY `fk__rbac_linked_permissions__rbac_permissions2` (`linkedId`),
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions1` FOREIGN KEY (`id`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions2` FOREIGN KEY (`linkedId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permission - Linked Permission relation';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.rbac_permissions
CREATE TABLE IF NOT EXISTS `rbac_permissions` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permission List';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.realmcharacters
CREATE TABLE IF NOT EXISTS `realmcharacters` (
  `realmid` int unsigned NOT NULL DEFAULT '0',
  `acctid` int unsigned NOT NULL,
  `numchars` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Realm Character Tracker';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.realmlist
CREATE TABLE IF NOT EXISTS `realmlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '255.255.255.0',
  `port` smallint unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint unsigned NOT NULL DEFAULT '0',
  `flag` tinyint unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `population` float NOT NULL DEFAULT '0',
  `gamebuild` int unsigned NOT NULL DEFAULT '12340',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Realm System';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.secret_digest
CREATE TABLE IF NOT EXISTS `secret_digest` (
  `id` int unsigned NOT NULL,
  `digest` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.updates
CREATE TABLE IF NOT EXISTS `updates` (
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of all applied updates in this database.';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.updates_include
CREATE TABLE IF NOT EXISTS `updates_include` (
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of directories where we want to include sql updates.';

-- Data exporting was unselected.

-- Dumping structure for table dev_woi_auth.uptime
CREATE TABLE IF NOT EXISTS `uptime` (
  `realmid` int unsigned NOT NULL,
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `uptime` int unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Uptime system';

-- Data exporting was unselected.

-- Dumping structure for view dev_woi_auth.vw_log_history
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_log_history` (
	`First Logged` DATETIME NULL,
	`Last Logged` DATETIME NULL,
	`Occurrences` BIGINT NOT NULL,
	`Realm` VARCHAR(1) NULL COLLATE 'utf8mb4_unicode_ci',
	`type` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`level` TINYINT UNSIGNED NOT NULL,
	`string` TEXT NULL COLLATE 'utf8mb4_unicode_ci'
);

-- Dumping structure for view dev_woi_auth.vw_rbac
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_rbac` (
	`Permission ID` INT UNSIGNED NOT NULL COMMENT 'Linked Permission id',
	`Permission Group` INT UNSIGNED NOT NULL COMMENT 'Permission id',
	`Security Level` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`Permission` VARCHAR(1) NULL COMMENT 'Permission name' COLLATE 'utf8mb4_unicode_ci'
);

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_log_history`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY INVOKER VIEW `dev_woi_auth`.`vw_log_history` AS select from_unixtime(min(`dev_woi_auth`.`logs`.`time`)) AS `First Logged`,from_unixtime(max(`dev_woi_auth`.`logs`.`time`)) AS `Last Logged`,count(0) AS `Occurrences`,`dev_woi_auth`.`realmlist`.`name` AS `Realm`,`dev_woi_auth`.`logs`.`type` AS `type`,`dev_woi_auth`.`logs`.`level` AS `level`,`dev_woi_auth`.`logs`.`string` AS `string` from (`dev_woi_auth`.`logs` left join `dev_woi_auth`.`realmlist` on((`dev_woi_auth`.`logs`.`realm` = `dev_woi_auth`.`realmlist`.`id`))) group by `dev_woi_auth`.`logs`.`string`,`dev_woi_auth`.`logs`.`type`,`dev_woi_auth`.`logs`.`realm`
;

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_rbac`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY INVOKER VIEW `dev_woi_auth`.`vw_rbac` AS select `t1`.`linkedId` AS `Permission ID`,`t1`.`id` AS `Permission Group`,ifnull(`t2`.`secId`,'linked') AS `Security Level`,`t3`.`name` AS `Permission` from ((`dev_woi_auth`.`rbac_linked_permissions` `t1` left join `dev_woi_auth`.`rbac_default_permissions` `t2` on((`t1`.`id` = `t2`.`permissionId`))) left join `dev_woi_auth`.`rbac_permissions` `t3` on((`t1`.`linkedId` = `t3`.`id`)))
;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
