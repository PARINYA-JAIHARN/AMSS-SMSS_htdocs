<?php
error_reporting(0);
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
$rec_date = date("Y-m-d");

//ส่วนบันทึกข้อมูล
if($index==4){
$rec_date = date("Y-m-d");
$person_num=0;
$insert_num=0;

		for($i=0;$i<count($_POST['name']);$i++){
		$person_id_number=$_POST['person_id_number'][$i];
		$prename=$_POST['prename'][$i];
		$name=$_POST['name'][$i];	
		$surname=$_POST['surname'][$i];
		$position_code=$_POST['position_code'][$i];
		$school_code=$_POST['school_code'][$i];
		
				$sql = "select id from person_sch_main where person_id='$person_id_number'";
				$dbquery = mysqli_query($connect,$sql);
				$row_num=mysqli_num_rows($dbquery);
				if($row_num<1){
					$sql = "insert into person_sch_main(person_id,prename,name,surname,position_code,school_code,pic,status,person_order,officer,rec_date,other) values ('$person_id_number','$prename','$name','$surname','$position_code','$school_code','','0','0','$_SESSION[login_user_id]','$rec_date','0')";
					if($dbquery = mysqli_query($connect,$sql)){
					$insert_num++;
					}
				}
		$person_num++;	
		}
echo "<script>alert('บันทึกข้อมูล จำนวน $insert_num รายการ จากทั้งหมด $person_num รายการ');</script>\n";
echo "<script>document.location.href='?option=person&task=person_sch&school_code=$school_code';</script>\n";
}



if(!(isset($_POST['urlGET']))){
echo "<br />";
echo "<form method='post' action='' id='frm1' name='frm1'>";
echo "<table align='center'>";
echo "<tr>";
echo "<td>";
$sql = "select * from system_sync_smss_2 left join system_school on system_sync_smss_2.office_code=system_school.school_code order by system_school.school_type,system_school.school_code";
$dbquery = mysqli_query($connect,$sql);
$ROW=1;
$COLUMN=1;
echo "<fieldset>";
echo "<legend>&nbsp;<B>เลือกสถานศึกษา</B>: &nbsp;<input type='checkbox' name='insert_now' value='1'>บันทึกข้อมูลทันที</legend>";
echo "<table>";
While ($result = mysqli_fetch_array($dbquery)){
	if($ROW==1){
	echo "<tr>";
	}
	echo "<td><input type='checkbox' name='chk' onclick='Check()'>$result[school_code] $result[school_name]";
	echo "<input type='hidden' name='urlGET[]' value='$result[school_code]' disabled>";
	if($COLUMN==4){
	echo "</tr>";
	$COLUMN=0;
	$ROW=0;
	}
	$ROW++;
	$COLUMN++;
}
echo "</table>";
echo "</fieldset>";
echo "</td>";
echo "</tr>";
echo "</table>";
echo "<br />";
echo "<div align='center'><input type='submit'></div>";
echo "</form>";
}

