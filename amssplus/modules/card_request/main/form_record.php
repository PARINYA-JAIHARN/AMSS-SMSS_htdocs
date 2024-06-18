<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$officer=$_SESSION['login_user_id'];
$sql = "select * from  person_position order by position_code";
$dbquery = mysqli_query($connect,$sql);
while ($result = mysqli_fetch_array($dbquery)){
$position_ar[$result['position_code']]=$result['position_name'];
}

echo "<br />";
if(!(($index==1) or ($index==2) or ($index==2.1) or ($index==5))){
echo "<table width='50%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>ข้อมูลครูและบุคลากร</strong></font></td></tr>";
echo "</table>";
}

echo "<form id='frm1' name='frm1' Enctype = 'multipart/form-data'>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><B>แก้ไขข้อมูลครูและบุคลากร</B></Font>";
echo "</Cener>";
echo "<Br><Br>";
$sql = "select * from  card_request where id='$_GET[id]'"; //
$dbquery = mysqli_query($connect,$sql);
$result = mysqli_fetch_array($dbquery); //
echo "<Table  width='70%' Border='0' >";
echo "<Tr align='left'><Td width=30></Td><Td align='right'>เลขประจำตัวประชาชน&nbsp;&nbsp;</Td><Td><Input Type='Text' Name='IDNumber' Size='13' maxlenght='13' onkeydown='integerOnly()' value='$result[IDNumber]'></Td></Tr>";
echo "<Tr align='left'><Td width=30></Td><Td align='right'>คำนำหน้าชื่อ&nbsp;&nbsp;</Td><Td><Input Type='Text' Name='prefix' Size='10' value='$result[prefix]'></Td></Tr>";
echo "<Tr align='left'><Td ></Td><Td align='right'>ชื่อ&nbsp;&nbsp;</Td><Td><Input Type='Text' Name='firstName'  Size='20' value='$result[firstName]'></Td></Tr>";
echo "<Tr align='left'><Td ></Td><Td align='right'>นามสกุล&nbsp;&nbsp;</Td><Td><Input Type='Text' Name='lastName'  Size='30' value='$result[lastName]'></Td></Tr>";
echo "<Tr align='left'><Td ></Td><Td align='right'>เกิดวันที่&nbsp;&nbsp;</Td><Td><Input Type='date' Name='dateOfBirth' value='$result[dateOfBirth]'></Td></Tr>";
echo "<Tr align='left'><Td ></Td><Td align='right'>สัญชาติ&nbsp;&nbsp;</Td><Td><Input Type='Text' Name='nationality'  Size='15' value='$result[nationality]'></Td></Tr>";
echo "<Tr align='left'><Td ></Td><Td align='right'>หมู่เลือด&nbsp;&nbsp;</Td><Td>";
echo "<Select  name='position_code' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
$options = array("A", "B", "O", "AB"); 
    foreach ($options as $option) { 
      echo "<option value='$option'>$option</option>"; 
    } 

echo "<Tr align='left'><Td ></Td><Td align='right'>ที่อยู่ตามทะเบียนบ้าน&nbsp;&nbsp;</Td><Td><Textarea Type='Text' Name='regAddress' Size='50' value='$result[regAddress]'></Textarea></Td></Tr>";
echo "<Tr align='left'><Td width=30></Td><Td align='right'>รหัสไปรษณีย์&nbsp;&nbsp;</Td><Td><Input Type='Text' Name='regZipCode' Size='5' maxlenght='5' onkeydown='integerOnly()' value='$result[regZipCode]'></Td></Tr>";

echo "<Tr align='left'><Td ></Td><Td align='right'>ใช้ที่อยู่ตามทะเบียนบ้าน&nbsp;&nbsp;</Td><Td><Input Type='Checkbox' Name='useSameAddress'></Td></Tr>";
if(isset($_POST["useSameAddress"])){
	
}
else{
	echo "<Tr align='left'><Td ></Td><Td align='right'>ที่อยู่ปัจจุบัน&nbsp;&nbsp;</Td><Td><Textarea Type='Text' Name='curAddress' Size='50' value='$result[curAddress]'></Textarea></Td></Tr>";
	echo "<Tr align='left'><Td width=30></Td><Td align='right'>รหัสไปรษณีย์&nbsp;&nbsp;</Td><Td><Input Type='Text' Name='curZipCode' Size='5' maxlenght='5' onkeydown='integerOnly()' value='$result[curZipCode]'></Td></Tr>";
}


echo "<Tr align='left'><Td ></Td><Td align='right'>ตำแหน่ง&nbsp;&nbsp;</Td><Td>";
echo "<Select  name='position_code' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
$sql = "select * from  person_position order by position_code";
$dbquery = mysqli_query($connect,$sql);
while ($person_result = mysqli_fetch_array($dbquery)){
	if($person_result['position_code']==$result['position_code']){
	echo  "<option  value ='$person_result[position_code]' selected>$person_result[position_name]</option>" ;
	}	
	else {
	echo  "<option  value ='$person_result[position_code]'>$person_result[position_name]</option>" ;
	}
}	
echo "</select>";
echo "</Td></Tr>";

echo "<Tr align='left'><Td ></Td><Td align='right'>ลำดับบุคคลในตำแหน่ง&nbsp;&nbsp;</Td><Td><Input Type='Text' Name='person_order'  Size='4' value='$result[person_order]'></Td></Tr>";

echo  "<tr align='left'>";
echo  "<Td ></Td><td align='right'>ไฟล์รูปภาพ&nbsp;&nbsp;</td>";
echo  "<td align='left'><input name = 'userfile' type = 'file'></td>";
echo  "</tr>";

echo "</Table>";
echo "<Br />";
echo "<Input Type='Hidden' Name='id' Value='$_GET[id]'>"; //
echo "<INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url_update(1)'>
		&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ย้อนกลับ' onclick='goto_url_update(0)'>";
echo "</form>";

?>