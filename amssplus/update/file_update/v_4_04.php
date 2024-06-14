<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="CREATE TABLE `system_sync_code` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `office_code` varchar(10) NOT NULL,
  `sync_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$query = mysqli_query($connect,$sql);

$sql="INSERT INTO `system_sync_code` VALUES (1, 'xxxx', 'xxxx')";
$query = mysqli_query($connect,$sql);

$sql="CREATE TABLE `system_sync_smss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_code` int(11) NOT NULL,
  `system_name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `server_ip` varchar(50) NOT NULL,
  `sync_code` varchar(50) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$query = mysqli_query($connect,$sql);



?>
