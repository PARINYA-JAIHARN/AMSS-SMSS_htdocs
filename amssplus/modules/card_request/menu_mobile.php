<?php	
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

/*$sql_permission = "select * from  mail_permission where person_id='$_SESSION[login_user_id]'";
$dbquery_permission = mysqli_query($connect,$sql_permission);
$result_permission = mysqli_fetch_array($dbquery_permission);

if(!(isset($_SESSION['admin_mail']))){
$_SESSION['admin_mail']="";
}*/

echo "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"; 
echo "<tr bgcolor='#FFCC00'><td>";
echo "<ul id='nav' class='dropdown dropdown-horizontal'>";
	echo "<li><a href='./'>รายการหลัก</a></li>";
	if($_SESSION['login_status']<=14){	
	echo "<li><a href='?option=card_request&task=main/newform' class='dir'>$mpic1 ยื่นคำขอทำบัตร</a>";
	echo "<li><a href='?option=card_request&task=main/request_progress' class='dir'>$mpic1 ตรวจสอบคำขอ</a>";
	echo "<li><a href='?option=card_request&task=main/request_list' class='dir'>$mpic1 อนุมัติคำขอ</a>";
	echo "</li>";
	}
echo "</ul>";
echo "</td></tr>";
echo "</table>";
?>
