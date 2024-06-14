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

$level[-5]="อนุบาล 1";
$level[-6]="อนุบาล 1";
$level[-3]="อนุบาล  2";
$level[-4]="อนุบาล 2";
$level[-1]="อนุบาล 3";
$level[-2]="อนุบาล 3";

$subject_ar[1]="kindergarten";

$subject_num=0; 
$thai_num=0;  
$thai_avg="";

for($x=-6; $x<0; $x++){

		$y=abs($x);  
		if($section==1){
				if($y%2!=0){
				continue;
				}
		}
		else{
				if($y%2==0){
				continue;
				}
		}
		
			for($y=1; $y<=1; $y++){
						
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
			
				$pass_percent="";
				
				if($std_number!=0){
				$pass_percent=$std_pass/$std_number*100;
				$subject_num++;
				
						if($y==1){
						$thai_num++;
						$thai_avg=$thai_avg+$pass_percent;;
						}
				}  
	
				?>
				<item>
					<level><?php echo base64_encode($x);?></level>
					<subject><?php echo base64_encode($y);?></subject>
					<pass_percent><?php echo base64_encode($pass_percent);?></pass_percent>
					<score_avg><?php echo base64_encode($score_avg);?></score_avg>
				</item>					
				<?php
		} // for y
}  //for x

				if($thai_avg!=0){
				$thai_avg=$thai_avg/$thai_num;
				$thai_avg=number_format($thai_avg,2);
				}
		
?>
	</student>
<thai_avg><?php echo base64_encode($thai_avg);?></thai_avg>
</info>
