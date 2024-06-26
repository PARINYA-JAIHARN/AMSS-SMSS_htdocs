<?php	
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

echo "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"; 
echo "<tr bgcolor='#FFCC00'><td>";
echo "<ul id='nav' class='dropdown dropdown-horizontal'>";
	echo "<li><a href='./'>$mpic_home&nbsp;รายการหลัก</a></li>";
	
	if($_SESSION['login_status']<=14){	
		echo "</li>";
			echo "<li><a href='?option=card_request&task=main/form_portal' class='dir'>$mpic1 ยื่นคำขอทำบัตร</a>";
		echo "</li>";
		echo "</li>";
			echo "<li><a href='?option=card_request&task=main/request_progress' class='dir'>$mpic1 ตรวจสอบคำขอ</a>";
		echo "</li>";
			echo "</li>";
		echo "<li><a href='?option=card_request&task=main/request_list' class='dir'>$mpic1 อนุมัติคำขอ</a>";
	}
echo "</ul>";
echo "</td></tr>";
echo "</table>";
?>
