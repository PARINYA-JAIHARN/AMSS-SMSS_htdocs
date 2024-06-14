<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="CREATE TABLE IF NOT EXISTS `system_sync_smss` (
  `id` int(11) NOT NULL auto_increment,
  `office_code` int(11) NOT NULL,
  `system_name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `server_ip` varchar(50) NOT NULL,
  `requester_username` varchar(50) NOT NULL,
  `sync_code` varchar(50) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE `system_sync_smss` ADD `requester_username` VARCHAR(50) NOT NULL AFTER `server_ip`";
$query = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `system_sync_smss_2` (
  `id` int(11) NOT NULL auto_increment,
  `office_code` int(11) NOT NULL,
  `sync_code` varchar(50) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE `bets_item` ADD `doc_item` VARCHAR(150) NOT NULL AFTER `media_item`";
$query = mysqli_query($connect,$sql);

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
