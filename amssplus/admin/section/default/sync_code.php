<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

//ส่วนหัว
echo "<br />";
if(!(($index==1) or ($index==2) or ($index==5))){
echo "<table width='50%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>การเชื่อมระบบกับ Smart Obec</strong></font></td></tr>";
echo "</table>";
}

//ส่วนฟอร์มรับข้อมูล
if($index==5){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><b>แก้ไขรหัส</b></Font>";
echo "</Cener>";
echo "<Br><Br>";
echo "<Table width='50%' Border='0'>";
$sql = "select  * from system_sync_code";
$dbquery = mysqli_query($connect,$sql);
$result = mysqli_fetch_array($dbquery);
echo "<Tr><Td align='right'><b>รหัสหน่วยงาน</b>&nbsp;&nbsp;</Td><Td align='left'><Input Type='Text' Name='office_code' Size='30' maxlength='50' value='$result[office_code]'>&nbsp;* (รหัสจากสำนักนโยบายและแผน สพฐ. /DMC)</Td></Tr>";
echo "<Tr><Td align='right'><b>รหัส Sync</b>&nbsp;&nbsp;</Td><Td align='left'><Input Type='Text' Name='sync_code' Size='30' maxlength='50' value='$result[sync_code]'></Td></Tr>";
echo "<tr><td>&nbsp;</td>";
echo "<td align='left'><INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url(1)'>&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ย้อนกลับ' onclick='goto_url(0)'></td></tr>";
echo "</Table>";
echo "</form>";
}

//ส่วนปรับปรุงข้อมูล
if ($index==6){
$sql = "update system_sync_code set office_code='$_POST[office_code]',sync_code='$_POST[sync_code]'";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนแสดงผล
if(!($index==5)){
echo "<br />";
echo  "<table width='30%' border='1' align='center' style='border-collapse: collapse'>";
$sql = "select  * from system_sync_code";
$dbquery = mysqli_query($connect,$sql);
$result = mysqli_fetch_array($dbquery);

echo "<Tr bgcolor='#E6E6E6'><Td align='center'>รหัสหน่วยงาน</Td><Td align='center'>รหัส Sync</Td><Td align='center' width='50'>แก้ไข</Td></Tr>";
echo "<Tr><Td align='center'>$result[office_code]</Td><Td align='center'>$result[sync_code]</Td>
		<Td align='center'><a href=?file=sync_code&index=5><img src=../images/edit.png border='0' alt='แก้ไข'></a></Td>
	</Tr>";
echo "</Table>";
}

?>
<script>
function goto_url(val){
	if(val==0){
		callfrm("?file=sync_code");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.sync_code.value == ""){
			alert("กรุณากรอกชื่อหน่วยงาน");
		}else{
			callfrm("?file=sync_code&index=6");   //page ประมวลผล
		}
	}
}
</script>
