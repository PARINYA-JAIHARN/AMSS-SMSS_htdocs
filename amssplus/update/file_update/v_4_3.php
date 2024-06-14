<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="ALTER TABLE  `meeting_main` ADD  `book_date_end` DATE NOT NULL AFTER  `book_date`";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `bets_item` ADD  `media_item` VARCHAR( 150 ) NOT NULL AFTER  `pic_item`";
$query = mysqli_query($connect,$sql);

?>
