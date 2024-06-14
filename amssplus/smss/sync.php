<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

if(isset($_GET['get_office'])){	

$sql = "select * from  system_module where  module='$_GET[module]' and module_active='1' and where_work!='1' ";
$dbquery = mysqli_query($connect,$sql);
$result = mysqli_fetch_array($dbquery);
		if($result ){
		}else{
		echo "<br />";
		echo "<div align='center'>AMSS++(ระบบสนับสนุนการบริหารจัดการสำนักงานเขตพื้นที่การศึกษา) ยังไม่เปิดการใช้งานในระบบงานนี้</div>";
		exit();
		}

$remote_sync=$_GET['sync'];   
$remote_ip=base64_decode($_GET['get_serv']);   
$person=base64_decode($_GET['get_person']);  
$position_code=$_GET['position_code'];  
$time2=base64_decode($_GET['get_time']);   

$pieces = explode(".", $remote_ip);
$sum_pieces=1;
		foreach($pieces as $key => $val) {
				$sum_pieces=$sum_pieces+$val;     
		 }
$time=$time2/$sum_pieces;
$time=$time+30;
$time_now=time();  $time_now=$time_now;
		 if($time_now>$time){
		 echo "<br><div align='center'>คุณไม่มีสิทธิ์</div>";
		 exit();
		 }
		 
					$sql = "select * from  system_sync_smss_2 where  office_code='$_GET[get_office]'";
					$dbquery = mysqli_query($connect,$sql);
					$result = mysqli_fetch_array($dbquery);
					if($result){
					$sync_code=$result['sync_code'];
					
								if($sync_code==$remote_sync){
								$remote_user_office=$_GET['get_office'];
								}
								else{
								echo "<br><div align='center'>รหัสเชื่อมระบบไม่ถูกต้อง โปรดแจ้งผู้ดูและระบบ</div>";
								exit();
								}
								if($remote_ip!=$result['remote_ip']){
								echo "<br><div align='center'>เลขเครื่องคอมพิวเตอร์แม่ข่ายไม่ตรงกับที่ลงทะเบียนไว้ โปรดแจ้งผู้ดูและระบบ</div>";
								exit();
								}
					}
					else{   
						echo "<br><div align='center'>ยังไม่ได้เชื่อมระบบกับ AMSS++ กรุณาแจ้งผู้ดูแลระบบ SMSS</div>";
						exit();
					}

//ส่วนบุคลากร
			$rec_date = date("Y-m-d");			
			$prename=base64_decode($_GET['get_prename']); 
			$name=base64_decode($_GET['get_name']);   
			$surname=base64_decode($_GET['get_surname']);   
			$remote_user_id=$person;

			if($_GET['get_status']<5){
			$sql_person = "select id from person_sch_main where school_code='$_GET[get_office]' and person_id='$person'";
			$dbquery_person = mysqli_query($connect,$sql_person);
			$person_num = mysqli_num_rows($dbquery_person);
			if($person_num<1){
			$sql_person2 = "select id from person_sch_other where school_code='$_GET[get_office]' and person_id='$person'";
			$dbquery_person2 = mysqli_query($connect,$sql_person2);
			$person_num = mysqli_num_rows($dbquery_person2);
			}
			
						if($person_num<1){
						$sql = "insert into person_sch_main (person_id,prename,name,surname,position_code,school_code,status,rec_date) values ( '$person','$prename','$name','$surname','$position_code','$_GET[get_office]','9','$rec_date')";
						$result_insert = mysqli_query($connect,$sql);
								if(!($result_insert)){
								echo "<br><div align='center'>อาจมีรายชื่อเป็นบุคลากรในโรงเรียนอื่น กรุณาตรวจสอบกับ สพท.</div>";
								exit();
								}
						}
			}
			else if($_GET['get_status']==6){
			//ปีการศึกษา
			$sql = "select * from  student_main_edyear  where year_active='1' order by  ed_year desc limit 1";
			$dbquery = mysqli_query($connect,$sql);
			$year_active_result = mysqli_fetch_array($dbquery);
			$ed_year=$year_active_result['ed_year'];

			$sql_person = "select * from student_main_main where school_code='$_GET[get_office]' and person_id='$person' and ed_year='$ed_year'";
			$dbquery_person = mysqli_query($connect,$sql_person);
			$person_num1 = mysqli_num_rows($dbquery_person);
			
						if($person_num1<1){
										//ตรวจสอบรายชื่อกับทุกโรงเรียน
										$sql_person = "select * from student_main_main where  person_id='$person' and ed_year='$ed_year'";
										$dbquery_person = mysqli_query($connect,$sql_person);
										$person_num2= mysqli_num_rows($dbquery_person);
										if($person_num2>=1){
										echo "<br><div align='center'>มีรายชื่อเป็นนักเรียนโรงเรียนอื่น แจ้งคุณครูตรวจสอบกับ สพท.</div>";
										exit();
										}
						
						$sql = "select * from system_school where school_code='$_GET[get_office]' ";
						$dbquery = mysqli_query($connect,$sql);
						$result = mysqli_fetch_array($dbquery);
						$school_name=$result['school_name'];
						
									if(isset($_GET['classlevel'])){
									$classlevel=$_GET['classlevel'];
									}
									else{
									$classlevel="";
									}
						
									if(($prename=="เด็กชาย") or ($prename=="นาย")){
									$sex="ช";
									}
									else{
									$sex="ญ";
									} 
									
						$sql = "insert into student_main_main (ed_year,ref_id,student_id,disable,status,officer,school_code,person_id,prename,name,surname,sex,school_name,classlevel,rec_date) values ( '$ed_year','','',0,0,'','$_GET[get_office]','$person','$prename','$name','$surname','$sex','$school_name','$classlevel','$rec_date')"; 
						$result_insert = mysqli_query($connect,$sql);
								if(!($result_insert)){
								echo "<br><div align='center'>เกิดความผิดพลาดในการบันทึกข้อมูลนักเรียน</div>";
								exit();
								}
						}
			}
						
$remote_login_status=$_GET['get_status'];   
}
else{ 
				if(!(isset($_REQUEST['remote_user_office']))){  
				echo "<br />";
				echo "<div align='center'>ขาดการชื่อมต่อระบบ1</div>";
				exit();
				}
				else{
				$remote_user_office=$_REQUEST['remote_user_office'];
				}
				
				if(!(isset($_REQUEST['remote_user_id']))){
				echo "<br />";
				echo "<div align='center'>ขาดการชื่อมต่อระบบ2</div>";
				exit();
				}
				else{
				$remote_user_id=$_REQUEST['remote_user_id'];
				$remote_login_status=$_REQUEST['remote_login_status'];
				}

				$sql = "select * from  system_sync_smss_2 where  office_code='$remote_user_office'";
				$dbquery = mysqli_query($connect,$sql);
				$result = mysqli_fetch_array($dbquery);
				if($result){
				$sync_code=$result['sync_code'];
						if($sync_code==$_REQUEST['remote_sync']){
						$remote_sync=$_REQUEST['remote_sync'];
						}
						else{
						echo "<br><div align='center'>รหัสเชื่อมระบบไม่ถูกต้อง</div>";
						exit();
						}
				}
} 
?>