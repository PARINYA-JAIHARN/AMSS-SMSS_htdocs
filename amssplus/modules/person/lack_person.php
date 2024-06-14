<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
if($_SESSION['login_status']>4){
exit();
}

//ปีการศึกษา
$sql = "select * from  student_main_edyear  where year_active='1' order by  ed_year desc limit 1";
$dbquery = mysqli_query($connect,$sql);
$year_active_result = mysqli_fetch_array($dbquery);
if($year_active_result['ed_year']==""){
echo "<br />";
echo "<div align='center'>ยังไม่ได้กำหนดทำงานในปีการศึกษาใด ๆ  การรายงานนี้เกี่ยวข้องกับจำนวนนักเรียน ต้องไปดำเนินการในส่วนข้อมูลนักเรียนก่อน</div>";
exit();
}

//ส่วนหัว
echo "<br />";
echo "<table width='50%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>อัตรากำลังข้าราชการครูตามเกณฑ์</strong></font></td></tr>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>ปีการศึกษา $year_active_result[ed_year]</strong></font></td></tr>";
echo "</table>";
echo "<br>";

$sql = "select * from system_school left join student_main_num on system_school.school_code=student_main_num.school_code  left join  system_school_detail on system_school.school_code= system_school_detail.school_code where system_school.school_type='1' and student_main_num.ed_year='$year_active_result[ed_year]' order by system_school.school_code";
$dbquery = mysqli_query($connect,$sql);
$N=1;
$sum_pre_primary_std=0;
$sum_primary_std=0;
$sum_secondary_std=0;
$total_std=0;

