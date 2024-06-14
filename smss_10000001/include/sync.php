<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$officer=$_SESSION['login_user_id']; 
$server = $_SERVER["SERVER_ADDR"]; 
$classlevel="";
$position_code="";
 
if($_SESSION['login_status']==2){
$status=2;
}
else if($_SESSION['login_status']==3){
$status=3;
}
else if($_SESSION['login_status']==4){
$status=4;
}
else if($_SESSION['login_status']==5){
$status=5;
}
else if($_SESSION['login_status']==6){
$status=6;
	$sql3 = "select * from student_main where student_id='$_SESSION[login_user_id]'";
	$dbquery3 = mysqli_query($connect,$sql3);
	$result3 = mysqli_fetch_array($dbquery3);
	$officer=$result3['person_id'];
	$classlevel=$result3['class_now'];
	$prename=$result3['prename'];
	$name= $result3['name'];
	$surname = $result3['surname'];
}

if($_SESSION['login_status']<6){
$sql_person = "select * from person_main where person_id='$officer'";
$dbquery_person = mysqli_query($connect,$sql_person);
$result_person = mysqli_fetch_array($dbquery_person);
		$prename=$result_person['prename'];
		$name= $result_person['name'];
		$surname = $result_person['surname'];
		$position_code= $result_person['position_code'];
}		

$sql = "select * from system_sync_code where system_name='amssplus'";
$dbquery = mysqli_query($connect,$sql);
$result = mysqli_fetch_array($dbquery);
$office_code=$result['office_code'];
$sync_code=md5($result['sync_code']);
$url=($result['amssplus_url']);

		$url2 ="$url/smss/time_alert.php?serv=$server";
		$xmlDoc = new DOMDocument();
		$xmlDoc->load($url2);
		$time=$xmlDoc->getElementsByTagName('time')->item(0)->nodeValue;
		
$sync=$sync_code;
$get_serv=base64_encode($server);
$get_person=base64_encode($officer);
$get_prename=base64_encode($prename);
$get_name=base64_encode($name);
$get_surname=base64_encode($surname);	
$get_time=base64_encode($time);	
?>