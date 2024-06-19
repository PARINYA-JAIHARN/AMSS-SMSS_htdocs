<?php	
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

echo "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"; 
echo "<tr bgcolor='#FFCC00'><td>";
echo "<ul id='nav' class='dropdown dropdown-horizontal'>";
	echo "<li><a href='./'>$mpic_home&nbsp;รายการหลัก</a></li>";
	
	if($_SESSION['login_status']<=4){	
		echo "</li>";
			echo "<li><a href='?option=card_request&task=main/form_portal' class='dir'>$mpic1 ยื่นคำขอทำบัตร</a>";
		echo "</li>";
		echo "</li>";
			echo "<li><a href='?option=card_request&task=main/request_progress' class='dir'>$mpic1 ตรวจสอบคำขอ</a>";
		echo "</li>";
			echo "</li>";
		echo "<li><a href='?option=card_request&task=main/request_list' class='dir'>$mpic1 อนุมัติคำขอ</a>";
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
	echo "<li><a href='?option=mail' class='dir'>$mpic1 คู่มือ</a>";
		echo "<ul>";
				echo "<li><a href='modules/mail/manual/mail.pdf' target='_blank'>$mpic2 คู่มือไปรษณีย์</a></li>";
		echo "</ul>";
	echo "</li>";
echo "</ul>";
echo "</td></tr>";
echo "</table>";
?>
