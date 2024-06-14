<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
$officer=$_SESSION['login_user_id'];

echo "<br />";
if(!(($index==1) or ($index==2) or ($index==5))){
echo "<table width='50%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>รายละเอียดสถานศึกษา (ส่วนเพิ่ม)</strong></font></td></tr>";
echo "</table>";
}

//ส่วนฟอร์มแก้ไขข้อมูล
if ($index==5){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><B>เพิ่มเติม แก้ไข รายละเอียดสถานศึกษา</B></Font>";
echo "</Cener>";
echo "<Br>";
$sql = "select *,system_school.school_code from  system_school  left join system_school_detail on system_school.school_code=system_school_detail.school_code where system_school.id='$_GET[id]'";
$dbquery = mysqli_query($connect,$sql);
$ref_result = mysqli_fetch_array($dbquery);
$school_code= $ref_result['school_code'];

echo "<Table width='70%' Border='0'>";
echo "<Tr align='left'><Td ></Td><Td align='right'>ชื่อสถานศึกษา&nbsp;</Td><Td>$ref_result[school_code] $ref_result[school_name]</Td></Tr>";

echo "<Tr align='left'><Td width=20></Td><Td align='right'>รหัสสถานศึกษา 10 หลัก&nbsp;</Td><Td><Input Type='Text' Name='school_code10' Size='10' maxlength='10' value='$ref_result[school_code10]'  onkeydown='integerOnly()'> จากมาตรฐานข้อมูลกลาง ศธ. http://www.standardcode.moe.go.th</Td></Tr>";

echo "<Tr align='left'><Td ></Td><Td align='right'>ที่ตั้งสถานศึกษา หมู่ที่&nbsp;</Td><Td><Input Type='Text' Name='moo' Size='10' value='$ref_result[moo]' ></Td></Tr>";

echo "<Tr align='left'><Td ></Td><Td align='right'>รหัสหมู่&nbsp;</Td><Td><Input Type='Text' Name='moo_code' Size='10' value='$ref_result[moo_code]' onkeydown='integerOnly()'> *ของกระทรวงมหาดไทย</Td></Tr>";

echo "<Tr align='left'><Td ></Td><Td align='right'>ตำบล&nbsp;</Td><Td><Input Type='Text' Name='tambon' Size='20' value='$ref_result[tambon]'></Td></Tr>";

echo "<Tr align='left'><Td></Td><Td align='right'>อำเภอ&nbsp;</Td><Td><Input Type='Text' Name='amphoe' Size='20' value='$ref_result[amphoe]' ></Td></Tr>";

echo "<Tr align='left'><Td></Td><Td align='right'>จังหวัด&nbsp;</Td><Td><Input Type='Text' Name='province' Size='20' value='$ref_result[province]'></Td></Tr>";

echo "<Tr align='left'><Td></Td><Td align='right'>รหัสไปรษณีย์&nbsp;</Td><Td><Input Type='Text' Name='postcode' Size='20' value='$ref_result[postcode]'></Td></Tr>";

echo "<Tr align='left'><Td></Td><Td align='right'>พิกัดบนแผนที่&nbsp;</Td><Td><Input Type='Text' Name='map' Size='40' value='$ref_result[map]'> Latitude,Longtitude</Td></Tr>";

echo "<Tr align='left'><Td ></Td><Td align='right'>ประเภทสถานศึกษา&nbsp;</Td><Td>";

$select1=""; $select2=""; $select3=""; $select4="";
if($ref_result['edschool_type']==1){
$select1="selected";
}
else if($ref_result['edschool_type']==2){
$select2="selected";
}
else if($ref_result['edschool_type']==3){
$select3="selected";
}
else if($ref_result['edschool_type']==4){
$select4="selected";
}

echo "<Select  name='edschool_type' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
echo  "<option  value = '1' $select1>เปิดสอน ระดับก่อนประถมศึกษา</option>" ;
echo  "<option  value = '2' $select2>เปิดสอน ระดับก่อนประถมศึกษา - ประถมศึกษา</option>" ;
echo  "<option  value = '3' $select3>เปิดสอน ระดับก่อนประถมศึกษา - มัธยมศึกษาตอนต้น (ขยายโอกาส)</option>" ;
echo  "<option  value = '4' $select4>เปิดสอน ระดับมัธยมศึกษา</option>" ;

echo "</select>";
echo "</Td></Tr>";

echo "<Br>";
echo "</Table>";
echo "<Br>";
echo "<Input Type=Hidden Name='school_code' Value='$school_code'>";
echo "<INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url_update(1)'>
		&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ย้อนกลับ' onclick='goto_url_update(0)'>";

echo "</form>";
}
//ส่วนปรับปรุงข้อมูล
if ($index==6){
$rec_date=$day_now=date("Y-m-d");
		$sql = "select school_code from system_school_detail  where school_code='$_POST[school_code]'";
		$dbquery = mysqli_query($connect,$sql);
		$num_row=mysqli_num_rows($dbquery);
		if($num_row==0){
		$sql = "insert into system_school_detail(school_code, school_code10, moo_code, moo, tambon, amphoe, province, postcode, map, edschool_type, rec_date, officer) values ( '$_POST[school_code]','$_POST[school_code10]','$_POST[moo_code]','$_POST[moo]','$_POST[tambon]','$_POST[amphoe]', '$_POST[province]','$_POST[postcode]','$_POST[map]','$_POST[edschool_type]', '$rec_date', '$officer')";
		$dbquery = mysqli_query($connect,$sql);
		}
		else{
		$sql = "update system_school_detail set school_code10='$_POST[school_code10]',moo_code='$_POST[moo_code]',moo='$_POST[moo]',tambon='$_POST[tambon]',amphoe='$_POST[amphoe]',province='$_POST[province]',postcode='$_POST[postcode]',map='$_POST[map]',edschool_type='$_POST[edschool_type]' where school_code='$_POST[school_code]'";
		$dbquery = mysqli_query($connect,$sql);
		}
}

