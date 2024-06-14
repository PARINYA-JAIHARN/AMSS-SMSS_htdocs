<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="CREATE TABLE `warroom_permission` (
  `id` int(11) NOT NULL auto_increment,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) default NULL,
  `p2` tinyint(4) default NULL,
  `p3` tinyint(4) default NULL,
  `school_code` varchar(15) default NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `person_main` ADD `birthday` DATE NULL DEFAULT NULL AFTER `rec_date`";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `person_sch_main` ADD `birthday` DATE NULL DEFAULT NULL AFTER `other`";
$dbquery = mysqli_query($connect,$sql);


$sql="ALTER TABLE `student_main_main` ADD INDEX(`ed_year`)";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `student_main_main` ADD INDEX(`school_code`)";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `person_sch_main` ADD INDEX (`school_code`)";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `achievement_main` ADD `student_num` INT NOT NULL DEFAULT '0' AFTER `rec_date`";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `bets_permission` ADD `p4` TINYINT NOT NULL DEFAULT '0' AFTER `p3`";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `student_main_num` ADD  `pre_primary_std` INT NOT NULL AFTER  `ed_year` ,
ADD  `primary_std` INT NOT NULL AFTER  `pre_primary_std` ,
ADD  `secondary_std` INT NOT NULL AFTER  `primary_std`";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `student_main_num` ADD  `pre_primary_std` INT NOT NULL AFTER  `ed_year` ,
ADD  `primary_std` INT NOT NULL AFTER  `pre_primary_std` ,
ADD  `secondary_std` INT NOT NULL AFTER  `primary_std`";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `student_main_num` ADD `c1` INT NOT NULL AFTER `ed_year`, ADD `c2` INT NOT NULL AFTER `c1`, ADD `c3` INT NOT NULL AFTER `c2`, ADD `c4` INT NOT NULL AFTER `c3`, ADD `c5` INT NOT NULL AFTER `c4`, ADD `c6` INT NOT NULL AFTER `c5`, ADD `c7` INT NOT NULL AFTER `c6`, ADD `c8` INT NOT NULL AFTER `c7`, ADD `c9` INT NOT NULL AFTER `c8`, ADD `c10` INT NOT NULL AFTER `c9`, ADD `c11` INT NOT NULL AFTER `c10`, ADD `c12` INT NOT NULL AFTER `c11`, ADD `c13` INT NOT NULL AFTER `c12`, ADD `c14` INT NOT NULL AFTER `c13`, ADD `c15` INT NOT NULL AFTER `c14`";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `achievement_permission` CHANGE `p1` `p1` TINYINT(4) NOT NULL DEFAULT '0'";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `achievement_permission` CHANGE `p2` `p2` TINYINT(4) NOT NULL DEFAULT '0'";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `achievement_permission` CHANGE `p3` `p3` TINYINT(4) NOT NULL DEFAULT '0'";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `bookregister_receive` ADD `level` TINYINT NOT NULL DEFAULT '1' AFTER `secret`";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `bets_test` ADD `open_test` TINYINT NOT NULL DEFAULT '0' AFTER `test_active`";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `bets_item` ADD `solve_doc` VARCHAR(150) NOT NULL DEFAULT '' AFTER `doc_item`";
$dbquery = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `bets_qc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `test_id` int(11) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `bets_book_item` ADD `question` VARCHAR(250) NOT NULL AFTER `item_number`";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `work_main` ADD `homework` VARCHAR(50) NOT NULL AFTER `officer`";
$dbquery = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `supervision_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_code` int(11) NOT NULL,
  `activity_name` varchar(150) NOT NULL,
  `unit_name` varchar(50) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activity_code` (`activity_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8";
$dbquery = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `supervision_activity_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(10) DEFAULT NULL,
  `activity` int(11) NOT NULL,
  `activity_rate` float DEFAULT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `system_module` ADD `menu_pic` VARCHAR(25) NOT NULL AFTER `where_work`";
$dbquery = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `supervision_teachtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `school` varchar(10) NOT NULL,
  `ed_year` int(11) NOT NULL,
  `term` tinyint(4) NOT NULL,
  `subject` varchar(20) NOT NULL DEFAULT '0',
  `class_level` tinyint(11) NOT NULL,
  `room` tinyint(4) NOT NULL DEFAULT '1',
  `rec_date` date NOT NULL,
  `officer` varchar(13) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8";
$dbquery = mysqli_query($connect,$sql);

?>
