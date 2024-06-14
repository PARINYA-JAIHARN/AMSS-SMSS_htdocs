<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
require_once "../time_inc.php";	
$user=$remote_user_id;

/////////////////////////////////
if(isset($_REQUEST['page'])){
	$page=$_REQUEST['page'];
}else{
	$page="";
}

if(isset($_REQUEST['person_id'])){
	$person_id=$_REQUEST['person_id'];
}else{
	$person_id="";
}

if(isset($_REQUEST['switch_index'])){
	$switch_index=$_REQUEST['switch_index'];
}else{
	$switch_index="";
}

if(isset($_REQUEST['name_search'])){
	$name_search=$_REQUEST['name_search'];
}else{
	$name_search="";
}

if(!(isset($_POST['sendto']))){
$_POST['sendto']="";
}

if(!(isset($_POST['subject']))){
$_POST['subject']="";
}

if(!(isset($_POST['detail']))){
$_POST['detail']="";
}

//ส่วนหัว
echo "<br />";
if(!(($index==1) or ($index==2) or ($index==7))){

echo "<table width='100%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>ทะเบียนจดหมายส่ง</strong></font></td></tr>";
echo "</table>";
}

//ส่วนลบข้อมูล
if($index==2){
	$sql="select * from mail_main  where ms_id='$_GET[id]'";
	$dbquery = mysqli_query($connect,$sql);
	$ref_result = mysqli_fetch_array($dbquery);
	$ref_id=$ref_result['ref_id'];

	$sql="select * from mail_filebook where ref_id='$ref_id'";
	$dbquery_file = mysqli_query($connect,$sql);
	While ($result_file = mysqli_fetch_array($dbquery_file)){
	$file=	$result_file['file_name'];
	$path_file="../upload_files/".$file;
			if(file_exists($path_file)){
			unlink($path_file);	
			}
	}

$sql = "delete from mail_filebook where ref_id='$ref_id'";
$dbquery = mysqli_query($connect,$sql);

$sql = "delete from mail_sendto_answer where ref_id='$ref_id'";
$dbquery = mysqli_query($connect,$sql);

$sql = "delete from mail_main where ms_id='$_GET[id]'";
$dbquery = mysqli_query($connect,$sql);

$index="";
}


if ($index==7){
				if(($name_search=="") and ($person_id=="")){
				$return_index="";
				}
				else{
				$return_index=8;
				}
echo "<Br>";
echo "<Table  align='center' width='700' Border='0'>";
echo "<Tr ><Td align='right'><INPUT TYPE='button' name='smb' value='<<กลับหน้าก่อน' onclick='location.href=\"?file=send_report_book&page=$page&name_search=$name_search&person_id=$person_id&return_index=$return_index&remote_user_office=$remote_user_office&remote_user_id=$remote_user_id&remote_login_status=$remote_login_status&remote_sync=$remote_sync\"'></Td></Tr>";
echo "</table>";

$sql = "select * from  mail_main where ms_id='$_GET[id]' ";
$dbquery = mysqli_query($connect,$sql);
$result = mysqli_fetch_array($dbquery);
$ref_id=$result['ref_id'];
$detail=$result['detail'];
$send_date=$result['send_date'];

echo "<table border='1' width='700' id='table1' style='border-collapse: collapse' bordercolor='#C0C0C0' align='center'>";
echo "<tr bgcolor='#0000FF'>";
echo "<td colspan='2' height='23' align='left'><font size='2' color='#FFFFFF'>&nbsp;รายละเอียดของจดหมาย</font></td>";
echo "</tr>";
echo "<tr>";
echo "<td width='94' align='right'><font size='2' color='#0000FF'>ถึง&nbsp;</font></span></td>";
echo "<td align='left'>";
echo "<div align='left'><Select  name='person_sended'  size='1'>";
$sql_name = "select * from mail_sendto_answer left join person_main on mail_sendto_answer.send_to=person_main.person_id where mail_sendto_answer.ref_id='$ref_id' order by person_main.name";
$dbquery_name = mysqli_query($connect,$sql_name);
$M=1;
while ($result_name=mysqli_fetch_array($dbquery_name)) {
		$send_to=$result_name['send_to'];
		$prename=$result_name['prename'];
		$name= $result_name['name'];
		$surname = $result_name['surname'];
		
								//กรณีโรงเรียน
					if($name==""){
					$sql_sch= "select * from person_sch_main where person_id='$send_to'";
					$dbquery_sch= mysqli_query($connect,$sql_sch);
					$result_sch=mysqli_fetch_array($dbquery_sch);
					$prename=$result_sch['prename'];
					$name= $result_sch['name'];
					$surname = $result_sch['surname'];
					}

		$full_name="$prename$name&nbsp;&nbsp;$surname";
		echo  "<option value =''>$M.$full_name</option>" ;
		//echo $M.$full_name." ";
$M++;		
}
echo "</select></div>";
echo "</td></tr>";

echo "<tr>";
echo "<td width='94' align='right'><span lang='th'><font size='2' color='#0000FF'>เรื่อง&nbsp;</font></span></td>";
echo "<td align='left'>&nbsp;<input type='text' name='subject' size='76'  style='background-color: #E5E5FF' value='$result[subject]' readonly> </td>";
echo "</tr>";

echo "<tr>";
echo "<td width='94' align='right' height='47'><span lang='th'><font size='2' color='#0000FF'>ข้อความ&nbsp;</font></span></td>";
echo "<td height='47' align='left'>&nbsp;<textarea rows='10' name='detail' cols='55'  style='background-color: #E5E5FF' readonly>$result[detail]</textarea></td>";
echo "</tr>";

echo "<tr>";
echo "<td width='94' align='right'><font size='2' color='#0000FF'>ไฟล์&nbsp;</font></span></td>";
echo "<td align='left'>";
		$query_file=mysqli_query($connect,"SELECT * FROM  mail_filebook WHERE ref_id='$ref_id' ") ;
		$M=1;
		While ($result_file = mysqli_fetch_array($query_file)){
		echo  "&nbsp;&nbsp;<a href=../upload_files/$result_file[file_name] target='_blank'>$M.$result_file[file_des]</a><br>";
		$M++;
		}
echo "</td></tr>";

echo "</Table>";
} //endindex

