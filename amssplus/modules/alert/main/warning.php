<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
include("alert/alert.php");	
$arr_length=count($system_alert_ar);
if($arr_length>=1){
		$M=1;
		if($_SESSION['user_os']=='mobile'){
		echo "<br>";
		echo  "<table  width='95%' border='1' style='border-collapse: collapse' align='center'>";
		echo "<Tr bgcolor='#99ccff' align='center'><Td><b>ที่</b></Td><Td><b>ข้อความแจ้งเตือน</b></Td></Tr>";
		}
		else{
		echo "<br><br>";
		echo  "<table width='45%' border='1' style='border-collapse: collapse' align='center'>";
		echo "<Tr bgcolor='#99ccff' align='center'><Td width='60'><b>ที่</b></Td><Td><b>ข้อความแจ้งเตือน</b></Td></Tr>";
		}
		for($x=1;$x<=$arr_length;$x++){			
					if(($M%2) == 0)
					$color="#E5E5FF";
					else  	$color="#FFFFFF";
		echo "<Tr bgcolor='$color' align='center'><Td>$M</Td><Td align='left'>$system_alert_ar[$x]</Td></Tr>";
		$M++;
		}
		echo "</table>";			
}
else{
echo "<div align='center'>";
			if($_SESSION['user_os']=='mobile'){
			echo "<font color='#006666' size='3'><strong>ไม่มีข้อความแจ้งเตือน</strong>";
			}
			else{
			echo "<br>";
			echo "<font color='#006666' size='3'><strong>ไม่มีข้อความแจ้งเตือน</strong>";
			}
echo "</div>";
}
?>
