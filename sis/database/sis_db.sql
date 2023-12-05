-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2023 at 08:23 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_history`
--

CREATE TABLE `academic_history` (
  `id` int(30) NOT NULL,
  `student_id` int(30) NOT NULL,
  `course_id` int(30) NOT NULL,
  `semester` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `school_year` text NOT NULL,
  `status` int(10) NOT NULL DEFAULT 1 COMMENT '1= New,\r\n2= Regular,\r\n3= Returnee,\r\n4= Transferee',
  `end_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '0=pending,\r\n1=Completed,\r\n2=Dropout,\r\n3=failed,\r\n4=Transferred-out,\r\n5=Graduated',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_list`
--

CREATE TABLE `course_list` (
  `id` int(30) NOT NULL,
  `department_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_list`
--

INSERT INTO `course_list` (`id`, `department_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 2, 'BSIT', 'Bachelor of Science in Information Technology', 1, 0, '2022-01-27 10:03:25', NULL),
(2, 4, 'BEEd', 'Bachelor of Elementary Education', 1, 0, '2022-01-27 10:06:43', NULL),
(3, 4, 'BSEd', 'Bachelor of Secondary Education', 1, 0, '2022-01-27 10:07:21', NULL),
(4, 4, 'MAEd', 'Master of Arts in Education', 1, 0, '2022-01-27 10:07:52', NULL),
(5, 4, 'PhD Educ', 'Doctor of Philosophy in Education', 1, 0, '2022-01-27 10:08:21', NULL),
(6, 1, 'BSCE', 'Bachelor of Science in Civil Engineering', 1, 0, '2022-01-27 10:08:48', NULL),
(7, 1, 'MSCE', 'Master of Science in Civil Engineering', 1, 0, '2022-01-27 10:09:00', NULL),
(8, 1, 'BS ChE', 'Bachelor of Science in Chemical Engineering', 1, 0, '2022-01-27 10:09:35', NULL),
(9, 1, 'MS ChE', 'Master of Science in Chemical Engineering', 1, 0, '2022-01-27 10:10:16', NULL),
(10, 1, 'DEngg ChE', 'Doctor of Engineering (Chemical Engineering)', 1, 0, '2022-01-27 10:10:39', NULL),
(11, 1, 'BSCS', 'Bachelor of Science in Computer Science', 1, 0, '2022-01-27 10:12:23', NULL),
(12, 1, 'MSCS', 'Master of Science in Computer Science', 1, 0, '2022-01-27 10:12:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department_list`
--

CREATE TABLE `department_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department_list`
--

INSERT INTO `department_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'CoEng', 'College of Engineering', 1, 0, '2022-01-27 09:22:31', '2022-01-27 09:33:36'),
(2, 'CoAS', 'College of Arts and Science', 1, 0, '2022-01-27 09:22:54', '2022-01-27 09:33:03'),
(3, 'CoB', 'College of Business', 1, 0, '2022-01-27 09:23:20', '2022-01-27 09:33:11'),
(4, 'CoE', 'College of Education', 1, 0, '2022-01-27 09:25:42', '2022-01-27 09:33:18'),
(5, 'CSSP', 'College of Social Sciences and Philosophy', 1, 0, '2022-01-27 09:26:35', '2022-01-27 09:33:49'),
(6, 'Sample101', 'Deleted Department', 1, 1, '2022-01-27 09:27:17', '2022-01-27 09:27:28'),
(7, 'Computing and Robotics', 'computer studies, AI, ML Big data', 1, 1, '2023-12-05 10:20:09', '2023-12-05 10:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `student_list`
--

CREATE TABLE `student_list` (
  `id` int(30) NOT NULL,
  `roll` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(100) NOT NULL,
  `contact` text NOT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text NOT NULL,
  `dob` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_list`
--

INSERT INTO `student_list` (`id`, `roll`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `present_address`, `permanent_address`, `dob`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(4, '1', 'Brian', '', 'Liyosi', 'Male', '072222222', 'Syokiamu Rd, Kilifi County', 'Syokiamu Rd, Kilifi County', '2009-02-04', 1, 0, '2023-12-02 17:57:52', NULL),
(5, 'Numquam itaque moles', 'Hamish', 'Shelly Baxter', 'Howe', 'Male', 'Omnis suscipit omnis', 'Voluptatibus dicta e', 'Dicta fugiat dolor ', '1976-10-15', 1, 0, '2023-12-05 10:19:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Student Information System'),
(6, 'short_name', 'School Manage'),
(11, 'logo', 'uploads/logo-1643245863.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1643245863.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'School ', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1639468007', NULL, 1, 1, '2021-01-20 14:02:37', '2023-12-02 17:53:46'),
(8, 'Brian', NULL, 'Liyosi', 'liyosi', 'e2fc714c4727ee9395f324cd2e7f331f', 'uploads/avatar-8.png?v=1643185259', NULL, 1, 1, '2022-01-26 16:20:59', '2023-12-05 10:20:53'),
(9, 'Test', NULL, 'user', 'test', 'cc03e747a6afbbcbf8be7668acfebee5', NULL, NULL, 2, 1, '2023-12-04 13:16:02', NULL),
(10, 'Test0', NULL, 'user', 'test0user', 'cc03e747a6afbbcbf8be7668acfebee5', NULL, NULL, 2, 1, '2023-12-04 13:16:33', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_history`
--
ALTER TABLE `academic_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `course_list`
--
ALTER TABLE `course_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `department_list`
--
ALTER TABLE `department_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_list`
--
ALTER TABLE `student_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_history`
--
ALTER TABLE `academic_history`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course_list`
--
ALTER TABLE `course_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `department_list`
--
ALTER TABLE `department_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `student_list`
--
ALTER TABLE `student_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_history`
--
ALTER TABLE `academic_history`
  ADD CONSTRAINT `academic_history_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `academic_history_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_list`
--
ALTER TABLE `course_list`
  ADD CONSTRAINT `course_list_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
