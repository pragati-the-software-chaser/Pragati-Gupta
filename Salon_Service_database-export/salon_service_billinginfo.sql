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
-- Table structure for table `billinginfo`
--

DROP TABLE IF EXISTS `billinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billinginfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `EmailId` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Zip` varchar(45) NOT NULL,
  `FullName` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`EmailId`),
  KEY `EmailId_idx` (`EmailId`),
  CONSTRAINT `EmailId` FOREIGN KEY (`EmailId`) REFERENCES `user_details` (`EmailId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billinginfo`
--

LOCK TABLES `billinginfo` WRITE;
/*!40000 ALTER TABLE `billinginfo` DISABLE KEYS */;
INSERT INTO `billinginfo` VALUES (1,'test@123','542 Wall Street','New York','NY','10001','John'),(2,'test@123','132 Street','NY','NY','10001','John'),(3,'test@123','123 test','NY','NY','10001','John Cena'),(4,'test@123','123 test','NY','NY','10001','John Cena'),(5,'test@123','123 test','NY','NY','10001','John Cena'),(6,'test@123','123 test','NY','NY','10001','John Cena'),(7,'test@123','123 test','NY','NY','10001','John Cena'),(8,'test@123','123 test','NY','NY','10001','John Cena'),(9,'test@123','123 test','NY','NY','10001','John Cena'),(10,'test@123','123 test','NY','NY','10001','John Cena'),(11,'test@123','123 test','NY','NY','10001','John Cena'),(12,'test@123','123 test','NY','NY','10001','John Cena'),(13,'test@123','123 test','NY','NY','10001','John Cena'),(14,'test@123','123 test','NY','NY','10001','John Cena'),(15,'test@123','123 test','NY','NY','10001','John Cena'),(16,'test@123','4323','NY','NY','1211','TT'),(17,'test@123','545','NY','NY','1818','John'),(18,'test@123','545','NY','NYU','1231','john'),(19,'test@123','545','NY','NYU','1231','john'),(20,'lucky@gmail.com','8, skytop','parlin','Nj','4646','pragati gupta');
/*!40000 ALTER TABLE `billinginfo` ENABLE KEYS */;
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
