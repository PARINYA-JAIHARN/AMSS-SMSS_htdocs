<?php
header("Content-type:text/xml; charset=UTF-8");              
header("Cache-Control: no-store, no-cache, must-revalidate");             
header("Cache-Control: post-check=0, pre-check=0", false);   
/*echo "<?xml version='1.0' encoding='UTF-8'?>";*/
define( "_VALID_", 1 );

require_once "../amssplus_connect.php";	

foreach($_GET as $system_key => $system_key_val) {
   $_GET["$system_key"] =mysqli_real_escape_string($connect,$system_key_val);
}

$user_permission=0;
$warning_text="1";

$sql="select * from system_sync_smss_2 where office_code='$_GET[school_code]' ";
$dbquery = mysqli_query($connect,$sql);
$result1 = mysqli_fetch_array($dbquery);

if($result1){
	
			$sql="select * from system_sync_smss_2 where sync_code='$_GET[password]'";
			$dbquery = mysqli_query($connect,$sql);
			$result2 = mysqli_fetch_array($dbquery);
			if($result2){
			$user_permission=1;    
			}
			else{
			$warning_text="Password เชื่อมระบบกับ AMSS++ไม่ถูกต้อง";
			}
		
}
else{
$warning_text="ไม่ได้เชื่อมระบบกับAMSS++";
}

//////////////////////////

if(isset($_GET['order'])){
$order=$_GET['order'].".php";
}
else{
$order="";
}

if($user_permission==1){
	require_once "$order";	
}
else{
	require_once "warning.php";	
}
mysqli_close($connect);

?>



