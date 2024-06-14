<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql_officename = "select * from system_office_name";
$dbquery_officename = mysqli_query($connect,$sql_officename);
$result_officename=mysqli_fetch_array($dbquery_officename);

$sql = "select * from person_main left join person_position on person_main.position_code=person_position.position_code where person_main.status='0' order by person_main.position_code,person_main.person_order";

$objQuery = mysqli_query($connect,$sql);
$num_rows=mysqli_num_rows($objQuery);
?>

<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<office_code><?php echo base64_encode($system_office_code);?></office_code>
	<countOfstudent><?php echo $num_rows;?></countOfstudent>
	<timestamp><?php echo date("Y-m-d H:i:s");?></timestamp>
	<office_name><?php echo base64_encode($result_officename['office_name']);?></office_name>
	<person>
		<?php
		while($obResult = mysqli_fetch_array($objQuery))
		{
		?>
			<item>
				<person_id><?php echo base64_encode($obResult["person_id"]);?></person_id>
				<prename><?php echo base64_encode($obResult["prename"]);?></prename>
				<name><?php echo base64_encode($obResult["name"]);?></name>
				<surname><?php echo base64_encode($obResult["surname"]);?></surname>
				<position_code><?php echo base64_encode($obResult["position_code"]);?></position_code>
				<position_name><?php echo base64_encode($obResult["position_name"]);?></position_name>
			</item>
		<?php
		}
		?>
	</person>
</info>
