--
-- Database: `amssplus4.2`
--

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `achievement_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_type` tinyint(4) NOT NULL,
  `test_class` tinyint(4) NOT NULL,
  `ed_year` int(11) NOT NULL,
  `school` varchar(12) NOT NULL,
  `thai` float NOT NULL DEFAULT '0',
  `math` float NOT NULL DEFAULT '0',
  `science` float NOT NULL DEFAULT '0',
  `social` float NOT NULL DEFAULT '0',
  `english` float NOT NULL DEFAULT '0',
  `health` float NOT NULL DEFAULT '0',
  `art` float NOT NULL DEFAULT '0',
  `vocation` float NOT NULL DEFAULT '0',
  `score_avg` float NOT NULL DEFAULT '0',
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `achievement_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `p2` tinyint(4) NOT NULL,
  `p3` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_certificate` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `register_number` int(11) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `signdate` date NOT NULL,
  `name_cer` varchar(150) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `subject2` varchar(250) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `sign_person` varchar(4) NOT NULL,
  `register_date` date NOT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `khet_print` tinyint(4) NOT NULL DEFAULT '0',
  `check_status` tinyint(4) NOT NULL DEFAULT '0',
  `quarantee` tinyint(4) NOT NULL DEFAULT '0',
  `quarantee_person` varchar(13) NOT NULL,
  `quarantee_date` date NOT NULL,
  PRIMARY KEY (`ms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_certificate_sch` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(15) NOT NULL,
  `year` int(11) NOT NULL,
  `register_number` int(11) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `signdate` date NOT NULL,
  `name_cer` varchar(150) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `register_date` date NOT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_cer_officer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_cer_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(13) NOT NULL,
  `name` varchar(200) NOT NULL,
  `position1` varchar(200) NOT NULL,
  `position2` varchar(200) NOT NULL,
  `sign_pic` varchar(150) NOT NULL,
  `sign_now` tinyint(4) NOT NULL DEFAULT '0',
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_command` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `register_number` int(11) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `signdate` date NOT NULL,
  `subject` varchar(150) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `register_date` date NOT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_des` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_command_sch` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(15) NOT NULL,
  `year` int(11) NOT NULL,
  `register_number` int(11) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `signdate` date NOT NULL,
  `subject` varchar(150) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `register_date` date NOT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_des` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_office_no` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_no` varchar(100) NOT NULL,
  `school_code` varchar(15) DEFAULT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `p2` tinyint(4) DEFAULT NULL,
  `school_code` varchar(15) DEFAULT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_receive` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `register_number` int(11) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `signdate` date NOT NULL,
  `book_from` varchar(200) NOT NULL,
  `book_to` varchar(200) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `operation` varchar(150) DEFAULT NULL,
  `workgroup` tinyint(4) NOT NULL DEFAULT '0',
  `record_type` tinyint(4) NOT NULL DEFAULT '0',
  `comment` varchar(100) DEFAULT NULL,
  `register_date` date NOT NULL,
  `ref_id` varchar(50) NOT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `book_link` tinyint(4) NOT NULL DEFAULT '0',
  `secret` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_receive_filebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(50) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_des` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_receive_filebook_sch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(15) NOT NULL,
  `ref_id` varchar(50) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_des` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_receive_sch` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(15) NOT NULL,
  `year` int(11) NOT NULL,
  `register_number` int(11) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `signdate` date NOT NULL,
  `book_from` varchar(200) NOT NULL,
  `book_to` varchar(200) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `operation` varchar(150) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `register_date` date NOT NULL,
  `ref_id` varchar(50) NOT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `book_link` tinyint(4) NOT NULL DEFAULT '0',
  `secret` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_send` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `register_number` int(11) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `signdate` date NOT NULL,
  `book_from` varchar(200) NOT NULL,
  `book_to` varchar(200) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `operation` varchar(150) DEFAULT NULL,
  `workgroup` tinyint(4) NOT NULL DEFAULT '0',
  `comment` varchar(100) DEFAULT NULL,
  `register_date` date NOT NULL,
  `ref_id` varchar(50) NOT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `secret` tinyint(4) NOT NULL DEFAULT '0',
  `office_type` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_send_filebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(50) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_des` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_send_filebook_sch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(50) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_des` varchar(100) NOT NULL,
  `school_code` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_send_sch` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(15) NOT NULL,
  `year` int(11) NOT NULL,
  `register_number` int(11) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `signdate` date NOT NULL,
  `book_from` varchar(200) NOT NULL,
  `book_to` varchar(200) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `operation` varchar(150) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `register_date` date NOT NULL,
  `ref_id` varchar(50) NOT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `secret` tinyint(4) NOT NULL DEFAULT '0',
  `office_type` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `bookregister_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `year_active` tinyint(4) NOT NULL DEFAULT '0',
  `start_receive_num` int(11) NOT NULL DEFAULT '1',
  `start_send_num` int(11) NOT NULL DEFAULT '1',
  `start_command_num` int(11) NOT NULL DEFAULT '1',
  `start_cer_num` int(11) NOT NULL DEFAULT '1',
  `school_code` varchar(15) DEFAULT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `book_filebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(50) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_des` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `book_group` (
  `grp_id` int(11) NOT NULL AUTO_INCREMENT,
  `grp_name` varchar(50) NOT NULL,
  PRIMARY KEY (`grp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `book_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grp_id` int(11) NOT NULL,
  `school_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `book_main` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_type` tinyint(4) NOT NULL,
  `sender` varchar(13) NOT NULL,
  `office` varchar(13) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `secret` tinyint(4) NOT NULL DEFAULT '0',
  `bookno` varchar(50) NOT NULL,
  `signdate` date NOT NULL,
  `subject` varchar(150) NOT NULL,
  `detail` text,
  `ref_id` varchar(50) NOT NULL,
  `send_date` datetime NOT NULL,
  `bookregis_link` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ms_id`),
  UNIQUE KEY `ref_id` (`ref_id`),
  KEY `ref_id_2` (`ref_id`),
  KEY `book_type` (`book_type`),
  KEY `office` (`office`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `book_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) DEFAULT NULL,
  `p2` varchar(15) DEFAULT NULL,
  `p3` varchar(15) DEFAULT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `book_sendto_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_level` tinyint(4) DEFAULT NULL,
  `ref_id` varchar(50) NOT NULL,
  `send_to` varchar(13) NOT NULL,
  `school` varchar(15) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `answer` tinyint(4) DEFAULT NULL,
  `answer_time` datetime DEFAULT NULL,
  `forward_from` varchar(15) DEFAULT NULL,
  `rec_forward_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_id` (`ref_id`),
  KEY `school` (`school`),
  KEY `send_to` (`send_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `budget_cancel_deega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `deega` int(11) NOT NULL DEFAULT '0',
  `ref` varchar(15) NOT NULL DEFAULT '',
  `comment` varchar(150) NOT NULL DEFAULT '',
  `officer` varchar(13) NOT NULL DEFAULT '',
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `budget_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `budget_category`
--

INSERT INTO `budget_category` (`id`, `category_id`, `category_name`) VALUES
(1, 1, 'เงินนอกงบประมาณ'),
(2, 2, 'เงินงบประมาณ'),
(3, 3, 'เงินรายได้แผ่นดิน');

CREATE TABLE IF NOT EXISTS `budget_deega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `deega_num` float DEFAULT NULL,
  `doc` varchar(20) NOT NULL,
  `receive_num` varchar(5) NOT NULL,
  `plan` varchar(5) NOT NULL,
  `project` varchar(20) NOT NULL,
  `activity` varchar(20) NOT NULL,
  `pay_group` int(4) DEFAULT NULL,
  `item` varchar(50) NOT NULL DEFAULT '',
  `withdraw` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `pay` double NOT NULL DEFAULT '0',
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `budget_key_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `code` varchar(14) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `budget_key_activity`
--

INSERT INTO `budget_key_activity` (`id`, `budget_year`, `code`, `name`) VALUES
(1, 2558, '200043400D3468', 'กิจกรรมการจัดการศึกษาประถมศึกษา');

CREATE TABLE IF NOT EXISTS `budget_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `doc` varchar(30) NOT NULL,
  `refer_wd_id` int(11) DEFAULT NULL,
  `refer_deega_id` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `item` varchar(100) NOT NULL,
  `receive_amount` double DEFAULT NULL,
  `pay_amount` double DEFAULT NULL,
  `payed_person` varchar(50) DEFAULT NULL,
  `change_amount` double DEFAULT NULL,
  `pay_group` int(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `rec_date` date NOT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `approve_date` date DEFAULT NULL,
  `approve` tinyint(4) DEFAULT NULL,
  `approve_name` varchar(13) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `check_number` varchar(30) DEFAULT NULL,
  `payee` varchar(50) DEFAULT NULL,
  `payer` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `budget_money_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) DEFAULT NULL,
  `document` varchar(30) NOT NULL DEFAULT '',
  `item` varchar(100) NOT NULL DEFAULT '',
  `pj_activity` varchar(20) NOT NULL DEFAULT '',
  `money` double NOT NULL DEFAULT '0',
  `pay_type` varchar(10) NOT NULL,
  `p_request` varchar(13) NOT NULL DEFAULT '',
  `officer` varchar(13) NOT NULL DEFAULT '',
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `budget_money_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `code` varchar(7) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `budget_money_source`
--

INSERT INTO `budget_money_source` (`id`, `budget_year`, `code`, `name`) VALUES
(1, 2558, '5710410', 'อุดหนุนทั่วไป');

CREATE TABLE IF NOT EXISTS `budget_pay_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_type_id` int(11) NOT NULL,
  `pay_group_id` tinyint(4) NOT NULL,
  `pay_type_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pay_type_id` (`pay_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `budget_pay_type`
--

INSERT INTO `budget_pay_type` (`id`, `pay_type_id`, `pay_group_id`, `pay_type_name`) VALUES
(1, 101, 1, 'เงินเดือน'),
(2, 102, 1, 'ค่าจ้างประจำ'),
(3, 103, 1, 'ค่าจ้างชั่วคราว'),
(4, 104, 1, 'ค่าตอบแทนพนักงานราชการ'),
(5, 201, 2, 'ค่าตอบแทน'),
(6, 202, 2, 'ค่าใช้สอย'),
(7, 203, 2, 'ค่าวัสดุ'),
(8, 204, 2, 'ค่าสาธารณูปโภค'),
(9, 301, 3, 'ค่าครุภัณฑ์'),
(10, 302, 3, 'ค่าที่ดินและสิ่งก่อสร้าง');

CREATE TABLE IF NOT EXISTS `budget_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) DEFAULT NULL,
  `p2` tinyint(4) DEFAULT NULL,
  `p3` tinyint(4) DEFAULT NULL,
  `p4` tinyint(4) DEFAULT NULL,
  `p5` tinyint(4) DEFAULT NULL,
  `p6` tinyint(4) DEFAULT NULL,
  `p7` tinyint(4) DEFAULT NULL,
  `p8` tinyint(4) DEFAULT NULL,
  `p9` tinyint(4) DEFAULT NULL,
  `p10` tinyint(4) DEFAULT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `budget_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `code` varchar(4) NOT NULL,
  `name` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `budget_plan`
--

INSERT INTO `budget_plan` (`id`, `budget_year`, `code`, `name`) VALUES
(1, 2558, '1', 'แผนขยายโอกาสและพัฒนาการศึกษา');

CREATE TABLE IF NOT EXISTS `budget_po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `deega_num` int(11) DEFAULT NULL,
  `doc` varchar(20) NOT NULL,
  `plan` varchar(5) NOT NULL,
  `project` varchar(20) NOT NULL,
  `activity` varchar(20) NOT NULL,
  `pay_group` int(4) DEFAULT NULL,
  `item` varchar(50) NOT NULL DEFAULT '',
  `withdraw` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `pay` double NOT NULL DEFAULT '0',
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `budget_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `code` varchar(16) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `budget_project`
--

INSERT INTO `budget_project` (`id`, `budget_year`, `code`, `name`) VALUES
(1, 2558, '2000404701000000', 'ผู้จบการศึกษาก่อนประถมศึกษา');

CREATE TABLE IF NOT EXISTS `budget_receive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `num` double NOT NULL DEFAULT '0',
  `book_number` varchar(30) NOT NULL DEFAULT '',
  `out_date` varchar(50) NOT NULL DEFAULT '',
  `book_ref` varchar(30) NOT NULL DEFAULT '',
  `plan` varchar(6) NOT NULL,
  `project` varchar(16) NOT NULL DEFAULT '',
  `activity` varchar(50) NOT NULL DEFAULT '',
  `activity2` varchar(250) NOT NULL,
  `m_source` varchar(7) NOT NULL DEFAULT '',
  `account` varchar(30) NOT NULL DEFAULT '',
  `m_pay` char(3) NOT NULL DEFAULT '',
  `item` varchar(250) NOT NULL DEFAULT '',
  `detail` varchar(250) NOT NULL DEFAULT '',
  `money` double NOT NULL DEFAULT '0',
  `file` varchar(120) NOT NULL,
  `rec_date` date DEFAULT NULL,
  `officer` varchar(13) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `budget_reserve_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `document` varchar(100) DEFAULT NULL,
  `refer_wd_id` int(11) DEFAULT NULL,
  `item` varchar(100) NOT NULL,
  `receive_amount` double NOT NULL DEFAULT '0',
  `pay_amount` double NOT NULL DEFAULT '0',
  `borrowed_person` varchar(50) NOT NULL,
  `pay_rec_date` date DEFAULT NULL,
  `receive_rec_date` date DEFAULT NULL,
  `receive_doc` varchar(50) NOT NULL,
  `rec_date` date DEFAULT NULL,
  `officer` varchar(13) NOT NULL,
  `approve_date` date DEFAULT NULL,
  `approve` tinyint(4) DEFAULT NULL,
  `approve_name` varchar(13) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `check_number` varchar(50) DEFAULT NULL,
  `payee` varchar(50) DEFAULT NULL,
  `payer` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `budget_return_deega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `document` varchar(20) NOT NULL,
  `receive_num` varchar(5) NOT NULL,
  `plan` varchar(5) NOT NULL,
  `project` varchar(20) NOT NULL,
  `activity` varchar(20) NOT NULL,
  `pay_group` int(4) NOT NULL,
  `item` varchar(50) NOT NULL DEFAULT '',
  `money` double NOT NULL DEFAULT '0',
  `officer` varchar(13) NOT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `budget_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `type_name` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `budget_type`
--

INSERT INTO `budget_type` (`id`, `budget_year`, `type_id`, `category_id`, `type_name`) VALUES
(1, 2558, 101, 1, 'เงินอาหารกลางวัน'),
(2, 2558, 301, 3, 'รายได้ค่าปรับอื่น');

CREATE TABLE IF NOT EXISTS `budget_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) DEFAULT NULL,
  `document` varchar(30) NOT NULL DEFAULT '',
  `item` varchar(100) NOT NULL DEFAULT '',
  `pj_activity` varchar(20) NOT NULL DEFAULT '',
  `money` double NOT NULL DEFAULT '0',
  `pay_type` varchar(10) NOT NULL,
  `p_request` varchar(50) NOT NULL,
  `borrow_status` tinyint(4) DEFAULT '0',
  `withdraw_status` tinyint(4) NOT NULL DEFAULT '0',
  `deega` float DEFAULT NULL,
  `officer` varchar(13) NOT NULL DEFAULT '',
  `rec_date` date NOT NULL,
  `borrowed_rec_date` date NOT NULL,
  `withdraw_rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `budget_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `year_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `budget_year` (`budget_year`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `budget_year`
--

INSERT INTO `budget_year` (`id`, `budget_year`, `year_active`) VALUES
(1, 2558, 1);

CREATE TABLE IF NOT EXISTS `cabinet_cabinet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cabinet_id` int(11) NOT NULL,
  `cabinet_type` tinyint(4) NOT NULL,
  `cabinet_name` varchar(100) NOT NULL,
  `workgroup` tinyint(4) DEFAULT NULL,
  `cabinet_size` double NOT NULL,
  `tray_size` double NOT NULL,
  `cabinet_person` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cabinet_id` (`cabinet_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `cabinet_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `tray_id` bigint(11) NOT NULL,
  `cabinet_id` int(11) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `cabinet_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `tray_id` bigint(11) NOT NULL,
  `cabinet_id` int(11) NOT NULL,
  `cabinet_type` tinyint(4) NOT NULL,
  `doc_subject` varchar(150) NOT NULL,
  `doc_size` double NOT NULL,
  `doc_name` varchar(100) NOT NULL,
  `doc_type` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `person_id` varchar(13) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `cabinet_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) DEFAULT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `cabinet_tray` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tray_id` bigint(20) NOT NULL,
  `cabinet_id` int(11) NOT NULL,
  `tray_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `car_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_code` int(11) NOT NULL,
  `car_type` int(11) NOT NULL,
  `car_number` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `pic` varchar(150) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `car_code` (`car_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `car_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `car_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  `car` int(11) NOT NULL,
  `place` varchar(200) NOT NULL,
  `because` varchar(200) NOT NULL,
  `car_start` date NOT NULL,
  `time_start` float DEFAULT NULL,
  `car_finish` date NOT NULL,
  `time_finish` float DEFAULT NULL,
  `day_total` int(11) DEFAULT NULL,
  `person_num` int(11) DEFAULT NULL,
  `control_person` varchar(100) DEFAULT NULL,
  `fuel` tinyint(4) NOT NULL,
  `project` varchar(100) DEFAULT NULL,
  `activity` varchar(100) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `self_driver` tinyint(4) DEFAULT NULL,
  `private_car` tinyint(4) DEFAULT NULL,
  `car_owner` varchar(100) DEFAULT NULL,
  `private_car_number` varchar(100) DEFAULT NULL,
  `private_driver` varchar(100) DEFAULT NULL,
  `driver` varchar(13) DEFAULT NULL,
  `officer_comment` varchar(150) DEFAULT NULL,
  `officer_sign` varchar(13) DEFAULT NULL,
  `officer_date` datetime DEFAULT NULL,
  `group_comment` varchar(150) DEFAULT NULL,
  `group_sign` varchar(13) DEFAULT NULL,
  `group_date` datetime DEFAULT NULL,
  `grant_comment` varchar(150) DEFAULT NULL,
  `commander_grant` tinyint(4) DEFAULT NULL,
  `commander_sign` varchar(13) DEFAULT NULL,
  `commander_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `car_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) DEFAULT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `car_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `rec_date` datetime NOT NULL,
  `car` int(11) NOT NULL,
  `place` varchar(200) NOT NULL,
  `because` varchar(200) DEFAULT NULL,
  `car_start` date DEFAULT NULL,
  `time_start` float DEFAULT NULL,
  `car_finish` date DEFAULT NULL,
  `time_finish` float DEFAULT NULL,
  `day_total` int(11) DEFAULT NULL,
  `person_num` int(11) DEFAULT NULL,
  `control_person` varchar(100) DEFAULT NULL,
  `start_mile` varchar(10) DEFAULT NULL,
  `finish_mile` varchar(10) NOT NULL,
  `fuel` int(11) NOT NULL,
  `detail` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `car_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `la_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `la_type` tinyint(4) NOT NULL,
  `write_at` varchar(100) DEFAULT NULL,
  `permission_start` date NOT NULL,
  `permission_finish` date NOT NULL,
  `permission_total` float NOT NULL,
  `because` varchar(200) NOT NULL,
  `cancel_la_start` date NOT NULL,
  `cancel_la_finish` date NOT NULL,
  `cancel_la_total` float NOT NULL,
  `no_comment` int(11) NOT NULL DEFAULT '0',
  `grant_p_selected` varchar(13) DEFAULT NULL,
  `rec_date` datetime NOT NULL,
  `officer_comment` varchar(200) DEFAULT NULL,
  `officer_sign` varchar(13) DEFAULT NULL,
  `officer_date` datetime DEFAULT NULL,
  `group_comment` varchar(100) DEFAULT NULL,
  `group_sign` varchar(13) DEFAULT NULL,
  `group_date` datetime DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  `commander_grant` tinyint(4) DEFAULT NULL,
  `commander_comment` varchar(100) DEFAULT NULL,
  `commander_sign` varchar(13) DEFAULT NULL,
  `grant_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `la_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `person_id` varchar(13) NOT NULL,
  `collect_day` float NOT NULL DEFAULT '0',
  `this_year_day` tinyint(4) NOT NULL DEFAULT '0',
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `la_main` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `la_type` tinyint(4) NOT NULL,
  `write_at` varchar(100) DEFAULT NULL,
  `because` varchar(250) DEFAULT NULL,
  `la_start` date NOT NULL,
  `la_finish` date NOT NULL,
  `la_total` float NOT NULL,
  `last_la_start` date DEFAULT NULL,
  `last_la_finish` date DEFAULT NULL,
  `last_la_total` float DEFAULT NULL,
  `contact` varchar(150) DEFAULT NULL,
  `contact_tel` varchar(20) DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `no_comment` tinyint(4) NOT NULL DEFAULT '0',
  `grant_p_selected` varchar(13) DEFAULT NULL,
  `sick_ago` float DEFAULT NULL,
  `sick_this` float DEFAULT NULL,
  `sick_total` float DEFAULT NULL,
  `privacy_ago` float DEFAULT NULL,
  `privacy_this` float DEFAULT NULL,
  `privacy_total` float DEFAULT NULL,
  `birth_ago` float DEFAULT NULL,
  `birth_this` float DEFAULT NULL,
  `birth_total` float DEFAULT NULL,
  `relax_ago` float DEFAULT NULL,
  `relax_this` float DEFAULT NULL,
  `relax_total` float DEFAULT NULL,
  `relax_collect` float DEFAULT NULL,
  `relax_this_year` float DEFAULT NULL,
  `job_person` varchar(13) DEFAULT NULL,
  `job_person_sign` tinyint(4) NOT NULL DEFAULT '0',
  `rec_date` datetime NOT NULL,
  `officer_comment` varchar(200) DEFAULT NULL,
  `officer_sign` varchar(13) DEFAULT NULL,
  `officer_date` datetime DEFAULT NULL,
  `group_comment` varchar(100) DEFAULT NULL,
  `group_sign` varchar(13) DEFAULT NULL,
  `group_date` datetime DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  `commander_grant` tinyint(4) DEFAULT NULL,
  `commander_comment` varchar(100) DEFAULT NULL,
  `commander_sign` varchar(13) DEFAULT NULL,
  `grant_date` datetime DEFAULT NULL,
  `school_code` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `la_permission` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `p2` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `la_person_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `comment_person` varchar(13) DEFAULT NULL,
  `grant_person` varchar(13) DEFAULT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `la_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `year_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `budget_year` (`budget_year`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `mail_filebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(50) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_des` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `mail_group` (
  `grp_id` int(11) NOT NULL AUTO_INCREMENT,
  `grp_name` varchar(50) NOT NULL,
  PRIMARY KEY (`grp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `mail_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grp_id` int(11) NOT NULL,
  `person_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `mail_main` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(13) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `detail` text,
  `ref_id` varchar(50) NOT NULL,
  `send_date` datetime NOT NULL,
  PRIMARY KEY (`ms_id`),
  KEY `ref_id` (`ref_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `mail_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `mail_sendto_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(50) NOT NULL,
  `send_to` varchar(13) NOT NULL,
  `answer` tinyint(4) NOT NULL DEFAULT '0',
  `answer_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_id` (`ref_id`),
  KEY `send_to` (`send_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `meeting_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room` tinyint(4) NOT NULL,
  `book_date` date NOT NULL,
  `book_date_end` date NOT NULL,
  `start_time` tinyint(4) NOT NULL,
  `finish_time` tinyint(4) NOT NULL,
  `objective` varchar(200) NOT NULL,
  `book_person` varchar(13) NOT NULL,
  `rec_date` datetime NOT NULL,
  `approve` int(11) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `person_num` int(11) DEFAULT NULL,
  `other` varchar(250) DEFAULT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `officer_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `meeting_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `meeting_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_code` tinyint(4) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `meeting_room` (`id`, `room_code`, `room_name`, `active`) VALUES
(1, 1, 'ห้องประชุม1', 1),
(2, 2, 'ห้องประชุม2', 1),
(3, 3, 'ห้องประชุม3', 0),
(4, 4, 'หอ้งประชุม4', 0),
(5, 5, 'ห้องประชุม5', 0),
(6, 6, 'ห้องประชุม6', 0),
(7, 7, 'ห้องประชุม7', 0),
(8, 8, 'ห้องประชุม8', 0),
(9, 9, 'ห้องประชุม9', 0),
(10, 10, 'ห้องประชุม10', 0);

CREATE TABLE IF NOT EXISTS `news_mainitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `mainitem` varchar(150) NOT NULL,
  `item_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `news_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_date` datetime NOT NULL,
  `news` varchar(250) NOT NULL,
  `file` varchar(150) NOT NULL,
  `section` int(11) NOT NULL,
  `mainitem_code` int(11) NOT NULL,
  `officer` varchar(13) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `news_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `news_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` tinyint(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mainitem_code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `permission_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `ref_id` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `permission_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `ref_id` varchar(50) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `place` varchar(150) NOT NULL,
  `vehicle` varchar(150) DEFAULT NULL,
  `document` varchar(150) DEFAULT NULL,
  `no_comment` tinyint(4) NOT NULL DEFAULT '0',
  `grant_person_selected` varchar(13) DEFAULT NULL,
  `rec_date` datetime NOT NULL,
  `officer_comment` varchar(200) NOT NULL,
  `officer_sign` varchar(13) NOT NULL,
  `officer_date` datetime DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `comment_person` varchar(13) DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  `grant_x` tinyint(4) DEFAULT NULL,
  `grant_comment` varchar(200) DEFAULT NULL,
  `grant_person` varchar(13) DEFAULT NULL,
  `grant_date` datetime DEFAULT NULL,
  `report` text,
  `report_date` datetime DEFAULT NULL,
  `report_read` varchar(13) NOT NULL,
  `report_read_date` datetime NOT NULL,
  `comment_need` tinyint(4) NOT NULL,
  `school_code` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_id` (`ref_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `permission_permission` (
`id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `p2` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `permission_person_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `comment_person` varchar(13) DEFAULT NULL,
  `grant_person` varchar(13) DEFAULT NULL,
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `person_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `prename` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `position_code` tinyint(4) NOT NULL,
  `pic` varchar(150) DEFAULT NULL,
  `department` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `person_order` tinyint(4) NOT NULL DEFAULT '0',
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `person_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `person_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_code` int(11) NOT NULL,
  `position_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `position_code` (`position_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `person_position` (`id`, `position_code`, `position_name`) VALUES
(1, 1, 'ผู้อำนวยการสำนักงานเขตพื้นที่การศึกษา'),
(2, 2, 'รองผู้อำนวยการสำนักงานเขตพื้นที่การศึกษา'),
(3, 3, 'ผู้อำนวยการกลุ่ม'),
(8, 5, 'นักจัดการงานทั่วไป'),
(9, 6, 'เจ้าพนักงานธุรการ'),
(10, 7, 'นักประชาสัมพันธ์'),
(11, 8, 'นักวิชาการเงินและบัญชี'),
(12, 9, 'เจ้าพนักงานการเงินและบัญชี'),
(13, 10, 'นักวิชาการพัสดุ'),
(14, 11, 'เจ้าหน้าที่พัสดุ'),
(15, 12, 'นักทรัพยากรบุคคล'),
(16, 13, 'นิติกร'),
(17, 14, 'นักวิเคราะห์นโยบายและแผน'),
(18, 15, 'นักวิชาการคอมพิวเตอร์'),
(19, 16, 'นักวิชาการศึกษา'),
(20, 17, 'นักวิชาการตรวจสอบภายใน'),
(21, 4, 'ศึกษานิเทศก์');

CREATE TABLE IF NOT EXISTS `person_sch_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `prename` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `position_code` tinyint(4) NOT NULL,
  `school_code` int(11) NOT NULL,
  `pic` varchar(150) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `person_order` tinyint(4) NOT NULL DEFAULT '0',
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  `other` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `person_sch_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `school_code` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `officer` varchar(13) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `person_sch_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_code` int(11) NOT NULL,
  `position_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `position_code` (`position_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `person_sch_position` (`id`, `position_code`, `position_name`) VALUES
(1, 1, 'ผู้อำนวยการโรงเรียน'),
(2, 2, 'รองผู้อำนวยการโรงเรียน'),
(4, 3, 'ครู');

CREATE TABLE `person_delegate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(11) NOT NULL,
  `person_id` varchar(13) NOT NULL,
  `start` date NOT NULL,
  `finish` date NOT NULL,
  `remark` varchar(250) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `plan_acti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) DEFAULT NULL,
  `code_clus` tinyint(4) NOT NULL,
  `code_proj` char(3) NOT NULL DEFAULT '',
  `code_acti` char(6) NOT NULL DEFAULT '',
  `code_approve` varchar(6) NOT NULL,
  `budget_acti` double NOT NULL DEFAULT '0',
  `budget_approve` double NOT NULL DEFAULT '0',
  `dayinput` date NOT NULL DEFAULT '0000-00-00',
  `daythai` char(13) NOT NULL DEFAULT '',
  `name_acti` varchar(100) NOT NULL,
  `owner_acti` char(50) NOT NULL DEFAULT '',
  `id_defalt` char(13) NOT NULL DEFAULT '',
  `dayseri` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `begin_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `stop` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `plan_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_person` char(13) NOT NULL DEFAULT '',
  `name_perm` char(40) NOT NULL DEFAULT '',
  `password_new` char(4) NOT NULL DEFAULT '',
  `password_old` char(4) NOT NULL DEFAULT '',
  `perm_view` char(1) NOT NULL DEFAULT '',
  `perm_read` char(1) NOT NULL DEFAULT '',
  `perm_add` char(1) NOT NULL DEFAULT '',
  `perm_edit` char(1) NOT NULL DEFAULT '',
  `perm_dele` char(1) NOT NULL DEFAULT '',
  `comment` char(1) NOT NULL DEFAULT '',
  `moderate` char(1) NOT NULL DEFAULT '',
  `admin` char(1) NOT NULL DEFAULT '',
  `id_defalt` char(13) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_person` (`id_person`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `plan_proj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) DEFAULT NULL,
  `code_clus` tinyint(4) NOT NULL,
  `code_tegy` char(1) NOT NULL DEFAULT '',
  `code_proj` char(3) NOT NULL DEFAULT '',
  `budget_proj` double NOT NULL DEFAULT '0',
  `budget_approve` double NOT NULL DEFAULT '0',
  `name_proj` varchar(100) NOT NULL,
  `owner_proj` varchar(50) NOT NULL DEFAULT '',
  `file_detail` varchar(100) NOT NULL DEFAULT '',
  `dayrec` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `eval_tegy` varchar(250) NOT NULL DEFAULT '',
  `eval_activity` longtext NOT NULL,
  `eval_result` longtext NOT NULL,
  `eval_obstacle` longtext NOT NULL,
  `eval_particular` varchar(100) NOT NULL DEFAULT '',
  `begin_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `allow_edit` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `plan_setgic_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `year_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `budget_year` (`budget_year`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `plan_standard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `sd_year` int(4) NOT NULL,
  `code_clus` tinyint(4) NOT NULL,
  `code_proj` char(3) NOT NULL,
  `code_acti` char(6) NOT NULL,
  `sd_level` char(1) NOT NULL,
  `sd_id` int(11) NOT NULL,
  `id_indicator` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `plan_stregic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tegic` int(3) NOT NULL,
  `budget_year` int(4) NOT NULL,
  `strategic` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `plan_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_year` int(11) NOT NULL,
  `year_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `budget_year` (`budget_year`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `plan_year` (`id`, `budget_year`, `year_active`) VALUES
(1, 2558, 1);

CREATE TABLE IF NOT EXISTS `student_main_edyear` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ed_year` int(11) NOT NULL,
  `year_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ed_year` (`ed_year`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `student_main_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ed_year` int(11) NOT NULL,
  `ref_id` varchar(20) NOT NULL,
  `school_code` varchar(15) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `person_id` varchar(13) NOT NULL,
  `prename` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `school_name` varchar(150) NOT NULL,
  `classlevel` tinyint(4) NOT NULL,
  `classroom` tinyint(4) NOT NULL DEFAULT '1',
  `disable` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `rec_date` date NOT NULL,
  `officer` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `student_main_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `school_code` varchar(11) DEFAULT NULL,
  `p1` tinyint(4) DEFAULT NULL,
  `p2` tinyint(4) DEFAULT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `system_menugroup` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `menugroup` tinyint(4) NOT NULL,
  `menugroup_desc` varchar(50) NOT NULL,
  `menugroup_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menugroup` (`menugroup`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `system_menugroup` (`id`, `menugroup`, `menugroup_desc`, `menugroup_order`) VALUES
(1, 1, 'บริหารงานทั่วไป', 2),
(2, 2, 'บริหารงบประมาณ', 4),
(3, 3, 'บริหารงานบุคคล', 6),
(4, 4, 'บริหารงานวิชาการ', 10),
(5, 5, 'แจ้งเตือน', 12);

CREATE TABLE IF NOT EXISTS `system_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(50) NOT NULL,
  `module_desc` varchar(100) NOT NULL,
  `workgroup` tinyint(4) DEFAULT NULL,
  `module_active` tinyint(4) DEFAULT NULL,
  `module_order` int(11) NOT NULL,
  `web_link` tinyint(4) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `where_work` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `module` (`module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `system_module` VALUES (1, 'budget', 'การเงินและบัญชี', 2, 1, 22, NULL, NULL, 0);
INSERT INTO `system_module` VALUES (32, 'person', 'ข้อมูลพื้นฐานครูและบุคลากร', 3, 1, 24, 0, '', 0);
INSERT INTO `system_module` VALUES (47, 'plan', 'การวางแผน', 2, 1, 20, NULL, NULL, 0);
INSERT INTO `system_module` VALUES (76, 'achievement', '﻿ผลสัมฤทธิ์ทางการเรียน', 4, 1, 27, 0, '', 0);
INSERT INTO `system_module` VALUES (61, 'work', 'การปฏิบัติราชการ', 1, 1, 12, 0, '', 1);
INSERT INTO `system_module` VALUES (62, 'permission', 'ขออนุญาตไปราชการ', 1, 1, 14, 0, '', 1);
INSERT INTO `system_module` VALUES (63, 'la', 'การลา', 1, 1, 16, 0, '', 1);
INSERT INTO `system_module` VALUES (66, 'meeting', '﻿จองห้องประชุม', 1, 1, 8, 0, '', 1);
INSERT INTO `system_module` VALUES (67, 'mail', '﻿ไปรษณีย์', 1, 1, 6, 0, '', 0);
INSERT INTO `system_module` VALUES (81, 'car', '﻿ยานพาหนะ', 1, 1, 10, 0, '', 1);
INSERT INTO `system_module` VALUES (80, 'cabinet', '﻿ตู้เอกสาร', 1, 1, 18, 0, '', 1);
INSERT INTO `system_module` VALUES (82, 'student_main', '﻿ข้อมูลนักเรียน', 4, 1, 26, 0, '', 0);
INSERT INTO `system_module` VALUES (86, 'book', '﻿รับส่งหนังสือราชการ', 1, 1, 4, 0, '', 0);
INSERT INTO `system_module` VALUES (89, 'bookregister', 'ทะเบียนหนังสือราชการ', 1, 1, 2, 0, '', 0);
INSERT INTO `system_module` VALUES (95, 'spacial_student', '﻿นักเรียนพิเศษ', 4, 1, 32, NULL, NULL, 0);
INSERT INTO `system_module` VALUES (96, 'bets', '﻿ระบบทดสอบการศึกษา', 4, 1, 28, NULL, NULL, 3);
INSERT INTO `system_module` VALUES (97, 'alert', '﻿แจ้งเตือน', 5, 1, 0, 0, '', 0);
INSERT INTO `system_module` VALUES (98, 'bookobec', 'รับส่งหนังสือราชการสพฐ', 1, 1, 0, NULL, NULL, 1);
INSERT INTO `system_module` VALUES (99, 'delegate', '﻿การรักษาราชการแทน', 1, 1, 0, NULL, NULL, 1);

CREATE TABLE IF NOT EXISTS `system_module_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `module` varchar(30) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `system_office_name` (
  `id` tinyint(4) NOT NULL,
  `office_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `system_office_name` (`id`, `office_name`) VALUES
(1, 'สำนักงานเขตพื้นที่การศึกษาxxxx');

CREATE TABLE IF NOT EXISTS `system_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(11) NOT NULL,
  `school_type` tinyint(4) NOT NULL DEFAULT '0',
  `school_name` varchar(50) NOT NULL,
  `school_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_code` (`school_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `system_school_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `system_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `username` varchar(30) NOT NULL,
  `userpass` varchar(150) NOT NULL,
  `smss_admin` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `school_user` tinyint(4) NOT NULL DEFAULT '0',
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `system_user` (`id`, `person_id`, `username`, `userpass`, `smss_admin`, `status`, `school_user`, `officer`, `rec_date`) VALUES
(1, '7777', 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 1, 1, 0, '', '0000-00-00');

CREATE TABLE IF NOT EXISTS `system_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_version` varchar(50) NOT NULL,
  `status1` int(11) DEFAULT NULL,
  `status2` int(11) DEFAULT NULL,
  `status3` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `system_version` (`id`, `system_version`, `status1`, `status2`, `status3`) VALUES
(1, '3.2', NULL, NULL, NULL);

CREATE TABLE IF NOT EXISTS `system_workgroup` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `workgroup` tinyint(4) NOT NULL,
  `workgroup_desc` varchar(50) NOT NULL,
  `workgroup_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workgroup` (`workgroup`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `system_workgroup` (`id`, `workgroup`, `workgroup_desc`, `workgroup_order`) VALUES
(1, 1, 'กลุ่มอำนวยการ', 2),
(2, 6, 'กลุ่มบริหารการเงินและสินทรัพย์', 12),
(3, 2, 'กลุ่มนโยบายและแผน', 4),
(4, 4, 'กลุ่มส่งเสริมการจัดการศึกษา', 8),
(5, 3, 'กลุ่มบริหารงานบุคคล', 6),
(6, 5, 'กลุ่มนิเทศฯ', 10),
(7, 7, 'กลุ่มส่งเสริมสถานศึกษาเอกชน', 14),
(8, 8, 'หน่วยตรวจสอบภายใน', 18),
(9, 9, 'ศูนย์ ICT', 19);

CREATE TABLE IF NOT EXISTS `work_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_date` date NOT NULL,
  `person_id` varchar(13) NOT NULL,
  `work` tinyint(4) NOT NULL DEFAULT '0',
  `comment` varchar(150) DEFAULT NULL,
  `rec_date` datetime NOT NULL,
  `officer` varchar(13) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `work_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `spacial_student_disabled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `school_code` varchar(15) NOT NULL,
  `disable_type` tinyint(4) NOT NULL,
  `disable_detail` text NOT NULL,
  `other` text NOT NULL,
  `pic` varchar(150) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `spacial_student_help1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `school_code` varchar(15) NOT NULL,
  `help_date` varchar(100) NOT NULL,
  `help_type` tinyint(4) NOT NULL,
  `purpose` varchar(250) NOT NULL,
  `operation` varchar(250) NOT NULL,
  `result` varchar(250) NOT NULL,
  `pic` varchar(150) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `spacial_student_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `school_code` varchar(11) DEFAULT NULL,
  `p1` tinyint(4) DEFAULT NULL,
  `p2` tinyint(4) DEFAULT NULL,
  `p3` tinyint(4) DEFAULT NULL,
  `class_level` varchar(2) DEFAULT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `bets_answer` (
  `id` int(11) NOT NULL auto_increment,
  `school` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `sch_test_id` int(11) NOT NULL,
  `person_id` varchar(13) NOT NULL,
  `item_id` int(11) NOT NULL,
  `answer` tinyint(4) NOT NULL,
  `score` float NOT NULL,
  `item_score` float NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `school` (`school`),
  KEY `sch_test_id` (`sch_test_id`),
  KEY `test_id` (`test_id`),
  KEY `person_id` (`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `bets_curriculum` (
  `id` int(11) NOT NULL auto_increment,
  `curriculum_code` int(4) NOT NULL,
  `curriculum_name` varchar(250) NOT NULL,
  `curriculum_status` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

INSERT INTO `bets_curriculum` VALUES (1, 2551, 'หลักสูตรการศึกษาขั้นพื้นฐาน พุทธศักราช 2551', 1);

CREATE TABLE `bets_group` (
  `id` int(11) NOT NULL auto_increment,
  `curriculum_code` varchar(4) NOT NULL,
  `group_code` varchar(7) NOT NULL,
  `group_name` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_code` (`group_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

INSERT INTO `bets_group` VALUES (1, '2551', '255101', 'ภาษาไทย');
INSERT INTO `bets_group` VALUES (2, '2551', '255102', 'คณิตศาสตร์');
INSERT INTO `bets_group` VALUES (3, '2551', '255103', 'วิทยาศาสตร์');
INSERT INTO `bets_group` VALUES (4, '2551', '255104', 'สังคมศึกษา ศาสนา และวัฒนธรรม');
INSERT INTO `bets_group` VALUES (5, '2551', '255105', 'สุขศึกษาและพลศึกษา');
INSERT INTO `bets_group` VALUES (6, '2551', '255106', 'ศิลปะ');
INSERT INTO `bets_group` VALUES (7, '2551', '255107', 'การงานอาชีพและเทคโนโลยี');
INSERT INTO `bets_group` VALUES (8, '2551', '255108', 'ภาษาต่างประเทศ');

CREATE TABLE `bets_indicator` (
  `id` int(11) NOT NULL auto_increment,
  `standard_code` varchar(10) NOT NULL,
  `class_code` tinyint(4) NOT NULL,
  `indicator_code` varchar(14) NOT NULL,
  `indicator_text` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `indicator_code` (`indicator_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2221 ;

INSERT INTO `bets_indicator` VALUES (55, '2551060101', 2, '25510601010802', '๘. สร้างสรรค์งานทัศนศิลป์เป็นรูปแบบงานโครงสร้างเคลื่อนไหว');
INSERT INTO `bets_indicator` VALUES (54, '2551060101', 2, '25510601010702', '๗. เลือกงานทัศนศิลป์ และบรรยายถึงสิ่งที่มองเห็นรวมถึงเนื้อหาเรื่องราว');
INSERT INTO `bets_indicator` VALUES (53, '2551060101', 2, '25510601010602', '๖. วาดภาพเพื่อถ่ายทอดเรื่องราวเกี่ยวกับครอบครัวของตนเองและเพื่อนบ้าน');
INSERT INTO `bets_indicator` VALUES (51, '2551060101', 2, '25510601010402', '๔. มีทักษะพื้นฐานในการใช้วัสดุ อุปกรณ์สร้างงานทัศนศิลป์ ๓ มิติ');
INSERT INTO `bets_indicator` VALUES (52, '2551060101', 2, '25510601010502', '๕. สร้างภาพปะติดโดยการตัดหรือฉีกกระดาษ');
INSERT INTO `bets_indicator` VALUES (50, '2551060101', 2, '25510601010302', '๓. สร้างงานทัศนศิลป์ต่าง ๆโดยใช้ทัศนธาตุที่เน้นเส้นรูปร่าง');
INSERT INTO `bets_indicator` VALUES (49, '2551060101', 2, '25510601010202', '๒. ระบุทัศนธาตุที่อยู่ในสิ่งแวดล้อมและงานทัศนศิลป์ โดยเน้นเรื่องเส้น สีรูปร่าง และรูปทรง');
INSERT INTO `bets_indicator` VALUES (48, '2551060101', 2, '25510601010102', '๑. บรรยายรูปร่าง รูปทรงที่พบในธรรมชาติและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (47, '2551060302', 1, '25510603020201', '๒. บอกสิ่งที่ตนเองชอบในการแสดงนาฏศิลป์ไทย');
INSERT INTO `bets_indicator` VALUES (45, '2551060301', 1, '25510603010301', '๓. บอกสิ่งที่ตนเองชอบ จากการดูหรือร่วมการแสดง');
INSERT INTO `bets_indicator` VALUES (44, '2551060301', 1, '25510603010201', '๒. แสดงท่าทางง่าย ๆเพื่อสื่อความหมายแทนคำพูด');
INSERT INTO `bets_indicator` VALUES (41, '2551060202', 1, '25510602020101', '๑. เล่าถึงเพลงในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (39, '2551060201', 1, '25510602010401', '๔. มีส่วนร่วมใน กิจกรรมดนตรีอย่างสนุกสนาน');
INSERT INTO `bets_indicator` VALUES (38, '2551060201', 1, '25510602010301', '๓. ท่องบทกลอนร้องเพลงง่าย ๆ');

INSERT INTO `bets_indicator` VALUES (37, '2551060201', 1, '25510602010201', '๒. บอกลักษณะของเสียงดัง-เบาและความช้า- เร็วของจังหวะ');
INSERT INTO `bets_indicator` VALUES (35, '2551060102', 1, '25510601020101', '๑. ระบุงานทัศนศิลป์ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (36, '2551060201', 1, '25510602010101', '๑. รู้ว่าสิ่งต่าง ๆสามารถก่อกำเนิดเสียงที่แตกต่างกัน');
INSERT INTO `bets_indicator` VALUES (34, '2551060101', 1, '25510601010501', '๕. วาดภาพระบายสีภาพธรรมชาติตามความรู้สึกของตนเอง');
INSERT INTO `bets_indicator` VALUES (33, '2551060101', 1, '25510601010401', '๔. สร้างงานทัศนศิลป์โดยการทดลองใช้สีด้วยเทคนิคง่าย ๆ');
INSERT INTO `bets_indicator` VALUES (31, '2551060101', 1, '25510601010201', '๒ บอกความรู้สึกที่มีต่อธรรมชาติและสิ่งแวดล้อมรอบตัว');
INSERT INTO `bets_indicator` VALUES (46, '2551060302', 1, '25510603020101', '๑. ระบุ และเล่นการละเล่นของเด็กไทย');
INSERT INTO `bets_indicator` VALUES (43, '2551060301', 1, '25510603010101', '๑. เลียนแบบการเคลื่อนไหว');
INSERT INTO `bets_indicator` VALUES (42, '2551060202', 1, '25510602020201', '๒. ระบุสิ่งที่ชื่นชอบในดนตรีท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (40, '2551060201', 1, '25510602010501', '๕. บอกความเกี่ยวข้องของเพลงที่ใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (32, '2551060101', 1, '25510601010301', '๓. มีทักษะพื้นฐานในการใช้วัสดุ อุปกรณ์สร้างงานทัศนศิลป์');
INSERT INTO `bets_indicator` VALUES (30, '2551060101', 1, '25510601010101', '๑. อภิปรายเกี่ยวกับรูปร่างลักษณะ และขนาดของสิ่งต่าง ๆ รอบตัวในธรรมชาติและสิ่งที่มนุษย์สร้างขึ้น');
INSERT INTO `bets_indicator` VALUES (56, '2551060102', 2, '25510601020102', '๑. บอกความสำคัญของงานทัศนศิลป์ที่พบเห็นในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (57, '2551060102', 2, '25510601020202', '๒. อภิปรายเกี่ยวกับงานทัศนศิลป์ประเภทต่าง ๆในท้องถิ่นโดยเน้นถึงวิธีการสร้างงานและวัสดุอุปกรณ์ ที่ใช้');
INSERT INTO `bets_indicator` VALUES (58, '2551060201', 2, '25510602010102', '๑. จำแนกแหล่งกำเนิดของเสียงที่ได้ยิน');
INSERT INTO `bets_indicator` VALUES (59, '2551060201', 2, '25510602010202', '๒. จำแนกคุณสมบัติของเสียง สูง- ต่ำ ,ดัง-เบา, ยาว-สั้นของดนตรี');
INSERT INTO `bets_indicator` VALUES (60, '2551060201', 2, '25510602010302', '๓. เคาะจังหวะหรือเคลื่อนไหวร่างกายให้สอดคล้องกับเนื้อหาของเพลง');
INSERT INTO `bets_indicator` VALUES (61, '2551060201', 2, '25510602010402', '๔. ร้องเพลงง่าย ๆ ที่เหมาะสมกับวัย');
INSERT INTO `bets_indicator` VALUES (62, '2551060201', 2, '25510602010502', '๕. บอกความหมายและความสำคัญของเพลงที่ได้ยิน');
INSERT INTO `bets_indicator` VALUES (63, '2551060202', 2, '25510602020102', '๑. บอกความสัมพันธ์ของเสียงร้องเสียงเครื่องดนตรีในเพลงท้องถิ่นโดยใช้คำง่าย ๆ');
INSERT INTO `bets_indicator` VALUES (64, '2551060202', 2, '25510602020202', '๒. แสดงและเข้าร่วมกิจกรรมทางดนตรีในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (65, '2551060301', 2, '25510603010102', '๑. เคลื่อนไหวขณะอยู่กับที่และเคลื่อนที่');
INSERT INTO `bets_indicator` VALUES (66, '2551060301', 2, '25510603010202', '๒. แสดงการเคลื่อนไหวที่สะท้อนอารมณ์ของตนเองอย่างอิสระ');
INSERT INTO `bets_indicator` VALUES (67, '2551060301', 2, '25510603010302', '๓. แสดงท่าทางเพื่อสื่อความหมายแทนคำพูด');
INSERT INTO `bets_indicator` VALUES (68, '2551060301', 2, '25510603010402', '๔. แสดงท่าทางประกอบจังหวะอย่างสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (69, '2551060301', 2, '25510603010502', '๕. ระบุมารยาทในการชมการแสดง');
INSERT INTO `bets_indicator` VALUES (70, '2551060302', 2, '25510603020102', '๑. ระบุและเล่นการละเล่นพื้นบ้าน');
INSERT INTO `bets_indicator` VALUES (71, '2551060302', 2, '25510603020202', '๒. เชื่อมโยงสิ่งที่พบเห็นในการละเล่นพื้นบ้านกับสิ่งที่พบเห็นในการดำรงชีวิตของคนไทย');
INSERT INTO `bets_indicator` VALUES (72, '2551060302', 2, '25510603020302', '๓. ระบุสิ่งที่ชื่นชอบและภาคภูมิใจในการละเล่นพื้นบ้าน');
INSERT INTO `bets_indicator` VALUES (73, '2551060101', 3, '25510601010103', '๑.บรรยายรูปร่าง รูปทรงในธรรมชาติสิ่งแวดล้อมและงานทัศนศิลป์');
INSERT INTO `bets_indicator` VALUES (74, '2551060101', 3, '25510601010203', '๒. ระบุวัสดุอุปกรณ์ที่ใช้สร้างผลงานเมื่อชมงานทัศนศิลป์');
INSERT INTO `bets_indicator` VALUES (75, '2551060101', 3, '25510601010303', '๓. จำแนกทัศนธาตุของสิ่งต่าง ๆในธรรมชาติสิ่งแวดล้อมและงานทัศนศิลป์โดยเน้นเรื่องเส้น สี รูปร่างรูปทรง และพื้นผิว');
INSERT INTO `bets_indicator` VALUES (76, '2551060101', 3, '25510601010403', '๔. วาดภาพระบายสีสิ่งของรอบตัว');
INSERT INTO `bets_indicator` VALUES (77, '2551060101', 3, '25510601010503', '๕. มีทักษะพื้นฐาน ในการใช้วัสดุ อุปกรณ์สร้างสรรค์งานปั้น');
INSERT INTO `bets_indicator` VALUES (78, '2551060101', 3, '25510601010603', '๖. วาดภาพถ่ายทอดความคิดความรู้สึกจากเหตุการณ์ชีวิตจริง โดยใช้เส้นรูปร่าง รูปทรงสีและพื้นผิว');
INSERT INTO `bets_indicator` VALUES (79, '2551060101', 3, '25510601010703', '๗. บรรยายเหตุผลและวิธีการในการสร้างงานทัศนศิลป์โดยเน้นถึงเทคนิคและวัสดุอุปกรณ์');
INSERT INTO `bets_indicator` VALUES (80, '2551060101', 3, '25510601010803', '๘. ระบุสิ่งที่ชื่นชมและสิ่งที่ควรปรับปรุงในงานทัศนศิลป์ของตนเอง');
INSERT INTO `bets_indicator` VALUES (81, '2551060101', 3, '25510601010903', '๙. ระบุ และจัดกลุ่มของภาพตามทัศนธาตุที่เน้นในงานทัศนศิลป์นั้น ๆ');
INSERT INTO `bets_indicator` VALUES (82, '2551060101', 3, '25510601011003', '๑๐. บรรยายลักษณะรูปร่างรูปทรง ในงานการออกแบบสิ่งต่าง ๆ ที่มีในบ้านและโรงเรียน');
INSERT INTO `bets_indicator` VALUES (83, '2551060102', 3, '25510601020103', '๑. เล่าถึงที่มาของงานทัศนศิลป์ในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (85, '2551060102', 3, '25510601020203', '๒. อธิบายเกี่ยวกับวัสดุอุปกรณ์และวิธีการสร้างงานทัศนศิลป์ในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (86, '2551060201', 3, '25510602010103', '๑. ระบุรูปร่างลักษณะของเครื่องดนตรีที่เห็นและได้ยิน ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (87, '2551060201', 3, '25510602010203', '๒. ใช้รูปภาพหรือสัญลักษณ์แทนเสียงและจังหวะเคาะ');
INSERT INTO `bets_indicator` VALUES (88, '2551060201', 3, '25510602010303', '๓. บอกบทบาทหน้าที่ของเพลงที่ได้ยิน');
INSERT INTO `bets_indicator` VALUES (89, '2551060201', 3, '25510602010403', '๔. ขับร้องและบรรเลงดนตรีง่าย ๆ');
INSERT INTO `bets_indicator` VALUES (90, '2551060201', 3, '25510602010503', '๕. เคลื่อนไหวท่าทางสอดคล้องกับอารมณ์ของเพลงที่ฟัง');
INSERT INTO `bets_indicator` VALUES (91, '2551060201', 3, '25510602010603', '๖. แสดงความคิดเห็นเกี่ยวกับเสียงดนตรีเสียงขับร้องของตนเองและผู้อื่น');
INSERT INTO `bets_indicator` VALUES (92, '2551060201', 3, '25510602010703', '๗. นำดนตรีไปใช้ในชีวิตประจำวันหรือโอกาสต่าง ๆ ได้อย่างหมาะสม');
INSERT INTO `bets_indicator` VALUES (93, '2551060202', 3, '25510602020103', '๑. ระบุลักษณะเด่นและเอกลักษณ์ของดนตรีในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (94, '2551060202', 3, '25510602020203', '๒. ระบุความสำคัญและประโยชน์ของดนตรีต่อการดำเนินชีวิตของคนในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (95, '2551060301', 3, '25510603010103', '๑. สร้างสรรค์การเคลื่อนไหวในรูปแบบต่าง ๆในสถานการณ์สั้น ๆ');
INSERT INTO `bets_indicator` VALUES (96, '2551060301', 3, '25510603010203', '๒. แสดงท่าทางประกอบเพลงตามรูปแบบนาฏศิลป์');
INSERT INTO `bets_indicator` VALUES (97, '2551060301', 3, '25510603010303', '๓. เปรียบเทียบบทบาทหน้าที่ของผู้แสดงและผู้ชม');
INSERT INTO `bets_indicator` VALUES (98, '2551060301', 3, '25510603010403', '๔. มีส่วนร่วมในกิจกรรมการแสดงที่เหมาะสมกับวัย');
INSERT INTO `bets_indicator` VALUES (99, '2551060301', 3, '25510603010503', '๕. บอกประโยชน์ของการแสดงนาฏศิลป์ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (100, '2551060302', 3, '25510603020103', '๑. เล่าการแสดงนาฏศิลป์ที่เคยเห็นในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (101, '2551060302', 3, '25510603020203', '๒. ระบุสิ่งที่เป็นลักษณะเด่นและเอกลักษณ์ของการแสดงนาฏศิลป์');
INSERT INTO `bets_indicator` VALUES (102, '2551060302', 3, '25510603020303', '๓. อธิบายความสำคัญของการแสดงนาฏศิลป์');
INSERT INTO `bets_indicator` VALUES (103, '2551060101', 4, '25510601010104', '๑. เปรียบเทียบรูปลักษณะของรูปร่าง รูปทรงในธรรมชาติสิ่งแวดล้อมและงานทัศนศิลป์');
INSERT INTO `bets_indicator` VALUES (104, '2551060101', 4, '25510601010204', '๒. อภิปรายเกี่ยวกับอิทธิพลของสีวรรณะอุ่นและสีวรรณะเย็น ที่มีต่ออารมณ์ขอที่มีต่ออารมณ์ของมนุษย์');
INSERT INTO `bets_indicator` VALUES (105, '2551060101', 4, '25510601010304', '๓. จำแนกทัศนธาตุของสิ่งต่าง ๆในธรรมชาติสิ่งแวดล้อมและงานทัศนศิลป์โดยเน้นเรื่องเส้น สี รูปร่างรูปทรง พื้นผิวและพื้นที่ว่าง');
INSERT INTO `bets_indicator` VALUES (106, '2551060101', 4, '25510601010404', '๔. มีทักษะพื้นฐานในการใช้วัสดุ อุปกรณ์สร้างสรรค์งานพิมพ์ภาพ');
INSERT INTO `bets_indicator` VALUES (107, '2551060101', 4, '25510601010504', '๕. มีทักษะพื้นฐานในการใช้วัสดุ อุปกรณ์สร้างสรรค์งานวาดภาพระบายสี');
INSERT INTO `bets_indicator` VALUES (108, '2551060101', 4, '25510601010604', '๖. บรรยายลักษณะของภาพโดยเน้นเรื่องการจัดระยะ ความลึกน้ำหนักและแสงเงาในภาพ');
INSERT INTO `bets_indicator` VALUES (109, '2551060101', 4, '25510601010704', '๗. วาดภาพระบายสี โดยใช้สีวรรณะอุ่นและสีวรรณะเย็นถ่ายทอดความรู้สึกและจินตนาการ');
INSERT INTO `bets_indicator` VALUES (110, '2551060101', 4, '25510601010804', '๘. เปรียบเทียบความคิดความรู้สึกที่ถ่ายทอดผ่านงานทัศนศิลป์ของตนเองและบุคคลอื่น');
INSERT INTO `bets_indicator` VALUES (111, '2551060101', 4, '25510601010904', '๙. เลือกใช้วรรณะสีเพื่อถ่ายทอดอารมณ์ความรู้สึกในการสร้างงานทัศนศิลป์');
INSERT INTO `bets_indicator` VALUES (112, '2551060102', 4, '25510601020104', '๑. ระบุ และอภิปรายเกี่ยวกับงานทัศนศิลป์ในเหตุการณ์ และงานเฉลิมฉลองของวัฒนธรรมในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (113, '2551060102', 4, '25510601020204', '๒. บรรยายเกี่ยวกับงานทัศนศิลป์ที่มาจากวัฒนธรรมต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (114, '2551060201', 4, '25510602010104', '๑. บอกประโยคเพลงอย่างง่าย');
INSERT INTO `bets_indicator` VALUES (115, '2551060201', 4, '25510602010204', '๒. จำแนกประเภทของเครื่องดนตรีที่ใช้ในเพลงที่ฟัง');
INSERT INTO `bets_indicator` VALUES (116, '2551060201', 4, '25510602010304', '๓. ระบุทิศทางการเคลื่อนที่ขึ้น – ลง ง่าย ๆของทำนองรูปแบบ จังหวะและความเร็วของจังหวะในเพลงที่ฟัง');
INSERT INTO `bets_indicator` VALUES (117, '2551060201', 4, '25510602010404', '๔. อ่าน เขียนโน้ตดนตรีไทยและสากล');
INSERT INTO `bets_indicator` VALUES (118, '2551060201', 4, '25510602010504', '๕. ร้องเพลงโดยใช้ช่วงเสียงที่เหมาะสมกับตนเอง');
INSERT INTO `bets_indicator` VALUES (119, '2551060201', 4, '25510602010604', '๖. ใช้และเก็บเครื่องดนตรีอย่างถูกต้องและปลอดภัย');
INSERT INTO `bets_indicator` VALUES (120, '2551060201', 4, '25510602010704', '๗. ระบุว่าดนตรีสามารถใช้ในการสื่อเรื่องราว');
INSERT INTO `bets_indicator` VALUES (121, '2551060202', 4, '25510602020104', '๑. บอกแหล่งที่มาและความสัมพันธ์ของวิถีชีวิตไทยที่สะท้อนในดนตรีและเพลงท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (122, '2551060202', 4, '25510602020204', '๒. ระบุความสำคัญในการอนุรักษ์ส่งเสริมวัฒนธรรมทางดนตรี');
INSERT INTO `bets_indicator` VALUES (123, '2551060301', 4, '25510603010104', '๑.ระบุทักษะพื้นฐานทางนาฏศิลป์และการละครที่ใช้สื่อความหมายและอารมณ์');
INSERT INTO `bets_indicator` VALUES (124, '2551060301', 4, '25510603010204', '๒. ใช้ภาษาท่าและนาฏยศัพท์หรือศัพท์ทางการละครง่าย ๆในการถ่ายทอดเรื่องราว');
INSERT INTO `bets_indicator` VALUES (125, '2551060301', 4, '25510603010304', '๓. แสดง การเคลื่อนไหวในจังหวะต่าง ๆตามความคิดของตน');
INSERT INTO `bets_indicator` VALUES (126, '2551060301', 4, '25510603010404', '๔. แสดงนาฏศิลป์เป็นคู่และหมู่');
INSERT INTO `bets_indicator` VALUES (127, '2551060301', 4, '25510603010504', '๕. เล่าสิ่งที่ชื่นชอบในการแสดง โดยเน้นจุดสำคัญของเรื่องและลักษณะเด่นของตัวละคร');
INSERT INTO `bets_indicator` VALUES (128, '2551060302', 4, '25510603020104', '๑. อธิบายประวัติความเป็นมาของนาฏศิลป์ หรือชุดการแสดงอย่างง่าย ๆ');
INSERT INTO `bets_indicator` VALUES (129, '2551060302', 4, '25510603020204', '๒. เปรียบเทียบการแสดงนาฏศิลป์กับการแสดงที่มาจากวัฒนธรรมอื่น');
INSERT INTO `bets_indicator` VALUES (130, '2551060302', 4, '25510603020304', '๓. อธิบายความสำคัญของการแสดงความเคารพในการเรียนและการแสดงนาฏศิลป์');
INSERT INTO `bets_indicator` VALUES (131, '2551060302', 4, '25510603020404', '๔. ระบุเหตุผลที่ควรรักษาและสืบทอดการแสดงนาฏศิลป์');
INSERT INTO `bets_indicator` VALUES (132, '2551060101', 5, '25510601010105', '๑. บรรยายเกี่ยวกับจังหวะตำแหน่งของสิ่งต่าง ๆที่ปรากฏในสิ่งแวดล้อมและงานทัศนศิลป์');
INSERT INTO `bets_indicator` VALUES (133, '2551060101', 5, '25510601010205', '๒. เปรียบเทียบความแตกต่างระหว่างงานทัศนศิลป์ที่สร้างสรรค์ด้วยวัสดุอุปกรณ์และวิธีการที่ต่างกัน');
INSERT INTO `bets_indicator` VALUES (134, '2551060101', 5, '25510601010305', '๓. วาดภาพโดยใช้เทคนิคของแสงเงาน้ำหนัก และวรรณะสี');
INSERT INTO `bets_indicator` VALUES (135, '2551060101', 5, '25510601010405', '๔. สร้างสรรค์งานปั้นจากดินน้ำมันหรือดินเหนียวโดยเน้นการถ่ายทอดจินตนาการ');
INSERT INTO `bets_indicator` VALUES (136, '2551060101', 5, '25510601010505', '๕. สร้างสรรค์งานพิมพ์ภาพโดยเน้นการจัดวางตำแหน่งของสิ่งต่าง ๆในภาพ');
INSERT INTO `bets_indicator` VALUES (137, '2551060101', 5, '25510601010605', '๖. ระบุปัญหาในการจัดองค์ประกอบศิลป์ และการสื่อความหมายในงานทัศนศิลป์ของตนเอง และบอกวิธีการปรับปรุงงานให้ดีขึ้น');
INSERT INTO `bets_indicator` VALUES (138, '2551060101', 5, '25510601010705', '๗. บรรยายประโยชน์และคุณค่าของงานทัศนศิลป์ที่มีผลต่อชีวิตของคนในสังคม');
INSERT INTO `bets_indicator` VALUES (139, '2551060102', 5, '25510601020105', '๑. ระบุและบรรยายเกี่ยวกับลักษณะรูปแบบของงานทัศนศิลป์ในแหล่งเรียนรู้หรือนิทรรศการศิลปะ');
INSERT INTO `bets_indicator` VALUES (140, '2551060102', 5, '25510601020205', '๒. อภิปรายเกี่ยวกับงานทัศนศิลป์ที่สะท้อนวัฒนธรรมและภูมิปัญญาในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (141, '2551060201', 5, '25510602010105', '๑. ระบุองค์ประกอบดนตรีในเพลงที่ใช้ในการสื่ออารมณ์');
INSERT INTO `bets_indicator` VALUES (142, '2551060201', 5, '25510602010205', '๒. จำแนกลักษณะของเสียงขับร้องและเครื่องดนตรีที่อยู่ในวงดนตรีประเภทต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (143, '2551060201', 5, '25510602010305', '๓. อ่าน เขียนโน้ตดนตรีไทยและสากล ๕ ระดับเสียง');
INSERT INTO `bets_indicator` VALUES (144, '2551060201', 5, '25510602010405', '๔. ใช้เครื่องดนตรีทำจังหวะและทำนอง');
INSERT INTO `bets_indicator` VALUES (145, '2551060201', 5, '25510602010505', '๕. ร้องเพลงไทยหรือเพลงสากลหรือเพลงไทยสากลที่เหมาะสมกับวัย');
INSERT INTO `bets_indicator` VALUES (146, '2551060201', 5, '25510602010605', '๖. ด้นสดง่าย ๆโดยใช้ประโยคเพลงแบบถามตอบ');
INSERT INTO `bets_indicator` VALUES (147, '2551060201', 5, '25510602010705', '๗. ใช้ดนตรีร่วมกับกิจกรรมในการแสดงออกตามจินตนาการ');
INSERT INTO `bets_indicator` VALUES (148, '2551060202', 5, '25510602020105', '๑. อธิบายความสัมพันธ์ระหว่างดนตรีกับประเพณีในวัฒนธรรมต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (149, '2551060202', 5, '25510602020205', '๒. อธิบายคุณค่าของดนตรีที่มาจากวัฒนธรรมที่ต่างกัน');
INSERT INTO `bets_indicator` VALUES (150, '2551060301', 5, '25510603010105', '๑. บรรยายองค์ประกอบนาฏศิลป์');
INSERT INTO `bets_indicator` VALUES (151, '2551060301', 5, '25510603010205', '๒. แสดงท่าทางประกอบเพลงหรือเรื่องราวตามความคิดของตน');
INSERT INTO `bets_indicator` VALUES (152, '2551060301', 5, '25510603010305', '๓. แสดงนาฏศิลป์โดยเน้นการใช้ภาษาท่าและนาฏยศัพท์ในการสื่อความหมายและการแสดงออก');
INSERT INTO `bets_indicator` VALUES (153, '2551060301', 5, '25510603010405', '๔. มีส่วนร่วมในกลุ่มกับการเขียนเค้าโครงเรื่องหรือบทละครสั้น ๆ');
INSERT INTO `bets_indicator` VALUES (154, '2551060301', 5, '25510603010505', '๕. เปรียบเทียบการแสดงนาฏศิลป์ชุดต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (155, '2551060301', 5, '25510603010605', '๖. บอกประโยชน์ที่ได้รับจากการชมการแสดง');
INSERT INTO `bets_indicator` VALUES (156, '2551060302', 5, '25510603020105', '๑. เปรียบเทียบการแสดงประเภทต่าง ๆของไทยในแต่ละท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (157, '2551060302', 5, '25510603020205', '๒. ระบุหรือแสดงนาฏศิลป์นาฏศิลป์พื้นบ้านที่สะท้อนถึงวัฒนธรรมและประเพณี');
INSERT INTO `bets_indicator` VALUES (158, '2551060101', 6, '25510601010106', '๑. ระบุสีคู่ตรงข้าม และอภิปรายเกี่ยวกับการใช้สีคู่ตรงข้ามในการถ่ายทอดความคิดและอารมณ์');
INSERT INTO `bets_indicator` VALUES (159, '2551060101', 6, '25510601010206', '๒. อธิบายหลักการจัดขนาดสัดส่วนความสมดุลในการสร้างงานทัศนศิลป์');
INSERT INTO `bets_indicator` VALUES (160, '2551060101', 6, '25510601010306', '๓. สร้างสรรค์งานทัศนศิลป์จากรูปแบบ ๒มิติ เป็น ๓ มิติโดยใช้หลักการของแสงเงาและน้ำหนัก');
INSERT INTO `bets_indicator` VALUES (161, '2551060101', 6, '25510601010406', '๔. สร้างสรรค์งานปั้นโดยใช้หลักการเพิ่มและลด');
INSERT INTO `bets_indicator` VALUES (162, '2551060101', 6, '25510601010506', '๕. สร้างสรรค์งานทัศนศิลป์โดยใช้หลักการของรูปและพื้นที่ว่าง');
INSERT INTO `bets_indicator` VALUES (163, '2551060101', 6, '25510601010606', '๖. สร้างสรรค์งานทัศนศิลป์โดยใช้สีคู่ตรงข้ามหลักการจัดขนาดสัดส่วนและความสมดุล');
INSERT INTO `bets_indicator` VALUES (164, '2551060101', 6, '25510601010706', '๗. สร้างงานทัศนศิลป์เป็นแผนภาพแผนผัง และภาพประกอบเพื่อถ่ายทอดความคิด หรือเรื่องราวเกี่ยวกับเหตุการณ์ต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (165, '2551060102', 6, '25510601020106', '๑. บรรยายบทบาทของงานทัศนศิลป์ที่สะท้อนชีวิตและสังคม');
INSERT INTO `bets_indicator` VALUES (166, '2551060102', 6, '25510601020206', '๒. อภิปรายเกี่ยวกับอิทธิพลของความเชื่อความศรัทธาในศาสนาที่มีผลต่องานทัศนศิลป์ในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (167, '2551060102', 6, '25510601020306', '๓. ระบุ และบรรยายอิทธิพลทางวัฒนธรรมในท้องถิ่นที่มีผลต่อการสร้างงานทัศนศิลป์ของบุคคล');
INSERT INTO `bets_indicator` VALUES (168, '2551060201', 6, '25510602010106', '๑. บรรยายเพลงที่ฟัง โดยอาศัยองค์ประกอบดนตรี และศัพท์สังคีต');
INSERT INTO `bets_indicator` VALUES (169, '2551060201', 6, '25510602010206', '๒. จำแนกประเภทและบทบาทหน้าที่เครื่องดนตรีไทยและเครื่องดนตรีที่มาจากวัฒนธรรมต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (170, '2551060201', 6, '25510602010306', '๓. อ่าน เขียนโน้ตไทย และโน้ตสากลทำนองง่าย ๆ');
INSERT INTO `bets_indicator` VALUES (172, '2551060201', 6, '25510602010406', '๔. ใช้เครื่องดนตรีบรรเลงประกอบการร้องเพลงด้นสดที่มีจังหวะและทำนองง่าย ๆ');
INSERT INTO `bets_indicator` VALUES (173, '2551060201', 6, '25510602010506', '๕. บรรยายความรู้สึกที่มีต่อดนตรี');
INSERT INTO `bets_indicator` VALUES (311, '2551010101', 1, '25510101010101', '๑. อ่านออกเสียงคำ คำคล้องจองและข้อความสั้นๆ');
INSERT INTO `bets_indicator` VALUES (312, '2551010101', 1, '25510101010201', '๒. บอกความหมายของคำ และข้อความที่อ่าน');
INSERT INTO `bets_indicator` VALUES (174, '2551060202', 6, '25510602020106', '๑. อธิบายเรื่องราวของดนตรีไทยในประวัติศาสตร์');
INSERT INTO `bets_indicator` VALUES (175, '2551060202', 6, '25510602020206', '๒. จำแนกดนตรีที่มาจากยุคสมัยที่ต่างกัน');
INSERT INTO `bets_indicator` VALUES (176, '2551060202', 6, '25510602020306', '๓. อภิปรายอิทธิพลของวัฒนธรรมต่อดนตรีในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (177, '2551060301', 6, '25510603010106', '๑. สร้างสรรค์การเคลื่อนไหวและการแสดงโดยเน้นการถ่ายทอดลีลาหรืออารมณ์');
INSERT INTO `bets_indicator` VALUES (178, '2551060301', 6, '25510603010206', '๒. ออกแบบเครื่องแต่งกายหรืออุปกรณ์ประกอบการแสดงอย่างง่าย ๆ');
INSERT INTO `bets_indicator` VALUES (179, '2551060301', 6, '25510603010306', '๓. แสดงนาฏศิลป์และการละครง่าย ๆ');
INSERT INTO `bets_indicator` VALUES (180, '2551060301', 6, '25510603010406', '๔. บรรยายความรู้สึกของตนเองที่มีต่องานนาฏศิลป์และการละครอย่างสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (181, '2551060301', 6, '25510603010506', '๕. แสดงความคิดเห็นในการชมการแสดง');
INSERT INTO `bets_indicator` VALUES (182, '2551060301', 6, '25510603010606', '๖. อธิบายความสัมพันธ์ระหว่างนาฏศิลป์และการละครกับสิ่งที่ประสบในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (183, '2551060302', 6, '25510603020106', '๑. อธิบายสิ่งที่มีความสำคัญต่อการแสดงนาฏศิลป์และละคร');
INSERT INTO `bets_indicator` VALUES (184, '2551060302', 6, '25510603020206', '๒. ระบุประโยชน์ที่ได้รับจากการแสดงหรือการชมการแสดงนาฏศิลป์และละคร');
INSERT INTO `bets_indicator` VALUES (185, '2551060101', 7, '25510601010107', '๑. บรรยายความแตกต่างและความคล้ายคลึงกันของงานทัศนศิลป์และสิ่งแวดล้อมโดยใช้ความรู้เรื่องทัศนธาตุ');
INSERT INTO `bets_indicator` VALUES (186, '2551060101', 7, '25510601010207', '๒. ระบุ และบรรยายหลักการออกแบบงานทัศนศิลป์โดยเน้นความเป็นเอกภาพความกลมกลืนและความสมดุล');
INSERT INTO `bets_indicator` VALUES (187, '2551060101', 7, '25510601010307', '๓. วาดภาพทัศนียภาพแสดงให้เห็นระยะไกลใกล้เป็น ๓ มิติ');
INSERT INTO `bets_indicator` VALUES (188, '2551060101', 7, '25510601010407', '๔. รวบรวมงานปั้นหรือสื่อผสมมาสร้างเป็นเรื่องราว ๓ มิติโดยเน้นความเป็นเอกภาพความกลมกลืนและการสื่อถึงเรื่องราวของงาน');
INSERT INTO `bets_indicator` VALUES (189, '2551060101', 7, '25510601010507', '๕. ออกแบบรูปภาพสัญลักษณ์ หรือกราฟิกอื่น ๆในการนำเสนอความคิดและข้อมูล');
INSERT INTO `bets_indicator` VALUES (190, '2551060101', 7, '25510601010607', '๖. ประเมินงานทัศนศิลป์ และบรรยายถึงวิธีการปรับปรุงงานของตนเองและผู้อื่นโดยใช้เกณฑ์ที่กำหนดให้');
INSERT INTO `bets_indicator` VALUES (191, '2551060102', 7, '25510601020107', '๑. ระบุ และบรรยายเกี่ยวกับลักษณะรูปแบบงานทัศนศิลป์ของชาติและของท้องถิ่นตนเอง จากอดีตจนถึงปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (192, '2551060102', 7, '25510601020207', '๒. ระบุ และเปรียบเทียบงานทัศนศิลป์ของภาคต่าง ๆในประเทศไทย');
INSERT INTO `bets_indicator` VALUES (193, '2551060102', 7, '25510601020307', '๓. เปรียบเทียบความแตกต่างของจุดประสงค์ในการสร้างสรรค์งานทัศนศิลป์ของวัฒนธรรมไทยและสากล');
INSERT INTO `bets_indicator` VALUES (194, '2551060201', 7, '25510602010107', '๑. อ่าน เขียน ร้องโน้ตไทย และโน้ตสากล');
INSERT INTO `bets_indicator` VALUES (195, '2551060201', 7, '25510602010207', '๒. เปรียบเทียบเสียงร้องและเสียงของเครื่องดนตรีที่มาจากวัฒนธรรมที่ต่างกัน');
INSERT INTO `bets_indicator` VALUES (196, '2551060201', 7, '25510602010307', '๓. ร้องเพลงและใช้เครื่องดนตรีบรรเลงประกอบการร้องเพลงด้วยบทเพลงที่หลากหลายรูปแบบ');
INSERT INTO `bets_indicator` VALUES (197, '2551060201', 7, '25510602010407', '๔. จัดประเภทของวงดนตรีไทยและวงดนตรีที่มาจากวัฒนธรรมต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (198, '2551060201', 7, '25510602010507', '๕. แสดงความคิดเห็นที่มีต่ออารมณ์ของบทเพลงที่มีความเร็วของจังหวะ และความดัง-เบาแตกต่างกัน');
INSERT INTO `bets_indicator` VALUES (199, '2551060201', 7, '25510602010607', '๖. เปรียบเทียบอารมณ์ ความรู้สึกในการฟังดนตรีแต่ละประเภท');
INSERT INTO `bets_indicator` VALUES (200, '2551060201', 7, '25510602010707', '๗. นำเสนอตัวอย่างเพลงที่ตนเองชื่นชอบและอภิปรายลักษณะเด่นที่ทำให้งานนั้นน่าชื่นชม');
INSERT INTO `bets_indicator` VALUES (201, '2551060201', 7, '25510602010807', '๘. ใช้เกณฑ์สำหรับประเมินคุณภาพงานดนตรีหรือเพลงที่ฟัง');
INSERT INTO `bets_indicator` VALUES (202, '2551060201', 7, '25510602010907', '๙. ใช้และบำรุงรักษาเครื่องดนตรีอย่างระมัดระวังและรับผิดชอบ');
INSERT INTO `bets_indicator` VALUES (203, '2551060202', 7, '25510602020107', '๑. อธิบายบทบาทความสัมพันธ์และอิทธิพลของดนตรีที่มีต่อสังคมไทย');
INSERT INTO `bets_indicator` VALUES (204, '2551060202', 7, '25510602020207', '๒. ระบุความหลากหลายขององค์ประกอบดนตรีในวัฒนธรรมต่างกัน');
INSERT INTO `bets_indicator` VALUES (205, '2551060301', 7, '25510603010107', '๑. อธิบายอิทธิพลของนักแสดงชื่อดังที่มีผลต่อการโน้มน้าวอารมณ์หรือความคิดของผู้ชม');
INSERT INTO `bets_indicator` VALUES (206, '2551060301', 7, '25510603010207', '๒. ใช้นาฏยศัพท์หรือศัพท์ทางการละครในการแสดง');
INSERT INTO `bets_indicator` VALUES (207, '2551060301', 7, '25510603010307', '๓. แสดงนาฏศิลป์และการละครในรูปแบบง่าย ๆ');
INSERT INTO `bets_indicator` VALUES (208, '2551060301', 7, '25510603010407', '๔. ใช้ทักษะการทำงานเป็นกลุ่มในกระบวนการผลิตการแสดง');
INSERT INTO `bets_indicator` VALUES (209, '2551060301', 7, '25510603010507', '๕. ใช้เกณฑ์ง่าย ๆ ที่กำหนดให้ ในการพิจารณาคุณภาพการแสดงที่ชมโดยเน้นเรื่องการใช้เสียงการแสดงท่าและการเคลื่อนไหว');
INSERT INTO `bets_indicator` VALUES (210, '2551060302', 7, '25510603020107', '๑. ระบุปัจจัยที่มีผลต่อการเปลี่ยนแปลงของนาฏศิลป์นาฏศิลป์พื้นบ้าน ละครไทย และละครพื้นบ้าน');
INSERT INTO `bets_indicator` VALUES (211, '2551060302', 7, '25510603020207', '๒. บรรยายประเภทของละครไทยในแต่ละยุคสมัย');
INSERT INTO `bets_indicator` VALUES (212, '2551060101', 8, '25510601010108', '๑. อภิปรายเกี่ยวกับทัศนธาตุในด้านรูปแบบและแนวคิดของงานทัศนศิลป์ที่เลือกมา');
INSERT INTO `bets_indicator` VALUES (213, '2551060101', 8, '25510601010208', '๒. บรรยายเกี่ยวกับความเหมือนและความแตกต่างของรูปแบบการใช้วัสดุอุปกรณ์ในงานทัศนศิลป์ของศิลปิน');
INSERT INTO `bets_indicator` VALUES (214, '2551060101', 8, '25510601010308', '๓. วาดภาพด้วยเทคนิคที่หลากหลายในการสื่อความหมายและเรื่องราวต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (215, '2551060101', 8, '25510601010408', '๔. สร้างเกณฑ์ในการประเมินและวิจารณ์งานทัศนศิลป์');
INSERT INTO `bets_indicator` VALUES (216, '2551060101', 8, '25510601010508', '๕. นำผลการวิจารณ์ไปปรับปรุงแก้ไขและพัฒนางาน');
INSERT INTO `bets_indicator` VALUES (217, '2551060101', 8, '25510601010608', '๖. วาดภาพแสดงบุคลิกลักษณะของตัวละคร');
INSERT INTO `bets_indicator` VALUES (218, '2551060101', 8, '25510601010708', '๗. บรรยายวิธีการใช้งานทัศนศิลป์ในการโฆษณาเพื่อโน้มน้าวใจและนำเสนอตัวอย่างประกอบ');
INSERT INTO `bets_indicator` VALUES (219, '2551060102', 8, '25510601020108', '๑. ระบุและบรรยายเกี่ยวกับวัฒนธรรมต่าง ๆ ที่สะท้อนถึงงานทัศนศิลป์ในปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (220, '2551060102', 8, '25510601020208', '๒. บรรยายถึงการเปลี่ยนแปลงของงานทัศนศิลป์ของไทยในแต่ละยุคสมัยโดยเน้นถึงแนวคิด และเนื้อหาของงาน');
INSERT INTO `bets_indicator` VALUES (221, '2551060102', 8, '25510601020308', '๓. เปรียบเทียบแนวคิดในการออกแบบงานทัศนศิลป์ที่มาจาก วัฒนธรรมไทย และสากล');
INSERT INTO `bets_indicator` VALUES (222, '2551060201', 8, '25510602010108', '๑. เปรียบเทียบการใช้องค์ประกอบดนตรีที่มาจากวัฒนธรรมต่างกัน');
INSERT INTO `bets_indicator` VALUES (223, '2551060201', 8, '25510602010208', '๒. อ่าน เขียนร้องโน้ตไทยและโน้ตสากลที่มีเครื่องหมายแปลงเสียง');
INSERT INTO `bets_indicator` VALUES (224, '2551060201', 8, '25510602010308', '๓. ระบุปัจจัยสำคัญที่มีอิทธิพลต่อการสร้างสรรค์งานดนตรี');
INSERT INTO `bets_indicator` VALUES (225, '2551060201', 8, '25510602010408', '๔. ร้องเพลงและเล่นดนตรีเดี่ยว และรวมวง');
INSERT INTO `bets_indicator` VALUES (226, '2551060201', 8, '25510602010508', '๕. บรรยายอารมณ์ของเพลงและความรู้สึกที่มีต่อบทเพลงที่ฟัง');
INSERT INTO `bets_indicator` VALUES (227, '2551060201', 8, '25510602010608', '๖. ประเมินพัฒนาการทักษะทางนตรีของตนเอง หลังจากการฝึกปฏิบัติ');
INSERT INTO `bets_indicator` VALUES (228, '2551060201', 8, '25510602010708', '๗. ระบุงานอาชีพต่าง ๆที่เกี่ยวข้องกับดนตรีและบทบาทของดนตรีในธุรกิจบันเทิง');
INSERT INTO `bets_indicator` VALUES (229, '2551060202', 8, '25510602020108', '๑. บรรยายบทบาท และอิทธิพลของดนตรีในวัฒนธรรมของประเทศต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (230, '2551060202', 8, '25510602020208', '๒. บรรยายอิทธิพลของวัฒนธรรม และเหตุการณ์ในประวัติศาสตร์ที่มีต่อรูปแบบของดนตรีในประเทศไทย');
INSERT INTO `bets_indicator` VALUES (231, '2551060301', 8, '25510603010108', '๑. อธิบายการบูรณาการศิลปะแขนงอื่น ๆกับการแสดง');
INSERT INTO `bets_indicator` VALUES (232, '2551060301', 8, '25510603010208', '๒. สร้างสรรค์การแสดงโดยใช้องค์ประกอบนาฏศิลป์และการละคร');
INSERT INTO `bets_indicator` VALUES (233, '2551060301', 8, '25510603010308', '๓. วิเคราะห์การแสดงของตนเองและผู้อื่น โดยใช้นาฏยศัพท์หรือศัพท์ทางการละครที่เหมาะสม');
INSERT INTO `bets_indicator` VALUES (234, '2551060301', 8, '25510603010408', '๔. เสนอข้อคิดเห็นในการปรับปรุงการแสดง');
INSERT INTO `bets_indicator` VALUES (235, '2551060301', 8, '25510603010508', '๕. เชื่อมโยงการเรียนรู้ระหว่างนาฏศิลป์และการละครกับสาระการเรียนรู้อื่น ๆ');
INSERT INTO `bets_indicator` VALUES (236, '2551060302', 8, '25510603020108', '๑. เปรียบเทียบลักษณะเฉพาะของการแสดงนาฏศิลป์จากวัฒนธรรมต่างๆ');
INSERT INTO `bets_indicator` VALUES (237, '2551060302', 8, '25510603020208', '๒. ระบุหรือแสดงนาฏศิลป์นาฏศิลป์พื้นบ้าน ละครไทย ละครพื้นบ้าน หรือมหรสพอื่นที่เคยนิยมกันในอดีต');
INSERT INTO `bets_indicator` VALUES (238, '2551060302', 8, '25510603020308', '๓. อธิบายอิทธิพลของวัฒนธรรมที่มีผลต่อเนื้อหาของละคร');
INSERT INTO `bets_indicator` VALUES (239, '2551060101', 9, '25510601010109', '๑. บรรยายสิ่งแวดล้อม และงานทัศนศิลป์ที่เลือกมาโดยใช้ความรู้เรื่องทัศนธาตุและหลักการออกแบบ');
INSERT INTO `bets_indicator` VALUES (240, '2551060101', 9, '25510601010209', '๒. ระบุ และบรรยายเทคนิควิธีการของศิลปินในการสร้างงานทัศนศิลป์');
INSERT INTO `bets_indicator` VALUES (241, '2551060101', 9, '25510601010309', '๓. วิเคราะห์ และบรรยายวิธีการใช้ทัศนธาตุ และหลักการออกแบบในการสร้างงานทัศนศิลป์ของตนเองให้มีคุณภาพ');
INSERT INTO `bets_indicator` VALUES (242, '2551060101', 9, '25510601010409', '๔. มีทักษะในการสร้างงานทัศนศิลป์อย่างน้อย ๓ ประเภท');
INSERT INTO `bets_indicator` VALUES (243, '2551060101', 9, '25510601010509', '๕. มีทักษะในการผสมผสานวัสดุต่าง ๆ ในการสร้างงานทัศนศิลป์โดยใช้หลักการออกแบบ');
INSERT INTO `bets_indicator` VALUES (244, '2551060101', 9, '25510601010609', '๖. สร้างงานทัศนศิลป์ทั้ง ๒ มิติ และ๓ มิติเพื่อถ่ายทอดประสบการณ์และจินตนาการ');
INSERT INTO `bets_indicator` VALUES (245, '2551060101', 9, '25510601010709', '๗. สร้างสรรค์งานทัศนศิลป์สื่อความหมายเป็นเรื่องราวโดยประยุกต์ใช้ทัศนธาตุและหลักการออกแบบ');
INSERT INTO `bets_indicator` VALUES (246, '2551060101', 9, '25510601010809', '๘. วิเคราะห์และอภิปรายรูปแบบ เนื้อหาและคุณค่าในงานทัศนศิลป์ของตนเอง และผู้อื่น หรือของศิลปิน');
INSERT INTO `bets_indicator` VALUES (247, '2551060101', 9, '25510601010909', '๙. สร้างสรรค์งานทัศนศิลป์เพื่อบรรยายเหตุการณ์ต่าง ๆโดยใช้เทคนิคที่หลากหลาย');
INSERT INTO `bets_indicator` VALUES (248, '2551060101', 9, '25510601011009', '๑๐. ระบุอาชีพที่เกี่ยวข้องกับงานทัศนศิลป์และทักษะที่จำเป็นในการประกอบอาชีพนั้น ๆ');
INSERT INTO `bets_indicator` VALUES (249, '2551060101', 9, '25510601011109', '๑๑. เลือกงานทัศนศิลป์โดยใช้เกณฑ์ที่กำหนดขึ้นอย่างเหมาะสมและนำไปจัดนิทรรศการ');
INSERT INTO `bets_indicator` VALUES (250, '2551060102', 9, '25510601020109', '๑. ศึกษาและอภิปรายเกี่ยวกับงานทัศนศิลป์ที่สะท้อนคุณค่าของวัฒนธรรม');
INSERT INTO `bets_indicator` VALUES (251, '2551060102', 9, '25510601020209', '๒. เปรียบเทียบความแตกต่างของงานทัศนศิลป์ในแต่ละยุคสมัยของวัฒนธรรมไทยและสากล');
INSERT INTO `bets_indicator` VALUES (252, '2551060201', 9, '25510602010109', '๑. เปรียบเทียบองค์ประกอบที่ใช้ในงานดนตรีและงานศิลปะอื่น');
INSERT INTO `bets_indicator` VALUES (253, '2551060201', 9, '25510602010209', '๒. ร้องเพลง เล่นดนตรีเดี่ยว และรวมวงโดยเน้นเทคนิคการร้องการเล่น การแสดงออก และคุณภาพสียง');
INSERT INTO `bets_indicator` VALUES (254, '2551060201', 9, '25510602010309', '๓. แต่งเพลงสั้น ๆ จังหวะง่าย ๆ');
INSERT INTO `bets_indicator` VALUES (255, '2551060201', 9, '25510602010409', '๔. อธิบายเหตุผลในการเลือกใช้องค์ประกอบดนตรีในการสร้างสรรค์งานดนตรีของตนเอง');
INSERT INTO `bets_indicator` VALUES (256, '2551060201', 9, '25510602010509', '๕. เปรียบเทียบความแตกต่างระหว่างงานดนตรีของตนเองและผู้อื่น');
INSERT INTO `bets_indicator` VALUES (257, '2551060201', 9, '25510602010609', '๖. อธิบายเกี่ยวกับอิทธิพลของดนตรีที่มีต่อบุคคลและสังคม');
INSERT INTO `bets_indicator` VALUES (258, '2551060201', 9, '25510602010709', '๗. นำเสนอหรือจัดการแสดงดนตรีที่เหมาะสม โดยการบูรณาการกับสาระการเรียนรู้อื่นในกลุ่มศิลปะ');
INSERT INTO `bets_indicator` VALUES (259, '2551060202', 9, '25510602020109', '๑. บรรยายวิวัฒนาการของดนตรีแต่ละยุคสมัย');
INSERT INTO `bets_indicator` VALUES (260, '2551060202', 9, '25510602020209', '๒. อภิปรายลักษณะเด่นที่ทำให้งานดนตรีนั้นได้รับการยอมรับ');
INSERT INTO `bets_indicator` VALUES (261, '2551060301', 9, '25510603010109', '๑. ระบุโครงสร้างของบทละครโดยใช้ศัพท์ทางการละคร');
INSERT INTO `bets_indicator` VALUES (262, '2551060301', 9, '25510603010209', '๒. ใช้นาฏยศัพท์ หรือศัพท์ทางการละครที่เหมาะสมบรรยายเปรียบเทียบการแสดงอากัปกิริยาของผู้คนในชีวิตประจำวันและในการแสดง');
INSERT INTO `bets_indicator` VALUES (263, '2551060301', 9, '25510603010309', '๓. มีทักษะในการใช้ความคิดในการพัฒนารูปแบบการแสดง');
INSERT INTO `bets_indicator` VALUES (264, '2551060301', 9, '25510603010409', '๔. มีทักษะในการแปลความและการสื่อสารผ่านการแสดง');
INSERT INTO `bets_indicator` VALUES (265, '2551060301', 9, '25510603010509', '๕. วิจารณ์เปรียบเทียบงานนาฏศิลป์ที่มีความแตกต่างกันโดยใช้ความรู้เรื่ององค์ประกอบนาฏศิลป์');
INSERT INTO `bets_indicator` VALUES (266, '2551060301', 9, '25510603010609', '๖. ร่วมจัดงานการแสดงในบทบาทหน้าที่ต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (267, '2551060301', 9, '25510603010709', '๗. นำเสนอแนวคิดจากเนื้อเรื่องของการแสดงที่สามารถนำไปปรับใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (268, '2551060302', 9, '25510603020109', '๑. ออกแบบและสร้างสรรค์อุปกรณ์และเครื่องแต่งกายเพื่อแสดงนาฏศิลป์และการละครที่มาจากวัฒนธรรมต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (269, '2551060302', 9, '25510603020209', '๒. อธิบายความสำคัญและบทบาทของนาฏศิลป์และการละครในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (270, '2551060302', 9, '25510603020309', '๓. แสดงความคิดเห็นในการอนุรักษ์');
INSERT INTO `bets_indicator` VALUES (271, '2551060101', 13, '25510601010113', '๑. วิเคราะห์การใช้ทัศนธาตุ และหลักการออกแบบในการสื่อความหมายในรูปแบบต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (272, '2551060101', 13, '25510601010213', '๒. บรรยายจุดประสงค์และเนื้อหาของงานทัศนศิลป์โดยใช้ศัพท์ทางทัศนศิลป์');
INSERT INTO `bets_indicator` VALUES (273, '2551060101', 13, '25510601010313', '๓. วิเคราะห์การเลือกใช้วัสดุอุปกรณ์ และเทคนิคของศิลปินในการแสดงออกทางทัศนศิลป์');
INSERT INTO `bets_indicator` VALUES (274, '2551060101', 13, '25510601010413', '๔. มีทักษะและเทคนิคในการใช้วัสดุอุปกรณ์และกระบวนการที่สู');
INSERT INTO `bets_indicator` VALUES (275, '2551060101', 13, '25510601010513', '๕. สร้างสรรค์งานทัศนศิลป์ด้วยเทคโนโลยีต่าง ๆโดยเน้นหลักการออกแบบและการจัดองค์ประกอบศิลป์');
INSERT INTO `bets_indicator` VALUES (276, '2551060101', 13, '25510601010613', '๖. ออกแบบงานทัศนศิลป์ได้เหมาะกับโอกาสและสถานที่');
INSERT INTO `bets_indicator` VALUES (277, '2551060101', 13, '25510601010713', '๗. วิเคราะห์และอธิบายจุดมุ่งหมายของศิลปินในการเลือกใช้วัสดุ อุปกรณ์เทคนิคและเนื้อหา เพื่อสร้างสรรค์งานทัศนศิลป์');
INSERT INTO `bets_indicator` VALUES (278, '2551060101', 13, '25510601010813', '๘. ประเมินและวิจารณ์งานทัศนศิลป์โดยใช้ทฤษฎีการวิจารณ์ศิลปะ');
INSERT INTO `bets_indicator` VALUES (279, '2551060101', 13, '25510601010913', '๙. จัดกลุ่มงานทัศนศิลป์เพื่อสะท้อนพัฒนาการและความก้าวหน้าของตนเอง');
INSERT INTO `bets_indicator` VALUES (280, '2551060101', 13, '25510601011013', '๑๐. สร้างสรรค์งานทัศนศิลป์ไทย สากล โดยศึกษาจากแนวคิดและวิธีการสร้างงานของศิลปินที่ตนชื่นชอบ');
INSERT INTO `bets_indicator` VALUES (281, '2551060101', 13, '25510601011113', '๑๑. วาดภาพระบายสีเป็นภาพล้อเลียน หรือภาพการ์ตูนเพื่อแสดงความคิดเห็นเกี่ยวกับสภาพสังคมในปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (282, '2551060102', 13, '25510601020113', '๑. วิเคราะห์ และเปรียบเทียบงานทัศนศิลป์ในรูปแบบตะวันออกและรูปแบบตะวันตก');
INSERT INTO `bets_indicator` VALUES (283, '2551060102', 13, '25510601020213', '๒. ระบุงานทัศนศิลป์ของศิลปินที่มีชื่อเสียง และบรรยายผลตอบรับของสังคม');
INSERT INTO `bets_indicator` VALUES (284, '2551060102', 13, '25510601020313', '๓. อภิปรายเกี่ยวกับอิทธิพลของวัฒนธรรมระหว่างประเทศที่มีผลต่องานทัศนศิลป์ในสังคม');
INSERT INTO `bets_indicator` VALUES (285, '2551060201', 13, '25510602010113', '๑. เปรียบเทียบรูปแบบของบทเพลงและวงดนตรีแต่ละประเภท');
INSERT INTO `bets_indicator` VALUES (286, '2551060201', 13, '25510602010213', '๒. จำแนกประเภทและรูปแบบของวงดนตรี ทั้งไทยและสากล');
INSERT INTO `bets_indicator` VALUES (287, '2551060201', 13, '25510602010313', '๓. อธิบายเหตุผลที่คนต่างวัฒนธรรมสร้างสรรค์งานดนตรีแตกต่างกัน');
INSERT INTO `bets_indicator` VALUES (288, '2551060201', 13, '25510602010413', '๔. อ่าน เขียน โน้ตดนตรีไทยและสากลในอัตราจังหวะต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (289, '2551060201', 13, '25510602010513', '๕. ร้องเพลง หรือเล่นดนตรีเดี่ยวและรวมวง โดยเน้นเทคนิคการแสดงออก และคุณภาพของการแสดง');
INSERT INTO `bets_indicator` VALUES (290, '2551060201', 13, '25510602010613', '๖. สร้างเกณฑ์สำหรับประเมินคุณภาพการประพันธ์และการเล่นดนตรีของตนเองและผู้อื่นได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (291, '2551060201', 13, '25510602010713', '๗. เปรียบเทียบอารมณ์ และความรู้สึกที่ได้รับจากงานดนตรีที่มาจากวัฒนธรรมต่างกัน');
INSERT INTO `bets_indicator` VALUES (292, '2551060201', 13, '25510602010813', '๘. นำดนตรีไปประยุกต์ใช้ในงานอื่น ๆ');
INSERT INTO `bets_indicator` VALUES (293, '2551060202', 13, '25510602020113', '๑. วิเคราะห์รูปแบบของดนตรีไทยและดนตรีสากลในยุคสมัยต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (294, '2551060202', 13, '25510602020213', '๒. วิเคราะห์สถานะทางสังคมของนักดนตรีในวัฒนธรรมต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (295, '2551060202', 13, '25510602020313', '๓.เปรียบเทียบลักษณะเด่นของดนตรีในวัฒนธรรมต่างๆ');
INSERT INTO `bets_indicator` VALUES (296, '2551060202', 13, '25510602020413', '๔. อธิบายบทบาทของดนตรีในการสะท้อนแนวความคิดและค่านิยมที่เปลี่ยนไปของคนในสังคม');
INSERT INTO `bets_indicator` VALUES (297, '2551060202', 13, '25510602020513', '๕. นำเสนอแนวทางในการส่งเสริมและอนุรักษ์ดนตรีในฐานะมรดกของชาติ');
INSERT INTO `bets_indicator` VALUES (298, '2551060301', 13, '25510603010113', '๑. มีทักษะในการแสดงหลากหลายรูปแบบ');
INSERT INTO `bets_indicator` VALUES (299, '2551060301', 13, '25510603010213', '๒. สร้างสรรค์ละครสั้นในรูปแบบที่ชื่นชอบ');
INSERT INTO `bets_indicator` VALUES (300, '2551060301', 13, '25510603010313', '๓. ใช้ความคิดริเริ่มในการแสดงนาฏศิลป์เป็นคู่ และหมู่');
INSERT INTO `bets_indicator` VALUES (301, '2551060301', 13, '25510603010413', '๔. วิจารณ์การแสดงตามหลักนาฏศิลป์และการละคร');
INSERT INTO `bets_indicator` VALUES (302, '2551060301', 13, '25510603010513', '๕. วิเคราะห์แก่นของการแสดงนาฏศิลป์และการละครที่ต้องการสื่อความหมายในการแสดง');
INSERT INTO `bets_indicator` VALUES (303, '2551060301', 13, '25510603010613', '๖. บรรยาย และวิเคราะห์ อิทธิพลของเครื่องแต่งกาย แสง สี เสียงฉากอุปกรณ์ และสถานที่ที่มีผลต่อการแสดง');
INSERT INTO `bets_indicator` VALUES (304, '2551060301', 13, '25510603010713', '๗. พัฒนาและใช้เกณฑ์การประเมินในการประเมินการแสดง');
INSERT INTO `bets_indicator` VALUES (305, '2551060301', 13, '25510603010813', '๘. วิเคราะห์ท่าทาง และการเคลื่อนไหวของผู้คนในชีวิตประจำวันและนำมาประยุกต์ใช้ในการแสดง');
INSERT INTO `bets_indicator` VALUES (306, '2551060302', 13, '25510603020113', '๑. เปรียบเทียบการนำการแสดงไปใช้ในโอกาสต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (307, '2551060302', 13, '25510603020213', '๒. อภิปรายบทบาทของบุคคลสำคัญในวงการนาฏศิลป์และการละคร ของประเทศไทยในยุคสมัยต่างๆ');
INSERT INTO `bets_indicator` VALUES (308, '2551060302', 13, '25510603020313', '๓. บรรยายวิวัฒนาการของนาฏศิลป์และการละครไทย ตั้งแต่อดีตจนถึงปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (309, '2551060302', 13, '25510603020413', '๔. นำเสนอแนวคิดในการอนุรักษ์นาฏศิลป์ไทย');
INSERT INTO `bets_indicator` VALUES (310, '2551060201', 6, '25510602010606', '๖. แสดงความคิดเห็นเกี่ยวกับทำนอง จังหวะ การประสานเสียง และคุณภาพเสียงของเพลงที่ฟัง');
INSERT INTO `bets_indicator` VALUES (313, '2551010101', 1, '25510101010301', '๓. ตอบคำถามเกี่ยวกับเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (314, '2551010101', 1, '25510101010401', '๔. เล่าเรื่องย่อจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (315, '2551010101', 1, '25510101010501', '๕. คาดคะเนเหตุการณ์จากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (316, '2551010101', 1, '25510101010601', '๖. อ่านหนังสือตามความสนใจอย่างสม่ำเสมอและนำเสนอเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (317, '2551010101', 1, '25510101010701', '๗. บอกความหมายของเครื่องหมายหรือสัญลักษณ์สำคัญที่มักพบเห็นในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (318, '2551010101', 1, '25510101010801', '๘. มีมารยาทในการอ่าน');
INSERT INTO `bets_indicator` VALUES (319, '2551010101', 2, '25510101010102', '๑. อ่านออกเสียงคำ คำคล้องจองข้อความ และบทร้อยกรองง่ายๆ ได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (320, '2551010101', 2, '25510101010202', '๒. อธิบายความหมายของคำ และข้อความที่อ่าน');
INSERT INTO `bets_indicator` VALUES (321, '2551010101', 2, '25510101010302', '๓. ตั้งคำถามและตอบคำถามเกี่ยวกับเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (322, '2551010101', 2, '25510101010402', '๔. ระบุใจความสำคัญและรายละเอียดจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (323, '2551010101', 2, '25510101010502', '๕. แสดงความคิดเห็นและคาดคะเนเหตุการณ์จากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (324, '2551010101', 2, '25510101010602', '๖. อ่านหนังสือตามความสนใจอย่างสม่ำเสมอและนำเสนอเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (325, '2551010101', 2, '25510101010702', '๗. อ่านข้อเขียนเชิงอธิบาย และปฏิบัติตามคำสั่งหรือข้อแนะนำ');
INSERT INTO `bets_indicator` VALUES (326, '2551010101', 2, '25510101010802', '๘. มีมารยาทในการอ่าน');
INSERT INTO `bets_indicator` VALUES (327, '2551010101', 3, '25510101010103', '๑. อ่านออกเสียงคำ ข้อความเรื่องสั้นๆ และบทร้อยกรองง่ายๆ ได้ถูกต้องคล่องแคล่ว');
INSERT INTO `bets_indicator` VALUES (328, '2551010101', 3, '25510101010203', '๒. อธิบายความหมายของคำ และข้อความที่อ่าน');
INSERT INTO `bets_indicator` VALUES (329, '2551010101', 3, '25510101010303', '๓. ตั้งคำถามและตอบคำถามเชิงเหตุผลเกี่ยวกับเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (330, '2551010101', 3, '25510101010403', '๔. ลำดับเหตุการณ์และคาดคะเนเหตุการณ์จากเรื่องที่อ่านโดยระบุเหตุผลประกอบ');
INSERT INTO `bets_indicator` VALUES (331, '2551010101', 3, '25510101010503', '๕. สรุปความรู้และข้อคิดจากเรื่องที่อ่านเพื่อนำไปใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (332, '2551010101', 3, '25510101010603', '๖. อ่านหนังสือตามความสนใจอย่างสม่ำเสมอและนำเสนอเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (333, '2551010101', 3, '25510101010703', '๗. อ่านข้อเขียนเชิงอธิบายและปฏิบัติตามคำสั่งหรือข้อแนะนำ');
INSERT INTO `bets_indicator` VALUES (334, '2551010101', 3, '25510101010803', '๘. อธิบายความหมายของข้อมูลจากแผนภาพแผนที่ และแผนภูมิ');
INSERT INTO `bets_indicator` VALUES (335, '2551010101', 3, '25510101010903', '๙. มีมารยาทในการอ่าน');
INSERT INTO `bets_indicator` VALUES (336, '2551010101', 4, '25510101010104', '๑. อ่านออกเสียงบทร้อยแก้วและบทร้อยกรองได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (337, '2551010101', 4, '25510101010204', '๒. อธิบายความหมายของคำ ประโยคและสำนวนจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (338, '2551010101', 4, '25510101010304', '๓. อ่านเรื่องสั้นๆ ตามเวลาที่กำหนดและตอบคำถามจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (339, '2551010101', 4, '25510101010404', '๔. แยกข้อเท็จจริงและข้อคิดเห็นจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (340, '2551010101', 4, '25510101010504', '๕. คาดคะเนเหตุการณ์จากเรื่องที่อ่านโดยระบุเหตุผลประกอบ');
INSERT INTO `bets_indicator` VALUES (341, '2551010101', 4, '25510101010604', '๖. สรุปความรู้และข้อคิดจากเรื่องที่อ่านเพื่อนำไปใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (342, '2551010101', 4, '25510101010704', '๗. อ่านหนังสือที่มีคุณค่าตามความสนใจอย่างสม่ำเสมอและแสดงความคิดเห็นเกี่ยวกับเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (343, '2551010101', 4, '25510101010804', '๘. มีมารยาทในการอ่าน');
INSERT INTO `bets_indicator` VALUES (344, '2551010101', 5, '25510101010105', '๑. อ่านออกเสียงบทร้อยแก้วและบทร้อยกรองได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (345, '2551010101', 5, '25510101010205', '๒. อธิบายความหมายของคำ ประโยคและข้อความที่เป็นการบรรยายและการพรรณนา');
INSERT INTO `bets_indicator` VALUES (346, '2551010101', 5, '25510101010305', '๓. อธิบายความหมายโดยนัยจากเรื่องที่อ่านอย่างหลากหลาย');
INSERT INTO `bets_indicator` VALUES (347, '2551010101', 5, '25510101010405', '๔. แยกข้อเท็จจริงและข้อคิดเห็นจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (348, '2551010101', 5, '25510101010505', '๕. วิเคราะห์และแสดงความคิดเห็นเกี่ยวกับเรื่องที่อ่านเพื่อนำไปใช้ในการดำเนินชีวิต');
INSERT INTO `bets_indicator` VALUES (349, '2551010101', 5, '25510101010605', '๖. อ่านงานเขียนเชิงอธิบายคำสั่ง ข้อแนะนำและปฏิบัติตาม');
INSERT INTO `bets_indicator` VALUES (350, '2551010101', 5, '25510101010705', '๗. อ่านหนังสือที่มีคุณค่าตามความสนใจอย่างสม่ำเสมอและแสดงความคิดเห็นเกี่ยวกับเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (351, '2551010101', 5, '25510101010805', '๘. มีมารยาทในการอ่าน');
INSERT INTO `bets_indicator` VALUES (352, '2551010101', 6, '25510101010106', '๑. อ่านออกเสียงบทร้อยแก้วและบทร้อยกรองได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (353, '2551010101', 6, '25510101010206', '๒. อธิบายความหมายของคำ ประโยคและข้อความที่เป็นโวหาร');
INSERT INTO `bets_indicator` VALUES (354, '2551010101', 6, '25510101010306', '๓. อ่านเรื่องสั้นๆ อย่างหลากหลายโดยจับเวลาแล้วถามเกี่ยวกับเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (355, '2551010101', 6, '25510101010406', '๔. แยกข้อเท็จจริงและข้อคิดเห็นจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (356, '2551010101', 6, '25510101010506', '๕. อธิบายการนำความรู้และความคิดจากเรื่องที่อ่านไปตัดสินใจแก้ปัญหาในการดำเนินชีวิต');
INSERT INTO `bets_indicator` VALUES (357, '2551010101', 6, '25510101010606', '๖. อ่านงานเขียนเชิงอธิบายคำสั่ง ข้อแนะนำและปฏิบัติตาม');
INSERT INTO `bets_indicator` VALUES (358, '2551010101', 6, '25510101010706', '๗. อธิบายความหมายของข้อมูลจากการอ่านแผนผัง แผนที่แผนภูมิและกราฟ');
INSERT INTO `bets_indicator` VALUES (359, '2551010101', 6, '25510101010806', '๘. อ่านหนังสือตามความสนใจและอธิบายคุณค่าที่ได้รับ');
INSERT INTO `bets_indicator` VALUES (360, '2551010101', 6, '25510101010906', '๙. มีมารยาทในการอ่าน');
INSERT INTO `bets_indicator` VALUES (361, '2551010101', 7, '25510101010107', '๑. อ่านออกเสียงบทร้อยแก้วและบทร้อยกรองได้ถูกต้องเหมาะสมกับเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (362, '2551010101', 7, '25510101010207', '๒. จับใจความสำคัญจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (363, '2551010101', 7, '25510101010307', '๓. ระบุเหตุและผล และข้อเท็จจริงกับข้อคิดเห็นจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (364, '2551010101', 7, '25510101010407', '๔. ระบุและอธิบายคำเปรียบเทียบและคำที่มีหลายความหมายในบริบทต่างๆจากการอ่าน');
INSERT INTO `bets_indicator` VALUES (365, '2551010101', 7, '25510101010507', '๕. ตีความคำยากในเอกสารวิชาการโดยพิจารณาจากบริบท');
INSERT INTO `bets_indicator` VALUES (366, '2551010101', 7, '25510101010607', '๖. ระบุข้อสังเกตและความสมเหตุสมผลของงานเขียนประเภทชักจูงโน้มน้าวใจ');
INSERT INTO `bets_indicator` VALUES (367, '2551010101', 7, '25510101010707', '๗. ปฏิบัติตามคู่มือแนะนำวิธีการใช้งานของเครื่องมือหรือเครื่องใช้ในระดับที่ยากขึ้น');
INSERT INTO `bets_indicator` VALUES (368, '2551010101', 7, '25510101010807', '๘. วิเคราะห์คุณค่าที่ได้รับจากการอ่านงานเขียนอย่างหลากหลายเพื่อนำไปใช้แก้ปัญหาในชีวิต');
INSERT INTO `bets_indicator` VALUES (369, '2551010101', 7, '25510101010907', '๙. มีมารยาทในการอ่าน');
INSERT INTO `bets_indicator` VALUES (370, '2551010101', 8, '25510101010108', '๑. อ่านออกเสียงบทร้อยแก้วและบทร้อยกรองได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (371, '2551010101', 8, '25510101010208', '๒. จับใจความสำคัญสรุปความและอธิบายรายละเอียดจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (372, '2551010101', 8, '25510101010308', '๓. เขียนผังความคิดเพื่อแสดงความเข้าใจในบทเรียนต่างๆที่อ่าน');
INSERT INTO `bets_indicator` VALUES (373, '2551010101', 8, '25510101010408', '๔. อภิปรายแสดงความคิดเห็นและข้อโต้แย้งเกี่ยวกับเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (374, '2551010101', 8, '25510101010508', '๕. วิเคราะห์และจำแนกข้อเท็จจริงข้อมูลสนับสนุนและข้อคิดเห็นจากบทความที่อ่าน');
INSERT INTO `bets_indicator` VALUES (375, '2551010101', 8, '25510101010608', '๖. ระบุข้อสังเกตการชวนเชื่อการโน้มน้าวหรือความสมเหตุสมผลของงานเขียน');
INSERT INTO `bets_indicator` VALUES (376, '2551010101', 8, '25510101010708', '๗. อ่านหนังสือบทความหรือคำประพันธ์อย่างหลากหลายและประเมินคุณค่าหรือแนวคิดที่ได้จากการอ่านเพื่อนำไปใช้แก้ปัญหาในชีวิต');
INSERT INTO `bets_indicator` VALUES (377, '2551010101', 8, '25510101010808', '๘. มีมารยาทในการอ่าน');
INSERT INTO `bets_indicator` VALUES (378, '2551010101', 9, '25510101010109', '๑. อ่านออกเสียงบทร้อยแก้วและบทร้อยกรองได้ถูกต้องและเหมาะสมกับเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (379, '2551010101', 9, '25510101010209', '๒. ระบุความแตกต่างของคำที่มีความหมายโดยตรง และความหมายโดยนัย');
INSERT INTO `bets_indicator` VALUES (380, '2551010101', 9, '25510101010309', '๓. ระบุใจความสำคัญและรายละเอียดของข้อมูลที่สนับสนุนจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (381, '2551010101', 9, '25510101010409', '๔. อ่านเรื่องต่างๆ แล้วเขียนกรอบแนวคิดผังความคิดบันทึก ย่อความและรายงาน');
INSERT INTO `bets_indicator` VALUES (382, '2551010101', 9, '25510101010509', '๕. วิเคราะห์วิจารณ์ และประเมินเรื่องที่อ่านโดยใช้กลวิธีการเปรียบเทียบเพื่อให้ผู้อ่านเข้าใจได้ดีขึ้น');
INSERT INTO `bets_indicator` VALUES (383, '2551010101', 9, '25510101010609', '๖. ประเมินความถูกต้องของข้อมูลที่ใช้สนับสนุนในเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (384, '2551010101', 9, '25510101010709', '๗. วิจารณ์ความสมเหตุสมผลการลำดับความและความเป็นไปได้ของเรื่อง');
INSERT INTO `bets_indicator` VALUES (385, '2551010101', 9, '25510101010809', '๘. วิเคราะห์เพื่อแสดงความคิดเห็นโต้แย้งเกี่ยวกับเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (386, '2551010101', 9, '25510101010909', '๙. ตีความและประเมินคุณค่าและแนวคิด ที่ได้จากงานเขียนอย่างหลากหลายเพื่อนำไปใช้แก้ปัญหาในชีวิต');
INSERT INTO `bets_indicator` VALUES (387, '2551010101', 9, '25510101011009', '๑๐ มีมารยาทในการอ่าน');
INSERT INTO `bets_indicator` VALUES (388, '2551010101', 13, '25510101010113', '๑. อ่านออกเสียงบทร้อยแก้วและบทร้อยกรองได้อย่างถูกต้องไพเราะ และเหมาะสมกับเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (389, '2551010101', 13, '25510101010213', '๒. ตีความ แปลความ และขยายความเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (390, '2551010101', 13, '25510101010313', '๓. วิเคราะห์และวิจารณ์เรื่องที่อ่านในทุกๆ ด้านอย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (391, '2551010101', 13, '25510101010413', '๔. คาดคะเนเหตุการณ์จากเรื่องที่อ่าน และประเมินค่าเพื่อนำความรู้ ความคิดไปใช้ตัดสินใจแก้ปัญหาในการดำเนินชีวิต');
INSERT INTO `bets_indicator` VALUES (392, '2551010101', 13, '25510101010513', '๕. วิเคราะห์ วิจารณ์ แสดงความคิดเห็นโต้แย้งกับเรื่องที่อ่านและเสนอความคิดใหม่อย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (393, '2551010101', 13, '25510101010613', '๖. ตอบคำถามจากการอ่านประเภทต่างๆ ภายในเวลาที่กำหนด');
INSERT INTO `bets_indicator` VALUES (394, '2551010101', 13, '25510101010713', '๗. อ่านเรื่องต่างๆ แล้วเขียนกรอบแนวคิด ผังความคิด บันทึกย่อความ และรายงาน');
INSERT INTO `bets_indicator` VALUES (395, '2551010101', 13, '25510101010813', '๘. สังเคราะห์ความรู้จากการอ่านสื่อสิ่งพิมพ์ สื่ออิเล็กทรอนิกส์และแหล่งเรียนรู้ต่างๆ มาพัฒนาตน พัฒนาการเรียน และพัฒนาความรู้ทางอาชีพ');
INSERT INTO `bets_indicator` VALUES (396, '2551010101', 13, '25510101010913', '๙. มีมารยาทในการอ่าน');
INSERT INTO `bets_indicator` VALUES (397, '2551010201', 1, '25510102010101', '๑. คัดลายมือตัวบรรจงเต็มบรรทัด');
INSERT INTO `bets_indicator` VALUES (398, '2551010201', 1, '25510102010201', '๒. เขียนสื่อสารด้วยคำและประโยคง่ายๆ');
INSERT INTO `bets_indicator` VALUES (399, '2551010201', 1, '25510102010301', '๓. มีมารยาทในการเขียน');
INSERT INTO `bets_indicator` VALUES (400, '2551010201', 2, '25510102010102', '๑. คัดลายมือตัวบรรจงเต็มบรรทัด');
INSERT INTO `bets_indicator` VALUES (401, '2551010201', 2, '25510102010202', '๒. เขียนเรื่องสั้นๆ เกี่ยวกับประสบการณ์');
INSERT INTO `bets_indicator` VALUES (402, '2551010201', 2, '25510102010302', '๓. เขียนเรื่องสั้นๆ ตามจินตนาการ');
INSERT INTO `bets_indicator` VALUES (403, '2551010201', 2, '25510102010402', '๔. มีมารยาทในการเขียน');
INSERT INTO `bets_indicator` VALUES (404, '2551010201', 3, '25510102010103', '๑. คัดลายมือตัวบรรจงเต็มบรรทัด');
INSERT INTO `bets_indicator` VALUES (405, '2551010201', 3, '25510102010203', '๒ เขียนบรรยายเกี่ยวกับสิ่งใดสิ่งหนึ่งได้อย่างชัดเจน');
INSERT INTO `bets_indicator` VALUES (406, '2551010201', 3, '25510102010303', '๓. เขียนบันทึกประจำวัน');
INSERT INTO `bets_indicator` VALUES (407, '2551010201', 3, '25510102010403', '๔. เขียนจดหมายลาครู');
INSERT INTO `bets_indicator` VALUES (408, '2551010201', 3, '25510102010503', '๕. เขียนเรื่องตามจินตนาการ');
INSERT INTO `bets_indicator` VALUES (409, '2551010201', 3, '25510102010603', '๖. มีมารยาทในการเขียน');
INSERT INTO `bets_indicator` VALUES (410, '2551010201', 4, '25510102010104', '๑. คัดลายมือตัวบรรจงเต็มบรรทัดและครึ่งบรรทัด');
INSERT INTO `bets_indicator` VALUES (411, '2551010201', 4, '25510102010204', '๒. เขียนสื่อสารโดยใช้คำได้ถูกต้อง ชัดเจนและเหมาะสม');
INSERT INTO `bets_indicator` VALUES (412, '2551010201', 4, '25510102010304', '๓. เขียนแผนภาพโครงเรื่องและแผนภาพความคิดเพื่อใช้พัฒนางานเขียน');
INSERT INTO `bets_indicator` VALUES (413, '2551010201', 4, '25510102010404', '๔. เขียนย่อความจากเรื่องสั้นๆ');
INSERT INTO `bets_indicator` VALUES (414, '2551010201', 4, '25510102010504', '๕. เขียนจดหมายถึงเพื่อนและบิดามารดา');
INSERT INTO `bets_indicator` VALUES (415, '2551010201', 4, '25510102010604', '๖. เขียนบันทึกและเขียนรายงานจากการศึกษาค้นคว้า');
INSERT INTO `bets_indicator` VALUES (416, '2551010201', 4, '25510102010704', '๗. เขียนเรื่องตามจินตนาการ๘. มีมารยาทในการเขียน');
INSERT INTO `bets_indicator` VALUES (417, '2551010201', 5, '25510102010105', '๑. คัดลายมือตัวบรรจงเต็มบรรทัดและครึ่งบรรทัด');
INSERT INTO `bets_indicator` VALUES (418, '2551010201', 5, '25510102010205', '๒. เขียนสื่อสารโดยใช้คำได้ถูกต้อง ชัดเจนและเหมาะสม');
INSERT INTO `bets_indicator` VALUES (419, '2551010201', 5, '25510102010305', '๓. เขียนแผนภาพโครงเรื่องและแผนภาพความคิดเพื่อใช้พัฒนางานเขียน');
INSERT INTO `bets_indicator` VALUES (420, '2551010201', 5, '25510102010405', '๔. เขียนย่อความจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (421, '2551010201', 5, '25510102010505', '๕. เขียนจดหมายถึงผู้ปกครองและญาติ');
INSERT INTO `bets_indicator` VALUES (422, '2551010201', 5, '25510102010605', '๖. เขียนแสดงความรู้สึกและความคิดเห็นได้ตรงตามเจตนา');
INSERT INTO `bets_indicator` VALUES (423, '2551010201', 5, '25510102010705', '๗. กรอกแบบรายการต่างๆ๘. เขียนเรื่องตามจินตนาการ');
INSERT INTO `bets_indicator` VALUES (424, '2551010201', 5, '25510102010805', '๙. มีมารยาทในการเขียน');
INSERT INTO `bets_indicator` VALUES (425, '2551010201', 6, '25510102010106', '๑. คัดลายมือตัวบรรจงเต็มบรรทัดและครึ่งบรรทัด');
INSERT INTO `bets_indicator` VALUES (426, '2551010201', 6, '25510102010206', '๒. เขียนสื่อสารโดยใช้คำได้ถูกต้อง ชัดเจนและเหมาะสม');
INSERT INTO `bets_indicator` VALUES (427, '2551010201', 6, '25510102010306', '๓. เขียนแผนภาพโครงเรื่องและแผนภาพความคิดเพื่อใช้พัฒนางานเขียน');
INSERT INTO `bets_indicator` VALUES (428, '2551010201', 6, '25510102010406', '๔. เขียนเรียงความ');
INSERT INTO `bets_indicator` VALUES (429, '2551010201', 6, '25510102010506', '๕. เขียนย่อความจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (430, '2551010201', 6, '25510102010606', '๖. เขียนจดหมายส่วนตัว');
INSERT INTO `bets_indicator` VALUES (431, '2551010201', 6, '25510102010706', '๗. กรอกแบบรายการต่างๆ');
INSERT INTO `bets_indicator` VALUES (432, '2551010201', 6, '25510102010806', '๘. เขียนเรื่องตามจินตนาการและสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (433, '2551010201', 6, '25510102010906', '๙. มีมารยาทในการเขียน');
INSERT INTO `bets_indicator` VALUES (434, '2551010201', 7, '25510102010107', '๑. คัดลายมือตัวบรรจงครึ่งบรรทัด');
INSERT INTO `bets_indicator` VALUES (435, '2551010201', 7, '25510102010207', '๒. เขียนสื่อสารโดยใช้ถ้อยคำถูกต้อง ชัดเจนเหมาะสม และสละสลวย');
INSERT INTO `bets_indicator` VALUES (436, '2551010201', 7, '25510102010307', '๓. เขียนบรรยายประสบการณ์โดยระบุสาระสำคัญและรายละเอียดสนับสนุน');
INSERT INTO `bets_indicator` VALUES (437, '2551010201', 7, '25510102010407', '๔. เขียนเรียงความ');
INSERT INTO `bets_indicator` VALUES (438, '2551010201', 7, '25510102010507', '๕. เขียนย่อความจากเรื่องที่อ่าน');
INSERT INTO `bets_indicator` VALUES (439, '2551010201', 7, '25510102010607', '๖. เขียนแสดงความคิดเห็นเกี่ยวกับสาระจากสื่อที่ได้รับ');
INSERT INTO `bets_indicator` VALUES (440, '2551010201', 7, '25510102010707', '๗. เขียนจดหมายส่วนตัวและจดหมายกิจธุระ');
INSERT INTO `bets_indicator` VALUES (441, '2551010201', 7, '25510102010807', '๘. เขียนรายงานการศึกษาค้นคว้าและโครงงาน');
INSERT INTO `bets_indicator` VALUES (442, '2551010201', 7, '25510102010907', '๙. มีมารยาทในการเขียน');
INSERT INTO `bets_indicator` VALUES (443, '2551010201', 8, '25510102010108', '๑. คัดลายมือตัวบรรจงครึ่งบรรทัด');
INSERT INTO `bets_indicator` VALUES (444, '2551010201', 8, '25510102010208', '๒. เขียนบรรยายและพรรณนา');
INSERT INTO `bets_indicator` VALUES (445, '2551010201', 8, '25510102010308', '๓. เขียนเรียงความ');
INSERT INTO `bets_indicator` VALUES (446, '2551010201', 8, '25510102010408', '๔. เขียนย่อความ');
INSERT INTO `bets_indicator` VALUES (447, '2551010201', 8, '25510102010508', '๕. เขียนรายงานการศึกษาค้นคว้า');
INSERT INTO `bets_indicator` VALUES (448, '2551010201', 8, '25510102010608', '๖. เขียนจดหมายกิจธุระ');
INSERT INTO `bets_indicator` VALUES (449, '2551010201', 8, '25510102010708', '๗. เขียนวิเคราะห์วิจารณ์ และแสดงความรู้ความคิดเห็นหรือโต้แย้งในเรื่องที่อ่านอย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (450, '2551010201', 8, '25510102010808', '๘. มีมารยาทในการเขียน');
INSERT INTO `bets_indicator` VALUES (451, '2551010201', 9, '25510102010109', '๑. คัดลายมือตัวบรรจงครึ่งบรรทัด');
INSERT INTO `bets_indicator` VALUES (452, '2551010201', 9, '25510102010209', '๒. เขียนข้อความโดยใช้ถ้อยคำได้ถูกต้องตามระดับภาษา');
INSERT INTO `bets_indicator` VALUES (453, '2551010201', 9, '25510102010309', '๓. เขียนชีวประวัติหรืออัตชีวประวัติโดยเล่าเหตุการณ์ข้อคิดเห็นและทัศนคติในเรื่องต่างๆ');
INSERT INTO `bets_indicator` VALUES (454, '2551010201', 9, '25510102010409', '๔. เขียนย่อความ');
INSERT INTO `bets_indicator` VALUES (455, '2551010201', 9, '25510102010509', '๕. เขียนจดหมายกิจธุระ');
INSERT INTO `bets_indicator` VALUES (456, '2551010201', 9, '25510102010609', '๖. เขียนอธิบายชี้แจง แสดงความคิดเห็นและโต้แย้งอย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (457, '2551010201', 9, '25510102010709', '๗. เขียนวิเคราะห์ วิจารณ์และแสดงความรู้ความคิดเห็นหรือโต้แย้งในเรื่องต่างๆ');
INSERT INTO `bets_indicator` VALUES (458, '2551010201', 9, '25510102010809', '๘. กรอกแบบสมัครงานพร้อมเขียนบรรยายเกี่ยวกับความรู้และทักษะของตนเองที่เหมาะสมกับงาน');
INSERT INTO `bets_indicator` VALUES (459, '2551010201', 9, '25510102010909', '๙. เขียนรายงานการศึกษค้นคว้าและโครงงาน');
INSERT INTO `bets_indicator` VALUES (460, '2551010201', 9, '25510102011009', '๑๐. มีมารยาทในการเขียน');
INSERT INTO `bets_indicator` VALUES (461, '2551010201', 13, '25510102010113', '๑. เขียนสื่อสารในรูปแบบต่างๆได้ตรงตามวัตถุประสงค์ โดยใช้ภาษาเรียบเรียงถูกต้อง มีข้อมูลและสาระสำคัญชัดเจน');
INSERT INTO `bets_indicator` VALUES (462, '2551010201', 13, '25510102010213', '๒. เขียนเรียงความ');
INSERT INTO `bets_indicator` VALUES (463, '2551010201', 13, '25510102010313', '๓. เขียนย่อความจากสื่อที่มีรูปแบบ และเนื้อหาหลากหลาย');
INSERT INTO `bets_indicator` VALUES (464, '2551010201', 13, '25510102010413', '๔. ผลิตงานเขียนของตนเองในรูปแบบต่างๆ');
INSERT INTO `bets_indicator` VALUES (465, '2551010201', 13, '25510102010513', '๕. ประเมินงานเขียนของผู้อื่นแล้วนำมาพัฒนางานเขียนของตนเอง');
INSERT INTO `bets_indicator` VALUES (466, '2551010201', 13, '25510102010613', '๖. เขียนรายงานการศึกษาค้นคว้าเรื่องที่สนใจตามหลักการเขียนเชิงวิชาการ และใช้ข้อมูลสารสนเทศอ้างอิงอย่างถูกต้อง');
INSERT INTO `bets_indicator` VALUES (467, '2551010201', 13, '25510102010713', '๗. บันทึกการศึกษาค้นคว้า เพื่อนำไปพัฒนาตนเองอย่างสม่ำเสมอ');
INSERT INTO `bets_indicator` VALUES (468, '2551010201', 13, '25510102010813', '๘. มีมารยาทในการเขียน');
INSERT INTO `bets_indicator` VALUES (469, '2551010301', 1, '25510103010101', '๑. ฟังคำแนะนำคำสั่งง่ายๆ และปฏิบัติตาม');
INSERT INTO `bets_indicator` VALUES (470, '2551010301', 1, '25510103010201', '๒. ตอบคำถามและเล่าเรื่องที่ฟังและดูทั้งที่เป็นความรู้และความบันเทิง');
INSERT INTO `bets_indicator` VALUES (471, '2551010301', 1, '25510103010301', '๓. พูดแสดงความคิดเห็นและความรู้สึกจากเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (472, '2551010301', 1, '25510103010401', '๔. พูดสื่อสารได้ตามวัตถุประสงค์');
INSERT INTO `bets_indicator` VALUES (473, '2551010301', 1, '25510103010501', '๕. มีมารยาทในการฟัง การดูและการพูด');
INSERT INTO `bets_indicator` VALUES (474, '2551010301', 2, '25510103010102', '๑. ฟังคำแนะนำคำสั่งที่ซับซ้อนและปฏิบัติตาม');
INSERT INTO `bets_indicator` VALUES (475, '2551010301', 2, '25510103010202', '๒. เล่าเรื่องที่ฟังและดูทั้งที่เป็นความรู้และความบันเทิง');
INSERT INTO `bets_indicator` VALUES (476, '2551010301', 2, '25510103010302', '๓. บอกสาระสำคัญของเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (477, '2551010301', 2, '25510103010402', '๔. ตั้งคำถามและตอบคำถามเกี่ยวกับเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (478, '2551010301', 2, '25510103010502', '๕. พูดแสดงความคิดเห็นและความรู้สึกจากเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (479, '2551010301', 2, '25510103010602', '๖. พูดสื่อสารได้ชัดเจนตรงตามวัตถุประสงค์');
INSERT INTO `bets_indicator` VALUES (480, '2551010301', 2, '25510103010702', '๗. มีมารยาทในการฟัง การดูและการพูด');
INSERT INTO `bets_indicator` VALUES (481, '2551010301', 3, '25510103010103', '๑. เล่ารายละเอียดเกี่ยวกับเรื่องที่ฟังและดูทั้งที่เป็นความรู้และความบันเทิง');
INSERT INTO `bets_indicator` VALUES (482, '2551010301', 3, '25510103010203', '๒. บอกสาระสำคัญจากการฟังและการดู');
INSERT INTO `bets_indicator` VALUES (483, '2551010301', 3, '25510103010303', '๓. ตั้งคำถามและตอบคำถามเกี่ยวกับเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (484, '2551010301', 3, '25510103010403', '๔. พูดแสดงความคิดเห็นและความรู้สึกจากเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (485, '2551010301', 3, '25510103010503', '๕. พูดสื่อสารได้ชัดเจนตรงตามวัตถุประสงค์');
INSERT INTO `bets_indicator` VALUES (486, '2551010301', 3, '25510103010603', '๖. มีมารยาทในการฟัง การดูและการพูด');
INSERT INTO `bets_indicator` VALUES (487, '2551010301', 4, '25510103010104', '๑. จำแนกข้อเท็จจริงและข้อคิดเห็นจากเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (488, '2551010301', 4, '25510103010204', '๒. พูดสรุปความจากการฟังและดู');
INSERT INTO `bets_indicator` VALUES (489, '2551010301', 4, '25510103010304', '๓. พูดแสดงความรู้ความคิดเห็นและความรู้สึกเกี่ยวกับเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (490, '2551010301', 4, '25510103010404', '๔. ตั้งคำถามและตอบคำถามเชิงเหตุผลจากเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (491, '2551010301', 4, '25510103010504', '๕. รายงานเรื่องหรือประเด็นที่ศึกษาค้นคว้าจากการฟังการดู และการสนทนา');
INSERT INTO `bets_indicator` VALUES (492, '2551010301', 4, '25510103010604', '๖. มีมารยาทในการฟัง การดูและการพูด');
INSERT INTO `bets_indicator` VALUES (493, '2551010301', 5, '25510103010105', '๑. พูดแสดงความรู้ความคิดเห็นและความรู้สึกจากเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (494, '2551010301', 5, '25510103010205', '๒. ตั้งคำถามและตอบคำถามเชิงเหตุผลจากเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (495, '2551010301', 5, '25510103010305', '๓. วิเคราะห์ความน่าเชื่อถือจากเรื่องที่ฟังและดูอย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (496, '2551010301', 5, '25510103010405', '๔. พูดรายงานเรื่องหรือประเด็นที่ศึกษาค้นคว้าจากการฟังการดู และการสนทนา');
INSERT INTO `bets_indicator` VALUES (497, '2551010301', 5, '25510103010505', '๕. มีมารยาทในการฟัง การดูและการพูด');
INSERT INTO `bets_indicator` VALUES (498, '2551010301', 6, '25510103010106', '๑. พูดแสดงความรู้ความเข้าใจจุดประสงค์ของเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (499, '2551010301', 6, '25510103010206', '๒. ตั้งคำถามและตอบคำถามเชิงเหตุผลจากเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (500, '2551010301', 6, '25510103010306', '๓. วิเคราะห์ความน่าเชื่อถือจากการฟังและดูสื่อโฆษณาอย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (501, '2551010301', 6, '25510103010406', '๔. พูดรายงานเรื่องหรือประเด็นที่ศึกษาค้นคว้าจากการฟังการดู และการสนทนา');
INSERT INTO `bets_indicator` VALUES (502, '2551010301', 6, '25510103010506', '๕. พูดโน้มน้าวอย่างมีเหตุผลและน่าเชื่อถือ');
INSERT INTO `bets_indicator` VALUES (503, '2551010301', 6, '25510103010606', '๖. มีมารยาทในการฟัง การดูและการพูด');
INSERT INTO `bets_indicator` VALUES (504, '2551010301', 7, '25510103010107', '๑. พูดสรุปใจความสำคัญของเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (505, '2551010301', 7, '25510103010207', '๒. เล่าเรื่องย่อจากเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (506, '2551010301', 7, '25510103010307', '๓. พูดแสดงความคิดเห็นอย่างสร้างสรรค์เกี่ยวกับเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (507, '2551010301', 7, '25510103010407', '๔. ประเมินความน่าเชื่อถือของสื่อที่มีเนื้อหาโน้มน้าวใจ');
INSERT INTO `bets_indicator` VALUES (508, '2551010301', 7, '25510103010507', '๕. พูดรายงานเรื่องหรือประเด็นที่ศึกษาค้นคว้าจากการฟังการดู และการสนทนา');
INSERT INTO `bets_indicator` VALUES (509, '2551010301', 7, '25510103010607', '๖. มีมารยาทในการฟัง การดูและการพูด');
INSERT INTO `bets_indicator` VALUES (510, '2551010301', 8, '25510103010108', '๑. พูดสรุปใจความสำคัญของเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (511, '2551010301', 8, '25510103010208', '๒. วิเคราะห์ข้อเท็จจริงข้อคิดเห็นและความน่าเชื่อถือของข่าวสารจากสื่อต่างๆ');
INSERT INTO `bets_indicator` VALUES (512, '2551010301', 8, '25510103010308', '๓. วิเคราะห์และวิจารณ์เรื่องที่ฟังและดูอย่างมีเหตุผลเพื่อนำข้อคิดมาประยุกต์ใช้ในการดำเนินชีวิต');
INSERT INTO `bets_indicator` VALUES (513, '2551010301', 8, '25510103010408', '๔. พูดในโอกาสต่างๆได้ตรงตามวัตถุประสงค์');
INSERT INTO `bets_indicator` VALUES (514, '2551010301', 8, '25510103010508', '๕. พูดรายงานเรื่องหรือประเด็นที่ศึกษาค้นคว้า');
INSERT INTO `bets_indicator` VALUES (515, '2551010301', 8, '25510103010608', '๖. มีมารยาทในการฟัง การดูและการพูด');
INSERT INTO `bets_indicator` VALUES (516, '2551010301', 9, '25510103010109', '๑. แสดงความคิดเห็นและประเมินเรื่องจากการฟังและการดู');
INSERT INTO `bets_indicator` VALUES (517, '2551010301', 9, '25510103010209', '๒. วิเคราะห์และวิจารณ์เรื่องที่ฟังและดูเพื่อนำข้อคิดมาประยุกต์ใช้ในการดำเนินชีวิต');
INSERT INTO `bets_indicator` VALUES (518, '2551010301', 9, '25510103010309', '๓. พูดรายงานเรื่องหรือประเด็นที่ศึกษาค้นคว้า จากการฟัง การดู และการสนทนา');
INSERT INTO `bets_indicator` VALUES (519, '2551010301', 9, '25510103010409', '๔. พูดในโอกาสต่างๆได้ตรงตามวัตถุประสงค์');
INSERT INTO `bets_indicator` VALUES (520, '2551010301', 9, '25510103010509', '๕. พูดโน้มน้าวโดยนำเสนอหลักฐานตามลำดับเนื้อหาอย่างมีเหตุผลและน่าเชื่อถือ');
INSERT INTO `bets_indicator` VALUES (521, '2551010301', 9, '25510103010609', '๖. มีมารยาทในการฟัง การดูและการพูด');
INSERT INTO `bets_indicator` VALUES (522, '2551010301', 13, '25510103010113', '๑. สรุปแนวคิด และแสดงความคิดเห็นจากเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (523, '2551010301', 13, '25510103010213', '๒. วิเคราะห์ แนวคิด การใช้ภาษา และความน่าเชื่อถือจากเรื่องที่ฟังและดูอย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (524, '2551010301', 13, '25510103010313', '๓. ประเมินเรื่องที่ฟังและดูแล้วกำหนดแนวทางนำไประยุกต์ใช้ในการดำเนินชีวิต');
INSERT INTO `bets_indicator` VALUES (525, '2551010301', 13, '25510103010413', '๔. มีวิจารณญาณในการเลือกเรื่องที่ฟังและดู');
INSERT INTO `bets_indicator` VALUES (526, '2551010301', 13, '25510103010513', '๕. พูดในโอกาสต่างๆ พูดแสดงทรรศนะ โต้แย้ง โน้มน้าวใจและเสนอแนวคิดใหม่ด้วยภาษาถูกต้องเหมาะสม');
INSERT INTO `bets_indicator` VALUES (527, '2551010301', 13, '25510103010613', '๖. มีมารยาทในการฟัง การดูและการพูด');
INSERT INTO `bets_indicator` VALUES (528, '2551010401', 1, '25510104010101', '๑. บอกและเขียนพยัญชนะสระ วรรณยุกต์และเลขไทย');
INSERT INTO `bets_indicator` VALUES (529, '2551010401', 1, '25510104010201', '๒. เขียนสะกดคำและบอกความหมายของคำ');
INSERT INTO `bets_indicator` VALUES (530, '2551010401', 1, '25510104010301', '๓. เรียบเรียงคำเป็นประโยคง่าย ๆ');
INSERT INTO `bets_indicator` VALUES (531, '2551010401', 1, '25510104010401', '๔. ต่อคำคล้องจองง่ายๆ');
INSERT INTO `bets_indicator` VALUES (532, '2551010401', 2, '25510104010102', '๑. บอกและเขียนพยัญชนะสระ วรรณยุกต์และเลขไทย');
INSERT INTO `bets_indicator` VALUES (533, '2551010401', 2, '25510104010202', '๒. เขียนสะกดคำและบอกความหมายของคำ');
INSERT INTO `bets_indicator` VALUES (534, '2551010401', 2, '25510104010302', '๓. เรียบเรียงคำเป็นประโยคได้ตรงตามเจตนาของการสื่อสาร');
INSERT INTO `bets_indicator` VALUES (535, '2551010401', 2, '25510104010402', '๔. บอกลักษณะคำคล้องจอง');
INSERT INTO `bets_indicator` VALUES (536, '2551010401', 2, '25510104010502', '๕. เลือกใช้ภาษาไทยมาตรฐานและภาษาถิ่นได้เหมาะสมกับกาลเทศะ');
INSERT INTO `bets_indicator` VALUES (537, '2551010401', 3, '25510104010103', '๑. เขียนสะกดคำและบอกความหมายของคำ');
INSERT INTO `bets_indicator` VALUES (538, '2551010401', 3, '25510104010203', '๒. ระบุชนิดและหน้าที่ของคำในประโยค');
INSERT INTO `bets_indicator` VALUES (539, '2551010401', 3, '25510104010303', '๓. ใช้พจนานุกรมค้นหาความหมายของคำ');
INSERT INTO `bets_indicator` VALUES (540, '2551010401', 3, '25510104010403', '๔. แต่งประโยคง่ายๆ');
INSERT INTO `bets_indicator` VALUES (541, '2551010401', 3, '25510104010503', '๕. แต่งคำคล้องจองและคำขวัญ');
INSERT INTO `bets_indicator` VALUES (542, '2551010401', 3, '25510104010603', '๖. เลือกใช้ภาษาไทยมาตรฐานและภาษาถิ่นได้เหมาะสมกับกาลเทศะ');
INSERT INTO `bets_indicator` VALUES (543, '2551010401', 4, '25510104010104', '๑. สะกดคำและบอกความหมายของคำในบริบทต่างๆ');
INSERT INTO `bets_indicator` VALUES (544, '2551010401', 4, '25510104010204', '๒. ระบุชนิดและหน้าที่ของคำในประโยค');
INSERT INTO `bets_indicator` VALUES (545, '2551010401', 4, '25510104010304', '๓. ใช้พจนานุกรมค้นหาความหมายของคำ');
INSERT INTO `bets_indicator` VALUES (546, '2551010401', 4, '25510104010404', '๔. แต่งประโยคได้ถูกต้องตามหลักภาษา');
INSERT INTO `bets_indicator` VALUES (547, '2551010401', 4, '25510104010504', '๕. แต่งบทร้อยกรองและคำขวัญ');
INSERT INTO `bets_indicator` VALUES (548, '2551010401', 4, '25510104010604', '๖. บอกความหมายของสำนวน');
INSERT INTO `bets_indicator` VALUES (549, '2551010401', 4, '25510104010704', '๗. เปรียบเทียบภาษาไทยมาตรฐานกับภาษาถิ่นได้');
INSERT INTO `bets_indicator` VALUES (550, '2551010401', 5, '25510104010105', '๑. ระบุชนิดและหน้าที่ของคำในประโยค');
INSERT INTO `bets_indicator` VALUES (551, '2551010401', 5, '25510104010205', '๒. จำแนกส่วนประกอบของประโยค');
INSERT INTO `bets_indicator` VALUES (552, '2551010401', 5, '25510104010305', '๓. เปรียบเทียบภาษาไทยมาตรฐานกับภาษาถิ่น');
INSERT INTO `bets_indicator` VALUES (553, '2551010401', 5, '25510104010405', '๔. ใช้คำราชาศัพท์');
INSERT INTO `bets_indicator` VALUES (554, '2551010401', 5, '25510104010505', '๕. บอกคำภาษาต่างประเทศในภาษาไทย');
INSERT INTO `bets_indicator` VALUES (555, '2551010401', 5, '25510104010605', '๖. แต่งบทร้อยกรอง');
INSERT INTO `bets_indicator` VALUES (556, '2551010401', 5, '25510104010705', '๗. ใช้สำนวนได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (557, '2551010401', 6, '25510104010106', '๑. วิเคราะห์ชนิดและหน้าที่ของคำในประโยค');
INSERT INTO `bets_indicator` VALUES (558, '2551010401', 6, '25510104010206', '๒. ใช้คำได้เหมาะสมกับกาลเทศะและบุคคล');
INSERT INTO `bets_indicator` VALUES (559, '2551010401', 6, '25510104010306', '๓. รวบรวมและบอกความหมายของคำภาษาต่างประเทศที่ใช้ในภาษาไทย');
INSERT INTO `bets_indicator` VALUES (560, '2551010401', 6, '25510104010406', '๔. ระบุลักษณะของประโยค');
INSERT INTO `bets_indicator` VALUES (561, '2551010401', 6, '25510104010506', '๕. แต่งบทร้อยกรอง');
INSERT INTO `bets_indicator` VALUES (562, '2551010401', 6, '25510104010606', '๖. วิเคราะห์และเปรียบเทียบสำนวนที่เป็นคำพังเพยและสุภาษิต');
INSERT INTO `bets_indicator` VALUES (563, '2551010401', 7, '25510104010107', '๑. อธิบายลักษณะของเสียงในภาษาไทย');
INSERT INTO `bets_indicator` VALUES (564, '2551010401', 7, '25510104010207', '๒. สร้างคำในภาษาไทย');
INSERT INTO `bets_indicator` VALUES (565, '2551010401', 7, '25510104010307', '๓. วิเคราะห์ชนิดและหน้าที่ของคำในประโยค');
INSERT INTO `bets_indicator` VALUES (566, '2551010401', 7, '25510104010407', '๔. วิเคราะห์ความแตกต่างของภาษาพูดและภาษาเขียน');
INSERT INTO `bets_indicator` VALUES (567, '2551010401', 7, '25510104010507', '๕. แต่งบทร้อยกรอง');
INSERT INTO `bets_indicator` VALUES (568, '2551010401', 7, '25510104010607', '๖. จำแนกและใช้สำนวนที่เป็นคำพังเพยและสุภาษิต');
INSERT INTO `bets_indicator` VALUES (569, '2551010401', 8, '25510104010108', '๑. สร้างคำในภาษาไทย');
INSERT INTO `bets_indicator` VALUES (570, '2551010401', 8, '25510104010208', '๒. วิเคราะห์โครงสร้างประโยคสามัญประโยครวมและประโยคซ้อน');
INSERT INTO `bets_indicator` VALUES (571, '2551010401', 8, '25510104010308', '๓. แต่งบทร้อยกรอง');
INSERT INTO `bets_indicator` VALUES (572, '2551010401', 8, '25510104010408', '๔. ใช้คำราชาศัพท์');
INSERT INTO `bets_indicator` VALUES (573, '2551010401', 8, '25510104010508', '๕. รวบรวมและอธิบายความหมายของคำภาษาต่างประเทศที่ใช้ในภาษาไทย');
INSERT INTO `bets_indicator` VALUES (574, '2551010401', 9, '25510104010109', '๑. จำแนกและใช้คำภาษาต่างประเทศที่ใช้ในภาษาไทย');
INSERT INTO `bets_indicator` VALUES (575, '2551010401', 9, '25510104010209', '๒. วิเคราะห์โครงสร้างประโยคซับซ้อน');
INSERT INTO `bets_indicator` VALUES (576, '2551010401', 9, '25510104010309', '๓. วิเคราะห์ระดับภาษา');
INSERT INTO `bets_indicator` VALUES (577, '2551010401', 9, '25510104010409', '๔. ใช้คำทับศัพท์และศัพท์บัญญัติ');
INSERT INTO `bets_indicator` VALUES (578, '2551010401', 9, '25510104010509', '๕. อธิบายความหมายคำศัพท์ทางวิชาการและวิชาชีพ');
INSERT INTO `bets_indicator` VALUES (579, '2551010401', 9, '25510104010609', '๖. แต่งบทร้อยกรอง');
INSERT INTO `bets_indicator` VALUES (580, '2551010401', 13, '25510104010113', '๑. อธิบายธรรมชาติของภาษาพลังของภาษา และลักษณะของภาษา');
INSERT INTO `bets_indicator` VALUES (581, '2551010401', 13, '25510104010213', '๒. ใช้คำและกลุ่มคำสร้างประโยคตรงตามวัตถุประสงค์');
INSERT INTO `bets_indicator` VALUES (582, '2551010401', 13, '25510104010313', '๓. ใช้ภาษาเหมาะสมแก่โอกาสกาลเทศะ และบุคคล รวมทั้งคำราชาศัพท์อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (583, '2551010401', 13, '25510104010413', '๔. แต่งบทร้อยกรอง');
INSERT INTO `bets_indicator` VALUES (584, '2551010401', 13, '25510104010513', '๕. วิเคราะห์อิทธิพลของภาษาต่างประเทศและภาษาถิ่น');
INSERT INTO `bets_indicator` VALUES (585, '2551010401', 13, '25510104010613', '๖. อธิบายและวิเคราะห์หลักการสร้างคำในภาษาไทย');
INSERT INTO `bets_indicator` VALUES (586, '2551010401', 13, '25510104010713', '๗. วิเคราะห์และประเมินการใช้ภาษาจากสื่อสิ่งพิมพ์และสื่ออิเล็กทรอนิกส์');
INSERT INTO `bets_indicator` VALUES (587, '2551010501', 1, '25510105010101', '๑. บอกข้อคิดที่ได้จากการอ่านหรือการฟังวรรณกรรมร้อยแก้วและอยกรองสำหรับเด็ก');
INSERT INTO `bets_indicator` VALUES (588, '2551010501', 1, '25510105010201', '๒. ท่องจำบทอาขยานตามที่กำหนดและบทร้อยกรองตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (589, '2551010501', 2, '25510105010102', '๑. ระบุข้อคิดที่ได้จากการอ่านหรือการฟังวรรณกรรมสำหรับเด็กเพื่อนำไปใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (590, '2551010501', 2, '25510105010202', '๒. ร้องบทร้องเล่นสำหรับเด็กในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (591, '2551010501', 2, '25510105010302', '๓. ท่องจำบทอาขยานตามที่กำหนดและบทร้อยกรองที่มีคุณค่าตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (592, '2551010501', 3, '25510105010103', '๑. ระบุข้อคิดที่ได้จากการอ่านวรรณกรรมเพื่อนำไปใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (593, '2551010501', 3, '25510105010203', '๒. รู้จักเพลงพื้นบ้านและเพลงกล่อมเด็กเพื่อปลูกฝังความชื่นชมวัฒนธรรมท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (594, '2551010501', 3, '25510105010303', '๓. แสดงความคิดเห็นเกี่ยวกับวรรณคดีที่อ่าน');
INSERT INTO `bets_indicator` VALUES (595, '2551010501', 3, '25510105010403', '๔. ท่องจำบทอาขยานตามที่กำหนดและบทร้อยกรองที่มีคุณค่าตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (596, '2551010501', 4, '25510105010104', '๑. ระบุข้อคิดจากนิทานพื้นบ้านหรือนิทานคติธรรม');
INSERT INTO `bets_indicator` VALUES (597, '2551010501', 4, '25510105010204', '๒. อธิบายข้อคิดจากการอ่านเพื่อนำไปใช้ในชีวิตจริง');
INSERT INTO `bets_indicator` VALUES (598, '2551010501', 4, '25510105010304', '๓. ร้องเพลงพื้นบ้าน');
INSERT INTO `bets_indicator` VALUES (599, '2551010501', 4, '25510105010404', '๔. ท่องจำบทอาขยานตามที่กำหนดและบทร้อยกรองที่มีคุณค่าตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (600, '2551010501', 5, '25510105010105', '๑. สรุปเรื่องจากวรรณคดีหรือวรรณกรรมที่อ่าน');
INSERT INTO `bets_indicator` VALUES (601, '2551010501', 5, '25510105010205', '๒. ระบุความรู้และข้อคิดจากการอ่านวรรณคดีและวรรณกรรมที่สามารถนำไปใช้ในชีวิตจริง');
INSERT INTO `bets_indicator` VALUES (602, '2551010501', 5, '25510105010305', '๓. อธิบายคุณค่าของวรรณคดีและวรรณกรรม');
INSERT INTO `bets_indicator` VALUES (603, '2551010501', 5, '25510105010405', '๔. ท่องจำบทอาขยานตามที่กำหนดและบทร้อยกรองที่มีคุณค่าตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (604, '2551010501', 6, '25510105010106', '๑. แสดงความคิดเห็นจากวรรณคดีหรือวรรณกรรมที่อ่าน');
INSERT INTO `bets_indicator` VALUES (605, '2551010501', 6, '25510105010206', '๒. เล่านิทานพื้นบ้านท้องถิ่นตนเอง และนิทานพื้นบ้านของท้องถิ่นอื่น');
INSERT INTO `bets_indicator` VALUES (606, '2551010501', 6, '25510105010306', '๓. อธิบายคุณค่าของวรรณคดีและวรรณกรรมที่อ่านและนำไปประยุกต์ใช้ในชีวิตจริง');
INSERT INTO `bets_indicator` VALUES (607, '2551010501', 6, '25510105010406', '๔. ท่องจำบทอาขยานตามที่กำหนดและบทร้อยกรองที่มีคุณค่าตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (608, '2551010501', 7, '25510105010107', '๑. สรุปเนื้อหาวรรณคดีและวรรณกรรมที่อ่าน');
INSERT INTO `bets_indicator` VALUES (609, '2551010501', 7, '25510105010207', '๒. วิเคราะห์วรรณคดีและวรรณกรรมที่อ่านพร้อมยกเหตุผลประกอบ');
INSERT INTO `bets_indicator` VALUES (610, '2551010501', 7, '25510105010307', '๓. อธิบายคุณค่าของวรรณคดีและวรรณกรรมที่อ่าน');
INSERT INTO `bets_indicator` VALUES (611, '2551010501', 7, '25510105010407', '๔. สรุปความรู้และข้อคิดจากการอ่าน เพื่อประยุกต์ใช้ในชีวิตจริง');
INSERT INTO `bets_indicator` VALUES (612, '2551010501', 7, '25510105010507', '๕. ท่องจำบทอาขยานตามที่กำหนดและบทร้อยกรองที่มีคุณค่าตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (613, '2551010501', 8, '25510105010108', '๑. สรุปเนื้อหาวรรณคดีและวรรณกรรมที่อ่านในระดับที่ยากขึ้น');
INSERT INTO `bets_indicator` VALUES (614, '2551010501', 8, '25510105010208', '๒. วิเคราะห์และวิจารณ์วรรณคดีวรรณกรรมและวรรณกรรมท้องถิ่นที่อ่านพร้อมยกเหตุผลประกอบ');
INSERT INTO `bets_indicator` VALUES (615, '2551010501', 8, '25510105010308', '๓. อธิบายคุณค่าของวรรณคดี และวรรณกรรมที่อ่าน');
INSERT INTO `bets_indicator` VALUES (616, '2551010501', 8, '25510105010408', '๔. สรุปความรู้และข้อคิดจากการอ่านไปประยุกต์ใช้ในชีวิตจริง');
INSERT INTO `bets_indicator` VALUES (617, '2551010501', 8, '25510105010508', '๕. ท่องจำบทอาขยานตามที่กำหนดและบทร้อยกรองที่มีคุณค่าตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (618, '2551010501', 9, '25510105010109', '๑. สรุปเนื้อหาวรรณคดีวรรณกรรมและวรรณกรรมท้องถิ่น ในระดับที่ยากยิ่งขึ้น');
INSERT INTO `bets_indicator` VALUES (619, '2551010501', 9, '25510105010209', '๒. วิเคราะห์วิถีไทย และคุณค่าจากวรรณคดี และวรรณกรรมที่อ่าน');
INSERT INTO `bets_indicator` VALUES (620, '2551010501', 9, '25510105010309', '๓. สรุปความรู้และข้อคิดจากการอ่าน เพื่อนำไปประยุกต์ใช้ในชีวิตจริง');
INSERT INTO `bets_indicator` VALUES (621, '2551010501', 9, '25510105010409', '๔. ท่องจำและบอกคุณค่าบทอาขยานตามที่กำหนดและบทร้อยกรองที่มีคุณค่าตามความสนใจและนำไปใช้อ้างอิง');
INSERT INTO `bets_indicator` VALUES (622, '2551010501', 13, '25510105010113', '๑. วิเคราะห์และวิจารณ์วรรณคดีและวรรณกรรมตามหลักการวิจารณ์เบื้องต้น');
INSERT INTO `bets_indicator` VALUES (623, '2551010501', 13, '25510105010213', '๒. วิเคราะห์ลักษณะเด่นของวรรณคดีเชื่อมโยงกับการเรียนรู้ทางประวัติศาสตร์และวิถีชีวิตของสังคมในอดีต');
INSERT INTO `bets_indicator` VALUES (624, '2551010501', 13, '25510105010313', '๓. วิเคราะห์และประเมินคุณค่าด้านวรรณศิลป์ของวรรณคดีและวรรณกรรมในฐานะที่เป็นมรดกทางวัฒนธรรมของชาติ');
INSERT INTO `bets_indicator` VALUES (625, '2551010501', 13, '25510105010413', '๔. สังเคราะห์ข้อคิดจากวรรณคดีและวรรณกรรมเพื่อนำไปประยุกต์ใช้ในชีวิตจริง');
INSERT INTO `bets_indicator` VALUES (626, '2551010501', 13, '25510105010513', '๕. รวบรวมวรรณกรรมพื้นบ้านและอธิบายภูมิปัญญาทางภาษา');
INSERT INTO `bets_indicator` VALUES (627, '2551010501', 13, '25510105010613', '๖. ท่องจำและบอกคุณค่าบทอาขยานตามที่กำหนดและบทร้อยกรองที่มีคุณค่าตามความสนใจ และนำไปใช้อ้างอิง');
INSERT INTO `bets_indicator` VALUES (628, '2551020101', 1, '25510201010101', '๑. เขียนและอ่านตัวเลขฮินดูอารบิกและตัวเลขไทยแสดงปริมาณของสิ่งของหรือจำนวนนับที่ไม่เกินหนึ่งร้อยและศูนย์');
INSERT INTO `bets_indicator` VALUES (629, '2551020101', 1, '25510201010201', '๒. เปรียบเทียบและเรียงลำดับจำนวนนับไม่เกินหนึ่งร้อยและศูนย์');
INSERT INTO `bets_indicator` VALUES (630, '2551020101', 2, '25510201010102', '๑. เขียนและอ่านตัวเลขฮินดูอารบิกตัวเลขไทยและตัวหนังสือแสดงปริมาณของสิ่งของหรือจำนวนนับที่ไม่เกินหนึ่งพันและศูนย์');
INSERT INTO `bets_indicator` VALUES (631, '2551020101', 2, '25510201010202', '๒. เปรียบเทียบและเรียงลำดับจำนวนนับ ไม่เกินหนึ่งพันและศูนย์');
INSERT INTO `bets_indicator` VALUES (632, '2551020101', 3, '25510201010103', '๑. เขียนและอ่านตัวเลขฮินดูอารบิกตัวเลขไทยและตัวหนังสือแสดงปริมาณของสิ่งของหรือจำนวนนับที่ไม่เกินหนึ่งแสนและศูนย์');
INSERT INTO `bets_indicator` VALUES (633, '2551020101', 3, '25510201010203', '๒. เปรียบเทียบและเรียงลำดับจำนวนนับไม่เกินหนึ่งแสนและศูนย์');
INSERT INTO `bets_indicator` VALUES (634, '2551020101', 4, '25510201010104', '๑. เขียนและอ่านตัวเลขฮินดูอารบิกตัวเลขไทยและตัวหนังสือแสดงจำนวนนับศูนย์ เศษส่วนและทศนิยมหนึ่งตำแหน่ง');
INSERT INTO `bets_indicator` VALUES (635, '2551020101', 4, '25510201010204', '๒. เปรียบเทียบและเรียงลำดับจำนวนนับและศูนย์ เศษส่วนและทศนิยมหนึ่งตำแหน่ง');
INSERT INTO `bets_indicator` VALUES (636, '2551020101', 5, '25510201010105', '๑. เขียนและอ่านเศษส่วนจำนวนคละและทศนิยมไม่เกินสองตำแหน่ง');
INSERT INTO `bets_indicator` VALUES (637, '2551020101', 5, '25510201010205', '๒. เปรียบเทียบและเรียงลำดับเศษส่วน และทศนิยมไม่เกินสองตำแหน่ง');
INSERT INTO `bets_indicator` VALUES (638, '2551020101', 5, '25510201010305', '๓. เขียนเศษส่วนในรูปทศนิยมและร้อยละเขียนร้อยละในรูปเศษส่วนและทศนิยม และเขียนทศนิยมในรูปเศษส่วนและร้อยละ');
INSERT INTO `bets_indicator` VALUES (639, '2551020101', 6, '25510201010106', '๑. เขียนและอ่านทศนิยมไม่เกินสามตำแหน่ง');
INSERT INTO `bets_indicator` VALUES (641, '2551020101', 6, '25510201010206', '๒. เปรียบเทียบและเรียงลำดับเศษส่วน และทศนิยมไม่เกินสามตำแหน่ง');
INSERT INTO `bets_indicator` VALUES (642, '2551020101', 6, '25510201010306', '๓. เขียนทศนิยมในรูปเศษส่วนและเขียนเศษส่วนในรูปทศนิยม');
INSERT INTO `bets_indicator` VALUES (643, '2551020101', 7, '25510201010107', '๑. ระบุหรือยกตัวอย่าง และเปรียบเทียบจำนวนเต็มบวกจำนวนเต็มลบศูนย์ เศษส่วนและทศนิยม');
INSERT INTO `bets_indicator` VALUES (644, '2551020101', 7, '25510201010207', '๒. เข้าใจเกี่ยวกับเลขยกกำลังที่มีเลขชี้กำลังเป็นจำนวนเต็มและเขียนแสดงจำนวนให้อยู่ในรูปสัญกรณ์วิทยาศาสตร์(scientific\r\nnotation)');
INSERT INTO `bets_indicator` VALUES (645, '2551020101', 8, '25510201010108', '๑. เขียนเศษส่วนในรูปทศนิยมและเขียนทศนิยมซ้ำในรูปเศษส่วน');
INSERT INTO `bets_indicator` VALUES (646, '2551020101', 8, '25510201010208', '๒. จำแนกจำนวนจริงที่กำหนดให้และยกตัวอย่างจำนวน ตรรกยะและจำนวนอตรรกยะ');
INSERT INTO `bets_indicator` VALUES (647, '2551020101', 8, '25510201010308', '๓. อธิบายและระบุรากที่สองและรากที่สามของจำนวนจริง');
INSERT INTO `bets_indicator` VALUES (648, '2551020101', 8, '25510201010408', '๔. ใช้ความรู้เกี่ยวกับอัตราส่วนสัดส่วน และร้อยละในการแก้โจทย์ปัญหา');
INSERT INTO `bets_indicator` VALUES (650, '2551020101', 13, '25510201010113', '๑. แสดงความสัมพันธ์ของจำนวนต่าง ๆ ในระบบจำนวนจริง');
INSERT INTO `bets_indicator` VALUES (651, '2551020101', 13, '25510201010213', '๒. มีความคิดรวบยอดเกี่ยวกับค่าสัมบูรณ์ของจำนวนจริง');
INSERT INTO `bets_indicator` VALUES (652, '2551020101', 13, '25510201010313', '๓. มีความคิดรวบยอดเกี่ยวกับจำนวนจริงที่อยู่ในรูปเลขยกกำลังที่มีเลขชี้กำลังเป็นจำนวนตรรกยะและจำนวนจริงที่อยู่ในรูปกรณฑ์');
INSERT INTO `bets_indicator` VALUES (653, '2551020102', 1, '25510201020101', '๑. บวก ลบ และบวก ลบระคนของจำนวนนับไม่เกินหนึ่งร้อยและศูนย์ พร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (654, '2551020102', 1, '25510201020201', '๒. วิเคราะห์และหาคำตอบของโจทย์ปัญหาและโจทย์ปัญหาระคนของจำนวนนับไม่เกินหนึ่งร้อยและศูนย์ พร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (655, '2551020102', 2, '25510201020102', '๑. บวก ลบ คูณหาร และบวกลบ คูณ หารระคนของจำนวนนับไม่เกินหนึ่งพันและศูนย์พร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (656, '2551020102', 2, '25510201020202', '๒. วิเคราะห์และหาคำตอบของโจทย์ปัญหาและโจทย์ปัญหาระคนของจำนวนนับไม่เกินหนึ่งพันและศูนย์ พร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (657, '2551020102', 3, '25510201020103', '๑. บวก ลบ คูณหาร และบวก ลบคูณ หารระคนของจำนวนนับไม่เกินหนึ่งแสนและศูนย์ พร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (658, '2551020102', 3, '25510201020203', '๒. วิเคราะห์และแสดงวิธีหาคำตอบของโจทย์ปัญหาและโจทย์ปัญหาระคนของจำนวนนับไม่เกินหนึ่งแสน และศูนย์พร้อมทั้งตระหนักถึงวามสมเหตุสมผลของคำตอบ และสร้างโจทย์ได้');
INSERT INTO `bets_indicator` VALUES (659, '2551020102', 4, '25510201020104', '๑. บวก ลบ คูณหาร และบวกลบ คูณ หารระคนของจำนวนนับ และศูนย์ พร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (660, '2551020102', 4, '25510201020204', '๒. วิเคราะห์และแสดงวิธีหาคำตอบของโจทย์ปัญหาและโจทย์ปัญหาระคนของจำนวนนับและศูนย์ พร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ และสร้างโจทย์ได้');
INSERT INTO `bets_indicator` VALUES (661, '2551020102', 4, '25510201020304', '๓. บวกและลบเศษส่วนที่มีตัวส่วนเท่ากัน');
INSERT INTO `bets_indicator` VALUES (662, '2551020102', 5, '25510201020105', '๑. บวก ลบ คูณหาร และบวกลบ คูณระคนของเศษส่วนพร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (663, '2551020102', 5, '25510201020205', '๒. บวก ลบ คูณและบวก ลบคูณระคนของทศนิยมที่คำตอบเป็นทศนิยมไม่เกินสองตำแหน่งพร้อมทั้งตระหนัก ถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (664, '2551020102', 5, '25510201020305', '๓. วิเคราะห์และแสดงวิธีหาคำตอบของโจทย์ปัญหาและโจทย์ปัญหาระคนของจำนวนนับเศษส่วน ทศนิยมและร้อยละพร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ และสร้างโจทย์ปัญหาเกี่ยวกับจำนวนนับได้');
INSERT INTO `bets_indicator` VALUES (665, '2551020102', 6, '25510201020106', '๑. บวก ลบ คูณหารและบวกลบ คูณ หารระคนของเศษส่วนจำนวนคละและทศนิยมพร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (666, '2551020102', 6, '25510201020206', '๒.วิเคราะห์และแสดงวิธีหาคำตอบของโจทย์ปัญหาและโจทย์ปัญหาระคนของจำนวนนับเศษส่วนจำนวนคละทศนิยม และร้อยละ พร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ และสร้างโจทย์ปัญหาเกี่ยวกับจำนวนนับได้');
INSERT INTO `bets_indicator` VALUES (667, '2551020102', 7, '25510201020107', '๑. บวก ลบ คูณหารจำนวนเต็มและนำไปใช้แก้ปัญหา ตระหนักถึงความสมเหตุสมผลของคำตอบอธิบายผลที่เกิดขึ้นจากการบวก การลบการคูณ การหาร และบอกความสัมพันธ์ของการบวกกับการลบการคูณกับการหารของจำนวนเต็ม');
INSERT INTO `bets_indicator` VALUES (668, '2551020102', 7, '25510201020207', '๒. บวก ลบ คูณหารเศษส่วนและทศนิยมและนำไปใช้แก้ปัญหาตระหนักถึงความสมเหตุสมผลของคำตอบ อธิบายผลที่เกิดขึ้นจากการบวก การลบการคูณ การหารและบอกความสัมพันธ์ของการบวกกับการลบการคูณกับการหารของเศษส่วน และทศนิยม');
INSERT INTO `bets_indicator` VALUES (669, '2551020102', 7, '25510201020307', '๓. อธิบายผลที่เกิดขึ้นจากการยกกำลังของจำนวนเต็มเศษส่วนและทศนิยม');
INSERT INTO `bets_indicator` VALUES (670, '2551020102', 7, '25510201020407', '๔. คูณและหารเลขยกกำลังที่มีฐานเดียวกันและเลขชี้กำลังเป็นจำนวนเต็ม');
INSERT INTO `bets_indicator` VALUES (671, '2551020102', 8, '25510201020108', '๑. หารากที่สองและรากที่สามของจำนวนเต็มโดยการแยกตัวประกอบ และนำไปใช้ในการแก้ปัญหาพร้อมทั้งตระหนักถึง ความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (672, '2551020102', 8, '25510201020208', '๒. อธิบายผลที่เกิดขึ้นจากการหารากที่สองและรากที่สามของจำนวนเต็มเศษส่วนและทศนิยม บอกความสัมพันธ์ของการยกกำลังกับการหารากของจำนวนจริง');
INSERT INTO `bets_indicator` VALUES (673, '2551020102', 13, '25510201020113', '๑. เข้าใจความหมาย และหาผลลัพธ์ที่เกิดจากการบวก การลบการคูณ การหาร จำนวนจริงจำนวนจริงที่อยู่ในรูปเลขยกกำลังที่มีเลขชี้กำลังเป็นจำนวนตรรกยะ และจำนวนจริงที่อยู่ในรูปกรณฑ์');
INSERT INTO `bets_indicator` VALUES (674, '2551020103', 5, '25510201030105', '๑. บอกค่าประมาณใกล้เคียงจำนวนเต็มสิบเต็มร้อย และเต็มพันของจำนวนนับ และนำไปใช้ได้');
INSERT INTO `bets_indicator` VALUES (675, '2551020103', 6, '25510201030106', '๑. บอกค่าประมาณใกล้เคียงจำนวนเต็มหลักต่าง ๆของจำนวนนับและนำไปใช้ได้');
INSERT INTO `bets_indicator` VALUES (676, '2551020103', 6, '25510201030206', '๒. บอกค่าประมาณของทศนิยมไม่เกินสามตำแหน่ง');
INSERT INTO `bets_indicator` VALUES (677, '2551020103', 7, '25510201030107', '๑. ใช้การประมาณค่าในสถานการณ์ต่าง ๆ ได้อย่างเหมาะสมรวมถึงใช้ในการพิจารณาความสมเหตุสมผลของคำตอบที่ได้จากการคำนวณ');
INSERT INTO `bets_indicator` VALUES (678, '2551020103', 8, '25510201030108', '๑. หาค่าประมาณของรากที่สองและรากที่สามของจำนวนจริงและนำไปใช้ในการแก้ปัญหาพร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (679, '2551020103', 13, '25510201030113', '๑. หาค่าประมาณของจำนวนจริงที่อยู่ในรูปกรณฑ์ และจำนวนจริงที่อยู่ในรูปเลขยกกำลังโดยใช้วิธีการคำนวณที่เหมาะสม');
INSERT INTO `bets_indicator` VALUES (680, '2551020104', 6, '25510201040106', '๑. ใช้สมบัติการสลับที่สมบัติการเปลี่ยนหมู่และสมบัติการแจกแจงในการคิดคำนวณ');
INSERT INTO `bets_indicator` VALUES (681, '2551020104', 6, '25510201040206', '๒. หา ห.ร.มและ ค.ร.น.ของจำนวนนับ');
INSERT INTO `bets_indicator` VALUES (682, '2551020104', 7, '25510201040107', '๑. นำความรู้และสมบัติเกี่ยวกับจำนวนเต็มไปใช้ในการแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (683, '2551020104', 8, '25510201040108', '๑. บอกความเกี่ยวข้องของจำนวนจริงจำนวนตรรกยะและจำนวนอตรรกยะ');
INSERT INTO `bets_indicator` VALUES (684, '2551020104', 13, '25510201040113', '๑. เข้าใจสมบัติของจำนวนจริงเกี่ยวกับการบวก การคูณการเท่ากัน การไม่เท่ากันและนำไปใช้ได้');
INSERT INTO `bets_indicator` VALUES (685, '2551020201', 1, '25510202010101', '๑. บอกความยาวน้ำหนัก ปริมาตรและความจุโดยใช้หน่วยที่ไม่ใช่หน่วยมาตรฐาน');
INSERT INTO `bets_indicator` VALUES (686, '2551020201', 1, '25510202010201', '๒. บอกช่วงเวลาจำนวนวันและชื่อวันในสัปดาห์');
INSERT INTO `bets_indicator` VALUES (687, '2551020201', 2, '25510202010102', '๑. บอกความยาวเป็นเมตร และเซนติเมตร และเปรียบเทียบความยาวในหน่วยเดียวกัน');
INSERT INTO `bets_indicator` VALUES (688, '2551020201', 2, '25510202010202', '๒. บอกน้ำหนักเป็นกิโลกรัมและขีด และเปรียบเทียบน้ำหนักในหน่วยเดียวกัน');
INSERT INTO `bets_indicator` VALUES (689, '2551020201', 2, '25510202010302', '๓. บอกปริมาตรและความจุเป็นลิตร และเปรียบเทียบปริมาตรและความจุ');
INSERT INTO `bets_indicator` VALUES (690, '2551020201', 2, '25510202010402', '๔. บอกจำนวนเงินทั้งหมดจากเงินเหรียญและธนบัตร');
INSERT INTO `bets_indicator` VALUES (691, '2551020201', 2, '25510202010502', '๕. บอกเวลาบนหน้าปัดนาฬิกา(ช่วง ๕ นาที)');
INSERT INTO `bets_indicator` VALUES (692, '2551020201', 2, '25510202010602', '๖. บอกวัน เดือนปี จากปฏิทิน');
INSERT INTO `bets_indicator` VALUES (693, '2551020201', 3, '25510202010103', '๑. บอกความยาวเป็น เมตรเซนติเมตรและมิลลิเมตรเลือกเครื่องวัดที่เหมาะสมและเปรียบเทียบความยาว');
INSERT INTO `bets_indicator` VALUES (694, '2551020201', 3, '25510202010203', '๒. บอกน้ำหนักเป็นกิโลกรัมกรัม และขีดเลือกเครื่องชั่งที่เหมาะสม และเปรียบเทียบน้ำหนัก');
INSERT INTO `bets_indicator` VALUES (695, '2551020201', 3, '25510202010303', '๓. บอกปริมาตรและความจุเป็นลิตรมิลลิลิตรเลือกเครื่องตวงที่เหมาะสมและเปรียบเทียบปริมาตรและความจุในหน่วยเดียวกัน');
INSERT INTO `bets_indicator` VALUES (696, '2551020201', 3, '25510202010403', '๔. บอกเวลาบนหน้าปัดนาฬิกา(ช่วง ๕ นาที)อ่านและเขียนบอกเวลาโดยใช้จุด');
INSERT INTO `bets_indicator` VALUES (697, '2551020201', 3, '25510202010503', '๕. บอกความสัมพันธ์ของหน่วยการวัดความยาวน้ำหนัก และเวลา');
INSERT INTO `bets_indicator` VALUES (698, '2551020201', 3, '25510202010603', '๖. อ่านและเขียนจำนวนเงินโดยใช้จุด');
INSERT INTO `bets_indicator` VALUES (699, '2551020201', 4, '25510202010104', '๑. บอกความสัมพันธ์ของหน่วยการวัดความยาว น้ำหนักปริมาตรหรือความจุ และเวลา');
INSERT INTO `bets_indicator` VALUES (700, '2551020201', 4, '25510202010204', '๒. หาพื้นที่ของรูปสี่เหลี่ยมมุมฉาก');
INSERT INTO `bets_indicator` VALUES (701, '2551020201', 4, '25510202010304', '๓. บอกเวลาบนหน้าปัดนาฬิกาอ่านและเขียนเวลาโดย ใช้จุดและบอกระยะเวลา');
INSERT INTO `bets_indicator` VALUES (702, '2551020201', 4, '25510202010404', '๔. คาดคะเนความยาวน้ำหนักปริมาตรหรือความจุ');
INSERT INTO `bets_indicator` VALUES (703, '2551020201', 5, '25510202010105', '๑. บอกความสัมพันธ์ของหน่วยการวัดปริมาตรหรือความจุ');
INSERT INTO `bets_indicator` VALUES (704, '2551020201', 5, '25510202010205', '๒.หาความยาวรอบรูป ของรูปสี่เหลี่ยมรูปสามเหลี่ยม');
INSERT INTO `bets_indicator` VALUES (705, '2551020201', 5, '25510202010305', '๓.หาพื้นที่ของรูปสี่เหลี่ยม มุมฉากและรูปสามเหลี่ยม');
INSERT INTO `bets_indicator` VALUES (706, '2551020201', 5, '25510202010405', '๔. วัดขนาดของมุม');
INSERT INTO `bets_indicator` VALUES (707, '2551020201', 5, '25510202010505', '๕. หาปริมาตรหรือความจุของทรงสี่เหลี่ยมมุมฉาก');
INSERT INTO `bets_indicator` VALUES (708, '2551020201', 6, '25510202010106', '๑. อธิบายเส้นทางหรือบอกตำแหน่งของสิ่งต่างๆ โดยระบุทิศทางและระยะทางจริงจากรูปภาพแผนที่ และแผนผัง');
INSERT INTO `bets_indicator` VALUES (709, '2551020201', 6, '25510202010206', '๒. หาพื้นที่ของรูปสี่เหลี่ยม');
INSERT INTO `bets_indicator` VALUES (710, '2551020201', 6, '25510202010306', '๓. หาความยาวรอบรูป และพื้นที่ของรูปวงกลม');
INSERT INTO `bets_indicator` VALUES (711, '2551020201', 8, '25510202010108', '๑. เปรียบเทียบหน่วยความยาวหน่วยพื้นที่ในระบบเดียวกันและต่างระบบและเลือกใช้หน่วยการวัดได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (712, '2551020201', 8, '25510202010208', '๒. คาดคะเนเวลา ระยะทางพื้นที่ ปริมาตรและน้ำหนักได้อย่างใกล้เคียงและอธิบายวิธีการที่ใช้ในการคาดคะเน');
INSERT INTO `bets_indicator` VALUES (713, '2551020201', 8, '25510202010308', '๓. ใช้การคาดคะเนเกี่ยวกับการวัดในสถานการณ์ต่าง ๆ ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (714, '2551020201', 9, '25510202010109', '๑. หาพื้นที่ผิวของปริซึมและทรงกระบอก');
INSERT INTO `bets_indicator` VALUES (715, '2551020201', 9, '25510202010209', '๒. หาปริมาตรของปริซึมทรงกระบอกพีระมิด กรวยและทรงกลม');
INSERT INTO `bets_indicator` VALUES (716, '2551020201', 9, '25510202010309', '๓. เปรียบเทียบหน่วยความจุหรือหน่วยปริมาตรในระบบเดียวกันหรือต่างระบบและเลือกใช้หน่วยการวัดได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (717, '2551020201', 9, '25510202010409', '๔. ใช้การคาดคะเนเกี่ยวกับการวัดในสถานการณ์ต่างๆได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (718, '2551020201', 13, '25510202010113', '๑. ใช้ความรู้เรื่องอัตราส่วนตรีโกณมิติของมุมในการคาดคะเนระยะทางและความสูง');
INSERT INTO `bets_indicator` VALUES (719, '2551020202', 2, '25510202020102', '๑. แก้ปัญหาเกี่ยวกับการวัดความยาวการชั่ง การตวงและเงิน');
INSERT INTO `bets_indicator` VALUES (720, '2551020202', 3, '25510202020103', '๑. แก้ปัญหาเกี่ยวกับการวัดความยาวการชั่ง การตวงเงิน และเวลา');
INSERT INTO `bets_indicator` VALUES (721, '2551020202', 3, '25510202020203', '๒.อ่านและเขียนบันทึกรายรับรายจ่าย');
INSERT INTO `bets_indicator` VALUES (722, '2551020202', 3, '25510202020303', '๓. อ่านและเขียนบันทึกกิจกรรมหรือเหตุการณ์ที่ระบุเวลา');
INSERT INTO `bets_indicator` VALUES (723, '2551020202', 4, '25510202020104', '๑. แก้ปัญหาเกี่ยวกับการวัดความยาวการชั่ง การตวงเงิน และเวลา');
INSERT INTO `bets_indicator` VALUES (724, '2551020202', 4, '25510202020204', '๒. เขียนบันทึกรายรับ รายจ่าย');
INSERT INTO `bets_indicator` VALUES (725, '2551020202', 4, '25510202020304', '๓. อ่านและเขียนบันทึกกิจกรรมหรือเหตุการณ์ที่ระบุเวลา');
INSERT INTO `bets_indicator` VALUES (726, '2551020202', 5, '25510202020105', '๑. แก้ปัญหาเกี่ยวกับพื้นที่ความยาวรอบรูปของรูปสี่เหลี่ยมมุมฉากและรูปสามเหลี่ยม');
INSERT INTO `bets_indicator` VALUES (727, '2551020202', 6, '25510202020106', '๑. แก้ปัญหาเกี่ยวกับพื้นที่ความยาวรอบรูปของรูปสี่เหลี่ยมและรูปวงกลม');
INSERT INTO `bets_indicator` VALUES (728, '2551020202', 6, '25510202020206', '๒. แก้ปัญหาเกี่ยวกับปริมาตรและความจุของทรงสี่เหลี่ยมมุมฉาก');
INSERT INTO `bets_indicator` VALUES (729, '2551020202', 6, '25510202020306', '๓. เขียนแผนผังแสดงตำแหน่งของสิ่งต่าง ๆและแผนผังแสดงเส้นทางการเดินทาง');
INSERT INTO `bets_indicator` VALUES (730, '2551020202', 8, '25510202020108', '๑. ใช้ความรู้เกี่ยวกับความยาวและพื้นที่แก้ปัญหาในสถานการณ์ต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (731, '2551020202', 9, '25510202020109', '๑. ใช้ความรู้เกี่ยวกับพื้นที่พื้นที่ผิว และปริมาตรในการแก้ปัญหาในสถานการณ์ต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (732, '2551020202', 13, '25510202020113', '๑. แก้โจทย์ปัญหาเกี่ยวกับระยะทางและความสูงโดยใช้อัตราส่วนตรีโกณมิติ');
INSERT INTO `bets_indicator` VALUES (733, '2551020301', 1, '25510203010101', '๑. จำแนกรูปสามเหลี่ยมรูปสี่เหลี่ยมรูปวงกลมรูปวงรี');
INSERT INTO `bets_indicator` VALUES (734, '2551020301', 2, '25510203010102', '๑. บอกชนิดของรูปเรขาคณิตสองมิติว่าเป็นรูปสามเหลี่ยมรูปสี่เหลี่ยมรูปวงกลม หรือรูปวงรี');
INSERT INTO `bets_indicator` VALUES (735, '2551020301', 2, '25510203010202', '๒. บอกชนิดของรูปเรขาคณิตสามมิติว่า เป็นทรงสี่เหลี่ยมมุมฉากทรงกลมหรือทรงกระบอก');
INSERT INTO `bets_indicator` VALUES (736, '2551020301', 2, '25510203010302', '๓. จำแนกระหว่างรูปสี่เหลี่ยมมุมฉากกับทรงสี่เหลี่ยมมุมฉาก และรูปวงกลมกับทรงกลม');
INSERT INTO `bets_indicator` VALUES (737, '2551020301', 3, '25510203010103', '๑. บอกชนิดของรูปเรขาคณิตสองมิติที่เป็นส่วนประกอบของสิ่งของที่มีลักษณะเป็นรูปเรขาคณิตสามมิติ');
INSERT INTO `bets_indicator` VALUES (738, '2551020301', 3, '25510203010203', '๒. ระบุรูปเรขาคณิตสองมิติที่มีแกนสมมาตรจากรูปที่กำหนดให้');
INSERT INTO `bets_indicator` VALUES (739, '2551020301', 3, '25510203010303', '๓. เขียนชื่อจุดเส้นตรง รังสีส่วนของเส้นตรงมุม และเขียนสัญลักษณ์');
INSERT INTO `bets_indicator` VALUES (740, '2551020301', 4, '25510203010104', '๑. บอกชนิดของมุม ชื่อมุมส่วนประกอบของมุม และเขียนสัญลักษณ์');
INSERT INTO `bets_indicator` VALUES (741, '2551020301', 4, '25510203010204', '๒. บอกได้ว่าเส้นตรงหรือส่วนของเส้นตรงคู่ใดขนานกันพร้อมทั้งใช้สัญลักษณ์แสดงการขนาน');
INSERT INTO `bets_indicator` VALUES (742, '2551020301', 4, '25510203010304', '๓. บอกส่วนประกอบของรูปวงกลม');
INSERT INTO `bets_indicator` VALUES (743, '2551020301', 4, '25510203010404', '๔. บอกได้ว่ารูปใดหรือส่วนใดของสิ่งของมีลักษณะเป็นรูปสี่เหลี่ยมมุมฉากและจำแนกได้ว่าเป็นรูปสี่เหลี่ยมจัตุรัสหรือรูปสี่เหลี่ยมผืนผ้า');
INSERT INTO `bets_indicator` VALUES (744, '2551020301', 4, '25510203010504', '๕. บอกได้ว่ารูปเรขาคณิตสองมิติรูปใดเป็นรูปที่มีแกนสมมาตรและบอกจำนวนแกนสมมาตร');
INSERT INTO `bets_indicator` VALUES (745, '2551020301', 5, '25510203010105', '๑. บอกลักษณะและจำแนกรูปเรขาคณิตสามมิติชนิดต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (746, '2551020301', 5, '25510203010205', '๒. บอกลักษณะความสัมพันธ์และจำแนกรูปสี่เหลี่ยมชนิดต่างๆ');
INSERT INTO `bets_indicator` VALUES (747, '2551020301', 5, '25510203010305', '๓. บอกลักษณะส่วนประกอบความสัมพันธ์และจำแนกรูปสามเหลี่ยมชนิดต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (748, '2551020301', 6, '25510203010106', '๑. บอกชนิดของรูปเรขาคณิตสองมิติที่เป็นส่วนประกอบของรูปเรขาคณิตสามมิติ');
INSERT INTO `bets_indicator` VALUES (749, '2551020301', 6, '25510203010206', '๒. บอกสมบัติของเส้นทแยงมุมของรูปสี่เหลี่ยมชนิดต่างๆ');
INSERT INTO `bets_indicator` VALUES (750, '2551020301', 6, '25510203010306', '๓. บอกได้ว่าเส้นตรงคู่ใดขนานกัน');
INSERT INTO `bets_indicator` VALUES (751, '2551020301', 7, '25510203010107', '๑. สร้างและบอกขั้นตอนการสร้างพื้นฐานทางเรขาคณิต');
INSERT INTO `bets_indicator` VALUES (752, '2551020301', 7, '25510203010207', '๒. สร้างรูปเรขาคณิตสองมิติโดยใช้การสร้างพื้นฐานทางเรขาคณิตและบอกขั้นตอนการสร้างโดยไม่เน้นการพิสูจน์');
INSERT INTO `bets_indicator` VALUES (753, '2551020301', 7, '25510203010307', '๓. สืบเสาะสังเกต และคาดการณ์เกี่ยวกับสมบัติทางเรขาคณิต');
INSERT INTO `bets_indicator` VALUES (754, '2551020301', 7, '25510203010407', '๔. อธิบายลักษณะของรูปเรขาคณิตสามมิติจากภาพที่กำหนดให้');
INSERT INTO `bets_indicator` VALUES (755, '2551020301', 7, '25510203010507', '๕. ระบุภาพสองมิติที่ได้จากการมองด้านหน้า(front view)ด้านข้าง (sideview) หรือด้านบน (topview) ของรูปเรขาคณิตสามมิติที่กำหนดให้');
INSERT INTO `bets_indicator` VALUES (756, '2551020301', 7, '25510203010607', '๖. วาดหรือประดิษฐ์รูปเรขาคณิตสามมิติที่ประกอบขึ้นจากลูกบาศก์เมื่อกำหนดภาพสองมิติที่ได้จากการมองด้านหน้าด้านข้าง และด้านบนให้');
INSERT INTO `bets_indicator` VALUES (757, '2551020301', 9, '25510203010109', '๑. อธิบายลักษณะและสมบัติของปริซึมพีระมิดทรงกระบอกกรวย และทรงกลม');
INSERT INTO `bets_indicator` VALUES (758, '2551020302', 2, '25510203020102', '๑. เขียนรูปเรขาคณิตสองมิติโดยใช้แบบของรูปเรขาคณิต');
INSERT INTO `bets_indicator` VALUES (759, '2551020302', 3, '25510203020103', '๑. เขียนรูปเรขาคณิตสองมิติที่กำหนดให้ในแบบต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (760, '2551020302', 3, '25510203020203', '๒. บอกรูปเรขาคณิตต่าง ๆที่อยู่ในสิ่งแวดล้อมรอบตัว');
INSERT INTO `bets_indicator` VALUES (761, '2551020302', 4, '25510203020104', '๑. นำรูปเรขาคณิตมาประดิษฐ์เป็นลวดลายต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (762, '2551020302', 5, '25510203020105', '๑. สร้างมุมโดยใช้โพรแทรกเตอร์');
INSERT INTO `bets_indicator` VALUES (763, '2551020302', 5, '25510203020205', '๒. สร้างรูปสี่เหลี่ยมมุมฉากรูปสามเหลี่ยมและรูปวงกลม');
INSERT INTO `bets_indicator` VALUES (764, '2551020302', 5, '25510203020305', '๓. สร้างเส้นขนานโดยใช้ไม้ฉาก');
INSERT INTO `bets_indicator` VALUES (765, '2551020302', 6, '25510203020106', '๑. ประดิษฐ์ทรงสี่เหลี่ยมมุมฉากทรงกระบอกกรวย ปริซึมและพีระมิดจากรูปคลี่ หรือรูปเรขาคณิตสองมิติที่กำหนดให้');
INSERT INTO `bets_indicator` VALUES (766, '2551020302', 6, '25510203020206', '๒. สร้างรูปสี่เหลี่ยมชนิดต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (767, '2551020302', 8, '25510203020108', '๑. ใช้สมบัติเกี่ยวกับความเท่ากันทุกประการของรูป สามเหลี่ยมและสมบัติของเส้นขนานในการให้เหตุผล และแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (768, '2551020302', 8, '25510203020208', '๒. ใช้ทฤษฎีบทพีทาโกรัสและบทกลับในการให้เหตุผลและแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (769, '2551020302', 8, '25510203020308', '๓. เข้าใจเกี่ยวกับการแปลงทางเรขาคณิตใน เรื่องการเลื่อนขนาน การสะท้อนและการหมุนและ นำไปใช้');
INSERT INTO `bets_indicator` VALUES (770, '2551020302', 8, '25510203020408', '๔. บอกภาพที่เกิดขึ้นจากการเลื่อนขนานการสะท้อนและการหมุนรูปต้นแบบ และอธิบายวิธีการที่จะได้ภาพที่ปรากฏเมื่อกำหนดรูปต้นแบบและภาพนั้นให้');
INSERT INTO `bets_indicator` VALUES (771, '2551020302', 9, '25510203020109', '๑. ใช้สมบัติของรูปสามเหลี่ยมคล้ายในการให้เหตุผล และการแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (772, '2551020401', 1, '25510204010101', '๑. บอกจำนวนและความสัมพันธ์ในแบบรูปของจำนวนที่เพิ่มขึ้นทีละ ๑ ทีละ ๒และลดลงทีละ ๑');
INSERT INTO `bets_indicator` VALUES (773, '2551020401', 1, '25510204010201', '๒. บอกรูปและความสัมพันธ์ในแบบรูปของรูปที่มีรูปร่างขนาด หรือสีที่สัมพันธ์กันอย่างใดอย่างหนึ่ง');
INSERT INTO `bets_indicator` VALUES (774, '2551020401', 2, '25510204010102', '๑. บอกจำนวนและความสัมพันธ์ในแบบรูปของจำนวนที่เพิ่มขึ้นทีละ ๕ ทีละ ๑๐ทีละ ๑๐๐ และลดลงทีละ ๒ทีละ ๑๐ ทีละ๑๐๐');
INSERT INTO `bets_indicator` VALUES (775, '2551020401', 2, '25510204010202', '๒. บอกรูปและความสัมพันธ์ในแบบรูปของรูปที่มีรูปร่างขนาด หรือสีที่สัมพันธ์กันอย่างใดอย่างหนึ่ง');
INSERT INTO `bets_indicator` VALUES (776, '2551020401', 3, '25510204010103', '๑. บอกจำนวนและความสัมพันธ์ในแบบรูปของจำนวนที่เพิ่มขึ้นทีละ ๓ ทีละ ๔ทีละ ๒๕ ทีละ๕๐ และลดลงทีละ ๓ ทีละ ๔ทีละ ๕ ทีละ ๒๕ทีละ ๕๐ และแบบรูปซ้ำ');
INSERT INTO `bets_indicator` VALUES (777, '2551020401', 3, '25510204010203', '๒.บอกรูปและความสัมพันธ์ในแบบรูปของรูปที่มีรูปร่างขนาด หรือสีที่สัมพันธ์กันสองลักษณะ');
INSERT INTO `bets_indicator` VALUES (778, '2551020401', 4, '25510204010104', '๑. บอกจำนวนและความสัมพันธ์ในแบบรูปของจำนวนที่เพิ่มขึ้นหรือลดลงทีละเท่ากัน');
INSERT INTO `bets_indicator` VALUES (779, '2551020401', 4, '25510204010204', '๒. บอกรูป และความสัมพันธ์ในแบบรูปของรูปที่กำหนดให้');
INSERT INTO `bets_indicator` VALUES (780, '2551020401', 5, '25510204010105', '๑. บอกจำนวนและ ความสัมพันธ์ในแบบรูปของจำนวนที่กำหนดให้');
INSERT INTO `bets_indicator` VALUES (781, '2551020401', 6, '25510204010106', '๑. แก้ปัญหาเกี่ยวกับแบบรูป');
INSERT INTO `bets_indicator` VALUES (782, '2551020401', 7, '25510204010107', '๑ . วิเคราะห์และอธิบายความสัมพันธ์ของแบบรูปที่กำหนดให้');
INSERT INTO `bets_indicator` VALUES (783, '2551020401', 13, '25510204010113', '๑. มีความคิดรวบยอดในเรื่องเซตและการดำเนินการของเซต');
INSERT INTO `bets_indicator` VALUES (784, '2551020401', 13, '25510204010213', '๒. เข้าใจและสามารถใช้การให้เหตุผลแบบอุปนัยและนิรนัย');
INSERT INTO `bets_indicator` VALUES (785, '2551020401', 13, '25510204010313', '๓. มีความคิดรวบยอดเกี่ยวกับความสัมพันธ์และฟังก์ชัน เขียนแสดงความสัมพันธ์และฟังก์ชันในรูปต่าง ๆ เช่น ตาราง กราฟและสมการ');
INSERT INTO `bets_indicator` VALUES (786, '2551020401', 13, '25510204010413', '๔. เข้าใจความหมายของลำดับและหาพจน์ทั่วไปของลำดับจำกัด');
INSERT INTO `bets_indicator` VALUES (787, '2551020401', 13, '25510204010513', '๕. เข้าใจความหมายของลำดับเลขคณิต และลำดับเรขาคณิตหาพจน์ต่างๆของลำดับเลขคณิตและลำดับเรขาคณิต และนำไปใช้');
INSERT INTO `bets_indicator` VALUES (788, '2551020402', 6, '25510204020106', '๑. เขียนสมการจากสถานการณ์หรือปัญหาและแก้สมการพร้อมทั้งตรวจคำตอบ');
INSERT INTO `bets_indicator` VALUES (790, '2551020402', 7, '25510204020107', '๑. แก้สมการเชิงเส้นตัวแปรเดียวอย่างง่าย');
INSERT INTO `bets_indicator` VALUES (791, '2551020402', 7, '25510204020207', '๒. เขียนสมการเชิงเส้นตัวแปรเดียวจากสถานการณ์หรือปัญหาอย่าง ง่าย');
INSERT INTO `bets_indicator` VALUES (792, '2551020402', 7, '25510204020307', '๓. แก้โจทย์ปัญหาเกี่ยวกับสมการเชิงเส้นตัวแปรเดียวอย่างง่ายพร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (793, '2551020402', 7, '25510204020407', '๔. เขียนกราฟบนระนาบในระบบพิกัดฉากแสดงความเกี่ยวข้องของปริมาณสองชุดที่กำหนดให้');
INSERT INTO `bets_indicator` VALUES (794, '2551020402', 7, '25510204020507', '๕. อ่านและแปลความหมายของกราฟบนระนาบในระบบพิกัดฉากที่กำหนดให้');
INSERT INTO `bets_indicator` VALUES (795, '2551020402', 8, '25510204020108', '๑. แก้โจทย์ปัญหาเกี่ยวกับสมการเชิงเส้นตัวแปรเดียวพร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (796, '2551020402', 8, '25510204020208', '๒. หาพิกัดของจุดและอธิบายลักษณะของรูปเรขาคณิตที่เกิดขึ้นจากการเลื่อนขนานการสะท้อน และการหมุนบนระนาบในระบบพิกัดฉาก');
INSERT INTO `bets_indicator` VALUES (797, '2551020402', 9, '25510204020109', '๑. ใช้ความรู้เกี่ยวกับอสมการเชิงเส้นตัวแปรเดียว ในการแก้ปัญหาพร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (798, '2551020402', 9, '25510204020209', '๒. เขียนกราฟแสดงความเกี่ยวข้องระหว่างปริมาณสองชุดที่มีความสัมพันธ์เชิงเส้น');
INSERT INTO `bets_indicator` VALUES (799, '2551020402', 9, '25510204020309', '๓. เขียนกราฟของสมการเชิงเส้นสองตัวแปร');
INSERT INTO `bets_indicator` VALUES (800, '2551020402', 9, '25510204020409', '๔.อ่านและแปลความหมายกราฟของระบบสมการเชิงเส้นสองตัวแปรและกราฟอื่น ๆ');
INSERT INTO `bets_indicator` VALUES (801, '2551020402', 9, '25510204020509', '๕. แก้ระบบสมการเชิงเส้นสองตัวแปรและนำไปใช้แก้ปัญหาพร้อมทั้งตระหนักถึงความสมเหตุสมผลของคำตอบ');
INSERT INTO `bets_indicator` VALUES (802, '2551020402', 13, '25510204020113', '๑. เขียนแผนภาพเวนน์-ออยเลอร์แสดงเซตและนำไปใช้แก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (803, '2551020402', 13, '25510204020213', '๒. ตรวจสอบความสมเหตุสมผลของการให้เหตุผล โดยใช้แผนภาพเวนน์-ออยเลอร์');
INSERT INTO `bets_indicator` VALUES (804, '2551020402', 13, '25510204020313', '๓. แก้สมการ และอสมการตัวแปรเดียวดีกรีไม่เกินสอง');
INSERT INTO `bets_indicator` VALUES (805, '2551020402', 13, '25510204020413', '๔. สร้างความสัมพันธ์หรือฟังก์ชันจากสถานการณ์หรือปัญหา และนำไปใช้ในการแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (806, '2551020402', 13, '25510204020513', '๕. ใช้กราฟของสมการ อสมการฟังก์ชัน ในการแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (807, '2551020402', 13, '25510204020613', '๖. เข้าใจความหมายของผลบวก n พจน์แรกของอนุกรมเลขคณิตและอนุกรมเรขาคณิต หาผลบวก n พจน์แรกของอนุกรมเลขคณิตและอนุกรมเรขาคณิต โดยใช้สูตรและนำไปใช้');
INSERT INTO `bets_indicator` VALUES (808, '2551020501', 3, '25510205010103', '๑. รวบรวมและจำแนกข้อมูลเกี่ยวกับตนเองและสิ่งแวดล้อมใกล้ตัวที่พบเห็นในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (809, '2551020501', 3, '25510205010203', '๒. อ่านข้อมูลจากแผนภูมิรูปภาพ และแผนภูมิแท่งอย่างง่าย');
INSERT INTO `bets_indicator` VALUES (810, '2551020501', 4, '25510205010104', '๑. รวบรวมและจำแนกข้อมูล');
INSERT INTO `bets_indicator` VALUES (811, '2551020501', 4, '25510205010204', '๒. อ่านข้อมูลจากแผนภูมิรูปภาพแผนภูมิแท่งและตาราง');
INSERT INTO `bets_indicator` VALUES (812, '2551020501', 4, '25510205010304', '๓. เขียนแผนภูมิรูปภาพ และแผนภูมิแท่ง');
INSERT INTO `bets_indicator` VALUES (813, '2551020501', 5, '25510205010105', '๑. เขียนแผนภูมิแท่งที่มีการย่นระยะของเส้นแสดงจำนวน');
INSERT INTO `bets_indicator` VALUES (814, '2551020501', 5, '25510205010205', '๒. อ่านข้อมูลจากแผนภูมิแท่งเปรียบเทียบ');
INSERT INTO `bets_indicator` VALUES (815, '2551020501', 6, '25510205010106', '๑. อ่านข้อมูลจากกราฟเส้นและแผนภูมิรูปวงกลม');
INSERT INTO `bets_indicator` VALUES (816, '2551020501', 6, '25510205010206', '๒. เขียนแผนภูมิแท่งเปรียบเทียบและกราฟเส้น');
INSERT INTO `bets_indicator` VALUES (817, '2551020501', 8, '25510205010108', '๑. อ่านและนำเสนอข้อมูลโดยใช้แผนภูมิรูปวงกลม');
INSERT INTO `bets_indicator` VALUES (818, '2551020501', 9, '25510205010109', '๑. กำหนดประเด็นและเขียนข้อคำถามเกี่ยวกับปัญหาหรือสถานการณ์ต่างๆรวมทั้งกำหนดวิธีการศึกษาและการเก็บรวบรวมข้อมูล');
INSERT INTO `bets_indicator` VALUES (819, '2551020501', 9, '25510205010209', '๒. หาค่าเฉลี่ยเลขคณิต มัธยฐานและ ฐานนิยมของข้อมูลที่ไม่ได้แจกแจงความถี่และเลือกใช้ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (820, '2551020501', 9, '25510205010309', '๓. นำเสนอข้อมูลในรูปแบบที่เหมาะสม');
INSERT INTO `bets_indicator` VALUES (821, '2551020501', 9, '25510205010409', '๔. อ่าน แปลความหมายและวิเคราะห์ข้อมูลที่ได้จากการนำเสนอ');
INSERT INTO `bets_indicator` VALUES (822, '2551020501', 13, '25510205010113', '๑. เข้าใจวิธีการสำรวจความคิดเห็นอย่างง่าย');
INSERT INTO `bets_indicator` VALUES (823, '2551020501', 13, '25510205010213', '๒. หาค่าเฉลี่ยเลขคณิต มัธยฐานฐานนิยม ส่วนเบี่ยงเบนมาตรฐานและเปอร์เซ็นไทล์ของข้อมูล');
INSERT INTO `bets_indicator` VALUES (824, '2551020501', 13, '25510205010313', '๓. เลือกใช้ค่ากลางที่เหมาะสมกับข้อมูลและวัตถุประสงค์');
INSERT INTO `bets_indicator` VALUES (825, '2551020502', 5, '25510205020105', '๑. บอกได้ว่าเหตุการณ์ที่กำหนดให้นั้น- เกิดขึ้นอย่างแน่นอน- อาจจะเกิดขึ้นหรือไม่ก็ได้- ไม่เกิดขึ้นอย่างแน่นอน');
INSERT INTO `bets_indicator` VALUES (826, '2551020502', 6, '25510205020106', '๑. อธิบายเหตุการณ์โดยใช้คำที่มีความหมายเช่นเดียวกับคำว่า- เกิดขึ้นอย่างแน่นอน- อาจจะเกิดขึ้นหรือไม่ก็ได้- ไม่เกิดขึ้นอย่างแน่นอน');
INSERT INTO `bets_indicator` VALUES (827, '2551020502', 7, '25510205020107', '๑. อธิบายได้ว่าเหตุการณ์ที่กำหนดให้เหตุการณ์ใดจะมีโอกาสเกิดขึ้นได้มากกว่ากัน');
INSERT INTO `bets_indicator` VALUES (828, '2551020502', 8, '25510205020108', '๑. อธิบายได้ว่าเหตุการณ์ที่กำหนดให้เหตุการณ์ใดเกิดขึ้นแน่นอนเหตุการณ์ใดไม่เกิดขึ้นแน่นอนและเหตุการณ์ใดมีโอกาสเกิดขึ้นได้มากกว่ากัน');
INSERT INTO `bets_indicator` VALUES (829, '2551020502', 9, '25510205020109', '๑. หาความน่าจะเป็นของเหตุการณ์จากการทดลองสุ่มที่ผลแต่ละตัวมีโอกาสเกิดขึ้นเท่าๆกัน และใช้ความรู้เกี่ยวกับความน่าจะเป็นในการคาดการณ์ได้อย่างสมเหตุสมผล');
INSERT INTO `bets_indicator` VALUES (830, '2551020502', 13, '25510205020113', '๑. นำผลที่ได้จากการสำรวจความคิดเห็นไปใช้คาดการณ์ในสถานการณ์ที่กำหนดให้');
INSERT INTO `bets_indicator` VALUES (831, '2551020502', 13, '25510205020213', '๒. อธิบายการทดลองสุ่ม เหตุการณ์ความน่าจะเป็นของเหตุการณ์และนำผลที่ได้ไปใช้คาดการณ์ในสถานการณ์ที่กำหนดให้');
INSERT INTO `bets_indicator` VALUES (832, '2551020503', 9, '25510205030109', '๑. ใช้ความรู้เกี่ยวกับสถิติและความน่าจะเป็นประกอบการตัดสินใจในสถานการณ์ต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (833, '2551020503', 9, '25510205030209', '๒. อภิปรายถึงความคลาดเคลื่อนที่อาจเกิดขึ้นได้จากการนำเสนอข้อมูลทางสถิติ');
INSERT INTO `bets_indicator` VALUES (834, '2551020503', 13, '25510205030113', '๑. ใช้ข้อมูลข่าวสาร และค่าสถิติช่วยในการตัดสินใจ');
INSERT INTO `bets_indicator` VALUES (835, '2551020503', 13, '25510205030213', '๒. ใช้ความรู้เกี่ยวกับความน่าจะเป็นช่วยในการตัดสินใจและแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (836, '2551020601', 1, '25510206010101', '๑. ใช้วิธีการที่หลากหลายแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (837, '2551020601', 1, '25510206010201', '๒. ใช้ความรู้ทักษะและกระบวนการทางคณิตศาสตร์ในการแก้ปัญหาในสถานการณ์ต่างๆ ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (838, '2551020601', 1, '25510206010301', '๓. ให้เหตุผลประกอบการตัดสินใจ และสรุปผลได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (839, '2551020601', 1, '25510206010401', '๔. ใช้ภาษาและสัญลักษณ์ทางคณิตศาสตร์ในการสื่อสารการสื่อความหมาย และการนำเสนอได้อย่างถูกต้อง');
INSERT INTO `bets_indicator` VALUES (840, '2551020601', 1, '25510206010501', '๕. เชื่อมโยงความรู้ต่าง ๆในคณิตศาสตร์และเชื่อมโยงคณิตศาสตร์กับศาสตร์อื่นๆ');
INSERT INTO `bets_indicator` VALUES (841, '2551020601', 1, '25510206010601', '๖ มีความคิดริเริ่มสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (842, '2551020601', 2, '25510206010102', '๑. ใช้วิธีการที่หลากหลายแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (843, '2551020601', 2, '25510206010202', '๒. ใช้ความรู้ทักษะและกระบวนการทางคณิตศาสตร์ในการแก้ปัญหาในสถานการณ์ต่างๆ ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (844, '2551020601', 2, '25510206010302', '๓. ให้เหตุผลประกอบการตัดสินใจ และสรุปผลได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (845, '2551020601', 2, '25510206010402', '๔. ใช้ภาษาและสัญลักษณ์ทางคณิตศาสตร์ในการสื่อสารการสื่อความหมาย และการนำเสนอได้อย่างถูกต้อง');
INSERT INTO `bets_indicator` VALUES (846, '2551020601', 2, '25510206010502', '๕. เชื่อมโยงความรู้ต่าง ๆในคณิตศาสตร์และเชื่อมโยงคณิตศาสตร์กับศาสตร์อื่นๆ');
INSERT INTO `bets_indicator` VALUES (847, '2551020601', 2, '25510206010602', '๖ มีความคิดริเริ่มสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (848, '2551020601', 3, '25510206010103', '๑. ใช้วิธีการที่หลากหลายแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (849, '2551020601', 3, '25510206010203', '๒. ใช้ความรู้ทักษะและกระบวนการทางคณิตศาสตร์ในการแก้ปัญหาในสถานการณ์ต่างๆ ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (850, '2551020601', 3, '25510206010303', '๓. ให้เหตุผลประกอบการตัดสินใจ และสรุปผลได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (851, '2551020601', 3, '25510206010403', '๔. ใช้ภาษาและสัญลักษณ์ทางคณิตศาสตร์ในการสื่อสารการสื่อความหมาย และการนำเสนอได้อย่างถูกต้อง');
INSERT INTO `bets_indicator` VALUES (852, '2551020601', 3, '25510206010503', '๕. เชื่อมโยงความรู้ต่าง ๆในคณิตศาสตร์และเชื่อมโยงคณิตศาสตร์กับศาสตร์อื่นๆ');
INSERT INTO `bets_indicator` VALUES (853, '2551020601', 3, '25510206010603', '๖ มีความคิดริเริ่มสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (854, '2551020601', 4, '25510206010104', '๑. ใช้วิธีการที่หลากหลายแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (855, '2551020601', 4, '25510206010204', '๒. ใช้ความรู้ทักษะและกระบวนการทางคณิตศาสตร์และเทคโนโลยีในการแก้ปัญหาในสถานการณ์ต่างๆ ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (856, '2551020601', 4, '25510206010304', '๓. ให้เหตุผลประกอบการตัดสินใจ และสรุปผลได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (857, '2551020601', 4, '25510206010404', '๔. ใช้ภาษาและสัญลักษณ์ทางคณิตศาสตร์ในการสื่อสารการสื่อความหมาย และการนำเสนอได้อย่างถูกต้องและเหมาะสม');
INSERT INTO `bets_indicator` VALUES (858, '2551020601', 4, '25510206010504', '๕. เชื่อมโยงความรู้ต่าง ๆในคณิตศาสตร์และคณิตศาสตร์กับศาสตร์อื่น ๆ');
INSERT INTO `bets_indicator` VALUES (859, '2551020601', 4, '25510206010604', '๖. มีความคิดริเริ่มสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (860, '2551020601', 5, '25510206010105', '๑. ใช้วิธีการที่หลากหลายแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (861, '2551020601', 5, '25510206010205', '๒. ใช้ความรู้ทักษะและกระบวนการทางคณิตศาสตร์และเทคโนโลยีในการแก้ปัญหาในสถานการณ์ต่างๆ ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (862, '2551020601', 5, '25510206010305', '๓. ให้เหตุผลประกอบการตัดสินใจ และสรุปผลได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (863, '2551020601', 5, '25510206010405', '๔. ใช้ภาษาและสัญลักษณ์ทางคณิตศาสตร์ในการสื่อสารการสื่อความหมาย และการนำเสนอได้อย่างถูกต้องและเหมาะสม');
INSERT INTO `bets_indicator` VALUES (864, '2551020601', 5, '25510206010505', '๕. เชื่อมโยงความรู้ต่าง ๆในคณิตศาสตร์และคณิตศาสตร์กับศาสตร์อื่น ๆ');
INSERT INTO `bets_indicator` VALUES (865, '2551020601', 5, '25510206010605', '๖. มีความคิดริเริ่มสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (866, '2551020601', 6, '25510206010106', '๑. ใช้วิธีการที่หลากหลายแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (867, '2551020601', 6, '25510206010206', '๒. ใช้ความรู้ทักษะและกระบวนการทางคณิตศาสตร์และเทคโนโลยีในการแก้ปัญหาในสถานการณ์ต่างๆ ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (870, '2551020601', 6, '25510206010306', '๓. ให้เหตุผลประกอบการตัดสินใจ และสรุปผลได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (871, '2551020601', 6, '25510206010406', '๔. ใช้ภาษาและสัญลักษณ์ทางคณิตศาสตร์ในการสื่อสารการสื่อความหมาย และการนำเสนอได้อย่างถูกต้องและเหมาะสม');
INSERT INTO `bets_indicator` VALUES (872, '2551020601', 6, '25510206010506', '๕. เชื่อมโยงความรู้ต่าง ๆในคณิตศาสตร์และคณิตศาสตร์กับศาสตร์อื่น ๆ');
INSERT INTO `bets_indicator` VALUES (873, '2551020601', 6, '25510206010606', '๖. มีความคิดริเริ่มสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (874, '2551020601', 7, '25510206010107', '๑. ใช้วิธีการที่หลากหลายแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (875, '2551020601', 7, '25510206010207', '๒. ใช้ความรู้ทักษะและกระบวนการทางคณิตศาสตร์และเทคโนโลยีในการแก้ปัญหาในสถานการณ์ต่างๆ ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (876, '2551020601', 7, '25510206010307', '๓. ให้เหตุผลประกอบการตัดสินใจ และสรุปผลได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (877, '2551020601', 7, '25510206010407', '๔. ใช้ภาษาและสัญลักษณ์ทางคณิตศาสตร์ในการสื่อสารการสื่อความหมาย และการนำเสนอได้อย่างถูกต้องและชัดเจน');
INSERT INTO `bets_indicator` VALUES (878, '2551020601', 7, '25510206010507', '๕. เชื่อมโยงความรู้ต่าง ๆ ในคณิตศาสตร์และนำความรู้หลักการกระบวนการทางคณิตศาสตร์ไปเชื่อมโยงกับศาสตร์อื่น ๆ');
INSERT INTO `bets_indicator` VALUES (879, '2551020601', 7, '25510206010607', '๖. มีความคิดริเริ่มสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (880, '2551020601', 8, '25510206010108', '๑. ใช้วิธีการที่หลากหลายแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (881, '2551020601', 8, '25510206010208', '๒. ใช้ความรู้ทักษะและกระบวนการทางคณิตศาสตร์และเทคโนโลยีในการแก้ปัญหาในสถานการณ์ต่างๆ ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (882, '2551020601', 8, '25510206010308', '๓. ให้เหตุผลประกอบการตัดสินใจ และสรุปผลได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (883, '2551020601', 8, '25510206010408', '๔. ใช้ภาษาและสัญลักษณ์ทางคณิตศาสตร์ในการสื่อสารการสื่อความหมาย และการนำเสนอได้อย่างถูกต้องและชัดเจน');
INSERT INTO `bets_indicator` VALUES (884, '2551020601', 8, '25510206010508', '๕. เชื่อมโยงความรู้ต่าง ๆ ในคณิตศาสตร์และนำความรู้หลักการกระบวนการทางคณิตศาสตร์ไปเชื่อมโยงกับศาสตร์อื่น ๆ');
INSERT INTO `bets_indicator` VALUES (885, '2551020601', 8, '25510206010608', '๖. มีความคิดริเริ่มสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (886, '2551020601', 9, '25510206010109', '๑. ใช้วิธีการที่หลากหลายแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (887, '2551020601', 9, '25510206010209', '๒. ใช้ความรู้ทักษะและกระบวนการทางคณิตศาสตร์และเทคโนโลยีในการแก้ปัญหาในสถานการณ์ต่างๆ ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (888, '2551020601', 9, '25510206010309', '๓. ให้เหตุผลประกอบการตัดสินใจ และสรุปผลได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (889, '2551020601', 9, '25510206010409', '๔. ใช้ภาษาและสัญลักษณ์ทางคณิตศาสตร์ในการสื่อสารการสื่อความหมาย และการนำเสนอได้อย่างถูกต้องและชัดเจน');
INSERT INTO `bets_indicator` VALUES (890, '2551020601', 9, '25510206010509', '๕. เชื่อมโยงความรู้ต่าง ๆ ในคณิตศาสตร์และนำความรู้หลักการกระบวนการทางคณิตศาสตร์ไปเชื่อมโยงกับศาสตร์อื่น ๆ');
INSERT INTO `bets_indicator` VALUES (891, '2551020601', 9, '25510206010609', '๖. มีความคิดริเริ่มสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (892, '2551020601', 13, '25510206010113', '๑. ใช้วิธีการที่หลากหลายแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (893, '2551020601', 13, '25510206010213', '๒. ใช้ความรู้ ทักษะและกระบวนการทางคณิตศาสตร์และเทคโนโลยีในการแก้ปัญหาในสถานการณ์ต่างๆ ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (894, '2551020601', 13, '25510206010313', '๓. ให้เหตุผลประกอบการตัดสินใจ และสรุปผลได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (895, '2551020601', 13, '25510206010413', '๔. ใช้ภาษาและสัญลักษณ์ทางคณิตศาสตร์ในการสื่อสาร การสื่อความหมาย และการนำเสนอได้อย่างถูกต้องและชัดเจน');
INSERT INTO `bets_indicator` VALUES (896, '2551020601', 13, '25510206010513', '๕. เชื่อมโยงความรู้ต่าง ๆ ในคณิตศาสตร์ และนำความรู้หลักการ กระบวนการทางคณิตศาสตร์ไปเชื่อมโยงกับศาสตร์อื่น ๆ');
INSERT INTO `bets_indicator` VALUES (897, '2551020601', 13, '25510206010613', '๖. มีความคิดริเริ่มสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (898, '2551030101', 1, '25510301010101', '๑. เปรียบเทียบความแตกต่างระหว่างสิ่งมีชีวิตกับสิ่งไม่มีชีวิต');
INSERT INTO `bets_indicator` VALUES (899, '2551030101', 1, '25510301010201', '๒. สังเกตและอธิบายลักษณะและหน้าที่ของโครงสร้างภายนอกของพืชและสัตว์');
INSERT INTO `bets_indicator` VALUES (900, '2551030101', 1, '25510301010301', '๓. สังเกตและอธิบายลักษณะหน้าที่และความสำคัญของอวัยวะภายนอกของมนุษย์ตลอดจนการดูแลรักษาสุขภาพ');
INSERT INTO `bets_indicator` VALUES (901, '2551030101', 2, '25510301010102', '๑. ทดลองและอธิบาย น้ำ แสงเป็นปัจจัยที่จำเป็นต่อการดำรงชีวิตของพืช');
INSERT INTO `bets_indicator` VALUES (902, '2551030101', 2, '25510301010202', '๒. อธิบายอาหาร น้ำอากาศ เป็นปัจจัยที่จำเป็นต่อการดำรงชีวิตและการเจริญเติบโตของพืชและสัตว์และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (903, '2551030101', 2, '25510301010302', '๓. สำรวจและอธิบาย พืชและสัตว์สามารถตอบสนองต่อแสง อุณหภูมิและการสัมผัส');
INSERT INTO `bets_indicator` VALUES (904, '2551030101', 2, '25510301010402', '๔. ทดลองและอธิบาย ร่างกายของมนุษย์สามารถตอบสนองต่อแสงอุณหภูมิ และการสัมผัส');
INSERT INTO `bets_indicator` VALUES (905, '2551030101', 2, '25510301010502', '๕. อธิบายปัจจัยที่จำเป็นต่อการดำรงชีวิตและการเจริญเติบโตของมนุษย์');
INSERT INTO `bets_indicator` VALUES (906, '2551030101', 4, '25510301010104', '๑. ทดลองและอธิบายหน้าที่ของท่อลำเลียงและปากใบของพืช');
INSERT INTO `bets_indicator` VALUES (907, '2551030101', 4, '25510301010204', '๒. อธิบาย น้ำแก๊สคาร์บอน ไดออกไซด์ แสงและคลอโรฟิลล์ เป็นปัจจัยที่จำเป็นบางประการต่อการเจริญเติบโตและการสังเคราะห์ด้วยแสงของพืช');
INSERT INTO `bets_indicator` VALUES (908, '2551030101', 4, '25510301010304', '๓. ทดลองและอธิบาย การตอบสนองของพืชต่อแสง เสียงและการสัมผัส');
INSERT INTO `bets_indicator` VALUES (909, '2551030101', 4, '25510301010404', '๔. อธิบายพฤติกรรมของสัตว์ที่ตอบสนองต่อแสงอุณหภูมิการสัมผัส และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (910, '2551030101', 5, '25510301010105', '๑. สังเกตและระบุส่วนประกอบของดอกและโครงสร้างที่เกี่ยวข้องกับการสืบพันธุ์ของพืชดอก');
INSERT INTO `bets_indicator` VALUES (911, '2551030101', 5, '25510301010205', '๒. อธิบายการสืบพันธุ์ของพืชดอกการขยายพันธุ์พืช และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (912, '2551030101', 5, '25510301010305', '๓. อธิบายวัฏจักรชีวิตของพืชดอกบางชนิด');
INSERT INTO `bets_indicator` VALUES (913, '2551030101', 5, '25510301010405', '๔. อธิบายการสืบพันธุ์และการขยายพันธุ์ของสัตว์');
INSERT INTO `bets_indicator` VALUES (914, '2551030101', 5, '25510301010505', '๕. อภิปรายวัฏจักรชีวิตของสัตว์บางชนิด และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (915, '2551030101', 6, '25510301010106', '๑. อธิบายการเจริญเติบโตของมนุษย์จากวัยแรกเกิดจนถึงวัยผู้ใหญ่');
INSERT INTO `bets_indicator` VALUES (916, '2551030101', 6, '25510301010206', '๒. อธิบายการทำงานที่สัมพันธ์กันของระบบย่อยอาหาร ระบบหายใจ และระบบหมุนเวียนเลือดของมนุษย์');
INSERT INTO `bets_indicator` VALUES (917, '2551030101', 6, '25510301010306', '๓. วิเคราะห์สารอาหารและอภิปรายความจำเป็นที่ร่างกาย ต้องได้รับสารอาหารในสัดส่วนที่เหมาะสมกับเพศและวัย');
INSERT INTO `bets_indicator` VALUES (918, '2551030101', 7, '25510301010107', '๑. สังเกตและอธิบายรูปร่างลักษณะของเซลล์ของสิ่งมีชีวิตเซลล์เดียวและเซลล์ของสิ่งมีชีวิตหลายเซลล์');
INSERT INTO `bets_indicator` VALUES (919, '2551030101', 7, '25510301010207', '๒. สังเกตและเปรียบเทียบส่วน ประกอบสำคัญของเซลล์พืชและเซลล์สัตว์');
INSERT INTO `bets_indicator` VALUES (920, '2551030101', 7, '25510301010307', '๓. ทดลองและอธิบายหน้าที่ของส่วน ประกอบที่สำคัญของเซลล์พืชและเซลล์สัตว์');
INSERT INTO `bets_indicator` VALUES (921, '2551030101', 7, '25510301010407', '๔. ทดลองและอธิบายกระบวนการสารผ่านเซลล์โดยการแพร่และออสโมซิส');
INSERT INTO `bets_indicator` VALUES (922, '2551030101', 7, '25510301010507', '๕. ทดลองหาปัจจัยบางประการที่จำเป็นต่อการสังเคราะห์ด้วยแสงของพืช และอธิบายว่าแสงคลอโรฟิลล์แก๊สคาร์บอนไดออกไซด์น้ำ เป็นปัจจัยที่จำเป็นต้องใช้ในการสังเคราะห์ด้วยแสง');
INSERT INTO `bets_indicator` VALUES (923, '2551030101', 7, '25510301010607', '๖. ทดลองและอธิบายผลที่ได้จากการสังเคราะห์ด้วยแสงของพืช');
INSERT INTO `bets_indicator` VALUES (924, '2551030101', 7, '25510301010707', '๗. อธิบายความสำคัญของกระบวนการสังเคราะห์ด้วยแสงของพืชต่อสิ่งมีชีวิตและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (925, '2551030101', 7, '25510301010807', '๘. ทดลองและอธิบายกลุ่มเซลล์ที่เกี่ยวข้องกับการลำเลียงน้ำของพืช');
INSERT INTO `bets_indicator` VALUES (926, '2551030101', 7, '25510301010907', '๙. สังเกตและอธิบายโครงสร้างที่เกี่ยวกับระบบลำเลียงน้ำและอาหารของพืช');
INSERT INTO `bets_indicator` VALUES (927, '2551030101', 7, '25510301011007', '๑๐. ทดลองและอธิบายโครงสร้างของดอกที่เกี่ยวข้องกับการสืบพันธุ์ของพืช');
INSERT INTO `bets_indicator` VALUES (928, '2551030101', 7, '25510301011107', '๑๑. อธิบายกระบวนการสืบพันธุ์แบบอาศัยเพศของพืชดอกและการสืบพันธุ์แบบไม่อาศัยเพศของพืชโดยใช้ส่วนต่างๆ ของพืชเพื่อช่วยในการขยายพันธุ์');
INSERT INTO `bets_indicator` VALUES (929, '2551030101', 7, '25510301011207', '๑๒. ทดลองและอธิบายการตอบ สนองของพืช ต่อแสงน้ำ และการสัมผัส');
INSERT INTO `bets_indicator` VALUES (930, '2551030101', 7, '25510301011307', '๑๓. อธิบายหลักการและผลของการใช้เทคโนโลยีชีวภาพในการขยายพันธุ์ปรับปรุงพันธุ์เพิ่มผลผลิตของพืชและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (931, '2551030101', 8, '25510301010108', '๑. อธิบายโครงสร้างและการทำงานของระบบย่อยอาหารระบบหมุนเวียนเลือด ระบบหายใจระบบขับถ่ายระบบสืบพันธุ์ของมนุษย์และสัตว์รวมทั้งระบบประสาทของมนุษย์');
INSERT INTO `bets_indicator` VALUES (932, '2551030101', 8, '25510301010208', '๒. อธิบายความ สัมพันธ์ของระบบต่างๆ ของมนุษย์และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (933, '2551030101', 8, '25510301010308', '๓. สังเกตและอธิบายพฤติกรรมของมนุษย์และสัตว์ที่ตอบสนองต่อสิ่งเร้าภายนอกและภายใน');
INSERT INTO `bets_indicator` VALUES (934, '2551030101', 8, '25510301010408', '๔. อธิบายหลักการและผลของการใช้เทคโนโลยีชีวภาพในการขยายพันธุ์ปรับปรุงพันธุ์และเพิ่มผลผลิตของสัตว์และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (935, '2551030101', 8, '25510301010508', '๕. ทดลองวิเคราะห์ และอธิบายสารอาหารในอาหารมีปริมาณพลังงานและสัดส่วนที่เหมาะสมกับเพศและวัย');
INSERT INTO `bets_indicator` VALUES (936, '2551030101', 8, '25510301010608', '๖. อภิปรายผลของสารเสพติดต่อระบบต่าง ๆของร่างกายและแนวทางในการป้องกันตนเองจากสารเสพติด');
INSERT INTO `bets_indicator` VALUES (937, '2551030101', 13, '25510301010113', '๑. ทดลองและอธิบายการรักษาดุลยภาพของเซลล์ของสิ่งมีชีวิต');
INSERT INTO `bets_indicator` VALUES (938, '2551030101', 13, '25510301010213', '๒. ทดลองและอธิบายกลไกการรักษาดุลยภาพของน้ำในพืช');
INSERT INTO `bets_indicator` VALUES (939, '2551030101', 13, '25510301010313', '๓. สืบค้นข้อมูลและอธิบายกลไกการควบคุมดุลยภาพของน้ำ แร่ธาตุ และอุณหภูมิของมนุษย์และสัตว์อื่น ๆ และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (940, '2551030101', 13, '25510301010413', '๔. อธิบายเกี่ยวกับระบบภูมิคุ้มกันของร่างกายและนำความรู้ไปใช้ในการดูแลรักษาสุขภาพ');
INSERT INTO `bets_indicator` VALUES (941, '2551030102', 1, '25510301020101', '๑. ระบุลักษณะของสิ่งมีชีวิตในท้องถิ่นและนำมาจัดจำแนกโดยใช้ลักษณะภายนอกเป็นเกณฑ์');
INSERT INTO `bets_indicator` VALUES (942, '2551030102', 2, '25510301020102', '๑. อธิบายประโยชน์ของพืชและสัตว์ในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (943, '2551030102', 3, '25510301020103', '๑. อภิปรายลักษณะต่างๆของสิ่งมีชีวิตใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (944, '2551030102', 3, '25510301020203', '๒. เปรียบเทียบและระบุลักษณะที่คล้ายคลึงกันของพ่อแม่กับลูก');
INSERT INTO `bets_indicator` VALUES (945, '2551030102', 3, '25510301020303', '๓. อธิบายลักษณะที่คล้ายคลึงกันของพ่อแม่กับลูกว่าเป็นการถ่ายทอดลักษณะทางพันธุกรรม และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (946, '2551030102', 3, '25510301020403', '๔. สืบค้นข้อมูลและอภิปรายเกี่ยวกับสิ่งมีชีวิตบางชนิดที่สูญพันธุ์ไปแล้ว และที่ดำรงพันธุ์มาจนถึงปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (947, '2551030102', 5, '25510301020105', '๑. สำรวจเปรียบเทียบและระบุลักษณะของตนเองกับคนในครอบครัว');
INSERT INTO `bets_indicator` VALUES (948, '2551030102', 5, '25510301020205', '๒. อธิบายการถ่ายทอดลักษณะทางพันธุกรรมของสิ่งมีชีวิตในแต่ละรุ่น');
INSERT INTO `bets_indicator` VALUES (949, '2551030102', 5, '25510301020305', '๓. จำแนกพืชออกเป็นพืชดอก และพืชไม่มีดอก');
INSERT INTO `bets_indicator` VALUES (950, '2551030102', 5, '25510301020405', '๔. ระบุลักษณะของพืชดอกที่เป็นพืชใบเลี้ยงเดี่ยวและพืชใบเลี้ยงคู่ โดยใช้ลักษณะภายนอกเป็นเกณฑ์');
INSERT INTO `bets_indicator` VALUES (951, '2551030102', 5, '25510301020505', '๕. จำแนกสัตว์ออกเป็นกลุ่มโดยใช้ลักษณะภายในบางลักษณะและลักษณะภายนอกเป็นเกณฑ์');
INSERT INTO `bets_indicator` VALUES (952, '2551030102', 9, '25510301020109', '๑. สังเกตและอธิบายลักษณะของโครโมโซมที่มีหน่วยพันธุกรรมหรือยีนในนิวเคลียส');
INSERT INTO `bets_indicator` VALUES (953, '2551030102', 9, '25510301020209', '๒. อธิบายความสำคัญของสารพันธุกรรมหรือดีเอ็นเอและกระบวนการถ่ายทอดลักษณะทางพันธุกรรม');
INSERT INTO `bets_indicator` VALUES (954, '2551030102', 9, '25510301020309', '๓. อภิปรายโรคทางพันธุกรรมที่เกิดจากความผิดปกติของยีนและโครโมโซมและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (955, '2551030102', 9, '25510301020409', '๔. สำรวจและอธิบายความหลากหลายทางชีวภาพในท้องถิ่นที่ทำให้สิ่งมีชีวิตดำรงชีวิตอยู่ได้อย่างสมดุล');
INSERT INTO `bets_indicator` VALUES (956, '2551030102', 9, '25510301020509', '๕. อธิบายผลของความหลากหลายทางชีวภาพที่มีต่อมนุษย์สัตว์ พืช และสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (957, '2551030102', 9, '25510301020609', '๖. อภิปรายผลของเทคโนโลยีชีวภาพต่อการดำรงชีวิตของมนุษย์และสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (958, '2551030102', 13, '25510301020113', '๑. อธิบายกระบวนการถ่ายทอดสารพันธุกรรม การแปรผันทางพันธุกรรม มิวเทชัน และการเกิดความหลากหลายทางชีวภาพ');
INSERT INTO `bets_indicator` VALUES (959, '2551030102', 13, '25510301020213', '๒. สืบค้นข้อมูลและอภิปรายผลของเทคโนโลยี ชีวภาพที่มีต่อมนุษย์และสิ่งแวดล้อมและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (960, '2551030102', 13, '25510301020313', '๓. สืบค้นข้อมูลและอภิปรายผลของความหลากหลายทางชีวภาพที่มีต่อมนุษย์และสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (961, '2551030102', 13, '25510301020413', '๔. อธิบายกระบวนการคัดเลือกตามธรรมชาติ และผลของการคัดเลือกตามธรรมชาติต่อความหลากหลายของสิ่งมีชีวิต');
INSERT INTO `bets_indicator` VALUES (962, '2551030201', 3, '25510302010103', '๑. สำรวจสิ่งแวดล้อมในท้องถิ่นของตนและอธิบายความสัมพันธ์ของสิ่งมีชีวิตกับสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (963, '2551030201', 6, '25510302010106', '๑. สำรวจและอภิปรายความสัมพันธ์ ของกลุ่มสิ่งมีชีวิตในแหล่งที่อยู่ต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (964, '2551030201', 6, '25510302010206', '๒. อธิบายความสัมพันธ์ของสิ่งมีชีวิตกับสิ่งมีชีวิตในรูปของโซ่อาหารและสายใยอาหาร');
INSERT INTO `bets_indicator` VALUES (965, '2551030201', 6, '25510302010306', '๓. สืบค้นข้อมูลและอธิบายความสัมพันธ์ระหว่างการดำรงชีวิตของสิ่งมีชีวิตกับสภาพแวดล้อมในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (966, '2551030201', 9, '25510302010109', '๑. สำรวจระบบนิเวศต่างๆในท้องถิ่นและอธิบายความสัมพันธ์ขององค์ประกอบภายในระบบนิเวศ\r\n');
INSERT INTO `bets_indicator` VALUES (967, '2551030201', 9, '25510302010209', '๒. วิเคราะห์และอธิบายความสัมพันธ์ของการถ่ายทอดพลังงานของสิ่งมีชีวิตในรูปของโซ่อาหารและสายใยอาหาร');
INSERT INTO `bets_indicator` VALUES (968, '2551030201', 9, '25510302010309', '๓. อธิบายวัฏจักรน้ำวัฏจักรคาร์บอนและความสำคัญที่มีต่อระบบนิเวศ');
INSERT INTO `bets_indicator` VALUES (969, '2551030201', 9, '25510302010409', '๔. อธิบายปัจจัยที่มีผลต่อการเปลี่ยนแปลงขนาดของประชากรในระบบนิเวศ');
INSERT INTO `bets_indicator` VALUES (970, '2551030201', 13, '25510302010113', '๑. อธิบายดุลยภาพของระบบนิเวศ');
INSERT INTO `bets_indicator` VALUES (971, '2551030201', 13, '25510302010213', '๒. อธิบายกระบวนการเปลี่ยนแปลงแทนที่ของสิ่งมีชีวิต');
INSERT INTO `bets_indicator` VALUES (972, '2551030201', 13, '25510302010313', '๓. อธิบายความสำคัญของความหลากหลายทางชีวภาพ และเสนอแนะแนวทางในการดูแลและรักษา');
INSERT INTO `bets_indicator` VALUES (973, '2551030202', 3, '25510302020103', '๑. สำรวจทรัพยากรธรรมชาติ และอภิปรายการใช้ทรัพยากรธรรมชาติในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (974, '2551030202', 3, '25510302020203', '๒. ระบุการใช้ทรัพยากรธรรมชาติที่ก่อให้เกิดปัญหาสิ่งแวดล้อมในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (975, '2551030202', 3, '25510302020303', '๓. อภิปรายและนำเสนอการใช้ทรัพยากรธรรมชาติอย่างประหยัดคุ้มค่า และมีส่วนร่วมในการปฏิบัติ');
INSERT INTO `bets_indicator` VALUES (976, '2551030202', 6, '25510302020106', '๑. สืบค้นข้อมูลและอภิปรายแหล่งทรัพยากรธรรมชาติในแต่ละท้องถิ่นที่เป็นประโยชน์ต่อการดำรงชีวิต');
INSERT INTO `bets_indicator` VALUES (977, '2551030202', 6, '25510302020206', '๒. วิเคราะห์ผลของการเพิ่มขึ้นของประชากรมนุษย์ต่อการใช้ทรัพยากรธรรมชาติ');
INSERT INTO `bets_indicator` VALUES (978, '2551030202', 6, '25510302020306', '๓. อภิปรายผลต่อสิ่งมีชีวิตจากการเปลี่ยนแปลงสิ่งแวดล้อมทั้งโดยธรรมชาติ และโดยมนุษย์');
INSERT INTO `bets_indicator` VALUES (979, '2551030202', 6, '25510302020406', '๔. อภิปรายแนวทางในการดูแลรักษาทรัพยากรธรรมชาติและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (980, '2551030202', 6, '25510302020506', '๕. มีส่วนร่วมในการดูแลรักษาสิ่งแวดล้อมในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (981, '2551030202', 9, '25510302020109', '๑. วิเคราะห์สภาพปัญหาสิ่งแวดล้อมทรัพยากรธรรมชาติในท้องถิ่น และเสนอแนวทางในการ แก้ไขปัญหา');
INSERT INTO `bets_indicator` VALUES (982, '2551030202', 9, '25510302020209', '๒. อธิบายแนวทางการรักษาสมดุลของระบบนิเวศ');
INSERT INTO `bets_indicator` VALUES (983, '2551030202', 9, '25510302020309', '๓. อภิปรายการใช้ทรัพยากรธรรมชาติอย่างยั่งยืน');
INSERT INTO `bets_indicator` VALUES (984, '2551030202', 9, '25510302020409', '๔. วิเคราะห์และอธิบายการใช้ทรัพยากรธรรมชาติตามปรัชญาเศรษฐกิจพอเพียง');
INSERT INTO `bets_indicator` VALUES (985, '2551030202', 9, '25510302020509', '๕. อภิปรายปัญหาสิ่งแวดล้อมและเสนอแนะแนวทางการแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (986, '2551030202', 9, '25510302020609', '๖. อภิปรายและมีส่วนร่วมในการดูแลและอนุรักษ์สิ่งแวดล้อมในท้องถิ่นอย่างยั่งยืน');
INSERT INTO `bets_indicator` VALUES (987, '2551030202', 13, '25510302020113', '๑. วิเคราะห์สภาพปัญหา สาเหตุของปัญหาสิ่งแวดล้อมและทรัพยากรธรรมชาติในระดับท้องถิ่น ระดับประเทศ และระดับโลก');
INSERT INTO `bets_indicator` VALUES (988, '2551030202', 13, '25510302020213', '๒. อภิปรายแนวทางในการป้องกันแก้ไข ปัญหา สิ่งแวดล้อมและทรัพยากรธรรมชาติ');
INSERT INTO `bets_indicator` VALUES (989, '2551030202', 13, '25510302020313', '๓. วางแผนและดำเนินการเฝ้าระวังอนุรักษ์ และพัฒนาสิ่งแวดล้อมและทรัพยากร ธรรมชาติ');
INSERT INTO `bets_indicator` VALUES (990, '2551030301', 1, '25510303010101', '๑. สังเกตและระบุลักษณะที่ปรากฏหรือสมบัติของวัสดุที่ใช้ทำของเล่นของใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (991, '2551030301', 1, '25510303010201', '๒. จำแนกวัสดุที่ใช้ทำของเล่น ของใช้ในชีวิตประจำวันรวมทั้งระบุเกณฑ์ที่ใช้จำแนก');
INSERT INTO `bets_indicator` VALUES (992, '2551030301', 2, '25510303010102', '๑. ระบุชนิดและเปรียบเทียบสมบัติของวัสดุที่นำมาทำของเล่นของใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (993, '2551030301', 2, '25510303010202', '๒. เลือกใช้วัสดุและสิ่งของต่างๆได้อย่างเหมาะสมและปลอดภัย');
INSERT INTO `bets_indicator` VALUES (994, '2551030301', 3, '25510303010103', '๑. จำแนกชนิดและสมบัติของวัสดุที่เป็นส่วนประกอบของของเล่นของใช้');
INSERT INTO `bets_indicator` VALUES (995, '2551030301', 3, '25510303010203', '๒. อธิบายการใช้ประโยชน์ของวัสดุแต่ละชนิด');
INSERT INTO `bets_indicator` VALUES (996, '2551030301', 5, '25510303010105', '๑. ทดลองและอธิบายสมบัติของวัสดุชนิด ต่าง ๆเกี่ยวกับความยืดหยุ่น ความแข็ง ความเหนียวการนำความร้อน การนำไฟฟ้า และความหนาแน่น');
INSERT INTO `bets_indicator` VALUES (997, '2551030301', 5, '25510303010205', '๒. สืบค้นข้อมูลและอภิปรายการนำวัสดุไปใช้ในชีวิต ประจำวัน');
INSERT INTO `bets_indicator` VALUES (998, '2551030301', 6, '25510303010106', '๑. ทดลองและอธิบายสมบัติของของแข็งของเหลว และแก๊ส');
INSERT INTO `bets_indicator` VALUES (999, '2551030301', 6, '25510303010206', '๒. จำแนกสารเป็นกลุ่มโดยใช้สถานะหรือเกณฑ์อื่นที่กำหนดเอง');
INSERT INTO `bets_indicator` VALUES (1000, '2551030301', 6, '25510303010306', '๓. ทดลองและอธิบายวิธีการแยกสารบางชนิดที่ผสมกันโดยการร่อนการตกตะกอนการกรองการระเหิดการระเหยแห้ง');
INSERT INTO `bets_indicator` VALUES (1001, '2551030301', 6, '25510303010406', '๔. สำรวจ และจำแนกประเภทของสารต่างๆที่ใช้ในชีวิตประจำวันโดยใช้สมบัติและการใช้ประโยชน์ของสารเป็นเกณฑ์');
INSERT INTO `bets_indicator` VALUES (1002, '2551030301', 6, '25510303010506', '๕. อภิปรายการเลือกใช้สารแต่ละประเภทได้อย่างถูกต้องและปลอดภัย');
INSERT INTO `bets_indicator` VALUES (1003, '2551030301', 7, '25510303010107', '๑. ทดลองและจำแนกสารเป็นกลุ่มโดยใช้เนื้อสารหรือขนาดอนุภาคเป็นเกณฑ์และอธิบายสมบัติของสารในแต่ละกลุ่ม');
INSERT INTO `bets_indicator` VALUES (1004, '2551030301', 7, '25510303010207', '๒. อธิบายสมบัติและการเปลี่ยนสถานะของสาร โดยใช้แบบจำลองการจัดเรียงอนุภาคของสาร');
INSERT INTO `bets_indicator` VALUES (1005, '2551030301', 7, '25510303010307', '๓. ทดลองและอธิบายสมบัติความเป็นกรดเบสของสารละลาย');
INSERT INTO `bets_indicator` VALUES (1006, '2551030301', 7, '25510303010407', '๔.ตรวจสอบค่า pH ของสารละลายและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1007, '2551030301', 8, '25510303010108', '๑. สำรวจและอธิบายองค์ประกอบสมบัติของธาตุและสารประกอบ');
INSERT INTO `bets_indicator` VALUES (1008, '2551030301', 8, '25510303010208', '๒. สืบค้นข้อมูลและเปรียบเทียบสมบัติของธาตุโลหะธาตุอโลหะธาตุกึ่งโลหะและธาตุกัมมันตรังสีและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1009, '2551030301', 8, '25510303010308', '๓. ทดลองและอธิบายการหลักการแยกสารด้วยวิธีการกรองการตกผลึกการสกัดการกลั่น และโครมาโทกราฟีและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1010, '2551030301', 13, '25510303010113', '๑. สืบค้นข้อมูลและอธิบายโครงสร้างอะตอม และสัญลักษณ์นิวเคลียร์ของธาตุ');
INSERT INTO `bets_indicator` VALUES (1011, '2551030301', 13, '25510303010213', '๒. วิเคราะห์และอธิบายการจัดเรียงอิเล็กตรอนในอะตอมความสัมพันธ์ระหว่างอิเล็กตรอนในระดับพลังงานนอกสุดกับสมบัติของธาตุและการเกิดปฏิกิริยา');
INSERT INTO `bets_indicator` VALUES (1012, '2551030301', 13, '25510303010313', '๓. อธิบายการจัดเรียงธาตุและทำนายแนวโน้มสมบัติของธาตุในตารางธาตุ');
INSERT INTO `bets_indicator` VALUES (1013, '2551030301', 13, '25510303010413', '๔. วิเคราะห์และอธิบายการเกิดพันธะเคมีในโครงผลึกและในโมเลกุลของสาร');
INSERT INTO `bets_indicator` VALUES (1014, '2551030301', 13, '25510303010513', '๕. สืบค้นข้อมูลและอธิบายความสัมพันธ์ระหว่างจุดเดือดจุดหลอมเหลว และสถานะของสารกับแรงยึดเหนี่ยวระหว่างอนุภาคของสาร');
INSERT INTO `bets_indicator` VALUES (1015, '2551030302', 3, '25510303020103', '๑. ทดลองและอธิบายผลของการเปลี่ยนแปลงที่เกิดขึ้นกับวัสดุ เมื่อถูกแรงกระทำหรือทำให้ร้อนขึ้นหรือทำให้เย็นลง');
INSERT INTO `bets_indicator` VALUES (1016, '2551030302', 3, '25510303020203', '๒. อภิปรายประโยชน์และอันตรายที่อาจเกิดขึ้นเนื่องจากการเปลี่ยนแปลงของวัสดุ');
INSERT INTO `bets_indicator` VALUES (1017, '2551030302', 6, '25510303020106', '๑. ทดลองและอธิบายสมบัติของสารเมื่อสารเกิดการละลายและเปลี่ยนสถานะ');
INSERT INTO `bets_indicator` VALUES (1018, '2551030302', 6, '25510303020206', '๒. วิเคราะห์และอธิบายการเปลี่ยนแปลงที่ทำให้เกิดสารใหม่และมีสมบัติเปลี่ยนแปลงไป๓. อภิปรายการเปลี่ยนแปลงของสารที่ก่อให้เกิดผลต่อสิ่งมีชีวิตและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1019, '2551030302', 7, '25510303020107', '๑. ทดลองและอธิบายวิธีเตรียมสารละลายที่มีความเข้มข้นเป็นร้อยละ และอภิปรายการนำความรู้เกี่ยวกับสารละลายไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1020, '2551030302', 7, '25510303020207', '๒. ทดลองและอธิบายการเปลี่ยนแปลงสมบัติมวลและพลังงานของสารเมื่อสารเปลี่ยนสถานะและเกิดการละลาย');
INSERT INTO `bets_indicator` VALUES (1021, '2551030302', 7, '25510303020307', '๓. อภิปรายการเปลี่ยนแปลงของสารที่ก่อให้เกิดผลต่อสิ่งมีชีวิตและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1022, '2551030302', 7, '25510303020407', '๓. ทดลองและอธิบายปัจจัยที่มีผลต่อการเปลี่ยนสถานะ และการละลายของสาร');
INSERT INTO `bets_indicator` VALUES (1023, '2551030302', 8, '25510303020108', '๑. ทดลองและอธิบายการเปลี่ยนแปลงสมบัติ มวลและพลังงานเมื่อสารเกิดปฏิกิริยาเคมี รวมทั้งอธิบายปัจจัยที่มีผลต่อการเกิด ปฏิกิริยาเคมี');
INSERT INTO `bets_indicator` VALUES (1024, '2551030302', 8, '25510303020208', '๒. ทดลองอธิบายและเขียนสมการเคมีของปฏิกิริยาของสารต่าง ๆและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1025, '2551030302', 8, '25510303020308', '๓. สืบค้นข้อมูลและอภิปรายผลของสารเคมีปฏิกิริยาเคมีต่อสิ่งมีชีวิตและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1026, '2551030302', 8, '25510303020408', '๔. สืบค้นข้อมูลและอธิบายการใช้สารเคมีอย่างถูกต้องปลอดภัย วิธีป้องกันและแก้ไขอันตรายที่เกิดขึ้นจากการใช้สารเคมี');
INSERT INTO `bets_indicator` VALUES (1027, '2551030302', 13, '25510303020113', '๑. ทดลอง อธิบายและเขียนสมการของปฏิกิริยาเคมีทั่วไปที่พบในชีวิตประจำวัน รวมทั้งอธิบายผลของสารเคมีที่มีต่อสิ่งมีชีวิตและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1028, '2551030302', 13, '25510303020213', '๒. ทดลองและอธิบายอัตราการเกิดปฏิกิริยาเคมี ปัจจัยที่มีผลต่ออัตราการเกิดปฏิกิริยาเคมี และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1029, '2551030302', 13, '25510303020313', '๓. สืบค้นข้อมูลและอธิบายการเกิดปิโตรเลียม กระบวนการแยกแก๊สธรรมชาติ และการกลั่นลำดับส่วนน้ำมันดิบ');
INSERT INTO `bets_indicator` VALUES (1030, '2551030302', 13, '25510303020413', '๔. สืบค้นข้อมูลและอภิปรายการนำผลิตภัณฑ์ที่ได้จากการแยกแก๊สธรรมชาติและการกลั่นลำดับส่วนน้ำมันดิบไปใช้ประโยชน์ รวมทั้งผลของผลิตภัณฑ์ต่อสิ่งมีชีวิตและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1031, '2551030302', 13, '25510303020513', '๕. ทดลองและอธิบายการเกิดพอลิเมอร์สมบัติของพอลิเมอร์');
INSERT INTO `bets_indicator` VALUES (1032, '2551030302', 13, '25510303020613', '๖. อภิปรายการนำพอลิเมอร์ไปใช้ประโยชน์ รวมทั้งผลที่เกิดจากการผลิตและใช้พอลิเมอร์ต่อสิ่งมีชีวิตและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1033, '2551030302', 13, '25510303020713', '๗. ทดลองและอธิบายองค์ประกอบประโยชน์และปฏิกิริยาบางชนิดของคาร์โบไฮเดรต');
INSERT INTO `bets_indicator` VALUES (1034, '2551030302', 13, '25510303020813', '๘. ทดลองและอธิบายองค์ประกอบประโยชน์ และปฏิกิริยาบางชนิดของไขมันและน้ำมัน');
INSERT INTO `bets_indicator` VALUES (1035, '2551030302', 13, '25510303020913', '๙. ทดลองและอธิบายองค์ประกอบประโยชน์ และปฏิกิริยาบางชนิดของโปรตีน และกรดนิวคลีอิก');
INSERT INTO `bets_indicator` VALUES (1036, '2551030401', 1, '25510304010101', '๑. ทดลองและอธิบายการดึงหรือการผลักวัตถุ');
INSERT INTO `bets_indicator` VALUES (1037, '2551030401', 2, '25510304010102', '๑. ทดลองและอธิบายแรงที่เกิดจากแม่เหล็ก');
INSERT INTO `bets_indicator` VALUES (1038, '2551030401', 2, '25510304010202', '๒. อธิบาย การนำแม่เหล็กมาใช้ ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1039, '2551030401', 2, '25510304010302', '๓. ทดลองและอธิบายแรงไฟฟ้าที่เกิดจากการถูวัตถุบางชนิด');
INSERT INTO `bets_indicator` VALUES (1040, '2551030401', 3, '25510304010103', '๑. ทดลองและอธิบายผลของการออกแรงที่กระทำต่อวัตถุ');
INSERT INTO `bets_indicator` VALUES (1041, '2551030401', 3, '25510304010203', '๒. ทดลองการตกของวัตถุสู่พื้นโลก และอธิบายแรงที่โลกดึงดูดวัตถุ');
INSERT INTO `bets_indicator` VALUES (1042, '2551030401', 5, '25510304010105', '๑. ทดลองและอธิบายการหาแรงลัพธ์ของแรงสองแรงซึ่งอยู่ในแนวเดียวกันที่กระทำต่อวัตถุ');
INSERT INTO `bets_indicator` VALUES (1043, '2551030401', 5, '25510304010205', '๒. ทดลองและอธิบายความดันอากาศ');
INSERT INTO `bets_indicator` VALUES (1044, '2551030401', 5, '25510304010305', '๓. ทดลองและอธิบายความดันของของเหลว');
INSERT INTO `bets_indicator` VALUES (1045, '2551030401', 5, '25510304010405', '๔. ทดลองและอธิบายแรงพยุงของของเหลวการลอยตัว และการจมของวัตถุ');
INSERT INTO `bets_indicator` VALUES (1046, '2551030401', 7, '25510304010107', '๑. สืบค้นข้อมูลและอธิบายปริมาณ สเกลาร์ปริมาณเวกเตอร์');
INSERT INTO `bets_indicator` VALUES (1047, '2551030401', 7, '25510304010207', '๒. ทดลองและอธิบายระยะทางการกระจัดอัตราเร็วและความเร็วในการเคลื่อนที่ของวัตถุ');
INSERT INTO `bets_indicator` VALUES (1048, '2551030401', 8, '25510304010108', '๑. ทดลองและอธิบายการหาแรงลัพธ์ของแรงหลายแรงในระนาบเดียวกันที่กระทำต่อวัตถุ');
INSERT INTO `bets_indicator` VALUES (1049, '2551030401', 8, '25510304010208', '๒. อธิบายแรงลัพธ์ที่กระทำต่อวัตถุที่หยุดนิ่งหรือวัตถุเคลื่อนที่ด้วยความเร็วคงตัว');
INSERT INTO `bets_indicator` VALUES (1050, '2551030401', 9, '25510304010109', '๑. อธิบายความเร่งและผลของแรงลัพธ์ที่ทำต่อวัตถุ');
INSERT INTO `bets_indicator` VALUES (1051, '2551030401', 9, '25510304010209', '๒. ทดลองและอธิบายแรงกิริยาและแรงปฏิกิริยาระหว่างวัตถุและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1052, '2551030401', 9, '25510304010309', '๓. ทดลองและอธิบายแรงพยุงของของเหลวที่กระทำต่อวัตถุ');
INSERT INTO `bets_indicator` VALUES (1053, '2551030401', 13, '25510304010113', '๑. ทดลองและอธิบายความสัมพันธ์ระหว่างแรงกับ การเคลื่อนที่ของวัตถุในสนามโน้มถ่วง และอธิบายการนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1054, '2551030401', 13, '25510304010213', '๒. ทดลองและอธิบายความสัมพันธ์ระหว่างแรงกับ การเคลื่อนที่ของอนุภาคในสนามไฟฟ้า และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1055, '2551030401', 13, '25510304010313', '๓. ทดลองและอธิบายความ สัมพันธ์ระหว่างแรงกับการเคลื่อนที่ของอนุภาคในสนาม แม่เหล็ก และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1056, '2551030401', 13, '25510304010413', '๔. วิเคราะห์และอธิบายแรงนิวเคลียร์และแรงไฟฟ้าระหว่างอนุภาคในนิวเคลียส');
INSERT INTO `bets_indicator` VALUES (1057, '2551030402', 5, '25510304020105', '๑. ทดลองและอธิบาย แรงเสียดทานและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1058, '2551030402', 9, '25510304020109', '๑. ทดลองและอธิบายความแตกต่างระหว่างแรงเสียดทานสถิตกับแรง และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1059, '2551030402', 9, '25510304020209', '๒. ทดลองและวิเคราะห์โมเมนต์ของแรง และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1060, '2551030402', 9, '25510304020309', '๓. สังเกต และอธิบายการเคลื่อนที่ของวัตถุที่เป็นแนวตรง และแนวโค้ง');
INSERT INTO `bets_indicator` VALUES (1061, '2551030402', 13, '25510304020113', '๑. อธิบายและทดลองความ สัมพันธ์ระหว่างการกระจัด เวลา ความเร็วความเร่งของการเคลื่อนที่ในแนวตรง');
INSERT INTO `bets_indicator` VALUES (1062, '2551030402', 13, '25510304020213', '๒. สังเกตและอธิบายการเคลื่อนที่แบบโพรเจกไทล์ แบบวงกลม และแบบฮาร์มอนิกอย่างง่าย');
INSERT INTO `bets_indicator` VALUES (1063, '2551030402', 13, '25510304020313', '๓. อภิปรายผลการสืบค้นและประโยชน์เกี่ยวกับการเคลื่อนที่แบบโพรเจกไทล์ แบบวงกลม และแบบฮาร์มอนิกอย่างง่าย');
INSERT INTO `bets_indicator` VALUES (1064, '2551030501', 2, '25510305010102', '๑. ทดลองและอธิบายได้ว่าไฟฟ้าเป็นพลังงาน');
INSERT INTO `bets_indicator` VALUES (1065, '2551030501', 2, '25510305010202', '๒. สำรวจและยกตัวอย่างเครื่องใช้ ไฟฟ้าในบ้านที่เปลี่ยนพลังงานไฟฟ้าเป็นพลังงานอื่น');
INSERT INTO `bets_indicator` VALUES (1066, '2551030501', 3, '25510305010103', '๑. บอกแหล่งพลังงานธรรมชาติที่ใช้ผลิตไฟฟ้า');
INSERT INTO `bets_indicator` VALUES (1067, '2551030501', 3, '25510305010203', '๒. อธิบายความสำคัญของพลังงานไฟฟ้าและ เสนอวิธีการใช้ไฟฟ้าอย่างประหยัดและปลอดภัย');
INSERT INTO `bets_indicator` VALUES (1068, '2551030501', 4, '25510305010104', '๑. ทดลองและอธิบายการเคลื่อนที่ของแสงจากแหล่งกำเนิด');
INSERT INTO `bets_indicator` VALUES (1069, '2551030501', 4, '25510305010204', '๒. ทดลองและอธิบายการสะท้อนของแสงที่ตกกระทบวัตถุ');
INSERT INTO `bets_indicator` VALUES (1070, '2551030501', 4, '25510305010304', '๓. ทดลองและจำแนกวัตถุตามลักษณะการมองเห็นจากแหล่งกำเนิดแสง');
INSERT INTO `bets_indicator` VALUES (1071, '2551030501', 4, '25510305010404', '๔. ทดลอง และอธิบาย การหักเหของแสงเมื่อผ่านตัวกลางโปร่งใสสองชนิด');
INSERT INTO `bets_indicator` VALUES (1072, '2551030501', 4, '25510305010504', '๕. ทดลองและอธิบายการเปลี่ยนแสงเป็นพลังงานไฟฟ้าและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1073, '2551030501', 4, '25510305010604', '๖. ทดลองและอธิบายแสงขาวประกอบด้วยแสงสีต่าง ๆ และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1074, '2551030501', 5, '25510305010105', '๑. ทดลองและอธิบายการเกิดเสียงและการเคลื่อนที่ของเสียง');
INSERT INTO `bets_indicator` VALUES (1075, '2551030501', 5, '25510305010205', '๒. ทดลองและอธิบายการเกิดเสียงสูง เสียงต่ำ');
INSERT INTO `bets_indicator` VALUES (1076, '2551030501', 5, '25510305010305', '๓. ทดลองและอธิบายเสียงดังเสียงค่อย');
INSERT INTO `bets_indicator` VALUES (1077, '2551030501', 5, '25510305010405', '๔. สำรวจและอภิปรายอันตรายที่เกิดขึ้นเมื่อฟังเสียงดังมาก ๆ');
INSERT INTO `bets_indicator` VALUES (1078, '2551030501', 6, '25510305010106', '๑. ทดลองและอธิบายการต่อวงจรไฟฟ้าอย่างง่าย');
INSERT INTO `bets_indicator` VALUES (1079, '2551030501', 6, '25510305010206', '๒. ทดลองและอธิบายตัวนำไฟฟ้าและฉนวน ไฟฟ้า');
INSERT INTO `bets_indicator` VALUES (1080, '2551030501', 6, '25510305010306', '๓. ทดลองและอธิบายการต่อเซลล์ไฟฟ้าแบบอนุกรม และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1081, '2551030501', 6, '25510305010406', '๔. ทดลองและอธิบายการต่อหลอดไฟฟ้าทั้งแบบอนุกรมแบบขนานและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1082, '2551030501', 6, '25510305010506', '๕. ทดลองและอธิบายการเกิดสนาม แม่เหล็กรอบสายไฟที่มีกระแสไฟฟ้าผ่าน และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1083, '2551030501', 7, '25510305010107', '๑. ทดลองและอธิบายอุณหภูมิและการวัดอุณหภูมิ');
INSERT INTO `bets_indicator` VALUES (1084, '2551030501', 7, '25510305010207', '๒. สังเกต และอธิบายการถ่ายโอนความร้อนและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1085, '2551030501', 7, '25510305010307', '๓. อธิบาย การดูดกลืน การคายความร้อน โดยการแผ่รังสี และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1086, '2551030501', 7, '25510305010407', '๔. อธิบายสมดุลความร้อนและผลของความร้อนต่อการขยายตัวของสาร และนำความรู้ไปใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (1087, '2551030501', 8, '25510305010108', '๑. ทดลองและอธิบายการสะท้อนของแสงการหักเหของแสง และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1088, '2551030501', 8, '25510305010208', '๒. อธิบายผลของความสว่างที่มีต่อมนุษย์และสิ่งมีชีวิตอื่น ๆ');
INSERT INTO `bets_indicator` VALUES (1089, '2551030501', 8, '25510305010308', '๓. ทดลองและอธิบายการดูดกลืนแสงสีการมองเห็นสีของวัตถุ และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1090, '2551030501', 9, '25510305010109', '๑. อธิบายงานพลังงานจลน์พลังงานศักย์โน้มถ่วง กฎการอนุรักษ์พลังงาน และความสัมพันธ์ระหว่างปริมาณเหล่านี้รวมทั้งนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1091, '2551030501', 9, '25510305010209', '๒. ทดลองและอธิบายความสัมพันธ์ระหว่างความต่างศักย์กระแสไฟฟ้าความต้านทานและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1092, '2551030501', 9, '25510305010309', '๓. คำนวณพลังงานไฟฟ้าของเครื่องใช้ไฟฟ้า และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1093, '2551030501', 9, '25510305010409', '๔. สังเกตและอภิปรายการต่อวงจรไฟฟ้าในบ้านอย่างถูกต้องปลอดภัย และประหยัด');
INSERT INTO `bets_indicator` VALUES (1094, '2551030501', 9, '25510305010509', '๕. อธิบายตัวต้านทาน ไดโอดทรานซิสเตอร์และทดลองต่อวงจรอิเล็กทรอนิกส์เบื้องต้น ที่มีทรานซิสเตอร์');
INSERT INTO `bets_indicator` VALUES (1095, '2551030501', 13, '25510305010113', '๑. ทดลองและอธิบายสมบัติ ของคลื่นกล และอธิบายความสัมพันธ์ระหว่าง อัตราเร็ว ความถี่และความยาวคลื่น');
INSERT INTO `bets_indicator` VALUES (1096, '2551030501', 13, '25510305010213', '๒. อธิบายการเกิดคลื่นเสียงบีตส์ของเสียง ความเข้มเสียง ระดับความเข้มเสียง การได้ยินเสียงคุณภาพเสียง และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1097, '2551030501', 13, '25510305010313', '๓. อภิปรายผลการสืบค้นข้อมูลเกี่ยวกับมลพิษทางเสียงที่มีต่อสุขภาพของมนุษย์ และการเสนอวิธีป้องกัน');
INSERT INTO `bets_indicator` VALUES (1098, '2551030501', 13, '25510305010413', '๔. อธิบายคลื่นแม่เหล็กไฟฟ้าสเปกตรัมคลื่นแม่เหล็กไฟฟ้า และนำเสนอผลการสืบค้นข้อมูลเกี่ยวกับประโยชน์ และการป้องกันอันตรายจากคลื่นแม่เหล็กไฟฟ้า');
INSERT INTO `bets_indicator` VALUES (1099, '2551030501', 13, '25510305010513', '๕. อธิบายปฏิกิริยานิวเคลียร์ ฟิชชันฟิวชัน และความสัมพันธ์ระหว่างมวลกับพลังงาน');
INSERT INTO `bets_indicator` VALUES (1100, '2551030501', 13, '25510305010613', '๖. สืบค้นข้อมูลเกี่ยวกับพลังงานที่ได้จากปฏิกิริยานิวเคลียร์และผลต่อสิ่งมีชีวิต และสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1101, '2551030501', 13, '25510305010713', '๗. อภิปรายผลการสืบค้นข้อมูลเกี่ยวกับโรงไฟฟ้านิวเคลียร์และการนำไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1102, '2551030501', 13, '25510305010813', '๘. อธิบายชนิดและสมบัติของรังสีจากธาตุกัมมันตรังสี');
INSERT INTO `bets_indicator` VALUES (1103, '2551030501', 13, '25510305010913', '๙. อธิบายการเกิดกัมมันตภาพ รังสีและบอกวิธีการตรวจสอบรังสีในสิ่งแวดล้อม การใช้ประโยชน์ผลกระทบต่อสิ่งมีชีวิตและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1104, '2551030601', 1, '25510306010101', '๑. สำรวจทดลองและอธิบายองค์ ประกอบและสมบัติทางกายภาพของดินในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1105, '2551030601', 2, '25510306010102', '๑. สำรวจและจำแนกประเภทของดินโดยใช้สมบัติทางกายภาพเป็นเกณฑ์ และนำความรู้ ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1106, '2551030601', 3, '25510306010103', '๑. สำรวจและอธิบายสมบัติทางกายภาพของน้ำจากแหล่งน้ำในท้องถิ่นและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1107, '2551030601', 3, '25510306010203', '๒. สืบค้นข้อมูลและอภิปรายส่วนประกอบของอากาศและความสำคัญของอากาศ');
INSERT INTO `bets_indicator` VALUES (1108, '2551030601', 3, '25510306010303', '๓. ทดลองอธิบายการเคลื่อนที่ของอากาศที่มีผลจากความแตกต่างของอุณหภูมิ');
INSERT INTO `bets_indicator` VALUES (1109, '2551030601', 4, '25510306010104', '๑. สำรวจและอธิบายการเกิดดิน');
INSERT INTO `bets_indicator` VALUES (1110, '2551030601', 4, '25510306010204', '๒.ระบุชนิดและสมบัติของดินที่ใช้ปลูกพืชในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1111, '2551030601', 5, '25510306010105', '๑. สำรวจทดลองและอธิบายการเกิดเมฆ หมอกน้ำค้าง ฝนและลูกเห็บ');
INSERT INTO `bets_indicator` VALUES (1112, '2551030601', 5, '25510306010205', '๒. ทดลองและอธิบายการเกิดวัฏจักรน้ำ');
INSERT INTO `bets_indicator` VALUES (1113, '2551030601', 5, '25510306010305', '๓. ออกแบบและสร้างเครื่องมืออย่างง่ายในการวัดอุณหภูมิความชื้น และความกดอากาศ');
INSERT INTO `bets_indicator` VALUES (1114, '2551030601', 5, '25510306010405', '๔. ทดลองและอธิบายการเกิดลมและนำความรู้ไปใช้ประโยชน์ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (1115, '2551030601', 6, '25510306010106', '๑. อธิบายจำแนกประเภทของหิน โดยใช้ลักษณะของหิน สมบัติของหินเป็นเกณฑ์และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1116, '2551030601', 6, '25510306010206', '๒. สำรวจและอธิบายการเปลี่ยนแปลงของหิน');
INSERT INTO `bets_indicator` VALUES (1117, '2551030601', 6, '25510306010306', '๓. สืบค้นและอธิบายธรณีพิบัติภัยที่มีผลต่อมนุษย์และสภาพแวดล้อมในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1118, '2551030601', 7, '25510306010107', '๑. สืบค้นและอธิบายองค์ประกอบและการ แบ่งชั้นบรรยากาศที่ปกคลุมผิวโลก');
INSERT INTO `bets_indicator` VALUES (1119, '2551030601', 7, '25510306010207', '๒. ทดลองและอธิบายความสัมพันธ์ระหว่างอุณหภูมิความชื้นและความกดอากาศที่มีผลต่อปรากฏการณ์ทางลมฟ้าอากาศ');
INSERT INTO `bets_indicator` VALUES (1120, '2551030601', 7, '25510306010307', '๓. สังเกตวิเคราะห์และ อภิปรายการเกิดปรากฏการณ์ทางลมฟ้าอากาศที่มีผลต่อมนุษย์');
INSERT INTO `bets_indicator` VALUES (1121, '2551030601', 7, '25510306010407', '๔. สืบค้นวิเคราะห์และแปลความหมายข้อมูลจากการพยากรณ์อากาศ');
INSERT INTO `bets_indicator` VALUES (1122, '2551030601', 7, '25510306010507', '๕. สืบค้นวิเคราะห์ และอธิบายผลของลมฟ้าอากาศต่อการดำรงชีวิตของสิ่งมีชีวิต และสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1123, '2551030601', 7, '25510306010607', '๖. สืบค้นวิเคราะห์ และอธิบายปัจจัยทางธรรมชาติและการกระทำของมนุษย์ที่มีผลต่อการเปลี่ยนแปลงอุณหภูมิของโลก รูโหว่โอโซน และฝนกรด');
INSERT INTO `bets_indicator` VALUES (1124, '2551030601', 7, '25510306010707', '๗. สืบค้นวิเคราะห์และอธิบายผลของภาวะโลกร้อนรูโหว่โอโซนและฝนกรดที่มีต่อสิ่งมีชีวิตและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1125, '2551030601', 8, '25510306010108', '๑. สำรวจทดลองและอธิบายลักษณะของชั้นหน้าตัดดิน สมบัติของดิน และกระบวนการเกิดดิน');
INSERT INTO `bets_indicator` VALUES (1126, '2551030601', 8, '25510306010208', '๒. สำรวจวิเคราะห์และอธิบายการใช้ประโยชน์และการปรับปรุงคุณภาพของดิน');
INSERT INTO `bets_indicator` VALUES (1127, '2551030601', 8, '25510306010308', '๓. ทดลองเลียนแบบเพื่ออธิบายกระบวนการเกิดและลักษณะองค์ประกอบของหิน');
INSERT INTO `bets_indicator` VALUES (1128, '2551030601', 8, '25510306010408', '๔. ทดสอบและสังเกตองค์ประกอบและสมบัติของหิน เพื่อจำแนกประเภทของหินและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1129, '2551030601', 8, '25510306010508', '๕. ตรวจสอบและอธิบายลักษณะทางกายภาพของแร่และการนำไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1130, '2551030601', 8, '25510306010608', '๖ สืบค้นและอธิบายกระบวนการเกิด ลักษณะและสมบัติของปิโตรเลียมถ่านหิน หินน้ำมัน และการนำไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1131, '2551030601', 8, '25510306010708', '๗. สำรวจและอธิบายลักษณะแหล่งน้ำธรรมชาติการใช้ประโยชน์และการอนุรักษ์แหล่งน้ำในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1132, '2551030601', 8, '25510306010808', '๘. ทดลองเลียนแบบ และอธิบาย การเกิดแหล่งน้ำบนดินแหล่งน้ำใต้ดิน');
INSERT INTO `bets_indicator` VALUES (1133, '2551030601', 8, '25510306010908', '๙. ทดลองเลียนแบบและอธิบายกระบวนการผุพังอยู่กับที่การกร่อนการพัดพาการทับถมการตกผลึกและผลของกระบวนการดังกล่าว');
INSERT INTO `bets_indicator` VALUES (1134, '2551030601', 8, '25510306011008', '๑๐. สืบค้น สร้างแบบจำลองและ อธิบายโครงสร้างและองค์ประกอบของโลก');
INSERT INTO `bets_indicator` VALUES (1135, '2551030601', 13, '25510306010113', '๑. สืบค้นและอธิบายหลักการในการแบ่งโครงสร้างโลก');
INSERT INTO `bets_indicator` VALUES (1136, '2551030601', 13, '25510306010213', '๒. ทดลองเลียนแบบและอธิบายกระบวนการเปลี่ยนแปลงทางธรณีภาคของโลก');
INSERT INTO `bets_indicator` VALUES (1137, '2551030601', 13, '25510306010313', '๓. ทดลองเลียนแบบ และอธิบายกระบวนการเกิดภูเขา รอยเลื่อน รอยคดโค้ง แผ่นดินไหว ภูเขาไฟระเบิด');
INSERT INTO `bets_indicator` VALUES (1138, '2551030601', 13, '25510306010413', '๔. สืบค้นและอธิบายความ สำคัญของปรากฏการณ์ทางธรณีวิทยาแผ่นดินไหว ภูเขาไฟระเบิดที่ส่งผลต่อ สิ่งมีชีวิตและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1139, '2551030601', 13, '25510306010513', '๕. สำรวจ วิเคราะห์และอธิบายการลำดับชั้นหิน จากการวางตัวของชั้นหิน ซากดึกดำบรรพ์และโครงสร้างทางธรณีวิทยาเพื่ออธิบายประวัติความเป็นมาของพื้นที่');
INSERT INTO `bets_indicator` VALUES (1140, '2551030601', 13, '25510306010613', '๖. สืบค้น วิเคราะห์ และอธิบายประโยชน์ของข้อมูลทางธรณีวิทยา');
INSERT INTO `bets_indicator` VALUES (1141, '2551030701', 1, '25510307010101', '๑. ระบุว่าในท้องฟ้ามีดวงอาทิตย์ดวงจันทร์และดวงดาว');
INSERT INTO `bets_indicator` VALUES (1142, '2551030701', 2, '25510307010102', '๑. สืบค้นและอภิปรายความสำคัญของดวงอาทิตย์');
INSERT INTO `bets_indicator` VALUES (1143, '2551030701', 3, '25510307010103', '๑. สังเกต และอธิบายการขึ้นตกของดวงอาทิตย์ดวงจันทร์การเกิดกลางวันกลางคืน และการกำหนดทิศ');
INSERT INTO `bets_indicator` VALUES (1144, '2551030701', 4, '25510307010104', '๑. สร้างแบบจำลองเพื่ออธิบายลักษณะของระบบสุริยะ');
INSERT INTO `bets_indicator` VALUES (1145, '2551030701', 5, '25510307010105', '๑. สังเกตและอธิบายการเกิดทิศ และปรากฏการณ์การขึ้นตกของดวงดาวโดยใช้แผนที่ดาว');
INSERT INTO `bets_indicator` VALUES (1146, '2551030701', 6, '25510307010106', '๑. สร้างแบบจำลองและอธิบายการเกิดฤดูข้างขึ้นข้างแรมสุริยุปราคาจันทรุปราคาและนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1147, '2551030701', 9, '25510307010109', '๑. สืบค้นและอธิบายความสัมพันธ์ระหว่างดวงอาทิตย์โลก ดวงจันทร์และดาวเคราะห์อื่น ๆ และผลที่เกิดขึ้นต่อสิ่งแวดล้อมและสิ่งมีชีวิตบนโลก');
INSERT INTO `bets_indicator` VALUES (1148, '2551030701', 9, '25510307010209', '๒. สืบค้นและอธิบายองค์ประกอบของเอกภพกาแล็กซี และระบบสุริยะ');
INSERT INTO `bets_indicator` VALUES (1149, '2551030701', 9, '25510307010309', '๓. ระบุตำแหน่งของกลุ่มดาว และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_indicator` VALUES (1150, '2551030701', 13, '25510307010113', '๑. สืบค้นและอธิบายการเกิดและวิวัฒนาการของระบบสุริยะกาแล็กซีและเอกภพ');
INSERT INTO `bets_indicator` VALUES (1151, '2551030701', 13, '25510307010213', '๒. สืบค้นและอธิบายธรรมชาติและวัฒนาการของดาวฤกษ์');
INSERT INTO `bets_indicator` VALUES (1152, '2551030702', 6, '25510307020106', '๑. สืบค้นอภิปรายความก้าวหน้าและประโยชน์ของเทคโนโลยีอวกาศ');
INSERT INTO `bets_indicator` VALUES (1153, '2551030702', 9, '25510307020109', '๑. สืบค้นและอภิปรายความก้าวหน้าของเทคโนโลยีอวกาศที่ใช้สำรวจอวกาศวัตถุท้องฟ้าสภาวะอากาศทรัพยากรธรรมชาติการเกษตรและการสื่อสาร');
INSERT INTO `bets_indicator` VALUES (1154, '2551030702', 13, '25510307020113', '๑. สืบค้นและอธิบายการส่งและคำนวณความเร็วในการโคจรของดาวเทียมรอบโลก');
INSERT INTO `bets_indicator` VALUES (1155, '2551030702', 13, '25510307020213', '๒. สืบค้นและอธิบายประโยชน์ของดาวเทียมในด้านต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (1156, '2551030702', 13, '25510307020313', '๓. สืบค้นและอธิบายการส่งและสำรวจอวกาศโดยใช้ยานอวกาศและสถานีอวกาศ');
INSERT INTO `bets_indicator` VALUES (1157, '2551030801', 1, '25510308010101', '๑.ตั้งคำถามเกี่ยวกับเรื่องที่จะศึกษาตามที่กำหนดให้หรือตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (1158, '2551030801', 1, '25510308010201', '๒.วางแผนการสังเกตสำรวจตรวจสอบศึกษาค้นคว้าโดยใช้ความคิดของตนเองและของครู');
INSERT INTO `bets_indicator` VALUES (1159, '2551030801', 1, '25510308010301', '๓. ใช้วัสดุอุปกรณ์ในการสำรวจตรวจสอบและบันทึกผลด้วยวิธีง่ายๆ');
INSERT INTO `bets_indicator` VALUES (1160, '2551030801', 1, '25510308010401', '๔. จัดกลุ่มข้อมูลที่ได้จากการสำรวจตรวจสอบและนำเสนอผล');
INSERT INTO `bets_indicator` VALUES (1161, '2551030801', 1, '25510308010501', '๕. แสดงความคิดเห็นในการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1162, '2551030801', 1, '25510308010601', '๖. บันทึกและอธิบายผลการสังเกตสำรวจตรวจสอบโดยเขียนภาพหรือข้อความสั้นๆ');
INSERT INTO `bets_indicator` VALUES (1163, '2551030801', 1, '25510308010701', '๗. นำเสนอผลงานด้วยวาจาให้ผู้อื่นเข้าใจ');
INSERT INTO `bets_indicator` VALUES (1164, '2551030801', 2, '25510308010102', '๑.ตั้งคำถามเกี่ยวกับเรื่องที่จะศึกษาตามที่กำหนดให้และตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (1165, '2551030801', 2, '25510308010202', '๒.วางแผนการสังเกตสำรวจตรวจสอบศึกษาค้นคว้าโดยใช้ความคิดของตนเองของกลุ่มและของครู');
INSERT INTO `bets_indicator` VALUES (1166, '2551030801', 2, '25510308010302', '๓. ใช้วัสดุอุปกรณ์เครื่องมือที่เหมาะสมในการสำรวจตรวจสอบและบันทึกข้อมูล');
INSERT INTO `bets_indicator` VALUES (1167, '2551030801', 2, '25510308010402', '๔. จัดกลุ่มข้อมูลเปรียบเทียบและนำเสนอผล');
INSERT INTO `bets_indicator` VALUES (1168, '2551030801', 2, '25510308010502', '๕. ตั้งคำถามใหม่จากผลการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1169, '2551030801', 2, '25510308010602', '๖. แสดงความคิดเห็นเป็นกลุ่มและรวบรวมเป็นความรู้');
INSERT INTO `bets_indicator` VALUES (1170, '2551030801', 2, '25510308010702', '๗. บันทึกและอธิบายผลการสังเกต สำรวจตรวจสอบอย่างตรงไปตรงมาโดยเขียนภาพแผนภาพหรือคำอธิบาย');
INSERT INTO `bets_indicator` VALUES (1171, '2551030801', 2, '25510308010802', '๘. นำเสนอผลงานด้วยวาจาให้ผู้อื่นเข้าใจกระบวนการและผล ของงาน');
INSERT INTO `bets_indicator` VALUES (1172, '2551030801', 3, '25510308010103', '๑.ตั้งคำถามเกี่ยวกับเรื่องที่จะศึกษาตามที่กำหนดให้และตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (1173, '2551030801', 3, '25510308010203', '๒.วางแผนการสังเกตเสนอวิธีสำรวจตรวจสอบศึกษาค้นคว้าโดยใช้ความคิดของตนเอง ของกลุ่มและคาดการณ์สิ่งที่จะพบจากการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1174, '2551030801', 3, '25510308010303', '๓. เลือกใช้วัสดุอุปกรณ์เครื่องมือที่เหมาะสมในการสำรวจตรวจสอบและบันทึกข้อมูล');
INSERT INTO `bets_indicator` VALUES (1175, '2551030801', 3, '25510308010403', '๔. จัดกลุ่มข้อมูลเปรียบเทียบกับสิ่งที่คาดการณ์ไว้และนำเสนอผล');
INSERT INTO `bets_indicator` VALUES (1176, '2551030801', 3, '25510308010503', '๕. ตั้งคำถามใหม่จากผลการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1177, '2551030801', 3, '25510308010603', '๖. แสดงความคิดเห็นและรวบรวมข้อมูลจากกลุ่มนำไปสู่การสร้างความรู้');
INSERT INTO `bets_indicator` VALUES (1178, '2551030801', 3, '25510308010703', '๗. บันทึกและอธิบายผลการสังเกต สำรวจตรวจสอบตามความเป็นจริงมีแผนภาพประกอบคำอธิบาย');
INSERT INTO `bets_indicator` VALUES (1179, '2551030801', 3, '25510308010803', '๘. นำเสนอจัดแสดงผลงานโดยอธิบายด้วยวาจา และเขียนแสดงกระบวนการและผลของงานให้ผู้อื่นเข้าใจ');
INSERT INTO `bets_indicator` VALUES (1180, '2551030801', 4, '25510308010104', '๑. ตั้งคำถามเกี่ยวกับประเด็นหรือเรื่อง หรือสถานการณ์ที่จะศึกษาตามที่กำหนดให้และตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (1181, '2551030801', 4, '25510308010204', '๒.วางแผนการสังเกตเสนอวิธีสำรวจตรวจสอบ หรือศึกษาค้นคว้าและคาดการณ์สิ่งที่จะพบจากการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1182, '2551030801', 4, '25510308010304', '๓. เลือกอุปกรณ์ที่ถูกต้องเหมาะสมในการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1183, '2551030801', 4, '25510308010404', '๔. บันทึกข้อมูลในเชิงปริมาณ นำเสนอผลสรุปผล');
INSERT INTO `bets_indicator` VALUES (1184, '2551030801', 4, '25510308010504', '๕. สร้างคำถามใหม่เพื่อการสำรวจตรวจสอบต่อไป');
INSERT INTO `bets_indicator` VALUES (1185, '2551030801', 4, '25510308010604', '๖. แสดงความคิดเห็นและสรุปสิ่งที่ได้เรียนรู้');
INSERT INTO `bets_indicator` VALUES (1186, '2551030801', 4, '25510308010704', '๗. บันทึกและอธิบาย ผลการสำรวจตรวจสอบอย่างตรงไปตรงมา');
INSERT INTO `bets_indicator` VALUES (1187, '2551030801', 4, '25510308010804', '๘. นำเสนอจัดแสดงผลงานโดยอธิบายด้วยวาจา หรือเขียนอธิบายกระบวนการและผลของงานให้ผู้อื่นเข้าใจ');
INSERT INTO `bets_indicator` VALUES (1188, '2551030801', 5, '25510308010105', '๑. ตั้งคำถามเกี่ยวกับประเด็นหรือเรื่องหรือสถานการณ์ที่จะศึกษาตามที่กำหนดให้และตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (1189, '2551030801', 5, '25510308010205', '๒.วางแผนการสังเกตเสนอการสำรวจตรวจสอบหรือศึกษาค้นคว้า และคาดการณ์สิ่งที่จะพบจากการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1190, '2551030801', 5, '25510308010305', '๓. เลือกอุปกรณ์ที่ถูกต้องเหมาะสมในการสำรวจตรวจสอบให้ได้ข้อมูลที่เชื่อถือได้');
INSERT INTO `bets_indicator` VALUES (1191, '2551030801', 5, '25510308010405', '๔. บันทึกข้อมูลในเชิงปริมาณและคุณภาพ และตรวจสอบผลกับสิ่งที่คาดการณ์ไว้นำเสนอผลและข้อสรุป');
INSERT INTO `bets_indicator` VALUES (1192, '2551030801', 5, '25510308010505', '๕. สร้างคำถามใหม่เพื่อการสำรวจตรวจสอบต่อไป');
INSERT INTO `bets_indicator` VALUES (1193, '2551030801', 5, '25510308010605', '๖. แสดงความคิดเห็นอย่างอิสระอธิบาย และสรุปสิ่งที่ได้เรียนรู้');
INSERT INTO `bets_indicator` VALUES (1194, '2551030801', 5, '25510308010705', '๗. บันทึกและอธิบายผลการสำรวจตรวจสอบตามความเป็นจริงมีการอ้างอิง');
INSERT INTO `bets_indicator` VALUES (1195, '2551030801', 5, '25510308010805', '๘. นำเสนอจัดแสดงผลงาน โดยอธิบายด้วยวาจาหรือเขียนอธิบายแสดงกระบวนการและผล ของงานให้ผู้อื่นเข้าใจ');
INSERT INTO `bets_indicator` VALUES (1196, '2551030801', 6, '25510308010106', '๑.ตั้งคำถามเกี่ยวกับประเด็นหรือเรื่องหรือสถานการณ์ที่จะศึกษาตามที่กำหนดให้และตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (1197, '2551030801', 6, '25510308010206', '๒.วางแผนการสังเกตเสนอการสำรวจตรวจสอบหรือศึกษาค้นคว้าคาดการณ์สิ่งที่จะพบจากการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1198, '2551030801', 6, '25510308010306', '๓. เลือกอุปกรณ์และวิธีการสำรวจตรวจสอบที่ถูกต้องเหมาะสมให้ได้ผลที่ครอบคลุมและเชื่อถือได้');
INSERT INTO `bets_indicator` VALUES (1199, '2551030801', 6, '25510308010406', '๔. บันทึกข้อมูลในเชิงปริมาณและคุณภาพวิเคราะห์ และตรวจสอบผลกับสิ่งที่คาดการณ์ไว้ นำเสนอผลและข้อสรุป');
INSERT INTO `bets_indicator` VALUES (1200, '2551030801', 6, '25510308010506', '๕. สร้างคำถามใหม่เพื่อการสำรวจตรวจสอบต่อไป');
INSERT INTO `bets_indicator` VALUES (1201, '2551030801', 6, '25510308010606', '๖. แสดงความคิดเห็นอย่างอิสระอธิบายลงความเห็นและสรุปสิ่งที่ได้เรียนรู้');
INSERT INTO `bets_indicator` VALUES (1202, '2551030801', 6, '25510308010706', '๗. บันทึกและอธิบายผลการสำรวจตรวจสอบตามความเป็นจริงมีเหตุผล และมีประจักษ์พยานอ้างอิง');
INSERT INTO `bets_indicator` VALUES (1203, '2551030801', 6, '25510308010806', '๘. นำเสนอจัดแสดงผลงานโดยอธิบายด้วยวาจา และเขียนรายงานแสดงกระบวนการและผลของงานให้ผู้อื่นเข้าใจ');
INSERT INTO `bets_indicator` VALUES (1204, '2551030801', 7, '25510308010107', '๑. ตั้งคำถามที่กำหนดประเด็นหรือตัวแปรที่สำคัญในการสำรวจตรวจสอบหรือศึกษาค้นคว้าเรื่องที่สนใจได้อย่างครอบคลุ่มและเชื่อถือได้');
INSERT INTO `bets_indicator` VALUES (1205, '2551030801', 7, '25510308010207', '๒. สร้างสมมติฐานที่สามารถตรวจสอบได้และวางแผนการสำรวจตรวจสอบหลาย ๆ วิธี');
INSERT INTO `bets_indicator` VALUES (1206, '2551030801', 7, '25510308010307', '๓. เลือกเทคนิควิธีการสำรวจตรวจสอบทั้งเชิงปริมาณและเชิงคุณภาพที่ได้ผลเที่ยงตรงและปลอดภัยโดยใช้วัสดุและเครื่องมือที่เหมาะสม');
INSERT INTO `bets_indicator` VALUES (1207, '2551030801', 7, '25510308010407', '๔. รวบรวมข้อมูลจัดกระทำข้อมูลเชิงปริมาณและคุณภาพ');
INSERT INTO `bets_indicator` VALUES (1208, '2551030801', 7, '25510308010507', '๕.วิเคราะห์และประเมินความสอดคล้องของประจักษ์พยานกับข้อสรุปทั้งที่สนับสนุนหรือขัดแย้งกับสมมติฐานและความผิดปกติของข้อมูลจากการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1209, '2551030801', 7, '25510308010607', '๖. สร้างแบบจำลองหรือรูปแบบที่อธิบายผลหรือแสดงผลของการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1210, '2551030801', 7, '25510308010707', '๗. สร้างคำถามที่นำไปสู่การสำรวจตรวจสอบในเรื่องที่เกี่ยวข้องและนำความรู้ที่ได้ไปใช้ในสถานการณ์ใหม่หรืออธิบายเกี่ยวกับแนวคิดกระบวนการและผลของโครงงานหรือชิ้นงานให้ผู้อื่นเข้าใจ');
INSERT INTO `bets_indicator` VALUES (1211, '2551030801', 7, '25510308010807', '๘. บันทึกและอธิบายผลการสังเกตการสำรวจตรวจสอบค้นคว้าเพิ่มเติมจากแหล่งความรู้ต่าง ๆให้ได้ข้อมูลที่เชื่อถือได้ และยอมรับการเปลี่ยนแปลงความรู้ที่ค้นพบเมื่อมีข้อมูลและประจักษ์พยานใหม่เพิ่มขึ้นหรือโต้แย้งจากเดิม');
INSERT INTO `bets_indicator` VALUES (1212, '2551030801', 7, '25510308010907', '๙. จัดแสดงผลงาน เขียนรายงาน และ/หรืออธิบายเกี่ยวกับแนวคิดกระบวนการและผลของโครงงานหรือชิ้นงานให้ผู้อื่นเข้าใจ');
INSERT INTO `bets_indicator` VALUES (1213, '2551030801', 8, '25510308010108', '๑. ตั้งคำถามที่กำหนดประเด็นหรือตัวแปรที่สำคัญในการสำรวจตรวจสอบหรือศึกษาค้นคว้าเรื่องที่สนใจได้อย่างครอบคลุ่มและเชื่อถือได้');
INSERT INTO `bets_indicator` VALUES (1214, '2551030801', 8, '25510308010208', '๒. สร้างสมมติฐานที่สามารถตรวจสอบได้และวางแผนการสำรวจตรวจสอบหลาย ๆ วิธี');
INSERT INTO `bets_indicator` VALUES (1215, '2551030801', 8, '25510308010308', '๓. เลือกเทคนิควิธีการสำรวจตรวจสอบทั้งเชิงปริมาณและเชิงคุณภาพที่ได้ผลเที่ยงตรงและปลอดภัยโดยใช้วัสดุและเครื่องมือที่เหมาะสม');
INSERT INTO `bets_indicator` VALUES (1216, '2551030801', 8, '25510308010408', '๔. รวบรวมข้อมูลจัดกระทำข้อมูลเชิงปริมาณและคุณภาพ');
INSERT INTO `bets_indicator` VALUES (1217, '2551030801', 8, '25510308010508', '๕.วิเคราะห์และประเมินความสอดคล้องของประจักษ์พยานกับข้อสรุปทั้งที่สนับสนุนหรือขัดแย้งกับสมมติฐานและความผิดปกติของข้อมูลจากการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1218, '2551030801', 8, '25510308010608', '๖. สร้างแบบจำลองหรือรูปแบบที่อธิบายผลหรือแสดงผลของการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1219, '2551030801', 8, '25510308010708', '๗. สร้างคำถามที่นำไปสู่การสำรวจตรวจสอบในเรื่องที่เกี่ยวข้องและนำความรู้ที่ได้ไปใช้ในสถานการณ์ใหม่หรืออธิบายเกี่ยวกับแนวคิดกระบวนการและผลของโครงงานหรือชิ้นงานให้ผู้อื่นเข้าใจ');
INSERT INTO `bets_indicator` VALUES (1220, '2551030801', 8, '25510308010808', '๘. บันทึกและอธิบายผลการสังเกตการสำรวจตรวจสอบค้นคว้าเพิ่มเติมจากแหล่งความรู้ต่าง ๆให้ได้ข้อมูลที่เชื่อถือได้ และยอมรับการเปลี่ยนแปลงความรู้ที่ค้นพบเมื่อมีข้อมูลและประจักษ์พยานใหม่เพิ่มขึ้นหรือโต้แย้งจากเดิม');
INSERT INTO `bets_indicator` VALUES (1221, '2551030801', 8, '25510308010908', '๙. จัดแสดงผลงาน เขียนรายงาน และ/หรืออธิบายเกี่ยวกับแนวคิดกระบวนการและผลของโครงงานหรือชิ้นงานให้ผู้อื่นเข้าใจ');
INSERT INTO `bets_indicator` VALUES (1222, '2551030801', 9, '25510308010109', '๑. ตั้งคำถามที่กำหนดประเด็นหรือตัวแปรที่สำคัญในการสำรวจตรวจสอบหรือศึกษาค้นคว้าเรื่องที่สนใจได้อย่างครอบคลุ่มและเชื่อถือได้');
INSERT INTO `bets_indicator` VALUES (1223, '2551030801', 9, '25510308010209', '๒. สร้างสมมติฐานที่สามารถตรวจสอบได้และวางแผนการสำรวจตรวจสอบหลาย ๆ วิธี');
INSERT INTO `bets_indicator` VALUES (1224, '2551030801', 9, '25510308010309', '๓. เลือกเทคนิควิธีการสำรวจตรวจสอบทั้งเชิงปริมาณและเชิงคุณภาพที่ได้ผลเที่ยงตรงและปลอดภัยโดยใช้วัสดุและเครื่องมือที่เหมาะสม');
INSERT INTO `bets_indicator` VALUES (1225, '2551030801', 9, '25510308010409', '๔. รวบรวมข้อมูลจัดกระทำข้อมูลเชิงปริมาณและคุณภาพ');
INSERT INTO `bets_indicator` VALUES (1226, '2551030801', 9, '25510308010509', '๕.วิเคราะห์และประเมินความสอดคล้องของประจักษ์พยานกับข้อสรุปทั้งที่สนับสนุนหรือขัดแย้งกับสมมติฐานและความผิดปกติของข้อมูลจากการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1227, '2551030801', 9, '25510308010609', '๖. สร้างแบบจำลองหรือรูปแบบที่อธิบายผลหรือแสดงผลของการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1228, '2551030801', 9, '25510308010709', '๗. สร้างคำถามที่นำไปสู่การสำรวจตรวจสอบในเรื่องที่เกี่ยวข้องและนำความรู้ที่ได้ไปใช้ในสถานการณ์ใหม่หรืออธิบายเกี่ยวกับแนวคิดกระบวนการและผลของโครงงานหรือชิ้นงานให้ผู้อื่นเข้าใจ');
INSERT INTO `bets_indicator` VALUES (1229, '2551030801', 9, '25510308010809', '๘. บันทึกและอธิบายผลการสังเกตการสำรวจตรวจสอบค้นคว้าเพิ่มเติมจากแหล่งความรู้ต่าง ๆให้ได้ข้อมูลที่เชื่อถือได้ และยอมรับการเปลี่ยนแปลงความรู้ที่ค้นพบเมื่อมีข้อมูลและประจักษ์พยานใหม่เพิ่มขึ้นหรือโต้แย้งจากเดิม');
INSERT INTO `bets_indicator` VALUES (1230, '2551030801', 9, '25510308010909', '๙. จัดแสดงผลงาน เขียนรายงาน และ/หรืออธิบายเกี่ยวกับแนวคิดกระบวนการและผลของโครงงานหรือชิ้นงานให้ผู้อื่นเข้าใจ');
INSERT INTO `bets_indicator` VALUES (1231, '2551030801', 13, '25510308010113', '๑. ตั้งคำถามที่อยู่บนพื้นฐานของความรู้และความเข้าใจทางวิทยาศาสตร์ หรือความสนใจหรือจากประเด็นที่เกิดขึ้นในขณะนั้น ที่สามารถทำการสำรวจตรวจสอบหรือศึกษาค้นคว้าได้อย่างครอบคลุมและเชื่อถือได้');
INSERT INTO `bets_indicator` VALUES (1232, '2551030801', 13, '25510308010213', '๒. สร้างสมมติฐานที่มีทฤษฎีรองรับ หรือคาดการณ์สิ่งที่จะพบ หรือสร้างแบบจำลองหรือสร้างรูปแบบ เพื่อนำไปสู่การสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1233, '2551030801', 13, '25510308010313', '๓. ค้นคว้ารวบรวมข้อมูลที่ต้องพิจารณาปัจจัยหรือตัวแปรสำคัญ ปัจจัยที่มีผลต่อปัจจัยอื่นปัจจัยที่ควบคุมไม่ได้ และจำนวนครั้งของการสำรวจ ตรวจสอบเพื่อให้ได้ผลที่มีความเชื่อมั่นอย่างเพียงพอ');
INSERT INTO `bets_indicator` VALUES (1234, '2551030801', 13, '25510308010413', '๔. เลือกวัสดุ เทคนิควิธี อุปกรณ์ที่ใช้ในการสังเกต การวัดการสำรวจตรวจสอบอย่างถูกต้องทั้งทางกว้างและลึกในเชิงปริมาณและคุณภาพ');
INSERT INTO `bets_indicator` VALUES (1235, '2551030801', 13, '25510308010513', '๕. รวบรวมข้อมูลและบันทึกผลการสำรวจตรวจสอบอย่างเป็นระบบถูกต้อง ครอบคลุมทั้งในเชิงปริมาณและคุณภาพ โดยตรวจสอบความเป็นไปได้ ความเหมาะสมหรือความผิดพลาดของข้อมูล');
INSERT INTO `bets_indicator` VALUES (1236, '2551030801', 13, '25510308010613', '๖. จัดกระทำข้อมูล โดยคำนึงถึงการรายงานผลเชิงตัวเลขที่มีระดับความถูกต้องและนำเสนอข้อมูลด้วยเทคนิควิธีที่เหมาะสม');
INSERT INTO `bets_indicator` VALUES (1237, '2551030801', 13, '25510308010713', '๗. วิเคราะห์ข้อมูล แปลความหมายข้อมูล และประเมินความสอดคล้องของข้อสรุปหรือสาระสำคัญ เพื่อตรวจสอบกับสมมติฐานที่ตั้งไว้');
INSERT INTO `bets_indicator` VALUES (1238, '2551030801', 13, '25510308010813', '๘. พิจารณาความน่าเชื่อถือของวิธีการและผลการสำรวจตรวจสอบ โดยใช้หลักความคลาดเคลื่อน ของการวัดและการสังเกต เสนอแนะการปรับปรุงวิธีการสำรวจตรวจสอบ');
INSERT INTO `bets_indicator` VALUES (1239, '2551030801', 13, '25510308010913', '๙. นำผลของการสำรวจตรวจสอบที่ได้ ทั้งวิธีการและองค์ความรู้ที่ได้ไปสร้างคำถามใหม่ นำไปใช้แก้ปัญหาในสถานการณ์ใหม่และในชีวิตจริง');
INSERT INTO `bets_indicator` VALUES (1240, '2551030801', 13, '25510308011013', '๑๐. ตระหนักถึงความสำคัญในการที่จะต้องมีส่วนร่วมรับผิดชอบการอธิบาย การลงความเห็น และการสรุปผลการเรียนรู้วิทยาศาสตร์ที่นำเสนอต่อสาธารณชนด้วยความถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1241, '2551030801', 13, '25510308011113', '๑๑. บันทึกและอธิบายผลการสำรวจตรวจสอบอย่างมีเหตุผลใช้พยานหลักฐานอ้างอิงหรือค้นคว้าเพื่อเติม เพื่อหาหลักฐานอ้างอิงที่เชื่อถือได้ และยอมรับว่าความรู้เดิม อาจมีการเปลี่ยนแปลงได้ เมื่อมีข้อมูลและประจักษ์ พยานใหม่เพิ่มติมหรือโต้แย้งจากเดิม ซึ่งท้าทายให้มีการตรวจสอบอย่างระมัดระวังอันจะนำมาสู่การยอมรับเป็นความรู้ใหม่');
INSERT INTO `bets_indicator` VALUES (1242, '2551030801', 13, '25510308011213', '๑๒. จัดแสดงผลงาน เขียนรายงานและ/หรืออธิบายเกี่ยวกับแนวคิดกระบวนการ และผลของโครงงานหรือชิ้นงานให้ผู้อื่นเข้าใจ');
INSERT INTO `bets_indicator` VALUES (1243, '2551040101', 1, '25510401010101', '๑. บอกพุทธประวัติหรือประวัติของศาสดาที่ตนนับถือโดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1244, '2551040101', 1, '25510401010201', '๒. ชื่นชมและบอกแบบอย่างการดำเนินชีวิตและข้อคิดจากประวัติสาวกชาดก/เรื่องเล่าและศาสนิกชนตัวอย่างตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1245, '2551040101', 1, '25510401010301', '๓. บอกความหมายความสำคัญและเคารพพระรัตนตรัยปฏิบัติตามหลักธรรมโอวาท ๓ ในพระพุทธศาสนาหรือหลักธรรมของศาสนาที่ตนนับถือตามที่หนด');
INSERT INTO `bets_indicator` VALUES (1246, '2551040101', 1, '25510401010401', '๔. เห็นคุณค่าและสวดมนต์แผ่เมตตา มีสติที่เป็นพื้นฐานของสมาธิในพระพุทธศาสนา หรือการพัฒนาจิตตามแนวทางของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1247, '2551040101', 2, '25510401010102', '๑. บอกความสำคัญของพระพุทธศาสนาหรือศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1248, '2551040101', 2, '25510401010202', '๒. สรุปพุทธประวัติตั้งแต่ประสูติจนถึงการออกผนวช หรือประวัติศาสดาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1249, '2551040101', 2, '25510401010302', '๓. ชื่นชมและบอกแบบอย่างการดำเนินชีวิตและข้อคิดจากประวัติสาวกชาดก เรื่องเล่าและศาสนิกชนตัวอย่างตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1250, '2551040101', 2, '25510401010402', '๔. บอกความหมายความสำคัญและเคารพพระรัตนตรัยปฏิบัติตามหลักธรรมโอวาท ๓ในพระพุทธศาสนาหรือหลักธรรมของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1251, '2551040101', 2, '25510401010502', '๕. ชื่นชมการทำความดีของตนเอง บุคคลในครอบครัวและในโรงเรียนตามหลักศาสนา');
INSERT INTO `bets_indicator` VALUES (1252, '2551040101', 2, '25510401010602', '๖. เห็นคุณค่าและสวดมนต์แผ่เมตตามีสติที่เป็นพื้นฐานของสมาธิในพระพุทธศาสนาหรือการพัฒนาจิตตามแนวทางของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1253, '2551040101', 2, '25510401010702', '๗. บอกชื่อศาสนา ศาสดาและความสำคัญของคัมภีร์ของศาสนาที่ตนนับถือและศาสนาอื่นๆ');
INSERT INTO `bets_indicator` VALUES (1254, '2551040101', 3, '25510401010103', '๑. อธิบายความสำคัญของพระพุทธศาสนาหรือศาสนาที่ตนนับถือในฐานะที่เป็นรากฐานสำคัญของวัฒนธรรมไทย');
INSERT INTO `bets_indicator` VALUES (1255, '2551040101', 3, '25510401010203', '๒. สรุปพุทธประวัติตั้งแต่การบำเพ็ญเพียรจนถึงปรินิพพาน หรือประวัติของศาสดาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1256, '2551040101', 3, '25510401010303', '๓. ชื่นชมและบอกแบบอย่างการดำเนินชีวิตและข้อคิดจากประวัติสาวกชาดก เรื่องเล่าและศาสนิกชนตัวอย่างตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1257, '2551040101', 3, '25510401010403', '๔. บอกความหมายความสำคัญของพระไตรปิฏกหรือคัมภีร์ของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1258, '2551040101', 3, '25510401010503', '๕. แสดงความเคารพพระรัตนตรัยและปฏิบัติตามหลักธรรมโอวาท ๓ ในพระพุทธศาสนาหรือหลักธรรมของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1259, '2551040101', 3, '25510401010603', '๖. เห็นคุณค่าและสวดมนต์แผ่เมตตา มีสติที่เป็นพื้นฐานของสมาธิในพระพุทธศาสนาหรือการพัฒนาจิตตามแนวทางของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1260, '2551040101', 3, '25510401010703', '๗. บอกชื่อความสำคัญและปฏิบัติตนได้อย่างเหมาะสมต่อศาสนวัตถุศาสนสถานและศาสนบุคคลของศาสนาอื่นๆ');
INSERT INTO `bets_indicator` VALUES (1261, '2551040101', 4, '25510401010104', '๑. อธิบายความสำคัญของพระพุทธศาสนา หรือศาสนาที่ตนนับถือในฐานะเป็นศูนย์รวมจิตใจของศาสนิกชน');
INSERT INTO `bets_indicator` VALUES (1262, '2551040101', 4, '25510401010204', '๒. สรุปพุทธประวัติตั้งแต่บรรลุธรรมจนถึงประกาศธรรม หรือประวัติศาสดาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1263, '2551040101', 4, '25510401010304', '๓. เห็นคุณค่าและประพฤติตนตามแบบอย่างการดำเนินชีวิตและข้อคิดจากประวัติสาวกชาดก เรื่องเล่าและศาสนิกชนตัวอย่างตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1264, '2551040101', 4, '25510401010404', '๔. แสดงความเคารพพระรัตนตรัยปฏิบัติตามไตรสิกขาและหลักธรรมโอวาท ๓ ในพระพุทธศาสนาหรือหลักธรรมของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1265, '2551040101', 4, '25510401010504', '๕. ชื่นชมการทำความดีของตนเอง บุคคลในครอบครัวโรงเรียนและชุมชนตามหลักศาสนา พร้อมทั้งบอกแนวปฏิบัติในการดำเนินชีวิต');
INSERT INTO `bets_indicator` VALUES (1266, '2551040101', 4, '25510401010604', '๖. เห็นคุณค่าและสวดมนต์แผ่เมตตา มีสติที่เป็นพื้นฐานของสมาธิในพระพุทธศาสนาหรือการพัฒนาจิตตามแนวทางของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1267, '2551040101', 4, '25510401010704', '๗. ปฏิบัติตนตามหลักธรรมของศาสนาที่ตนนับถือ เพื่อการอยู่ร่วมกันเป็นชาติได้อย่างสมานฉันท์');
INSERT INTO `bets_indicator` VALUES (1268, '2551040101', 4, '25510401010804', '๘. อธิบายประวัติศาสดาของศาสนาอื่นๆโดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1269, '2551040101', 5, '25510401010105', '๑. วิเคราะห์ความสำคัญของพระพุทธศาสนาหรือศาสนาที่ตนนับถือในฐานะที่เป็นมรดกทางวัฒนธรรมและหลักในการพัฒนาชาติไทย');
INSERT INTO `bets_indicator` VALUES (1270, '2551040101', 5, '25510401010205', '๒. สรุปพุทธประวัติตั้งแต่เสด็จกรุงกบิลพัสดุ์จนถึงพุทธกิจสำคัญหรือประวัติศาสดาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1271, '2551040101', 5, '25510401010305', '๓. เห็นคุณค่าและประพฤติตนตามแบบอย่างการดำเนินชีวิตและข้อคิดจากประวัติสาวกชาดก เรื่องเล่าและศาสนิกชนตัวอย่างตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1272, '2551040101', 5, '25510401010405', '๔. อธิบายองค์ประกอบและความสำคัญของพระไตรปิฏก หรือคัมภีร์ของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1273, '2551040101', 5, '25510401010505', '๕. แสดงความเคารพพระรัตนตรัยและปฏิบัติตามไตรสิกขาและหลักธรรมโอวาท ๓ ในพระพุทธศาสนาหรือหลักธรรมของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1274, '2551040101', 5, '25510401010605', '๖. เห็นคุณค่าและสวดมนต์แผ่เมตตา มีสติที่เป็นพื้นฐานของสมาธิในพระพุทธศาสนาหรือการพัฒนาจิตตามแนวทางของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1275, '2551040101', 5, '25510401010705', '๗. ปฏิบัติตนตามหลักธรรมของศาสนาที่ตนนับถือเพื่อการพัฒนาตนเองและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1276, '2551040101', 6, '25510401010106', '๑. วิเคราะห์ความสำคัญของพระพุทธศาสนาในฐานะเป็นศาสนาประจำชาติ หรือความสำคัญของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1277, '2551040101', 6, '25510401010206', '๒. สรุปพุทธประวัติตั้งแต่ปลงอายุสังขารจนถึงสังเวชนียสถานหรือประวัติศาสดาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1278, '2551040101', 6, '25510401010306', '๓. เห็นคุณค่าและประพฤติตนตามแบบอย่างการดำเนินชีวิต และข้อคิดจากประวัติสาวกชาดก เรื่องเล่าและศาสนิกชนตัวอย่างตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1279, '2551040101', 6, '25510401010406', '๔. วิเคราะห์ความสำคัญและเคารพพระรัตนตรัยปฏิบัติตามไตรสิกขาและหลักธรรมโอวาท ๓ ในพระพุทธศาสนาหรือหลักธรรมของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1280, '2551040101', 6, '25510401010506', '๕. ชื่นชมการทำความดีของบุคคลในประเทศตามหลักศาสนาพร้อมทั้งบอกแนวปฏิบัติในการดำเนินชีวิต');
INSERT INTO `bets_indicator` VALUES (1281, '2551040101', 6, '25510401010606', '๖. เห็นคุณค่าและสวดมนต์แผ่เมตตาและบริหารจิต เจริญปัญญา มีสติที่เป็นพื้นฐานของสมาธิในพระพุทธศาสนาหรือการพัฒนาจิตตามแนวทางของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1282, '2551040101', 6, '25510401010706', '๗. ปฏิบัติตนตามหลักธรรมของศาสนาที่ตนนับถือเพื่อแก้ปัญหาอบายมุขและสิ่งเสพติด');
INSERT INTO `bets_indicator` VALUES (1283, '2551040101', 6, '25510401010806', '๘. อธิบายหลักธรรมสำคัญของศาสนาอื่นๆโดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1284, '2551040101', 6, '25510401010906', '๙.อธิบายลักษณะสำคัญของศาสนพิธีพิธีกรรมของศาสนาอื่นๆและปฏิบัติตนได้อย่างเหมาะสมเมื่อต้องเข้าร่วมพิธี');
INSERT INTO `bets_indicator` VALUES (1285, '2551040101', 7, '25510401010107', '๑. อธิบายการเผยแผ่พระพุทธศาสนาหรือศาสนาที่ตนนับถือสู่ประเทศไทย');
INSERT INTO `bets_indicator` VALUES (1286, '2551040101', 7, '25510401010207', '๒. วิเคราะห์ความสำคัญของพระพุทธศาสนาหรือศาสนาที่ตนนับถือที่มีต่อสภาพแวดล้อมในสังคมไทยรวมทั้งการพัฒนาตนและครอบครัว');
INSERT INTO `bets_indicator` VALUES (1287, '2551040101', 7, '25510401010307', '๓. วิเคราะห์พุทธประวัติตั้งแต่ประสูติจนถึงบำเพ็ญทุกรกิริยาหรือประวัติศาสดาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1288, '2551040101', 7, '25510401010407', '๔. วิเคราะห์และประพฤติตนตามแบบอย่างการดำเนินชีวิตและข้อคิดจากประวัติสาวกชาดก เรื่องเล่าและศาสนิกชนตัวอย่างตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1289, '2551040101', 7, '25510401010507', '๕. อธิบายพุทธคุณ และข้อธรรมสำคัญในกรอบอริยสัจ ๔ หรือหลักธรรมของศาสนาที่ตนนับถือตามที่กำหนด เห็นคุณค่าและนำไปพัฒนา แก้ปัญหาของตนเองและครอบครัว');
INSERT INTO `bets_indicator` VALUES (1290, '2551040101', 7, '25510401010607', '๖. เห็นคุณค่าของการพัฒนาจิตเพื่อการเรียนรู้และการดำเนินชีวิตด้วยวิธีคิดแบบโยนิโสมนสิการคือ วิธีคิดแบบคุณค่าแท้-คุณค่าเทียม และวิธีคิดแบบคุณ-โทษและทางออกหรือการพัฒนาจิตตามแนวทางของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1291, '2551040101', 7, '25510401010707', '๗. สวดมนต์แผ่เมตตาบริหารจิตและเจริญปัญญาด้วยอานาปานสติหรือตามแนวทางของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1292, '2551040101', 7, '25510401010807', '๘. วิเคราะห์และปฏิบัติตนตามหลักธรรมทางศาสนาที่ตนนับถือในการดำรงชีวิตแบบพอเพียงและดูแลรักษาสิ่งแวดล้อมเพื่อการอยู่ร่วมกันได้อย่างสันติสุข');
INSERT INTO `bets_indicator` VALUES (1293, '2551040101', 7, '25510401010907', '๙. วิเคราะห์เหตุผลความจำเป็นที่ทุกคนต้องศึกษาเรียนรู้ศาสนาอื่นๆ');
INSERT INTO `bets_indicator` VALUES (1294, '2551040101', 7, '25510401011007', '๑๐. ปฏิบัติตนต่อศาสนิกชนอื่นในสถานการณ์ต่างๆ ได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (1295, '2551040101', 7, '25510401011107', '๑๑. วิเคราะห์การกระทำของบุคคลที่เป็นแบบอย่างด้านศาสนสัมพันธ์และนำเสนอแนวทางการปฏิบัติของตนเอง');
INSERT INTO `bets_indicator` VALUES (1306, '2551040101', 8, '25510401010108', '๑. อธิบายการเผยแผ่พระพุทธศาสนาหรือศาสนาที่ตนนับถือสู่ประเทศเพื่อนบ้าน');
INSERT INTO `bets_indicator` VALUES (1307, '2551040101', 8, '25510401010208', '๒. วิเคราะห์ความสำคัญของพระพุทธศาสนาหรือศาสนาที่ตนนับถือที่ช่วยเสริมสร้างความเข้าใจอันดีกับประเทศเพื่อนบ้าน');
INSERT INTO `bets_indicator` VALUES (1308, '2551040101', 8, '25510401010308', '๓. วิเคราะห์ความสำคัญของพระพุทธศาสนาหรือศาสนาที่ตนนับถือในฐานะที่เป็นรากฐานของวัฒนธรรมเอกลักษณ์ของชาติและมรดกของชาติ');
INSERT INTO `bets_indicator` VALUES (1309, '2551040101', 8, '25510401010408', '๔. อภิปรายความสำคัญของพระพุทธศาสนาหรือศาสนาที่ตนนับถือกับการพัฒนาชุมชนและการจัดระเบียบสังคม');
INSERT INTO `bets_indicator` VALUES (1310, '2551040101', 8, '25510401010508', '๕. วิเคราะห์พุทธประวัติหรือประวัติศาสดาของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1311, '2551040101', 8, '25510401010608', '๖. วิเคราะห์และประพฤติตนตามแบบอย่างการดำเนินชีวิตและข้อคิดจากประวัติสาวกชาดก เรื่องเล่าและศาสนิกชนตัวอย่างตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1312, '2551040101', 8, '25510401010708', '๗. อธิบายโครงสร้างและสาระสังเขปของพระไตรปิฏกหรือคัมภีร์ของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1313, '2551040101', 8, '25510401010808', '๘. อธิบายธรรมคุณและข้อธรรมสำคัญในกรอบอริยสัจ๔หรือหลักธรรมของศาสนาที่ตนนับถือตามที่กำหนด เห็นคุณค่าและนำไปพัฒนา แก้ปัญหาของชุมชนและสังคม');
INSERT INTO `bets_indicator` VALUES (1314, '2551040101', 8, '25510401010908', '๙. เห็นคุณค่าของการพัฒนาจิตเพื่อการเรียนรู้และดำเนินชีวิตด้วยวิธีคิดแบบโยนิโสมนสิการ คือวิธีคิดแบบอุบายปลุกเร้าคุณธรรม และวิธีคิดแบบอรรถธรรมสัมพันธ์หรือการพัฒนาจิตตามแนวทางของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1315, '2551040101', 8, '25510401011008', '๑๐. สวดมนต์แผ่เมตตาบริหารจิตและเจริญปัญญาด้วยอานาปานสติหรือตามแนวทางของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1316, '2551040101', 8, '25510401011108', '๑๑. วิเคราะห์การปฏิบัติตนตามหลักธรรมทางศาสนาที่ตนนับถือเพื่อการดำรงตนอย่างเหมาะสมในกระแสความเปลี่ยนแปลงของโลก และการอยู่ร่วมกันอย่างสันติสุข');
INSERT INTO `bets_indicator` VALUES (1317, '2551040101', 9, '25510401010109', '๑. อธิบายการเผยแผ่พระพุทธศาสนาหรือศาสนาที่ตนนับถือสู่ประเทศต่างๆ ทั่วโลก');
INSERT INTO `bets_indicator` VALUES (1318, '2551040101', 9, '25510401010209', '๒. วิเคราะห์ความสำคัญของพระพุทธศาสนาหรือศาสนาที่ตนนับถือในฐานะที่ช่วยสร้างสรรค์อารยธรรมและความสงบสุขแก่โลก');
INSERT INTO `bets_indicator` VALUES (1319, '2551040101', 9, '25510401010309', '๓. อภิปรายความสำคัญของพระพุทธศาสนาหรือศาสนาที่ตนนับถือกับปรัชญาของเศรษฐกิจพอเพียงและการพัฒนาอย่างยั่งยืน');
INSERT INTO `bets_indicator` VALUES (1320, '2551040101', 9, '25510401010409', '๔. วิเคราะห์พุทธประวัติจากพระพุทธรูปปางต่าง ๆ หรือประวัติศาสดาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1321, '2551040101', 9, '25510401010509', '๕. วิเคราะห์และประพฤติตนตามแบบอย่างการดำเนินชีวิตและข้อคิดจากประวัติสาวกชาดก เรื่องเล่าและศาสนิกชนตัวอย่างตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1322, '2551040101', 9, '25510401010609', '๖. อธิบายสังฆคุณ และข้อธรรมสำคัญในกรอบอริยสัจ ๔ หรือหลักธรรมของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1323, '2551040101', 9, '25510401010709', '๗. เห็นคุณค่าและวิเคราะห์การปฏิบัติตนตามหลักธรรมในการพัฒนาตนเพื่อเตรียมพร้อมสำหรับการทำงานและการมีครอบครัว');
INSERT INTO `bets_indicator` VALUES (1324, '2551040101', 9, '25510401010809', '๘. เห็นคุณค่าของการพัฒนาจิตเพื่อการเรียนรู้และดำเนินชีวิตด้วยวิธีคิดแบบโยนิโสมนสิการคือวิธีคิดแบบอริยสัจและวิธีคิดแบบสืบสาวเหตุปัจจัยหรือการพัฒนาจิตตามแนวทางของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1325, '2551040101', 9, '25510401010909', '๙. สวดมนต์แผ่เมตตาบริหารจิตและเจริญปัญญาด้วยอานาปานสติหรือตามแนวทางของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1326, '2551040101', 9, '25510401011009', '๑๐. วิเคราะห์ความแตกต่างและยอมรับวิถีการดำเนินชีวิตของศาสนิกชนในศาสนาอื่นๆ');
INSERT INTO `bets_indicator` VALUES (1327, '2551040101', 13, '25510401010113', '๑. วิเคราะห์สังคมชมพูทวีป และคติความเชื่อทางศาสนาสมัยก่อนพระพุทธเจ้าหรือสังคมสมัยของศาสดาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1328, '2551040101', 13, '25510401010213', '๒. วิเคราะห์พระพุทธเจ้าในฐานะเป็นมนุษย์ผู้ฝึกตนได้อย่างสูงสุดในการตรัสรู้ การก่อตั้งวิธีการสอนและการเผยแผ่พระพุทธศาสนาหรือวิเคราะห์ประวัติศาสดาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1329, '2551040101', 13, '25510401010313', '๓. วิเคราะห์พุทธประวัติด้านการบริหาร และการธำรงรักษาศาสนาหรือวิเคราะห์ประวัติศาสดาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1330, '2551040101', 13, '25510401010413', '๔. วิเคราะห์ข้อปฏิบัติทางสายกลางในพระพุทธศาสนา หรือแนวคิดของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1331, '2551040101', 13, '25510401010513', '๕. วิเคราะห์การพัฒนาศรัทธา และปัญญาที่ถูกต้องในพระพุทธศาสนาหรือแนวคิดของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1332, '2551040101', 13, '25510401010613', '๖. วิเคราะห์ลักษณะประชาธิปไตยในพระพุทธศาสนาหรือแนวคิดของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1333, '2551040101', 13, '25510401010713', '๗. วิเคราะห์หลักการของพระพุทธศาสนากับหลักวิทยาศาสตร์หรือแนวคิดของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1334, '2551040101', 13, '25510401010813', '๘. วิเคราะห์การฝึกฝนและพัฒนาตนเอง การพึ่งตนเองและการมุ่งอิสรภาพในพระพุทธศาสนาหรือแนวคิดของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1335, '2551040101', 13, '25510401010913', '๙. วิเคราะห์พระพุทธศาสนาว่าเป็นศาสตร์แห่งการศึกษา ซึ่งเน้นความสัมพันธ์ของเหตุปัจจัยกับวิธีการแก้ปัญหาหรือแนวคิดของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1336, '2551040101', 13, '25510401011013', '๑๐. วิเคราะห์พระพุทธศาสนาในการฝึกตน ไม่ให้ประมาท มุ่งประโยชน์และสันติภาพบุคคล สังคมและโลกหรือแนวคิดของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1337, '2551040101', 13, '25510401011113', '๑๑. วิเคราะห์พระพุทธศาสนากับปรัชญาของเศรษฐกิจพอเพียงและการพัฒนาประเทศแบบยั่งยืน หรือแนวคิดของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1338, '2551040101', 13, '25510401011213', '๑๒. วิเคราะห์ความสำคัญของพระพุทธศาสนาเกี่ยวกับการศึกษาที่สมบูรณ์ การเมืองและสันติภาพหรือแนวคิดของศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1339, '2551040101', 13, '25510401011313', '๑๓. วิเคราะห์หลักธรรมในกรอบอริยสัจ ๔ หรือหลักคำสอนของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1340, '2551040101', 13, '25510401011413', '๑๔. วิเคราะห์ข้อคิดและแบบอย่างการดำเนินชีวิตจากประวัติสาวก ชาดกเรื่องเล่าและศาสนิกชนตัวอย่างตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1341, '2551040101', 13, '25510401011513', '๑๕. วิเคราะห์คุณค่าและความสำคัญของการสังคายนาพระไตรปิฏกหรือคัมภีร์ของศาสนาที่ตนนับถือ และการเผยแผ่');
INSERT INTO `bets_indicator` VALUES (1342, '2551040101', 13, '25510401011613', '๑๖. เชื่อมั่นต่อผลของการทำความดีความชั่ว สามารถวิเคราะห์สถานการณ์ที่ต้องเผชิญและตัดสินใจเลือกดำเนินการหรือปฏิบัติตนได้อย่างมีเหตุผลถูกต้องตามหลักธรรมจริยธรรม และกำหนดเป้าหมาย บทบาทการดำเนินชีวิตเพื่อารอยู่\r\nร่วมกันอย่างสันติสุขและอยู่ร่วมกันเป็นชาติอย่างสมานฉันท์');
INSERT INTO `bets_indicator` VALUES (1343, '2551040101', 13, '25510401011713', '๑๗. อธิบายประวัติศาสดาของศาสนาอื่นๆ โดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1344, '2551040101', 13, '25510401011813', '๑๘. ตระหนักในคุณค่าและความสำคัญของค่านิยมจริยธรรมที่เป็นตัวกำหนดความเชื่อและพฤติกรรมที่แตกต่างกันของศาสนิกชนศาสนาต่างๆ เพื่อขจัดความขัดแย้งและอยู่ร่วมกันในสังคมอย่างสันติสุข');
INSERT INTO `bets_indicator` VALUES (1345, '2551040101', 13, '25510401011913', '๑๙. เห็นคุณค่าเชื่อมั่นและมุ่งมั่นพัฒนาชีวิตด้วยการพัฒนาจิตและพัฒนาการเรียนรู้ด้วยวิธีคิดแบบโยนิโสมนสิการ หรือการพัฒนาจิตตามแนวทางของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1346, '2551040101', 13, '25510401012013', '๒๐. สวดมนต์แผ่เมตตาและบริหารจิตและเจริญปัญญาตามหลักสติปัฏฐานหรือตามแนวทางของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1347, '2551040101', 13, '25510401012113', '๒๑. วิเคราะห์หลักธรรมสำคัญในการอยู่ร่วมกันอย่างสันติสุขของศาสนาอื่นๆ และชักชวนส่งเสริมสนับสนุนให้บุคคลอื่นเห็นความสำคัญของการทำความดีต่อกัน');
INSERT INTO `bets_indicator` VALUES (1348, '2551040101', 13, '25510401012213', '๒๒. เสนอแนวทางการจัดกิจกรรมความร่วมมือของทุกศาสนาในการแก้ปัญหาและพัฒนาสังคม');
INSERT INTO `bets_indicator` VALUES (1349, '2551040102', 1, '25510401020101', '๑. บำเพ็ญประโยชน์ต่อวัดหรือศาสนสถานของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1350, '2551040102', 1, '25510401020201', '๒. แสดงตนเป็นพุทธมามกะหรือแสดงตนเป็นศาสนิกชนของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1351, '2551040102', 1, '25510401020301', '๓.ปฏิบัติตนในศาสนพิธีพิธีกรรมและวันสำคัญทางศาสนาตามที่กำหนดได้อย่างถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1352, '2551040102', 2, '25510401020102', '๑. ปฏิบัติตนอย่างเหมาะสมต่อสาวกของศาสนาที่ตนนับถือตามที่กำหนดได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1353, '2551040102', 2, '25510401020202', '๒. ปฏิบัติตนในศาสนพิธีพิธีกรรมและวันสำคัญทางศาสนาตามที่กำหนดได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1354, '2551040102', 3, '25510401020103', '๑. ปฏิบัติตนอย่างเหมาะสมต่อสาวกศาสนสถานศาสนวัตถุของศาสนาที่ตนนับถือตามที่กำหนดได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1355, '2551040102', 3, '25510401020203', '๒. เห็นคุณค่าและปฏิบัติตนในศาสนพิธีพิธีกรรม และวันสำคัญทางศาสนาตามที่กำหนดได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1356, '2551040102', 3, '25510401020303', '๓. แสดงตนเป็นพุทธมามกะหรือแสดงตนเป็นศาสนิกชนของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1357, '2551040102', 4, '25510401020104', '๑. อภิปรายความสำคัญและมีส่วนร่วมในการบำรุงรักษาศาสนสถานของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1358, '2551040102', 4, '25510401020204', '๒. มีมรรยาทของความเป็นศาสนิกชนที่ดีตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1359, '2551040102', 4, '25510401020304', '๓. ปฏิบัติตนในศาสนพิธีพิธีกรรมและวันสำคัญทางศาสนาตามที่กำหนดได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1360, '2551040102', 5, '25510401020105', '๑. จัดพิธีกรรมตามศาสนาที่ตนนับถืออย่างเรียบง่าย มีประโยชน์และปฏิบัติตนถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1361, '2551040102', 5, '25510401020205', '๒. ปฏิบัติตนในศาสนพิธีพิธีกรรมและวันสำคัญทางศาสนาตามที่กำหนดและอภิปรายประโยชน์ที่ได้รับจากการเข้าร่วมกิจกรรม');
INSERT INTO `bets_indicator` VALUES (1362, '2551040102', 5, '25510401020305', '๓. มีมรรยาทของความเป็นศาสนิกชนที่ดีตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1363, '2551040102', 6, '25510401020106', '๑. อธิบายความรู้เกี่ยวกับสถานที่ต่าง ๆในศาสนสถานและปฏิบัติตนได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (1364, '2551040102', 6, '25510401020206', '๒. มีมรรยาทของความเป็นศาสนิกชนที่ดีตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1365, '2551040102', 6, '25510401020306', '๓. อธิบายประโยชน์ของการเข้าร่วมในศาสนพิธีพิธีกรรมและกิจกรรมในวันสำคัญทางศาสนาตามที่กำหนดและปฏิบัติตนได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1366, '2551040102', 6, '25510401020406', '๔. แสดงตนเป็นพุทธมามกะหรือแสดงตนเป็นศาสนิกชนของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1367, '2551040102', 7, '25510401020107', '๑. บำเพ็ญประโยชน์ต่อศาสนสถานของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1368, '2551040102', 7, '25510401020207', '๒. อธิบายจริยวัตรของสาวกเพื่อเป็นแบบอย่างในการประพฤติปฏิบัติ และปฏิบัติตนอย่างเหมาะสมต่อสาวกของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1369, '2551040102', 7, '25510401020307', '๓. ปฏิบัติตนอย่างเหมาะสมต่อบุคคลต่างๆตามหลักศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1370, '2551040102', 7, '25510401020407', '๔.จัดพิธีกรรมและปฏิบัติตนในศาสนพิธีพิธีกรรมได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1371, '2551040102', 7, '25510401020507', '๕. อธิบายประวัติความสำคัญและปฏิบัติตนในวันสำคัญทางศาสนาที่ตนนับถือตามที่กำหนดได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1372, '2551040102', 8, '25510401020108', '๑. ปฏิบัติตนอย่างเหมาะสมต่อบุคคลต่าง ๆตามหลักศาสนาที่ตนนับถือตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1373, '2551040102', 8, '25510401020208', '๒. มีมรรยาทของความเป็นศาสนิกชนที่ดีตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1374, '2551040102', 8, '25510401020308', '๓. วิเคราะห์คุณค่าของศาสนพิธี และปฏิบัติตนได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1375, '2551040102', 8, '25510401020408', '๔. อธิบายคำสอนที่เกี่ยวเนื่องกับวันสำคัญทางศาสนาและปฏิบัติตนได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1376, '2551040102', 8, '25510401020508', '๕. อธิบายความแตกต่างของศาสนพิธีพิธีกรรม ตามแนวปฏิบัติของศาสนาอื่นๆเพื่อนำไปสู่การยอมรับ และความเข้าใจซึ่งกันและกัน');
INSERT INTO `bets_indicator` VALUES (1377, '2551040102', 9, '25510401020109', '๑. วิเคราะห์หน้าที่และบทบาทของสาวกและปฏิบัติตนต่อสาวกตามที่กำหนดได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1378, '2551040102', 9, '25510401020209', '๒. ปฏิบัติตนอย่างเหมาะสมต่อบุคคลต่างๆตามหลักศาสนาตามที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1379, '2551040102', 9, '25510401020309', '๓. ปฏิบัติหน้าที่ของศาสนิกชนที่ดี');
INSERT INTO `bets_indicator` VALUES (1380, '2551040102', 9, '25510401020409', '๔. ปฏิบัติตนในศาสนพิธีพิธีกรรมได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1381, '2551040102', 9, '25510401020509', '๕. อธิบายประวัติวันสำคัญทางศาสนาตามที่กำหนดและปฏิบัติตนได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1382, '2551040102', 9, '25510401020609', '๖. แสดงตน เป็นพุทธมามกะหรือแสดงตนเป็นศาสนิกชนของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1383, '2551040102', 9, '25510401020709', '๗. นำเสนอแนวทางในการธำรงรักษาศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1384, '2551040102', 13, '25510401020113', '๑. ปฏิบัติตนเป็นศาสนิกชนที่ดีต่อสาวก สมาชิกในครอบครัว และคนรอบข้าง');
INSERT INTO `bets_indicator` VALUES (1385, '2551040102', 13, '25510401020213', '๒. ปฏิบัติตนถูกต้องตามศาสนพิธีพิธีกรรมตามหลักศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1386, '2551040102', 13, '25510401020313', '๓. แสดงตนเป็นพุทธมามกะ หรือแสดงตนเป็นศาสนิกชนของศาสนาที่ตนนับถือ');
INSERT INTO `bets_indicator` VALUES (1387, '2551040102', 13, '25510401020413', '๔. วิเคราะห์หลักธรรม คติธรรมที่เกี่ยวเนื่องกับวันสำคัญทางศาสนาและเทศกาลที่สำคัญของศาสนาที่ตนนับถือ และปฏิบัติตนได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1388, '2551040102', 13, '25510401020513', '๕. สัมมนาและเสนอแนะแนวทางในการธำรงรักษาศาสนาที่ตนนับถืออันส่งผลถึงการพัฒนาตนพัฒนาชาติ และโลก');
INSERT INTO `bets_indicator` VALUES (1389, '2551040201', 1, '25510402010101', '๑. บอกประโยชน์และปฏิบัติตนเป็นสมาชิกที่ดีของครอบครัวและโรงเรียน');
INSERT INTO `bets_indicator` VALUES (1390, '2551040201', 1, '25510402010201', '๒. ยกตัวอย่างความสามารถและความดีของตนเอง ผู้อื่นและบอกผลจากการกระทำนั้น');
INSERT INTO `bets_indicator` VALUES (1391, '2551040201', 2, '25510402010102', '๑. ปฏิบัติตนตามข้อตกลงกติกา กฎระเบียบและหน้าที่ที่ต้องปฏิบัติในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (1392, '2551040201', 2, '25510402010202', '๒.ปฏิบัติตนตามมารยาทไทย');
INSERT INTO `bets_indicator` VALUES (1393, '2551040201', 2, '25510402010302', '๓. แสดงพฤติกรรมในการยอมรับความคิด ความเชื่อและการปฏิบัติของบุคคลอื่นที่แตกต่างกันโดยปราศจากอคติ');
INSERT INTO `bets_indicator` VALUES (1394, '2551040201', 2, '25510402010402', '๔. เคารพในสิทธิ ของตนเองและผู้อื่น');
INSERT INTO `bets_indicator` VALUES (1395, '2551040201', 3, '25510402010103', '๑. สรุปประโยชน์และปฏิบัติตนตามประเพณีและวัฒนธรรมในครอบครัวและท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1396, '2551040201', 3, '25510402010203', '๒. บอกพฤติกรรมการดำเนินชีวิตของตนเองและผู้อื่นที่อยู่ในกระแสวัฒนธรรมที่หลากหลาย');
INSERT INTO `bets_indicator` VALUES (1397, '2551040201', 3, '25510402010303', '๓. อธิบายความสำคัญของวันหยุดราชการที่สำคัญ');
INSERT INTO `bets_indicator` VALUES (1398, '2551040201', 3, '25510402010403', '๔. ยกตัวอย่างบุคคลซึ่งมีผลงานที่เป็นประโยชน์แก่ชุมชนและท้องถิ่นของตน');
INSERT INTO `bets_indicator` VALUES (1399, '2551040201', 4, '25510402010104', '๑. ปฏิบัติตนเป็นพลเมืองดีตามวิถีประชาธิปไตยในฐานะสมาชิกที่ดีของชุมชน');
INSERT INTO `bets_indicator` VALUES (1400, '2551040201', 4, '25510402010204', '๒.ปฏิบัติตนในการเป็นผู้นำและผู้ตามที่ดี');
INSERT INTO `bets_indicator` VALUES (1401, '2551040201', 4, '25510402010304', '๓. วิเคราะห์สิทธิพื้นฐานที่เด็กทุกคนพึงได้รับตามกฎหมาย');
INSERT INTO `bets_indicator` VALUES (1402, '2551040201', 4, '25510402010404', '๔. อธิบายความแตกต่างทางวัฒนธรรมของกลุ่มคนในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1403, '2551040201', 4, '25510402010504', '๕. เสนอวิธีการที่จะอยู่ร่วมกันอย่างสันติสุขในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (1404, '2551040201', 5, '25510402010105', '๑. ยกตัวอย่างและปฏิบัติตนตามสถานภาพบทบาท สิทธิเสรีภาพและหน้าที่ในฐานะพลเมืองดี');
INSERT INTO `bets_indicator` VALUES (1405, '2551040201', 5, '25510402010205', '๒. เสนอวิธีการปกป้องคุ้มครองตนเองหรือผู้อื่นจากการละเมิดสิทธิเด็ก');
INSERT INTO `bets_indicator` VALUES (1406, '2551040201', 5, '25510402010305', '๓. เห็นคุณค่าวัฒนธรรมไทยที่มีผลต่อการดำเนินชีวิตในสังคมไทย');
INSERT INTO `bets_indicator` VALUES (1407, '2551040201', 5, '25510402010405', '๔. มีส่วนร่วมในการอนุรักษ์และเผยแพร่ภูมิปัญญาท้องถิ่นของชุมชน');
INSERT INTO `bets_indicator` VALUES (1408, '2551040201', 6, '25510402010106', '๑. ปฏิบัติตามกฎหมาย ที่เกี่ยวข้องกับชีวิตประจำวันของครอบครัวและชุมชน');
INSERT INTO `bets_indicator` VALUES (1409, '2551040201', 6, '25510402010206', '๒. วิเคราะห์การเปลี่ยนแปลงวัฒนธรรมตามกาลเวลาและธำรงรักษาวัฒนธรรมอันดีงาม');
INSERT INTO `bets_indicator` VALUES (1410, '2551040201', 6, '25510402010306', '๓. แสดงออกถึงมารยาทไทยได้เหมาะสมกับกาลเทศะ');
INSERT INTO `bets_indicator` VALUES (1411, '2551040201', 6, '25510402010406', '๔. อธิบายคุณค่าทางวัฒนธรรมที่แตกต่างกันระหว่างกลุ่มคนในสังคมไทย');
INSERT INTO `bets_indicator` VALUES (1412, '2551040201', 6, '25510402010506', '๕. ติดตามข้อมูลข่าวสารเหตุการณ์ต่าง ๆในชีวิตประจำวันเลือกรับและใช้ข้อมูลข่าวสารในการเรียนรู้ได้เหมาะสม');
INSERT INTO `bets_indicator` VALUES (1413, '2551040201', 7, '25510402010107', '๑. ปฏิบัติตามกฎหมายในการคุ้มครองสิทธิของบุคคล');
INSERT INTO `bets_indicator` VALUES (1414, '2551040201', 7, '25510402010207', '๒. ระบุความสามารถของตนเองในการทำประโยชน์ต่อสังคมและประเทศชาติ');
INSERT INTO `bets_indicator` VALUES (1415, '2551040201', 7, '25510402010307', '๓. อภิปรายเกี่ยวกับคุณค่าทางวัฒนธรรมที่เป็นปัจจัยในการสร้างความสัมพันธ์ที่ดี หรืออาจนำไปสู่ความเข้าใจผิดต่อกัน');
INSERT INTO `bets_indicator` VALUES (1416, '2551040201', 7, '25510402010407', '๔. แสดงออกถึงการเคารพในสิทธิ เสรีภาพของตนเองและผู้อื่น');
INSERT INTO `bets_indicator` VALUES (1417, '2551040201', 8, '25510402010108', '๑. อธิบายและปฏิบัติตนตามกฎหมายที่เกี่ยวข้องกับตนเองครอบครัวชุมชนและประเทศ');
INSERT INTO `bets_indicator` VALUES (1418, '2551040201', 8, '25510402010208', '๒. เห็นคุณค่าในการปฏิบัติตนตามสถานภาพบทบาทสิทธิเสรีภาพ หน้าที่ในฐานะพลเมืองดีตามวิถีประชาธิปไตย');
INSERT INTO `bets_indicator` VALUES (1419, '2551040201', 8, '25510402010308', '๓. วิเคราะห์บทบาทความสำคัญและความสัมพันธ์ของสถาบันทางสังคม');
INSERT INTO `bets_indicator` VALUES (1420, '2551040201', 8, '25510402010408', '๔. อธิบายความคล้ายคลึงและความแตกต่างของวัฒนธรรมไทยและวัฒนธรรม ของประเทศ ในภูมิภาคเอเชียเพื่อนำไปสู่ความเข้าใจอันดีระหว่างกัน');
INSERT INTO `bets_indicator` VALUES (1421, '2551040201', 9, '25510402010109', '๑. อธิบายความแตกต่างของการกระทำความผิดระหว่างคดีอาญาและคดีเพ่ง');
INSERT INTO `bets_indicator` VALUES (1422, '2551040201', 9, '25510402010209', '๒. มีส่วนร่วมในการปกป้องคุ้มครองผู้อื่นตามหลักสิทธิมนุษยชน');
INSERT INTO `bets_indicator` VALUES (1423, '2551040201', 9, '25510402010309', '๓. อนุรักษ์วัฒนธรรมไทยและเลือกรับวัฒนธรรมสากลที่เหมาะสม');
INSERT INTO `bets_indicator` VALUES (1424, '2551040201', 9, '25510402010409', '๔. วิเคราะห์ปัจจัยที่ก่อให้เกิดปัญหาความขัดแย้งในประเทศและเสนอแนวคิดในการลดความขัดแย้ง');
INSERT INTO `bets_indicator` VALUES (1425, '2551040201', 9, '25510402010509', '๕. เสนอแนวคิดในการดำรงชีวิตอย่างมีความสุขในประเทศและสังคมโลก');
INSERT INTO `bets_indicator` VALUES (1426, '2551040201', 13, '25510402010113', '๑ วิเคราะห์และปฏิบัติตนตามกฎหมายที่เกี่ยวข้องกับตนเอง ครอบครัวชุมชน ประเทศชาติและสังคมโลก');
INSERT INTO `bets_indicator` VALUES (1427, '2551040201', 13, '25510402010213', '๒. วิเคราะห์ความสำคัญของโครงสร้างทางสังคมการขัดเกลาทางสังคมและการเปลี่ยนแปลงทางสังคม');
INSERT INTO `bets_indicator` VALUES (1428, '2551040201', 13, '25510402010313', '๓. ปฏิบัติตนและมีส่วนสนับสนุนให้ผู้อื่นประพฤติปฏิบัติเพื่อเป็นพลเมืองดีของประเทศชาติและสังคมโลก');
INSERT INTO `bets_indicator` VALUES (1429, '2551040201', 13, '25510402010413', '๔. ประเมินสถานการณ์สิทธิมนุษยชนในประเทศไทย และเสนอแนวทางพัฒนา');
INSERT INTO `bets_indicator` VALUES (1430, '2551040201', 13, '25510402010513', '๕. วิเคราะห์ความจำเป็นที่จะต้องมีการปรับปรุงเปลี่ยนแปลงและอนุรักษ์วัฒนธรรมไทย และเลือกรับวัฒนธรรมสากล');
INSERT INTO `bets_indicator` VALUES (1431, '2551040202', 1, '25510402020101', '๑. บอกโครงสร้างบทบาทและหน้าที่ของสมาชิกในครอบครัวและโรงเรียน');
INSERT INTO `bets_indicator` VALUES (1432, '2551040202', 1, '25510402020201', '๒. ระบุบทบาทสิทธิ หน้าที่ของตนเองในครอบครัวและโรงเรียน');
INSERT INTO `bets_indicator` VALUES (1433, '2551040202', 1, '25510402020301', '๓. มีส่วนร่วมในการตัดสินใจและทำกิจกรรมในครอบครัวและโรงเรียนตามกระบวนการประชาธิปไตย');
INSERT INTO `bets_indicator` VALUES (1434, '2551040202', 2, '25510402020102', '๑. อธิบายความสัมพันธ์ของตนเอง และสมาชิกในครอบครัวในฐานะเป็นส่วนหนึ่งของชุมชน');
INSERT INTO `bets_indicator` VALUES (1435, '2551040202', 2, '25510402020202', '๒. ระบุผู้มีบทบาท อำนาจในการตัดสินใจในโรงเรียนและชุมชน');
INSERT INTO `bets_indicator` VALUES (1436, '2551040202', 3, '25510402020103', '๑. ระบุบทบาทและหน้าที่ของสมาชิก ชุมชนในการมีส่วนร่วมกิจกรรมต่าง ๆตามกระบวนการประชาธิปไตย');
INSERT INTO `bets_indicator` VALUES (1437, '2551040202', 3, '25510402020203', '๒.วิเคราะห์ความแตกต่างของกระบวนการการตัดสินใจในชั้นเรียน/โรงเรียน และชุมชน โดยวิธีการออกเสียงโดยตรงและการเลือกตัวแทนออกเสียง');
INSERT INTO `bets_indicator` VALUES (1438, '2551040202', 3, '25510402020303', '๓. ยกตัวอย่างการเปลี่ยนแปลงในชั้นเรียนโรงเรียนและชุมชน ที่เป็นผลจากการตัดสินใจของบุคคลและกลุ่ม');
INSERT INTO `bets_indicator` VALUES (1439, '2551040202', 4, '25510402020104', '๑. อธิบายอำนาจอธิปไตยและความสำคัญของระบอบประชาธิปไตย');
INSERT INTO `bets_indicator` VALUES (1440, '2551040202', 4, '25510402020204', '๒. อธิบายบทบาทหน้าที่ของพลเมืองในกระ บวนการเลือกตั้ง');
INSERT INTO `bets_indicator` VALUES (1441, '2551040202', 4, '25510402020304', '๓. อธิบายความสำคัญของสถาบันพระมหา กษัตริย์ตามระบอบประชาธิปไตยอันมีพระมหากษัตริย์ทรงเป็นประมุข');
INSERT INTO `bets_indicator` VALUES (1442, '2551040202', 5, '25510402020105', '๑. อธิบายโครงสร้างอำนาจหน้าที่และความสำคัญของการปกครองส่วนท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1443, '2551040202', 5, '25510402020205', '๒. ระบุบทบาทหน้าที่และวิธีการเข้าดำรงตำแหน่งของผู้บริหารท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1444, '2551040202', 5, '25510402020305', '๓. วิเคราะห์ประโยชน์ที่ชุมชนจะได้รับจากองค์กรปกครองส่วนท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1445, '2551040202', 6, '25510402020106', '๑. เปรียบเทียบบทบาท หน้าที่ขององค์กรปกครองส่วนท้องถิ่นและรัฐบาล');
INSERT INTO `bets_indicator` VALUES (1446, '2551040202', 6, '25510402020206', '๒. มีส่วนร่วมในกิจกรรมต่างๆที่ส่งเสริมประชาธิปไตยในท้องถิ่นและประเทศ');
INSERT INTO `bets_indicator` VALUES (1447, '2551040202', 6, '25510402020306', '๓. อภิปรายบทบาทความสำคัญในการใช้สิทธิออกเสียงเลือกตั้งตามระบอบประชาธิปไตย');
INSERT INTO `bets_indicator` VALUES (1448, '2551040202', 7, '25510402020107', '๑.อธิบายหลักการเจตนารมณ์โครงสร้างและสาระสำคัญของรัฐธรรมนูญแห่งราชอาณาจักรไทยฉบับปัจจุบันโดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1449, '2551040202', 7, '25510402020207', '๒. วิเคราะห์บทบาท การถ่วงดุลอำนาจอธิปไตยในรัฐธรรมนูญแห่งราชอาณาจักรไทยฉบับปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (1450, '2551040202', 7, '25510402020307', '๓. ปฏิบัติตนตามบทบัญญัติของรัฐธรรมนูญแห่งราชอาณาจักรไทยฉบับปัจจุบันที่เกี่ยวข้องกับตนเอง');
INSERT INTO `bets_indicator` VALUES (1451, '2551040202', 8, '25510402020108', '๑. อธิบายกระบวนการในการตรากฎหมาย');
INSERT INTO `bets_indicator` VALUES (1452, '2551040202', 8, '25510402020208', '๒. วิเคราะห์ข้อมูลข่าวสารทางการเมืองการปกครองที่มีผลกระทบต่อสังคมไทยสมัยปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (1453, '2551040202', 9, '25510402020109', '๑. อธิบายระบอบการปกครองแบบต่าง ๆ ที่ใช้ในยุคปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (1454, '2551040202', 9, '25510402020209', '๒. วิเคราะห์เปรียบเทียบระบอบ การปกครองของไทยกับประเทศอื่นๆที่มีการปกครองระบอบประชาธิปไตย');
INSERT INTO `bets_indicator` VALUES (1455, '2551040202', 9, '25510402020309', '๓. วิเคราะห์รัฐธรรมนูญฉบับปัจจุบันในมาตราต่าง ๆ ที่เกี่ยวข้องกับการเลือกตั้งการมีส่วนร่วมและการตรวจสอบการใช้อำนาจรัฐ');
INSERT INTO `bets_indicator` VALUES (1456, '2551040202', 9, '25510402020409', '๔. วิเคราะห์ประเด็นปัญหาที่เป็นอุปสรรคต่อการพัฒนาประชาธิปไตยของประเทศไทยและเสนอแนวทางแก้ไข');
INSERT INTO `bets_indicator` VALUES (1457, '2551040202', 13, '25510402020113', '๑. วิเคราะห์ปัญหาการเมืองที่สำคัญในประเทศ จากแหล่งข้อมูลต่างๆ พร้อมทั้งเสนอแนวทางแก้ไข');
INSERT INTO `bets_indicator` VALUES (1458, '2551040202', 13, '25510402020213', '๒. เสนอแนวทางทางการเมืองการปกครองที่นำไปสู่ความเข้าใจ และการประสานประโยชน์ร่วมกันระหว่างประเทศ');
INSERT INTO `bets_indicator` VALUES (1459, '2551040202', 13, '25510402020313', '๓. วิเคราะห์ความสำคัญและความจำเป็นที่ต้องธำรงรักษาไว้ซึ่งการปกครองตามระบอบประชาธิปไตย อันมีพระมหากษัตริย์ทรงเป็นประมุข');
INSERT INTO `bets_indicator` VALUES (1460, '2551040202', 13, '25510402020413', '๔. เสนอแนวทางและมีส่วนร่วมในการตรวจสอบการใช้อำนาจรัฐ');
INSERT INTO `bets_indicator` VALUES (1461, '2551040301', 1, '25510403010101', '๑. ระบุสินค้าและบริการที่ใช้ประโยชน์ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (1462, '2551040301', 1, '25510403010201', '๒. ยกตัวอย่างการใช้จ่ายเงินในชีวิตประจำวันที่ไม่เกินตัวและเห็นประโยชน์ของการออม');
INSERT INTO `bets_indicator` VALUES (1463, '2551040301', 1, '25510403010301', '๓. ยกตัวอย่างการใช้ทรัพยากรในชีวิตประจำวันอย่างประหยัด');
INSERT INTO `bets_indicator` VALUES (1464, '2551040301', 2, '25510403010102', '๑. ระบุทรัพยากรที่นำมาผลิตสินค้าและบริการที่ใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (1465, '2551040301', 2, '25510403010202', '๒.บอกที่มาของรายได้และรายจ่ายของตนเองและครอบครัว');
INSERT INTO `bets_indicator` VALUES (1466, '2551040301', 2, '25510403010302', '๓. บันทึกรายรับรายจ่ายของตนเอง');
INSERT INTO `bets_indicator` VALUES (1467, '2551040301', 2, '25510403010402', '๔. สรุปผลดีของการใช้จ่ายที่เหมาะสมกับรายได้และการออม');
INSERT INTO `bets_indicator` VALUES (1468, '2551040301', 3, '25510403010103', '๑. จำแนกความต้องการและความจำเป็นในการใช้สินค้าและบริการในการดำรงชีวิต');
INSERT INTO `bets_indicator` VALUES (1469, '2551040301', 3, '25510403010203', '๒. วิเคราะห์การใช้จ่ายของตนเอง');
INSERT INTO `bets_indicator` VALUES (1470, '2551040301', 3, '25510403010303', '๓. อธิบายได้ว่าทรัพยากรที่มีอยู่จำกัดมีผลต่อการผลิตและบริโภคสินค้าและบริการ');
INSERT INTO `bets_indicator` VALUES (1471, '2551040301', 4, '25510403010104', '๑. ระบุปัจจัยที่มีผลต่อการเลือกซื้อสินค้าและบริการ');
INSERT INTO `bets_indicator` VALUES (1472, '2551040301', 4, '25510403010204', '๒. บอกสิทธิพื้นฐานและรักษาผลประโยชน์ของตนเองในฐานะผู้บริโภค');
INSERT INTO `bets_indicator` VALUES (1473, '2551040301', 4, '25510403010304', '๓. อธิบายหลักการของเศรษฐกิจพอเพียงและนำไปใช้ในชีวิตประจำวันของตนเอง');
INSERT INTO `bets_indicator` VALUES (1474, '2551040301', 5, '25510403010105', '๑. อธิบายปัจจัยการผลิตสินค้าและบริการ');
INSERT INTO `bets_indicator` VALUES (1475, '2551040301', 5, '25510403010205', '๒. ประยุกต์ใช้แนวคิดของปรัชญาของเศรษฐกิจพอเพียงในการทำกิจกรรมต่าง ๆ ในครอบครัวโรงเรียนและชุมชน');
INSERT INTO `bets_indicator` VALUES (1476, '2551040301', 5, '25510403010305', '๓. อธิบายหลักการสำคัญและประโยชน์ของสหกรณ์');
INSERT INTO `bets_indicator` VALUES (1477, '2551040301', 6, '25510403010106', '๑. อธิบายบทบาทของผู้ผลิตที่มีความรับผิดชอบ');
INSERT INTO `bets_indicator` VALUES (1478, '2551040301', 6, '25510403010206', '๒. อธิบายบทบาทของผู้บริโภคที่รู้เท่าทัน');
INSERT INTO `bets_indicator` VALUES (1479, '2551040301', 6, '25510403010306', '๓. บอกวิธีและประโยชน์ของการใช้ทรัพยากรอย่างยั่งยืน');
INSERT INTO `bets_indicator` VALUES (1480, '2551040301', 7, '25510403010107', '๑. อธิบายความหมายและความสำคัญของเศรษฐศาสตร์');
INSERT INTO `bets_indicator` VALUES (1481, '2551040301', 7, '25510403010207', '๒. วิเคราะห์ค่านิยมและพฤติกรรมการบริโภคของคนในสังคมซึ่งส่งผลต่อเศรษฐกิจของชุมชนและประเทศ');
INSERT INTO `bets_indicator` VALUES (1482, '2551040301', 7, '25510403010307', '๓. อธิบายความเป็นมา หลักการและความสำคัญของปรัชญาของเศรษฐกิจพอเพียงต่อสังคมไทย');
INSERT INTO `bets_indicator` VALUES (1483, '2551040301', 8, '25510403010108', '๑. วิเคราะห์ปัจจัยที่มีผลต่อการลงทุนและการออม');
INSERT INTO `bets_indicator` VALUES (1484, '2551040301', 8, '25510403010208', '๒. อธิบายปัจจัยการผลิตสินค้าและบริการ และปัจจัยที่มีอิทธิพลต่อการผลิตสินค้าและบริการ');
INSERT INTO `bets_indicator` VALUES (1485, '2551040301', 8, '25510403010308', '๓. เสนอแนวทางการพัฒนาการผลิตในท้องถิ่นตามปรัชญาของเศรษฐกิจพอเพียง');
INSERT INTO `bets_indicator` VALUES (1486, '2551040301', 8, '25510403010408', '๔. อภิปรายแนวทางการคุ้มครองสิทธิของตนเองในฐานะผู้บริโภค');
INSERT INTO `bets_indicator` VALUES (1487, '2551040301', 9, '25510403010109', '๑. อธิบายกลไกราคาในระบบเศรษฐกิจ');
INSERT INTO `bets_indicator` VALUES (1488, '2551040301', 9, '25510403010209', '๒. มีส่วนร่วมในการแก้ไขปัญหาและพัฒนาท้องถิ่นตามปรัชญาของเศรษฐกิจพอเพียง');
INSERT INTO `bets_indicator` VALUES (1489, '2551040301', 9, '25510403010309', '๓. วิเคราะห์ความสัมพันธ์ระหว่างแนวคิดเศรษฐกิจพอเพียงกับระบบสหกรณ์');
INSERT INTO `bets_indicator` VALUES (1490, '2551040301', 13, '25510403010113', '๑. อภิปรายการกำหนดราคาและค่าจ้างในระบบเศรษฐกิจ');
INSERT INTO `bets_indicator` VALUES (1491, '2551040301', 13, '25510403010213', '๒. ตระหนักถึงความสำคัญของปรัชญาของเศรษฐกิจพอเพียงที่มีต่อเศรษฐกิจสังคมของประเทศ');
INSERT INTO `bets_indicator` VALUES (1492, '2551040301', 13, '25510403010313', '๓. ตระหนักถึงความสำคัญของระบบสหกรณ์ในการพัฒนาเศรษฐกิจในระดับชุมชนและประเทศ');
INSERT INTO `bets_indicator` VALUES (1493, '2551040301', 13, '25510403010413', '๔. วิเคราะห์ปัญหาทางเศรษฐกิจในชุมชนและเสนอแนวทางแก้ไข');
INSERT INTO `bets_indicator` VALUES (1494, '2551040302', 1, '25510403020101', '๑. อธิบายเหตุผลความจำเป็นที่คนต้องทำงานอย่างสุจริต');
INSERT INTO `bets_indicator` VALUES (1495, '2551040302', 2, '25510403020102', '๑. อธิบายการแลกเปลี่ยนสินค้าและบริการโดยวิธีต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (1496, '2551040302', 2, '25510403020202', '๒. บอกความสัมพันธ์ระหว่างผู้ซื้อกับผู้ขาย');
INSERT INTO `bets_indicator` VALUES (1497, '2551040302', 3, '25510403020103', '๑. บอกสินค้าและบริการที่รัฐจัดหาและให้บริการแก่ประชาชน');
INSERT INTO `bets_indicator` VALUES (1498, '2551040302', 3, '25510403020203', '๒. บอกความสำคัญของภาษีและบทบาทของประชาชนในการเสียภาษี');
INSERT INTO `bets_indicator` VALUES (1499, '2551040302', 3, '25510403020303', '๓. อธิบายเหตุผลการแข่งขันทางการค้าที่มีผลทำให้ราคาสินค้าลดลง');
INSERT INTO `bets_indicator` VALUES (1500, '2551040302', 4, '25510403020104', '๑. อธิบายความสัมพันธ์ทางเศรษฐกิจของคนในชุมชน');
INSERT INTO `bets_indicator` VALUES (1501, '2551040302', 4, '25510403020204', '๒. อธิบายหน้าที่เบื้องต้นของเงิน');
INSERT INTO `bets_indicator` VALUES (1502, '2551040302', 5, '25510403020105', '๑. อธิบายบทบาทหน้าที่เบื้องต้นของธนาคาร');
INSERT INTO `bets_indicator` VALUES (1503, '2551040302', 5, '25510403020205', '๒. จำแนกผลดีผลเสียของการกู้ยืม');
INSERT INTO `bets_indicator` VALUES (1504, '2551040302', 6, '25510403020106', '๑. อธิบายความสัมพันธ์ระหว่างผู้ผลิตผู้บริโภคธนาคารและรัฐบาล');
INSERT INTO `bets_indicator` VALUES (1505, '2551040302', 6, '25510403020206', '๒. ยกตัวอย่างการรวมกลุ่มทางเศรษฐกิจภายในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1506, '2551040302', 7, '25510403020107', '๑. วิเคราะห์บทบาทหน้าที่และความแตกต่างของสถาบันการเงินแต่ละประเภทและธนาคารกลาง');
INSERT INTO `bets_indicator` VALUES (1507, '2551040302', 7, '25510403020207', '๒. ยกตัวอย่างที่สะท้อนให้เห็นการพึ่งพาอาศัยกันและการแข่งขันกันทางเศรษฐกิจในประเทศ');
INSERT INTO `bets_indicator` VALUES (1508, '2551040302', 7, '25510403020307', '๓. ระบุปัจจัยที่มีอิทธิพลต่อการกำหนดอุปสงค์และอุปทาน');
INSERT INTO `bets_indicator` VALUES (1509, '2551040302', 7, '25510403020407', '๔. อภิปรายผลของการมีกฎหมายเกี่ยวกับทรัพย์สินทางปัญญา');
INSERT INTO `bets_indicator` VALUES (1510, '2551040302', 8, '25510403020108', '๑. อภิปรายระบบเศรษฐกิจ แบบต่างๆ');
INSERT INTO `bets_indicator` VALUES (1511, '2551040302', 8, '25510403020208', '๒. ยกตัวอย่างที่สะท้อนให้เห็นการพึ่งพาอาศัยกัน และการแข่งขันกันทางเศรษฐกิจในภูมิภาคเอเชีย');
INSERT INTO `bets_indicator` VALUES (1512, '2551040302', 8, '25510403020308', '๓. วิเคราะห์การกระจายของทรัพยากรในโลกที่ส่งผลต่อความ สัมพันธ์ทางเศรษฐกิจระหว่างประเทศ');
INSERT INTO `bets_indicator` VALUES (1513, '2551040302', 8, '25510403020408', '๔. วิเคราะห์การแข่งขันทางการค้าในประเทศและต่างประเทศที่ส่งผลต่อคุณภาพสินค้าปริมาณการผลิตและราคาสินค้า');
INSERT INTO `bets_indicator` VALUES (1514, '2551040302', 9, '25510403020109', '๑. อธิบายบทบาทหน้าที่ของรัฐบาลในระบบเศรษฐกิจ');
INSERT INTO `bets_indicator` VALUES (1515, '2551040302', 9, '25510403020209', '๒. แสดงความคิดเห็นต่อนโยบายและกิจกรรมทางเศรษฐกิจของรัฐบาลที่มีต่อบุคคล กลุ่มคนและประเทศชาติ');
INSERT INTO `bets_indicator` VALUES (1516, '2551040302', 9, '25510403020309', '๓.อภิปรายบทบาทความสำคัญของการรวมกลุ่มทางเศรษฐกิจระหว่างประเทศ');
INSERT INTO `bets_indicator` VALUES (1517, '2551040302', 9, '25510403020409', '๔. อภิปรายผลกระทบที่เกิดจากภาวะเงินเฟ้อ เงินฝืด');
INSERT INTO `bets_indicator` VALUES (1518, '2551040302', 9, '25510403020509', '๕.วิเคราะห์ผลเสียจากการว่างงานและแนวทางแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (1519, '2551040302', 9, '25510403020609', '๖. วิเคราะห์สาเหตุและวิธีการกีดกันทางการค้าในการค้าระหว่างประเทศ');
INSERT INTO `bets_indicator` VALUES (1520, '2551040302', 13, '25510403020113', '๑.อธิบายบทบาทของรัฐบาลเกี่ยวกับนโยบายการเงิน การคลังในการพัฒนาเศรษฐกิจของประเทศ');
INSERT INTO `bets_indicator` VALUES (1521, '2551040302', 13, '25510403020213', '๒. วิเคราะห์ผลกระทบของการเปิดเสรีทางเศรษฐกิจในยุคโลกาภิวัตน์ที่มีผลต่อสังคมไทย');
INSERT INTO `bets_indicator` VALUES (1522, '2551040302', 13, '25510403020313', '๓. วิเคราะห์ผลดีผลเสียของความร่วมมือทางเศรษฐกิจระหว่างประเทศในรูปแบบต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (1523, '2551040401', 1, '25510404010101', '๑. บอก วัน เดือนปี และการนับช่วงเวลา ตามปฏิทินที่ใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (1524, '2551040401', 1, '25510404010201', '๒. เรียงลำดับเหตุการณ์ในชีวิตประจำวันตามวัน เวลาที่เกิดขึ้น');
INSERT INTO `bets_indicator` VALUES (1525, '2551040401', 1, '25510404010301', '๓. บอกประวัติความเป็นมาของตนเองและครอบครัวโดยสอบถามผู้เกี่ยวข้อง');
INSERT INTO `bets_indicator` VALUES (1526, '2551040401', 2, '25510404010102', '๑. ใช้คำระบุเวลาที่แสดงเหตุการณ์ในอดีต ปัจจุบันและอนาคต');
INSERT INTO `bets_indicator` VALUES (1527, '2551040401', 2, '25510404010202', '๒. ลำดับเหตุการณ์ที่เกิดขึ้นในครอบครัวหรือในชีวิตของตนเองโดยใช้หลักฐานที่เกี่ยวข้อง');
INSERT INTO `bets_indicator` VALUES (1528, '2551040401', 3, '25510404010103', '๑. เทียบศักราชที่สำคัญตามปฏิทินที่ใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (1529, '2551040401', 3, '25510404010203', '๒. แสดงลำดับเหตุการณ์สำคัญของโรงเรียนและชุมชนโดยระบุหลักฐานและแหล่งข้อมูลที่เกี่ยวข้อง');
INSERT INTO `bets_indicator` VALUES (1530, '2551040401', 4, '25510404010104', '๑. นับช่วงเวลาเป็นทศวรรษศตวรรษ และสหัสวรรษ');
INSERT INTO `bets_indicator` VALUES (1531, '2551040401', 4, '25510404010204', '๒. อธิบายยุคสมัยในการศึกษาประวัติของมนุษยชาติโดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1532, '2551040401', 4, '25510404010304', '๓.แยกแยะประเภทหลักฐานที่ใช้ในการศึกษาความเป็นมาของท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1533, '2551040401', 5, '25510404010105', '๑. สืบค้นความเป็นมาของท้องถิ่นโดยใช้หลักฐานที่หลากหลาย');
INSERT INTO `bets_indicator` VALUES (1534, '2551040401', 5, '25510404010205', '๒. รวบรวมข้อมูลจากแหล่งต่างๆ เพื่อตอบคำถามทางประวัติศาสตร์อย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (1535, '2551040401', 5, '25510404010305', '๓. อธิบายความแตกต่างระหว่างความจริงกับข้อเท็จจริงเกี่ยวกับเรื่องราวในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1536, '2551040401', 6, '25510404010106', '๑. อธิบายความสำคัญของวิธีการทางประวัติศาสตร์ในการศึกษาเรื่องราวทางประวัติศาสตร์อย่างง่าย ๆ');
INSERT INTO `bets_indicator` VALUES (1537, '2551040401', 6, '25510404010206', '๒. นำเสนอข้อมูลจากหลักฐานที่หลากหลายในการทำความเข้าใจเรื่องราวในอดีต');
INSERT INTO `bets_indicator` VALUES (1538, '2551040401', 7, '25510404010107', '๑. วิเคราะห์ความสำคัญของเวลาในการศึกษาประวัติศาสตร์');
INSERT INTO `bets_indicator` VALUES (1539, '2551040401', 7, '25510404010207', '๒. เทียบศักราชตามระบบต่างๆที่ใช้ศึกษาประวัติศาสตร์');
INSERT INTO `bets_indicator` VALUES (1540, '2551040401', 7, '25510404010307', '๓. นำวิธีการทางประวัติศาสตร์มาใช้ศึกษาเหตุการณ์ทางประวัติศาสตร์');
INSERT INTO `bets_indicator` VALUES (1541, '2551040401', 8, '25510404010108', '๑. ประเมินความน่าเชื่อถือของหลักฐานทางประวัติศาสตร์ในลักษณะต่างๆ');
INSERT INTO `bets_indicator` VALUES (1542, '2551040401', 8, '25510404010208', '๒. วิเคราะห์ความแตกต่างระหว่างความจริงกับข้อเท็จจริงของเหตุการณ์ทางประวัติศาสตร์');
INSERT INTO `bets_indicator` VALUES (1543, '2551040401', 8, '25510404010308', '๓. เห็นความสำคัญของการตีความหลักฐานทางประวัติศาสตร์ที่น่าเชื่อถือ');
INSERT INTO `bets_indicator` VALUES (1544, '2551040401', 9, '25510404010109', '๑.วิเคราะห์เรื่องราวเหตุการณ์สำคัญทางประวัติศาสตร์ได้อย่างมีเหตุผลตามวิธีการทางประวัติศาสตร์');
INSERT INTO `bets_indicator` VALUES (1545, '2551040401', 9, '25510404010209', '๒. ใช้วิธีการทางประวัติศาสตร์ในการศึกษาเรื่องราวต่างๆที่ตนสนใจ');
INSERT INTO `bets_indicator` VALUES (1546, '2551040401', 13, '25510404010113', '๑. ตระหนักถึงความสำคัญของเวลาและยุคสมัยทางประวัติศาสตร์ที่แสดงถึงการเปลี่ยนแปลงของมนุษยชาติ');
INSERT INTO `bets_indicator` VALUES (1547, '2551040401', 13, '25510404010213', '๒. สร้างองค์ความรู้ใหม่ทางประวัติศาสตร์โดยใช้วิธีการทางประวัติศาสตร์อย่างเป็นระบบ');
INSERT INTO `bets_indicator` VALUES (1548, '2551040402', 1, '25510404020101', '๑. บอกความเปลี่ยนแปลงของสภาพแวดล้อม สิ่งของเครื่องใช้ หรือการดำเนินชีวิตของตนเองกับสมัยของพ่อแม่ปู่ย่า ตายาย');
INSERT INTO `bets_indicator` VALUES (1549, '2551040402', 1, '25510404020201', '๒. บอกเหตุการณ์ที่เกิดขึ้นในอดีตที่มีผลกระทบต่อตนเองในปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (1550, '2551040402', 2, '25510404020102', '๑. สืบค้นถึงการเปลี่ยนแปลงในวิถีชีวิตประจำวันของคนในชุมชนของตนจากอดีตถึงปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (1551, '2551040402', 2, '25510404020202', '๒. อธิบายผลกระทบของการเปลี่ยนแปลงที่มีต่อวิถีชีวิตของคนในชุมชน');
INSERT INTO `bets_indicator` VALUES (1552, '2551040402', 3, '25510404020103', '๑. ระบุปัจจัยที่มีอิทธิพลต่อการตั้งถิ่นฐานและพัฒนาการของชุมชน');
INSERT INTO `bets_indicator` VALUES (1553, '2551040402', 3, '25510404020203', '๒. สรุปลักษณะที่สำคัญของขนมธรรมเนียมประเพณี และวัฒนธรรมของชุมชน');
INSERT INTO `bets_indicator` VALUES (1554, '2551040402', 3, '25510404020303', '๓. เปรียบเทียบความเหมือนและความต่างทางวัฒนธรรมของชุมชนตนเองกับชุมชนอื่นๆ');
INSERT INTO `bets_indicator` VALUES (1555, '2551040402', 4, '25510404020104', '๑. อธิบายการตั้งหลักแหล่งและพัฒนาการของมนุษย์ยุคก่อนประวัติศาสตร์และยุคประวัติศาสตร์โดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1556, '2551040402', 4, '25510404020204', '๒. ยกตัวอย่างหลักฐานทางประวัติศาสตร์ที่พบในท้องถิ่นที่แสดงพัฒนาการของมนุษยชาติ');
INSERT INTO `bets_indicator` VALUES (1557, '2551040402', 5, '25510404020105', '๑. อธิบายอิทธิพลของอารยธรรมอินเดียและจีนที่มีต่อไทย และเอเชียตะวันออกเฉียงใต้ โดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1558, '2551040402', 5, '25510404020205', '๒. อภิปรายอิทธิพลของวัฒนธรรมต่างชาติต่อสังคมไทยปัจจุบันโดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1559, '2551040402', 6, '25510404020106', '๑. อธิบายสภาพสังคมเศรษฐกิจและการเมืองของประเทศเพื่อนบ้านในปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (1560, '2551040402', 6, '25510404020206', '๒. บอกความสัมพันธ์ของกลุ่มอาเซียนโดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1561, '2551040402', 7, '25510404020107', '๑. อธิบายพัฒนาการทางสังคม เศรษฐกิจและการเมืองของประเทศต่าง ๆ ในภูมิภาคเอเชียตะวันออกเฉียงใต้');
INSERT INTO `bets_indicator` VALUES (1562, '2551040402', 7, '25510404020207', '๒. ระบุความสำคัญของแหล่งอารยธรรมในภูมิภาคเอเชียตะวันออกเฉียงใต้');
INSERT INTO `bets_indicator` VALUES (1563, '2551040402', 8, '25510404020108', '๑.อธิบายพัฒนาการทางสังคม เศรษฐกิจและการเมืองของภูมิภาคเอเชีย');
INSERT INTO `bets_indicator` VALUES (1564, '2551040402', 8, '25510404020208', '๒. ระบุความสำคัญของแหล่งอารยธรรมโบราณในภูมิภาคเอเชีย');
INSERT INTO `bets_indicator` VALUES (1565, '2551040402', 9, '25510404020109', '๑. อธิบายพัฒนาการทางสังคม เศรษฐกิจและการเมืองของภูมิภาคต่าง ๆ ในโลกโดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1566, '2551040402', 9, '25510404020209', '๒. วิเคราะห์ผลของการเปลี่ยนแปลงที่นำไปสู่ความร่วมมือ และความขัดแย้งในคริสต์ศตวรรษที่ ๒๐ ตลอดจนความพยายามในการขจัดปัญหาความขัดแย้ง');
INSERT INTO `bets_indicator` VALUES (1567, '2551040402', 13, '25510404020113', '๑. วิเคราะห์อิทธิพลของอารยธรรมโบราณและการติดต่อระหว่างโลกตะวันออกกับโลกตะวันตกที่มีผลต่อพัฒนาการและการเปลี่ยนแปลงของโลก');
INSERT INTO `bets_indicator` VALUES (1568, '2551040402', 13, '25510404020213', '๒. วิเคราะห์เหตุการณ์สำคัญต่าง ๆที่ส่งผลต่อการเปลี่ยนแปลงทางสังคม เศรษฐกิจ และการเมือง เข้าสู่โลกสมัยปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (1569, '2551040402', 13, '25510404020313', '๓. วิเคราะห์ผลกระทบของการขยายอิทธิพลของประเทศในยุโรปไปยังทวีปอเมริกาแอฟริกา และเอเชีย');
INSERT INTO `bets_indicator` VALUES (1570, '2551040402', 13, '25510404020413', '๔. วิเคราะห์สถานการณ์ของโลกในคริสต์ศตวรรษที่ ๒๑');
INSERT INTO `bets_indicator` VALUES (1571, '2551040403', 1, '25510404030101', '๑.อธิบายความหมายและความสำคัญของสัญลักษณ์สำคัญของชาติไทยและปฏิบัติตนได้ถูกต้อง');
INSERT INTO `bets_indicator` VALUES (1572, '2551040403', 1, '25510404030201', '๒. บอก สถานที่สำคัญซึ่งเป็นแหล่งวัฒนธรรมในชุมชน');
INSERT INTO `bets_indicator` VALUES (1573, '2551040403', 1, '25510404030301', '๓. ระบุสิ่งที่ตนรักและภาคภูมิใจในท้องถิ่น');
INSERT INTO `bets_indicator` VALUES (1574, '2551040403', 2, '25510404030102', '๑. ระบุบุคคลที่ทำประโยชน์ต่อท้องถิ่น หรือประเทศชาติ');
INSERT INTO `bets_indicator` VALUES (1575, '2551040403', 2, '25510404030202', '๒. ยกตัวอย่างวัฒนธรรมประเพณีและภูมิปัญญาไทยที่ภาคภูมิใจและควรอนุรักษ์ไว้');
INSERT INTO `bets_indicator` VALUES (1576, '2551040403', 3, '25510404030103', '๑. ระบุพระนามและพระราชกรณียกิจโดยสังเขปของพระมหากษัตริย์ไทยที่เป็นผู้สถาปนาอาณาจักรไทย');
INSERT INTO `bets_indicator` VALUES (1577, '2551040403', 3, '25510404030203', '๒. อธิบายพระราชประวัติและพระราชกรณียกิจของพระมหากษัตริย์ในรัชกาลปัจจุบันโดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1578, '2551040403', 3, '25510404030303', '๓. เล่าวีรกรรมของบรรพบุรุษไทยที่มีส่วนปกป้องประเทศชาติ');
INSERT INTO `bets_indicator` VALUES (1579, '2551040403', 4, '25510404030104', '๑. อธิบายพัฒนาการของอาณาจักรสุโขทัยโดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1580, '2551040403', 4, '25510404030204', '๒. บอกประวัติและผลงานของบุคคลสำคัญสมัยสุโขทัย');
INSERT INTO `bets_indicator` VALUES (1581, '2551040403', 4, '25510404030304', '๓. อธิบายภูมิปัญญาไทยที่สำคัญสมัยสุโขทัย ที่น่าภาคภูมิใจและควรค่าแก่การอนุรักษ์');
INSERT INTO `bets_indicator` VALUES (1582, '2551040403', 5, '25510404030105', '๑. อธิบายพัฒนา การของอาณาจักรอยุธยาและธนบุรีโดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1583, '2551040403', 5, '25510404030205', '๒. อธิบายปัจจัยที่ส่งเสริมความเจริญรุ่งเรืองทางเศรษฐกิจและการปกครองของอาณาจักรอยุธยา');
INSERT INTO `bets_indicator` VALUES (1584, '2551040403', 5, '25510404030305', '๓. บอกประวัติและผลงานของบุคคลสำคัญสมัยอยุธยาและธนบุรีที่น่าภาคภูมิใจ');
INSERT INTO `bets_indicator` VALUES (1585, '2551040403', 5, '25510404030405', '๔. อธิบายภูมิปัญญาไทยที่สำคัญสมัยอยุธยาและธนบุรีที่น่าภาคภูมิใจและควรค่าแก่การอนุรักษ์ไว้');
INSERT INTO `bets_indicator` VALUES (1586, '2551040403', 6, '25510404030106', '๑. อธิบายพัฒนา การของไทยสมัยรัตนโกสินทร์โดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1587, '2551040403', 6, '25510404030206', '๒. อธิบายปัจจัยที่ส่งเสริมความเจริญรุ่งเรืองทางเศรษฐกิจและการปกครองของไทยสมัยรัตนโกสินทร์');
INSERT INTO `bets_indicator` VALUES (1588, '2551040403', 6, '25510404030306', '๓. ยกตัวอย่างผลงานของบุคคลสำคัญด้านต่าง ๆสมัยรัตนโกสินทร์');
INSERT INTO `bets_indicator` VALUES (1589, '2551040403', 6, '25510404030406', '๔. อธิบายภูมิปัญญาไทยที่สำคัญสมัยรัตนโกสินทร์ที่น่าภาคภูมิใจและควรค่าแก่การอนุรักษ์ไว้');
INSERT INTO `bets_indicator` VALUES (1590, '2551040403', 7, '25510404030107', '๑. อธิบายเรื่องราวทางประวัติศาสตร์สมัยก่อนสุโขทัยในดินแดนไทยโดยสังเขป');
INSERT INTO `bets_indicator` VALUES (1591, '2551040403', 7, '25510404030207', '๒. วิเคราะห์พัฒนาการของอาณาจักรสุโขทัย ในด้านต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (1592, '2551040403', 7, '25510404030307', '๓. วิเคราะห์อิทธิพลของวัฒนธรรมและภูมิปัญญาไทยสมัยสุโขทัยและสังคมไทยในปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (1593, '2551040403', 8, '25510404030108', '๑. วิเคราะห์พัฒนาการของอาณาจักรอยุธยาและธนบุรี ในด้านต่างๆ');
INSERT INTO `bets_indicator` VALUES (1594, '2551040403', 8, '25510404030208', '๒. วิเคราะห์ปัจจัยที่ส่งผลต่อความมั่นคงและความเจริญรุ่งเรืองของอาณาจักรอยุธยา');
INSERT INTO `bets_indicator` VALUES (1595, '2551040403', 8, '25510404030308', '๓. ระบุภูมิปัญญาและวัฒนธรรมไทยสมัยอยุธยาและธนบุรีและอิทธิพลของภูมิปัญญาดังกล่าวต่อการพัฒนาชาติไทยในยุคต่อมา');
INSERT INTO `bets_indicator` VALUES (1596, '2551040403', 9, '25510404030109', '๑. วิเคราะห์พัฒนาการของไทยสมัยรัตนโกสินทร์ในด้านต่างๆ');
INSERT INTO `bets_indicator` VALUES (1597, '2551040403', 9, '25510404030209', '๒. วิเคราะห์ปัจจัยที่ส่งผลต่อความมั่นคงและความเจริญรุ่งเรืองของไทยในสมัยรัตนโกสินทร์');
INSERT INTO `bets_indicator` VALUES (1598, '2551040403', 9, '25510404030309', '๓. วิเคราะห์ภูมิปัญญาและวัฒนธรรมไทยสมัยรัตนโกสินทร์และอิทธิพลต่อการพัฒนาชาติไทย');
INSERT INTO `bets_indicator` VALUES (1599, '2551040403', 9, '25510404030409', '๔.วิเคราะห์บทบาทของไทยในสมัยประชาธิปไตย');
INSERT INTO `bets_indicator` VALUES (1600, '2551040403', 13, '25510404030113', '๑. วิเคราะห์ประเด็นสำคัญของประวัติศาสตร์ไทย');
INSERT INTO `bets_indicator` VALUES (1601, '2551040403', 13, '25510404030213', '๒. วิเคราะห์ความสำคัญของสถาบันพระมหากษัตริย์ต่อชาติไทย');
INSERT INTO `bets_indicator` VALUES (1602, '2551040403', 13, '25510404030313', '๓. วิเคราะห์ปัจจัยที่ส่งเสริมการสร้างสรรค์ภูมิปัญญาไทยและวัฒนธรรมไทยซึ่งมีผลต่อสังคมไทยในยุคปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (1603, '2551040403', 13, '25510404030413', '๔. วิเคราะห์ผลงานของบุคคลสำคัญทั้งชาวไทยและต่างประเทศที่มีส่วนสร้างสรรค์วัฒนธรรมไทย และประวัติศาสตร์ไทย');
INSERT INTO `bets_indicator` VALUES (1604, '2551040403', 13, '25510404030513', '๕. วางแผนกำหนดแนวทางและมีส่วนร่วมการอนุรักษ์ภูมิปัญญาไทยและวัฒนธรรมไทย');
INSERT INTO `bets_indicator` VALUES (1605, '2551040501', 1, '25510405010101', '๑. แยกแยะสิ่งต่าง ๆ รอบตัวที่เกิดขึ้นเองตามธรรมชาติและที่มนุษย์สร้างขึ้น');
INSERT INTO `bets_indicator` VALUES (1606, '2551040501', 1, '25510405010201', '๒. ระบุความสัมพันธ์ของตำแหน่งระยะ ทิศของสิ่งต่างๆ รอบตัว');
INSERT INTO `bets_indicator` VALUES (1607, '2551040501', 1, '25510405010301', '๓. ระบุทิศหลักและที่ตั้งของสิ่งต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (1608, '2551040501', 1, '25510405010401', '๔.ใช้แผนผังง่าย ๆ ในการแสดงตำแหน่งของสิ่งต่าง ๆในห้องเรียน');
INSERT INTO `bets_indicator` VALUES (1609, '2551040501', 1, '25510405010501', '๕. สังเกตและบอกการเปลี่ยนแปลงของสภาพอากาศในรอบวัน');
INSERT INTO `bets_indicator` VALUES (1610, '2551040501', 2, '25510405010102', '๑. ระบุสิ่งต่าง ๆที่เป็นธรรมชาติกับที่มนุษย์สร้างขึ้นซึ่งปรากฏระหว่างโรงเรียนกับบ้าน');
INSERT INTO `bets_indicator` VALUES (1611, '2551040501', 2, '25510405010202', '๒. ระบุตำแหน่งอย่างง่ายและลักษณะทางกายภาพของสิ่งต่าง ๆ ที่ปรากฏในลูกโลก แผนที่แผนผังและภาพถ่าย');
INSERT INTO `bets_indicator` VALUES (1612, '2551040501', 2, '25510405010302', '๓. อธิบายความสัมพันธ์ของ ปรากฏการณ์ระหว่างโลกดวงอาทิตย์และดวงจันทร์');
INSERT INTO `bets_indicator` VALUES (1613, '2551040501', 3, '25510405010103', '๑. ใช้แผนที่แผนผังและภาพถ่ายในการหาข้อมูลทางภูมิศาสตร์ในชุมชนได้อย่างมีประสิทธิภาพ');
INSERT INTO `bets_indicator` VALUES (1614, '2551040501', 3, '25510405010203', '๒. เขียนแผนผังง่าย ๆ เพื่อแสดงตำแหน่งที่ตั้งของสถานที่สำคัญในบริเวณโรงเรียนและชุมชน');
INSERT INTO `bets_indicator` VALUES (1615, '2551040501', 3, '25510405010303', '๓. บอกความสัมพันธ์ของลักษณะทางกายภาพกับลักษณะทางสังคมของชุมชน');
INSERT INTO `bets_indicator` VALUES (1616, '2551040501', 4, '25510405010104', '๑. ใช้แผนที่ภาพถ่าย ระบุลักษณะสำคัญทางกายภาพของจังหวัดตนเอง');
INSERT INTO `bets_indicator` VALUES (1617, '2551040501', 4, '25510405010204', '๒. ระบุแหล่งทรัพยากรและสิ่งต่างๆ ในจังหวัดของตนเองด้วยแผนที่');
INSERT INTO `bets_indicator` VALUES (1618, '2551040501', 4, '25510405010304', '๓.ใช้แผนที่อธิบายความสัมพันธ์ของสิ่งต่าง ๆ ที่มีอยู่ในจังหวัด');
INSERT INTO `bets_indicator` VALUES (1619, '2551040501', 5, '25510405010105', '๑. รู้ตำแหน่ง(พิกัดภูมิศาสตร์ละติจูดลองจิจูด) ระยะทิศทางของภูมิภาคของตนเอง');
INSERT INTO `bets_indicator` VALUES (1620, '2551040501', 5, '25510405010205', '๒. ระบุลักษณ์ภูมิลักษณะที่สำคัญในภูมิภาคของตนเองในแผนที่');
INSERT INTO `bets_indicator` VALUES (1621, '2551040501', 5, '25510405010305', '๓. อธิบายความสัมพันธ์ของลักษณะทางกายภาพกับลักษณะทางสังคมในภูมิภาคของตนเอง');
INSERT INTO `bets_indicator` VALUES (1622, '2551040501', 6, '25510405010106', '๑. ใช้เครื่องมือทางภูมิศาสตร์(แผนที่ ภาพถ่ายชนิดต่าง) ระบุลักษณะสำคัญทางกายภาพและสังคมของประเทศ');
INSERT INTO `bets_indicator` VALUES (1623, '2551040501', 6, '25510405010206', '๒. อธิบายความสัมพันธ์ระหว่างลักษณะทางกายภาพกับปรากฏการณ์ทางธรรมชาติของประเทศ');
INSERT INTO `bets_indicator` VALUES (1624, '2551040501', 7, '25510405010107', '๑. เลือกใช้เครื่องมือทางภูมิศาสตร์(ลูกโลก แผนที่กราฟ แผนภูมิ)ในการสืบค้นข้อมูล เพื่อวิเคราะห์ลักษณะทางกายภาพและสังคมของประเทศไทยและทวีปเอเชียออสเตรเลียและโอเชียเนีย');
INSERT INTO `bets_indicator` VALUES (1625, '2551040501', 7, '25510405010207', '๒. อธิบายเส้นแบ่งเวลาและเปรียบเทียบ วันเวลาของประเทศไทยกับทวีปต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (1626, '2551040501', 7, '25510405010307', '๓. วิเคราะห์เชื่อมโยงสาเหตุและแนวทางป้องกันภัยธรรมชาติและการระวังภัยที่เกิดขึ้นในประทศไทยและทวีปเอเชียออสเตรเลีย และโอเชียเนีย');
INSERT INTO `bets_indicator` VALUES (1627, '2551040501', 8, '25510405010108', '๑.ใช้เครื่องมือทางภูมิศาสตร์ในการรวบรวมวิเคราะห์และนำเสนอข้อมูลเกี่ยวกับลักษณะทางกายภาพและสังคมของทวีปยุโรปและแอฟริกา');
INSERT INTO `bets_indicator` VALUES (1628, '2551040501', 8, '25510405010208', '๒.วิเคราะห์ความสัมพันธ์ระหว่างลักษณะทางกายภาพและสังคมของทวีปยุโรปและแอฟริกา');
INSERT INTO `bets_indicator` VALUES (1629, '2551040501', 9, '25510405010109', '๑. ใช้เครื่องมือทางภูมิศาสตร์ในการรวบรวมวิเคราะห์ และนำเสนอข้อมูลเกี่ยวกับลักษณะทางกายภาพและสังคมของทวีปอเมริกาเหนือและอเมริกาใต้');
INSERT INTO `bets_indicator` VALUES (1630, '2551040501', 9, '25510405010209', '๒.วิเคราะห์ความสัมพันธ์ระหว่างลักษณะทางกายภาพและสังคมของทวีปอเมริกาเหนือและอเมริกาใต้');
INSERT INTO `bets_indicator` VALUES (1631, '2551040501', 13, '25510405010113', '๑. ใช้เครื่องมือทางภูมิศาสตร์ในการรวบรวม วิเคราะห์และนำเสนอข้อมูลภูมิสารสนเทศอย่างมีประสิทธิภาพ');
INSERT INTO `bets_indicator` VALUES (1632, '2551040501', 13, '25510405010213', '๒. วิเคราะห์อิทธิพลของสภาพภูมิศาสตร์ซึ่งทำให้เกิดปัญหาทางกายภาพหรือภัยพิบัติทางธรรมชาติในประเทศไทยและภูมิภาคต่าง ๆของโลก');
INSERT INTO `bets_indicator` VALUES (1633, '2551040501', 13, '25510405010313', '๓. วิเคราะห์การเปลี่ยนแปลงของพื้นที่ซึ่งได้รับอิทธิพลจากปัจจัยทางภูมิศาสตร์ในประเทศไทยและทวีปต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (1634, '2551040501', 13, '25510405010413', '๔. ประเมินการเปลี่ยนแปลงธรรมชาติในโลกว่าเป็นผลมาจากการกระทำของมนุษย์และหรือธรรมชาติ');
INSERT INTO `bets_indicator` VALUES (1635, '2551040502', 1, '25510405020101', '๑. บอกสิ่งต่างๆที่เกิดตามธรรมชาติที่ส่งผลต่อความเป็นอยู่ของมนุษย์');
INSERT INTO `bets_indicator` VALUES (1636, '2551040502', 1, '25510405020201', '๒. สังเกตและเปรียบเทียบการเปลี่ยนแปลงของสภาพแวดล้อมที่อยู่รอบตัว');
INSERT INTO `bets_indicator` VALUES (1637, '2551040502', 1, '25510405020301', '๓. มีส่วนร่วมในการจัดระเบียบสิ่งแวดล้อมที่บ้านและชั้นเรียน');
INSERT INTO `bets_indicator` VALUES (1638, '2551040502', 2, '25510405020102', '๑. อธิบายความสำคัญและคุณค่าของสิ่งแวดล้อมทางธรรมชาติและทางสังคม');
INSERT INTO `bets_indicator` VALUES (1639, '2551040502', 2, '25510405020202', '๒. แยกแยะและใช้ทรัพยากรธรรมชาติที่ใช้แล้วไม่หมดไปและที่ใช้แล้วหมดไปได้อย่างคุ้มค่า');
INSERT INTO `bets_indicator` VALUES (1640, '2551040502', 2, '25510405020302', '๓. อธิบายความสัมพันธ์ของฤดูกาลกับการดำเนินชีวิตของมนุษย์');
INSERT INTO `bets_indicator` VALUES (1641, '2551040502', 2, '25510405020402', '๔. มีส่วนร่วมในการฟื้นฟูปรับปรุงสิ่งแวดล้อมในโรงเรียนและชุมชน');
INSERT INTO `bets_indicator` VALUES (1642, '2551040502', 3, '25510405020103', '๑. เปรียบเทียบการเปลี่ยนแปลงสภาพแวดล้อมในชุมชนจากอดีตถึงปัจจุบัน');
INSERT INTO `bets_indicator` VALUES (1643, '2551040502', 3, '25510405020203', '๒. อธิบายการพึ่งพาสิ่งแวดล้อมและทรัพยากรธรรมชาติ ในการสนองความต้องการพื้นฐานของมนุษย์และการประกอบอาชีพ');
INSERT INTO `bets_indicator` VALUES (1644, '2551040502', 3, '25510405020303', '๓. อธิบายเกี่ยวกับมลพิษและการก่อให้เกิดมลพิษโดยมนุษย์');
INSERT INTO `bets_indicator` VALUES (1645, '2551040502', 3, '25510405020403', '๔. อธิบายความแตกต่างของเมืองและชนบท');
INSERT INTO `bets_indicator` VALUES (1646, '2551040502', 3, '25510405020503', '๕. ตระหนักถึงการเปลี่ยนแปลงของสิ่งแวดล้อมในชุมชน');
INSERT INTO `bets_indicator` VALUES (1647, '2551040502', 4, '25510405020104', '๑ อธิบายสภาพแวดล้อมทางกายภาพของชุมชนที่ส่งผลต่อการดำเนินชีวิตของคนในจังหวัด');
INSERT INTO `bets_indicator` VALUES (1648, '2551040502', 4, '25510405020204', '๒ อธิบายการเปลี่ยนแปลงสภาพแวดล้อมในจังหวัดและผลที่เกิดจากการเปลี่ยนแปลงนั้น');
INSERT INTO `bets_indicator` VALUES (1649, '2551040502', 4, '25510405020304', '๓. มีส่วนร่วมในการอนุรักษ์สิ่งแวดล้อมในจังหวัด');
INSERT INTO `bets_indicator` VALUES (1650, '2551040502', 5, '25510405020105', '๑. วิเคราะห์สภาพแวดล้อมทางกายภาพที่มีอิทธิพลต่อลักษณะการตั้งถิ่นฐานและการย้ายถิ่นของประชากรในภูมิภาค');
INSERT INTO `bets_indicator` VALUES (1651, '2551040502', 5, '25510405020205', '๒. อธิบายอิทธิพลของสิ่งแวดล้อมทางธรรมชาติที่ก่อให้เกิดวิถีชีวิตและการสร้างสรรค์วัฒนธรรมในภูมิภาค');
INSERT INTO `bets_indicator` VALUES (1652, '2551040502', 5, '25510405020305', '๓. นำเสนอตัวอย่างที่สะท้อนให้เห็นผลจากการรักษาและการทำลายสภาพแวดล้อมและเสนอแนวคิดในการรักษาสภาพแวดล้อมในภูมิภาค');
INSERT INTO `bets_indicator` VALUES (1653, '2551040502', 6, '25510405020106', '๑. วิเคราะห์ความสัมพันธ์ระหว่างสิ่งแวดล้อมทางธรรมชาติกับสิ่งแวดล้อมทางสังคมในประเทศ');
INSERT INTO `bets_indicator` VALUES (1654, '2551040502', 6, '25510405020206', '๒. อธิบายการแปลงสภาพธรรมชาติในประเทศไทยจากอดีตถึงปัจจุบันและผลที่เกิดขึ้นจากการเปลี่ยนแปลงนั้น');
INSERT INTO `bets_indicator` VALUES (1655, '2551040502', 6, '25510405020306', '๓. จัดทำแผนการใช้ทรัพยากรในชุมชน');
INSERT INTO `bets_indicator` VALUES (1656, '2551040502', 7, '25510405020107', '๑. วิเคราะห์ผลกระทบจากการเปลี่ยนแปลงทางธรรมชาติของทวีปเอเชียออสเตรเลียและโอเชียเนีย');
INSERT INTO `bets_indicator` VALUES (1657, '2551040502', 7, '25510405020207', '๒. วิเคราะห์ความร่วมมือของประเทศต่างๆ ที่มีผลต่อสิ่งแวดล้อมทางธรรมชาติของทวีปเอเชียออสเตรเลียและโอเชียเนีย');
INSERT INTO `bets_indicator` VALUES (1658, '2551040502', 7, '25510405020307', '๓. สำรวจ และอธิบายทำเลที่ตั้งกิจกรรมทางเศรษฐกิจและสังคมในทวีปเอเชียออสเตรเลียและโอเชียเนียโดยใช้แหล่งข้อมูลที่หลากหลาย');
INSERT INTO `bets_indicator` VALUES (1659, '2551040502', 7, '25510405020407', '๔. วิเคราะห์ปัจจัยทางกายภาพและสังคมที่มีผลต่อการเลื่อนไหลของความคิดเทคโนโลยีสินค้า และประชากรในทวีปเอเชียออสเตรเลีย และโอเชียเนีย');
INSERT INTO `bets_indicator` VALUES (1660, '2551040502', 8, '25510405020108', '๑.วิเคราะห์การก่อเกิดสิ่งแวดล้อมใหม่ทางสังคมอันเป็นผลจากการเปลี่ยนแปลงทางธรรมชาติและทางสังคมของทวีปยุโรปและแอฟริกา');
INSERT INTO `bets_indicator` VALUES (1661, '2551040502', 8, '25510405020208', '๒. ระบุแนวทางการอนุรักษ์ทรัพยากรธรรมชาติและสิ่งแวดล้อมในทวีปยุโรปและแอฟริกา');
INSERT INTO `bets_indicator` VALUES (1662, '2551040502', 8, '25510405020308', '๓. สำรวจอภิปรายประเด็นปัญหาเกี่ยวกับสิ่งแวดล้อมที่เกิดขึ้นในทวีปยุโรปและแอฟริกา');
INSERT INTO `bets_indicator` VALUES (1663, '2551040502', 8, '25510405020408', '๔. วิเคราะห์เหตุและผลกระทบที่ประเทศไทยได้รับจากการเปลี่ยนแปลงของสิ่งแวดล้อมในทวีปยุโรปและแอฟริกา');
INSERT INTO `bets_indicator` VALUES (1664, '2551040502', 9, '25510405020109', '๑. วิเคราะห์การก่อเกิดสิ่งแวดล้อมใหม่ทางสังคม อันเป็นผลจากการเปลี่ยนแปลงทางธรรมชาติและทางสังคมของทวีป อเมริกาเหนือและอเมริกาใต้');
INSERT INTO `bets_indicator` VALUES (1665, '2551040502', 9, '25510405020209', '๒. ระบุแนวทางการอนุรักษ์ทรัพยากรธรรมชาติและสิ่งแวดล้อมในทวีปอเมริกาเหนือและอเมริกาใต้');
INSERT INTO `bets_indicator` VALUES (1666, '2551040502', 9, '25510405020309', '๓. สำรวจอภิปรายประเด็นปัญหาเกี่ยวกับสิ่งแวดล้อมที่เกิดขึ้นในทวีปอเมริกาเหนือและอเมริกาใต้');
INSERT INTO `bets_indicator` VALUES (1667, '2551040502', 9, '25510405020409', '๔. วิเคราะห์เหตุและผลกระทบต่อเนื่องจากการเปลี่ยนแปลงของสิ่งแวดล้อมในทวีปอเมริกาเหนือและอเมริกาใต้ที่ส่งผลต่อประเทศไทย');
INSERT INTO `bets_indicator` VALUES (1668, '2551040502', 13, '25510405020113', '๑.วิเคราะห์สถานการณ์และวิกฤตการณ์ด้านทรัพยากรธรรมชาติและสิ่งแวดล้อมของประเทศไทยและโลก');
INSERT INTO `bets_indicator` VALUES (1669, '2551040502', 13, '25510405020213', '๒ ระบุมาตรการป้องกันและแก้ไขปัญหา บทบาทขององค์การและการประสานความร่วมมือทั้งในประเทศและนอกประเทศเกี่ยวกับกฎหมายสิ่งแวดล้อม การจัดการทรัพยากรธรรมชาติและสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1670, '2551040502', 13, '25510405020313', '๓. ระบุแนวทางการอนุรักษ์ทรัพยากรธรรมชาติและสิ่งแวดล้อมในภูมิภาคต่างๆ ของโลก');
INSERT INTO `bets_indicator` VALUES (1671, '2551040502', 13, '25510405020413', '๔. อธิบายการใช้ประโยชน์จากสิ่งแวดล้อมในการสร้างสรรค์วัฒนธรรมอันเป็นเอกลักษณ์ของท้องถิ่น ทั้งในประเทศไทยและโลก');
INSERT INTO `bets_indicator` VALUES (1672, '2551040502', 13, '25510405020513', '๕. มีส่วนร่วมในการแก้ปัญหาและการดำเนินชีวิตตามแนวทางการอนุรักษ์ทรัพยากรและสิ่งแวดล้อมเพื่อการพัฒนาที่ยั่งยืน');
INSERT INTO `bets_indicator` VALUES (1673, '2551050101', 1, '25510501010101', '๑. อธิบายลักษณะและหน้าที่ของอวัยวะภายนอก');
INSERT INTO `bets_indicator` VALUES (1674, '2551050101', 1, '25510501010201', '๒. อธิบายวิธีดูแลรักษาอวัยวะภายนอก');
INSERT INTO `bets_indicator` VALUES (1675, '2551050101', 2, '25510501010102', '๑. อธิบายลักษณะและหน้าที่ของอวัยวะภายใน');
INSERT INTO `bets_indicator` VALUES (1676, '2551050101', 2, '25510501010202', '๒. อธิบายวิธีดูแลรักษาอวัยวะภายใน');
INSERT INTO `bets_indicator` VALUES (1677, '2551050101', 2, '25510501010302', '๓. อธิบายธรรมชาติของชีวิตมนุษย์');
INSERT INTO `bets_indicator` VALUES (1678, '2551050101', 3, '25510501010103', '๑. อธิบายลักษณะและการเจริญเติบโตของร่างกายมนุษย์');
INSERT INTO `bets_indicator` VALUES (1679, '2551050101', 3, '25510501010203', '๒. เปรียบเทียบการเจริญเติบโตของตนเองกับเกณฑ์มาตรฐาน');
INSERT INTO `bets_indicator` VALUES (1680, '2551050101', 3, '25510501010303', '๓. ระบุปัจจัยที่มีผลต่อการเจริญเติบโต');
INSERT INTO `bets_indicator` VALUES (1681, '2551050101', 4, '25510501010104', '๑. อธิบายการเจริญเติบโตและพัฒนาการของร่างกายและจิตใจตามวัย');
INSERT INTO `bets_indicator` VALUES (1682, '2551050101', 4, '25510501010204', '๒. อธิบายความสำคัญของกล้ามเนื้อกระดูกและข้อที่มีผลต่อสุขภาพการเจริญเติบโตและพัฒนาการ');
INSERT INTO `bets_indicator` VALUES (1683, '2551050101', 4, '25510501010304', '๓. อธิบายวิธีดูแลกล้ามเนื้อ กระดูกและข้อ ให้ทำงานอย่างมีประสิทธิภาพ');
INSERT INTO `bets_indicator` VALUES (1684, '2551050101', 5, '25510501010105', '๑. อธิบายความสำคัญของระบบย่อยอาหาร และระบบขับถ่ายที่มีผลต่อสุขภาพการเจริญเติบโต และพัฒนาการ');
INSERT INTO `bets_indicator` VALUES (1685, '2551050101', 5, '25510501010205', '๒. อธิบายวิธีดูแลระบบย่อยอาหารและระบบขับถ่ายให้ทำงานตามปกติ');
INSERT INTO `bets_indicator` VALUES (1686, '2551050101', 6, '25510501010106', '๑. อธิบายความสำคัญของระบบสืบพันธุ์ระบบไหลเวียนโลหิตและระบบหายใจ ที่มีผลต่อสุขภาพ การเจริญเติบโตและพัฒนาการ');
INSERT INTO `bets_indicator` VALUES (1687, '2551050101', 6, '25510501010206', '๒. อธิบายวิธีการดูแลระบบสืบพันธุ์ระบบไหลเวียนโลหิต และระบบหายใจให้ทำงานตามปกติ');
INSERT INTO `bets_indicator` VALUES (1688, '2551050101', 7, '25510501010107', '๑. อธิบายความสำคัญของระบบประสาทและระบบต่อมไร้ท่อที่มีผลต่อสุขภาพการเจริญเติบโต และพัฒนาการของวัยรุ่น');
INSERT INTO `bets_indicator` VALUES (1689, '2551050101', 7, '25510501010207', '๒. อธิบายวิธีดูแลระบบประสาท และระบบต่อมไร้ท่อให้ทำงานตามปกติ');
INSERT INTO `bets_indicator` VALUES (1690, '2551050101', 7, '25510501010307', '๓. วิเคราะห์ภาวะการเจริญเติบโตทางร่างกายของตนเองกับเกณฑ์มาตรฐาน');
INSERT INTO `bets_indicator` VALUES (1691, '2551050101', 7, '25510501010407', '๔. แสวงหาแนวทางในการพัฒนาตนเองให้เจริญเติบโตสมวัย');
INSERT INTO `bets_indicator` VALUES (1692, '2551050101', 8, '25510501010108', '๑. อธิบายการเปลี่ยนแปลงด้านร่างกายจิตใจ อารมณ์สังคม และสติปัญญาในวัยรุ่น');
INSERT INTO `bets_indicator` VALUES (1693, '2551050101', 8, '25510501010208', '๒. ระบุปัจจัยที่มีผลกระทบต่อการเจริญเติบโตและพัฒนาการด้านร่างกายจิตใจ อารมณ์สังคม และสติปัญญาในวัยรุ่น');
INSERT INTO `bets_indicator` VALUES (1694, '2551050101', 9, '25510501010109', '๑. เปรียบเทียบการเปลี่ยนแปลงทางด้านร่างกาย จิตใจอารมณ์ สังคมและสติปัญญาแต่ละช่วงของชีวิต');
INSERT INTO `bets_indicator` VALUES (1695, '2551050101', 9, '25510501010209', '๒. วิเคราะห์อิทธิพลและความคาดหวังของสังคมต่อการเปลี่ยนแปลงของวัยรุ่น');
INSERT INTO `bets_indicator` VALUES (1696, '2551050101', 9, '25510501010309', '๓. วิเคราะห์สื่อ โฆษณาที่มีอิทธิพลต่อการเจริญเติบโตและพัฒนาการของวัยรุ่น');
INSERT INTO `bets_indicator` VALUES (1697, '2551050101', 13, '25510501010113', '๑. อธิบายกระบวนการสร้างเสริมและดำรงประสิทธิภาพการทำงานของระบบอวัยวะต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (1698, '2551050101', 13, '25510501010213', '๒. วางแผนดูแลสุขภาพตามภาวะการเจริญเติบโตและพัฒนาการของตนเองและบุคคลในครอบครัว');
INSERT INTO `bets_indicator` VALUES (1699, '2551050201', 1, '25510502010101', '๑. ระบุสมาชิกในครอบครัวและความรักความผูกพันของสมาชิกที่มีต่อกัน');
INSERT INTO `bets_indicator` VALUES (1700, '2551050201', 1, '25510502010201', '๒. บอกสิ่งที่ชื่นชอบ และภาคภูมิใจในตนเอง');
INSERT INTO `bets_indicator` VALUES (1701, '2551050201', 1, '25510502010301', '๓. บอกลักษณะความแตกต่างระหว่างเพศชาย และเพศหญิง');
INSERT INTO `bets_indicator` VALUES (1702, '2551050201', 2, '25510502010102', '๑. ระบุบทบาทหน้าที่ของตนเอง และสมาชิกในครอบครัว');
INSERT INTO `bets_indicator` VALUES (1703, '2551050201', 2, '25510502010202', '๒. บอกความสำคัญของเพื่อน');
INSERT INTO `bets_indicator` VALUES (1704, '2551050201', 2, '25510502010302', '๓. ระบุพฤติกรรมที่เหมาะสมกับเพศ');
INSERT INTO `bets_indicator` VALUES (1705, '2551050201', 2, '25510502010402', '๔. อธิบายความภาคภูมิใจในความเป็นเพศหญิง หรือเพศชาย');
INSERT INTO `bets_indicator` VALUES (1706, '2551050201', 3, '25510502010103', '๑. อธิบายความสำคัญและความแตกต่างของครอบครัวที่มีต่อตนเอง');
INSERT INTO `bets_indicator` VALUES (1707, '2551050201', 3, '25510502010203', '๒. อธิบายวิธีสร้างสัมพันธภาพในครอบครัวและกลุ่มเพื่อน');
INSERT INTO `bets_indicator` VALUES (1708, '2551050201', 3, '25510502010303', '๓. บอกวิธีหลีกเลี่ยงพฤติกรรมที่นำไปสู่การล่วงละเมิดทางเพศ');
INSERT INTO `bets_indicator` VALUES (1709, '2551050201', 4, '25510502010104', '๑. อธิบายคุณลักษณะของความเป็นเพื่อนและสมาชิกที่ดีของครอบครัว');
INSERT INTO `bets_indicator` VALUES (1710, '2551050201', 4, '25510502010204', '๒. แสดงพฤติกรรมที่เหมาะสมกับเพศของตนตามวัฒนธรรมไทย');
INSERT INTO `bets_indicator` VALUES (1711, '2551050201', 4, '25510502010304', '๓. ยกตัวอย่างวิธีการปฏิเสธการกระทำที่เป็นอันตรายและไม่เหมาะสมในเรื่องเพศ');
INSERT INTO `bets_indicator` VALUES (1712, '2551050201', 5, '25510502010105', '๑. อธิบายการเปลี่ยนแปลงทางเพศ และปฏิบัติตนได้เหมาะสม');
INSERT INTO `bets_indicator` VALUES (1713, '2551050201', 5, '25510502010205', '๒. อธิบายความสำคัญของการมีครอบครัวที่อบอุ่นตามวัฒนธรรมไทย');
INSERT INTO `bets_indicator` VALUES (1714, '2551050201', 5, '25510502010305', '๓. ระบุพฤติกรรมที่พึงประสงค์และไม่พึงประสงค์ในการแก้ไขปัญหาความขัดแย้งในครอบครัวและกลุ่มเพื่อน');
INSERT INTO `bets_indicator` VALUES (1715, '2551050201', 6, '25510502010106', '๑. อธิบายความสำคัญของการสร้างและรักษาสัมพันธภาพกับผู้อื่น');
INSERT INTO `bets_indicator` VALUES (1716, '2551050201', 6, '25510502010206', '๒. วิเคราะห์พฤติกรรมเสี่ยงที่อาจนำไปสู่การมีเพศสัมพันธ์การติดเชื้อเอดส์และการตั้งครรภ์ก่อนวัยอันควร');
INSERT INTO `bets_indicator` VALUES (1717, '2551050201', 7, '25510502010107', '๑. อธิบายวิธีการปรับตัวต่อการเปลี่ยนแปลงทางร่างกายจิตใจ อารมณ์และพัฒนาการทางเพศอย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (1718, '2551050201', 7, '25510502010207', '๒. แสดงทักษะการปฏิเสธเพื่อป้องกันตนเองจากการถูกล่วงละเมิดทางเพศ');
INSERT INTO `bets_indicator` VALUES (1719, '2551050201', 8, '25510502010108', '๑. วิเคราะห์ปัจจัยที่มีอิทธิพลต่อเจตคติในเรื่องเพศ');
INSERT INTO `bets_indicator` VALUES (1720, '2551050201', 8, '25510502010208', '๒. วิเคราะห์ปัญหาและผลกระทบที่เกิดจากการมีเพศสัมพันธ์ในวัยเรียน');
INSERT INTO `bets_indicator` VALUES (1721, '2551050201', 8, '25510502010308', '๓. อธิบายวิธีป้องกันตนเองและหลีกเลี่ยงจากโรคติดต่อทางเพศสัมพันธ์เอดส์ และการตั้งครรภ์โดยไม่พึงประสงค์');
INSERT INTO `bets_indicator` VALUES (1722, '2551050201', 8, '25510502010408', '๔. อธิบายความสำคัญของความเสมอภาคทางเพศ และวางตัวได้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (1723, '2551050201', 9, '25510502010109', '๑. อธิบายอนามัยแม่และเด็กการวางแผนครอบครัว และวิธีการปฏิบัติตนที่เหมาะสม');
INSERT INTO `bets_indicator` VALUES (1724, '2551050201', 9, '25510502010209', '๒. วิเคราะห์ปัจจัยที่มีผลกระทบต่อการตั้งครรภ์');
INSERT INTO `bets_indicator` VALUES (1725, '2551050201', 9, '25510502010309', '๓. วิเคราะห์สาเหตุ และเสนอแนวทางป้องกันแก้ไขความขัดแย้งในครอบครัว');
INSERT INTO `bets_indicator` VALUES (1726, '2551050201', 13, '25510502010113', '๑. วิเคราะห์อิทธิพลของครอบครัวเพื่อน สังคม และวัฒนธรรมที่มีผลต่อพฤติกรรมทางเพศและการดำเนินชีวิต');
INSERT INTO `bets_indicator` VALUES (1727, '2551050201', 13, '25510502010213', '๒. วิเคราะห์ค่านิยมในเรื่องเพศตามวัฒนธรรมไทยและวัฒนธรรมอื่น ๆ');
INSERT INTO `bets_indicator` VALUES (1728, '2551050201', 13, '25510502010313', '๓. เลือกใช้ทักษะที่เหมาะสมในการป้องกัน ลดความขัดแย้งและแก้ปัญหาเรื่องเพศ และครอบครัว');
INSERT INTO `bets_indicator` VALUES (1729, '2551050201', 13, '25510502010413', '๔. วิเคราะห์สาเหตุและผลของความขัดแย้งที่อาจเกิดขึ้นระหว่างนักเรียน หรือเยาวชนในชุมชนและเสนอแนวทางแก้ไขปัญหา');
INSERT INTO `bets_indicator` VALUES (1730, '2551050301', 1, '25510503010101', '๑. เคลื่อนไหวร่างกายขณะอยู่กับที่ เคลื่อนที่และใช้อุปกรณ์ประกอบ');
INSERT INTO `bets_indicator` VALUES (1731, '2551050301', 1, '25510503010201', '๒. เล่นเกมเบ็ดเตล็ดและเข้าร่วมกิจกรรมทางกายที่ใช้การเคลื่อนไหวตามธรรมชาติ');
INSERT INTO `bets_indicator` VALUES (1732, '2551050301', 2, '25510503010102', '๑. ควบคุมการเคลื่อนไหวร่างกายขณะอยู่กับที่เคลื่อนที่ และใช้อุปกรณ์ประกอบ');
INSERT INTO `bets_indicator` VALUES (1733, '2551050301', 2, '25510503010202', '๒. เล่นเกมเบ็ดเตล็ดและเข้าร่วมกิจกรรมทางกายที่วิธีเล่นอาศัยการเคลื่อนไหวเบื้องต้นทั้งแบบอยู่กับที่เคลื่อนที่และใช้อุปกรณ์ประกอบ');
INSERT INTO `bets_indicator` VALUES (1734, '2551050301', 3, '25510503010103', '๑. ควบคุมการเคลื่อนไหวร่างกาย ขณะอยู่กับที่ เคลื่อนที่และใช้อุปกรณ์ประกอบ อย่างมีทิศทาง');
INSERT INTO `bets_indicator` VALUES (1735, '2551050301', 3, '25510503010203', '๒. เคลื่อนไหวร่างกายที่ใช้ทักษะการเคลื่อนไหวแบบบังคับทิศทางในการเล่นเกมเบ็ดเตล็ด');
INSERT INTO `bets_indicator` VALUES (1736, '2551050301', 4, '25510503010104', '๑. ควบคุมตนเองเมื่อใช้ทักษะการเคลื่อนไหวในลักษณะผสมผสานได้ ทั้งแบบอยู่กับที่เคลื่อนที่ และใช้อุปกรณ์ประกอบ');
INSERT INTO `bets_indicator` VALUES (1737, '2551050301', 4, '25510503010204', '๒. ฝึกกายบริหารท่ามือเปล่าประกอบจังหวะ');
INSERT INTO `bets_indicator` VALUES (1738, '2551050301', 4, '25510503010304', '๓. เล่นเกมเลียนแบบและกิจกรรมแบบผลัด');
INSERT INTO `bets_indicator` VALUES (1739, '2551050301', 4, '25510503010404', '๔. เล่นกีฬาพื้นฐานได้อย่างน้อย ๑ ชนิด');
INSERT INTO `bets_indicator` VALUES (1740, '2551050301', 5, '25510503010105', '๑. จัด รูปแบบการเคลื่อนไหวแบบผสมผสานและควบคุมตนเองเมื่อใช้ทักษะการเคลื่อนไหวตามแบบที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1741, '2551050301', 5, '25510503010205', '๒. เล่นเกมนำไปสู่กีฬาที่เลือกและกิจกรรมการเคลื่อนไหวแบบผลัด');
INSERT INTO `bets_indicator` VALUES (1742, '2551050301', 5, '25510503010305', '๓. ควบคุมการเคลื่อนไหว ในเรื่องการรับแรงการใช้แรงและความสมดุล');
INSERT INTO `bets_indicator` VALUES (1743, '2551050301', 5, '25510503010405', '๔. แสดงทักษะกลไก ในการปฏิบัติกิจกรรมทางกายและเล่นกีฬา');
INSERT INTO `bets_indicator` VALUES (1744, '2551050301', 5, '25510503010505', '๕. เล่นกีฬาไทย และกีฬาสากลประเภทบุคคลและประเภททีมได้อย่างละ ๑ ชนิด');
INSERT INTO `bets_indicator` VALUES (1745, '2551050301', 5, '25510503010605', '๖. อธิบายหลักการ และเข้าร่วมกิจกรรมนันทนาการอย่างน้อย ๑ กิจกรรม');
INSERT INTO `bets_indicator` VALUES (1746, '2551050301', 6, '25510503010106', '๑. แสดงทักษะการเคลื่อนไหวร่วมกับผู้อื่นในลักษณะแบบผลัดและแบบผสมผสานได้ตามลำดับทั้งแบบอยู่กับที่เคลื่อนที่ และใช้อุปกรณ์ประกอบ และการเคลื่อนไหวประกอบเพลง');
INSERT INTO `bets_indicator` VALUES (1747, '2551050301', 6, '25510503010206', '๒. จำแนกหลักการเคลื่อนไหวในเรื่องการรับแรงการใช้แรง และความสมดุลในการเคลื่อนไหวร่างกายในการเล่นเกม เล่นกีฬา และนำผลมาปรับปรุง เพิ่มพูนวิธีปฏิบัติของตนและผู้อื่น');
INSERT INTO `bets_indicator` VALUES (1748, '2551050301', 6, '25510503010306', '๓. เล่นกีฬาไทยกีฬาสากลประเภทบุคคลและประเภททีมได้อย่างละ ๑ ชนิด');
INSERT INTO `bets_indicator` VALUES (1749, '2551050301', 6, '25510503010406', '๔. ใช้ทักษะกลไกเพื่อปรับปรุงเพิ่มพูนความสามารถของตนและผู้อื่นในการเล่นกีฬา');
INSERT INTO `bets_indicator` VALUES (1750, '2551050301', 6, '25510503010506', '๕. ร่วมกิจกรรมนันทนาการอย่างน้อย ๑ กิจกรรมแล้วนำความรู้และหลักการที่ได้ไปใช้เป็นฐานการศึกษาหาความรู้เรื่องอื่น ๆ');
INSERT INTO `bets_indicator` VALUES (1751, '2551050301', 7, '25510503010107', '๑. เพิ่มพูนความสามารถของตนตามหลักการเคลื่อนไหวที่ใช้ทักษะกลไกและทักษะพื้นฐานที่นำไปสู่การพัฒนาทักษะการเล่นกีฬา');
INSERT INTO `bets_indicator` VALUES (1752, '2551050301', 7, '25510503010207', '๒. เล่นกีฬาไทยและกีฬาสากลประเภทบุคคลและทีมโดยใช้ทักษะพื้นฐานตามชนิดกีฬาอย่างละ ๑ ชนิด');
INSERT INTO `bets_indicator` VALUES (1753, '2551050301', 7, '25510503010307', '๓. ร่วมกิจกรรมนันทนาการอย่างน้อย ๑กิจกรรมและนำหลักความรู้ที่ได้ไปเชื่อมโยงสัมพันธ์กับวิชาอื่น');
INSERT INTO `bets_indicator` VALUES (1754, '2551050301', 8, '25510503010108', '๑. นำผลการปฏิบัติตนเกี่ยวกับทักษะกลไกและทักษะการเคลื่อนไหวในการเล่นกีฬาจากแหล่งข้อมูลที่หลากหลายมาสรุปเป็นวิธีที่เหมาะสมในบริบทของตนเอง');
INSERT INTO `bets_indicator` VALUES (1755, '2551050301', 8, '25510503010208', '๒. เล่นกีฬาไทยและกีฬาสากลทั้งประเภทบุคคลและทีมได้ อย่างละ ๑ชนิด');
INSERT INTO `bets_indicator` VALUES (1756, '2551050301', 8, '25510503010308', '๓. เปรียบเทียบประสิทธิภาพของรูปแบบการเคลื่อนไหวที่ส่งผลต่อการเล่นกีฬาและกิจกรรมในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (1757, '2551050301', 8, '25510503010408', '๔. ร่วมกิจกรรมนันทนาการอย่างน้อย๑ กิจกรรม และนำความรู้และหลักการที่ได้ไปปรับใช้ในชีวิตประจำวันอย่างเป็นระบบ');
INSERT INTO `bets_indicator` VALUES (1758, '2551050301', 9, '25510503010109', '๑. เล่นกีฬาไทยและกีฬาสากลได้อย่างละ ๑ ชนิดโดยใช้เทคนิคที่เหมาะสมกับตนเองและทีม');
INSERT INTO `bets_indicator` VALUES (1759, '2551050301', 9, '25510503010209', '๒. นำหลักการความรู้และทักษะในการเคลื่อนไหวกิจกรรมทางกายการเล่นเกมและการเล่นกีฬาไปใช้สร้างเสริมสุขภาพอย่างต่อเนื่อง เป็นระบบ');
INSERT INTO `bets_indicator` VALUES (1760, '2551050301', 9, '25510503010309', '๓. ร่วมกิจกรรมนันทนาการอย่างน้อย ๑กิจกรรม และนำหลักความรู้วิธีการไปขยายผลการเรียนรู้ให้กับผู้อื่น');
INSERT INTO `bets_indicator` VALUES (1761, '2551050301', 13, '25510503010113', '๑. วิเคราะห์ความคิดรวบยอดเกี่ยวกับการเคลื่อนไหวรูปแบบต่างๆ ในการเล่นกีฬา');
INSERT INTO `bets_indicator` VALUES (1762, '2551050301', 13, '25510503010213', '๒. ใช้ความสามารถของตนเพื่อเพิ่มศักยภาพของทีม คำนึงถึงผลที่เกิดต่อผู้อื่น และสังคม');
INSERT INTO `bets_indicator` VALUES (1763, '2551050301', 13, '25510503010313', '๓. เล่นกีฬาไทย กีฬาสากลประเภทบุคคล / คู่ กีฬาประเภททีมได้อย่างน้อย ๑ ชนิด');
INSERT INTO `bets_indicator` VALUES (1764, '2551050301', 13, '25510503010413', '๔. แสดงการเคลื่อนไหวได้อย่างสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (1765, '2551050301', 13, '25510503010513', '๕. เข้าร่วมกิจกรรมนันทนาการนอกโรงเรียน และนำหลักการแนวคิดไปปรับปรุงและพัฒนาคุณภาพชีวิตของตนและสังคม');
INSERT INTO `bets_indicator` VALUES (1766, '2551050302', 1, '25510503020101', '๑. ออกกำลังกายและเล่นเกมตามคำแนะนำอย่างสนุกสนาน');
INSERT INTO `bets_indicator` VALUES (1767, '2551050302', 1, '25510503020201', '๒. ปฏิบัติตนตามกฎ กติกาข้อตกลงในการเล่นเกมตามคำแนะนำ');
INSERT INTO `bets_indicator` VALUES (1768, '2551050302', 2, '25510503020102', '๑. ออกกำลังกายและเล่นเกมได้ด้วยตนเองอย่างสนุกสนาน');
INSERT INTO `bets_indicator` VALUES (1769, '2551050302', 2, '25510503020202', '๒.ปฏิบัติตามกฎ กติกาและข้อตกลงในการเล่นเกมเป็นกลุ่ม');
INSERT INTO `bets_indicator` VALUES (1770, '2551050302', 3, '25510503020103', '๑. เลือกออกกำลังกายการละเล่นพื้นเมืองและเล่นเกมที่เหมาะสมกับจุดเด่นจุดด้อยและข้อจำกัดของตนเอง');
INSERT INTO `bets_indicator` VALUES (1771, '2551050302', 3, '25510503020203', '๒. ปฏิบัติตามกฎ กติกาและข้อตกลงของการออกกำลังกายการเล่นเกมการละเล่นพื้นเมืองได้ด้วยตนเอง');
INSERT INTO `bets_indicator` VALUES (1772, '2551050302', 4, '25510503020104', '๑. ออกกำลังกายเล่นเกม และกีฬาที่ตนเองชอบและมีความสามารถในการวิเคราะห์ผลพัฒนาการของตนเองตามตัวอย่างและแบบปฏิบัติของผู้อื่น');
INSERT INTO `bets_indicator` VALUES (1773, '2551050302', 4, '25510503020204', '๒. ปฏิบัติตามกฎกติกาการเล่นกีฬาพื้นฐาน ตามชนิดกีฬาที่เล่น');
INSERT INTO `bets_indicator` VALUES (1774, '2551050302', 5, '25510503020105', '๑. ออกกำลังกายอย่างมีรูปแบบเล่นเกมที่ใช้ทักษะการคิดและตัดสินใจ');
INSERT INTO `bets_indicator` VALUES (1775, '2551050302', 5, '25510503020205', '๒. เล่นกีฬาที่ตนเองชอบอย่างสม่ำเสมอโดยสร้างทางเลือกในวิธีปฏิบัติของตนเองอย่างหลากหลายและมีน้ำใจนักกีฬา');
INSERT INTO `bets_indicator` VALUES (1776, '2551050302', 5, '25510503020305', '๓. ปฏิบัติตามกฎ กติกาการเล่นเกมกีฬาไทย และกีฬาสากลตามชนิดกีฬาที่เล่น');
INSERT INTO `bets_indicator` VALUES (1777, '2551050302', 5, '25510503020405', '๔. ปฏิบัติตนตามสิทธิของตนเองไม่ละเมิดสิทธิผู้อื่นและยอมรับในความแตกต่างระหว่างบุคคลในการเล่นเกมกีฬาไทยและกีฬาสากล');
INSERT INTO `bets_indicator` VALUES (1778, '2551050302', 6, '25510503020106', '๑. อธิบายประโยชน์และหลักการออกกำลังกายเพื่อสุขภาพสมรรถภาพทางกายและการสร้างเสริมบุคลิกภาพ');
INSERT INTO `bets_indicator` VALUES (1779, '2551050302', 6, '25510503020206', '๒. เล่นเกม ที่ใช้ทักษะการวางแผน และสามารถเพิ่มพูนทักษะการออกกำลังกายและเคลื่อนไหวอย่างเป็นระบบ');
INSERT INTO `bets_indicator` VALUES (1780, '2551050302', 6, '25510503020306', '๓. เล่นกีฬาที่ตนเองชื่นชอบและสามารถประเมินทักษะการเล่นของตนเป็นประจำ');
INSERT INTO `bets_indicator` VALUES (1781, '2551050302', 6, '25510503020406', '๔. ปฏิบัติตามกฎ กติกา ตามชนิดกีฬาที่เล่นโดยคำนึงถึงความปลอดภัยของตนเองและผู้อื่น');
INSERT INTO `bets_indicator` VALUES (1782, '2551050302', 6, '25510503020506', '๕. จำแนกกลวิธีการรุกการป้องกันและนำไปใช้ในการเล่นกีฬา');
INSERT INTO `bets_indicator` VALUES (1783, '2551050302', 6, '25510503020606', '๖. เล่นเกมและกีฬาด้วยความสามัคคีและมีน้ำใจนักกีฬา');
INSERT INTO `bets_indicator` VALUES (1784, '2551050302', 7, '25510503020107', '๑. อธิบายความสำคัญของการออกกำลังกายและเล่นกีฬาจนเป็นวิถีชีวิตที่มีสุขภาพดี');
INSERT INTO `bets_indicator` VALUES (1785, '2551050302', 7, '25510503020207', '๒. ออกกำลังกายและเลือกเข้าร่วมเล่นกีฬาตามความถนัดความสนใจอย่างเต็มความสามารถพร้อมทั้งมีการประเมินการเล่นของตนและผู้อื่น');
INSERT INTO `bets_indicator` VALUES (1786, '2551050302', 7, '25510503020307', '๓. ปฏิบัติตามกฎ กติกา และข้อตกลงตามชนิดกีฬาที่เลือกเล่น');
INSERT INTO `bets_indicator` VALUES (1787, '2551050302', 7, '25510503020407', '๔. วางแผนการรุกและการป้องกันในการเล่นกีฬาที่เลือกและนำไปใช้ในการเล่นอย่างเป็นระบบ');
INSERT INTO `bets_indicator` VALUES (1788, '2551050302', 7, '25510503020507', '๕. ร่วมมือในการเล่นกีฬาและการทำงานเป็นทีมอย่างสนุกสนาน');
INSERT INTO `bets_indicator` VALUES (1789, '2551050302', 7, '25510503020607', '๖. วิเคราะห์เปรียบเทียบและยอมรับความแตกต่างระหว่างวิธีการเล่นกีฬาของตนเองกับผู้อื่น');
INSERT INTO `bets_indicator` VALUES (1790, '2551050302', 8, '25510503020108', '๑. อธิบายสาเหตุการเปลี่ยนแปลงทางกาย จิตใจอารมณ์ สังคมและสติปัญญาที่เกิดจากการออกกำลังกายและเล่นกีฬาเป็นประจำจนเป็นวิถีชีวิต');
INSERT INTO `bets_indicator` VALUES (1791, '2551050302', 8, '25510503020208', '๒. เลือกเข้าร่วมออกกำลังกายเล่นกีฬาตามความถนัดความสนใจพร้อมทั้งวิเคราะห์ความแตกต่างระหว่างบุคคลเพื่อเป็นแนวทางในการพัฒนาตนเอง');
INSERT INTO `bets_indicator` VALUES (1792, '2551050302', 8, '25510503020308', '๓. มีวินัยปฏิบัติตามกฎกติกา และข้อตกลงในการเล่นกีฬาที่เลือก');
INSERT INTO `bets_indicator` VALUES (1793, '2551050302', 8, '25510503020408', '๔. วางแผนการรุกและการป้องกันในการเล่นกีฬาที่เลือกและนำไปใช้ในการเล่นอย่างเหมาะสมกับทีม');
INSERT INTO `bets_indicator` VALUES (1794, '2551050302', 8, '25510503020508', '๕. นำผลการปฏิบัติในการเล่นกีฬามาสรุปเป็นวิธีที่เหมาะสมกับตนเองด้วยความมุ่งมั่น');
INSERT INTO `bets_indicator` VALUES (1795, '2551050302', 9, '25510503020109', '๑. มีมารยาทในการเล่น และดูกีฬาด้วยความมีน้ำใจนักกีฬา');
INSERT INTO `bets_indicator` VALUES (1796, '2551050302', 9, '25510503020209', '๒.ออกกำลังกายและเล่นกีฬาอย่างสม่ำเสมอและนำแนวคิดหลักการจากการเล่นไปพัฒนาคุณภาพชีวิตของตนด้วยความภาคภูมิใจ');
INSERT INTO `bets_indicator` VALUES (1797, '2551050302', 9, '25510503020309', '๓. ปฏิบัติตนตามกฎ กติกาและข้อตกลงในการเล่นตามชนิดกีฬาที่เลือกและนำแนวคิดที่ได้ไปพัฒนาคุณภาพชีวิตของตนในสังคม');
INSERT INTO `bets_indicator` VALUES (1798, '2551050302', 9, '25510503020409', '๔. จำแนกกลวิธีการรุกการป้องกันและใช้ในการเล่นกีฬาที่เลือกและตัดสินใจเลือกวิธีที่เหมาะสมกับทีมไปใช้ได้ตามสถานการณ์ของการเล่น');
INSERT INTO `bets_indicator` VALUES (1799, '2551050302', 9, '25510503020509', '๕. เสนอผลการพัฒนาสุขภาพของตนเองที่เกิดจากการออกกำลังกาย และการเล่นกีฬาเป็นประจำ');
INSERT INTO `bets_indicator` VALUES (1800, '2551050302', 13, '25510503020113', '๑. ออกกำลังกายและเล่นกีฬาที่เหมาะสมกับตนเองอย่างสม่ำเสมอและใช้ความสามารถของตนเองเพิ่มศักยภาพของทีม ลดความเป็นตัวตนคำนึงถึงผลที่เกิดต่อสังคม');
INSERT INTO `bets_indicator` VALUES (1801, '2551050302', 13, '25510503020213', '๒. อธิบายและปฏิบัติเกี่ยวกับสิทธิกฎ กติกา กลวิธีต่างๆ ในระหว่างการเล่น การแข่งขันกีฬากับผู้อื่นและนำไปสรุปเป็นแนวปฏิบัติและใช้ในชีวิตประจำวันอย่างต่อเนื่อง');
INSERT INTO `bets_indicator` VALUES (1802, '2551050302', 13, '25510503020313', '๓.แสดงออกถึงการมีมารยาทในการดู การเล่นและการแข่งขันกีฬาด้วยความมีน้ำใจนักกีฬา และนำไปใช้ปฏิบัติทุกโอกาส จนเป็นบุคลิกภาพที่ดี');
INSERT INTO `bets_indicator` VALUES (1803, '2551050302', 13, '25510503020413', '๔. ร่วมกิจกรรมทางกายและเล่นกีฬาอย่างมีความสุข ชื่นชมในคุณค่าและความงามของการกีฬา');
INSERT INTO `bets_indicator` VALUES (1804, '2551050401', 1, '25510504010101', '๑. ปฏิบัติตนตามหลักสุขบัญญัติแห่งชาติตามคำแนะนำ');
INSERT INTO `bets_indicator` VALUES (1805, '2551050401', 1, '25510504010201', '๒. บอกอาการเจ็บป่วยที่เกิดขึ้นกับตนเอง');
INSERT INTO `bets_indicator` VALUES (1806, '2551050401', 1, '25510504010301', '๓. ปฏิบัติตนตามคำแนะนำเมื่อมีอาการเจ็บป่วย');
INSERT INTO `bets_indicator` VALUES (1807, '2551050401', 2, '25510504010102', '๑. บอกลักษณะของการมีสุขภาพดี');
INSERT INTO `bets_indicator` VALUES (1808, '2551050401', 2, '25510504010202', '๒. เลือกกินอาหารที่มีประโยชน์');
INSERT INTO `bets_indicator` VALUES (1809, '2551050401', 2, '25510504010302', '๓. ระบุของใช้และของเล่นที่มีผลเสียต่อสุขภาพ');
INSERT INTO `bets_indicator` VALUES (1810, '2551050401', 2, '25510504010402', '๔. อธิบายอาการและวิธีป้องกันการเจ็บป่วย การบาดเจ็บที่อาจเกิดขึ้น');
INSERT INTO `bets_indicator` VALUES (1811, '2551050401', 2, '25510504010502', '๕. ปฏิบัติตามคำแนะนำเมื่อมีอาการเจ็บป่วยและบาดเจ็บ');
INSERT INTO `bets_indicator` VALUES (1812, '2551050401', 3, '25510504010103', '๑. อธิบายการติดต่อและวิธีการป้องกันการแพร่กระจายของโรค');
INSERT INTO `bets_indicator` VALUES (1813, '2551050401', 3, '25510504010203', '๒. จำแนกอาหารหลัก๕ หมู่');
INSERT INTO `bets_indicator` VALUES (1814, '2551050401', 3, '25510504010303', '๓. เลือกกินอาหารที่หลากหลายครบ ๕ หมู่ในสัดส่วนที่เหมาะสม');
INSERT INTO `bets_indicator` VALUES (1815, '2551050401', 3, '25510504010403', '๔. แสดงวิธีแปรงฟันให้สะอาดอย่างถูกวิธี');
INSERT INTO `bets_indicator` VALUES (1816, '2551050401', 3, '25510504010503', '๕. สร้างเสริมสมรรถภาพทางกายได้ตามคำแนะนำ');
INSERT INTO `bets_indicator` VALUES (1817, '2551050401', 4, '25510504010104', '๑. อธิบายความสัมพันธ์ระหว่างสิ่งแวดล้อมกับสุขภาพ');
INSERT INTO `bets_indicator` VALUES (1818, '2551050401', 4, '25510504010204', '๒. อธิบายสภาวะอารมณ์ความรู้สึกที่มีผลต่อสุขภาพ');
INSERT INTO `bets_indicator` VALUES (1819, '2551050401', 4, '25510504010304', '๓. วิเคราะห์ข้อมูลบนฉลากอาหารและผลิตภัณฑ์สุขภาพเพื่อการเลือกบริโภค');
INSERT INTO `bets_indicator` VALUES (1820, '2551050401', 4, '25510504010404', '๔. ทดสอบและปรับปรุงสมรรถภาพทางกายตามผลการตรวจสอบสมรรถภาพทางกาย');
INSERT INTO `bets_indicator` VALUES (1821, '2551050401', 5, '25510504010105', '๑. แสดงพฤติกรรมที่เห็นความสำคัญของการปฏิบัติตนตามสุขบัญญัติแห่งชาติ');
INSERT INTO `bets_indicator` VALUES (1822, '2551050401', 5, '25510504010205', '๒. ค้นหาข้อมูลข่าวสารเพื่อใช้สร้างเสริมสุขภาพ');
INSERT INTO `bets_indicator` VALUES (1823, '2551050401', 5, '25510504010305', '๓. วิเคราะห์สื่อโฆษณาในการตัดสินใจเลือกซื้ออาหาร และผลิตภัณฑ์สุขภาพอย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (1824, '2551050401', 5, '25510504010405', '๔. ปฏิบัติตนในการป้องกันโรคที่พบบ่อยในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (1825, '2551050401', 5, '25510504010505', '๕. ทดสอบและปรับปรุงสมรรถภาพทางกายตามผลการทดสอบสมรรถภาพทางกาย');
INSERT INTO `bets_indicator` VALUES (1826, '2551050401', 6, '25510504010106', '๑. แสดงพฤติกรรมในการป้องกันและแก้ไขปัญหาสิ่งแวดล้อมที่มีผลต่อสุขภาพ');
INSERT INTO `bets_indicator` VALUES (1827, '2551050401', 6, '25510504010206', '๒. วิเคราะห์ผลกระทบที่เกิดจากการระบาดของโรคและเสนอแนวทางการป้องกันโรคติดต่อสำคัญที่พบในประเทศไทย');
INSERT INTO `bets_indicator` VALUES (1828, '2551050401', 6, '25510504010306', '๓. แสดงพฤติกรรมที่บ่งบอกถึงความรับผิดชอบต่อสุขภาพของส่วนรวม');
INSERT INTO `bets_indicator` VALUES (1829, '2551050401', 6, '25510504010406', '๔. สร้างเสริมและปรับปรุงสมรรถภาพทางกายเพื่อสุขภาพอย่างต่อเนื่อง');
INSERT INTO `bets_indicator` VALUES (1830, '2551050401', 7, '25510504010107', '๑. เลือกกินอาหารที่เหมาะสมกับวัย');
INSERT INTO `bets_indicator` VALUES (1831, '2551050401', 7, '25510504010207', '๒. วิเคราะห์ปัญหาที่เกิดจากภาวะโภชนาการที่มีผลกระทบต่อสุขภาพ');
INSERT INTO `bets_indicator` VALUES (1832, '2551050401', 7, '25510504010307', '๓. ควบคุมน้ำหนักของตนเองให้อยู่ในเกณฑ์มาตรฐาน');
INSERT INTO `bets_indicator` VALUES (1833, '2551050401', 7, '25510504010407', '๔. สร้างเสริมและปรับปรุงสมรรถภาพทางกายตามผลการทดสอบ');
INSERT INTO `bets_indicator` VALUES (1834, '2551050401', 8, '25510504010108', '๑. เลือกใช้บริการทางสุขภาพอย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (1835, '2551050401', 8, '25510504010208', '๒. วิเคราะห์ผลของการใช้เทคโนโลยีที่มีต่อสุขภาพ');
INSERT INTO `bets_indicator` VALUES (1836, '2551050401', 8, '25510504010308', '๓. วิเคราะห์ความเจริญก้าวหน้าทางการแพทย์ที่มีผลต่อสุขภาพ');
INSERT INTO `bets_indicator` VALUES (1837, '2551050401', 8, '25510504010408', '๔. วิเคราะห์ความสัมพันธ์ของภาวะสมดุลระหว่างสุขภาพกายและสุขภาพจิต');
INSERT INTO `bets_indicator` VALUES (1838, '2551050401', 8, '25510504010508', '๕. อธิบายลักษณะอาการเบื้องต้นของผู้มีปัญหาสุขภาพจิต');
INSERT INTO `bets_indicator` VALUES (1839, '2551050401', 8, '25510504010608', '๖. เสนอแนะวิธีปฏิบัติตน เพื่อจัดการกับอารมณ์และความเครียด');
INSERT INTO `bets_indicator` VALUES (1840, '2551050401', 8, '25510504010708', '๗. พัฒนาสมรรถภาพทางกายตนเองให้เป็นไปตามเกณฑ์ที่กำหนด');
INSERT INTO `bets_indicator` VALUES (1841, '2551050401', 9, '25510504010109', '๑. กำหนดรายการอาหารที่เหมาะสมกับวัยต่าง ๆ โดยคำนึงถึงความประหยัดและคุณค่าทางโภชนาการ');
INSERT INTO `bets_indicator` VALUES (1842, '2551050401', 9, '25510504010209', '๒. เสนอแนวทางป้องกันโรคที่เป็นสาเหตุสำคัญของการเจ็บป่วยและการตายของคนไทย');
INSERT INTO `bets_indicator` VALUES (1843, '2551050401', 9, '25510504010309', '๓. รวบรวมข้อมูลและเสนอแนวทางแก้ไขปัญหาสุขภาพในชุมชน');
INSERT INTO `bets_indicator` VALUES (1844, '2551050401', 9, '25510504010409', '๔. วางแผนและจัดเวลา ในการออกกำลังกายการพักผ่อนและการสร้างเสริมสมรรถภาพทางกาย');
INSERT INTO `bets_indicator` VALUES (1845, '2551050401', 9, '25510504010509', '๕. ทดสอบสมรรถภาพทางกาย และพัฒนาได้ตามความแตกต่างระหว่างบุคคล');
INSERT INTO `bets_indicator` VALUES (1846, '2551050401', 13, '25510504010113', '๑. วิเคราะห์บทบาทและความรับผิดชอบของบุคคลที่มีต่อการสร้างเสริมสุขภาพและการป้องกันโรคในชุมชน');
INSERT INTO `bets_indicator` VALUES (1847, '2551050401', 13, '25510504010213', '๒. วิเคราะห์ อิทธิพลของสื่อโฆษณาเกี่ยวกับสุขภาพเพื่อการเลือกบริโภค');
INSERT INTO `bets_indicator` VALUES (1848, '2551050401', 13, '25510504010313', '๓. ปฏิบัติตนตามสิทธิของผู้บริโภค');
INSERT INTO `bets_indicator` VALUES (1849, '2551050401', 13, '25510504010413', '๔. วิเคราะห์สาเหตุและเสนอแนวทางการป้องกันการเจ็บป่วยและการตายของคนไทย');
INSERT INTO `bets_indicator` VALUES (1850, '2551050401', 13, '25510504010513', '๕. วางแผนและปฏิบัติตามแผนการพัฒนาสุขภาพของตนเองและครอบครัว');
INSERT INTO `bets_indicator` VALUES (1851, '2551050401', 13, '25510504010613', '๖. มีส่วนร่วมในการส่งเสริม และพัฒนาสุขภาพในชุมชน');
INSERT INTO `bets_indicator` VALUES (1852, '2551050401', 13, '25510504010713', '๗. วางแผนและปฏิบัติตามแผนการพัฒนาสมรรถภาพทางกายและสมรรถภาพทางกลไก');
INSERT INTO `bets_indicator` VALUES (1853, '2551050501', 1, '25510505010101', '๑. ระบุสิ่งที่ทำให้เกิดอันตรายที่บ้านโรงเรียน และการป้องกัน');
INSERT INTO `bets_indicator` VALUES (1854, '2551050501', 1, '25510505010201', '๒. บอกสาเหตุและการป้องกันอันตรายที่เกิดจากการเล่น');
INSERT INTO `bets_indicator` VALUES (1855, '2551050501', 1, '25510505010301', '๓. แสดงคำพูดหรือท่าทางขอความช่วยเหลือจากผู้อื่นเมื่อเกิดเหตุร้าย ที่บ้านและโรงเรียน');
INSERT INTO `bets_indicator` VALUES (1856, '2551050501', 2, '25510505010102', '๑. ปฏิบัติตนในการป้องกันอุบัติเหตุที่อาจเกิดขึ้นทางน้ำและทางบก');
INSERT INTO `bets_indicator` VALUES (1857, '2551050501', 2, '25510505010202', '๒. บอกชื่อยาสามัญประจำบ้าน และใช้ยาตามคำแนะนำ');
INSERT INTO `bets_indicator` VALUES (1858, '2551050501', 2, '25510505010302', '๓. ระบุโทษของสารเสพติดสารอันตรายใกล้ตัวและวิธีการป้องกัน');
INSERT INTO `bets_indicator` VALUES (1859, '2551050501', 2, '25510505010402', '๔. ปฏิบัติตนตามสัญลักษณ์และป้ายเตือนของสิ่งของหรือสถานที่ที่เป็นอันตราย');
INSERT INTO `bets_indicator` VALUES (1860, '2551050501', 2, '25510505010502', '๕. อธิบายสาเหตุ อันตรายวิธีป้องกันอัคคีภัยและแสดงการหนีไฟ');
INSERT INTO `bets_indicator` VALUES (1861, '2551050501', 3, '25510505010103', '๑. ปฏิบัติตนเพื่อความปลอดภัยจากอุบัติเหตุในบ้านโรงเรียน และการเดินทาง');
INSERT INTO `bets_indicator` VALUES (1862, '2551050501', 3, '25510505010203', '๒. แสดงวิธีขอความช่วยเหลือจากบุคคลและแหล่งต่าง ๆ เมื่อเกิดเหตุร้าย หรืออุบัติเหตุ');
INSERT INTO `bets_indicator` VALUES (1863, '2551050501', 3, '25510505010303', '๓. แสดงวิธีปฐมพยาบาลเมื่อบาดเจ็บจากการเล่น');
INSERT INTO `bets_indicator` VALUES (1864, '2551050501', 4, '25510505010104', '๑. อธิบายความสำคัญของการใช้ยาและใช้ยาอย่างถูกวิธี');
INSERT INTO `bets_indicator` VALUES (1865, '2551050501', 4, '25510505010204', '๒. แสดงวิธีปฐมพยาบาลเมื่อได้รับอันตรายจากการใช้ยาผิดสารเคมี แมลงสัตว์กัดต่อยและการบาดเจ็บจากการเล่นกีฬา');
INSERT INTO `bets_indicator` VALUES (1866, '2551050501', 4, '25510505010304', '๓. วิเคราะห์ผลเสียของการสูบบุหรี่ และการดื่มสุราที่มีต่อสุขภาพและการป้องกัน');
INSERT INTO `bets_indicator` VALUES (1867, '2551050501', 5, '25510505010105', '๑. วิเคราะห์ปัจจัยที่มีอิทธิพลต่อการใช้สารเสพติด');
INSERT INTO `bets_indicator` VALUES (1868, '2551050501', 5, '25510505010205', '๒. วิเคราะห์ผลกระทบของการใช้ยา และสารเสพติด ที่มีผลต่อร่างกายจิตใจ อารมณ์สังคม และสติปัญญา');
INSERT INTO `bets_indicator` VALUES (1869, '2551050501', 5, '25510505010305', '๓. ปฏิบัติตนเพื่อความปลอดภัยจากการใช้ยา และหลีกเลี่ยงสารเสพติด');
INSERT INTO `bets_indicator` VALUES (1870, '2551050501', 5, '25510505010405', '๔. วิเคราะห์อิทธิพลของสื่อที่มีต่อพฤติกรรมสุขภาพ');
INSERT INTO `bets_indicator` VALUES (1871, '2551050501', 5, '25510505010505', '๕. ปฏิบัติตนเพื่อป้องกันอันตรายจากการเล่นกีฬา');
INSERT INTO `bets_indicator` VALUES (1872, '2551050501', 6, '25510505010106', '๑. วิเคราะห์ผลกระทบจากความรุนแรงของภัยธรรมชาติที่มีต่อร่างกาย จิตใจและสังคม');
INSERT INTO `bets_indicator` VALUES (1873, '2551050501', 6, '25510505010206', '๒. ระบุวิธีปฏิบัติตน เพื่อความปลอดภัยจากภัยธรรมชาติ');
INSERT INTO `bets_indicator` VALUES (1874, '2551050501', 6, '25510505010306', '๓. วิเคราะห์สาเหตุของการติดสารเสพติดและชักชวนให้ผู้อื่นหลีกเลี่ยงสารเสพติด');
INSERT INTO `bets_indicator` VALUES (1875, '2551050501', 7, '25510505010107', '๑. แสดงวิธีปฐมพยาบาลและเคลื่อนย้ายผู้ป่วยอย่างปลอดภัย');
INSERT INTO `bets_indicator` VALUES (1876, '2551050501', 7, '25510505010207', '๒. อธิบายลักษณะอาการของผู้ติดสารเสพติดและการป้องกันการติดสารเสพติด');
INSERT INTO `bets_indicator` VALUES (1877, '2551050501', 7, '25510505010307', '๓. อธิบายความสัมพันธ์ของการใช้สารเสพติดกับการเกิดโรคและอุบัติเหตุ');
INSERT INTO `bets_indicator` VALUES (1878, '2551050501', 7, '25510505010407', '๔. แสดงวิธีการชักชวนผู้อื่นให้ลด ละ เลิกสารเสพติดโดยใช้ทักษะต่าง ๆ');
INSERT INTO `bets_indicator` VALUES (1879, '2551050501', 8, '25510505010108', '๑. ระบุวิธีการปัจจัยและแหล่งที่ช่วยเหลือฟื้นฟูผู้ติดสารเสพติด');
INSERT INTO `bets_indicator` VALUES (1880, '2551050501', 8, '25510505010208', '๒. อธิบายวิธีการหลีกเลี่ยงพฤติกรรมเสี่ยงและสถานการณ์เสี่ยง');
INSERT INTO `bets_indicator` VALUES (1881, '2551050501', 8, '25510505010308', '๓. ใช้ทักษะชีวิตในการป้องกันตนเองและหลีกเลี่ยงสถานการณ์ คับขันที่อาจนำไปสู่อันตราย');
INSERT INTO `bets_indicator` VALUES (1882, '2551050501', 9, '25510505010109', '๑. วิเคราะห์ปัจจัยเสี่ยง และพฤติกรรมเสี่ยงที่มีผลต่อสุขภาพและแนวทางป้องกัน');
INSERT INTO `bets_indicator` VALUES (1883, '2551050501', 9, '25510505010209', '๒. หลีกเลี่ยงการใช้ความรุนแรงและชักชวนเพื่อนให้หลีกเลี่ยงการใช้ความรุนแรงในการแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (1884, '2551050501', 9, '25510505010309', '๓. วิเคราะห์อิทธิพลของสื่อต่อพฤติกรรมสุขภาพและความรุนแรง');
INSERT INTO `bets_indicator` VALUES (1885, '2551050501', 9, '25510505010409', '๔. วิเคราะห์ความสัมพันธ์ของการดื่มเครื่องดื่มที่มีแอลกอฮอล์ต่อสุขภาพและการเกิดอุบัติเหตุ');
INSERT INTO `bets_indicator` VALUES (1886, '2551050501', 9, '25510505010509', '๕. แสดงวิธีการช่วยฟื้นคืนชีพอย่างถูกวิธี');
INSERT INTO `bets_indicator` VALUES (1887, '2551050501', 13, '25510505010113', '๑. มีส่วนร่วมในการป้องกันความเสี่ยงต่อการใช้ยา การใช้สารเสพติดและความรุนแรง เพื่อสุขภาพของตนเอง ครอบครัว และสังคม');
INSERT INTO `bets_indicator` VALUES (1888, '2551050501', 13, '25510505010213', '๒. วิเคราะห์ผลกระทบที่เกิดจากการครอบครอง การใช้และการจำหน่ายสารเสพติด');
INSERT INTO `bets_indicator` VALUES (1889, '2551050501', 13, '25510505010313', '๓. วิเคราะห์ปัจจัยที่มีผลต่อสุขภาพหรือความรุนแรงของคนไทยและเสนอแนวทางป้องกัน');
INSERT INTO `bets_indicator` VALUES (1890, '2551050501', 13, '25510505010413', '๔. วางแผนกำหนดแนวทางลดอุบัติเหตุ และสร้างเสริมความปลอดภัยในชุมชน');
INSERT INTO `bets_indicator` VALUES (1891, '2551050501', 13, '25510505010513', '๕. มีส่วนร่วมในการสร้างเสริมความปลอดภัยในชุมชน');
INSERT INTO `bets_indicator` VALUES (1892, '2551050501', 13, '25510505010613', '๖. ใช้ทักษะการตัดสินใจแก้ปัญหาในสถานการณ์ที่เสี่ยงต่อสุขภาพและความรุนแรง');
INSERT INTO `bets_indicator` VALUES (1893, '2551050501', 13, '25510505010713', '๗. แสดงวิธีการช่วยฟื้นคืนชีพอย่างถูกวิธี');
INSERT INTO `bets_indicator` VALUES (1894, '2551070101', 1, '25510701010101', '๑. บอกวิธีการทำงานเพื่อช่วยเหลือตนเอง');
INSERT INTO `bets_indicator` VALUES (1895, '2551070101', 1, '25510701010201', '๒. ใช้วัสดุอุปกรณ์และเครื่องมือง่ายๆในการทำงานอย่างปลอดภัย');
INSERT INTO `bets_indicator` VALUES (1896, '2551070101', 1, '25510701010301', '๓. ทำงานเพื่อช่วยเหลือตนเองอย่างกระตือรือร้นและตรงเวลา');
INSERT INTO `bets_indicator` VALUES (1897, '2551070101', 2, '25510701010102', '๑. บอกวิธีการและประโยชน์การทำงานเพื่อช่วยเหลือตนเองและครอบครัว');
INSERT INTO `bets_indicator` VALUES (1898, '2551070101', 2, '25510701010202', '๒. ใช้วัสดุอุปกรณ์และเครื่องมือในการทำงานอย่างเหมาะสมกับงานและประหยัด');
INSERT INTO `bets_indicator` VALUES (1899, '2551070101', 2, '25510701010302', '๓. ทำงานเพื่อช่วยเหลือตนเองและครอบครัวอย่างปลอดภัย');
INSERT INTO `bets_indicator` VALUES (1900, '2551070101', 3, '25510701010103', '๑.อธิบายวิธีการและประโยชน์การทำงานเพื่อช่วยเหลือตนเอง ครอบครัวและส่วนรวม');
INSERT INTO `bets_indicator` VALUES (1901, '2551070101', 3, '25510701010203', '๒ ใช้วัสดุอุปกรณ์และเครื่องมือตรงกับลักษณะงาน');
INSERT INTO `bets_indicator` VALUES (1902, '2551070101', 3, '25510701010303', '๓. ทำงานอย่างเป็นขั้นตอนตามกระบวนการทำงานด้วยความสะอาดความรอบคอบและอนุรักษ์สิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1903, '2551070101', 4, '25510701010104', '๑. อธิบายเหตุผลในการทำงานให้บรรลุเป้าหมาย');
INSERT INTO `bets_indicator` VALUES (1904, '2551070101', 4, '25510701010204', '๒. ทำงานบรรลุเป้าหมายที่วางไว้อย่างเป็นขั้นตอนด้วยความขยันอดทนรับผิดชอบและซื่อสัตย์');
INSERT INTO `bets_indicator` VALUES (1905, '2551070101', 4, '25510701010304', '๓. ปฏิบัติตนอย่างมีมารยาทในการทำงาน');
INSERT INTO `bets_indicator` VALUES (1906, '2551070101', 4, '25510701010404', '๔. ใช้พลังงานและทรัพยากรในการทำงานอย่างประหยัดและคุ้มค่า');
INSERT INTO `bets_indicator` VALUES (1907, '2551070101', 5, '25510701010105', '๑.อธิบายเหตุผลในการทำงานแต่ละขั้นตอนถูกต้องตามกระบวนการทำงาน');
INSERT INTO `bets_indicator` VALUES (1908, '2551070101', 5, '25510701010205', '๒. ใช้ทักษะการจัดการในการทำงานอย่างเป็นระบบประณีตและมีความคิดสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (1909, '2551070101', 5, '25510701010305', '๓. ปฏิบัติตนอย่างมีมารยาทในการทำงานกับสมาชิกในครอบครัว');
INSERT INTO `bets_indicator` VALUES (1910, '2551070101', 5, '25510701010405', '๔.มีจิตสำนึกในการใช้พลังงานและทรัพยากรอย่างประหยัดและคุ้มค่า');
INSERT INTO `bets_indicator` VALUES (1911, '2551070101', 6, '25510701010106', '๑. อภิปรายแนวทางในการทำงานและปรับปรุงการทำงานแต่ละขั้นตอน');
INSERT INTO `bets_indicator` VALUES (1912, '2551070101', 6, '25510701010206', '๒. ใช้ทักษะการจัดการในการทำงานและทักษะการทำงานร่วมกัน');
INSERT INTO `bets_indicator` VALUES (1913, '2551070101', 6, '25510701010306', '๓. ปฏิบัติตนอย่างมีมารยาทในการทำงานกับครอบครัวและผู้อื่น');
INSERT INTO `bets_indicator` VALUES (1914, '2551070101', 7, '25510701010107', '๑. วิเคราะห์ขั้นตอนการทำงานตามกระบวนการทำงาน');
INSERT INTO `bets_indicator` VALUES (1915, '2551070101', 7, '25510701010207', '๒. ใช้กระบวนการกลุ่มในการทำงานด้วยความเสียสละ');
INSERT INTO `bets_indicator` VALUES (1916, '2551070101', 7, '25510701010307', '๓. ตัดสินใจแก้ปัญหาการทำงานอย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (1917, '2551070101', 8, '25510701010108', '๑. ใช้ทักษะการแสวงหาความรู้ เพื่อพัฒนาการทำงาน');
INSERT INTO `bets_indicator` VALUES (1918, '2551070101', 8, '25510701010208', '๒. ใช้ทักษะกระบวนการแก้ปัญหาในการทำงาน');
INSERT INTO `bets_indicator` VALUES (1919, '2551070101', 8, '25510701010308', '๓. มีจิตสำนึกในการทำงานและใช้ทรัพยากรในการปฏิบัติงานอย่างประหยัดและคุ้มค่า');
INSERT INTO `bets_indicator` VALUES (1920, '2551070101', 9, '25510701010109', '๑. อภิปรายขั้นตอนการทำงานที่มีประสิทธิภาพ');
INSERT INTO `bets_indicator` VALUES (1921, '2551070101', 9, '25510701010209', '๒. ใช้ทักษะในการทำงานร่วมกันอย่างมีคุณธรรม');
INSERT INTO `bets_indicator` VALUES (1922, '2551070101', 9, '25510701010309', '๓. อภิปรายการทำงานโดยใช้ทักษะการจัดการเพื่อการประหยัดพลังงานทรัพยากร และสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1923, '2551070101', 13, '25510701010113', '๑. อธิบายวิธีการทำงานเพื่อการดำรงชีวิต');
INSERT INTO `bets_indicator` VALUES (1924, '2551070101', 13, '25510701010213', '๒. สร้างผลงานอย่างมีความคิดสร้างสรรค์และมีทักษะการทำงานร่วมกัน');
INSERT INTO `bets_indicator` VALUES (1925, '2551070101', 13, '25510701010313', '๓. มีทักษะการจัดการในการทำงาน');
INSERT INTO `bets_indicator` VALUES (1926, '2551070101', 13, '25510701010413', '๔. มีทักษะ กระบวนการแก้ปัญหาในการทำงาน');
INSERT INTO `bets_indicator` VALUES (1927, '2551070101', 13, '25510701010513', '๕ มีทักษะในการแสวงหาความรู้เพื่อการดำรงชีวิต');
INSERT INTO `bets_indicator` VALUES (1928, '2551070101', 13, '25510701010613', '๖. มีคุณธรรมและลักษณะนิสัยในการทำงาน');
INSERT INTO `bets_indicator` VALUES (1929, '2551070101', 13, '25510701010713', '๗.ใช้พลังงาน ทรัพยากรในการทำงานอย่างคุ้มค่าและยั่งยืนเพื่อการอนุรักษ์สิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1931, '2551070201', 2, '25510702010102', '๑. บอกประโยชน์ของสิ่งของเครื่องใช้ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (1932, '2551070201', 2, '25510702010202', '๒. สร้างของเล่นของใช้อย่างง่ายโดยกำหนดปัญหาหรือความต้องการรวบรวมข้อมูลออกแบบโดยถ่ายทอดความคิดเป็นภาพร่าง๒ มิติ ลงมือสร้าง และประเมินผล');
INSERT INTO `bets_indicator` VALUES (1933, '2551070201', 2, '25510702010302', '๓. นำความรู้เกี่ยวกับการใช้อุปกรณ์เครื่องมือที่ถูกวิธีไปประยุกต์ใช้ในการสร้างของเล่น ของใช้อย่างง่าย');
INSERT INTO `bets_indicator` VALUES (1934, '2551070201', 2, '25510702010402', '๔. มีความคิดสร้างสรรค์อย่างน้อย๑ ลักษณะในการแก้ปัญหาหรือสนองความต้องการ');
INSERT INTO `bets_indicator` VALUES (1935, '2551070201', 3, '25510702010103', '๑. สร้างของเล่นของใช้อย่างง่ายโดยกำหนดปัญหาหรือความต้องการรวบรวมข้อมูลออกแบบโดยถ่ายทอดความคิดเป็นภาพร่าง ๒ มิติลงมือสร้าง และประเมินผล');
INSERT INTO `bets_indicator` VALUES (1936, '2551070201', 3, '25510702010203', '๒. เลือกใช้สิ่งของเครื่องใช้ในชีวิตประจำวันอย่างสร้างสรรค์');
INSERT INTO `bets_indicator` VALUES (1937, '2551070201', 3, '25510702010303', '๓. มีการจัดการสิ่งของเครื่องใช้ด้วยการนำกลับมาใช้ซ้ำ');
INSERT INTO `bets_indicator` VALUES (1946, '2551070201', 5, '25510702010405', '๔. มีความคิดสร้างสรรค์อย่างน้อย๒ ลักษณะในการแก้ปัญหาหรือสนองความต้องการ');
INSERT INTO `bets_indicator` VALUES (1947, '2551070201', 5, '25510702010505', '๕. เลือกใช้เทคโนโลยีในชีวิตประจำวันอย่างสร้างสรรค์ต่อชีวิต สังคม และมีการจัดการ สิ่งของเครื่องใช้ ด้วยการแปรรูป แล้วนำกลับมา ใช้ใหม่');
INSERT INTO `bets_indicator` VALUES (1945, '2551070201', 5, '25510702010305', '๓. นำความรู้และทักษะการสร้างชิ้นงานไปประยุกต์ในการสร้างสิ่งของเครื่องใช้');
INSERT INTO `bets_indicator` VALUES (1943, '2551070201', 5, '25510702010105', '๑. อธิบายความหมายและวิวัฒนาการของเทคโนโลยี');
INSERT INTO `bets_indicator` VALUES (1944, '2551070201', 5, '25510702010205', '๒. สร้างสิ่งของเครื่องใช้ตามความสนใจอย่างปลอดภัยโดยกำหนดปัญหา หรือความต้องการรวบรวมข้อมูลเลือกวิธีการออกแบบโดยถ่ายทอดความคิดเป็นภาพร่าง ๓ มิติลงมือสร้าง และประเมินผล');
INSERT INTO `bets_indicator` VALUES (1948, '2551070201', 6, '25510702010106', '๑. อธิบายส่วนประกอบของระบบเทคโนโลยี');
INSERT INTO `bets_indicator` VALUES (1949, '2551070201', 6, '25510702010206', '๒. สร้างสิ่งของเครื่องใช้ตามความสนใจอย่างปลอดภัยโดยกำหนดปัญหาหรือความต้องการรวบรวมข้อมูลเลือกวิธีการออกแบบโดยถ่ายทอดความคิดเป็นภาพร่าง ๓ มิติหรือแผนที่ความคิดลงมือสร้าง และประเมินผล');
INSERT INTO `bets_indicator` VALUES (1950, '2551070201', 6, '25510702010306', '๓. นำความรู้และทักษะการสร้างชิ้นงานไปประยุกต์ในการสร้างสิ่งของเครื่องใช้');
INSERT INTO `bets_indicator` VALUES (1951, '2551070201', 8, '25510702010108', '๑. อธิบายกระบวนการเทคโนโลยี');
INSERT INTO `bets_indicator` VALUES (1952, '2551070201', 8, '25510702010208', '๒. สร้างสิ่งของเครื่องใช้หรือวิธีการ ตามกระบวนการเทคโนโลยีอย่างปลอดภัยออกแบบโดยถ่ายทอดความคิดเป็นภาพร่าง ๓ มิติหรือภาพฉาย เพื่อนำไปสู่ การสร้างต้นแบบของสิ่งของเครื่องใช้หรือ ถ่ายทอดความคิดของวิธีการเป็นแบบจำลองความคิดและการรายงานผลเพื่อนำเสนอวิธีการ');
INSERT INTO `bets_indicator` VALUES (1953, '2551070201', 8, '25510702010308', '๓. มีความคิดสร้างสรรค์ในการแก้ปัญหาหรือสนองความต้องการในงานที่ผลิตเอง');
INSERT INTO `bets_indicator` VALUES (1954, '2551070201', 8, '25510702010408', '๔. เลือกใช้เทคโนโลยีอย่างสร้างสรรค์ต่อชีวิต สังคมสิ่งแวดล้อม และมีการจัดการเทคโนโลยีด้วยการลดการใช้ทรัพยากร หรือเลือกใช้เทคโนโลยี ที่ไม่มีผลกระทบ ต่อสิ่งแวดล้อม');
INSERT INTO `bets_indicator` VALUES (1955, '2551070201', 9, '25510702010109', '๑. อธิบายระดับของเทคโนโลยี');
INSERT INTO `bets_indicator` VALUES (1956, '2551070201', 9, '25510702010209', '๒. สร้างสิ่งของเครื่องใช้หรือวิธีการ ตามกระบวนการเทคโนโลยี อย่างปลอดภัย ออกแบบโดยถ่ายทอดความคิดเป็นภาพฉาย เพื่อนำไปสู่การสร้างต้นแบบ และแบบจำลองของสิ่งของเครื่องใช้หรือถ่ายทอดความคิดของวิธีการเป็นแบบจำลองความคิดและการรายงานผล');
INSERT INTO `bets_indicator` VALUES (1957, '2551070201', 13, '25510702010113', '๑. อธิบายและเชื่อมโยงความสัมพันธ์ระหว่างเทคโนโลยีกับศาสตร์อื่นๆ');
INSERT INTO `bets_indicator` VALUES (1958, '2551070201', 13, '25510702010213', '๒. วิเคราะห์ระบบเทคโนโลยี');
INSERT INTO `bets_indicator` VALUES (1959, '2551070201', 13, '25510702010313', '๓. สร้างและพัฒนาสิ่งของเครื่องใช้หรือวิธีการ ตามกระบวนการเทคโนโลยีอย่างปลอดภัยโดยถ่ายทอดความคิดเป็นภาพฉายและแบบจำลองเพื่อนำไปสู่การสร้างชิ้นงาน หรือถ่ายทอดความคิดของวิธีการเป็นแบบจำลองความคิดและการรายงานผลโดยใช้ซอฟแวร์ช่วยในการออกแบบหรือนำเสนอผลงาน');
INSERT INTO `bets_indicator` VALUES (1960, '2551070201', 13, '25510702010413', '๔. มีความคิดสร้างสรรค์ในการแก้ปัญหาหรือสนองความต้องการในงานที่ผลิตเอง หรือการพัฒนาผลิตภัณฑ์ที่ผู้อื่นผลิต');
INSERT INTO `bets_indicator` VALUES (1961, '2551070201', 13, '25510702010513', '๕.วิเคราะห์และเลือกใช้เทคโนโลยีที่เหมาะสมกับชีวิตประจำวันอย่างสร้างสรรค์ต่อชีวิต สังคม และสิ่งแวดล้อมและมีการจัดการเทคโนโลยีที่ยั่งยืนด้วยวิธีการของเทคโนโลยีสะอาด');
INSERT INTO `bets_indicator` VALUES (1962, '2551070301', 1, '25510703010101', '๑. บอกข้อมูลที่สนใจและแหล่งข้อมูลที่อยู่ใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (1963, '2551070301', 1, '25510703010201', '๒. บอกประโยชน์ของอุปกรณ์เทคโนโลยีสารสนเทศ');
INSERT INTO `bets_indicator` VALUES (1964, '2551070301', 2, '25510703010102', '๑. บอกประโยชน์ของข้อมูลและรวบรวมข้อมูลที่สนใจจากแหล่งข้อมูลต่างๆที่เชื่อถือได้');
INSERT INTO `bets_indicator` VALUES (1965, '2551070301', 2, '25510703010202', '๒. บอกประโยชน์และการรักษาแหล่งข้อมูล');
INSERT INTO `bets_indicator` VALUES (1967, '2551070301', 3, '25510703010103', '๑. ค้นหาข้อมูลอย่างมีขั้นตอนและนำเสนอข้อมูลในลักษณะต่างๆ');
INSERT INTO `bets_indicator` VALUES (1968, '2551070301', 3, '25510703010203', '๒. บอกวิธีดูแลและรักษาอุปกรณ์เทคโนโลยีสารสนเทศ');
INSERT INTO `bets_indicator` VALUES (1969, '2551070301', 4, '25510703010104', '๑. บอกชื่อและหน้าที่ของอุปกรณ์เทคโนโลยีสารสนเทศ');
INSERT INTO `bets_indicator` VALUES (1970, '2551070301', 4, '25510703010204', '๒. บอกหลักการทำงานเบื้องต้นของคอมพิวเตอร์');
INSERT INTO `bets_indicator` VALUES (1971, '2551070301', 4, '25510703010304', '๓. บอกประโยชน์และโทษจากการใช้งานคอมพิวเตอร์');
INSERT INTO `bets_indicator` VALUES (1972, '2551070301', 4, '25510703010404', '๔. ใช้ระบบปฏิบัติการคอมพิวเตอร์เพื่อการทำงาน');
INSERT INTO `bets_indicator` VALUES (1973, '2551070301', 4, '25510703010504', '๕. สร้างภาพหรือชิ้นงานจากจินตนาการโดยใช้โปรแกรมกราฟิกด้วยความรับผิดชอบ');
INSERT INTO `bets_indicator` VALUES (1974, '2551070301', 5, '25510703010105', '๑. ค้นหา รวบรวมข้อมูลที่สนใจและเป็นประโยชน์จากแหล่งข้อมูลต่างๆ ที่เชื่อถือได้ตรงตามวัตถุประสงค์');
INSERT INTO `bets_indicator` VALUES (1975, '2551070301', 5, '25510703010205', '๒. สร้างงานเอกสารเพื่อใช้ประโยชน์ในชีวิตประจำวันด้วยความรับผิดชอบ');
INSERT INTO `bets_indicator` VALUES (1976, '2551070301', 6, '25510703010106', '๑. บอกหลักการเบื้องต้นของการแก้ปัญหา');
INSERT INTO `bets_indicator` VALUES (1977, '2551070301', 6, '25510703010206', '๒. ใช้คอมพิวเตอร์ในการค้นหาข้อมูล');
INSERT INTO `bets_indicator` VALUES (1978, '2551070301', 6, '25510703010306', '๓. เก็บรักษาข้อมูลที่เป็นประโยชน์ในรูปแบบต่างๆ');
INSERT INTO `bets_indicator` VALUES (1979, '2551070301', 6, '25510703010406', '๔. นำเสนอข้อมูลในรูปแบบที่เหมาะสมโดยเลือกใช้ซอฟต์แวร์ประยุกต์');
INSERT INTO `bets_indicator` VALUES (1980, '2551070301', 6, '25510703010506', '๕. ใช้คอมพิวเตอร์ช่วยสร้างชิ้นงานจากจินตนาการหรืองานที่ทำในชีวิตประจำวันอย่างมีจิตสำนึกและความรับผิดชอบ');
INSERT INTO `bets_indicator` VALUES (1981, '2551070301', 7, '25510703010107', '๑. อธิบายหลักการทำงาน บทบาทและประโยชน์ของคอมพิวเตอร์');
INSERT INTO `bets_indicator` VALUES (1982, '2551070301', 7, '25510703010207', '๒. อภิปรายลักษณะสำคัญและผลกระทบของเทคโนโลยีสารสนเทศ');
INSERT INTO `bets_indicator` VALUES (1983, '2551070301', 7, '25510703010307', '๓. ประมวลผลข้อมูลให้เป็นสารสนเทศ');
INSERT INTO `bets_indicator` VALUES (1984, '2551070301', 8, '25510703010108', '๑. อธิบายหลักการเบื้องต้นของการสื่อสารข้อมูลและเครือข่ายคอมพิวเตอร์');
INSERT INTO `bets_indicator` VALUES (1985, '2551070301', 8, '25510703010208', '๒. อธิบายหลักการและวิธีการแก้ปัญหาด้วยกระบวนการเทคโนโลยีสารสนเทศ');
INSERT INTO `bets_indicator` VALUES (1986, '2551070301', 8, '25510703010308', '๓. ค้นหาข้อมูลและติดต่อสื่อสารผ่านเครือข่ายคอมพิวเตอร์อย่างมีคุณธรรมและจริยธรรม');
INSERT INTO `bets_indicator` VALUES (1987, '2551070301', 8, '25510703010408', '๔. ใช้ซอฟต์แวร์ในการทำงาน');
INSERT INTO `bets_indicator` VALUES (1988, '2551070301', 9, '25510703010109', '๑. อธิบายหลักการทำโครงงานที่มีการใช้เทคโนโลยีสารสนเทศ');
INSERT INTO `bets_indicator` VALUES (1989, '2551070301', 9, '25510703010209', '๒. เขียนโปรแกรมภาษาขั้นพื้นฐาน');
INSERT INTO `bets_indicator` VALUES (1990, '2551070301', 9, '25510703010309', '๓. ใช้เทคโนโลยีสารสนเทศนำเสนองานในรูปแบบที่เหมาะสมกับลักษณะงาน');
INSERT INTO `bets_indicator` VALUES (1991, '2551070301', 9, '25510703010409', '๔. ใช้คอมพิวเตอร์ช่วยสร้างชิ้นงานจากจินตนาการหรืองานที่ทำในชีวิตประจำวันตามหลักการทำโครงงานอย่างมีจิตสำนึกและความรับผิดชอบ');
INSERT INTO `bets_indicator` VALUES (1993, '2551070301', 13, '25510703010113', '๑. อธิบายองค์ประกอบของระบบสารสนเทศ');
INSERT INTO `bets_indicator` VALUES (1994, '2551070301', 13, '25510703010213', '๒. อธิบายองค์ประกอบและหลักการทำงานของคอมพิวเตอร์');
INSERT INTO `bets_indicator` VALUES (1995, '2551070301', 13, '25510703010313', '๓. อธิบายระบบสื่อสารข้อมูล สำหรับเครือข่ายคอมพิวเตอร์');
INSERT INTO `bets_indicator` VALUES (1996, '2551070301', 13, '25510703010413', '๔. บอกคุณลักษณะของคอมพิวเตอร์และอุปกรณ์ต่อพ่วง');
INSERT INTO `bets_indicator` VALUES (1997, '2551070301', 13, '25510703010513', '๕. แก้ปัญหาด้วยกระบวนการเทคโนโลยีสารสนเทศอย่างมีประสิทธิภาพ');
INSERT INTO `bets_indicator` VALUES (1998, '2551070301', 13, '25510703010613', '๖. เขียนโปรแกรมภาษา');
INSERT INTO `bets_indicator` VALUES (2001, '2551070301', 13, '25510703010713', '๗. พัฒนาโครงงานคอมพิวเตอร์');
INSERT INTO `bets_indicator` VALUES (2002, '2551070301', 13, '25510703010813', '๘. ใช้ฮาร์ดแวร์และซอฟต์แวร์ให้เหมาะสมกับงาน');
INSERT INTO `bets_indicator` VALUES (2003, '2551070301', 13, '25510703010913', '๙. ติดต่อสื่อสาร ค้นหาข้อมูลผ่านอินเทอร์เน็ต');
INSERT INTO `bets_indicator` VALUES (2004, '2551070301', 13, '25510703011013', '๑๐. ใช้คอมพิวเตอร์ในการประมวลผลข้อมูลให้เป็นสารสนเทศ เพื่อประกอบการตัดสินใจ');
INSERT INTO `bets_indicator` VALUES (2005, '2551070301', 13, '25510703011113', '๑๑. ใช้เทคโนโลยีสารสนเทศนำเสนองาน ในรูปแบบที่เหมาะสม ตรงตามวัตถุประสงค์ของงาน');
INSERT INTO `bets_indicator` VALUES (2006, '2551070301', 13, '25510703011213', '๑๒. ใช้คอมพิวเตอร์ช่วยสร้างชิ้นงานหรือโครงงานอย่างมีจิตสำนึกและความรับผิดชอบ');
INSERT INTO `bets_indicator` VALUES (2007, '2551070301', 13, '25510703011313', '๑๓. บอกข้อควรปฏิบัติสำหรับผู้ใช้เทคโนโลยีสารสนเทศ');
INSERT INTO `bets_indicator` VALUES (2008, '2551070401', 4, '25510704010104', '๑. อธิบายความหมายและความสำคัญของอาชีพ');
INSERT INTO `bets_indicator` VALUES (2009, '2551070401', 5, '25510704010105', '๑. สำรวจข้อมูลที่เกี่ยวกับอาชีพต่างๆ ในชุมชน');
INSERT INTO `bets_indicator` VALUES (2010, '2551070401', 5, '25510704010205', '๒. ระบุความแตกต่างของอาชีพ');
INSERT INTO `bets_indicator` VALUES (2011, '2551070401', 6, '25510704010106', '๑.สำรวจตนเองเพื่อวางแผนในการเลือกอาชีพ');
INSERT INTO `bets_indicator` VALUES (2012, '2551070401', 6, '25510704010206', '๒. ระบุความรู้ความสามารถและคุณธรรมที่สัมพันธ์กับอาชีพที่สนใจ');
INSERT INTO `bets_indicator` VALUES (2013, '2551070401', 7, '25510704010107', '๑. อธิบายแนวทางการเลือกอาชีพ');
INSERT INTO `bets_indicator` VALUES (2014, '2551070401', 7, '25510704010207', '๒. มีเจตคติที่ดีต่อการประกอบอาชีพ');
INSERT INTO `bets_indicator` VALUES (2015, '2551070401', 7, '25510704010307', '๓. เห็นความสำคัญของการสร้างอาชีพ');
INSERT INTO `bets_indicator` VALUES (2016, '2551070401', 8, '25510704010108', '๑. อธิบายการเสริมสร้างประสบการณ์อาชีพ');
INSERT INTO `bets_indicator` VALUES (2017, '2551070401', 8, '25510704010208', '๒. ระบุการเตรียมตัวเข้าสู่อาชีพ');
INSERT INTO `bets_indicator` VALUES (2018, '2551070401', 8, '25510704010308', '๓. มีทักษะพื้นฐานที่จำเป็นสำหรับการประกอบอาชีพที่สนใจ');
INSERT INTO `bets_indicator` VALUES (2019, '2551070401', 9, '25510704010109', '๑. อภิปรายการหางานด้วยวิธีที่หลากหลาย');
INSERT INTO `bets_indicator` VALUES (2020, '2551070401', 9, '25510704010209', '๒. วิเคราะห์แนวทางเข้าสู่อาชีพ');
INSERT INTO `bets_indicator` VALUES (2021, '2551070401', 9, '25510704010309', '๓. ประเมินทางเลือกในการประกอบอาชีพที่สอดคล้องกับความรู้ความถนัดและความสนใจของตนเอง');
INSERT INTO `bets_indicator` VALUES (2022, '2551070401', 13, '25510704010113', '๑. อภิปรายแนวทางสู่อาชีพที่สนใจ');
INSERT INTO `bets_indicator` VALUES (2023, '2551070401', 13, '25510704010213', '๒. เลือก และใช้เทคโนโลยีอย่างเหมาะสมกับอาชีพ');
INSERT INTO `bets_indicator` VALUES (2024, '2551070401', 13, '25510704010313', '๓. มีประสบการณ์ในอาชีพที่ถนัดและสนใจ');
INSERT INTO `bets_indicator` VALUES (2025, '2551070401', 13, '25510704010413', '๔. มีคุณลักษณะที่ดีต่ออาชีพ');
INSERT INTO `bets_indicator` VALUES (2026, '2551080101', 1, '25510801010101', '๑. ปฏิบัติตามคำสั่งง่ายๆ ที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2027, '2551080101', 1, '25510801010201', '๒. ระบุตัวอักษรและเสียง อ่านออกเสียงและสะกดคำง่ายๆ ถูกต้องตาม หลักการอ่าน');
INSERT INTO `bets_indicator` VALUES (2028, '2551080101', 1, '25510801010301', '๓. เลือกภาพตรงตามความหมายของคำ และกลุ่มคำที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2029, '2551080101', 1, '25510801010401', '๔. ตอบคำถามจากการฟังเรื่องใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2030, '2551080101', 2, '25510801010102', '๑. ปฏิบัติตามคำสั่ง และคำขอร้องง่ายๆที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2031, '2551080101', 2, '25510801010202', '๒.ระบุตัวอักษรและเสียงอ่านออกเสียงคำสะกดคำ และอ่านประโยคง่ายๆถูกต้องตามหลักการอ่าน');
INSERT INTO `bets_indicator` VALUES (2032, '2551080101', 2, '25510801010302', '๓. เลือกภาพตรงตามความหมายของคำ กลุ่มคำ และประโยคที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2033, '2551080101', 2, '25510801010402', '๔. ตอบคำถามจากการฟังประโยคบทสนทนาหรือนิทานง่ายๆที่มีภาพประกอบ');
INSERT INTO `bets_indicator` VALUES (2034, '2551080101', 3, '25510801010103', '๑. ปฏิบัติตามคำสั่ง และคำขอร้องที่ฟังหรืออ่าน');
INSERT INTO `bets_indicator` VALUES (2035, '2551080101', 3, '25510801010203', '๒. อ่านออกเสียงคำ สะกดคำอ่านกลุ่มคำประโยค และบทพูดเข้าจังหวะ(chant) ง่ายๆ ถูกต้องตามหลักการอ่าน');
INSERT INTO `bets_indicator` VALUES (2036, '2551080101', 3, '25510801010303', '๓. เลือก/ระบุภาพ หรือสัญลักษณ์ตรงตามความหมายของกลุ่มคำและประโยคที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2037, '2551080101', 3, '25510801010403', '๔. ตอบคำถามจากการฟังหรืออ่านประโยคบทสนทนาหรือนิทานง่ายๆ');
INSERT INTO `bets_indicator` VALUES (2038, '2551080101', 4, '25510801010104', '๑. ปฏิบัติตามคำสั่ง คำขอร้องและคำแนะนำ(instructions)ง่ายๆ ที่ฟังหรืออ่าน');
INSERT INTO `bets_indicator` VALUES (2039, '2551080101', 4, '25510801010204', '๒. อ่านออกเสียงคำ สะกดคำ อ่านกลุ่มคำประโยคข้อความง่ายๆและบทพูดเข้าจังหวะถูกต้องตามหลักการอ่าน');
INSERT INTO `bets_indicator` VALUES (2040, '2551080101', 4, '25510801010304', '๓. เลือก/ระบุภาพ หรือสัญลักษณ์ หรือเครื่องหมายตรงตามความหมายของประโยคและข้อความสั้นๆที่ฟังหรืออ่าน');
INSERT INTO `bets_indicator` VALUES (2041, '2551080101', 4, '25510801010404', '๔. ตอบคำถามจากการฟังและอ่านประโยคบทสนทนาและนิทานง่ายๆ');
INSERT INTO `bets_indicator` VALUES (2042, '2551080101', 5, '25510801010105', '๑. ปฏิบัติตามคำสั่ง คำขอร้องและคำแนะนำง่ายๆ ที่ฟังและอ่าน');
INSERT INTO `bets_indicator` VALUES (2043, '2551080101', 5, '25510801010205', '๒. อ่านออกเสียงประโยคข้อความ และบทกลอนสั้นๆถูกต้องตามหลักการอ่าน');
INSERT INTO `bets_indicator` VALUES (2044, '2551080101', 5, '25510801010305', '๓.ระบุ/วาดภาพสัญลักษณ์หรือเครื่องหมายตรงตามความหมายของประโยคและข้อความสั้นๆที่ฟังหรืออ่าน');
INSERT INTO `bets_indicator` VALUES (2045, '2551080101', 5, '25510801010405', '๔. บอกใจความสำคัญ และตอบคำถาม จากการฟังและอ่านบทสนทนา และนิทานง่ายๆหรือเรื่องสั้นๆ');
INSERT INTO `bets_indicator` VALUES (2046, '2551080101', 6, '25510801010106', '๑. ปฏิบัติตามคำสั่ง คำขอร้องและคำแนะนำที่ฟังและอ่าน');
INSERT INTO `bets_indicator` VALUES (2047, '2551080101', 6, '25510801010206', '๒. อ่านออกเสียงข้อความนิทานและบทกลอนสั้นๆถูกต้องตามหลักการอ่าน');
INSERT INTO `bets_indicator` VALUES (2048, '2551080101', 6, '25510801010306', '๓. เลือก/ระบุประโยคหรือข้อความสั้นๆตรงตามภาพสัญลักษณ์หรือเครื่องหมายที่อ่าน');
INSERT INTO `bets_indicator` VALUES (2049, '2551080101', 6, '25510801010406', '๔. บอกใจความสำคัญและตอบคำถามจากการฟังและอ่าน บทสนทนานิทานง่ายๆและเรื่องเล่า');
INSERT INTO `bets_indicator` VALUES (2050, '2551080101', 7, '25510801010107', '๑. ปฏิบัติตามคำสั่ง คำขอร้องคำแนะนำ และคำชี้แจงง่ายๆที่ฟังและอ่าน');
INSERT INTO `bets_indicator` VALUES (2051, '2551080101', 7, '25510801010207', '๒. อ่านออกเสียงข้อความนิทาน และบทร้อยกรอง(poem) สั้นๆถูกต้องตามหลักการอ่าน');
INSERT INTO `bets_indicator` VALUES (2052, '2551080101', 7, '25510801010307', '๓. เลือก/ระบุประโยคและข้อความ ให้สัมพันธ์กับสื่อที่ไม่ใช่ความเรียง (nontextinformation)ที่อ่าน');
INSERT INTO `bets_indicator` VALUES (2053, '2551080101', 7, '25510801010407', '๔. ระบุหัวข้อเรื่อง (topic)ใจความสำคัญ(main idea) และตอบคำถามจากการฟังและอ่านบทสนทนานิทาน และเรื่องสั้น');
INSERT INTO `bets_indicator` VALUES (2054, '2551080101', 8, '25510801010108', '๑. ปฏิบัติตามคำขอร้องคำแนะนำคำชี้แจง และคำอธิบายง่ายๆที่ฟังและอ่าน');
INSERT INTO `bets_indicator` VALUES (2055, '2551080101', 8, '25510801010208', '๒. อ่านออกเสียงข้อความข่าว ประกาศและบทร้อยกรองสั้นๆถูกต้องตามหลักการอ่าน');
INSERT INTO `bets_indicator` VALUES (2056, '2551080101', 8, '25510801010308', '๓. ระบุ/เขียนประโยค และข้อความ ให้สัมพันธ์กับสื่อที่ไม่ใช่ความเรียงรูปแบบต่างๆที่อ่าน');
INSERT INTO `bets_indicator` VALUES (2057, '2551080101', 8, '25510801010408', '๔. เลือกหัวข้อเรื่อง ใจความสำคัญบอกรายละเอียดสนับสนุน(supporting detail)และแสดงความคิดเห็นเกี่ยวกับเรื่องที่ฟังและอ่านพร้อมทั้งให้เหตุผลและยกตัวอย่างง่ายๆประกอบ');
INSERT INTO `bets_indicator` VALUES (2058, '2551080101', 9, '25510801010109', '๑. ปฏิบัติตามคำขอร้องคำแนะนำคำชี้แจง และคำอธิบายที่ฟังและอ่าน');
INSERT INTO `bets_indicator` VALUES (2059, '2551080101', 9, '25510801010209', '๒. อ่านออกเสียง ข้อความข่าว โฆษณาและบทร้อยกรองสั้นๆถูกต้องตามหลักการอ่าน');
INSERT INTO `bets_indicator` VALUES (2060, '2551080101', 9, '25510801010309', '๓. ระบุและเขียนสื่อที่ไม่ใช่ความเรียงรูปแบบต่างๆ ให้สัมพันธ์กับประโยค และข้อความที่ฟังหรืออ่าน');
INSERT INTO `bets_indicator` VALUES (2061, '2551080101', 9, '25510801010409', '๔. เลือก/ระบุหัวข้อเรื่องใจความสำคัญรายละเอียดสนับสนุน และแสดงความคิดเห็นเกี่ยวกับเรื่องที่ฟังและอ่านจากสื่อประเภทต่างๆพร้อมทั้งให้เหตุผลและยกตัวอย่างประกอบ');
INSERT INTO `bets_indicator` VALUES (2062, '2551080101', 13, '25510801010113', '๑. ปฏิบัติตามคำแนะนำในคู่มือการใช้งานต่างๆคำชี้แจง คำอธิบาย และคำบรรยายที่ฟังและอ่าน');
INSERT INTO `bets_indicator` VALUES (2063, '', 0, '', '');
INSERT INTO `bets_indicator` VALUES (2064, '2551080101', 13, '25510801010213', '๒. อ่านออกเสียง ข้อความข่าว ประกาศ โฆษณาบทร้อยกรอง และบทละครสั้น (skit) ถูกต้องตามหลักการอ่าน');
INSERT INTO `bets_indicator` VALUES (2065, '2551080101', 13, '25510801010313', '๓. อธิบายและเขียนประโยคและข้อความให้สัมพันธ์กับสื่อที่ไม่ใช่ความเรียงรูปแบบต่างๆ ที่อ่าน รวมทั้งระบุและเขียนสื่อที่ไม่ใช่ความเรียงรูปแบบต่างๆ ให้สัมพันธ์กับประโยค และข้อความที่ฟังหรืออ่าน');
INSERT INTO `bets_indicator` VALUES (2066, '2551080101', 13, '25510801010413', '๔. จับใจความสำคัญวิเคราะห์ความ สรุปความตีความ และแสดงความคิดเห็นจากการฟังและอ่านเรื่องที่เป็นสารคดีและบันเทิงคดีพร้อมทั้งให้เหตุผลและยกตัวอย่างประกอบ');
INSERT INTO `bets_indicator` VALUES (2067, '2551080102', 1, '25510801020101', '๑. พูดโต้ตอบด้วยคำสั้นๆง่ายๆ ในการสื่อสารระหว่างบุคคลตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2068, '2551080102', 1, '25510801020201', '๒. ใช้คำสั่งง่ายๆ ตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2069, '2551080102', 1, '25510801020301', '๓. บอกความต้องการง่ายๆของตนเองตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2070, '2551080102', 1, '25510801020401', '๔. พูดขอและให้ข้อมูลง่ายๆเกี่ยวกับตนเองตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2071, '2551080102', 2, '25510801020102', '๑. พูดโต้ตอบด้วยคำสั้นๆง่ายๆ ในการสื่อสารระหว่างบุคคลตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2072, '2551080102', 2, '25510801020202', '๒.ใช้คำสั่งและคำขอร้องง่ายๆตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2073, '2551080102', 2, '25510801020302', '๓. บอกความต้องการง่ายๆของตนเองตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2074, '2551080102', 2, '25510801020402', '๔. พูดขอและให้ข้อมูลง่ายๆเกี่ยวกับตนเองตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2075, '2551080102', 3, '25510801020103', '๑. พูดโต้ตอบด้วยคำสั้นๆง่ายๆ ในการสื่อสารระหว่างบุคคลตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2076, '2551080102', 3, '25510801020203', '๒. ใช้คำสั่งและคำขอร้องง่ายๆตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2077, '2551080102', 3, '25510801020303', '๓. บอกความต้องการง่ายๆของตนเองตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2078, '2551080102', 3, '25510801020403', '๔. พูดขอและให้ข้อมูลง่ายๆเกี่ยวกับตนเองและเพื่อนตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2079, '2551080102', 3, '25510801020503', '๕. บอกความรู้สึกของตนเองเกี่ยวกับสิ่งต่างๆใกล้ตัว หรือกิจกรรมต่างๆตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2080, '2551080102', 4, '25510801020104', '๑. พูด/เขียนโต้ตอบในการสื่อสารระหว่างบุคคล');
INSERT INTO `bets_indicator` VALUES (2081, '2551080102', 4, '25510801020204', '๒. ใช้คำสั่งคำขอร้อง และคำขออนุญาตง่ายๆ');
INSERT INTO `bets_indicator` VALUES (2082, '2551080102', 4, '25510801020304', '๓. พูด/เขียนแสดงความต้องการของตนเอง และขอความช่วยเหลือในสถานการณ์ง่ายๆ');
INSERT INTO `bets_indicator` VALUES (2083, '2551080102', 4, '25510801020404', '๔. พูด/เขียนเพื่อขอและให้ข้อมูลเกี่ยวกับตนเองเพื่อนและครอบครัว');
INSERT INTO `bets_indicator` VALUES (2084, '2551080102', 4, '25510801020504', '๕. พูดแสดงความรู้สึกของตนเองเกี่ยวกับเรื่องต่างๆใกล้ตัว และกิจกรรมต่างๆตามแบบที่ฟัง');
INSERT INTO `bets_indicator` VALUES (2085, '2551080102', 5, '25510801020105', '๑. พูด/เขียนโต้ตอบในการสื่อสารระหว่างบุคคล');
INSERT INTO `bets_indicator` VALUES (2086, '2551080102', 5, '25510801020205', '๒. ใช้คำสั่งคำขอร้องคำขออนุญาตและให้คำแนะนำง่ายๆ');
INSERT INTO `bets_indicator` VALUES (2087, '2551080102', 5, '25510801020305', '๓. พูด/เขียนแสดงความต้องการ ขอความช่วยเหลือตอบรับและปฏิเสธการให้ความช่วยเหลือในสถานการณ์ง่ายๆ');
INSERT INTO `bets_indicator` VALUES (2088, '2551080102', 5, '25510801020405', '๔. พูด/เขียนเพื่อขอและให้ข้อมูลเกี่ยวกับตนเองเพื่อน ครอบครัวและเรื่องใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2089, '2551080102', 5, '25510801020505', '๕. พูด/เขียนแสดงความรู้สึกของตนเองเกี่ยวกับเรื่องต่างๆ ใกล้ตัวและกิจกรรมต่างๆ พร้อมทั้งให้เหตุผลสั้นๆประกอบ');
INSERT INTO `bets_indicator` VALUES (2090, '2551080102', 6, '25510801020106', '๑. พูด/เขียนโต้ตอบในการสื่อสารระหว่างบุคคล');
INSERT INTO `bets_indicator` VALUES (2091, '2551080102', 6, '25510801020206', '๒. ใช้คำสั่งคำขอร้อง และให้คำแนะนำ');
INSERT INTO `bets_indicator` VALUES (2092, '2551080102', 6, '25510801020306', '๓. พูด/เขียนแสดงความต้องการ ขอความช่วยเหลือตอบรับและปฏิเสธการให้ความช่วยเหลือในสถานการณ์ง่ายๆ');
INSERT INTO `bets_indicator` VALUES (2093, '2551080102', 6, '25510801020406', '๔. พูดและเขียนเพื่อขอและให้ข้อมูลเกี่ยวกับตนเอง เพื่อนครอบครัว และเรื่องใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2094, '2551080102', 6, '25510801020506', '๕. พูด/เขียนแสดงความรู้สึกของตนเองเกี่ยวกับเรื่องต่างๆ ใกล้ตัวกิจกรรมต่างๆพร้อมทั้งให้เหตุผลสั้นๆประกอบ');
INSERT INTO `bets_indicator` VALUES (2095, '2551080102', 7, '25510801020107', '๑. สนทนาแลกเปลี่ยนข้อมูลเกี่ยวกับตนเองกิจกรรม และสถานการณ์ต่างๆ ในชีวิตประจำวัน');
INSERT INTO `bets_indicator` VALUES (2096, '2551080102', 7, '25510801020207', '๒. ใช้คำขอร้องให้คำแนะนำและคำชี้แจงตามสถานการณ์');
INSERT INTO `bets_indicator` VALUES (2097, '2551080102', 7, '25510801020307', '๓. พูดและเขียนแสดงความต้องการขอความช่วยเหลือตอบรับและปฏิเสธการให้ความช่วยเหลือในสถานการณ์ต่างๆ อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2098, '2551080102', 7, '25510801020407', '๔. พูดและเขียนเพื่อขอและให้ข้อมูล และแสดงความคิดเห็นเกี่ยวกับเรื่องที่ฟังหรืออ่าน อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2099, '2551080102', 7, '25510801020507', '๕. พูดและเขียนแสดงความรู้สึกและความคิดเห็นของตนเองเกี่ยวกับเรื่องต่างๆ ใกล้ตัวกิจกรรมต่างๆพร้อมทั้งให้เหตุผลสั้นๆประกอบอย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2100, '2551080102', 8, '25510801020108', '๑. สนทนาแลกเปลี่ยนข้อมูลเกี่ยวกับตนเอง เรื่องต่างๆใกล้ตัว และสถานการณ์ต่างๆในชีวิตประจำวันอย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2101, '2551080102', 8, '25510801020208', '๒. ใช้คำขอร้องให้คำแนะนำคำชี้แจงและคำอธิบายตามสถานการณ์');
INSERT INTO `bets_indicator` VALUES (2102, '2551080102', 8, '25510801020308', '๓. พูดและเขียนแสดงความต้องการ เสนอและให้ความช่วยเหลือ ตอบรับและปฏิเสธการให้ความช่วยเหลือในสถานการณ์ต่างๆ อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2103, '2551080102', 8, '25510801020408', '๔. พูดและเขียนเพื่อขอและให้ข้อมูลบรรยาย และแสดงความคิดเห็นเกี่ยวกับเรื่องที่ฟังหรืออ่าน อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2104, '2551080102', 8, '25510801020508', '๕. พูดและเขียนแสดงความรู้สึกและความคิดเห็น ของตนเองเกี่ยวกับเรื่องต่างๆกิจกรรม และประสบการณ์พร้อมทั้งให้เหตุผลประกอบอย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2105, '2551080102', 9, '25510801020109', '๑. สนทนาและเขียนโต้ตอบข้อมูลเกี่ยวกับตนเองเรื่องต่างๆ ใกล้ตัวสถานการณ์ ข่าวเรื่องที่อยู่ในความสนใจของสังคมและสื่อสารอย่างต่อเนื่องและเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2106, '2551080102', 9, '25510801020209', '๒. ใช้คำขอร้อง ให้คำแนะนำ คำชี้แจงและคำอธิบายอย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2107, '2551080102', 9, '25510801020309', '๓. พูดและเขียนแสดงความต้องการเสนอและให้ความช่วยเหลือตอบรับและปฏิเสธการให้ความช่วยเหลือในสถานการณ์ต่างๆอย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2108, '2551080102', 9, '25510801020409', '๔. พูดและเขียนเพื่อขอและให้ข้อมูลอธิบาย เปรียบเทียบและแสดงความคิดเห็นเกี่ยวกับเรื่องที่ฟังหรืออ่านอย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2109, '2551080102', 9, '25510801020509', '๕. พูดและเขียนบรรยายความรู้สึกและความคิดเห็นของตนเองเกี่ยวกับเรื่องต่างๆ กิจกรรมประสบการณ์ และข่าว/เหตุการณ์พร้อมทั้งให้เหตุผลประกอบอย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2110, '2551080102', 13, '25510801020113', '๑. สนทนาและเขียนโต้ตอบข้อมูลเกี่ยวกับตนเองและเรื่องต่างๆใกล้ตัว ประสบการณ์สถานการณ์ ข่าว/เหตุการณ์ประเด็นที่อยู่ในความสนใจของสังคม และสื่อสารอย่างต่อเนื่องและเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2111, '2551080102', 13, '25510801020213', '๒. เลือกและใช้คำขอร้อง ให้คำแนะนำ คำชี้แจงคำอธิบายอย่างคล่องแคล่ว');
INSERT INTO `bets_indicator` VALUES (2112, '2551080102', 13, '25510801020313', '๓. พูดและเขียนแสดงความต้องการเสนอ ตอบรับและปฏิเสธการให้ความช่วยเหลือ ในสถานการณ์จำลองหรือสถานการณ์จริงอย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2113, '2551080102', 13, '25510801020413', '๔. พูดและเขียนเพื่อขอและให้ข้อมูลบรรยาย อธิบายเปรียบเทียบ และแสดงความคิดเห็นเกี่ยวกับเรื่อง/ประเด็น/ข่าว/เหตุการณ์ที่ฟังและอ่านอย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2114, '2551080102', 13, '25510801020513', '๕. พูดและเขียนบรรยายความรู้สึกและแสดงความคิดเห็นของตนเองเกี่ยวกับเรื่องต่างๆกิจกรรมประสบการณ์ และข่าว/เหตุการณ์อย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (2115, '2551080103', 1, '25510801030101', '๑. พูดให้ข้อมูลเกี่ยวกับตนเองและเรื่องใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2116, '2551080103', 2, '25510801030102', '๑. พูดให้ข้อมูลเกี่ยวกับตนเองและเรื่องใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2117, '2551080103', 3, '25510801030103', '๑. พูดให้ข้อมูลเกี่ยวกับตนเองและเรื่องใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2118, '2551080103', 3, '25510801030203', '๒. จัดหมวดหมู่คำ ตามประเภทของบุคคล สัตว์และสิ่งของตามที่ฟังหรืออ่าน');
INSERT INTO `bets_indicator` VALUES (2119, '2551080103', 4, '25510801030104', '๑. พูด/เขียนให้ข้อมูลเกี่ยวกับตนเองและเรื่องใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2120, '2551080103', 4, '25510801030204', '๒. พูด/วาดภาพแสดงความสัมพันธ์ของสิ่งต่างๆ ใกล้ตัวตามที่ฟังหรืออ่าน');
INSERT INTO `bets_indicator` VALUES (2121, '2551080103', 4, '25510801030304', '๓. พูดแสดงความคิดเห็นง่ายๆ เกี่ยวกับเรื่องต่างๆ ใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2122, '2551080103', 5, '25510801030105', '๑. พูด/เขียนให้ข้อมูลเกี่ยวกับตนเองและเรื่องใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2123, '2551080103', 5, '25510801030205', '๒. เขียนภาพแผนผัง และแผนภูมิแสดงข้อมูลต่างๆตามที่ฟังหรืออ่าน');
INSERT INTO `bets_indicator` VALUES (2124, '2551080103', 5, '25510801030305', '๓. พูดแสดงความคิดเห็นเกี่ยวกับเรื่องต่างๆ ใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2125, '2551080103', 6, '25510801030106', '๑. พูด/เขียนให้ข้อมูลเกี่ยวกับตนเองเพื่อน และสิ่งแวดล้อมใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2126, '2551080103', 6, '25510801030206', '๒. เขียนภาพแผนผัง แผนภูมิและตารางแสดงข้อมูลต่างๆ ตามที่ฟังหรืออ่าน');
INSERT INTO `bets_indicator` VALUES (2127, '2551080103', 6, '25510801030306', '๓. พูด/เขียนแสดงความคิดเห็นเกี่ยวกับเรื่องต่างๆ ใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2128, '2551080103', 7, '25510801030107', '๑. พูดและเขียนบรรยายเกี่ยวกับตนเอง กิจวัตรประจำวันประสบการณ์และสิ่งแวดล้อมใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2129, '2551080103', 7, '25510801030207', '๒. พูด/เขียนสรุปใจความสำคัญ/แก่นสาระ(theme) ที่ได้จากการวิเคราะห์เรื่อง/เหตุการณ์ที่อยู่ในความสนใจของสังคม');
INSERT INTO `bets_indicator` VALUES (2130, '2551080103', 7, '25510801030307', '๓. พูด/เขียนแสดงความคิดเห็นเกี่ยวกับกิจกรรมหรือเรื่องต่างๆ ใกล้ตัวพร้อมทั้งให้เหตุผลสั้นๆประกอบ');
INSERT INTO `bets_indicator` VALUES (2131, '2551080103', 8, '25510801030108', '๑. พูดและเขียนบรรยายเกี่ยวกับตนเองกิจวัตรประจำวันประสบการณ์และข่าว/เหตุการณ์ ที่อยู่ในความสนใจของสังคม');
INSERT INTO `bets_indicator` VALUES (2132, '2551080103', 8, '25510801030208', '๒. พูดและเขียนสรุปใจความสำคัญ/แก่นสาระหัวข้อเรื่อง(topic) ที่ได้จากการวิเคราะห์เรื่อง/ข่าว/เหตุการณ์ที่อยู่ในความสนใจของสังคม');
INSERT INTO `bets_indicator` VALUES (2133, '2551080103', 8, '25510801030308', '๓. พูดและเขียนแสดงความคิดเห็นเกี่ยวกับกิจกรรมเรื่องต่างๆใกล้ตัว และประสบการณ์พร้อมทั้งให้เหตุผลสั้นๆประกอบ');
INSERT INTO `bets_indicator` VALUES (2134, '2551080103', 9, '25510801030109', '๑. พูดและเขียนบรรยายเกี่ยวกับตนเองประสบการณ์ข่าว/เหตุการณ์/เรื่อง/ประเด็นต่างๆ ที่อยู่ในความสนใจของสังคม');
INSERT INTO `bets_indicator` VALUES (2135, '2551080103', 9, '25510801030209', '๒. พูดและเขียนสรุปใจความสำคัญ/แก่นสาระหัวข้อเรื่องที่ได้จากการวิเคราะห์เรื่อง/ข่าว/เหตุการณ์/สถานการณ์ที่อยู่ในความสนใจของสังคม');
INSERT INTO `bets_indicator` VALUES (2136, '2551080103', 9, '25510801030309', '๓. พูดและเขียนแสดงความคิดเห็นเกี่ยวกับกิจกรรมประสบการณ์และเหตุการณ์พร้อมทั้งให้เหตุผลประกอบ');
INSERT INTO `bets_indicator` VALUES (2137, '2551080103', 13, '25510801030113', '๑. พูดและเขียนนำเสนอข้อมูลเกี่ยวกับตนเอง/ประสบการณ์ ข่าว/เหตุการณ์ เรื่อง และประเด็นต่างๆ ตามความสนใจของสังคม');
INSERT INTO `bets_indicator` VALUES (2138, '2551080103', 13, '25510801030213', '๒. พูดและเขียนสรุปใจความสำคัญ/ แก่นสาระที่ได้จากการวิเคราะห์เรื่องกิจกรรม ข่าว เหตุการณ์และสถานการณ์ตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (2139, '2551080103', 13, '25510801030313', '๓. พูดและเขียนแสดงความคิดเห็นเกี่ยวกับกิจกรรม ประสบการณ์และเหตุการณ์ ทั้งในท้องถิ่น สังคม และโลกพร้อมทั้งให้เหตุผลและยกตัวอย่างประกอบ');
INSERT INTO `bets_indicator` VALUES (2140, '2551080201', 1, '25510802010101', '๑. พูดและทำท่าประกอบ ตามวัฒนธรรมของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2141, '2551080201', 1, '25510802010201', '๒. บอกชื่อและคำศัพท์เกี่ยวกับเทศกาลสำคัญของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2142, '2551080201', 1, '25510802010301', '๓. เข้าร่วมกิจกรรมทางภาษาและวัฒนธรรมที่เหมาะกับวัย');
INSERT INTO `bets_indicator` VALUES (2143, '2551080201', 2, '25510802010102', '๑. พูดและทำท่าประกอบ ตามวัฒนธรรมของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2144, '2551080201', 2, '25510802010202', '๒. บอกชื่อและคำศัพท์เกี่ยวกับเทศกาลสำคัญของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2145, '2551080201', 2, '25510802010302', '๓. เข้าร่วมกิจกรรมทางภาษาและวัฒนธรรมที่เหมาะกับวัย');
INSERT INTO `bets_indicator` VALUES (2146, '2551080201', 3, '25510802010103', '๑. พูดและทำท่าประกอบ ตามมารยาทสังคม/วัฒนธรรมของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2147, '2551080201', 3, '25510802010203', '๒. บอกชื่อและคำศัพท์ง่ายๆเกี่ยวกับเทศกาล/วันสำคัญ/งานฉลองและชีวิตความเป็นอยู่ของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2148, '2551080201', 3, '25510802010303', '๓. เข้าร่วมกิจกรรมทางภาษาและวัฒนธรรมที่เหมาะกับวัย');
INSERT INTO `bets_indicator` VALUES (2149, '2551080201', 4, '25510802010104', '๑. พูดและทำท่าประกอบ อย่างสุภาพ ตามมารยาทสังคมและวัฒนธรรมของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2150, '2551080201', 4, '25510802010204', '๒. ตอบคำถามเกี่ยวกับเทศกาล/วันสำคัญ/งานฉลองและชีวิตความเป็นอยู่ง่ายๆ ของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2151, '2551080201', 4, '25510802010304', '๓. เข้าร่วมกิจกรรมทางภาษาและวัฒนธรรมที่เหมาะกับวัย');
INSERT INTO `bets_indicator` VALUES (2152, '2551080201', 5, '25510802010105', '๑. ใช้ถ้อยคำน้ำเสียงและกิริยาท่าทางอย่างสุภาพ ตามมารยาทสังคมและวัฒนธรรมของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2153, '2551080201', 5, '25510802010205', '๒. ตอบคำถาม/บอกความสำคัญของเทศกาล/วันสำคัญ/งานฉลองและชีวิตความเป็นอยู่ง่ายๆ ของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2154, '2551080201', 5, '25510802010305', '๓. เข้าร่วมกิจกรรมทางภาษาและวัฒนธรรมตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (2155, '2551080201', 6, '25510802010106', '๑. ใช้ถ้อยคำน้ำเสียง และกิริยาท่าทางอย่างสุภาพเหมาะสม ตามมารยาทสังคมและวัฒนธรรมของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2156, '2551080201', 6, '25510802010206', '๒. ให้ข้อมูลเกี่ยวกับเทศกาล/วันสำคัญ/งานฉลอง/ชีวิตความเป็นอยู่ของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2157, '2551080201', 6, '25510802010306', '๓. เข้าร่วมกิจกรรมทางภาษาและวัฒนธรรมตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (2158, '2551080201', 7, '25510802010107', '๑.ใช้ภาษาน้ำเสียง และกิริยาท่าทางสุภาพ เหมาะสมตามมารยาทสังคม และวัฒนธรรมของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2159, '2551080201', 7, '25510802010207', '๒. บรรยายเกี่ยวกับเทศกาลวันสำคัญ ชีวิตความเป็นอยู่และประเพณีของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2160, '2551080201', 7, '25510802010307', '๓. เข้าร่วม/จัดกิจกรรมทางภาษาและวัฒนธรรมตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (2161, '2551080201', 8, '25510802010108', '๑. ใช้ภาษาน้ำเสียง และกิริยาท่าทางเหมาะกับบุคคลและโอกาสตามมารยาทสังคม และวัฒนธรรมของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2162, '2551080201', 8, '25510802010208', '๒. อธิบายเกี่ยวกับเทศกาลวันสำคัญ ชีวิตความเป็นอยู่และประเพณีของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2163, '2551080201', 8, '25510802010308', '๓. เข้าร่วม/จัดกิจกรรมทางภาษาและวัฒนธรรมตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (2164, '2551080201', 9, '25510802010109', '๑.เลือกใช้ภาษาน้ำเสียง และกิริยาท่าทางเหมาะกับบุคคลและโอกาส ตามมารยาทสังคมและวัฒนธรรมของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2165, '2551080201', 9, '25510802010209', '๒. อธิบายเกี่ยวกับชีวิตความเป็นอยู่ขนบธรรมเนียมและประเพณีของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2166, '2551080201', 9, '25510802010309', '๓. เข้าร่วม/จัดกิจกรรมทางภาษาและวัฒนธรรมตามความสนใจ');
INSERT INTO `bets_indicator` VALUES (2167, '2551080201', 13, '25510802010113', '๑. เลือกใช้ภาษา น้ำเสียงและกิริยาท่าทางเหมาะกับระดับของบุคคล โอกาสและสถานที่ ตามมารยาทสังคมและวัฒนธรรมของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2168, '2551080201', 13, '25510802010213', '๒. อธิบาย/อภิปรายวิถีชีวิต ความคิด ความเชื่อและที่มาของขนบธรรมเนียม และประเพณีของเจ้าของภาษา');
INSERT INTO `bets_indicator` VALUES (2169, '2551080201', 13, '25510802010313', '๓. เข้าร่วม แนะนำ และจัดกิจกรรมทางภาษาและวัฒนธรรมอย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2170, '2551080202', 1, '25510802020101', '๑.ระบุตัวอักษรและเสียงตัวอักษรของภาษาต่างประเทศและภาษาไทย');
INSERT INTO `bets_indicator` VALUES (2171, '2551080202', 2, '25510802020102', '๑.ระบุตัวอักษรและเสียงตัวอักษรของภาษาต่างประเทศและภาษาไทย');
INSERT INTO `bets_indicator` VALUES (2172, '2551080202', 3, '25510802020103', '๑. บอกความแตกต่างของเสียงตัวอักษรคำ กลุ่มคำ และประโยคง่ายๆของภาษาต่างประเทศและภาษาไทย');
INSERT INTO `bets_indicator` VALUES (2173, '2551080202', 4, '25510802020104', '๑. บอกความแตกต่างของของเสียงตัวอักษร คำกลุ่มคำ ประโยคและข้อความของภาษาต่างประเทศและภาษาไทย');
INSERT INTO `bets_indicator` VALUES (2174, '2551080202', 4, '25510802020204', '๒. บอกความเหมือน/ความแตกต่างระหว่างเทศกาลและงานฉลอง ตามวัฒนธรรมของเจ้าของภาษากับของไทย');
INSERT INTO `bets_indicator` VALUES (2175, '2551080202', 5, '25510802020105', '๑. บอกความเหมือน/ความแตกต่างระหว่างการออกเสียงประโยคชนิดต่างๆ การใช้เครื่องหมายวรรคตอน และการลำดับคำ(order)ตามโครงสร้างประโยค ของภาษาต่างประเทศและภาษาไทย');
INSERT INTO `bets_indicator` VALUES (2176, '2551080202', 5, '25510802020205', '๒. บอกความเหมือน/ความแตกต่างระหว่างเทศกาลและงานฉลองของเจ้าของภาษากับของไทย');
INSERT INTO `bets_indicator` VALUES (2177, '2551080202', 6, '25510802020106', '๑. บอกความเหมือน/ความแตกต่างระหว่างการออกเสียงประโยคชนิดต่างๆ การใช้เครื่องหมายวรรคตอน และการลำดับคำตามโครงสร้างประโยค ของภาษาต่างประเทศและภาษาไทย');
INSERT INTO `bets_indicator` VALUES (2178, '2551080202', 6, '25510802020206', '๒. เปรียบเทียบความเหมือน/ความแตกต่างระหว่างเทศกาลงานฉลองและประเพณีของเจ้าของภาษากับของไทย');
INSERT INTO `bets_indicator` VALUES (2179, '2551080202', 7, '25510802020107', '๑. บอกความเหมือนและความแตกต่างระหว่างการออกเสียงประโยคชนิดต่างๆ การใช้เครื่องหมายวรรคตอน และการลำดับคำตามโครงสร้างประโยค ของภาษาต่างประเทศและภาษาไทย');
INSERT INTO `bets_indicator` VALUES (2180, '2551080202', 7, '25510802020207', '๒ เปรียบเทียบความเหมือนและความแตกต่างระหว่างเทศกาลงานฉลองวันสำคัญ และชีวิตความเป็นอยู่ของเจ้าของภาษากับของไทย');
INSERT INTO `bets_indicator` VALUES (2181, '2551080202', 8, '25510802020108', '๑. เปรียบเทียบและอธิบายความเหมือนและความแตกต่างระหว่างการออกเสียงประโยคชนิดต่างๆ และการลำดับคำตามโครงสร้างประโยค ของภาษาต่างประเทศและภาษาไทย');
INSERT INTO `bets_indicator` VALUES (2182, '2551080202', 8, '25510802020208', '๒ เปรียบเทียบและอธิบายความเหมือนและความแตกต่างระหว่างชีวิตความเป็นอยู่และวัฒนธรรมของเจ้าของภาษากับของไทย');
INSERT INTO `bets_indicator` VALUES (2184, '2551080202', 9, '25510802020109', '๑. เปรียบเทียบและอธิบายความเหมือนและความแตกต่างระหว่างการออกเสียงประโยคชนิดต่างๆ และการลำดับคำตามโครงสร้างประโยค ของภาษาต่างประเทศและภาษาไทย');
INSERT INTO `bets_indicator` VALUES (2185, '2551080202', 9, '25510802020209', '๒. เปรียบเทียบและอธิบายความเหมือนและความแตกต่างระหว่างชีวิตความเป็นอยู่และวัฒนธรรมของเจ้าของภาษากับของไทย และนำไปใช้อย่างเหมาะสม');
INSERT INTO `bets_indicator` VALUES (2186, '2551080202', 13, '25510802020113', '๑. อธิบาย/เปรียบเทียบความแตกต่างระหว่างโครงสร้างประโยคข้อความ สำนวนคำพังเพย สุภาษิตและบทกลอนของภาษาต่างประเทศและภาษาไทย');
INSERT INTO `bets_indicator` VALUES (2187, '2551080202', 13, '25510802020213', '๒. วิเคราะห์/อภิปรายความเหมือนและความแตกต่างระหว่างวิถีชีวิตความเชื่อ และวัฒนธรรมของเจ้าของภาษากับของไทย และนำไปใช้อย่างมีเหตุผล');
INSERT INTO `bets_indicator` VALUES (2188, '2551080301', 1, '25510803010101', '๑. บอกคำศัพท์ที่เกี่ยวข้องกับกลุ่มสาระการเรียนรู้อื่น');
INSERT INTO `bets_indicator` VALUES (2189, '2551080301', 2, '25510803010102', '๑. บอกคำศัพท์ที่เกี่ยวข้องกับกลุ่มสาระการเรียนรู้อื่น');
INSERT INTO `bets_indicator` VALUES (2190, '2551080301', 3, '25510803010103', '๑. บอกคำศัพท์ที่เกี่ยวข้องกับกลุ่มสาระการเรียนรู้อื่น');
INSERT INTO `bets_indicator` VALUES (2191, '2551080301', 4, '25510803010104', '๑. ค้นคว้ารวบรวมคำศัพท์ที่เกี่ยวข้องกับกลุ่มสาระการเรียนรู้อื่นและนำเสนอด้วยการพูด/การเขียน');
INSERT INTO `bets_indicator` VALUES (2192, '2551080301', 5, '25510803010105', '๑. ค้นคว้ารวบรวมคำศัพท์ที่เกี่ยวข้องกับกลุ่มสาระการเรียนรู้อื่นและนำเสนอด้วยการพูด/การเขียน');
INSERT INTO `bets_indicator` VALUES (2193, '2551080301', 6, '25510803010106', '๑. ค้นคว้ารวบรวมคำศัพท์ที่เกี่ยวข้องกับกลุ่มสาระการเรียนรู้อื่นจากแหล่งเรียนรู้และนำเสนอด้วยการพูด/การเขียน');
INSERT INTO `bets_indicator` VALUES (2194, '2551080301', 7, '25510803010107', '๑. ค้นคว้ารวบรวมและสรุปข้อมูล/ข้อเท็จจริงที่เกี่ยวข้องกับกลุ่มสาระการเรียนรู้อื่นจากแหล่งเรียนรู้และนำเสนอด้วยการพูด/การเขียน');
INSERT INTO `bets_indicator` VALUES (2195, '2551080301', 8, '25510803010108', '๑. ค้นคว้ารวบรวมและสรุปข้อมูล/ข้อเท็จจริงที่เกี่ยวข้องกับกลุ่มสาระการเรียนรู้อื่นจากแหล่งเรียนรู้และนำเสนอด้วยการพูด/การเขียน');
INSERT INTO `bets_indicator` VALUES (2196, '2551080301', 9, '25510803010109', '๑. ค้นคว้ารวบรวมและสรุปข้อมูล/ข้อเท็จจริงที่เกี่ยวข้องกับกลุ่มสาระการเรียนรู้อื่นจากแหล่งเรียนรู้และนำเสนอด้วยการพูดและการเขียน');
INSERT INTO `bets_indicator` VALUES (2197, '2551080301', 13, '25510803010113', '๑. ค้นคว้า/สืบค้นบันทึก สรุป และแสดงความคิดเห็นเกี่ยวกับข้อมูลที่เกี่ยวข้องกับกลุ่มสาระการเรียนรู้อื่นจากแหล่งเรียนรู้ต่างๆและ นำเสนอด้วยการพูดและการเขียน');
INSERT INTO `bets_indicator` VALUES (2198, '2551080401', 1, '25510804010101', '๑. ฟัง/พูดในสถานการณ์ง่ายๆ ที่เกิดขึ้นในห้องเรียน');
INSERT INTO `bets_indicator` VALUES (2199, '2551080401', 2, '25510804010102', '๑. ฟัง/พูดในสถานการณ์ง่ายๆ ที่เกิดขึ้นในห้องเรียน');
INSERT INTO `bets_indicator` VALUES (2200, '2551080401', 3, '25510804010103', '๑. ฟัง/พูดในสถานการณ์ง่ายๆ ที่เกิดขึ้นในห้องเรียน');
INSERT INTO `bets_indicator` VALUES (2201, '2551080401', 4, '25510804010104', '๑. ฟังและพูด/อ่าน ในสถานการณ์ที่เกิดขึ้นในห้องเรียนและสถานศึกษา');
INSERT INTO `bets_indicator` VALUES (2202, '2551080401', 5, '25510804010105', '๑. ฟัง พูด และอ่าน/เขียน ในสถานการณ์ต่างๆ ที่เกิดขึ้นในห้องเรียนและสถานศึกษา');
INSERT INTO `bets_indicator` VALUES (2203, '2551080401', 6, '25510804010106', '๑. ใช้ภาษาสื่อสาร ในสถานการณ์ต่างๆ ที่เกิดขึ้นในห้องเรียนและสถานศึกษา');
INSERT INTO `bets_indicator` VALUES (2204, '2551080401', 7, '25510804010107', '๑. ใช้ภาษาสื่อสาร ในสถานการณ์จริง/สถานการณ์จำลองที่เกิดขึ้นในห้องเรียนและสถานศึกษา');
INSERT INTO `bets_indicator` VALUES (2205, '2551080401', 8, '25510804010108', '๑. ใช้ภาษาสื่อสารในสถานการณ์จริง/สถานการณ์จำลองที่เกิดขึ้นในห้องเรียนสถานศึกษาและชุมชน');
INSERT INTO `bets_indicator` VALUES (2206, '2551080401', 9, '25510804010109', '๑. ใช้ภาษาสื่อสารในสถานการณ์จริง/สถานการณ์จำลองที่เกิดขึ้นในห้องเรียนสถานศึกษาชุมชน และสังคม');
INSERT INTO `bets_indicator` VALUES (2207, '2551080401', 13, '25510804010113', '๑. ใช้ภาษาสื่อสารในสถานการณ์จริง/สถานการณ์จำลองที่เกิดขึ้นในห้องเรียนสถานศึกษา ชุมชนและสังคม');
INSERT INTO `bets_indicator` VALUES (2208, '2551080402', 1, '25510804020101', '๑. ใช้ภาษาต่างประเทศเพื่อรวบรวมคำศัพท์ที่เกี่ยวข้องใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2209, '2551080402', 2, '25510804020102', '๑. ใช้ภาษาต่างประเทศเพื่อรวบรวมคำศัพท์ที่เกี่ยวข้องใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2210, '2551080402', 3, '25510804020103', '๑. ใช้ภาษาต่างประเทศเพื่อรวบรวมคำศัพท์ที่เกี่ยวข้องใกล้ตัว');
INSERT INTO `bets_indicator` VALUES (2211, '2551080402', 4, '25510804020104', '๑. ใช้ภาษาต่างประเทศในการสืบค้นและรวบรวมข้อมูลต่างๆ');
INSERT INTO `bets_indicator` VALUES (2212, '2551080402', 5, '25510804020105', '๑. ใช้ภาษาต่างประเทศในการสืบค้นและรวบรวมข้อมูลต่างๆ');
INSERT INTO `bets_indicator` VALUES (2213, '2551080402', 6, '25510804020106', '๑. ใช้ภาษาต่างประเทศในการสืบค้นและรวบรวมข้อมูลต่างๆ');
INSERT INTO `bets_indicator` VALUES (2214, '2551080402', 7, '25510804020107', '๑. ใช้ภาษาต่างประเทศในการสืบค้น/ค้นคว้า ความรู้/ข้อมูลต่างๆ จากสื่อและแหล่งการเรียนรู้ต่างๆในการศึกษาต่อ และประกอบอาชีพ');
INSERT INTO `bets_indicator` VALUES (2215, '2551080402', 8, '25510804020108', '๑. ใช้ภาษาต่างประเทศในการสืบค้น/ค้นคว้า รวบรวมและสรุปความรู้/ข้อมูลต่างๆ จากสื่อและแหล่งการเรียนรู้ต่างๆในการศึกษาต่อและประกอบอาชีพ');
INSERT INTO `bets_indicator` VALUES (2216, '2551080402', 8, '25510804020208', '๒. เผยแพร่/ประชาสัมพันธ์ข้อมูล ข่าวสารของโรงเรียนเป็นภาษาต่างประเทศ');
INSERT INTO `bets_indicator` VALUES (2217, '2551080402', 9, '25510804020109', '๑. ใช้ภาษาต่างประเทศในการสืบค้น/ค้นคว้า รวบรวมและสรุปความรู้/ข้อมูลต่างๆ จากสื่อและแหล่งการเรียนรู้ต่างๆในการศึกษาต่อและประกอบอาชีพ');
INSERT INTO `bets_indicator` VALUES (2218, '2551080402', 9, '25510804020209', '๒. เผยแพร่/ประชาสัมพันธ์ข้อมูล ข่าวสารของโรงเรียนชุมชน และท้องถิ่น เป็นภาษาต่างประเทศ');
INSERT INTO `bets_indicator` VALUES (2219, '2551080402', 13, '25510804020113', '๑. ใช้ภาษาต่างประเทศในการสืบค้น/ค้นคว้ารวบรวม วิเคราะห์ และสรุปความรู้/ข้อมูลต่างๆจากสื่อและแหล่งการเรียนรู้ต่างๆในการศึกษาต่อและประกอบอาชีพ');
INSERT INTO `bets_indicator` VALUES (2220, '2551080402', 13, '25510804020213', '๒. เผยแพร่/ประชาสัมพันธ์ข้อมูลข่าวสารของโรงเรียนชุมชน และท้องถิ่น/ประเทศชาติ เป็นภาษาต่างประเทศ');

CREATE TABLE `bets_item` (
  `id` int(11) NOT NULL auto_increment,
  `indicator_code` varchar(14) NOT NULL,
  `class_code` tinyint(4) NOT NULL,
  `item_type` tinyint(4) NOT NULL,
  `pic_item` varchar(150) NOT NULL,
  `media_item` varchar(150) NOT NULL,
  `answer_num` tinyint(4) NOT NULL,
  `question` varchar(250) NOT NULL,
  `answer1` varchar(250) NOT NULL,
  `answer2` varchar(250) NOT NULL,
  `answer3` varchar(250) NOT NULL,
  `answer4` varchar(250) NOT NULL,
  `answer5` varchar(250) NOT NULL,
  `right_answer` tinyint(4) NOT NULL,
  `remark` varchar(150) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `indicator_code` (`indicator_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `bets_master_test` (
  `id` int(11) NOT NULL auto_increment,
  `master_name` varchar(150) NOT NULL,
  `test_detail` varchar(200) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `bets_master_test_2` (
  `id` int(11) NOT NULL auto_increment,
  `master_test_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_order` tinyint(4) NOT NULL,
  `score` float NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `bets_permission` (
  `id` int(11) NOT NULL auto_increment,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `p2` tinyint(4) NOT NULL,
  `p3` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `bets_schtest_testuser` (
  `id` int(11) NOT NULL auto_increment,
  `school` int(11) NOT NULL,
  `person_id` varchar(13) NOT NULL,
  `ed_year` int(11) NOT NULL,
  `sch_test_id` int(11) NOT NULL,
  `stop_test` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `bets_sch_test` (
  `id` int(11) NOT NULL auto_increment,
  `school` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `sch_test_name` varchar(150) NOT NULL,
  `sch_test_code` varchar(10) NOT NULL,
  `sch_test_active` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `bets_standard` (
  `id` int(11) NOT NULL auto_increment,
  `substance_code` varchar(8) NOT NULL,
  `standard_code` varchar(10) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `standard_text` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `standard_code` (`standard_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

INSERT INTO `bets_standard` VALUES (11, '25510601', '2551060101', 'ศ ๑.๑', 'สร้างสรรค์งานทัศนศิลป์ตามจินตนาการ และความคิดสร้างสรรค์ วิเคราะห์ วิพากษ์ วิจารณ์คุณค่างานทัศนศิลป์ ถ่ายทอดความรู้สึก ความคิดต่องานศิลปะ อย่างอิสระ ชื่นชม และประยุกต์ใช้ในชีวิตประจำวัน');
INSERT INTO `bets_standard` VALUES (12, '25510601', '2551060102', 'ศ ๑.๒', 'เข้าใจความสัมพันธ์ระหว่างทัศนศิลป์ ประวัติศาสตร์ และวัฒนธรรม เห็นคุณค่า งานทัศนศิลป์ที่เป็นมรดกทางวัฒนธรรม ภูมิปัญญาท้องถิ่น ภูมิปัญญาไทยและสากล');
INSERT INTO `bets_standard` VALUES (13, '25510602', '2551060201', 'ศ ๒.๑', 'เข้าใจและแสดงออกทางดนตรีอย่างสร้างสรรค์ วิเคราะห์ วิพากษ์วิจารณ์คุณค่าดนตรี ถ่ายทอดความรู้สึก ความคิดต่อดนตรีอย่างอิสระ ชื่นชม และประยุกต์ใช้ในชีวิตประจำวัน');
INSERT INTO `bets_standard` VALUES (14, '25510602', '2551060202', 'ศ ๒.๒', 'เข้าใจความสัมพันธ์ระหว่างดนตรี ประวัติศาสตร์ และวัฒนธรรม เห็นคุณค่าของดนตรีที่เป็นมรดกทางวัฒนธรรม ภูมิปัญญาท้องถิ่น ภูมิปัญญาไทยและสากล');
INSERT INTO `bets_standard` VALUES (15, '25510603', '2551060301', 'ศ ๓.๑', 'เข้าใจ และแสดงออกทางนาฏศิลป์อย่างสร้างสรรค์ วิเคราะห์ วิพากษ์ วิจารณ์คุณค่านาฏศิลป์ ถ่ายทอดความรู้สึก ความคิดอย่างอิสระ ชื่นชม และประยุกต์ใช้ในชีวิตประจำวัน');
INSERT INTO `bets_standard` VALUES (16, '25510603', '2551060302', 'ศ ๓.๒', 'เข้าใจความสัมพันธ์ระหว่างนาฏศิลป์ ประวัติศาสตร์และวัฒนธรรม เห็นคุณค่าของนาฏศิลป์ที่เป็นมรดกทางวัฒนธรรม ภูมิปัญญาท้องถิ่น ภูมิปัญญาไทยและสากล');
INSERT INTO `bets_standard` VALUES (17, '25510101', '2551010101', 'ท ๑.๑', 'ใช้กระบวนการอ่านสร้างความรู้และความคิด เพื่อนำไปใช้ตัดสินใจ แก้ปัญหาในการดำเนินชีวิตและมีนิสัยรักการอ่าน');
INSERT INTO `bets_standard` VALUES (18, '25510102', '2551010201', 'ท ๒.๑', 'ใช้กระบวนการเขียนเขียนสื่อสาร เขียนเรียงความ ย่อความ และเขียนเรื่องราวในรูปแบบต่างๆ เขียนรายงานข้อมูลสารสนเทศและรายงานการศึกษาค้นคว้าอย่างมีประสิทธิภาพ');
INSERT INTO `bets_standard` VALUES (19, '25510103', '2551010301', 'ท ๓.๑', 'สามารถเลือกฟังและดูอย่างมีวิจารณญาณ และพูดแสดงความรู้ ความคิด และความรู้สึกในโอกาสต่างๆ อย่างมีวิจารณญาณและสร้างสรรค์');
INSERT INTO `bets_standard` VALUES (20, '25510104', '2551010401', 'ท ๔.๑', 'เข้าใจธรรมชาติของภาษาและหลักภาษาไทย การเปลี่ยนแปลงของภาษาและพลังของภาษา ภูมิปัญญาทางภาษา และรักษาภาษาไทยไว้เป็นสมบัติของชาติ');
INSERT INTO `bets_standard` VALUES (21, '25510105', '2551010501', 'ท ๕.๑', 'เข้าใจและแสดงความคิดเห็น วิจารณ์วรรณคดีและวรรณกรรมไทยอย่างเห็นคุณค่าและนำมาประยุกต์ใช้ในชีวิตจริง');
INSERT INTO `bets_standard` VALUES (22, '25510201', '2551020101', 'ค ๑.๑', 'เข้าใจถึงความหลากหลายของการแสดงจำนวนและการใช้จำนวนในชีวิตจริง');
INSERT INTO `bets_standard` VALUES (23, '25510201', '2551020102', 'ค ๑.๒', 'เข้าใจถึงผลที่เกิดขึ้นจากการดำเนินการของจำนวนและความสัมพันธ์ระหว่างการดำเนินการต่าง ๆ และใช้การดำเนินการในการแก้ปัญหา');
INSERT INTO `bets_standard` VALUES (24, '25510201', '2551020103', 'ค ๑.๓', 'ใช้การประมาณค่าในการคำนวณและแก้ปัญหา');
INSERT INTO `bets_standard` VALUES (25, '25510201', '2551020104', 'ค ๑.๔', 'เข้าใจระบบจำนวนและนำสมบัติเกี่ยวกับจำนวนไปใช้');
INSERT INTO `bets_standard` VALUES (26, '25510202', '2551020201', 'ค ๒.๑', 'เข้าใจพื้นฐานเกี่ยวกับการวัด วัดและคาดคะเนขนาดของสิ่งที่ต้องการวัด');
INSERT INTO `bets_standard` VALUES (27, '25510202', '2551020202', 'ค ๒.๒', 'แก้ปัญหาเกี่ยวกับการวัด');
INSERT INTO `bets_standard` VALUES (28, '25510203', '2551020301', 'ค ๓.๑', 'อธิบายและวิเคราะห์รูปเรขาคณิตสองมิติและสามมิติ');
INSERT INTO `bets_standard` VALUES (29, '25510203', '2551020302', 'ค ๓.๒', 'ใช้การนึกภาพ (visualization) ใช้เหตุผลเกี่ยวกับปริภูมิ (spatial reasoning) และใช้แบบจำลองทางเรขาคณิต (geometric model) ในการแก้ปัญหา');
INSERT INTO `bets_standard` VALUES (30, '25510204', '2551020401', 'ค ๔.๑', 'เข้าใจและวิเคราะห์แบบรูป (pattern) ความสัมพันธ์ และฟังก์ชัน');
INSERT INTO `bets_standard` VALUES (31, '25510204', '2551020402', 'ค ๔.๒', 'ใช้นิพจน์ สมการ อสมการ กราฟ และตัวแบบเชิงคณิตศาสตร์ (mathematical model) อื่น ๆ แทนสถานการณ์ต่าง ๆ ตลอดจนแปลความหมายและนำไปใช้แก้ปัญหา');
INSERT INTO `bets_standard` VALUES (32, '25510205', '2551020501', 'ค ๕.๑', 'เข้าใจและใช้วิธีการทางสถิติในการวิเคราะห์ข้อมูล');
INSERT INTO `bets_standard` VALUES (33, '25510205', '2551020502', 'ค ๕.๒', 'ใช้วิธีการทางสถิติและความรู้เกี่ยวกับความน่าจะเป็นในการคาดการณ์ได้อย่างสมเหตุสมผล');
INSERT INTO `bets_standard` VALUES (34, '25510205', '2551020503', 'ค ๕.๓', 'ใช้ความรู้เกี่ยวกับสถิติและความน่าจะเป็นช่วยในการตัดสินใจและแก้ปัญหา');
INSERT INTO `bets_standard` VALUES (35, '25510206', '2551020601', 'ค ๖.๑', 'มีความสามารถในการแก้ปัญหา การให้เหตุผล การสื่อสาร การสื่อความหมายทางคณิตศาสตร์ และการนำเสนอ การเชื่อมโยงความรู้ ต่าง ๆ ทางคณิตศาสตร์ และเชื่อมโยงคณิตศาสตร์กับศาสตร์อื่นๆ และมีความคิดริเริ่มสร้างสรรค์');
INSERT INTO `bets_standard` VALUES (36, '25510301', '2551030101', 'ว ๑.๑', 'เข้าใจหน่วยพื้นฐานของสิ่งมีชีวิต ความสัมพันธ์ของโครงสร้าง และหน้าที่ของระบบต่างๆ ของสิ่งมีชีวิตที่ทำงานสัมพันธ์กัน มีกระบวนการสืบเสาะหาความรู้สื่อสารสิ่งที่เรียนรู้และนำความรู้ไปใช้ในการดำรงชีวิตของตนเองและดูแลสิ่งมีชีวิต');
INSERT INTO `bets_standard` VALUES (37, '25510301', '2551030102', 'ว ๑.๒', 'เข้าใจกระบวนการและความสำคัญของการถ่ายทอดลักษณะทางพันธุกรรม วิวัฒนาการของสิ่งมีชีวิต ความหลากหลายทางชีวภาพ การใช้เทคโนโลยีชีวภาพที่มีผลกระทบต่อมนุษย์และสิ่งแวดล้อม มีกระบวนการสืบเสาะหาความรู้และจิตวิทยาศาสตร์ สื่อสารสิ่งที่เรียนรู้ และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_standard` VALUES (38, '25510302', '2551030201', 'ว ๒.๑', 'เข้าใจสิ่งแวดล้อมในท้องถิ่น ความสัมพันธ์ระหว่างสิ่งแวดล้อมกับสิ่งมีชีวิต ความสัมพันธ์ระหว่างสิ่งมีชีวิตต่าง ๆ ในระบบนิเวศ มีกระบวนการสืบเสาะหาความรู้และจิตวิทยาศาสตร์สื่อสารสิ่งที่เรียนรู้และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_standard` VALUES (39, '25510302', '2551030202', 'ว ๒.๒', 'เข้าใจความสำคัญของทรัพยากรธรรมชาติ การใช้ทรัพยากรธรรมชาติในระดับท้องถิ่น ประเทศ และโลกนำความรู้ไปใช้ในในการจัดการทรัพยากรธรรมชาติและสิ่งแวดล้อม\r\nในท้องถิ่นอย่างยั่งยืน');
INSERT INTO `bets_standard` VALUES (40, '25510303', '2551030301', 'ว ๓.๑', 'เข้าใจสมบัติของสาร ความสัมพันธ์ระหว่างสมบัติของสารกับโครงสร้างและแรงยึดเหนี่ยวระหว่างอนุภาค มีกระบวนการสืบเสาะ หาความรู้และจิตวิทยาศาสตร์ สื่อสารสิ่งที่เรียนรู้ นำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_standard` VALUES (41, '25510303', '2551030302', 'ว ๓.๒', 'เข้าใจหลักการและธรรมชาติของการเปลี่ยนแปลงสถานะของสาร การเกิดสารละลาย การเกิดปฏิกิริยา มีกระบวนการสืบเสาะ หาความรู้และจิตวิทยาศาสตร์สื่อสารสิ่งที่เรียนรู้ และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_standard` VALUES (42, '25510304', '2551030401', 'ว ๔.๑', 'เข้าใจธรรมชาติของแรงแม่เหล็กไฟฟ้า แรงโน้มถ่วง และแรงนิวเคลียร์ มีกระบวนการสืบเสาะหาความรู้ สื่อสารสิ่งที่เรียนรู้และนำความรู้ไปใช้ประโยชน์อย่างถูกต้องและมีคุณธรรม');
INSERT INTO `bets_standard` VALUES (43, '25510304', '2551030402', 'ว ๔.๒', 'เข้าใจลักษณะการเคลื่อนที่แบบต่างๆ ของวัตถุในธรรมชาติ มีกระบวนการสืบเสาะหาความรู้และจิตวิทยาศาสตร์ สื่อสารสิ่งที่เรียนรู้และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_standard` VALUES (44, '25510305', '2551030501', 'ว ๕.๑', 'เข้าใจความสัมพันธ์ระหว่างพลังงานกับการดำรงชีวิต การเปลี่ยนรูปพลังงาน ปฏิสัมพันธ์ระหว่างสารและพลังงาน ผลของการใช้พลังงานต่อชีวิตและสิ่งแวดล้อม มีกระบวน การสืบเสาะหาความรู้ สื่อสารสิ่งที่เรียนรู้และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_standard` VALUES (45, '25510306', '2551030601', 'ว ๖.๑', 'เข้าใจกระบวนการต่าง ๆ ที่เกิดขึ้นบนผิวโลกและภายในโลก ความสัมพันธ์ของกระบวนการต่าง ๆ ที่มีผลต่อการเปลี่ยนแปลงภูมิอากาศ ภูมิประเทศ และสัณฐานของโลก มีกระบวนการสืบเสาะหาความรู้และจิตวิทยาศาสตร์ สื่อสารสิ่งที่เรียนรู้และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_standard` VALUES (46, '25510307', '2551030701', 'ว ๗.๑', 'เข้าใจวิวัฒนาการของระบบสุริยะ กาแล็กซี และเอกภพ การปฏิสัมพันธ์ภายในระบบสุริยะ และผลต่อสิ่งมีชีวิตบนโลก มีกระบวนการสืบเสาะ หาความรู้และจิตวิทยาศาสตร์ การสื่อสารสิ่งที่เรียนรู้และนำความรู้ไปใช้ประโยชน์');
INSERT INTO `bets_standard` VALUES (47, '25510307', '2551030702', 'ว ๗.๒', 'เข้าใจความสำคัญของเทคโนโลยีอวกาศที่นำมาใช้ในการสำรวจอวกาศ และทรัพยากรธรรมชาติด้านการเกษตรและการสื่อสารมีกระบวนการสืบเสาะหาความรู้ และจิตวิทยาศาสตร์ สื่อสารสิ่งที่เรียนรู้ และนำความรู้ไปใช้ประโยชน์อย่างมีคุณธรรมต่อชีวิตและสิ่งแวดล้อม');
INSERT INTO `bets_standard` VALUES (48, '25510308', '2551030801', 'ว ๘.๑', 'ใช้กระบวนการทางวิทยาศาสตร์และจิตวิทยาศาสตร์ในการสืบเสาะหาความรู้ การแก้ปัญหา รู้ว่าปรากฏการณ์ทางธรรมชาติที่เกิดขึ้นส่วนใหญ่มีรูปแบบที่แน่นอน สามารถอธิบายและตรวจสอบได้ ภายใต้ข้อมูลและเครื่องมือที่มีอยู่ในช่วงเวลานั้นๆ เข้าใจว่า วิทยาศาสตร์ เทคโนโลยี สังคม และสิ่งแวดล้อมมีความเกี่ยวข้องสัมพันธ์กัน');
INSERT INTO `bets_standard` VALUES (49, '25510401', '2551040101', 'ส ๑.๑', 'รู้ และเข้าใจประวัติ ความสำคัญ ศาสดา หลักธรรมของพระพุทธศาสนาหรือศาสนาที่ตนนับถือและศาสนาอื่น มีศรัทธาที่ถูกต้อง ยึดมั่น และปฏิบัติตามหลักธรรม เพื่ออยู่ร่วมกันอย่างสันติสุข');
INSERT INTO `bets_standard` VALUES (50, '25510401', '2551040102', 'ส ๑.๒', 'เข้าใจ ตระหนักและปฏิบัติตนเป็นศาสนิกชนที่ดี และธำรงรักษาพระพุทธศาสนาหรือศาสนาที่ตนนับถือ');
INSERT INTO `bets_standard` VALUES (51, '25510402', '2551040201', 'ส ๒.๑', 'เข้าใจและปฏิบัติตนตามหน้าที่ของการเป็นพลเมืองดี มีค่านิยมที่ดีงาม และธำรงรักษาประเพณีและวัฒนธรรมไทย ดำรงชีวิตอยู่ร่วมกันในสังคมไทยและสังคมโลกอย่างสันติสุข');
INSERT INTO `bets_standard` VALUES (52, '25510402', '2551040202', 'ส ๒.๒', 'เข้าใจระบบการเมืองการปกครองในสังคมปัจจุบัน ยึดมั่น ศรัทธา และธำรงรักษาไว้ซึ่งการปกครองระบอบประชาธิปไตยอันมีพระมหากษัตริย์ทรงเป็นประมุข');
INSERT INTO `bets_standard` VALUES (53, '25510403', '2551040301', 'ส ๓.๑', 'เข้าใจและสามารถบริหารจัดการทรัพยากรในการผลิตและการบริโภค การใช้ทรัพยากรที่มีอยู่จำกัดได้อย่างมีประสิทธิภาพและคุ้มค่า รวมทั้งเข้าใจหลักการของเศรษฐกิจพอเพียง เพื่อการดำรงชีวิตอย่างมีดุลยภาพ');
INSERT INTO `bets_standard` VALUES (54, '25510403', '2551040302', 'ส ๓.๒', 'เข้าใจระบบและสถาบันทางเศรษฐกิจต่าง ๆ ความสัมพันธ์ทางเศรษฐกิจ และความจำเป็นของการร่วมมือกันทางเศรษฐกิจในสังคมโลก');
INSERT INTO `bets_standard` VALUES (55, '25510404', '2551040401', 'ส ๔.๑', 'เข้าใจความหมาย ความสำคัญของเวลาและยุคสมัยทางประวัติศาสตร์ สามารถใช้วิธีการทางประวัติศาสตร์มาวิเคราะห์เหตุการณ์ต่างๆ อย่างเป็นระบบ');
INSERT INTO `bets_standard` VALUES (56, '25510404', '2551040402', 'ส ๔.๒', 'เข้าใจพัฒนาการของมนุษยชาติจากอดีตจนถึงปัจจุบัน ในด้านความสัมพันธ์และการเปลี่ยนแปลงของเหตุการณ์อย่างต่อเนื่อง ตระหนักถึงความสำคัญและสามารถวิเคราะห์ผลกระทบที่เกิดขึ้น');
INSERT INTO `bets_standard` VALUES (57, '25510404', '2551040403', 'ส ๔.๓', 'เข้าใจความเป็นมาของชาติไทย วัฒนธรรม ภูมิปัญญาไทย มีความรัก ความภูมิใจและธำรงความเป็นไทย');
INSERT INTO `bets_standard` VALUES (58, '25510405', '2551040501', 'ส ๕.๑', 'เข้าใจลักษณะของโลกทางกายภาพ และความสัมพันธ์ของสรรพสิ่งซึ่งมีผลต่อกันและกันในระบบของธรรมชาติ ใช้แผนที่และเครื่องมือทางภูมิศาสตร์ในการค้นหา วิเคราะห์ สรุป และใช้ข้อมูลภูมิสารสนเทศอย่างมีประสิทธิภาพ');
INSERT INTO `bets_standard` VALUES (59, '25510405', '2551040502', 'ส ๕.๒', 'เข้าใจปฏิสัมพันธ์ระหว่างมนุษย์กับสภาพแวดล้อมทางกายภาพที่ก่อให้เกิดการสร้างสรรค์วัฒนธรรม มีจิตสำนึกและมีส่วนร่วม ในการอนุรักษ์ทรัพยากรและสิ่งแวดล้อม เพื่อการพัฒนาที่ยั่งยืน');
INSERT INTO `bets_standard` VALUES (60, '25510501', '2551050101', 'พ ๑.๑', 'เข้าใจธรรมชาติของการเจริญเติบโตและพัฒนาการของมนุษย์');
INSERT INTO `bets_standard` VALUES (61, '25510502', '2551050201', 'พ ๒.๑', 'เข้าใจและเห็นคุณค่าตนเอง ครอบครัว เพศศึกษา และมีทักษะในการดำเนินชีวิต');
INSERT INTO `bets_standard` VALUES (62, '25510503', '2551050301', 'พ ๓.๑', 'เข้าใจ มีทักษะในการเคลื่อนไหว กิจกรรมทางกาย การเล่นเกม และกีฬา');
INSERT INTO `bets_standard` VALUES (63, '25510503', '2551050302', 'พ ๓.๒', 'รักการออกกำลังกาย การเล่นเกม และการเล่นกีฬา ปฏิบัติเป็นประจำอย่างสม่ำเสมอ มีวินัย เคารพสิทธิ กฎ กติกา มีน้ำใจนักกีฬา มีจิตวิญญาณในการแข่งขันและชื่นชมในสุนทรียภาพของการกีฬา');
INSERT INTO `bets_standard` VALUES (64, '25510504', '2551050401', 'พ ๔.๑', 'เห็นคุณค่าและมีทักษะในการสร้างเสริมสุขภาพ การดำรงสุขภาพ การป้องกันโรคและการสร้างเสริมสมรรถภาพเพื่อสุขภาพ');
INSERT INTO `bets_standard` VALUES (65, '25510505', '2551050501', 'พ ๕.๑', 'ป้องกันและหลีกเลี่ยงปัจจัยเสี่ยง พฤติกรรมเสี่ยงต่อสุขภาพ อุบัติเหตุ การใช้ยา สารเสพติด และความรุนแรง');
INSERT INTO `bets_standard` VALUES (66, '25510701', '2551070101', 'ง ๑.๑', 'เข้าใจการทำงาน มีความคิดสร้างสรรค์ มีทักษะกระบวนการทำงาน ทักษะการจัดการ ทักษะกระบวนการแก้ปัญหาทักษะการทำงานร่วมกัน และทักษะการแสวงหาความรู้ มีคุณธรรม และลักษณะนิสัยในการทำงาน มีจิตสำนึกในการใช้พลังงาน ทรัพยากร และสิ่งแวดล้อม เพื่อการดำรงชีวิตและครอบครัว');
INSERT INTO `bets_standard` VALUES (67, '25510702', '2551070201', 'ง ๒.๑', 'เข้าใจเทคโนโลยีและกระบวนการเทคโนโลยี ออกแบบและสร้างสิ่งของเครื่องใช้ หรือวิธีการ ตามกระบวนการเทคโนโลยีอย่างมีความคิดสร้างสรรค์ เลือกใช้เทคโนโลยีในทางสร้างสรรค์ต่อชีวิต สังคม สิ่งแวดล้อม และมีส่วนร่วมในการจัดการเทคโนโลยีที่ยั่งยืน');
INSERT INTO `bets_standard` VALUES (68, '25510703', '2551070301', 'ง ๓.๑', 'เข้าใจ เห็นคุณค่า และใช้กระบวนการเทคโนโลยีสารสนเทศในการสืบค้นข้อมูล การเรียนรู้ การสื่อสาร การแก้ปัญหา การทำงาน และอาชีพอย่างมีประสิทธิภาพ ประสิทธิผล และมีคุณธรรม');
INSERT INTO `bets_standard` VALUES (69, '25510704', '2551070401', 'ง ๔.๑', 'เข้าใจ มีทักษะที่จำเป็น มีประสบการณ์ เห็นแนวทางในงานอาชีพ ใช้เทคโนโลยีเพื่อพัฒนาอาชีพ มีคุณธรรม และมีเจตคติที่ดีต่ออาชีพ');
INSERT INTO `bets_standard` VALUES (70, '25510801', '2551080101', 'ต ๑.๑', 'เข้าใจและตีความเรื่องที่ฟังและอ่านจากสื่อประเภทต่างๆ และแสดงความคิดเห็นอย่างมีเหตุผล');
INSERT INTO `bets_standard` VALUES (71, '25510801', '2551080102', 'ต ๑.๒', 'มีทักษะการสื่อสารทางภาษาในการแลกเปลี่ยนข้อมูลข่าวสาร แสดงความรู้สึกและความคิดเห็นอย่างมีประสิทธิภาพ');
INSERT INTO `bets_standard` VALUES (72, '25510801', '2551080103', 'ต ๑.๓', 'นำเสนอข้อมูลข่าวสาร ความคิดรวบยอด และความคิดเห็นในเรื่องต่างๆ โดยการพูดและการเขียน');
INSERT INTO `bets_standard` VALUES (73, '25510802', '2551080201', 'ต ๒.๑', 'เข้าใจความสัมพันธ์ระหว่างภาษากับวัฒนธรรมของเจ้าของภาษา และนำไปใช้ได้อย่างเหมาะสมกับกาลเทศะ');
INSERT INTO `bets_standard` VALUES (74, '25510802', '2551080202', 'ต ๒.๒', 'เข้าใจความเหมือนและความแตกต่างระหว่างภาษาและวัฒนธรรมของเจ้าของภาษากับภาษาและวัฒนธรรมไทย และนำมาใช้อย่างถูกต้องและเหมาะสม');
INSERT INTO `bets_standard` VALUES (75, '25510803', '2551080301', 'ต ๓.๑', 'ใช้ภาษาต่างประเทศในการเชื่อมโยงความรู้กับกลุ่มสาระการเรียนรู้อื่น และเป็นพื้นฐานในการพัฒนา แสวงหาความรู้ และเปิดโลกทัศน์ของตน');
INSERT INTO `bets_standard` VALUES (76, '25510804', '2551080401', 'ต ๔.๑', 'ใช้ภาษาต่างประเทศในสถานการณ์ต่างๆ ทั้งในสถานศึกษา ชุมชน และสังคม');
INSERT INTO `bets_standard` VALUES (77, '25510804', '2551080402', 'ต ๔.๒', 'ใช้ภาษาต่างประเทศเป็นเครื่องมือพื้นฐานในการศึกษาต่อ การประกอบอาชีพ และการแลกเปลี่ยนเรียนรู้กับสังคมโลก');

CREATE TABLE `bets_substance` (
  `id` int(11) NOT NULL auto_increment,
  `group_code` varchar(7) NOT NULL,
  `substance_code` varchar(10) NOT NULL,
  `substance_name` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `substance_code_2` (`substance_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

INSERT INTO `bets_substance` VALUES (1, '255106', '25510601', 'ทัศนศิลป์');
INSERT INTO `bets_substance` VALUES (2, '255106', '25510602', 'ดนตรี');
INSERT INTO `bets_substance` VALUES (3, '255106', '25510603', 'นาฏศิลป์');
INSERT INTO `bets_substance` VALUES (4, '255101', '25510101', 'การอ่าน');
INSERT INTO `bets_substance` VALUES (5, '255101', '25510102', 'การเขียน');
INSERT INTO `bets_substance` VALUES (6, '255101', '25510103', 'การฟัง การดู และการพูด');
INSERT INTO `bets_substance` VALUES (7, '255101', '25510104', 'หลักการใช้ภาษาไทย');
INSERT INTO `bets_substance` VALUES (8, '255101', '25510105', 'วรรณคดีและวรรณกรรม');
INSERT INTO `bets_substance` VALUES (9, '255102', '25510201', 'จำนวนและการดำเนินการ');
INSERT INTO `bets_substance` VALUES (10, '255102', '25510202', 'การวัด');
INSERT INTO `bets_substance` VALUES (11, '255102', '25510203', 'เรขาคณิต');
INSERT INTO `bets_substance` VALUES (12, '255102', '25510204', 'พีชคณิต');
INSERT INTO `bets_substance` VALUES (13, '255102', '25510205', 'การวิเคราะห์ข้อมูลและความน่าจะเป็น');
INSERT INTO `bets_substance` VALUES (14, '255102', '25510206', 'ทักษะและกระบวนการทางคณิตศาสตร์');
INSERT INTO `bets_substance` VALUES (15, '255103', '25510301', 'สิ่งมีชีวิตกับกระบวนการดำรงชีวิต');
INSERT INTO `bets_substance` VALUES (16, '255103', '25510302', 'ชีวิตกับสิ่งแวดล้อม');
INSERT INTO `bets_substance` VALUES (17, '255103', '25510303', 'สารและสมบัติของสาร');
INSERT INTO `bets_substance` VALUES (18, '255103', '25510304', 'แรงและการเคลื่อนที่');
INSERT INTO `bets_substance` VALUES (19, '255103', '25510305', 'พลังงาน');
INSERT INTO `bets_substance` VALUES (20, '255103', '25510306', 'กระบวนการเปลี่ยนแปลงของโลก');
INSERT INTO `bets_substance` VALUES (21, '255103', '25510307', 'ดาราศาสตร์และอวกาศ');
INSERT INTO `bets_substance` VALUES (22, '255103', '25510308', 'ธรรมชาติของวิทยาศาสตร์และเทคโนโลยี');
INSERT INTO `bets_substance` VALUES (23, '255104', '25510401', 'ศาสนา ศีลธรรม จริยธรรม');
INSERT INTO `bets_substance` VALUES (24, '255104', '25510402', 'หน้าที่พลเมือง วัฒนธรรม และการดำเนินชีวิตในสังคม');
INSERT INTO `bets_substance` VALUES (25, '255104', '25510403', 'เศรษฐศาสตร์');
INSERT INTO `bets_substance` VALUES (26, '255104', '25510404', 'ประวัติศาสตร์');
INSERT INTO `bets_substance` VALUES (27, '255104', '25510405', 'ภูมิศาสตร์');
INSERT INTO `bets_substance` VALUES (28, '255105', '25510501', 'การเจริญเติบโตและพัฒนาการของมนุษย์');
INSERT INTO `bets_substance` VALUES (29, '255105', '25510502', 'ชีวิตและครอบครัว');
INSERT INTO `bets_substance` VALUES (30, '255105', '25510503', 'การเคลื่อนไหว การออกกำลังกาย การเล่นเกม กีฬาไทย และกีฬาสากล');
INSERT INTO `bets_substance` VALUES (31, '255105', '25510504', 'การสร้างเสริมสุขภาพ สมรรถภาพและการป้องกันโรค');
INSERT INTO `bets_substance` VALUES (32, '255105', '25510505', 'ความปลอดภัยในชีวิต');
INSERT INTO `bets_substance` VALUES (33, '255107', '25510701', 'การดำรงชีวิตและครอบครัว');
INSERT INTO `bets_substance` VALUES (34, '255107', '25510702', 'การออกแบบและเทคโนโลยี');
INSERT INTO `bets_substance` VALUES (35, '255107', '25510703', 'เทคโนโลยีสารสนเทศและการสื่อสาร');
INSERT INTO `bets_substance` VALUES (36, '255107', '25510704', 'การอาชีพ');
INSERT INTO `bets_substance` VALUES (37, '255108', '25510801', 'ภาษาเพื่อการสื่อสาร');
INSERT INTO `bets_substance` VALUES (38, '255108', '25510802', 'ภาษาและวัฒนธรรม');
INSERT INTO `bets_substance` VALUES (39, '255108', '25510803', 'ภาษากับความสัมพันธ์กับกลุ่มสาระการเรียนรู้อื่น');
INSERT INTO `bets_substance` VALUES (40, '255108', '25510804', 'ภาษากับความสัมพันธ์กับชุมชนและโลก');

CREATE TABLE `bets_test` (
  `id` int(11) NOT NULL auto_increment,
  `test_name` varchar(150) NOT NULL,
  `master_test` int(11) NOT NULL,
  `s_group` int(11) NOT NULL,
  `statement` varchar(250) NOT NULL,
  `class_room` tinyint(4) NOT NULL,
  `item_num` int(11) NOT NULL,
  `test_score` int(11) NOT NULL,
  `test_time` int(11) NOT NULL,
  `g1` float NOT NULL,
  `g2` float NOT NULL,
  `test_active` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `bets_test_schuser` (
  `id` int(11) NOT NULL auto_increment,
  `test_id` int(11) NOT NULL,
  `school` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `stop_date` datetime NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `system_sync_code` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `office_code` varchar(10) NOT NULL,
  `sync_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `system_sync_code` VALUES (1, 'xxxx', 'xxxx');

CREATE TABLE `system_sync_smss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_code` int(11) NOT NULL,
  `system_name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `server_ip` varchar(50) NOT NULL,
  `sync_code` varchar(50) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `bookobec_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1_bookobec` tinyint(4) NOT NULL,
  `p2_bookobec` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `delegate_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `start` date NOT NULL,
  `finish` date NOT NULL,
  `remark` varchar(250) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `delegate_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `system_khet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(11) NOT NULL,
  `code2` varchar(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `precis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `system_khet` VALUES (1, '1001', '1001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากรุงเทพมหานคร', 'สพป.กรุงเทพมหานคร');
INSERT INTO `system_khet` VALUES (2, '1101', '1101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสมุทรปราการ เขต 1', 'สพป.สมุทรปราการ เขต 1');
INSERT INTO `system_khet` VALUES (3, '1102', '1102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสมุทรปราการ เขต 1', 'สพป.สมุทรปราการ เขต 2');
INSERT INTO `system_khet` VALUES (4, '1201', '1201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานนทบุรี เขต 1', 'สพป.นนทบุรี เขต 1');
INSERT INTO `system_khet` VALUES (5, '1202', '1202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานนทบุรี เขต 2', 'สพป.นนทบุรี เขต 2');
INSERT INTO `system_khet` VALUES (6, '1301', '1301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปทุมธานี เขต 1', 'สพป.ปทุมธานี เขต 1');
INSERT INTO `system_khet` VALUES (7, '1302', '1302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปทุมธานี เขต 2', 'สพป.ปทุมธานี เขต 2');
INSERT INTO `system_khet` VALUES (8, '1401', '1401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพระนครศรีอยุธยา เขต 1', 'สพป.พระนครศรีอยุธยา เขต 1');
INSERT INTO `system_khet` VALUES (9, '1402', '1402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพระนครศรีอยุธยา เขต 2', 'สพป.พระนครศรีอยุธยา เขต 2');
INSERT INTO `system_khet` VALUES (10, '1501', '1501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอ่างทอง', 'สพป.อ่างทอง');
INSERT INTO `system_khet` VALUES (11, '1601', '1601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาลพบุรี เขต 1', 'สพป.ลพบุรี เขต 1');
INSERT INTO `system_khet` VALUES (12, '1602', '1602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาลพบุรี เขต 2', 'สพป.ลพบุรี เขต 2');
INSERT INTO `system_khet` VALUES (13, '1701', '1701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสิงห์บุรี', 'สพป.สิงห์บุรี');
INSERT INTO `system_khet` VALUES (14, '1801', '1801', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชัยนาท', 'สพป.ชัยนาท');
INSERT INTO `system_khet` VALUES (15, '1901', '1901', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสระบุรี เขต 1', 'สพป.สระบุรี เขต 1');
INSERT INTO `system_khet` VALUES (16, '1902', '1902', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสระบุรี เขต 2', 'สพป.สระบุรี เขต 2');
INSERT INTO `system_khet` VALUES (17, '2001', '2001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชลบุรี เขต 1', 'สพป.ชลบุรี เขต 1');
INSERT INTO `system_khet` VALUES (18, '2002', '2002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชลบุรี เขต 2', 'สพป.ชลบุรี เขต 2');
INSERT INTO `system_khet` VALUES (19, '2003', '2003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชลบุรี เขต 3', 'สพป.ชลบุรี เขต 3');
INSERT INTO `system_khet` VALUES (20, '2101', '2101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาระยอง เขต 1', 'สพป.ระยอง เขต 1');
INSERT INTO `system_khet` VALUES (21, '2102', '2102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาระยอง เขต 2', 'สพป.ระยอง เขต 2');
INSERT INTO `system_khet` VALUES (22, '2201', '2201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาจันทบุรี เขต 1', 'สพป.จันทบุรี เขต 1');
INSERT INTO `system_khet` VALUES (23, '2202', '2202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาจันทบุรี เขต 2', 'สพป.จันทบุรี เขต 2');
INSERT INTO `system_khet` VALUES (24, '2301', '2301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาตราด', 'สพป.ตราด');
INSERT INTO `system_khet` VALUES (25, '2401', '2401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาฉะเชิงเทรา เขต 1', 'สพป.ฉะเชิงเทรา เขต 1');
INSERT INTO `system_khet` VALUES (26, '2402', '2402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาฉะเชิงเทรา เขต 2', 'สพป.ฉะเชิงเทรา เขต 2');
INSERT INTO `system_khet` VALUES (27, '2501', '2501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปราจีนบุรี เขต 1', 'สพป.ปราจีนบุรี เขต 1');
INSERT INTO `system_khet` VALUES (28, '2502', '2502', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปราจีนบุรี เขต 2', 'สพป.ปราจีนบุรี เขต 2');
INSERT INTO `system_khet` VALUES (29, '2601', '2601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครนายก', 'สพป.นครนายก');
INSERT INTO `system_khet` VALUES (30, '2701', '2701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสระแก้ว เขต 1', 'สพป.สระแก้ว เขต 1');
INSERT INTO `system_khet` VALUES (31, '2702', '2702', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสระแก้ว เขต 2', 'สพป.สระแก้ว เขต 2');
INSERT INTO `system_khet` VALUES (32, '3001', '3001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 1', 'สพป.นครราชสีมา เขต 1');
INSERT INTO `system_khet` VALUES (33, '3002', '3002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 2', 'สพป.นครราชสีมา เขต 2');
INSERT INTO `system_khet` VALUES (34, '3003', '3003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 3', 'สพป.นครราชสีมา เขต 3');
INSERT INTO `system_khet` VALUES (35, '3004', '3004', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 4', 'สพป.นครราชสีมา เขต 4');
INSERT INTO `system_khet` VALUES (36, '3005', '3005', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 5', 'สพป.นครราชสีมา เขต 5');
INSERT INTO `system_khet` VALUES (37, '3006', '3006', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 6', 'สพป.นครราชสีมา เขต 6');
INSERT INTO `system_khet` VALUES (38, '3007', '3007', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 7', 'สพป.นครราชสีมา เขต 7');
INSERT INTO `system_khet` VALUES (39, '3101', '3101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาบุรีรัมย์ เขต 1', 'สพป.บุรีรัมย์ เขต 1');
INSERT INTO `system_khet` VALUES (40, '3102', '3102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาบุรีรัมย์ เขต 2', 'สพป.บุรีรัมย์ เขต 2');
INSERT INTO `system_khet` VALUES (41, '3103', '3103', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาบุรีรัมย์ เขต 3', 'สพป.บุรีรัมย์ เขต 3');
INSERT INTO `system_khet` VALUES (42, '3104', '3104', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาบุรีรัมย์ เขต 4', 'สพป.บุรีรัมย์ เขต 4');
INSERT INTO `system_khet` VALUES (43, '3201', '3201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุรินทร์ เขต 1', 'สพป.สุรินทร์ เขต 1');
INSERT INTO `system_khet` VALUES (44, '3202', '3202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุรินทร์ เขต 2', 'สพป.สุรินทร์ เขต 2');
INSERT INTO `system_khet` VALUES (45, '3203', '3203', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุรินทร์ เขต 3', 'สพป.สุรินทร์ เขต 3');
INSERT INTO `system_khet` VALUES (46, '3301', '3301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาศรีสะเกษ เขต 1', 'สพป.ศรีสะเกษ เขต 1');
INSERT INTO `system_khet` VALUES (47, '3302', '3302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาศรีสะเกษ เขต 2', 'สพป.ศรีสะเกษ เขต 2');
INSERT INTO `system_khet` VALUES (48, '3303', '3303', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาศรีสะเกษ เขต 3', 'สพป.ศรีสะเกษ เขต 3');
INSERT INTO `system_khet` VALUES (49, '3304', '3304', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาศรีสะเกษ เขต 4', 'สพป.ศรีสะเกษ เขต 4');
INSERT INTO `system_khet` VALUES (50, '3401', '3401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุบลราชธานี เขต 1', 'สพป.อุบลราชธานี เขต 1');
INSERT INTO `system_khet` VALUES (51, '3402', '3402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุบลราชธานี เขต 2', 'สพป.อุบลราชธานี เขต 2');
INSERT INTO `system_khet` VALUES (52, '3403', '3403', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุบลราชธานี เขต 3', 'สพป.อุบลราชธานี เขต 3');
INSERT INTO `system_khet` VALUES (53, '3404', '3404', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุบลราชธานี เขต 4', 'สพป.อุบลราชธานี เขต 4');
INSERT INTO `system_khet` VALUES (54, '3405', '3405', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุบลราชธานี เขต 5', 'สพป.อุบลราชธานี เขต 5');
INSERT INTO `system_khet` VALUES (55, '3501', '3501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษายโสธร เขต 1', 'สพป.ยโสธร เขต 1');
INSERT INTO `system_khet` VALUES (56, '3502', '3502', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษายโสธร เขต 2', 'สพป.ยโสธร เขต 2');
INSERT INTO `system_khet` VALUES (57, '3601', '3601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชัยภูมิ เขต 1', 'สพป.ชัยภูมิ เขต 1');
INSERT INTO `system_khet` VALUES (58, '3602', '3602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชัยภูมิ เขต 2', 'สพป.ชัยภูมิ เขต 2');
INSERT INTO `system_khet` VALUES (59, '3603', '3603', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชัยภูมิ เขต 3', 'สพป.ชัยภูมิ เขต 3');
INSERT INTO `system_khet` VALUES (60, '3701', '3701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอำนาจเจริญ', 'สพป.อำนาจเจริญ');
INSERT INTO `system_khet` VALUES (61, '3801', '3801', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาบึงกาฬ', 'สพป.บึงกาฬ');
INSERT INTO `system_khet` VALUES (62, '3901', '3901', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาหนองบัวลำภู เขต 1', 'สพป.หนองบัวลำภู เขต 1');
INSERT INTO `system_khet` VALUES (63, '3902', '3902', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาหนองบัวลำภู เขต 2', 'สพป.หนองบัวลำภู เขต 2');
INSERT INTO `system_khet` VALUES (64, '4001', '4001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาขอนแก่น เขต 1', 'สพป.ขอนแก่น เขต 1');
INSERT INTO `system_khet` VALUES (65, '4002', '4002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาขอนแก่น เขต 2', 'สพป.ขอนแก่น เขต 2');
INSERT INTO `system_khet` VALUES (66, '4003', '4003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาขอนแก่น เขต 3', 'สพป.ขอนแก่น เขต 3');
INSERT INTO `system_khet` VALUES (67, '4004', '4004', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาขอนแก่น เขต 4', 'สพป.ขอนแก่น เขต 4');
INSERT INTO `system_khet` VALUES (68, '4005', '4005', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาขอนแก่น เขต 5', 'สพป.ขอนแก่น เขต 5');
INSERT INTO `system_khet` VALUES (69, '4101', '4101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุดรธานี เขต 1', 'สพป.อุดรธานี เขต 1');
INSERT INTO `system_khet` VALUES (70, '4102', '4102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุดรธานี เขต 2', 'สพป.อุดรธานี เขต 2');
INSERT INTO `system_khet` VALUES (71, '4103', '4103', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุดรธานี เขต 3', 'สพป.อุดรธานี เขต 3');
INSERT INTO `system_khet` VALUES (72, '4104', '4104', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุดรธานี เขต 4', 'สพป.อุดรธานี เขต 4');
INSERT INTO `system_khet` VALUES (73, '4201', '4201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเลย เขต 1', 'สพป.เลย เขต 1');
INSERT INTO `system_khet` VALUES (74, '4202', '4202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเลย เขต 2', 'สพป.เลย เขต 2');
INSERT INTO `system_khet` VALUES (75, '4203', '4203', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเลย เขต 3', 'สพป.เลย เขต 3');
INSERT INTO `system_khet` VALUES (76, '4301', '4301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาหนองคาย เขต 1', 'สพป.หนองคาย เขต 1');
INSERT INTO `system_khet` VALUES (77, '4302', '4302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาหนองคาย เขต 2', 'สพป.หนองคาย เขต 2');
INSERT INTO `system_khet` VALUES (78, '4401', '4401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษามหาสารคาม เขต 1', 'สพป.มหาสารคาม เขต 1');
INSERT INTO `system_khet` VALUES (79, '4402', '4402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษามหาสารคาม เขต 2', 'สพป.มหาสารคาม เขต 2');
INSERT INTO `system_khet` VALUES (80, '4403', '4403', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษามหาสารคาม เขต 3', 'สพป.มหาสารคาม เขต 3');
INSERT INTO `system_khet` VALUES (81, '4501', '4501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาร้อยเอ็ด เขต 1', 'สพป.ร้อยเอ็ด เขต 1');
INSERT INTO `system_khet` VALUES (82, '4502', '4502', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาร้อยเอ็ด เขต 2', 'สพป.ร้อยเอ็ด เขต 2');
INSERT INTO `system_khet` VALUES (83, '4503', '4503', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาร้อยเอ็ด เขต 3', 'สพป.ร้อยเอ็ด เขต 3');
INSERT INTO `system_khet` VALUES (84, '4601', '4601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาฬสินธุ์ เขต 1', 'สพป.กาฬสินธุ์ เขต 1');
INSERT INTO `system_khet` VALUES (85, '4602', '4602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาฬสินธุ์ เขต 2', 'สพป.กาฬสินธุ์ เขต 2');
INSERT INTO `system_khet` VALUES (86, '4603', '4603', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาฬสินธุ์ เขต 3', 'สพป.กาฬสินธุ์ เขต 3');
INSERT INTO `system_khet` VALUES (87, '4701', '4701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสกลนคร เขต 1', 'สพป.สกลนคร เขต 1');
INSERT INTO `system_khet` VALUES (88, '4702', '4702', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสกลนคร เขต 2', 'สพป.สกลนคร เขต 2');
INSERT INTO `system_khet` VALUES (89, '4703', '4703', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสกลนคร เขต 3', 'สพป.สกลนคร เขต 3');
INSERT INTO `system_khet` VALUES (90, '4801', '4801', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครพนม เขต 1', 'สพป.นครพนม เขต 1');
INSERT INTO `system_khet` VALUES (91, '4802', '4802', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครพนม เขต 2', 'สพป.นครพนม เขต 2');
INSERT INTO `system_khet` VALUES (92, '4901', '4901', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษามุกดาหาร', 'สพป.มุกดาหาร');
INSERT INTO `system_khet` VALUES (93, '5001', '5001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงใหม่ เขต 1', 'สพป.เชียงใหม่ เขต 1');
INSERT INTO `system_khet` VALUES (94, '5002', '5002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงใหม่ เขต 2', 'สพป.เชียงใหม่ เขต 2');
INSERT INTO `system_khet` VALUES (95, '5003', '5003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงใหม่ เขต 3', 'สพป.เชียงใหม่ เขต 3');
INSERT INTO `system_khet` VALUES (96, '5004', '5004', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงใหม่ เขต 4', 'สพป.เชียงใหม่ เขต 4');
INSERT INTO `system_khet` VALUES (97, '5005', '5005', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงใหม่ เขต 5', 'สพป.เชียงใหม่ เขต 5');
INSERT INTO `system_khet` VALUES (98, '5006', '5006', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงใหม่ เขต 6', 'สพป.เชียงใหม่ เขต 6');
INSERT INTO `system_khet` VALUES (99, '5101', '5101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษา.ลำพูน เขต 1', 'สพป.ลำพูน เขต 1');
INSERT INTO `system_khet` VALUES (100, '5102', '5102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาลำพูน เขต 2', 'สพป.ลำพูน เขต 2');
INSERT INTO `system_khet` VALUES (101, '5201', '5201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาลำปาง เขต 1', 'สพป.ลำปาง เขต 1');
INSERT INTO `system_khet` VALUES (102, '5202', '5202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาลำปาง เขต 2', 'สพป.ลำปาง เขต 2');
INSERT INTO `system_khet` VALUES (103, '5203', '5203', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาลำปาง เขต 3', 'สพป.ลำปาง เขต 3');
INSERT INTO `system_khet` VALUES (104, '5301', '5301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุตรดิตถ์ เขต 1', 'สพป.อุตรดิตถ์ เขต 1');
INSERT INTO `system_khet` VALUES (105, '5302', '5302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุตรดิตถ์ เขต 2', 'สพป.อุตรดิตถ์ เขต 2');
INSERT INTO `system_khet` VALUES (106, '5401', '5401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาแพร่ เขต 1', 'สพป.แพร่ เขต 1');
INSERT INTO `system_khet` VALUES (107, '5402', '5402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาแพร่ เขต 2', 'สพป.แพร่ เขต 2');
INSERT INTO `system_khet` VALUES (108, '5501', '5501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาน่าน เขต 1', 'สพป.น่าน เขต 1');
INSERT INTO `system_khet` VALUES (109, '5502', '5502', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาน่าน เขต 2', 'สพป.น่าน เขต 2');
INSERT INTO `system_khet` VALUES (110, '5601', '5601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพะเยา เขต 1', 'สพป.พะเยา เขต 1');
INSERT INTO `system_khet` VALUES (111, '5602', '5602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพะเยา เขต 2', 'สพป.พะเยา เขต 2');
INSERT INTO `system_khet` VALUES (112, '5701', '5701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงราย เขต 1', 'สพป.เชียงราย เขต 1');
INSERT INTO `system_khet` VALUES (113, '5702', '5702', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงราย เขต 2', 'สพป.เชียงราย เขต 2');
INSERT INTO `system_khet` VALUES (114, '5703', '5703', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงราย เขต 3', 'สพป.เชียงราย เขต 3');
INSERT INTO `system_khet` VALUES (115, '5704', '5704', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงราย เขต 4', 'สพป.เชียงราย เขต 4');
INSERT INTO `system_khet` VALUES (116, '5801', '5801', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาแม่ฮ่องสอน เขต 1', 'สพป.แม่ฮ่องสอน เขต 1');
INSERT INTO `system_khet` VALUES (117, '5802', '5802', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาแม่ฮ่องสอน เขต 2', 'สพป.แม่ฮ่องสอน เขต 2');
INSERT INTO `system_khet` VALUES (118, '6001', '6001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครสวรรค์ เขต 1', 'สพป.นครสวรรค์ เขต 1');
INSERT INTO `system_khet` VALUES (119, '6002', '6002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครสวรรค์ เขต 2', 'สพป.นครสวรรค์ เขต 2');
INSERT INTO `system_khet` VALUES (120, '6003', '6003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครสวรรค์ เขต 3', 'สพป.นครสวรรค์ เขต 3');
INSERT INTO `system_khet` VALUES (121, '6101', '6101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุทัยธานี เขต 1', 'สพป.อุทัยธานี เขต 1');
INSERT INTO `system_khet` VALUES (122, '6102', '6102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุทัยธานี เขต 2', 'สพป.อุทัยธานี เขต 2');
INSERT INTO `system_khet` VALUES (123, '6201', '6201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากำแพงเพชร เขต 1', 'สพป.กำแพงเพชร เขต 1');
INSERT INTO `system_khet` VALUES (124, '6202', '6202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากำแพงเพชร เขต 2', 'สพป.กำแพงเพชร เขต 2');
INSERT INTO `system_khet` VALUES (125, '6301', '6301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาตาก เขต 1', 'สพป.ตาก เขต 1');
INSERT INTO `system_khet` VALUES (126, '6302', '6302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาตาก เขต 2', 'สพป.ตาก เขต 2');
INSERT INTO `system_khet` VALUES (127, '6401', '6401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุโขทัย เขต 1', 'สพป.สุโขทัย เขต 1');
INSERT INTO `system_khet` VALUES (128, '6402', '6402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุโขทัย เขต 2', 'สพป.สุโขทัย เขต 2');
INSERT INTO `system_khet` VALUES (129, '6501', '6501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพิษณุโลก เขต 1', 'สพป.พิษณุโลก เขต 1');
INSERT INTO `system_khet` VALUES (130, '6502', '6502', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพิษณุโลก เขต 2', 'สพป.พิษณุโลก เขต 2');
INSERT INTO `system_khet` VALUES (131, '6503', '6503', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพิษณุโลก เขต 3', 'สพป.พิษณุโลก เขต 3');
INSERT INTO `system_khet` VALUES (132, '6601', '6601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพิจิตร เขต 1', 'สพป.พิจิตร เขต 1');
INSERT INTO `system_khet` VALUES (133, '6602', '6602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพิจิตร เขต 2', 'สพป.พิจิตร เขต 2');
INSERT INTO `system_khet` VALUES (134, '6701', '6701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเพชรบูรณ์ เขต 1', 'สพป.เพชรบูรณ์ เขต 1');
INSERT INTO `system_khet` VALUES (135, '6702', '6702', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเพชรบูรณ์ เขต 2', 'สพป.เพชรบูรณ์ เขต 2');
INSERT INTO `system_khet` VALUES (136, '6703', '6703', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเพชรบูรณ์ เขต 3', 'สพป.เพชรบูรณ์ เขต 3');
INSERT INTO `system_khet` VALUES (137, '7001', '7001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาราชบุรี เขต 1', 'สพป.ราชบุรี เขต 1');
INSERT INTO `system_khet` VALUES (138, '7002', '7002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาราชบุรี เขต 2', 'สพป.ราชบุรี เขต 2');
INSERT INTO `system_khet` VALUES (139, '7101', '7101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาญจนบุรี เขต 1', 'สพป.กาญจนบุรี เขต 1');
INSERT INTO `system_khet` VALUES (140, '7102', '7102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาญจนบุรี เขต 2', 'สพป.กาญจนบุรี เขต 2');
INSERT INTO `system_khet` VALUES (141, '7103', '7103', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาญจนบุรี เขต 3', 'สพป.กาญจนบุรี เขต 3');
INSERT INTO `system_khet` VALUES (142, '7104', '7104', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาญจนบุรี เขต 4', 'สพป.กาญจนบุรี เขต 4');
INSERT INTO `system_khet` VALUES (143, '7201', '7201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุพรรณบุรี เขต 1', 'สพป.สุพรรณบุรี เขต 1');
INSERT INTO `system_khet` VALUES (144, '7202', '7202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุพรรณบุรี เขต 2', 'สพป.สุพรรณบุรี เขต 2');
INSERT INTO `system_khet` VALUES (145, '7203', '7203', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุพรรณบุรี เขต 3', 'สพป.สุพรรณบุรี เขต 3');
INSERT INTO `system_khet` VALUES (146, '7301', '7301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครปฐม เขต 1', 'สพป.นครปฐม เขต 1');
INSERT INTO `system_khet` VALUES (147, '7302', '7302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครปฐม เขต 2', 'สพป.นครปฐม เขต 2');
INSERT INTO `system_khet` VALUES (148, '7401', '7401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสมุทรสาคร', 'สพป.สมุทรสาคร');
INSERT INTO `system_khet` VALUES (149, '7501', '7501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสมุทรสงคราม', 'สพป.สมุทรสงคราม');
INSERT INTO `system_khet` VALUES (150, '7601', '7601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเพชรบุรี เขต 1', 'สพป.เพชรบุรี เขต 1');
INSERT INTO `system_khet` VALUES (151, '7602', '7602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเพชรบุรี เขต 2', 'สพป.เพชรบุรี เขต 2');
INSERT INTO `system_khet` VALUES (152, '7701', '7701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาประจวบ คีรีขันธ์ เขต 1', 'สพป.ประจวบ คีรีขันธ์ เขต 1');
INSERT INTO `system_khet` VALUES (153, '7702', '7702', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาประจวบคีรีขันธ์ เขต 2', 'สพป.ประจวบคีรีขันธ์ เขต 2');
INSERT INTO `system_khet` VALUES (154, '8001', '8001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครศรีธรรมราช เขต 1', 'สพป.นครศรีธรรมราช เขต 1');
INSERT INTO `system_khet` VALUES (155, '8002', '8002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครศรีธรรมราช เขต 2', 'สพป.นครศรีธรรมราช เขต 2');
INSERT INTO `system_khet` VALUES (156, '8003', '8003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครศรีธรรมราช เขต 3', 'สพป.นครศรีธรรมราช เขต 3');
INSERT INTO `system_khet` VALUES (157, '8004', '8004', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครศรีธรรมราช เขต 4', 'สพป.นครศรีธรรมราช เขต 4');
INSERT INTO `system_khet` VALUES (158, '8101', '8101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากระบี่', 'สพป.กระบี่');
INSERT INTO `system_khet` VALUES (159, '8201', '8201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพังงา', 'สพป.พังงา');
INSERT INTO `system_khet` VALUES (160, '8301', '8301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาภูเก็ต', 'สพป.ภูเก็ต');
INSERT INTO `system_khet` VALUES (161, '8401', '8401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุราษฎร์ธานี เขต 1', 'สพป.สุราษฎร์ธานี เขต 1');
INSERT INTO `system_khet` VALUES (162, '8402', '8402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุราษฎร์ธานี เขต 2', 'สพป.สุราษฎร์ธานี เขต 2');
INSERT INTO `system_khet` VALUES (163, '8403', '8403', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุราษฎร์ธานี เขต 3', 'สพป.สุราษฎร์ธานี เขต 3');
INSERT INTO `system_khet` VALUES (164, '8501', '8501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาระนอง', 'สพป.ระนอง');
INSERT INTO `system_khet` VALUES (165, '8601', '8601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชุมพร เขต 1', 'สพป.ชุมพร เขต 1');
INSERT INTO `system_khet` VALUES (166, '8602', '8602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชุมพร เขต 2', 'สพป.ชุมพร เขต 2');
INSERT INTO `system_khet` VALUES (167, '9001', '9001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสงขลา เขต 1', 'สพป.สงขลา เขต 1');
INSERT INTO `system_khet` VALUES (168, '9002', '9002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสงขลา เขต 2', 'สพป.สงขลา เขต 2');
INSERT INTO `system_khet` VALUES (169, '9003', '9003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสงขลา เขต 3', 'สพป.สงขลา เขต 3');
INSERT INTO `system_khet` VALUES (170, '9101', '9101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสตูล', 'สพป.สตูล');
INSERT INTO `system_khet` VALUES (171, '9201', '9201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาตรัง เขต 1', 'สพป.ตรัง เขต 1');
INSERT INTO `system_khet` VALUES (172, '9202', '9202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาตรัง เขต 2', 'สพป.ตรัง เขต 2');
INSERT INTO `system_khet` VALUES (173, '9301', '9301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพัทลุง เขต 1', 'สพป.พัทลุง เขต 1');
INSERT INTO `system_khet` VALUES (174, '9302', '9302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพัทลุง เขต 2', 'สพป.พัทลุง เขต 2');
INSERT INTO `system_khet` VALUES (175, '9401', '9401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปัตตานี เขต 1', 'สพป.ปัตตานี เขต 1');
INSERT INTO `system_khet` VALUES (176, '9402', '9402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปัตตานี เขต 2', 'สพป.ปัตตานี เขต 2');
INSERT INTO `system_khet` VALUES (177, '9403', '9403', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปัตตานี เขต 3', 'สพป.ปัตตานี เขต 3');
INSERT INTO `system_khet` VALUES (178, '9501', '9501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษายะลา เขต 1', 'สพป.ยะลา เขต 1');
INSERT INTO `system_khet` VALUES (179, '9502', '9502', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษายะลา เขต 2', 'สพป.ยะลา เขต 2');
INSERT INTO `system_khet` VALUES (180, '9503', '9503', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษายะลา เขต 3', 'สพป.ยะลา เขต 3');
INSERT INTO `system_khet` VALUES (181, '9601', '9601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานราธิวาส เขต 1', 'สพป.นราธิวาส เขต 1');
INSERT INTO `system_khet` VALUES (182, '9602', '9602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานราธิวาส เขต 2', 'สพป.นราธิวาส เขต 2');
INSERT INTO `system_khet` VALUES (183, '9603', '9603', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานราธิวาส เขต 3', 'สพป.นราธิวาส เขต 3');
INSERT INTO `system_khet` VALUES (184, '101701', '101701', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 1(กทม.)', 'สพม.เขต 1(กทม.)');
INSERT INTO `system_khet` VALUES (185, '101702', '101702', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 2(กทม.)', 'สพม.เขต 2(กทม.)');
INSERT INTO `system_khet` VALUES (186, '101703', '101703', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 3(นนทบุรี-พระนครศรีอยุธยา)', 'สพม.เขต 3(นนทบุรี-พระนครศรีอยุธยา)');
INSERT INTO `system_khet` VALUES (187, '101704', '101704', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต4(ปทุมธานี-สระบุรี)', 'สพม.เขต 4(ปทุมธานี-สระบุรี)');
INSERT INTO `system_khet` VALUES (188, '101705', '101705', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 5(สิงห์บุรี-ลพบุรี-ชัยนาท-อ่างทอง)', 'สพม.เขต 5(สิงห์บุรี-ลพบุรี-ชัยนาท-อ่างทอง)');
INSERT INTO `system_khet` VALUES (189, '101706', '101706', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต6(ฉะเชิงเทรา-สมุทรปราการ)', 'สพม.เขต 6(ฉะเชิงเทรา-สมุทรปราการ)');
INSERT INTO `system_khet` VALUES (190, '101707', '101707', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 7(ปราจีนบุรี-นครนายก-สระแก้ว)', 'สพม.เขต 7(ปราจีนบุรี-นครนายก-สระแก้ว)');
INSERT INTO `system_khet` VALUES (191, '101708', '101708', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 8(ราชบุรี-กาญจนบุรี)', 'สพม.เขต 8(ราชบุรี-กาญจนบุรี)');
INSERT INTO `system_khet` VALUES (192, '101709', '101709', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 9(สุพรรณบุรี-นครปฐม)', 'สพม.เขต 9(สุพรรณบุรี-นครปฐม)');
INSERT INTO `system_khet` VALUES (193, '101710', '101710', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 10(เพชรบุรี-ประจวบฯ-สมุทรสงคราม-สมุทรสาคร)', 'สพม.เขต 10(เพชรบุรี-ประจวบฯ-สมุทรสงคราม-สมุทรสาคร)');
INSERT INTO `system_khet` VALUES (194, '101711', '101711', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 11(สุราษฎร์ธานี-ชุมพร)', 'สพม.เขต 11(สุราษฎร์ธานี-ชุมพร)');
INSERT INTO `system_khet` VALUES (195, '101712', '101712', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 12(นครศรีธรรมราช-พัทลุง)', 'สพม.เขต 12(นครศรีธรรมราช-พัทลุง)');
INSERT INTO `system_khet` VALUES (196, '101713', '101713', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 13(ตรัง-กระบี่)', 'สพม.เขต 13(ตรัง-กระบี่)');
INSERT INTO `system_khet` VALUES (197, '101714', '101714', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 14(พังงา-ภูเก็ต-ระนอง)', 'สพม.เขต 14(พังงา-ภูเก็ต-ระนอง)');
INSERT INTO `system_khet` VALUES (198, '101715', '101715', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 15(นราธิวาส-ปัตตานี-ยะลา)', 'สพม.เขต 15(นราธิวาส-ปัตตานี-ยะลา)');
INSERT INTO `system_khet` VALUES (199, '101716', '101716', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต16(สงขลา-สตูล)', 'สพม.เขต 16(สงขลา-สตูล)');
INSERT INTO `system_khet` VALUES (200, '101717', '101717', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 17(จันทบุรี-ตราด)', 'สพม.เขต 17(จันทบุรี-ตราด)');
INSERT INTO `system_khet` VALUES (201, '101718', '101718', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 18(ชลบุรี-ระยอง)', 'สพม.เขต 18(ชลบุรี-ระยอง)');
INSERT INTO `system_khet` VALUES (202, '101719', '101719', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 19(เลย-หนองบัวลําภู)', 'สพม.เขต 19(เลย-หนองบัวลําภู)');
INSERT INTO `system_khet` VALUES (203, '101720', '101720', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 20(อุดรธานี)', 'สพม.เขต 20(อุดรธานี)');
INSERT INTO `system_khet` VALUES (204, '101721', '101721', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 21(หนองคาย)', 'สพม.เขต 21(หนองคาย)');
INSERT INTO `system_khet` VALUES (205, '101722', '101722', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 22(นครพนม-มุกดาหาร)', 'สพม.เขต 22(นครพนม-มุกดาหาร)');
INSERT INTO `system_khet` VALUES (206, '101723', '101723', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 23(สกลนคร)', 'สพม.เขต 23(สกลนคร)');
INSERT INTO `system_khet` VALUES (207, '101724', '101724', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 24(กาฬสินธุ์)', 'สพม.เขต 24(กาฬสินธุ์)');
INSERT INTO `system_khet` VALUES (208, '101725', '101725', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 25(ขอนแก่น)', 'สพม.เขต 25(ขอนแก่น)');
INSERT INTO `system_khet` VALUES (209, '101726', '101726', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 26(มหาสารคาม)', 'สพม.เขต 26(มหาสารคาม)');
INSERT INTO `system_khet` VALUES (210, '101727', '101727', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 27(ร้อยเอ็ด)', 'สพม.เขต 27(ร้อยเอ็ด)');
INSERT INTO `system_khet` VALUES (211, '101728', '101728', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 28(ศรีสะเกษ-ยโสธร)', 'สพม.เขต 28(ศรีสะเกษ-ยโสธร)');
INSERT INTO `system_khet` VALUES (212, '101729', '101729', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 29(อุบลราชธานี-อํานาจเจริญ)', 'สพม.เขต 29(อุบลราชธานี-อํานาจเจริญ)');
INSERT INTO `system_khet` VALUES (213, '101730', '101730', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 30(ชัยภูมิ)', 'สพม.เขต 30(ชัยภูมิ)');
INSERT INTO `system_khet` VALUES (214, '101731', '101731', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 31(นครราชสีมา)', 'สพม.เขต 31(นครราชสีมา)');
INSERT INTO `system_khet` VALUES (215, '101732', '101732', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 32(บุรีรัมย์)', 'สพม.เขต 32(บุรีรัมย์)');
INSERT INTO `system_khet` VALUES (216, '101733', '101733', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 33(สุรินทร์)', 'สพม.เขต 33(สุรินทร์)');
INSERT INTO `system_khet` VALUES (217, '101734', '101734', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 34(เชียงใหม่-แม่ฮ่องสอน)', 'สพม.เขต 34(เชียงใหม่-แม่ฮ่องสอน)');
INSERT INTO `system_khet` VALUES (218, '101735', '101735', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 35(ลำปาง-ลำพูน)', 'สพม.เขต 35(ลำปาง-ลำพูน)');
INSERT INTO `system_khet` VALUES (219, '101736', '101736', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 36(เชียงราย-พะเยา)', 'สพม.เขต 36(เชียงราย-พะเยา)');
INSERT INTO `system_khet` VALUES (220, '101737', '101737', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 37(แพร่-น่าน)', 'สพม.เขต 37(แพร่-น่าน)');
INSERT INTO `system_khet` VALUES (221, '101738', '101738', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 38(สุโขทัย-ตาก)', 'สพม.เขต 38(สุโขทัย-ตาก)');
INSERT INTO `system_khet` VALUES (222, '101739', '101739', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 39(พิษณุโลก-อุตรดิตถ์)', 'สพม.เขต 39(พิษณุโลก-อุตรดิตถ์)');
INSERT INTO `system_khet` VALUES (223, '101740', '101740', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 40(เพชรบูรณ์)', 'สพม.เขต 40(เพชรบูรณ์)');
INSERT INTO `system_khet` VALUES (224, '101741', '101741', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 41(กําแพงเพชร-พิจิตร)', 'สพม.เขต 41(กําแพงเพชร-พิจิตร)');
INSERT INTO `system_khet` VALUES (225, '101742', '101742', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 42(นครสวรรค์-อุทัยธานี)', 'สพม.เขต 42(นครสวรรค์-อุทัยธานี)');
INSERT INTO `system_khet` VALUES (226, '14', 'obec14', 3, 'สำนักเทคโนโลยีเพื่อการเรียนการสอน', 'สทร.');
INSERT INTO `system_khet` VALUES (227, '13', 'obec13', 3, 'กลุ่มตรวจสอบภายใน', 'ตสน.');
INSERT INTO `system_khet` VALUES (228, '12', 'obec12', 3, 'กลุ่มพัฒนาระบบบริหาร', 'กพร.');
INSERT INTO `system_khet` VALUES (229, '11', 'obec11', 3, 'สำนักวิชาการและมาตรฐานการศึกษา', 'สวก.');
INSERT INTO `system_khet` VALUES (230, '10', 'obec10', 3, 'สำนักพัฒนาการศึกษาเขตพัฒนาพิเศษเฉพาะกิจจังหวัดชายแดนภาคใต้', 'สพก.จชต.');
INSERT INTO `system_khet` VALUES (231, '9', 'obec9', 3, 'สำนักการคลังและสินทรัพย์', 'สคส.');
INSERT INTO `system_khet` VALUES (232, '8', 'obec8', 3, 'สำนักบริหารงานการมัธยมศึกษาตอนปลาย', 'สมป.');
INSERT INTO `system_khet` VALUES (233, '5', 'obec5', 3, 'สำนักทดสอบทางการศึกษา', 'สทศ.');
INSERT INTO `system_khet` VALUES (234, '7', 'obec7', 3, 'สำนักพัฒนาครูและบุคลากรทางการศึกษาขั้นพื้นฐาน', 'สพค.');
INSERT INTO `system_khet` VALUES (235, '3', 'obec3', 3, 'สำนักติดตามและประเมินผลการจัดการศึกษาขั้นพื้นฐาน', 'สตผ.');
INSERT INTO `system_khet` VALUES (236, '4', 'obec4', 3, 'สำนักอำนวยการ', 'สอ.');
INSERT INTO `system_khet` VALUES (237, '2', 'obec2', 3, 'สำนักพัฒนาระบบบริหารงานบุคคลและนิติการ', 'สพร.');
INSERT INTO `system_khet` VALUES (238, '6', 'obec6', 3, 'สำนักพัฒนานวัตกรรมการจัดการศึกษา', 'สนก.');
INSERT INTO `system_khet` VALUES (239, '1', 'obec1', 3, 'สำนักนโยบายและแผนการศึกษาขั้นพื้นฐาน', 'สนผ.');
INSERT INTO `system_khet` VALUES (240, '15', 'obec15', 3, 'สำนักพัฒนากิจกรรมนักเรียน', 'สกก.');
INSERT INTO `system_khet` VALUES (241, '16', 'obec16', 3, 'สถาบันภาษาอังกฤษ', 'สภษ.');
INSERT INTO `system_khet` VALUES (242, '17', 'obec17', 3, 'สำนักบริหารงานการศึกษาพิเศษ', 'สศศ.');
INSERT INTO `system_khet` VALUES (243, '18', 'obec18', 3, 'สำนักบริหารงานการศึกษาภาคบังคับ', 'สคบ.');
INSERT INTO `system_khet` VALUES (244, '19', 'obec19', 3, 'ศูนย์พัฒนาการนิเทศและเร่งรัดคุณภาพการศึกษาขั้นพื้นฐาน', 'ศนฐ.');
INSERT INTO `system_khet` VALUES (245, '20', 'obec20', 3, 'ศูนย์เฉพาะกิจคุ้มครองและช่วยเหลือเด็กนักเรียน', 'ฉก.ชน.');
INSERT INTO `system_khet` VALUES (246, '21', 'obec21', 3, 'ศูนย์บริหารโครงการพัฒนาโรงเรียนจุฬาภรณฯ', 'ศจภ.');
INSERT INTO `system_khet` VALUES (247, '23', 'obec23', 3, 'ศูนย์พัฒนาคุณภาพการศึกษาด้วยเทคโนโลยีทางไกล', 'ศพก.');

