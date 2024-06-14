<?php
header("Content-type:text/xml; charset=UTF-8");              
header("Cache-Control: no-store, no-cache, must-revalidate");             
header("Cache-Control: post-check=0, pre-check=0", false);   
echo "<?xml version='1.0' encoding='UTF-8'?>";

require_once "../amssplus_connect.php";	

//เวลาของการเตือนภายใน 15 วัน
$now=time();
$time_ago=$now-1296000;
$alert_dayago=date("Y-m-d H:i:s",$time_ago);

$book_alert=0;
if($_GET['book_salaban']==1){
$sql_book_alert = "select id from book_sendto_answer left join book_main on book_sendto_answer.ref_id=book_main.ref_id where book_sendto_answer.send_to='$_GET[remote_school]' and book_sendto_answer.answer is null and book_main.send_date>'$alert_dayago' ";
$dbquery_book_alert = mysqli_query($connect,$sql_book_alert );
		if($dbquery_book_alert){
				$book_num=mysqli_num_rows($dbquery_book_alert);	
				if($book_num>=1){
				$book_alert=1;
				}
		}
}		

$sql_mail_alert = "select  mail_main.ms_id from mail_main left join mail_sendto_answer on mail_main.ref_id=mail_sendto_answer.ref_id where mail_sendto_answer.send_to='$_GET[remote_user]' and mail_sendto_answer.answer<'1' and mail_main.send_date>'$alert_dayago'";
$dbquery_mail_alert = mysqli_query($connect,$sql_mail_alert );
$mail_alert=0;
if($dbquery_mail_alert){
		$mail_num=mysqli_num_rows($dbquery_mail_alert);	
		if($mail_num>=1){
		$mail_alert=1;
		}
}
?>
<info>
	<book_alert><?php echo base64_encode($book_alert);?></book_alert>
	<mail_alert><?php echo base64_encode($mail_alert);?></mail_alert>
</info>

<?php
mysqli_close($connect);
?>