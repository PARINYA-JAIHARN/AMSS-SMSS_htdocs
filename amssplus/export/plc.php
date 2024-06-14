<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

?>
<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
<?php

$sql_object = "select * from  supervision_activity_rate where activity='1' and school_code='$_GET[school_code]' ";
$dbquery_object = mysqli_query($connect,$sql_object);
$result_object = mysqli_fetch_array($dbquery_object);
$plc=$result_object['activity_rate'];

?>
	<item>
			<plc><?php echo base64_encode($plc);?></plc>
	</item>
</info>



