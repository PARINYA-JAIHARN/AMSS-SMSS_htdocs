<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

if($_GET['index']==1){
//////////////////ประกาศตัวแปร////////////////////////////
// อนุบาลชาย
$height1=array();
$weight1_1=array();
$weight1_2=array();
$weight1_3=array();
$weight1_4=array();
$weight1_5=array();
$result=mysqli_query($connect,"SELECT * FROM health_weight_height where type='0' and sex='1' order by height");
while($row=mysqli_fetch_array($result)){		 
$height=$row['height']; 
$weight1=$row['weight_1']; 
$weight2=$row['weight_2']; 
$weight3=$row['weight_3']; 
$weight4=$row['weight_4']; 
$weight5=$row['weight_5']; 
$height1[$height]=$height;
$weight1_1[$height]=$weight1; 
$weight1_2[$height]=$weight2;
$weight1_3[$height]=$weight3;
$weight1_4[$height]=$weight4;
$weight1_5[$height]=$weight5;
}

// อนุบาลหญิง
$height2=array();
$weight2_1=array();
$weight2_2=array();
$weight2_3=array();
$weight2_4=array();
$weight2_5=array();
$result=mysqli_query($connect,"SELECT * FROM health_weight_height where type='0' and sex='2' order by height");
while($row=mysqli_fetch_array($result)){		 
$height=$row['height']; 
$weight1=$row['weight_1']; 
$weight2=$row['weight_2']; 
$weight3=$row['weight_3']; 
$weight4=$row['weight_4']; 
$weight5=$row['weight_5']; 
$height2[$height]=$height;
$weight2_1[$height]=$weight1; 
$weight2_2[$height]=$weight2;
$weight2_3[$height]=$weight3;
$weight2_4[$height]=$weight4;
$weight2_5[$height]=$weight5;
}

// ประถมมัธยมชาย
$height3=array();
$weight3_1=array();
$weight3_2=array();
$weight3_3=array();
$weight3_4=array();
$weight3_5=array();
$result=mysqli_query($connect,"SELECT * FROM health_weight_height where type='1' and sex='1' order by height");
while($row=mysqli_fetch_array($result)){		 
$height=$row['height']; 
$weight1=$row['weight_1']; 
$weight2=$row['weight_2']; 
$weight3=$row['weight_3']; 
$weight4=$row['weight_4']; 
$weight5=$row['weight_5']; 
$height3[$height]=$height;
$weight3_1[$height]=$weight1;
$weight3_2[$height]=$weight2;
$weight3_3[$height]=$weight3;
$weight3_4[$height]=$weight4;
$weight3_5[$height]=$weight5;
}

// ประถมมัธยมหญิง
$height4=array();
$weight4_1=array();
$weight4_2=array();
$weight4_3=array();
$weight4_4=array();
$weight4_5=array();
$result=mysqli_query($connect,"SELECT * FROM health_weight_height where type='1' and sex='2' order by height");
while($row=mysqli_fetch_array($result)){		 
$height=$row['height']; 
$weight1=$row['weight_1']; 
$weight2=$row['weight_2']; 
$weight3=$row['weight_3']; 
$weight4=$row['weight_4']; 
$weight5=$row['weight_5']; 
$height4[$height]=$height;
$weight4_1[$height]=$weight1;
$weight4_2[$height]=$weight2;
$weight4_3[$height]=$weight3;
$weight4_4[$height]=$weight4;
$weight4_5[$height]=$weight5;
}

						$total_checked_student=0;  //จำนวนนักเรียนที่ตรวจ
						$percent_total_checked_student=0;

						 $check_room_sdT = 0;
						 $checkslwT = 0;
						 $total_nocheckT = 0;
						 
						$total_H1=0;
						$total_H2=0;
						$total_H3=0;
						$total_H4=0;
						$total_H5=0;
						$total_H6=0;
						
						$total_good_std=0;  //รวมนักเรียนสุขภาพดีทั้งหมด
						
						 $sum_gum_goodT = 0;
						 $sum_gum_noT = 0;
						 $sum_tooth_goodT = 0;
						 $sum_tooth_noT = 0;
						 $sum_iodine_goodT = 0;
						 $sum_iodine_noT = 0;
						 $sum_percen_goodT = 0;
						 $sum_percen_noT = 0;
						 $tosT = 0;
						 $checkslw2=0; // จำนวนแถว //

						 $sum_percen_good = 0;
						 $sum_percen_no = 0;
						 $tos = 0;
						 
			 			$sum_low = 0;    /* ต่ำ */
						$sum_nor = 0;  /* ปกติ */
						$sum_over = 0;  /* สูง */
						$sum_gum_good = 0;  /* เหงือกดี */
						$sum_gum_no = 0;   /* เหงือกไม่ดี */
						$sum_tooth_good = 0;  /* ฟันดี */
						$sum_tooth_no = 0;   /* ฟันไม่ดี */
						$sum_iodine_good = 0;   /* ไอโอดีนดี */
						$sum_iodine_no = 0;  /* ไอโอดีนไม่ดี */
						$sumtotal = 0;   /* % ดี */
						$sumtotal_no = 0;    /* %ไม่ ดี */
						
						$total_sum_low = 0;
						$sum_low = 0;
						$total_sum_gum_good = 0;
						$sum_gum_good = 0;
						$total_sum_iodine_good = 0;
						$sum_iodine_good = 0;

						$total_sum_gum_no = 0;
						$sum_gum_no = 0;
						$total_sum_iodine_no = 0;
						$sum_iodine_no = 0;
						$total_sum_tooth_good = 0;
						$sum_tooth_good = 0;
						
						$tno_nor = 0;
						$tno_gum = 0;
						$tno_tooth = 0;
						$tno_iodine = 0;
						$sum_percen_no = 0;
						$sum_percen_good = 0;
						$sumtotal = 0;
						$sumtotal_no = 0;
						$total_sum_tooth_no = 0;
						$gum_good = 0;
						$total_sum_nor = 0;
						$total_sum_over = 0;
						$gum_good = 0;
						$verygood = 0;
        				$notverygood = 0;
			 //////////////////////////////////////

//ปีการศึกษาปัจจุบัน
$result_edyear=mysqli_query($connect,"select * from  student_main_edyear where year_active='1' order by ed_year desc limit 1");
$row_edyear=mysqli_fetch_array($result_edyear);		
$ed_year=$row_edyear['ed_year'];  
			 
		
				$resultbs=mysqli_query($connect,"SELECT * FROM health_base WHERE status='1'");
				$rowbs=mysqli_fetch_array($resultbs);		
				$year_bs=$rowbs['study_year']; //ปีการศึกษา
				$tm=$rowbs['term']; //term
				
					$result_num=mysqli_query($connect,"SELECT check_id FROM  health_checking WHERE year_std='$year_bs' and term_std='$tm' and number_check='2' ");
					$num_rows=mysqli_num_rows($result_num);
					if($num_rows>=1){
					$ck="2";
					}
					else{
					$ck="1";
					}

////////part1
?>
<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<ed_year><?php echo base64_encode($ed_year);?></ed_year>
	<tm><?php echo base64_encode($tm);?></tm>
	<ck><?php echo base64_encode($ck);?></ck>
<health>
<?php
$resultCK=mysqli_query($connect,"SELECT* FROM student_main_class order by class_code");
$check_room=mysqli_num_rows($resultCK); 
$num=1;
$bg="";
while($recordCK=mysqli_fetch_array($resultCK)) {	
$class_code=$recordCK['class_code'];
$class_name=$recordCK['class_name'];
	
					//............................................................................
					$c1="#DDF4F9";
					$c2="#EEFCCF";
					//..............................................................................
					if($bg==$c1){
					$bg=$c2;
					}else{
					$bg=$c1;
					}      

					 	$resultsd=mysqli_query($connect,"SELECT * FROM student_main WHERE class_now='$class_code' AND status='0'");
						$std_num=mysqli_num_rows($resultsd);  //จำนวนนักเรียนในห้อง
				
			 $resultslw=mysqli_query($connect,"SELECT* FROM health_checking  INNER JOIN student_main on health_checking.student_id=student_main.student_id WHERE health_checking.class_now='$class_code'&&health_checking.year_std='$year_bs'&&health_checking.number_check='$ck'&&health_checking.term_std='$tm'");

			$checkslw=mysqli_num_rows($resultslw);  
			$total_checked_student=$total_checked_student+$checkslw;
			
						$sum_gum_good=0;
						$sum_gum_no=0;
						$sum_tooth_good=0;
						$sum_tooth_no=0;
						$sum_iodine_good=0;
						$sum_iodine_no=0;
						
						$sum_H1=0; //ผอม
						$sum_H2=0; //ค่อนข้างผอม
						$sum_H3=0; //สมส่วน
						$sum_H4=0; //อ้วน
						$sum_H5=0; //เริ่มอ้วน
						$sum_H6=0; //อ้วน
						
						$sum_good_std=0;  //รวมนักเรียนสุขภาพดี
						$percent_sum_good_std=0;
						
			$slw=1;		 						
			while($recordslw=mysqli_fetch_array($resultslw)){	
				$weight=$recordslw['weight']; /*น้ำหนัก*/
				$tall=$recordslw['tall']; /*ส่วนสูง*/
				$sex=$recordslw['sex'];  
				$good_std=1; //นักเรียนสุขภาพดี

				if($class_code<=3){
				$type_table=0;  //ตารางอนุบาล
						if($tall<50){
						$tall=50;
						}
						else if($tall>140){
						$tall=140;
						}
				}
				else{
				$type_table=1; //ตารางประถมมัธยม
						if($tall<90){
						$tall=90;
						}
						else if($tall>180){
						$tall=180;
						}
				}
				
				//หาช่วงตารางคำนวณ
				 if(($type_table==0) and ($tall==140)){
				$tall_x=139;
				 }
				 else{
				 $tall_x=$tall;
				 }
				 
				 if(($type_table==1) and ($tall==180)){
				  $tall_x=179;
				 }
				 else{
				 $tall_x=$tall;
				 }
				 
				 $scrap=$tall_x%5;
				 $add=5-$scrap;
				 $upper=$tall_x+$add;
				 $lower=$tall_x-$scrap;

				if(($type_table==0) and ($sex==1)){
				$w1_g2=$weight1_1[$upper];
				$w1_g1=$weight1_1[$lower];
				$w2_g2=$weight1_2[$upper];
				$w2_g1=$weight1_2[$lower];
				$w3_g2=$weight1_3[$upper];
				$w3_g1=$weight1_3[$lower];
				$w4_g2=$weight1_4[$upper];
				$w4_g1=$weight1_4[$lower];
				$w5_g2=$weight1_5[$upper];
				$w5_g1=$weight1_5[$lower];
				}
				else if(($type_table==0) and ($sex==2)){
				$w1_g2=$weight2_1[$upper];
				$w1_g1=$weight2_1[$lower];
				$w2_g2=$weight2_2[$upper];
				$w2_g1=$weight2_2[$lower];
				$w3_g2=$weight2_3[$upper];
				$w3_g1=$weight2_3[$lower];
				$w4_g2=$weight2_4[$upper];
				$w4_g1=$weight2_4[$lower];
				$w5_g2=$weight2_5[$upper];
				$w5_g1=$weight2_5[$lower];
				}
				else if(($type_table==1) and ($sex==1)){
				$w1_g2=$weight3_1[$upper];
				$w1_g1=$weight3_1[$lower];
				$w2_g2=$weight3_2[$upper];
				$w2_g1=$weight3_2[$lower];
				$w3_g2=$weight3_3[$upper];
				$w3_g1=$weight3_3[$lower];
				$w4_g2=$weight3_4[$upper];
				$w4_g1=$weight3_4[$lower];
				$w5_g2=$weight3_5[$upper];
				$w5_g1=$weight3_5[$lower];
				}
				else if(($type_table==1) and ($sex==2)){
				$w1_g2=$weight4_1[$upper];
				$w1_g1=$weight4_1[$lower];
				$w2_g2=$weight4_2[$upper];
				$w2_g1=$weight4_2[$lower];
				$w3_g2=$weight4_3[$upper];
				$w3_g1=$weight4_3[$lower];
				$w4_g2=$weight4_4[$upper];
				$w4_g1=$weight4_4[$lower];
				$w5_g2=$weight4_5[$upper];
				$w5_g1=$weight4_5[$lower];
				}

		$score1=$w1_g1+(($w1_g2-$w1_g1)*(($tall-$lower)/($upper-$lower)));
		$score2=$w2_g1+(($w2_g2-$w2_g1)*(($tall-$lower)/($upper-$lower)));
		$score3=$w3_g1+(($w3_g2-$w3_g1)*(($tall-$lower)/($upper-$lower)));
		$score4=$w4_g1+(($w4_g2-$w4_g1)*(($tall-$lower)/($upper-$lower)));
		$score5=$w5_g1+(($w5_g2-$w5_g1)*(($tall-$lower)/($upper-$lower)));

$level=0;	 //ระดับสมส่วน		
		if($weight<$score1){
		$level=1;
		$sum_H1=$sum_H1+1;
		}
		else if(($weight>=$score1) and ($weight<$score2)){
		$level=2;
		$sum_H2=$sum_H2+1;
		}
		else if(($weight>=$score2) and ($weight<$score3)){
		$level=3;
		$sum_H3=$sum_H3+1;
		}
		else if(($weight>=$score3) and ($weight<$score4)){
		$level=4;
		$sum_H4=$sum_H4+1;
		}
		else if(($weight>=$score4) and ($weight<$score5)){		
		$level=5;
		$sum_H5=$sum_H5+1;
		}
		else if($weight>=$score5){		
		$level=6;
		$sum_H6=$sum_H6+1;
		}	
	
		//สมส่วน
		if($level==1 or $level==6){
		$good_std=0;
		}

				/* เหงือก*/
					if($recordslw['gum']!=""){
							if($recordslw['gum']=="ไม่มี"){
							$sum_gum_good=$sum_gum_good+1;	
							$total_sum_gum_good=$total_sum_gum_good+1; 
							}else{
							$sum_gum_no=$sum_gum_no+1;	
							$total_sum_gum_no=$total_sum_gum_no+1;
							$good_std=0;
							}
					}
					/*ฟัน*/
					if($recordslw['tooth']!=""){
								if($recordslw['tooth']=="ไม่ผุ"){
								$sum_tooth_good=$sum_tooth_good+1;	
								$total_sum_tooth_good=$total_sum_tooth_good+1;
								}else{
								$sum_tooth_no=$sum_tooth_no+1;	
								$total_sum_tooth_no=$total_sum_tooth_no+1;
								$good_std=0;
								}
					}
					/*ไอโอดีน*/
					if($recordslw['iodine']!=""){
								if($recordslw['iodine']=="ปกติ"){
								$sum_iodine_good=$sum_iodine_good+1;	
								$total_sum_iodine_good=$total_sum_iodine_good+1;
								}else{
								$sum_iodine_no=$sum_iodine_no+1;	
								$total_sum_iodine_no=$total_sum_iodine_no+1;
								$good_std=0;
								}
					}
				$slw++;  // loop นักเรียนรายคน

						if($good_std==1){
						$sum_good_std=$sum_good_std+1;
						$total_good_std=$total_good_std+1;
						}		
		
			if($checkslw!=0){
			$percent_sum_good_std=$sum_good_std/$checkslw*100;
			}

}	

			$total_H1=$total_H1+$sum_H1;
			$total_H2=$total_H2+$sum_H2;
			$total_H3=$total_H3+$sum_H3;
			$total_H4=$total_H4+$sum_H4;
			$total_H5=$total_H5+$sum_H5;
			$total_H6=$total_H6+$sum_H6;
			
?>		
	<item>
	<class_name><?php echo base64_encode($class_name);?></class_name>
	<std_num><?php echo base64_encode($std_num);?></std_num>
	<std_checked_num><?php echo base64_encode($checkslw);?></std_checked_num>
	<H6><?php echo base64_encode($sum_H6);?></H6>
	<H5><?php echo base64_encode($sum_H5);?></H5>
	<H4><?php echo base64_encode($sum_H4);?></H4>
	<H3><?php echo base64_encode($sum_H3);?></H3>
	<H2><?php echo base64_encode($sum_H2);?></H2>
	<H1><?php echo base64_encode($sum_H1);?></H1>
	<sum_gum_good><?php echo base64_encode($sum_gum_good);?></sum_gum_good>
	<sum_gum_no><?php echo base64_encode($sum_gum_no);?></sum_gum_no>
	<sum_tooth_good><?php echo base64_encode($sum_tooth_good);?></sum_tooth_good>
	<sum_tooth_no><?php echo base64_encode($sum_tooth_no);?></sum_tooth_no>
	<sum_iodine_good><?php echo base64_encode($sum_iodine_good);?></sum_iodine_good>
	<sum_iodine_no><?php echo base64_encode($sum_iodine_no);?></sum_iodine_no>
	<percent_sum_good><?php echo base64_encode($percent_sum_good_std);?></percent_sum_good>	
	

</item>
<?php			
} 

		if($total_checked_student!=0){
		$percent_total_checked_student=$total_good_std/$total_checked_student*100;
		$percent_total_checked_student=number_format($percent_total_checked_student,2);
		}			
?>
	<item2>
	<total_H6><?php echo base64_encode($total_H6);?></total_H6>
	<total_H5><?php echo base64_encode($total_H5);?></total_H5>
	<total_H4><?php echo base64_encode($total_H4);?></total_H4>
	<total_H3><?php echo base64_encode($total_H3);?></total_H3>
	<total_H2><?php echo base64_encode($total_H2);?></total_H2>
	<total_H1><?php echo base64_encode($total_H1);?></total_H1>
	
	<total_sum_gum_good><?php echo base64_encode($total_sum_gum_good);?></total_sum_gum_good>
	<total_sum_gum_no><?php echo base64_encode($total_sum_gum_no);?></total_sum_gum_no>
	<total_sum_tooth_good><?php echo base64_encode($total_sum_tooth_good);?></total_sum_tooth_good>
	<total_sum_tooth_no><?php echo base64_encode($total_sum_tooth_no);?></total_sum_tooth_no>
	<total_sum_iodine_good><?php echo base64_encode($total_sum_iodine_good);?></total_sum_iodine_good>
	<total_sum_iodine_no><?php echo base64_encode($total_sum_iodine_no);?></total_sum_iodine_no>
	
	<total_checked_student><?php echo base64_encode($total_checked_student);?></total_checked_student>
	<percent_total_checked_student><?php echo base64_encode($percent_total_checked_student);?></percent_total_checked_student>	
	
	</item2>
	</health>
</info>

<?php
}  //end if index==1
///////////////////////////////////////////////

