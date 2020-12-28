-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: edu
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.13-MariaDB

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
-- Table structure for table `tbl_attach`
--

DROP TABLE IF EXISTS `tbl_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_attach` (
  `save_file_name` varchar(255) NOT NULL COMMENT '서버에 저장되는 한글명이 아닌 파일명',
  `real_file_name` varchar(255) DEFAULT NULL COMMENT '한글로 된 진짜 파일명',
  `bno` int(11) NOT NULL COMMENT '부모 게시물 일련번호',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일자',
  PRIMARY KEY (`save_file_name`),
  KEY `fk_tbl_attach_tbl_board_idx` (`bno`),
  CONSTRAINT `fk_tbl_attach_tbl_board` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시물 첨부파일';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attach`
--

LOCK TABLES `tbl_attach` WRITE;
/*!40000 ALTER TABLE `tbl_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_board`
--

DROP TABLE IF EXISTS `tbl_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_board` (
  `bno` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시물 일련번호, Auto Increment',
  `title` varchar(255) DEFAULT NULL COMMENT '게시물 제목',
  `content` text DEFAULT NULL COMMENT '게시물 내용',
  `writer` varchar(45) DEFAULT NULL COMMENT '작성자',
  `view_count` int(11) DEFAULT 0 COMMENT '조회수',
  `reply_count` int(11) DEFAULT 0 COMMENT '댓글수',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일',
  `update_date` timestamp NULL DEFAULT current_timestamp() COMMENT '수정일자',
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='게시물 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_board`
--

LOCK TABLES `tbl_board` WRITE;
/*!40000 ALTER TABLE `tbl_board` DISABLE KEYS */;
INSERT INTO `tbl_board` VALUES (1,'새로운 게시물 입니다','새로운 게시물 내용 입니다','admin',0,0,'2020-12-23 03:20:04','2020-12-23 03:20:04'),(2,'2번째 게시물 입니다','2번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(3,'3번째 게시물 입니다','3번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(4,'4번째 게시물 입니다','4번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(5,'5번째 게시물 입니다','5번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(6,'6번째 게시물 입니다','6번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(7,'7번째 게시물 입니다','7번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(8,'8번째 게시물 입니다','8번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(9,'9번째 게시물 입니다','9번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(10,'10번째 게시물 입니다','10번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(11,'11번째 게시물 입니다','11번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(12,'12번째 게시물 입니다','12번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(13,'13번째 게시물 입니다','13번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(14,'14번째 게시물 입니다','14번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(15,'15번째 게시물 입니다','15번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(16,'16번째 게시물 입니다','16번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(17,'17번째 게시물 입니다','17번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(18,'18번째 게시물 입니다','18번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(19,'19번째 게시물 입니다','19번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(20,'20번째 게시물 입니다','20번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(21,'21번째 게시물 입니다','21번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(22,'22번째 게시물 입니다','22번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(23,'23번째 게시물 입니다','23번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(24,'24번째 게시물 입니다','24번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(25,'25번째 게시물 입니다','25번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(26,'26번째 게시물 입니다','26번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(27,'27번째 게시물 입니다','27번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(28,'28번째 게시물 입니다','28번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(29,'29번째 게시물 입니다','29번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(30,'30번째 게시물 입니다','30번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(31,'31번째 게시물 입니다','31번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(32,'32번째 게시물 입니다','32번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(33,'33번째 게시물 입니다','33번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(34,'34번째 게시물 입니다','34번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(35,'35번째 게시물 입니다','35번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(36,'36번째 게시물 입니다','36번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(37,'37번째 게시물 입니다','37번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(38,'38번째 게시물 입니다','38번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(39,'39번째 게시물 입니다','39번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(40,'40번째 게시물 입니다','40번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(41,'41번째 게시물 입니다','41번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(42,'42번째 게시물 입니다','42번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(43,'43번째 게시물 입니다','43번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(44,'44번째 게시물 입니다','44번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(45,'45번째 게시물 입니다','45번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(46,'46번째 게시물 입니다','46번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(47,'47번째 게시물 입니다','47번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(48,'48번째 게시물 입니다','48번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(49,'49번째 게시물 입니다','49번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(50,'50번째 게시물 입니다','50번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(51,'51번째 게시물 입니다','51번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(52,'52번째 게시물 입니다','52번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(53,'53번째 게시물 입니다','53번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(54,'54번째 게시물 입니다','54번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(55,'55번째 게시물 입니다','55번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(56,'56번째 게시물 입니다','56번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(57,'57번째 게시물 입니다','57번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(58,'58번째 게시물 입니다','58번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(59,'59번째 게시물 입니다','59번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(60,'60번째 게시물 입니다','60번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(61,'61번째 게시물 입니다','61번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(62,'62번째 게시물 입니다','62번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(63,'63번째 게시물 입니다','63번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(64,'64번째 게시물 입니다','64번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(65,'65번째 게시물 입니다','65번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(66,'66번째 게시물 입니다','66번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(67,'67번째 게시물 입니다','67번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(68,'68번째 게시물 입니다','68번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(69,'69번째 게시물 입니다','69번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(70,'70번째 게시물 입니다','70번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(71,'71번째 게시물 입니다','71번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(72,'72번째 게시물 입니다','72번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(73,'73번째 게시물 입니다','73번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(74,'74번째 게시물 입니다','74번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(75,'75번째 게시물 입니다','75번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(76,'76번째 게시물 입니다','76번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(77,'77번째 게시물 입니다','77번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(78,'78번째 게시물 입니다','78번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(79,'79번째 게시물 입니다','79번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(80,'80번째 게시물 입니다','80번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(81,'81번째 게시물 입니다','81번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(82,'82번째 게시물 입니다','82번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(83,'83번째 게시물 입니다','83번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(84,'84번째 게시물 입니다','84번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(85,'85번째 게시물 입니다','85번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(86,'86번째 게시물 입니다','86번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(87,'87번째 게시물 입니다','87번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(88,'88번째 게시물 입니다','88번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(89,'89번째 게시물 입니다','89번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(90,'90번째 게시물 입니다','90번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(91,'91번째 게시물 입니다','91번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(92,'92번째 게시물 입니다','92번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(93,'93번째 게시물 입니다','93번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(94,'94번째 게시물 입니다','94번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(95,'95번째 게시물 입니다','95번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(96,'96번째 게시물 입니다','96번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(97,'97번째 게시물 입니다','97번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(98,'98번째 게시물 입니다','98번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(99,'99번째 게시물 입니다','99번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(100,'100번째 게시물 입니다','100번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(101,'101번째 게시물 입니다','101번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(102,'102번째 게시물 입니다','102번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(103,'103번째 게시물 입니다','103번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(104,'104번째 게시물 입니다','104번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(105,'105번째 게시물 입니다','105번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(106,'106번째 게시물 입니다','106번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(107,'107번째 게시물 입니다','107번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(108,'108번째 게시물 입니다','108번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(109,'109번째 게시물 입니다','109번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(110,'110번째 게시물 입니다','110번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21');
/*!40000 ALTER TABLE `tbl_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_member` (
  `user_id` varchar(45) NOT NULL COMMENT '회원 아이디',
  `user_pw` varchar(255) DEFAULT NULL COMMENT '회원 비밀번호',
  `user_name` varchar(255) DEFAULT NULL COMMENT '회원 이름',
  `email` varchar(255) DEFAULT NULL COMMENT '회원 이메일',
  `point` int(11) DEFAULT 0 COMMENT '적립 포인트',
  `enabled` int(1) DEFAULT 1 COMMENT '블랙리스트 여부, athentication(인증)',
  `levels` varchar(45) DEFAULT 'ROLE_USER' COMMENT '2가지: ROLE_ADMIN(관리자), ROLE_USER(사용자)',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일자',
  `update_date` timestamp NULL DEFAULT current_timestamp() COMMENT '수정일자',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member`
--

LOCK TABLES `tbl_member` WRITE;
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT INTO `tbl_member` VALUES ('admin','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 03:03:41','2020-12-23 03:03:41'),('dummy_1','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_10','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_100','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_101','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_102','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_103','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_104','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_105','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_106','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_107','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_108','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_109','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_11','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_110','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_12','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_13','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_14','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_15','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_16','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_17','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_18','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_19','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_2','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_20','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_21','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_22','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_23','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_24','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_25','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_26','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_27','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_28','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_29','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_3','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_30','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_31','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_32','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_33','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_34','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_35','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_36','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_37','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_38','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_39','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_4','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_40','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_41','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_42','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_43','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_44','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_45','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_46','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_47','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_48','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_49','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_5','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_50','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_51','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_52','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_53','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_54','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_55','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_56','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_57','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_58','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_59','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_6','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_60','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_61','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_62','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_63','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_64','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_65','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_66','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_67','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_68','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_69','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_7','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_70','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_71','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_72','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_73','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_74','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_75','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_76','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_77','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_78','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_79','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_8','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_80','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_81','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_82','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_83','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_84','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_85','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_86','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_87','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_88','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_89','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_9','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_90','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_91','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_92','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_93','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_94','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_95','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_96','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_97','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_98','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_99','1234','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39');
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reply`
--

DROP TABLE IF EXISTS `tbl_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reply` (
  `rno` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글 일련번호',
  `bno` int(11) NOT NULL DEFAULT 0 COMMENT '부모 게시물 일련번호',
  `reply_text` varchar(1000) DEFAULT NULL COMMENT '댓글 내용',
  `replyer` varchar(50) DEFAULT NULL COMMENT '댓글 작성자',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일자',
  `update_date` timestamp NULL DEFAULT current_timestamp() COMMENT '수정일자',
  PRIMARY KEY (`rno`),
  KEY `fk_tbl_reply_tbl_board1_idx` (`bno`),
  CONSTRAINT `fk_tbl_reply_tbl_board1` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='댓글 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reply`
--

LOCK TABLES `tbl_reply` WRITE;
/*!40000 ALTER TABLE `tbl_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'edu'
--
/*!50003 DROP PROCEDURE IF EXISTS `dummyBoard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dummyBoard`(IN p_loop int)
BEGIN
	declare cnt int default 2;
    delete from tbl_board where bno > 1;
    while cnt <= p_loop do
		INSERT INTO tbl_board(bno, title, content, writer)
        VALUES
        (cnt, concat(cnt, '번째 게시물 입니다'), concat(cnt, '번째 게시물 내용 입니다'), 'admin');
        set cnt = cnt + 1;
    end while;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dummyMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dummyMember`(IN p_loop int)
BEGIN
	declare cnt int default  1;
    delete from tbl_member where user_id like 'dummy%';
    while cnt <= p_loop do
		INSERT INTO tbl_member(user_id, user_pw, user_name, email, point, enabled, levels)
		VALUES
		(concat('dummy_', cnt), '1234', '관리자', 'admin@abc.com', '0', '1', 'ROLE_ADMIN');
		set cnt = cnt + 1;
	end while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-28 15:04:01