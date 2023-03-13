-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2023 at 07:44 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `lct_id` int(11) NOT NULL,
  `lct_fname` varchar(45) DEFAULT NULL,
  `lct_lname` varchar(45) DEFAULT NULL,
  `lct_ttl_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`lct_id`, `lct_fname`, `lct_lname`, `lct_ttl_id`) VALUES
(1, 'นิทัศน์', 'นิลฉวี', 7),
(2, 'สาธิต', 'สุวรรณเวช', 7),
(3, 'ทิพย์วรรณ', 'ฟูเฟื่อง', 4),
(4, 'วรวิทย์', 'ชีวาพร', 5),
(5, 'เดชาวุฒิ', 'วานิชสรรพ์', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `lecturer_detail`
-- (See below for the actual view)
--
CREATE TABLE `lecturer_detail` (
`lct_id` int(11)
,`ttl_name` varchar(45)
,`lct_fname` varchar(45)
,`lct_lname` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `prg_id` int(11) NOT NULL,
  `prg_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`prg_id`, `prg_name`) VALUES
(5, 'คอมพิวเตอร์ศึกษา'),
(4, 'ภูมิสารสนเทศ'),
(1, 'วิทยาการคอมพิวเตอร์'),
(2, 'เทคโนโลยีสารสนเทศ'),
(3, 'เทคโนโลยีเครือข่ายคอมพิวเตอร์');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `prj_id` int(11) NOT NULL,
  `prj_name_th` varchar(200) DEFAULT NULL,
  `prj_name_en` varchar(200) DEFAULT NULL,
  `prj_stt_id` int(11) DEFAULT NULL,
  `prj_ppt_id` int(11) DEFAULT NULL,
  `prj_lct_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`prj_id`, `prj_name_th`, `prj_name_en`, `prj_stt_id`, `prj_ppt_id`, `prj_lct_id`) VALUES
(1, 'GGEZ', 'Good game Easy', 1, 1, 1),
(2, 'LOL', 'Laughingt Out Loud', 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `project_lecturer`
--

CREATE TABLE `project_lecturer` (
  `pjl_prj_id` int(11) NOT NULL,
  `pjl_lct_id` int(11) NOT NULL,
  `pjl_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_progress`
--

CREATE TABLE `project_progress` (
  `pjg_id` int(11) NOT NULL,
  `pjg_prj_id` int(11) DEFAULT NULL,
  `pjg_pst_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