if($_GET['index']==2){
//////////////////ประกาศตัวแปร////////////////////////////
// อนุบาลชาย  น้ำหนัก อายุ
$weight1_1=array();
$weight1_2=array();
$weight1_3=array();
$weight1_4=array();
$result=mysqli_query($connect,"SELECT * FROM health_age_weight where type='0' and sex='1' order by age");
while($row=mysqli_fetch_array($result)){		 
$age=$row['age']; 
$weight1=$row['weight_1']; 
$weight2=$row['weight_2']; 
$weight3=$row['weight_3']; 
$weight4=$row['weight_4']; 
$weight1_1[$age]=$weight1; 
$weight1_2[$age]=$weight2;
$weight1_3[$age]=$weight3;
$weight1_4[$age]=$weight4;
}

// อนุบาลหญิง น้ำหนัก อายุ
$weight2_1=array();
$weight2_2=array();
$weight2_3=array();
$weight2_4=array();
$result=mysqli_query($connect,"SELECT * FROM health_age_weight where type='0' and sex='2' order by age");
while($row=mysqli_fetch_array($result)){		 
$age=$row['age']; 
$weight1=$row['weight_1']; 
$weight2=$row['weight_2']; 
$weight3=$row['weight_3']; 
$weight4=$row['weight_4']; 
$weight2_1[$age]=$weight1; 
$weight2_2[$age]=$weight2;
$weight2_3[$age]=$weight3;
$weight2_4[$age]=$weight4;
}

// ประถมมัธยมชาย น้ำหนัก อายุ
$weight3_1=array();
$weight3_2=array();
$weight3_3=array();
$weight3_4=array();
$weight3_5=array();
$result=mysqli_query($connect,"SELECT * FROM health_age_weight where type='1' and sex='1' order by age");
while($row=mysqli_fetch_array($result)){		 
$age=$row['age']; 
$weight1=$row['weight_1']; 
$weight2=$row['weight_2']; 
$weight3=$row['weight_3']; 
$weight4=$row['weight_4']; 
$weight3_1[$age]=$weight1;
$weight3_2[$age]=$weight2;
$weight3_3[$age]=$weight3;
$weight3_4[$age]=$weight4;
}

// ประถมมัธยมหญิง น้ำหนัก อายุ
$weight4_1=array();
$weight4_2=array();
$weight4_3=array();
$weight4_4=array();
$result=mysqli_query($connect,"SELECT * FROM health_age_weight where type='1' and sex='2' order by age");
while($row=mysqli_fetch_array($result)){		 
$age=$row['age']; 
$weight1=$row['weight_1']; 
$weight2=$row['weight_2']; 
$weight3=$row['weight_3']; 
$weight4=$row['weight_4']; 
$weight4_1[$age]=$weight1;
$weight4_2[$age]=$weight2;
$weight4_3[$age]=$weight3;
$weight4_4[$age]=$weight4;
}

/////////////////////////
// อนุบาลชาย  ส่วนสูง อายุ
$height1_1=array();
$height1_2=array();
$height1_3=array();
$height1_4=array();
$result=mysqli_query($connect,"SELECT * FROM health_age_height where type='0' and sex='1' order by age");
while($row=mysqli_fetch_array($result)){		 
$age=$row['age']; 
$height1=$row['height_1']; 
$height2=$row['height_2']; 
$height3=$row['height_3']; 
$height4=$row['height_4']; 
$height1_1[$age]=$height1; 
$height1_2[$age]=$height2;
$height1_3[$age]=$height3;  
$height1_4[$age]=$height4;
}

// อนุบาลหญิง ส่วนสูง อายุ
$height2_1=array();
$height2_2=array();
$height2_3=array();
$height2_4=array();
$result=mysqli_query($connect,"SELECT * FROM health_age_height where type='0' and sex='2' order by age");
while($row=mysqli_fetch_array($result)){		 
$age=$row['age']; 
$height1=$row['height_1']; 
$height2=$row['height_2']; 
$height3=$row['height_3']; 
$height4=$row['height_4']; 
$height2_1[$age]=$height1; 
$height2_2[$age]=$height2;
$height2_3[$age]=$height3;
$height2_4[$age]=$height4;
}

// ประถมมัธยมชาย ส่วนสูง อายุ
$height3_1=array();
$height3_2=array();
$height3_3=array();
$height3_4=array();
$height3_5=array();
$result=mysqli_query($connect,"SELECT * FROM health_age_height where type='1' and sex='1' order by age");
while($row=mysqli_fetch_array($result)){		 
$age=$row['age']; 
$height1=$row['height_1']; 
$height2=$row['height_2']; 
$height3=$row['height_3']; 
$height4=$row['height_4']; 
$height3_1[$age]=$height1;
$height3_2[$age]=$height2;
$height3_3[$age]=$height3;
$height3_4[$age]=$height4; 
}

// ประถมมัธยมหญิง ส่วนสูง อายุ
$height4_1=array();
$height4_2=array();
$height4_3=array();
$height4_4=array();
$result=mysqli_query($connect,"SELECT * FROM health_age_height where type='1' and sex='2' order by age");
while($row=mysqli_fetch_array($result)){		 
$age=$row['age']; 
$height1=$row['height_1']; 
$height2=$row['height_2']; 
$height3=$row['height_3']; 
$height4=$row['height_4']; 
$height4_1[$age]=$height1;
$height4_2[$age]=$height2;
$height4_3[$age]=$height3;
$height4_4[$age]=$height4;  
}
//////////////////////////

						 $check_room_sdT = 0;
						 $checkslwT = 0;
						 $total_nocheckT = 0;
						 
						$total_H1=0;
						$total_H2=0;
						$total_H3=0;
						$total_H4=0;
						$total_H5=0;
						
						$total_Hh1=0;
						$total_Hh2=0;
						$total_Hh3=0;
						$total_Hh4=0;
						$total_Hh5=0;
						
						$total_good_H=0; //นักเรียนอยู่ในเกณธ์
						$total_N=0; // นักเรียนทั้งหมด
						
						$checkslw2=0; // จำนวนแถว //

			 //////////////////////////////////////
//ปีการศึกษาปัจจุบัน
$result_edyear=mysqli_query($connect,"select * from  student_main_edyear where year_active='1' order by ed_year desc limit 1");
$row_edyear=mysqli_fetch_array($result_edyear);		
$ed_year=$row_edyear['ed_year'];  
			 
		
				$resultbs=mysqli_query($connect,"SELECT * FROM health_base WHERE status='1'");
				$rowbs=mysqli_fetch_array($resultbs);		
				$year_bs=$rowbs['study_year']; //ปีการศึกษา
				$tm=$rowbs['term']; //term
				
					$result_num=mysqli_query($connect,"SELECT check_id FROM  health_checking WHERE year_std='$year_bs' and term_std='$tm' and number_check='2' ");
					$num_rows=mysqli_num_rows($result_num);
					if($num_rows>=1){
					$ck="2";
					}
					else{
					$ck="1";
					}

////////part2
?>
<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<ed_year><?php echo base64_encode($ed_year);?></ed_year>
	<tm><?php echo base64_encode($tm);?></tm>
	<ck><?php echo base64_encode($ck);?></ck>
<health>
<?php

$resultCK=mysqli_query($connect,"SELECT* FROM student_main_class order by class_code");
$check_room=mysqli_num_rows($resultCK); 
$num=1;
$bg="";
while($recordCK=mysqli_fetch_array($resultCK)) {	
$class_code=$recordCK['class_code'];
$class_name=$recordCK['class_name'];
	
					//............................................................................
					$c1="#DDF4F9";
					$c2="#EEFCCF";
					//..............................................................................
					if($bg==$c1){
					$bg=$c2;
					}else{
					$bg=$c1;
					}      

					 	$resultsd=mysqli_query($connect,"SELECT * FROM student_main WHERE class_now='$class_code' AND status='0'");
						$std_num=mysqli_num_rows($resultsd);  //จำนวนนักเรียนในห้อง
				
			 $resultslw=mysqli_query($connect,"SELECT* FROM health_checking  INNER JOIN student_main on health_checking.student_id=student_main.student_id WHERE health_checking.class_now='$class_code'&&health_checking.year_std='$year_bs'&&health_checking.number_check='$ck'&&health_checking.term_std='$tm'");

			$checkslw=mysqli_num_rows($resultslw);  
			$total_checked_student=$total_checked_student+$checkslw;
			
						$sum_H1=0; //น้อยกว่าเกณฑ์
						$sum_H2=0; //ค่อนข้างน้อย
						$sum_H3=0; //น้ำหนักตามเกณฑ์
						$sum_H4=0; //น้ำหนักค่อนข้างมาก
						$sum_H5=0; //มากเกินเกณฑ์
						
						$sum_Hh1=0; //เตี้ย
						$sum_Hh2=0; //ค่อนข้างเตี้ย
						$sum_Hh3=0; //ส่วนสูงตามเกณฑ์
						$sum_Hh4=0; //ค่อนข้างสูง
						$sum_Hh5=0; //สูง
						
						$sum_good_H=0;
						
						$sum_good_std=0;  //รวมนักเรียนสุขภาพดี
						$percent_sum_good_std=0;
						
			$slw=1;		 	
			$N=0;					
			while($recordslw=mysqli_fetch_array($resultslw)){	
				$std_person_id=$recordslw['person_id'];  
				$std_person_id=trim($std_person_id);
				$weight=$recordslw['weight']; /*น้ำหนัก*/
				$tall=$recordslw['tall']; /*ส่วนสูง*/
				$sex=$recordslw['sex'];  
				$day=$recordslw['day']; 
				list($check_date[0],$check_date[1])=(explode("-",$day));
				$year=$check_date[0]-543;
				$month=$check_date[1];

				//หาอายุ 
				$sql = "select * from student_main_expand1 where  person_id='$std_person_id'";
				$dbquery_birth = mysqli_query($connect,$sql);
				$result_birth = mysqli_fetch_array($dbquery_birth);
				$std_birthday=$result_birth['birthday']; 
				
				if($std_birthday>0){
				$N++;
				$total_N++;
				$good_H=1;
						list($birth[0],$birth[1],$birth[2])=(explode("-",$std_birthday));
						$year_defferent=$year-$birth[0];
						$month_defferent=$month-$birth[1];
						if($month_defferent<0){
						$month_defferent=12+$month_defferent;
						$year_defferent=$year_defferent-1;
						}
						$std_age=$year_defferent+($month_defferent/12);
				
				if($std_age>=18){
				$std_age=17.9999;
				}
				
				// ตารางเทียบ
				if($std_age<5){
				$type_table=0;  //ตารางอนุบาล
				}
				else{
				$type_table=1; //ตารางประถมมัธยม
				}

				if($type_table==0){
				 $int_age=intval($std_age) ; 
				 $scrap=$std_age- $int_age;
						if($scrap<=.25){
						$upper=$int_age+0.25;
						$lower=$int_age;
						}
						else if($scrap<=.50){
						$upper=$int_age+0.50;
						$lower=$int_age+0.25;
						}
						else if($scrap<=.75){
						$upper=$int_age+0.75;
						$lower=$int_age+0.50;
						}
						else if($scrap<1){
						$upper=$int_age+1;
						$lower=$int_age+0.75;
						}
				}		
				else if($type_table==1){
				 $upper=intval($std_age)+1;
				 $lower=intval($std_age);
				 }
	
     ///////////////////////// น้ำหนัก				 
				if(($type_table==0) and ($sex==1)){
				$w1_g2=$weight1_1[strval($upper)];
				$w1_g1=$weight1_1[strval($lower)];  
				$w2_g2=$weight1_2[strval($upper)];
				$w2_g1=$weight1_2[strval($lower)];
				$w3_g2=$weight1_3[strval($upper)];
				$w3_g1=$weight1_3[strval($lower)];
				$w4_g2=$weight1_4[strval($upper)];
				$w4_g1=$weight1_4[strval($lower)];
				}
				else if(($type_table==0) and ($sex==2)){
				$w1_g2=$weight2_1[strval($upper)];
				$w1_g1=$weight2_1[strval($lower)];
				$w2_g2=$weight2_2[strval($upper)];
				$w2_g1=$weight2_2[strval($lower)];
				$w3_g2=$weight2_3[strval($upper)];
				$w3_g1=$weight2_3[strval($lower)];
				$w4_g2=$weight2_4[strval($upper)];
				$w4_g1=$weight2_4[strval($lower)];
				}
				else if(($type_table==1) and ($sex==1)){
				$w1_g2=$weight3_1[strval($upper)];
				$w1_g1=$weight3_1[strval($lower)];
				$w2_g2=$weight3_2[strval($upper)];
				$w2_g1=$weight3_2[strval($lower)];
				$w3_g2=$weight3_3[strval($upper)];
				$w3_g1=$weight3_3[strval($lower)];
				$w4_g2=$weight3_4[strval($upper)];
				$w4_g1=$weight3_4[strval($lower)];
				}
				else if(($type_table==1) and ($sex==2)){
				$w1_g2=$weight4_1[strval($upper)];
				$w1_g1=$weight4_1[strval($lower)];
				$w2_g2=$weight4_2[strval($upper)];
				$w2_g1=$weight4_2[strval($lower)];
				$w3_g2=$weight4_3[strval($upper)];
				$w3_g1=$weight4_3[strval($lower)];
				$w4_g2=$weight4_4[strval($upper)];
				$w4_g1=$weight4_4[strval($lower)];
				}
	
		$score1=$w1_g1+(($w1_g2-$w1_g1)*(($std_age-$lower)/($upper-$lower)));
		$score2=$w2_g1+(($w2_g2-$w2_g1)*(($std_age-$lower)/($upper-$lower)));
		$score3=$w3_g1+(($w3_g2-$w3_g1)*(($std_age-$lower)/($upper-$lower)));
		$score4=$w4_g1+(($w4_g2-$w4_g1)*(($std_age-$lower)/($upper-$lower)));
		////////////////////////////////////////// end น้ำหนัก
		
	    //////////////////////////////////////////l ส่วนสูง
				if(($type_table==0) and ($sex==1)){
				$h1_g2=$height1_1[strval($upper)];
				$h1_g1=$height1_1[strval($lower)];  
				$h2_g2=$height1_2[strval($upper)];
				$h2_g1=$height1_2[strval($lower)];
				$h3_g2=$height1_3[strval($upper)];
				$h3_g1=$height1_3[strval($lower)];
				$h4_g2=$height1_4[strval($upper)];
				$h4_g1=$height1_4[strval($lower)];
				}
				else if(($type_table==0) and ($sex==2)){
				$h1_g2=$height2_1[strval($upper)];
				$h1_g1=$height2_1[strval($lower)];
				$h2_g2=$height2_2[strval($upper)];
				$h2_g1=$height2_2[strval($lower)];
				$h3_g2=$height2_3[strval($upper)];
				$h3_g1=$height2_3[strval($lower)];
				$h4_g2=$height2_4[strval($upper)];
				$h4_g1=$height2_4[strval($lower)];
				}
				else if(($type_table==1) and ($sex==1)){
				$h1_g2=$height3_1[strval($upper)];
				$h1_g1=$height3_1[strval($lower)];
				$h2_g2=$height3_2[strval($upper)];
				$h2_g1=$height3_2[strval($lower)];
				$h3_g2=$height3_3[strval($upper)];
				$h3_g1=$height3_3[strval($lower)];
				$h4_g2=$height3_4[strval($upper)];
				$h4_g1=$height3_4[strval($lower)];
				}
				else if(($type_table==1) and ($sex==2)){
				$h1_g2=$height4_1[strval($upper)];
				$h1_g1=$height4_1[strval($lower)];
				$h2_g2=$height4_2[strval($upper)];
				$h2_g1=$height4_2[strval($lower)];
				$h3_g2=$height4_3[strval($upper)];
				$h3_g1=$height4_3[strval($lower)];
				$h4_g2=$height4_4[strval($upper)];
				$h4_g1=$height4_4[strval($lower)];
				}
	
		$score1h=$h1_g1+(($h1_g2-$h1_g1)*(($std_age-$lower)/($upper-$lower)));
		$score2h=$h2_g1+(($h2_g2-$h2_g1)*(($std_age-$lower)/($upper-$lower)));
		$score3h=$h3_g1+(($h3_g2-$h3_g1)*(($std_age-$lower)/($upper-$lower)));
		$score4h=$h4_g1+(($h4_g2-$h4_g1)*(($std_age-$lower)/($upper-$lower)));
		
		//////////////////////////////////////////// end ส่วนสูง
$level=0;	 //น้ำหนัก		
		if($weight<$score1){
		$level=1;
		$sum_H1=$sum_H1+1;
		$good_H=0;
		}
		else if(($weight>=$score1) and ($weight<$score2)){
		$level=2;
		$sum_H2=$sum_H2+1;
		}
		else if(($weight>=$score2) and ($weight<$score3)){
		$level=3;
		$sum_H3=$sum_H3+1;
		}
		else if(($weight>=$score3) and ($weight<$score4)){
		$level=4;
		$sum_H4=$sum_H4+1;
		}
		else if($weight>=$score4){		
		$level=5;
		$sum_H5=$sum_H5+1;
		}
		
$level_h=0;	 //ส่วนสูง		
		if($tall<$score1h){
		$level_h=1;
		$sum_Hh1=$sum_Hh1+1;   
		$good_H=0;
		}
		else if(($tall>=$score1h) and ($tall<$score2h)){
		$level_h=2;
		$sum_Hh2=$sum_Hh2+1;
		}
		else if(($tall>=$score2h) and ($tall<$score3h)){
		$level_h=3;
		$sum_Hh3=$sum_Hh3+1;
		}
		else if(($tall>=$score3h) and ($tall<$score4h)){
		$level_h=4;
		$sum_Hh4=$sum_Hh4+1;
		}
		else if($tall>=$score4h){		
		$level_h=5;
		$sum_Hh5=$sum_Hh5+1;
		}
				if($good_H==1){
				$sum_good_H=$sum_good_H+1;
				$total_good_H=$total_good_H+1;
				}
		} // if $std_birthday>0
				$slw++;  // loop นักเรียนรายคน
}	

			if($N!=0){
			$percent_sum_good_std=$sum_good_H/$N*100;
			$percent_sum_good_std=number_format($percent_sum_good_std,2);
			}

						$total_H1=$total_H1+$sum_H1;
						$total_H2=$total_H2+$sum_H2;
						$total_H3=$total_H3+$sum_H3;
						$total_H4=$total_H4+$sum_H4;
						$total_H5=$total_H5+$sum_H5;
						
						$total_Hh1=$total_Hh1+$sum_Hh1;
						$total_Hh2=$total_Hh2+$sum_Hh2;
						$total_Hh3=$total_Hh3+$sum_Hh3;
						$total_Hh4=$total_Hh4+$sum_Hh4;
						$total_Hh5=$total_Hh5+$sum_Hh5;
			
?>		
	<item>
	<class_name><?php echo base64_encode($class_name);?></class_name>
	<std_num><?php echo base64_encode($std_num);?></std_num>
	<std_checked_num><?php echo base64_encode($checkslw);?></std_checked_num>
	<H5><?php echo base64_encode($sum_H5);?></H5>
	<H4><?php echo base64_encode($sum_H4);?></H4>
	<H3><?php echo base64_encode($sum_H3);?></H3>
	<H2><?php echo base64_encode($sum_H2);?></H2>
	<H1><?php echo base64_encode($sum_H1);?></H1>
	
	<Hh5><?php echo base64_encode($sum_Hh5);?></Hh5>
	<Hh4><?php echo base64_encode($sum_Hh4);?></Hh4>
	<Hh3><?php echo base64_encode($sum_Hh3);?></Hh3>
	<Hh2><?php echo base64_encode($sum_Hh2);?></Hh2>
	<Hh1><?php echo base64_encode($sum_Hh1);?></Hh1>
	
	<percent_sum_good_std><?php echo base64_encode($percent_sum_good_std);?></percent_sum_good_std>
	<N><?php echo base64_encode($N);?></N>
	
</item>
<?php			
} 
		if($total_N!=0){
		$total_percent=$total_good_H/$total_N*100;
		$total_percent=number_format($total_percent,2);
		}
		else{
		$total_percent="";
		}
	
?>
	<item2>
	<total_H5><?php echo base64_encode($total_H5);?></total_H5>
	<total_H4><?php echo base64_encode($total_H4);?></total_H4>
	<total_H3><?php echo base64_encode($total_H3);?></total_H3>
	<total_H2><?php echo base64_encode($total_H2);?></total_H2>
	<total_H1><?php echo base64_encode($total_H1);?></total_H1>
	
	<total_Hh5><?php echo base64_encode($total_Hh5);?></total_Hh5>
	<total_Hh4><?php echo base64_encode($total_Hh4);?></total_Hh4>
	<total_Hh3><?php echo base64_encode($total_Hh3);?></total_Hh3>
	<total_Hh2><?php echo base64_encode($total_Hh2);?></total_Hh2>
	<total_Hh1><?php echo base64_encode($total_Hh1);?></total_Hh1>
	
	<total_checked_student><?php echo base64_encode($total_checked_student);?></total_checked_student>
	<total_percent><?php echo base64_encode($total_percent); ?></total_percent>
	</item2>
	
	</health>
</info>
<?php
}  //end if index==2
?>

