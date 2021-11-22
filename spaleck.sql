-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: spaleck
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb3*/;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `spaleck`
--

/*!40000 DROP DATABASE IF EXISTS `spaleck`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `spaleck` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `spaleck`;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `alerts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` int NOT NULL,
  `description` int NOT NULL,
  `first_occured` datetime NOT NULL,
  `last_occured` datetime NOT NULL,
  `mute` tinyint(1) NOT NULL,
  `ack` int NOT NULL,
  `cleared` tinyint(1) NOT NULL,
  `category` int NOT NULL,
  `checkid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alerts_ibfk_1` (`checkid`),
  CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`checkid`) REFERENCES `checks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `alloc_orders`
--

DROP TABLE IF EXISTS `alloc_orders`;
/*!50001 DROP VIEW IF EXISTS `alloc_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `alloc_orders` AS SELECT 
 1 AS `emplid`,
 1 AS `fname`,
 1 AS `lname`,
 1 AS `card`,
 1 AS `op_name`,
 1 AS `op_id`,
 1 AS `order_name`,
 1 AS `order_id`,
 1 AS `hourlyrate`,
 1 AS `currency`,
 1 AS `unq`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `assets` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `vendor` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `employeeid` int NOT NULL,
  `sn` varchar(100) DEFAULT NULL,
  `catalog_catid` int NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `sn_UNIQUE` (`sn`),
  KEY `fk_assets_employees1_idx` (`employeeid`),
  KEY `fk_assets_catalog1_idx` (`catalog_catid`),
  CONSTRAINT `fk_assets_catalog1` FOREIGN KEY (`catalog_catid`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_assets_employees1` FOREIGN KEY (`employeeid`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `catalog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` enum('product','product_composed','service') NOT NULL,
  `grouping` varchar(50) DEFAULT NULL,
  `unit` varchar(45) NOT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `vat` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `unit` (`unit`),
  KEY `currency` (`currency`),
  CONSTRAINT `catalog_ibfk_1` FOREIGN KEY (`unit`) REFERENCES `units` (`unit`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `catalog_ibfk_2` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (0,'tampon','service',NULL,'ora',0.00,'EUR',1,NULL),(1,'Futterblech Siebkasten / Lagergehäuse / 3D-Combi','product',NULL,'buc',NULL,'EUR',1,NULL),(2,'Futterblech Motor / 3D Combi 833+','product',NULL,'buc',NULL,NULL,1,NULL),(4,'Schubstange / L5450 / Terex','product',NULL,'buc',NULL,NULL,0,NULL),(6,'Winkel AK OB spg.','product',NULL,'buc',NULL,NULL,0,NULL),(7,'Siebkasten / SZWS 1510x6000 / 693+','product',NULL,'buc',NULL,NULL,1,NULL),(11,'Siebtraverse Grundrahmen Abgab / LW 1510','product',NULL,'buc',NULL,NULL,0,NULL),(12,'Siebtraverse Abgabe / LW 1510','product',NULL,'buc',NULL,NULL,1,NULL),(13,'Winkel Halter Rückwand / 693+','product',NULL,'buc',NULL,NULL,1,NULL),(14,'Rückwand / 693+','product',NULL,'buc',NULL,NULL,0,NULL),(16,'Konsole Verlagerung fb / ø114','product',NULL,'buc',NULL,NULL,1,NULL),(17,'Verdrehbare Verlagerung / ø114 / 693+','product',NULL,'buc',NULL,NULL,0,NULL),(18,'Vorfertigung Terex Schutzhaube','product',NULL,'buc',NULL,NULL,1,NULL),(20,'Futterblech / Schwingtraverse 693+','product',NULL,'buc',NULL,NULL,1,NULL),(21,'Transportsicherung / 693+','product',NULL,'buc',NULL,NULL,1,NULL),(22,'Abdichtung Aufgabe','product',NULL,'buc',NULL,NULL,1,NULL),(23,'Abdichtung Aufgabe spg.','product',NULL,'buc',NULL,NULL,1,NULL),(24,'Winkel AK OB 2 spg.','product',NULL,'buc',NULL,NULL,1,NULL),(25,'Winkel AK OB 2','product',NULL,'buc',NULL,NULL,1,NULL),(27,'Konsole Verlagerung Fa / ø114','product',NULL,'buc',NULL,NULL,1,NULL),(28,'Transportöse inkl. Schrauben / Typ SEWU / schmale Ausführung','product',NULL,'buc',NULL,NULL,1,NULL),(29,'Vorrichtung Traverse FSC-Tech / kurz / Fine Side Cover','product',NULL,'buc',NULL,NULL,1,NULL),(30,'Auflage Matte Seitlich','product',NULL,'buc',NULL,NULL,0,NULL),(31,'Auflage Matte Seitlich spg.','product',NULL,'buc',NULL,NULL,0,NULL),(32,'lacatuserie','service','manopera','ora',25.00,'EUR',1,NULL),(33,'sudura','service','manopera','ora',25.00,'EUR',1,NULL),(34,'abkant','service',NULL,'ora',NULL,'EUR',1,NULL),(35,'cai verzi pe pereti','product',NULL,'set',NULL,NULL,1,NULL),(36,'generic','product',NULL,'ora',23.00,'EUR',1,NULL),(37,'abca`','product',NULL,'ora',NULL,NULL,1,NULL),(38,'asd','product_composed',NULL,'buc',NULL,'RON',1,NULL),(39,'Klemmleiste / L1390','product',NULL,'buc',NULL,NULL,1,NULL),(40,'Klemmleiste / L1450','product',NULL,'buc',NULL,NULL,1,NULL),(41,'Aufgabeboden / LW1510 / 693+','product',NULL,'buc',NULL,NULL,1,NULL),(42,'Siebtraverse Grundrahmen FSC / LW 1510 / 683+','product',NULL,'buc',NULL,NULL,1,NULL),(43,'Klemmleiste / L1890','product',NULL,'buc',NULL,NULL,1,NULL),(44,'masina despoiat porumb','product_composed',NULL,'buc',300.00,'EUR',1,NULL),(45,'Test1','product',NULL,'buc',NULL,NULL,1,NULL),(46,'Test 2','product',NULL,'buc',NULL,NULL,1,NULL),(49,'jkljkljkljkljkl','product',NULL,'buc',NULL,NULL,1,NULL),(50,'asdasd','product',NULL,'buc',0.00,'EUR',1,NULL),(51,'Siebtraverse Schwingrahmen FSC / LW1510 / 693+','product',NULL,'buc',NULL,NULL,1,NULL),(52,'Klemmleiste / Siebdurchgang / 693+','product',NULL,'buc',NULL,NULL,1,NULL),(53,'Winkel AK OB','product',NULL,'buc',NULL,NULL,1,NULL),(55,'reper de test','product',NULL,'buc',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_meta`
--

DROP TABLE IF EXISTS `catalog_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `catalog_meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cat_id` int NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `meta_val` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `meta_type` varchar(50) DEFAULT NULL,
  `direct_edit` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`cat_id`,`meta_key`),
  UNIQUE KEY `cat_id` (`cat_id`,`meta_key`),
  CONSTRAINT `catalog_meta_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3350 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_meta`
--

LOCK TABLES `catalog_meta` WRITE;
/*!40000 ALTER TABLE `catalog_meta` DISABLE KEYS */;
INSERT INTO `catalog_meta` VALUES (1,1,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par Gesamtgewicht der 3 Maschinen: 12.100,00Kg\\par\\par ----------\\par }',NULL,1),(2,1,'P.A..PreisbezugMitME','Stk',NULL,1),(3,1,'P.A.E_BelegPos.Artikel','3812930',NULL,1),(4,1,'P.A.E_BelegPos.Einzelpreis','9,90',NULL,1),(5,1,'P.A.E_BelegPos.Menge','6',NULL,1),(6,1,'P.A.E_BelegPos.PF_Gewicht','16,20 kg',NULL,1),(7,1,'P.A.E_BelegPos.PositionsNr','1',NULL,1),(8,1,'P.A.E_BelegPos.Warenwert','59,40',NULL,1),(9,1,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(10,1,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(11,1,'P.A.P_Zeichnung.IndexNr','001',NULL,1),(12,1,'P.A.P_ZeichnungSpr.Zeichnung','1335620',NULL,1),(13,1,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(14,1,'P.A.S_Artikel.Werkstoff','-',NULL,1),(15,1,'P.A.S_ArtikelSpr.Bezeichnung[1]','Futterblech Siebkasten',NULL,1),(16,1,'P.A.S_ArtikelSpr.Bezeichnung[2]','Lagergehäuse',NULL,1),(17,1,'P.A.S_ArtikelSpr.Bezeichnung[3]','3D-Combi',NULL,1),(18,1,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(19,1,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(20,1,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(21,2,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }',NULL,1),(22,2,'P.A..PreisbezugMitME','Stk',NULL,1),(23,2,'P.A.E_BelegPos.Artikel','3812931',NULL,1),(24,2,'P.A.E_BelegPos.Einzelpreis','12,80',NULL,1),(25,2,'P.A.E_BelegPos.Menge','3',NULL,1),(26,2,'P.A.E_BelegPos.PF_Gewicht','10,50 kg',NULL,1),(27,2,'P.A.E_BelegPos.PositionsNr','2',NULL,1),(28,2,'P.A.E_BelegPos.Warenwert','38,40',NULL,1),(29,2,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(30,2,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(31,2,'P.A.P_Zeichnung.IndexNr','001',NULL,1),(32,2,'P.A.P_ZeichnungSpr.Zeichnung','1335622',NULL,1),(33,2,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(34,2,'P.A.S_Artikel.Werkstoff','-',NULL,1),(35,2,'P.A.S_ArtikelSpr.Bezeichnung[1]','Futterblech Motor',NULL,1),(36,2,'P.A.S_ArtikelSpr.Bezeichnung[3]','3D Combi 833+',NULL,1),(37,2,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(38,2,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(39,2,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(59,4,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }',NULL,1),(60,4,'P.A..PreisbezugMitME','Stk',NULL,1),(61,4,'P.A.E_BelegPos.Artikel','3902927',NULL,1),(62,4,'P.A.E_BelegPos.Einzelpreis','352,30',NULL,1),(63,4,'P.A.E_BelegPos.Menge','6',NULL,1),(64,4,'P.A.E_BelegPos.PF_Gewicht','576,00 kg',NULL,1),(65,4,'P.A.E_BelegPos.PositionsNr','4',NULL,1),(66,4,'P.A.E_BelegPos.Warenwert','2.113,80',NULL,1),(67,4,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(68,4,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(69,4,'P.A.P_Zeichnung.IndexNr','004',NULL,1),(70,4,'P.A.P_ZeichnungSpr.Zeichnung','1351073',NULL,1),(71,4,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(72,4,'P.A.S_Artikel.Werkstoff','S355MC / 1.0978',NULL,1),(73,4,'P.A.S_ArtikelSpr.Bezeichnung[1]','Schubstange',NULL,1),(74,4,'P.A.S_ArtikelSpr.Bezeichnung[2]','L5450',NULL,1),(75,4,'P.A.S_ArtikelSpr.Bezeichnung[3]','Terex',NULL,1),(76,4,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(77,4,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(78,4,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(99,6,'P.A..PreisbezugMitME','Stk',NULL,1),(100,6,'P.A.E_BelegPos.Artikel','80079069',NULL,1),(101,6,'P.A.E_BelegPos.Einzelpreis','2,60',NULL,1),(102,6,'P.A.E_BelegPos.Menge','39',NULL,1),(103,6,'P.A.E_BelegPos.PF_Gewicht','27,30 kg',NULL,1),(104,6,'P.A.E_BelegPos.PositionsNr','6',NULL,1),(105,6,'P.A.E_BelegPos.Warenwert','101,40',NULL,1),(106,6,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(107,6,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(108,6,'P.A.P_Zeichnung.IndexNr','000',NULL,1),(109,6,'P.A.P_ZeichnungSpr.Zeichnung','80079069',NULL,1),(110,6,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(111,6,'P.A.S_Artikel.Werkstoff','-',NULL,1),(112,6,'P.A.S_ArtikelSpr.Bezeichnung[1]','Winkel AK OB spg.',NULL,1),(113,6,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(114,6,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(115,6,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(116,7,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }',NULL,1),(117,7,'P.A..PreisbezugMitME','Stk',NULL,1),(118,7,'P.A.E_BelegPos.Artikel','80073942',NULL,1),(119,7,'P.A.E_BelegPos.Einzelpreis','5.689,20',NULL,1),(120,7,'P.A.E_BelegPos.Menge','3',NULL,1),(121,7,'P.A.E_BelegPos.PF_Gewicht','4.638,30 kg',NULL,1),(122,7,'P.A.E_BelegPos.PositionsNr','7',NULL,1),(123,7,'P.A.E_BelegPos.Warenwert','17.067,60',NULL,1),(124,7,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(125,7,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(126,7,'P.A.P_Zeichnung.IndexNr','003',NULL,1),(127,7,'P.A.P_ZeichnungSpr.Zeichnung','80073942',NULL,1),(128,7,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(129,7,'P.A.S_Artikel.Werkstoff','-',NULL,1),(130,7,'P.A.S_ArtikelSpr.Bezeichnung[1]','Siebkasten',NULL,1),(131,7,'P.A.S_ArtikelSpr.Bezeichnung[2]','SZWS 1510x6000',NULL,1),(132,7,'P.A.S_ArtikelSpr.Bezeichnung[3]','693+',NULL,1),(133,7,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(134,7,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(135,7,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(196,11,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }',NULL,1),(197,11,'P.A..PreisbezugMitME','Stk',NULL,1),(198,11,'P.A.E_BelegPos.Artikel','80074067',NULL,1),(199,11,'P.A.E_BelegPos.Einzelpreis','236,40',NULL,1),(200,11,'P.A.E_BelegPos.Menge','3',NULL,1),(201,11,'P.A.E_BelegPos.PF_Gewicht','193,20 kg',NULL,1),(202,11,'P.A.E_BelegPos.PositionsNr','11',NULL,1),(203,11,'P.A.E_BelegPos.Warenwert','709,20',NULL,1),(204,11,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(205,11,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(206,11,'P.A.P_Zeichnung.IndexNr','000',NULL,1),(207,11,'P.A.P_ZeichnungSpr.Zeichnung','80074067',NULL,1),(208,11,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(209,11,'P.A.S_Artikel.Werkstoff','-',NULL,1),(210,11,'P.A.S_ArtikelSpr.Bezeichnung[1]','Siebtraverse Grundrahmen Abgab',NULL,1),(211,11,'P.A.S_ArtikelSpr.Bezeichnung[2]','LW 1510',NULL,1),(212,11,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(213,11,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(214,11,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(215,12,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }',NULL,1),(216,12,'P.A..PreisbezugMitME','Stk',NULL,1),(217,12,'P.A.E_BelegPos.Artikel','80074071',NULL,1),(218,12,'P.A.E_BelegPos.Einzelpreis','432,00',NULL,1),(219,12,'P.A.E_BelegPos.Menge','3',NULL,1),(220,12,'P.A.E_BelegPos.PF_Gewicht','353,10 kg',NULL,1),(221,12,'P.A.E_BelegPos.PositionsNr','12',NULL,1),(222,12,'P.A.E_BelegPos.Warenwert','1.296,00',NULL,1),(223,12,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(224,12,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(225,12,'P.A.P_Zeichnung.IndexNr','001',NULL,1),(226,12,'P.A.P_ZeichnungSpr.Zeichnung','80074071',NULL,1),(227,12,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(228,12,'P.A.S_Artikel.Werkstoff','-',NULL,1),(229,12,'P.A.S_ArtikelSpr.Bezeichnung[1]','Siebtraverse Abgabe',NULL,1),(230,12,'P.A.S_ArtikelSpr.Bezeichnung[2]','LW 1510',NULL,1),(231,12,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(232,12,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(233,12,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(234,13,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }',NULL,1),(235,13,'P.A..PreisbezugMitME','Stk',NULL,1),(236,13,'P.A.E_BelegPos.Artikel','80074103',NULL,1),(237,13,'P.A.E_BelegPos.Einzelpreis','7,70',NULL,1),(238,13,'P.A.E_BelegPos.Menge','6',NULL,1),(239,13,'P.A.E_BelegPos.PF_Gewicht','12,60 kg',NULL,1),(240,13,'P.A.E_BelegPos.PositionsNr','13',NULL,1),(241,13,'P.A.E_BelegPos.Warenwert','46,20',NULL,1),(242,13,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(243,13,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(244,13,'P.A.P_Zeichnung.IndexNr','000',NULL,1),(245,13,'P.A.P_ZeichnungSpr.Zeichnung','80074103',NULL,1),(246,13,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(247,13,'P.A.S_Artikel.Werkstoff','-',NULL,1),(248,13,'P.A.S_ArtikelSpr.Bezeichnung[1]','Winkel Halter Rückwand',NULL,1),(249,13,'P.A.S_ArtikelSpr.Bezeichnung[3]','693+',NULL,1),(250,13,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(251,13,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(252,13,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(253,14,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }',NULL,1),(254,14,'P.A..PreisbezugMitME','Stk',NULL,1),(255,14,'P.A.E_BelegPos.Artikel','80074105',NULL,1),(256,14,'P.A.E_BelegPos.Einzelpreis','250,30',NULL,1),(257,14,'P.A.E_BelegPos.Menge','3',NULL,1),(258,14,'P.A.E_BelegPos.PF_Gewicht','204,90 kg',NULL,1),(259,14,'P.A.E_BelegPos.PositionsNr','14',NULL,1),(260,14,'P.A.E_BelegPos.Warenwert','750,90',NULL,1),(261,14,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(262,14,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(263,14,'P.A.P_Zeichnung.IndexNr','003',NULL,1),(264,14,'P.A.P_ZeichnungSpr.Zeichnung','80074105',NULL,1),(265,14,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(266,14,'P.A.S_Artikel.Werkstoff','-',NULL,1),(267,14,'P.A.S_ArtikelSpr.Bezeichnung[1]','Rückwand',NULL,1),(268,14,'P.A.S_ArtikelSpr.Bezeichnung[3]','693+',NULL,1),(269,14,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(270,14,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(271,14,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(292,16,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }',NULL,1),(293,16,'P.A..PreisbezugMitME','Stk',NULL,1),(294,16,'P.A.E_BelegPos.Artikel','80076877',NULL,1),(295,16,'P.A.E_BelegPos.Einzelpreis','120,00',NULL,1),(296,16,'P.A.E_BelegPos.Menge','6',NULL,1),(297,16,'P.A.E_BelegPos.PF_Gewicht','196,20 kg',NULL,1),(298,16,'P.A.E_BelegPos.PositionsNr','16',NULL,1),(299,16,'P.A.E_BelegPos.Warenwert','720,00',NULL,1),(300,16,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(301,16,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(302,16,'P.A.P_Zeichnung.IndexNr','000',NULL,1),(303,16,'P.A.P_ZeichnungSpr.Zeichnung','80076877',NULL,1),(304,16,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(305,16,'P.A.S_Artikel.Werkstoff','-',NULL,1),(306,16,'P.A.S_ArtikelSpr.Bezeichnung[1]','Konsole Verlagerung fb',NULL,1),(307,16,'P.A.S_ArtikelSpr.Bezeichnung[2]','ø114',NULL,1),(308,16,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(309,16,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(310,16,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(311,17,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }',NULL,1),(312,17,'P.A..PreisbezugMitME','Stk',NULL,1),(313,17,'P.A.E_BelegPos.Artikel','80078596',NULL,1),(314,17,'P.A.E_BelegPos.Einzelpreis','81,50',NULL,1),(315,17,'P.A.E_BelegPos.Menge','12',NULL,1),(316,17,'P.A.E_BelegPos.PF_Gewicht','266,40 kg',NULL,1),(317,17,'P.A.E_BelegPos.PositionsNr','17',NULL,1),(318,17,'P.A.E_BelegPos.Warenwert','978,00',NULL,1),(319,17,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(320,17,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(321,17,'P.A.P_Zeichnung.IndexNr','001',NULL,1),(322,17,'P.A.P_ZeichnungSpr.Zeichnung','80078596',NULL,1),(323,17,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(324,17,'P.A.S_Artikel.Werkstoff','-',NULL,1),(325,17,'P.A.S_ArtikelSpr.Bezeichnung[1]','Verdrehbare Verlagerung',NULL,1),(326,17,'P.A.S_ArtikelSpr.Bezeichnung[2]','ø114',NULL,1),(327,17,'P.A.S_ArtikelSpr.Bezeichnung[3]','693+',NULL,1),(328,17,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(329,17,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(330,17,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(331,18,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }',NULL,1),(332,18,'P.A..PreisbezugMitME','Stk',NULL,1),(333,18,'P.A.E_BelegPos.Artikel','80078710',NULL,1),(334,18,'P.A.E_BelegPos.Einzelpreis','247,00',NULL,1),(335,18,'P.A.E_BelegPos.Menge','3',NULL,1),(336,18,'P.A.E_BelegPos.PF_Gewicht','201,90 kg',NULL,1),(337,18,'P.A.E_BelegPos.PositionsNr','18',NULL,1),(338,18,'P.A.E_BelegPos.Warenwert','741,00',NULL,1),(339,18,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(340,18,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(341,18,'P.A.P_Zeichnung.IndexNr','001',NULL,1),(342,18,'P.A.P_ZeichnungSpr.Zeichnung','80078710',NULL,1),(343,18,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(344,18,'P.A.S_Artikel.Werkstoff','-',NULL,1),(345,18,'P.A.S_ArtikelSpr.Bezeichnung[1]','Vorfertigung Terex Schutzhaube',NULL,1),(346,18,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(347,18,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(348,18,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(423,20,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }',NULL,1),(424,20,'P.A..PreisbezugMitME','Stk',NULL,1),(425,20,'P.A.E_BelegPos.Artikel','80079041',NULL,1),(426,20,'P.A.E_BelegPos.Einzelpreis','3,70',NULL,1),(427,20,'P.A.E_BelegPos.Menge','54',NULL,1),(428,20,'P.A.E_BelegPos.PF_Gewicht','54,00 kg',NULL,1),(429,20,'P.A.E_BelegPos.PositionsNr','23',NULL,1),(430,20,'P.A.E_BelegPos.Warenwert','199,80',NULL,1),(431,20,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(432,20,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(433,20,'P.A.P_Zeichnung.IndexNr','000',NULL,1),(434,20,'P.A.P_ZeichnungSpr.Zeichnung','80079041',NULL,1),(435,20,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(436,20,'P.A.S_Artikel.Werkstoff','-',NULL,1),(437,20,'P.A.S_ArtikelSpr.Bezeichnung[1]','Futterblech',NULL,1),(438,20,'P.A.S_ArtikelSpr.Bezeichnung[3]','Schwingtraverse 693+',NULL,1),(439,20,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(440,20,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(441,20,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(442,21,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }',NULL,1),(443,21,'P.A..PreisbezugMitME','Stk',NULL,1),(444,21,'P.A.E_BelegPos.Artikel','80079043',NULL,1),(445,21,'P.A.E_BelegPos.Einzelpreis','19,50',NULL,1),(446,21,'P.A.E_BelegPos.Menge','12',NULL,1),(447,21,'P.A.E_BelegPos.PF_Gewicht','64,80 kg',NULL,1),(448,21,'P.A.E_BelegPos.PositionsNr','24',NULL,1),(449,21,'P.A.E_BelegPos.Warenwert','234,00',NULL,1),(450,21,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(451,21,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(452,21,'P.A.P_Zeichnung.IndexNr','000',NULL,1),(453,21,'P.A.P_ZeichnungSpr.Zeichnung','80079043',NULL,1),(454,21,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(455,21,'P.A.S_Artikel.Werkstoff','-',NULL,1),(456,21,'P.A.S_ArtikelSpr.Bezeichnung[1]','Transportsicherung',NULL,1),(457,21,'P.A.S_ArtikelSpr.Bezeichnung[3]','693+',NULL,1),(458,21,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(459,21,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(460,21,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(461,22,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }',NULL,1),(462,22,'P.A..PreisbezugMitME','Stk',NULL,1),(463,22,'P.A.E_BelegPos.Artikel','80079046',NULL,1),(464,22,'P.A.E_BelegPos.Einzelpreis','8,10',NULL,1),(465,22,'P.A.E_BelegPos.Menge','3',NULL,1),(466,22,'P.A.E_BelegPos.PF_Gewicht','6,60 kg',NULL,1),(467,22,'P.A.E_BelegPos.PositionsNr','25',NULL,1),(468,22,'P.A.E_BelegPos.Warenwert','24,30',NULL,1),(469,22,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(470,22,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(471,22,'P.A.P_Zeichnung.IndexNr','001',NULL,1),(472,22,'P.A.P_ZeichnungSpr.Zeichnung','80079046',NULL,1),(473,22,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(474,22,'P.A.S_Artikel.Werkstoff','-',NULL,1),(475,22,'P.A.S_ArtikelSpr.Bezeichnung[1]','Abdichtung Aufgabe',NULL,1),(476,22,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(477,22,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(478,22,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(479,23,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }',NULL,1),(480,23,'P.A..PreisbezugMitME','Stk',NULL,1),(481,23,'P.A.E_BelegPos.Artikel','80079064',NULL,1),(482,23,'P.A.E_BelegPos.Einzelpreis','8,10',NULL,1),(483,23,'P.A.E_BelegPos.Menge','3',NULL,1),(484,23,'P.A.E_BelegPos.PF_Gewicht','6,60 kg',NULL,1),(485,23,'P.A.E_BelegPos.PositionsNr','26',NULL,1),(486,23,'P.A.E_BelegPos.Warenwert','24,30',NULL,1),(487,23,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(488,23,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(489,23,'P.A.P_Zeichnung.IndexNr','001',NULL,1),(490,23,'P.A.P_ZeichnungSpr.Zeichnung','80079064',NULL,1),(491,23,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(492,23,'P.A.S_Artikel.Werkstoff','-',NULL,1),(493,23,'P.A.S_ArtikelSpr.Bezeichnung[1]','Abdichtung Aufgabe spg.',NULL,1),(494,23,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(495,23,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(496,23,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(497,24,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }',NULL,1),(498,24,'P.A..PreisbezugMitME','Stk',NULL,1),(499,24,'P.A.E_BelegPos.Artikel','80079065',NULL,1),(500,24,'P.A.E_BelegPos.Einzelpreis','2,90',NULL,1),(501,24,'P.A.E_BelegPos.Menge','3',NULL,1),(502,24,'P.A.E_BelegPos.PF_Gewicht','2,40 kg',NULL,1),(503,24,'P.A.E_BelegPos.PositionsNr','27',NULL,1),(504,24,'P.A.E_BelegPos.Warenwert','8,70',NULL,1),(505,24,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(506,24,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(507,24,'P.A.P_Zeichnung.IndexNr','000',NULL,1),(508,24,'P.A.P_ZeichnungSpr.Zeichnung','80079065',NULL,1),(509,24,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(510,24,'P.A.S_Artikel.Werkstoff','-',NULL,1),(511,24,'P.A.S_ArtikelSpr.Bezeichnung[1]','Winkel AK OB 2 spg.',NULL,1),(512,24,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(513,24,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(514,24,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(515,25,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }',NULL,1),(516,25,'P.A..PreisbezugMitME','Stk',NULL,1),(517,25,'P.A.E_BelegPos.Artikel','80079074',NULL,1),(518,25,'P.A.E_BelegPos.Einzelpreis','2,90',NULL,1),(519,25,'P.A.E_BelegPos.Menge','3',NULL,1),(520,25,'P.A.E_BelegPos.PF_Gewicht','2,40 kg',NULL,1),(521,25,'P.A.E_BelegPos.PositionsNr','28',NULL,1),(522,25,'P.A.E_BelegPos.Warenwert','8,70',NULL,1),(523,25,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(524,25,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(525,25,'P.A.P_Zeichnung.IndexNr','000',NULL,1),(526,25,'P.A.P_ZeichnungSpr.Zeichnung','80079074',NULL,1),(527,25,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(528,25,'P.A.S_Artikel.Werkstoff','-',NULL,1),(529,25,'P.A.S_ArtikelSpr.Bezeichnung[1]','Winkel AK OB 2',NULL,1),(530,25,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(531,25,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(532,25,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(551,27,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par\\par }',NULL,1),(552,27,'P.A..PreisbezugMitME','Stk',NULL,1),(553,27,'P.A.E_BelegPos.Artikel','80079083',NULL,1),(554,27,'P.A.E_BelegPos.Einzelpreis','120,00',NULL,1),(555,27,'P.A.E_BelegPos.Menge','6',NULL,1),(556,27,'P.A.E_BelegPos.PF_Gewicht','196,20 kg',NULL,1),(557,27,'P.A.E_BelegPos.PositionsNr','30',NULL,1),(558,27,'P.A.E_BelegPos.Warenwert','720,00',NULL,1),(559,27,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(560,27,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(561,27,'P.A.P_Zeichnung.IndexNr','000',NULL,1),(562,27,'P.A.P_ZeichnungSpr.Zeichnung','80079083',NULL,1),(563,27,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(564,27,'P.A.S_Artikel.Werkstoff','-',NULL,1),(565,27,'P.A.S_ArtikelSpr.Bezeichnung[1]','Konsole Verlagerung Fa',NULL,1),(566,27,'P.A.S_ArtikelSpr.Bezeichnung[2]','ø114',NULL,1),(567,27,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(568,27,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(569,27,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(570,28,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }',NULL,1),(571,28,'P.A..PreisbezugMitME','Stk',NULL,1),(572,28,'P.A.E_BelegPos.Artikel','80079089',NULL,1),(573,28,'P.A.E_BelegPos.Einzelpreis','39,30',NULL,1),(574,28,'P.A.E_BelegPos.Menge','12',NULL,1),(575,28,'P.A.E_BelegPos.PF_Gewicht','128,40 kg',NULL,1),(576,28,'P.A.E_BelegPos.PositionsNr','31',NULL,1),(577,28,'P.A.E_BelegPos.Warenwert','471,60',NULL,1),(578,28,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(579,28,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(580,28,'P.A.P_Zeichnung.IndexNr','000',NULL,1),(581,28,'P.A.P_ZeichnungSpr.Zeichnung','80079089',NULL,1),(582,28,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(583,28,'P.A.S_Artikel.Werkstoff','-',NULL,1),(584,28,'P.A.S_ArtikelSpr.Bezeichnung[1]','Transportöse inkl. Schrauben',NULL,1),(585,28,'P.A.S_ArtikelSpr.Bezeichnung[2]','Typ SEWU',NULL,1),(586,28,'P.A.S_ArtikelSpr.Bezeichnung[3]','schmale Ausführung',NULL,1),(587,28,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(588,28,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(589,28,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(610,29,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }',NULL,1),(611,29,'P.A..PreisbezugMitME','Stk',NULL,1),(612,29,'P.A.E_BelegPos.Artikel','80044766',NULL,1),(613,29,'P.A.E_BelegPos.Einzelpreis','7,70',NULL,1),(614,29,'P.A.E_BelegPos.Menge','114',NULL,1),(615,29,'P.A.E_BelegPos.PF_Gewicht','239,40 kg',NULL,1),(616,29,'P.A.E_BelegPos.PositionsNr','33',NULL,1),(617,29,'P.A.E_BelegPos.Warenwert','877,80',NULL,1),(618,29,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(619,29,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(620,29,'P.A.P_Zeichnung.IndexNr','000',NULL,1),(621,29,'P.A.P_ZeichnungSpr.Zeichnung','80044766',NULL,1),(622,29,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(623,29,'P.A.S_Artikel.Werkstoff','-',NULL,1),(624,29,'P.A.S_ArtikelSpr.Bezeichnung[1]','Vorrichtung Traverse FSC-Tech',NULL,1),(625,29,'P.A.S_ArtikelSpr.Bezeichnung[2]','kurz',NULL,1),(626,29,'P.A.S_ArtikelSpr.Bezeichnung[3]','Fine Side Cover',NULL,1),(627,29,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(628,29,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(629,29,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(630,30,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }',NULL,1),(631,30,'P.A..PreisbezugMitME','Stk',NULL,1),(632,30,'P.A.E_BelegPos.Artikel','80079075',NULL,1),(633,30,'P.A.E_BelegPos.Einzelpreis','1,80',NULL,1),(634,30,'P.A.E_BelegPos.Menge','3',NULL,1),(635,30,'P.A.E_BelegPos.PF_Gewicht','1,50 kg',NULL,1),(636,30,'P.A.E_BelegPos.PositionsNr','34',NULL,1),(637,30,'P.A.E_BelegPos.Warenwert','5,40',NULL,1),(638,30,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(639,30,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(640,30,'P.A.P_Zeichnung.IndexNr','001',NULL,1),(641,30,'P.A.P_ZeichnungSpr.Zeichnung','80079075',NULL,1),(642,30,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(643,30,'P.A.S_Artikel.Werkstoff','-',NULL,1),(644,30,'P.A.S_ArtikelSpr.Bezeichnung[1]','Auflage Matte Seitlich',NULL,1),(645,30,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(646,30,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(647,30,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(648,31,'P.A..EBELP','{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }',NULL,1),(649,31,'P.A..PreisbezugMitME','Stk',NULL,1),(650,31,'P.A.E_BelegPos.Artikel','80079066',NULL,1),(651,31,'P.A.E_BelegPos.Einzelpreis','1,80',NULL,1),(652,31,'P.A.E_BelegPos.Menge','3',NULL,1),(653,31,'P.A.E_BelegPos.PF_Gewicht','1,50 kg',NULL,1),(654,31,'P.A.E_BelegPos.PositionsNr','35',NULL,1),(655,31,'P.A.E_BelegPos.Warenwert','5,40',NULL,1),(656,31,'P.A.E_BelegPos.wert_RZ_2','0,00',NULL,1),(657,31,'P.A.E_BelegPos.WunschTermin','21.08.2020',NULL,1),(658,31,'P.A.P_Zeichnung.IndexNr','002',NULL,1),(659,31,'P.A.P_ZeichnungSpr.Zeichnung','80079066',NULL,1),(660,31,'P.A.S_Artikel.DIN_ISO','-',NULL,1),(661,31,'P.A.S_Artikel.Werkstoff','-',NULL,1),(662,31,'P.A.S_ArtikelSpr.Bezeichnung[1]','Auflage Matte Seitlich spg.',NULL,1),(663,31,'P.A.S_MengenEinheitSpr.KurzBez','Stk',NULL,1),(664,31,'P.A.S_PreisEinheitSpr.KurzBez','E',NULL,1),(665,31,'P.A.S_WaehrungSpr.Kurzbez','€',NULL,1),(1796,7,'a','10',NULL,1),(1800,39,'P.A.E_BelegPos.Artikel','3900089',NULL,1),(1802,39,'P.A.P_ZeichnungSpr.Zeichnung','1002276',NULL,1),(1805,40,'P.A.E_BelegPos.Artikel','3903239',NULL,1),(1807,40,'P.A.P_ZeichnungSpr.Zeichnung','1454845',NULL,1),(1812,41,'P.A.E_BelegPos.Artikel','80073945',NULL,1),(1814,41,'P.A.P_ZeichnungSpr.Zeichnung','80073945',NULL,1),(1815,42,'P.A.E_BelegPos.Artikel','80074019',NULL,1),(1816,42,'P.A.P_ZeichnungSpr.Zeichnung','80074019',NULL,1),(1835,43,'P.A.E_BelegPos.Artikel','80078997',NULL,1),(1838,43,'P.A.P_ZeichnungSpr.Zeichnung','80078997',NULL,1),(3137,42,'Abc','sdas',NULL,1),(3154,51,'P.A.E_BelegPos.Artikel','80074017',NULL,1),(3155,51,'P.A.P_ZeichnungSpr.Zeichnung','80074017',NULL,1),(3166,52,'P.A.E_BelegPos.Artikel','80074121',NULL,1),(3167,52,'P.A.P_ZeichnungSpr.Zeichnung','80074121',NULL,1),(3194,53,'P.A.E_BelegPos.Artikel','80079076',NULL,1),(3195,53,'P.A.P_ZeichnungSpr.Zeichnung','80079076',NULL,1),(3348,2,'propietate de test1','2',NULL,1),(3349,55,'propietate de test2','5',NULL,1);
/*!40000 ALTER TABLE `catalog_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cnt_ttrecs_big_duration`
--

DROP TABLE IF EXISTS `cnt_ttrecs_big_duration`;
/*!50001 DROP VIEW IF EXISTS `cnt_ttrecs_big_duration`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `cnt_ttrecs_big_duration` AS SELECT 
 1 AS `id`,
 1 AS `num`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cnt_ttrecs_not_alloc`
--

DROP TABLE IF EXISTS `cnt_ttrecs_not_alloc`;
/*!50001 DROP VIEW IF EXISTS `cnt_ttrecs_not_alloc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `cnt_ttrecs_not_alloc` AS SELECT 
 1 AS `id`,
 1 AS `cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `conturi_contabile`
--

DROP TABLE IF EXISTS `conturi_contabile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `conturi_contabile` (
  `cont` varchar(20) NOT NULL,
  `denumire` varchar(30) NOT NULL,
  `parent` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cont`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conturi_contabile`
--

LOCK TABLES `conturi_contabile` WRITE;
/*!40000 ALTER TABLE `conturi_contabile` DISABLE KEYS */;
/*!40000 ALTER TABLE `conturi_contabile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `currencies` (
  `id` varchar(10) NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `prio` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES ('EUR','EURO',10),('RON','Romanian Leu',9);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_series`
--

DROP TABLE IF EXISTS `currency_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `currency_series` (
  `currency` varchar(10) NOT NULL,
  `ts` datetime NOT NULL,
  UNIQUE KEY `unq` (`currency`,`ts`),
  KEY `fk_currency_series_currencies1_idx` (`currency`),
  KEY `ts` (`ts`),
  CONSTRAINT `fk_currency_series_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_series`
--

LOCK TABLES `currency_series` WRITE;
/*!40000 ALTER TABLE `currency_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `deliveries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `status` enum('created','loading','ready','delivered','received','canceled') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'created',
  `dlv_date` date DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastupdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,'test','loading','2021-09-21','2021-09-20 06:42:23','2021-09-20 06:42:23'),(2,'test','loading','2021-09-21','2021-09-20 06:43:07','2021-09-20 06:43:07'),(3,'test1','created','2021-09-20','2021-09-20 07:18:03','2021-09-20 07:31:08'),(4,'Faza1','received','2021-09-20','2021-09-20 12:27:42','2021-09-20 12:28:27'),(5,'test2','created','2021-09-30','2021-09-21 07:38:18','2021-09-21 07:38:18'),(6,'dfsdfs','delivered','2021-09-24','2021-09-21 07:38:47','2021-09-24 05:40:57'),(8,'prenume5','canceled','2021-11-22','2021-09-21 14:30:12','2021-09-24 05:45:08'),(9,'test01','received','2021-12-22','2021-09-22 12:36:13','2021-09-24 05:41:21'),(11,'number 3','received','2021-09-24','2021-09-24 05:41:47','2021-09-24 05:43:43'),(13,'ghbebnt b','delivered','2021-09-30','2021-09-24 05:42:48','2021-09-24 05:44:11'),(14,'test3','delivered','2021-09-21','2021-09-24 06:44:05','2021-10-05 11:59:05'),(17,'test67','received','2021-09-21','2021-09-24 06:44:43','2021-09-28 12:52:40'),(19,'test77','created','2021-09-27','2021-09-27 05:22:59','2021-09-27 05:22:59'),(20,'dfhthjh','created','2021-09-27','2021-09-27 09:29:34','2021-09-27 09:29:34'),(21,'fsdfsdfsdf','delivered','2020-08-13','2021-10-11 13:00:29','2021-10-11 13:46:24'),(22,'dsfdsf','created','2021-10-12','2021-10-12 09:41:12','2021-10-12 09:41:12'),(23,'final','created','2021-12-31','2021-10-12 10:15:02','2021-10-12 10:15:02');
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries_contents`
--

DROP TABLE IF EXISTS `deliveries_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `deliveries_contents` (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `delivery` int NOT NULL,
  `item` int NOT NULL,
  `seqno` int unsigned DEFAULT NULL,
  `label_printed` tinyint(1) NOT NULL DEFAULT '0',
  `checkout` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item` (`item`) USING BTREE,
  KEY `delivery` (`delivery`),
  CONSTRAINT `deliveries_contents_ibfk_1` FOREIGN KEY (`delivery`) REFERENCES `deliveries` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `deliveries_contents_ibfk_2` FOREIGN KEY (`item`) REFERENCES `orders_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries_contents`
--

LOCK TABLES `deliveries_contents` WRITE;
/*!40000 ALTER TABLE `deliveries_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveries_contents` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `create_sqqno` BEFORE INSERT ON `deliveries_contents` FOR EACH ROW BEGIN
	
	SELECT count(*) +1 INTO @seqno from deliveries_contents where delivery=NEW.delivery and item=NEW.item;
    SET NEW.seqno=@seqno;
    
    SET NEW.id=CONCAT(LPAD(NEW.delivery,6,"0"),".",LPAD(NEW.item,5,"0"),".",LPAD(NEW.seqno,3,"0"));
    
    UPDATE orders_items SET dlvd_qty=dlvd_qty+1 WHERE id=NEW.item;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `decrement_dlvd_qty` AFTER DELETE ON `deliveries_contents` FOR EACH ROW BEGIN
	UPDATE orders_items SET dlvd_qty=dlvd_qty-1 WHERE id=OLD.item;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;

--
-- Temporary view structure for view `deliveries_contents_notdlvd`
--

DROP TABLE IF EXISTS `deliveries_contents_notdlvd`;
/*!50001 DROP VIEW IF EXISTS `deliveries_contents_notdlvd`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `deliveries_contents_notdlvd` AS SELECT 
 1 AS `id`,
 1 AS `delivery`,
 1 AS `item`,
 1 AS `seqno`,
 1 AS `label_printed`,
 1 AS `checkout`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `deliveries_labels`
--

DROP TABLE IF EXISTS `deliveries_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `deliveries_labels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content_id` int NOT NULL,
  `content` text NOT NULL,
  `seq` int NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `printed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries_labels`
--

LOCK TABLES `deliveries_labels` WRITE;
/*!40000 ALTER TABLE `deliveries_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveries_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `delivery_items_aggregated`
--

DROP TABLE IF EXISTS `delivery_items_aggregated`;
/*!50001 DROP VIEW IF EXISTS `delivery_items_aggregated`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `delivery_items_aggregated` AS SELECT 
 1 AS `code`,
 1 AS `delivery`,
 1 AS `label`,
 1 AS `item`,
 1 AS `totalcnt`,
 1 AS `printed`,
 1 AS `checkout`,
 1 AS `notprinted`,
 1 AS `notcheckout`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `docnum` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `issued_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `partners_id` int DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_documents_users1_idx` (`user_id`),
  KEY `fk_documents_partners1_idx` (`partners_id`),
  KEY `type` (`type`),
  CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`type`) REFERENCES `settings_document_types` (`type`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_documents_partners1` FOREIGN KEY (`partners_id`) REFERENCES `partners` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_documents_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (0,'A0000','2021-10-13 08:02:28','admin',0,'order'),(3,'A239','2021-09-17 07:28:19','admin',NULL,'order'),(43,'A1053','2021-10-13 07:47:30','vsergione',2,'order'),(44,'A1054','2021-10-13 07:51:35','vsergione',2,'order'),(45,'A1055','2021-10-13 07:51:35','vsergione',2,'order'),(46,'A1056','2021-10-13 07:51:35','vsergione',2,'order'),(47,'A1057','2021-10-13 07:51:35','vsergione',2,'order'),(48,'A1058','2021-10-13 07:51:35','vsergione',2,'order'),(49,'A1059','2021-10-13 07:51:35','vsergione',2,'order'),(50,'A1060','2021-10-13 07:51:35','vsergione',2,'order'),(51,'A1061','2021-10-13 07:51:35','vsergione',2,'order'),(52,'A1062','2021-10-13 07:51:35','vsergione',2,'order'),(53,'A1063','2021-10-13 07:51:35','vsergione',2,'order'),(54,'A1064','2021-10-13 07:51:35','vsergione',2,'order'),(55,'A1065','2021-10-13 07:51:36','vsergione',2,'order'),(56,'A1066','2021-10-13 07:51:36','vsergione',2,'order'),(57,'A1067','2021-10-13 07:51:36','vsergione',2,'order'),(58,'A1068','2021-10-13 07:51:36','vsergione',2,'order'),(59,'A1069','2021-10-13 07:51:36','vsergione',2,'order'),(60,'A1070','2021-10-13 07:51:36','vsergione',2,'order'),(61,'A1071','2021-10-13 07:51:36','vsergione',2,'order'),(62,'A1072','2021-10-13 07:51:36','vsergione',2,'order'),(63,'A1073','2021-10-13 07:51:36','vsergione',2,'order'),(64,'A1074','2021-10-13 07:51:36','vsergione',2,'order'),(65,'A1075','2021-10-13 07:51:36','vsergione',2,'order'),(66,'A1076','2021-10-13 07:51:36','vsergione',2,'order'),(67,'A1077','2021-10-13 07:51:36','vsergione',2,'order'),(68,'A1078','2021-10-13 07:51:36','vsergione',2,'order'),(69,'A1079','2021-10-13 07:51:36','vsergione',2,'order'),(70,'A1080','2021-10-13 07:51:36','vsergione',2,'order'),(71,'A1081','2021-10-13 07:51:36','vsergione',2,'order'),(72,'A1082','2021-10-13 07:51:36','vsergione',2,'order'),(73,'A1083','2021-10-13 07:51:36','vsergione',2,'order'),(74,'A1084','2021-10-13 07:51:36','vsergione',2,'order'),(77,'A1085','2021-10-13 08:15:16','vsergione',2,'order'),(80,'A1086','2021-10-14 05:18:08','vsergione',2,'order'),(83,'A1087','2021-10-18 07:17:01','vsergione',2,'order'),(84,'A1088','2021-10-18 07:20:37','vsergione',2,'order'),(85,'A1089','2021-10-18 07:24:16','vsergione',2,'order'),(89,'A1090','2021-10-19 08:38:09','admin',2,'order'),(90,'A1091','2021-10-19 08:42:07','admin',2,'order'),(91,'A1092','2021-10-19 08:47:06','admin',2,'order'),(92,'A1093','2021-10-19 08:49:57','admin',2,'order'),(98,'A1094','2021-10-21 07:38:16','admin',2,'order'),(99,'A1095','2021-10-21 07:40:24','admin',2,'order'),(100,'A1096','2021-10-21 07:42:06','admin',2,'order'),(101,'A0tst1','2021-10-21 10:17:14','vsergione',0,'order'),(102,'A1097','2021-10-22 11:31:06','vsergione',2,'order'),(103,'A1098','2021-10-22 11:32:04','vsergione',2,'order'),(104,'A1099','2021-10-22 11:33:08','vsergione',2,'order'),(105,'A1100','2021-10-22 11:33:59','vsergione',2,'order'),(106,'A1101','2021-10-29 10:41:21','admin',2,'order'),(107,'A1102','2021-10-29 10:45:01','admin',2,'order'),(108,'A1103','2021-10-29 10:47:34','admin',2,'order'),(109,'A1104','2021-10-29 10:49:28','admin',2,'order'),(110,'A1105','2021-10-29 10:51:25','admin',2,'order'),(111,'A1106','2021-10-29 10:53:07','admin',2,'order'),(112,'A1109','2021-11-10 12:11:53','admin',2,'order'),(113,'A1110','2021-11-10 12:12:54','admin',2,'order'),(114,'A1111','2021-11-10 12:15:44','admin',2,'order'),(115,'A1112','2021-11-10 12:16:21','admin',2,'order'),(116,'A1113','2021-11-10 12:17:06','admin',2,'order'),(117,'A1114','2021-11-10 12:17:40','admin',2,'order'),(118,'A1115','2021-11-10 12:18:23','admin',2,'order');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `gen_docnum` BEFORE INSERT ON `documents` FOR EACH ROW IF(NEW.docnum is NULL) THEN
	SELECT concat(series, lastissued+1) INTO @docnum FROM settings_document_numbers WHERE type=NEW.type AND validfrom<CURRENT_TIMESTAMP() and validto>CURRENT_TIMESTAMP() and (maxval is null or maxval>=lastissued+1);
    IF(@cnt != 1 ) THEN
    	signal sqlstate '45010' set message_text = 'Nu a putut fi generat numar de document';
    END IF; 
    SET NEW.docnum = @docnum;
    UPDATE settings_document_numbers set lastissued=lastissued+1 WHERE type=NEW.type ;     
   
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;

--
-- Temporary view structure for view `emplToOrdAssoc`
--

DROP TABLE IF EXISTS `emplToOrdAssoc`;
/*!50001 DROP VIEW IF EXISTS `emplToOrdAssoc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `emplToOrdAssoc` AS SELECT 
 1 AS `id`,
 1 AS `oid`,
 1 AS `status`,
 1 AS `docnum`,
 1 AS `opname`,
 1 AS `hourlyrate`,
 1 AS `currency`,
 1 AS `fname`,
 1 AS `lname`,
 1 AS `emplid`,
 1 AS `label`,
 1 AS `opid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `bdate` date NOT NULL,
  `cnp` varchar(15) NOT NULL,
  `address_1` varchar(45) NOT NULL,
  `address_2` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `postcode` int unsigned DEFAULT NULL,
  `county` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL DEFAULT 'Romania',
  `userid` varchar(20) DEFAULT NULL,
  `docs` text,
  `team` int DEFAULT NULL,
  `jobtitle` varchar(50) NOT NULL,
  `card` varchar(30) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_UNIQUE` (`userid`),
  UNIQUE KEY `card` (`card`),
  KEY `fk_employees_users1_idx` (`userid`),
  KEY `fk_employees_table11_idx` (`team`),
  KEY `employees_ibfk_2` (`jobtitle`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`team`) REFERENCES `teams` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`jobtitle`) REFERENCES `jobs` (`codcor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_employees_users1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (8,'Petru','Cercel','1979-05-11','1790511113709','Campului 32','','Ghiroda',307200,'Timis','Romania',NULL,NULL,NULL,'721410',NULL,1),(75,'Veroniu','Daniel','1989-08-19','','',NULL,'Timisoara',NULL,'','Romania',NULL,NULL,NULL,'311306',NULL,1),(86,'Ion','Miron','1968-01-29','1680129221270','Bucegi nr. 2, bl. 2, sc. 2, ap. 5',NULL,'Bocsa',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'721410','0003972100',1),(87,'Eugen','Baierle','1964-05-29','1640529113688','Al. Tineretului nr.3 ','bl. 3 sc. 1 ap. 108','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,4,'721410','0003781260',1),(88,'Camelia Marinela','Leinstein','1978-12-26','2781226354728','Castanilor nr. 113',NULL,'Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'412001',NULL,1),(89,'Anton','Holecz','1962-09-11','1620911113670','Fagarasului nr. 28',NULL,'Resita',NULL,'Caras-Severin','Romania',NULL,NULL,4,'721410','0008222964',1),(90,'Viorel','Pricope','1962-02-02','1620202113699','B-dul. A.I. Cuza','bl. E2, sc. 1, ap. 13','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'713202','0000697423',1),(91,'Florea','Talapin','1972-04-04','1720404167333','B-dul. Republicii','bl. 19, sc. 1, et. 9, ap. 36','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,3,'721208','00013619365',1),(92,'Venica','Ababei','1967-08-26','1670826225672','Garoafelor nr. 1',NULL,'Bocsa',NULL,'Caras-Severin','Romania',NULL,NULL,2,'721208','000441096',1),(93,'Damaschin','Penda','1965-07-28','1650728112515','Progresului nr. 3','bl. 3, sc. 1, et. 8, ap. 36','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'721410','000373010',1),(94,'Ionel','Lungu','1979-09-07','1790907110653','Petru Maior nr. 30B','sc. 1, et. 2, ap. 4','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'722202','0003766810',1),(95,'Stefan-Viorel','Babaioana','1964-05-20','1640520113675','Zarandului nr. 2','sc. C, et. 4, ap. 10','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'722408','0008401587',1),(96,'Robert-Valentin','Chelariu','1987-09-23','1870923114255','Caen nr. 7','sc. 2, et 2, ap. 9','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'121120','0008395308',1),(97,'Costica','Leica','1962-06-10','1620610110137','Bucegi','bl. 3, sc. 2, ap. 4','Bocsa',NULL,'Caras-Severin','Romania',NULL,NULL,2,'721410','000688333',1),(98,'Cornel Viorel','Grosu','1961-06-07','1610607113699','Peleaga nr. 4','sc. 1, et. 2, ap. 26','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'721410','0003705775',1),(99,'Ion-Gigi','Militaru','1968-07-21','1680721113678','Gladiolelor nr. 5','sc. 1, et. 5, ap. 24','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,1,'721208','0003765573',1),(100,'Dorin Constantin','Ban','1963-09-02','1630902113676','Petru Maior nr. 75','sc. 1, et. 2, ap. 8','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'721410','0004008132',1),(101,'Iosif Emil','Hodorog','1985-08-20','1850820115179','Rev. din Decembrie','bl. 30, sc. 2, et. 4, ap. 19','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'722323','0007168158',1),(102,'Razvan Sebastian','Sest','1994-11-25','1941125115176','B-dul. Republicii nr. 6','sc. 4, et. 6, ap. 21','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'214401','0003273653',1),(103,'Daniel Florian','Piperca','1979-02-25','1790225160019','B-dul. Republicii nr. 4','sc. 5, et. 8, ap. 36','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,3,'721208','0007171744',1),(104,'Ion Gheorghe','Pascota','1969-12-26','1671226112507','Albastrelelor nr. 4','sc. 2, et. 3, ap. 40','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,1,'721410','0007171738',1),(105,'Rodica Lucretia','Bogdan','1973-02-09','2730209110138','Eroilor nr. 17',NULL,'Bocsa',NULL,'Caras-Severin','Romania',NULL,NULL,2,'721208','00015540758',1),(106,'Christian-Mihai','Rain','1994-11-29','1941129115193','Izvorului nr. 6',NULL,'Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'214401','0015534950',1),(107,'Ion Lucian','Bugarin','1966-11-28','1661128110131','Rev. din Decembrie nr. 31','sc. 3, ap. 5','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,1,'721410','00015531250',1),(108,'Jean','Andrita','1967-08-03','1670803253209','Suruianu nr. 1','sc. 1, et. 7, ap. 25','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,3,'721410','00015544512',1),(109,'Iosif','Colojoara','2000-02-28','5000228115174','nr. 81','ap. 1','Secu',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'721412','0003536246',1),(110,'Petru','Pinzariu','1966-06-16','1660616070012','Turturelelor nr. 2','sc. B, et. 4, ap. 9','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,4,'721410','0003536249',1),(111,'Lucian Aurel','Dalea','1967-09-18','1670918110165','Mircea cel Batran nr. 36',NULL,'Bocsa',NULL,'Caras-Severin','Romania',NULL,NULL,2,'721410','0003166126',1),(112,'Marinel','Enuica','1962-05-18','1620518113683','Al. Zadei','bl. F3A, sc. 1, et. 1, ap. 4','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'722323','0003166053',1),(113,'Mircea Octav','Apetrei','1970-02-14','1670214113674','Vulturilor nr. 30',NULL,'Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'721410','0004089564',1),(114,'Lidia','Nedeloni','1990-06-17','2900617114592','Al. Hunedoara nr. 6','bl. 6, sc. 1, et. 3, ap. 14','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'214207','0008416760',1),(115,'Florin','Mocanu','1968-07-12','1680712110135','Al. Trandafirilor','bl. 4, sc. 1, ap. 19  ','Bocsa',NULL,'Caras-Severin','Romania',NULL,NULL,5,'721410','0008394363',1),(116,'Sergiu Costel','Culiniac','1986-09-09','1860909114252','Rev. din Decembrie nr. 15','sc.1, et. 4, ap. 29','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'722323','0008412794',1),(117,'Teodor Dorel','Pelic','1996-05-23','1960523114558','nr. 221',NULL,'Forotic',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'244523','0007168221',1),(118,'Nicolae','Gociu','1983-01-25','1830125115201','B-dul. Republicii','bl. 18, sc. B, et. 8, ap. 29','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,4,'721208','0008411327',1),(119,'Ionut-Flavius','Istudor','1995-07-27','1950727114240','Fagarasului nr. 11','et. 1, ap. 5','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'214401','0008394382',1),(120,'Mihai','Kovacs','1968-07-08','1680708113692','B-dul. Republicii nr. 4','sc. 5, et. 8, ap. 34','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'721412','0008412799',1),(121,'Leonard','Chelariu','1964-08-21','1640822112530','Sarmisegetusa nr. 9','bl. 9, et. 8, ap. 29','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,3,'721410','0008415163',1),(122,'Tasia','Chelariu','1968-08-28','2680828040068','Sarmisegetusa nr. 9','bl. 9, et. 8, ap. 29','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'911201','0008415164',1),(123,'Zoltan','Kovacs','1965-11-13','1651113113672','B-dul. Republicii nr. 27','sc. 5, et. 9, ap. 34','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'721410','0008401577',1),(124,'Silviu Alexandru','Tugui','1994-08-28','1940828115216','nr. 223',NULL,'Doman',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'721410','0003271789',1),(125,'Ion','Mitrik','1947-07-10','1740710113673','Al. Godeanului nr. 1','sc. B, et. 3, ap. 9','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,4,'721410','0006639235',1),(126,'Claudiu-Vasile','Cozma','1969-10-07','1691007110014','Dealul Frumos nr. 13',NULL,'Anina',NULL,'Caras-Severin','Romania',NULL,NULL,1,'721410','0003155992',1),(127,'Simon Daniel','Pop','2003-10-16','5031016115171','Panselutei nr. 1','sc. 2, et. 2, ap. 6','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'722323','0003155987',1),(128,'Ionut Alexandru','Telescu','2003-09-18','5030918114249','nr. 334',NULL,'Carbunari',NULL,'Caras-Severin','Romania',NULL,NULL,5,'721208','0003155969',1),(129,'Vasile Gabriel','Moisa','1980-03-07','1800307134154','Rarau nr. 5','sc. 1, ap. 4','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'722429','0003260311',1),(130,'Cristian Gheorghita','Galatanu','1994-02-23','1940223115173','Turturelelor nr. 31','ap. 1','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'932911','0003167078',1),(131,'Doru','Pirescu','1980-06-11','1800611115215','Col. Mierlei nr. 7',NULL,'Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'932911','0008394373',1),(132,'Razvan Florin','Istudor','2000-04-20','5000420114258','Rodnei nr. 11','sc. D, et. 1, ap. 4','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'932911','0008394376',1),(133,'Aurel Florin','Galatanu','1989-05-11','1890511115207','Col. Mierlei nr. 8',NULL,'Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'932911','0008409324',1),(134,'Daniel Iulian','Zamferoiu','1995-09-01','1950901115189','Pomostului','bl. B7, sc. 1, et. 4, ap. 13','Resita',NULL,'Caras-Severin','Romania',NULL,NULL,2,'932911','0008395309',1),(135,'Vasile','Gutu','1962-10-18','1621018113694','Dorna nr. 6',NULL,'Resita',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'932911','0008401582',1),(136,'Florin Ioan','Heler','1989-04-12','1890412115185','nr. 47',NULL,'Doman',NULL,'Caras-Severin','Romania',NULL,NULL,NULL,'932911','0006587785',1),(140,'Lucian','Rusinaru','2011-11-11','','',NULL,'',NULL,'','Romania',NULL,NULL,5,'721410','0003271798',1),(141,'Victor','Predescu','2011-11-11','','',NULL,'',NULL,'','Romania',NULL,NULL,3,'721410','00015531480',1),(142,'John','Doe','1988-07-06','','',NULL,'',NULL,'','Romania',NULL,NULL,NULL,'242425','121212',1),(144,'GAJAC','CRISTIAN','0001-01-01','','',NULL,'',NULL,'','Romania',NULL,NULL,5,'721208','0003273644',1),(145,'BARBU','MIRCEA-MIHAI','1968-04-27','','',NULL,'RESITA',NULL,'CARAS-SEVERIN','Romania',NULL,NULL,1,'721410','0003273609',1),(146,'BALA','GHEORGHE','1969-07-24','','',NULL,'BOCSA',NULL,'CARAS-SEVERIN','Romania',NULL,NULL,5,'721410','0003273631',1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employees_names`
--

DROP TABLE IF EXISTS `employees_names`;
/*!50001 DROP VIEW IF EXISTS `employees_names`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `employees_names` AS SELECT 
 1 AS `id`,
 1 AS `fullname`,
 1 AS `team`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employees_ops`
--

DROP TABLE IF EXISTS `employees_ops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `employees_ops` (
  `id` int NOT NULL,
  `catalog_id` int NOT NULL,
  `employees_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employees_ops_catalog1_idx` (`catalog_id`),
  KEY `fk_employees_ops_employees1_idx` (`employees_id`),
  CONSTRAINT `fk_employees_ops_catalog1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_employees_ops_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_ops`
--

LOCK TABLES `employees_ops` WRITE;
/*!40000 ALTER TABLE `employees_ops` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_ops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employees_work`
--

DROP TABLE IF EXISTS `employees_work`;
/*!50001 DROP VIEW IF EXISTS `employees_work`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `employees_work` AS SELECT 
 1 AS `d`,
 1 AS `employee`,
 1 AS `operation`,
 1 AS `day`,
 1 AS `order`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock_id` int NOT NULL,
  `cat_id` int NOT NULL,
  `qty` int NOT NULL,
  `value` int NOT NULL,
  `vat` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stock_id_2` (`stock_id`,`cat_id`),
  KEY `cat_it` (`cat_id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_3` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `invoice_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `name` int NOT NULL,
  `qty` float(10,3) NOT NULL,
  `unit` int NOT NULL,
  `unit_price` float(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `vat` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  `order_item` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `invoice_items_ibfk_2` (`currency`),
  KEY `order_id` (`order_id`),
  KEY `order_item` (`order_item`),
  CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoice_items_ibfk_2` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `invoice_items_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `invoice_items_ibfk_4` FOREIGN KEY (`order_item`) REFERENCES `orders_items` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doc_id` int NOT NULL,
  `issuer` int NOT NULL,
  `invoiced_to` int NOT NULL,
  `date` date NOT NULL,
  `payed` tinyint(1) NOT NULL,
  `total` int NOT NULL,
  `vat` int NOT NULL,
  `total_w_vat` int NOT NULL,
  `draft` tinyint(1) NOT NULL DEFAULT '1',
  `canceled` tinyint(1) NOT NULL DEFAULT '0',
  `issued_by` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoiced_to` (`invoiced_to`),
  KEY `issuer` (`issuer`),
  KEY `doc_id` (`doc_id`),
  KEY `invoices_ibfk_4` (`issued_by`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`invoiced_to`) REFERENCES `partners` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`issuer`) REFERENCES `partners` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`doc_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoices_ibfk_4` FOREIGN KEY (`issued_by`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `create_document_entry` BEFORE INSERT ON `invoices` FOR EACH ROW BEGIN
	IF(NEW.doc_id IS NULL) THEN
    	INSERT INTO documents(user_id,type) VALUES(NEW.issued_by,'invoice');
    	SET NEW.doc_id=LAST_INSERT_ID();
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `jobs` (
  `codcor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`codcor`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES ('722429',' Curatitor-sablator'),('911201',' Femeie de serviciu'),('214401',' Inginer mecanic'),('721412',' Presator metale la rece'),('722202',' Sculer-matriter'),('244225','Agent'),('121120','Contabil-sef'),('749355','control calitate'),('722408','Frezor'),('326672','Instalator'),('721410','Lacatus mecanic'),('932911','Muncitor necalificat in metalurgie'),('722323','Operator la masini-unelte cu comanda numerica'),('34676','Programator'),('214207','Proiectant inginer instalatii'),('332201','Reprezentant tehnic'),('412001','Secretara'),('244523','Spaleckist'),('721208','Sudor'),('311306','Tehnician energetician/electrician'),('242425','Testor'),('466794','Trasator'),('713202','Vopsitor Industrial');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Resita',NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ts` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'2021-07-24 10:03:38','match k&v are null'),(2,'2021-07-24 10:03:38','Futterblech Siebkasten / Lagergehäuse / 3D-Combi / ------'),(3,'2021-07-24 10:03:38','name not found'),(4,'2021-07-24 10:03:38','match k&v are null'),(5,'2021-07-24 10:03:38','Futterblech Motor /  / 3D Combi 833+ / ------'),(6,'2021-07-24 10:03:38','name not found'),(7,'2021-09-21 06:12:33','480'),(8,'2021-09-21 06:13:16','50'),(9,'2021-09-21 06:13:33','5'),(10,'2021-09-21 06:15:16','5'),(11,'2021-09-21 06:15:46','5'),(12,'2021-09-21 06:31:17','5'),(13,'2021-09-21 06:32:22','5'),(14,'2021-09-21 06:32:28','5'),(15,'2021-09-21 06:32:42','5'),(16,'2021-10-21 15:01:01','5'),(17,'2021-10-21 16:01:01','5'),(18,'2021-10-21 17:01:01','5'),(19,'2021-10-21 18:01:01','5'),(20,'2021-10-21 19:01:01','5'),(21,'2021-10-21 20:01:01','5');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `maintenance` (
  `id` int NOT NULL,
  `operation` varchar(45) DEFAULT NULL,
  `assets_aid` int NOT NULL,
  `scheduled_date` datetime NOT NULL,
  `exec_date` datetime DEFAULT NULL,
  `execby` varchar(20) DEFAULT NULL,
  `document_docid` text,
  PRIMARY KEY (`id`),
  KEY `fk_maintainance_assets1_idx` (`assets_aid`),
  KEY `fk_maintainance_users1_idx` (`execby`),
  CONSTRAINT `fk_maintainance_assets1` FOREIGN KEY (`assets_aid`) REFERENCES `assets` (`aid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_maintainance_users1` FOREIGN KEY (`execby`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `media` (
  `uuid` varchar(50) NOT NULL,
  `original_name` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL,
  `thumbnail_path` varchar(255) DEFAULT NULL,
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `size` int NOT NULL,
  `mime_type` varchar(50) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES ('08efaa8171afc','BE 273403.xml','/var/www/html/uploads/0/8/08efaa8171afc.xml',NULL,'8d148855cc48ce1107479f11a412f32a476b72f0e02e8959bc3372125e9b183c',357,'text/xml'),('15f54af722851','spaleck.sql','/var/www/html/uploads/1/5/15f54af722851.sql',NULL,'2495810d225ce229777f253afed85f6d9a7373d41ac94ad93d63e015f8393556',1587,'application/sql'),('2a4a6b79c1bd9','BE 273403.xml','/var/www/html/uploads/2/a/2a4a6b79c1bd9.xml',NULL,'fb1961aa5f7cf0285d0b10f9f19e7855ed7d194ebf6646d19f7125edb015afad',266,'text/xml'),('68197f7f44800','index.html','/var/www/html/uploads/6/8/68197f7f44800.html',NULL,'3f96c6aa7fa9b84a90d9e7e2e6f08d475974a5f90a9e15d537e0423e3865f5eb',0,'text/html'),('6a6d47b26381d','environments.json','/var/www/html/uploads/6/a/6a6d47b26381d.json',NULL,'1dec06cae666518527cd77b292b4b973731a23d7f4e34d5d8d98838612ce779d',1,'application/json'),('72a5a7d618bdf','252616 abdeckung stationär  stückliste.pdf','/var/www/html/uploads/7/2/72a5a7d618bdf.pdf',NULL,'f6205cecb4af6a74d757de13dd804834d1baf67dae9f5a59fac387c72cdb4db8',47,'application/pdf'),('799e585d519a5','l0go.png','/var/www/html/uploads/7/9/799e585d519a5.png','/var/www/html/uploads/7/9/tn/tn_799e585d519a5.png','1eeef9203feac3fa97bdf0e634039d5ad435bfdf9758f4e8e739496a74bf1046',17,'image/png'),('7c55cffd96792','README.md','/var/www/html/uploads/7/c/7c55cffd96792.md',NULL,'ba8dd89846350ec934942c4b1bc94e70f38a4dd54ab4e29ec89372b53965b6f5',1,'text/markdown'),('a361a3acf663d','zpl-zbi2-pm-en.pdf','/var/www/html/uploads/a/3/a361a3acf663d.pdf',NULL,'51d0b7202cd15d5e2d7e0f8b65eda47abbf51bda30dea8d881eaa15f762a7e6a',10812,'application/pdf'),('a5c4bd70a2736','active_env.json','/var/www/html/uploads/a/5/a5c4bd70a2736.json',NULL,'8b9dd1e820fa4ab751a71cac0d336def731057c060b30579ac54cd6e887378b4',0,'application/json'),('a7e8093d3ca14','20140809_172827.jpg','/var/www/html/uploads/a/7/a7e8093d3ca14.jpg','/var/www/html/uploads/a/7/tn/tn_a7e8093d3ca14.jpg','770d60bdc5b07d34b71ed3aa51ff5b97215cd677c1a0d86a1af26412036a1ef4',1479,'image/jpeg'),('ab4ebc305f584','Screenshot from 2021-10-05 11-12-30.png','/var/www/html/uploads/a/b/ab4ebc305f584.png','/var/www/html/uploads/a/b/tn/tn_ab4ebc305f584.png','00f1496c5004e762435e9d31b0c6d2bf714ea5f4f97494741847e9e6e22e928b',747,'image/png'),('af8ac82448a14','Screenshot from 2021-10-05 12-54-10.png','/var/www/html/uploads/a/f/af8ac82448a14.png','/var/www/html/uploads/a/f/tn/tn_af8ac82448a14.png','b638afc8681117a67792e2f8d06314f396208bfb5b49f27b2f9216da58317d67',943,'image/png'),('b283780b39530','Screenshot from 2021-10-08 11-48-38.png','/var/www/html/uploads/b/2/b283780b39530.png','/var/www/html/uploads/b/2/tn/tn_b283780b39530.png','ae92601ccf690f3dffc135a0644d06ab330312b50850aa4280d36695d686b524',877,'image/png'),('c14703e7458b9','VDF Connect Box quick guide 148x210mm ARRIS.pdf','/var/www/html/uploads/c/1/c14703e7458b9.pdf',NULL,'11d73020dedc8a51c0db3098b75b699edf99d93aebceb88733480a8e49e2012c',232,'application/pdf'),('e2ad6432419ee','252616 abdeckung stationär sägeliste.pdf','/var/www/html/uploads/e/2/e2ad6432419ee.pdf',NULL,'537ed4b71b667525facf7b5219d877e672ebc58b5952234b50dbe4ae2de5e158',42,'application/pdf'),('e35c825a67e03','test.html','/var/www/html/uploads/e/3/e35c825a67e03.html',NULL,'ec40c4b68ae46809ca325374e8ec613781c35534da7712aff2656f26b4f1cb15',1,'text/html'),('f08e5b6a764d2','buttons.html','/var/www/html/uploads/f/0/f08e5b6a764d2.html',NULL,'3e0f5b74cad0307b4d99852361dd5f2c3c02c3d2a139754b722a5a4f3d6cd26b',106,'text/html'),('f9735171ccd72','Screenshot from 2021-10-11 16-30-15.png','/var/www/html/uploads/f/9/f9735171ccd72.png','/var/www/html/uploads/f/9/tn/tn_f9735171ccd72.png','024eef91536987d9f507d36ae1d3af0040a3f0ee25c201d705b0d714772b392b',238,'image/png'),('fda7ccb78a3c6','wapp.jpeg','/var/www/html/uploads/f/d/fda7ccb78a3c6.jpeg','/var/www/html/uploads/f/d/tn/tn_fda7ccb78a3c6.jpeg','05423f761d98703afb788ceb0dfde898b1ba4c38d0faa82d870985c3819a04c0',5,'image/jpeg');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_to_delivery`
--

DROP TABLE IF EXISTS `order_to_delivery`;
/*!50001 DROP VIEW IF EXISTS `order_to_delivery`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `order_to_delivery` AS SELECT 
 1 AS `oid`,
 1 AS `did`,
 1 AS `label`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `orders` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `state` enum('offer','ord','proc','ready','dlvd','canceled') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ord',
  `multiplied_by` int NOT NULL DEFAULT '1',
  `doc_id` int DEFAULT NULL,
  `cust_int_ref` varchar(50) DEFAULT NULL,
  `partner_id` int NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `startwork_on` datetime DEFAULT NULL,
  `readytodeliver_on` date DEFAULT NULL,
  `closed_on` date DEFAULT NULL,
  `order_value` float(10,2) DEFAULT NULL,
  `calculated_value` float(10,2) DEFAULT NULL,
  `final_value` float(10,2) DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `team` int DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_orders_document1_idx` (`doc_id`),
  KEY `fk_orders_partners1_idx` (`partner_id`),
  KEY `created_by` (`user_id`),
  KEY `team` (`team`),
  KEY `currency` (`currency`),
  CONSTRAINT `fk_orders_document1` FOREIGN KEY (`doc_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_partners1` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`team`) REFERENCES `teams` (`tid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Comanda tampon',NULL,'proc',1,0,NULL,0,'2021-05-01 08:03:43','2021-05-01 08:02:47',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),(42,'SZWS 1550X4200 POS.21',NULL,'dlvd',1,43,NULL,2,'2021-10-13 07:47:30','2021-10-13 07:55:28','2021-10-13','2021-10-19',NULL,NULL,NULL,NULL,'vsergione',NULL),(43,'Piese schimb',NULL,'dlvd',1,44,NULL,2,'2021-10-13 07:51:00','2021-10-13 07:52:22','2021-10-13','2021-10-19',NULL,NULL,NULL,NULL,'vsergione',NULL),(44,'SEWS 1600X8500',NULL,'dlvd',1,45,NULL,2,'2021-10-13 07:51:01','2021-10-13 07:54:47','2021-10-13','2021-10-19',NULL,NULL,NULL,NULL,'vsergione',NULL),(45,'SEWU 1600X4000',NULL,'dlvd',1,46,NULL,2,'2021-10-13 07:51:02','2021-10-13 07:54:59','2021-10-13','2021-10-19',NULL,NULL,NULL,NULL,'vsergione',NULL),(46,'SEWU 1600X4000',NULL,'dlvd',1,47,NULL,2,'2021-10-13 07:51:03','2021-10-13 07:55:42','2021-10-13','2021-10-19',NULL,NULL,NULL,NULL,'vsergione',NULL),(47,'SEWS 1600X8500',NULL,'dlvd',1,48,NULL,2,'2021-10-13 07:51:04','2021-10-13 07:56:02','2021-10-13','2021-10-19',NULL,NULL,NULL,NULL,'vsergione',NULL),(48,'SEWS 2000X5000',NULL,'dlvd',1,49,NULL,2,'2021-10-13 07:51:05','2021-10-13 07:56:17','2021-10-13','2021-10-19',NULL,NULL,NULL,NULL,'vsergione',NULL),(49,'Piese schimb',NULL,'dlvd',1,50,NULL,2,'2021-10-13 07:51:06','2021-10-13 07:56:31','2021-10-13','2021-10-19',NULL,NULL,NULL,NULL,'vsergione',NULL),(50,'Piese schimb',NULL,'dlvd',1,51,NULL,2,'2021-10-13 07:51:07','2021-10-13 07:58:46','2021-10-13','2021-10-19',NULL,NULL,NULL,NULL,'vsergione',NULL),(51,'Piese schimb',NULL,'dlvd',1,52,NULL,2,'2021-10-13 07:51:08','2021-10-13 07:58:36','2021-10-13','2021-10-19',NULL,NULL,NULL,NULL,'vsergione',NULL),(52,'Piese schimb',NULL,'dlvd',1,53,NULL,2,'2021-10-13 07:51:09','2021-10-13 07:58:16','2021-10-13','2021-10-19',NULL,NULL,NULL,NULL,'vsergione',NULL),(53,'Piese schimb',NULL,'dlvd',1,54,NULL,2,'2021-10-13 07:51:10','2021-10-13 07:58:05','2021-10-13','2021-10-19',NULL,NULL,NULL,NULL,'vsergione',NULL),(54,'SEWU 2000x6000',NULL,'dlvd',1,55,NULL,2,'2021-10-13 07:51:11','2021-10-13 08:06:56','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(55,'Piese schimb',NULL,'dlvd',1,56,NULL,2,'2021-10-13 07:51:12','2021-10-13 07:57:43','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(56,'Piese schimb',NULL,'dlvd',1,57,NULL,2,'2021-10-13 07:51:13','2021-10-13 07:57:52','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(57,'Terex 883+ evo II',NULL,'proc',1,58,NULL,2,'2021-10-13 07:51:14','2021-10-13 08:07:01',NULL,NULL,NULL,NULL,NULL,NULL,'vsergione',1),(58,'Piese schimb',NULL,'dlvd',1,59,NULL,2,'2021-10-13 07:51:15','2021-10-13 07:57:31','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(59,'SZWS 1550X5200',NULL,'dlvd',1,60,NULL,2,'2021-10-13 07:51:16','2021-10-13 08:07:05','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(60,'Piese schimb',NULL,'dlvd',1,61,NULL,2,'2021-10-13 07:51:17','2021-10-13 08:07:10','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(61,'Piese schimb',NULL,'dlvd',1,62,NULL,2,'2021-10-13 07:51:18','2021-10-13 07:57:19','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(62,'Piese schimb',NULL,'dlvd',1,63,NULL,2,'2021-10-13 07:51:19','2021-10-13 08:06:39','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(63,'SZWS 2400x7000',NULL,'dlvd',1,64,NULL,2,'2021-10-13 07:51:20','2021-10-13 08:07:14','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(64,'Piese schimb',NULL,'dlvd',1,65,NULL,2,'2021-10-13 07:51:21','2021-10-13 08:07:27','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(65,'Piese schimb',NULL,'dlvd',1,66,NULL,2,'2021-10-13 07:51:22','2021-10-13 08:07:31','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(66,'Piese schimb',NULL,'dlvd',1,67,NULL,2,'2021-10-13 07:51:23','2021-10-13 08:07:36','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(67,'Piese schimb',NULL,'dlvd',1,68,NULL,2,'2021-10-13 07:51:24','2021-10-13 08:07:40','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(68,'SEWS 1600X5200',NULL,'dlvd',1,69,NULL,2,'2021-10-13 07:51:25','2021-10-13 08:06:47','2021-11-01','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',2),(69,'Piese schimb',NULL,'dlvd',1,70,NULL,2,'2021-10-13 07:51:26','2021-10-13 08:07:45','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(70,'Piese schimb',NULL,'dlvd',1,71,NULL,2,'2021-10-13 07:51:27','2021-10-13 07:57:08','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(71,'Piese schimb',NULL,'dlvd',1,72,NULL,2,'2021-10-13 07:51:28','2021-10-13 08:07:49','2021-10-13','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',NULL),(72,'SEWU 2400X7000',NULL,'dlvd',1,73,NULL,2,'2021-10-13 07:51:29','2021-10-13 08:07:54','2021-11-01','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',4),(73,'SEWS 1600X5200',NULL,'dlvd',1,74,NULL,2,'2021-10-13 07:51:30','2021-10-13 08:06:51','2021-11-01','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',3),(75,'SZWS 2000X6000','EPOXI','dlvd',1,77,'348130',2,'2021-10-13 08:15:31','2021-10-13 08:23:05','2021-11-01','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',1),(78,'SZWS 2000X6000','Welle und Schutzrohr','dlvd',1,80,'348380',2,'2021-10-14 05:18:32','2021-10-18 15:20:36','2021-11-01','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',2),(81,'SZWS 1600X6000',NULL,'proc',1,83,'10-00348075-0110',2,'2021-10-18 07:17:01','2021-10-18 15:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'vsergione',3),(82,'PIESE SCHIMB',NULL,'dlvd',1,84,'15-00348869-0010',2,'2021-10-18 07:20:37','2021-10-19 08:50:46','2021-11-01','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',3),(83,'PIESE SCHIMB',NULL,'dlvd',1,85,'10-00348864-0200',2,'2021-10-18 07:24:16','2021-10-19 08:51:01','2021-11-01','2021-11-10',NULL,NULL,NULL,NULL,'vsergione',4),(87,'SEWU 2600X5000',NULL,'proc',1,89,'10-00348121-0210',2,'2021-10-19 08:38:09','2021-10-19 08:38:23',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),(88,'Piese schimb',NULL,'dlvd',1,90,'15-00348975-0010',2,'2021-10-19 08:42:07','2021-10-19 08:42:22','2021-10-29','2021-11-10',NULL,NULL,NULL,NULL,'admin',3),(89,'Piese schimb',NULL,'proc',1,91,'15-00348975-0010',2,'2021-10-19 08:47:06','2021-10-19 08:48:25',NULL,NULL,NULL,NULL,NULL,NULL,'admin',4),(90,'Piese schimb',NULL,'dlvd',1,92,'15-00348974-0010',2,'2021-10-19 08:49:57','2021-10-19 08:50:09','2021-11-01','2021-11-10',NULL,NULL,NULL,NULL,'admin',3),(96,'PIESE SCHIMB',NULL,'dlvd',1,98,'15-00348896-0010',2,'2021-10-21 07:38:16','2021-10-21 07:38:40','2021-11-01','2021-11-10',NULL,NULL,NULL,NULL,'admin',NULL),(97,'PIESE SCHIMB',NULL,'dlvd',1,99,'15-00348995-0010',2,'2021-10-21 07:40:24','2021-10-28 07:13:40','2021-11-01','2021-11-10',NULL,NULL,NULL,NULL,'admin',NULL),(98,'PIESE SCHIMB',NULL,'dlvd',1,100,'15-00348995-0010',2,'2021-10-21 07:42:06','2021-10-21 07:46:34','2021-11-01','2021-11-10',NULL,NULL,NULL,NULL,'admin',NULL),(99,'test1 2 2','sd asd','proc',1,101,'12asdd12',0,'2021-10-21 10:17:14','2021-10-21 14:53:41',NULL,'2021-10-29',1.00,2.00,NULL,NULL,'vsergione',2),(100,'Piese schimb',NULL,'proc',1,102,'15-00349091-0030',2,'2021-10-22 11:31:06','2021-11-02 07:45:08',NULL,NULL,NULL,NULL,NULL,NULL,'vsergione',NULL),(101,'Piese schimb',NULL,'proc',1,103,'15-00349025-0010',2,'2021-10-22 11:32:04','2021-11-02 07:43:13',NULL,NULL,NULL,NULL,NULL,NULL,'vsergione',NULL),(102,'Piese schimb',NULL,'proc',1,104,'15-00349048-0010',2,'2021-10-22 11:33:08','2021-11-02 07:41:25',NULL,NULL,NULL,NULL,NULL,NULL,'vsergione',NULL),(103,'Piese schimb',NULL,'proc',1,105,'LA-00030680',2,'2021-10-22 11:33:59','2021-11-05 07:49:39',NULL,NULL,NULL,NULL,NULL,NULL,'vsergione',NULL),(104,'Piese schimb',NULL,'proc',1,106,'15-00349083-0010',2,'2021-10-29 10:41:21','2021-11-02 07:39:46',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),(105,'SEWS 2400x8500',NULL,'proc',1,107,'10-00348148-0110',2,'2021-10-29 10:45:01','2021-11-04 07:22:00',NULL,NULL,NULL,NULL,NULL,NULL,'admin',1),(106,'SEWS 2000x7000',NULL,'proc',1,108,'10-00348398-0110',2,'2021-10-29 10:47:34','2021-11-04 07:23:28',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),(107,'Piese schimb',NULL,'proc',1,109,'10-00349044-0100',2,'2021-10-29 10:49:28','2021-11-05 07:49:59',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),(108,'SZWS 1550x4200',NULL,'proc',1,110,'10-00347417-0110',2,'2021-10-29 10:51:25','2021-11-05 07:47:45',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),(109,'Piese schimb',NULL,'proc',1,111,'10-00348380-0240',2,'2021-10-29 10:53:07','2021-11-02 07:26:34',NULL,NULL,NULL,NULL,NULL,NULL,'admin',3),(110,'SZWS 1600x5200',NULL,'proc',1,112,'10-00347146-0210',2,'2021-11-10 12:11:53','2021-11-10 12:11:59',NULL,NULL,NULL,NULL,NULL,NULL,'admin',2),(111,'SEWU 2000x7000',NULL,'proc',1,113,'10-00347146-0110',2,'2021-11-10 12:12:54','2021-11-10 12:12:58',NULL,NULL,NULL,NULL,NULL,NULL,'admin',4),(112,'Piese schimb',NULL,'proc',1,114,'15-00349257-0010',2,'2021-11-10 12:15:44','2021-11-11 11:34:12',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),(113,'Piese schimb',NULL,'proc',1,115,'15-00349287-0010',2,'2021-11-10 12:16:21','2021-11-11 11:35:34',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),(114,'Piese schimb',NULL,'proc',1,116,'15-00349227-0060',2,'2021-11-10 12:17:06','2021-11-11 14:32:59',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),(115,'Piese schimb',NULL,'proc',1,117,'349303',2,'2021-11-10 12:17:40','2021-11-11 13:13:11',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL),(116,'SEWU 1600x6000',NULL,'proc',1,118,'10-00348816-0110',2,'2021-11-10 12:18:23','2021-11-11 14:32:49',NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `create_document` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
	IF(NEW.doc_id IS NULL) THEN
    	INSERT INTO documents(user_id,partners_id,type) VALUES(NEW.user_id,NEW.partner_id,'order');
    	SET NEW.doc_id=LAST_INSERT_ID();
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `status_update_dates` BEFORE UPDATE ON `orders` FOR EACH ROW BEGIN
	IF (OLD.state != NEW.state) THEN
		IF (NEW.state = "proc") THEN
        	SET NEW.startwork_on=CURRENT_TIMESTAMP();
		END IF;
        IF (NEW.state = "ready") THEN
        	SET NEW.readytodeliver_on=CURRENT_TIMESTAMP();
		END IF;
        IF (NEW.state = "dlvd") THEN
        	SET NEW.closed_on=CURRENT_TIMESTAMP();
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `delete_document` AFTER DELETE ON `orders` FOR EACH ROW BEGIN
	DELETE FROM documents WHERE documents.id=OLD.doc_id;
    update settings_document_numbers set lastissued=lastissued-1 WHERE label="order";
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;

--
-- Table structure for table `orders_2_deliveries`
--

DROP TABLE IF EXISTS `orders_2_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `orders_2_deliveries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL,
  `delivery` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_2_deliveries`
--

LOCK TABLES `orders_2_deliveries` WRITE;
/*!40000 ALTER TABLE `orders_2_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_2_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_2_employees`
--

DROP TABLE IF EXISTS `orders_2_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `orders_2_employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `emplid` int NOT NULL,
  `operation` int DEFAULT NULL,
  `hourlyrate` float(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`,`emplid`,`operation`),
  KEY `emplid` (`emplid`),
  KEY `orders_2_employees_ibfk_3` (`currency`),
  KEY `orders_2_employees_ibfk_4` (`operation`),
  CONSTRAINT `orders_2_employees_ibfk_1` FOREIGN KEY (`emplid`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_2_employees_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_2_employees_ibfk_3` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orders_2_employees_ibfk_4` FOREIGN KEY (`operation`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_2_employees`
--

LOCK TABLES `orders_2_employees` WRITE;
/*!40000 ALTER TABLE `orders_2_employees` DISABLE KEYS */;
INSERT INTO `orders_2_employees` VALUES (47,75,104,32,25.00,'EUR'),(48,75,107,32,25.00,'EUR'),(49,75,126,33,25.00,'EUR'),(50,75,99,33,25.00,'EUR'),(51,73,108,32,25.00,'EUR'),(52,73,141,32,25.00,'EUR'),(53,73,121,32,25.00,'EUR'),(54,73,91,33,25.00,'EUR'),(55,73,103,33,25.00,'EUR'),(56,72,87,32,25.00,'EUR'),(57,72,89,32,25.00,'EUR'),(58,72,125,32,25.00,'EUR'),(59,72,110,33,25.00,'EUR'),(60,72,118,33,25.00,'EUR'),(61,68,97,32,25.00,'EUR'),(62,68,115,32,25.00,'EUR'),(63,68,111,32,25.00,'EUR'),(64,68,92,33,25.00,'EUR'),(65,68,105,33,25.00,'EUR'),(66,75,140,32,25.00,'EUR'),(67,57,87,32,25.00,'EUR'),(70,1,8,0,0.00,'EUR'),(74,1,75,0,0.00,'EUR'),(78,1,86,0,0.00,'EUR'),(79,1,88,0,0.00,'EUR'),(80,1,90,0,0.00,'EUR'),(81,1,93,0,0.00,'EUR'),(82,1,94,0,0.00,'EUR'),(83,1,95,0,0.00,'EUR'),(84,1,96,0,0.00,'EUR'),(85,1,98,0,0.00,'EUR'),(86,1,100,0,0.00,'EUR'),(87,1,101,0,0.00,'EUR'),(88,1,102,0,0.00,'EUR'),(89,1,106,0,0.00,'EUR'),(90,1,109,0,0.00,'EUR'),(91,1,110,0,0.00,'EUR'),(92,1,112,0,0.00,'EUR'),(93,1,113,0,0.00,'EUR'),(94,1,114,0,0.00,'EUR'),(95,1,116,0,0.00,'EUR'),(96,1,118,0,0.00,'EUR'),(97,1,119,0,0.00,'EUR'),(98,1,120,0,0.00,'EUR'),(99,1,122,0,0.00,'EUR'),(100,1,123,0,0.00,'EUR'),(101,1,124,0,0.00,'EUR'),(102,1,127,0,0.00,'EUR'),(103,1,129,0,0.00,'EUR'),(104,1,130,0,0.00,'EUR'),(105,1,131,0,0.00,'EUR'),(106,1,132,0,0.00,'EUR'),(107,1,133,0,0.00,'EUR'),(108,1,134,0,0.00,'EUR'),(109,1,135,0,0.00,'EUR'),(110,1,136,0,0.00,'EUR'),(111,1,99,0,0.00,'EUR'),(112,1,104,0,0.00,'EUR'),(113,1,107,0,0.00,'EUR'),(114,1,126,0,0.00,'EUR'),(115,1,140,0,0.00,'EUR'),(116,1,92,0,0.00,'EUR'),(117,1,97,0,0.00,'EUR'),(118,1,105,0,0.00,'EUR'),(119,1,111,0,0.00,'EUR'),(120,1,115,0,0.00,'EUR'),(121,1,91,0,0.00,'EUR'),(122,1,103,0,0.00,'EUR'),(123,1,108,0,0.00,'EUR'),(124,1,121,0,0.00,'EUR'),(125,1,141,0,0.00,'EUR'),(128,1,87,0,0.00,'EUR'),(129,1,89,0,0.00,'EUR'),(130,1,117,0,0.00,'EUR'),(131,1,125,0,0.00,'EUR'),(132,1,128,0,0.00,'EUR'),(196,73,99,33,25.00,'EUR'),(197,73,105,33,25.00,'EUR'),(199,57,104,32,25.00,'EUR'),(200,57,107,32,25.00,'EUR'),(201,57,140,32,25.00,'EUR'),(202,57,126,33,25.00,'EUR'),(203,57,99,33,25.00,'EUR'),(205,72,103,33,25.00,'EUR'),(206,72,91,33,25.00,'EUR'),(207,72,105,33,25.00,'EUR'),(208,72,108,32,25.00,'EUR'),(209,72,121,32,25.00,'EUR'),(210,72,141,32,25.00,'EUR'),(211,72,109,34,0.00,'EUR'),(212,72,100,34,0.00,'EUR'),(213,72,120,34,0.00,'EUR'),(214,72,93,34,0.00,'EUR'),(215,72,132,34,0.00,'EUR'),(216,73,109,34,0.00,'EUR'),(217,73,132,34,0.00,'EUR'),(218,73,100,34,0.00,'EUR'),(219,73,120,34,0.00,'EUR'),(220,73,93,34,0.00,'EUR'),(221,75,109,34,0.00,'EUR'),(222,75,132,34,0.00,'EUR'),(223,75,100,34,0.00,'EUR'),(224,75,120,34,0.00,'EUR'),(225,75,93,34,0.00,'EUR'),(226,78,109,34,0.00,'EUR'),(227,78,120,34,0.00,'EUR'),(228,78,132,34,0.00,'EUR'),(229,81,109,34,0.00,'EUR'),(230,81,93,34,0.00,'EUR'),(231,81,100,34,0.00,'EUR'),(232,78,97,32,25.00,'EUR'),(233,78,115,32,25.00,'EUR'),(234,78,111,32,25.00,'EUR'),(235,90,109,34,0.00,'EUR'),(236,89,109,34,0.00,'EUR'),(239,88,109,34,0.00,'EUR'),(240,83,109,34,0.00,'EUR'),(241,82,109,34,0.00,'EUR'),(242,87,109,34,0.00,'EUR'),(243,87,100,34,0.00,'EUR'),(244,87,120,34,0.00,'EUR'),(245,87,132,34,0.00,'EUR'),(246,87,93,34,0.00,'EUR'),(249,78,105,33,25.00,'EUR'),(250,78,92,33,25.00,'EUR'),(252,81,132,34,0.00,'EUR'),(253,83,132,34,0.00,'EUR'),(254,81,108,32,25.00,'EUR'),(255,81,141,32,25.00,'EUR'),(256,81,121,32,25.00,'EUR'),(257,81,134,32,25.00,'EUR'),(258,81,91,33,25.00,'EUR'),(259,81,103,33,25.00,'EUR'),(266,90,108,32,25.00,'EUR'),(267,90,141,32,25.00,'EUR'),(268,90,121,32,25.00,'EUR'),(269,90,134,32,25.00,'EUR'),(270,90,91,33,25.00,'EUR'),(271,90,103,33,25.00,'EUR'),(272,89,89,32,25.00,'EUR'),(273,89,87,32,25.00,'EUR'),(274,89,125,32,25.00,'EUR'),(275,89,110,33,25.00,'EUR'),(276,89,118,33,25.00,'EUR'),(277,88,108,32,25.00,'EUR'),(278,88,128,33,25.00,'EUR'),(279,57,110,32,25.00,'EUR'),(281,83,87,32,25.00,'EUR'),(282,83,89,32,25.00,'EUR'),(283,83,125,32,25.00,'EUR'),(284,83,110,33,25.00,'EUR'),(285,83,118,33,25.00,'EUR'),(286,100,109,34,0.00,'EUR'),(287,101,109,34,0.00,'EUR'),(288,102,109,34,0.00,'EUR'),(289,103,109,34,0.00,'EUR'),(290,98,109,34,0.00,'EUR'),(291,98,87,32,25.00,'EUR'),(292,98,89,32,25.00,'EUR'),(293,98,125,32,25.00,'EUR'),(294,98,110,33,25.00,'EUR'),(295,98,118,33,25.00,'EUR'),(296,82,120,34,0.00,'EUR'),(297,90,125,32,25.00,'EUR'),(298,90,87,32,25.00,'EUR'),(299,90,110,32,25.00,'EUR'),(300,90,118,32,25.00,'EUR'),(301,1,144,33,25.00,'EUR'),(302,78,144,33,25.00,'EUR'),(303,90,100,34,0.00,'EUR'),(304,96,109,34,0.00,'EUR'),(305,97,109,34,0.00,'EUR'),(306,87,104,32,25.00,'EUR'),(307,87,107,32,25.00,'EUR'),(308,87,97,32,25.00,'EUR'),(309,87,111,32,25.00,'EUR'),(310,87,115,32,25.00,'EUR'),(311,87,87,32,25.00,'EUR'),(312,87,89,32,25.00,'EUR'),(313,87,125,32,25.00,'EUR'),(314,87,110,33,25.00,'EUR'),(315,87,92,33,25.00,'EUR'),(316,87,118,33,25.00,'EUR'),(317,87,103,33,25.00,'EUR'),(318,87,99,33,25.00,'EUR'),(319,87,144,33,25.00,'EUR'),(320,87,105,33,25.00,'EUR'),(322,87,126,33,25.00,'EUR'),(324,87,146,32,25.00,'EUR'),(325,87,145,32,25.00,'EUR'),(326,109,108,32,25.00,'EUR'),(327,109,141,32,25.00,'EUR'),(328,109,121,32,25.00,'EUR'),(329,109,103,33,25.00,'EUR'),(330,109,91,33,25.00,'EUR'),(331,104,108,32,25.00,'EUR'),(332,104,141,32,25.00,'EUR'),(333,104,121,32,25.00,'EUR'),(335,104,91,33,25.00,'EUR'),(336,104,103,33,25.00,'EUR'),(337,102,108,32,25.00,'EUR'),(338,102,141,32,25.00,'EUR'),(339,102,121,32,25.00,'EUR'),(340,102,91,33,25.00,'EUR'),(341,102,103,33,25.00,'EUR'),(342,101,108,32,25.00,'EUR'),(343,101,141,32,25.00,'EUR'),(344,101,121,32,25.00,'EUR'),(345,101,91,33,25.00,'EUR'),(346,101,103,33,25.00,'EUR'),(347,100,91,33,25.00,'EUR'),(348,100,103,33,25.00,'EUR'),(349,100,108,32,25.00,'EUR'),(350,100,141,32,25.00,'EUR'),(353,1,146,0,0.00,'EUR'),(354,1,145,0,0.00,'EUR'),(355,89,141,32,25.00,'EUR'),(356,89,108,32,25.00,'EUR'),(357,89,134,32,25.00,'EUR'),(358,89,91,33,25.00,'EUR'),(359,89,103,33,25.00,'EUR'),(360,87,91,33,25.00,'EUR'),(362,104,109,34,0.00,'EUR'),(363,105,100,34,0.00,'EUR'),(364,106,100,34,0.00,'EUR'),(365,108,100,34,0.00,'EUR'),(366,108,120,34,0.00,'EUR'),(367,108,93,34,0.00,'EUR'),(368,108,109,34,0.00,'EUR'),(369,108,119,34,0.00,'EUR'),(370,103,146,32,25.00,'EUR'),(371,103,140,32,25.00,'EUR'),(372,103,115,32,25.00,'EUR'),(373,103,128,33,25.00,'EUR'),(374,103,144,33,25.00,'EUR'),(375,102,140,32,25.00,'EUR'),(376,102,146,32,25.00,'EUR'),(377,102,144,33,25.00,'EUR'),(378,102,128,33,25.00,'EUR'),(379,108,146,32,25.00,'EUR'),(380,108,115,32,25.00,'EUR'),(381,108,140,32,25.00,'EUR'),(383,108,128,33,25.00,'EUR'),(384,108,144,33,25.00,'EUR'),(385,111,87,32,25.00,'EUR'),(386,111,89,32,25.00,'EUR'),(387,111,110,33,25.00,'EUR'),(388,111,125,32,25.00,'EUR'),(389,111,118,33,25.00,'EUR'),(390,111,128,33,25.00,'EUR'),(391,105,104,32,25.00,'EUR'),(392,105,107,32,25.00,'EUR'),(393,105,145,32,25.00,'EUR'),(395,105,126,33,25.00,'EUR'),(396,105,99,33,25.00,'EUR'),(397,110,97,32,25.00,'EUR'),(398,110,111,32,25.00,'EUR'),(399,110,134,32,25.00,'EUR'),(400,110,92,33,25.00,'EUR'),(401,110,105,33,25.00,'EUR'),(402,103,118,33,25.00,'EUR'),(403,111,100,34,0.00,'EUR'),(404,111,93,34,0.00,'EUR'),(405,105,132,34,0.00,'EUR'),(406,105,120,34,0.00,'EUR'),(407,105,109,34,0.00,'EUR'),(408,105,93,34,0.00,'EUR'),(414,101,93,34,0.00,'EUR'),(415,110,132,34,0.00,'EUR'),(416,110,100,34,0.00,'EUR'),(417,110,93,34,0.00,'EUR'),(418,110,109,34,0.00,'EUR'),(419,110,120,34,0.00,'EUR'),(420,111,132,34,0.00,'EUR'),(421,111,109,34,0.00,'EUR'),(423,111,120,34,0.00,'EUR'),(424,112,109,34,0.00,'EUR'),(425,113,109,34,0.00,'EUR'),(426,115,109,34,0.00,'EUR'),(427,106,108,32,25.00,'EUR'),(428,106,141,32,25.00,'EUR'),(429,106,121,32,25.00,'EUR'),(430,106,91,32,25.00,'EUR'),(431,106,103,32,25.00,'EUR'),(432,111,105,33,25.00,'EUR'),(433,114,109,34,0.00,'EUR'),(434,107,109,33,25.00,'EUR');
/*!40000 ALTER TABLE `orders_2_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_costs`
--

DROP TABLE IF EXISTS `orders_costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `orders_costs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oid` int NOT NULL,
  `cat_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grouping` varchar(50) DEFAULT NULL,
  `qty` float(10,2) NOT NULL,
  `unit` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit_price` float(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `vat` float(10,2) NOT NULL,
  `total` float(10,2) DEFAULT NULL,
  `total_wvat` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oid` (`oid`,`name`,`unit_price`,`currency`,`cat_id`) USING BTREE,
  KEY `currency` (`currency`),
  KEY `unit` (`unit`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `orders_costs_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_costs_ibfk_2` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orders_costs_ibfk_3` FOREIGN KEY (`unit`) REFERENCES `units` (`unit`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orders_costs_ibfk_4` FOREIGN KEY (`cat_id`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1415 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_costs`
--

LOCK TABLES `orders_costs` WRITE;
/*!40000 ALTER TABLE `orders_costs` DISABLE KEYS */;
INSERT INTO `orders_costs` VALUES (58,72,32,'lacatuserie','manopera',146.73,'ora',25.00,'EUR',19.00,3668.25,4365.22),(62,72,33,'sudura','manopera',97.59,'ora',25.00,'EUR',19.00,2439.75,2903.30),(65,57,NULL,'tabla 5mm','materii prime',500.00,'kg',2.74,'EUR',19.00,1370.00,1630.30),(71,68,32,'lacatuserie','manopera',100.14,'ora',25.00,'EUR',19.00,2503.50,2979.16),(74,73,33,'sudura','manopera',21.19,'ora',25.00,'EUR',19.00,529.75,630.40),(97,68,33,'sudura','manopera',51.15,'ora',25.00,'EUR',19.00,1278.75,1521.71),(101,73,0,'tampon',NULL,11.41,'ora',0.00,'EUR',19.00,0.00,0.00),(102,62,0,'tampon',NULL,42.89,'ora',0.00,'EUR',19.00,0.00,0.00),(103,57,0,'tampon',NULL,10.61,'ora',0.00,'EUR',19.00,0.00,0.00),(104,66,0,'tampon',NULL,1.97,'ora',0.00,'EUR',19.00,0.00,0.00),(123,75,32,'lacatuserie','manopera',131.26,'ora',25.00,'EUR',19.00,3281.50,3904.99),(130,73,32,'lacatuserie','manopera',68.35,'ora',25.00,'EUR',19.00,1708.75,2033.41),(141,64,0,'tampon',NULL,0.62,'ora',0.00,'EUR',19.00,0.00,0.00),(144,57,32,'lacatuserie','manopera',10.52,'ora',25.00,'EUR',19.00,263.00,312.97),(170,72,0,'tampon',NULL,2.10,'ora',0.00,'EUR',19.00,0.00,0.00),(171,75,33,'sudura','manopera',109.50,'ora',25.00,'EUR',19.00,2737.50,3257.62),(235,72,32,'lacatuserie','manopera',-36.03,'ora',0.00,'EUR',19.00,0.00,0.00),(237,72,33,'sudura','manopera',-33.80,'ora',0.00,'EUR',19.00,0.00,0.00),(268,72,34,'abkant',NULL,17.31,'ora',0.00,'EUR',19.00,0.00,0.00),(282,78,34,'abkant',NULL,24.37,'ora',0.00,'EUR',19.00,0.00,0.00),(297,73,34,'abkant',NULL,0.55,'ora',0.00,'EUR',19.00,0.00,0.00),(310,62,32,'lacatuserie','manopera',31.54,'ora',0.00,'EUR',19.00,0.00,0.00),(321,88,34,'abkant',NULL,0.05,'ora',0.00,'EUR',19.00,0.00,0.00),(325,78,32,'lacatuserie','manopera',138.04,'ora',25.00,'EUR',19.00,3451.00,4106.69),(345,78,33,'sudura','manopera',54.47,'ora',25.00,'EUR',19.00,1361.75,1620.48),(350,57,33,'sudura','manopera',-4.98,'ora',0.00,'EUR',19.00,0.00,0.00),(351,62,33,'sudura','manopera',62.92,'ora',0.00,'EUR',19.00,0.00,0.00),(416,62,33,'sudura','manopera',7.52,'ora',25.00,'EUR',19.00,188.00,223.72),(431,83,34,'abkant',NULL,5.97,'ora',0.00,'EUR',19.00,0.00,0.00),(434,68,33,'sudura','manopera',-13.78,'ora',0.00,'EUR',19.00,0.00,0.00),(458,81,32,'lacatuserie','manopera',197.46,'ora',25.00,'EUR',19.00,4936.50,5874.43),(503,78,33,'sudura','manopera',-20.08,'ora',0.00,'EUR',19.00,0.00,0.00),(528,62,32,'lacatuserie','manopera',8.18,'ora',25.00,'EUR',19.00,204.50,243.35),(561,75,34,'abkant',NULL,2.02,'ora',0.00,'EUR',19.00,0.00,0.00),(592,83,32,'lacatuserie','manopera',30.10,'ora',25.00,'EUR',19.00,752.50,895.48),(593,89,32,'lacatuserie','manopera',16.24,'ora',25.00,'EUR',19.00,406.00,483.14),(604,81,33,'sudura','manopera',102.27,'ora',25.00,'EUR',19.00,2556.75,3042.53),(658,98,34,'abkant',NULL,0.48,'ora',0.00,'EUR',19.00,0.00,0.00),(667,82,33,'sudura','manopera',0.87,'ora',0.00,'EUR',19.00,0.00,0.00),(668,83,33,'sudura','manopera',4.75,'ora',0.00,'EUR',19.00,0.00,0.00),(670,90,34,'abkant',NULL,11.10,'ora',0.00,'EUR',19.00,0.00,0.00),(672,98,32,'lacatuserie','manopera',8.61,'ora',25.00,'EUR',19.00,215.25,256.15),(673,83,33,'sudura','manopera',30.24,'ora',25.00,'EUR',19.00,756.00,899.64),(701,82,34,'abkant',NULL,0.55,'ora',0.00,'EUR',19.00,0.00,0.00),(705,98,33,'sudura','manopera',5.60,'ora',25.00,'EUR',19.00,140.00,166.60),(745,89,34,'abkant',NULL,1.98,'ora',0.00,'EUR',19.00,0.00,0.00),(752,90,32,'lacatuserie','manopera',42.76,'ora',25.00,'EUR',19.00,1069.00,1272.11),(782,90,33,'sudura','manopera',16.47,'ora',25.00,'EUR',19.00,411.75,489.98),(798,96,34,'abkant',NULL,0.35,'ora',0.00,'EUR',19.00,0.00,0.00),(825,87,32,'lacatuserie','manopera',479.58,'ora',25.00,'EUR',19.00,11989.50,14267.51),(836,87,33,'sudura','manopera',305.26,'ora',25.00,'EUR',19.00,7631.50,9081.49),(844,96,32,'lacatuserie','manopera',3.27,'ora',25.00,'EUR',19.00,81.75,97.28),(849,89,33,'sudura','manopera',5.00,'ora',25.00,'EUR',19.00,125.00,148.75),(902,57,33,'sudura','manopera',10.75,'ora',25.00,'EUR',19.00,268.75,319.81),(952,67,33,'sudura','manopera',0.37,'ora',25.00,'EUR',19.00,9.25,11.01),(982,101,34,'abkant',NULL,1.77,'ora',0.00,'EUR',19.00,0.00,0.00),(983,104,34,'abkant',NULL,0.20,'ora',0.00,'EUR',19.00,0.00,0.00),(984,102,34,'abkant',NULL,0.50,'ora',0.00,'EUR',19.00,0.00,0.00),(993,89,33,'sudura','manopera',6.88,'ora',0.00,'EUR',19.00,0.00,0.00),(995,100,33,'sudura','manopera',3.15,'ora',0.00,'EUR',19.00,0.00,0.00),(1033,101,33,'sudura','manopera',12.01,'ora',25.00,'EUR',19.00,300.25,357.30),(1042,104,33,'sudura','manopera',6.39,'ora',25.00,'EUR',19.00,159.75,190.10),(1054,101,32,'lacatuserie','manopera',12.93,'ora',25.00,'EUR',19.00,323.25,384.67),(1056,104,32,'lacatuserie','manopera',3.72,'ora',25.00,'EUR',19.00,93.00,110.67),(1061,105,34,'abkant',NULL,6.00,'ora',0.00,'EUR',19.00,0.00,0.00),(1062,106,34,'abkant',NULL,6.88,'ora',0.00,'EUR',19.00,0.00,0.00),(1087,102,32,'lacatuserie','manopera',23.62,'ora',25.00,'EUR',19.00,590.50,702.69),(1112,109,33,'sudura','manopera',9.33,'ora',25.00,'EUR',19.00,233.25,277.57),(1115,102,33,'sudura','manopera',32.04,'ora',25.00,'EUR',19.00,801.00,953.19),(1133,109,32,'lacatuserie','manopera',7.16,'ora',25.00,'EUR',19.00,179.00,213.01),(1187,103,32,'lacatuserie','manopera',29.64,'ora',25.00,'EUR',19.00,741.00,881.79),(1201,103,33,'sudura','manopera',-6.32,'ora',0.00,'EUR',19.00,0.00,0.00),(1223,103,33,'sudura','manopera',47.90,'ora',25.00,'EUR',19.00,1197.50,1425.03),(1261,105,32,'lacatuserie','manopera',31.46,'ora',25.00,'EUR',19.00,786.50,935.93),(1268,111,32,'lacatuserie','manopera',45.46,'ora',25.00,'EUR',19.00,1136.50,1352.43),(1271,111,33,'sudura','manopera',28.71,'ora',25.00,'EUR',19.00,717.75,854.12),(1290,111,34,'abkant',NULL,15.39,'ora',0.00,'EUR',19.00,0.00,0.00),(1298,110,33,'sudura','manopera',12.41,'ora',25.00,'EUR',19.00,310.25,369.20),(1302,105,33,'sudura','manopera',5.90,'ora',25.00,'EUR',19.00,147.50,175.53),(1304,110,32,'lacatuserie','manopera',27.15,'ora',25.00,'EUR',19.00,678.75,807.71),(1312,103,34,'abkant',NULL,11.88,'ora',0.00,'EUR',19.00,0.00,0.00),(1316,112,34,'abkant',NULL,1.55,'ora',0.00,'EUR',19.00,0.00,0.00),(1330,115,34,'abkant',NULL,5.00,'ora',0.00,'EUR',19.00,0.00,0.00),(1336,106,32,'lacatuserie','manopera',58.82,'ora',25.00,'EUR',19.00,1470.50,1749.89),(1371,114,34,'abkant',NULL,3.50,'ora',0.00,'EUR',19.00,0.00,0.00);
/*!40000 ALTER TABLE `orders_costs` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `calc_total` BEFORE INSERT ON `orders_costs` FOR EACH ROW BEGIN
	IF(NEW.vat IS NULL) THEN
    	SET NEW.vat = 19;
    END IF;
	IF(NEW.total is null) THEN
		SET NEW.total=NEW.qty*NEW.unit_price;
    END IF;
    SET NEW.total_wvat = NEW.total + NEW.vat * NEW.total/100;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `recalc_total` BEFORE UPDATE ON `orders_costs` FOR EACH ROW BEGIN
	IF(NEW.vat IS NULL) THEN
    	SET NEW.vat = 19;
    END IF;
    SET NEW.total=NEW.qty*NEW.unit_price;
    SET NEW.total_wvat = NEW.total + NEW.vat * NEW.total/100;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;

--
-- Temporary view structure for view `orders_costs_aggregated`
--

DROP TABLE IF EXISTS `orders_costs_aggregated`;
/*!50001 DROP VIEW IF EXISTS `orders_costs_aggregated`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `orders_costs_aggregated` AS SELECT 
 1 AS `oid`,
 1 AS `unit`,
 1 AS `currency`,
 1 AS `grouping`,
 1 AS `qty`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders_costs_total`
--

DROP TABLE IF EXISTS `orders_costs_total`;
/*!50001 DROP VIEW IF EXISTS `orders_costs_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `orders_costs_total` AS SELECT 
 1 AS `currency`,
 1 AS `oid`,
 1 AS `total`,
 1 AS `total_wvat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders_count_bystate`
--

DROP TABLE IF EXISTS `orders_count_bystate`;
/*!50001 DROP VIEW IF EXISTS `orders_count_bystate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `orders_count_bystate` AS SELECT 
 1 AS `state`,
 1 AS `cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders_extended`
--

DROP TABLE IF EXISTS `orders_extended`;
/*!50001 DROP VIEW IF EXISTS `orders_extended`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `orders_extended` AS SELECT 
 1 AS `oid`,
 1 AS `label`,
 1 AS `comments`,
 1 AS `state`,
 1 AS `doc_id`,
 1 AS `partner_id`,
 1 AS `created_on`,
 1 AS `closed_on`,
 1 AS `final_value`,
 1 AS `user_id`,
 1 AS `pname`,
 1 AS `docnum`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders_in_delay`
--

DROP TABLE IF EXISTS `orders_in_delay`;
/*!50001 DROP VIEW IF EXISTS `orders_in_delay`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `orders_in_delay` AS SELECT 
 1 AS `oid`,
 1 AS `label`,
 1 AS `comments`,
 1 AS `state`,
 1 AS `multiplied_by`,
 1 AS `doc_id`,
 1 AS `cust_int_ref`,
 1 AS `partner_id`,
 1 AS `created_on`,
 1 AS `startwork_on`,
 1 AS `readytodeliver_on`,
 1 AS `closed_on`,
 1 AS `order_value`,
 1 AS `calculated_value`,
 1 AS `final_value`,
 1 AS `currency`,
 1 AS `user_id`,
 1 AS `team`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders_items`
--

DROP TABLE IF EXISTS `orders_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `orders_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL,
  `name` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cat_id` int DEFAULT NULL,
  `unit` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qty` float(10,3) NOT NULL,
  `dlvd_qty` float(10,3) NOT NULL DEFAULT '0.000',
  `unit_price` float(10,3) DEFAULT NULL,
  `vat` float(10,3) DEFAULT NULL,
  `unit_price_wvat` float(10,3) DEFAULT NULL,
  `vat_value` float(10,3) DEFAULT NULL,
  `total_value` float(10,3) DEFAULT NULL,
  `total_value_wvat` float(10,3) DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `match_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `match_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_items_orders1_idx` (`order`),
  KEY `fk_orders_items_catalog1_idx` (`cat_id`),
  KEY `currency` (`currency`),
  KEY `um` (`unit`),
  CONSTRAINT `fk_orders_items_catalog1` FOREIGN KEY (`cat_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_items_ibfk_1` FOREIGN KEY (`order`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_items_ibfk_2` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orders_items_ibfk_3` FOREIGN KEY (`unit`) REFERENCES `units` (`unit`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1069 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_items`
--

LOCK TABLES `orders_items` WRITE;
/*!40000 ALTER TABLE `orders_items` DISABLE KEYS */;
INSERT INTO `orders_items` VALUES (962,75,'jkljkljkljkljkl',49,'buc',10.000,0.000,5.000,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(963,75,'Futterblech Siebkasten / Lagergehäuse / 3D-Combi',1,'buc',6.000,0.000,9.900,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(964,75,'Futterblech Motor / 3D Combi 833+',2,'buc',3.000,0.000,12.800,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(965,75,'Klemmleiste / L1390',39,'buc',9.000,0.000,11.700,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(966,75,'Schubstange / L5450 / Terex',4,'buc',6.000,0.000,352.300,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(967,75,'Klemmleiste / L1450',40,'buc',3.000,0.000,12.500,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(968,75,'Winkel AK OB spg.',6,'buc',39.000,0.000,2.600,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(969,75,'Siebkasten / SZWS 1510x6000 / 693+',7,'buc',3.000,0.000,5689.200,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(970,75,'Aufgabeboden / LW1510 / 693+',41,'buc',3.000,0.000,391.200,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(971,75,'Siebtraverse Schwingrahmen FSC / LW1510 / 693+',51,'buc',54.000,0.000,94.300,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(972,75,'Siebtraverse Grundrahmen FSC / LW 1510 / 683+',42,'buc',51.000,0.000,105.700,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(973,75,'Siebtraverse Grundrahmen Abgab / LW 1510',11,'buc',3.000,0.000,236.400,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(974,75,'Siebtraverse Abgabe / LW 1510',12,'buc',3.000,0.000,432.000,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(975,75,'Winkel Halter Rückwand / 693+',13,'buc',6.000,0.000,7.700,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(976,75,'Rückwand / 693+',14,'buc',3.000,0.000,250.300,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(977,75,'Klemmleiste / Siebdurchgang / 693+',52,'buc',18.000,0.000,41.500,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(978,75,'Konsole Verlagerung fb / ø114',16,'buc',6.000,0.000,120.000,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(979,75,'Verdrehbare Verlagerung / ø114 / 693+',17,'buc',12.000,0.000,81.500,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(980,75,'Vorfertigung Terex Schutzhaube',18,'buc',3.000,0.000,247.000,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(981,75,'Vorfertigung Terex Schutzhaube',18,'buc',3.000,0.000,241.500,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(982,75,'Klemmleiste / L1890',43,'buc',18.000,0.000,15.000,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(983,75,'Klemmleiste / L1450',40,'buc',3.000,0.000,14.300,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(984,75,'Siebtraverse Grundrahmen Abgab / LW 1510',11,'buc',3.000,0.000,411.100,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(985,75,'Futterblech / Schwingtraverse 693+',20,'buc',54.000,0.000,3.700,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(986,75,'Transportsicherung / 693+',21,'buc',12.000,0.000,19.500,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(987,75,'Abdichtung Aufgabe',22,'buc',3.000,0.000,8.100,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(988,75,'Abdichtung Aufgabe spg.',23,'buc',3.000,0.000,8.100,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(989,75,'Winkel AK OB 2 spg.',24,'buc',3.000,0.000,2.900,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(990,75,'Winkel AK OB 2',25,'buc',3.000,0.000,2.900,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(991,75,'Winkel AK OB',53,'buc',39.000,0.000,2.600,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(992,75,'Konsole Verlagerung Fa / ø114',27,'buc',6.000,0.000,120.000,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(993,75,'Transportöse inkl. Schrauben / Typ SEWU / schmale Ausführung',28,'buc',12.000,0.000,39.300,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(994,75,'Schubstange / L5450 / Terex',4,'buc',6.000,0.000,352.700,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(995,75,'Vorrichtung Traverse FSC-Tech / kurz / Fine Side Cover',29,'buc',114.000,0.000,7.700,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(996,75,'Auflage Matte Seitlich',30,'buc',3.000,0.000,1.800,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL),(997,75,'Auflage Matte Seitlich spg.',31,'buc',3.000,0.000,1.800,NULL,NULL,NULL,NULL,NULL,'EUR',NULL,NULL);
/*!40000 ALTER TABLE `orders_items` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `set_catid_when_null` BEFORE INSERT ON `orders_items` FOR EACH ROW if(NEW.cat_id is null) THEN
	SET @cat_id=null;
	if(NEW.match_key is not null and NEW.match_value is not null) THEN
    	SELECT cat_id into @cat_id FROM catalog_meta WHERE meta_key=NEW.match_key AND meta_val=NEW.match_value;
        if(@cat_id is null) THEN
        	INSERT into catalog(name,type,unit) VALUES(NEW.name,"product",NEW.unit);
            SELECT LAST_INSERT_ID() INTO @cat_id;
        end if;
    else
        SELECT id,name INTO @cat_id,@name FROM catalog WHERE name=NEW.name;
        if(@cat_id is null) THEN
        	INSERT into catalog(name,type,unit) VALUES(NEW.name,"product",NEW.unit);
        	SELECT LAST_INSERT_ID() INTO @cat_id;
        end if;
    end if;
    set NEW.cat_id = @cat_id;
end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `deny_dlvdqty_bigger_then_qty` BEFORE UPDATE ON `orders_items` FOR EACH ROW BEGIN
	IF(NEW.dlvd_qty>NEW.qty) THEN
    	SIGNAL SQLSTATE '45004' SET message_text = 'Delivered Qty not allowed to be bigger then ordered Qty';
    END IF;
    IF(NEW.dlvd_qty<0) THEN
    	SIGNAL SQLSTATE '45005' SET message_text = 'Delivered Qty not allowed to be of negative value';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;

--
-- Temporary view structure for view `orders_items_labels`
--

DROP TABLE IF EXISTS `orders_items_labels`;
/*!50001 DROP VIEW IF EXISTS `orders_items_labels`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `orders_items_labels` AS SELECT 
 1 AS `orderId`,
 1 AS `itemId`,
 1 AS `title`,
 1 AS `belegNum`,
 1 AS `docnum`,
 1 AS `partId`,
 1 AS `designId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders_items_meta`
--

DROP TABLE IF EXISTS `orders_items_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `orders_items_meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_item_id` int NOT NULL,
  `meta_key` varchar(100) NOT NULL,
  `meta_val` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `meta_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `direct_edit` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_part_id` (`order_item_id`,`meta_key`),
  CONSTRAINT `orders_items_meta_ibfk_1` FOREIGN KEY (`order_item_id`) REFERENCES `orders_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3349 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_items_meta`
--

LOCK TABLES `orders_items_meta` WRITE;
/*!40000 ALTER TABLE `orders_items_meta` DISABLE KEYS */;
INSERT INTO `orders_items_meta` VALUES (3137,963,'P.A.E_BelegPos.Artikel','3812930',NULL,1),(3138,963,'P.A.P_ZeichnungSpr.Zeichnung','1335620',NULL,1),(3139,964,'P.A.E_BelegPos.Artikel','3812931',NULL,1),(3140,964,'P.A.P_ZeichnungSpr.Zeichnung','1335622',NULL,1),(3141,965,'P.A.E_BelegPos.Artikel','3900089',NULL,1),(3142,965,'P.A.P_ZeichnungSpr.Zeichnung','1002276',NULL,1),(3143,966,'P.A.E_BelegPos.Artikel','3902927',NULL,1),(3144,966,'P.A.P_ZeichnungSpr.Zeichnung','1351073',NULL,1),(3145,967,'P.A.E_BelegPos.Artikel','3903239',NULL,1),(3146,967,'P.A.P_ZeichnungSpr.Zeichnung','1454845',NULL,1),(3147,968,'P.A.E_BelegPos.Artikel','80079069',NULL,1),(3148,968,'P.A.P_ZeichnungSpr.Zeichnung','80079069',NULL,1),(3149,969,'P.A.E_BelegPos.Artikel','80073942',NULL,1),(3150,969,'P.A.P_ZeichnungSpr.Zeichnung','80073942',NULL,1),(3151,970,'P.A.E_BelegPos.Artikel','80073945',NULL,1),(3152,970,'P.A.P_ZeichnungSpr.Zeichnung','80073945',NULL,1),(3153,971,'P.A.E_BelegPos.Artikel','80074017',NULL,1),(3154,971,'P.A.P_ZeichnungSpr.Zeichnung','80074017',NULL,1),(3155,972,'P.A.E_BelegPos.Artikel','80074019',NULL,1),(3156,972,'P.A.P_ZeichnungSpr.Zeichnung','80074019',NULL,1),(3157,973,'P.A.E_BelegPos.Artikel','80074067',NULL,1),(3158,973,'P.A.P_ZeichnungSpr.Zeichnung','80074067',NULL,1),(3159,974,'P.A.E_BelegPos.Artikel','80074071',NULL,1),(3160,974,'P.A.P_ZeichnungSpr.Zeichnung','80074071',NULL,1),(3161,975,'P.A.E_BelegPos.Artikel','80074103',NULL,1),(3162,975,'P.A.P_ZeichnungSpr.Zeichnung','80074103',NULL,1),(3163,976,'P.A.E_BelegPos.Artikel','80074105',NULL,1),(3164,976,'P.A.P_ZeichnungSpr.Zeichnung','80074105',NULL,1),(3165,977,'P.A.E_BelegPos.Artikel','80074121',NULL,1),(3166,977,'P.A.P_ZeichnungSpr.Zeichnung','80074121',NULL,1),(3167,978,'P.A.E_BelegPos.Artikel','80076877',NULL,1),(3168,978,'P.A.P_ZeichnungSpr.Zeichnung','80076877',NULL,1),(3169,979,'P.A.E_BelegPos.Artikel','80078596',NULL,1),(3170,979,'P.A.P_ZeichnungSpr.Zeichnung','80078596',NULL,1),(3171,980,'P.A.E_BelegPos.Artikel','80078710',NULL,1),(3172,980,'P.A.P_ZeichnungSpr.Zeichnung','80078710',NULL,1),(3173,981,'P.A.E_BelegPos.Artikel','80078716',NULL,1),(3174,981,'P.A.P_ZeichnungSpr.Zeichnung','80078716',NULL,1),(3175,982,'P.A.E_BelegPos.Artikel','80078997',NULL,1),(3176,982,'P.A.P_ZeichnungSpr.Zeichnung','80078997',NULL,1),(3177,983,'P.A.E_BelegPos.Artikel','80079015',NULL,1),(3178,983,'P.A.P_ZeichnungSpr.Zeichnung','80079015',NULL,1),(3179,984,'P.A.E_BelegPos.Artikel','80079020',NULL,1),(3180,984,'P.A.P_ZeichnungSpr.Zeichnung','80079020',NULL,1),(3181,985,'P.A.E_BelegPos.Artikel','80079041',NULL,1),(3182,985,'P.A.P_ZeichnungSpr.Zeichnung','80079041',NULL,1),(3183,986,'P.A.E_BelegPos.Artikel','80079043',NULL,1),(3184,986,'P.A.P_ZeichnungSpr.Zeichnung','80079043',NULL,1),(3185,987,'P.A.E_BelegPos.Artikel','80079046',NULL,1),(3186,987,'P.A.P_ZeichnungSpr.Zeichnung','80079046',NULL,1),(3187,988,'P.A.E_BelegPos.Artikel','80079064',NULL,1),(3188,988,'P.A.P_ZeichnungSpr.Zeichnung','80079064',NULL,1),(3189,989,'P.A.E_BelegPos.Artikel','80079065',NULL,1),(3190,989,'P.A.P_ZeichnungSpr.Zeichnung','80079065',NULL,1),(3191,990,'P.A.E_BelegPos.Artikel','80079074',NULL,1),(3192,990,'P.A.P_ZeichnungSpr.Zeichnung','80079074',NULL,1),(3193,991,'P.A.E_BelegPos.Artikel','80079076',NULL,1),(3194,991,'P.A.P_ZeichnungSpr.Zeichnung','80079076',NULL,1),(3195,992,'P.A.E_BelegPos.Artikel','80079083',NULL,1),(3196,992,'P.A.P_ZeichnungSpr.Zeichnung','80079083',NULL,1),(3197,993,'P.A.E_BelegPos.Artikel','80079089',NULL,1),(3198,993,'P.A.P_ZeichnungSpr.Zeichnung','80079089',NULL,1),(3199,994,'P.A.E_BelegPos.Artikel','80082966',NULL,1),(3200,994,'P.A.P_ZeichnungSpr.Zeichnung','80082966',NULL,1),(3201,995,'P.A.E_BelegPos.Artikel','80044766',NULL,1),(3202,995,'P.A.P_ZeichnungSpr.Zeichnung','80044766',NULL,1),(3203,996,'P.A.E_BelegPos.Artikel','80079075',NULL,1),(3204,996,'P.A.P_ZeichnungSpr.Zeichnung','80079075',NULL,1),(3205,997,'P.A.E_BelegPos.Artikel','80079066',NULL,1),(3206,997,'P.A.P_ZeichnungSpr.Zeichnung','80079066',NULL,1);
/*!40000 ALTER TABLE `orders_items_meta` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `create_catalog_meta` AFTER INSERT ON `orders_items_meta` FOR EACH ROW insert ignore into catalog_meta(cat_id,meta_key,meta_val) SELECT cat_id,NEW.meta_key,NEW.meta_val from orders_items WHERE id=NEW.order_item_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;

--
-- Temporary view structure for view `orders_items_wdocnum`
--

DROP TABLE IF EXISTS `orders_items_wdocnum`;
/*!50001 DROP VIEW IF EXISTS `orders_items_wdocnum`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `orders_items_wdocnum` AS SELECT 
 1 AS `id`,
 1 AS `order`,
 1 AS `name`,
 1 AS `cat_id`,
 1 AS `unit`,
 1 AS `qty`,
 1 AS `dlvd_qty`,
 1 AS `unit_price`,
 1 AS `vat`,
 1 AS `unit_price_wvat`,
 1 AS `vat_value`,
 1 AS `total_value`,
 1 AS `total_value_wvat`,
 1 AS `currency`,
 1 AS `match_key`,
 1 AS `match_value`,
 1 AS `docnum`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders_items_wmeta`
--

DROP TABLE IF EXISTS `orders_items_wmeta`;
/*!50001 DROP VIEW IF EXISTS `orders_items_wmeta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `orders_items_wmeta` AS SELECT 
 1 AS `id`,
 1 AS `order`,
 1 AS `name`,
 1 AS `cat_id`,
 1 AS `unit`,
 1 AS `qty`,
 1 AS `dlvd_qty`,
 1 AS `unit_price`,
 1 AS `vat`,
 1 AS `unit_price_wvat`,
 1 AS `vat_value`,
 1 AS `total_value`,
 1 AS `total_value_wvat`,
 1 AS `currency`,
 1 AS `match_key`,
 1 AS `match_value`,
 1 AS `partid`,
 1 AS `design`,
 1 AS `gallery`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders_items_wmeta_notdlvd`
--

DROP TABLE IF EXISTS `orders_items_wmeta_notdlvd`;
/*!50001 DROP VIEW IF EXISTS `orders_items_wmeta_notdlvd`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `orders_items_wmeta_notdlvd` AS SELECT 
 1 AS `id`,
 1 AS `order`,
 1 AS `name`,
 1 AS `cat_id`,
 1 AS `unit`,
 1 AS `qty`,
 1 AS `dlvd_qty`,
 1 AS `unit_price`,
 1 AS `vat`,
 1 AS `unit_price_wvat`,
 1 AS `vat_value`,
 1 AS `total_value`,
 1 AS `total_value_wvat`,
 1 AS `currency`,
 1 AS `match_key`,
 1 AS `match_value`,
 1 AS `partid`,
 1 AS `design`,
 1 AS `gallery`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders_meta`
--

DROP TABLE IF EXISTS `orders_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `orders_meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `meta_val` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`,`meta_key`),
  CONSTRAINT `orders_meta_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_meta`
--

LOCK TABLES `orders_meta` WRITE;
/*!40000 ALTER TABLE `orders_meta` DISABLE KEYS */;
INSERT INTO `orders_meta` VALUES (274,42,'bestellung',''),(275,42,'belegnummer',''),(276,42,'estimated_delivery',''),(277,42,'negotiated_value',''),(278,42,'estimated_work',''),(279,75,'bestellung','348130'),(280,75,'belegnummer',''),(281,75,'estimated_delivery','2021-11-29'),(282,75,'negotiated_value',''),(283,75,'estimated_work','260'),(294,78,'bestellung','348380'),(295,78,'belegnummer',''),(296,78,'estimated_delivery','2021-11-15'),(297,78,'negotiated_value',''),(298,78,'estimated_work','230'),(311,81,'bestellung','10-00348075-0110'),(312,81,'belegnummer','294563'),(313,81,'estimated_delivery','2021-11-22'),(314,81,'negotiated_value',''),(315,81,'estimated_work','300'),(316,82,'bestellung','15-00348869-0010'),(317,82,'belegnummer','294580'),(318,82,'estimated_delivery','2021-11-15'),(319,82,'negotiated_value',''),(320,82,'estimated_work',''),(321,83,'bestellung','10-00348864-0200'),(322,83,'belegnummer','294581'),(323,83,'estimated_delivery','2021-11-22'),(324,83,'negotiated_value',''),(325,83,'estimated_work','60'),(341,87,'bestellung','10-00348121-0210'),(342,87,'belegnummer','294624     294625     294638'),(343,87,'estimated_delivery','2021-11-15'),(344,87,'estimated_work','700'),(345,88,'bestellung','15-00348975-0010'),(346,88,'belegnummer','294640'),(347,88,'estimated_delivery','2021-10-25'),(348,88,'estimated_work',''),(349,89,'bestellung','15-00348975-0010'),(350,89,'belegnummer','294640'),(351,89,'estimated_delivery','2021-11-25'),(352,89,'estimated_work','20'),(353,90,'bestellung','15-00348974-0010'),(354,90,'belegnummer','294669'),(355,90,'estimated_delivery','2021-12-06'),(356,90,'estimated_work',''),(380,96,'bestellung','15-00348896-0010'),(381,96,'belegnummer','294766'),(382,96,'estimated_delivery','2021-11-08'),(383,96,'estimated_work',''),(384,97,'bestellung','15-00348995-0010'),(385,97,'belegnummer','294767'),(386,97,'estimated_delivery','2021-11-08'),(387,97,'estimated_work',''),(388,98,'bestellung','15-00348995-0010'),(389,98,'belegnummer','294767'),(390,98,'estimated_delivery','2021-11-08'),(391,98,'estimated_work',''),(392,99,'bestellung',''),(393,99,'belegnummer',''),(394,99,'estimated_delivery',''),(395,99,'estimated_work','12'),(396,100,'bestellung','15-00349091-0030'),(397,100,'belegnummer','294785'),(398,100,'estimated_delivery','2021-11-29'),(399,100,'estimated_work',''),(400,101,'bestellung','15-00349025-0010'),(401,101,'belegnummer','294788'),(402,101,'estimated_delivery','2021-12-06'),(403,101,'estimated_work',''),(404,102,'bestellung','15-00349048-0010'),(405,102,'belegnummer','294800'),(406,102,'estimated_delivery','2021-12-06'),(407,102,'estimated_work',''),(408,103,'bestellung','LA-00030680'),(409,103,'belegnummer','294848'),(410,103,'estimated_delivery','2021-12-06'),(411,103,'estimated_work',''),(412,75,'documents.other','[]'),(413,104,'bestellung','15-00349083-0010'),(414,104,'belegnummer','294866'),(415,104,'estimated_delivery','2021-12-06'),(416,104,'estimated_work',''),(417,105,'bestellung','10-00348148-0110'),(418,105,'belegnummer','295012'),(419,105,'estimated_delivery','2021-12-13'),(420,105,'estimated_work','303'),(421,106,'bestellung','10-00348398-0110'),(422,106,'belegnummer','295015'),(423,106,'estimated_delivery','2021-12-20'),(424,106,'estimated_work','213'),(425,107,'bestellung','10-00349044-0100'),(426,107,'belegnummer','295027'),(427,107,'estimated_delivery','2022-01-10'),(428,107,'estimated_work',''),(429,108,'bestellung','10-00347417-0110'),(430,108,'belegnummer','295101'),(431,108,'estimated_delivery','2021-12-06'),(432,108,'estimated_work','166'),(433,109,'bestellung','10-00348380-0240'),(434,109,'belegnummer','295145'),(435,109,'estimated_delivery','2021-11-15'),(436,109,'estimated_work',''),(437,110,'bestellung','10-00347146-0210'),(438,110,'belegnummer','295300'),(439,110,'estimated_delivery','2021-12-06'),(440,110,'estimated_work','158'),(441,111,'bestellung','10-00347146-0110'),(442,111,'belegnummer','295351'),(443,111,'estimated_delivery','2021-12-06'),(444,111,'estimated_work','329'),(445,112,'bestellung','15-00349257-0010'),(446,112,'belegnummer','295352'),(447,112,'estimated_delivery','2021-12-20'),(448,112,'estimated_work',''),(449,113,'bestellung','15-00349287-0010'),(450,113,'belegnummer','295353'),(451,113,'estimated_delivery','2021-12-20'),(452,113,'estimated_work',''),(453,114,'bestellung','15-00349227-0060'),(454,114,'belegnummer','295367'),(455,114,'estimated_delivery','2022-01-10'),(456,114,'estimated_work',''),(457,115,'bestellung','349303'),(458,115,'belegnummer',''),(459,115,'estimated_delivery','2021-12-13'),(460,115,'estimated_work',''),(461,116,'bestellung','10-00348816-0110'),(462,116,'belegnummer','295486'),(463,116,'estimated_delivery','2021-12-13'),(464,116,'estimated_work','202');
/*!40000 ALTER TABLE `orders_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orders_states_cnt`
--

DROP TABLE IF EXISTS `orders_states_cnt`;
/*!50001 DROP VIEW IF EXISTS `orders_states_cnt`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `orders_states_cnt` AS SELECT 
 1 AS `state`,
 1 AS `cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders_totalcnt_item`
--

DROP TABLE IF EXISTS `orders_totalcnt_item`;
/*!50001 DROP VIEW IF EXISTS `orders_totalcnt_item`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `orders_totalcnt_item` AS SELECT 
 1 AS `oid`,
 1 AS `docnum`,
 1 AS `cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders_working_hours`
--

DROP TABLE IF EXISTS `orders_working_hours`;
/*!50001 DROP VIEW IF EXISTS `orders_working_hours`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `orders_working_hours` AS SELECT 
 1 AS `order_id`,
 1 AS `total`,
 1 AS `estimated`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `partners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cod_saga` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cod_fiscal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reg_com` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `analitic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `discount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bank_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `branch_rep` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `personal_id_serie` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `personal_id_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `personal_id_issuer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `license_plate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `agent_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_tert` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_vat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `blocked` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_v_vat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cb_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_s_vat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `credit_limit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_customer` tinyint(1) NOT NULL DEFAULT '1',
  `is_supplier` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `cod_fiscal` (`cod_fiscal`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
INSERT INTO `partners` VALUES (0,NULL,'Implicit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-17 07:31:45',1,0),(2,NULL,'Spaleck GmbH & Co. KG','DE124172203','J','Robert-Bosch-Straße 15',NULL,'Bocholt','NRW','Germanny',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-16 07:31:47',1,0);
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `component_id` int NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `component_id` (`component_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recipes_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,38,6,2),(2,38,14,1);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `recipes_expanded`
--

DROP TABLE IF EXISTS `recipes_expanded`;
/*!50001 DROP VIEW IF EXISTS `recipes_expanded`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `recipes_expanded` AS SELECT 
 1 AS `rcpid`,
 1 AS `parent_id`,
 1 AS `id`,
 1 AS `name`,
 1 AS `type`,
 1 AS `unit`,
 1 AS `unit_price`,
 1 AS `currency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `report_agg_order_tt_op`
--

DROP TABLE IF EXISTS `report_agg_order_tt_op`;
/*!50001 DROP VIEW IF EXISTS `report_agg_order_tt_op`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `report_agg_order_tt_op` AS SELECT 
 1 AS `order`,
 1 AS `operation`,
 1 AS `hourly_rate`,
 1 AS `ROUND(SUM(duration)/60,2)`,
 1 AS `name`,
 1 AS `label`,
 1 AS `comments`,
 1 AS `docnum`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `report_agg_order_tt_op_empl`
--

DROP TABLE IF EXISTS `report_agg_order_tt_op_empl`;
/*!50001 DROP VIEW IF EXISTS `report_agg_order_tt_op_empl`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `report_agg_order_tt_op_empl` AS SELECT 
 1 AS `docnum`,
 1 AS `label`,
 1 AS `comments`,
 1 AS `opname`,
 1 AS `d`,
 1 AS `employee`,
 1 AS `operation`,
 1 AS `order`,
 1 AS `hourly_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `report_tt_agg_by_order`
--

DROP TABLE IF EXISTS `report_tt_agg_by_order`;
/*!50001 DROP VIEW IF EXISTS `report_tt_agg_by_order`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `report_tt_agg_by_order` AS SELECT 
 1 AS `duration`,
 1 AS `order`,
 1 AS `operation`,
 1 AS `hourly_rate`,
 1 AS `currency`,
 1 AS `label`,
 1 AS `comments`,
 1 AS `docnum`,
 1 AS `opname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `report_tt_agg_byempl`
--

DROP TABLE IF EXISTS `report_tt_agg_byempl`;
/*!50001 DROP VIEW IF EXISTS `report_tt_agg_byempl`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `report_tt_agg_byempl` AS SELECT 
 1 AS `fname`,
 1 AS `lname`,
 1 AS `employee`,
 1 AS `date`,
 1 AS `order`,
 1 AS `operation`,
 1 AS `duration`,
 1 AS `label`,
 1 AS `comments`,
 1 AS `doc_id`,
 1 AS `docnum`,
 1 AS `opname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `rights` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resource` varchar(200) NOT NULL,
  `acces_type` enum('create','read','update','delete') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `settings` (
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('data_expiry_time','8'),('label_template.ikea','{}'),('label_template.spaleck','^XA\\n^FX Second section with recipient address and permit information.\\n^CFA,25\\n^FO75,25,0^FD<%= relationships.item.attributes.name.substr(0,38) %>^FS\\n^FO75,50,0^FD<%= relationships.item.attributes.name.substr(38,38) %>^FS\\n^FO75,90,0^FDLA: <%= relationships.item.relationships.order.attributes.cust_int_ref !== null ? relationships.item.relationships.order.attributes.cust_int_ref : \"-\" %>^FS\\n^CFA,30\\n^FO75,150,0^FDIN: <%= typeof relationships.item.relationships.order.relationships.orders_meta[0] !== \"undefined\" ? relationships.item.relationships.order.relationships.orders_meta[0].attributes.meta_val : \"-\" %>^FS\\n^FO75,175,0^FDNC: <%= relationships.item.relationships.order.relationships.doc_id.attributes.docnum %>^FS\\n^FO75,200,0^FDTN: <%= typeof relationships.item.relationships.orders_items_meta[0] !== \"undefined\" ? relationships.item.relationships.orders_items_meta[0].attributes.meta_val : \"-\" %>^FS\\n^FO75,225,0^FDZN: <%= typeof relationships.item.relationships.orders_items_meta[1] !== \"undefined\" ? relationships.item.relationships.orders_items_meta[1].attributes.meta_val : \"-\" %>^FS\\n^FO75,250,0^FD<%= attributes.seqno %> / <%= relationships.item.relationships.delivery_items_aggregated[0].attributes.totalcnt %>^FS\\n^BY2,3.0,150\\n^FO750,145,1^BCN,90,Y,N,N^FD<%= id %>^FS\\n^XZ '),('module.catalog','1'),('module.deliveries','1'),('module.employees','1'),('module.jobs','1'),('module.orders','1'),('module.partners','1'),('module.teams','1'),('module.timetracking','1'),('module.units','1'),('module.users','1'),('standard_vat','19'),('timetracking.close_openslots_after','5'),('timetracking.stop_after','540');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_document_numbers`
--

DROP TABLE IF EXISTS `settings_document_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `settings_document_numbers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `label` varchar(45) DEFAULT NULL,
  `series` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `lastissued` int NOT NULL,
  `maxval` int DEFAULT NULL,
  `validfrom` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `validto` datetime DEFAULT '2051-04-01 08:30:52',
  `last_udpated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  CONSTRAINT `settings_document_numbers_ibfk_1` FOREIGN KEY (`type`) REFERENCES `settings_document_types` (`type`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_document_numbers`
--

LOCK TABLES `settings_document_numbers` WRITE;
/*!40000 ALTER TABLE `settings_document_numbers` DISABLE KEYS */;
INSERT INTO `settings_document_numbers` VALUES (1,'order','order','A',1093,NULL,'2021-04-01 08:30:52','2022-04-01 08:30:52','2021-10-19 13:29:49'),(3,'receptie','receptie','',149,NULL,'2021-07-23 15:21:56','2051-04-01 08:30:52','2021-10-19 13:29:26'),(4,'transfer','transfer','',139,NULL,'2021-07-23 15:38:39','2051-04-01 08:30:52','2021-10-19 13:29:26');
/*!40000 ALTER TABLE `settings_document_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_document_types`
--

DROP TABLE IF EXISTS `settings_document_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `settings_document_types` (
  `type` varchar(50) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_document_types`
--

LOCK TABLES `settings_document_types` WRITE;
/*!40000 ALTER TABLE `settings_document_types` DISABLE KEYS */;
INSERT INTO `settings_document_types` VALUES ('order',NULL),('receptie',NULL),('transfer',NULL),('vanzare',NULL);
/*!40000 ALTER TABLE `settings_document_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `started_work`
--

DROP TABLE IF EXISTS `started_work`;
/*!50001 DROP VIEW IF EXISTS `started_work`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `started_work` AS SELECT 
 1 AS `id`,
 1 AS `employee`,
 1 AS `start`,
 1 AS `stop`,
 1 AS `worktime`,
 1 AS `operation`,
 1 AS `operation_name`,
 1 AS `order`,
 1 AS `order_label`,
 1 AS `hourly_rate`,
 1 AS `currency`,
 1 AS `card`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `stocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(45) DEFAULT NULL,
  `type` enum('mp','mf','cn') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq` (`type`,`location`),
  KEY `location` (`location`),
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,'materii prime','mp',1),(2,'marfuri','mf',NULL);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks_registry`
--

DROP TABLE IF EXISTS `stocks_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `stocks_registry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `contcontabil` varchar(20) NOT NULL,
  `locatie` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` float(10,3) NOT NULL,
  `ordered_qty` int DEFAULT NULL,
  `unit_price` int NOT NULL,
  `vat_level` float(2,2) NOT NULL,
  `doc_id` int NOT NULL,
  `order_item` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contcontabil` (`contcontabil`),
  KEY `doc_id` (`doc_id`),
  KEY `locatie` (`locatie`),
  KEY `order_item` (`order_item`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `stocks_registry_ibfk_1` FOREIGN KEY (`contcontabil`) REFERENCES `conturi_contabile` (`cont`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `stocks_registry_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stocks_registry_ibfk_3` FOREIGN KEY (`locatie`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stocks_registry_ibfk_4` FOREIGN KEY (`order_item`) REFERENCES `orders_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stocks_registry_ibfk_5` FOREIGN KEY (`product_id`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks_registry`
--

LOCK TABLES `stocks_registry` WRITE;
/*!40000 ALTER TABLE `stocks_registry` DISABLE KEYS */;
/*!40000 ALTER TABLE `stocks_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!50001 DROP VIEW IF EXISTS `tags`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `tags` AS SELECT 
 1 AS `emplid`,
 1 AS `fname`,
 1 AS `lname`,
 1 AS `card`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `teams` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teamlead` int DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `fk_table1_employees1_idx` (`teamlead`),
  CONSTRAINT `fk_table1_employees1` FOREIGN KEY (`teamlead`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Echipa A',104),(2,'Echipa B',111),(3,'Echipa C',103),(4,'Echipa D',117),(5,'Echipa E',146);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `fld` int NOT NULL,
  `order` int NOT NULL,
  `bittape` bit(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetracking`
--

DROP TABLE IF EXISTS `timetracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `timetracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee` int NOT NULL,
  `team` int DEFAULT NULL,
  `start` datetime DEFAULT CURRENT_TIMESTAMP,
  `stop` datetime DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `operation` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `hourly_rate` float(10,2) DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` enum('w','f') NOT NULL DEFAULT 'w',
  PRIMARY KEY (`id`),
  KEY `fk_timetracking_employees1_idx` (`employee`),
  KEY `fk_timetracking_catalog1_idx` (`operation`),
  KEY `fk_timetracking_orders1_idx` (`order`),
  KEY `fk_timetracking_currencies1_idx` (`currency`),
  KEY `team` (`team`),
  CONSTRAINT `fk_timetracking_catalog1` FOREIGN KEY (`operation`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_timetracking_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_timetracking_employees1` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `timetracking_ibfk_1` FOREIGN KEY (`order`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timetracking_ibfk_2` FOREIGN KEY (`team`) REFERENCES `teams` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1296 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetracking`
--

LOCK TABLES `timetracking` WRITE;
/*!40000 ALTER TABLE `timetracking` DISABLE KEYS */;
INSERT INTO `timetracking` VALUES (13,87,4,'2021-10-13 10:08:57','2021-10-13 10:11:48',2,32,72,25.00,'EUR','f'),(14,89,4,'2021-10-13 10:09:23','2021-10-13 10:09:35',0,32,72,25.00,'EUR','f'),(15,89,4,'2021-10-13 10:10:56','2021-10-13 10:11:10',0,32,72,25.00,'EUR','f'),(16,87,4,'2021-10-13 10:12:08','2021-10-13 10:12:48',0,32,72,25.00,'EUR','f'),(17,87,4,'2021-10-13 10:13:02','2021-10-13 10:18:12',5,32,72,25.00,'EUR','f'),(18,110,NULL,'2021-10-13 10:15:39','2021-10-13 10:15:59',0,33,72,25.00,'EUR','f'),(21,87,4,'2021-10-13 10:18:41','2021-10-13 12:36:52',138,32,72,25.00,'EUR','f'),(23,118,4,'2021-10-13 10:22:53','2021-10-13 12:33:52',130,33,72,25.00,'EUR','f'),(25,89,4,'2021-10-14 04:01:23','2021-10-14 07:18:36',197,32,72,25.00,'EUR','f'),(26,87,4,'2021-10-14 04:01:42','2021-10-14 07:17:39',195,32,72,25.00,'EUR','f'),(27,99,1,'2021-10-14 04:02:00','2021-10-14 07:26:00',204,0,62,0.00,'EUR','f'),(31,105,2,'2021-10-14 04:16:00','2021-10-14 07:26:00',190,0,73,0.00,'EUR','f'),(32,91,3,'2021-10-14 04:17:16','2021-10-14 10:42:33',385,33,73,25.00,'EUR','f'),(33,128,4,'2021-10-14 04:17:00','2021-10-14 07:26:00',189,0,73,0.00,'EUR','w'),(34,141,3,'2021-10-14 04:29:29','2021-10-14 12:26:57',477,32,73,25.00,'EUR','f'),(35,126,1,'2021-10-14 04:31:00','2021-10-14 07:26:00',175,0,73,0.00,'EUR','f'),(36,121,3,'2021-10-14 04:33:04','2021-10-14 04:33:19',0,32,73,25.00,'EUR','f'),(37,121,3,'2021-10-14 04:33:00','2021-10-14 07:26:00',173,0,62,0.00,'EUR','f'),(38,111,2,'2021-10-14 04:34:19','2021-10-14 12:29:00',474,32,68,25.00,'EUR','f'),(39,115,2,'2021-10-14 04:38:30','2021-10-14 04:52:43',14,32,68,25.00,'EUR','f'),(40,105,2,'2021-10-14 04:46:10','2021-10-14 12:14:22',448,33,68,25.00,'EUR','f'),(41,115,2,'2021-10-14 04:53:00','2021-10-14 04:54:00',1,32,68,25.00,'EUR','f'),(42,107,1,'2021-10-14 05:28:00','2021-10-14 07:26:00',118,0,57,0.00,'EUR','f'),(43,107,1,'2021-10-14 05:28:00','2021-10-14 07:26:00',118,0,66,0.00,'EUR','w'),(44,121,3,'2021-10-14 05:35:56','2021-10-14 12:28:31',412,32,73,25.00,'EUR','f'),(45,104,1,'2021-10-14 05:36:00','2021-10-14 07:27:00',111,0,57,0.00,'EUR','w'),(46,125,4,'2021-10-14 05:37:03','2021-10-14 12:20:27',403,32,72,25.00,'EUR','f'),(47,99,1,'2021-10-14 05:38:21','2021-10-14 06:04:45',26,33,73,25.00,'EUR','f'),(48,115,2,'2021-10-14 06:14:27','2021-10-14 07:00:12',45,32,68,25.00,'EUR','f'),(49,99,1,'2021-10-14 06:24:00','2021-10-14 07:27:00',63,0,73,0.00,'EUR','f'),(50,99,1,'2021-10-14 06:39:15','2021-10-14 06:39:53',0,33,75,25.00,'EUR','f'),(51,126,1,'2021-10-14 06:47:00','2021-10-14 07:26:00',39,0,73,0.00,'EUR','w'),(52,115,2,'2021-10-14 07:30:16','2021-10-14 12:21:18',291,32,68,25.00,'EUR','f'),(55,89,4,'2021-10-14 10:03:41','2021-10-14 12:20:45',137,32,72,25.00,'EUR','f'),(56,87,4,'2021-10-14 10:05:32','2021-10-14 12:19:56',134,32,72,25.00,'EUR','f'),(58,92,NULL,'2021-10-14 10:24:33','2021-10-14 10:35:16',10,33,68,25.00,'EUR','f'),(60,92,NULL,'2021-10-14 10:36:50','2021-10-14 12:22:12',105,33,68,25.00,'EUR','f'),(61,91,3,'2021-10-14 10:42:00','2021-10-14 12:16:00',94,0,62,0.00,'EUR','f'),(62,99,1,'2021-10-14 11:04:46','2021-10-14 11:05:42',0,33,73,25.00,'EUR','f'),(63,99,1,'2021-10-14 11:10:16','2021-10-14 11:27:07',16,33,73,25.00,'EUR','f'),(64,99,1,'2021-10-14 11:32:24','2021-10-14 11:32:40',0,33,75,25.00,'EUR','f'),(65,99,1,'2021-10-14 11:32:00','2021-10-14 12:16:00',44,0,62,0.00,'EUR','f'),(66,126,1,'2021-10-14 11:51:17','2021-10-14 11:51:28',0,33,75,25.00,'EUR','f'),(68,107,1,'2021-10-14 12:20:10','2021-10-14 12:20:26',0,32,75,25.00,'EUR','f'),(74,118,4,'2021-10-15 06:56:00','2021-10-15 14:51:00',475,33,72,25.00,'EUR','f'),(75,111,2,'2021-10-15 06:56:36','2021-10-15 10:01:33',184,32,68,25.00,'EUR','f'),(76,97,2,'2021-10-15 06:56:50','2021-10-15 10:00:21',183,32,68,25.00,'EUR','f'),(77,134,NULL,'2021-10-15 06:57:00','2021-10-15 10:00:00',183,0,62,0.00,'EUR','f'),(78,115,2,'2021-10-15 06:59:55','2021-10-15 10:00:43',180,32,68,25.00,'EUR','f'),(79,91,3,'2021-10-15 07:00:00','2021-10-15 08:45:00',105,0,62,0.00,'EUR','f'),(80,103,3,'2021-10-15 07:00:00','2021-10-15 14:59:00',479,33,73,25.00,'EUR','f'),(81,141,3,'2021-10-15 07:00:00','2021-10-15 15:00:00',480,32,73,25.00,'EUR','f'),(82,121,3,'2021-10-15 07:01:00','2021-10-15 07:19:00',18,0,64,0.00,'EUR','f'),(83,108,3,'2021-10-15 07:01:00','2021-10-15 07:20:00',19,0,64,0.00,'EUR','f'),(84,99,1,'2021-10-15 07:01:00','2021-10-15 10:01:00',180,0,62,0.00,'EUR','f'),(85,105,2,'2021-10-15 07:01:00','2021-10-15 15:00:00',479,33,68,25.00,'EUR','f'),(87,126,1,'2021-10-15 07:02:37','2021-10-15 14:43:27',460,33,75,25.00,'EUR','f'),(88,110,NULL,'2021-10-15 07:03:16','2021-10-15 15:00:10',476,33,72,25.00,'EUR','f'),(89,87,4,'2021-10-15 07:03:00','2021-10-15 15:01:00',478,32,72,25.00,'EUR','f'),(90,125,4,'2021-10-15 07:03:41','2021-10-15 14:59:56',476,32,72,25.00,'EUR','f'),(91,89,4,'2021-10-15 07:04:25','2021-10-15 14:57:11',472,32,72,25.00,'EUR','f'),(92,107,1,'2021-10-15 07:06:10','2021-10-15 09:59:09',172,32,57,25.00,'EUR','f'),(94,92,2,'2021-10-15 07:17:00','2021-10-15 15:16:00',479,33,68,25.00,'EUR','f'),(95,121,3,'2021-10-15 07:20:02','2021-10-15 10:00:08',160,32,73,25.00,'EUR','f'),(96,108,3,'2021-10-15 07:20:00','2021-10-15 15:17:00',477,32,73,25.00,'EUR','f'),(97,91,3,'2021-10-15 08:45:58','2021-10-15 09:45:40',59,33,73,25.00,'EUR','f'),(98,91,3,'2021-10-15 09:45:00','2021-10-15 10:13:00',28,0,73,0.00,'EUR','f'),(99,134,NULL,'2021-10-15 10:29:00','2021-10-15 15:24:00',295,0,62,0.00,'EUR','f'),(100,111,2,'2021-10-15 10:29:51','2021-10-15 15:30:39',300,32,68,25.00,'EUR','f'),(101,115,2,'2021-10-15 10:30:15','2021-10-15 15:23:55',293,32,68,25.00,'EUR','f'),(102,107,1,'2021-10-15 10:31:00','2021-10-15 11:14:00',43,0,57,0.00,'EUR','f'),(103,121,3,'2021-10-15 10:32:01','2021-10-15 14:09:58',217,32,73,25.00,'EUR','f'),(104,91,3,'2021-10-15 10:34:11','2021-10-15 11:03:15',29,33,73,25.00,'EUR','f'),(105,97,2,'2021-10-15 10:46:37','2021-10-15 13:59:50',193,32,68,25.00,'EUR','f'),(106,99,1,'2021-10-15 10:48:00','2021-10-15 15:16:00',268,0,62,0.00,'EUR','f'),(107,91,3,'2021-10-15 11:03:00','2021-10-15 15:15:00',252,0,62,0.00,'EUR','f'),(108,107,1,'2021-10-15 11:14:37','2021-10-15 15:26:30',251,32,75,25.00,'EUR','f'),(109,128,4,'2021-10-15 11:32:00','2021-10-15 15:15:11',223,0,57,0.00,'EUR','f'),(112,104,1,'2021-10-15 13:06:21','2021-10-15 15:23:42',137,32,75,25.00,'EUR','f'),(113,121,3,'2021-10-15 14:10:06','2021-10-15 14:22:19',12,32,73,25.00,'EUR','f'),(115,121,3,'2021-10-15 14:22:00','2021-10-15 14:27:34',5,0,72,0.00,'EUR','w'),(116,97,2,'2021-10-15 14:35:42','2021-10-15 15:24:08',48,32,68,25.00,'EUR','f'),(117,126,1,'2021-10-15 14:43:42','2021-10-15 14:43:53',0,33,75,25.00,'EUR','f'),(122,141,3,'2021-10-18 06:58:11','2021-10-18 10:01:17',183,32,73,25.00,'EUR','f'),(123,87,4,'2021-10-18 06:59:23','2021-10-18 10:01:11',181,32,72,25.00,'EUR','f'),(124,121,3,'2021-10-18 06:59:36','2021-10-18 10:01:04',181,32,73,25.00,'EUR','f'),(125,111,2,'2021-10-18 06:59:36','2021-10-18 10:00:16',180,32,68,25.00,'EUR','f'),(126,134,NULL,'2021-10-18 06:59:00','2021-10-18 10:00:00',181,0,62,0.00,'EUR','f'),(127,108,3,'2021-10-18 06:59:53','2021-10-18 10:01:22',181,32,73,25.00,'EUR','f'),(128,125,4,'2021-10-18 07:00:01','2021-10-18 10:00:21',180,32,72,25.00,'EUR','f'),(129,115,2,'2021-10-18 07:00:04','2021-10-18 10:00:09',180,32,68,25.00,'EUR','f'),(130,110,NULL,'2021-10-18 07:00:11','2021-10-18 09:58:04',177,33,72,25.00,'EUR','f'),(131,118,4,'2021-10-18 07:00:14','2021-10-18 10:00:09',179,33,72,25.00,'EUR','f'),(132,89,4,'2021-10-18 07:00:20','2021-10-18 09:59:24',179,32,72,25.00,'EUR','f'),(133,126,1,'2021-10-18 07:00:45','2021-10-18 10:00:04',179,33,75,25.00,'EUR','f'),(134,99,1,'2021-10-18 07:01:00','2021-10-18 10:07:23',186,0,62,0.00,'EUR','w'),(135,103,3,'2021-10-18 07:01:31','2021-10-18 10:00:15',178,33,73,25.00,'EUR','f'),(136,97,2,'2021-10-18 07:01:47','2021-10-18 08:48:00',106,32,68,25.00,'EUR','f'),(137,105,2,'2021-10-18 07:01:56','2021-10-18 09:57:41',175,33,68,25.00,'EUR','f'),(138,128,4,'2021-10-18 07:02:00','2021-10-18 09:23:00',141,0,57,0.00,'EUR','f'),(139,91,3,'2021-10-18 07:02:00','2021-10-18 08:24:00',82,0,62,0.00,'EUR','f'),(140,107,1,'2021-10-18 07:03:08','2021-10-18 10:00:41',177,32,75,25.00,'EUR','f'),(141,104,1,'2021-10-18 08:10:00','2021-10-18 10:00:00',110,32,75,25.00,'EUR','w'),(142,91,3,'2021-10-18 08:24:00','2021-10-18 09:58:00',94,0,72,0.00,'EUR','f'),(143,128,4,'2021-10-18 09:23:00','2021-10-18 10:03:00',40,0,75,0.00,'EUR','f'),(145,110,NULL,'2021-10-18 10:27:54','2021-10-18 15:31:36',303,33,72,25.00,'EUR','f'),(146,87,4,'2021-10-18 10:28:31','2021-10-18 15:24:53',296,32,72,25.00,'EUR','f'),(147,111,2,'2021-10-18 10:30:07','2021-10-18 15:18:49',288,32,68,25.00,'EUR','f'),(148,89,4,'2021-10-18 10:30:13','2021-10-18 15:24:31',294,32,72,25.00,'EUR','f'),(149,92,NULL,'2021-10-18 10:30:00','2021-10-18 12:23:00',113,33,72,0.00,'EUR','f'),(150,125,4,'2021-10-18 10:30:23','2021-10-18 15:29:44',299,32,72,25.00,'EUR','f'),(151,118,4,'2021-10-18 10:30:32','2021-10-18 15:16:31',285,33,72,25.00,'EUR','f'),(152,126,1,'2021-10-18 10:30:00','2021-10-18 13:31:00',181,33,75,25.00,'EUR','f'),(153,115,2,'2021-10-18 10:30:44','2021-10-18 15:18:29',287,32,68,25.00,'EUR','f'),(154,103,3,'2021-10-18 10:30:54','2021-10-18 11:21:23',50,33,73,25.00,'EUR','f'),(155,105,2,'2021-10-18 10:31:00','2021-10-18 12:46:00',135,33,72,0.00,'EUR','f'),(156,141,3,'2021-10-18 10:31:23','2021-10-18 12:59:39',148,32,73,25.00,'EUR','f'),(157,134,NULL,'2021-10-18 10:31:00','2021-10-18 15:18:00',287,32,72,0.00,'EUR','f'),(158,128,4,'2021-10-18 10:31:00','2021-10-18 13:31:00',180,0,75,0.00,'EUR','f'),(159,108,3,'2021-10-18 10:33:26','2021-10-18 12:34:46',121,32,73,25.00,'EUR','f'),(160,121,3,'2021-10-18 10:34:19','2021-10-18 12:59:19',145,32,73,25.00,'EUR','f'),(161,107,1,'2021-10-18 10:34:30','2021-10-18 15:28:02',293,32,75,25.00,'EUR','f'),(162,91,3,'2021-10-18 10:42:00','2021-10-18 15:16:00',274,33,72,0.00,'EUR','f'),(163,97,2,'2021-10-18 11:00:49','2021-10-18 13:47:41',166,32,68,25.00,'EUR','f'),(164,104,1,'2021-10-18 10:30:00','2021-10-18 16:31:45',361,32,75,25.00,'EUR','f'),(165,103,3,'2021-10-18 11:21:38','2021-10-18 15:17:10',235,33,72,25.00,'EUR','f'),(166,92,NULL,'2021-10-18 11:24:00','2021-10-18 12:22:02',58,33,72,25.00,'EUR','f'),(167,99,1,'2021-10-18 11:36:00','2021-10-18 14:06:00',150,0,62,0.00,'EUR','f'),(168,92,NULL,'2021-10-18 12:09:00','2021-10-18 15:17:00',188,33,72,0.00,'EUR','f'),(169,108,3,'2021-10-18 12:34:56','2021-10-18 15:23:35',168,32,72,25.00,'EUR','f'),(170,105,2,'2021-10-18 12:46:00','2021-10-18 15:16:00',150,33,72,0.00,'EUR','f'),(171,121,3,'2021-10-18 12:59:31','2021-10-18 15:23:45',144,32,72,25.00,'EUR','f'),(172,141,3,'2021-10-18 12:59:55','2021-10-18 15:24:04',144,32,72,25.00,'EUR','f'),(173,126,1,'2021-10-18 13:31:40','2021-10-18 14:58:33',86,33,75,25.00,'EUR','f'),(174,128,4,'2021-10-18 13:32:00','2021-10-18 15:30:00',118,33,72,0.00,'EUR','w'),(175,99,1,'2021-10-18 14:06:19','2021-10-18 15:17:03',70,33,75,25.00,'EUR','f'),(179,97,2,'2021-10-18 15:17:58','2021-10-18 15:18:07',0,32,68,25.00,'EUR','f'),(181,109,NULL,'2021-10-18 15:23:42','2021-10-18 15:23:54',0,34,72,0.00,'EUR','f'),(182,120,NULL,'2021-10-18 15:37:51','2021-10-18 17:41:47',123,34,78,0.00,'EUR','f'),(183,132,NULL,'2021-10-18 15:38:38','2021-10-18 19:12:17',213,34,78,0.00,'EUR','f'),(184,120,NULL,'2021-10-18 17:41:00','2021-10-18 19:11:00',90,34,72,0.00,'EUR','f'),(185,120,NULL,'2021-10-18 19:12:02','2021-10-18 19:53:18',41,34,72,0.00,'EUR','f'),(186,132,NULL,'2021-10-18 19:12:00','2021-10-18 19:47:00',35,34,78,0.00,'EUR','f'),(188,132,NULL,'2021-10-18 19:48:00','2021-10-18 20:05:17',17,34,72,0.00,'EUR','f'),(189,120,NULL,'2021-10-18 19:53:34','2021-10-18 22:32:18',158,34,78,0.00,'EUR','f'),(190,132,NULL,'2021-10-18 20:05:26','2021-10-18 22:32:33',147,34,78,0.00,'EUR','f'),(191,120,NULL,'2021-10-18 22:32:00','2021-10-18 22:55:00',23,34,75,0.00,'EUR','f'),(192,132,NULL,'2021-10-18 22:32:00','2021-10-18 22:54:00',22,34,75,0.00,'EUR','f'),(193,87,4,'2021-10-19 06:59:00','2021-10-19 14:58:00',479,32,72,25.00,'EUR','f'),(194,111,2,'2021-10-19 06:59:24','2021-10-19 09:59:40',180,32,68,25.00,'EUR','f'),(195,125,4,'2021-10-19 06:59:36','2021-10-19 09:59:57',180,32,72,25.00,'EUR','f'),(196,121,3,'2021-10-19 07:00:00','2021-10-19 07:26:00',26,32,62,0.00,'EUR','f'),(197,134,NULL,'2021-10-19 07:00:00','2021-10-19 09:58:00',178,33,62,0.00,'EUR','f'),(198,115,2,'2021-10-19 07:00:23','2021-10-19 07:34:33',34,32,68,25.00,'EUR','f'),(199,141,3,'2021-10-19 07:00:00','2021-10-19 14:59:00',479,32,72,25.00,'EUR','f'),(200,118,4,'2021-10-19 07:00:54','2021-10-19 09:58:50',177,33,72,25.00,'EUR','f'),(201,126,1,'2021-10-19 07:01:01','2021-10-19 14:44:39',463,33,75,25.00,'EUR','f'),(202,107,1,'2021-10-19 07:01:07','2021-10-19 10:00:32',179,32,75,25.00,'EUR','f'),(203,103,3,'2021-10-19 07:01:16','2021-10-19 08:48:19',107,33,72,25.00,'EUR','f'),(204,100,NULL,'2021-10-19 07:01:29','2021-10-19 10:07:00',185,34,75,0.00,'EUR','f'),(205,91,3,'2021-10-19 07:01:33','2021-10-19 09:36:20',154,33,72,25.00,'EUR','f'),(206,128,4,'2021-10-19 07:01:00','2021-10-19 09:39:00',158,33,72,0.00,'EUR','f'),(207,93,NULL,'2021-10-19 07:01:49','2021-10-19 10:06:53',185,34,75,0.00,'EUR','f'),(208,105,2,'2021-10-19 07:02:24','2021-10-19 09:57:53',175,33,72,25.00,'EUR','f'),(209,92,2,'2021-10-19 07:03:00','2021-10-19 09:58:00',175,33,62,0.00,'EUR','f'),(210,109,NULL,'2021-10-19 07:03:15','2021-10-19 07:29:58',26,34,78,0.00,'EUR','f'),(211,99,1,'2021-10-19 07:03:00','2021-10-19 08:40:00',97,33,72,0.00,'EUR','f'),(212,108,3,'2021-10-19 07:03:52','2021-10-19 08:02:21',58,32,72,25.00,'EUR','f'),(213,110,4,'2021-10-19 07:09:05','2021-10-19 09:59:00',169,33,72,25.00,'EUR','f'),(214,121,3,'2021-10-19 07:26:00','2021-10-19 09:57:00',151,32,62,0.00,'EUR','f'),(215,109,NULL,'2021-10-19 07:30:08','2021-10-19 08:03:37',33,34,73,0.00,'EUR','f'),(216,97,2,'2021-10-19 07:34:00','2021-10-19 09:17:00',103,32,78,0.00,'EUR','f'),(217,115,2,'2021-10-19 07:34:00','2021-10-19 09:17:00',103,32,78,0.00,'EUR','f'),(218,104,1,'2021-10-19 08:01:12','2021-10-19 10:00:19',119,32,75,25.00,'EUR','f'),(219,108,3,'2021-10-19 08:02:37','2021-10-19 09:00:06',57,32,73,25.00,'EUR','f'),(220,109,NULL,'2021-10-19 08:03:49','2021-10-19 08:57:58',54,34,75,0.00,'EUR','f'),(221,99,1,'2021-10-19 08:40:15','2021-10-19 09:58:23',78,33,75,25.00,'EUR','f'),(222,103,3,'2021-10-19 08:48:27','2021-10-19 09:38:38',50,33,73,25.00,'EUR','f'),(223,109,NULL,'2021-10-19 08:58:23','2021-10-19 09:50:08',51,34,75,0.00,'EUR','f'),(224,108,3,'2021-10-19 09:00:17','2021-10-19 09:58:20',58,32,72,25.00,'EUR','f'),(225,97,2,'2021-10-19 09:17:39','2021-10-19 09:58:06',40,32,78,25.00,'EUR','f'),(226,115,2,'2021-10-19 09:18:01','2021-10-19 10:00:44',42,32,78,25.00,'EUR','f'),(227,91,3,'2021-10-19 09:36:00','2021-10-19 09:58:00',22,33,62,0.00,'EUR','f'),(228,103,3,'2021-10-19 09:39:00','2021-10-19 09:59:59',20,33,72,25.00,'EUR','f'),(230,109,NULL,'2021-10-19 09:50:19','2021-10-19 09:53:52',3,34,88,0.00,'EUR','f'),(231,109,NULL,'2021-10-19 09:54:07','2021-10-19 13:43:38',229,34,75,0.00,'EUR','f'),(232,105,2,'2021-10-19 10:28:42','2021-10-19 11:54:32',85,33,72,25.00,'EUR','f'),(233,121,3,'2021-10-19 10:28:47','2021-10-19 15:27:44',298,32,73,25.00,'EUR','f'),(234,110,4,'2021-10-19 10:29:29','2021-10-19 15:30:54',301,33,72,25.00,'EUR','f'),(235,125,4,'2021-10-19 10:29:41','2021-10-19 15:27:30',297,32,72,25.00,'EUR','f'),(236,118,4,'2021-10-19 10:30:05','2021-10-19 15:17:13',287,33,72,25.00,'EUR','f'),(237,115,2,'2021-10-19 10:30:07','2021-10-19 10:30:16',0,32,68,25.00,'EUR','f'),(238,91,3,'2021-10-19 10:30:00','2021-10-19 15:19:00',289,33,62,0.00,'EUR','f'),(239,115,2,'2021-10-19 10:30:29','2021-10-19 15:24:50',294,32,78,25.00,'EUR','f'),(240,103,3,'2021-10-19 10:30:44','2021-10-19 15:23:27',292,33,72,25.00,'EUR','f'),(241,111,2,'2021-10-19 10:30:45','2021-10-19 15:25:34',294,32,68,25.00,'EUR','f'),(242,107,1,'2021-10-19 10:30:58','2021-10-19 15:28:21',297,32,75,25.00,'EUR','f'),(243,97,2,'2021-10-19 10:30:58','2021-10-19 12:09:28',98,32,68,25.00,'EUR','f'),(244,108,3,'2021-10-19 10:31:15','2021-10-19 10:46:22',15,32,72,25.00,'EUR','f'),(245,92,2,'2021-10-19 10:31:38','2021-10-19 15:23:02',291,33,68,25.00,'EUR','f'),(246,128,4,'2021-10-19 10:31:00','2021-10-19 15:01:00',270,33,57,0.00,'EUR','f'),(247,134,NULL,'2021-10-19 10:33:00','2021-10-19 15:19:00',286,32,62,0.00,'EUR','f'),(248,104,1,'2021-10-19 10:33:00','2021-10-19 16:33:00',360,32,75,25.00,'EUR','w'),(249,100,NULL,'2021-10-19 10:34:08','2021-10-19 15:20:58',286,34,75,0.00,'EUR','f'),(250,93,NULL,'2021-10-19 10:34:23','2021-10-19 15:18:35',284,34,75,0.00,'EUR','f'),(251,108,3,'2021-10-19 10:46:41','2021-10-19 15:27:12',280,32,73,25.00,'EUR','f'),(252,105,2,'2021-10-19 11:55:00','2021-10-19 13:36:21',101,33,78,25.00,'EUR','f'),(253,97,2,'2021-10-19 12:09:48','2021-10-19 15:19:18',189,32,78,25.00,'EUR','f'),(254,105,2,'2021-10-19 13:36:34','2021-10-19 15:13:30',96,33,68,25.00,'EUR','f'),(255,109,NULL,'2021-10-19 14:40:50','2021-10-19 15:21:52',41,34,75,0.00,'EUR','f'),(257,132,NULL,'2021-10-19 15:32:31','2021-10-19 21:16:35',344,34,81,0.00,'EUR','f'),(258,132,NULL,'2021-10-19 21:16:47','2021-10-19 22:21:03',64,34,78,0.00,'EUR','f'),(259,132,NULL,'2021-10-19 22:21:00','2021-10-19 22:48:00',27,0,72,0.00,'EUR','f'),(260,121,3,'2021-10-20 06:59:37','2021-10-20 06:59:44',0,32,73,25.00,'EUR','f'),(262,111,2,'2021-10-20 06:59:58','2021-10-20 10:03:15',183,32,68,25.00,'EUR','f'),(263,99,1,'2021-10-20 07:00:03','2021-10-20 10:01:27',181,33,75,25.00,'EUR','f'),(264,134,NULL,'2021-10-20 07:00:00','2021-10-20 10:14:00',194,32,62,0.00,'EUR','f'),(265,87,4,'2021-10-20 07:00:07','2021-10-20 09:51:38',171,32,72,25.00,'EUR','f'),(266,118,4,'2021-10-20 07:00:09','2021-10-20 09:27:20',147,33,72,25.00,'EUR','f'),(267,115,2,'2021-10-20 07:00:17','2021-10-20 08:11:05',70,32,78,25.00,'EUR','f'),(268,141,3,'2021-10-20 07:00:28','2021-10-20 10:00:56',180,32,72,25.00,'EUR','f'),(269,91,3,'2021-10-20 07:00:00','2021-10-20 09:58:00',178,33,62,25.00,'EUR','f'),(270,126,1,'2021-10-20 07:00:47','2021-10-20 10:01:14',180,33,75,25.00,'EUR','f'),(271,103,3,'2021-10-20 07:01:04','2021-10-20 07:52:30',51,33,72,25.00,'EUR','f'),(272,107,1,'2021-10-20 07:01:09','2021-10-20 10:00:48',179,32,75,25.00,'EUR','f'),(273,110,4,'2021-10-20 07:01:24','2021-10-20 09:57:53',176,33,72,25.00,'EUR','f'),(274,92,2,'2021-10-20 07:01:31','2021-10-20 09:59:51',178,33,68,25.00,'EUR','f'),(275,125,4,'2021-10-20 07:01:32','2021-10-20 10:03:01',181,32,72,25.00,'EUR','f'),(276,105,2,'2021-10-20 07:01:52','2021-10-20 09:57:57',176,33,68,25.00,'EUR','f'),(277,128,4,'2021-10-20 07:02:00','2021-10-20 11:27:51',265,33,72,25.00,'EUR','f'),(278,97,2,'2021-10-20 07:03:19','2021-10-20 10:30:43',207,32,78,25.00,'EUR','f'),(279,100,NULL,'2021-10-20 07:04:22','2021-10-20 12:29:08',324,34,75,0.00,'EUR','f'),(280,93,NULL,'2021-10-20 07:05:25','2021-10-20 12:29:55',324,34,75,0.00,'EUR','f'),(281,109,NULL,'2021-10-20 07:08:25','2021-10-20 13:02:26',354,34,81,0.00,'EUR','f'),(283,103,3,'2021-10-20 07:52:00','2021-10-20 10:00:00',128,33,62,25.00,'EUR','f'),(284,115,2,'2021-10-20 08:11:42','2021-10-20 09:17:49',66,32,68,25.00,'EUR','f'),(285,115,2,'2021-10-20 09:18:02','2021-10-20 10:00:17',42,32,78,25.00,'EUR','f'),(286,118,4,'2021-10-20 09:27:00','2021-10-20 10:00:00',33,33,62,0.00,'EUR','f'),(287,128,4,'2021-10-20 09:31:00','2021-10-20 10:04:00',33,33,62,25.00,'EUR','f'),(288,87,4,'2021-10-20 10:27:30','2021-10-20 15:18:08',290,32,72,25.00,'EUR','f'),(289,110,4,'2021-10-20 10:27:40','2021-10-20 15:32:24',304,33,72,25.00,'EUR','f'),(290,125,4,'2021-10-20 10:27:48','2021-10-20 15:18:38',290,32,72,25.00,'EUR','f'),(292,118,4,'2021-10-20 10:28:00','2021-10-20 15:18:00',290,33,62,0.00,'EUR','f'),(293,108,3,'2021-10-20 10:29:00','2021-10-20 12:56:00',147,32,81,0.00,'EUR','f'),(294,111,2,'2021-10-20 10:29:00','2021-10-20 15:15:00',286,32,78,25.00,'EUR','w'),(295,91,3,'2021-10-20 10:29:00','2021-10-20 15:20:00',291,33,62,0.00,'EUR','w'),(296,115,2,'2021-10-20 10:29:43','2021-10-20 15:25:36',295,32,78,25.00,'EUR','f'),(297,99,1,'2021-10-20 10:29:50','2021-10-20 15:23:04',293,33,75,25.00,'EUR','f'),(298,92,2,'2021-10-20 10:30:20','2021-10-20 11:45:16',74,33,68,25.00,'EUR','f'),(299,107,1,'2021-10-20 10:30:27','2021-10-20 15:28:00',297,32,75,25.00,'EUR','f'),(300,105,2,'2021-10-20 10:30:59','2021-10-20 11:27:45',56,33,68,25.00,'EUR','f'),(301,97,2,'2021-10-20 10:31:02','2021-10-20 15:18:14',287,32,68,25.00,'EUR','f'),(302,103,3,'2021-10-20 10:31:00','2021-10-20 15:20:00',289,33,62,0.00,'EUR','w'),(303,134,NULL,'2021-10-20 10:31:00','2021-10-20 15:18:00',287,32,62,0.00,'EUR','f'),(304,126,1,'2021-10-20 10:31:51','2021-10-20 15:00:59',269,33,75,25.00,'EUR','f'),(305,128,4,'2021-10-20 10:31:00','2021-10-20 13:05:00',154,33,68,0.00,'EUR','f'),(306,104,1,'2021-10-20 11:11:15','2021-10-20 16:31:49',320,32,75,25.00,'EUR','f'),(307,105,2,'2021-10-20 11:28:05','2021-10-20 15:16:29',228,33,78,25.00,'EUR','f'),(308,92,2,'2021-10-20 11:45:31','2021-10-20 15:22:20',216,33,78,25.00,'EUR','f'),(309,100,NULL,'2021-10-20 12:29:32','2021-10-20 15:25:40',176,34,81,0.00,'EUR','f'),(310,93,NULL,'2021-10-20 12:30:11','2021-10-20 15:27:36',177,34,81,0.00,'EUR','f'),(314,109,NULL,'2021-10-20 13:02:40','2021-10-20 14:30:11',87,34,83,0.00,'EUR','f'),(316,109,NULL,'2021-10-20 14:30:20','2021-10-20 14:49:28',19,34,75,0.00,'EUR','f'),(317,109,NULL,'2021-10-20 14:49:37','2021-10-20 15:31:25',41,34,78,0.00,'EUR','f'),(318,132,NULL,'2021-10-20 15:13:41','2021-10-20 22:50:18',456,34,72,0.00,'EUR','f'),(321,120,NULL,'2021-10-20 15:34:38','2021-10-20 22:50:13',435,34,72,0.00,'EUR','f'),(324,118,4,'2021-10-21 06:59:00','2021-10-21 14:58:00',479,33,62,0.00,'EUR','w'),(325,99,1,'2021-10-21 06:59:54','2021-10-21 10:01:29',181,33,75,25.00,'EUR','f'),(326,91,3,'2021-10-21 07:00:00','2021-10-21 09:58:00',178,33,62,0.00,'EUR','f'),(327,125,4,'2021-10-21 07:00:02','2021-10-21 09:58:21',178,32,72,25.00,'EUR','f'),(328,110,4,'2021-10-21 07:00:10','2021-10-21 09:01:33',121,33,72,25.00,'EUR','f'),(329,103,3,'2021-10-21 07:00:00','2021-10-21 09:59:00',179,33,62,0.00,'EUR','f'),(330,126,1,'2021-10-21 07:00:29','2021-10-21 10:01:11',180,33,75,25.00,'EUR','f'),(332,87,4,'2021-10-21 07:00:43','2021-10-21 09:58:28',177,32,72,25.00,'EUR','f'),(333,115,2,'2021-10-21 07:01:14','2021-10-21 10:00:38',179,32,78,25.00,'EUR','f'),(334,108,3,'2021-10-21 07:01:18','2021-10-21 10:00:46',179,32,81,25.00,'EUR','f'),(335,97,2,'2021-10-21 07:01:40','2021-10-21 10:00:59',179,32,78,25.00,'EUR','f'),(336,92,2,'2021-10-21 07:01:46','2021-10-21 15:01:01',479,33,78,25.00,'EUR','w'),(337,134,NULL,'2021-10-21 07:01:00','2021-10-21 10:06:00',185,33,62,0.00,'EUR','f'),(338,105,2,'2021-10-21 07:02:03','2021-10-21 09:58:08',176,33,78,25.00,'EUR','f'),(339,128,4,'2021-10-21 07:02:00','2021-10-21 08:56:00',114,33,78,0.00,'EUR','f'),(340,100,NULL,'2021-10-21 07:03:45','2021-10-21 08:17:20',73,34,75,0.00,'EUR','f'),(341,93,NULL,'2021-10-21 07:03:58','2021-10-21 08:16:47',72,34,75,0.00,'EUR','f'),(342,109,NULL,'2021-10-21 07:05:17','2021-10-21 11:36:39',271,34,83,0.00,'EUR','f'),(343,107,1,'2021-10-21 08:00:10','2021-10-21 10:00:39',120,32,75,25.00,'EUR','f'),(344,104,1,'2021-10-21 08:00:38','2021-10-21 15:01:01',420,32,75,25.00,'EUR','w'),(345,93,NULL,'2021-10-21 08:17:09','2021-10-21 15:01:01',403,34,81,0.00,'EUR','w'),(346,100,NULL,'2021-10-21 08:17:35','2021-10-21 15:01:01',403,34,81,0.00,'EUR','w'),(347,128,4,'2021-10-21 08:56:00','2021-10-21 11:59:00',183,33,62,25.00,'EUR','f'),(349,110,4,'2021-10-21 09:07:12','2021-10-21 09:58:15',51,32,57,25.00,'EUR','f'),(350,111,2,'2021-10-21 07:00:00','2021-10-21 10:01:00',181,32,68,25.00,'EUR','f'),(351,87,4,'2021-10-21 10:27:29','2021-10-21 15:01:01',273,32,72,25.00,'EUR','w'),(352,110,4,'2021-10-21 10:27:59','2021-10-21 15:01:01',273,32,57,25.00,'EUR','w'),(353,125,4,'2021-10-21 10:28:17','2021-10-21 15:01:01',272,32,72,25.00,'EUR','w'),(354,108,3,'2021-10-21 10:29:52','2021-10-21 15:01:01',271,32,81,25.00,'EUR','w'),(355,115,2,'2021-10-21 10:29:59','2021-10-21 15:01:01',271,32,78,25.00,'EUR','w'),(356,103,3,'2021-10-21 10:30:00','2021-10-21 15:16:58',286,33,62,0.00,'EUR','w'),(357,121,3,'2021-10-21 10:30:02','2021-10-21 13:23:03',173,32,81,25.00,'EUR','f'),(358,111,2,'2021-10-21 10:30:08','2021-10-21 15:01:01',270,32,68,25.00,'EUR','w'),(359,141,3,'2021-10-21 10:30:26','2021-10-21 15:01:01',270,32,73,25.00,'EUR','w'),(360,105,2,'2021-10-21 10:30:45','2021-10-21 15:01:01',270,33,78,25.00,'EUR','w'),(361,107,1,'2021-10-21 10:31:47','2021-10-21 15:01:01',269,32,75,25.00,'EUR','w'),(362,126,1,'2021-10-21 10:33:02','2021-10-21 14:41:56',248,33,75,25.00,'EUR','f'),(363,91,3,'2021-10-21 10:33:00','2021-10-21 15:01:00',268,33,62,0.00,'EUR','w'),(364,97,2,'2021-10-21 10:40:22','2021-10-21 15:01:01',260,32,68,25.00,'EUR','w'),(365,109,NULL,'2021-10-21 11:36:49','2021-10-21 12:58:41',81,34,75,0.00,'EUR','f'),(366,140,1,'2021-10-21 11:54:40','2021-10-21 15:01:01',186,32,75,25.00,'EUR','w'),(367,128,4,'2021-10-21 12:00:00','2021-10-21 15:01:00',181,33,62,25.00,'EUR','w'),(368,134,NULL,'2021-10-21 12:32:00','2021-10-21 15:01:00',149,32,62,0.00,'EUR','w'),(369,109,NULL,'2021-10-21 12:58:50','2021-10-21 15:01:01',122,34,78,0.00,'EUR','w'),(370,121,3,'2021-10-21 13:23:00','2021-10-21 15:01:00',98,32,62,25.00,'EUR','w'),(372,97,2,'2021-10-21 15:11:07','2021-10-21 15:20:50',9,32,68,25.00,'EUR','f'),(373,132,NULL,'2021-10-21 15:12:32','2021-10-21 16:01:01',48,34,78,0.00,'EUR','w'),(374,120,NULL,'2021-10-21 15:12:49','2021-10-21 16:01:01',48,34,78,0.00,'EUR','w'),(376,105,2,'2021-10-21 15:17:29','2021-10-21 16:01:01',43,33,68,25.00,'EUR','w'),(380,115,2,'2021-10-21 15:19:43','2021-10-21 15:20:28',0,32,68,25.00,'EUR','f'),(382,115,2,'2021-10-21 15:21:32','2021-10-21 15:21:40',0,32,78,25.00,'EUR','f'),(384,111,2,'2021-10-21 15:26:05','2021-10-21 15:26:12',0,32,68,25.00,'EUR','f'),(387,121,3,'2021-10-21 15:28:19','2021-10-21 15:28:24',0,32,73,25.00,'EUR','f'),(388,108,3,'2021-10-21 15:28:52','2021-10-21 16:01:01',32,32,81,25.00,'EUR','w'),(391,110,4,'2021-10-21 15:30:47','2021-10-21 16:01:01',30,33,72,25.00,'EUR','w'),(393,104,1,'2021-10-21 16:38:02','2021-10-21 17:01:01',22,32,75,25.00,'EUR','w'),(396,140,1,'2021-10-22 06:56:32','2021-10-22 10:10:01',193,32,75,25.00,'EUR','f'),(397,87,4,'2021-10-22 06:57:37','2021-10-22 09:53:27',175,32,72,25.00,'EUR','f'),(398,111,2,'2021-10-22 06:57:00','2021-10-22 09:59:00',182,32,78,25.00,'EUR','f'),(399,125,4,'2021-10-22 06:57:46','2021-10-22 09:54:10',176,32,72,25.00,'EUR','f'),(400,110,4,'2021-10-22 06:58:03','2021-10-22 07:11:08',13,32,57,25.00,'EUR','f'),(401,107,1,'2021-10-22 06:58:12','2021-10-22 09:59:58',181,32,75,25.00,'EUR','f'),(402,99,1,'2021-10-22 06:58:52','2021-10-22 10:10:01',191,33,75,25.00,'EUR','f'),(403,118,4,'2021-10-22 06:58:00','2021-10-22 08:07:00',69,33,62,0.00,'EUR','f'),(404,121,3,'2021-10-22 06:59:00','2021-10-22 09:59:00',180,32,62,0.00,'EUR','f'),(405,141,3,'2021-10-22 06:59:22','2021-10-22 09:58:48',179,32,81,25.00,'EUR','f'),(406,108,3,'2021-10-22 06:59:32','2021-10-22 09:59:45',180,32,81,25.00,'EUR','f'),(407,91,3,'2021-10-22 06:59:00','2021-10-22 09:57:00',178,33,62,0.00,'EUR','f'),(408,126,1,'2021-10-22 07:00:26','2021-10-22 10:03:21',182,33,75,25.00,'EUR','f'),(409,92,2,'2021-10-22 07:00:42','2021-10-22 09:57:36',176,33,78,25.00,'EUR','f'),(410,103,3,'2021-10-22 07:00:00','2021-10-22 13:35:26',395,33,62,0.00,'EUR','f'),(411,105,2,'2021-10-22 07:01:12','2021-10-22 09:57:31',176,33,78,25.00,'EUR','f'),(412,115,2,'2021-10-22 07:02:42','2021-10-22 09:59:13',176,32,78,25.00,'EUR','f'),(413,134,3,'2021-10-22 07:03:00','2021-10-22 09:59:00',176,0,62,0.00,'EUR','f'),(414,100,NULL,'2021-10-22 07:04:07','2021-10-22 08:05:40',61,34,75,0.00,'EUR','f'),(415,93,NULL,'2021-10-22 07:04:21','2021-10-22 08:05:10',60,34,75,0.00,'EUR','f'),(416,97,2,'2021-10-22 07:05:47','2021-10-22 09:59:07',173,32,68,25.00,'EUR','f'),(417,110,4,'2021-10-22 07:11:18','2021-10-22 09:56:33',165,33,72,25.00,'EUR','f'),(418,109,NULL,'2021-10-22 07:46:57','2021-10-22 09:32:25',105,34,78,0.00,'EUR','f'),(419,104,1,'2021-10-22 08:02:01','2021-10-22 10:10:01',128,32,75,25.00,'EUR','f'),(420,93,NULL,'2021-10-22 08:05:24','2021-10-22 10:10:01',124,34,81,0.00,'EUR','f'),(421,100,NULL,'2021-10-22 08:05:54','2021-10-22 10:10:01',124,34,81,0.00,'EUR','f'),(422,118,4,'2021-10-22 08:07:26','2021-10-22 09:57:25',109,33,72,25.00,'EUR','f'),(423,109,NULL,'2021-10-22 09:32:34','2021-10-22 10:10:01',37,34,81,0.00,'EUR','f'),(424,108,3,'2021-10-22 10:29:17','2021-10-22 15:26:01',296,32,81,25.00,'EUR','f'),(425,107,1,'2021-10-22 10:29:30','2021-10-22 15:26:15',296,32,75,25.00,'EUR','f'),(426,115,2,'2021-10-22 10:30:19','2021-10-22 15:17:28',287,32,78,25.00,'EUR','f'),(427,111,2,'2021-10-22 10:30:00','2021-10-22 15:17:00',287,32,78,25.00,'EUR','w'),(428,103,3,'2021-10-22 10:30:00','2021-10-22 14:20:00',230,33,62,25.00,'EUR','f'),(429,97,2,'2021-10-22 10:30:53','2021-10-22 15:17:22',286,32,68,25.00,'EUR','f'),(430,121,3,'2021-10-22 10:30:00','2021-10-22 15:17:00',287,32,62,25.00,'EUR','w'),(432,134,3,'2021-10-22 10:31:00','2021-10-22 15:14:00',283,32,62,25.00,'EUR','f'),(433,141,3,'2021-10-22 10:31:22','2021-10-22 15:26:08',294,32,81,25.00,'EUR','f'),(434,91,3,'2021-10-22 10:31:00','2021-10-22 12:13:00',102,32,62,0.00,'EUR','f'),(435,92,2,'2021-10-22 10:31:47','2021-10-22 15:16:08',284,33,78,25.00,'EUR','f'),(436,126,1,'2021-10-22 10:31:57','2021-10-22 14:45:17',253,33,75,25.00,'EUR','f'),(437,110,4,'2021-10-22 10:32:00','2021-10-22 15:19:40',287,33,72,25.00,'EUR','f'),(438,105,2,'2021-10-22 10:32:24','2021-10-22 15:14:13',281,33,78,25.00,'EUR','f'),(439,118,4,'2021-10-22 10:32:28','2021-10-22 12:27:20',114,33,72,25.00,'EUR','f'),(440,99,1,'2021-10-22 10:36:03','2021-10-22 12:50:41',134,33,75,25.00,'EUR','f'),(441,125,4,'2021-10-22 10:49:47','2021-10-22 12:59:06',129,32,83,25.00,'EUR','f'),(442,87,4,'2021-10-22 11:00:37','2021-10-22 12:59:53',119,32,89,25.00,'EUR','f'),(443,91,3,'2021-10-22 12:13:52','2021-10-22 15:14:02',180,33,81,25.00,'EUR','f'),(444,125,4,'2021-10-22 12:59:21','2021-10-22 15:19:31',140,32,72,25.00,'EUR','f'),(445,87,4,'2021-10-22 13:00:01','2021-10-22 15:19:55',139,32,72,25.00,'EUR','f'),(447,132,NULL,'2021-10-22 15:04:41','2021-10-22 19:42:52',278,34,78,0.00,'EUR','f'),(448,111,2,'2021-10-22 15:18:04','2021-10-22 15:19:17',1,32,78,25.00,'EUR','f'),(452,121,3,'2021-10-22 15:25:25','2021-10-22 15:25:52',0,32,73,25.00,'EUR','f'),(453,104,1,'2021-10-22 16:34:27','2021-10-22 16:34:34',0,32,75,25.00,'EUR','f'),(454,132,NULL,'2021-10-22 19:43:01','2021-10-22 20:38:26',55,34,78,0.00,'EUR','f'),(457,132,NULL,'2021-10-22 21:10:58','2021-10-22 22:35:45',84,34,87,0.00,'EUR','f'),(458,107,1,'2021-10-25 06:58:26','2021-10-25 10:00:26',182,32,75,25.00,'EUR','f'),(459,134,3,'2021-10-25 07:00:00','2021-10-25 10:00:00',180,32,62,0.00,'EUR','f'),(460,121,3,'2021-10-25 07:01:00','2021-10-25 10:10:00',189,32,62,0.00,'EUR','f'),(461,125,4,'2021-10-25 07:01:23','2021-10-25 10:02:53',181,32,83,25.00,'EUR','f'),(462,126,1,'2021-10-25 07:01:23','2021-10-25 10:02:57',181,33,75,25.00,'EUR','f'),(463,87,4,'2021-10-25 07:01:34','2021-10-25 10:10:01',188,32,72,25.00,'EUR','f'),(464,92,2,'2021-10-25 07:01:34','2021-10-25 10:02:35',181,33,78,25.00,'EUR','f'),(465,103,3,'2021-10-25 07:01:55','2021-10-25 10:03:34',181,33,81,25.00,'EUR','f'),(466,110,4,'2021-10-25 07:02:01','2021-10-25 07:35:28',33,32,57,25.00,'EUR','f'),(467,111,2,'2021-10-25 07:02:12','2021-10-25 10:04:21',182,32,78,25.00,'EUR','f'),(468,141,3,'2021-10-25 07:02:42','2021-10-25 10:00:15',177,32,81,25.00,'EUR','f'),(469,97,2,'2021-10-25 07:02:53','2021-10-25 10:02:12',179,32,78,25.00,'EUR','f'),(470,128,4,'2021-10-25 07:03:00','2021-10-25 07:55:00',52,33,82,0.00,'EUR','f'),(471,118,4,'2021-10-25 07:03:00','2021-10-25 10:00:00',177,32,72,0.00,'EUR','f'),(472,91,3,'2021-10-25 07:03:59','2021-10-25 10:10:01',186,33,81,25.00,'EUR','f'),(473,108,3,'2021-10-25 07:04:20','2021-10-25 10:00:36',176,32,81,25.00,'EUR','f'),(474,115,2,'2021-10-25 07:04:26','2021-10-25 10:00:24',175,32,78,25.00,'EUR','f'),(475,99,1,'2021-10-25 07:04:50','2021-10-25 10:03:47',178,33,75,25.00,'EUR','f'),(476,120,NULL,'2021-10-25 07:06:23','2021-10-25 10:00:19',173,34,87,0.00,'EUR','f'),(477,132,NULL,'2021-10-25 07:07:24','2021-10-25 09:59:08',171,34,87,0.00,'EUR','f'),(478,109,NULL,'2021-10-25 07:07:53','2021-10-25 09:40:35',152,34,81,0.00,'EUR','f'),(479,104,1,'2021-10-25 07:32:37','2021-10-25 10:01:47',149,32,75,25.00,'EUR','f'),(480,128,4,'2021-10-25 07:55:00','2021-10-25 10:05:00',130,33,83,0.00,'EUR','f'),(481,109,NULL,'2021-10-25 09:40:50','2021-10-25 10:10:01',29,34,98,0.00,'EUR','f'),(482,108,3,'2021-10-25 10:29:18','2021-10-25 15:28:51',299,32,81,25.00,'EUR','f'),(483,141,3,'2021-10-25 10:29:38','2021-10-25 15:26:49',297,32,81,25.00,'EUR','f'),(484,120,NULL,'2021-10-25 10:29:51','2021-10-25 15:35:15',305,34,87,0.00,'EUR','f'),(485,111,2,'2021-10-25 10:29:52','2021-10-25 15:36:26',306,32,78,25.00,'EUR','f'),(486,115,2,'2021-10-25 10:30:12','2021-10-25 15:21:18',291,32,78,25.00,'EUR','f'),(487,125,4,'2021-10-25 10:30:23','2021-10-25 15:12:19',281,32,83,25.00,'EUR','f'),(488,134,3,'2021-10-25 10:30:00','2021-10-25 12:59:29',149,32,62,0.00,'EUR','w'),(489,118,4,'2021-10-25 10:30:00','2021-10-25 13:05:00',155,33,83,0.00,'EUR','f'),(490,103,3,'2021-10-25 10:31:49','2021-10-25 15:22:17',290,33,81,25.00,'EUR','f'),(491,132,NULL,'2021-10-25 10:31:50','2021-10-25 14:31:03',239,34,87,0.00,'EUR','f'),(493,126,1,'2021-10-25 10:32:05','2021-10-25 14:44:36',252,33,75,25.00,'EUR','f'),(495,99,1,'2021-10-25 10:32:28','2021-10-25 15:21:40',289,33,75,25.00,'EUR','f'),(496,87,4,'2021-10-25 10:43:56','2021-10-25 10:44:04',0,32,72,25.00,'EUR','f'),(497,97,2,'2021-10-25 10:44:14','2021-10-25 15:18:53',274,32,68,25.00,'EUR','f'),(498,87,4,'2021-10-25 11:01:35','2021-10-25 15:02:21',240,32,98,25.00,'EUR','f'),(500,109,NULL,'2021-10-25 11:37:07','2021-10-25 13:51:59',134,34,81,0.00,'EUR','f'),(501,118,4,'2021-10-25 13:05:40','2021-10-25 15:12:13',126,33,83,25.00,'EUR','f'),(502,107,1,'2021-10-25 13:34:41','2021-10-25 15:28:37',113,32,75,25.00,'EUR','f'),(503,110,4,'2021-10-25 13:43:38','2021-10-25 15:12:44',89,32,57,25.00,'EUR','f'),(504,109,NULL,'2021-10-25 13:52:08','2021-10-25 14:31:33',39,34,90,0.00,'EUR','f'),(505,91,3,'2021-10-25 13:55:37','2021-10-25 15:21:50',86,33,81,25.00,'EUR','f'),(506,100,NULL,'2021-10-25 15:14:03','2021-10-25 22:49:37',455,34,81,0.00,'EUR','f'),(510,107,1,'2021-10-26 06:55:26','2021-10-26 09:55:26',180,32,75,25.00,'EUR','f'),(511,111,2,'2021-10-26 07:00:15','2021-10-26 10:07:08',186,32,78,25.00,'EUR','f'),(512,115,2,'2021-10-26 07:00:27','2021-10-26 09:55:18',174,32,78,25.00,'EUR','f'),(513,132,NULL,'2021-10-26 07:01:19','2021-10-26 10:10:01',188,34,87,0.00,'EUR','f'),(514,134,3,'2021-10-26 07:01:00','2021-10-26 09:20:00',139,33,62,0.00,'EUR','f'),(515,99,1,'2021-10-26 07:01:33','2021-10-26 09:55:35',174,33,75,25.00,'EUR','f'),(516,118,4,'2021-10-26 07:01:53','2021-10-26 08:36:54',95,33,83,25.00,'EUR','f'),(517,126,1,'2021-10-26 07:02:04','2021-10-26 09:55:03',172,33,75,25.00,'EUR','f'),(518,125,4,'2021-10-26 07:02:14','2021-10-26 09:54:58',172,32,83,25.00,'EUR','f'),(519,91,3,'2021-10-26 07:02:14','2021-10-26 09:55:49',173,33,81,25.00,'EUR','f'),(520,128,4,'2021-10-26 07:02:00','2021-10-26 09:56:00',174,33,78,0.00,'EUR','f'),(521,87,4,'2021-10-26 07:02:30','2021-10-26 08:25:33',83,32,98,25.00,'EUR','f'),(522,108,3,'2021-10-26 07:02:44','2021-10-26 10:04:03',181,32,81,25.00,'EUR','f'),(523,141,3,'2021-10-26 07:02:54','2021-10-26 09:55:48',172,32,81,25.00,'EUR','f'),(524,103,3,'2021-10-26 07:03:06','2021-10-26 09:55:43',172,33,81,25.00,'EUR','f'),(525,110,4,'2021-10-26 07:03:11','2021-10-26 09:54:47',171,33,83,25.00,'EUR','f'),(526,92,2,'2021-10-26 07:03:20','2021-10-26 09:56:32',173,33,78,25.00,'EUR','f'),(527,120,NULL,'2021-10-26 07:04:36','2021-10-26 08:53:44',109,34,87,0.00,'EUR','f'),(528,109,NULL,'2021-10-26 07:05:07','2021-10-26 10:10:01',184,34,90,0.00,'EUR','f'),(529,104,1,'2021-10-26 07:17:28','2021-10-26 09:55:39',158,32,75,25.00,'EUR','f'),(530,87,4,'2021-10-26 08:25:53','2021-10-26 09:56:06',90,32,83,25.00,'EUR','f'),(531,118,4,'2021-10-26 08:37:16','2021-10-26 08:57:14',19,33,83,25.00,'EUR','f'),(533,120,NULL,'2021-10-26 08:55:53','2021-10-26 09:29:42',33,34,82,0.00,'EUR','f'),(534,118,4,'2021-10-26 08:57:24','2021-10-26 09:55:03',57,33,98,25.00,'EUR','f'),(535,134,3,'2021-10-26 09:21:03','2021-10-26 09:55:11',34,32,81,25.00,'EUR','f'),(536,120,NULL,'2021-10-26 09:29:55','2021-10-26 10:10:01',40,34,87,0.00,'EUR','f'),(538,125,4,'2021-10-26 10:30:41','2021-10-26 15:27:10',296,32,83,25.00,'EUR','f'),(539,110,4,'2021-10-26 10:31:06','2021-10-26 15:24:26',293,33,83,25.00,'EUR','f'),(540,97,2,'2021-10-26 10:31:08','2021-10-26 12:46:39',135,32,78,25.00,'EUR','f'),(541,118,4,'2021-10-26 10:31:16','2021-10-26 15:11:02',279,33,98,25.00,'EUR','f'),(542,134,3,'2021-10-26 10:31:28','2021-10-26 15:19:31',288,32,81,25.00,'EUR','f'),(543,115,2,'2021-10-26 10:31:36','2021-10-26 15:20:48',289,32,78,25.00,'EUR','f'),(544,108,3,'2021-10-26 10:31:43','2021-10-26 15:27:33',295,32,81,25.00,'EUR','f'),(545,87,4,'2021-10-26 10:31:44','2021-10-26 12:45:50',134,32,83,25.00,'EUR','f'),(546,91,3,'2021-10-26 10:31:56','2021-10-26 15:20:17',288,33,81,25.00,'EUR','f'),(547,111,2,'2021-10-26 10:31:58','2021-10-26 15:27:04',295,32,78,25.00,'EUR','f'),(548,92,2,'2021-10-26 10:32:06','2021-10-26 15:24:36',292,33,78,25.00,'EUR','f'),(549,107,1,'2021-10-26 10:32:20','2021-10-26 15:29:29',297,32,75,25.00,'EUR','f'),(550,103,3,'2021-10-26 10:32:21','2021-10-26 13:09:13',156,33,81,25.00,'EUR','f'),(551,126,1,'2021-10-26 10:32:36','2021-10-26 14:41:27',248,33,75,25.00,'EUR','f'),(552,141,3,'2021-10-26 10:32:53','2021-10-26 15:27:13',294,32,81,25.00,'EUR','f'),(554,87,4,'2021-10-26 12:46:17','2021-10-26 15:15:53',149,32,98,25.00,'EUR','f'),(556,97,2,'2021-10-26 13:41:31','2021-10-26 15:19:41',98,32,78,25.00,'EUR','f'),(557,103,3,'2021-10-26 13:55:37','2021-10-26 15:20:04',84,33,81,25.00,'EUR','f'),(558,109,NULL,'2021-10-26 14:24:52','2021-10-26 15:32:58',68,34,89,0.00,'EUR','f'),(560,104,1,'2021-10-26 10:30:00','2021-10-26 15:30:00',300,32,75,25.00,'EUR','w'),(561,100,NULL,'2021-10-26 15:32:52','2021-10-26 22:47:02',434,34,87,0.00,'EUR','f'),(563,107,1,'2021-10-27 06:57:05','2021-10-27 10:00:44',183,32,75,25.00,'EUR','f'),(564,87,4,'2021-10-27 06:59:07','2021-10-27 07:44:26',45,32,98,25.00,'EUR','f'),(565,110,4,'2021-10-27 06:59:41','2021-10-27 10:00:29',180,33,83,25.00,'EUR','f'),(566,92,2,'2021-10-27 07:00:29','2021-10-27 10:10:01',189,33,78,25.00,'EUR','f'),(567,99,1,'2021-10-27 07:00:43','2021-10-27 10:00:47',180,33,75,25.00,'EUR','f'),(568,118,4,'2021-10-27 07:00:54','2021-10-27 10:00:30',179,33,83,25.00,'EUR','f'),(569,126,1,'2021-10-27 07:01:02','2021-10-27 10:00:41',179,33,75,25.00,'EUR','f'),(570,91,3,'2021-10-27 07:01:11','2021-10-27 10:00:11',179,33,81,25.00,'EUR','f'),(571,103,3,'2021-10-27 07:01:22','2021-10-27 09:59:54',178,33,81,25.00,'EUR','f'),(572,108,3,'2021-10-27 07:01:52','2021-10-27 10:00:01',178,32,81,25.00,'EUR','f'),(573,141,3,'2021-10-27 07:02:11','2021-10-27 09:59:43',177,32,81,25.00,'EUR','f'),(574,134,3,'2021-10-27 07:02:00','2021-10-27 07:02:00',0,32,90,25.00,'EUR','f'),(575,128,4,'2021-10-27 07:02:00','2021-10-27 10:10:00',188,33,89,25.00,'EUR','f'),(576,134,3,'2021-10-27 07:02:33','2021-10-27 08:49:54',107,32,81,25.00,'EUR','f'),(577,115,2,'2021-10-27 07:02:41','2021-10-27 09:59:09',176,32,78,25.00,'EUR','f'),(578,111,2,'2021-10-27 07:02:53','2021-10-27 10:03:14',180,32,78,25.00,'EUR','f'),(579,104,1,'2021-10-27 07:03:16','2021-10-27 10:10:01',186,32,75,25.00,'EUR','f'),(580,109,NULL,'2021-10-27 07:05:01','2021-10-27 07:56:55',51,34,89,0.00,'EUR','f'),(581,125,4,'2021-10-27 07:10:47','2021-10-27 10:00:38',169,32,90,25.00,'EUR','f'),(582,87,4,'2021-10-27 07:44:44','2021-10-27 09:59:02',134,32,90,25.00,'EUR','f'),(583,109,NULL,'2021-10-27 07:57:08','2021-10-27 10:10:01',132,34,87,0.00,'EUR','f'),(584,134,3,'2021-10-27 08:50:04','2021-10-27 09:59:34',69,32,90,25.00,'EUR','f'),(586,107,1,'2021-10-27 10:23:48','2021-10-27 15:28:59',305,32,75,25.00,'EUR','f'),(587,108,3,'2021-10-27 10:29:42','2021-10-27 15:29:58',300,32,81,25.00,'EUR','f'),(588,103,3,'2021-10-27 10:29:49','2021-10-27 15:23:46',293,33,81,25.00,'EUR','f'),(589,126,1,'2021-10-27 10:29:54','2021-10-27 14:47:21',257,33,75,25.00,'EUR','f'),(590,99,1,'2021-10-27 10:30:12','2021-10-27 12:43:10',132,33,75,25.00,'EUR','f'),(592,115,2,'2021-10-27 10:30:50','2021-10-27 15:28:39',297,32,78,25.00,'EUR','f'),(593,111,2,'2021-10-27 10:31:07','2021-10-27 15:30:36',299,32,78,25.00,'EUR','f'),(594,118,4,'2021-10-27 10:31:49','2021-10-27 15:12:17',280,33,83,25.00,'EUR','f'),(595,128,4,'2021-10-27 10:32:00','2021-10-27 12:00:00',88,33,75,25.00,'EUR','f'),(596,97,2,'2021-10-27 10:32:22','2021-10-27 15:17:01',284,32,78,25.00,'EUR','f'),(597,125,4,'2021-10-27 10:32:26','2021-10-27 13:49:46',197,32,90,25.00,'EUR','f'),(598,110,4,'2021-10-27 10:33:14','2021-10-27 15:27:00',293,33,83,25.00,'EUR','f'),(599,134,3,'2021-10-27 10:33:48','2021-10-27 14:54:04',260,32,90,25.00,'EUR','f'),(601,87,4,'2021-10-27 10:34:12','2021-10-27 13:45:07',190,32,90,25.00,'EUR','f'),(602,91,3,'2021-10-27 11:03:02','2021-10-27 15:13:27',250,33,90,25.00,'EUR','f'),(603,104,1,'2021-10-27 11:46:48','2021-10-27 15:37:50',231,32,75,25.00,'EUR','f'),(605,99,1,'2021-10-27 12:43:00','2021-10-27 15:28:00',165,33,90,25.00,'EUR','f'),(606,144,NULL,'2021-10-27 07:00:00','2021-10-27 15:00:00',480,33,78,25.00,'EUR','f'),(607,87,4,'2021-10-27 13:45:22','2021-10-27 15:22:47',97,32,83,25.00,'EUR','f'),(608,125,4,'2021-10-27 13:49:58','2021-10-27 15:20:44',90,32,83,25.00,'EUR','f'),(610,132,NULL,'2021-10-27 07:00:00','2021-10-27 15:00:00',480,34,87,0.00,'EUR','w'),(611,120,NULL,'2021-10-27 07:00:00','2021-10-27 15:00:00',480,34,87,0.00,'EUR','w'),(612,100,NULL,'2021-10-27 15:00:00','2021-10-27 22:23:00',443,34,90,0.00,'EUR','w'),(614,107,1,'2021-10-28 06:59:12','2021-10-28 10:00:27',181,32,75,25.00,'EUR','f'),(615,125,4,'2021-10-28 06:59:24','2021-10-28 07:45:55',46,32,83,25.00,'EUR','f'),(616,110,4,'2021-10-28 06:59:44','2021-10-28 09:59:43',179,33,83,25.00,'EUR','f'),(617,87,4,'2021-10-28 07:00:02','2021-10-28 09:06:47',126,32,90,25.00,'EUR','f'),(618,141,3,'2021-10-28 07:00:49','2021-10-28 08:44:19',103,32,81,25.00,'EUR','f'),(619,108,3,'2021-10-28 07:01:00','2021-10-28 08:33:08',92,32,81,25.00,'EUR','f'),(620,111,2,'2021-10-28 07:01:25','2021-10-28 09:59:28',178,32,78,25.00,'EUR','f'),(621,115,2,'2021-10-28 07:01:44','2021-10-28 09:58:37',176,32,78,25.00,'EUR','f'),(622,92,2,'2021-10-28 07:01:57','2021-10-28 10:00:09',178,33,78,25.00,'EUR','f'),(623,134,3,'2021-10-28 07:02:00','2021-10-28 09:59:48',177,32,81,25.00,'EUR','f'),(624,103,3,'2021-10-28 07:02:09','2021-10-28 09:58:45',176,33,81,25.00,'EUR','f'),(625,118,4,'2021-10-28 07:02:20','2021-10-28 09:59:38',177,32,90,25.00,'EUR','f'),(626,97,2,'2021-10-28 07:02:29','2021-10-28 09:57:43',175,32,78,25.00,'EUR','f'),(627,91,3,'2021-10-28 07:02:36','2021-10-28 10:10:01',187,33,90,25.00,'EUR','f'),(628,126,1,'2021-10-28 07:03:44','2021-10-28 07:10:52',7,33,75,25.00,'EUR','f'),(629,99,1,'2021-10-28 07:05:00','2021-10-28 10:02:00',177,33,90,25.00,'EUR','f'),(630,126,1,'2021-10-28 07:12:00','2021-10-28 09:59:00',167,33,90,25.00,'EUR','f'),(631,128,4,'2021-10-28 07:12:00','2021-10-28 10:10:00',178,33,75,25.00,'EUR','f'),(632,109,NULL,'2021-10-28 07:14:17','2021-10-28 07:35:42',21,34,96,0.00,'EUR','f'),(633,109,NULL,'2021-10-28 07:35:54','2021-10-28 10:10:01',154,34,87,0.00,'EUR','f'),(634,125,4,'2021-10-28 07:46:31','2021-10-28 09:58:53',132,32,90,25.00,'EUR','f'),(635,108,3,'2021-10-28 08:33:00','2021-10-28 10:00:00',87,32,96,25.00,'EUR','f'),(636,141,3,'2021-10-28 08:44:00','2021-10-28 09:59:00',75,32,89,25.00,'EUR','f'),(637,87,4,'2021-10-28 09:07:00','2021-10-28 10:00:34',53,32,83,25.00,'EUR','f'),(639,125,4,'2021-10-28 10:28:56','2021-10-28 15:11:45',282,32,90,25.00,'EUR','f'),(640,111,2,'2021-10-28 10:29:40','2021-10-28 15:13:42',284,32,78,25.00,'EUR','f'),(641,110,4,'2021-10-28 10:29:43','2021-10-28 15:23:32',293,32,90,25.00,'EUR','f'),(642,141,3,'2021-10-28 10:29:00','2021-10-28 15:21:00',292,32,89,25.00,'EUR','w'),(643,118,4,'2021-10-28 10:30:06','2021-10-28 13:58:11',208,32,90,25.00,'EUR','f'),(644,115,2,'2021-10-28 10:30:15','2021-10-28 15:12:09',281,32,78,25.00,'EUR','f'),(645,87,4,'2021-10-28 10:30:27','2021-10-28 14:28:11',237,32,83,25.00,'EUR','f'),(646,126,1,'2021-10-28 10:30:34','2021-10-28 12:48:38',138,33,75,25.00,'EUR','f'),(647,107,1,'2021-10-28 10:30:45','2021-10-28 13:16:23',165,32,75,25.00,'EUR','f'),(648,91,3,'2021-10-28 10:30:59','2021-10-28 11:13:56',42,33,90,25.00,'EUR','f'),(651,108,3,'2021-10-28 10:31:00','2021-10-28 12:20:00',109,32,96,25.00,'EUR','f'),(654,103,3,'2021-10-28 10:46:00','2021-10-28 12:54:00',128,33,81,25.00,'EUR','f'),(655,91,3,'2021-10-28 11:14:00','2021-10-28 12:36:00',82,33,81,25.00,'EUR','f'),(658,134,3,'2021-10-28 11:42:43','2021-10-28 15:12:29',209,32,90,25.00,'EUR','f'),(659,108,3,'2021-10-28 12:20:32','2021-10-28 15:27:51',187,32,81,25.00,'EUR','f'),(660,91,3,'2021-10-28 12:37:04','2021-10-28 12:37:51',0,33,90,25.00,'EUR','f'),(661,91,3,'2021-10-28 12:38:01','2021-10-28 15:20:04',162,33,81,25.00,'EUR','f'),(662,126,1,'2021-10-28 12:49:00','2021-10-28 14:41:00',112,33,75,25.00,'EUR','f'),(664,103,3,'2021-10-28 12:54:19','2021-10-28 15:20:10',145,33,81,25.00,'EUR','f'),(669,142,NULL,'2021-10-28 18:47:57','2021-10-28 19:00:52',12,NULL,NULL,NULL,NULL,'f'),(671,107,1,'2021-10-29 06:58:23','2021-10-29 10:00:36',182,32,75,25.00,'EUR','f'),(672,125,4,'2021-10-29 06:59:19','2021-10-29 08:00:25',61,32,90,25.00,'EUR','f'),(673,87,4,'2021-10-29 06:59:34','2021-10-29 07:58:46',59,32,90,25.00,'EUR','f'),(675,111,2,'2021-10-29 07:00:43','2021-10-29 10:02:50',182,32,78,25.00,'EUR','f'),(676,126,1,'2021-10-29 07:01:39','2021-10-29 08:38:45',97,33,75,25.00,'EUR','f'),(677,103,3,'2021-10-29 07:01:51','2021-10-29 10:00:50',178,33,81,25.00,'EUR','f'),(678,118,4,'2021-10-29 07:02:00','2021-10-29 10:00:00',178,33,81,25.00,'EUR','f'),(679,92,2,'2021-10-29 07:03:00','2021-10-29 08:40:00',97,33,81,25.00,'EUR','f'),(681,109,NULL,'2021-10-29 07:03:15','2021-10-29 10:00:49',177,34,87,0.00,'EUR','f'),(682,110,4,'2021-10-29 07:03:00','2021-10-29 10:10:00',187,33,81,25.00,'EUR','f'),(683,91,3,'2021-10-29 07:04:33','2021-10-29 09:59:30',174,33,81,25.00,'EUR','f'),(684,105,2,'2021-10-29 07:05:00','2021-10-29 09:59:00',174,33,81,25.00,'EUR','f'),(685,141,3,'2021-10-29 07:09:00','2021-10-29 10:00:00',171,32,75,25.00,'EUR','f'),(686,108,3,'2021-10-29 07:09:33','2021-10-29 10:00:32',170,32,81,25.00,'EUR','f'),(687,104,1,'2021-10-29 07:21:00','2021-10-29 10:10:00',169,32,78,25.00,'EUR','f'),(688,97,2,'2021-10-29 07:24:09','2021-10-29 10:01:38',157,32,78,25.00,'EUR','f'),(689,87,4,'2021-10-29 07:59:05','2021-10-29 10:00:03',120,32,87,25.00,'EUR','f'),(690,125,4,'2021-10-29 08:00:46','2021-10-29 10:00:10',119,32,87,25.00,'EUR','f'),(691,115,2,'2021-10-29 08:11:17','2021-10-29 09:59:34',108,32,78,25.00,'EUR','f'),(692,134,3,'2021-10-29 08:16:53','2021-10-29 09:59:48',102,32,81,25.00,'EUR','f'),(693,99,1,'2021-10-29 08:38:26','2021-10-29 10:10:01',91,33,87,25.00,'EUR','f'),(694,126,1,'2021-10-29 08:39:00','2021-10-29 09:59:00',80,33,81,25.00,'EUR','f'),(695,92,2,'2021-10-29 08:40:48','2021-10-29 10:00:43',79,33,78,25.00,'EUR','f'),(696,128,4,'2021-10-29 08:50:00','2021-10-29 10:10:00',80,33,81,25.00,'EUR','f'),(697,108,3,'2021-10-29 10:28:32','2021-10-29 15:20:30',291,32,81,25.00,'EUR','f'),(699,109,NULL,'2021-10-29 10:30:49','2021-10-29 15:21:34',290,34,87,0.00,'EUR','f'),(701,115,2,'2021-10-29 10:31:20','2021-10-29 15:18:40',287,32,87,25.00,'EUR','f'),(702,118,4,'2021-10-29 10:31:00','2021-10-29 12:35:00',124,33,81,25.00,'EUR','f'),(703,107,1,'2021-10-29 10:31:40','2021-10-29 15:28:29',296,32,87,25.00,'EUR','f'),(705,110,4,'2021-10-29 10:31:49','2021-10-29 10:32:18',0,33,72,25.00,'EUR','f'),(707,97,2,'2021-10-29 10:32:07','2021-10-29 10:32:25',0,32,78,25.00,'EUR','f'),(708,92,2,'2021-10-29 10:32:14','2021-10-29 12:50:21',138,33,78,25.00,'EUR','f'),(709,97,2,'2021-10-29 10:32:39','2021-10-29 15:18:17',285,32,87,25.00,'EUR','f'),(710,110,4,'2021-10-29 10:32:41','2021-10-29 15:21:17',288,33,87,25.00,'EUR','f'),(711,126,1,'2021-10-29 10:33:35','2021-10-29 11:52:38',79,33,75,25.00,'EUR','f'),(712,141,3,'2021-10-29 10:33:44','2021-10-29 15:28:38',294,32,81,25.00,'EUR','f'),(713,105,2,'2021-10-29 10:35:42','2021-10-29 15:20:29',284,33,68,25.00,'EUR','f'),(715,91,3,'2021-10-29 10:59:00','2021-10-29 12:35:00',96,33,81,25.00,'EUR','f'),(716,134,3,'2021-10-29 11:05:57','2021-10-29 15:31:17',265,32,81,25.00,'EUR','f'),(717,103,3,'2021-10-29 11:15:21','2021-10-29 12:51:15',95,33,81,25.00,'EUR','f'),(718,99,1,'2021-10-29 11:46:26','2021-10-29 15:25:58',219,33,57,25.00,'EUR','f'),(719,126,1,'2021-10-29 11:52:00','2021-10-29 14:42:00',170,33,81,0.00,'EUR','f'),(722,91,3,'2021-10-29 12:36:00','2021-10-29 15:19:57',163,33,81,25.00,'EUR','f'),(724,103,3,'2021-10-29 12:51:30','2021-10-29 14:16:49',85,33,81,25.00,'EUR','f'),(727,126,1,'2021-10-30 07:06:00','2021-10-30 10:07:00',181,33,87,25.00,'EUR','f'),(729,107,1,'2021-11-01 06:57:24','2021-11-01 10:02:34',185,32,87,25.00,'EUR','f'),(730,108,3,'2021-11-01 07:00:07','2021-11-01 09:59:53',179,32,81,25.00,'EUR','f'),(731,141,3,'2021-11-01 07:00:22','2021-11-01 09:59:17',178,32,81,25.00,'EUR','f'),(732,125,4,'2021-11-01 07:00:32','2021-11-01 10:01:27',180,32,87,25.00,'EUR','f'),(733,91,3,'2021-11-01 07:00:36','2021-11-01 09:58:40',178,33,81,25.00,'EUR','f'),(734,111,2,'2021-11-01 07:00:53','2021-11-01 10:10:02',189,32,87,25.00,'EUR','f'),(735,128,4,'2021-11-01 07:01:00','2021-11-01 10:00:00',179,33,81,0.00,'EUR','f'),(736,87,4,'2021-11-01 07:01:14','2021-11-01 10:10:02',188,32,87,25.00,'EUR','f'),(737,115,2,'2021-11-01 07:01:24','2021-11-01 09:59:38',178,32,87,25.00,'EUR','f'),(738,126,1,'2021-11-01 07:01:00','2021-11-01 10:04:00',183,33,87,0.00,'EUR','f'),(739,134,3,'2021-11-01 07:01:35','2021-11-01 10:01:40',180,32,81,25.00,'EUR','f'),(741,92,2,'2021-11-01 07:02:03','2021-11-01 09:58:20',176,33,87,25.00,'EUR','f'),(742,89,4,'2021-11-01 07:02:13','2021-11-01 10:10:02',187,32,87,25.00,'EUR','f'),(743,99,1,'2021-11-01 07:02:30','2021-11-01 10:10:02',187,33,87,25.00,'EUR','f'),(744,105,2,'2021-11-01 07:02:53','2021-11-01 09:58:13',175,33,68,25.00,'EUR','f'),(745,97,2,'2021-11-01 07:04:44','2021-11-01 10:02:02',177,32,87,25.00,'EUR','f'),(746,110,4,'2021-11-01 07:05:11','2021-11-01 10:10:02',184,33,87,25.00,'EUR','f'),(747,109,NULL,'2021-11-01 07:09:42','2021-11-01 10:10:02',180,34,87,0.00,'EUR','f'),(748,144,NULL,'2021-11-01 08:45:00','2021-11-01 09:58:00',73,33,81,25.00,'EUR','f'),(749,104,1,'2021-11-01 07:00:00','2021-11-01 10:00:00',180,32,87,25.00,'EUR','w'),(751,115,2,'2021-11-01 10:29:19','2021-11-01 15:24:29',295,32,87,25.00,'EUR','f'),(752,97,2,'2021-11-01 10:29:39','2021-11-01 15:24:20',294,32,87,25.00,'EUR','f'),(753,141,3,'2021-11-01 10:30:14','2021-11-01 15:28:34',298,32,81,25.00,'EUR','f'),(754,92,2,'2021-11-01 10:30:56','2021-11-01 15:12:03',281,33,87,25.00,'EUR','f'),(755,118,4,'2021-11-01 10:31:10','2021-11-01 14:02:14',211,33,87,25.00,'EUR','f'),(757,105,2,'2021-11-01 10:32:22','2021-11-01 15:15:51',283,33,87,25.00,'EUR','f'),(758,134,3,'2021-11-01 10:32:31','2021-11-01 15:18:00',285,32,81,25.00,'EUR','f'),(760,107,1,'2021-11-01 10:32:57','2021-11-01 15:28:31',295,32,87,25.00,'EUR','f'),(762,108,3,'2021-11-01 10:33:23','2021-11-01 11:20:19',46,32,81,25.00,'EUR','f'),(763,109,NULL,'2021-11-01 10:34:15','2021-11-01 15:29:30',295,34,87,0.00,'EUR','f'),(765,108,3,'2021-11-01 11:20:00','2021-11-01 15:18:27',238,32,87,0.00,'EUR','w'),(766,118,4,'2021-11-01 14:02:00','2021-11-01 15:15:38',73,33,81,0.00,'EUR','f'),(771,144,NULL,'2021-11-01 15:18:00','2021-11-01 15:40:09',22,33,67,25.00,'EUR','w'),(774,111,2,'2021-11-02 06:58:30','2021-11-02 10:02:04',183,32,87,25.00,'EUR','f'),(775,134,3,'2021-11-02 06:59:18','2021-11-02 10:10:01',190,32,81,25.00,'EUR','f'),(776,115,2,'2021-11-02 06:59:29','2021-11-02 10:00:05',180,32,87,25.00,'EUR','f'),(777,125,4,'2021-11-02 07:00:29','2021-11-02 10:01:42',181,32,87,25.00,'EUR','f'),(778,87,4,'2021-11-02 07:00:52','2021-11-02 09:58:55',178,32,87,25.00,'EUR','f'),(779,126,1,'2021-11-02 07:00:58','2021-11-02 10:03:15',182,33,87,25.00,'EUR','f'),(780,118,4,'2021-11-02 07:01:04','2021-11-02 10:02:51',181,33,87,25.00,'EUR','f'),(781,99,1,'2021-11-02 07:01:00','2021-11-02 10:10:00',189,33,100,0.00,'EUR','f'),(782,141,3,'2021-11-02 07:01:35','2021-11-02 08:55:28',113,32,81,25.00,'EUR','f'),(783,109,NULL,'2021-11-02 07:01:37','2021-11-02 10:10:01',188,34,87,0.00,'EUR','f'),(784,108,3,'2021-11-02 07:01:45','2021-11-02 10:10:01',188,32,81,25.00,'EUR','f'),(785,103,3,'2021-11-02 07:02:00','2021-11-02 09:59:00',177,33,89,0.00,'EUR','f'),(786,105,2,'2021-11-02 07:03:03','2021-11-02 09:57:49',174,33,87,25.00,'EUR','f'),(787,89,4,'2021-11-02 07:04:59','2021-11-02 09:58:45',173,32,87,25.00,'EUR','f'),(790,91,3,'2021-11-02 07:34:00','2021-11-02 08:59:00',85,33,87,25.00,'EUR','f'),(793,146,NULL,'2021-11-02 07:58:08','2021-11-02 08:24:18',26,32,87,25.00,'EUR','f'),(794,145,NULL,'2021-11-02 08:00:45','2021-11-02 10:02:35',121,32,87,25.00,'EUR','f'),(795,146,NULL,'2021-11-02 08:24:00','2021-11-02 10:03:00',99,32,81,0.00,'EUR','f'),(796,144,NULL,'2021-11-02 08:25:00','2021-11-02 10:00:00',95,33,81,25.00,'EUR','f'),(797,97,2,'2021-11-02 08:30:11','2021-11-02 10:00:18',90,32,87,25.00,'EUR','f'),(798,92,2,'2021-11-02 08:35:48','2021-11-02 10:02:14',86,33,87,25.00,'EUR','f'),(799,141,3,'2021-11-02 08:58:56','2021-11-02 10:10:01',71,32,89,25.00,'EUR','f'),(800,91,3,'2021-11-02 08:59:27','2021-11-02 10:10:01',70,33,87,25.00,'EUR','f'),(803,145,NULL,'2021-11-02 10:27:10','2021-11-02 15:33:35',306,32,87,25.00,'EUR','f'),(805,126,1,'2021-11-02 10:28:16','2021-11-02 14:37:00',248,33,57,25.00,'EUR','f'),(806,91,3,'2021-11-02 10:28:45','2021-11-02 15:14:31',285,33,87,25.00,'EUR','f'),(807,144,NULL,'2021-11-02 10:28:00','2021-11-02 12:22:00',114,33,81,25.00,'EUR','f'),(808,92,2,'2021-11-02 10:29:36','2021-11-02 15:17:00',287,33,87,25.00,'EUR','f'),(809,118,4,'2021-11-02 10:30:04','2021-11-02 15:14:11',284,33,87,25.00,'EUR','f'),(810,103,3,'2021-11-02 10:30:00','2021-11-02 11:50:00',80,33,89,0.00,'EUR','f'),(813,125,4,'2021-11-02 10:31:08','2021-11-02 15:16:08',285,32,87,25.00,'EUR','f'),(814,97,2,'2021-11-02 10:32:03','2021-11-02 15:26:06',294,32,87,25.00,'EUR','f'),(815,115,2,'2021-11-02 10:32:15','2021-11-02 15:26:12',293,32,87,25.00,'EUR','f'),(816,111,2,'2021-11-02 10:32:39','2021-11-02 15:34:37',301,32,87,25.00,'EUR','f'),(817,89,4,'2021-11-02 10:32:45','2021-11-02 15:24:41',291,32,87,25.00,'EUR','f'),(818,105,2,'2021-11-02 10:32:49','2021-11-02 15:12:18',279,33,87,25.00,'EUR','f'),(819,87,4,'2021-11-02 10:32:58','2021-11-02 15:16:01',283,32,87,25.00,'EUR','f'),(820,104,1,'2021-11-02 10:48:39','2021-11-02 15:39:15',290,32,87,25.00,'EUR','f'),(821,109,NULL,'2021-11-02 11:31:10','2021-11-02 13:17:13',106,34,101,0.00,'EUR','f'),(822,103,3,'2021-11-02 11:50:19','2021-11-02 12:44:47',54,33,81,25.00,'EUR','f'),(823,144,NULL,'2021-11-02 12:23:00','2021-11-02 15:08:00',165,33,87,25.00,'EUR','f'),(824,103,3,'2021-11-02 12:44:00','2021-11-02 15:20:00',156,33,89,0.00,'EUR','f'),(825,109,NULL,'2021-11-02 13:23:47','2021-11-02 13:36:22',12,34,104,0.00,'EUR','f'),(826,109,NULL,'2021-11-02 13:36:32','2021-11-02 14:06:52',30,34,102,0.00,'EUR','f'),(827,141,3,'2021-11-02 13:49:26','2021-11-02 15:29:22',99,32,81,25.00,'EUR','f'),(832,134,3,'2021-11-03 06:56:50','2021-11-03 10:03:19',186,32,81,25.00,'EUR','f'),(834,125,4,'2021-11-03 06:58:17','2021-11-03 09:59:19',181,32,87,25.00,'EUR','f'),(835,108,3,'2021-11-03 06:58:29','2021-11-03 09:59:48',181,32,81,25.00,'EUR','f'),(836,91,3,'2021-11-03 06:58:43','2021-11-03 09:58:26',179,33,81,25.00,'EUR','f'),(837,145,NULL,'2021-11-03 06:58:53','2021-11-03 09:59:43',180,32,87,25.00,'EUR','f'),(838,118,4,'2021-11-03 06:59:04','2021-11-03 10:01:08',182,33,87,25.00,'EUR','f'),(839,126,1,'2021-11-03 06:59:19','2021-11-03 10:00:27',181,33,87,25.00,'EUR','f'),(840,92,2,'2021-11-03 06:59:29','2021-11-03 09:59:54',180,33,87,25.00,'EUR','f'),(841,103,3,'2021-11-03 06:59:00','2021-11-03 07:42:00',43,33,89,25.00,'EUR','f'),(843,141,3,'2021-11-03 07:00:10','2021-11-03 09:59:31',179,32,81,25.00,'EUR','f'),(844,105,2,'2021-11-03 07:00:38','2021-11-03 09:57:03',176,33,87,25.00,'EUR','f'),(845,99,1,'2021-11-03 07:03:36','2021-11-03 10:01:16',177,33,87,25.00,'EUR','f'),(846,89,4,'2021-11-03 07:07:16','2021-11-03 09:57:48',170,32,87,25.00,'EUR','f'),(847,87,4,'2021-11-03 07:10:08','2021-11-03 09:57:56',167,32,87,25.00,'EUR','f'),(848,110,4,'2021-11-03 07:12:05','2021-11-03 09:55:49',163,33,87,25.00,'EUR','f'),(849,104,1,'2021-11-03 07:25:45','2021-11-03 09:56:44',150,32,87,25.00,'EUR','f'),(850,115,2,'2021-11-03 07:26:05','2021-11-03 09:59:30',153,32,87,25.00,'EUR','f'),(851,111,2,'2021-11-03 07:26:15','2021-11-03 10:03:15',157,32,87,25.00,'EUR','f'),(852,103,3,'2021-11-03 07:42:58','2021-11-03 09:58:48',135,33,81,25.00,'EUR','f'),(853,107,1,'2021-11-03 07:45:36','2021-11-03 09:58:28',132,32,87,25.00,'EUR','f'),(855,89,4,'2021-11-03 10:24:54','2021-11-03 15:27:31',302,32,87,25.00,'EUR','f'),(856,104,1,'2021-11-03 10:27:51','2021-11-03 15:43:14',315,32,87,25.00,'EUR','f'),(857,145,NULL,'2021-11-03 10:28:39','2021-11-03 15:27:32',298,32,87,25.00,'EUR','f'),(858,141,3,'2021-11-03 10:28:51','2021-11-03 11:45:18',76,32,81,25.00,'EUR','f'),(860,126,1,'2021-11-03 10:29:31','2021-11-03 14:42:18',252,33,87,25.00,'EUR','f'),(861,108,3,'2021-11-03 10:29:00','2021-11-03 15:35:44',306,32,101,25.00,'EUR','w'),(862,146,NULL,'2021-11-03 10:29:00','2021-11-03 15:34:43',305,32,101,25.00,'EUR','w'),(863,91,3,'2021-11-03 10:29:55','2021-11-03 12:28:54',118,33,81,25.00,'EUR','f'),(864,92,2,'2021-11-03 10:30:06','2021-11-03 15:15:32',285,33,87,25.00,'EUR','f'),(865,115,2,'2021-11-03 10:30:26','2021-11-03 15:19:12',288,32,87,25.00,'EUR','f'),(866,110,4,'2021-11-03 10:30:30','2021-11-03 15:25:05',294,33,87,25.00,'EUR','f'),(867,118,4,'2021-11-03 10:30:31','2021-11-03 15:12:29',281,33,87,25.00,'EUR','f'),(868,87,4,'2021-11-03 10:31:00','2021-11-03 15:19:20',288,32,87,25.00,'EUR','f'),(869,144,NULL,'2021-11-03 10:31:00','2021-11-03 15:00:30',269,33,87,25.00,'EUR','f'),(870,125,4,'2021-11-03 10:31:07','2021-11-03 15:16:00',284,32,87,25.00,'EUR','f'),(871,97,2,'2021-11-03 10:31:15','2021-11-03 15:15:37',284,32,87,25.00,'EUR','f'),(872,107,1,'2021-11-03 10:31:16','2021-11-03 15:35:16',304,32,87,25.00,'EUR','f'),(874,103,3,'2021-11-03 10:31:39','2021-11-03 14:17:55',226,33,81,25.00,'EUR','f'),(875,105,2,'2021-11-03 10:41:23','2021-11-03 15:12:52',271,33,87,25.00,'EUR','f'),(877,141,3,'2021-11-03 11:45:00','2021-11-03 15:28:00',223,32,104,25.00,'EUR','f'),(878,91,3,'2021-11-03 12:29:06','2021-11-03 12:58:15',29,33,101,25.00,'EUR','f'),(879,91,3,'2021-11-03 12:58:27','2021-11-03 15:12:41',134,33,104,25.00,'EUR','f'),(881,103,3,'2021-11-03 14:18:10','2021-11-03 15:27:08',68,33,104,25.00,'EUR','f'),(883,107,1,'2021-11-04 06:53:02','2021-11-04 10:01:08',188,32,87,25.00,'EUR','f'),(884,87,4,'2021-11-04 07:00:40','2021-11-04 09:59:15',178,32,87,25.00,'EUR','f'),(885,110,4,'2021-11-04 07:00:49','2021-11-04 10:01:01',180,33,87,25.00,'EUR','f'),(886,115,2,'2021-11-04 07:00:51','2021-11-04 10:00:09',179,32,87,25.00,'EUR','f'),(887,89,4,'2021-11-04 07:01:00','2021-11-04 09:59:57',178,32,87,25.00,'EUR','f'),(888,145,NULL,'2021-11-04 07:01:18','2021-11-04 10:01:06',179,32,87,25.00,'EUR','f'),(889,125,4,'2021-11-04 07:01:21','2021-11-04 10:00:44',179,32,87,25.00,'EUR','f'),(890,146,NULL,'2021-11-04 07:01:28','2021-11-04 10:02:54',181,32,87,25.00,'EUR','f'),(891,118,4,'2021-11-04 07:01:41','2021-11-04 10:00:33',178,33,87,25.00,'EUR','f'),(892,103,3,'2021-11-04 07:01:45','2021-11-04 09:04:23',122,33,104,25.00,'EUR','f'),(893,99,1,'2021-11-04 07:02:00','2021-11-04 10:01:56',179,33,87,25.00,'EUR','f'),(894,126,1,'2021-11-04 07:02:18','2021-11-04 10:00:51',178,33,57,25.00,'EUR','f'),(895,91,3,'2021-11-04 07:02:26','2021-11-04 08:03:20',60,33,104,25.00,'EUR','f'),(896,111,2,'2021-11-04 07:02:39','2021-11-04 10:02:06',179,32,87,25.00,'EUR','f'),(897,108,3,'2021-11-04 07:02:41','2021-11-04 09:48:19',165,32,101,25.00,'EUR','f'),(898,97,2,'2021-11-04 07:02:58','2021-11-04 10:01:43',178,32,87,25.00,'EUR','f'),(899,141,3,'2021-11-04 07:03:05','2021-11-04 09:11:40',128,32,89,25.00,'EUR','f'),(900,105,2,'2021-11-04 07:03:22','2021-11-04 10:00:27',177,33,87,25.00,'EUR','f'),(901,92,2,'2021-11-04 07:03:40','2021-11-04 10:01:20',177,33,87,25.00,'EUR','f'),(903,144,NULL,'2021-11-04 07:20:32','2021-11-04 09:59:26',158,33,87,25.00,'EUR','f'),(904,100,NULL,'2021-11-03 08:00:00','2021-11-03 14:00:00',360,34,105,0.00,'EUR','w'),(905,100,NULL,'2021-11-03 00:00:00','2021-11-03 02:00:00',120,34,106,0.00,'EUR','w'),(906,128,4,'2021-11-04 07:35:00','2021-11-04 10:00:00',145,33,87,25.00,'EUR','f'),(907,104,1,'2021-11-04 07:00:00','2021-11-04 10:00:00',180,32,87,25.00,'EUR','w'),(908,91,3,'2021-11-04 08:03:33','2021-11-04 09:59:18',115,33,101,25.00,'EUR','f'),(909,103,3,'2021-11-04 09:04:44','2021-11-04 09:59:47',55,33,101,25.00,'EUR','f'),(910,141,3,'2021-11-04 09:11:48','2021-11-04 09:59:12',47,32,81,25.00,'EUR','f'),(911,108,3,'2021-11-04 09:48:32','2021-11-04 10:10:01',21,32,102,25.00,'EUR','f'),(912,145,NULL,'2021-11-04 10:29:02','2021-11-04 15:30:09',301,32,87,25.00,'EUR','f'),(913,146,NULL,'2021-11-04 10:29:00','2021-11-04 15:27:00',298,32,102,25.00,'EUR','f'),(915,99,1,'2021-11-04 10:29:49','2021-11-04 15:34:08',304,33,87,25.00,'EUR','f'),(916,107,1,'2021-11-04 10:29:55','2021-11-04 15:33:10',303,32,87,25.00,'EUR','f'),(917,89,4,'2021-11-04 10:30:07','2021-11-04 15:28:33',298,32,87,25.00,'EUR','f'),(918,125,4,'2021-11-04 10:30:15','2021-11-04 15:17:14',286,32,87,25.00,'EUR','f'),(919,103,3,'2021-11-04 10:30:43','2021-11-04 15:23:09',292,33,101,25.00,'EUR','f'),(920,110,4,'2021-11-04 10:30:45','2021-11-04 15:24:07',293,33,87,25.00,'EUR','f'),(921,118,4,'2021-11-04 10:30:51','2021-11-04 15:10:27',279,33,87,25.00,'EUR','f'),(922,115,2,'2021-11-04 10:30:53','2021-11-04 15:21:35',290,32,87,25.00,'EUR','f'),(923,144,NULL,'2021-11-04 10:31:01','2021-11-04 15:14:22',283,33,87,25.00,'EUR','f'),(924,97,2,'2021-11-04 10:31:32','2021-11-04 15:28:07',296,32,87,25.00,'EUR','f'),(925,111,2,'2021-11-04 10:31:48','2021-11-04 15:34:13',302,32,87,25.00,'EUR','f'),(926,141,3,'2021-11-04 10:32:00','2021-11-04 15:26:16',294,32,102,25.00,'EUR','f'),(927,104,1,'2021-11-04 10:32:18','2021-11-04 15:42:11',309,32,87,25.00,'EUR','f'),(928,91,3,'2021-11-04 10:32:25','2021-11-04 14:21:33',229,33,101,25.00,'EUR','f'),(929,126,1,'2021-11-04 10:32:49','2021-11-04 15:08:35',275,33,87,25.00,'EUR','f'),(930,92,2,'2021-11-04 10:33:57','2021-11-04 15:14:03',280,33,87,25.00,'EUR','f'),(931,87,4,'2021-11-04 10:34:01','2021-11-04 15:22:18',288,32,87,25.00,'EUR','f'),(932,105,2,'2021-11-04 10:38:07','2021-11-04 15:09:07',271,33,87,25.00,'EUR','f'),(935,91,3,'2021-11-04 14:21:42','2021-11-04 15:05:36',43,33,81,25.00,'EUR','f'),(937,105,2,'2021-11-05 06:52:08','2021-11-05 09:56:55',184,33,87,25.00,'EUR','f'),(938,107,1,'2021-11-05 06:57:12','2021-11-05 09:59:12',182,32,87,25.00,'EUR','f'),(939,125,4,'2021-11-05 06:59:55','2021-11-05 10:00:14',180,32,87,25.00,'EUR','f'),(940,144,NULL,'2021-11-05 06:59:57','2021-11-05 10:10:01',190,33,87,25.00,'EUR','f'),(941,145,NULL,'2021-11-05 07:00:11','2021-11-05 09:57:31',177,32,87,25.00,'EUR','f'),(942,97,2,'2021-11-05 07:00:14','2021-11-05 09:58:29',178,32,87,25.00,'EUR','f'),(943,89,4,'2021-11-05 07:00:15','2021-11-05 10:00:38',180,32,87,25.00,'EUR','f'),(944,146,NULL,'2021-11-05 07:00:18','2021-11-05 09:57:13',176,32,87,25.00,'EUR','f'),(945,115,2,'2021-11-05 07:00:21','2021-11-05 09:58:06',177,32,87,25.00,'EUR','f'),(946,87,4,'2021-11-05 07:00:25','2021-11-05 09:58:13',177,32,87,25.00,'EUR','f'),(947,108,3,'2021-11-05 07:00:33','2021-11-05 10:00:44',180,32,102,25.00,'EUR','f'),(948,110,4,'2021-11-05 07:00:35','2021-11-05 10:10:01',189,33,87,25.00,'EUR','f'),(949,118,4,'2021-11-05 07:00:44','2021-11-05 09:57:05',176,33,87,25.00,'EUR','f'),(950,141,3,'2021-11-05 07:00:55','2021-11-05 10:10:01',189,32,109,25.00,'EUR','f'),(951,111,2,'2021-11-05 07:01:05','2021-11-05 09:56:49',175,32,87,25.00,'EUR','f'),(954,91,3,'2021-11-05 07:01:29','2021-11-05 09:55:38',174,33,102,25.00,'EUR','f'),(955,103,3,'2021-11-05 07:01:55','2021-11-05 07:31:34',29,33,109,25.00,'EUR','f'),(957,104,1,'2021-11-05 07:14:52','2021-11-05 10:10:01',175,32,87,25.00,'EUR','f'),(958,103,3,'2021-11-05 07:32:02','2021-11-05 08:41:33',69,33,89,25.00,'EUR','f'),(959,100,NULL,'2021-11-04 07:07:00','2021-11-04 12:00:00',293,34,106,0.00,'EUR','w'),(960,103,3,'2021-11-05 08:41:47','2021-11-05 09:58:28',76,33,102,25.00,'EUR','f'),(961,146,NULL,'2021-11-05 09:57:23','2021-11-05 10:10:01',12,32,87,25.00,'EUR','f'),(963,89,4,'2021-11-05 10:28:04','2021-11-05 15:17:29',289,32,87,25.00,'EUR','f'),(964,108,3,'2021-11-05 10:28:47','2021-11-05 15:28:52',300,32,102,25.00,'EUR','f'),(965,92,2,'2021-11-05 10:29:17','2021-11-05 15:18:31',289,33,87,25.00,'EUR','f'),(966,107,1,'2021-11-05 10:29:30','2021-11-05 15:28:10',298,32,87,25.00,'EUR','f'),(967,115,2,'2021-11-05 10:29:41','2021-11-05 15:21:10',291,32,87,25.00,'EUR','f'),(968,103,3,'2021-11-05 10:29:47','2021-11-05 15:22:46',292,33,102,25.00,'EUR','f'),(969,97,2,'2021-11-05 10:30:04','2021-11-05 15:22:57',292,32,87,25.00,'EUR','f'),(971,105,2,'2021-11-05 10:30:59','2021-11-05 15:16:05',285,33,87,25.00,'EUR','f'),(972,126,1,'2021-11-05 10:31:12','2021-11-05 14:36:43',245,33,87,25.00,'EUR','f'),(973,145,NULL,'2021-11-05 10:31:26','2021-11-05 15:33:52',302,32,87,25.00,'EUR','f'),(974,111,2,'2021-11-05 10:32:42','2021-11-05 15:23:11',290,32,87,25.00,'EUR','f'),(975,118,4,'2021-11-05 10:34:23','2021-11-05 15:18:17',283,33,87,25.00,'EUR','f'),(976,91,3,'2021-11-05 10:46:06','2021-11-05 15:18:42',272,33,102,25.00,'EUR','f'),(978,141,3,'2021-11-05 13:50:35','2021-11-05 15:28:02',97,32,81,25.00,'EUR','f'),(981,107,1,'2021-11-08 06:54:43','2021-11-08 10:02:29',187,32,87,25.00,'EUR','f'),(982,125,4,'2021-11-08 06:59:30','2021-11-08 10:00:28',180,32,87,25.00,'EUR','f'),(983,87,4,'2021-11-08 06:59:53','2021-11-08 10:01:54',182,32,87,25.00,'EUR','f'),(984,89,4,'2021-11-08 07:00:10','2021-11-08 10:03:01',182,32,87,25.00,'EUR','f'),(985,145,NULL,'2021-11-08 07:00:29','2021-11-08 10:01:27',180,32,87,25.00,'EUR','f'),(986,146,NULL,'2021-11-08 07:00:35','2021-11-08 10:01:29',180,32,87,25.00,'EUR','f'),(987,126,1,'2021-11-08 07:00:48','2021-11-08 10:05:01',184,33,87,25.00,'EUR','f'),(988,99,1,'2021-11-08 07:01:11','2021-11-08 10:10:01',188,33,87,25.00,'EUR','f'),(989,92,2,'2021-11-08 07:01:23','2021-11-08 10:02:04',180,33,87,25.00,'EUR','f'),(991,144,NULL,'2021-11-08 07:01:38','2021-11-08 10:00:41',179,33,87,25.00,'EUR','f'),(992,115,2,'2021-11-08 07:01:42','2021-11-08 10:02:00',180,32,87,25.00,'EUR','f'),(993,105,2,'2021-11-08 07:01:53','2021-11-08 09:58:32',176,33,87,25.00,'EUR','f'),(994,118,4,'2021-11-08 07:02:36','2021-11-08 10:04:43',182,33,87,25.00,'EUR','f'),(995,111,2,'2021-11-08 07:03:10','2021-11-08 10:10:01',186,32,87,25.00,'EUR','f'),(996,134,3,'2021-11-08 07:10:00','2021-11-08 10:10:00',180,32,87,25.00,'EUR','f'),(997,110,4,'2021-11-08 07:10:34','2021-11-08 10:01:19',170,33,87,25.00,'EUR','f'),(998,97,2,'2021-11-08 07:25:07','2021-11-08 10:10:01',164,32,87,25.00,'EUR','f'),(999,104,1,'2021-11-08 08:02:12','2021-11-08 10:10:01',127,32,87,25.00,'EUR','f'),(1001,89,4,'2021-11-08 10:21:25','2021-11-08 15:27:21',305,32,87,25.00,'EUR','f'),(1002,107,1,'2021-11-08 10:24:05','2021-11-08 15:33:25',309,32,87,25.00,'EUR','f'),(1003,110,4,'2021-11-08 10:25:53','2021-11-08 15:20:08',294,33,87,25.00,'EUR','f'),(1004,87,4,'2021-11-08 10:26:49','2021-11-08 15:19:37',292,32,87,25.00,'EUR','f'),(1005,118,4,'2021-11-08 10:27:00','2021-11-08 15:17:43',290,33,87,25.00,'EUR','f'),(1006,115,2,'2021-11-08 10:27:34','2021-11-08 15:18:06',290,32,87,25.00,'EUR','f'),(1007,145,NULL,'2021-11-08 10:27:50','2021-11-08 15:33:50',306,32,87,25.00,'EUR','f'),(1008,125,4,'2021-11-08 10:28:08','2021-11-08 15:19:07',290,32,87,25.00,'EUR','f'),(1009,92,2,'2021-11-08 10:28:17','2021-11-08 15:19:52',291,33,87,25.00,'EUR','f'),(1010,144,NULL,'2021-11-08 10:28:52','2021-11-08 15:18:13',289,33,87,25.00,'EUR','f'),(1012,126,1,'2021-11-08 10:30:45','2021-11-08 14:31:42',240,33,87,25.00,'EUR','f'),(1013,105,2,'2021-11-08 10:30:55','2021-11-08 15:15:46',284,33,87,25.00,'EUR','f'),(1014,104,1,'2021-11-08 10:33:03','2021-11-08 16:39:27',366,32,87,25.00,'EUR','f'),(1017,111,2,'2021-11-08 10:41:42','2021-11-08 15:25:52',284,32,87,25.00,'EUR','f'),(1020,146,NULL,'2021-11-08 11:19:34','2021-11-08 15:28:04',248,32,103,25.00,'EUR','f'),(1021,128,4,'2021-11-08 12:07:00','2021-11-08 15:18:00',191,33,103,0.00,'EUR','f'),(1022,103,3,'2021-11-08 13:58:16','2021-11-08 17:58:06',239,33,102,25.00,'EUR','f'),(1023,91,3,'2021-11-08 13:58:24','2021-11-08 20:58:39',420,33,102,25.00,'EUR','f'),(1024,108,3,'2021-11-08 13:58:31','2021-11-08 19:28:51',330,32,81,25.00,'EUR','f'),(1025,141,3,'2021-11-08 14:00:04','2021-11-08 17:57:50',237,32,81,25.00,'EUR','f'),(1026,121,3,'2021-11-08 14:00:12','2021-11-08 18:02:20',242,32,81,25.00,'EUR','f'),(1027,121,3,'2021-11-08 18:28:23','2021-11-08 22:27:03',238,32,81,25.00,'EUR','f'),(1028,141,3,'2021-11-08 18:29:22','2021-11-08 20:47:56',138,32,81,25.00,'EUR','f'),(1029,103,3,'2021-11-08 18:29:59','2021-11-08 22:22:04',232,33,102,25.00,'EUR','f'),(1030,108,3,'2021-11-08 19:56:36','2021-11-08 22:26:54',150,32,81,25.00,'EUR','f'),(1033,91,3,'2021-11-08 21:30:41','2021-11-08 22:22:14',51,33,109,25.00,'EUR','f'),(1034,107,1,'2021-11-09 06:57:29','2021-11-09 10:00:45',183,32,87,25.00,'EUR','f'),(1035,111,2,'2021-11-09 07:00:44','2021-11-09 10:00:38',179,32,87,25.00,'EUR','f'),(1036,97,2,'2021-11-09 07:01:05','2021-11-09 10:00:19',179,32,87,25.00,'EUR','f'),(1037,125,4,'2021-11-09 07:01:16','2021-11-09 10:00:27',179,32,87,25.00,'EUR','f'),(1038,89,4,'2021-11-09 07:01:33','2021-11-09 09:59:09',177,32,87,25.00,'EUR','f'),(1039,87,4,'2021-11-09 07:01:51','2021-11-09 10:10:01',188,32,87,25.00,'EUR','f'),(1040,118,4,'2021-11-09 07:01:54','2021-11-09 09:58:32',176,33,87,25.00,'EUR','f'),(1043,126,1,'2021-11-09 07:02:34','2021-11-09 10:01:53',179,33,87,25.00,'EUR','f'),(1044,105,2,'2021-11-09 07:03:07','2021-11-09 09:58:26',175,33,87,25.00,'EUR','f'),(1046,92,2,'2021-11-09 07:04:11','2021-11-09 09:59:06',174,33,87,25.00,'EUR','f'),(1050,140,1,'2021-11-09 07:41:04','2021-11-09 10:10:01',148,32,102,25.00,'EUR','f'),(1051,104,1,'2021-11-09 07:55:22','2021-11-09 10:10:01',134,32,87,25.00,'EUR','f'),(1052,145,NULL,'2021-11-09 08:11:07','2021-11-09 10:01:46',110,32,87,25.00,'EUR','f'),(1053,144,NULL,'2021-11-09 10:29:28','2021-11-09 15:19:21',289,33,103,25.00,'EUR','f'),(1054,126,1,'2021-11-09 10:29:40','2021-11-09 14:35:43',246,33,87,25.00,'EUR','f'),(1055,107,1,'2021-11-09 10:29:46','2021-11-09 15:28:30',298,32,87,25.00,'EUR','f'),(1056,118,4,'2021-11-09 10:30:07','2021-11-09 15:16:49',286,33,87,25.00,'EUR','f'),(1057,92,2,'2021-11-09 10:30:16','2021-11-09 13:36:14',185,33,87,25.00,'EUR','f'),(1058,125,4,'2021-11-09 10:30:23','2021-11-09 15:15:51',285,32,87,25.00,'EUR','f'),(1059,89,4,'2021-11-09 10:30:45','2021-11-09 15:21:30',290,32,87,25.00,'EUR','f'),(1060,87,4,'2021-11-09 10:31:04','2021-11-09 15:18:56',287,32,87,25.00,'EUR','f'),(1061,115,2,'2021-11-09 10:31:00','2021-11-09 15:21:00',290,32,89,25.00,'EUR','f'),(1062,145,NULL,'2021-11-09 10:31:35','2021-11-09 15:30:19',298,32,87,25.00,'EUR','f'),(1063,111,2,'2021-11-09 10:31:35','2021-11-09 15:29:15',297,32,87,25.00,'EUR','f'),(1066,105,2,'2021-11-09 10:36:16','2021-11-09 13:11:50',155,33,87,25.00,'EUR','f'),(1071,141,3,'2021-11-09 13:58:30','2021-11-09 17:59:40',241,32,81,25.00,'EUR','f'),(1072,103,3,'2021-11-09 14:00:57','2021-11-09 17:38:22',217,33,102,25.00,'EUR','f'),(1073,108,3,'2021-11-09 14:01:06','2021-11-09 18:05:13',244,32,81,25.00,'EUR','f'),(1074,91,3,'2021-11-09 14:01:29','2021-11-09 14:01:42',0,33,102,25.00,'EUR','f'),(1075,91,3,'2021-11-09 14:01:50','2021-11-09 18:00:58',239,33,109,25.00,'EUR','f'),(1076,121,3,'2021-11-09 14:16:28','2021-11-09 18:05:05',228,32,81,25.00,'EUR','f'),(1078,140,1,'2021-11-09 15:32:52','2021-11-09 15:33:10',0,32,102,25.00,'EUR','f'),(1079,103,3,'2021-11-09 17:38:31','2021-11-09 18:00:51',22,33,109,25.00,'EUR','f'),(1080,103,3,'2021-11-09 18:32:36','2021-11-09 20:54:48',142,33,109,25.00,'EUR','f'),(1081,91,3,'2021-11-09 18:33:45','2021-11-09 19:51:44',77,33,109,25.00,'EUR','f'),(1082,141,3,'2021-11-09 18:35:51','2021-11-09 22:26:19',230,32,81,25.00,'EUR','f'),(1083,121,3,'2021-11-09 18:37:17','2021-11-09 22:27:01',229,32,81,25.00,'EUR','f'),(1084,108,3,'2021-11-09 18:37:39','2021-11-09 22:27:11',229,32,81,25.00,'EUR','f'),(1085,91,3,'2021-11-09 19:51:53','2021-11-09 22:23:30',151,33,81,25.00,'EUR','f'),(1086,103,3,'2021-11-09 20:54:55','2021-11-09 22:22:51',87,33,81,25.00,'EUR','f'),(1087,107,1,'2021-11-10 06:57:45','2021-11-10 10:05:47',188,32,87,25.00,'EUR','f'),(1088,89,4,'2021-11-10 06:58:48','2021-11-10 09:57:35',178,32,87,25.00,'EUR','f'),(1089,87,4,'2021-11-10 06:59:16','2021-11-10 09:57:43',178,32,87,25.00,'EUR','f'),(1090,125,4,'2021-11-10 06:59:30','2021-11-10 09:59:09',179,32,87,25.00,'EUR','f'),(1091,144,NULL,'2021-11-10 06:59:59','2021-11-10 10:02:34',182,33,103,25.00,'EUR','f'),(1092,110,4,'2021-11-10 07:00:05','2021-11-10 09:56:09',176,33,87,25.00,'EUR','f'),(1093,126,1,'2021-11-10 07:00:13','2021-11-10 10:03:56',183,33,87,25.00,'EUR','f'),(1094,111,2,'2021-11-10 07:00:16','2021-11-10 10:10:01',189,32,87,25.00,'EUR','f'),(1095,118,4,'2021-11-10 07:00:20','2021-11-10 10:01:09',180,33,87,25.00,'EUR','f'),(1097,92,2,'2021-11-10 07:01:59','2021-11-10 10:02:51',180,33,87,25.00,'EUR','f'),(1098,145,NULL,'2021-11-10 07:02:23','2021-11-10 10:01:50',179,32,87,25.00,'EUR','f'),(1099,146,5,'2021-11-10 07:02:00','2021-11-10 10:00:00',178,32,103,25.00,'EUR','f'),(1100,128,4,'2021-11-10 07:04:00','2021-11-10 10:01:00',177,33,87,25.00,'EUR','f'),(1101,140,1,'2021-11-10 07:05:00','2021-11-10 10:01:00',176,32,102,25.00,'EUR','f'),(1102,104,1,'2021-11-10 07:57:00','2021-11-10 10:10:00',133,32,105,25.00,'EUR','f'),(1103,105,2,'2021-11-10 09:24:40','2021-11-10 09:59:12',34,33,87,25.00,'EUR','f'),(1105,125,4,'2021-11-10 10:26:22','2021-11-10 12:40:30',134,32,87,25.00,'EUR','f'),(1106,107,1,'2021-11-10 10:27:16','2021-11-10 13:27:31',180,32,87,25.00,'EUR','f'),(1107,89,4,'2021-11-10 10:28:41','2021-11-10 12:41:51',133,32,87,25.00,'EUR','f'),(1108,110,4,'2021-11-10 10:29:02','2021-11-10 12:18:50',109,33,87,25.00,'EUR','f'),(1109,105,2,'2021-11-10 10:29:21','2021-11-10 15:10:55',281,33,87,25.00,'EUR','f'),(1110,92,2,'2021-11-10 10:29:29','2021-11-10 15:11:58',282,33,87,25.00,'EUR','f'),(1111,126,1,'2021-11-10 10:29:38','2021-11-10 14:37:05',247,33,87,25.00,'EUR','f'),(1112,118,4,'2021-11-10 10:29:46','2021-11-10 12:08:20',98,33,87,25.00,'EUR','f'),(1113,144,5,'2021-11-10 10:30:00','2021-11-10 15:10:23',280,33,103,25.00,'EUR','f'),(1114,145,1,'2021-11-10 10:30:24','2021-11-10 15:26:44',296,32,87,25.00,'EUR','f'),(1115,146,5,'2021-11-10 10:30:00','2021-11-10 15:27:47',297,32,103,25.00,'EUR','w'),(1117,128,4,'2021-11-10 10:39:00','2021-11-10 15:12:00',273,33,103,25.00,'EUR','f'),(1118,97,2,'2021-11-10 11:29:58','2021-11-10 15:12:29',222,32,87,25.00,'EUR','f'),(1119,118,4,'2021-11-10 12:08:00','2021-11-10 15:11:00',183,33,111,25.00,'EUR','f'),(1122,89,4,'2021-11-10 12:48:51','2021-11-10 15:26:28',157,32,111,25.00,'EUR','f'),(1123,110,4,'2021-11-10 13:12:58','2021-11-10 15:19:26',126,33,111,25.00,'EUR','f'),(1124,107,1,'2021-11-10 13:27:44','2021-11-10 14:30:04',62,32,105,25.00,'EUR','f'),(1125,87,4,'2021-11-10 13:50:08','2021-11-10 15:18:42',88,32,111,25.00,'EUR','f'),(1127,91,3,'2021-11-10 13:58:51','2021-11-10 16:20:25',141,33,81,25.00,'EUR','f'),(1128,121,3,'2021-11-10 13:59:24','2021-11-10 16:19:42',140,32,109,25.00,'EUR','f'),(1129,108,3,'2021-11-10 13:59:35','2021-11-10 15:41:26',101,32,109,25.00,'EUR','f'),(1130,103,3,'2021-11-10 14:09:55','2021-11-10 18:01:29',231,33,81,25.00,'EUR','f'),(1131,107,1,'2021-11-10 14:30:35','2021-11-10 15:28:43',58,32,87,25.00,'EUR','f'),(1137,103,3,'2021-11-10 18:30:31','2021-11-10 19:03:04',32,33,81,25.00,'EUR','f'),(1138,91,3,'2021-11-10 18:30:57','2021-11-10 19:08:35',37,33,81,25.00,'EUR','f'),(1142,108,3,'2021-11-10 19:01:19','2021-11-10 22:23:57',202,32,81,25.00,'EUR','f'),(1143,141,3,'2021-11-10 19:01:43','2021-11-10 22:23:51',202,32,81,25.00,'EUR','f'),(1146,121,3,'2021-11-10 20:44:53','2021-11-10 21:51:29',66,32,81,25.00,'EUR','f'),(1148,107,1,'2021-11-11 06:54:24','2021-11-11 10:10:01',195,32,105,25.00,'EUR','f'),(1149,145,1,'2021-11-11 07:00:26','2021-11-11 09:23:06',142,32,87,25.00,'EUR','f'),(1150,146,5,'2021-11-11 07:00:00','2021-11-11 10:10:00',190,32,103,25.00,'EUR','f'),(1151,125,4,'2021-11-11 07:00:49','2021-11-11 09:56:40',175,32,111,25.00,'EUR','f'),(1152,140,5,'2021-11-11 07:00:00','2021-11-11 10:10:00',190,32,103,25.00,'EUR','f'),(1153,87,4,'2021-11-11 07:01:05','2021-11-11 09:57:55',176,32,111,25.00,'EUR','f'),(1154,144,5,'2021-11-11 07:01:35','2021-11-11 09:58:05',176,33,103,25.00,'EUR','f'),(1155,105,2,'2021-11-11 07:02:00','2021-11-11 08:54:41',112,33,87,25.00,'EUR','f'),(1156,126,1,'2021-11-11 07:02:41','2021-11-11 10:01:45',179,33,105,25.00,'EUR','f'),(1157,110,4,'2021-11-11 07:02:58','2021-11-11 09:56:25',173,33,111,25.00,'EUR','f'),(1158,99,1,'2021-11-11 07:03:06','2021-11-11 09:58:19',175,33,105,25.00,'EUR','f'),(1159,128,5,'2021-11-11 07:05:00','2021-11-11 09:59:00',174,33,103,25.00,'EUR','f'),(1160,89,4,'2021-11-11 07:05:31','2021-11-11 09:59:30',173,32,111,25.00,'EUR','f'),(1162,97,2,'2021-11-11 07:07:36','2021-11-11 09:59:46',172,32,87,25.00,'EUR','f'),(1163,111,2,'2021-11-11 07:08:24','2021-11-11 08:58:24',110,32,87,25.00,'EUR','f'),(1164,92,2,'2021-11-11 07:13:30','2021-11-11 09:57:44',164,33,110,25.00,'EUR','f'),(1165,118,4,'2021-11-11 07:16:57','2021-11-11 09:01:59',105,33,103,25.00,'EUR','f'),(1166,100,NULL,'2021-11-10 15:00:00','2021-11-10 22:40:00',460,34,111,0.00,'EUR','w'),(1167,93,NULL,'2021-11-10 15:00:00','2021-11-10 22:43:00',463,34,111,0.00,'EUR','w'),(1168,104,1,'2021-11-11 08:00:22','2021-11-11 10:10:01',129,32,105,25.00,'EUR','f'),(1169,105,2,'2021-11-11 08:54:57','2021-11-11 09:58:12',63,33,110,25.00,'EUR','f'),(1170,111,2,'2021-11-11 08:58:38','2021-11-11 10:10:01',71,32,110,25.00,'EUR','f'),(1171,134,2,'2021-11-11 08:58:52','2021-11-11 09:59:24',60,32,110,25.00,'EUR','f'),(1172,118,4,'2021-11-11 09:02:09','2021-11-11 09:58:39',56,33,111,25.00,'EUR','f'),(1173,145,1,'2021-11-11 09:23:22','2021-11-11 10:01:28',38,32,105,25.00,'EUR','f'),(1174,145,1,'2021-11-11 10:29:09','2021-11-11 15:30:40',301,32,105,25.00,'EUR','f'),(1175,118,4,'2021-11-11 10:29:19','2021-11-11 15:19:50',290,33,111,25.00,'EUR','f'),(1176,92,2,'2021-11-11 10:29:34','2021-11-11 15:17:19',287,33,87,25.00,'EUR','f'),(1177,140,5,'2021-11-11 10:29:00','2021-11-11 13:54:00',205,32,103,25.00,'EUR','f'),(1178,105,2,'2021-11-11 10:30:23','2021-11-11 15:14:43',284,33,110,25.00,'EUR','f'),(1179,128,5,'2021-11-11 10:30:00','2021-11-11 15:21:00',291,33,103,25.00,'EUR','f'),(1180,87,4,'2021-11-11 10:30:32','2021-11-11 15:23:13',292,32,111,25.00,'EUR','f'),(1181,144,5,'2021-11-11 10:30:36','2021-11-11 11:34:21',63,33,103,25.00,'EUR','f'),(1182,125,4,'2021-11-11 10:31:25','2021-11-11 15:23:51',292,32,111,25.00,'EUR','f'),(1183,89,4,'2021-11-11 10:31:50','2021-11-11 15:24:12',292,32,111,25.00,'EUR','f'),(1184,126,1,'2021-11-11 10:32:04','2021-11-11 14:41:13',249,33,87,25.00,'EUR','f'),(1185,134,2,'2021-11-11 10:32:50','2021-11-11 15:19:20',286,32,110,25.00,'EUR','f'),(1186,111,2,'2021-11-11 10:33:19','2021-11-11 15:19:33',286,32,110,25.00,'EUR','f'),(1187,97,2,'2021-11-11 10:33:38','2021-11-11 15:19:13',285,32,110,25.00,'EUR','f'),(1188,110,4,'2021-11-11 10:34:13','2021-11-11 15:21:00',286,33,111,25.00,'EUR','f'),(1189,109,NULL,'2021-11-10 07:07:00','2021-11-10 15:00:00',473,34,103,0.00,'EUR','w'),(1190,109,NULL,'2021-11-11 07:00:00','2021-11-11 11:00:00',240,34,103,0.00,'EUR','w'),(1191,144,5,'2021-11-11 11:34:00','2021-11-11 15:19:00',225,33,103,25.00,'EUR','f'),(1192,109,NULL,'2021-11-11 11:37:54','2021-11-11 13:11:22',93,34,112,0.00,'EUR','f'),(1193,109,NULL,'2021-11-11 13:14:29','2021-11-11 15:27:31',133,34,115,0.00,'EUR','f'),(1194,140,5,'2021-11-11 13:55:02','2021-11-11 15:28:40',93,32,103,25.00,'EUR','f'),(1196,121,3,'2021-11-11 14:01:29','2021-11-11 16:50:41',169,32,81,25.00,'EUR','f'),(1199,108,3,'2021-11-11 14:02:55','2021-11-11 16:52:35',169,32,81,25.00,'EUR','f'),(1201,141,3,'2021-11-11 15:19:44','2021-11-11 17:58:26',158,32,106,25.00,'EUR','f'),(1202,107,1,'2021-11-11 15:29:14','2021-11-11 15:29:28',0,32,105,25.00,'EUR','f'),(1203,91,3,'2021-11-11 15:46:55','2021-11-11 18:00:18',133,32,106,25.00,'EUR','f'),(1204,121,3,'2021-11-11 16:50:54','2021-11-11 18:01:11',70,32,106,25.00,'EUR','f'),(1205,108,3,'2021-11-11 16:52:47','2021-11-11 18:01:06',68,32,106,25.00,'EUR','f'),(1206,103,3,'2021-11-11 17:28:11','2021-11-11 18:00:11',32,32,106,25.00,'EUR','f'),(1207,103,3,'2021-11-11 18:29:23','2021-11-11 22:23:18',233,32,106,25.00,'EUR','f'),(1208,91,3,'2021-11-11 18:29:44','2021-11-11 22:23:24',233,32,106,25.00,'EUR','f'),(1209,141,3,'2021-11-11 18:31:03','2021-11-11 22:25:35',234,32,106,25.00,'EUR','f'),(1210,108,3,'2021-11-11 18:33:32','2021-11-11 22:25:28',231,32,106,25.00,'EUR','f'),(1211,121,3,'2021-11-11 18:33:44','2021-11-11 22:25:41',231,32,106,25.00,'EUR','f'),(1212,107,1,'2021-11-12 06:55:57','2021-11-12 09:56:09',180,32,105,25.00,'EUR','f'),(1213,134,2,'2021-11-12 06:58:44','2021-11-12 10:10:01',191,32,110,25.00,'EUR','f'),(1214,97,2,'2021-11-12 06:59:07','2021-11-12 09:58:52',179,32,87,25.00,'EUR','f'),(1215,111,2,'2021-11-12 06:59:16','2021-11-12 10:02:23',183,32,110,25.00,'EUR','f'),(1216,125,4,'2021-11-12 07:00:16','2021-11-12 10:10:01',189,32,111,25.00,'EUR','f'),(1217,145,1,'2021-11-12 07:00:49','2021-11-12 09:57:43',176,32,105,25.00,'EUR','f'),(1218,87,4,'2021-11-12 07:01:03','2021-11-12 09:57:23',176,32,111,25.00,'EUR','f'),(1219,89,4,'2021-11-12 07:01:22','2021-11-12 09:57:34',176,32,111,25.00,'EUR','f'),(1220,146,5,'2021-11-12 07:01:00','2021-11-12 10:10:00',189,32,103,25.00,'EUR','f'),(1221,140,5,'2021-11-12 07:01:49','2021-11-12 10:10:01',188,32,103,25.00,'EUR','f'),(1222,92,2,'2021-11-12 07:02:57','2021-11-12 09:56:24',173,33,110,25.00,'EUR','f'),(1223,126,1,'2021-11-12 07:03:13','2021-11-12 09:57:11',173,33,87,25.00,'EUR','f'),(1224,128,5,'2021-11-12 07:03:00','2021-11-12 10:10:00',187,33,103,25.00,'EUR','f'),(1225,105,2,'2021-11-12 07:04:10','2021-11-12 08:05:10',61,33,110,25.00,'EUR','f'),(1226,118,4,'2021-11-12 07:04:45','2021-11-12 10:01:58',177,33,111,25.00,'EUR','f'),(1227,109,NULL,'2021-11-12 07:22:39','2021-11-12 10:10:01',167,34,115,0.00,'EUR','f'),(1228,144,5,'2021-11-12 07:37:00','2021-11-12 10:10:00',153,33,103,25.00,'EUR','f'),(1229,104,1,'2021-11-12 07:57:03','2021-11-12 10:10:01',132,32,105,25.00,'EUR','f'),(1230,105,2,'2021-11-12 08:05:26','2021-11-12 09:52:35',107,33,111,25.00,'EUR','f'),(1231,107,1,'2021-11-12 10:28:00','2021-11-12 15:00:00',272,32,105,25.00,'EUR','f'),(1232,89,4,'2021-11-12 10:29:00','2021-11-12 15:00:00',271,32,111,25.00,'EUR','f'),(1234,87,4,'2021-11-12 10:30:00','2021-11-12 15:00:00',270,32,111,25.00,'EUR','f'),(1235,118,4,'2021-11-12 10:30:00','2021-11-12 15:00:00',270,33,111,25.00,'EUR','f'),(1236,145,1,'2021-11-12 10:31:00','2021-11-12 15:01:00',270,32,105,25.00,'EUR','f'),(1237,105,2,'2021-11-12 10:31:38','2021-11-12 11:27:21',55,33,111,25.00,'EUR','f'),(1238,126,1,'2021-11-12 10:32:48','2021-11-12 10:33:51',1,33,87,25.00,'EUR','f'),(1240,111,2,'2021-11-12 10:33:00','2021-11-12 15:00:00',267,32,110,25.00,'EUR','f'),(1245,144,5,'2021-11-12 13:30:00','2021-11-12 21:26:00',476,33,103,25.00,'EUR','f'),(1246,91,3,'2021-11-12 13:55:00','2021-11-12 21:52:00',477,32,106,25.00,'EUR','f'),(1247,103,3,'2021-11-12 13:55:00','2021-11-12 21:54:00',479,32,106,25.00,'EUR','f'),(1248,108,3,'2021-11-12 13:58:00','2021-11-12 21:54:00',476,32,106,25.00,'EUR','f'),(1249,121,3,'2021-11-12 13:58:00','2021-11-12 21:53:00',475,32,106,25.00,'EUR','f'),(1252,109,NULL,'2021-11-12 10:30:00','2021-11-12 14:00:00',210,34,114,0.00,'EUR','w'),(1254,145,1,'2021-11-15 06:56:57',NULL,NULL,32,105,25.00,'EUR','f'),(1255,125,4,'2021-11-15 06:57:59',NULL,NULL,32,111,25.00,'EUR','f'),(1256,89,4,'2021-11-15 06:58:11',NULL,NULL,32,111,25.00,'EUR','f'),(1257,107,1,'2021-11-15 06:58:54',NULL,NULL,32,105,25.00,'EUR','f'),(1258,115,5,'2021-11-15 06:59:17',NULL,NULL,NULL,1,0.00,'EUR','f'),(1259,87,4,'2021-11-15 06:59:34',NULL,NULL,32,111,25.00,'EUR','f'),(1260,118,4,'2021-11-15 06:59:50',NULL,NULL,33,111,25.00,'EUR','f'),(1261,110,4,'2021-11-15 07:00:01',NULL,NULL,33,111,25.00,'EUR','f'),(1262,111,2,'2021-11-15 07:00:03',NULL,NULL,32,110,25.00,'EUR','f'),(1263,126,1,'2021-11-15 07:00:16',NULL,NULL,33,105,25.00,'EUR','f'),(1264,97,2,'2021-11-15 07:00:26',NULL,NULL,32,110,25.00,'EUR','f'),(1265,91,3,'2021-11-15 07:00:31',NULL,NULL,32,106,25.00,'EUR','f'),(1266,92,2,'2021-11-15 07:00:42',NULL,NULL,33,110,25.00,'EUR','f'),(1267,141,3,'2021-11-15 07:00:59',NULL,NULL,32,106,25.00,'EUR','f'),(1268,121,3,'2021-11-15 07:01:22',NULL,NULL,32,106,25.00,'EUR','f'),(1269,105,2,'2021-11-15 07:02:52',NULL,NULL,33,110,25.00,'EUR','f'),(1270,108,3,'2021-11-15 07:03:18',NULL,NULL,32,106,25.00,'EUR','f'),(1271,146,5,'2021-11-15 07:04:08',NULL,NULL,32,102,25.00,'EUR','f'),(1272,134,2,'2021-11-15 07:04:29',NULL,NULL,32,110,25.00,'EUR','f'),(1273,99,1,'2021-11-15 07:11:03',NULL,NULL,33,105,25.00,'EUR','f'),(1274,103,3,'2021-11-15 07:11:49',NULL,NULL,32,106,25.00,'EUR','f'),(1275,109,NULL,'2021-11-15 07:13:15',NULL,NULL,33,107,25.00,'EUR','f'),(1276,140,5,'2021-11-15 07:14:24',NULL,NULL,32,103,25.00,'EUR','f'),(1277,104,1,'2021-11-15 08:13:19',NULL,NULL,32,105,25.00,'EUR','f'),(1278,128,5,'2021-11-15 09:12:00',NULL,NULL,NULL,1,0.00,'EUR','f'),(1279,142,NULL,'2021-11-16 12:03:53','2021-11-16 13:27:18',83,NULL,NULL,NULL,NULL,'f'),(1280,142,NULL,'2021-11-16 14:11:36','2021-11-16 14:11:42',0,NULL,NULL,NULL,NULL,'f'),(1281,142,NULL,'2021-11-16 14:13:04','2021-11-16 14:14:33',1,NULL,NULL,NULL,NULL,'f'),(1282,142,NULL,'2021-11-16 14:15:20','2021-11-16 14:15:31',0,NULL,NULL,NULL,NULL,'f'),(1283,142,NULL,'2021-11-16 14:15:34','2021-11-16 14:15:38',0,NULL,NULL,NULL,NULL,'f'),(1284,142,NULL,'2021-11-16 14:16:55','2021-11-16 14:17:14',0,NULL,NULL,NULL,NULL,'f'),(1285,142,NULL,'2021-11-16 14:17:46','2021-11-16 14:17:47',0,NULL,NULL,NULL,NULL,'f'),(1286,142,NULL,'2021-11-16 14:19:55','2021-11-16 14:19:57',0,NULL,NULL,NULL,NULL,'f'),(1287,142,NULL,'2021-11-17 09:09:50','2021-11-18 10:46:00',1536,NULL,NULL,NULL,NULL,'f'),(1288,142,NULL,'2021-11-18 23:38:24','2021-11-18 23:40:28',2,NULL,NULL,NULL,NULL,'f'),(1289,142,NULL,'2021-11-19 09:04:47','2021-11-19 09:04:59',0,NULL,NULL,NULL,NULL,'f'),(1290,142,NULL,'2021-11-19 09:06:13','2021-11-19 09:06:20',0,NULL,NULL,NULL,NULL,'f'),(1291,142,NULL,'2021-11-19 09:02:35','2021-11-19 09:07:23',4,NULL,NULL,NULL,NULL,'f'),(1292,142,NULL,'2021-11-19 07:19:16','2021-11-19 09:09:45',110,NULL,NULL,NULL,NULL,'f'),(1293,142,NULL,'2021-11-19 09:13:32','2021-11-19 09:13:54',0,NULL,NULL,NULL,NULL,'f'),(1294,142,NULL,'2021-11-19 09:14:55','2021-11-19 09:16:35',1,NULL,NULL,NULL,NULL,'f'),(1295,142,NULL,'2021-11-19 09:16:43','2021-11-19 09:18:07',1,NULL,NULL,NULL,NULL,'f');
/*!40000 ALTER TABLE `timetracking` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `before_insert` BEFORE INSERT ON `timetracking` FOR EACH ROW BEGIN
	
	SELECT count(*) INTO @cnt FROM timetracking WHERE employee=NEW.employee AND stop is NULL;
    IF (@cnt>0) THEN
    	SIGNAL SQLSTATE '45000' SET message_text = 'User still working';
    END IF;
    
	
	IF (NEW.stop IS NOT NULL AND NEW.stop<NEW.start) THEN
    SIGNAL SQLSTATE '45050' SET message_text = 'Data la oprire este mai veche decat data la pornire';
    END IF;
    
	
	SELECT team into @team FROM employees WHERE id=NEW.employee;
    SET NEW.team=@team;

    
    
    IF( NEW.stop IS NOT NULL) THEN
    	SET NEW.duration = TIMESTAMPDIFF(MINUTE,NEW.start,NEW.stop);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `add_cost_on_full_insert` AFTER INSERT ON `timetracking` FOR EACH ROW BEGIN
	IF(NEW.stop IS NOT NULL and NEW.order IS NOT NULL AND NEW.hourly_rate IS NOT NULL) THEN
        SELECT name,unit,`grouping` into @new_op,@new_op_unit,@grp FROM catalog WHERE id=NEW.operation;
	    INSERT INTO orders_costs(oid, cat_id,`grouping`, name, qty, unit, unit_price, currency)
    		VALUES (NEW.order, NEW.operation,@grp, @new_op, NEW.duration/60, @new_op_unit, NEW.hourly_rate, NEW.currency) 
    		ON duplicate KEY update qty=qty+NEW.duration/60, total=total+NEW.duration/60*NEW.hourly_rate;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `before_update` BEFORE UPDATE ON `timetracking` FOR EACH ROW BEGIN
  	
	IF (NEW.stop IS NOT NULL AND NEW.stop<NEW.start) THEN
    	SIGNAL SQLSTATE '45050' SET message_text = 'Data la oprire este mai veche decat data la pornire';
    END IF;
    
	
    IF(NEW.team IS NULL) THEN
		SELECT team into @team FROM employees WHERE id=NEW.employee;
    	SET NEW.team=@team;
    END IF;
    
    IF(NEW.status='f' and OLD.status!=NEW.status) THEN
    	SET NEW.stop=CURRENT_TIMESTAMP;
    END IF;
    
    IF(NEW.stop IS NOT NULL) THEN
    	SET NEW.duration = TIMESTAMPDIFF(MINUTE,NEW.start,NEW.stop);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `add_cost_on_update` AFTER UPDATE ON `timetracking` FOR EACH ROW BEGIN
  
    IF( (OLD.stop is NOT NULL) AND (OLD.order IS NOT NULL) AND (OLD.hourly_rate IS NOT NULL) AND (OLD.operation IS NOT NULL)) THEN
    	SELECT name,unit into @old_op,@old_op_unit FROM catalog WHERE id=OLD.operation;
        
        UPDATE orders_costs SET qty=qty-OLD.duration/60, total=total-OLD.duration/60*OLD.hourly_rate WHERE oid=OLD.order AND name=@old_op AND cat_id=OLD.operation AND currency=OLD.currency;
    END IF;
   
    IF(NEW.stop IS NOT NULL AND NEW.order IS NOT NULL AND NEW.hourly_rate IS NOT NULL AND (NEW.operation IS NOT NULL)) THEN
       	SELECT name,unit,`grouping` into @new_op,@new_op_unit,@grp FROM catalog WHERE id=NEW.operation;
        INSERT INTO orders_costs(`grouping`,oid, cat_id, name, qty, unit, unit_price, currency)
            VALUES (@grp,NEW.order, NEW.operation, @new_op, NEW.duration/60, @new_op_unit, NEW.hourly_rate, NEW.currency)
            ON duplicate KEY update qty=qty+NEW.duration/60, total=total+NEW.duration/60*NEW.hourly_rate;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `update_cost_on_ttentry_delete` BEFORE DELETE ON `timetracking` FOR EACH ROW BEGIN
	SELECT name,unit into @old_op,@old_op_unit FROM catalog WHERE id=OLD.operation;
  
    IF( (OLD.stop is NOT NULL) AND (OLD.order IS NOT NULL) AND (OLD.hourly_rate IS NOT NULL) ) THEN
        
        SELECT sum(total) INTO @total FROM orders_costs WHERE oid=OLD.order AND name=@old_op AND cat_id=OLD.operation AND currency=OLD.currency;
        IF(@total-OLD.duration/60*OLD.hourly_rate > 0) THEN
        	UPDATE orders_costs SET qty=qty-OLD.duration/60, total=total-OLD.duration/60*OLD.hourly_rate WHERE oid=OLD.order AND name=@old_op AND cat_id=OLD.operation AND currency=OLD.currency;
        ELSE
        	DELETE FROM orders_costs WHERE oid=OLD.order AND name=@old_op AND cat_id=OLD.operation AND currency=OLD.currency;
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;

--
-- Temporary view structure for view `timetracking_wdiff`
--

DROP TABLE IF EXISTS `timetracking_wdiff`;
/*!50001 DROP VIEW IF EXISTS `timetracking_wdiff`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `timetracking_wdiff` AS SELECT 
 1 AS `id`,
 1 AS `employee`,
 1 AS `start`,
 1 AS `stop`,
 1 AS `operation`,
 1 AS `order`,
 1 AS `hourly_rate`,
 1 AS `currency`,
 1 AS `status`,
 1 AS `diff`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tt_expanded`
--

DROP TABLE IF EXISTS `tt_expanded`;
/*!50001 DROP VIEW IF EXISTS `tt_expanded`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `tt_expanded` AS SELECT 
 1 AS `id`,
 1 AS `employee`,
 1 AS `start`,
 1 AS `stop`,
 1 AS `operation`,
 1 AS `duration`,
 1 AS `order`,
 1 AS `hourly_rate`,
 1 AS `currency`,
 1 AS `status`,
 1 AS `empl_name`,
 1 AS `op_name`,
 1 AS `docnum`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `units` (
  `unit` varchar(45) NOT NULL,
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES ('buc',NULL,'numarator'),('kg',NULL,'greutate'),('mc',NULL,'volum'),('mp',NULL,'suprafata'),('ora',NULL,'timp'),('set',NULL,'numarator');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `users` (
  `userid` varchar(20) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `creationtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` datetime DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `level` tinyint unsigned DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','7c768595eec1dd5f86dd62fc4353c719e54acb515f275fa49a4b7169','admin','admin','sv@softaccel.net','2020-12-08 09:25:26',NULL,1,5),('vsergione','7c768595eec1dd5f86dd62fc4353c719e54acb515f275fa49a4b7169','Sergiu','Voicu','s@v.com','2021-09-06 12:02:27',NULL,0,5);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `hash_password_on_insert` BEFORE INSERT ON `users` FOR EACH ROW SET NEW.password=sha2(NEW.password,224) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `add_user_rights` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO users_meta (user_id, meta_key, meta_val)
    SELECT NEW.userid, CONCAT('rights', SUBSTR(s.key, 7)), '[]' FROM settings s WHERE s.key LIKE 'module.%';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `do_not_alter_admin_userid` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
	IF (OLD.userid="admin" and NEW.userid!="admin") THEN
		SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'Nu este permisa modificarea userid-lui utilizatorului admin';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `hash_password_on_update` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
	if(NEW.password!="" and NEW.password is not null and NEW.password!=OLD.password) THEN
    	SET NEW.password=sha2(NEW.password,224);
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`spaleck`@`localhost`*/ /*!50003 TRIGGER `do_not_delete_admin` BEFORE DELETE ON `users` FOR EACH ROW BEGIN
	IF (OLD.userid="admin") THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Nu este permisa stergerea utilizatorului admin';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;

--
-- Table structure for table `users_meta`
--

DROP TABLE IF EXISTS `users_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb3*/;
CREATE TABLE `users_meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_val` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_meta`
--

LOCK TABLES `users_meta` WRITE;
/*!40000 ALTER TABLE `users_meta` DISABLE KEYS */;
INSERT INTO `users_meta` VALUES (31,'admin','rights.catalog','[\"c\",\"r\",\"u\",\"d\"]'),(32,'admin','rights.deliveries','[\"c\",\"r\",\"u\",\"d\"]'),(33,'admin','rights.employees','[\"c\",\"r\",\"u\",\"d\"]'),(34,'admin','rights.jobs','[\"c\",\"r\",\"u\",\"d\"]'),(35,'admin','rights.orders','[\"c\",\"r\",\"u\",\"d\"]'),(36,'admin','rights.partners','[\"c\",\"r\",\"u\",\"d\"]'),(37,'admin','rights.teams','[\"c\",\"r\",\"u\",\"d\"]'),(38,'admin','rights.timetracking','[\"c\",\"r\",\"u\",\"d\"]'),(39,'admin','rights.units','[\"c\",\"r\",\"u\",\"d\"]'),(40,'admin','rights.users','[\"c\",\"r\",\"u\",\"d\"]'),(56,'vsergione','rights.catalog','[\"c\",\"r\",\"u\",\"d\"]'),(57,'vsergione','rights.deliveries','[\"c\",\"r\",\"u\",\"d\"]'),(58,'vsergione','rights.employees','[\"c\",\"r\",\"u\",\"d\"]'),(59,'vsergione','rights.jobs','[\"c\",\"r\",\"u\",\"d\"]'),(60,'vsergione','rights.orders','[\"c\",\"r\",\"u\",\"d\"]'),(61,'vsergione','rights.partners','[\"c\",\"r\",\"u\",\"d\"]'),(62,'vsergione','rights.teams','[\"c\",\"r\",\"u\",\"d\"]'),(63,'vsergione','rights.timetracking','[\"c\",\"r\",\"u\",\"d\"]'),(64,'vsergione','rights.units','[\"c\",\"r\",\"u\",\"d\"]'),(65,'vsergione','rights.users','[\"c\",\"r\",\"u\",\"d\"]');
/*!40000 ALTER TABLE `users_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `users_rights`
--

DROP TABLE IF EXISTS `users_rights`;
/*!50001 DROP VIEW IF EXISTS `users_rights`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb3*/;
/*!50001 CREATE VIEW `users_rights` AS SELECT 
 1 AS `id`,
 1 AS `user_id`,
 1 AS `module`,
 1 AS `meta_val`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'spaleck'
--
/*!50003 DROP PROCEDURE IF EXISTS `addToDelivery` */;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `addToDelivery`(IN `invId` INT, IN `dqty` FLOAT(10,3), IN `dlvrId` INT)
begin
	update inventory set qty=qty-dqty WHERE id=invId;
    insert into deliveries_contents(delivery,item,qty) VALUES(dlvrId,invId,dqty) on duplicate key update qty=qty+dqty;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_zeroqty_costs` */;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `delete_zeroqty_costs`()
DELETE FROM orders_costs WHERE qty=0 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `detele_zerolength_tt` */;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `detele_zerolength_tt`()
    NO SQL
DELETE FROM timetracking WHERE duration=0 AND stop IS NOT null ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `log` */;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `log`(IN `msg` TEXT)
    NO SQL
insert into log(message) VALUES(msg) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `login`(IN `uid` VARCHAR(50), IN `pass` VARCHAR(255), OUT `cnt` INT)
    NO SQL
select count(*) into cnt from users where userid=uid and password=sha2(pass,224) and active=1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `stop_tt_allopen` */;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `stop_tt_allopen`()
    SQL SECURITY INVOKER
update timetracking set status="f" WHERE stop is null ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `stop_tt_exceed` */;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3*/ ;
/*!50003 SET character_set_results = utf8mb3*/ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `stop_tt_exceed`()
BEGIN
	SELECT `value` INTO @limit FROM settings WHERE `key`='timetracking.stop_after' LIMIT 0,1;
	IF(@limit is null) THEN
    	SET @limit = 540;
    END IF;
	UPDATE timetracking set stop=CURRENT_TIMESTAMP, status='f' WHERE stop IS null AND TIMESTAMPDIFF(MINUTE,start,CURRENT_TIMESTAMP) > @limit ORDER BY `timetracking`.`id`;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;

--
-- Current Database: `spaleck`
--

USE `spaleck`;

--
-- Final view structure for view `alloc_orders`
--

/*!50001 DROP VIEW IF EXISTS `alloc_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alloc_orders` AS select `e`.`id` AS `emplid`,`e`.`fname` AS `fname`,`e`.`lname` AS `lname`,`e`.`card` AS `card`,`op`.`name` AS `op_name`,`op`.`id` AS `op_id`,`d`.`docnum` AS `order_name`,`o`.`oid` AS `order_id`,`o2e`.`hourlyrate` AS `hourlyrate`,`o2e`.`currency` AS `currency`,concat(`e`.`id`,convert(`d`.`docnum` using utf8mb4),convert(`op`.`name` using utf8mb4)) AS `unq` from ((((`employees` `e` left join `orders_2_employees` `o2e` on((`o2e`.`emplid` = `e`.`id`))) left join `orders` `o` on((`o`.`oid` = `o2e`.`orderid`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) left join `catalog` `op` on((`op`.`id` = `o2e`.`operation`))) where ((`d`.`docnum` is not null) and (`o`.`state` = 'proc')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cnt_ttrecs_big_duration`
--

/*!50001 DROP VIEW IF EXISTS `cnt_ttrecs_big_duration`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cnt_ttrecs_big_duration` AS select 1 AS `id`,count(0) AS `num` from `timetracking` where (timestampdiff(MINUTE,`timetracking`.`start`,`timetracking`.`stop`) > 420) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cnt_ttrecs_not_alloc`
--

/*!50001 DROP VIEW IF EXISTS `cnt_ttrecs_not_alloc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cnt_ttrecs_not_alloc` AS select 1 AS `id`,count(0) AS `cnt` from `timetracking_wdiff` where (`timetracking_wdiff`.`order` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `deliveries_contents_notdlvd`
--

/*!50001 DROP VIEW IF EXISTS `deliveries_contents_notdlvd`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `deliveries_contents_notdlvd` AS select `deliveries_contents`.`id` AS `id`,`deliveries_contents`.`delivery` AS `delivery`,`deliveries_contents`.`item` AS `item`,`deliveries_contents`.`seqno` AS `seqno`,`deliveries_contents`.`label_printed` AS `label_printed`,`deliveries_contents`.`checkout` AS `checkout` from `deliveries_contents` where (`deliveries_contents`.`checkout` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `delivery_items_aggregated`
--

/*!50001 DROP VIEW IF EXISTS `delivery_items_aggregated`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `delivery_items_aggregated` AS select `oim`.`meta_val` AS `code`,`a`.`delivery` AS `delivery`,`a`.`label` AS `label`,`a`.`item` AS `item`,`a`.`totalcnt` AS `totalcnt`,`a`.`printed` AS `printed`,`a`.`checkout` AS `checkout`,(`a`.`totalcnt` - `a`.`printed`) AS `notprinted`,(`a`.`totalcnt` - `a`.`checkout`) AS `notcheckout` from ((select `deliveries_contents`.`delivery` AS `delivery`,`orders_items`.`name` AS `label`,`deliveries_contents`.`item` AS `item`,count(0) AS `totalcnt`,sum(`deliveries_contents`.`label_printed`) AS `printed`,sum(`deliveries_contents`.`checkout`) AS `checkout` from (`orders_items` join `deliveries_contents`) where (`orders_items`.`id` = `deliveries_contents`.`item`) group by `deliveries_contents`.`delivery`,`deliveries_contents`.`item`) `a` left join `orders_items_meta` `oim` on(((`oim`.`order_item_id` = `a`.`item`) and (`oim`.`meta_key` = 'P.A.P_ZeichnungSpr.Zeichnung')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `emplToOrdAssoc`
--

/*!50001 DROP VIEW IF EXISTS `emplToOrdAssoc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emplToOrdAssoc` AS select `o2e`.`id` AS `id`,`ord`.`oid` AS `oid`,`ord`.`state` AS `status`,`doc`.`docnum` AS `docnum`,`ops`.`name` AS `opname`,`o2e`.`hourlyrate` AS `hourlyrate`,`o2e`.`currency` AS `currency`,`empl`.`fname` AS `fname`,`empl`.`lname` AS `lname`,`o2e`.`emplid` AS `emplid`,`ord`.`label` AS `label`,`ops`.`id` AS `opid` from ((((`orders_2_employees` `o2e` left join `orders` `ord` on((`ord`.`oid` = `o2e`.`orderid`))) left join `catalog` `ops` on((`ops`.`id` = `o2e`.`operation`))) left join `documents` `doc` on((`doc`.`id` = `ord`.`doc_id`))) left join `employees` `empl` on((`empl`.`id` = `o2e`.`emplid`))) order by `o2e`.`emplid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employees_names`
--

/*!50001 DROP VIEW IF EXISTS `employees_names`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employees_names` AS select `employees`.`id` AS `id`,concat(`employees`.`fname`,' ',`employees`.`lname`) AS `fullname`,`employees`.`team` AS `team` from `employees` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employees_work`
--

/*!50001 DROP VIEW IF EXISTS `employees_work`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `employees_work` AS select round((sum(`tt`.`duration`) / 60),2) AS `d`,`tt`.`employee` AS `employee`,`tt`.`operation` AS `operation`,left(`tt`.`start`,10) AS `day`,`tt`.`order` AS `order` from `timetracking` `tt` group by `tt`.`order`,`tt`.`operation`,`day`,`tt`.`employee` order by `tt`.`employee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_to_delivery`
--

/*!50001 DROP VIEW IF EXISTS `order_to_delivery`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_to_delivery` AS select distinct `o`.`oid` AS `oid`,`d`.`id` AS `did`,`d`.`label` AS `label` from (((`orders` `o` join `orders_items` `oi` on((`oi`.`order` = `o`.`oid`))) join `deliveries_contents` `dc` on((`dc`.`item` = `oi`.`id`))) join `deliveries` `d` on((`d`.`id` = `dc`.`delivery`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_costs_aggregated`
--

/*!50001 DROP VIEW IF EXISTS `orders_costs_aggregated`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_costs_aggregated` AS select `orders_costs`.`oid` AS `oid`,`orders_costs`.`unit` AS `unit`,`orders_costs`.`currency` AS `currency`,`orders_costs`.`grouping` AS `grouping`,sum(`orders_costs`.`qty`) AS `qty`,sum(`orders_costs`.`total`) AS `total` from `orders_costs` group by `orders_costs`.`oid`,`orders_costs`.`grouping`,`orders_costs`.`unit`,`orders_costs`.`currency` order by `orders_costs`.`oid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_costs_total`
--

/*!50001 DROP VIEW IF EXISTS `orders_costs_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_costs_total` AS select `orders_costs`.`currency` AS `currency`,`orders_costs`.`oid` AS `oid`,sum(`orders_costs`.`total`) AS `total`,sum(`orders_costs`.`total_wvat`) AS `total_wvat` from `orders_costs` group by `orders_costs`.`oid`,`orders_costs`.`currency` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_count_bystate`
--

/*!50001 DROP VIEW IF EXISTS `orders_count_bystate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_count_bystate` AS select `orders`.`state` AS `state`,count(0) AS `cnt` from `orders` group by `orders`.`state` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_extended`
--

/*!50001 DROP VIEW IF EXISTS `orders_extended`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_extended` AS select `o`.`oid` AS `oid`,`o`.`label` AS `label`,`o`.`comments` AS `comments`,`o`.`state` AS `state`,`o`.`doc_id` AS `doc_id`,`o`.`partner_id` AS `partner_id`,`o`.`created_on` AS `created_on`,`o`.`closed_on` AS `closed_on`,`o`.`final_value` AS `final_value`,`o`.`user_id` AS `user_id`,`p`.`name` AS `pname`,`d`.`docnum` AS `docnum` from ((`orders` `o` left join `partners` `p` on((`p`.`id` = `o`.`partner_id`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_in_delay`
--

/*!50001 DROP VIEW IF EXISTS `orders_in_delay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_in_delay` AS select `o`.`oid` AS `oid`,`o`.`label` AS `label`,`o`.`comments` AS `comments`,`o`.`state` AS `state`,`o`.`multiplied_by` AS `multiplied_by`,`o`.`doc_id` AS `doc_id`,`o`.`cust_int_ref` AS `cust_int_ref`,`o`.`partner_id` AS `partner_id`,`o`.`created_on` AS `created_on`,`o`.`startwork_on` AS `startwork_on`,`o`.`readytodeliver_on` AS `readytodeliver_on`,`o`.`closed_on` AS `closed_on`,`o`.`order_value` AS `order_value`,`o`.`calculated_value` AS `calculated_value`,`o`.`final_value` AS `final_value`,`o`.`currency` AS `currency`,`o`.`user_id` AS `user_id`,`o`.`team` AS `team` from (`orders` `o` left join `orders_meta` `om` on(((`om`.`order_id` = `o`.`oid`) and (`om`.`meta_key` = 'estimated_delivery')))) where ((`o`.`state` in ('proc','ready')) and (`om`.`meta_val` is not null) and (`om`.`meta_val` < curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_items_labels`
--

/*!50001 DROP VIEW IF EXISTS `orders_items_labels`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_items_labels` AS select `o`.`oid` AS `orderId`,`oi`.`id` AS `itemId`,`oi`.`name` AS `title`,`om`.`meta_val` AS `belegNum`,`d`.`docnum` AS `docnum`,`oim1`.`meta_val` AS `partId`,`oim2`.`meta_val` AS `designId` from (((((`orders_items` `oi` left join `orders` `o` on((`o`.`oid` = `oi`.`order`))) left join `orders_items_meta` `oim1` on(((`oim1`.`order_item_id` = `oi`.`id`) and (`oim1`.`meta_key` = 'P.A.E_BelegPos.Artikel')))) left join `orders_items_meta` `oim2` on(((`oim2`.`order_item_id` = `oi`.`id`) and (`oim2`.`meta_key` = 'P.A.P_ZeichnungSpr.Zeichnung')))) left join `orders_meta` `om` on(((`om`.`order_id` = `o`.`oid`) and (`om`.`meta_key` = 'K.E.E_BelegKopf.BelegNummer')))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) order by `o`.`oid`,`oi`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_items_wdocnum`
--

/*!50001 DROP VIEW IF EXISTS `orders_items_wdocnum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_items_wdocnum` AS select `oi`.`id` AS `id`,`oi`.`order` AS `order`,`oi`.`name` AS `name`,`oi`.`cat_id` AS `cat_id`,`oi`.`unit` AS `unit`,`oi`.`qty` AS `qty`,`oi`.`dlvd_qty` AS `dlvd_qty`,`oi`.`unit_price` AS `unit_price`,`oi`.`vat` AS `vat`,`oi`.`unit_price_wvat` AS `unit_price_wvat`,`oi`.`vat_value` AS `vat_value`,`oi`.`total_value` AS `total_value`,`oi`.`total_value_wvat` AS `total_value_wvat`,`oi`.`currency` AS `currency`,`oi`.`match_key` AS `match_key`,`oi`.`match_value` AS `match_value`,`d`.`docnum` AS `docnum` from ((`orders_items` `oi` left join `orders` `o` on((`o`.`oid` = `oi`.`order`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_items_wmeta`
--

/*!50001 DROP VIEW IF EXISTS `orders_items_wmeta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_items_wmeta` AS select `oi`.`id` AS `id`,`oi`.`order` AS `order`,`oi`.`name` AS `name`,`oi`.`cat_id` AS `cat_id`,`oi`.`unit` AS `unit`,`oi`.`qty` AS `qty`,`oi`.`dlvd_qty` AS `dlvd_qty`,`oi`.`unit_price` AS `unit_price`,`oi`.`vat` AS `vat`,`oi`.`unit_price_wvat` AS `unit_price_wvat`,`oi`.`vat_value` AS `vat_value`,`oi`.`total_value` AS `total_value`,`oi`.`total_value_wvat` AS `total_value_wvat`,`oi`.`currency` AS `currency`,`oi`.`match_key` AS `match_key`,`oi`.`match_value` AS `match_value`,`opm1`.`meta_val` AS `partid`,`opm2`.`meta_val` AS `design`,`cm`.`meta_val` AS `gallery` from (((`orders_items` `oi` left join `orders_items_meta` `opm1` on(((`opm1`.`order_item_id` = `oi`.`id`) and (`opm1`.`meta_key` = 'P.A.E_BelegPos.Artikel')))) left join `orders_items_meta` `opm2` on(((`opm2`.`order_item_id` = `oi`.`id`) and (`opm2`.`meta_key` = 'P.A.P_ZeichnungSpr.Zeichnung')))) left join `catalog_meta` `cm` on(((`cm`.`cat_id` = `oi`.`cat_id`) and (`cm`.`meta_key` = 'Gallery')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_items_wmeta_notdlvd`
--

/*!50001 DROP VIEW IF EXISTS `orders_items_wmeta_notdlvd`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_items_wmeta_notdlvd` AS select `oi`.`id` AS `id`,`oi`.`order` AS `order`,`oi`.`name` AS `name`,`oi`.`cat_id` AS `cat_id`,`oi`.`unit` AS `unit`,`oi`.`qty` AS `qty`,`oi`.`dlvd_qty` AS `dlvd_qty`,`oi`.`unit_price` AS `unit_price`,`oi`.`vat` AS `vat`,`oi`.`unit_price_wvat` AS `unit_price_wvat`,`oi`.`vat_value` AS `vat_value`,`oi`.`total_value` AS `total_value`,`oi`.`total_value_wvat` AS `total_value_wvat`,`oi`.`currency` AS `currency`,`oi`.`match_key` AS `match_key`,`oi`.`match_value` AS `match_value`,`opm1`.`meta_val` AS `partid`,`opm2`.`meta_val` AS `design`,`cm`.`meta_val` AS `gallery` from (((`orders_items` `oi` left join `catalog_meta` `opm1` on(((`opm1`.`cat_id` = `oi`.`cat_id`) and (`opm1`.`meta_key` = 'P.A.E_BelegPos.Artikel')))) left join `catalog_meta` `opm2` on(((`opm2`.`cat_id` = `oi`.`cat_id`) and (`opm2`.`meta_key` = 'P.A.P_ZeichnungSpr.Zeichnung')))) left join `catalog_meta` `cm` on(((`cm`.`cat_id` = `oi`.`cat_id`) and (`cm`.`meta_key` = 'Gallery')))) where (`oi`.`qty` > `oi`.`dlvd_qty`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_states_cnt`
--

/*!50001 DROP VIEW IF EXISTS `orders_states_cnt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_states_cnt` AS select `orders`.`state` AS `state`,count(0) AS `cnt` from `orders` where (`orders`.`state` not in ('offer','canceled')) group by `orders`.`state` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_totalcnt_item`
--

/*!50001 DROP VIEW IF EXISTS `orders_totalcnt_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_totalcnt_item` AS select `o`.`oid` AS `oid`,`d`.`docnum` AS `docnum`,sum((`oi`.`qty` - `oi`.`dlvd_qty`)) AS `cnt` from ((`orders_items` `oi` left join `orders` `o` on((`o`.`oid` = `oi`.`order`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) group by `oi`.`order` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_working_hours`
--

/*!50001 DROP VIEW IF EXISTS `orders_working_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_working_hours` AS select `tt`.`order` AS `order_id`,round((sum(`tt`.`duration`) / 60),1) AS `total`,`om`.`meta_val` AS `estimated` from (`timetracking` `tt` left join `orders_meta` `om` on(((`om`.`meta_key` = 'estimated_work') and (`om`.`order_id` = `tt`.`order`)))) where ((`tt`.`hourly_rate` <> 0) and (`tt`.`duration` is not null)) group by `tt`.`order` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recipes_expanded`
--

/*!50001 DROP VIEW IF EXISTS `recipes_expanded`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recipes_expanded` AS select `rcp`.`id` AS `rcpid`,`rcp`.`parent_id` AS `parent_id`,`cat`.`id` AS `id`,`cat`.`name` AS `name`,`cat`.`type` AS `type`,`cat`.`unit` AS `unit`,`cat`.`unit_price` AS `unit_price`,`cat`.`currency` AS `currency` from (`recipes` `rcp` left join `catalog` `cat` on((`cat`.`id` = `rcp`.`component_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `report_agg_order_tt_op`
--

/*!50001 DROP VIEW IF EXISTS `report_agg_order_tt_op`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `report_agg_order_tt_op` AS select `a`.`order` AS `order`,`a`.`operation` AS `operation`,`a`.`hourly_rate` AS `hourly_rate`,`a`.`ROUND(SUM(duration)/60,2)` AS `ROUND(SUM(duration)/60,2)`,`c`.`name` AS `name`,`o`.`label` AS `label`,`o`.`comments` AS `comments`,`o`.`docnum` AS `docnum` from (((select `timetracking`.`order` AS `order`,`timetracking`.`operation` AS `operation`,`timetracking`.`hourly_rate` AS `hourly_rate`,round((sum(`timetracking`.`duration`) / 60),2) AS `ROUND(SUM(duration)/60,2)` from `timetracking` group by `timetracking`.`order`,`timetracking`.`operation`,`timetracking`.`hourly_rate`) `a` left join `orders_extended` `o` on((`o`.`oid` = `a`.`order`))) left join `catalog` `c` on((`c`.`id` = `a`.`operation`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `report_agg_order_tt_op_empl`
--

/*!50001 DROP VIEW IF EXISTS `report_agg_order_tt_op_empl`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `report_agg_order_tt_op_empl` AS select `o`.`docnum` AS `docnum`,`o`.`label` AS `label`,`o`.`comments` AS `comments`,`c`.`name` AS `opname`,`a`.`d` AS `d`,`a`.`employee` AS `employee`,`a`.`operation` AS `operation`,`a`.`order` AS `order`,`a`.`hourly_rate` AS `hourly_rate` from (((select round((sum(`tt`.`duration`) / 60),2) AS `d`,`tt`.`employee` AS `employee`,`tt`.`operation` AS `operation`,`tt`.`order` AS `order`,`tt`.`hourly_rate` AS `hourly_rate` from `timetracking` `tt` group by `tt`.`employee`,`tt`.`operation`,`tt`.`hourly_rate`,`tt`.`order`) `a` left join `orders_extended` `o` on((`o`.`oid` = `a`.`order`))) left join `catalog` `c` on((`c`.`id` = `a`.`operation`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `report_tt_agg_by_order`
--

/*!50001 DROP VIEW IF EXISTS `report_tt_agg_by_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `report_tt_agg_by_order` AS select `a`.`duration` AS `duration`,`a`.`order` AS `order`,`a`.`operation` AS `operation`,`a`.`hourly_rate` AS `hourly_rate`,`a`.`currency` AS `currency`,`o`.`label` AS `label`,`o`.`comments` AS `comments`,`d`.`docnum` AS `docnum`,`c`.`name` AS `opname` from ((((select round((sum(`timetracking`.`duration`) / 60),2) AS `duration`,`timetracking`.`order` AS `order`,`timetracking`.`operation` AS `operation`,`timetracking`.`hourly_rate` AS `hourly_rate`,`timetracking`.`currency` AS `currency` from `timetracking` where (`timetracking`.`duration` is not null) group by `timetracking`.`order`,`timetracking`.`operation`,`timetracking`.`hourly_rate`,`timetracking`.`currency`) `a` left join `orders` `o` on((`o`.`oid` = `a`.`order`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) left join `catalog` `c` on((`c`.`id` = `a`.`operation`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `report_tt_agg_byempl`
--

/*!50001 DROP VIEW IF EXISTS `report_tt_agg_byempl`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `report_tt_agg_byempl` AS select `e`.`fname` AS `fname`,`e`.`lname` AS `lname`,`a`.`employee` AS `employee`,`a`.`st` AS `date`,`a`.`order` AS `order`,`a`.`operation` AS `operation`,`a`.`round(sum(duration)/60,2)` AS `duration`,`o`.`label` AS `label`,`o`.`comments` AS `comments`,`o`.`doc_id` AS `doc_id`,`d`.`docnum` AS `docnum`,`c`.`name` AS `opname` from (((((select `timetracking`.`employee` AS `employee`,left(`timetracking`.`start`,10) AS `st`,`timetracking`.`order` AS `order`,`timetracking`.`operation` AS `operation`,round((sum(`timetracking`.`duration`) / 60),2) AS `round(sum(duration)/60,2)` from `timetracking` where (`timetracking`.`duration` is not null) group by `timetracking`.`employee`,`st`,`timetracking`.`order`,`timetracking`.`operation`) `a` left join `orders` `o` on((`o`.`oid` = `a`.`order`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) left join `catalog` `c` on((`c`.`id` = `a`.`operation`))) left join `employees` `e` on((`e`.`id` = `a`.`employee`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `started_work`
--

/*!50001 DROP VIEW IF EXISTS `started_work`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `started_work` AS select `tt`.`id` AS `id`,`tt`.`employee` AS `employee`,`tt`.`start` AS `start`,`tt`.`stop` AS `stop`,timediff(now(),`tt`.`start`) AS `worktime`,`tt`.`operation` AS `operation`,`op`.`name` AS `operation_name`,`tt`.`order` AS `order`,`doc`.`docnum` AS `order_label`,`tt`.`hourly_rate` AS `hourly_rate`,`tt`.`currency` AS `currency`,`e`.`card` AS `card` from ((((`timetracking` `tt` left join `employees` `e` on((`e`.`id` = `tt`.`employee`))) left join `catalog` `op` on((`op`.`id` = `tt`.`operation`))) left join `orders` `o` on((`o`.`oid` = `tt`.`order`))) left join `documents` `doc` on((`doc`.`id` = `o`.`doc_id`))) where (`tt`.`stop` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tags`
--

/*!50001 DROP VIEW IF EXISTS `tags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tags` AS select `employees`.`id` AS `emplid`,`employees`.`fname` AS `fname`,`employees`.`lname` AS `lname`,`employees`.`card` AS `card` from `employees` where (`employees`.`card` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `timetracking_wdiff`
--

/*!50001 DROP VIEW IF EXISTS `timetracking_wdiff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `timetracking_wdiff` AS select `timetracking`.`id` AS `id`,`timetracking`.`employee` AS `employee`,`timetracking`.`start` AS `start`,`timetracking`.`stop` AS `stop`,`timetracking`.`operation` AS `operation`,`timetracking`.`order` AS `order`,`timetracking`.`hourly_rate` AS `hourly_rate`,`timetracking`.`currency` AS `currency`,`timetracking`.`status` AS `status`,timediff(`timetracking`.`stop`,`timetracking`.`start`) AS `diff` from `timetracking` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tt_expanded`
--

/*!50001 DROP VIEW IF EXISTS `tt_expanded`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tt_expanded` AS select `tt`.`id` AS `id`,`tt`.`employee` AS `employee`,`tt`.`start` AS `start`,`tt`.`stop` AS `stop`,`tt`.`operation` AS `operation`,timediff(`tt`.`stop`,`tt`.`start`) AS `duration`,`tt`.`order` AS `order`,`tt`.`hourly_rate` AS `hourly_rate`,`tt`.`currency` AS `currency`,`tt`.`status` AS `status`,concat(`e`.`fname`,' ',`e`.`lname`) AS `empl_name`,`ops`.`name` AS `op_name`,`doc`.`docnum` AS `docnum` from ((((`timetracking` `tt` left join `employees` `e` on((`e`.`id` = `tt`.`employee`))) left join `catalog` `ops` on((`ops`.`id` = `tt`.`operation`))) left join `orders` `o` on((`o`.`oid` = `tt`.`order`))) left join `documents` `doc` on((`doc`.`id` = `o`.`doc_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_rights`
--

/*!50001 DROP VIEW IF EXISTS `users_rights`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3*/;
/*!50001 SET character_set_results     = utf8mb3*/;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_rights` AS select `users_meta`.`id` AS `id`,`users_meta`.`user_id` AS `user_id`,substr(`users_meta`.`meta_key`,8) AS `module`,`users_meta`.`meta_val` AS `meta_val` from `users_meta` where (`users_meta`.`meta_key` like 'rights.%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-22 10:15:02
