<?php
$sql="ALTER TABLE  `budget_withdraw` ADD  `money_type` VARCHAR( 3 ) NOT NULL AFTER  `money` " ;
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `bets_item` ADD  `media_item` VARCHAR( 150 ) NOT NULL AFTER  `pic_item` " ;
$dbquery = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `meeting_main` ADD  `book_date_end` DATE NOT NULL AFTER  `book_date`" ;
$dbquery = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `delegate_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `start` date NOT NULL,
  `finish` date NOT NULL,
  `remark` varchar(250) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$dbquery = mysqli_query($connect,$sql);

?>
