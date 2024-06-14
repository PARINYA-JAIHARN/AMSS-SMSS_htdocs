<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql_create="ALTER TABLE `budget_deega` ADD `direct_pay` INT NOT NULL DEFAULT '0' AFTER `status`, ADD `direct_pay_name` VARCHAR(200) NOT NULL AFTER `direct_pay`" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="ALTER TABLE `budget_po` ADD `direct_pay` INT NOT NULL DEFAULT '0' AFTER `rec_date`, ADD `direct_pay_name` VARCHAR(200) NOT NULL AFTER `direct_pay`" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `student_main_num` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(10) NOT NULL,
  `ed_year` varchar(4) NOT NULL,
  `student` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="ALTER TABLE `student_main_main` ADD INDEX(`ed_year`)" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="ALTER TABLE `student_main_main` ADD INDEX(`school_code`)" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="ALTER TABLE  `person_sch_main` ADD INDEX (`school_code`)" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="ALTER TABLE `achievement_main` ADD `student_num` INT NOT NULL DEFAULT '0' AFTER `rec_date`" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `student_main_expand1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(10) NOT NULL,
  `person_id` varchar(13) NOT NULL,
  `prename` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `e_name` varchar(50) NOT NULL,
  `e_surname` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `blood` varchar(2) NOT NULL,
  `race` varchar(30) NOT NULL,
  `nationlity` varchar(30) NOT NULL,
  `religion` varchar(30) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `student_main_expand2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(10) NOT NULL,
  `std_person_id` varchar(13) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `relationship` varchar(50) NOT NULL,
  `p_id` varchar(13) NOT NULL,
  `p_prename` varchar(50) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  `p_surname` varchar(50) NOT NULL,
  `p_tel` varchar(50) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `student_main_expand3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(10) NOT NULL,
  `std_person_id` varchar(13) NOT NULL,
  `home_status` tinyint(4) NOT NULL DEFAULT '1',
  `home_id` varchar(50) NOT NULL,
  `home_number` varchar(50) NOT NULL,
  `village` varchar(50) NOT NULL,
  `road` varchar(50) NOT NULL,
  `tambon` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8" ;
$query = mysqli_query($connect,$sql_create);

//โมดูลสิ่งก่อสร้าง
$sql_create="CREATE TABLE IF NOT EXISTS `building_category` (
  `id` int(11) NOT NULL auto_increment,
  `cate_code` varchar(2) NOT NULL,
  `cate_name` varchar(100) NOT NULL,
  `cate_order` int(11) default NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `cate_code` (`cate_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `building_file` (
  `id` int(11) NOT NULL auto_increment,
  `building_id` int(11) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `building_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(10) NOT NULL,
  `model_code` varchar(6) NOT NULL,
  `get_year` varchar(4) DEFAULT NULL,
  `build_date` date DEFAULT NULL,
  `room` int(11) DEFAULT '0',
  `other` varchar(150) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `building_model` (
  `id` int(11) NOT NULL auto_increment,
  `model_code` varchar(6) NOT NULL,
  `type_code` varchar(4) NOT NULL,
  `model_name` varchar(100) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `model_code` (`model_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `building_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL DEFAULT '0',
  `p2` tinyint(4) NOT NULL DEFAULT '0',
  `p3` tinyint(4) NOT NULL DEFAULT '0',
  `p4` tinyint(4) NOT NULL DEFAULT '0',
  `p5` tinyint(4) NOT NULL DEFAULT '0',
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `building_type` (
  `id` int(11) NOT NULL auto_increment,
  `type_code` varchar(4) NOT NULL,
  `cate_code` varchar(2) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `type_code` (`type_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `building_building` (
  `id` int(11) NOT NULL auto_increment,
  `school_code` varchar(10) NOT NULL,
  `get_year` varchar(4) NOT NULL,
  `budget` double NOT NULL,
  `item` varchar(250) NOT NULL,
  `other` varchar(250) default NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `building_fix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(10) NOT NULL,
  `get_year` varchar(4) NOT NULL,
  `budget` double NOT NULL,
  `other` varchar(250) DEFAULT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8" ;
$query = mysqli_query($connect,$sql_create);

$sql_create="CREATE TABLE IF NOT EXISTS `building_heavy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(10) NOT NULL,
  `get_year` varchar(4) NOT NULL,
  `budget` double NOT NULL,
  `other` varchar(250) DEFAULT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8" ;
$query = mysqli_query($connect,$sql_create);

$sql="INSERT INTO `system_module` (`module`, `module_desc`, `workgroup`, `module_active`, `module_order`, `web_link`, `url`, `where_work`) VALUES ('warroom', '﻿วิเคราะห์สภาพการณ์', 1, 1, 0, 0, '', 0)" ;
$dbquery = mysqli_query($connect,$sql);
?>
