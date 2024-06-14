<?php
require_once("../../../amssplus_connect.php");
require_once("../../../mainfile.php");

$q=$_GET["q"];
$sd_index=$_GET["sd_index"];
$response="";

$sql = "select school_code,school_name  from  system_school  where  school_name  like '%$q%' limit 5";
$dbquery = mysqli_query($connect,$sql);
while($result = mysqli_fetch_array($dbquery)){
	$school_code = $result['school_code'];
	$school_name = $result['school_name'];
	$response=$response."<a href=select_send_3.php?school_code=$school_code&hide_index=1&sd_index=$sd_index>$school_name</a>"."<br />";
}

echo $response;
?>