if(isset($_POST['urlGET'])){
$urlGET=$_POST['urlGET'];
$requester_server_id = $_SERVER["SERVER_ADDR"]; 
echo "<form id='frm1' name='frm1'>";
foreach ($urlGET as &$value) {
   		$school_code= $value;  
		$sql_sync = "select * from  system_sync_smss_2 where office_code='$school_code'";
		$dbquery_sync = mysqli_query($connect,$sql_sync);
		$result_sync = mysqli_fetch_array($dbquery_sync);
		$smss_url=$result_sync['smss_url'];
		$sync_code=$result_sync['sync_code']; 
		$url ="$smss_url"."export/xml.php?username=amssplus&password=$sync_code&requester_server_id=$requester_server_id&order=person"; 
		
		$xmlDoc = new DOMDocument();
		$xmlDoc->load($url);
		$announce = $xmlDoc->getElementsByTagName('item');
		
		$warning=base64_decode($xmlDoc->getElementsByTagName('warning')->item(0)->nodeValue);
		if($warning!="1"){
		echo "<br>";
		echo "<div align='center'>";
		echo $warning;
		echo "</div>";
		}
		
		//ตรวจสอบการเข้าถุึงเว็บsmss
		$smss_fond="0";
		if($warning!=""){
		$smss_fond="1";
		}
		if($smss_fond=="0"){
		$smss_url = explode("?",$url);
		echo "<br>";
		echo "<div align='center'>";
		echo "ไม่สามารถเข้าถึง".$smss_url[0];
		echo "</div>";
		}

if($warning=="1" and $smss_fond=="1"){
echo "<br />";		
echo "<table align='center' width='65%' border='0'>";
echo "<tr><td align='center'><b>รายชื่อครูและบุคลากรทางการศึกษา";
		$school_code=base64_decode($xmlDoc->getElementsByTagName('office_code')->item(0)->nodeValue);
		echo base64_decode($xmlDoc->getElementsByTagName('school_name')->item(0)->nodeValue);
		echo " ";
		echo $school_code;
echo "</b></td></tr>";
echo "</table>";
echo "<table align='center' width='65%' border='1' borderColor='#FF0033' style='border-collapse: collapse'>";
echo "<tr align='center' bgcolor='#FBD562'><td width='50'>ที่</td><td width='140'>เลขประจำตัวประชาชน</td><td width='100'>คำนำหน้า</td><td width='150'>ชื่อ</td><td width='150'>นามสกุล</td><td width='50'>รหัสตำแหน่ง</td><td>ชื่อตำแหน่ง</td></tr>";
		$i=1;
		$person_num=0;
		$insert_num=0;
		foreach ($announce as $ann)
		{
		if(($i%2) == 0)
		$color="#FFFFFF";
		else $color="#FFFFFF";
		$person_id=base64_decode($ann->getElementsByTagName('person_id')->item(0)->nodeValue);
		$prename=base64_decode($ann->getElementsByTagName('prename')->item(0)->nodeValue);
		$name=base64_decode($ann->getElementsByTagName('name')->item(0)->nodeValue);
		$surname=base64_decode($ann->getElementsByTagName('surname')->item(0)->nodeValue);
		$position_code=base64_decode($ann->getElementsByTagName('position_code')->item(0)->nodeValue);
		$position_name=base64_decode($ann->getElementsByTagName('position_name')->item(0)->nodeValue);
		
		
		echo "<tr bgcolor=$color align='center'>";
			echo "<td align='center'><input type='checkbox' name='chk2[]' onclick='Check2()'>$i</td>";
			echo "<td align='center'>";
			echo "<Input Type='Text' Name='person_id_number[]' Size='13' value='$person_id' disabled>";			
			echo "</td>";
			echo "<td>";
			echo "<Input Type='Text' Name='prename[]' Size='10' value='$prename' disabled>";			
			echo "</td>";
			echo "<td>";
			echo "<Input Type='Text' Name='name[]' Size='20' value='$name' disabled>";			
			echo "</td>";
			echo "<td>";
			echo "<Input Type='Text' Name='surname[]' Size='20' value='$surname' disabled>";			
			echo "</td>";
			echo "<td>";
			echo "<Input Type='Text' Name='position_code[]' Size='5' value='$position_code' disabled>";	
			echo "</td>";
			echo "<td>";
			echo $position_name;
			echo "</td>";
			echo "<Input Type='Hidden' Name='school_code[]' Value='$school_code' disabled>"; 
///////////////////////////////////////		
			if(isset($_POST['insert_now'])){
				$sql = "select id from person_sch_main where person_id='$person_id'";
				$dbquery = mysqli_query($connect,$sql);
				$row_num=mysqli_num_rows($dbquery);
						if($row_num<1){
							$sql = "insert into person_sch_main(person_id,prename,name,surname,position_code,school_code,pic,status,person_order,officer,rec_date,other) values ('$person_id','$prename','$name','$surname','$position_code','$school_code','','0','0','$_SESSION[login_user_id]','$rec_date','0')";
								if($dbquery = mysqli_query($connect,$sql)){
								$insert_num++;
								}
						}
				$person_num++;
				}
///////////////////////////////////		
			$i++;
		echo "</tr>";
		}
	echo "</table>";
	if(isset($_POST['insert_now'])){
	echo "<script>alert('บันทึกข้อมูล จำนวน $insert_num รายการ จากทั้งหมด $person_num รายการ');</script>\n";
	}
echo "<br>";
}
} //if not warning	
echo "<table align='center' width='65%' border='1' borderColor='#FF0033' style='border-collapse: collapse'>";
echo "<tr><td align='left'>&nbsp;<input type='checkbox' name='allchk' id='allchk' onclick='CheckAll()'>&nbsp;เลือกทั้งหมด&nbsp;<font color='#FF0000'>*ตรวจสอบรหัสตำแหน่งให้ถูกต้อง</font></td></tr>";
echo "</table>";
echo "<table align='center' width='70%' border='0'>";
echo "<tr><td align='right'>หมายเหตุ การบันทึกข้อมูลได้ครั้งละเท่าไร ยังขึ้นอยู่กับการกำหนดค่าที่ php.ini</td></tr>";
echo "</table>";
echo "<br>";
echo "<div align='center'><INPUT TYPE='button' name='smb' value='บันทึก' onclick='goto_url(1)'></div>";
echo "</form>";
unset($value); // break the reference with the last element
}
?>
<script>
function Check() {
		var x = document.getElementsByName("chk");
		var y = document.getElementsByName("urlGET[]");
		var i;
		for (i = 0; i < x.length; i++) {
			if (x[i].type == "checkbox") {
				if(x[i].checked == true){
				y[i].disabled=false;
				}
				if(x[i].checked == false){
				y[i].disabled=true;
				}
			}
		}	
}

