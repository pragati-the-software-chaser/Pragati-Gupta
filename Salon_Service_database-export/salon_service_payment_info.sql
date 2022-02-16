CREATE DATABASE  IF NOT EXISTS `salon_service` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `salon_service`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: salon_service
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `payment_info`
--

DROP TABLE IF EXISTS `payment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `EmailId` varchar(45) NOT NULL,
  `NameOnCard` varchar(45) NOT NULL,
  `CreditCardNumber` varchar(45) NOT NULL,
  `ExpMonth` varchar(45) NOT NULL,
  `ExpYear` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`EmailId`),
  KEY `EmailId_idx` (`EmailId`),
  CONSTRAINT `Email` FOREIGN KEY (`EmailId`) REFERENCES `user_details` (`EmailId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_info`
--

LOCK TABLES `payment_info` WRITE;
/*!40000 ALTER TABLE `payment_info` DISABLE KEYS */;
INSERT INTO `payment_info` VALUES (1,'test@123','John','1212-2211-2222-1111','May','2021'),(2,'test@123','jOHN','121-1-212-112-1','mAY','2021'),(3,'test@123','John','1111-1111-1111-1111','May','2021'),(4,'test@123','John','1111-1111-1111-1111','May','2021'),(5,'test@123','John','1111-1111-1111-1111','May','2021'),(6,'test@123','John','1111-1111-1111-1111','May','2021'),(7,'test@123','John','1111-1111-1111-1111','May','2021'),(8,'test@123','John','1111-1111-1111-1111','May','2021'),(9,'test@123','John','1111-1111-1111-1111','May','2021'),(10,'test@123','John','1111-1111-1111-1111','May','2021'),(11,'test@123','John','1111-1111-1111-1111','May','2021'),(12,'test@123','John','1111-1111-1111-1111','May','2021'),(13,'test@123','John','1111-1111-1111-1111','May','2021'),(14,'test@123','John','1111-1111-1111-1111','May','2021'),(15,'test@123','John','1111-1111-1111-1111','May','2021'),(16,'test@123','JONE','12112111212121','May','2020'),(17,'test@123','JOHN','1212-121-11212-121','May','2021'),(18,'test@123','JOHN','1221-12121-1212-1111','May','2020'),(19,'test@123','JOHN','1221-12121-1212-1111','May','2020'),(20,'lucky@gmail.com','pg','1111-2222-3333-4444','Jan','2021');
/*!40000 ALTER TABLE `payment_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-10 10:25:43
