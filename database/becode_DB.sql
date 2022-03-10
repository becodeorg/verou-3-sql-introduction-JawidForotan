-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: becodedatabase
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `becode`
--

DROP TABLE IF EXISTS `becode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `becode` (
  `beCodeId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `beginDate` datetime DEFAULT NULL,
  `CEO_ceoId` int NOT NULL,
  PRIMARY KEY (`beCodeId`),
  KEY `fk_beCode_CEO1_idx` (`CEO_ceoId`),
  CONSTRAINT `fk_beCode_CEO1` FOREIGN KEY (`CEO_ceoId`) REFERENCES `ceo` (`ceoId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `becode`
--

LOCK TABLES `becode` WRITE;
/*!40000 ALTER TABLE `becode` DISABLE KEYS */;
INSERT INTO `becode` VALUES (1,'becode_ghent','Becode is a new IT educational center...','2018-01-10 00:00:00',1),(2,'becode_antwerp','Becode is a new IT educational center...','2018-05-15 00:00:00',1);
/*!40000 ALTER TABLE `becode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careercoaches`
--

DROP TABLE IF EXISTS `careercoaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careercoaches` (
  `careerCoachId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `beCode_beCodeId` int NOT NULL,
  PRIMARY KEY (`careerCoachId`,`beCode_beCodeId`),
  KEY `fk_CareerCoach_beCode1_idx` (`beCode_beCodeId`),
  CONSTRAINT `fk_CareerCoach_beCode1` FOREIGN KEY (`beCode_beCodeId`) REFERENCES `becode` (`beCodeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careercoaches`
--

LOCK TABLES `careercoaches` WRITE;
/*!40000 ALTER TABLE `careercoaches` DISABLE KEYS */;
INSERT INTO `careercoaches` VALUES (1,'Erwin','verhamme','careercoach@gmail.com',1);
/*!40000 ALTER TABLE `careercoaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ceo`
--

DROP TABLE IF EXISTS `ceo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ceo` (
  `ceoId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ceoId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceo`
--

LOCK TABLES `ceo` WRITE;
/*!40000 ALTER TABLE `ceo` DISABLE KEYS */;
INSERT INTO `ceo` VALUES (1,'John','Doe','johndoe@gmail.com');
/*!40000 ALTER TABLE `ceo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `coachId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `beCode_beCodeId` int NOT NULL,
  PRIMARY KEY (`coachId`,`beCode_beCodeId`),
  KEY `fk_Coach_beCode1_idx` (`beCode_beCodeId`),
  CONSTRAINT `fk_Coach_beCode1` FOREIGN KEY (`beCode_beCodeId`) REFERENCES `becode` (`beCodeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (3,'Basile','Leroy','coach1@gmail.com','Ghent',1),(4,'Bert','Heyman','coach2@gmail.com','Aalst',1);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_has_coach`
--

DROP TABLE IF EXISTS `course_has_coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_has_coach` (
  `Course_courseId` int NOT NULL,
  `Coach_coachId` int NOT NULL,
  PRIMARY KEY (`Course_courseId`,`Coach_coachId`),
  KEY `fk_Course_has_Coach_Coach1_idx` (`Coach_coachId`),
  KEY `fk_Course_has_Coach_Course1_idx` (`Course_courseId`),
  CONSTRAINT `fk_Course_has_Coach_Coach1` FOREIGN KEY (`Coach_coachId`) REFERENCES `coaches` (`coachId`),
  CONSTRAINT `fk_Course_has_Coach_Course1` FOREIGN KEY (`Course_courseId`) REFERENCES `courses` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_has_coach`
--

LOCK TABLES `course_has_coach` WRITE;
/*!40000 ALTER TABLE `course_has_coach` DISABLE KEYS */;
INSERT INTO `course_has_coach` VALUES (3,3),(3,4);
/*!40000 ALTER TABLE `course_has_coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `courseId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `nrOfStudents` int DEFAULT NULL,
  `nrCoach` int DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `internShipDuration` int DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `beCode_beCodeId` int NOT NULL,
  PRIMARY KEY (`courseId`,`beCode_beCodeId`),
  KEY `fk_Course_beCode1_idx` (`beCode_beCodeId`),
  CONSTRAINT `fk_Course_beCode1` FOREIGN KEY (`beCode_beCodeId`) REFERENCES `becode` (`beCodeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (3,'Web development','7','Ghent','2021-12-15 00:00:00','2022-07-10 00:00:00',25,2,'An opportunity to become a full stack developer in short period of time...',3,'English',1),(4,'SAP training','6','Brussels','2022-05-10 00:00:00','2022-11-25 00:00:00',20,1,'SAP intesive training',2,'French',1),(5,'Artificial intelligency','6','Antwerp','2022-06-01 00:00:00','2022-12-25 00:00:00',15,2,'This course is really fun...',2,'Dutch',1);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners` (
  `pertnerId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `becode_beCodeId` int NOT NULL,
  PRIMARY KEY (`pertnerId`,`becode_beCodeId`),
  KEY `fk_partners_becode1_idx` (`becode_beCodeId`),
  CONSTRAINT `fk_partners_becode1` FOREIGN KEY (`becode_beCodeId`) REFERENCES `becode` (`beCodeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
INSERT INTO `partners` VALUES (1,'vdab','flanders',5433263,'www.vdab.com','2000, Antwerp; Belgium',1),(2,'actiris','brussels',7466324,'www.actiris.com','2100, Brussels; Belgium',1);
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `studentId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `mobile` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  `place` varchar(45) DEFAULT NULL,
  `Course_courseId` int NOT NULL,
  PRIMARY KEY (`studentId`,`Course_courseId`),
  KEY `fk_Student_Course_idx` (`Course_courseId`),
  CONSTRAINT `fk_Student_Course` FOREIGN KEY (`Course_courseId`) REFERENCES `courses` (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (2,'Jawid','Forotan','jawid@gmail.com',5421458,26,'Antwerp',3),(3,'Ahmad','Alkordee','ahmad@gmail.com',4578945,36,'Deinze',3);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-10 23:41:27
