<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

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

if(!($_SESSION['login_status']<=14)){
exit();
}
require_once "modules/mail/time_inc.php";	
$user=$_SESSION['login_user_id'];

//ส่วนหัว
if(!($index==4)){

echo "<table width='100%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>ทะเบียนรับจดหมาย</strong></font></td></tr>";
echo "</table>";
}

//ส่วนแสดงผล
if(!($index==4)){
			if(isset($_REQUEST['return_index'])==8){
			$index=8;
			}
//ส่วนของการแยกหน้า
$sql="select mail_main.ms_id from mail_main left join mail_sendto_answer on mail_main.ref_id=mail_sendto_answer.ref_id where mail_sendto_answer.send_to='$user' ";
$dbquery = mysqli_query($connect,$sql);
$num_rows = mysqli_num_rows($dbquery );

$pagelen=20;  // 1_กำหนดแถวต่อหน้า
$url_link="option=mail&task=main/receive_mobile&index=$index&name_search=$name_search";  // 2_กำหนดลิงค์
$totalpages=ceil($num_rows/$pagelen);

if(!isset($_REQUEST['page'])){
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

if(($totalpages>1) and ($totalpages<6)){
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
if($totalpages>5){
			if($page <=3){
			$e_page=5;
			$s_page=1;
			}
			if($page>3){
					if($totalpages-$page>=2){
					$e_page=$page+2;
					$s_page=$page-2;
					}
					else{
					$e_page=$totalpages;
					$s_page=$totalpages-5;
					}
			}
			echo "<div align=center>";
			if($page!=1){
			$f_page1=$page-1;
			echo "<<a href=$PHP_SELF?$url_link&page=1>แรก </a>";
			echo "<<<a href=$PHP_SELF?$url_link&page=$f_page1>ก่อน </a>";
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
			echo "<a href=$PHP_SELF?$url_link&page=$f_page2> ถัด</a>>>";
			echo "<a href=$PHP_SELF?$url_link&page=$totalpages> ท้าย</a>>";
			}
echo "</div>";  
}					
//จบแยกหน้า

//////////////////////////////////////////

$sql="select * from mail_main left join mail_sendto_answer on mail_main.ref_id=mail_sendto_answer.ref_id where mail_sendto_answer.send_to='$user' order by mail_main.ms_id limit $start,$pagelen";
$dbquery = mysqli_query($connect,$sql);
echo  "<table width='100%' border='1' align='center' style='border-collapse: collapse' align='center'>";

echo "<Tr bgcolor='#99ccff' align='center'><Td>ที่</Td><Td>จดหมายจาก</Td><Td>วันที่ส่ง</Td><Td>เรื่อง</Td><Td>รับ</Td><Td>วันที่รับ</Td></Tr>";

$N=(($page-1)*$pagelen)+1; //*เกี่ยวข้องกับการแยกหน้า
$M=1;

While ($result = mysqli_fetch_array($dbquery)){
$sch_person_index=0;
		$id = $result['ms_id'];
		$subject = $result['subject'];
		$sender = $result['sender'];
		$ref_id = $result['ref_id'];
		$rec_date = $result['send_date'];
		$answer_time=$result['answer_time'];
			if(($M%2) == 0)
			$color="#E5E5FF";
			else  	$color="#FFFFFF";
			
		$query_person=mysqli_query($connect,"SELECT * FROM  person_main WHERE person_id='$sender' ") ;
		$result_person=mysqli_fetch_array($query_person);
		$prename=$result_person['prename'];
		$name= $result_person['name'];
		$surname = $result_person['surname'];
		
										//กรณีโรงเรียน
					if($name==""){
					$sql_sch= "select * from person_sch_main, system_school where person_sch_main.school_code=system_school.school_code and person_id='$sender' ";
					$dbquery_sch= mysqli_query($connect,$sql_sch);
					$result_sch=mysqli_fetch_array($dbquery_sch);
					$prename=$result_sch['prename'];
					$name= $result_sch['name'];
					$surname = $result_sch['surname'];
					$sch_person_index=1;
					}
		
		$full_name="$prename$name&nbsp;&nbsp;$surname";
			
echo "<Tr bgcolor='$color'><Td align='center'>$id</Td><Td align='left'>$full_name</Td><Td align='left'>";
echo thai_date_4($rec_date);
echo "</Td><Td align='left'>";
?>
<a href="modules/mail/main/maildetail.php?id=<?php echo $id;?>" class="dialogify" title="คลิกเพื่อดูรายละเอียด"><span style="text-decoration: none"><?php echo $subject; ?></span></a>
<?php
echo "</Td>";
			if($result['answer']==1){
			echo "<td align='center'><img src=images/yes.png border='0' alt='รับแล้ว'></td>";
			}
			else{
			echo "<td align='center'><img src=images/no.png border='0' alt='ยังไม่ได้รับ'></td>";
			}

echo "<td align='left'>";
if($answer_time>0){
echo thai_date_4($answer_time);
}
echo "</td>";
echo "</Tr>";

$M++;
$N++;  //*เกี่ยวข้องกับการแยกหน้า
}	
echo "</Table>";
}

?>
	<link rel="stylesheet" href="./jquery/themes/ui-lightness/jquery.ui.all.css">
	<script src="./jquery/jquery-1.5.1.js"></script>
	<script src="./jquery/external/jquery.bgiframe-2.1.2.js"></script>
	<script src="./jquery/ui/jquery.ui.core.js"></script>
	<script src="./jquery/ui/jquery.ui.widget.js"></script>
	<script src="./jquery/ui/jquery.ui.mouse.js"></script>
	<script src="./jquery/ui/jquery.ui.draggable.js"></script>
	<script src="./jquery/ui/jquery.ui.position.js"></script>
	<script src="./jquery/ui/jquery.ui.resizable.js"></script>
	<script src="./jquery/ui/jquery.ui.dialog.js"></script>

	<script>
		/*
		 * jQuery UI Dialog: Load Content via AJAX
		 * http://salman-w.blogspot.com/2013/05/jquery-ui-dialog-examples.html
		 */
		$(function() {
			$("#dialog").dialog({
			height: 400,
			width: 320,
			minHeight: 400,
			minWidth: 320,
			autoOpen: false,
			show: "blind",
				close : function(){
                  location.reload();
              },
			hide: "explode",
				modal: true,
				resizable: false,
				buttons: {
					"Close": function() {
						$(this).dialog("close");						
					}
				}
			});
			$(".dialogify").click(function(e) {
				e.preventDefault();
				$("#dialog").html("");
				$("#dialog").dialog("option", "title", "Loading...").dialog("open");
				$("#dialog").load(this.href, function() {
					$(this).dialog("option", "title", "รับจดหมาย");
					//$(this).dialog("option", "title", $(this).find("h1").text());
					//$(this).find("h1").remove();
				});
			});
		});	
	</script>
	<div id="dialog"></div>
<script>
function goto_display(val){
	if(val==1){
		callfrm("?option=mail&task=main/receive_mobile&index=8&switch_index=1"); 
		}
}
</script>

