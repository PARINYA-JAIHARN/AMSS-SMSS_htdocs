<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="CREATE TABLE IF NOT EXISTS `health_weight_height` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `sex` tinyint(4) NOT NULL DEFAULT '1',
  `height` int(11) NOT NULL,
  `weight_1` double NOT NULL,
  `weight_2` double NOT NULL,
  `weight_3` double NOT NULL,
  `weight_4` double NOT NULL,
  `weight_5` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8" ;
$dbquery = mysqli_query($connect,$sql);

$sql="INSERT INTO `health_weight_height` (`id`, `type`, `sex`, `height`, `weight_1`, `weight_2`, `weight_3`, `weight_4`, `weight_5`) VALUES
(1, 0, 1, 50, 2.5, 3, 3.8, 4, 4.5),
(2, 0, 1, 55, 3.5, 4, 4.8, 5, 6),
(3, 0, 1, 60, 4.5, 5, 6.3, 6.5, 7.5),
(4, 0, 1, 65, 5.5, 6, 7.8, 8, 9),
(5, 0, 1, 70, 7, 7.5, 9.3, 9.5, 10.5),
(6, 0, 1, 75, 8, 8.5, 10.8, 11, 12),
(7, 0, 1, 80, 9, 9.5, 12, 12.5, 13.5),
(8, 0, 1, 85, 10, 10.5, 13.5, 14, 15.5),
(9, 0, 1, 90, 11, 11.5, 15, 15.5, 17),
(10, 0, 1, 95, 12, 12.5, 16.5, 17, 19),
(11, 0, 1, 100, 13, 14, 18.5, 19, 21),
(12, 0, 1, 105, 14, 15, 20, 21, 22.5),
(13, 0, 1, 110, 15.5, 16.5, 22, 23, 25),
(14, 0, 1, 115, 17, 18, 24, 25, 28),
(15, 0, 1, 120, 18.5, 19.5, 26.5, 28, 31),
(16, 0, 1, 125, 20.5, 21.5, 29.5, 31, 35),
(17, 0, 1, 130, 22, 23.5, 33, 35, 39.5),
(18, 0, 1, 135, 24, 25.5, 37, 39, 45),
(19, 0, 1, 140, 26.5, 28, 41, 44, 50),
(20, 0, 2, 50, 3, 3.1, 3.8, 4, 4.5),
(21, 0, 2, 55, 3.5, 4, 4.8, 5, 6),
(22, 0, 2, 60, 4.5, 5, 6.3, 6.5, 7),
(23, 0, 2, 65, 5.5, 6, 7.8, 8, 8.5),
(24, 0, 2, 70, 6.5, 7.5, 8.8, 9, 10),
(25, 0, 2, 75, 7.5, 8.5, 10.8, 10.5, 11.5),
(26, 0, 2, 80, 8.5, 9, 11.5, 12.5, 13),
(27, 0, 2, 85, 9.5, 10, 13, 13.5, 14.5),
(28, 0, 2, 90, 10.5, 11.5, 14.5, 15.5, 16.5),
(29, 0, 2, 95, 11.5, 13, 16.5, 17, 18.5),
(30, 0, 2, 100, 13, 13.5, 18, 18.5, 20.5),
(31, 0, 2, 110, 15.5, 16, 22, 23, 25),
(32, 0, 2, 115, 16.5, 17.5, 24, 25, 28),
(33, 0, 2, 120, 18, 19, 27, 28.5, 31.5),
(34, 0, 2, 125, 19.5, 21.5, 30, 31.5, 35.5),
(35, 0, 2, 130, 21.5, 23, 34, 36, 41),
(36, 0, 2, 135, 23.5, 25, 38, 40.5, 46),
(37, 0, 2, 140, 25.5, 27.5, 42.5, 45.5, 55.5),
(38, 0, 2, 105, 14, 15, 19.5, 20.5, 22.5),
(39, 1, 1, 90, 11, 11.5, 15, 16, 17),
(40, 1, 1, 95, 12, 12.5, 17, 17.5, 19),
(41, 1, 1, 100, 13, 14, 18, 19, 21),
(42, 1, 1, 105, 14.5, 15, 19.5, 20.5, 22.5),
(43, 1, 1, 110, 16, 16.6, 21.5, 22.5, 24.5),
(44, 1, 1, 115, 17, 18, 24, 25, 27.5),
(45, 1, 1, 120, 19, 19.5, 26.5, 28, 30.5),
(46, 1, 1, 125, 20, 21, 29, 31, 34),
(47, 1, 1, 130, 22, 23, 33, 35, 39),
(48, 1, 1, 135, 24.5, 25.5, 37, 39.5, 45),
(49, 1, 1, 140, 26.5, 28.5, 41, 44, 50),
(50, 1, 1, 145, 29, 31, 45, 48, 54.5),
(51, 1, 1, 150, 32, 34, 49, 52.5, 58.5),
(52, 1, 1, 155, 35, 37, 53, 56.5, 62.5),
(53, 1, 1, 160, 38.5, 41, 57, 60.5, 66.5),
(54, 1, 1, 165, 42.5, 45, 61.5, 64.5, 70),
(55, 1, 1, 170, 46, 48.5, 65, 68, 74.5),
(56, 1, 1, 175, 49.5, 52.5, 69, 72, 77),
(57, 1, 1, 180, 53, 56, 72, 75, 80),
(58, 1, 2, 90, 11, 11.5, 15, 16, 17),
(59, 1, 2, 95, 12, 12.5, 16, 17, 18.5),
(60, 1, 2, 100, 13, 13.5, 18, 19, 20.5),
(61, 1, 2, 105, 14, 15, 19.5, 20.5, 22.5),
(62, 1, 2, 110, 15.5, 16, 21.5, 22.5, 25),
(63, 1, 2, 115, 17, 17.5, 24, 25, 27.5),
(64, 1, 2, 120, 18.5, 19, 26.5, 28, 31),
(65, 1, 2, 125, 20, 21, 30, 32, 36),
(66, 1, 2, 130, 21.5, 22.5, 33.5, 36, 41),
(67, 1, 2, 135, 23.5, 25, 38, 41, 46),
(68, 1, 2, 140, 26, 27.5, 42.5, 45.5, 51.5),
(69, 1, 2, 145, 29, 31, 47, 50, 56.5),
(70, 1, 2, 150, 32.5, 34.5, 51.5, 54.5, 61),
(71, 1, 2, 155, 36, 38.5, 55.5, 58.5, 65),
(72, 1, 2, 160, 39.5, 42, 59, 62, 68),
(73, 1, 2, 165, 43, 45.5, 62, 65, 70.5),
(74, 1, 2, 170, 47, 48.5, 65.5, 67.5, 72.5)" ;
$dbquery = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `health_age_height` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `sex` tinyint(4) NOT NULL DEFAULT '2',
  `age` double NOT NULL,
  `height_1` double NOT NULL,
  `height_2` double NOT NULL,
  `height_3` double NOT NULL,
  `height_4` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8" ;