CREATE TABLE `project_status` (
  `pst_id` int(11) NOT NULL,
  `pst_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_status`
--

INSERT INTO `project_status` (`pst_id`, `pst_name`) VALUES
(2, 'ผ่านการพิจารณา'),
(4, 'ผ่านการสอบหัวข้อ'),
(6, 'ผ่านการสอบโครงงาน'),
(8, 'ยังไม่ได้ส่งหัวข้อ'),
(9, 'ยังไม่ได้ส่งโครงงาน'),
(1, 'รอพิจารณาหัวข้อ'),
(3, 'ไม่ผ่านการพิจารณา'),
(5, 'ไม่ผ่านการสอบหัวข้อ'),
(7, 'ไม่ผ่านการสอบโครงงาน');

-- --------------------------------------------------------

--
-- Table structure for table `project_student`
--

CREATE TABLE `project_student` (
  `pjs_prj_id` int(11) NOT NULL,
  `pjs_std_id` int(11) NOT NULL,
  `pjs_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_student`
--

INSERT INTO `project_student` (`pjs_prj_id`, `pjs_std_id`, `pjs_id`) VALUES
(1, 1, 1),
(1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `project_tools`
--

CREATE TABLE `project_tools` (
  `pjt_prj_id` int(11) NOT NULL,
  `pjt_tls_id` int(11) NOT NULL,
  `pjt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_type`
--

CREATE TABLE `project_type` (
  `ptt_id` int(11) NOT NULL,
  `ptt_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_type`
--

INSERT INTO `project_type` (`ptt_id`, `ptt_name`) VALUES
(1, 'ระบบสารสนเทศออนไลน์'),
(2, 'ระบบสารสนเทศออฟไลน์'),
(4, 'ระบบฮาร์ดแวร์'),
(3, 'ระบบเกมส์'),
(5, 'สื่อมัลติมีเดียสำหรับการศึกษา');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `std_id` int(10) NOT NULL,
  `std_sid` varchar(10) NOT NULL,
  `std_fname` varchar(50) NOT NULL,
  `std_lname` varchar(50) NOT NULL,
  `std_ttl_id` int(11) DEFAULT NULL,
  `std_prg_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`std_id`, `std_sid`, `std_fname`, `std_lname`, `std_ttl_id`, `std_prg_id`) VALUES
(1, '6414421001', 'jimmy', 'james', 1, 2),
(2, '6414421002', 'black', 'jack', 1, 2),
(3, '6414421003', 'joey', 'roon', 1, 2),
(4, '6414421004', 'monica', 'lovent', 1, 2),
(5, '6414421005', 'thomas', 'dumps', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

CREATE TABLE `title` (
  `ttl_id` int(11) NOT NULL,
  `ttl_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `title`
--

INSERT INTO `title` (`ttl_id`, `ttl_name`) VALUES
(8, 'Mr.'),
(2, 'นาง'),
(3, 'นางสาว'),
(1, 'นาย'),
(4, 'ผู้ช่วยศาสตราจารย์'),
(5, 'รองศาสตราจารย์'),
(6, 'ศาสตราจารย์'),
(7, 'อาจารย์');

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `tls_id` int(11) NOT NULL,
  `tls_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`tls_id`, `tls_name`) VALUES
(11, 'C++'),
(14, 'CSS 2.0'),
(15, 'CSS 3.0'),
(12, 'HTML 4.0'),
(16, 'HTML 5'),
(5, 'Java'),
(9, 'MS SQL'),
(8, 'MySQL'),
(10, 'Oracle'),
(1, 'PHP'),
(6, 'Python'),
(7, 'Ruby'),
(4, 'VB.Net'),
(2, 'VC#.Net'),
(3, 'VC++.Net'),
(13, 'XTHML 1.0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usr_id` int(11) NOT NULL,
  `usr_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `usr_email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `usr_pwd` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `usr_register_date` timestamp NULL DEFAULT NULL,
  `usr_right` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `lecturer_detail`
--
DROP TABLE IF EXISTS `lecturer_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lecturer_detail`  AS  select `lecturer`.`lct_id` AS `lct_id`,`title`.`ttl_name` AS `ttl_name`,`lecturer`.`lct_fname` AS `lct_fname`,`lecturer`.`lct_lname` AS `lct_lname` from (`lecturer` join `title` on(`lecturer`.`lct_ttl_id` = `title`.`ttl_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`lct_id`),
  ADD KEY `f_lct_ttl_id` (`lct_ttl_id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`prg_id`),
  ADD UNIQUE KEY `prg_name_UNIQUE` (`prg_name`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`prj_id`),
  ADD KEY `f_prj_stt_id` (`prj_stt_id`),
  ADD KEY `f_prj_ppt_id` (`prj_ppt_id`),
  ADD KEY `f_prj_lct_id` (`prj_lct_id`);

--
-- Indexes for table `project_lecturer`
--
ALTER TABLE `project_lecturer`
  ADD PRIMARY KEY (`pjl_id`),
  ADD KEY `f_pjl_prj_id` (`pjl_prj_id`),
  ADD KEY `f_pjl_lct_id` (`pjl_lct_id`);

--
-- Indexes for table `project_progress`
--
ALTER TABLE `project_progress`
  ADD PRIMARY KEY (`pjg_id`),
  ADD KEY `f_pjg_prj_id` (`pjg_prj_id`),
  ADD KEY `f_pjg_pst_id` (`pjg_pst_id`);

--
-- Indexes for table `project_status`
--
ALTER TABLE `project_status`
  ADD PRIMARY KEY (`pst_id`),
  ADD UNIQUE KEY `pst_name_UNIQUE` (`pst_name`);

--
-- Indexes for table `project_student`
--
ALTER TABLE `project_student`
  ADD PRIMARY KEY (`pjs_id`),
  ADD KEY `f_pjs_prj_id` (`pjs_prj_id`),
  ADD KEY `f_pjs_std_id` (`pjs_std_id`);

--
-- Indexes for table `project_tools`
--
ALTER TABLE `project_tools`
  ADD PRIMARY KEY (`pjt_id`),
  ADD KEY `f_pjt_prj_id` (`pjt_prj_id`),
  ADD KEY `f_pjt_tls_id` (`pjt_tls_id`);

--
-- Indexes for table `project_type`
--
ALTER TABLE `project_type`
  ADD PRIMARY KEY (`ptt_id`),
  ADD UNIQUE KEY `ptt_name_UNIQUE` (`ptt_name`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`std_id`),
  ADD KEY `f_std_ttl_id` (`std_ttl_id`),
  ADD KEY `f_std_prg_id` (`std_prg_id`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`ttl_id`),
  ADD UNIQUE KEY `ttl_name_UNIQUE` (`ttl_name`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`tls_id`),
  ADD UNIQUE KEY `tls_name_UNIQUE` (`tls_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usr_id`),
  ADD UNIQUE KEY `usr_name_UNIQUE` (`usr_name`),
  ADD UNIQUE KEY `usr_email_UNIQUE` (`usr_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lecturer`
--
ALTER TABLE `lecturer`
  MODIFY `lct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `prg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `prj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_lecturer`
--
ALTER TABLE `project_lecturer`
  MODIFY `pjl_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_progress`
--
ALTER TABLE `project_progress`
  MODIFY `pjg_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_status`
--
ALTER TABLE `project_status`
  MODIFY `pst_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `project_student`
--
ALTER TABLE `project_student`
  MODIFY `pjs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_tools`
--
ALTER TABLE `project_tools`
  MODIFY `pjt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_type`
--
ALTER TABLE `project_type`
  MODIFY `ptt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `std_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `title`
--
ALTER TABLE `title`
  MODIFY `ttl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `tls_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD CONSTRAINT `f_lct_ttl_id` FOREIGN KEY (`lct_ttl_id`) REFERENCES `title` (`ttl_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
