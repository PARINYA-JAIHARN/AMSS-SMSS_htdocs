<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="ALTER TABLE  `la_permission` ADD  `p2` TINYINT NOT NULL AFTER  `p1`";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `permission_permission` ADD  `p2` TINYINT NOT NULL AFTER  `p1`";
$query = mysqli_query($connect,$sql);

$sql_create="CREATE TABLE IF NOT EXISTS `delegate_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(13) NOT NULL,
  `start` date NOT NULL,
  `finish` date NOT NULL,
  `remark` varchar(250) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1" ;
$query = mysqli_query($connect,$sql_create);

$sql="CREATE TABLE `person_delegate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(11) NOT NULL,
  `person_id` varchar(13) NOT NULL,
  `start` date NOT NULL,
  `finish` date NOT NULL,
  `remark` varchar(250) NOT NULL,
  `officer` varchar(13) NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1
";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `permission_main` ADD  `comment_need` TINYINT NOT NULL AFTER  `report_read_date` ";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `permission_main` ADD  `school_code` VARCHAR( 11 ) NOT NULL AFTER  `comment_need`";
$query = mysqli_query($connect,$sql);

$sql="ALTER TABLE  `la_main` ADD  `school_code` VARCHAR( 11 ) NOT NULL AFTER  `grant_date`";
$query = mysqli_query($connect,$sql);

