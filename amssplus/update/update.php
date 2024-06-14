<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

if($result_version['system_version']<2.5 ){
	require_once('update/file_update/v_2_5.php');
}
if($result_version['system_version']<2.6 ){
	require_once('update/file_update/v_2_6.php');
}
if($result_version['system_version']<2.9 ){
	require_once('update/file_update/v_2_9.php');
}
if($result_version['system_version']<3.0 ){
	require_once('update/file_update/v_3_0.php');
}
if($result_version['system_version']<3.1 ){
	require_once('update/file_update/v_3_1.php');
}
if($result_version['system_version']<4.04 ){
	require_once('update/file_update/v_4_04.php');
}
if($result_version['system_version']<4.2 ){
	require_once('update/file_update/v_4_2.php');
}
if($result_version['system_version']<4.21 ){
	require_once('update/file_update/v_4_21.php');
}
if($result_version['system_version']<4.3){
	require_once('update/file_update/v_4_3.php');
}

if($result_version['system_version']<4.5){
	require_once('update/file_update/v_4_5.php');
}

if($result_version['system_version']<4.6){
	require_once('update/file_update/v_4_6.php');
}

if($result_version['system_version']<5.0){
	require_once('update/file_update/v_5_0.php');
}

if($result_version['system_version']<5.1){
	require_once('update/file_update/v_5_1.php');
}

if($result_version['system_version']<5.2){
	require_once('update/file_update/v_5_2.php');
}

if($result_version['system_version']<5.21){
	require_once('update/file_update/v_5_21.php');
}

if($result_version['system_version']<6.0){
	require_once('update/file_update/v_6_0.php');
}

if($result_version['system_version']<6.01){
	require_once('update/file_update/v_6_01.php');
}

if($result_version['system_version']<6.02){
	require_once('update/file_update/v_6_02.php');
}

//ส่วนบันทึกเวอร์ชั่นปัจจุบัน
$sql_update="update system_version set system_version='$code_version'";
$dbquery = mysqli_query($connect,$sql_update);
?>
