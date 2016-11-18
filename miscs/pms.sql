-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: erp
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `app_update`
--

DROP TABLE IF EXISTS `app_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionCode` int(11) NOT NULL,
  `versionName` varchar(45) NOT NULL,
  `downloadUrl` varchar(200) NOT NULL,
  `updateLog` varchar(1024) NOT NULL,
  `createTime` datetime NOT NULL,
  `modifyTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_update`
--

LOCK TABLES `app_update` WRITE;
/*!40000 ALTER TABLE `app_update` DISABLE KEYS */;
INSERT INTO `app_update` VALUES (1,1,'1.0.0','http://182.61.49.84:8080/pms/resources/pma.apk','1. 添加自动更新功能','2016-10-30 00:00:00','2016-10-30 00:00:00');
/*!40000 ALTER TABLE `app_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_category`
--

DROP TABLE IF EXISTS `erp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_category`
--

LOCK TABLES `erp_category` WRITE;
/*!40000 ALTER TABLE `erp_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `erp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_device`
--

DROP TABLE IF EXISTS `erp_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `locationCode` varchar(255) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `shedId` bigint(20) DEFAULT NULL,
  `unitId` bigint(20) DEFAULT NULL,
  `vendorId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_g22uni7l30lwr930v6feyynco` (`code`,`description`),
  KEY `FKib0ywnbvf6ege9woe69hx1vgh` (`categoryId`),
  KEY `FK7rbf1wu8i8qe9kxcj1pcsyjax` (`shedId`),
  KEY `FKrrw7wfhpfmi6xb94uur9kjfmq` (`unitId`),
  KEY `FK7bl5ikbihx7i4r8q1t4v056ck` (`vendorId`),
  CONSTRAINT `FK7bl5ikbihx7i4r8q1t4v056ck` FOREIGN KEY (`vendorId`) REFERENCES `erp_vendor` (`id`),
  CONSTRAINT `FK7rbf1wu8i8qe9kxcj1pcsyjax` FOREIGN KEY (`shedId`) REFERENCES `erp_shed` (`id`),
  CONSTRAINT `FKib0ywnbvf6ege9woe69hx1vgh` FOREIGN KEY (`categoryId`) REFERENCES `erp_category` (`id`),
  CONSTRAINT `FKrrw7wfhpfmi6xb94uur9kjfmq` FOREIGN KEY (`unitId`) REFERENCES `erp_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_device`
--

LOCK TABLES `erp_device` WRITE;
/*!40000 ALTER TABLE `erp_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `erp_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_feed`
--

DROP TABLE IF EXISTS `erp_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_feed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `unitId` bigint(20) DEFAULT NULL,
  `vendorId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_aaw7vlucahhwyy6j9e6icf17u` (`code`,`description`),
  KEY `FK188756npcv8476tcb2nstmcim` (`categoryId`),
  KEY `FKn5eumycdccgs7twgqn31ist3o` (`unitId`),
  KEY `FK8b3gm2xp7dorl6gk9ym5iopme` (`vendorId`),
  CONSTRAINT `FK188756npcv8476tcb2nstmcim` FOREIGN KEY (`categoryId`) REFERENCES `erp_category` (`id`),
  CONSTRAINT `FK8b3gm2xp7dorl6gk9ym5iopme` FOREIGN KEY (`vendorId`) REFERENCES `erp_vendor` (`id`),
  CONSTRAINT `FKn5eumycdccgs7twgqn31ist3o` FOREIGN KEY (`unitId`) REFERENCES `erp_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_feed`
--

LOCK TABLES `erp_feed` WRITE;
/*!40000 ALTER TABLE `erp_feed` DISABLE KEYS */;
INSERT INTO `erp_feed` VALUES (1,'123123','2016-10-22 00:00:00','ddd','2016-10-22 00:00:00','饲料1号',NULL,NULL,NULL);
/*!40000 ALTER TABLE `erp_feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_feed_warehouse`
--

DROP TABLE IF EXISTS `erp_feed_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_feed_warehouse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `property` varchar(255) DEFAULT NULL,
  `quantity` float NOT NULL DEFAULT '0',
  `headId` bigint(20) DEFAULT NULL,
  `shedId` bigint(20) DEFAULT NULL,
  `siteId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hh04esbh10q00lfdphk2omk01` (`code`),
  KEY `FK5nv9scv679f4ew36pae160ju5` (`headId`),
  KEY `FK5pfld3hfhmhyfiaxkab8kvcnp` (`shedId`),
  KEY `FKqcrb6c9hegocus4qgqx5qk6da` (`siteId`),
  CONSTRAINT `FK5nv9scv679f4ew36pae160ju5` FOREIGN KEY (`headId`) REFERENCES `erp_user` (`id`),
  CONSTRAINT `FK5pfld3hfhmhyfiaxkab8kvcnp` FOREIGN KEY (`shedId`) REFERENCES `erp_shed` (`id`),
  CONSTRAINT `FKqcrb6c9hegocus4qgqx5qk6da` FOREIGN KEY (`siteId`) REFERENCES `mes_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_feed_warehouse`
--

LOCK TABLES `erp_feed_warehouse` WRITE;
/*!40000 ALTER TABLE `erp_feed_warehouse` DISABLE KEYS */;
INSERT INTO `erp_feed_warehouse` VALUES (1,'w1-1','2016-08-22 15:58:43','2016-08-22 15:58:43','料仓1-1',1,NULL,130,NULL,1,NULL),(2,'w1-2','2016-08-22 15:58:43','2016-08-22 15:58:43','料仓1-2',2,NULL,0,NULL,2,NULL),(3,'w1-3','2016-08-22 15:58:43','2016-08-22 15:58:43','料仓1-3',3,NULL,0,NULL,3,NULL),(4,'w1-4','2016-08-22 15:58:43','2016-08-22 15:58:43','料仓1-4',4,NULL,0,NULL,4,NULL);
/*!40000 ALTER TABLE `erp_feed_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_medicine`
--

DROP TABLE IF EXISTS `erp_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_medicine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `unitId` bigint(20) DEFAULT NULL,
  `vendorId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_kmmwp15ilf03oec084susy64j` (`code`,`description`),
  KEY `FKi6c8dwrowgrpafvd9238977xd` (`categoryId`),
  KEY `FKp8vxpt9i36vpnr23ujl9lydkh` (`unitId`),
  KEY `FK6w94thbvxa865qpvdpkaqro56` (`vendorId`),
  CONSTRAINT `FK6w94thbvxa865qpvdpkaqro56` FOREIGN KEY (`vendorId`) REFERENCES `erp_vendor` (`id`),
  CONSTRAINT `FKi6c8dwrowgrpafvd9238977xd` FOREIGN KEY (`categoryId`) REFERENCES `erp_category` (`id`),
  CONSTRAINT `FKp8vxpt9i36vpnr23ujl9lydkh` FOREIGN KEY (`unitId`) REFERENCES `erp_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_medicine`
--

LOCK TABLES `erp_medicine` WRITE;
/*!40000 ALTER TABLE `erp_medicine` DISABLE KEYS */;
/*!40000 ALTER TABLE `erp_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_medicine_warehouse`
--

DROP TABLE IF EXISTS `erp_medicine_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_medicine_warehouse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `property` varchar(255) DEFAULT NULL,
  `headId` bigint(20) DEFAULT NULL,
  `shedId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6vejsx14le4udaiagcsdyubb4` (`code`),
  KEY `FK80gttjo9eqy2jeeydqp6g8o5e` (`headId`),
  KEY `FK4lnmx5ub0mooy2ti3islvgv1v` (`shedId`),
  CONSTRAINT `FK4lnmx5ub0mooy2ti3islvgv1v` FOREIGN KEY (`shedId`) REFERENCES `erp_shed` (`id`),
  CONSTRAINT `FK80gttjo9eqy2jeeydqp6g8o5e` FOREIGN KEY (`headId`) REFERENCES `erp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_medicine_warehouse`
--

LOCK TABLES `erp_medicine_warehouse` WRITE;
/*!40000 ALTER TABLE `erp_medicine_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `erp_medicine_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_module`
--

DROP TABLE IF EXISTS `erp_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_module`
--

LOCK TABLES `erp_module` WRITE;
/*!40000 ALTER TABLE `erp_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `erp_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_pig`
--

DROP TABLE IF EXISTS `erp_pig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_pig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `unitId` bigint(20) DEFAULT NULL,
  `vendorId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ji7ei4twfe5tl2xddglb8y6su` (`code`,`description`),
  KEY `FK3w4i12hpd4af8ud29cwxyhjn` (`categoryId`),
  KEY `FKirwqhw05nukfgfnu1r3d4snir` (`unitId`),
  KEY `FK2x33gpnttjjaott771buc6iye` (`vendorId`),
  CONSTRAINT `FK2x33gpnttjjaott771buc6iye` FOREIGN KEY (`vendorId`) REFERENCES `erp_vendor` (`id`),
  CONSTRAINT `FK3w4i12hpd4af8ud29cwxyhjn` FOREIGN KEY (`categoryId`) REFERENCES `erp_category` (`id`),
  CONSTRAINT `FKirwqhw05nukfgfnu1r3d4snir` FOREIGN KEY (`unitId`) REFERENCES `erp_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_pig`
--

LOCK TABLES `erp_pig` WRITE;
/*!40000 ALTER TABLE `erp_pig` DISABLE KEYS */;
INSERT INTO `erp_pig` VALUES (1,'1111','2016-08-24 14:43:54',NULL,'2016-08-24 14:43:54','杜洛克',NULL,NULL,NULL);
/*!40000 ALTER TABLE `erp_pig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_privilege`
--

DROP TABLE IF EXISTS `erp_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbnac3gqe98y19ei24lt661dsj` (`userId`),
  CONSTRAINT `FKbnac3gqe98y19ei24lt661dsj` FOREIGN KEY (`userId`) REFERENCES `erp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_privilege`
--

LOCK TABLES `erp_privilege` WRITE;
/*!40000 ALTER TABLE `erp_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `erp_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_purchase_order`
--

DROP TABLE IF EXISTS `erp_purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_purchase_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `type` smallint(6) NOT NULL,
  `quantity` float NOT NULL,
  `weight` float DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `modifyTime` datetime NOT NULL,
  `executionTime` datetime DEFAULT NULL,
  `executionImg` varchar(512) DEFAULT NULL,
  `pigId` bigint(20) DEFAULT NULL,
  `vendorId` bigint(20) DEFAULT NULL,
  `feedId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `fkPigId_idx` (`pigId`),
  KEY `fkFeedId_idx` (`feedId`),
  KEY `fkVendorId_idx` (`vendorId`),
  CONSTRAINT `fkFeedId` FOREIGN KEY (`feedId`) REFERENCES `erp_feed` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkPigId` FOREIGN KEY (`pigId`) REFERENCES `erp_pig` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkVendorId` FOREIGN KEY (`vendorId`) REFERENCES `erp_vendor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_purchase_order`
--

LOCK TABLES `erp_purchase_order` WRITE;
/*!40000 ALTER TABLE `erp_purchase_order` DISABLE KEYS */;
INSERT INTO `erp_purchase_order` VALUES (1,'PO-1001',1,1200,5,'2016-11-16 00:00:00','2016-11-16 00:00:00','2016-11-17 16:05:39','F:\\projects\\java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\pms\\WEB-INF\\upload\\po\\2016-11-17\\8dbb07be-3934-44ac-9080-0c92be6b8c17.jpg',1,1,1);
/*!40000 ALTER TABLE `erp_purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_role`
--

DROP TABLE IF EXISTS `erp_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_role`
--

LOCK TABLES `erp_role` WRITE;
/*!40000 ALTER TABLE `erp_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `erp_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_role_privilege`
--

DROP TABLE IF EXISTS `erp_role_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_role_privilege` (
  `Role_id` bigint(20) NOT NULL,
  `privileges_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Role_id`,`privileges_id`),
  KEY `FKmrox9wumaspofasoilobsrc28` (`privileges_id`),
  CONSTRAINT `FKebbdi5kg2cibq0gah4ijs0lnd` FOREIGN KEY (`Role_id`) REFERENCES `erp_role` (`id`),
  CONSTRAINT `FKmrox9wumaspofasoilobsrc28` FOREIGN KEY (`privileges_id`) REFERENCES `erp_privilege` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_role_privilege`
--

LOCK TABLES `erp_role_privilege` WRITE;
/*!40000 ALTER TABLE `erp_role_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `erp_role_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_shed`
--

DROP TABLE IF EXISTS `erp_shed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_shed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `headId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nf51wvdhrm81dxad9ema40ltv` (`code`),
  KEY `FKld3tav0yhmck5me58s1lxakq5` (`headId`),
  CONSTRAINT `FKld3tav0yhmck5me58s1lxakq5` FOREIGN KEY (`headId`) REFERENCES `erp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_shed`
--

LOCK TABLES `erp_shed` WRITE;
/*!40000 ALTER TABLE `erp_shed` DISABLE KEYS */;
INSERT INTO `erp_shed` VALUES (1,'\0','1','209375732101','2016-08-22 10:52:15','2016-08-22 10:52:15','1号猪舍',NULL),(2,'\0','2','209375732102','2016-08-22 10:54:09','2016-08-22 10:54:09','2号猪舍',NULL),(3,'\0','3','209375732103','2016-08-22 12:14:09','2016-08-22 12:14:09','3号猪舍',NULL),(4,'\0','4','209375732104','2016-08-22 12:17:59','2016-08-22 12:17:59','4号猪舍',NULL);
/*!40000 ALTER TABLE `erp_shed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_sty`
--

DROP TABLE IF EXISTS `erp_sty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_sty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `currentNumber` int(11) DEFAULT NULL,
  `lastNumber` int(11) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `shedId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_l5cu7iyawn46kobl8s7s6xkhb` (`code`),
  KEY `FKpjdefk2nkkt7orqqh6jonuj5d` (`shedId`),
  CONSTRAINT `FKpjdefk2nkkt7orqqh6jonuj5d` FOREIGN KEY (`shedId`) REFERENCES `erp_shed` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_sty`
--

LOCK TABLES `erp_sty` WRITE;
/*!40000 ALTER TABLE `erp_sty` DISABLE KEYS */;
INSERT INTO `erp_sty` VALUES (1,'sty1-1','2016-08-22 10:53:28',1385,0,'2016-08-22 10:53:28','A01',1,1),(4,'sty1-2','2016-08-22 12:14:18',83,0,'2016-08-22 12:14:18','B01',2,1),(5,'sty1-3','2016-08-22 12:18:07',100,0,'2016-08-22 12:18:07','C01',4,1),(6,'sty1-4','2016-08-22 12:18:07',90,0,'2016-08-22 12:18:07','D01',4,1),(7,'sty1-5','2016-08-22 12:18:07',0,0,'2016-08-22 12:18:07','A02',5,1),(8,'sty1-6','2016-08-22 12:18:07',0,0,'2016-08-22 12:18:07','B02',6,1),(9,'sty1-7','2016-08-22 12:18:07',0,0,'2016-08-22 12:18:07','C02',7,1),(10,'sty1-8','2016-08-22 12:18:07',0,0,'2016-08-22 12:18:07','D02',8,1),(23,'sty1-9','2016-08-22 12:18:07',0,0,'2016-08-22 12:18:07','E01',1,2),(24,'sty1-10','2016-08-22 12:18:07',0,0,'2016-08-22 12:18:07','F01',1,2),(25,'sty1-11','2016-08-22 12:18:07',0,0,'2016-08-22 12:18:07','G01',1,2),(26,'sty1-12','2016-08-22 12:18:07',0,0,'2016-08-22 12:18:07','H01',1,2);
/*!40000 ALTER TABLE `erp_sty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_unit`
--

DROP TABLE IF EXISTS `erp_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_unit`
--

LOCK TABLES `erp_unit` WRITE;
/*!40000 ALTER TABLE `erp_unit` DISABLE KEYS */;
INSERT INTO `erp_unit` VALUES (1,'2016-08-24 14:43:39','2016-08-24 14:43:39','吨','T');
/*!40000 ALTER TABLE `erp_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_user`
--

DROP TABLE IF EXISTS `erp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1trx1dinkqnies6s2kfeefw9k` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_user`
--

LOCK TABLES `erp_user` WRITE;
/*!40000 ALTER TABLE `erp_user` DISABLE KEYS */;
INSERT INTO `erp_user` VALUES (1,'user1','2016-10-21 00:00:00',NULL,NULL,'2016-10-21 00:00:00','zhangjianfen','2ED5AE037C70035C','张建奋'),(2,'user2','2016-10-21 00:00:00',NULL,NULL,'2016-10-21 00:00:00','maoshao','2ED5AE037C70035C','毛山'),(3,'user3','2016-10-21 00:00:00',NULL,NULL,'2016-10-21 00:00:00','zhangyong','2ED5AE037C70035C','张勇'),(4,'user4','2016-10-21 00:00:00',NULL,NULL,'2016-10-21 00:00:00','lubinyao','2ED5AE037C70035C','陆斌耀'),(5,'user5','2016-10-21 00:00:00',NULL,NULL,'2016-10-21 00:00:00','huangyuwei','2ED5AE037C70035C','黄宇伟'),(6,'user6','2016-10-21 00:00:00',NULL,NULL,'2016-10-21 00:00:00','xuxuemin','2ED5AE037C70035C','徐学民');
/*!40000 ALTER TABLE `erp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erp_vendor`
--

DROP TABLE IF EXISTS `erp_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erp_vendor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erp_vendor`
--

LOCK TABLES `erp_vendor` WRITE;
/*!40000 ALTER TABLE `erp_vendor` DISABLE KEYS */;
INSERT INTO `erp_vendor` VALUES (1,'1','2016-08-24 14:43:14',NULL,'2016-08-24 14:43:14','傲农'),(2,'2','2016-08-24 14:43:14',NULL,'2016-08-24 14:43:14','天邦');
/*!40000 ALTER TABLE `erp_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_batch`
--

DROP TABLE IF EXISTS `mes_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_batch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `inStockNumber` int(11) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_batch`
--

LOCK TABLES `mes_batch` WRITE;
/*!40000 ALTER TABLE `mes_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_batch_sty`
--

DROP TABLE IF EXISTS `mes_batch_sty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_batch_sty` (
  `batchId` bigint(20) NOT NULL,
  `styId` bigint(20) NOT NULL,
  PRIMARY KEY (`batchId`,`styId`),
  KEY `FKr0l3jml1hxf9hvvvddw4aacds` (`styId`),
  CONSTRAINT `FKqahiit3axvqidl5vshijvfg6d` FOREIGN KEY (`batchId`) REFERENCES `mes_batch` (`id`),
  CONSTRAINT `FKr0l3jml1hxf9hvvvddw4aacds` FOREIGN KEY (`styId`) REFERENCES `erp_sty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_batch_sty`
--

LOCK TABLES `mes_batch_sty` WRITE;
/*!40000 ALTER TABLE `mes_batch_sty` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_batch_sty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_feed_delivery`
--

DROP TABLE IF EXISTS `mes_feed_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_feed_delivery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `feedId` bigint(20) DEFAULT NULL,
  `feedWarehouseId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_67t7u6tkjnb9ueb8uaigetcih` (`code`),
  KEY `FK1rgaxfm02jxrx6hun1nlmgffk` (`feedId`),
  KEY `FK2lidr0wnmobron9i1jtgreh2g` (`feedWarehouseId`),
  CONSTRAINT `FK1rgaxfm02jxrx6hun1nlmgffk` FOREIGN KEY (`feedId`) REFERENCES `erp_feed` (`id`),
  CONSTRAINT `FK2lidr0wnmobron9i1jtgreh2g` FOREIGN KEY (`feedWarehouseId`) REFERENCES `erp_feed_warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_feed_delivery`
--

LOCK TABLES `mes_feed_delivery` WRITE;
/*!40000 ALTER TABLE `mes_feed_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_feed_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_feed_entry`
--

DROP TABLE IF EXISTS `mes_feed_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_feed_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `number` float DEFAULT NULL,
  `productionCode` varchar(255) DEFAULT NULL,
  `purchaseCode` varchar(255) DEFAULT NULL,
  `feedId` bigint(20) DEFAULT NULL,
  `feedWarehouseId` bigint(20) DEFAULT NULL,
  `unitId` bigint(20) DEFAULT NULL,
  `vendorId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qxr08npxlqpq2evmgi4uqdlsd` (`code`),
  KEY `FKmd8lc7kgmsey81qsndtftsj82` (`feedId`),
  KEY `FK386132wpbi641u5ifrbejckys` (`feedWarehouseId`),
  KEY `FK36wpcm5nhy54l7ein5fekueip` (`unitId`),
  KEY `FK41uenauwa00yaxs2vjyqqs3n5` (`vendorId`),
  CONSTRAINT `FK36wpcm5nhy54l7ein5fekueip` FOREIGN KEY (`unitId`) REFERENCES `erp_unit` (`id`),
  CONSTRAINT `FK386132wpbi641u5ifrbejckys` FOREIGN KEY (`feedWarehouseId`) REFERENCES `erp_feed_warehouse` (`id`),
  CONSTRAINT `FK41uenauwa00yaxs2vjyqqs3n5` FOREIGN KEY (`vendorId`) REFERENCES `erp_vendor` (`id`),
  CONSTRAINT `FKmd8lc7kgmsey81qsndtftsj82` FOREIGN KEY (`feedId`) REFERENCES `erp_feed` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_feed_entry`
--

LOCK TABLES `mes_feed_entry` WRITE;
/*!40000 ALTER TABLE `mes_feed_entry` DISABLE KEYS */;
INSERT INTO `mes_feed_entry` VALUES (1,'1001','2016-08-28 10:29:17','2016-08-28 10:29:17',100,NULL,'1001',NULL,1,NULL,NULL),(2,'1002','2016-08-28 10:29:36','2016-08-28 10:29:36',100,NULL,'1002',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `mes_feed_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_feed_log`
--

DROP TABLE IF EXISTS `mes_feed_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_feed_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` float NOT NULL,
  `operation` smallint(6) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `warehouseId` bigint(20) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `modifyTime` datetime NOT NULL,
  `purchaseOrderId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_log_user_pk_idx` (`userId`),
  KEY `feed_log_warehouse_pk_idx` (`warehouseId`),
  CONSTRAINT `feed_log_user_pk` FOREIGN KEY (`userId`) REFERENCES `erp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `feed_log_warehouse_pk` FOREIGN KEY (`warehouseId`) REFERENCES `erp_feed_warehouse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_feed_log`
--

LOCK TABLES `mes_feed_log` WRITE;
/*!40000 ALTER TABLE `mes_feed_log` DISABLE KEYS */;
INSERT INTO `mes_feed_log` VALUES (4,10,1,1,1,'2016-11-01 10:56:10','2016-11-01 10:56:10',1),(5,20,1,6,1,'2016-11-02 16:23:13','2016-11-02 16:23:13',1),(6,100,1,1,1,'2016-11-17 16:17:36','2016-11-17 16:17:36',1);
/*!40000 ALTER TABLE `mes_feed_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_feed_requirement`
--

DROP TABLE IF EXISTS `mes_feed_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_feed_requirement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `day1` float DEFAULT NULL,
  `day2` float DEFAULT NULL,
  `day3` float DEFAULT NULL,
  `day4` float DEFAULT NULL,
  `day5` float DEFAULT NULL,
  `day6` float DEFAULT NULL,
  `day7` float DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `siteId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5re318lugdfxeuqouggikq9fn` (`code`),
  KEY `FK59779wj5ybrtnpxtgvkbtktny` (`siteId`),
  CONSTRAINT `FK59779wj5ybrtnpxtgvkbtktny` FOREIGN KEY (`siteId`) REFERENCES `mes_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_feed_requirement`
--

LOCK TABLES `mes_feed_requirement` WRITE;
/*!40000 ALTER TABLE `mes_feed_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_feed_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_feed_requirement_detail`
--

DROP TABLE IF EXISTS `mes_feed_requirement_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_feed_requirement_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `quantity` float NOT NULL,
  `feedId` bigint(20) DEFAULT NULL,
  `requirementId` bigint(20) DEFAULT NULL,
  `unitId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7e8cpos7illdspf4iqr5pnkrl` (`feedId`),
  KEY `FKlmw40t1pigtgjoji762878sa2` (`requirementId`),
  KEY `FKtcvj8neyfhqc0m5cweprfryxs` (`unitId`),
  CONSTRAINT `FK7e8cpos7illdspf4iqr5pnkrl` FOREIGN KEY (`feedId`) REFERENCES `erp_feed` (`id`),
  CONSTRAINT `FKlmw40t1pigtgjoji762878sa2` FOREIGN KEY (`requirementId`) REFERENCES `mes_feed_requirement` (`id`),
  CONSTRAINT `FKtcvj8neyfhqc0m5cweprfryxs` FOREIGN KEY (`unitId`) REFERENCES `erp_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_feed_requirement_detail`
--

LOCK TABLES `mes_feed_requirement_detail` WRITE;
/*!40000 ALTER TABLE `mes_feed_requirement_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_feed_requirement_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_operation_log`
--

DROP TABLE IF EXISTS `mes_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_operation_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `shed_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK57qlg5wv9knbodx25bq38j0qm` (`shed_id`),
  KEY `FKf0yd67mmuo74nq65i2m8wwj4u` (`user_id`),
  CONSTRAINT `FK57qlg5wv9knbodx25bq38j0qm` FOREIGN KEY (`shed_id`) REFERENCES `erp_shed` (`id`),
  CONSTRAINT `FKf0yd67mmuo74nq65i2m8wwj4u` FOREIGN KEY (`user_id`) REFERENCES `erp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_operation_log`
--

LOCK TABLES `mes_operation_log` WRITE;
/*!40000 ALTER TABLE `mes_operation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_ph`
--

DROP TABLE IF EXISTS `mes_ph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_ph` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `value` float DEFAULT NULL,
  `shedId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrn1lyw3ntdei9sehg8gm1ip8t` (`shedId`),
  CONSTRAINT `FKrn1lyw3ntdei9sehg8gm1ip8t` FOREIGN KEY (`shedId`) REFERENCES `erp_shed` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_ph`
--

LOCK TABLES `mes_ph` WRITE;
/*!40000 ALTER TABLE `mes_ph` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_ph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_pig_delivery`
--

DROP TABLE IF EXISTS `mes_pig_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_pig_delivery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `pigId` bigint(20) DEFAULT NULL,
  `styId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qaguyay7sqssry9ybnmb9mivk` (`code`),
  KEY `FKggyvh2x1esu4mwj8t25jwv0eg` (`pigId`),
  KEY `FKck329jrdblettgsyrsvgcypqe` (`styId`),
  CONSTRAINT `FKck329jrdblettgsyrsvgcypqe` FOREIGN KEY (`styId`) REFERENCES `erp_sty` (`id`),
  CONSTRAINT `FKggyvh2x1esu4mwj8t25jwv0eg` FOREIGN KEY (`pigId`) REFERENCES `erp_pig` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_pig_delivery`
--

LOCK TABLES `mes_pig_delivery` WRITE;
/*!40000 ALTER TABLE `mes_pig_delivery` DISABLE KEYS */;
INSERT INTO `mes_pig_delivery` VALUES (1,'1000','2016-08-27 17:41:06','2016-08-27 17:41:06',100,NULL,4),(2,'1007','2016-08-28 17:43:03','2016-08-28 17:43:03',20,NULL,4);
/*!40000 ALTER TABLE `mes_pig_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_pig_die`
--

DROP TABLE IF EXISTS `mes_pig_die`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_pig_die` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `pigId` bigint(20) DEFAULT NULL,
  `styId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nsdijrmx5fla6q2sxw022l3tv` (`code`),
  KEY `FKo7q46hhfhhstrl0cttxut402c` (`pigId`),
  KEY `FK90v4upnu6waem9x8wdpo9md8p` (`styId`),
  CONSTRAINT `FK90v4upnu6waem9x8wdpo9md8p` FOREIGN KEY (`styId`) REFERENCES `erp_sty` (`id`),
  CONSTRAINT `FKo7q46hhfhhstrl0cttxut402c` FOREIGN KEY (`pigId`) REFERENCES `erp_pig` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_pig_die`
--

LOCK TABLES `mes_pig_die` WRITE;
/*!40000 ALTER TABLE `mes_pig_die` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_pig_die` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_pig_entry`
--

DROP TABLE IF EXISTS `mes_pig_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_pig_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `purchaseCode` varchar(255) DEFAULT NULL,
  `pigId` bigint(20) DEFAULT NULL,
  `styId` bigint(20) DEFAULT NULL,
  `vendorId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_203tm26gcy8htn90cp94amvjr` (`code`),
  KEY `FK49mngm2l3sdfqadr04c28d8iy` (`pigId`),
  KEY `FKgfrpwe96fc5ttdhdyau35evw1` (`styId`),
  KEY `FK66pqcnn6k5rxvfdykxc73gyi2` (`vendorId`),
  CONSTRAINT `FK49mngm2l3sdfqadr04c28d8iy` FOREIGN KEY (`pigId`) REFERENCES `erp_pig` (`id`),
  CONSTRAINT `FK66pqcnn6k5rxvfdykxc73gyi2` FOREIGN KEY (`vendorId`) REFERENCES `erp_vendor` (`id`),
  CONSTRAINT `FKgfrpwe96fc5ttdhdyau35evw1` FOREIGN KEY (`styId`) REFERENCES `erp_sty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_pig_entry`
--

LOCK TABLES `mes_pig_entry` WRITE;
/*!40000 ALTER TABLE `mes_pig_entry` DISABLE KEYS */;
INSERT INTO `mes_pig_entry` VALUES (6,'44444','2016-08-24 15:08:37','2016-08-24 15:08:37',100,'xxxxx',NULL,1,1),(8,'444449','2016-08-24 15:15:11','2016-08-24 15:15:11',100,'xxxxx',NULL,1,1),(18,'4444400','2016-08-24 15:58:18','2016-08-24 15:58:18',100,'xxxxx',NULL,1,1),(19,'44444007','2016-08-24 16:00:01','2016-08-24 16:00:01',100,'xxxxx',NULL,1,1),(21,'444440079','2016-08-24 16:02:19','2016-08-24 16:02:19',100,'xxxxx',NULL,1,1),(22,'444','2016-08-24 16:04:47','2016-08-24 16:04:47',100,'xxxxx',NULL,1,1),(23,'4440','2016-08-24 16:05:50','2016-08-24 16:05:50',100,'xxxxx',NULL,1,1),(25,'44409','2016-08-24 16:06:58','2016-08-24 16:06:58',100,'xxxxx',NULL,1,1),(26,'444098','2016-08-24 16:07:57','2016-08-24 16:07:57',100,'xxxxx',NULL,1,1),(27,'4424098','2016-08-24 16:09:38','2016-08-24 16:09:38',100,'xxxxx',NULL,1,1),(28,'442c4098','2016-08-24 16:10:25','2016-08-24 16:10:25',100,'xxxxx',NULL,1,1),(30,'1-1','2016-08-24 16:47:53','2016-08-24 16:47:53',100,'xxxxx',NULL,1,1),(31,'1-1-2','2016-08-24 16:51:44','2016-08-24 16:51:44',100,'xxxxx',NULL,1,1),(32,'1111','2016-08-27 09:01:56','2016-08-27 09:01:56',100,'1111',NULL,1,1),(34,'2222','2016-08-27 09:02:32','2016-08-27 09:02:32',100,'1111',NULL,1,NULL),(36,'33','2016-08-27 09:22:58','2016-08-27 09:22:58',100,'1111',NULL,1,NULL),(37,'1000','2016-08-27 09:25:55','2016-08-27 09:25:55',100,'1111',NULL,1,NULL),(38,'112233','2016-08-27 09:25:59','2016-08-27 09:25:59',100,'112233',NULL,4,NULL),(39,'1002','2016-08-27 09:26:31','2016-08-27 09:26:31',100,'122',NULL,4,NULL),(41,'1004','2016-08-28 11:39:47','2016-08-28 11:39:47',100,'1004',NULL,4,NULL),(42,'1005','2016-08-28 11:40:13','2016-08-28 11:40:13',300,'1005',NULL,4,NULL),(43,'1006','2016-08-28 17:41:16','2016-08-28 17:41:16',100,'1006',NULL,4,NULL),(44,'1007','2016-08-28 17:42:05','2016-08-28 17:42:05',154,'1007',NULL,4,NULL);
/*!40000 ALTER TABLE `mes_pig_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_pig_log`
--

DROP TABLE IF EXISTS `mes_pig_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_pig_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `styIdFrom` bigint(20) DEFAULT NULL,
  `styIdTo` bigint(20) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `modifyTime` datetime NOT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `purchaseOrderId` bigint(20) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pig_log_user_pk_idx` (`userId`),
  KEY `pig_log_sty_from_fk_idx` (`styIdFrom`),
  KEY `pig_log_sty_to_fk_idx` (`styIdTo`),
  KEY `pig_log_purchase_order_fk_idx` (`purchaseOrderId`),
  CONSTRAINT `pig_log_purchase_order_fk` FOREIGN KEY (`purchaseOrderId`) REFERENCES `erp_purchase_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pig_log_sty_from_fk` FOREIGN KEY (`styIdFrom`) REFERENCES `erp_sty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pig_log_sty_to_fk` FOREIGN KEY (`styIdTo`) REFERENCES `erp_sty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pig_log_user_fk` FOREIGN KEY (`userId`) REFERENCES `erp_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_pig_log`
--

LOCK TABLES `mes_pig_log` WRITE;
/*!40000 ALTER TABLE `mes_pig_log` DISABLE KEYS */;
INSERT INTO `mes_pig_log` VALUES (14,100,1,1,NULL,1,'2016-11-01 10:25:42','2016-11-01 10:25:42','入栏',NULL,NULL),(15,100,1,6,NULL,1,'2016-11-02 16:19:46','2016-11-02 16:19:46','入栏',NULL,NULL),(16,80,1,6,NULL,4,'2016-11-02 16:21:04','2016-11-02 16:21:04','入栏',NULL,NULL),(17,100,1,6,NULL,5,'2016-11-02 16:21:44','2016-11-02 16:21:44','入栏',NULL,NULL),(18,90,1,6,NULL,6,'2016-11-02 16:22:10','2016-11-02 16:22:10','入栏',NULL,NULL),(19,100,1,1,NULL,1,'2016-11-17 16:53:56','2016-11-17 16:53:56','入栏',1,5),(20,100,1,1,NULL,1,'2016-11-17 16:54:17','2016-11-17 16:54:17','入栏',1,5),(21,100,1,1,NULL,1,'2016-11-17 16:58:25','2016-11-17 16:58:25','入栏',1,5),(22,100,1,1,NULL,1,'2016-11-17 16:58:28','2016-11-17 16:58:28','入栏',1,5),(23,100,1,1,NULL,1,'2016-11-17 16:58:44','2016-11-17 16:58:44','入栏',1,5),(24,100,1,1,NULL,1,'2016-11-17 16:59:59','2016-11-17 16:59:59','入栏',1,5),(25,100,1,1,NULL,1,'2016-11-17 17:00:01','2016-11-17 17:00:01','入栏',1,5),(26,100,1,1,NULL,1,'2016-11-17 17:03:46','2016-11-17 17:03:46','入栏',1,5),(27,100,1,1,NULL,1,'2016-11-17 17:03:49','2016-11-17 17:03:49','入栏',1,5),(28,100,1,1,NULL,1,'2016-11-17 17:04:06','2016-11-17 17:04:06','入栏',1,5),(29,100,1,1,NULL,1,'2016-11-17 17:04:23','2016-11-17 17:04:23','入栏',1,5),(30,100,1,1,NULL,1,'2016-11-17 17:04:24','2016-11-17 17:04:24','入栏',1,5),(31,3,2,1,1,4,'2016-11-17 17:08:43','2016-11-17 17:08:43','从A01移到B01',NULL,NULL),(32,3,3,1,1,NULL,'2016-11-17 17:10:31','2016-11-17 17:10:31','健康猪出栏',NULL,NULL),(33,3,3,1,1,NULL,'2016-11-17 17:10:54','2016-11-17 17:10:54','健康猪出栏',NULL,NULL),(34,3,4,1,1,NULL,'2016-11-17 17:11:29','2016-11-17 17:11:29','病猪出栏',NULL,NULL),(35,3,5,1,1,NULL,'2016-11-17 17:11:50','2016-11-17 17:11:50','死猪出栏',NULL,NULL);
/*!40000 ALTER TABLE `mes_pig_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_piglet_plan`
--

DROP TABLE IF EXISTS `mes_piglet_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_piglet_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `siteId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4a44j8nn9jt1ag3k7hfjx9rtr` (`siteId`),
  CONSTRAINT `FK4a44j8nn9jt1ag3k7hfjx9rtr` FOREIGN KEY (`siteId`) REFERENCES `mes_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_piglet_plan`
--

LOCK TABLES `mes_piglet_plan` WRITE;
/*!40000 ALTER TABLE `mes_piglet_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_piglet_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_production_instruction`
--

DROP TABLE IF EXISTS `mes_production_instruction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_production_instruction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bacteria` float NOT NULL,
  `barrel1` float NOT NULL,
  `barrel2` float NOT NULL,
  `barrel3` float NOT NULL,
  `barrel4` float NOT NULL,
  `barrel5` float NOT NULL,
  `barrel6` float NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `dry` float NOT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `water` float NOT NULL,
  `shedId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3i80edskp5akcmwyoa3sqxmkj` (`shedId`),
  CONSTRAINT `FK3i80edskp5akcmwyoa3sqxmkj` FOREIGN KEY (`shedId`) REFERENCES `erp_shed` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_production_instruction`
--

LOCK TABLES `mes_production_instruction` WRITE;
/*!40000 ALTER TABLE `mes_production_instruction` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_production_instruction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_shed_log`
--

DROP TABLE IF EXISTS `mes_shed_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_shed_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime NOT NULL,
  `modifyTime` datetime NOT NULL,
  `entryNumber` int(11) DEFAULT '0',
  `illDeliveryNumber` int(11) DEFAULT '0',
  `deadDeliveryNumber` int(11) DEFAULT '0',
  `healthyDeliveryNumber` int(11) DEFAULT '0',
  `stockNumber` int(11) NOT NULL DEFAULT '0',
  `shedId` bigint(20) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sheId_idx` (`shedId`),
  CONSTRAINT `fkShedId` FOREIGN KEY (`shedId`) REFERENCES `erp_shed` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_shed_log`
--

LOCK TABLES `mes_shed_log` WRITE;
/*!40000 ALTER TABLE `mes_shed_log` DISABLE KEYS */;
INSERT INTO `mes_shed_log` VALUES (9,'2016-11-17 00:00:00','2016-11-17 00:00:00',200,3,3,6,188,1,'2016-11-17 00:00:00');
/*!40000 ALTER TABLE `mes_shed_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_site`
--

DROP TABLE IF EXISTS `mes_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `stage` int(11) DEFAULT '0',
  `startTime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6g9ejaaq4j4ep0nb6weqi0dai` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_site`
--

LOCK TABLES `mes_site` WRITE;
/*!40000 ALTER TABLE `mes_site` DISABLE KEYS */;
INSERT INTO `mes_site` VALUES (1,'93876c73-64d7-4f46-a422-6b16d25b5a43','2016-08-22 07:58:22','192.168.1.4','2016-08-22 07:58:22',0,NULL,0),(2,'70871ffe-4dc5-4c5a-b0f5-919848fb2fe4','2016-08-22 10:31:50','192.168.1.4','2016-08-22 10:31:50',0,NULL,0),(3,'2163df3f-9f97-43fd-b12f-020a1324b5c7','2016-08-22 10:43:25','192.168.1.4','2016-08-22 10:43:25',0,NULL,0),(4,'3a120e96-9a19-4933-8428-61a9dc43bfd4','2016-08-22 10:50:36','192.168.1.4','2016-08-22 10:50:36',0,NULL,0);
/*!40000 ALTER TABLE `mes_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_site_device`
--

DROP TABLE IF EXISTS `mes_site_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_site_device` (
  `siteId` bigint(20) NOT NULL,
  `deviceId` bigint(20) NOT NULL,
  PRIMARY KEY (`siteId`,`deviceId`),
  KEY `FKntddfe93fwga78mc0h0c5bg5v` (`deviceId`),
  CONSTRAINT `FKdc6scuhv2dt909mfr098yob1y` FOREIGN KEY (`siteId`) REFERENCES `mes_site` (`id`),
  CONSTRAINT `FKntddfe93fwga78mc0h0c5bg5v` FOREIGN KEY (`deviceId`) REFERENCES `erp_device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_site_device`
--

LOCK TABLES `mes_site_device` WRITE;
/*!40000 ALTER TABLE `mes_site_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_site_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_site_sty`
--

DROP TABLE IF EXISTS `mes_site_sty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_site_sty` (
  `siteId` int(11) NOT NULL,
  `styId` bigint(20) NOT NULL,
  PRIMARY KEY (`siteId`,`styId`),
  KEY `FK56wkok7fwr9300yewl61bnn2x` (`styId`),
  CONSTRAINT `FK56wkok7fwr9300yewl61bnn2x` FOREIGN KEY (`styId`) REFERENCES `erp_sty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_site_sty`
--

LOCK TABLES `mes_site_sty` WRITE;
/*!40000 ALTER TABLE `mes_site_sty` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_site_sty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_site_user`
--

DROP TABLE IF EXISTS `mes_site_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_site_user` (
  `siteId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`siteId`,`userId`),
  KEY `FK9at1a6adow4ureyfd1kyjv996` (`userId`),
  CONSTRAINT `FK9at1a6adow4ureyfd1kyjv996` FOREIGN KEY (`userId`) REFERENCES `erp_user` (`id`),
  CONSTRAINT `FKnqwr2h3yt92ihg1lp67rx60w1` FOREIGN KEY (`siteId`) REFERENCES `mes_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_site_user`
--

LOCK TABLES `mes_site_user` WRITE;
/*!40000 ALTER TABLE `mes_site_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_site_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_working_condition`
--

DROP TABLE IF EXISTS `mes_working_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes_working_condition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `pump1` int(11) NOT NULL,
  `pump2` int(11) NOT NULL,
  `pump3` int(11) NOT NULL,
  `pump4` int(11) NOT NULL,
  `value1` int(11) NOT NULL,
  `value10` int(11) NOT NULL,
  `value11` int(11) NOT NULL,
  `value12` int(11) NOT NULL,
  `value13` int(11) NOT NULL,
  `value14` int(11) NOT NULL,
  `value15` int(11) NOT NULL,
  `value2` int(11) NOT NULL,
  `value3` int(11) NOT NULL,
  `value4` int(11) NOT NULL,
  `value5` int(11) NOT NULL,
  `value6` int(11) NOT NULL,
  `value7` int(11) NOT NULL,
  `value8` int(11) NOT NULL,
  `value9` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_working_condition`
--

LOCK TABLES `mes_working_condition` WRITE;
/*!40000 ALTER TABLE `mes_working_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `mes_working_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'erp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-18  8:32:59
