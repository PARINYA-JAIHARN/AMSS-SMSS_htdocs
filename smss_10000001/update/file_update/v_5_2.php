<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="CREATE TABLE IF NOT EXISTS `student_main_expand1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `e_name` varchar(50) NOT NULL,
  `e_surname` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `blood` varchar(2) NOT NULL,
  `race` varchar(30) NOT NULL,
  `nationlity` varchar(30) NOT NULL,
  `religion` varchar(30) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8" ;
$dbquery = mysqli_query($connect,$sql);

$sql="INSERT INTO  `system_export_permission` ( `requester` ,  `data_name` ,  `status` ) 
VALUES ( 'amssplus',  'health', 1 )" ;
$dbquery = mysqli_query($connect,$sql);

$sql="INSERT INTO  `system_export_list` (  `data_name` ,  `thai_dataname` ) 
VALUES ( 'health', 'สุขภาพผู้เรียน' )" ;
$dbquery = mysqli_query($connect,$sql);

?>
