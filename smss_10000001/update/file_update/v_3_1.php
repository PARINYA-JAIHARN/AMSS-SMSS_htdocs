<?php
$sql="CREATE TABLE `system_sync_code` (`id` tinyint(4) NOT NULL AUTO_INCREMENT,`office_code` varchar(10) NOT NULL,`sync_code` varchar(50) NOT NULL,PRIMARY KEY (`id`)) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1" ;
$dbquery = mysqli_query($connect,$sql);

$sql="INSERT INTO `system_sync_code` VALUES (1, 'xxxxxxxx', 'xxxxxxxx')" ;
$dbquery = mysqli_query($connect,$sql);

?>
