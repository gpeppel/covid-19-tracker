-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: covid19
-- ------------------------------------------------------
-- Server version	10.3.22-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `CountryID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(20) DEFAULT NULL,
  `Cases` int(11) DEFAULT NULL,
  `Deaths` int(11) DEFAULT NULL,
  `Recovered` int(11) DEFAULT NULL,
  `Unresolved` int(11) DEFAULT NULL,
  `LastUpdated` int(11) DEFAULT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES (1,'USA',1025305,58034,83233,884038,20200504);
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `County`
--

DROP TABLE IF EXISTS `County`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `County` (
  `CountyID` int(11) NOT NULL AUTO_INCREMENT,
  `CountyName` varchar(20) NOT NULL,
  `ConfirmedCases` int(11) NOT NULL,
  `ConfirmedDeaths` int(11) NOT NULL,
  `LastUpdated` int(11) NOT NULL,
  PRIMARY KEY (`CountyID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `County`
--

LOCK TABLES `County` WRITE;
/*!40000 ALTER TABLE `County` DISABLE KEYS */;
INSERT INTO `County` VALUES (1,'Los Angeles ',25699,1231,20200504),(2,'Riverside',4180,161,20200504),(3,'San Diego ',3927,139,20200504),(4,'Orange ',2743,52,20200504),(5,'Santa Clara',2231,115,20200504),(6,'San Bernardino',2182,97,20200504),(7,'Alameda',1749,63,20200504),(8,'San Francisco',1602,29,20200504),(9,'San Mateo',1233,51,20200504),(10,'Sacramento',1117,42,20200504),(11,'Kern',1005,8,20200504),(12,'Contra Costa',945,28,20200504),(13,'Tulare',743,40,20200504),(14,'Fresno',633,8,20200504),(15,'San Joaquin',570,25,20200504),(16,'Ventura',566,19,20200504),(17,'Santa Barbara',514,8,20200504),(18,'Stanislaus',411,14,20200504),(19,'Imperial',358,9,20200504),(20,'Solano',266,5,20200504),(21,'Sonoma',257,3,20200504),(22,'Marin',240,13,20200504),(23,'Monterey',235,6,20200504),(24,'San Luis Obispo',201,1,20200504),(25,'Yolo',171,17,20200504),(26,'Placer',159,8,20200504),(27,'Kings',172,1,20200504),(28,'Merced',142,3,20200504),(29,'Santa Cruz',137,2,20200504),(30,'Napa',70,2,20200504),(31,'Humboldt',54,0,20200504),(32,'Madera',51,2,20200504),(33,'San Benito',51,2,20200504),(34,'El Dorado',47,0,20200504),(35,'Nevada',41,1,20200504),(36,'Sutter',31,2,20200504),(37,'Shasta',31,4,20200504),(38,'Mono',26,1,20200504),(39,'Inyo',19,1,20200504),(40,'Yuba',19,1,20200504),(41,'Butte',16,0,20200504),(42,'Calaveras',13,0,20200504),(43,'Mariposa',13,0,20200504),(44,'Mendocino',12,0,20200504),(45,'Amador',8,0,20200504),(46,'Lake',7,0,20200504),(47,'Siskiyou',5,0,20200504),(48,'Glenn',5,0,20200504),(49,'Plumas',4,0,20200504),(50,'Tuolumne',4,0,20200504),(51,'Del Norte',3,0,20200504),(52,'Colusa',3,0,20200504),(53,'Tehama',1,1,20200504),(54,'Alpine',1,0,20200504);
/*!40000 ALTER TABLE `County` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Homepage`
--

DROP TABLE IF EXISTS `Homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Homepage` (
  `HomepageID` int(11) NOT NULL,
  `UserID` varchar(50) NOT NULL,
  `StateID` int(11) NOT NULL,
  `CountryID` int(11) NOT NULL,
  `LastUpdated` int(11) NOT NULL,
  PRIMARY KEY (`HomepageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Homepage`
--

LOCK TABLES `Homepage` WRITE;
/*!40000 ALTER TABLE `Homepage` DISABLE KEYS */;
/*!40000 ALTER TABLE `Homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `States`
--

DROP TABLE IF EXISTS `States`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `States` (
  `StateID` int(11) NOT NULL AUTO_INCREMENT,
  `StateName` varchar(20) NOT NULL,
  `ConfirmedCases` int(11) NOT NULL,
  `ConfirmedDeaths` int(11) NOT NULL,
  `LastUpdated` int(11) NOT NULL,
  PRIMARY KEY (`StateID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `States`
--

LOCK TABLES `States` WRITE;
/*!40000 ALTER TABLE `States` DISABLE KEYS */;
INSERT INTO `States` VALUES (1,'New York',300501,23033,20200504),(2,'New Jersey',113856,6442,20200504),(3,'Massachusetts',58302,3153,20200504),(4,'Illinois',48102,2125,20200504),(5,'California',46032,1862,20200504),(6,'Pennsylvania',44528,1716,20200504),(7,'Michigan',39262,3567,20200504),(8,'Florida',32846,1171,20200504),(9,'Louisiana',27286,1758,20200504),(10,'Connecticut',26312,2089,20200504),(11,'Texas',26171,690,20200504),(12,'Georgia',24844,1036,20200504),(13,'Maryland',20113,929,20200504),(14,'Ohio',16769,799,20200504),(15,'Indiana',16588,901,20200504),(16,'Virginia',14339,492,20200504),(17,'Colorado',14316,736,20200504),(18,'Washington',13686,765,20200504),(19,'Tennessee',10052,188,20200504),(20,'North Carolina',9739,361,20200504),(21,'Rhode Island',7926,239,20200504),(22,'Missouri',7373,327,20200504),(23,'Arizona',6948,293,20200504),(24,'Alabama',6687,242,20200504),(25,'U.S. military',6648,27,20200504),(26,'Iowa',6376,136,20200504),(27,'Mississippi',6342,239,20200504),(28,'Wisconsin',6289,300,20200504),(29,'South Carolina',5735,192,20200504),(30,'Nevada',4805,219,20200504),(31,'Delaware',4575,137,20200504),(32,'Kentucky',4375,225,20200504),(33,'Utah',4343,45,20200504),(34,'Minnesota',4181,301,20200504),(35,'District of Columbia',3994,190,20200504),(36,'Kansas',3558,124,20200504),(37,'Oklahoma',3410,207,20200504),(38,'Nebraska',3358,55,20200504),(39,'Arkansas',3069,51,20200504),(40,'New Mexico',2974,110,20200504),(41,'Oregon',2385,99,20200504),(42,'South Dakota',2313,11,20200504),(43,'New Hampshire',2010,60,20200504),(44,'Idaho',1917,58,20200504),(45,'Federal prisons',1648,30,20200504),(46,'Puerto Rico',1400,86,20200504),(47,'West Virginia',1095,38,20200504),(48,'Maine',1040,51,20200504),(49,'North Dakota',991,19,20200504),(50,'Vermont',862,47,20200504),(51,'Hawaii',609,16,20200504),(52,'Wyoming',536,7,20200504),(53,'Montana',451,15,20200504),(54,'Alaska',351,9,20200504);
/*!40000 ALTER TABLE `States` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StatesOld`
--

DROP TABLE IF EXISTS `StatesOld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatesOld` (
  `StateID` int(11) NOT NULL AUTO_INCREMENT,
  `StateName` varchar(20) NOT NULL,
  `ConfirmedCases` int(11) NOT NULL,
  `ConfirmedDeaths` int(11) NOT NULL,
  `LastUpdated` int(11) NOT NULL,
  PRIMARY KEY (`StateID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StatesOld`
--

LOCK TABLES `StatesOld` WRITE;
/*!40000 ALTER TABLE `StatesOld` DISABLE KEYS */;
INSERT INTO `StatesOld` VALUES (1,'New York',200501,22033,20200503),(2,'New Jersey',113221,6100,20200504),(3,'Massachusetts',58000,2900,20200504),(4,'Illinois',48102,2125,20200504),(5,'California',46032,1862,20200504),(6,'Pennsylvania',44528,1716,20200504),(7,'Michigan',39262,3567,20200504),(8,'Florida',32846,1171,20200504),(9,'Louisiana',27286,1758,20200504),(10,'Connecticut',26312,2089,20200504),(11,'Texas',26171,690,20200504),(12,'Georgia',24844,1036,20200504),(13,'Maryland',20113,929,20200504),(14,'Ohio',16769,799,20200504),(15,'Indiana',16588,901,20200504),(16,'Virginia',14339,492,20200504),(17,'Colorado',14316,736,20200504),(18,'Washington',13686,765,20200504),(19,'Tennessee',10052,188,20200504),(20,'North Carolina',9739,361,20200504),(21,'Rhode Island',7926,239,20200504),(22,'Missouri',7373,327,20200504),(23,'Arizona',6948,293,20200504),(24,'Alabama',6687,242,20200504),(25,'U.S. military',6648,27,20200504),(26,'Iowa',6376,136,20200504),(27,'Mississippi',6342,239,20200504),(28,'Wisconsin',6289,300,20200504),(29,'South Carolina',5735,192,20200504),(30,'Nevada',4805,219,20200504),(31,'Delaware',4575,137,20200504),(32,'Kentucky',4375,225,20200504),(33,'Utah',4343,45,20200504),(34,'Minnesota',4181,301,20200504),(35,'District of Columbia',3994,190,20200504),(36,'Kansas',3558,124,20200504),(37,'Oklahoma',3410,207,20200504),(38,'Nebraska',3358,55,20200504),(39,'Arkansas',3069,51,20200504),(40,'New Mexico',2974,110,20200504),(41,'Oregon',2385,99,20200504),(42,'South Dakota',2313,11,20200504),(43,'New Hampshire',2010,60,20200504),(44,'Idaho',1917,58,20200504),(45,'Federal prisons',1648,30,20200504),(46,'Puerto Rico',1400,86,20200504),(47,'West Virginia',1095,38,20200504),(48,'Maine',1040,51,20200504),(49,'North Dakota',991,19,20200504),(50,'Vermont',862,47,20200504),(51,'Hawaii',609,16,20200504),(52,'Wyoming',536,7,20200504),(53,'Montana',451,15,20200504),(54,'Alaska',351,9,20200504);
/*!40000 ALTER TABLE `StatesOld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `IPAddress` varchar(50) NOT NULL,
  `StateID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-05 23:38:48