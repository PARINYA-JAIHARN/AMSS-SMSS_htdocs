<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
date_default_timezone_set('Asia/Bangkok');
$alert=0;
$system_alert_num=0;
$alert_content="";
$system_alert_ar = array();

//หาผู้อำนวยการสพท.
$sql = "select * from person_main where position_code='1' and status='0' order by id desc limit 1";
$dbquery = mysqli_query($connect,$sql);
$boss='';
if($dbquery){ 
$result = mysqli_fetch_array($dbquery);
$boss=$result['person_id'];
}

//หาผู้รักษาราชการแทน
$today=date("Y-m-d");
$sql = "select * from delegate_main where person_id='$_SESSION[login_user_id]' and start<='$today' and finish>='$today' ";
$dbquery = mysqli_query($connect,$sql);
$delegate=0;
if($dbquery){
$num_rows = mysqli_num_rows($dbquery);
	if($num_rows>=1){
	$delegate=1;
	}
}

//เวลาของการเตือนภายใน 15 วัน
$now=time();
$time_ago=$now-1296000;
$alert_dayago=date("Y-m-d H:i:s",$time_ago);

////////////////////////////////////////////////////////////
//เตือนขออนุญาตไปราชการรอความเห็นชอบ
$sql_permission_alert = "select permission_main.id from permission_main left join permission_person_set on  permission_main.person_id=permission_person_set.person_id where (permission_person_set.comment_person ='$_SESSION[login_user_id]') and (permission_main.grant_x is null) and (permission_main.comment_person is null) and permission_main.rec_date>'$alert_dayago'";
$dbquery_permission_alert = mysqli_query($connect,$sql_permission_alert);
if($dbquery_permission_alert){
		$permission_alert_num=mysqli_num_rows($dbquery_permission_alert);	
		if($permission_alert_num>=1){
		$alert=1;
		$system_alert_num=$system_alert_num+1;
		$alert_content="<a href='?option=permission&task=main/basic_comment'>มีผู้ขออนุญาตไปราชการรอความเห็นชอบ</a>";
		$system_alert_ar[$system_alert_num]=$alert_content;
		}
}

//เตือนขออนุญาตไปราชการรอความเห็นชอบส่วนของโรงเรียน
if(($_SESSION['login_status']>=12) and ($_SESSION['login_status']<=14)){
			//หาว่ามีผู้รักษาราชการแทนหรือไม่
			$today=date("Y-m-d");
			$self_delegate='';
			$sql = "select * from person_delegate where person_id='$_SESSION[login_user_id]' and start<='$today' and finish>='$today'  and  school_code='$_SESSION[user_school]' order by id desc limit 1 ";
			$dbquery = mysqli_query($connect,$sql);
			if($dbquery){ 
			$num_rows = mysqli_num_rows($dbquery);
						if($num_rows>=1){
						$self_delegate=1;  //userเป็นผู้รักษาราชการแทน
						}
			}
if(($_SESSION['login_status']==12 or $self_delegate==1)){
		$sql_permission_alert =  "select permission_main.id from permission_main left join person_sch_main on permission_main.person_id=person_sch_main.person_id where person_sch_main.school_code='$_SESSION[user_school]' and permission_main.no_comment='0' and (permission_main.comment_person is null) and permission_main.rec_date>'$alert_dayago'";
		$dbquery_permission_alert = mysqli_query($connect,$sql_permission_alert);
		if($dbquery_permission_alert){  
				$permission_alert_num=mysqli_num_rows($dbquery_permission_alert);	
				if($permission_alert_num>=1){
				$alert=1;
				$system_alert_num=$system_alert_num+1;
				$alert_content="<a href='?option=permission&task=main/basic_comment_sch'>มีผู้ขออนุญาตไปราชการรอความเห็นชอบ</a>";
				$system_alert_ar[$system_alert_num]=$alert_content;
				}
		}
} //if
} //if

