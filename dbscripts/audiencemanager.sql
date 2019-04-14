/*
SQLyog Ultimate v8.61 
MySQL - 5.1.37-community-log : Database - audiencemanager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`audiencemanager` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `audiencemanager`;

/*Table structure for table `QRTZ_BLOB_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;

CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `QRTZ_CALENDARS` */

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;

CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `QRTZ_CRON_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;

CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `QRTZ_FIRED_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;

CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `QRTZ_JOB_DETAILS` */

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;

CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `QRTZ_LOCKS` */

DROP TABLE IF EXISTS `QRTZ_LOCKS`;

CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS` */

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;

CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `QRTZ_SCHEDULER_STATE` */

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;

CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `QRTZ_SIMPLE_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `QRTZ_SIMPROP_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `QRTZ_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;

CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topicpageid` int(10) unsigned NOT NULL,
  `websiteid` smallint(5) unsigned NOT NULL,
  `socialappid` varchar(100) NOT NULL,
  `articleid` varchar(150) DEFAULT NULL,
  `shortenerhash` varchar(10) DEFAULT NULL,
  `shortenerurl` varchar(100) DEFAULT NULL,
  `topicname` varchar(100) CHARACTER SET utf8 NOT NULL,
  `message` varchar(2048) CHARACTER SET utf8 NOT NULL,
  `url` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  `scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `notificationmail` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(250) DEFAULT NULL,
  `viewcount` int(10) unsigned DEFAULT '0',
  `rowlock` tinyint(1) NOT NULL DEFAULT '0',
  `apireq` tinyint(1) DEFAULT NULL,
  `postedphotoid` varchar(255) DEFAULT NULL,
  `createdate` timestamp NULL DEFAULT NULL,
  `feedtimestamp` timestamp NULL DEFAULT NULL,
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_createdate` (`createdate`),
  KEY `idx_websiteid` (`websiteid`),
  KEY `idx_topicpageid` (`topicpageid`)
) ENGINE=InnoDB AUTO_INCREMENT=463717 DEFAULT CHARSET=latin1;

/*Table structure for table `emails` */

DROP TABLE IF EXISTS `emails`;

CREATE TABLE `emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `useremail` varchar(100) DEFAULT NULL,
  `toname` varchar(100) DEFAULT NULL,
  `toemail` varchar(100) NOT NULL,
  `ccemail` varchar(255) DEFAULT NULL,
  `bccemail` varchar(255) DEFAULT NULL,
  `fromemail` varchar(100) NOT NULL,
  `returnemail` varchar(100) DEFAULT NULL,
  `subject` varchar(200) CHARACTER SET utf8 NOT NULL,
  `data` text CHARACTER SET utf8,
  `status` varchar(20) NOT NULL DEFAULT '',
  `retrycount` tinyint(6) NOT NULL DEFAULT '0',
  `remarks` varchar(2048) CHARACTER SET utf8 DEFAULT NULL,
  `fromname` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `site` varchar(50) NOT NULL,
  `attachment` mediumblob,
  `attachmentname` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `websiteurl` text,
  `companyprofit` text CHARACTER SET utf8,
  `founder` text CHARACTER SET utf8,
  `location` varchar(100) DEFAULT NULL,
  `phoneno` varchar(100) DEFAULT NULL,
  `businessidea` text CHARACTER SET utf8,
  `companybusiness` text CHARACTER SET utf8,
  `competitors` text CHARACTER SET utf8,
  `team` text CHARACTER SET utf8,
  `foundersobligations` text CHARACTER SET utf8,
  `companyselection` text CHARACTER SET utf8,
  `hearus` text,
  `mailer` tinyint(4) NOT NULL DEFAULT '0',
  `archive1` text,
  `archive2` text,
  `archive3` text,
  `archive4` text,
  `archive5` text,
  `archive6` text,
  `archive7` text,
  `createdate` datetime NOT NULL,
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_status_retrycount_createdate` (`status`,`retrycount`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=latin1;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(32) NOT NULL,
  `roledescription` varchar(255) DEFAULT NULL,
  `sortorder` tinyint(9) unsigned DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ky_key_idx` (`rolename`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `topicpage` */

DROP TABLE IF EXISTS `topicpage`;

CREATE TABLE `topicpage` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `websiteid` smallint(6) NOT NULL,
  `entityname` varchar(100) CHARACTER SET utf8 NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pageid` varchar(255) DEFAULT NULL,
  `accesstoken` varchar(512) DEFAULT NULL,
  `pagename` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `link` varchar(512) CHARACTER SET utf8 DEFAULT NULL,
  `likes` int(10) unsigned NOT NULL DEFAULT '0',
  `friends` int(11) NOT NULL DEFAULT '0',
  `followers` int(11) NOT NULL DEFAULT '0',
  `shares` int(10) unsigned DEFAULT NULL,
  `talking_about_count` int(10) unsigned DEFAULT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(4096) CHARACTER SET utf8 DEFAULT NULL,
  `remarks` varchar(1024) DEFAULT NULL,
  `feedurl` varchar(512) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `feedpicktime` mediumint(9) NOT NULL DEFAULT '0',
  `poststhreshold` tinyint(3) unsigned DEFAULT NULL,
  `multiplefeedurl` tinyint(4) DEFAULT '0',
  `push_all_article` tinyint(4) DEFAULT '0',
  `error` varchar(500) DEFAULT NULL,
  `hashtags` varchar(100) DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `utm_source` varchar(50) DEFAULT NULL,
  `utm_medium` varchar(50) DEFAULT NULL,
  `utm_campaign` varchar(50) DEFAULT NULL,
  `push_time` decimal(4,2) DEFAULT '0.00',
  `type` enum('PROFILE','PAGE') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_websiteid_entityname` (`websiteid`,`entityname`),
  KEY `idx_entityname` (`entityname`),
  KEY `idx_createdate` (`createdate`)
) ENGINE=InnoDB AUTO_INCREMENT=2366 DEFAULT CHARSET=latin1;

