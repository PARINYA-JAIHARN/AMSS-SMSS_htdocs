<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

echo "<br />";
if(!(($index==1) or ($index==2))){
echo "<table width='50%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>บัญชีการเชื่อมระบบกับ SMSS</strong></font></td></tr>";
echo "</table>";
}
//ส่วนเพิ่มข้อมูล
if($index==1){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><B>เพิ่มข้อมูล</B></Font>";
echo "</Cener>";
echo "<Br>";
echo "<Table width='40%' Border='0'>";
echo "<Tr align='left'><Td ></Td><Td align='right'>สถานศึกษา&nbsp;</Td><Td>";
echo "<Select name='office_code' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
$sql = "select * from system_school order by school_type,school_code";
$dbquery = mysqli_query($connect,$sql);
While ($result = mysqli_fetch_array($dbquery)) {
echo  "<option  value = '$result[school_code]'>$result[school_code] $result[school_name]</option>" ;
}
echo "</select>";
echo "</Td></Tr>";
echo "<Tr align='left'><Td ></Td><Td align='right'>รหัส(Sync)&nbsp;</Td><Td><Input Type='Text' Name='sync_code' Size='20'></Td></Tr>";


echo "<Br>";echo "</Table>";

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
echo "<INPUT TYPE='button' name='smb' value='ยืนยัน' onclick='location.href=\"?file=sync_smss_code&task=school&index=3&id=$_GET[id]&page=$_REQUEST[page]\"'>
		&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ยกเลิก' onclick='location.href=\"?file=sync_smss_code&task=school&page=$_REQUEST[page]\"'";
echo "</td></tr></table>";
}
//ส่วนลบข้อมูล
if($index==3){
$sql = "delete from system_sync_smss_2 where id=$_GET[id]";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนเพิ่มข้อมูล
$rec_date = date("Y-m-d");
if($index==4){
$sql = "insert into system_sync_smss_2(office_code,sync_code,officer,rec_date) values ( '$_POST[office_code]','$_POST[sync_code]','$_SESSION[login_user_id]','$rec_date')";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนการแสดงผล
if(!(($index==1) or ($index==2))){
//ส่วนของการแยกหน้า
$pagelen=30;  // 1_กำหนดแถวต่อหน้า
$url_link="file=sync_smss_code";  // 2_กำหนดลิงค์ฺ
$sql = "select * from system_sync_smss_2"; // 3_กำหนด sql
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

$sql = "select *,system_sync_smss_2.id from system_sync_smss_2 left join system_school on system_sync_smss_2.office_code=system_school.school_code order by system_sync_smss_2.office_code limit $start,$pagelen";
$dbquery = mysqli_query($connect,$sql);
echo "<br>";
echo  "<table width='80%' border='0' align='center'>";
echo "</Table>";
echo  "<table width='80%' border='1' align='center' style='border-collapse: collapse'>";
echo "<Tr bgcolor='#E6E6E6' align='center'><Td width='50'>ที่</Td><Td width='120'>รหัสสถานศึกษา</Td><Td>ชื่อสถานศึกษา</Td><Td width='150'>Server Ip</Td><Td width='250'>Smss Url</Td><td width='70'>รหัส</Td><td width='50'>ลบ</Td></Tr>";
$N=(($page-1)*$pagelen)+1;  //*เกี่ยวข้องกับการแยกหน้า
$M=1;
While ($result = mysqli_fetch_array($dbquery))
	{
		$id = $result['id'];
		$office_code= $result['office_code'];
		$sync_code= $result['sync_code'];
		$school_name= $result['school_name'];
		$remote_ip= $result['remote_ip'];
		$smss_url= $result['smss_url'];
		
			if(($M%2) == 0)
			$color="#FFFFC";
			else  	$color="#FFFFFF";

echo "<Tr  bgcolor=$color align='center'><Td>$N</Td><Td>$office_code</Td><Td align=left>$school_name</Td><td>$remote_ip</td><td>$smss_url</td><Td align='center'>";
if($sync_code!=""){
echo "<img src=../images/yes.png border='0'>";
}
else{
echo "<img src=../images/no.png border='0'>";
}
echo "</Td><Td><div align='center'><a href=?file=sync_smss_code&task=school&index=2&id=$id&page=$page><img src=../images/drop.png border='0' alt='ลบ'></a></div></Td></Tr>";
$M++;
$N++;  //*เกี่ยวข้องกับการแยกหน้า
	}
echo "</Table>";
}


?>
<script>
function goto_url(val){
	if(val==0){
		callfrm("?file=sync_smss_code");  
	}else if(val==1){
		if(frm1.office_code.value == ""){
			alert("กรุณาเลือกหน่วยงาน");
		}else if(frm1.sync_code.value==""){
			alert("กรุณากรอกรหัสการเชื่อมต่อ");
		}else{
			callfrm("?file=sync_smss_code&index=4");  
		}
	}
}
</script>
