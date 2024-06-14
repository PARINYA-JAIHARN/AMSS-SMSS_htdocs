<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql_create="ALTER TABLE `supervision_main` ADD `status` TINYINT NOT NULL DEFAULT '0' AFTER `rec_date` " ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE `system_school_detail` (
  `school_code` varchar(10) NOT NULL default '',
  `school_code10` varchar(10) NOT NULL,
  `moo_code` varchar(8) NOT NULL,
  `moo` varchar(50) NOT NULL,
  `tambon` varchar(50) NOT NULL,
  `amphoe` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  `postcode` varchar(50) NOT NULL,
  `map` varchar(100) NOT NULL,
  `edschool_type` tinyint(4) NOT NULL default '0',
  `rec_date` date NOT NULL,
  `officer` varchar(13) NOT NULL,
  PRIMARY KEY  (`school_code`),
  UNIQUE KEY `school_code10` (`school_code10`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE `bets_book_item` (
  `id` int(11) NOT NULL auto_increment,
  `test_id` int(11) NOT NULL,
  `item_number` int(11) NOT NULL,
  `indicator_code` varchar(14) NOT NULL,
  `class_code` tinyint(4) NOT NULL,
  `item_type` tinyint(4) NOT NULL default '0',
  `answer_num` tinyint(4) NOT NULL,
  `right_answer` tinyint(4) NOT NULL,
  `score` float NOT NULL default '1',
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 " ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE `bets_paper_answer` (
  `id` int(11) NOT NULL auto_increment,
  `school` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `person_id` varchar(13) NOT NULL,
  `item_type` tinyint(4) NOT NULL,
  `item_id` int(11) NOT NULL,
  `answer` tinyint(4) NOT NULL,
  `score` float NOT NULL,
  `item_score` float NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `school` (`school`),
  KEY `test_id` (`test_id`),
  KEY `person_id` (`person_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 " ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE `bets_paper_test_1` (
  `id` int(11) NOT NULL auto_increment,
  `test_name` varchar(150) NOT NULL,
  `s_group` int(11) NOT NULL,
  `class_room` tinyint(4) NOT NULL,
  `level` tinyint(4) NOT NULL default '0',
  `item_num` int(11) NOT NULL,
  `test_score` int(11) NOT NULL,
  `test_time` int(11) NOT NULL,
  `g1` float NOT NULL,
  `g2` float NOT NULL,
  `test_active` tinyint(4) NOT NULL,
  `profile_active` tinyint(4) NOT NULL default '0',
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 " ;
$query = mysqli_query($connect,$sql_create);

$sql_create="ALTER TABLE `work_main` ADD INDEX ( `work_date` )" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="ALTER TABLE `work_main` ADD INDEX ( `person_id` )" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="ALTER TABLE `bookregister_permission` CHANGE `p1` `p1` TINYINT(4) NULL DEFAULT NULL" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="ALTER TABLE `system_sync_smss_2` ADD `remote_ip` VARCHAR(50) NOT NULL AFTER `sync_code`" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="ALTER TABLE `system_sync_smss_2` ADD `smss_url` VARCHAR(150) NOT NULL AFTER `remote_ip`" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `delegate_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `start` date NOT NULL,
  `finish` date NOT NULL,
  `remark` varchar(250) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `system_smss_permission` (
  `id` int(11) NOT NULL auto_increment,
  `school` varchar(10) default NULL,
  `status` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1" ;
$query = mysqli_query($connect,$sql_create);

?>
