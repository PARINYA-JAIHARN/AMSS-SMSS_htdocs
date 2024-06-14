<?php
if(!(isset($_REQUEST['remote_user_office']) and isset($_REQUEST['remote_user_id']))){
		echo "<div align='center'><br>";
			echo "ERROR";
		echo "</div>";
		exit();
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php
if(isset($_SESSION['user_os'])){
	if($_SESSION['user_os']=='mobile'){
	echo "<meta name = 'viewport' content = 'width = device-width'>";
	}
}
?>
<style type="text/css">
<!--
.style1 {
	font-size: 12px;
}
-->
</style>
</head>
<body>
<?php
require_once "../../../amssplus_connect.php";	
require_once("../../../mainfile.php");
require_once("time_inc.php");
date_default_timezone_set('Asia/Bangkok');
$user=$_REQUEST['remote_user_id'];

//ส่วนบันทึกตอบกลับ
if(isset($_POST['ref_id_2'])){
$rec_date = date("Y-m-d H:i:s");

$sql = "insert into mail_main (sender, subject, detail, ref_id, send_date) values ('$user', '$_POST[subject]','$_POST[detail]','$_POST[ref_id_2]','$rec_date')";
$dbquery = mysqli_query($connect,$sql);

$sql= "insert into mail_sendto_answer (ref_id,send_to,answer_time) values ('$_POST[ref_id_2]','$_POST[send_to]','0000-01-01 00:00:00')";
$dbquery = mysqli_query($connect,$sql);

$sizelimit = 20000*1024 ;  //ขนาดไฟล์ที่ให้แนบ 20 Mb.
$subject = $_POST ['subject'] ;
$detail = $_POST ['detail'] ;
$dfile1 = $_POST ['dfile1'] ;

$myfile1 = $_FILES ['myfile1'] ['tmp_name'] ;
$myfile1_name = $_FILES ['myfile1'] ['name'] ;
$myfile1_size = $_FILES ['myfile1'] ['size'] ;
$myfile1_type = $_FILES ['myfile1'] ['type'] ;

 $array_last1 = explode("." ,$myfile1_name) ;
 $c1 =count ($array_last1) - 1 ;
 $lastname1 = strtolower ($array_last1 [$c1] ) ;

 if  ($myfile1<>"") {
		 if ($lastname1 =="doc" or $lastname1 =="docx" or $lastname1 =="rar" or $lastname1 =="pdf" or $lastname1 =="xls" or $lastname1 =="xlsx" or $lastname1 =="zip" or $lastname1 =="jpg" or $lastname1 =="gif"  or $lastname1 =="png" ) { 
			 $upfile1 = "" ; 
		  }else {
			 $upfile1 = "-ไม่อนุญาตให้ทำการแนบไฟล์ $myfile1_name<BR> " ;
			 exit();		
		  } 
		
		  If ($myfile1_size>$sizelimit) {
			  $sizelimit1 = "-ไฟล์ $myfile1_name มีขนาดใหญ่กว่าที่กำหนด<BR>" ;
			  exit();	
		  }
 }
 
if ($myfile1<>"" ) {
$myfile1name=$_POST['ref_id_2']."_1.".$lastname1 ; 
copy ($myfile1, "../upload_files/".$myfile1name)  ; 

$sql = "insert into mail_filebook (ref_id, file_name, file_des) values ('$_POST[ref_id_2]','$myfile1name','$dfile1')";
$dbquery = mysqli_query($connect,$sql);

unlink ($myfile1) ;
}

echo "<script>alert('ส่งจดหมายแล้ว')</script>\n";
echo "<script>window.close();</script>";
exit()	;		
}
/// end บันทึกตอบกลับ

#add autolink & auto new line(<br />) to message by Mr.Jedsada Junthasing @04.05.2015 21:05
function autolink($temp)
	{
		$temp = preg_replace("#(^|[\n ])([\w]+?://[^ \"\n\r\t<]*)#is", "\\1<a href=\"\\2\" target=\"_blank\"><font color=#FF6600>\\2</font></a>", $temp);
		$temp = str_replace( "\n", '<br />', $temp ); 
	return ( $temp ) ;
	}
#end function autolink

$sql = "select * from  mail_main left join person_main on mail_main.sender=person_main.person_id where mail_main.ms_id='$_GET[id]' ";
$dbquery = mysqli_query($connect,$sql);
$result = mysqli_fetch_array($dbquery);
$sender=$result['sender'];
$ref_id=$result['ref_id'];
$detail=$result['detail'];
$send_date=$result['send_date'];
		$prename=$result['prename'];
		$name= $result['name'];
		$surname = $result['surname'];
		
								//กรณีโรงเรียน
					if($name==""){
					$sql_sch= "select * from person_sch_main where person_id='$sender' ";
					$dbquery_sch= mysqli_query($connect,$sql_sch);
					$result_sch=mysqli_fetch_array($dbquery_sch);
					$prename=$result_sch['prename'];
					$name= $result_sch['name'];
					$surname = $result_sch['surname'];
					}
		
$full_name="$prename$name&nbsp;&nbsp;$surname";
$thai_send_date=thai_date_4($send_date);

//บันทึกรับ
$day_now=date("Y-m-d H:i:s");
$query_receive =mysqli_query($connect,"select * from mail_sendto_answer where ref_id='$ref_id' and send_to='$user' and answer='0' ");
$receive_num=mysqli_num_rows($query_receive);
		
		if($receive_num>=1){
		$sql = "update mail_sendto_answer set answer='1', 
		answer_time='$day_now'
		where ref_id='$ref_id' and send_to='$user' ";
		mysqli_query($connect,$sql);
		}

?>

	<div align="center">
	<table border="0" width="100%" id="table1" style="border-collapse: collapse; border: 1px dotted #FF00FF; ; padding-left:4px; padding-right:4px; padding-top:1px; padding-bottom:1px" cellpadding="2" >
		<tr>
			<td bgcolor="#003399" colspan="2" style="border: 1px dotted #808000"><font color="#FFFFFF">
			<span lang="en-us"><font size="2">&nbsp;</font></span><font size="2">รายละเอียดของจดหมาย 
		     </font></font></td>
		</tr>
		<tr>
			<td width="449" align="left" colspan="2" style="border: 1px dotted #808000">
			<font size="2" >&nbsp;จาก : </font> <FONT SIZE="2" COLOR="#CC3300"><?php echo $full_name;?></font></td>
		</tr>
		<tr>
			<td width="449" align="right" colspan="2" style="border: 1px dotted #808000">
			<p align="left"><font size="2" >&nbsp;เรื่อง : </font><FONT SIZE="2" COLOR="#CC3300"><?php echo $result['subject'];?></FONT>
			</td>
		</tr>
		
		<tr>
			<td width="85" align="left" style="border: 1px dotted #808000"><font size="2" >&nbsp;ข้อความ</font></td>
			<td width="377" align="left" style="border: 1px dotted #808000">
			<div align="center">
				<table border="1" width="95%" id="table2" style="border-collapse: collapse" bordercolor="#808000" cellspacing="2" cellpadding="2">
					<tr>
						<td align="left"><FONT SIZE="2" align="left"><?php  echo autolink($result['detail']);?></FONT></td>
					</tr>
				</table>
			</div>
			</td>
		</tr>
		
	<tr>
			<td align="left" style="border: 1px dotted #808000"><font size="2">&nbsp;ไฟล์แนบ&nbsp;</font></td>
			<td  width="377" align="left" style="border: 1px dotted #808000">
			<div align="center">
				<table border="1" width="95%" id="table3" style="border-collapse: collapse" bordercolor=#669999 cellspacing="2" cellpadding="2">
<?php

// check file attach
$sql_file = mysqli_query($connect,"SELECT * FROM  mail_filebook WHERE  ref_id = '$ref_id' ") ;
$file_num = mysqli_num_rows ($sql_file) ;

if ($file_num<> 0) {
$list = 1 ;
while ($list<= $file_num&&$row= mysqli_fetch_array($sql_file)) {
$file_name = $row['file_name'] ;
$file_des = $row['file_des'] ;
?>
					<tr>
						<td align="left">&nbsp;<FONT SIZE="2"><?php echo $list;?>. </FONT><A HREF="../upload_files/<?php echo $file_name;?>" title="คลิกเพื่อเปิดไฟล์แนบลำดับที่ <?php echo $list;?>" target="_BLANK"><FONT SIZE="2"><span style="text-decoration: none"><?php echo $file_des;?></span></FONT></A></td>
					</tr>

<?php
	$list ++ ;
	}

}else {
?>
<tr>
						<td align="left">&nbsp;<FONT SIZE="2" COLOR="#CC3300"> ไม่มีไฟล์แนบ</FONT></td>
</tr>

<?php
}

?>

				</table>
			</div>
			</td>
		</tr>
		<tr>
			<td align="left" colspan="2" style="border: 1px dotted #808000">
			<font size="2">&nbsp;วันที่ส่ง : </font> <FONT SIZE="2" COLOR="#CC3300"><?php echo $thai_send_date;?></font></td>
		</tr>

	</table><BR>
</div>

<?php
echo "<button type='button' id='b1' onclick='e_show()'><font size='2'>ตอบกลับ</font></button>";
echo "<button type='button' id='b2' onclick='e_hide()' style='display: none;'><font size='2'>ปิดตอบกลับ</font></button>";
echo "<div id='answer' style='display: none;'>";
echo "<form Enctype=multipart/form-data id='frm2' name='frm2' action='maildetail.php' method='post'>";
$timestamp = mktime(date("H"), date("i"),date("s"), date("m") ,date("d"), date("Y"))  ;	
$ref_id_2 = $_REQUEST['remote_user_id'].$timestamp ;

$subject_text=$result['subject']."(ตอบกลับ)";
echo "<input type='hidden' name='ref_id_2' value='$ref_id_2'>";
echo "<input type='hidden' name='subject' value='$subject_text'>";
echo "<input type='hidden' name='sender' value='$user'>";
echo "<input type='hidden' name='send_to' value='$sender'>";
echo "<input type='hidden' name='remote_user_office' value='$_REQUEST[remote_user_office]'>";
echo "<input type='hidden' name='remote_user_id' value='$_REQUEST[remote_user_id]'>";
echo "<table>";
echo "<tr>";
echo "<td width='94' align='right' height='47'><span lang='th'><font size='2' color='#0000FF'>ข้อความ&nbsp;</font></span></td>";
echo "<td height='47' width='514' colspan='3'  align='left'>&nbsp;<textarea rows='5' name='detail' cols='55'></textarea></td>";
echo "</tr>";
echo "<tr>";
echo "<td width='94' align='right'><font size='2' color='#0000FF'>ไฟล์แนบ&nbsp;</font></td>";
echo "<td>&nbsp;<input type='file' name='myfile1' size='26'></td>";
echo "<td  align='left' colspan='2'><input type='hidden' name='dfile1' value='ไฟล์เอกสาร'></td>";
echo "</tr>";
echo "<tr>";
echo "<td align='center' colspan='4'><BR><INPUT TYPE='submit' name='smb' id='submit' value='ตกลง'></td>";
echo "</tr>";
echo "</table>";
echo "</form>";
echo "</div>";
?>

<script>
function e_show(){
		document.getElementById("answer").style.display="block";
		document.getElementById("b1").style.display="none";
		document.getElementById("b2").style.display="block";
}
function e_hide(){
		document.getElementById("answer").style.display="none";
		document.getElementById("b1").style.display="block";
		document.getElementById("b2").style.display="none";
}

</script>

</body>
</html>




