<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

echo "<br />";
if(!(($index==1) or ($index==2) or ($index==5))){
echo "<table width='50%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>Username และ Password สำหรับการเรียกขอข้อมูลจาก SMSS</strong></font></td></tr>";
echo "</table>";
}
//ส่วนเพิ่มข้อมูล
if($index==1){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><B>เพิ่มข้อมูล</B></Font>";
echo "</Cener>";
echo "<Br>";
echo "<Table width=60% Border='0'>";
echo "<Tr align='left'><Td ></Td><Td align='right'>สถานศึกษา&nbsp;</Td><Td>";
echo "<Select  name='office_code' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
$sql = "select * from system_school order by school_type,school_code";
$dbquery = mysqli_query($connect,$sql);
While ($result = mysqli_fetch_array($dbquery)) {
echo  "<option  value = '$result[school_code]'>$result[school_code] $result[school_name]</option>" ;
}
echo "</select>";
echo "</Td></Tr>";

echo "<Tr align='left'><Td width=20></Td><Td align='right'>URL&nbsp;</Td><Td><Input Type='Text' Name='url' Size='30'></Td></Tr>";
echo "<Tr align='left'><Td ></Td><Td align='right'>Username&nbsp;</Td><Td><Input Type='Text' Name='requester_username' Size='20'></Td></Tr>";
echo "<Tr align='left'><Td ></Td><Td align='right'>Password&nbsp;</Td><Td><Input Type='Text' Name='sync_code' Size='20'></Td></Tr>";

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
echo "<INPUT TYPE='button' name='smb' value='ยืนยัน' onclick='location.href=\"?file=sync_other_code&task=school&index=3&id=$_GET[id]&page=$_REQUEST[page]\"'>
		&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ยกเลิก' onclick='location.href=\"?file=sync_other_code&task=school&page=$_REQUEST[page]\"'";
echo "</td></tr></table>";
}
//ส่วนลบข้อมูล
if($index==3){
$sql = "delete from system_sync_smss where id=$_GET[id]";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนเพิ่มข้อมูล
if($index==4){
$rec_date = date("Y-m-d");
$sql = "insert into system_sync_smss (office_code,system_name,url,requester_username,server_ip,sync_code,officer,rec_date) values ( '$_POST[office_code]','SMSS','$_POST[url]','$_POST[requester_username]','','$_POST[sync_code]','$_SESSION[login_user_id]','$rec_date')";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนฟอร์มแก้ไขข้อมูล
if ($index==5){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><B>แก้ไข</B></Font>";
echo "</Cener>";
echo "<Br>";
$sql = "select * from system_sync_smss where id='$_GET[id]'";
$dbquery = mysqli_query($connect,$sql);
$ref_result = mysqli_fetch_array($dbquery);

echo "<Table width='50%' Border='0'>";
echo "<Tr align='left'><Td ></Td><Td align='right'>สถานศึกษา&nbsp;</Td><Td>";
echo "<Select  name='office_code' size='1'>";
echo  "<option value=''>เลือก</option>" ;
$sql = "select * from system_school order by school_type,school_code";
$dbquery = mysqli_query($connect,$sql);
While ($result = mysqli_fetch_array($dbquery)) {
		if($ref_result['office_code']==$result['school_code']){
		echo  "<option value='$result[school_code]' selected>$result[school_code] $result[school_name]</option>" ;
		}
		else{
		echo  "<option value='$result[school_code]'>$result[school_code] $result[school_name]</option>" ;
		}
}
echo "</select>";
echo "</Td></Tr>";

echo "<Tr align='left'><Td width=20></Td><Td align='right'>URL&nbsp;</Td><Td><Input Type='Text' Name='url' Size='50' value='$ref_result[url]'></Td></Tr>";
echo "<Tr align='left'><Td ></Td><Td align='right'>Username&nbsp;</Td><Td><Input Type='Text' Name='requester_username' Size='20' value='$ref_result[requester_username]'></Td></Tr>";
echo "<Tr align='left'><Td ></Td><Td align='right'>Password&nbsp;</Td><Td><Input Type='Text' Name='sync_code' Size='50' value='$ref_result[sync_code]'></Td></Tr>";

echo "<Br>";
echo "</Table>";
echo "<Br>";
echo "<Input Type=Hidden Name='id' Value='$_GET[id]'>";
echo "<Input Type=Hidden Name='page' Value='$_GET[page]'>";
echo "<INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url_update(1)'>
		&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ย้อนกลับ' onclick='goto_url_update(0)'>";

echo "</form>";
}
//ส่วนปรับปรุงข้อมูล
if ($index==6){
$rec_date = date("Y-m-d");
$sql = "update system_sync_smss set office_code='$_POST[office_code]',url='$_POST[url]',requester_username='$_POST[requester_username]',sync_code='$_POST[sync_code]',officer='$_SESSION[login_user_id]',rec_date='$rec_date' where id='$_POST[id]'";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนการแสดงผล
if(!(($index==1) or ($index==2) or ($index==5))){
//ส่วนของการแยกหน้า
$pagelen=30;  // 1_กำหนดแถวต่อหน้า
$url_link="file=sync_other_code";  // 2_กำหนดลิงค์ฺ
$sql = "select * from system_sync_smss"; // 3_กำหนด sql
$dbquery = mysqli_query($connect,$sql);
$num_rows = mysqli_num_rows($dbquery );  
$totalpages=ceil($num_rows/$pagelen);
if(!(isset($_REQUEST['page']))){
$_REQUEST['page']="";
}
if($_REQUEST['page']==""){
$page=$totalpages;
		if($page<2){
		$page=1;
		}
}
else{
		if($totalpages<$_REQUEST['page']){
		$page=$totalpages;
					if($page<1){
					$page=1;
					}
		}
		else{
		$page=$_REQUEST['page'];
		}
}

$start=($page-1)*$pagelen;

if(($totalpages>1) and ($totalpages<16)){
echo "<div align=center>";
echo "หน้า	";
			for($i=1; $i<=$totalpages; $i++)	{
					if($i==$page){
					echo "[<b><font size=+1 color=#990000>$i</font></b>]";
					}
					else {
					echo "<a href=$PHP_SELF?$url_link&page=$i>[$i]</a>";
					}
			}
echo "</div>";
}			
if($totalpages>15){
			if($page <=8){
			$e_page=15;
			$s_page=1;
			}
			if($page>8){
					if($totalpages-$page>=7){
					$e_page=$page+7;
					$s_page=$page-7;
					}
					else{
					$e_page=$totalpages;
					$s_page=$totalpages-15;
					}
			}
			echo "<div align=center>";
			if($page!=1){
			$f_page1=$page-1;
			echo "<<a href=$PHP_SELF?$url_link&page=1>หน้าแรก </a>";
			echo "<<<a href=$PHP_SELF?$url_link&page=$f_page1>หน้าก่อน </a>";
			}
			else {
			echo "หน้า	";
			}					
			for($i=$s_page; $i<=$e_page; $i++){
					if($i==$page){
					echo "[<b><font size=+1 color=#990000>$i</font></b>]";
					}
					else {
					echo "<a href=$PHP_SELF?$url_link&page=$i>[$i]</a>";
					}
			}
			if($page<$totalpages)	{
			$f_page2=$page+1;
			echo "<a href=$PHP_SELF?$url_link&page=$f_page2> หน้าถัดไป</a>>>";
			echo "<a href=$PHP_SELF?$url_link&page=$totalpages> หน้าสุดท้าย</a>>";
			}
			echo " <select onchange=\"location.href=this.options[this.selectedIndex].value;\" size=\"1\" name=\"select\">";
			echo "<option  value=\"\">หน้า</option>";
				for($p=1;$p<=$totalpages;$p++){
				echo "<option  value=\"?$url_link&page=$p\">$p</option>";
				}
			echo "</select>";
echo "</div>";  
}					
//จบแยกหน้า

$sql = "select *,system_sync_smss.id from system_sync_smss left join system_school on system_sync_smss.office_code=system_school.school_code order by system_sync_smss.office_code limit $start,$pagelen";
$dbquery = mysqli_query($connect,$sql);

echo  "<table width='85%' border='0' align='center'>";
echo "<Tr><Td colspan='6' align='left'><INPUT TYPE='button' name='smb' value='เพิ่มข้อมูล' onclick='location.href=\"?file=sync_other_code&task=school&index=1\"'></Td></Tr>";
echo "</Table>";
echo  "<table width='85%' border='1' align='center' style='border-collapse: collapse'>";
echo "<Tr bgcolor='#E6E6E6' align='center'><Td width='50'>ที่</Td><Td width='120'>รหัสสถานศึกษา</Td><Td>ชื่อสถานศึกษา</Td><Td width='120'>ชื่อระบบ</Td><Td width='160'>URL</Td><Td width='120'>Username</Td><td width='120'>Password</Td><td width='50'>ลบ</Td><Td width='50'>แก้ไข</Td></Tr>";
$N=(($page-1)*$pagelen)+1;  //*เกี่ยวข้องกับการแยกหน้า
$M=1;
While ($result = mysqli_fetch_array($dbquery))
	{
		$id = $result['id'];
		$office_code= $result['office_code'];
		$system_name= $result['system_name'];
		$school_name= $result['school_name'];
		$url= $result['url'];
		$requester_username= $result['requester_username'];
		$sync_code= $result['sync_code'];
		
			if(($M%2) == 0)
			$color="#FFFFC";
			else  	$color="#FFFFFF";

		echo "<Tr  bgcolor=$color align='center'><Td>$N</Td> <Td>$office_code</Td><Td align=left>$school_name</Td><Td align=left>$system_name</Td><Td align=left>$url</Td><Td align='left'>$requester_username</Td><Td align='left'>$sync_code</Td><Td><div align='center'><a href=?file=sync_other_code&task=school&index=2&id=$id&page=$page><img src=../images/drop.png border='0' alt='ลบ'></a></div></Td><Td><a href=?file=sync_other_code&task=school&index=5&id=$id&page=$page><img src=../images/edit.png border='0' alt='แก้ไข'></a></div></Td>
	</Tr>";
$M++;
$N++;  //*เกี่ยวข้องกับการแยกหน้า
	}
echo "</Table>";
}


?>
<script>
function goto_url(val){
	if(val==0){
		callfrm("?file=sync_other_code");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.office_code.value == ""){
			alert("กรุณาเลือกหน่วยงาน");
		}else if(frm1.url.value==""){
			alert("กรุณากรอกURL");
		}else if(frm1.requester_username.value==""){
			alert("กรุณากรอกusername");
		}else if(frm1.sync_code.value==""){
			alert("กรุณากรอกรหัสการเชื่อมต่อ");
		}else{
			callfrm("?file=sync_other_code&index=4");   //page ประมวลผล
		}
	}
}

function goto_url_update(val){
	if(val==0){
		callfrm("?file=sync_other_code");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.office_code.value == ""){
			alert("กรุณาเลือกหน่วยงาน");
		}else if(frm1.url.value==""){
			alert("กรุณากรอกURL");
		}else if(frm1.requester_username.value==""){
			alert("กรุณากรอกusername");
		}else if(frm1.sync_code.value==""){
			alert("กรุณากรอกรหัสการเชื่อมต่อ");
		}else{
			callfrm("?file=sync_other_code&index=6");   //page ประมวลผล
		}
	}
}
</script>
