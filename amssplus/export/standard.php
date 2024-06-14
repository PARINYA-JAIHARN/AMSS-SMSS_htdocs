<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

?>
<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<ed_year><?php echo base64_encode($_GET['val3']);?></ed_year>
	<section><?php echo base64_encode($_GET['val4']);?></section>
	<student>

<?php

$school_code=$_GET['school_code'];
$year_index=$_GET["val3"];
$section=$_GET["val4"];

// เชื่อมdatabase ชื่อ amssplus_bets
/////////

$user_db=$user;
if(isset($amssplus_bets)){   
$amssplus_bets=$amssplus_bets;
}
else{
$amssplus_bets="amssplus_bets"; 
}
$connect_bets=@mysqli_connect($hostname,$user_db,$password,$amssplus_bets);
		if($connect_bets){
		mysqli_query($connect_bets,"SET NAMES utf8");
		}
/////////
//end 	


/////////////////////////////////////////////////

$level[1]="ป.1";
$level[2]="ป.1";
$level[3]="ป.2";
$level[4]="ป.2";
$level[5]="ป.3";
$level[6]="ป.3";
$level[7]="ป.4";
$level[8]="ป.4";
$level[9]="ป.5";
$level[10]="ป.5";
$level[11]="ป.6";
$level[12]="ป.6";
$level[13]="ม.1";
$level[14]="ม.1";
$level[15]="ม.2";
$level[16]="ม.2";
$level[17]="ม.3";
$level[18]="ม.3";
$level[19]="ม.4";
$level[20]="ม.4";
$level[21]="ม.5";
$level[22]="ม.5";
$level[23]="ม.6";
$level[24]="ม.6";

$subject_ar[1]="thai";
$subject_ar[2]="math";
$subject_ar[3]="science";
$subject_ar[4]="social";
$subject_ar[5]="english";
$subject_ar[6]="english2";
	
$avg="0";   $avg2="0"; $avg3="0";
$subject_num=0;  $subject_num2=0; $subject_num3=0;
$avg="";  $avg2="";  $avg3=""; 

$thai_num=0;  $thai_avg="";
$math_num=0;  $math_avg="";
$science_num=0;  $science_avg="";
$social_num=0;  $social_avg="";
$english_num=0;  $english_avg="";
$english2_num=0;  $english2_avg="";

