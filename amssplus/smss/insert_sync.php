<?php
header("Content-type:text/xml; charset=UTF-8");              
header("Cache-Control: no-store, no-cache, must-revalidate");             
header("Cache-Control: post-check=0, pre-check=0", false);   
echo "<?xml version='1.0' encoding='UTF-8'?>";

require_once "../amssplus_connect.php";	

foreach($_GET as $system_key => $system_key_val) {
   $_GET["$system_key"] =mysqli_real_escape_string($connect,$system_key_val);
}

$remote_ip=$_GET['server'];
$pieces = explode(".", $remote_ip);
$sum_pieces=1;
foreach($pieces as $key => $val) {
	$sum_pieces=$sum_pieces+$val;     
}
$time2=$_GET['time2'];
$time=$time2/$sum_pieces;
$time=$time+2;
$time_now=time();  $time_now=$time_now;
if($time_now>$time){
	echo "คุณไม่มีสิทธ์";
 	exit();
}

					//ตรวจสอบรายชื่อโรงเรียน
					$alert=0;
					$sql_sch = "select  id from system_smss_permission where school='$_GET[office_code]' and status='1'";
					$dbquery_sch = mysqli_query($connect,$sql_sch);
					$school_num = mysqli_num_rows($dbquery_sch);
					
									if($school_num>=1){
													$sql_sync = "select  id  from system_sync_smss_2  where  office_code='$_GET[office_code]'";
													$dbquery_sync = mysqli_query($connect,$sql_sync);
													$sync_num = mysqli_num_rows($dbquery_sync);
													if($sync_num<1){
														// บันทึกข้อมูล
														$rec_date = date("Y-m-d");
														$sql_insert = "insert into system_sync_smss_2 (office_code, sync_code , remote_ip,smss_url,officer, rec_date) values ('$_GET[office_code]', '$_GET[sync_code]', '$_GET[server]', '$_GET[smss_path]', '$_GET[person]', '$rec_date')";
														$dbquery_insert = mysqli_query($connect,$sql_insert);
														}
														else{
														$alert=2;
														}
									}
									else{
									$alert=1;
									}		
			
?>
<info>
	<status><?php echo $alert;?></status>
</info>
