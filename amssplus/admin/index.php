<?php
session_start();
/** Set flag that this is a parent file */
define( "_VALID_", 1 );
require_once "../amssplus_connect.php";	

if(isset($_POST['submit'])){
$username 	= trim($_POST['username']);
$pass = trim($_POST['pass']);
$username = mysqli_real_escape_string($connect,$username); 
$pass = mysqli_real_escape_string($connect,$pass); 
$pass = md5($pass);
$sql = "select * from system_user where username='$username' and status='1' and smss_admin='1'";
$dbquery = mysqli_query($connect,$sql);
$result = mysqli_fetch_array($dbquery);
		if($result){
		$Myusername = $result['username'];
		$Mypwd=$result['userpass'];
				if (strcmp($Mypwd,$pass)) {
				echo "<script>alert('Password is wrong'); document.location.href='index.php';</script>\n";
				exit();
				}
		$sql_user = "select * from person_main where person_id='$result[person_id]' ";
		$dbquery_user = mysqli_query($connect,$sql_user);
		$result_user = mysqli_fetch_array($dbquery_user);
		$_SESSION['login_user_id'] = $result['person_id'];
		$_SESSION['login_status'] =1;	
				if($result_user['name']==""){
				$_SESSION['login_name']=$Myusername; 
				}
				else{	
				$_SESSION['login_name'] = $result_user['name'];	
				}
		$_SESSION['login_surname'] = $result_user['surname'];	
		}
		else{
		echo "<script>alert('No User'); document.location.href='index.php';</script>\n";
		exit();		
		}
$sql_school_name = "select * from  system_office_name";
$dbquery_school_name = mysqli_query($connect,$sql_school_name);
$result_school_name = mysqli_fetch_array($dbquery_school_name);
$_SESSION['office_name']=$result_school_name['office_name'];		

		if(isset($_SESSION['AMSSPLUS'])){
		unset($_SESSION['AMSSPLUS']);
		}
		
if(isset($system_office_code)){
$_SESSION['office_code']=$system_office_code;
}
else{
$_SESSION['office_code']="";
}

}
// endif submit

if(!(isset($_SESSION['login_user_id']))){
	require_once('login.php');
	exit();
}
if($_SESSION['login_status']!=1){
	require_once('login.php');
	exit();
}

if(isset($system_office_code)){
		if($_SESSION['office_code']!=$system_office_code){
			require_once('login.php');
			exit();
		}
}

require_once("config_file.php");
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
GETMODULE($_REQUEST['option'],$_REQUEST['file']);

if(isset($_GET['index'])){
$index=$_GET['index'];
}
else{
$index="";
}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>AMSS_ADMIN</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/mm_training.css" type="text/css" />

<!-- Beginning of compulsory code below -->

<link href="css/dropdown/dropdown.css" media="all" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/adobe.com/default.advanced.css" media="all" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="main_js.js"></script>

</head>
<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#666600">
	<td width="15" nowrap="nowrap"></td>
	<td height="50" colspan="3" class="logo" nowrap="nowrap">AMSS++<span class="tagline">  ส่วนการจัดการระบบ</span></td>
	<td width="40">&nbsp;</td>
	<td width="100%" align="right" class="user">
<?php	
echo $_SESSION['office_name'];
		if(isset($system_office_code)){
		echo " [".$system_office_code."]";
		}
?>	
	&nbsp;&nbsp;</td>
	</tr>
	<tr bgcolor="#666600"><td colspan="6" align="right"><font color="#FFFFFF"><?php 
if(isset($_SESSION['login_user_id'])){
echo "ผู้ใช้ : $_SESSION[login_name]&nbsp;$_SESSION[login_surname]&nbsp;&nbsp;&nbsp;";
echo "<a href=logout.php>[ออกจากระบบ]</a>";
}
?>
 &nbsp;&nbsp;</font></td></tr>
<?php
	if($_GET['option']!=""){
	echo "<tr bgcolor='#FFCC00'>";
	echo "<td colspan='6'>";
	echo "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
	echo "<tr bgcolor='#6699FF'>";
	$mudule_name=$_GET['option'];
 	echo "<td align='left' nowrap='nowrap' class=stylemenu height='24'>&nbsp;&nbsp;&nbsp;$option_name[$mudule_name]</td></tr>";
	echo "</tr>";
	echo "</table>";
	echo "</td></tr>";
	}
	else{
	require_once("menu.php");
	}
	  ?>
	<tr>
	<td colspan="6">
	<!-- Content -->
	
		<?php require_once("".$MODPATHFILE."");?>
	
	<!-- End Content -->
	</td>
	</tr>
</table>
</body>
</html>