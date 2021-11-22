-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: spaleck
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Temporary view structure for view `alloc_orders`
--

DROP TABLE IF EXISTS `alloc_orders`;
/*!50001 DROP VIEW IF EXISTS `alloc_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `catalog_meta`
--

DROP TABLE IF EXISTS `catalog_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Temporary view structure for view `cnt_ttrecs_big_duration`
--

DROP TABLE IF EXISTS `cnt_ttrecs_big_duration`;
/*!50001 DROP VIEW IF EXISTS `cnt_ttrecs_big_duration`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cnt_ttrecs_not_alloc` AS SELECT 
 1 AS `id`,
 1 AS `cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `conturi_contabile`
--

DROP TABLE IF EXISTS `conturi_contabile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conturi_contabile` (
  `cont` varchar(20) NOT NULL,
  `denumire` varchar(30) NOT NULL,
  `parent` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cont`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` varchar(10) NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `prio` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_series`
--

DROP TABLE IF EXISTS `currency_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `deliveries_contents`
--

DROP TABLE IF EXISTS `deliveries_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `create_sqqno` BEFORE INSERT ON `deliveries_contents` FOR EACH ROW BEGIN
	
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `decrement_dlvd_qty` AFTER DELETE ON `deliveries_contents` FOR EACH ROW BEGIN
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Temporary view structure for view `delivery_items_aggregated`
--

DROP TABLE IF EXISTS `delivery_items_aggregated`;
/*!50001 DROP VIEW IF EXISTS `delivery_items_aggregated`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `gen_docnum` BEFORE INSERT ON `documents` FOR EACH ROW IF(NEW.docnum is NULL) THEN
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Temporary view structure for view `employees_names`
--

DROP TABLE IF EXISTS `employees_names`;
/*!50001 DROP VIEW IF EXISTS `employees_names`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Temporary view structure for view `employees_work`
--

DROP TABLE IF EXISTS `employees_work`;
/*!50001 DROP VIEW IF EXISTS `employees_work`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `create_document_entry` BEFORE INSERT ON `invoices` FOR EACH ROW BEGIN
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `codcor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`codcor`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ts` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Temporary view structure for view `order_to_delivery`
--

DROP TABLE IF EXISTS `order_to_delivery`;
/*!50001 DROP VIEW IF EXISTS `order_to_delivery`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `create_document` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `status_update_dates` BEFORE UPDATE ON `orders` FOR EACH ROW BEGIN
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `delete_document` AFTER DELETE ON `orders` FOR EACH ROW BEGIN
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_2_deliveries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL,
  `delivery` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders_2_employees`
--

DROP TABLE IF EXISTS `orders_2_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `orders_costs`
--

DROP TABLE IF EXISTS `orders_costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `calc_total` BEFORE INSERT ON `orders_costs` FOR EACH ROW BEGIN
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `recalc_total` BEFORE UPDATE ON `orders_costs` FOR EACH ROW BEGIN
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `set_catid_when_null` BEFORE INSERT ON `orders_items` FOR EACH ROW if(NEW.cat_id is null) THEN
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `deny_dlvdqty_bigger_then_qty` BEFORE UPDATE ON `orders_items` FOR EACH ROW BEGIN
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `create_catalog_meta` AFTER INSERT ON `orders_items_meta` FOR EACH ROW insert ignore into catalog_meta(cat_id,meta_key,meta_val) SELECT cat_id,NEW.meta_key,NEW.meta_val from orders_items WHERE id=NEW.order_item_id */;;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Temporary view structure for view `orders_states_cnt`
--

DROP TABLE IF EXISTS `orders_states_cnt`;
/*!50001 DROP VIEW IF EXISTS `orders_states_cnt`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Temporary view structure for view `recipes_expanded`
--

DROP TABLE IF EXISTS `recipes_expanded`;
/*!50001 DROP VIEW IF EXISTS `recipes_expanded`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rights` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resource` varchar(200) NOT NULL,
  `acces_type` enum('create','read','update','delete') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings_document_numbers`
--

DROP TABLE IF EXISTS `settings_document_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `settings_document_types`
--

DROP TABLE IF EXISTS `settings_document_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings_document_types` (
  `type` varchar(50) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `started_work`
--

DROP TABLE IF EXISTS `started_work`;
/*!50001 DROP VIEW IF EXISTS `started_work`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `stocks_registry`
--

DROP TABLE IF EXISTS `stocks_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Temporary view structure for view `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!50001 DROP VIEW IF EXISTS `tags`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `timetracking`
--

DROP TABLE IF EXISTS `timetracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `before_insert` BEFORE INSERT ON `timetracking` FOR EACH ROW BEGIN
	
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `add_cost_on_full_insert` AFTER INSERT ON `timetracking` FOR EACH ROW BEGIN
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `before_update` BEFORE UPDATE ON `timetracking` FOR EACH ROW BEGIN
  	
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `add_cost_on_update` AFTER UPDATE ON `timetracking` FOR EACH ROW BEGIN
  
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `update_cost_on_ttentry_delete` BEFORE DELETE ON `timetracking` FOR EACH ROW BEGIN
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `unit` varchar(45) NOT NULL,
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `hash_password_on_insert` BEFORE INSERT ON `users` FOR EACH ROW SET NEW.password=sha2(NEW.password,224) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `add_user_rights` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO users_meta (user_id, meta_key, meta_val)
    SELECT NEW.userid, CONCAT('rights', SUBSTR(s.key, 7)), '[]' FROM settings s WHERE s.key LIKE 'module.%';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `do_not_alter_admin_userid` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `hash_password_on_update` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vsergiu`@`localhost`*/ /*!50003 TRIGGER `do_not_delete_admin` BEFORE DELETE ON `users` FOR EACH ROW BEGIN
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
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Temporary view structure for view `users_rights`
--

DROP TABLE IF EXISTS `users_rights`;
/*!50001 DROP VIEW IF EXISTS `users_rights`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
ALTER DATABASE `spaleck` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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

-- Dump completed on 2021-11-22 10:06:16