$dbquery = mysqli_query($connect,$sql);

$sql="INSERT INTO `health_age_height` (`id`, `type`, `sex`, `age`, `height_1`, `height_2`, `height_3`, `height_4`) VALUES
(1, 0, 1, 1, 70, 71.5, 80, 81),
(2, 0, 1, 1.25, 72.5, 73.5, 83.5, 85),
(3, 0, 1, 1.5, 75, 77, 86.5, 88),
(4, 0, 1, 1.75, 77.5, 79.5, 89.5, 91),
(5, 0, 1, 2, 80, 81.5, 92, 93.5),
(6, 0, 1, 2.25, 82, 84, 94, 96),
(7, 0, 1, 2.5, 83.5, 84.5, 96.5, 98),
(8, 0, 1, 2.75, 85.5, 87.5, 98.5, 100),
(9, 0, 1, 3, 87, 89.5, 100.5, 102),
(10, 0, 1, 3.25, 89, 91, 102.5, 104),
(11, 0, 1, 3.5, 90.5, 93, 104.5, 106),
(12, 0, 1, 3.75, 92, 94.5, 106.5, 108),
(13, 0, 1, 4, 93.5, 96, 108, 110),
(14, 0, 1, 4.25, 95, 96.5, 110, 112),
(15, 0, 1, 4.5, 97, 99, 112, 113.5),
(16, 0, 1, 4.75, 98.5, 100.5, 113.5, 115),
(17, 0, 1, 5, 100, 102, 115, 117.7),
(18, 0, 2, 1, 67, 69, 79, 80.5),
(19, 0, 2, 1.25, 70, 72, 82.5, 84.5),
(20, 0, 2, 1.5, 73, 74.5, 85, 87.5),
(21, 0, 2, 1.75, 75.5, 77, 88, 89.5),
(22, 0, 2, 2, 78, 79.5, 90.5, 92),
(23, 0, 2, 2.25, 80, 82, 92.5, 94.5),
(24, 0, 2, 2.5, 82, 84, 95, 96.5),
(25, 0, 2, 2.75, 84, 86, 97, 98.5),
(26, 0, 2, 3, 85.5, 88, 99, 100.5),
(27, 0, 2, 3.25, 87.5, 89.5, 100.5, 102.5),
(28, 0, 2, 3.5, 89, 91.5, 102.5, 104.5),
(29, 0, 2, 3.75, 90.5, 93, 104.5, 106),
(30, 0, 2, 4, 92.5, 94.5, 106.5, 108.5),
(31, 0, 2, 4.25, 94, 96, 108.5, 110.5),
(32, 0, 2, 4.5, 95.5, 98, 110.5, 112.5),
(33, 0, 2, 4.75, 97.5, 99.5, 112.5, 114),
(34, 0, 2, 5, 99, 101, 114, 116),
(35, 1, 1, 5, 100, 102, 115, 117.5),
(36, 1, 1, 6, 105.5, 107.5, 121.5, 123.5),
(37, 1, 1, 7, 110.5, 113, 127.5, 130),
(38, 1, 1, 8, 114.5, 117.5, 133.5, 136),
(39, 1, 1, 9, 119, 122, 138, 141),
(40, 1, 1, 10, 123.5, 126.5, 143.5, 145.5),
(41, 1, 1, 11, 127.5, 130.5, 149.5, 153),
(42, 1, 1, 12, 131.5, 135, 157, 161),
(43, 1, 1, 13, 135, 139, 162, 166),
(44, 1, 1, 14, 143, 147.5, 170, 173),
(45, 1, 1, 15, 149.5, 153.5, 173, 176.5),
(46, 1, 1, 16, 155, 158.5, 176, 178.5),
(47, 1, 1, 17, 157.5, 160.5, 177, 179.5),
(48, 1, 1, 18, 158.5, 161.5, 177.5, 180),
(49, 1, 2, 5, 99, 101, 114, 116),
(50, 1, 2, 6, 105, 107.5, 120.5, 123),
(51, 1, 2, 7, 109.5, 112.5, 126.5, 129),
(52, 1, 2, 8, 114.5, 117, 132.5, 135),
(53, 1, 2, 9, 119, 122, 139, 142),
(54, 1, 2, 10, 124, 127, 146, 149.5),
(55, 1, 2, 11, 129.5, 133, 152.5, 155.5),
(56, 1, 2, 12, 135.5, 138.5, 157, 159.5),
(57, 1, 2, 13, 140.5, 143.5, 160, 162.5),
(58, 1, 2, 14, 144.5, 147, 162, 164.5),
(59, 1, 2, 15, 146, 148, 163.5, 166),
(60, 1, 2, 16, 146.5, 149, 164, 166.5),
(61, 1, 2, 17, 147, 149, 164, 166.5),
(62, 1, 2, 18, 147, 149.5, 164, 166.5)" ;
$dbquery = mysqli_query($connect,$sql);

