-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 01:08 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hellofresh`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_accounts`
--

CREATE TABLE IF NOT EXISTS `customer_accounts` (
  `customer_Id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `email_Id` varchar(35) NOT NULL,
  `accPwd` varchar(100) NOT NULL,
  PRIMARY KEY (`customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE IF NOT EXISTS `customer_orders` (
  `order_Id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_Id` int(11) NOT NULL,
  `orderQty` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(15) NOT NULL COMMENT 'PREPARE_ORDER|DELIVER_ORDER|ORDER_COMPLETED',
  `deliveryOptions` varchar(15) NOT NULL COMMENT 'STORE_PICKUP|CURBSIDE_PICKUP|HOME_DELIVERY',
  PRIMARY KEY (`order_Id`),
  KEY `product_Id` (`cart_Id`),
  KEY `cart_Id` (`cart_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_reviews`
--

CREATE TABLE IF NOT EXISTS `customer_reviews` (
  `review_Id` int(11) NOT NULL AUTO_INCREMENT,
  `order_Id` int(11) NOT NULL,
  `rating` int(1) NOT NULL,
  `comments` varchar(250) NOT NULL,
  PRIMARY KEY (`review_Id`),
  KEY `order_Id` (`order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_shoplist`
--

CREATE TABLE IF NOT EXISTS `customer_shoplist` (
  `customer_Id` int(11) NOT NULL,
  `cart_Id` int(11) NOT NULL,
  `product_Id` int(11) NOT NULL,
  `orderQty` int(11) NOT NULL,
  KEY `product_Id` (`product_Id`),
  KEY `customer_Id` (`customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_accounts`
--

CREATE TABLE IF NOT EXISTS `emp_accounts` (
  `employee_Id` int(11) NOT NULL AUTO_INCREMENT,
  `store_Id` int(11) NOT NULL,
  `user_role` varchar(15) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `email_Id` varchar(35) NOT NULL,
  `accPwd` varchar(100) NOT NULL,
  PRIMARY KEY (`employee_Id`),
  KEY `store_Id` (`store_Id`),
  KEY `user_role` (`user_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `emp_reviews`
--

CREATE TABLE IF NOT EXISTS `emp_reviews` (
  `review_Id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_Id` int(11) NOT NULL,
  `rating` int(1) NOT NULL,
  `comments` varchar(250) NOT NULL,
  PRIMARY KEY (`review_Id`),
  KEY `order_Id` (`emp_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products_info`
--

CREATE TABLE IF NOT EXISTS `products_info` (
  `product_Id` int(11) NOT NULL AUTO_INCREMENT,
  `store_Id` int(11) NOT NULL,
  `categoryName` varchar(15) NOT NULL,
  `productName` varchar(35) NOT NULL,
  `productImg` varchar(250) NOT NULL,
  `availableQty` int(11) NOT NULL,
  `eachPrice` float NOT NULL,
  PRIMARY KEY (`product_Id`),
  KEY `categoryName` (`categoryName`),
  KEY `store_Id` (`store_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `categoryName` varchar(15) NOT NULL,
  PRIMARY KEY (`categoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`categoryName`) VALUES
('Bakery'),
('Dairy'),
('Fruits'),
('Vegetables');

-- --------------------------------------------------------

--
-- Table structure for table `store_dept`
--

CREATE TABLE IF NOT EXISTS `store_dept` (
  `dept_Id` varchar(15) NOT NULL,
  PRIMARY KEY (`dept_Id`),
  KEY `dept_Id` (`dept_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_dept`
--

INSERT INTO `store_dept` (`dept_Id`) VALUES
('CEO'),
('DBA'),
('DELIVERY_BOY'),
('GROCERS'),
('HR');

-- --------------------------------------------------------

--
-- Table structure for table `store_info`
--

CREATE TABLE IF NOT EXISTS `store_info` (
  `store_Id` int(11) NOT NULL AUTO_INCREMENT,
  `storeName` varchar(15) NOT NULL,
  `place` varchar(15) NOT NULL,
  PRIMARY KEY (`store_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_permit`
--

CREATE TABLE IF NOT EXISTS `user_permit` (
  `user_role` varchar(15) NOT NULL,
  `empInfo_C` varchar(1) NOT NULL COMMENT 'Employee Create',
  `empInfo_R` varchar(1) NOT NULL COMMENT 'Employee Read',
  `empInfo_U` varchar(1) NOT NULL COMMENT 'Employee Update',
  `empInfo_D` varchar(1) NOT NULL COMMENT 'Employee Delete',
  `empInfo_review` varchar(1) NOT NULL COMMENT 'Employee Review',
  `shoplist_C` varchar(1) NOT NULL COMMENT 'Shopping List Create',
  `shoplist_R` varchar(1) NOT NULL COMMENT 'Shopping List View',
  `shoplist_U` varchar(1) NOT NULL COMMENT 'Shopping list Update',
  `shoplist_D` varchar(1) NOT NULL COMMENT 'Shopping list Delete',
  `shoplist_review` varchar(1) NOT NULL COMMENT 'Shoplist Review',
  `db_C` varchar(1) NOT NULL COMMENT 'Create Database',
  `db_R` varchar(1) NOT NULL COMMENT 'View Database',
  `db_U` varchar(1) NOT NULL COMMENT 'Update Database',
  `db_D` varchar(1) NOT NULL COMMENT 'Delete Database',
  PRIMARY KEY (`user_role`),
  KEY `user_role` (`user_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_permit`
--

INSERT INTO `user_permit` (`user_role`, `empInfo_C`, `empInfo_R`, `empInfo_U`, `empInfo_D`, `empInfo_review`, `shoplist_C`, `shoplist_R`, `shoplist_U`, `shoplist_D`, `shoplist_review`, `db_C`, `db_R`, `db_U`, `db_D`) VALUES
('CEO', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
('CUSTOMER', 'N', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N'),
('DBA', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
('DELIVERY_BOY', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'N'),
('GROCER', 'N', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N'),
('HR', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `role_Id` varchar(15) NOT NULL,
  PRIMARY KEY (`role_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`role_Id`) VALUES
('CEO'),
('CUSTOMER'),
('DBA'),
('DELIVERY_BOY'),
('GROCER'),
('HR');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_reviews`
--
ALTER TABLE `customer_reviews`
  ADD CONSTRAINT `customer_reviews_ibfk_1` FOREIGN KEY (`order_Id`) REFERENCES `customer_orders` (`order_Id`);

--
-- Constraints for table `customer_shoplist`
--
ALTER TABLE `customer_shoplist`
  ADD CONSTRAINT `customer_shoplist_ibfk_1` FOREIGN KEY (`customer_Id`) REFERENCES `customer_accounts` (`customer_Id`),
  ADD CONSTRAINT `customer_shoplist_ibfk_2` FOREIGN KEY (`product_Id`) REFERENCES `products_info` (`product_Id`);

--
-- Constraints for table `emp_accounts`
--
ALTER TABLE `emp_accounts`
  ADD CONSTRAINT `emp_accounts_ibfk_1` FOREIGN KEY (`store_Id`) REFERENCES `store_info` (`store_Id`),
  ADD CONSTRAINT `emp_accounts_ibfk_2` FOREIGN KEY (`user_role`) REFERENCES `user_roles` (`role_Id`);

--
-- Constraints for table `emp_reviews`
--
ALTER TABLE `emp_reviews`
  ADD CONSTRAINT `emp_reviews_ibfk_1` FOREIGN KEY (`emp_Id`) REFERENCES `emp_accounts` (`employee_Id`);

--
-- Constraints for table `products_info`
--
ALTER TABLE `products_info`
  ADD CONSTRAINT `products_info_ibfk_2` FOREIGN KEY (`store_Id`) REFERENCES `store_info` (`store_Id`),
  ADD CONSTRAINT `products_info_ibfk_1` FOREIGN KEY (`categoryName`) REFERENCES `product_categories` (`categoryName`);

--
-- Constraints for table `user_permit`
--
ALTER TABLE `user_permit`
  ADD CONSTRAINT `user_permit_ibfk_1` FOREIGN KEY (`user_role`) REFERENCES `user_roles` (`role_Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
