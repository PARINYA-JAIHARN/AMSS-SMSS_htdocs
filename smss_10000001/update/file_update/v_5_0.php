<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="DELETE FROM  `system_export_requester`" ;
$dbquery = mysqli_query($connect,$sql);

$sql="INSERT INTO  `system_export_requester` (  `id` ,  `requester` ,  `thai_requester` ,  `requester_server_id` ,  `requester_password` ,  `status` ,  `rec_date` ,  `officer` ) 
VALUES ( 1,  'amssplus',  'สำนักงานเขตพื้นที่การศึกษา',  '',  '1234', 1,  '2018-08-07',  '7777' )" ;
$dbquery = mysqli_query($connect,$sql);

$sql="DELETE FROM  `system_export_permission`" ;
$dbquery = mysqli_query($connect,$sql);

$sql="INSERT INTO  `system_export_permission` (  `id` ,  `requester` ,  `data_name` ,  `status` ) 
VALUES ( 1,  'amssplus',  'plan', 1 ) , ( 2,  'amssplus',  'onet', 1 ) , ( 3,  'amssplus',  'student', 1 ) , ( 4,  'amssplus',  'person', 1 )" ;
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `system_sync_code` ADD  `system_name` VARCHAR( 50 ) NOT NULL AFTER  `office_code`" ;
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `system_sync_code` ADD UNIQUE (`system_name`)";
$dbquery = mysqli_query($connect,$sql);

$sql="DELETE FROM  `system_sync_code`" ;
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `work_main` ADD INDEX (  `work_date` )";
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `work_main` ADD INDEX (  `person_id` )";
$dbquery = mysqli_query($connect,$sql);

$sql="DELETE FROM  `person_position`" ;
$dbquery = mysqli_query($connect,$sql);

$sql="INSERT INTO `person_position` (`id`, `position_code`, `position_name`) VALUES
(1, 1, 'ผู้อำนวยการโรงเรียน'),
(2, 2, 'รองผู้อำนวยการโรงเรียน'),
(3, 3, 'ครู'),
(4, 4, 'ครูผู้ช่วย'),
(5, 11, 'พนักงานราชการ(ครูผู้สอน)'),
(6, 12, 'พนักงานราชการ(ครูพี่เลี้ยง)'),
(7, 13, 'พนักงานราชการ(อื่น ๆ)'),
(17, 41, 'ผู้จัดการโรงเรียนเอกชน'),
(9, 21, 'ลูกจ้างประจำ(พนักงานธุรการ)'),
(10, 22, 'ลูกจ้างประจำ(พนักงานขับรถยนต์))'),
(11, 23, 'ลูกจ้างประจำ(ช่างครุภัณฑ์)'),
(12, 24, 'ลูกจ้างประจำ(อื่น ๆ)'),
(13, 31, 'ลูกจ้างชั่วคราว(ครู)'),
(14, 32, 'ลูกจ้างชั่วคราว(เจ้าหน้าที่ธุรการโรงเรียน)'),
(15, 33, 'ลูกจ้างชั่วคราว(นักการภารโรง)'),
(16, 34, 'ลูกจ้างชั่วคราว(อื่น ๆ)'),
(18, 42, 'เจ้าหน้าที่บริหารทั่วไปโรงเรียนเอกชน'),
(19, 43, 'เจ้าหน้าที่อื่น ๆ โรงเรียนเอกชน')";
$dbquery = mysqli_query($connect,$sql);

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

$sql_create="update system_module set  module_desc='ไปรษณีย์_โรงเรียน' where module='mail' ";
$query = mysqli_query($connect,$sql_create);

$sql_create="update system_module set  module_desc='ทดสอบการศึกษา_โรงเรียน' where module='bets' ";
$query = mysqli_query($connect,$sql_create);

?>