//เตือนอนุญาตไปราชการรออนุมัติ(สำหรับผู้ถูกเลือกให้อนุมัติ)
$now=time();
$time_onedayago=$now-86400;
$onedayago=date("Y-m-d H:i:s",$time_onedayago); // ใช้กับalert ขออนุญาตไปราชการและการลา
//ส่วนของการหาผู้ปฏิบัติราชการแทน
$sql = "select * from permission_permission where p2='1' and person_id='$_SESSION[login_user_id]'";
$dbquery = mysqli_query($connect,$sql);
$right=0;
if($dbquery){
$num_rows = mysqli_num_rows($dbquery);
		if($num_rows>=1){
		$right=1;
		}
}
if($delegate==1){
			$sql_permission_alert2 ="select permission_main.id from permission_main left join permission_person_set on  permission_main.person_id=permission_person_set.person_id where (permission_main.grant_person_selected ='$_SESSION[login_user_id]' or permission_person_set.grant_person ='$_SESSION[login_user_id]' or permission_main.grant_person_selected ='$boss' or permission_person_set.grant_person ='$boss') and (permission_main.rec_date<'$onedayago' or permission_person_set.comment_person is null or permission_person_set.comment_person='' or permission_main.no_comment='1' or permission_main.comment_person is not null) and (permission_main.comment_need='0' or permission_main.comment_person is not null) and (permission_main.grant_person is null) and permission_main.rec_date>'$alert_dayago'";
			$dbquery_permission_alert2 = mysqli_query($connect,$sql_permission_alert2);
			if($dbquery_permission_alert2){
					$permission_alert2_num=mysqli_num_rows($dbquery_permission_alert2);	
					if($permission_alert2_num>=1){
					$alert=1;
					$system_alert_num=$system_alert_num+1;
					$alert_content="<a href='?option=permission&task=main/grant'>มีผู้ขออนุญาตไปราชการรอการอนุมัติ</a>";
					$system_alert_ar[$system_alert_num]=$alert_content;
					}
			}
}
else if($right==1){
			$sql_permission_alert2 ="select permission_main.id from permission_main,person_sch_main where permission_main.person_id=person_sch_main.person_id and (permission_main.comment_need='0' or permission_main.comment_person is not null) and (permission_main.grant_person is null) and permission_main.rec_date>'$alert_dayago'";
			$dbquery_permission_alert2 = mysqli_query($connect,$sql_permission_alert2);
			if($dbquery_permission_alert2){
					$permission_alert2_num=mysqli_num_rows($dbquery_permission_alert2);	
					if($permission_alert2_num>=1){
					$alert=1;
					$system_alert_num=$system_alert_num+1;
					$alert_content="<a href='?option=permission&task=main/grant2'>มีผู้ขออนุญาตไปราชการส่วนโรงเรียนรอการอนุมัติ</a>";
					$system_alert_ar[$system_alert_num]=$alert_content;
					}
			}
}
else{
			$sql_permission_alert2 ="select permission_main.id from permission_main left join permission_person_set on  permission_main.person_id=permission_person_set.person_id where (permission_main.grant_person_selected ='$_SESSION[login_user_id]' or permission_person_set.grant_person ='$_SESSION[login_user_id]') and (permission_main.rec_date<'$onedayago' or permission_person_set.comment_person is null or permission_person_set.comment_person='' or permission_main.no_comment='1' or permission_main.comment_person is not null) and (permission_main.comment_need='0' or permission_main.comment_person is not null) and (permission_main.grant_person is null) and permission_main.rec_date>'$alert_dayago'";
			$dbquery_permission_alert2 = mysqli_query($connect,$sql_permission_alert2);
			if($dbquery_permission_alert2){
					$permission_alert2_num=mysqli_num_rows($dbquery_permission_alert2);	
					if($permission_alert2_num>=1){
					$alert=1;
					$system_alert_num=$system_alert_num+1;
					$alert_content="<a href='?option=permission&task=main/grant'>มีผู้ขออนุญาตไปราชการรอการอนุมัติ</a>";
					$system_alert_ar[$system_alert_num]=$alert_content;
					}
			}
}
////////////////////////////////////////////////////////////
//เตือนลาของผู้เห็นชอบ
$sql_la_alert = "select la_main.id from la_main left join la_person_set on  la_main.person_id=la_person_set.person_id where (la_person_set.comment_person ='$_SESSION[login_user_id]') and (la_main.group_sign is null) and (la_main.commander_sign is null) and la_main.rec_date>'$alert_dayago'";

$dbquery_la_alert = mysqli_query($connect,$sql_la_alert );
if($dbquery_la_alert){
		$la_alert_num=mysqli_num_rows($dbquery_la_alert);	
		if($la_alert_num>=1){
		$alert=1;
		$system_alert_num=$system_alert_num+1;
		$alert_content="<a href='?option=la&task=main/basic_comment'>มีผู้ขออนุญาตลารอความเห็นชอบ</a>";
		$system_alert_ar[$system_alert_num]=$alert_content;
		}
}

//เตือนการลารอการอนุมัติ
$now=time();
$time_onedayago=$now-86400;
$onedayago=date("Y-m-d H:i:s",$time_onedayago);
//ส่วนของการหาผู้ปฏิบัติราชการแทน
$sql = "select * from la_permission where p2='1' and person_id='$_SESSION[login_user_id]'";
$dbquery = mysqli_query($connect,$sql);
$right=0;
if($dbquery){
$num_rows = mysqli_num_rows($dbquery);
		if($num_rows>=1){
		$right=1;
		}
}

