<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="ALTER TABLE `student_main_main` ADD INDEX ( `person_id` ) ";
$query = mysqli_query($connect,$sql);

?>
