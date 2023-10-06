-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: education
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `facultyName` varchar(150) NOT NULL,
  `headOfDepartment` varchar(150) DEFAULT NULL,
  `fk_university` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_university` (`fk_university`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`fk_university`) REFERENCES `university` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Department of Mathematics','Faculty of Science','Ahmed',1),(2,'Department of Chemistry','Faculty of Science','Kashif',1),(3,'Department of Engineering','Faculty of Engineering','Moeed',1),(4,'Department of Business','Faculty of Business','Abubaker',1),(14,'Department of Arts','Faculty of Art','Ali',1),(15,'Department of Education','Faculty of secondary education','Umar',2),(16,'Department of Science','Faculty of Science','Amir',2),(17,'Department of Pharmacy','Faculty of Pharmacy','Ahmed',2),(18,'Department of Mathematics','Faulty of Science','Ahmed',3),(20,'Department of Computer Science','Faculty of Computer Science','Abubaker',3),(21,'Department of Social Science','Faculty of Social Science','Umair',3),(22,'Department of Social Science','Faculty of Social Science','Umair',3);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `duration` float DEFAULT NULL,
  `examSystem` char(12) NOT NULL,
  `eligibility` varchar(100) NOT NULL,
  `seats` int NOT NULL,
  `shifts` enum('morning','evening') NOT NULL,
  `fk_department` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_department` (`fk_department`),
  CONSTRAINT `programs_ibfk_1` FOREIGN KEY (`fk_department`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,'BS Math',4,'semester','F.Sc,Ics',50,'morning',1),(2,'Bs physics',4,'semester','F.Sc,Ics',50,'morning',1),(3,'BS Chemistry',4,'semester','F.Sc',50,'morning',2),(4,'BS Software Engineering',4,'semester','F.Sc,Ics,F.A,',60,'evening',3),(5,'BBA',4,'semester','F.SC,F.A,I.com',40,'evening',4),(6,'B.ed',1.5,'semester','M.A,BS,M.Sc',50,'morning',15),(7,'M.Sc Physics',2,'Annual','BS Physics',30,'morning',16),(8,'BS Math',4,'Semester','F.Sc,ICS',50,'morning',18);
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs_students`
--

DROP TABLE IF EXISTS `programs_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs_students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_student` int NOT NULL,
  `fk_program` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student` (`fk_student`),
  KEY `fk_program` (`fk_program`),
  CONSTRAINT `programs_students_ibfk_1` FOREIGN KEY (`fk_student`) REFERENCES `student` (`id`),
  CONSTRAINT `programs_students_ibfk_2` FOREIGN KEY (`fk_program`) REFERENCES `programs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs_students`
--

LOCK TABLES `programs_students` WRITE;
/*!40000 ALTER TABLE `programs_students` DISABLE KEYS */;
INSERT INTO `programs_students` VALUES (29,1,5),(30,2,5),(31,1,3),(32,3,1),(33,1,5),(34,5,1),(35,6,1),(36,7,2),(37,4,2);
/*!40000 ALTER TABLE `programs_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `rollNo` varchar(150) NOT NULL,
  `contact` varchar(150) NOT NULL,
  `gender` enum('male','female','others') NOT NULL,
  `maritalStatus` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact` (`contact`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Ali','40','03227793409','male','single'),(2,'Ahmed','10','03457793408','male','single'),(3,'Kiran','5','03364014546','female','single'),(4,'Haya','2','03267745506','female','married'),(5,'Amna Baji','33','03001236547','female','single'),(6,'Hibah','1','03217896541','female','married'),(7,'Fakhar','55','03004230495','male','married');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `contact` varchar(120) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact` (`contact`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES (1,'University of Punjab','042-99233132','Canal Rd,Quaid-i-Azam Campus,Lahore,Punjab'),(2,'Minhaj University Lahore','0311-1222685',' Minhaj Ul Quran University Rd, Civic Center Twp Commercial Area Lahore'),(3,'University of Sargodha','048-9230157','University Road, Sargodha, Punjab'),(4,'University of Education','042-99262231',' College Road,Township Block C Phase 1 Johar Town,Lahore,Punjab '),(5,'Government College University Faisalabad','041-9200886',' Kotwali Rd, Gurunanakpura, Faisalabad, Punjab ');
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'education'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-06 23:27:03
