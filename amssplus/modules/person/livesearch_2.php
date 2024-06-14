<?php
session_start();
if(!(isset($_SESSION['login_user_id']))){
exit();
}

require_once("../../amssplus_connect.php");
require_once "../../mainfile.php";	

$q=$_GET["q"];
$response="";

$sql = "select school_code,school_name from system_school where school_name like '%$q%' limit 5";
$dbquery = mysqli_query($connect,$sql);
while($result = mysqli_fetch_array($dbquery)){
	$school_code = $result['school_code'];
	$school_name = $result['school_name'];
	$response=$response."<a href=?option=person&task=person_sch&school_code=$school_code>$school_name</a>"."<br />";
}
echo $response;
?>
