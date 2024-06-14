<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
if(!(($_SESSION['admin_person']=="person") or ($_SESSION['login_status']<=4 and $result_permission['p1']==1))){	
exit();
}

echo "<br />";
echo "<table width='50%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>นำเข้าข้อมูลวันเดือนปีเกิด</strong></font></td></tr>";
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
				list($no,$person_id,$birthday) = explode("\t",$data[$i]);	
				
				$sql="update person_main set birthday='$birthday' where person_id='$person_id' ";
				$dbquery = mysqli_query($connect,$sql);
				$sql2="update person_sch_main set birthday='$birthday' where person_id='$person_id' ";
				$dbquery2 = mysqli_query($connect,$sql2);

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
echo  "<td></td><td align = 'left'><INPUT TYPE='button' name='smb' value='ตกลง' onclick='upload(1)'></td>";
echo   "</tr>";
echo   "</table>";
}

//คำอธิบาย
echo "<br /><br /><br />";
echo  "<table width=70% border=0 align=center>";
echo "<Tr><Td align='left'><strong>คำอธิบาย</strong></Td></Tr>";
echo "<Tr><Td align='left'>1. ข้อมูลเดิมอยู่ในรูปแบบไฟล์ Excel  ให้แถวแรกเป็นชื่อหัวสดมภ์ ประกอบด้วย 1.ที่  2.เลขประจำตัวประชาชน 3. วันเดือนปีเกิด (รูปแบบ ค.ศ. 2013-12-31) </Td></Tr>";
echo "<Tr><Td align='left'>2. ตั้งแต่แถวที่ 2 เป็นต้นไปเป็นข้อมูลบุคลากรแต่ละคน</Td></Tr>";
echo "<Tr><Td align='left'>3. เมื่อข้อมูลในไฟล์ Excel เสร็จเรียบร้อยแล้วให้ Save As เป็นชนิด Text (Tab delimited)</Td></Tr>";
echo "<Tr><Td align='left'>4. หลังจากบันทึกเป็น Text ให้เปิดไฟล์ Text ด้วยโปรแกรม Notepad แล้ว Save As เลือก Encoding เป็น UTF-8 </Td></Tr>";
echo "<Tr><Td align='left'>5. upload ไฟล์จากข้อที่ 4</Td></Tr>";

echo "</Table>";

?>
<script>
function upload(val){
	if(val==1){
		callfrm("?option=person&task=birthday_import");  
		}
}
</script>

