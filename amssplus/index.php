<?php
session_start();
/** Set flag that this is a parent file */
define( "_VALID_", 1 );
require_once "amssplus_connect.php";	
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>AMSS++</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php
if(isset($_SESSION['user_os'])){
	if($_SESSION['user_os']=='mobile'){
	echo "<meta name = 'viewport' content = 'width = device-width'>";
	}
}
if(isset($_POST['user_os'])){
	if($_POST['user_os']=='mobile'){
	echo "<meta name = 'viewport' content = 'width = device-width'>";
	}
}

?>
<!-- Beginning of compulsory code below -->

<link href="css/dropdown/dropdown.css" media="all" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/adobe.com/default.advanced.css" media="all" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="main_js.js"></script>

<!-- Bootstrap Include -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">


<link rel="stylesheet" href="css/mm_training.css" type="text/css" />
</head>
<body>
<?php
if(isset($_POST['login_submit'])){
require_once "include/login_chk.php";	
}

if(!(isset($_SESSION['AMSSPLUS']))){
	require_once('login.php');
	exit();
}

if((!(isset($_SESSION['login_user_id']))) and (!(isset($_POST['system_multi_school'])))){
	require_once('login.php');
	exit();
}

if(isset($system_office_code)){
		if($_SESSION['office_code']!=$system_office_code){
			require_once('login.php');
			exit();
		}
}

require_once("mainfile.php");
$PHP_SELF = "index.php";

if(!(isset($_REQUEST['option']))){
$_REQUEST['option']="";
}
if(!(isset($_GET['option']))){
$_GET['option']="";
}
if(!(isset($_REQUEST['file']))){
$_REQUEST['file']="";
}
if(isset($_REQUEST['index'])){
$index=$_REQUEST['index'];
}
else{
$index="";
}

GETMODULE($_REQUEST['option'],$_REQUEST['file']);

if($_SESSION['user_os']=='mobile'){
		if(isset($_SESSION['smss_mode'])){
		require_once "index_desktop.php";		
		}
		else{
		require_once "index_mobile.php";
		}
}
else{
require_once "index_desktop.php";	
}
mysqli_close($connect);
?>
<noscript>
!Warning! Javascript must be enabled for proper operation of the Administrator
</noscript>
<br />
</body>
</html>