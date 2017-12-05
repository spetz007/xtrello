-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: example
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `ListBoard_id` int(11) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_listboards_idListBoards_fk` (`ListBoard_id`),
  CONSTRAINT `boards_listboards_idListBoards_fk` FOREIGN KEY (`ListBoard_id`) REFERENCES `listboards` (`idListBoards`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
INSERT INTO `boards` VALUES (3,'name1',1,0),(4,'name2',2,0),(5,'name3',1,0),(6,'name4',3,0),(7,'name5',1,0),(8,'name6',4,0),(9,'name7',2,0),(10,'name9',1,1);
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards` (
  `idCard` int(11) NOT NULL AUTO_INCREMENT,
  `nameCard` varchar(150) NOT NULL,
  `Comentar` varchar(500) NOT NULL,
  `ListCard_id` int(11) NOT NULL,
  PRIMARY KEY (`idCard`),
  KEY `card_listcard_idListCard_fk` (`ListCard_id`),
  CONSTRAINT `card_listcard_idListCard_fk` FOREIGN KEY (`ListCard_id`) REFERENCES `listcards` (`idListCard`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,'Cardname1','comenar1',2),(2,'Cardname2','comrntar2',3);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listboards`
--

DROP TABLE IF EXISTS `listboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listboards` (
  `idListBoards` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `User_id` int(11) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idListBoards`),
  KEY `listboards_users_id_fk` (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listboards`
--

LOCK TABLES `listboards` WRITE;
/*!40000 ALTER TABLE `listboards` DISABLE KEYS */;
INSERT INTO `listboards` VALUES (1,'namelistboard',1,'text1'),(2,'2namelistboard',2,'text2'),(3,'3namelistboard',3,'text3'),(4,'4namelistboard',4,'text4'),(5,'5namelistboard',5,'text5'),(6,'6namelistboard',5,'text6'),(7,'7namelistboard',2,'text7'),(8,'8namelistboard',1,'text8'),(9,'9namelistboard',2,'text9'),(10,'8namelistboard',1,'text8'),(11,'9namelistboard',1,'text9'),(12,'10namelistboard',1,'text10'),(13,'11nameListBoard',1,'text11');
/*!40000 ALTER TABLE `listboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listcards`
--

DROP TABLE IF EXISTS `listcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listcards` (
  `idListCard` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `Board_id` int(11) NOT NULL,
  PRIMARY KEY (`idListCard`),
  KEY `listcard_boards_id_fk` (`Board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listcards`
--

LOCK TABLES `listcards` WRITE;
/*!40000 ALTER TABLE `listcards` DISABLE KEYS */;
INSERT INTO `listcards` VALUES (2,'ListCard1',3),(3,'ListCard2',4),(4,'ListCard3',3);
/*!40000 ALTER TABLE `listcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sharedboard`
--

DROP TABLE IF EXISTS `sharedboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sharedboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `User_id` int(11) NOT NULL,
  `Board_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sharedBoard_users_id_fk` (`User_id`),
  KEY `sharedboard_boards_id_fk` (`Board_id`),
  CONSTRAINT `sharedBoard_users_id_fk` FOREIGN KEY (`User_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sharedboard_boards_id_fk` FOREIGN KEY (`Board_id`) REFERENCES `boards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sharedboard`
--

LOCK TABLES `sharedboard` WRITE;
/*!40000 ALTER TABLE `sharedboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `sharedboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sharedlistboards`
--

DROP TABLE IF EXISTS `sharedlistboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sharedlistboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `User_id` int(11) NOT NULL,
  `listBoard_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `SharedListBoards_users_id_fk` (`User_id`),
  KEY `SharedListBoards_listboards_idListBoards_fk` (`listBoard_id`),
  CONSTRAINT `SharedListBoards_listboards_idListBoards_fk` FOREIGN KEY (`listBoard_id`) REFERENCES `listboards` (`idListBoards`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SharedListBoards_users_id_fk` FOREIGN KEY (`User_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sharedlistboards`
--

LOCK TABLES `sharedlistboards` WRITE;
/*!40000 ALTER TABLE `sharedlistboards` DISABLE KEYS */;
INSERT INTO `sharedlistboards` VALUES (1,1,2),(2,1,5),(5,2,1),(8,1,4),(9,1,3),(10,3,1),(11,1,12),(12,1,13);
/*!40000 ALTER TABLE `sharedlistboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `role` int(1) NOT NULL COMMENT '1 is Admin, 2 is User , 0 is Banned',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_uindex` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='all users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'example@gmail.com','1122','Yurii','2017-11-15',1),(2,'a@a','1111','qwerty','2017-11-18',0),(3,'igor@lyutak.com','1122','Igor','2017-11-15',1),(9,'qwert@qq','11111','qqqq','2017-11-15',2),(10,'hj@d.k','hkj','hkj','2017-11-15',2),(11,'d@d','1111','name','2017-11-24',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;