<?php	
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

echo "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"; 
echo "<tr bgcolor='#FFCC00'><td>";
echo "<ul id='nav' class='dropdown dropdown-horizontal'>";
	echo "<li><a href='./'>$mpic_home&nbsp;รายการหลัก</a></li>";
	
if($_SESSION['login_status']<=4){
	echo "<li><a href='?option=card_request&task=main/newform' class='dir'>$mpic1 คำขอทำบัตรประจำตัว</a>";
		echo "<ul>";
			echo "<li><a href='?option=card_request&task=main/newform'>$mpic2 ส่งคำขอทำบัตร</a></li>";
			echo "<li><a href='?option=card_request&task=main/request_list'>$mpic2 ตรวจสอบรายการคำขอ</a></li>";
		echo "</ul>";
	echo "</li>";
}
	
/*if($_SESSION['login_status']<=4){
	echo "<li><a href='?option=card_request&task=main/send' class='dir'>$mpic1 ส่งจดหมาย</a>";
		echo "<ul>";
			echo "<li><a href='?option=card_request&task=main/send'>$mpic2 ส่งจดหมาย</a></li>";
		echo "</ul>";
	echo "</li>";
}

if($_SESSION['login_status']<=4){
	echo "<li><a href='?option=card_request&task=main/send_report' class='dir'>$mpic1 รายการส่งจดหมาย</a>";
		echo "<ul>";
			echo "<li><a href='?option=card_request&task=main/send_report'>$mpic2 รายการส่งจดหมาย</a></li>";
		echo "</ul>";
	echo "</li>";
}*/

echo "</ul>";
echo "</td></tr>";
echo "</table>";
?>
