<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="CREATE TABLE `bets_school_limit` (
  `id` int(11) NOT NULL auto_increment,
  `item_name` varchar(150) NOT NULL,
  `school_limit` int(11) NOT NULL default '0',
  `start` date NOT NULL default '2016-12-31',
  `stop` date NOT NULL default '2016-12-31',
  `active` tinyint(4) NOT NULL default '0',
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE `bets_test` ADD `level` TINYINT NOT NULL DEFAULT '0' AFTER `class_room`";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE `bets_test` ADD `level_active` TINYINT NOT NULL DEFAULT '0' AFTER `level`";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE `bets_test` ADD `other_subject` TINYINT NOT NULL DEFAULT '0' AFTER `level`";
$query = mysqli_query($connect,$sql);

$sql="LTER TABLE  `plan_acti` ADD INDEX (`code_acti`)";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `plan_acti` ADD INDEX (`code_approve`)";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `plan_acti_3` ADD INDEX (`code_acti`)";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `plan_acti_3` ADD INDEX (`code_approve`)";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `plan_acti_3` ADD INDEX (`budget_year`)";
$query = mysqli_query($connect,$sql);


?>
