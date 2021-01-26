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
INSERT INTO `tbl_attach` VALUES ('acbaa582-a008-4625-8872-26805753e112.jpg','졸려.jpg',9,'2021-01-14 06:32:10');
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
  `board_type` varchar(45) DEFAULT NULL COMMENT '게시판타입:tbl_board_type테이블의 값을 가져다 사용',
  `title` varchar(255) DEFAULT NULL COMMENT '게시물 제목',
  `content` text DEFAULT NULL COMMENT '게시물 내용',
  `writer` varchar(45) DEFAULT NULL COMMENT '작성자',
  `view_count` int(11) DEFAULT 0 COMMENT '조회수',
  `reply_count` int(11) DEFAULT 0 COMMENT '댓글수',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일',
  `update_date` timestamp NULL DEFAULT current_timestamp() COMMENT '수정일자',
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='게시물 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_board`
--

LOCK TABLES `tbl_board` WRITE;
/*!40000 ALTER TABLE `tbl_board` DISABLE KEYS */;
INSERT INTO `tbl_board` VALUES (9,'gallery','9번째 게시물 입니다','9번째 게시물 내용 입니다','admin',64,3,'2020-12-23 04:56:21','2021-01-14 06:32:10'),(10,'notice','10번째 게시물 입니다','10번째 게시물 내용 입니다','admin',1,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(11,'notice','11번째 게시물 입니다','11번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(12,'notice','12번째 게시물 입니다','12번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(13,'notice','13번째 게시물 입니다','13번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(14,'notice','14번째 게시물 입니다','14번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(15,'notice','15번째 게시물 입니다','15번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(16,'notice','16번째 게시물 입니다','16번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(17,'notice','17번째 게시물 입니다','17번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(18,'notice','18번째 게시물 입니다','18번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(19,'notice','19번째 게시물 입니다','19번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(20,'notice','20번째 게시물 입니다','20번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(21,'notice','21번째 게시물 입니다','21번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(22,'notice','22번째 게시물 입니다','22번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(23,'notice','23번째 게시물 입니다','23번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(24,'notice','24번째 게시물 입니다','24번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(25,'notice','25번째 게시물 입니다','25번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(26,'notice','26번째 게시물 입니다','26번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(27,'notice','27번째 게시물 입니다','27번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(28,'notice','28번째 게시물 입니다','28번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(29,'notice','29번째 게시물 입니다','29번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(30,'notice','30번째 게시물 입니다','30번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(31,'notice','31번째 게시물 입니다','31번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(32,'notice','32번째 게시물 입니다','32번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(33,'notice','33번째 게시물 입니다','33번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(34,'notice','34번째 게시물 입니다','34번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(35,'notice','35번째 게시물 입니다','35번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(36,'notice','36번째 게시물 입니다','36번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(37,'notice','37번째 게시물 입니다','37번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(38,'notice','38번째 게시물 입니다','38번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(39,'notice','39번째 게시물 입니다','39번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(40,'notice','40번째 게시물 입니다','40번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(41,'notice','41번째 게시물 입니다','41번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(42,'notice','42번째 게시물 입니다','42번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(43,'notice','43번째 게시물 입니다','43번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(44,'notice','44번째 게시물 입니다','44번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(45,'notice','45번째 게시물 입니다','45번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(46,'notice','46번째 게시물 입니다','46번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(47,'notice','47번째 게시물 입니다','47번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(48,'notice','48번째 게시물 입니다','48번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(49,'notice','49번째 게시물 입니다','49번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(50,'notice','50번째 게시물 입니다','50번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(51,'notice','51번째 게시물 입니다','51번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(52,'notice','52번째 게시물 입니다','52번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(53,'notice','53번째 게시물 입니다','53번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(54,'notice','54번째 게시물 입니다','54번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(55,'notice','55번째 게시물 입니다','55번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(56,'notice','56번째 게시물 입니다','56번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(57,'notice','57번째 게시물 입니다','57번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(58,'notice','58번째 게시물 입니다','58번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(59,'notice','59번째 게시물 입니다','59번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(60,'notice','60번째 게시물 입니다','60번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(61,'notice','61번째 게시물 입니다','61번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(62,'notice','62번째 게시물 입니다','62번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(63,'notice','63번째 게시물 입니다','63번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(64,'notice','64번째 게시물 입니다','64번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(65,'notice','65번째 게시물 입니다','65번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(66,'notice','66번째 게시물 입니다','66번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(67,'notice','67번째 게시물 입니다','67번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(68,'notice','68번째 게시물 입니다','68번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(69,'notice','69번째 게시물 입니다','69번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(70,'notice','70번째 게시물 입니다','70번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(71,'notice','71번째 게시물 입니다','71번째 게시물 내용 입니다','admin',1,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(72,'notice','72번째 게시물 입니다','72번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(73,'notice','73번째 게시물 입니다','73번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(74,'notice','74번째 게시물 입니다','74번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(75,'notice','75번째 게시물 입니다','75번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(76,'notice','76번째 게시물 입니다','76번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(77,'notice','77번째 게시물 입니다','77번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(78,'notice','78번째 게시물 입니다','78번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(79,'notice','79번째 게시물 입니다','79번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(80,'notice','80번째 게시물 입니다','80번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(81,'notice','81번째 게시물 입니다','81번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(82,'notice','82번째 게시물 입니다','82번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(83,'notice','83번째 게시물 입니다','83번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(84,'notice','84번째 게시물 입니다','84번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(85,'notice','85번째 게시물 입니다','85번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(86,'notice','86번째 게시물 입니다','86번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(87,'notice','87번째 게시물 입니다','87번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(88,'notice','88번째 게시물 입니다','88번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(89,'notice','89번째 게시물 입니다','89번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(90,'notice','90번째 게시물 입니다','90번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(91,'notice','91번째 게시물 입니다','91번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(92,'notice','92번째 게시물 입니다','92번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(93,'notice','93번째 게시물 입니다','93번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(94,'notice','94번째 게시물 입니다','94번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(95,'notice','95번째 게시물 입니다','95번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(96,'notice','96번째 게시물 입니다','96번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(97,'notice','97번째 게시물 입니다','97번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(98,'notice','98번째 게시물 입니다','98번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(99,'notice','99번째 게시물 입니다','99번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(100,'notice','100번째 게시물 입니다','100번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(101,'notice','101번째 게시물 입니다','101번째 게시물 내용 입니다','admin',1,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(102,'notice','102번째 게시물 입니다','102번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(103,'notice','103번째 게시물 입니다','103번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(104,'notice','104번째 게시물 입니다','104번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(105,'notice','105번째 게시물 입니다','105번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(106,'notice','106번째 게시물 입니다','106번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(107,'notice','107번째 게시물 입니다','107번째 게시물 내용 입니다','admin',0,0,'2020-12-23 04:56:21','2020-12-23 04:56:21'),(108,'notice','108번째 게시물 입니다','108번째 게시물 내용 입니다','admin',1,0,'2020-12-23 04:56:21','2020-12-23 04:56:21');
/*!40000 ALTER TABLE `tbl_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_board_type`
--

DROP TABLE IF EXISTS `tbl_board_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_board_type` (
  `board_type` varchar(45) NOT NULL COMMENT '게시판 타입: notice, gallary, QnA',
  `board_name` varchar(45) DEFAULT NULL COMMENT '게시판 이름',
  `board_sun` int(11) DEFAULT NULL COMMENT '게시판 출력 순서',
  PRIMARY KEY (`board_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_board_type`
--

LOCK TABLES `tbl_board_type` WRITE;
/*!40000 ALTER TABLE `tbl_board_type` DISABLE KEYS */;
INSERT INTO `tbl_board_type` VALUES ('gallery','갤러리',2),('notice','공지사항',1);
/*!40000 ALTER TABLE `tbl_board_type` ENABLE KEYS */;
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
INSERT INTO `tbl_member` VALUES ('admin','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 03:03:41','2020-12-23 03:03:41'),('dummy_1','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_10','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_100','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_101','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_102','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_103','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_104','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_105','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_106','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_107','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_108','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_109','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_11','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_110','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:40','2020-12-23 04:55:40'),('dummy_12','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_13','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_14','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_15','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_16','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_17','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_18','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_19','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_2','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_20','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_21','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_22','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_23','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_24','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_25','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_26','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_27','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_28','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_29','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_3','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_30','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_31','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_32','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_33','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_34','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_35','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_36','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_37','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_38','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_39','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_4','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_40','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_41','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_42','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_43','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_44','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_45','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_46','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_47','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_48','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_49','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_5','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_50','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_51','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_52','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_53','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_54','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_55','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_56','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_57','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_58','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_59','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_6','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_60','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_61','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_62','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_63','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_64','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_65','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_66','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_67','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_68','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_69','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_7','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_70','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_71','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_72','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_73','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_74','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_75','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_76','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_77','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_78','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_79','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_8','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_80','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_81','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_82','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_83','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_84','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_85','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_86','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_87','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_88','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_89','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_9','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_90','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_91','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_92','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_93','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_94','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_95','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_96','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_97','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_98','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39'),('dummy_99','$2a$10$lf9JOjNzgfrfyniYFdFUm.0B1KdxZyWVVRwDXZwJ3Z/bqJpzS1WAK','관리자','admin@abc.com',0,1,'ROLE_ADMIN','2020-12-23 04:55:39','2020-12-23 04:55:39');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='댓글 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reply`
--

LOCK TABLES `tbl_reply` WRITE;
/*!40000 ALTER TABLE `tbl_reply` DISABLE KEYS */;
INSERT INTO `tbl_reply` VALUES (31,9,'1111','11','2021-01-13 07:36:02','2021-01-14 02:43:54'),(33,9,'a','a','2021-01-14 06:32:47','2021-01-14 06:32:47'),(34,9,'b','b','2021-01-14 06:32:53','2021-01-14 06:32:53');
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

-- Dump completed on 2021-01-26 15:56:00
