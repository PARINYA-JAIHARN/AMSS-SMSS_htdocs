<?php
$sql="ALTER TABLE  `permission_main` ADD  `officer_comment` VARCHAR( 200 ) NOT NULL AFTER  `rec_date` ,
ADD  `officer_sign` VARCHAR( 13 ) NOT NULL AFTER  `officer_comment` ,
ADD  `officer_date` DATETIME  NULL AFTER  `officer_sign`";
$query = mysqli_query($connect,$sql);
?>