$sql="CREATE TABLE `system_khet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(11) NOT NULL,
  `code2` varchar(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `precis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1";
$query = mysqli_query($connect,$sql);

$sql="INSERT INTO `system_khet` (`id`, `code`, `code2`, `type`, `name`, `precis`) VALUES
(1, '1001', '1001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากรุงเทพมหานคร', 'สพป.กรุงเทพมหานคร'),
(2, '1101', '1101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสมุทรปราการ เขต 1', 'สพป.สมุทรปราการ เขต 1'),
(3, '1102', '1102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสมุทรปราการ เขต 1', 'สพป.สมุทรปราการ เขต 2'),
(4, '1201', '1201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานนทบุรี เขต 1', 'สพป.นนทบุรี เขต 1'),
(5, '1202', '1202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานนทบุรี เขต 2', 'สพป.นนทบุรี เขต 2'),
(6, '1301', '1301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปทุมธานี เขต 1', 'สพป.ปทุมธานี เขต 1'),
(7, '1302', '1302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปทุมธานี เขต 2', 'สพป.ปทุมธานี เขต 2'),
(8, '1401', '1401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพระนครศรีอยุธยา เขต 1', 'สพป.พระนครศรีอยุธยา เขต 1'),
(9, '1402', '1402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพระนครศรีอยุธยา เขต 2', 'สพป.พระนครศรีอยุธยา เขต 2'),
(10, '1501', '1501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอ่างทอง', 'สพป.อ่างทอง'),
(11, '1601', '1601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาลพบุรี เขต 1', 'สพป.ลพบุรี เขต 1'),
(12, '1602', '1602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาลพบุรี เขต 2', 'สพป.ลพบุรี เขต 2'),
(13, '1701', '1701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสิงห์บุรี', 'สพป.สิงห์บุรี'),
(14, '1801', '1801', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชัยนาท', 'สพป.ชัยนาท'),
(15, '1901', '1901', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสระบุรี เขต 1', 'สพป.สระบุรี เขต 1'),
(16, '1902', '1902', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสระบุรี เขต 2', 'สพป.สระบุรี เขต 2'),
(17, '2001', '2001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชลบุรี เขต 1', 'สพป.ชลบุรี เขต 1'),
(18, '2002', '2002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชลบุรี เขต 2', 'สพป.ชลบุรี เขต 2'),
(19, '2003', '2003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชลบุรี เขต 3', 'สพป.ชลบุรี เขต 3'),
(20, '2101', '2101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาระยอง เขต 1', 'สพป.ระยอง เขต 1'),
(21, '2102', '2102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาระยอง เขต 2', 'สพป.ระยอง เขต 2'),
(22, '2201', '2201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาจันทบุรี เขต 1', 'สพป.จันทบุรี เขต 1'),
(23, '2202', '2202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาจันทบุรี เขต 2', 'สพป.จันทบุรี เขต 2'),
(24, '2301', '2301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาตราด', 'สพป.ตราด'),
(25, '2401', '2401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาฉะเชิงเทรา เขต 1', 'สพป.ฉะเชิงเทรา เขต 1'),
(26, '2402', '2402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาฉะเชิงเทรา เขต 2', 'สพป.ฉะเชิงเทรา เขต 2'),
(27, '2501', '2501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปราจีนบุรี เขต 1', 'สพป.ปราจีนบุรี เขต 1'),
(28, '2502', '2502', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปราจีนบุรี เขต 2', 'สพป.ปราจีนบุรี เขต 2'),
(29, '2601', '2601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครนายก', 'สพป.นครนายก'),
(30, '2701', '2701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสระแก้ว เขต 1', 'สพป.สระแก้ว เขต 1'),
(31, '2702', '2702', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสระแก้ว เขต 2', 'สพป.สระแก้ว เขต 2'),
(32, '3001', '3001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 1', 'สพป.นครราชสีมา เขต 1'),
(33, '3002', '3002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 2', 'สพป.นครราชสีมา เขต 2'),
(34, '3003', '3003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 3', 'สพป.นครราชสีมา เขต 3'),
(35, '3004', '3004', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 4', 'สพป.นครราชสีมา เขต 4'),
(36, '3005', '3005', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 5', 'สพป.นครราชสีมา เขต 5'),
(37, '3006', '3006', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 6', 'สพป.นครราชสีมา เขต 6'),
(38, '3007', '3007', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครราชสีมา เขต 7', 'สพป.นครราชสีมา เขต 7'),
(39, '3101', '3101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาบุรีรัมย์ เขต 1', 'สพป.บุรีรัมย์ เขต 1'),
(40, '3102', '3102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาบุรีรัมย์ เขต 2', 'สพป.บุรีรัมย์ เขต 2'),
(41, '3103', '3103', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาบุรีรัมย์ เขต 3', 'สพป.บุรีรัมย์ เขต 3'),
(42, '3104', '3104', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาบุรีรัมย์ เขต 4', 'สพป.บุรีรัมย์ เขต 4'),
(43, '3201', '3201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุรินทร์ เขต 1', 'สพป.สุรินทร์ เขต 1'),
(44, '3202', '3202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุรินทร์ เขต 2', 'สพป.สุรินทร์ เขต 2'),
(45, '3203', '3203', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุรินทร์ เขต 3', 'สพป.สุรินทร์ เขต 3'),
(46, '3301', '3301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาศรีสะเกษ เขต 1', 'สพป.ศรีสะเกษ เขต 1'),
(47, '3302', '3302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาศรีสะเกษ เขต 2', 'สพป.ศรีสะเกษ เขต 2'),
(48, '3303', '3303', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาศรีสะเกษ เขต 3', 'สพป.ศรีสะเกษ เขต 3'),
(49, '3304', '3304', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาศรีสะเกษ เขต 4', 'สพป.ศรีสะเกษ เขต 4'),
(50, '3401', '3401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุบลราชธานี เขต 1', 'สพป.อุบลราชธานี เขต 1'),
(51, '3402', '3402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุบลราชธานี เขต 2', 'สพป.อุบลราชธานี เขต 2'),
(52, '3403', '3403', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุบลราชธานี เขต 3', 'สพป.อุบลราชธานี เขต 3'),
(53, '3404', '3404', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุบลราชธานี เขต 4', 'สพป.อุบลราชธานี เขต 4'),
(54, '3405', '3405', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุบลราชธานี เขต 5', 'สพป.อุบลราชธานี เขต 5'),
(55, '3501', '3501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษายโสธร เขต 1', 'สพป.ยโสธร เขต 1'),
(56, '3502', '3502', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษายโสธร เขต 2', 'สพป.ยโสธร เขต 2'),
(57, '3601', '3601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชัยภูมิ เขต 1', 'สพป.ชัยภูมิ เขต 1'),
(58, '3602', '3602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชัยภูมิ เขต 2', 'สพป.ชัยภูมิ เขต 2'),
(59, '3603', '3603', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชัยภูมิ เขต 3', 'สพป.ชัยภูมิ เขต 3'),
(60, '3701', '3701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอำนาจเจริญ', 'สพป.อำนาจเจริญ'),
(61, '3801', '3801', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาบึงกาฬ', 'สพป.บึงกาฬ'),
(62, '3901', '3901', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาหนองบัวลำภู เขต 1', 'สพป.หนองบัวลำภู เขต 1'),
(63, '3902', '3902', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาหนองบัวลำภู เขต 2', 'สพป.หนองบัวลำภู เขต 2'),
(64, '4001', '4001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาขอนแก่น เขต 1', 'สพป.ขอนแก่น เขต 1'),
(65, '4002', '4002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาขอนแก่น เขต 2', 'สพป.ขอนแก่น เขต 2'),
(66, '4003', '4003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาขอนแก่น เขต 3', 'สพป.ขอนแก่น เขต 3'),
(67, '4004', '4004', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาขอนแก่น เขต 4', 'สพป.ขอนแก่น เขต 4'),
(68, '4005', '4005', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาขอนแก่น เขต 5', 'สพป.ขอนแก่น เขต 5'),
(69, '4101', '4101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุดรธานี เขต 1', 'สพป.อุดรธานี เขต 1'),
(70, '4102', '4102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุดรธานี เขต 2', 'สพป.อุดรธานี เขต 2'),
(71, '4103', '4103', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุดรธานี เขต 3', 'สพป.อุดรธานี เขต 3'),
(72, '4104', '4104', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุดรธานี เขต 4', 'สพป.อุดรธานี เขต 4'),
(73, '4201', '4201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเลย เขต 1', 'สพป.เลย เขต 1'),
(74, '4202', '4202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเลย เขต 2', 'สพป.เลย เขต 2'),
(75, '4203', '4203', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเลย เขต 3', 'สพป.เลย เขต 3'),
(76, '4301', '4301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาหนองคาย เขต 1', 'สพป.หนองคาย เขต 1'),
(77, '4302', '4302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาหนองคาย เขต 2', 'สพป.หนองคาย เขต 2'),
(78, '4401', '4401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษามหาสารคาม เขต 1', 'สพป.มหาสารคาม เขต 1'),
(79, '4402', '4402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษามหาสารคาม เขต 2', 'สพป.มหาสารคาม เขต 2'),
(80, '4403', '4403', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษามหาสารคาม เขต 3', 'สพป.มหาสารคาม เขต 3'),
(81, '4501', '4501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาร้อยเอ็ด เขต 1', 'สพป.ร้อยเอ็ด เขต 1'),
(82, '4502', '4502', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาร้อยเอ็ด เขต 2', 'สพป.ร้อยเอ็ด เขต 2'),
(83, '4503', '4503', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาร้อยเอ็ด เขต 3', 'สพป.ร้อยเอ็ด เขต 3'),
(84, '4601', '4601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาฬสินธุ์ เขต 1', 'สพป.กาฬสินธุ์ เขต 1'),
(85, '4602', '4602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาฬสินธุ์ เขต 2', 'สพป.กาฬสินธุ์ เขต 2'),
(86, '4603', '4603', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาฬสินธุ์ เขต 3', 'สพป.กาฬสินธุ์ เขต 3'),
(87, '4701', '4701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสกลนคร เขต 1', 'สพป.สกลนคร เขต 1'),
(88, '4702', '4702', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสกลนคร เขต 2', 'สพป.สกลนคร เขต 2'),
(89, '4703', '4703', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสกลนคร เขต 3', 'สพป.สกลนคร เขต 3'),
(90, '4801', '4801', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครพนม เขต 1', 'สพป.นครพนม เขต 1'),
(91, '4802', '4802', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครพนม เขต 2', 'สพป.นครพนม เขต 2'),
(92, '4901', '4901', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษามุกดาหาร', 'สพป.มุกดาหาร'),
(93, '5001', '5001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงใหม่ เขต 1', 'สพป.เชียงใหม่ เขต 1'),
(94, '5002', '5002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงใหม่ เขต 2', 'สพป.เชียงใหม่ เขต 2'),
(95, '5003', '5003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงใหม่ เขต 3', 'สพป.เชียงใหม่ เขต 3'),
(96, '5004', '5004', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงใหม่ เขต 4', 'สพป.เชียงใหม่ เขต 4'),
(97, '5005', '5005', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงใหม่ เขต 5', 'สพป.เชียงใหม่ เขต 5'),
(98, '5006', '5006', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงใหม่ เขต 6', 'สพป.เชียงใหม่ เขต 6'),
(99, '5101', '5101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษา.ลำพูน เขต 1', 'สพป.ลำพูน เขต 1'),
(100, '5102', '5102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาลำพูน เขต 2', 'สพป.ลำพูน เขต 2'),
(101, '5201', '5201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาลำปาง เขต 1', 'สพป.ลำปาง เขต 1'),
(102, '5202', '5202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาลำปาง เขต 2', 'สพป.ลำปาง เขต 2'),
(103, '5203', '5203', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาลำปาง เขต 3', 'สพป.ลำปาง เขต 3'),
(104, '5301', '5301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุตรดิตถ์ เขต 1', 'สพป.อุตรดิตถ์ เขต 1'),
(105, '5302', '5302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุตรดิตถ์ เขต 2', 'สพป.อุตรดิตถ์ เขต 2'),
(106, '5401', '5401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาแพร่ เขต 1', 'สพป.แพร่ เขต 1'),
(107, '5402', '5402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาแพร่ เขต 2', 'สพป.แพร่ เขต 2'),
(108, '5501', '5501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาน่าน เขต 1', 'สพป.น่าน เขต 1'),
(109, '5502', '5502', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาน่าน เขต 2', 'สพป.น่าน เขต 2'),
(110, '5601', '5601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพะเยา เขต 1', 'สพป.พะเยา เขต 1'),
(111, '5602', '5602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพะเยา เขต 2', 'สพป.พะเยา เขต 2'),
(112, '5701', '5701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงราย เขต 1', 'สพป.เชียงราย เขต 1'),
(113, '5702', '5702', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงราย เขต 2', 'สพป.เชียงราย เขต 2'),
(114, '5703', '5703', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงราย เขต 3', 'สพป.เชียงราย เขต 3'),
(115, '5704', '5704', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเชียงราย เขต 4', 'สพป.เชียงราย เขต 4'),
(116, '5801', '5801', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาแม่ฮ่องสอน เขต 1', 'สพป.แม่ฮ่องสอน เขต 1'),
(117, '5802', '5802', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาแม่ฮ่องสอน เขต 2', 'สพป.แม่ฮ่องสอน เขต 2'),
(118, '6001', '6001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครสวรรค์ เขต 1', 'สพป.นครสวรรค์ เขต 1'),
(119, '6002', '6002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครสวรรค์ เขต 2', 'สพป.นครสวรรค์ เขต 2'),
(120, '6003', '6003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครสวรรค์ เขต 3', 'สพป.นครสวรรค์ เขต 3'),
(121, '6101', '6101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุทัยธานี เขต 1', 'สพป.อุทัยธานี เขต 1'),
(122, '6102', '6102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาอุทัยธานี เขต 2', 'สพป.อุทัยธานี เขต 2'),
(123, '6201', '6201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากำแพงเพชร เขต 1', 'สพป.กำแพงเพชร เขต 1'),
(124, '6202', '6202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากำแพงเพชร เขต 2', 'สพป.กำแพงเพชร เขต 2'),
(125, '6301', '6301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาตาก เขต 1', 'สพป.ตาก เขต 1'),
(126, '6302', '6302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาตาก เขต 2', 'สพป.ตาก เขต 2'),
(127, '6401', '6401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุโขทัย เขต 1', 'สพป.สุโขทัย เขต 1'),
(128, '6402', '6402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุโขทัย เขต 2', 'สพป.สุโขทัย เขต 2'),
(129, '6501', '6501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพิษณุโลก เขต 1', 'สพป.พิษณุโลก เขต 1'),
(130, '6502', '6502', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพิษณุโลก เขต 2', 'สพป.พิษณุโลก เขต 2'),
(131, '6503', '6503', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพิษณุโลก เขต 3', 'สพป.พิษณุโลก เขต 3'),
(132, '6601', '6601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพิจิตร เขต 1', 'สพป.พิจิตร เขต 1'),
(133, '6602', '6602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพิจิตร เขต 2', 'สพป.พิจิตร เขต 2'),
(134, '6701', '6701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเพชรบูรณ์ เขต 1', 'สพป.เพชรบูรณ์ เขต 1'),
(135, '6702', '6702', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเพชรบูรณ์ เขต 2', 'สพป.เพชรบูรณ์ เขต 2'),
(136, '6703', '6703', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเพชรบูรณ์ เขต 3', 'สพป.เพชรบูรณ์ เขต 3'),
(137, '7001', '7001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาราชบุรี เขต 1', 'สพป.ราชบุรี เขต 1'),
(138, '7002', '7002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาราชบุรี เขต 2', 'สพป.ราชบุรี เขต 2'),
(139, '7101', '7101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาญจนบุรี เขต 1', 'สพป.กาญจนบุรี เขต 1'),
(140, '7102', '7102', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาญจนบุรี เขต 2', 'สพป.กาญจนบุรี เขต 2'),
(141, '7103', '7103', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาญจนบุรี เขต 3', 'สพป.กาญจนบุรี เขต 3'),
(142, '7104', '7104', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากาญจนบุรี เขต 4', 'สพป.กาญจนบุรี เขต 4'),
(143, '7201', '7201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุพรรณบุรี เขต 1', 'สพป.สุพรรณบุรี เขต 1'),
(144, '7202', '7202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุพรรณบุรี เขต 2', 'สพป.สุพรรณบุรี เขต 2'),
(145, '7203', '7203', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุพรรณบุรี เขต 3', 'สพป.สุพรรณบุรี เขต 3'),
(146, '7301', '7301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครปฐม เขต 1', 'สพป.นครปฐม เขต 1'),
(147, '7302', '7302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครปฐม เขต 2', 'สพป.นครปฐม เขต 2'),
(148, '7401', '7401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสมุทรสาคร', 'สพป.สมุทรสาคร'),
(149, '7501', '7501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสมุทรสงคราม', 'สพป.สมุทรสงคราม'),
(150, '7601', '7601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเพชรบุรี เขต 1', 'สพป.เพชรบุรี เขต 1'),
(151, '7602', '7602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาเพชรบุรี เขต 2', 'สพป.เพชรบุรี เขต 2'),
(152, '7701', '7701', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาประจวบ คีรีขันธ์ เขต 1', 'สพป.ประจวบ คีรีขันธ์ เขต 1'),
(153, '7702', '7702', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาประจวบคีรีขันธ์ เขต 2', 'สพป.ประจวบคีรีขันธ์ เขต 2'),
(154, '8001', '8001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครศรีธรรมราช เขต 1', 'สพป.นครศรีธรรมราช เขต 1'),
(155, '8002', '8002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครศรีธรรมราช เขต 2', 'สพป.นครศรีธรรมราช เขต 2'),
(156, '8003', '8003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครศรีธรรมราช เขต 3', 'สพป.นครศรีธรรมราช เขต 3'),
(157, '8004', '8004', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานครศรีธรรมราช เขต 4', 'สพป.นครศรีธรรมราช เขต 4'),
(158, '8101', '8101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษากระบี่', 'สพป.กระบี่'),
(159, '8201', '8201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพังงา', 'สพป.พังงา'),
(160, '8301', '8301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาภูเก็ต', 'สพป.ภูเก็ต'),
(161, '8401', '8401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุราษฎร์ธานี เขต 1', 'สพป.สุราษฎร์ธานี เขต 1'),
(162, '8402', '8402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุราษฎร์ธานี เขต 2', 'สพป.สุราษฎร์ธานี เขต 2'),
(163, '8403', '8403', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสุราษฎร์ธานี เขต 3', 'สพป.สุราษฎร์ธานี เขต 3'),
(164, '8501', '8501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาระนอง', 'สพป.ระนอง'),
(165, '8601', '8601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชุมพร เขต 1', 'สพป.ชุมพร เขต 1'),
(166, '8602', '8602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาชุมพร เขต 2', 'สพป.ชุมพร เขต 2'),
(167, '9001', '9001', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสงขลา เขต 1', 'สพป.สงขลา เขต 1'),
(168, '9002', '9002', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสงขลา เขต 2', 'สพป.สงขลา เขต 2'),
(169, '9003', '9003', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสงขลา เขต 3', 'สพป.สงขลา เขต 3'),
(170, '9101', '9101', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาสตูล', 'สพป.สตูล'),
(171, '9201', '9201', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาตรัง เขต 1', 'สพป.ตรัง เขต 1'),
(172, '9202', '9202', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาตรัง เขต 2', 'สพป.ตรัง เขต 2'),
(173, '9301', '9301', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพัทลุง เขต 1', 'สพป.พัทลุง เขต 1'),
(174, '9302', '9302', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาพัทลุง เขต 2', 'สพป.พัทลุง เขต 2'),
(175, '9401', '9401', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปัตตานี เขต 1', 'สพป.ปัตตานี เขต 1'),
(176, '9402', '9402', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปัตตานี เขต 2', 'สพป.ปัตตานี เขต 2'),
(177, '9403', '9403', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษาปัตตานี เขต 3', 'สพป.ปัตตานี เขต 3'),
(178, '9501', '9501', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษายะลา เขต 1', 'สพป.ยะลา เขต 1'),
(179, '9502', '9502', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษายะลา เขต 2', 'สพป.ยะลา เขต 2'),
(180, '9503', '9503', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษายะลา เขต 3', 'สพป.ยะลา เขต 3'),
(181, '9601', '9601', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานราธิวาส เขต 1', 'สพป.นราธิวาส เขต 1'),
(182, '9602', '9602', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานราธิวาส เขต 2', 'สพป.นราธิวาส เขต 2'),
(183, '9603', '9603', 1, 'สำนักงานเขตพื้นที่การศึกษาประถมศึกษานราธิวาส เขต 3', 'สพป.นราธิวาส เขต 3'),
(184, '101701', '101701', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 1(กทม.)', 'สพม.เขต 1(กทม.)'),
(185, '101702', '101702', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 2(กทม.)', 'สพม.เขต 2(กทม.)'),
(186, '101703', '101703', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 3(นนทบุรี-พระนครศรีอยุธยา)', 'สพม.เขต 3(นนทบุรี-พระนครศรีอยุธยา)'),
(187, '101704', '101704', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต4(ปทุมธานี-สระบุรี)', 'สพม.เขต 4(ปทุมธานี-สระบุรี)'),
(188, '101705', '101705', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 5(สิงห์บุรี-ลพบุรี-ชัยนาท-อ่างทอง)', 'สพม.เขต 5(สิงห์บุรี-ลพบุรี-ชัยนาท-อ่างทอง)'),
(189, '101706', '101706', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต6(ฉะเชิงเทรา-สมุทรปราการ)', 'สพม.เขต 6(ฉะเชิงเทรา-สมุทรปราการ)'),
(190, '101707', '101707', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 7(ปราจีนบุรี-นครนายก-สระแก้ว)', 'สพม.เขต 7(ปราจีนบุรี-นครนายก-สระแก้ว)'),
(191, '101708', '101708', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 8(ราชบุรี-กาญจนบุรี)', 'สพม.เขต 8(ราชบุรี-กาญจนบุรี)'),
(192, '101709', '101709', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 9(สุพรรณบุรี-นครปฐม)', 'สพม.เขต 9(สุพรรณบุรี-นครปฐม)'),
(193, '101710', '101710', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 10(เพชรบุรี-ประจวบฯ-สมุทรสงคราม-สมุทรสาคร)', 'สพม.เขต 10(เพชรบุรี-ประจวบฯ-สมุทรสงคราม-สมุทรสาคร)'),
(194, '101711', '101711', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 11(สุราษฎร์ธานี-ชุมพร)', 'สพม.เขต 11(สุราษฎร์ธานี-ชุมพร)'),
(195, '101712', '101712', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 12(นครศรีธรรมราช-พัทลุง)', 'สพม.เขต 12(นครศรีธรรมราช-พัทลุง)'),
(196, '101713', '101713', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 13(ตรัง-กระบี่)', 'สพม.เขต 13(ตรัง-กระบี่)'),
(197, '101714', '101714', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 14(พังงา-ภูเก็ต-ระนอง)', 'สพม.เขต 14(พังงา-ภูเก็ต-ระนอง)'),
(198, '101715', '101715', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 15(นราธิวาส-ปัตตานี-ยะลา)', 'สพม.เขต 15(นราธิวาส-ปัตตานี-ยะลา)'),
(199, '101716', '101716', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต16(สงขลา-สตูล)', 'สพม.เขต 16(สงขลา-สตูล)'),
(200, '101717', '101717', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 17(จันทบุรี-ตราด)', 'สพม.เขต 17(จันทบุรี-ตราด)'),
(201, '101718', '101718', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 18(ชลบุรี-ระยอง)', 'สพม.เขต 18(ชลบุรี-ระยอง)'),
(202, '101719', '101719', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 19(เลย-หนองบัวลําภู)', 'สพม.เขต 19(เลย-หนองบัวลําภู)'),
(203, '101720', '101720', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 20(อุดรธานี)', 'สพม.เขต 20(อุดรธานี)'),
(204, '101721', '101721', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 21(หนองคาย)', 'สพม.เขต 21(หนองคาย)'),
(205, '101722', '101722', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 22(นครพนม-มุกดาหาร)', 'สพม.เขต 22(นครพนม-มุกดาหาร)'),
(206, '101723', '101723', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 23(สกลนคร)', 'สพม.เขต 23(สกลนคร)'),
(207, '101724', '101724', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 24(กาฬสินธุ์)', 'สพม.เขต 24(กาฬสินธุ์)'),
(208, '101725', '101725', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 25(ขอนแก่น)', 'สพม.เขต 25(ขอนแก่น)'),
(209, '101726', '101726', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 26(มหาสารคาม)', 'สพม.เขต 26(มหาสารคาม)'),
(210, '101727', '101727', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 27(ร้อยเอ็ด)', 'สพม.เขต 27(ร้อยเอ็ด)'),
(211, '101728', '101728', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 28(ศรีสะเกษ-ยโสธร)', 'สพม.เขต 28(ศรีสะเกษ-ยโสธร)'),
(212, '101729', '101729', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 29(อุบลราชธานี-อํานาจเจริญ)', 'สพม.เขต 29(อุบลราชธานี-อํานาจเจริญ)'),
(213, '101730', '101730', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 30(ชัยภูมิ)', 'สพม.เขต 30(ชัยภูมิ)'),
(214, '101731', '101731', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 31(นครราชสีมา)', 'สพม.เขต 31(นครราชสีมา)'),
(215, '101732', '101732', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 32(บุรีรัมย์)', 'สพม.เขต 32(บุรีรัมย์)'),
(216, '101733', '101733', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 33(สุรินทร์)', 'สพม.เขต 33(สุรินทร์)'),
(217, '101734', '101734', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 34(เชียงใหม่-แม่ฮ่องสอน)', 'สพม.เขต 34(เชียงใหม่-แม่ฮ่องสอน)'),
(218, '101735', '101735', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 35(ลำปาง-ลำพูน)', 'สพม.เขต 35(ลำปาง-ลำพูน)'),
(219, '101736', '101736', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 36(เชียงราย-พะเยา)', 'สพม.เขต 36(เชียงราย-พะเยา)'),
(220, '101737', '101737', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 37(แพร่-น่าน)', 'สพม.เขต 37(แพร่-น่าน)'),
(221, '101738', '101738', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 38(สุโขทัย-ตาก)', 'สพม.เขต 38(สุโขทัย-ตาก)'),
(222, '101739', '101739', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 39(พิษณุโลก-อุตรดิตถ์)', 'สพม.เขต 39(พิษณุโลก-อุตรดิตถ์)'),
(223, '101740', '101740', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 40(เพชรบูรณ์)', 'สพม.เขต 40(เพชรบูรณ์)'),
(224, '101741', '101741', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 41(กําแพงเพชร-พิจิตร)', 'สพม.เขต 41(กําแพงเพชร-พิจิตร)'),
(225, '101742', '101742', 2, 'สำนักงานเขตพื้นที่การศึกษามัธยมศึกษา เขต 42(นครสวรรค์-อุทัยธานี)', 'สพม.เขต 42(นครสวรรค์-อุทัยธานี)'),
(226, '14', 'obec14', 3, 'สำนักเทคโนโลยีเพื่อการเรียนการสอน', 'สทร.'),
(227, '13', 'obec13', 3, 'กลุ่มตรวจสอบภายใน', 'ตสน.'),
(228, '12', 'obec12', 3, 'กลุ่มพัฒนาระบบบริหาร', 'กพร.'),
(229, '11', 'obec11', 3, 'สำนักวิชาการและมาตรฐานการศึกษา', 'สวก.'),
(230, '10', 'obec10', 3, 'สำนักพัฒนาการศึกษาเขตพัฒนาพิเศษเฉพาะกิจจังหวัดชายแดนภาคใต้', 'สพก.จชต.'),
(231, '9', 'obec9', 3, 'สำนักการคลังและสินทรัพย์', 'สคส.'),
(232, '8', 'obec8', 3, 'สำนักบริหารงานการมัธยมศึกษาตอนปลาย', 'สมป.'),
(233, '5', 'obec5', 3, 'สำนักทดสอบทางการศึกษา', 'สทศ.'),
(234, '7', 'obec7', 3, 'สำนักพัฒนาครูและบุคลากรทางการศึกษาขั้นพื้นฐาน', 'สพค.'),
(235, '3', 'obec3', 3, 'สำนักติดตามและประเมินผลการจัดการศึกษาขั้นพื้นฐาน', 'สตผ.'),
(236, '4', 'obec4', 3, 'สำนักอำนวยการ', 'สอ.'),
(237, '2', 'obec2', 3, 'สำนักพัฒนาระบบบริหารงานบุคคลและนิติการ', 'สพร.'),
(238, '6', 'obec6', 3, 'สำนักพัฒนานวัตกรรมการจัดการศึกษา', 'สนก.'),
(239, '1', 'obec1', 3, 'สำนักนโยบายและแผนการศึกษาขั้นพื้นฐาน', 'สนผ.'),
(240, '15', 'obec15', 3, 'สำนักพัฒนากิจกรรมนักเรียน', 'สกก.'),
(241, '16', 'obec16', 3, 'สถาบันภาษาอังกฤษ', 'สภษ.'),
(242, '17', 'obec17', 3, 'สำนักบริหารงานการศึกษาพิเศษ', 'สศศ.'),
(243, '18', 'obec18', 3, 'สำนักบริหารงานการศึกษาภาคบังคับ', 'สคบ.'),
(244, '19', 'obec19', 3, 'ศูนย์พัฒนาการนิเทศและเร่งรัดคุณภาพการศึกษาขั้นพื้นฐาน', 'ศนฐ.'),
(245, '20', 'obec20', 3, 'ศูนย์เฉพาะกิจคุ้มครองและช่วยเหลือเด็กนักเรียน', 'ฉก.ชน.'),
(246, '21', 'obec21', 3, 'ศูนย์บริหารโครงการพัฒนาโรงเรียนจุฬาภรณฯ', 'ศจภ.'),
(247, '23', 'obec23', 3, 'ศูนย์พัฒนาคุณภาพการศึกษาด้วยเทคโนโลยีทางไกล', 'ศพก.')";
$query = mysqli_query($connect,$sql);


?>
