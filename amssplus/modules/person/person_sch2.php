<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
if(!(($_SESSION['admin_person']=="person") or ($_SESSION['login_status']<=4 and $result_permission['p1']==1))){	
exit();
}
?>

<?php
$officer=$_SESSION['login_user_id'];

echo "<br />";
echo "<table width='50%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>ข้อมูลครูและบุคลากรในสถานศึกษา (รอการรับรอง)</strong></font></td></tr>";
echo "<tr align='center'><td><font color='#006666' size='2'><strong>(เป็นข้อมูลครูและบุคลากรจากระบบ SMSS ที่เข้าใช้งาน AMSS++)</strong></font></td></tr>";
echo "</table>";
echo "<br>";

//ส่วนการลบข้อมูล
if($index==3){
$sql = "delete from person_sch_main where id=$_GET[id]";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนปรับปรุงข้อมูล
if ($index==6){
$sql = "update person_sch_main set status='0' where id='$_GET[id]'";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนการแสดงผล
//ส่วนของการแยกหน้า
$sql_page = "select id from person_sch_main where status='9' ";
$dbquery_page = mysqli_query($connect,$sql_page);
$num_rows=mysqli_num_rows($dbquery_page);

$pagelen=20; // กำหนดแถวต่อหน้า
$url_link="option=person&task=person_sch2";
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

$sql = "select *,person_sch_main.id from person_sch_main left join person_sch_position on person_sch_main.position_code=person_sch_position.position_code
left join system_school on person_sch_main.school_code=system_school.school_code
where person_sch_main.status='9' order by person_sch_main.position_code,person_sch_main.person_order limit $start,$pagelen";
$dbquery = mysqli_query($connect,$sql);
echo  "<table width='85%' border='1' align='center' style='border-collapse: collapse'>";
echo "<Tr bgcolor='#FFCCCC' align='center'><Td width='70'>ที่</Td><Td width='150'>เลขประชาชน</Td><Td>ชื่อ</Td><Td>ตำแหน่ง</Td><Td>สถานศึกษา</Td><Td  width='60'>รับรอง</Td><Td  width='60'>ไม่รับรอง<br>(ลบ)</Td></Tr>";
$N=(($page-1)*$pagelen)+1;  //*เกี่ยวข้องกับการแยกหน้า
$M=1;
While ($result = mysqli_fetch_array($dbquery))
	{
		$id = $result['id'];
		$person_id = $result['person_id'];
		$prename=$result['prename'];
		$name= $result['name'];
		$surname = $result['surname'];
		$position_name= $result['position_name'];
		$school_name= $result['school_name'];
		$person_order= $result['person_order'];
			if(($M%2) == 0)
			$color="#FFFFC";
			else  	$color="#FFFFFF";
			
		echo "<Tr  bgcolor=$color align='center'><Td>$N</Td><Td align='left'>$person_id</Td><Td align='left'>$prename&nbsp;$name&nbsp;$surname</Td><Td align='left'>";
echo $position_name;
echo "</Td>";
echo "<Td align='left'>$school_name</Td>";
echo "<Td><a href=?option=person&task=person_sch2&index=6&id=$id&page=$page><img src=images/yes.png border='0'></a></div></Td>";
echo "<Td><a href=?option=person&task=person_sch2&index=3&id=$id&page=$page><img src=images/no.png border='0'></a></div></Td>";
echo "</Tr>";
$M++;
$N++;
	}
echo "</Table>";

echo  "<table width='85%' align='center' border='0'";
echo "<tr><td>ตรวจสอบว่าเป็นครูและบุคลากรถูกต้องหรือไม่  หากถูกต้องคลิกปุ่มรับรอง  หากไม่ถูกต้องให้คลิกไม่รับรอง(ข้อมูลจากจะถูกลบ)</td></tr>";
echo "</Table>";

?>
<script>
function goto_url(val){
	if(val==0){
		callfrm("?option=person&task=person_sch2");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.person_id.value == ""){
			alert("กรุณากรอกเลขประจำตัวประชาชน");
		}else if(frm1.prename.value==""){
			alert("กรุณากรอกคำนำหน้าชื่อ");
		}else if(frm1.name.value==""){
			alert("กรุณากรอกชื่อ");
		}else if(frm1.surname.value==""){
			alert("กรุณากรอกนามสกุล");
		}else if(frm1.position_code.value==""){
			alert("กรุณาเลือกตำแหน่ง");
		}else if(frm1.school_code.value==""){
			alert("กรุณาเลือกสถานศึกษา");
		}else{
			callfrm("?option=person&task=person_sch2&index=4");   //page ประมวลผล
		}
	}
}

function goto_url_update(val){
	if(val==0){
		callfrm("?option=person&task=person_sch2");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.person_id.value == ""){
			alert("กรุณากรอกเลขประจำตัวประชาชน");
		}else if(frm1.prename.value==""){
			alert("กรุณากรอกคำนำหน้าชื่อ");
		}else if(frm1.name.value==""){
			alert("กรุณากรอกชื่อ");
		}else if(frm1.surname.value==""){
			alert("กรุณากรอกนามสกุล");
		}else if(frm1.position_code.value==""){
			alert("กรุณาเลือกตำแหน่ง");
		}else if(frm1.school.value==""){
			alert("กรุณาเลือกสถานศึกษา");
		}else{
			callfrm("?option=person&task=person_sch2&index=6");   //page ประมวลผล
		}
	}
}

function goto_display(val){
	if(val==1){
		callfrm("?option=person&task=person_sch2"); 
		}
	else if(val==2){
		callfrm("?option=person&task=person_sch2&index=8"); 
		}
}

function goto_delete_all(){
			callfrm("?option=person&task=person_sch2&index=3.1"); 
}

function CheckAll() {
	for (var i = 0; i < document.frm1.elements.length; i++)
	{
	var e = document.frm1.elements[i];
	if (e.name != "allchk")
		if(e.value==1 && e.type=="checkbox"){
		e.checked = document.frm1.allchk.checked;
		}
	}
}
</script>
