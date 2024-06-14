<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

?>
<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
<?php
$sql = "select ed_year,term from achievement_read where school_code='$_GET[school_code]' order by id desc limit 1";
$dbqery = mysqli_query($connect,$sql);
$result_edyear=mysqli_fetch_array($dbqery);
$ed_year=$result_edyear['ed_year'];
$term=$result_edyear['term'];
?>
	<ed_year><?php echo base64_encode($ed_year);?></ed_year>
	<term><?php echo base64_encode($term);?></term>
<?php
for($x=4;$x<=9;$x++){
$sql = "select * from achievement_read where school_code='$_GET[school_code]' and ed_year='$ed_year' and term='$term' and class_code='$x'";
$dbqery = mysqli_query($connect,$sql);
$result=mysqli_fetch_array($dbqery);
$read_A_4=$result['read_A_4'];
$read_A_3=$result['read_A_3'];
$read_A_2=$result['read_A_2'];
$read_A_1=$result['read_A_1'];
$read_B_4=$result['read_B_4'];
$read_B_3=$result['read_B_3'];
$read_B_2=$result['read_B_2'];
$read_B_1=$result['read_B_1'];

$write_A_4=$result['write_A_4'];
$write_A_3=$result['write_A_3'];
$write_A_2=$result['write_A_2'];
$write_A_1=$result['write_A_1'];
$write_B_4=$result['write_B_4'];
$write_B_3=$result['write_B_3'];
$write_B_2=$result['write_B_2'];
$write_B_1=$result['write_B_1'];

		?>
		<item>
				<class_code><?php echo base64_encode($x);?></class_code>
				<read_A_4><?php echo base64_encode($read_A_4);?></read_A_4>
				<read_A_3><?php echo base64_encode($read_A_3);?></read_A_3>
				<read_A_2><?php echo base64_encode($read_A_2);?></read_A_2>
				<read_A_1><?php echo base64_encode($read_A_1);?></read_A_1>
				<read_B_4><?php echo base64_encode($read_B_4);?></read_B_4>
				<read_B_3><?php echo base64_encode($read_B_3);?></read_B_3>
				<read_B_2><?php echo base64_encode($read_B_2);?></read_B_2>
				<read_B_1><?php echo base64_encode($read_B_1);?></read_B_1>
				
				<write_A_4><?php echo base64_encode($write_A_4);?></write_A_4>
				<write_A_3><?php echo base64_encode($write_A_3);?></write_A_3>
				<write_A_2><?php echo base64_encode($write_A_2);?></write_A_2>
				<write_A_1><?php echo base64_encode($write_A_1);?></write_A_1>
				<write_B_4><?php echo base64_encode($write_B_4);?></write_B_4>
				<write_B_3><?php echo base64_encode($write_B_3);?></write_B_3>
				<write_B_2><?php echo base64_encode($write_B_2);?></write_B_2>
				<write_B_1><?php echo base64_encode($write_B_1);?></write_B_1>
		</item>
		<?php	
}
?>
</info>


