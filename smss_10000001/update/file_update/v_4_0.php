<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="ALTER TABLE `savings_money` ADD INDEX(`std_id`)" ;
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `savings_money` ADD INDEX(`room`)" ;
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `savings_money` ADD INDEX(`level_class`)" ;
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `savings_money` ADD INDEX(`acc_type`)" ;
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `savings_money` ADD INDEX(`day_act`)" ;
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `student_main` ADD INDEX(`class_now`)" ;
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `student_main` ADD INDEX(`room`)" ;
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE `bets_item` ADD `doc_item` VARCHAR(150) NOT NULL AFTER `media_item`" ;
$dbquery = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `system_export_list` (
  `id` int(11) NOT NULL auto_increment,
  `data_name` varchar(50) NOT NULL,
  `thai_dataname` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `data_name` (`data_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$dbquery = mysqli_query($connect,$sql);

$sql="INSERT INTO `system_export_list` VALUES (1, 'person', 'ข้อมูลครูและบุคลากร')" ;
$dbquery = mysqli_query($connect,$sql);
$sql="INSERT INTO `system_export_list` VALUES (2, 'student', 'ข้อมูลพื้นฐานนักเรียน')" ;
$dbquery = mysqli_query($connect,$sql);
$sql="INSERT INTO `system_export_list` VALUES (3, 'onet', 'ผลสอบ O-NET')" ;
$dbquery = mysqli_query($connect,$sql);
$sql="INSERT INTO `system_export_list` VALUES (4, 'plan', 'แผนปฏิบัติการประจำปี')" ;
$dbquery = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `system_export_log` (
  `id` int(11) NOT NULL auto_increment,
  `computer_ip` varchar(25) NOT NULL,
  `requester` varchar(50) NOT NULL,
  `login_time` datetime NOT NULL,
  `data` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$dbquery = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `system_export_permission` (
  `id` int(11) NOT NULL auto_increment,
  `requester` varchar(50) NOT NULL,
  `data_name` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$dbquery = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `system_export_requester` (
  `id` int(11) NOT NULL auto_increment,
  `requester` varchar(50) NOT NULL,
  `thai_requester` varchar(150) NOT NULL,
  `requester_server_id` varchar(50) NOT NULL,
  `requester_password` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL default '0',
  `rec_date` date NOT NULL,
  `officer` varchar(13) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `requester` (`requester`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$dbquery = mysqli_query($connect,$sql);

?>