if($delegate==1){
$sql_la_alert2 = "select la_main.id, la_main.person_id, la_main.rec_date, la_main.la_type, la_main.la_start, la_main.la_finish, la_main.la_total, la_main.document, la_main.group_sign,la_main.commander_grant,la_main.commander_comment,la_main.commander_sign,la_main.grant_date from la_main left join la_person_set on  la_main.person_id=la_person_set.person_id where (la_main.grant_p_selected ='$_SESSION[login_user_id]' or la_person_set.grant_person ='$_SESSION[login_user_id]' or la_main.grant_p_selected ='$boss' or la_person_set.grant_person ='$boss') and (la_main.rec_date<'$onedayago' or la_person_set.comment_person is null or la_person_set.comment_person='' or la_main.no_comment='1' or la_main.group_sign is not null) and (la_main.commander_sign is null) and la_main.rec_date>'$alert_dayago'";
}
else{
$sql_la_alert2= "select la_main.id, la_main.person_id, la_main.rec_date, la_main.la_type, la_main.la_start, la_main.la_finish, la_main.la_total, la_main.document, la_main.group_sign,la_main.commander_grant,la_main.commander_comment,la_main.commander_sign,la_main.grant_date from la_main left join la_person_set on  la_main.person_id=la_person_set.person_id where (la_main.grant_p_selected ='$_SESSION[login_user_id]' or la_person_set.grant_person ='$_SESSION[login_user_id]') and (la_main.rec_date<'$onedayago' or la_person_set.comment_person is null or la_person_set.comment_person='' or la_main.no_comment='1' or la_main.group_sign is not null) and (la_main.commander_sign is null) and la_main.rec_date>'$alert_dayago'";
}
$dbquery_la_alert2 = mysqli_query($connect,$sql_la_alert2);
		if($dbquery_la_alert2){
				$la_alert2_num=mysqli_num_rows($dbquery_la_alert2);	
				if($la_alert2_num>=1){
				$alert=1;
				$system_alert_num=$system_alert_num+1;
				$alert_content="<a href='?option=la&task=main/grant'>มีผู้ขออนุญาตลารอการอนุมัติ</a>";
				$system_alert_ar[$system_alert_num]=$alert_content;
				}
		}
		
//ลา อนุมัติในส่วนโรงเรียน		
if($right==1){  
$sql_la_alert3 = "select la_main.id, la_main.person_id, la_main.rec_date, la_main.la_type, la_main.la_start, la_main.la_finish, la_main.la_total, la_main.document,  la_main.grant_p_selected, la_main.group_sign,la_main.commander_grant,la_main.commander_comment,la_main.commander_sign,la_main.grant_date from la_main,person_sch_main where la_main.person_id=person_sch_main.person_id and (la_main.commander_sign is null) and la_main.rec_date>'$alert_dayago'";
$dbquery_la_alert3 = mysqli_query($connect,$sql_la_alert3);
		if($dbquery_la_alert3){
				$la_alert3_num=mysqli_num_rows($dbquery_la_alert3);	
				if($la_alert3_num>=1){
				$alert=1;
				$system_alert_num=$system_alert_num+1;
				$alert_content="<a href='?option=la&task=main/grant2'>มีผู้ขออนุญาตลาในส่วนโรงเรียนรอการอนุมัติ</a>";
				$system_alert_ar[$system_alert_num]=$alert_content;
				}
		}
}
		
//เตือนขอยกเลิกวันลาของผู้เห็นชอบ
$sql_la_alert4 = "select la_cancel.id from la_cancel left join la_person_set on  la_cancel.person_id=la_person_set.person_id where (la_person_set.comment_person ='$_SESSION[login_user_id]') and (la_cancel.group_sign is null) and (la_cancel.commander_sign is null) and la_cancel.rec_date>'$alert_dayago'";
$dbquery_la_alert4 = mysqli_query($connect,$sql_la_alert4 );
if($dbquery_la_alert4){
		$la_alert4_num=mysqli_num_rows($dbquery_la_alert4);	
		if($la_alert4_num>=1){
		$alert=1;
		$system_alert_num=$system_alert_num+1;
		$alert_content="<a href='?option=la&task=main/cancel_basic_comment'>มีผู้ขออนุญาตยกเลิกวันลารอความเห็นชอบ</a>";
		$system_alert_ar[$system_alert_num]=$alert_content;
		}
}

