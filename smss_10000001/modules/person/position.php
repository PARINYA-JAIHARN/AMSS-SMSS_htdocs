<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

echo "<br />";
if(!(($index==1) or ($index==2) or ($index==5))){
echo "<table width='50%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>ตำแหน่งครูและบุคลากร</strong></font></td></tr>";
echo "</table>";
}
//ส่วนเพิ่มข้อมูล
if($index==1){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><B>เพิ่มตำแหน่ง</B></Font>";
echo "</Cener>";
echo "<Br>";
echo "<Table  width='50%' Border='0'>";
echo "<Tr align='left'><Td align='right'>รหัสตำแหน่ง&nbsp;&nbsp;</Td><Td align='left'><Input Type='Text' Name='position_code' Size='5' onkeydown='integerOnly()'></Td></Tr>";

echo "<Tr align='left'><Td align='right'>ชื่อตำแหน่ง&nbsp;&nbsp;</Td><Td align='left'><Input Type='Text' Name='position_name' Size='40'></Td></Tr>";
echo "<Br>";
echo "</Table>";
echo "<Br>";
echo "<INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url(1)'>
		&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ย้อนกลับ' onclick='goto_url(0)'>";

echo "</form>";
}
//ส่วนยืนยันการลบข้อมูล
if($index==2) {
echo "<table width='500' border='0' align='center'>";
echo "<tr><td align='center'><font color='#990000' size='4'>โปรดยืนยันความต้องการลบข้อมูลอีกครั้ง</font><br></td></tr>";
echo "<tr><td align=center>";
echo "<INPUT TYPE='button' name='smb' value='ยืนยัน' onclick='location.href=\"?option=person&task=position&index=3&id=$_GET[id]\"'>
		&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ยกเลิก' onclick='location.href=\"?option=person&task=position\"'";
echo "</td></tr></table>";
}
//ส่วนลบข้อมูล
if($index==3){
$sql = "delete from person_position where id=$_GET[id]";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนเพิ่มข้อมูล
if($index==4){
$sql = "insert into person_position (position_code, position_name) values ( '$_POST[position_code]','$_POST[position_name]')";
$dbquery = mysqli_query($connect,$sql);
}
//ส่วนฟอร์มแก้ไขข้อมูล
if ($index==5){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><B>แก้ไขตำแหน่ง</B></Font>";
echo "</Cener>";
echo "<Br>";
$sql = "select * from  person_position where id='$_GET[id]'";
$dbquery = mysqli_query($connect,$sql);
$ref_result = mysqli_fetch_array($dbquery);

echo "<Table   width='50%' Border='0'>";
echo "<Tr align='left'><Td align='right'>รหัสตำแหน่ง&nbsp;&nbsp;</Td><Td align='left'><Input Type='Text' Name='position_code' Size='5' value='$ref_result[position_code]' onkeydown='integerOnly()'></Td></Tr>";

echo "<Tr align='left'><Td align='right'>ชื่อตำแหน่ง&nbsp;&nbsp;</Td><Td align='left'><Input Type='Text' Name='position_name' Size='60' value='$ref_result[position_name]'></Td></Tr>";
echo "<Br>";
echo "</Table>";
echo "<Br>";
echo "<Input Type='Hidden' Name='id' Value='$_GET[id]'>";
echo "<INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url_update(1)'>
		&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ย้อนกลับ' onclick='goto_url_update(0)'>";

echo "</form>";
}
//ส่วนปรับปรุงข้อมูล
if ($index==6){
$sql = "update person_position set position_code='$_POST[position_code]',position_name='$_POST[position_name]' where id='$_POST[id]'";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนการแสดงผล
if(!(($index==1) or ($index==2) or ($index==5))){

$sql = "select * from person_position order by position_code";
$dbquery = mysqli_query($connect,$sql);

echo  "<table width='50%' border='0' align='center'>";
echo "<Tr><Td colspan='6' align='left'><INPUT TYPE='button' name='smb' value='เพิ่มข้อมูล' onclick='location.href=\"?option=person&task=position&index=1\"'></Td></Tr>";
echo "</Table>";
echo  "<table width='50%' border='1' align='center' style='border-collapse: collapse'>";
echo "<Tr bgcolor='#E6E6E6' align='center'><Td width='50'>ที่</Td> <Td>รหัส</Td><Td>ตำแหน่ง</Td><Td   width='50'>ลบ</Td><Td width='50'>แก้ไข</Td></Tr>";
$M=1;
While ($result = mysqli_fetch_array($dbquery))
	{
		$id = $result['id'];
		$position_code= $result['position_code'];
		$position_name= $result['position_name'];
			if(($M%2) == 0)
			$color="#FFFFC";
			else  	$color="#FFFFFF";

		echo "<Tr  bgcolor=$color align=center class=style1><Td>$M</Td> <Td>$position_code</Td> <Td align=left>$position_name</Td><Td><div align=center><a href=?option=person&task=position&index=2&id=$id><img src=images/drop.png border='0' alt='ลบ'></a></div></Td><Td><a href=?option=person&task=position&index=5&id=$id><img src=images/edit.png border='0' alt='แก้ไข'></a></div></Td>
	</Tr>";
$M++;
	}
echo "</Table>";
}

echo "<br /><br /><br />";
echo  "<table width=70% border=0 align=center>";
echo "<Tr><Td align='left'><strong>คำอธิบาย</strong></Td></Tr>";
echo "<Tr><Td align='left'>1. รหัสผู้อำนวยการโรงเรียนให้เป็น 1</Td></Tr>";
echo "<Tr><Td align='left'>2. รหัสรองผู้อำนวยการโรงเรียนให้เป็น 2</Td></Tr>";
echo "<Tr><Td align='left'>3. รหัสครูให้เป็น 3</Td></Tr>";
echo "<Tr><Td align='left'>4. รหัสครูผู้ช่วยให้เป็น 4</Td></Tr>";
echo "<Tr><Td align='left'>5. รหัสพนักงานราชการ(ครูผู้สอน)ให้เป็น 11</Td></Tr>";
echo "<Tr><Td align='left'>6. รหัสพนักงานราชการ(ครูพี่เลี้ยง)ให้เป็น 12</Td></Tr>";
echo "<Tr><Td align='left'>7. รหัสพนักงานราชการ(อื่น ๆ)ให้เป็น 13</Td></Tr>";
echo "<Tr><Td align='left'>8. รหัสลูกจ้างประจำ(พนักงานธุรการ)ให้เป็น 21</Td></Tr>";
echo "<Tr><Td align='left'>9. รหัสลูกจ้างประจำ(พนักงานขับรถยนต์)ให้เป็น 22</Td></Tr>";
echo "<Tr><Td align='left'>10. รหัสลูกจ้างประจำ(ช่างครุภัณฑ์)ให้เป็น 23</Td></Tr>";
echo "<Tr><Td align='left'>11. รหัสลูกจ้างประจำ(อื่น ๆ)ให้เเป็น 24</Td></Tr>";
echo "<Tr><Td align='left'>12. รหัสลูกจ้างชั่วคราว(ครู)ให้เป็น 31</Td></Tr>";
echo "<Tr><Td align='left'>13. รหัสลูกจ้างชั่วคราว(เจ้าหน้าที่ธุรการโรงเรียน)ให้เป็น 32</Td></Tr>";
echo "<Tr><Td align='left'>14. รหัสลูกจ้างชั่วคราว(นักการภารโรง)ให้เป็น 33</Td></Tr>";
echo "<Tr><Td align='left'>15. รหัสลูกจ้างชั่วคราว(อื่น ๆ)ให้เป็น 34</Td></Tr>";
echo "<Tr><Td align='left'>16. รหัสผู้จัดการโรงเรียนเอกชนให้เป็น 41</Td></Tr>";
echo "<Tr><Td align='left'>17. รหัสเจ้าหน้าที่บริหารทั่วไปโรงเรียนเอกชนให้เป็น 42</Td></Tr>";
echo "<Tr><Td align='left'>18. รหัสเจ้าหน้าที่อื่น ๆ โรงเรียนเอกชนให้เป็น 43</Td></Tr>";
echo "</Table>";

?>
<script>
function goto_url(val){
	if(val==0){
		callfrm("?option=person&task=position");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.position_code.value == ""){
			alert("กรุณากรอกรหัสตำแหน่ง");
		}else if(frm1.position_name.value==""){
			alert("กรุณากรอกชื่อตำแหน่ง");
		}else{
			callfrm("?option=person&task=position&index=4");   //page ประมวลผล
		}
	}
}

function goto_url_update(val){
	if(val==0){
		callfrm("?option=person&task=position");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.position_code.value == ""){
			alert("กรุณากรอกรหัสตำแหน่ง");
		}else if(frm1.position_name.value==""){
			alert("กรุณากรอกชื่อตำแหน่ง");
		}else{
			callfrm("?option=person&task=position&index=6");   //page ประมวลผล
		}
	}
}
</script>