function Check2() {
		var x = document.getElementsByName("chk2[]");
		var y1 = document.getElementsByName("person_id_number[]");
		var y2 = document.getElementsByName("prename[]");
		var y3 = document.getElementsByName("name[]");
		var y4 = document.getElementsByName("surname[]");
		var y5 = document.getElementsByName("position_code[]");
		var y6 = document.getElementsByName("school_code[]");

		var i;
		for (i = 0; i < x.length; i++) {
			if (x[i].type == "checkbox") {
				if(x[i].checked == true){
				y1[i].disabled=false;
				y2[i].disabled=false;
				y3[i].disabled=false;
				y4[i].disabled=false;
				y5[i].disabled=false;
				y6[i].disabled=false;
				}
				if(x[i].checked == false){
				y1[i].disabled=true;
				y2[i].disabled=true;
				y3[i].disabled=true;
				y4[i].disabled=true;
				y5[i].disabled=true;
				y6[i].disabled=true;
				}
			}
		}	
}

function CheckAll() {
		var x = document.getElementsByName("chk2[]");
		var y1 = document.getElementsByName("person_id_number[]");
		var y2 = document.getElementsByName("prename[]");
		var y3 = document.getElementsByName("name[]");
		var y4 = document.getElementsByName("surname[]");
		var y5 = document.getElementsByName("position_code[]");
		var y6 = document.getElementsByName("school_code[]");

	for (var i = 0; i < document.frm1.elements.length; i++)
	{
		if(document.frm1.allchk.checked==true){
		x[i].checked=true;
		y1[i].disabled=false;
		y2[i].disabled=false;
		y3[i].disabled=false;
		y4[i].disabled=false;
		y5[i].disabled=false;
		y6[i].disabled=false;
		}
		else{
		x[i].checked=false;
		y1[i].disabled=true;
		y2[i].disabled=true;
		y3[i].disabled=true;
		y4[i].disabled=true;
		y5[i].disabled=true;
		y6[i].disabled=true;
		}
	}
}

function goto_url(val){
	callfrm("?option=person&task=getxml_person&index=4");   //page ประมวลผล
}
</script>