//ส่วนการแสดงผล
if(!(($index==1) or ($index==2) or ($index==5))){

$sql = "select *,system_school.id,system_school.school_code from system_school  left join system_school_detail on system_school.school_code=system_school_detail.school_code order by system_school.school_type,system_school.school_code";
$dbquery = mysqli_query($connect,$sql);
echo "<br>";
echo  "<table width='95%' border='1' align='center' style='border-collapse: collapse'>";
echo "<Tr bgcolor='#E6E6E6' align='center'><Td width='50'>ที่</Td><Td width='100'>รหัสสถานศึกษา</Td><Td width='200'>ชื่อสถานศึกษา</Td><Td width='100'>รหัสสถานศึกษา(ศธ)</Td><Td>รหัสหมู่ที่</Td><Td>ที่ตั้ง (หมู่ ตำบล อำเเภอ จังหวัด รหัสไปรษณีย์)</Td><Td>พิกัด</Td><Td>ประเภท ร.ร.</Td><Td width='50'>เพิ่ม<br>แก้ไข</Td></Tr>";
$N=1; 
$M=1;
While ($result = mysqli_fetch_array($dbquery))
	{
		$id = $result['id'];
		$school_code= $result['school_code'];
		$school_name= $result['school_name'];
		$type="";
		if($result['edschool_type']==1){
		$type="ก่อนประถม";
		}
		else if($result['edschool_type']==2){
		$type="ประถม";
		}
		else if($result['edschool_type']==3){
		$type="ขยายโอกาส";
		}
		else if($result['edschool_type']==4){
		$type="มัธยม";
		}
		
			if(($M%2) == 0)
			$color="#FFFFC";
			else  	$color="#FFFFFF";

		echo "<Tr  bgcolor=$color align=center class=style1><Td>$N</Td> <Td>$school_code</Td><Td align=left>$school_name</Td><Td align='center'>$result[school_code10]</Td><Td align='center'>$result[moo_code]</Td><Td align='left'>";
		echo $result['moo'];
		echo "  ";
		echo $result['tambon'];
		echo "  ";
		echo $result['amphoe'];
		echo "  ";
		echo $result['province'];
		echo "  ";
		echo $result['postcode'];
		
		echo "</Td><Td>$result[map]</Td><Td align='left'>$type</Td><Td><a href=?file=school_detail&index=5&id=$id><img src=../images/edit.png border='0' alt='แก้ไข'></a></div></Td>
	</Tr>";
$M++;
$N++;  //*เกี่ยวข้องกับการแยกหน้า
	}
echo "</Table>";
}


?>
<script>
function goto_url_update(val){
	if(val==0){
		callfrm("?file=school_detail");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.school_code10.value == ""){
			alert("กรุณากรอกรหัสสถานศึกษา 10 หลัก" );
		}else if(frm1.school_code10.value.length!=10){
			alert("กรุณากรอกรหัสสถานศึกษาให้ครบ 10 หลัก");
		}else if(frm1.edschool_type.value==0){
			alert("กรุณาเลือกประเภทสถานศึกษา");
		}else{
			callfrm("?file=school_detail&index=6");   //page ประมวลผล
		}
	}
}
</script>
