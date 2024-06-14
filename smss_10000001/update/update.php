<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

if($result_version['smss_version']<1.0){
	require_once('update/file_update/v_1_0.php');
}

if($result_version['smss_version']<2.3){
require_once('update/file_update/v_2_3.php');
}

if($result_version['smss_version']<2.4){
require_once('update/file_update/v_2_4.php');
}

if($result_version['smss_version']<2.5){
require_once('update/file_update/v_2_5.php');
}

if($result_version['smss_version']<2.53){
require_once('update/file_update/v_2_53.php');
}

if($result_version['smss_version']<2.61){
require_once('update/file_update/v_2_61.php');
}

if($result_version['smss_version']<3.0){
require_once('update/file_update/v_3_0.php');
}

if($result_version['smss_version']<3.1){
require_once('update/file_update/v_3_1.php');
}
if($result_version['smss_version']<3.12){
require_once('update/file_update/v_3_12.php');
}
if($result_version['smss_version']<3.2){
require_once('update/file_update/v_3_2.php');
}
if($result_version['smss_version']<4.0){
require_once('update/file_update/v_4_0.php');
}
if($result_version['smss_version']<5.0){
require_once('update/file_update/v_5_0.php');
}
if($result_version['smss_version']<5.1){
require_once('update/file_update/v_5_1.php');
}
if($result_version['smss_version']<5.11){
require_once('update/file_update/v_5_11.php');
}
if($result_version['smss_version']<5.2){
require_once('update/file_update/v_5_2.php');
}
if($result_version['smss_version']<6.0){
require_once('update/file_update/v_6_0.php');
}
if($result_version['smss_version']<6.01){
require_once('update/file_update/v_6_01.php');
}

//ส่วนบันทึกเวอร์ชั่นปัจจุบัน
$sql_update="update system_version set  smss_version='$code_version'";
$dbquery = mysqli_query($connect,$sql_update);
?>