$x1=0; //จำนวนนักเรียน
$x2=0; //ผู้อำนวยการที่มี
$x3=0;
$x4=0;
$x5=0;
$y1=0; // จำนวนขาด ผู้อำนวยการ
$y2=0;
$y3=0;
$y4=0;
$y5=0;
$total_normal_number=0;
echo  "<table width='90%' border='1' align='center' style='border-collapse: collapse'>";
echo "<Tr bgcolor='#E6E6E6' align='center'><Td width='50' rowspan='2'>ที่</Td> <Td rowspan='2'>รหัสโรงเรียน</Td><Td rowspan='2'>ชื่อโรงเรียน</Td><Td rowspan='2'>จำนวนนักเรียน</Td><Td colspan='4'>จำนวนที่มี</Td><Td colspan='5'>จำนวนที่ขาด/เกิน ตามเกณฑ์</Td></Tr>";
echo "<Tr bgcolor='#E6E6E6' align='center'><Td width='80'>ผู้อำนวยการ</Td><Td width='80'>รองผู้อำนวยการ</Td><Td width='80'>ครู/ครูผู้ช่วย</Td><Td width='80'>รวม</Td><Td width='80'>ผู้อำนวยการ</Td><Td width='80'>รองผู้อำนวยการ</Td><Td width='80'>ครู/ครูผู้ช่วย</Td><Td width='80'>รวม</Td><Td width='80'>ร้อยละ<br>การขาด</Td></Tr>";
		While ($result = mysqli_fetch_array($dbquery))
			{
				$id = $result['id'];
				$school_code= $result['school_code'];
				$school_name= $result['school_name'];
				$pre_primary_std= $result['pre_primary_std'];
				$primary_std= $result['primary_std'];
				$secondary_std= $result['secondary_std'];
				$student= $result['student'];
				$edschool_type= $result['edschool_type'];
				
				$c1= $result['c1'];
				$c2= $result['c2'];
				$c3= $result['c3'];
				$c4= $result['c4'];
				$c5= $result['c5'];
				$c6= $result['c6'];
				$c7= $result['c7'];
				$c8= $result['c8'];
				$c9= $result['c9'];
				$c10= $result['c10'];
				$c11= $result['c11'];
				$c12= $result['c12'];
				$c13= $result['c13'];
				$c14= $result['c14'];
				$c15= $result['c15'];
				
				$sum_pre_primary_std=$sum_pre_primary_std+$pre_primary_std;
				$sum_primary_std=$sum_primary_std+$primary_std;
				$sum_secondary_std=$sum_secondary_std+$secondary_std;
				$total_std=$total_std+$student;
				$x1=$x1+$student;
				
				if($student>120){
				$case=2;
				}
				else{
				$case=1;
				}
				
$total_sch_person=0;				
$sql_person2 = "select count(id) as director from person_sch_main where status='0' and school_code='$school_code' and position_code='1'";
$dbquery_person2 = mysqli_query($connect,$sql_person2);
$result2 = mysqli_fetch_array($dbquery_person2);
$director=$result2['director'];
$x2=$x2+$director;

$sql_person3 = "select count(id) as vice_director from person_sch_main where status='0' and school_code='$school_code' and position_code='2' ";
$dbquery_person3 = mysqli_query($connect,$sql_person3);
$result3 = mysqli_fetch_array($dbquery_person3);
$vice_director=$result3['vice_director'];
$x3=$x3+$vice_director;

$sql_person4 = "select count(id) as teacher from person_sch_main where status='0' and school_code='$school_code' and (position_code='3' or position_code='4') ";
$dbquery_person4 = mysqli_query($connect,$sql_person4);
$result4 = mysqli_fetch_array($dbquery_person4);
$teacher=$result4['teacher'];
$x4=$x4+$teacher;	
			
$total_sch_person=$director+$vice_director+$teacher;
$x5=$x5+$total_sch_person;

$director_lack=0;
$normal_vice_director=0;
$vice_director_lack=0;
$teacher_lack=0;
$sch_totoal_lack=0;

if($case==1 and $student>0){   
		$director_lack=$director-1;
		if($student<=20){
		$teacher_lack=$teacher-1;
		$totoal_teacher=1;
		}
		else if($student>=21 and $student<=40){
		$teacher_lack=$teacher-2;
		$totoal_teacher=2;
		}
		else if($student>=41 and $student<=60){
		$teacher_lack=$teacher-3;
		$totoal_teacher=3;
		}
		else if($student>=61 and $student<=80){
		$teacher_lack=$teacher-4;
		$totoal_teacher=4;
		}
		else if($student>=81 and $student<=100){
		$teacher_lack=$teacher-5;
		$totoal_teacher=5;
		}
		else if($student>=101 and $student<=120){
		$teacher_lack=$teacher-6;
		$totoal_teacher=6;
		}
}

$room1=0;
$room2=0;
$room3=0;
if($case==2 and $student>0){
		$director_lack=$director-1;
		if($student<360){
		$vice_director_lack=$vice_director;
		}
		
		if($student>=360 and $student<=719){
		$vice_director_lack=$vice_director-1;
		$normal_vice_director=1;
		}
		else if($student>=720 and $student<=1079){
		$vice_director_lack=$vice_director-2;
		$normal_vice_director=2;
		}
		else if($student>=1080 and $student<=1679){
		$vice_director_lack=$vice_director-3;
		$normal_vice_director=3;
		}
		else if($student>=1680){
		$vice_director_lack=$vice_director-4;
		$normal_vice_director=4;
		}
		
		//จำนวนห้องก่อนประถม
		$room1=0;
		for($x = 1; $x <= 3; $x++){
		$room[$x]=0;
					if($x==1){
					$std=$c1;
					}
					else if($x==2){
					$std=$c2;			
					}
					else if($x==3){
					$std=$c3;
					}
		$room[$x]=$std/30;
		$room[$x]=floor($room[$x]);
		$y=$std%30;  
					if($y>=10){
					$room[$x]=$room[$x]+1;
					}
					if($std>0){
							if($room[$x]==0){
							$room[$x]=1;
							}
					}
		$room1=$room1+	$room[$x];		
		}
		
		
		//จำนวนห้องประถม
		$room2=0;
		for($x = 4; $x <= 9; $x++){
		$room[$x]=0;
					if($x==4){
					$std=$c4;
					}
					else if($x==5){
					$std=$c5;			
					}
					else if($x==6){
					$std=$c6;
					}
					else if($x==7){
					$std=$c7;
					}
					else if($x==8){
					$std=$c8;
					}
					else if($x==9){
					$std=$c9;
					}
					
		$room[$x]=$std/40;
		$room[$x]=floor($room[$x]);
		$y=$std%40;  
					if($y>=10){
					$room[$x]=$room[$x]+1;
					}
					if($std>0){
							if($room[$x]==0){
							$room[$x]=1;
							}
					}
		$room2=$room2+	$room[$x];		
		}
		
		//มัธยม
		$room3=0;
		for($x = 10; $x <= 15; $x++){
		$room[$x]=0;
					if($x==10){
					$std=$c10;
					}
					else if($x==11){
					$std=$c11;			
					}
					else if($x==12){
					$std=$c12;
					}
					else if($x==13){
					$std=$c13;
					}
					else if($x==14){
					$std=$c14;
					}
					else if($x==15){
					$std=$c15;
					}
					
		$room[$x]=$std/40;
		$room[$x]=floor($room[$x]);
		$y=$std%40;  
					if($y>=10){
					$room[$x]=$room[$x]+1;
					}
					if($std>0){
							if($room[$x]==0){
							$room[$x]=1;
							}
					}
		$room3=$room3+	$room[$x];		
		}
		
		//จำนวยครู
		$teacher1=(($room1*30/25)+($pre_primary_std/25))/2; 
		$teacher2=(($room2*40/25)+($primary_std/25))/2; 
		$teacher3=$room3*40/20;
		$totoal_teacher=$teacher1+$teacher2+$teacher3;
		$totoal_teacher=round($totoal_teacher);
		$teacher_lack=$teacher-$totoal_teacher;
}
$sch_totoal_lack=$director_lack+$vice_director_lack+$teacher_lack;

$normal_number=1+$normal_vice_director+$totoal_teacher;
$percent=$sch_totoal_lack/$normal_number*100;
$percent=round($percent,2);		
echo "<tr align='center'><td>$N</td><td>$school_code</td><td align='left'>$school_name</td><td>$student</td>";
echo "<td>";
		if($director>0){
		echo $director;
		}
echo "</td><td>";
		if($vice_director>0){
		echo $vice_director;
		}
echo "</td><td>";
		if($teacher>0){
		echo $teacher;
		}
echo "</td><td>";
		if($total_sch_person>0){
		echo $total_sch_person;
		}
echo "</td>";
echo "<td>";
if($director_lack!=0){
echo $director_lack;
}
echo "</td>";
echo "<td>";
if($vice_director_lack!=0){
echo $vice_director_lack;
}
echo "</td>";
echo "<td>";
if($teacher_lack!=0){
echo $teacher_lack;
}
echo "</td>";
echo "<td>";
if($sch_totoal_lack!=0){
echo $sch_totoal_lack;
}
echo "</td>";
echo "<td>";
if($percent!=0){
echo $percent;
}
echo "</td>";
echo "</tr>";			

$y1=$y1+$director_lack;
$y2=$y2+$vice_director_lack;
$y3=$y3+$teacher_lack;
$y4=$y4+$sch_totoal_lack;

$total_normal_number=$total_normal_number+$normal_number;
$y5=$y4/$total_normal_number*100;
$y5=round($y5,2);

$N++;	
}
echo "<tr align='center' bgcolor='#E6E6E6'><td colspan='3'>รวม</td><td>$x1</td><td>$x2</td><td>$x3</td><td>$x4</td><td>$x5</td><td>$y1</td><td>$y2</td><td>$y3</td><td>$y4</td><td>$y5</td></tr>";
echo "<tr align='left'><td colspan='13'><b>หมายเหตุ</b> รายงานี้แสดงเฉพาะเจ้าหน้าที่ในสำนักงานเขตพื้นที่การศึกษาเท่านั้น</td></tr>";

echo "</Table>";
?>

