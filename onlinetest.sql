-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2019 at 06:26 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinetest`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `Aid` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `answer` varchar(120) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`Aid`, `quest_id`, `exam_id`, `answer`, `type`) VALUES
(1, 1, 1, '$', 1),
(2, 1, 1, '$', 1),
(3, 1, 1, '#', 0),
(4, 1, 1, '&&', 0),
(5, 1, 1, '@', 0),
(6, 1, 1, '%', 0),
(7, 3, 1, 'answer...', 1),
(8, 3, 1, 'answer...', 0),
(9, 3, 1, 'answer...', 0),
(10, 3, 1, 'answer...', 0),
(11, 4, 1, 'answer...', 1),
(12, 4, 1, 'answer...', 0),
(13, 4, 1, 'answer...', 0),
(14, 4, 1, 'answer...', 0),
(15, 4, 1, 'answer...', 0);

-- --------------------------------------------------------

--
-- Table structure for table `answers_results`
--

CREATE TABLE `answers_results` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `examId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `applied_for_jobs`
--

CREATE TABLE `applied_for_jobs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `hr_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `hasExamId` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applied_for_jobs`
--

INSERT INTO `applied_for_jobs` (`id`, `user_id`, `job_id`, `hr_id`, `date`, `status`, `hasExamId`) VALUES
(4, 1, 1, 1, '2019-12-24 22:49:04', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `type` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `name`, `type`) VALUES
(1, 'Exam for php developers', 'php type'),
(2, 'exam for machine learning engineers', 'machine learning'),
(3, 'test for java developers', 'java');

-- --------------------------------------------------------

--
-- Table structure for table `hr`
--

CREATE TABLE `hr` (
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `industery` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hr`
--

INSERT INTO `hr` (`name`, `email`, `pass`, `company_name`, `industery`, `address`, `id`) VALUES
('Hossam ali', 'b.tech@gmail.com', '123456789', 'Alliad Consulting', 'software development', 'Nacer city', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `hr_id` int(11) NOT NULL,
  `title` varchar(120) NOT NULL,
  `responsiblites` varchar(250) NOT NULL,
  `requirments` varchar(250) NOT NULL,
  `level` varchar(30) NOT NULL,
  `yearsOfExperience` double NOT NULL,
  `vacances` int(11) NOT NULL,
  `salary` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `hr_id`, `title`, `responsiblites`, `requirments`, `level`, `yearsOfExperience`, `vacances`, `salary`) VALUES
(1, 1, 'php developer', 'create server side code', 'php, laravel, mysql', 'entry level', 1, 3, 7000);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `exam_id`, `question`) VALUES
(1, 1, 'which sign used for declaration?'),
(2, 1, 'Which sign is concatenation operator in PHP?'),
(3, 1, 'question...?'),
(4, 1, 'question......?'),
(5, 1, 'question......?'),
(6, 1, 'question.....?');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `name` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `pass` varchar(60) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`name`, `email`, `pass`, `id`) VALUES
('Ahmed nabil', 'nabilahmed@yahoo.com', '123456', 1),
('Alaa nabil', 'human@gmail.com', '789456', 2),
('', '', '', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`Aid`),
  ADD KEY `foreing keys` (`exam_id`),
  ADD KEY `key` (`quest_id`);

--
-- Indexes for table `answers_results`
--
ALTER TABLE `answers_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `newfor` (`examId`),
  ADD KEY `lsdkmlk` (`userId`);

--
-- Indexes for table `applied_for_jobs`
--
ALTER TABLE `applied_for_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `efds` (`job_id`),
  ADD KEY `sdf` (`user_id`),
  ADD KEY `dfuy` (`hr_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr`
--
ALTER TABLE `hr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hhh` (`hr_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreing key examid` (`exam_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `Aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `answers_results`
--
ALTER TABLE `answers_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applied_for_jobs`
--
ALTER TABLE `applied_for_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hr`
--
ALTER TABLE `hr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `foreing keys` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  ADD CONSTRAINT `key` FOREIGN KEY (`quest_id`) REFERENCES `question` (`id`);

--
-- Constraints for table `answers_results`
--
ALTER TABLE `answers_results`
  ADD CONSTRAINT `lsdkmlk` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `newfor` FOREIGN KEY (`examId`) REFERENCES `exam` (`id`);

--
-- Constraints for table `applied_for_jobs`
--
ALTER TABLE `applied_for_jobs`
  ADD CONSTRAINT `dfuy` FOREIGN KEY (`hr_id`) REFERENCES `hr` (`id`),
  ADD CONSTRAINT `efds` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`),
  ADD CONSTRAINT `sdf` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `hhh` FOREIGN KEY (`hr_id`) REFERENCES `hr` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `foreing key examid` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
