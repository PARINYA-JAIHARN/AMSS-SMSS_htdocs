<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
if(!(($_SESSION['admin_person']=="person") or ($_SESSION['login_status']<=4 and $result_permission['p1']==1))){	
exit();
}

echo "<br />";
echo "<table width='50%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>นำเข้าข้อมูลครูและบุคลากรในสถานศึกษา</strong></font></td></tr>";
echo "</table>";

if($_FILES){
// ตรวจสอบว่าเป็น text file หรือไม่
$uploaddir ="modules/person/upload/";     //ที่เก็บไฟล์
$uploadfile = $uploaddir.basename($_FILES['userfile']['name']);
$basename = basename($_FILES['userfile']['name']);

//ลบไฟล์เดิมออก
if (file_exists($uploadfile)) {
unlink($uploadfile);
}

$surname = explode(".", $_FILES['userfile']['name']);
		if($surname[1]!="txt"){
			unlink($_FILES['userfile']['tmp_name']);
				?> <script>
				alert("ไม่ใช่ text file กรุณาอ่านคำอธิบายอีกครั้ง");
				</script> 
				<?php
			uploadfile();
			exit();	
		}
		if (move_uploaded_file($_FILES['userfile']['tmp_name'],$uploadfile)){
		$data=file("$uploadfile");  
				for($i=1;$i<count($data);$i++){ 
				list($person_id,$prename,$name,$surname,$position_code,$school_code) = explode("\t",$data[$i]);	
						if($person_id!=""){
						$sql = "insert into person_sch_main (person_id,prename,name,surname,position_code,school_code,status,person_order) values ('$person_id','$prename','$name','$surname','$position_code','$school_code','0','0')";
						$dbquery = mysqli_query($connect,$sql);
						}
				}
		}
		else{
		echo  "<br><strong><font color=#990000 size=3>ไม่สามารถอัพโหลดได้</font></strong>";
		exit();
		}
	 	?> <script>
			document.location.href="?option=person&task=person_sch";		
			</script> 
		<?php
}
else{
uploadfile();
}

//ส่วนของform	
function uploadfile () {
echo  "<form name ='frm1' Enctype = 'multipart/form-data'>";
echo  "<br>";
echo  "<table align='center' width='50%' border='0'>";
echo  "<tr>";
echo  "<td align='right'><strong><font color='#003366' size='2'>ไฟล์เอกสาร</font></strong></td>";
echo  "<td align='left'><input name = 'userfile'  type = 'file'><font color='#003366' size='2'></font></td>";
echo  "</tr>";
echo  "<tr><td></td><td></td></tr> ";
echo  "<tr> ";
echo  "<td></td><td align = 'left'><INPUT TYPE='button' name='smb' value='ตกลง' onclick='upload(1)' class='entrybutton'></td>";
echo   "</tr>";
echo   "</table>";
}

//คำอธิบาย
echo "<br /><br /><br />";
echo  "<table width=70% border=0 align=center>";
echo "<Tr><Td align='left'><strong>คำอธิบาย</strong></Td></Tr>";
echo "<Tr><Td align='left'>1. ข้อมูลเดิมอยู่ในรูปแบบไฟล์ Excel  ให้แถวแรกเป็นชื่อหัวสดมภ์ ประกอบด้วย 1.เลขประจำตัวประชาชน 2.คำนำหน้าชื่อ 3.ชื่อ 4.นามสกุล 6.รหัสตำแหน่ง 7.รหัสสถานศึกษา (ไฟล์ตัวอย่าง Download ได้ที่เมนูคู่มือ) </Td></Tr>";
echo "<Tr><Td align='left'>2. ตั้งแต่แถวที่ 2 เป็นต้นไปเป็นข้อมูลบุคลากรแต่ละคน</Td></Tr>";
echo "<Tr><Td align='left'>3. รหัสตำแหน่งให้ดูที่รายการเมนูกำหนดตำแหน่ง เมนูตั้งค่าระบบ</Td></Tr>";
echo "<Tr><Td align='left'>4. เมื่อข้อมูลในไฟล์ Excel เสร็จเรียบร้อยแล้วให้ Save As เป็นชนิด Text (Tab delimited)</Td></Tr>";
echo "<Tr><Td align='left'>5. หลังจากบันทึกเป็น Text ให้เปิดไฟล็ Text ด้วยโปรแกรม Notepad แล้ว Save As เลือก Encoding เป็น UTF-8 </Td></Tr>";
echo "<Tr><Td align='left'>6. upload ไฟล์จากข้อที่ 5</Td></Tr>";

echo "</Table>";

?>
<script>
function upload(val){
	if(val==1){
		callfrm("?option=person&task=person_sch_import");  
		}
}
</script>

