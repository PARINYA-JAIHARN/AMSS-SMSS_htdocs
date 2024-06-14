<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$school_code=$_GET['school_code'];
$ed_year=$_GET['ed_year'];
$subject=$_GET['subject'];
$level=$_GET['level'];

/////////////////////////////////////////////////
if($subject=='1'){
$subject="thai";
$thai_subject="ภาษาไทย";
}
else if($subject=='2'){
$subject="math";
$thai_subject="คณิตศาสตร์";
}
else if($subject=='3'){
$subject="science";
$thai_subject="วิทยาศาสตร์";
}
else if($subject=='4'){
$subject="social";
$thai_subject="สังคมศึกษา";
}
else if($subject=='5'){
$subject="english";
$thai_subject="มาตรฐานภาษาอังกฤษ";
}
else if($subject=='6'){
$subject="english2";
$thai_subject="ภาษาอังกฤษเพื่อการสื่อสาร";
}

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

?>
<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<school_code><?php echo base64_encode($school_code);?></school_code>
	<ed_year><?php echo base64_encode($ed_year);?></ed_year>
	<level><?php echo base64_encode($level);?></level>
	<student>

<?php

$N=1;
$sql_1 = "select person_id,score,group_code from $subject where school_code='$school_code' and level='$level' and ed_year='$ed_year' order by id desc";
$dbquery_1 = mysqli_query($connect_bets,$sql_1);
$student_number=0; //จำนวนนักเรียนทั้งหมด
$pass_student_number=0; //จำนวนนักเรียนที่ประเมินผ่าน
while($result_1 = mysqli_fetch_array($dbquery_1)){
$person_id=$result_1['person_id'];
$score=$result_1['score'];
$group_code=$result_1['group_code'];
$score=number_format($score,2);
			$classlevel=""; $prename=""; $name=""; $surname="";
			$sql_2 = "select prename,name,surname,classlevel from student_main_main where school_code='$school_code'  and person_id='$person_id' order by id desc limit 1";
			$dbquery_2 = mysqli_query($connect,$sql_2);
			if($result_2 = mysqli_fetch_array($dbquery_2)){
			$prename=$result_2['prename'];
			$name=$result_2['name'];
			$surname=$result_2['surname'];
			} 	
			?>
			<item>
					<person_id><?php echo base64_encode($person_id);?></person_id>
					<prename><?php echo base64_encode($prename);?></prename>
					<name><?php echo base64_encode($name);?></name>
					<surname><?php echo base64_encode($surname);?></surname>
					<score><?php echo base64_encode($score);?></score>
			</item>	
			<?php
$N++;				
}
?>
	</student>
</info>