/*Table structure for table `topicpage_additionalfeeds` */

DROP TABLE IF EXISTS `topicpage_additionalfeeds`;

CREATE TABLE `topicpage_additionalfeeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topicurl` varchar(512) NOT NULL,
  `feedurl` varchar(512) NOT NULL,
  `createdate` datetime NOT NULL,
  `topicpageid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `topicpage_article` */

DROP TABLE IF EXISTS `topicpage_article`;

CREATE TABLE `topicpage_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `topicpageid` int(10) unsigned NOT NULL,
  `articleid` int(10) unsigned NOT NULL,
  `postid` varchar(100) DEFAULT NULL,
  `status` enum('PROCESSED','PENDING','DELETED') DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `impressions_total` int(10) unsigned DEFAULT '0',
  `impressions_unique` int(10) unsigned DEFAULT '0',
  `clicks_total` int(10) unsigned DEFAULT '0',
  `clicks_unique` int(10) unsigned DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_articleid` (`articleid`),
  KEY `idx_createdate` (`createdate`),
  KEY `idx_topicpageid` (`topicpageid`)
) ENGINE=InnoDB AUTO_INCREMENT=471121 DEFAULT CHARSET=latin1;

/*Table structure for table `topicpage_history` */

DROP TABLE IF EXISTS `topicpage_history`;

CREATE TABLE `topicpage_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topicpageid` int(10) unsigned NOT NULL,
  `likes` int(10) unsigned NOT NULL,
  `shares` int(10) unsigned NOT NULL,
  `dislikes` int(10) unsigned NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_createdate` (`createdate`),
  KEY `idx_topicpageid` (`topicpageid`)
) ENGINE=InnoDB AUTO_INCREMENT=1621616 DEFAULT CHARSET=latin1;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` smallint(32) unsigned NOT NULL AUTO_INCREMENT,
  `emailaddress` varchar(100) NOT NULL,
  `passphrase` varchar(100) NOT NULL,
  `decrypted` varchar(100) NOT NULL,
  `fullname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `mobilenumber` varchar(10) DEFAULT '',
  `emailaddress1` varchar(100) DEFAULT NULL,
  `isenabled` tinyint(1) NOT NULL DEFAULT '1',
  `validfrom` datetime DEFAULT NULL,
  `validtill` datetime DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_emailaddress` (`emailaddress`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Table structure for table `user_permission` */

DROP TABLE IF EXISTS `user_permission`;

CREATE TABLE `user_permission` (
  `userid` smallint(5) unsigned NOT NULL,
  `websiteid` smallint(5) unsigned NOT NULL,
  `roleid` smallint(5) unsigned NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `up_userid_idx` (`userid`),
  KEY `up_websiteid_idx` (`websiteid`),
  KEY `FK_user_permission_role` (`roleid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `website` */

DROP TABLE IF EXISTS `website`;

CREATE TABLE `website` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `socialappname` varchar(50) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `socialappid` varchar(50) NOT NULL,
  `socialapisecret` varchar(50) NOT NULL,
  `siteurl` varchar(255) NOT NULL,
  `contactemail` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `emailfromaddress` varchar(100) DEFAULT NULL,
  `accesstoken` varchar(255) DEFAULT NULL,
  `accesstokensecret` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL COMMENT 'name of website for which data has to be picked from feed',
  `postasuser` tinyint(4) DEFAULT '0',
  `userid` varchar(100) DEFAULT NULL,
  `pageviewsapi` varchar(255) DEFAULT NULL,
  `shortenerapi` varchar(255) DEFAULT NULL,
  `sitecode` varchar(20) NOT NULL,
  `socialcode` varchar(20) NOT NULL,
  `expires` int(11) DEFAULT '0',
  `expiresat` timestamp NULL DEFAULT NULL,
  `regeneratetoken` tinyint(4) DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `wb_active_idx` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=latin1;

ALTER TABLE `topicpage` 
   ADD COLUMN `hashtags_condition` VARCHAR(255) NULL AFTER `hashtags`;