//เตือนยกเลิกวันลารอการอนุมัติ
if($delegate==1){
$sql_la_alert5 = "select la_cancel.id, la_cancel.person_id, la_cancel.rec_date, la_cancel.la_type, la_cancel.cancel_la_start, la_cancel.cancel_la_finish, la_cancel.cancel_la_total, la_cancel.grant_p_selected, la_cancel.group_sign,la_cancel.commander_grant,la_cancel.commander_comment,la_cancel.commander_sign,la_cancel.grant_date from la_cancel left join la_person_set on  la_cancel.person_id=la_person_set.person_id where (la_cancel.grant_p_selected ='$_SESSION[login_user_id]' or la_person_set.grant_person ='$_SESSION[login_user_id]' or la_cancel.grant_p_selected ='$boss' or la_person_set.grant_person ='$boss') and (la_cancel.rec_date<'$onedayago' or la_person_set.comment_person is null or la_person_set.comment_person='' or la_cancel.no_comment='1' or la_cancel.group_sign is not null) and (la_cancel.commander_sign is null) and la_cancel.rec_date>'$alert_dayago'";
}
else if($right==1){
$sql_la_alert5 = "select la_cancel.id, la_cancel.person_id, la_cancel.rec_date, la_cancel.la_type, la_cancel.cancel_la_start, la_cancel.cancel_la_finish, la_cancel.cancel_la_total, la_cancel.grant_p_selected, la_cancel.group_sign,la_cancel.commander_grant,la_cancel.commander_comment,la_cancel.commander_sign,la_cancel.grant_date from la_cancel,person_sch_main where la_cancel.person_id=person_sch_main.person_id and (la_cancel.commander_sign is null) and la_cancel.rec_date>'$alert_dayago'";
}
else{
$sql_la_alert5 = "select la_cancel.id, la_cancel.person_id, la_cancel.rec_date, la_cancel.la_type, la_cancel.cancel_la_start, la_cancel.cancel_la_finish, la_cancel.cancel_la_total, la_cancel.grant_p_selected, la_cancel.group_sign,la_cancel.commander_grant,la_cancel.commander_comment,la_cancel.commander_sign,la_cancel.grant_date from la_cancel left join la_person_set on  la_cancel.person_id=la_person_set.person_id where (la_cancel.grant_p_selected ='$_SESSION[login_user_id]' or la_person_set.grant_person ='$_SESSION[login_user_id]') and (la_cancel.rec_date<'$onedayago' or la_person_set.comment_person is null or la_person_set.comment_person='' or la_cancel.no_comment='1' or la_cancel.group_sign is not null) and (la_cancel.commander_sign is null) and la_cancel.rec_date>'$alert_dayago'";
}
$dbquery_la_alert5 = mysqli_query($connect,$sql_la_alert5);
if($dbquery_la_alert5){
		$la_alert5_num=mysqli_num_rows($dbquery_la_alert5);	
		if($la_alert5_num>=1){
		$alert=1;
		$system_alert_num=$system_alert_num+1;
		$alert_content="<a href='?option=la&task=main/cancel_grant'>มีผู้ขออนุญาตยกเลิกวันลารอการอนุมัติ</a>";
		$system_alert_ar[$system_alert_num]=$alert_content;
		}
}

////////////////////////////////////////////////////////////
//เตือนmail
$sql_mail_alert = "select  mail_main.ms_id from mail_main left join mail_sendto_answer on mail_main.ref_id=mail_sendto_answer.ref_id where mail_sendto_answer.send_to='$_SESSION[login_user_id]' and mail_sendto_answer.answer<'1' and mail_main.send_date>'$alert_dayago'";
$dbquery_mail_alert = mysqli_query($connect,$sql_mail_alert );
if($dbquery_mail_alert){
		$mail_num=mysqli_num_rows($dbquery_mail_alert);	
		if($mail_num>=1){
		$alert=1;
		$system_alert_num=$system_alert_num+1;
				if($_SESSION['user_os']=='mobile'){
				$alert_content="<a href='?option=mail&task=main/receive_mobile'>มีจดหมายยังไม่ได้รับ</a>";
				}
				else{
				$alert_content="<a href='?option=mail&task=main/receive'>มีจดหมายยังไม่ได้รับ</a>";
				}
		$system_alert_ar[$system_alert_num]=$alert_content;
		}
}

