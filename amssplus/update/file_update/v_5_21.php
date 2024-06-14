<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="ALTER TABLE `bets_permission` ADD `p4` TINYINT NOT NULL DEFAULT '0' AFTER `p3`";
$query = mysqli_query($connect,$sql);

?>
