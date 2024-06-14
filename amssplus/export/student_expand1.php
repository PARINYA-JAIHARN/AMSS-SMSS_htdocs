<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

?>
<info>
<warning><?php echo base64_encode($warning_text);?></warning>
<student>
<?php

$sql = "select * from student_main_expand1 where school_code='$_GET[school_code]'";
$dbquery = mysqli_query($connect,$sql);

while($result_edyear= mysqli_fetch_array($dbquery)){
$person_id=$result_edyear['person_id'];
$e_name=$result_edyear['e_name'];
$e_surname=$result_edyear['e_surname'];
$birthday=$result_edyear['birthday'];
$blood=$result_edyear['blood'];
$race=$result_edyear['race'];
$nationlity=$result_edyear['nationlity'];
$religion=$result_edyear['religion'];

				?>
				<item>
				<person_id><?php echo base64_encode($person_id);?></person_id>
				<e_name><?php echo base64_encode($e_name);?></e_name>
				<e_surname><?php echo base64_encode($e_surname);?></e_surname>
				<birthday><?php echo base64_encode($birthday);?></birthday>
				<blood><?php echo base64_encode($blood);?></blood>
				<race><?php echo base64_encode($race);?></race>
				<nationlity><?php echo base64_encode($nationlity);?></nationlity>
				<religion><?php echo base64_encode($religion);?></religion>
				</item>
				<?php
}
?>
</student>
</info>




