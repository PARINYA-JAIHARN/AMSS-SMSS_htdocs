<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="CREATE TABLE IF NOT EXISTS `plan_proj_2` (
  `id` int(11) NOT NULL auto_increment,
  `budget_year` int(11) default NULL,
  `code_clus` tinyint(4) NOT NULL,
  `code_tegy` char(1) NOT NULL default '',
  `code_proj` char(4) NOT NULL default '',
  `budget_proj` double NOT NULL default '0',
  `budget_approve` double NOT NULL default '0',
  `name_proj` varchar(100) NOT NULL,
  `owner_proj` varchar(50) NOT NULL default '',
  `file_detail` varchar(100) NOT NULL default '',
  `dayrec` datetime NOT NULL default '0000-01-01 00:00:00',
  `eval_tegy` varchar(250) NOT NULL default '',
  `eval_activity` longtext NOT NULL,
  `eval_result` longtext NOT NULL,
  `eval_obstacle` longtext NOT NULL,
  `eval_particular` varchar(100) NOT NULL default '',
  `begin_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `allow_edit` char(1) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$query = mysqli_query($connect,$sql);

$sql="CREATE TABLE  IF NOT EXISTS `plan_acti_2` (
  `id` int(11) NOT NULL auto_increment,
  `budget_year` int(11) default NULL,
  `code_proj` char(4) NOT NULL default '',
  `code_acti` char(7) NOT NULL default '',
  `name_acti` varchar(100) NOT NULL,
  `rec_date` datetime NOT NULL default '0000-01-01 00:00:00',
  `begin_date` date NOT NULL,
  `finish_date` date NOT NULL,
`officer` VARCHAR(13) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$query = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `plan_acti_3` (
  `id` int(11) NOT NULL auto_increment,
  `budget_year` int(11) NOT NULL,
  `code_acti` varchar(7) NOT NULL,
  `budget_acti` double NOT NULL,
  `code_approve` varchar(6) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE `budget_withdraw` ADD `status` TINYINT NOT NULL DEFAULT '0' AFTER `withdraw_rec_date`";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE `budget_deega` ADD `status` TINYINT NOT NULL DEFAULT '0' AFTER `rec_date`";
$query = mysqli_query($connect,$sql);

?>