//ส่วนแสดงผล
if(!(($index==1) or ($index==2) or ($index==7))){
			if(isset($_REQUEST['return_index'])==8){
			$index=8;
			}
			
//ส่วนของการแยกหน้า
			if($switch_index==1){
			$person_id="";
			}
			if($switch_index==2){
			$name_search="";
			}
if($index==8  and  $name_search!=""){
$sql="select * from mail_main where sender='$user'  and  subject like '%$name_search%' ";
}

else if($index==8 and $person_id!=""){
$sql="select * from mail_main left join  mail_sendto_answer  on  mail_main.ref_id=mail_sendto_answer.ref_id where mail_main.sender='$user' and  mail_sendto_answer.send_to='$person_id' order by ms_id ";
}
else{
$sql="select ms_id from mail_main where sender='$user' ";
}
$dbquery = mysqli_query($connect,$sql);
$num_rows = mysqli_num_rows($dbquery );
$pagelen=20;  // 1_กำหนดแถวต่อหน้า
$url_link="file=send_report_book&index=$index&name_search=$name_search&person_id=$person_id&remote_user_office=$remote_user_office&remote_user_id=$remote_user_id&remote_login_status=$remote_login_status&remote_sync=$remote_sync";  // 2_กำหนดลิงค์
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
echo "</div>";  
}					
//จบแยกหน้า

////////////////////ค้นหาบุคคล
echo "<form id='frm1' name='frm1'>";
echo "<table width='85%' align='center'><tr><Td  align='left'></Td><td align='right'>";
echo "ค้นหาด้วยชื่อเรื่อง&nbsp;";
		if($index==8){
		echo "<Input Type='Text' Name='name_search' value='$name_search' >";
		}
		else{
		echo "<Input Type='Text' Name='name_search' Size='30'>";
		}
echo "&nbsp;<INPUT TYPE='button' name='smb'  value='ค้น' onclick='goto_display(1)'>";
echo "&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;";

