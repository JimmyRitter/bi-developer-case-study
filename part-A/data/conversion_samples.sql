-- MySQL dump 10.13  Distrib 5.6.46, for Linux (x86_64)
--
-- Host: localhost    Database: conversion_samples
-- ------------------------------------------------------
-- Server version	5.6.46

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
-- Current Database: `conversion_samples`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `conversion_samples` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `conversion_samples`;

--
-- Table structure for table `activities_sent`
--

DROP TABLE IF EXISTS `activities_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities_sent` (
  `activity_id` int(11) DEFAULT NULL,
  `action_group` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities_sent`
--

LOCK TABLES `activities_sent` WRITE;
/*!40000 ALTER TABLE `activities_sent` DISABLE KEYS */;
INSERT INTO `activities_sent` VALUES 
(156,'Action Group A',240,'2020-03-06 16:00:00'),
(156,'Action Group A',797,'2020-03-06 16:00:00'),
(156,'Action Group A',1561,'2020-03-06 16:00:00'),
(156,'Action Group A',1757,'2020-03-06 16:00:00'),
(156,'Action Group B',12771,'2020-03-06 16:00:00'),
(156,'Action Group B',12931,'2020-03-06 16:00:00'),
(156,'Action Group B',13032,'2020-03-06 16:00:00'),
(156,'Action Group B',13340,'2020-03-06 16:00:00'),
(156,'Control Group',890,'2020-03-06 16:00:00'),
(156,'Control Group',9312,'2020-03-06 16:00:00'),
(156,'Control Group',10325,'2020-03-06 16:00:00');
/*!40000 ALTER TABLE `activities_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposits` (
  `user_id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` VALUES 
(240,'2020-03-07 04:21:00',50.00),
(240,'2020-03-06 18:55:00',50.00),
(797,'2020-03-06 23:29:00',20.00),
(1561,'2020-03-06 17:43:00',20.00),
(12771,'2020-03-06 19:27:00',114.95),
(12931,'2020-03-07 19:51:00',114.95),
(12931,'2020-03-06 00:58:00',150.50),
(13340,'2020-03-07 02:18:00',150.50),
(13340,'2020-03-07 01:32:00',50.00),
(13340,'2020-03-06 20:09:00',25.00),
(890,'2020-03-06 16:46:00',20.00),
(890,'2020-03-05 19:29:00',20.00),
(9312,'2020-03-06 19:40:00',35.90);
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `user_id` int(11) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES 
(240,'Sweden'),
(797,'Sweden'),
(1561,'Spain'),
(1757,'Finland'),
(12771,'Finland'),
(12931,'Sweden'),
(13032,'United Kingdom'),
(13340,'United Kingdom'),
(890,'Sweden'),
(9312,'United Kingdom'),
(10325,'Sweden');
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

-- Dump completed on 2020-11-03 12:16:27
