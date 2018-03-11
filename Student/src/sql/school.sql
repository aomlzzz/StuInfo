-- MySQL dump 10.13  Distrib 5.1.61, for Win32 (ia32)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	5.1.61-community

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
-- Current Database: `school`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `school` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `school`;

--
-- Table structure for table `t_course`
--

DROP TABLE IF EXISTS `t_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_course` (
  `COURSENO` varchar(20) NOT NULL,
  `COURSENAME` varchar(20) DEFAULT NULL,
  `CREDIT` float DEFAULT NULL,
  `TEANO` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`COURSENO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_course`
--

LOCK TABLES `t_course` WRITE;
/*!40000 ALTER TABLE `t_course` DISABLE KEYS */;
INSERT INTO `t_course` VALUES ('001','高等数学',5,'003'),('002','线性代数',5,'006'),('003','离散数学',5,'007'),('004','Java',5,'002'),('005','计算机应用',5,'002'),('006','计算机组成原理',5,'004'),('007','电子商务',5,'004'),('008','大学物理',5,'003'),('009','数字电路',5,'001'),('010','模拟电路',5,'003'),('011','操作系统',5,'001'),('012','哲学',5,'005'),('013','经济学',5,'005');
/*!40000 ALTER TABLE `t_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_manager`
--

DROP TABLE IF EXISTS `t_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_manager` (
  `MANNO` varchar(20) NOT NULL,
  `MANNAME` varchar(20) DEFAULT NULL,
  `MANPWD` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MANNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_manager`
--

LOCK TABLES `t_manager` WRITE;
/*!40000 ALTER TABLE `t_manager` DISABLE KEYS */;
INSERT INTO `t_manager` VALUES ('001','admin','admin');
/*!40000 ALTER TABLE `t_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_score`
--

DROP TABLE IF EXISTS `t_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_score` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `STUNO` varchar(20) DEFAULT NULL,
  `COURSENO` varchar(20) DEFAULT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  `SCORE` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_score`
--

LOCK TABLES `t_score` WRITE;
/*!40000 ALTER TABLE `t_score` DISABLE KEYS */;
INSERT INTO `t_score` VALUES (1,'0001','001','1',87),(2,'0001','004','2',75.5),(3,'0001','008','3',88.5),(4,'0003','001','1',80),(5,'0003','004','2',77.5),(6,'0003','008','3',82.5),(7,'0006','003','1',66),(8,'0006','004','2',74.5),(9,'0006','006','3',83.5),(10,'0011','001','1',80),(11,'0011','004','2',72.5),(12,'0011','008','3',87.5);
/*!40000 ALTER TABLE `t_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_student`
--

DROP TABLE IF EXISTS `t_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_student` (
  `STUNO` varchar(20) NOT NULL,
  `STUPWD` varchar(20) DEFAULT NULL,
  `STUNAME` varchar(20) DEFAULT NULL,
  `STUSEX` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`STUNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student`
--

LOCK TABLES `t_student` WRITE;
/*!40000 ALTER TABLE `t_student` DISABLE KEYS */;
INSERT INTO `t_student` VALUES ('0001','0001','流殇','男'),('0002','0002','郭丽芳','女'),('0003','0003','林金玉','女'),('0004','0004','王丽华','女'),('0005','0005','李星武','男'),('0006','0006','何悦','男'),('0007','0007','李丽晶','女'),('0008','0008','邓丽财','女'),('0009','0009','郑义进','男'),('0010','0010','陈华博','男'),('0011','0011','温文','女'),('0012','123','张三','男');
/*!40000 ALTER TABLE `t_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_teacher`
--

DROP TABLE IF EXISTS `t_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_teacher` (
  `TEANO` varchar(20) NOT NULL,
  `TEAPWD` varchar(20) DEFAULT NULL,
  `TEANAME` varchar(20) DEFAULT NULL,
  `TEASEX` varchar(20) DEFAULT NULL,
  `TITLE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TEANO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_teacher`
--

LOCK TABLES `t_teacher` WRITE;
/*!40000 ALTER TABLE `t_teacher` DISABLE KEYS */;
INSERT INTO `t_teacher` VALUES ('001','001','符传谊','男','教授'),('002','002','张红','女','讲师'),('003','003','王刚','男','副教授'),('004','004','范购','女','教授'),('005','005','张新','男','讲师'),('006','006','江海','男','讲师'),('007','007','唐彪','男','讲师');
/*!40000 ALTER TABLE `t_teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-25  8:02:21
