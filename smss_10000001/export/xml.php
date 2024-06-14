<?php
header("Content-type:text/xml; charset=UTF-8");              
header("Cache-Control: no-store, no-cache, must-revalidate");             
header("Cache-Control: post-check=0, pre-check=0", false);   
echo "<?xml version='1.0' encoding='UTF-8'?>";
define( "_VALID_", 1 );

require_once "../smss_connect.php";	

foreach($_GET as $system_key => $system_key_val) {
   $_GET["$system_key"] =mysqli_real_escape_string($connect,$system_key_val);
}

$requester_server_id=$_GET['requester_server_id'];
$user_permission=0;
$warning_text="1";

$sql="select * from system_export_requester where requester='$_GET[username]' and status='1'";
$dbquery = mysqli_query($connect,$sql);
$result1 = mysqli_fetch_array($dbquery);
if($result1){
	
			$sql="select sync_code from system_sync_code  where  system_name='$_GET[username]'";
			$dbquery = mysqli_query($connect,$sql);
			$result2 = mysqli_fetch_array($dbquery);
			$sync_code=md5($result2['sync_code']);
			if($_GET['password']==$sync_code){
			$user_permission=1;    
			}
			else{
			$warning_text="Password ไม่ถูกต้อง";
			}
}
else{
$warning_text="ไม่ได้รับอนุญาต";
}

//////////////////////////

if(isset($_GET['order'])){
$order=$_GET['order'].".php";
}
else{
$order="";
}

if($user_permission==1){
$sql = "select * from system_export_permission where requester='$_GET[username]' and data_name='$_GET[order]' and status='1'";
$dbquery3 = mysqli_query($connect,$sql);
$result3 = mysqli_fetch_array($dbquery3);

			if($result3){
			$login_time = date("Y-m-d H:i:s");
			$sql_insert = "insert into system_export_log(computer_ip,requester,login_time,data) values('$requester_server_id', '$_GET[username]','$login_time','$_GET[order]')";
			$dbquery = mysqli_query($connect,$sql_insert);
			
			require_once "$order";	
			}
			else{
			$warning_text="ไม่ได้อนุญาตในข้อมูลนี้";
			require_once "warning.php";	
			}
}
else{
	require_once "warning.php";	
}
mysqli_close($connect);
?>