/////////////////////////////////////
//เตือนเจ้าหน้าที่ยานพาหนะ
$sql_car_alert1 = "select  id  from car_main where officer_sign is null  and group_sign is null  and  commander_sign is null";
$dbquery_car_alert1 = mysqli_query($connect,$sql_car_alert1);
if($dbquery_car_alert1){
		$num_car1=mysqli_num_rows($dbquery_car_alert1);
		if($num_car1>=1){
				$sql_car_permission1="select id from car_permission where p1='1'  and person_id='$_SESSION[login_user_id]' ";
				$dbquery_car_permission1=mysqli_query($connect,$sql_car_permission1);
				$car_permission_num1=mysqli_num_rows($dbquery_car_permission1);	
						if($car_permission_num1>=1){
						$alert=1;
						$system_alert_num=$system_alert_num+1;
						$alert_content="<a href='?option=car&task=main/car_officer'>มีผู้ขออนุญาตใช้รถราชการรอเจ้าหน้าที่</a>";
						$system_alert_ar[$system_alert_num]=$alert_content;
						}
			}			
}

//เตือนลงความเห็นยานพาหนะ
$sql_car_alert2 = "select  id  from car_main where officer_sign is not null  and group_sign is null  and  commander_sign is null";
$dbquery_car_alert2 = mysqli_query($connect,$sql_car_alert2);
if($dbquery_car_alert2){
		$num_car2=mysqli_num_rows($dbquery_car_alert2);
		if($num_car2>=1){
				$sql_car_permission2="select id from car_permission where p1='2'  and person_id='$_SESSION[login_user_id]' ";
				$dbquery_car_permission2=mysqli_query($connect,$sql_car_permission2);
				$car_permission_num2=mysqli_num_rows($dbquery_car_permission2);	
						if($car_permission_num2>=1){
						$alert=1;
						$system_alert_num=$system_alert_num+1;
						$alert_content="<a href='?option=car&task=main/car_group'>มีผู้ขออนุญาตใช้รถราชการรอความเห็นชอบ</a>";
						$system_alert_ar[$system_alert_num]=$alert_content;
						}
			}			
}

//เตือนอนุมัติยานพาหนะ
$sql_car_alert3 = "select  id from car_main where officer_sign is not null and  commander_sign is null";
$dbquery_car_alert3 = mysqli_query($connect,$sql_car_alert3);
if($dbquery_car_alert3){
		$num_car3=mysqli_num_rows($dbquery_car_alert3);
		if($num_car3>=1){
				$sql_car_permission3="select id from car_permission where p1='3'  and person_id='$_SESSION[login_user_id]' ";
				$dbquery_car_permission3=mysqli_query($connect,$sql_car_permission3);
				$car_permission_num3=mysqli_num_rows($dbquery_car_permission3);	
						if($car_permission_num3>=1){
						$alert=1;
						$system_alert_num=$system_alert_num+1;
						$alert_content="<a href='?option=car&task=main/car_commander'>มีผู้ขออนุญาตใช้รถราชการรออนุมัติ</a>";
						$system_alert_ar[$system_alert_num]=$alert_content;
						}
			}			
}

///////////////////////////////////////////
//เตือนระบบส่งหนังสือราชการ
if($_SESSION['login_status']<=5){
$sql_book_alert = "select id from book_sendto_answer left join book_main on book_sendto_answer.ref_id=book_main.ref_id where book_sendto_answer.send_to='$_SESSION[login_user_id]' and book_sendto_answer.answer is null and book_main.send_date>'$alert_dayago' ";
	$book_index="saraban_index=3";
$dbquery_book_alert = mysqli_query($connect,$sql_book_alert );
}
else if(($_SESSION['login_status']>10) and ($_SESSION['login_status']<=15)){
$sql_book_alert = "select id from book_sendto_answer left join book_main on book_sendto_answer.ref_id=book_main.ref_id where  book_sendto_answer.send_to='$_SESSION[login_user_id]' and book_sendto_answer.school='$_SESSION[user_school]' and book_sendto_answer.answer is null and book_main.send_date>'$alert_dayago'";
$dbquery_book_alert = mysqli_query($connect,$sql_book_alert );
	$book_index="saraban_index=12";
}
else{
$dbquery_book_alert=0;
}
if($dbquery_book_alert){
		$book_num=mysqli_num_rows($dbquery_book_alert);	
		if($book_num>=1){
		$alert=1;
		$system_alert_num=$system_alert_num+1;
				if($_SESSION['user_os']=='mobile'){
				$alert_content="<a href='?option=book&task=main/receive_mobile&$book_index'>มีหนังสือราชการยังไม่ได้รับ</a>";
				}
				else{
				$alert_content="<a href='?option=book&task=main/receive&$book_index'>มีหนังสือราชการยังไม่ได้รับ</a>";
				}
		$system_alert_ar[$system_alert_num]=$alert_content;
		}
}

?>