for($x=1; $x<=18; $x++){
				if($x%2 == 0){
				$section_thai="ภาคเรียนที่ 2";
				}
				else{
				$section_thai="ภาคเรียนที่ 1";
				}
		
				if($section==1){
						if($x%2==0){
						continue;
						}
				}
				else{
						if($x%2!=0){
						continue;
						}
				}

				$subject_inclass_num=0;  //จำนวยวิชาในชั้น
				$total_avg_inclass=0; //รวมค่าเฉลี่ยแต่ละวิชาในชั้น
				$avg_class=""; //ค่าเฉลี่ยในชั้น 6 วิชา		

				for($y=1; $y<=6; $y++){
						
				$sql_num = "select id from $subject_ar[$y] where school_code='$_REQUEST[school_code]' and level='$x' and ed_year='$year_index'";
				$sql_pass = "select id from $subject_ar[$y] where score>='50'  and school_code='$_REQUEST[school_code]' and level='$x' and ed_year='$year_index'";
				$sql_avg = "select avg(score) as score_avg from $subject_ar[$y] where school_code='$_REQUEST[school_code]' and level='$x' and ed_year='$year_index'";
				
				$dbquery_num = mysqli_query($connect_bets,$sql_num);
				$std_number=mysqli_num_rows($dbquery_num);

				$dbquery_pass = mysqli_query($connect_bets,$sql_pass);
				$std_pass=mysqli_num_rows($dbquery_pass);
				
				$dbquery_avg = mysqli_query($connect_bets,$sql_avg);
				$result_avg = mysqli_fetch_array($dbquery_avg);
				$score_avg=$result_avg['score_avg'];
				
				if($score_avg>0){
				$score_avg2=number_format($score_avg,2);
				}
				else{
				$score_avg2="";
				}
				
				$pass_percent="";
				$pass_percent2="";
				
				if($std_number!=0){
				$pass_percent=$std_pass/$std_number*100;
				$pass_percent2=$pass_percent;
				$pass_percent=number_format($pass_percent,2);
				$subject_num++;
				$avg=$avg+$pass_percent;
				
							//เฉลี่ยประถม
							if($x<=12){
							$subject_num2++;
							$avg2=$avg2+$pass_percent;
							}
							//เฉลียมัธยม
							if($x>12 and $x<=18){
							$subject_num3++;
							$avg3=$avg3+$pass_percent;
							}
							
							if($y==1){
							$thai_num++;
							$thai_avg=$thai_avg+$pass_percent;;
							}
							else if($y==2){
							$math_num++;
							$math_avg=$math_avg+$pass_percent;;
							}
							else if($y==3){
							$science_num++;
							$science_avg=$science_avg+$pass_percent;;
							}
							else if($y==4){
							$social_num++;
							$social_avg=$social_avg+$pass_percent;;
							}
							else if($y==5){
							$english_num++;
							$english_avg=$english_avg+$pass_percent;;
							}
							else if($y==6){
							$english2_num++;
							$english2_avg=$english2_avg+$pass_percent;;
							}
				}
			
			
				?>
				<item>
					<level><?php echo base64_encode($x);?></level>
					<subject><?php echo base64_encode($y);?></subject>
					<pass_percent><?php echo base64_encode($pass_percent2);?></pass_percent>
					<score_avg><?php echo base64_encode($score_avg);?></score_avg>
					<pass_class_percent><?php echo base64_encode("");?></pass_class_percent>
				</item>					
				<?php
				
						$bg="";
						if($std_number!=0 and $pass_percent==0){
						$bg="#FF0000";
						}
						else if($pass_percent>0 and $pass_percent<25){
						$bg="#F78181";
						}
						else if($pass_percent>=25 and $pass_percent<50){
						$bg="#FFCCFF";
						}
						else if($pass_percent>=50 and $pass_percent<75){
						$bg="#FFFFCC";
						}
						
				if($score_avg2!=""){
					$subject_inclass_num=$subject_inclass_num+1;
					$total_avg_inclass=$total_avg_inclass+$pass_percent;
							if($subject_inclass_num>0){
							$avg_class=$total_avg_inclass/$subject_inclass_num;
							$avg_class=number_format($avg_class,2);
							}
					}
				
		}
		?>
		<item>
				<level><?php echo base64_encode($x);?></level>
				<subject><?php echo base64_encode("7");?></subject>
				<pass_percent><?php echo base64_encode($avg_class);?></pass_percent>
				<score_avg><?php echo base64_encode("");?></score_avg>
				<pass_class_percent><?php echo base64_encode($avg_class);?></pass_class_percent>
		</item>
		<?php
}

				if($avg!=0){
				$avg=$avg/$subject_num;
				$avg=number_format($avg,2);
				}
				if($avg2!=0){
				$avg2=$avg2/$subject_num2;
				$avg2=number_format($avg2,2);
				}
				if($avg3!=0){
				$avg3=$avg3/$subject_num3;
				$avg3=number_format($avg3,2);
				}
				if($thai_avg!=0){
				$thai_avg=$thai_avg/$thai_num;
				$thai_avg=number_format($thai_avg,2);
				}
				if($math_avg!=0){
				$math_avg=$math_avg/$math_num;
				$math_avg=number_format($math_avg,2);
				}
				if($science_avg!=0){
				$science_avg=$science_avg/$science_num;
				$science_avg=number_format($science_avg,2);
				}
				if($social_avg!=0){
				$social_avg=$social_avg/$social_num;
				$social_avg=number_format($social_avg,2);
				}
				if($english_avg!=0){
				$english_avg=$english_avg/$english_num;
				$english_avg=number_format($english_avg,2);
				}
				if($english2_avg!=0){
				$english2_avg=$english2_avg/$english2_num;
				$english2_avg=number_format($english2_avg,2);
				}
		
?>
	</student>
<thai_avg><?php echo base64_encode($thai_avg);?></thai_avg>
<math_avg><?php echo base64_encode($math_avg);?></math_avg>
<science_avg><?php echo base64_encode($science_avg);?></science_avg>
<social_avg><?php echo base64_encode($social_avg);?></social_avg>
<english_avg><?php echo base64_encode($english_avg);?></english_avg>
<english2_avg><?php echo base64_encode($english2_avg);?></english2_avg>
	
<total><?php echo base64_encode($avg);?></total>
<total2><?php echo base64_encode($avg2);?></total2>
<total3><?php echo base64_encode($avg3);?></total3>	
</info>