echo "ค้นหาด้วยชื่อผู้รับ(เจ้าหน้าที่สพท)&nbsp";
echo "<Select  name='person_id' size='1'>";
echo  '<option value ="" >เลือก</option>' ;
$sql = "select  * from person_main where status='0' order by name";
$dbquery = mysqli_query($connect,$sql);
While ($result = mysqli_fetch_array($dbquery)){
			if($person_id==""){
			echo "<option value=$result[person_id]>$result[name]&nbsp;$result[surname]</option>"; 
			}
			else{
					if($person_id==$result['person_id']){
					echo "<option value=$result[person_id] selected>$result[name]&nbsp;$result[surname]</option>"; 
					}
					else{
					echo "<option value=$result[person_id]>$result[name]&nbsp;$result[surname]</option>"; 
					}
			}		
}
	echo "</select>";
	echo "&nbsp;<INPUT TYPE='button' name='smb' value='เลือก' onclick='goto_display(2)'>";
echo "</td></tr></table>";
echo "<input type='hidden' name='remote_user_office' value='$remote_user_office'>";
echo "<input type='hidden' name='remote_user_id' value='$remote_user_id'>";
echo "<input type='hidden' name='remote_login_status' value='$remote_login_status'>";
echo "<input type='hidden' name='remote_sync' value='$remote_sync'>";
echo "</form>";
//////////////////////////////////////////
if($index==8 and $name_search!=""){
$sql="select * from mail_main where sender='$user'  and  subject like '%$name_search%' order by ms_id limit $start,$pagelen";
}
else if($index==8 and $person_id!=""){
$sql="select * from mail_main left join  mail_sendto_answer  on  mail_main.ref_id=mail_sendto_answer.ref_id where mail_main.sender='$user' and mail_sendto_answer.send_to='$person_id' order by ms_id limit $start,$pagelen";
}else{
$sql="select * from mail_main where sender='$user' order by ms_id limit $start,$pagelen";
}
$dbquery = mysqli_query($connect,$sql);
echo  "<table width='85%' border='1' align=center style='border-collapse: collapse'>";
echo "<Tr bgcolor='#99ccff' align='center'><Td width='60'>เลขที่</Td><Td width='20%'>วันที่ส่ง</Td><Td>เรื่อง</Td><Td width='40'>File</Td><Td width='40'>ส่งถึง</Td><Td  width='40'>ลบ</Td></Tr>";

$N=(($page-1)*$pagelen)+1; //*เกี่ยวข้องกับการแยกหน้า
$M=1;

While ($result = mysqli_fetch_array($dbquery)){
		$id = $result['ms_id'];
		$subject = $result['subject'];
		$ref_id = $result['ref_id'];
		$rec_date = $result['send_date'];
			if(($M%2) == 0)
			$color="#E5E5FF";
			else  	$color="#FFFFFF";
			
echo "<Tr bgcolor='$color'><Td valign='top' align='center'>$id</Td><Td valign='top' align='left'>";
echo thai_date_4($rec_date);
echo "</Td><Td align='top' align='left'><a href=?file=send_report_book&index=7&id=$id&page=$page&name_search=$name_search&person_id=$person_id&remote_user_office=$remote_user_office&remote_user_id=$remote_user_id&remote_login_status=$remote_login_status&remote_sync=$remote_sync>$subject</a></Td>";
			
			$query_file=mysqli_query($connect,"SELECT * FROM  mail_filebook WHERE ref_id='$ref_id' ") ;
			$num_file=mysqli_num_rows($query_file);

			if($num_file>=1){
			echo "<td align='center'><img src=../../../images/b_bookmark.png border='0' alt='ไฟล์'></td>";
			}
			else{
			echo "<td></td>";
			}

echo "<td align='center'><a href='../main/sendto_show.php?ref_id=$ref_id' target='_blank'><img src=../../../images/admin/user.gif border='0' alt='ส่งถึง'></a></td>";
echo "<td align='center'><a href=?file=send_report_book&index=2&id=$id&page=$page&remote_user_office=$remote_user_office&remote_user_id=$remote_user_id&remote_login_status=$remote_login_status&remote_sync=$remote_sync><img src=../../../images/drop.png border='0' alt='ลบ'></a></td>";

echo "</Tr>";

$M++;
$N++;  //*เกี่ยวข้องกับการแยกหน้า
}	
echo "</Table>";
}
?>
<script>
function goto_display(val){
	if(val==1){
		callfrm("?file=send_report_book&index=8&switch_index=1"); 
		}
	else if(val==2){
		callfrm("?file=send_report_book&index=8&switch_index=2"); 
		}
}
</script>
