<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="INSERT INTO  `system_export_permission` ( `requester` ,  `data_name` ,  `status` ) 
VALUES ( 'amssplus',  'student_check', 1 )" ;
$dbquery = mysqli_query($connect,$sql);

$sql="INSERT INTO  `system_export_list` (  `data_name` ,  `thai_dataname` ) 
VALUES ( 'student_check', 'การมาเรียน' )" ;
$dbquery = mysqli_query($connect,$sql);

$sql="INSERT INTO `system_module` (`module`, `module_desc`, `workgroup`, `module_active`, `module_order`, `web_link`, `url`, `where_work`) VALUES ('warroom', '﻿วิเคราะห์สภาพการณ์', 1, 1, 0, 0, '', 0)" ;
$dbquery = mysqli_query($connect,$sql);

//$sql="INSERT INTO `system_module` (`module`, `module_desc`, `workgroup`, `module_active`, `module_order`, `web_link`, `url`, `where_work`) VALUES ('questionnaire', '﻿แบบสอบถาม', 4, 1, 0, 0, '', 0)" ;
//$dbquery = mysqli_query($connect,$sql);
//require_once("./modules/questionnaire/install/create_table.php");

?>