$sql="CREATE TABLE IF NOT EXISTS `health_age_weight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `sex` tinyint(4) NOT NULL DEFAULT '2',
  `age` double NOT NULL,
  `weight_1` double NOT NULL,
  `weight_2` double NOT NULL,
  `weight_3` double NOT NULL,
  `weight_4` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8" ;
$dbquery = mysqli_query($connect,$sql);

$sql="INSERT INTO `health_age_weight` (`id`, `type`, `sex`, `age`, `weight_1`, `weight_2`, `weight_3`, `weight_4`) VALUES
(1, 0, 1, 1, 7.8, 8.3, 11.5, 11.5),
(2, 0, 1, 1.25, 8.5, 9, 12, 12.5),
(3, 0, 1, 1.5, 8.9, 9.4, 12.9, 13.5),
(4, 0, 1, 1.75, 9.4, 10, 13.7, 14.4),
(5, 0, 1, 2, 9.8, 10.5, 14.5, 15.2),
(6, 0, 1, 2.25, 10.2, 11, 15, 15.8),
(7, 0, 1, 2.5, 10.6, 11.4, 15.8, 16.7),
(8, 0, 1, 2.75, 11, 11.8, 16.6, 17.4),
(9, 0, 1, 3, 11.4, 12.2, 17.3, 18.2),
(10, 0, 1, 3.25, 11.7, 12.6, 18, 19),
(11, 0, 1, 3.5, 12, 12.8, 18.7, 19.8),
(12, 0, 1, 3.75, 12.4, 13.3, 19.3, 20.6),
(13, 0, 1, 4, 12.7, 13.6, 20, 21.3),
(14, 0, 1, 4.25, 13.2, 13.9, 20.7, 22),
(15, 0, 1, 4.5, 13.4, 14.3, 21.3, 22.7),
(16, 0, 1, 4.75, 13.8, 14.6, 21.9, 23.7),
(17, 0, 1, 5, 14, 15, 23, 24),
(18, 0, 2, 1, 7.3, 7.7, 10.5, 11),
(19, 0, 2, 1.25, 7.8, 8.3, 11.3, 11.9),
(20, 0, 2, 1.5, 8.3, 8.8, 12, 12.8),
(21, 0, 2, 1.75, 8.8, 9.3, 12.9, 13.6),
(22, 0, 2, 2, 9, 9.8, 13.6, 14.4),
(23, 0, 2, 2.25, 9.5, 10.2, 14.4, 15.2),
(24, 0, 2, 2.5, 9.8, 10.7, 15.2, 15.9),
(25, 0, 2, 2.75, 10.3, 11.2, 15.9, 16.9),
(26, 0, 2, 3, 10.7, 11.5, 16.6, 17.4),
(27, 0, 2, 3.25, 11.2, 11.9, 17.3, 18.2),
(28, 0, 2, 3.5, 11.5, 12.3, 17.9, 18.9),
(29, 0, 2, 3.75, 11.8, 12.7, 18.5, 19.7),
(30, 0, 2, 4, 12.2, 13, 19.3, 20.5),
(31, 0, 2, 4.25, 12.4, 13.4, 19.7, 21),
(32, 0, 2, 4.5, 12.8, 13.7, 20.3, 21.7),
(33, 0, 2, 4.75, 13, 13.9, 20.9, 22.3),
(34, 0, 2, 5, 13.5, 14, 22, 23.5),
(35, 1, 1, 5, 14, 15, 23, 24),
(36, 1, 1, 6, 15.5, 16.5, 25.5, 27),
(37, 1, 1, 7, 17, 18.5, 28.5, 31),
(38, 1, 1, 8, 18.5, 20, 32, 35),
(39, 1, 1, 9, 20, 21.5, 36, 39.5),
(40, 1, 1, 10, 21.5, 23.5, 40.5, 44.5),
(41, 1, 1, 11, 23, 25.5, 45, 49.5),
(42, 1, 1, 12, 25.5, 28, 50, 54.5),
(43, 1, 1, 13, 28, 31.5, 54.5, 58.5),
(44, 1, 1, 14, 32, 35.5, 58.5, 63.5),
(45, 1, 1, 15, 36.5, 40, 62, 65.5),
(46, 1, 1, 16, 40.5, 44, 64, 67.5),
(47, 1, 1, 17, 43, 46, 66, 69),
(48, 1, 1, 18, 45, 48, 67, 70),
(49, 1, 2, 5, 13.5, 14, 22, 23.5),
(50, 1, 2, 6, 15, 16, 24.5, 26.5),
(51, 1, 2, 7, 16.5, 17.5, 28.5, 31),
(52, 1, 2, 8, 17.5, 19, 32.5, 35.5),
(53, 1, 2, 9, 19.5, 21, 37.5, 41),
(54, 1, 2, 10, 21.5, 23.5, 42, 46),
(55, 1, 2, 11, 23.5, 26, 46.5, 50.5),
(56, 1, 2, 12, 26.5, 29, 50, 54),
(57, 1, 2, 13, 29.5, 33, 53, 55.5),
(58, 1, 2, 14, 33.5, 36.5, 55, 58.5),
(59, 1, 2, 15, 36.5, 38.5, 56.5, 59.5),
(60, 1, 2, 16, 37.5, 40, 57, 60),
(61, 1, 2, 17, 38, 41, 57.5, 60.5),
(62, 1, 2, 18, 38.5, 41, 57.5, 60.5)" ;
$dbquery = mysqli_query($connect,$sql);
?>
