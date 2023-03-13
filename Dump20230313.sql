CREATE DATABASE  IF NOT EXISTS `leitornfe2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `leitornfe2`;
-- MySQL dump 10.13  Distrib 5.7.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: leitornfe2
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20230311170207_Initial Migration','7.0.3'),('20230313182046_Invoice description','7.0.3'),('20230313185523_Invoice description 2','7.0.3'),('20230313185639_Invoice description','7.0.3'),('20230313192559_Invoice order number','7.0.3');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addressees`
--

DROP TABLE IF EXISTS `addressees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addressees` (
  `Id` char(36) CHARACTER SET ascii NOT NULL,
  `Name` longtext NOT NULL,
  `Cnpj` longtext NOT NULL,
  `AddressId` int(11) NOT NULL,
  `Email` longtext NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressees`
--

LOCK TABLES `addressees` WRITE;
/*!40000 ALTER TABLE `addressees` DISABLE KEYS */;
INSERT INTO `addressees` VALUES ('4a5cf405-87c2-40fa-9576-a9b6a7d7800d','Marcela Oliveira Nunes','5587701000155',10,'marcelanunes@gmail.com'),('51','Camila','00100200000155',1,'camila@gmail.com'),('554507','João Silva','14200100000100',47,'joao@gmail.com');
/*!40000 ALTER TABLE `addressees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `Id` char(36) CHARACTER SET ascii NOT NULL,
  `PublicPlace` longtext NOT NULL,
  `Number` int(11) NOT NULL,
  `District` longtext NOT NULL,
  `County` longtext NOT NULL,
  `State` longtext NOT NULL,
  `ZipCode` longtext NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES ('1','Rua Horácio Pessini',145,'Jardim Nova Aliança','Ribeirão Preto','SP','14026590'),('10','Rua das Nações',1001,'Ipiranga','São Paulo','SP','15448201'),('1fbf3731-939f-4c92-afb3-e1aa5b11a679','Rua Porto União',558,'Jardim Independência','Sertãozinho','SP','14002554'),('47','Rua Tapajós',155,'Ipiranga','Ribeirão Preto','SP','14055650');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `Id` char(36) CHARACTER SET ascii NOT NULL,
  `Number` int(11) NOT NULL,
  `AccessKey` longtext NOT NULL,
  `IssueDate` datetime(6) NOT NULL,
  `IssuerId` int(11) NOT NULL,
  `AddresseeId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `TotalValue` double NOT NULL,
  `Description` longtext NOT NULL,
  `OrderNumber` longtext NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES ('10f7c285-35b5-4138-b3fa-909532a0fecd',3,'31230209815464000120550040000031891000447915','2023-03-13 00:00:00.000000',10,1,1,1200,'NF0003','45247'),('61a8f84f-0363-4f3c-ac73-5262f9e0dc33',6,'31250209815464000120550040000031891000225889','2023-03-13 00:00:00.000000',1,1,1,5000,'',''),('9e2a4782-845f-40b9-bc21-98eda34b72eb',5,'31230209815885326120550040000031891000448977','2023-03-13 00:00:00.000000',56761,51,2,2000,'','752752'),('c02b038a-3e9e-4fa7-9952-466b5b34b006',7,'11478509815464000120550040000031891000223365','2023-03-13 00:00:00.000000',1,1,1,1800,'NF0007',''),('de230dc8-aa32-4719-b37d-ae4d041aad5c',8,'6548965489454321310000151','2023-03-13 00:00:00.000000',1,1,1,5000,'NF0008','6519'),('f9445d05-21a6-4e22-9214-bfc95723c900',2,'31230204894685000622550010000004631976128674','2023-03-12 00:00:00.000000',56761,554507,2,1200,'NF0002','');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuers`
--

DROP TABLE IF EXISTS `issuers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuers` (
  `Id` char(36) CHARACTER SET ascii NOT NULL,
  `Name` longtext NOT NULL,
  `Cnpj` longtext NOT NULL,
  `AddressId` int(11) NOT NULL,
  `Email` longtext NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuers`
--

LOCK TABLES `issuers` WRITE;
/*!40000 ALTER TABLE `issuers` DISABLE KEYS */;
INSERT INTO `issuers` VALUES ('52','Alexandre Luchetti','30700850000100',1,'alexandre@gmail.com'),('56761','Carlos Silva Distribuição LTDA','14500154000100',10,'carlos@gmail.com'),('573ec6cd-64a5-458c-bfe3-3faa0782bb38','Lucas Oliveira','1140201000100',47,'lucas@gmail.com');
/*!40000 ALTER TABLE `issuers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `Id` char(36) CHARACTER SET ascii NOT NULL,
  `ProductCode` int(11) NOT NULL,
  `Name` longtext NOT NULL,
  `Amount` int(11) NOT NULL,
  `UnitaryValue` double NOT NULL,
  `TotalValue` double NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('1',125,'Mouse Razer',10,120,1200),('2',1054,'Monitor Dell Alienware',1,1200,1200),('db768340-2f4f-4734-b4c2-4b9c94103b8b',5442,'Teclado sem fio',20,100,2000);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-13 18:04:48
