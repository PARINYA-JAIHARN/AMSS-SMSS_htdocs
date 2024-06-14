<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

?>
<info>
<warning><?php echo base64_encode($warning_text);?></warning>
<student>
<?php

$sql = "select * from  student_main_edyear order by ed_year";
$dbquery = mysqli_query($connect,$sql);

while($result_edyear= mysqli_fetch_array($dbquery)){
$ed_year=$result_edyear['ed_year'];
		$sql_student = "select count(id) as student from student_main_main where ed_year='$ed_year' and school_code='$_GET[school_code]'";
		$dbquery_student = mysqli_query($connect,$sql_student);
		$result_student = mysqli_fetch_array($dbquery_student);
		$student=$result_student['student'];
				?>
				<item>
				<edyear><?php echo base64_encode($ed_year);?></edyear>
				<student_num><?php echo base64_encode($student);?></student_num>
				</item>
				<?php
}
?>
</student>
</info>




