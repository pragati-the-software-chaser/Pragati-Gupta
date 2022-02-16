-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2020 at 09:43 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `savvy_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment_info`
--

CREATE TABLE `assessment_info` (
  `courseName` varchar(30) NOT NULL,
  `Assessment_Type` varchar(20) NOT NULL,
  `Assessment_Name` varchar(20) NOT NULL,
  `Question` varchar(200) DEFAULT NULL,
  `Due Date` varchar(10) NOT NULL,
  `Total Score` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assessment_info`
--

INSERT INTO `assessment_info` (`courseName`, `Assessment_Type`, `Assessment_Name`, `Question`, `Due Date`, `Total Score`) VALUES
('Operating Systems', 'Assignment', '', NULL, '', 30),
('Project', 'Assignment', 'A1', NULL, '2020-11-19', 100),
('Operating Systems', 'Quiz', 'Automatic', NULL, '2020-11-21', 30),
('Robotics', 'Assignment', 'Chapter 1 test', NULL, '2020-12-04', 30),
('Operating Systems', 'Assignment', 'Chapter 2 test', NULL, '2020-11-12', 30),
('Project', 'Discussion', 'D1', ' test1', '2020-11-20', 100),
('Robotics', 'Assignment', 'Database application', NULL, '2020-11-28', 30),
('Robotics', 'Discussion', 'DBMS and OS', 'What is Deadlock in DBMS and OS?            ', '2020-11-21', 30),
('Robotics', 'Quiz', 'Ethics in Robotics', NULL, '2020-11-25', 100),
('Robotics', 'Quiz', 'Extra feature', NULL, '2020-11-27', 30),
('Software Engineering', 'Quiz', 'Finals', NULL, '2020-11-14', 30),
('Robotics', 'Discussion', 'Memory Management', 'Q1: What is Memory Management?', '2020-11-26', 30),
('Software Engineering', 'Assignment', 'Memory management as', NULL, '2020-11-28', 30),
('Operating Systems', 'Quiz', 'Memory Management Te', NULL, '2020-11-12', 30),
('Robotics', 'Quiz', 'Midterm', NULL, '2020-11-28', 30),
('Software Engineering', 'Quiz', 'Midterm Quiz', NULL, '2020-11-21', 30),
('Operating Systems', 'Quiz', 'Multiple choice ques', NULL, '2020-11-19', 30),
('Operating Systems', 'Discussion', 'OS', 'What is Operating system?  ', '2020-11-19', 30),
('Operating Systems', 'Discussion', 'OS Importance', ' How OS is important for human ?       ', '2020-11-18', 50),
('Robotics', 'Quiz', 'Robo upload quiz', NULL, '2020-11-26', 30),
('Robotics', 'Discussion', 'Robotics Benefits', '                What are the benefits of Robotics to human race ?', '2020-11-21', 30),
('Software Engineering', 'Quiz', 'Sem1', NULL, '2020-11-27', 30),
('Software Engineering', 'Quiz', 'Semester 1', NULL, '2020-11-28', 30),
('Operating Systems', 'Quiz', 'test score quiz', NULL, '2020-11-27', 30),
('Software Engineering', 'Assignment', 'Test1', NULL, '2020-11-20', 30),
('Software Engineering', 'Quiz', 'Test2', NULL, '2020-11-21', 30),
('Operating Systems', 'Quiz', 'TestOS Chapter1', NULL, '2020-11-19', 30),
('Operating Systems', 'Quiz', 'Web development quiz', NULL, '2020-11-20', 30);

-- --------------------------------------------------------

--
-- Table structure for table `course_info`
--

CREATE TABLE `course_info` (
  `email` varchar(30) NOT NULL,
  `courses` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_info`
--

INSERT INTO `course_info` (`email`, `courses`) VALUES
('jennifer@gmail.com', 'Computer Networks'),
('jennifer@gmail.com', 'Computer Security'),
('jennifer@gmail.com', 'Database Systems'),
('pragati@gmail.com', 'Operating Systems'),
('pragati@gmail.com', 'Robotics'),
('pragati@gmail.com', 'Software Engineering'),
('tejaswi@gmail.com', 'Project'),
('vishali@gmail.com', 'Research');

-- --------------------------------------------------------

--
-- Table structure for table `grades_info`
--

CREATE TABLE `grades_info` (
  `courseName` varchar(20) NOT NULL,
  `AssessmentName` varchar(20) NOT NULL,
  `StudentName` varchar(20) NOT NULL,
  `Total_Question` int(11) NOT NULL,
  `Correct_Answers` int(11) NOT NULL,
  `Wrong_Answers` int(11) NOT NULL,
  `Grade` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grades_info`
--

INSERT INTO `grades_info` (`courseName`, `AssessmentName`, `StudentName`, `Total_Question`, `Correct_Answers`, `Wrong_Answers`, `Grade`) VALUES
('Software Engineering', 'Test2', 'James', 10, 8, 2, 'A'),
('Software Engineering', 'Test2', 'John', 10, 9, 1, 'A'),
('Software Engineering', 'Test2', 'Logan', 10, 6, 4, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `module_info`
--

CREATE TABLE `module_info` (
  `courses` varchar(30) NOT NULL,
  `moduleName` varchar(30) NOT NULL,
  `topicName` varchar(20) NOT NULL,
  `topicURL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `module_info`
--

INSERT INTO `module_info` (`courses`, `moduleName`, `topicName`, `topicURL`) VALUES
('Robotics', 'Application of robots', 'Application', ''),
('Operating Systems', 'Chapter1', 'Introduction', 'https://en.wikipedia.org/wiki/Operating_'),
('Operating Systems', 'Chapter1', 'Oracle', ''),
('Operating Systems', 'Chapter1', 'Test topic', 'https://www.slideshare.net/shafaan/chapter-1-introduction-to-operating-system'),
('Software Engineering', 'DBMS', 'SQL', 'http://www.sqlcourse.com/intro.html#:~:text=SQL%20(pronounced%20%22ess%2Dque,for%20relational%20data'),
('Software Engineering', 'Introduction', 'Definition', 'https://medium.com/omarelgabrys-blog/sof'),
('Robotics', 'LabView Robotics', 'Chapter 1', 'https://www.ni.com/en-us/support/downloads/software-products/download.labview-robotics-module.html#3'),
('Operating Systems', 'Memory Management', 'Memory', ''),
('Project', 'Project1', 'P1', ''),
('Operating Systems', 'SQL', 'Chapter1', '');

-- --------------------------------------------------------

--
-- Table structure for table `test_info`
--

CREATE TABLE `test_info` (
  `Assessment_Name` varchar(20) NOT NULL,
  `Question` varchar(200) NOT NULL,
  `Question_Type` varchar(20) NOT NULL,
  `Option1` varchar(50) DEFAULT NULL,
  `Option2` varchar(50) DEFAULT NULL,
  `Option3` varchar(50) DEFAULT NULL,
  `Option4` varchar(50) DEFAULT NULL,
  `Correct_Answer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_info`
--

INSERT INTO `test_info` (`Assessment_Name`, `Question`, `Question_Type`, `Option1`, `Option2`, `Option3`, `Option4`, `Correct_Answer`) VALUES
('Automatic', ' Are you feeling more comfortable in the virtual world than the real world? Yes you are right and we need to findthe second line going lets check the second line', 'MultiChoice', '  Sometimes', '   Never', '  Yes', '   Always', ' Never'),
('Automatic', ' Are you obsessed with your phone?', 'MultiChoice', '  True', ' False', NULL, NULL, ' Yes'),
('Midterm Quiz', '1. Aggregate functions are functions that take a ___________ as input and return a single value?', 'MultiChoice', 'Collection of values', 'Single value', 'Aggregate value', 'Both Collection of values & Single value', 'A'),
('Midterm Quiz', 'SELECT Avg(salary) FROM instructor WHERE dept name= ’Comp. Sci.’;', 'TrueFalse', 'True', 'False', NULL, NULL, 'A'),
('Midterm Quiz', 'What is DBMS?', 'ShortAnswer', NULL, NULL, NULL, NULL, ''),
('Sem1', ' SELECT __________FROM instructor WHERE dept name= ’Comp. Sci.’;Which of the following should be used to find the mean of the salary? is it avg (salary', 'MultiChoice', '  True', ' False', NULL, NULL, ' Yes'),
('Sem1', 'SELECT COUNT (____ ID) FROM teaches WHERE semester = ’Spring’ AND YEAR = 2010;If we do want to eliminate duplicates, we use the keyword ______ in the aggregate', 'MultiChoice', '  Distinct', '   Count', '  Avg', '   Primary key', ' Distinct'),
('Test2', 'Dual mode of operating system has', 'MultiChoice', '.1 mode', '2 modes', '3 modes', '4 modes', 'A'),
('Test2', 'Multi-processor system gives a', 'MultiChoice', 'small system', 'tightly coupled system', 'loosely coupled system', 'both a and b', 'B'),
('Test2', 'Scheduling of threads are done by', 'MultiChoice', 'input', 'output', 'operating system', 'memory', 'C'),
('Web development quiz', 'All aggregate functions except _____ ignore null values in their input collection.?', 'MultiChoice', 'Count (attribute)', 'Count(*)', 'Avg', 'Sum', 'Count(*)');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`name`, `email`, `password`) VALUES
('Dan', 'dan@gmail.com', '123'),
('Instructor', 'instructor@gmail.com', '123'),
('Jennifer', 'jennifer@gmail.com', '123'),
('Pragati', 'pragati@gmail.com', '123'),
('Tejaswi', 'tejaswi@gmail.com', '123'),
('test', 'test@gmail.com', 'test'),
('Vishali', 'vishali@gmail.com', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment_info`
--
ALTER TABLE `assessment_info`
  ADD PRIMARY KEY (`Assessment_Name`),
  ADD KEY `courseName` (`courseName`);

--
-- Indexes for table `course_info`
--
ALTER TABLE `course_info`
  ADD UNIQUE KEY `courses` (`courses`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `grades_info`
--
ALTER TABLE `grades_info`
  ADD PRIMARY KEY (`courseName`,`AssessmentName`,`StudentName`),
  ADD KEY `AssessmentName` (`AssessmentName`);

--
-- Indexes for table `module_info`
--
ALTER TABLE `module_info`
  ADD PRIMARY KEY (`moduleName`,`topicName`),
  ADD UNIQUE KEY `topicName` (`topicName`),
  ADD KEY `courses` (`courses`);

--
-- Indexes for table `test_info`
--
ALTER TABLE `test_info`
  ADD PRIMARY KEY (`Assessment_Name`,`Question`),
  ADD UNIQUE KEY `Question` (`Question`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment_info`
--
ALTER TABLE `assessment_info`
  ADD CONSTRAINT `assessment_info_ibfk_1` FOREIGN KEY (`courseName`) REFERENCES `course_info` (`courses`);

--
-- Constraints for table `course_info`
--
ALTER TABLE `course_info`
  ADD CONSTRAINT `course_info_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user_info` (`email`);

--
-- Constraints for table `grades_info`
--
ALTER TABLE `grades_info`
  ADD CONSTRAINT `grades_info_ibfk_1` FOREIGN KEY (`courseName`) REFERENCES `course_info` (`courses`),
  ADD CONSTRAINT `grades_info_ibfk_2` FOREIGN KEY (`AssessmentName`) REFERENCES `assessment_info` (`Assessment_Name`);

--
-- Constraints for table `module_info`
--
ALTER TABLE `module_info`
  ADD CONSTRAINT `deleteConst` FOREIGN KEY (`courses`) REFERENCES `course_info` (`courses`),
  ADD CONSTRAINT `module_info_ibfk_1` FOREIGN KEY (`courses`) REFERENCES `course_info` (`courses`);

--
-- Constraints for table `test_info`
--
ALTER TABLE `test_info`
  ADD CONSTRAINT `test_info_ibfk_1` FOREIGN KEY (`Assessment_Name`) REFERENCES `assessment_info` (`Assessment_Name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
