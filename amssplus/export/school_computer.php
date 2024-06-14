<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

?>
<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<sch>
<?php

//ปีการศึกษา
$sql = "select * from  student_main_edyear  where year_active='1' order by  ed_year desc limit 1";
$dbquery = mysqli_query($connect,$sql);
$year_active_result = mysqli_fetch_array($dbquery);

//จำนวนนร.สูงสุด
$sql_count= "select * from student_main_num  where school_code='$_REQUEST[school_code]' and ed_year='$year_active_result[ed_year]'";
$dbquery_count = mysqli_query($connect,$sql_count);
$result_count = mysqli_fetch_array($dbquery_count);
$student_max=0;
for($x = 1; $x <= 15; $x++){
$c="c".$x; 
$student_num=$result_count["$c"]; 
		if($student_num>$student_max){
		$student_max=$student_num;
				if($student_max>40){
				$student_max=40;
				}
		}
}

//จำนวนคอมพิวเตอร์ 
$sql_computer= "select equipment_num from dltv_equipment where school_code='$_REQUEST[school_code]' and equipment_type='1'";
$dbquery_computer = mysqli_query($connect,$sql_computer);
$result_computer = mysqli_fetch_array($dbquery_computer);
$computer_num=$result_computer['equipment_num'];  

?>
		<item>
				<computer_num><?php echo base64_encode($computer_num);?></computer_num>
				<student_max><?php echo base64_encode($student_max);?></student_max>
		</item>
	</sch>
</info>


