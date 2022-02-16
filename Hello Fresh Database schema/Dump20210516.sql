-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: hello_fresh
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cust_id` int NOT NULL AUTO_INCREMENT,
  `cust_email_id` varchar(45) NOT NULL,
  `cust_password` varchar(45) NOT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `cust_id_UNIQUE` (`cust_id`),
  UNIQUE KEY `cust_email_id_UNIQUE` (`cust_email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_phone`
--

DROP TABLE IF EXISTS `customer_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_phone` (
  `cust_phone` int NOT NULL,
  `cust_id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_phone`
--

LOCK TABLES `customer_phone` WRITE;
/*!40000 ALTER TABLE `customer_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `e_id` int NOT NULL,
  `oreder_ref` varchar(45) NOT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `d_review` varchar(45) DEFAULT NULL,
  `delivery_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_type`
--

DROP TABLE IF EXISTS `delivery_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_type` (
  `order_ref` int NOT NULL,
  `delivery_option` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_type`
--

LOCK TABLES `delivery_type` WRITE;
/*!40000 ALTER TABLE `delivery_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'HR','HR of the company'),(2,'Grocer','Grocer of the company'),(3,'Delivery Boy','Delivery Boy  of the company'),(4,'DBA','Database Admin of the company');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_phone`
--

DROP TABLE IF EXISTS `emp_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_phone` (
  `emp_phone` int NOT NULL,
  `emp_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_phone`
--

LOCK TABLES `emp_phone` WRITE;
/*!40000 ALTER TABLE `emp_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(60) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `s_admin` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `department_id_idx` (`department_id`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (2,'apg@gmail.com','paul_06','Paul','Pogba',2,2,1),(4,'test@gmail.com',NULL,'testf','testl',1,2,0),(5,NULL,NULL,NULL,NULL,NULL,2,NULL),(6,NULL,NULL,NULL,NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `product_quantity` int NOT NULL,
  `inv_id` int NOT NULL,
  PRIMARY KEY (`inv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (4,1),(6,2),(6,3),(5,4),(6,5),(4,6),(6,7),(6,8),(6,9),(6,10),(5,11),(15,12),(6,13),(6,14),(6,15),(5,16),(6,17),(6,18),(6,19),(6,20),(6,21),(6,22),(3,23),(6,24),(6,25);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `e_id` int NOT NULL DEFAULT '1',
  `order_total_amount` float NOT NULL,
  `estimated_date` varchar(45) NOT NULL,
  `store_id` varchar(45) NOT NULL DEFAULT '800',
  `emp_review` varchar(45) NOT NULL DEFAULT 'Helpful',
  `estimated_time` varchar(45) NOT NULL DEFAULT '5PM',
  `order_date` varchar(45) NOT NULL,
  `order_ref` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,12,'Monday 17 May 2021','800','Helpful','5PM','Saturday 15 May 2021',36398884),(1,12,'Monday 17 May 2021','800','Helpful','5PM','Saturday 15 May 2021',12269325),(1,12,'Monday 17 May 2021','800','Helpful','5PM','Saturday 15 May 2021',63860555),(1,12,'Monday 17 May 2021','800','Helpful','5PM','Saturday 15 May 2021',88656027),(1,16,'Monday 17 May 2021','800','Helpful','5PM','Saturday 15 May 2021',15074204),(1,12,'Monday 17 May 2021','800','Helpful','5PM','Saturday 15 May 2021',54362415),(1,23,'Monday 17 May 2021','800','Helpful','5PM','Saturday 15 May 2021',95786395),(1,23,'Monday 17 May 2021','800','Helpful','5PM','Saturday 15 May 2021',87833794),(1,12,'Monday 17 May 2021','800','Helpful','5PM','Saturday 15 May 2021',41740350),(1,12,'Monday 17 May 2021','800','Helpful','5PM','Saturday 15 May 2021',14493445),(1,16,'Tuesday 18 May 2021','800','Helpful','5PM','Sunday 16 May 2021',28579188),(1,16,'Tuesday 18 May 2021','800','Helpful','5PM','Sunday 16 May 2021',20131717),(1,16,'Tuesday 18 May 2021','800','Helpful','5PM','Sunday 16 May 2021',13309860),(1,15,'Tuesday 18 May 2021','800','Helpful','5PM','Sunday 16 May 2021',93495326),(1,21,'Tuesday 18 May 2021','800','Helpful','5PM','Sunday 16 May 2021',32601996);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_type`
--

DROP TABLE IF EXISTS `performance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_type` (
  `cust_rating` int NOT NULL,
  `cust_comments` varchar(45) DEFAULT NULL,
  `org_comments` varchar(45) DEFAULT NULL,
  `org_rating` varchar(45) DEFAULT NULL,
  `emp_id` varchar(45) NOT NULL,
  `order_ref` varchar(45) NOT NULL,
  PRIMARY KEY (`cust_rating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_type`
--

LOCK TABLES `performance_type` WRITE;
/*!40000 ALTER TABLE `performance_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `store_id` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `product_text_details` varchar(45) NOT NULL DEFAULT 'Dummy Text',
  `image_location` varchar(45) NOT NULL,
  `product_type` varchar(45) NOT NULL,
  PRIMARY KEY (`product_name`),
  KEY `product_id_idx` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (12,'Apple','800',4,'Dummy Text','apple11','Fruits'),(11,'Avocado','800',3,'Dummy Text','avocado11','Fruits'),(23,'Bagel','800',3,'Dummy Text','Bagel11','Bakery'),(9,'Banana','800',3,'Dummy Text','banana11','Fruits'),(6,'Beans','800',2,'Dummy Text','Beans11','Vegetable'),(22,'Bread','800',2,'Dummy Text','Bread11','Bakery'),(1,'Broccoli','800',2,'Dummy Text','Broccoli11','Vegetable'),(19,'Cake','800',3,'Dummy Text','cake11','Bakery'),(16,'Cheese','800',2,'Dummy Text','Cheese411','Dairy'),(21,'Chocolate','800',3,'Dummy Text','Bar11','Bakery'),(20,'Cup Cake','800',2,'Dummy Text','cupcake11','Bakery'),(4,'Eggplant','800',2,'Dummy Text','Eggplant11','Vegetable'),(7,'Grapes','800',3,'Dummy Text','grapesedit11','Fruits'),(3,'Lemon','800',3,'Dummy Text','v211','Vegetable'),(2,'Lettuce','800',2,'Dummy Text','Lettuce11','Vegetable'),(17,'Milk','800',3,'Dummy Text','Milk511','Dairy'),(5,'Mushroom','800',3,'Dummy Text','Mushrooms11','Vegetable'),(8,'Orange','800',2,'Dummy Text','orang11','Fruits'),(24,'Organic Cheese','800',2,'Dummy Text','cheese','Bakery'),(10,'Organic Orange','800',2,'Dummy Text','o','Fruits'),(18,'Organic Yogurt','800',2,'Dummy Text','Yogurt311','Dairy'),(15,'Pudding','800',3,'Dummy Text','Pudding11','Dairy'),(13,'Sour Cream','800',3,'Dummy Text','SourCream','Dairy'),(14,'Yogurt','800',2,'Dummy Text','Yogurt11','Dairy');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Customer','Customery  to the company'),(2,'Employee','Employee of the company');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `order_ref` int NOT NULL,
  `ssn` int DEFAULT NULL,
  `product_type` varchar(45) DEFAULT NULL,
  `shopping_cart_products_num` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  `cust_id` varchar(45) DEFAULT NULL,
  `shopping_products_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (12269325,NULL,'Vegetable','1','1','customer1@gmail.com','Broccoli'),(14493445,NULL,'Vegetable','6','1','customer1@gmail.com','Beans'),(15074204,NULL,'Vegetable','6','1','customer1@gmail.com','Beans'),(28579188,NULL,'Vegetable','6','1','customer1@gmail.com','Beans'),(36398884,NULL,'Vegetable','1','1','customer1@gmail.com','Broccoli'),(40151967,NULL,'Vegetable','6','1','customer1@gmail.com','Beans'),(41740350,NULL,'Vegetable','6','1','customer1@gmail.com','Beans'),(54362415,NULL,'Vegetable','6','1','customer1@gmail.com','Beans'),(63860555,NULL,'Vegetable','1','1','customer1@gmail.com','Broccoli'),(87833794,NULL,'Vegetable','6','1','customer1@gmail.com','Beans'),(88656027,NULL,'Vegetable','1','1','customer1@gmail.com','Broccoli'),(95786395,NULL,'Vegetable','6','1','customer1@gmail.com','Beans'),(20131717,NULL,'Vegetable','6','1','customer1@gmail.com','Beans'),(20131717,NULL,'Vegetable','1','1','customer1@gmail.com','Broccoli'),(20131717,NULL,'Vegetable','4','1','customer1@gmail.com','Eggplant'),(13309860,NULL,'Vegetable','6','1','customer1@gmail.com','Beans'),(13309860,NULL,'Vegetable','1','1','customer1@gmail.com','Broccoli'),(13309860,NULL,'Vegetable','4','1','customer1@gmail.com','Eggplant'),(93495326,NULL,'Vegetable','6','1','customer1@gmail.com','Beans'),(93495326,NULL,'Bakery','23','1','customer1@gmail.com','Bagel'),(32601996,NULL,'Dairy','16','1','customer1@gmail.com','Cheese'),(32601996,NULL,'Bakery','23','2','customer1@gmail.com','Bagel'),(32601996,NULL,'Fruits','11','1','customer1@gmail.com','Avocado');
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_number`
--

DROP TABLE IF EXISTS `store_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_number` (
  `store_id` int NOT NULL,
  `store_phone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_number`
--

LOCK TABLES `store_number` WRITE;
/*!40000 ALTER TABLE `store_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `s.n` int NOT NULL AUTO_INCREMENT,
  `email_id` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`s.n`,`email_id`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Creating a table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,'customer1@gmail.com','customer1','123'),(5,'test@gmail.com','test1','1234'),(6,'apg@gmail.com','paul_06','1234');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-16 16:16:29
