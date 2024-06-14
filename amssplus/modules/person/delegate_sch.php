<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
?>
<script type="text/javascript" src="./css/js/calendarDateInput.js"></script> 
<script type="text/javascript" src="jquery/jquery-1.5.1.js"></script> 
<script type="text/javascript">
$(function(){
	$("select#school_code").change(function(){
		var datalist2 = $.ajax({	// รับค่าจาก ajax เก็บไว้ที่ตัวแปร datalist2
			  url: "modules/person/return_ajax_schperson.php", // ไฟล์สำหรับการกำหนดเงื่อนไข
			  data:"school_code="+$(this).val(), // ส่งตัวแปร GET ชื่อ school_code ให้มีค่าเท่ากับ ค่าของ school
			  async: false
		}).responseText;		
		$("select#person_id").html(datalist2); // นำค่า datalist2 มาแสดงใน listbox ที่ 2 ที่ชื่อ person
		// ชื่อตัวแปร และ element ต่างๆ สามารถเปลี่ยนไปตามการกำหนด
	});
});
</script>

<?php


if(!($_SESSION['admin_person']=="person" or $result_permission['p1']==1)){	
exit();
}

function thai_date_3($date){
		if(!(isset($date))){
		return;
		}
$thai_month_arr=array(
	"01"=>"ม.ค.",
	"02"=>"ก.พ.",
	"03"=>"มี.ค.",
	"04"=>"เม.ย.",
	"05"=>"พ.ค.",
	"06"=>"มิ.ย.",	
	"07"=>"ก.ค.",
	"08"=>"ส.ค.",
	"09"=>"ก.ย.",
	"10"=>"ต.ค.",
	"11"=>"พ.ย.",
	"12"=>"ธ.ค."					
);
	$f_date_2=explode(" ", $date);
	$f_date=explode("-", $f_date_2[0]);
	$f_date[2]=intval($f_date[2]);
	$thai_date_return="";
	$thai_date_return.=	$f_date[2];
	$thai_date_return.= " ".$thai_month_arr[$f_date[1]]." ";
	$thai_date_return.=	$f_date[0]+543;
	if($date!=""){
	return $thai_date_return;
	}
	else{
	$thai_date_return="";
	return $thai_date_return;
	}
}

//ส่วนหัว
echo "<br />";
if(!(($index==1) or ($index==2) or ($index==5))){
echo "<table width='100%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>ผู้รักษาการในตำแหน่ง</strong></font></td></tr>";
echo "<tr align='center'><td><font color='#006666' size='2'><strong>ผู้อำนวยการโรงเรียน</strong></font></td></tr>";
echo "</table>";
echo "<br />";
}

//ส่วนฟอร์มรับข้อมูล
if($index==1){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size=3><B>เพิ่มผู้รักษาการในตำแหน่ง</Font>";
echo "</Cener>";
echo "<Br><Br>";
echo "<Table width='50%' Border='0'>";
echo "<Tr><Td align='right'>โรงเรียน&nbsp;&nbsp;&nbsp;&nbsp;</Td>";
echo "<td><div align='left'><Select name='school_code' id='school_code' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
$sql = "select * from  system_school where school_type='1' order by school_code";
$dbquery = mysqli_query($connect,$sql);
While ($result_school = mysqli_fetch_array($dbquery)){
echo  "<option  value ='$result_school[school_code]'>$result_school[school_code] $result_school[school_name]</option>" ;
}	
echo "</select>"; 
echo "</div></td></tr>";
echo "<Tr><Td align='right'>ผู้รักษาการในตำแหน่ง&nbsp;&nbsp;&nbsp;&nbsp;</Td>";
echo "<td><div align='left'><Select name='person_id'  id='person_id' size='1'>";
echo "</select>"; 
echo "</div></td></tr>";
echo "<Tr align='left'><Td align='right'>รักษาการในตำแหน่งตั้งแต่&nbsp;&nbsp;</Td>";
echo "<Td align='left'>";
?>
<script>
								var Y_date=<?php echo date("Y")?>  
								var m_date=<?php echo date("m")?>  
								var d_date=<?php echo date("d")?>  
								Y_date= Y_date+'/'+m_date+'/'+d_date
								DateInput('start', true, 'YYYY-MM-DD', Y_date)</script> 
<?php
echo "</Td></Tr>";

echo "<Tr align='left'><Td align='right'>ถึง&nbsp;&nbsp;</Td>";
echo "<Td align='left'>";
?>
<script>
								var Y_date=<?php echo date("Y")?>  
								var m_date=<?php echo date("m")?>  
								var d_date=<?php echo date("d")?>  
								Y_date= Y_date+'/'+m_date+'/'+d_date
								DateInput('finish', true, 'YYYY-MM-DD', Y_date)</script> 
<?php
echo "</Td></Tr>";
echo "<Tr><Td align='right'>หมายเหตุ&nbsp;&nbsp;&nbsp;&nbsp;</Td>";
echo "<td><INPUT TYPE='text' name='remark' Size='50'></td></tr>";
echo "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
echo "<tr><td align='right'></td>";
echo "<td align='left'><INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url(1)'>&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ย้อนกลับ' onclick='goto_url(0)'></td></tr>";
echo "</Table>";
echo "</form>";
}

