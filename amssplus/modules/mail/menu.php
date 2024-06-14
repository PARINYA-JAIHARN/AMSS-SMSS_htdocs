<?php	
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql_permission = "select * from  mail_permission where person_id='$_SESSION[login_user_id]'";
$dbquery_permission = mysqli_query($connect,$sql_permission);
$result_permission = mysqli_fetch_array($dbquery_permission);

if(!(isset($_SESSION['admin_mail']))){
$_SESSION['admin_mail']="";
}

echo "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"; 
echo "<tr bgcolor='#FFCC00'><td>";
echo "<ul id='nav' class='dropdown dropdown-horizontal'>";
	echo "<li><a href='./'>$mpic_home&nbsp;รายการหลัก</a></li>";
	if($_SESSION['admin_mail']=="mail"){
	echo "<li><a href='?option=mail' class='dir'>$mpic1 ตั้งค่าระบบ</a>";
		echo "<ul>";
			echo "<li><a href='?option=mail&task=main/permission'>$mpic2 กำหนดเจ้าหน้าที่</a></li>";
			echo "<li><a href='?option=mail&task=main/group'>$mpic2 กำหนดกลุ่มบุคลากร</a></li>";
			echo "<li><a href='?option=mail&task=main/group_member'>$mpic2 กำหนดสมาชิกกลุ่มบุคลากร</a></li>";
			echo "<li><a href='?option=mail&task=main/group_member_report'>$mpic2 รายงานกลุ่มและสมาชิก</a></li>";
		echo "</ul>";
	echo "</li>";
	}
	if($_SESSION['login_status']<=14){	
	echo "<li><a href='?option=mail&task=main/receive' class='dir'>$mpic1 ทะเบียนรับ</a>";
		echo "<ul>";
			echo "<li><a href='?option=mail&task=main/receive'>$mpic2 ทะเบียนจดหมายรับมา</a></li>";
	echo "</ul>";
	echo "</li>";

	echo "<li><a href='?option=mail&task=main/send' class='dir'>$mpic1 ทะเบียนส่ง</a>";
		echo "<ul>";
			echo "<li><a href='?option=mail&task=main/send'>$mpic2 ทะเบียนจดหมายส่งไป</a></li>";
		echo "</ul>";
	echo "</li>";
	echo "<li><a href='?option=mail&task=main/send&index=1' class='dir'>$mpic1 เขียนจดหมาย</a>";
	echo "</li>";
	}
	
	echo "<li><a href='?option=mail' class='dir'>$mpic1 คู่มือ</a>";
		echo "<ul>";
				echo "<li><a href='modules/mail/manual/mail.pdf' target='_blank'>$mpic2 คู่มือไปรษณีย์</a></li>";
		echo "</ul>";
	echo "</li>";
echo "</ul>";
echo "</td></tr>";
echo "</table>";
?>
