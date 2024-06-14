<?php
$sql="ALTER TABLE `system_sync_code` ADD `amssplus_url` VARCHAR( 100 ) NOT NULL AFTER `sync_code`" ;
$dbquery = mysqli_query($connect,$sql);

?>