//ส่วนยืนยันการลบข้อมูล
if($index==2) {
echo "<table width='500' border='0' align='center'>";
echo "<tr><td align='center'><font color='#990000' size='4'>โปรดยืนยันความต้องการลบข้อมูลอีกครั้ง</font><br></td></tr>";
echo "<tr><td align=center>";
echo "<INPUT TYPE='button' name='smb' value='ยืนยัน' onclick='location.href=\"?option=person&task=delegate_sch&index=3&id=$_GET[id]&page=$_REQUEST[page]\"'>
		&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ยกเลิก' onclick='location.href=\"?option=person&task=delegate_sch&page=$_REQUEST[page]\"'";
echo "</td></tr></table>";
}

//ส่วนลบข้อมูล
if($index==3){
$sql = "delete from person_delegate where id=$_GET[id]";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนบันทึกข้อมูล
if($index==4){
$rec_date = date("Y-m-d");
$sql = "insert into person_delegate (school_code,person_id, start, finish,remark,officer,rec_date) values ('$_POST[school_code]','$_POST[person_id]', '$_POST[start]','$_POST[finish]','$_POST[remark]','$_SESSION[login_user_id]','$rec_date')";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนฟอร์มแก้ไขข้อมูล
if ($index==5){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size=3><B>แก้ไข ผู้รักษาการในตำแหน่งผู้อำนวยการโรงเรียน</B></Font>";
echo "</Cener>";
echo "<Br><Br>";
echo "<Table width='50%' Border= '0'>";
$sql = "select * from person_delegate left join person_sch_main on person_delegate.person_id=person_sch_main.person_id  left join system_school on system_school.school_code=person_delegate.school_code where person_delegate.id='$_GET[id]'";
$dbquery = mysqli_query($connect,$sql);
$ref_result = mysqli_fetch_array($dbquery);

echo "<Tr><Td align='right'>โรงเรียน&nbsp;&nbsp;&nbsp;&nbsp;</Td>";
echo "<td align='left'>";
echo $ref_result['school_name']; 
echo "</td></tr>";

echo "<Tr><Td align='right'>ผู้รักษาการในตำแหน่ง&nbsp;&nbsp;&nbsp;&nbsp;</Td>";
echo "<td><div align='left'><Select name='person_id' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
$sql = "select * from  person_sch_main where status='0' and school_code='$ref_result[school_code]' order by position_code,person_order";
$dbquery = mysqli_query($connect,$sql);
While ($result_person = mysqli_fetch_array($dbquery)){
		if($result_person['person_id']==$ref_result['person_id']){
echo  "<option  value ='$result_person[person_id]' selected>$result_person[prename]$result_person[name] $result_person[surname]</option>" ;
		}
		else{
echo  "<option  value ='$result_person[person_id]'>$result_person[prename]$result_person[name] $result_person[surname]</option>" ;
		}
}	
echo "</select>"; 
echo "</div></td></tr>";
echo "<Tr align='left'><Td align='right'>รักษาการในตำแหน่งตั้งแต่&nbsp;&nbsp;</Td>";
echo "<Td align='left'>";
$start=explode("-", $ref_result['start']);
?>
<script>
										var Y_date=<?php echo $start[0]?>  
										var m_date=<?php echo $start[1]?>  
										var d_date=<?php echo $start[2]?>  
								Y_date= Y_date+'/'+m_date+'/'+d_date
								DateInput('start', true, 'YYYY-MM-DD', Y_date)</script> 
<?php
echo "</Td></Tr>";

echo "<Tr align='left'><Td align='right'>ถึง&nbsp;&nbsp;</Td>";
echo "<Td align='left'>";
$finish=explode("-", $ref_result['finish']);
?>
<script>
										var Y_date=<?php echo $finish[0]?>  
										var m_date=<?php echo $finish[1]?>  
										var d_date=<?php echo $finish[2]?>  
								Y_date= Y_date+'/'+m_date+'/'+d_date
								DateInput('finish', true, 'YYYY-MM-DD', Y_date)</script> 
<?php
echo "</Td></Tr>";
echo "<Tr><Td align='right'>หมายเหตุ&nbsp;&nbsp;&nbsp;&nbsp;</Td>";
echo "<td><INPUT TYPE='text' name='remark' Size='50' value='$ref_result[remark]'></td></tr>";
echo "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
echo "<tr><td align='right'><INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url_update(1)'>&nbsp;&nbsp;</td>";
echo "<td align='left'><INPUT TYPE='button' name='back' value='ย้อนกลับ' onclick='goto_url_update(0)'></td></tr>";
echo "</Table>";
echo "<Br>";
echo "<Input Type=Hidden Name='id' Value='$_GET[id]'>";
echo "<Input Type=Hidden Name='page' Value='$_GET[page]'>";
echo "</form>";
}

//ส่วนปรับปรุงข้อมูล
if ($index==6){
$rec_date = date("Y-m-d");
$sql = "update person_delegate set  person_id='$_POST[person_id]', start='$_POST[start]', finish='$_POST[finish]', remark='$_POST[remark]', officer='$_SESSION[login_user_id]', rec_date='$rec_date' where id='$_POST[id]'";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนแสดงผล
if(!(($index==1) or ($index==2) or ($index==5))){
//ส่วนของการแยกหน้า
$pagelen=20;  // 1_กำหนดแถวต่อหน้า
$url_link="option=person&task=delegate_sch";
$sql = "select id from person_delegate";
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

$sql = "select person_delegate.id, person_delegate.start, person_delegate.finish, person_delegate.remark, person_sch_main.prename, person_sch_main.name, person_sch_main.surname,person_sch_main.position_code,system_school.school_name from person_delegate left join person_sch_main on person_delegate.person_id=person_sch_main.person_id left join system_school on  system_school.school_code=person_delegate.school_code order by person_delegate.start limit $start,$pagelen";
$dbquery = mysqli_query($connect,$sql);
echo  "<table width='85%' border='0' align='center'>";
echo "<Tr><Td colspan='5' align='left'><INPUT TYPE='button' name='smb' value='เพิ่มผู้รักษาการในตำแหน่ง' onclick='location.href=\"?option=person&task=delegate_sch&index=1\"'</Td></Tr>";
echo "</Table>";
echo  "<table width='85%' border='1' align='center' style='border-collapse: collapse'>";
echo "<Tr bgcolor='#FFCCCC'><Td align='center' rowspan='2' width='50'>ที่</Td><td align='center' rowspan='2' width='150'>โรงเรียน</td><td align='center' colspan='2'>วันรักษาการในตำแหน่ง</td><Td align='center' rowspan='2'>ผู้รักษาการในตำแหน่ง</Td><Td align='center' rowspan='2'>ตำแหน่ง</Td><Td align='center' rowspan='2'>หมายเหตุ</Td><Td align='center' rowspan='2' width='50' >ลบ</Td><Td align='center' width='50' rowspan='2'>แก้ไข</Td></Tr>";
echo "<tr bgcolor='#CC9900'><Td align='center' width='110'>เริ่ม</Td><Td align='center' width='110'>สิ้นสุด</Td></tr>";
$N=(($page-1)*$pagelen)+1;  //*เกี่ยวข้องกับการแยกหน้า
$M=1;
While ($result = mysqli_fetch_array($dbquery))
	{
		$id = $result['id'];
		$prename = $result['prename'];
		$name = $result['name'];
		$surname = $result['surname'];
			if(($M%2) == 0)
			$color="#FFFFC";
			else  	$color="#FFFFFF";
		echo "<Tr bgcolor=$color><Td align='center'>$M</Td><Td align='left'>$result[school_name]</Td><Td align='center'>";
		echo thai_date_3($result['start']);
		echo "</Td><Td align='center'>";
		echo thai_date_3($result['finish']);
		echo "</Td><Td align='left'>$prename$name $surname</Td><td>";
		$sql_position = "select position_name from person_sch_position where position_code='$result[position_code]'";
		$dbquery_position = mysqli_query($connect,$sql_position);
		$result_position = mysqli_fetch_array($dbquery_position);
		echo $result_position['position_name'];
		echo "</td><td>$result[remark]</td>
		<Td align='center'><a href=?option=person&task=delegate_sch&index=2&id=$id&page=$page><img src=images/drop.png border='0' alt='ลบ'></a></Td>
		<Td align='center'><a href=?option=person&task=delegate_sch&index=5&id=$id&page=$page><img src=images/edit.png border='0' alt='แก้ไข'></a></Td>
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
		callfrm("?option=person&task=delegate_sch");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.person_id.value == ""){
			alert("กรุณาเลือกบุคลากร");
		}else{
			callfrm("?option=person&task=delegate_sch&index=4");   //page ประมวลผล
		}
	}
}

function goto_url_update(val){
	if(val==0){
		callfrm("?option=person&task=delegate_sch");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.person_id.value == ""){
			alert("กรุณาเลือกบุคลากร");
		}else{
			callfrm("?option=person&task=delegate_sch&index=6");   //page ประมวลผล
		}
	}
}
</script>
