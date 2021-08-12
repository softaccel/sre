-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 11, 2021 at 01:20 PM
-- Server version: 8.0.25-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spaleck`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `alloc_orders`
-- (See below for the actual view)
--
CREATE TABLE `alloc_orders` (
`card` varchar(30)
,`currency` varchar(10)
,`emplid` int
,`fname` varchar(45)
,`hourlyrate` float
,`lname` varchar(45)
,`op_id` int
,`op_name` varchar(255)
,`order_id` int
,`order_name` varchar(45)
,`unq` varchar(311)
);

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `aid` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `vendor` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `employeeid` int NOT NULL,
  `sn` varchar(100) DEFAULT NULL,
  `catalog_catid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('product','product_composed','service') NOT NULL,
  `unit` varchar(45) NOT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_meta`
--

CREATE TABLE `catalog_meta` (
  `id` int NOT NULL,
  `cat_id` int NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `meta_val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `meta_type` varchar(50) DEFAULT NULL,
  `direct_edit` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` varchar(10) NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `prio` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency_series`
--

CREATE TABLE `currency_series` (
  `currency` varchar(10) NOT NULL,
  `ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` enum('created','loading','ready','delivered','received','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'created',
  `dlv_date` date DEFAULT NULL,
  `lastupdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries_contents`
--

CREATE TABLE `deliveries_contents` (
  `id` int NOT NULL,
  `delivery` int NOT NULL,
  `item` int NOT NULL,
  `seqno` int UNSIGNED DEFAULT NULL,
  `label_printed` tinyint(1) NOT NULL DEFAULT '0',
  `checkout` tinyint(1) NOT NULL DEFAULT '0',
  `label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `deliveries_contents`
--
DELIMITER $$
CREATE TRIGGER `create_sqqno` BEFORE INSERT ON `deliveries_contents` FOR EACH ROW BEGIN
	## generate && set seq no.
	SELECT count(*) +1 INTO @seqno from deliveries_contents where delivery=NEW.delivery and item=NEW.item;
    SET NEW.seqno=@seqno;
    ## generate and set label
    SET NEW.label=CONCAT(LPAD(NEW.delivery,6,"0"),"-",LPAD(NEW.item,5,"0"),"-",LPAD(NEW.seqno,3,"0"));
    ## increment dlvd_qty in orders_item
    UPDATE orders_items SET dlvd_qty=dlvd_qty+1 WHERE id=NEW.item;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decrement_dlvd_qty` AFTER DELETE ON `deliveries_contents` FOR EACH ROW BEGIN
	UPDATE orders_items SET dlvd_qty=dlvd_qty-1 WHERE id=OLD.item;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries_labels`
--

CREATE TABLE `deliveries_labels` (
  `id` int NOT NULL,
  `content_id` int NOT NULL,
  `content` text NOT NULL,
  `seq` int NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `printed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `develivery_items_aggregated`
-- (See below for the actual view)
--
CREATE TABLE `develivery_items_aggregated` (
`checkout` decimal(25,0)
,`delivery` int
,`item` int
,`label` tinytext
,`notcheckout` decimal(26,0)
,`notprinted` decimal(26,0)
,`printed` decimal(25,0)
,`totalcnt` bigint
);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int NOT NULL,
  `docnum` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `issued_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `partners_id` int DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `documents`
--
DELIMITER $$
CREATE TRIGGER `gen_docnum` BEFORE INSERT ON `documents` FOR EACH ROW IF(NEW.docnum is NULL) THEN
	SELECT concat(series, lastissued+1) INTO @docnum FROM settings_document_numbers WHERE type=NEW.type AND validfrom<CURRENT_TIMESTAMP() and validto>CURRENT_TIMESTAMP() and (maxval is null or maxval>=lastissued+1);
    if(@cnt != 1 ) THEN
    	signal sqlstate '45010' set message_text = 'Nu a putut fi generat numar de document';
    else 
    	SET NEW.docnum = @docnum;
		update settings_document_numbers set lastissued=lastissued+1;    
    end if;
end if
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `bdate` date NOT NULL,
  `cnp` varchar(15) NOT NULL,
  `address_1` varchar(45) NOT NULL,
  `address_2` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `postcode` int UNSIGNED DEFAULT NULL,
  `county` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL DEFAULT 'Romania',
  `userid` varchar(20) DEFAULT NULL,
  `docs` text,
  `team` int DEFAULT NULL,
  `activ` tinyint NOT NULL DEFAULT '1',
  `jobtitle` varchar(50) NOT NULL,
  `card` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `employeesExtended`
-- (See below for the actual view)
--
CREATE TABLE `employeesExtended` (
`activ` tinyint
,`address_1` varchar(45)
,`address_2` varchar(45)
,`bdate` date
,`card` varchar(30)
,`city` varchar(45)
,`cnp` varchar(15)
,`country` varchar(45)
,`county` varchar(45)
,`docs` text
,`fname` varchar(45)
,`id` int
,`jobname` varchar(100)
,`jobtitle` varchar(50)
,`lname` varchar(45)
,`postcode` int unsigned
,`team` int
,`teamname` varchar(45)
,`userid` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `employees_names`
-- (See below for the actual view)
--
CREATE TABLE `employees_names` (
`fullname` varchar(91)
,`id` int
);

-- --------------------------------------------------------

--
-- Table structure for table `employees_ops`
--

CREATE TABLE `employees_ops` (
  `id` int NOT NULL,
  `catalog_id` int NOT NULL,
  `employees_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `emplToOrdAssoc`
-- (See below for the actual view)
--
CREATE TABLE `emplToOrdAssoc` (
`currency` varchar(10)
,`docnum` varchar(45)
,`emplid` int
,`fname` varchar(45)
,`hourlyrate` float
,`id` int
,`label` varchar(255)
,`lname` varchar(45)
,`oid` int
,`opid` int
,`opname` varchar(255)
,`status` enum('offer','ord','proc','ctc','fix','ready','dlvd')
);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `groupid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int NOT NULL,
  `stock_id` int NOT NULL,
  `cat_id` int NOT NULL,
  `qty` int NOT NULL,
  `value` int NOT NULL,
  `vat` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `codcor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int NOT NULL,
  `label` varchar(100) NOT NULL,
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int NOT NULL,
  `ts` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int NOT NULL,
  `operation` varchar(45) DEFAULT NULL,
  `assets_aid` int NOT NULL,
  `scheduled_date` datetime NOT NULL,
  `exec_date` datetime DEFAULT NULL,
  `execby` varchar(20) DEFAULT NULL,
  `document_docid` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `uuid` varchar(50) NOT NULL,
  `original_name` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL,
  `thumbnail_path` varchar(255) DEFAULT NULL,
  `hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` int NOT NULL,
  `mime_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `oid` int NOT NULL,
  `label` varchar(255) NOT NULL,
  `state` enum('offer','ord','proc','ctc','fix','ready','dlvd') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'ord',
  `doc_id` int DEFAULT NULL,
  `partner_id` int NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `startwork_on` datetime DEFAULT NULL,
  `readytodeliver_on` datetime DEFAULT NULL,
  `closed_on` datetime DEFAULT NULL,
  `order_value` float(10,2) DEFAULT NULL,
  `calculated_value` float(10,2) DEFAULT NULL,
  `final_value` float(10,2) DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `team` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `create_document` BEFORE INSERT ON `orders` FOR EACH ROW ##################################################################################
BEGIN
	IF(NEW.doc_id IS NULL) THEN
    	INSERT INTO documents(user_id,partners_id,type) VALUES(NEW.user_id,NEW.partner_id,'order');
    	SET NEW.doc_id=LAST_INSERT_ID();
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_document` AFTER DELETE ON `orders` FOR EACH ROW BEGIN
	DELETE FROM documents WHERE documents.id=OLD.doc_id;
    update settings_document_numbers set lastissued=lastissued-1 WHERE label="order";
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `status_update_dates` BEFORE UPDATE ON `orders` FOR EACH ROW BEGIN
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
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders_2_deliveries`
--

CREATE TABLE `orders_2_deliveries` (
  `id` int NOT NULL,
  `order` int NOT NULL,
  `delivery` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_2_employees`
--

CREATE TABLE `orders_2_employees` (
  `id` int NOT NULL,
  `orderid` int NOT NULL,
  `emplid` int NOT NULL,
  `operation` int DEFAULT NULL,
  `hourlyrate` float DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_costs`
--

CREATE TABLE `orders_costs` (
  `id` int NOT NULL,
  `oid` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qty` float NOT NULL,
  `unit` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `unit_price` int NOT NULL,
  `currency` varchar(10) NOT NULL,
  `vat` float(10,2) NOT NULL,
  `total` float(10,2) DEFAULT NULL,
  `total_wvat` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `orders_costs`
--
DELIMITER $$
CREATE TRIGGER `calc_total` BEFORE INSERT ON `orders_costs` FOR EACH ROW BEGIN
	SET NEW.total=NEW.qty*NEW.unit_price;
    SET NEW.total_wvat=NEW.total+NEW.vat*NEW.total/100;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `recalc_total` BEFORE UPDATE ON `orders_costs` FOR EACH ROW BEGIN
    SET NEW.total=NEW.qty*NEW.unit_price;
    SET NEW.total_wvat=NEW.total+NEW.vat*NEW.total/100;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_costs_total`
-- (See below for the actual view)
--
CREATE TABLE `orders_costs_total` (
`oid` int
,`total` double(19,2)
,`total_wvat` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_count_bystate`
-- (See below for the actual view)
--
CREATE TABLE `orders_count_bystate` (
`cnt` bigint
,`state` enum('offer','ord','proc','ctc','fix','ready','dlvd')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_extended`
-- (See below for the actual view)
--
CREATE TABLE `orders_extended` (
`closed_on` datetime
,`created_on` datetime
,`doc_id` int
,`docnum` varchar(45)
,`final_value` float(10,2)
,`label` varchar(255)
,`meta` json
,`oid` int
,`partner_id` int
,`pname` varchar(255)
,`state` enum('offer','ord','proc','ctc','fix','ready','dlvd')
,`user_id` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders_items`
--

CREATE TABLE `orders_items` (
  `id` int NOT NULL,
  `order` int NOT NULL,
  `name` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cat_id` int DEFAULT NULL,
  `unit` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qty` float(10,3) NOT NULL,
  `dlvd_qty` float(10,3) NOT NULL DEFAULT '0.000',
  `unit_price` float(10,3) DEFAULT NULL,
  `vat` float(10,3) DEFAULT NULL,
  `unit_price_wvat` float(10,3) DEFAULT NULL,
  `vat_value` float(10,3) DEFAULT NULL,
  `total_value` float(10,3) DEFAULT NULL,
  `total_value_wvat` float(10,3) DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `match_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `match_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Triggers `orders_items`
--
DELIMITER $$
CREATE TRIGGER `deny_dlvdqty_bigger_then_qty` BEFORE UPDATE ON `orders_items` FOR EACH ROW BEGIN
	IF(NEW.dlvd_qty>NEW.qty) THEN
    	SIGNAL SQLSTATE '45004' SET message_text = 'Delivered Qty not allowed to be bigger then ordered Qty';
    END IF;
    IF(NEW.dlvd_qty<0) THEN
    	SIGNAL SQLSTATE '45005' SET message_text = 'Delivered Qty not allowed to be of negative value';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_catid_when_null` BEFORE INSERT ON `orders_items` FOR EACH ROW if(NEW.cat_id is null) THEN
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
end if
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_items_labels`
-- (See below for the actual view)
--
CREATE TABLE `orders_items_labels` (
`belegNum` text
,`designId` text
,`docnum` varchar(45)
,`itemId` int
,`orderId` int
,`partId` text
,`title` tinytext
);

-- --------------------------------------------------------

--
-- Table structure for table `orders_items_meta`
--

CREATE TABLE `orders_items_meta` (
  `id` int NOT NULL,
  `order_item_id` int NOT NULL,
  `meta_key` varchar(100) NOT NULL,
  `meta_val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `meta_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `direct_edit` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `orders_items_meta`
--
DELIMITER $$
CREATE TRIGGER `create_catalog_meta` AFTER INSERT ON `orders_items_meta` FOR EACH ROW insert ignore into catalog_meta(cat_id,meta_key,meta_val) SELECT cat_id,NEW.meta_key,NEW.meta_val from orders_items WHERE id=NEW.order_item_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_items_wmeta`
-- (See below for the actual view)
--
CREATE TABLE `orders_items_wmeta` (
`cat_id` int
,`currency` varchar(10)
,`design` text
,`dlvd_qty` float(10,3)
,`gallery` text
,`id` int
,`match_key` varchar(50)
,`match_value` varchar(255)
,`name` tinytext
,`order` int
,`partid` text
,`qty` float(10,3)
,`total_value` float(10,3)
,`total_value_wvat` float(10,3)
,`unit` varchar(45)
,`unit_price` float(10,3)
,`unit_price_wvat` float(10,3)
,`vat` float(10,3)
,`vat_value` float(10,3)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_items_wmeta_notdlvd`
-- (See below for the actual view)
--
CREATE TABLE `orders_items_wmeta_notdlvd` (
`cat_id` int
,`currency` varchar(10)
,`design` text
,`dlvd_qty` float(10,3)
,`gallery` text
,`id` int
,`match_key` varchar(50)
,`match_value` varchar(255)
,`name` tinytext
,`order` int
,`partid` text
,`qty` float(10,3)
,`total_value` float(10,3)
,`total_value_wvat` float(10,3)
,`unit` varchar(45)
,`unit_price` float(10,3)
,`unit_price_wvat` float(10,3)
,`vat` float(10,3)
,`vat_value` float(10,3)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders_meta`
--

CREATE TABLE `orders_meta` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `meta_val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_totalcnt_item`
-- (See below for the actual view)
--
CREATE TABLE `orders_totalcnt_item` (
`cnt` double(20,3)
,`docnum` varchar(45)
,`oid` int
);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int NOT NULL,
  `cod_saga` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cod_fiscal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reg_com` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `county` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `country` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `analitic` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `zs` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `discount` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_account` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `branch` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `branch_rep` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `personal_id_serie` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `personal_id_number` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `personal_id_issuer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `license_plate` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `agent` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `agent_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `group` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `type_tert` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `is_vat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `blocked` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_v_vat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cb_card` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_s_vat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `credit_limit` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_customer` tinyint(1) NOT NULL DEFAULT '1',
  `is_supplier` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `rights`
--

CREATE TABLE `rights` (
  `id` int NOT NULL,
  `resource` varchar(200) NOT NULL,
  `acces_type` enum('create','read','update','delete') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings_document_numbers`
--

CREATE TABLE `settings_document_numbers` (
  `id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(45) DEFAULT NULL,
  `series` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `lastissued` int NOT NULL,
  `maxval` int DEFAULT NULL,
  `validfrom` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `validto` datetime DEFAULT '2051-04-01 08:30:52'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings_document_types`
--

CREATE TABLE `settings_document_types` (
  `type` varchar(50) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `started_work`
-- (See below for the actual view)
--
CREATE TABLE `started_work` (
`card` varchar(30)
,`currency` varchar(10)
,`employee` int
,`hourly_rate` float(10,2)
,`id` int
,`operation` int
,`operation_name` varchar(255)
,`order` int
,`order_label` varchar(45)
,`start` datetime
,`stop` datetime
,`worktime` time
);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int NOT NULL,
  `label` varchar(45) DEFAULT NULL,
  `type` enum('mp','mf','cn') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `location` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks_registry`
--

CREATE TABLE `stocks_registry` (
  `id` int NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cat_id` int NOT NULL,
  `stock_id` int NOT NULL,
  `type` enum('receptie','consum','vanzare','transfer','conversie') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `documents_docid` int NOT NULL,
  `order_item_id` int NOT NULL,
  `qty` float(10,3) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `vat` float(10,2) UNSIGNED NOT NULL,
  `unit_price` float(10,3) NOT NULL,
  `unit_markup` float(10,3) NOT NULL DEFAULT '0.000',
  `unit_vat` float(10,3) NOT NULL DEFAULT '0.000',
  `unit_value` float(10,3) NOT NULL DEFAULT '0.000',
  `total_value` float(10,3) NOT NULL DEFAULT '0.000',
  `total_vat` float(10,3) NOT NULL DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `stocks_registry`
--
DELIMITER $$
CREATE TRIGGER `update_qty_and_calculate_stuff` BEFORE INSERT ON `stocks_registry` FOR EACH ROW begin 
select count(*) into @cnt from inventory where stock_id=NEW.stock_id and cat_id=NEW.cat_id;
if(@cnt=0) THEN
	INSERT INTO inventory(stock_id,cat_id,qty,value) VALUES(NEW.stock_id,NEW.cat_id,NEW.qty,NEW.qty*NEW.unit_price);
else 
	UPDATE inventory SET qty=qty+NEW.qty, value=value+NEW.qty*NEW.unit_price;
end if;
SET NEW.unit_value=NEW.unit_price+NEW.unit_markup;
SET NEW.unit_vat=NEW.vat*NEW.unit_value/100;
SET NEW.total_value=NEW.unit_value*NEW.qty;
SET NEW.total_vat=NEW.unit_vat*NEW.qty;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tags`
-- (See below for the actual view)
--
CREATE TABLE `tags` (
`card` varchar(30)
,`emplid` int
,`fname` varchar(45)
,`lname` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `tid` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `teamlead` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `fld` int NOT NULL,
  `order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timetracking`
--

CREATE TABLE `timetracking` (
  `id` int NOT NULL,
  `employee` int NOT NULL,
  `start` datetime DEFAULT CURRENT_TIMESTAMP,
  `stop` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `duration` varchar(20) DEFAULT NULL,
  `operation` int NOT NULL,
  `order` int NOT NULL,
  `hourly_rate` float(10,2) DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `status` enum('w','f') NOT NULL DEFAULT 'w'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `timetracking`
--
DELIMITER $$
CREATE TRIGGER `calc_duration` BEFORE UPDATE ON `timetracking` FOR EACH ROW BEGIN
	if( NEW.stop is not null) THEN
    	set new.duration=TIMESTAMPDIFF(MINUTE,NEW.start,NEW.stop);
    end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calc_on_insert` BEFORE INSERT ON `timetracking` FOR EACH ROW BEGIN
	if( NEW.stop is not null) THEN
    	set new.duration=timediff(NEW.stop,NEW.start);
    end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_if_working` BEFORE INSERT ON `timetracking` FOR EACH ROW BEGIN
	SELECT count(*) INTO @cnt FROM timetracking WHERE employee=NEW.employee AND stop is NULL;
    IF (@cnt>0) THEN
    	SIGNAL SQLSTATE '45000' SET message_text = 'User still working';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_neg_time_onins` BEFORE INSERT ON `timetracking` FOR EACH ROW BEGIN
	if(NEW.stop is not null and NEW.stop<NEW.start) THEN
    SIGNAL SQLSTATE '45050' SET message_text = 'Data la oprire este mai veche decat data la pornire';
    end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_neg_time_onupd` BEFORE UPDATE ON `timetracking` FOR EACH ROW BEGIN
	if(NEW.stop is not null and NEW.stop<NEW.start) THEN
    SIGNAL SQLSTATE '45050' SET message_text = 'Data la oprire este mai veche decat data la pornire';
    end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `timetracking_wdiff`
-- (See below for the actual view)
--
CREATE TABLE `timetracking_wdiff` (
`currency` varchar(10)
,`diff` time
,`employee` int
,`hourly_rate` float(10,2)
,`id` int
,`operation` int
,`order` int
,`start` datetime
,`status` enum('w','f')
,`stop` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tt_expanded`
-- (See below for the actual view)
--
CREATE TABLE `tt_expanded` (
`currency` varchar(10)
,`docnum` varchar(45)
,`duration` time
,`empl_name` varchar(91)
,`employee` int
,`hourly_rate` float(10,2)
,`id` int
,`op_name` varchar(255)
,`operation` int
,`order` int
,`start` datetime
,`status` enum('w','f')
,`stop` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `unit` varchar(45) NOT NULL,
  `comments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `usergroups`
-- (See below for the actual view)
--
CREATE TABLE `usergroups` (
`description` text
,`groupid` varchar(50)
,`userid` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` varchar(20) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `creationtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` datetime DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `type` enum('sys','empl','adm') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `do_not_alter_admin_userid` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
	IF (OLD.userid="admin" and NEW.userid!="admin") THEN
		SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'Nu este permisa modificarea userid-lui utilizatorului admin';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `do_not_delete_admin` BEFORE DELETE ON `users` FOR EACH ROW BEGIN
	IF (OLD.userid="admin") THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Nu este permisa stergerea utilizatorului admin';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hash_password_on_insert` BEFORE INSERT ON `users` FOR EACH ROW SET NEW.password=sha2(NEW.password,224)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hash_password_on_update` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
	if(NEW.password!="" and NEW.password is not null) THEN
    	SET NEW.password=sha2(NEW.password,224);
    end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_2_groups`
--

CREATE TABLE `users_2_groups` (
  `groupid` varchar(20) NOT NULL,
  `userid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure for view `alloc_orders`
--
DROP TABLE IF EXISTS `alloc_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `alloc_orders`  AS SELECT `e`.`id` AS `emplid`, `e`.`fname` AS `fname`, `e`.`lname` AS `lname`, `e`.`card` AS `card`, `op`.`name` AS `op_name`, `op`.`id` AS `op_id`, `d`.`docnum` AS `order_name`, `o`.`oid` AS `order_id`, `o2e`.`hourlyrate` AS `hourlyrate`, `o2e`.`currency` AS `currency`, concat(`e`.`id`,`d`.`docnum`,`op`.`name`) AS `unq` FROM ((((`employees` `e` left join `orders_2_employees` `o2e` on((`o2e`.`emplid` = `e`.`id`))) left join `orders` `o` on((`o`.`oid` = `o2e`.`orderid`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) left join `catalog` `op` on((`op`.`id` = `o2e`.`operation`))) WHERE ((`d`.`docnum` is not null) AND (`o`.`state` = 'proc')) ;

-- --------------------------------------------------------

--
-- Structure for view `develivery_items_aggregated`
--
DROP TABLE IF EXISTS `develivery_items_aggregated`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sysadmin`@`localhost` SQL SECURITY DEFINER VIEW `develivery_items_aggregated`  AS SELECT `a`.`delivery` AS `delivery`, `a`.`label` AS `label`, `a`.`item` AS `item`, `a`.`totalcnt` AS `totalcnt`, `a`.`printed` AS `printed`, `a`.`checkout` AS `checkout`, (`a`.`totalcnt` - `a`.`printed`) AS `notprinted`, (`a`.`totalcnt` - `a`.`checkout`) AS `notcheckout` FROM (select `deliveries_contents`.`delivery` AS `delivery`,`orders_items`.`name` AS `label`,`deliveries_contents`.`item` AS `item`,count(0) AS `totalcnt`,sum(`deliveries_contents`.`label_printed`) AS `printed`,sum(`deliveries_contents`.`checkout`) AS `checkout` from (`orders_items` join `deliveries_contents`) where (`orders_items`.`id` = `deliveries_contents`.`item`) group by `deliveries_contents`.`delivery`,`deliveries_contents`.`item`) AS `a` ;

-- --------------------------------------------------------

--
-- Structure for view `employeesExtended`
--
DROP TABLE IF EXISTS `employeesExtended`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `employeesExtended`  AS SELECT `empl`.`id` AS `id`, `empl`.`fname` AS `fname`, `empl`.`lname` AS `lname`, `empl`.`bdate` AS `bdate`, `empl`.`cnp` AS `cnp`, `empl`.`address_1` AS `address_1`, `empl`.`address_2` AS `address_2`, `empl`.`city` AS `city`, `empl`.`postcode` AS `postcode`, `empl`.`county` AS `county`, `empl`.`country` AS `country`, `empl`.`userid` AS `userid`, `empl`.`docs` AS `docs`, `empl`.`team` AS `team`, `empl`.`activ` AS `activ`, `empl`.`jobtitle` AS `jobtitle`, `empl`.`card` AS `card`, `j`.`name` AS `jobname`, `t`.`name` AS `teamname` FROM ((`employees` `empl` left join `jobs` `j` on((`j`.`codcor` = `empl`.`jobtitle`))) left join `teams` `t` on((`t`.`tid` = `empl`.`team`))) ;

-- --------------------------------------------------------

--
-- Structure for view `employees_names`
--
DROP TABLE IF EXISTS `employees_names`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `employees_names`  AS SELECT `employees`.`id` AS `id`, concat(`employees`.`fname`,' ',`employees`.`lname`) AS `fullname` FROM `employees` ;

-- --------------------------------------------------------

--
-- Structure for view `emplToOrdAssoc`
--
DROP TABLE IF EXISTS `emplToOrdAssoc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `emplToOrdAssoc`  AS SELECT `o2e`.`id` AS `id`, `ord`.`oid` AS `oid`, `ord`.`state` AS `status`, `doc`.`docnum` AS `docnum`, `ops`.`name` AS `opname`, `o2e`.`hourlyrate` AS `hourlyrate`, `o2e`.`currency` AS `currency`, `empl`.`fname` AS `fname`, `empl`.`lname` AS `lname`, `o2e`.`emplid` AS `emplid`, `ord`.`label` AS `label`, `ops`.`id` AS `opid` FROM ((((`orders_2_employees` `o2e` left join `orders` `ord` on((`ord`.`oid` = `o2e`.`orderid`))) left join `catalog` `ops` on((`ops`.`id` = `o2e`.`operation`))) left join `documents` `doc` on((`doc`.`id` = `ord`.`doc_id`))) left join `employees` `empl` on((`empl`.`id` = `o2e`.`emplid`))) ORDER BY `o2e`.`emplid` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `orders_costs_total`
--
DROP TABLE IF EXISTS `orders_costs_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sysadmin`@`localhost` SQL SECURITY DEFINER VIEW `orders_costs_total`  AS SELECT `orders_costs`.`oid` AS `oid`, sum(`orders_costs`.`total`) AS `total`, sum(`orders_costs`.`total_wvat`) AS `total_wvat` FROM `orders_costs` GROUP BY `orders_costs`.`oid` ;

-- --------------------------------------------------------

--
-- Structure for view `orders_count_bystate`
--
DROP TABLE IF EXISTS `orders_count_bystate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_count_bystate`  AS SELECT `orders`.`state` AS `state`, count(0) AS `cnt` FROM `orders` GROUP BY `orders`.`state` ;

-- --------------------------------------------------------

--
-- Structure for view `orders_extended`
--
DROP TABLE IF EXISTS `orders_extended`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_extended`  AS SELECT `o`.`oid` AS `oid`, `o`.`label` AS `label`, `o`.`state` AS `state`, `o`.`doc_id` AS `doc_id`, `o`.`partner_id` AS `partner_id`, `o`.`created_on` AS `created_on`, `o`.`closed_on` AS `closed_on`, `o`.`final_value` AS `final_value`, `o`.`meta` AS `meta`, `o`.`user_id` AS `user_id`, `p`.`name` AS `pname`, `d`.`docnum` AS `docnum` FROM ((`orders` `o` left join `partners` `p` on((`p`.`id` = `o`.`partner_id`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `orders_items_labels`
--
DROP TABLE IF EXISTS `orders_items_labels`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sysadmin`@`localhost` SQL SECURITY DEFINER VIEW `orders_items_labels`  AS SELECT `o`.`oid` AS `orderId`, `oi`.`id` AS `itemId`, `oi`.`name` AS `title`, `om`.`meta_val` AS `belegNum`, `d`.`docnum` AS `docnum`, `oim1`.`meta_val` AS `partId`, `oim2`.`meta_val` AS `designId` FROM (((((`orders_items` `oi` left join `orders` `o` on((`o`.`oid` = `oi`.`order`))) left join `orders_items_meta` `oim1` on(((`oim1`.`order_item_id` = `oi`.`id`) and (`oim1`.`meta_key` = 'P.A.E_BelegPos.Artikel')))) left join `orders_items_meta` `oim2` on(((`oim2`.`order_item_id` = `oi`.`id`) and (`oim2`.`meta_key` = 'P.A.P_ZeichnungSpr.Zeichnung')))) left join `orders_meta` `om` on(((`om`.`order_id` = `o`.`oid`) and (`om`.`meta_key` = 'K.E.E_BelegKopf.BelegNummer')))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) ORDER BY `o`.`oid` ASC, `oi`.`id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `orders_items_wmeta`
--
DROP TABLE IF EXISTS `orders_items_wmeta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sysadmin`@`localhost` SQL SECURITY DEFINER VIEW `orders_items_wmeta`  AS SELECT `oi`.`id` AS `id`, `oi`.`order` AS `order`, `oi`.`name` AS `name`, `oi`.`cat_id` AS `cat_id`, `oi`.`unit` AS `unit`, `oi`.`qty` AS `qty`, `oi`.`dlvd_qty` AS `dlvd_qty`, `oi`.`unit_price` AS `unit_price`, `oi`.`vat` AS `vat`, `oi`.`unit_price_wvat` AS `unit_price_wvat`, `oi`.`vat_value` AS `vat_value`, `oi`.`total_value` AS `total_value`, `oi`.`total_value_wvat` AS `total_value_wvat`, `oi`.`currency` AS `currency`, `oi`.`match_key` AS `match_key`, `oi`.`match_value` AS `match_value`, `opm1`.`meta_val` AS `partid`, `opm2`.`meta_val` AS `design`, `cm`.`meta_val` AS `gallery` FROM (((`orders_items` `oi` left join `orders_items_meta` `opm1` on(((`opm1`.`order_item_id` = `oi`.`id`) and (`opm1`.`meta_key` = 'P.A.E_BelegPos.Artikel')))) left join `orders_items_meta` `opm2` on(((`opm2`.`order_item_id` = `oi`.`id`) and (`opm2`.`meta_key` = 'design_id')))) left join `catalog_meta` `cm` on(((`cm`.`cat_id` = `oi`.`cat_id`) and (`cm`.`meta_key` = 'Gallery')))) ;

-- --------------------------------------------------------

--
-- Structure for view `orders_items_wmeta_notdlvd`
--
DROP TABLE IF EXISTS `orders_items_wmeta_notdlvd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sysadmin`@`localhost` SQL SECURITY DEFINER VIEW `orders_items_wmeta_notdlvd`  AS SELECT `oi`.`id` AS `id`, `oi`.`order` AS `order`, `oi`.`name` AS `name`, `oi`.`cat_id` AS `cat_id`, `oi`.`unit` AS `unit`, `oi`.`qty` AS `qty`, `oi`.`dlvd_qty` AS `dlvd_qty`, `oi`.`unit_price` AS `unit_price`, `oi`.`vat` AS `vat`, `oi`.`unit_price_wvat` AS `unit_price_wvat`, `oi`.`vat_value` AS `vat_value`, `oi`.`total_value` AS `total_value`, `oi`.`total_value_wvat` AS `total_value_wvat`, `oi`.`currency` AS `currency`, `oi`.`match_key` AS `match_key`, `oi`.`match_value` AS `match_value`, `opm1`.`meta_val` AS `partid`, `opm2`.`meta_val` AS `design`, `cm`.`meta_val` AS `gallery` FROM (((`orders_items` `oi` left join `catalog_meta` `opm1` on(((`opm1`.`cat_id` = `oi`.`cat_id`) and (`opm1`.`meta_key` = 'part_id')))) left join `catalog_meta` `opm2` on(((`opm2`.`cat_id` = `oi`.`cat_id`) and (`opm2`.`meta_key` = 'design_id')))) left join `catalog_meta` `cm` on(((`cm`.`cat_id` = `oi`.`cat_id`) and (`cm`.`meta_key` = 'Gallery')))) WHERE (`oi`.`qty` > `oi`.`dlvd_qty`) ;

-- --------------------------------------------------------

--
-- Structure for view `orders_totalcnt_item`
--
DROP TABLE IF EXISTS `orders_totalcnt_item`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sysadmin`@`localhost` SQL SECURITY DEFINER VIEW `orders_totalcnt_item`  AS SELECT `o`.`oid` AS `oid`, `d`.`docnum` AS `docnum`, sum((`oi`.`qty` - `oi`.`dlvd_qty`)) AS `cnt` FROM ((`orders_items` `oi` left join `orders` `o` on((`o`.`oid` = `oi`.`order`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) GROUP BY `oi`.`order` ;

-- --------------------------------------------------------

--
-- Structure for view `started_work`
--
DROP TABLE IF EXISTS `started_work`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `started_work`  AS SELECT `tt`.`id` AS `id`, `tt`.`employee` AS `employee`, `tt`.`start` AS `start`, `tt`.`stop` AS `stop`, timediff(now(),`tt`.`start`) AS `worktime`, `tt`.`operation` AS `operation`, `op`.`name` AS `operation_name`, `tt`.`order` AS `order`, `doc`.`docnum` AS `order_label`, `tt`.`hourly_rate` AS `hourly_rate`, `tt`.`currency` AS `currency`, `e`.`card` AS `card` FROM ((((`timetracking` `tt` left join `employees` `e` on((`e`.`id` = `tt`.`employee`))) left join `catalog` `op` on((`op`.`id` = `tt`.`operation`))) left join `orders` `o` on((`o`.`oid` = `tt`.`order`))) left join `documents` `doc` on((`doc`.`id` = `o`.`doc_id`))) WHERE (`tt`.`stop` is null) ;

-- --------------------------------------------------------

--
-- Structure for view `tags`
--
DROP TABLE IF EXISTS `tags`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `tags`  AS SELECT `employees`.`id` AS `emplid`, `employees`.`fname` AS `fname`, `employees`.`lname` AS `lname`, `employees`.`card` AS `card` FROM `employees` WHERE (`employees`.`card` is not null) ;

-- --------------------------------------------------------

--
-- Structure for view `timetracking_wdiff`
--
DROP TABLE IF EXISTS `timetracking_wdiff`;

CREATE ALGORITHM=MERGE DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `timetracking_wdiff`  AS SELECT `timetracking`.`id` AS `id`, `timetracking`.`employee` AS `employee`, `timetracking`.`start` AS `start`, `timetracking`.`stop` AS `stop`, `timetracking`.`operation` AS `operation`, `timetracking`.`order` AS `order`, `timetracking`.`hourly_rate` AS `hourly_rate`, `timetracking`.`currency` AS `currency`, `timetracking`.`status` AS `status`, timediff(`timetracking`.`stop`,`timetracking`.`start`) AS `diff` FROM `timetracking` ;

-- --------------------------------------------------------

--
-- Structure for view `tt_expanded`
--
DROP TABLE IF EXISTS `tt_expanded`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `tt_expanded`  AS SELECT `tt`.`id` AS `id`, `tt`.`employee` AS `employee`, `tt`.`start` AS `start`, `tt`.`stop` AS `stop`, `tt`.`operation` AS `operation`, timediff(`tt`.`stop`,`tt`.`start`) AS `duration`, `tt`.`order` AS `order`, `tt`.`hourly_rate` AS `hourly_rate`, `tt`.`currency` AS `currency`, `tt`.`status` AS `status`, concat(`e`.`fname`,' ',`e`.`lname`) AS `empl_name`, `ops`.`name` AS `op_name`, `doc`.`docnum` AS `docnum` FROM ((((`timetracking` `tt` left join `employees` `e` on((`e`.`id` = `tt`.`employee`))) left join `catalog` `ops` on((`ops`.`id` = `tt`.`operation`))) left join `orders` `o` on((`o`.`oid` = `tt`.`order`))) left join `documents` `doc` on((`doc`.`id` = `o`.`doc_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `usergroups`
--
DROP TABLE IF EXISTS `usergroups`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `usergroups`  AS SELECT `g`.`groupid` AS `groupid`, `g`.`description` AS `description`, `u2g`.`userid` AS `userid` FROM (`users_2_groups` `u2g` left join `groups` `g` on((`u2g`.`groupid` = `g`.`groupid`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `sn_UNIQUE` (`sn`),
  ADD KEY `fk_assets_employees1_idx` (`employeeid`),
  ADD KEY `fk_assets_catalog1_idx` (`catalog_catid`);

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `unit` (`unit`),
  ADD KEY `currency` (`currency`);

--
-- Indexes for table `catalog_meta`
--
ALTER TABLE `catalog_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`cat_id`,`meta_key`),
  ADD UNIQUE KEY `cat_id` (`cat_id`,`meta_key`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_series`
--
ALTER TABLE `currency_series`
  ADD UNIQUE KEY `unq` (`currency`,`ts`),
  ADD KEY `fk_currency_series_currencies1_idx` (`currency`),
  ADD KEY `ts` (`ts`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `label` (`label`);

--
-- Indexes for table `deliveries_contents`
--
ALTER TABLE `deliveries_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`item`) USING BTREE,
  ADD KEY `delivery` (`delivery`);

--
-- Indexes for table `deliveries_labels`
--
ALTER TABLE `deliveries_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_documents_users1_idx` (`user_id`),
  ADD KEY `fk_documents_partners1_idx` (`partners_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid_UNIQUE` (`userid`),
  ADD UNIQUE KEY `card` (`card`),
  ADD KEY `fk_employees_users1_idx` (`userid`),
  ADD KEY `fk_employees_table11_idx` (`team`),
  ADD KEY `employees_ibfk_2` (`jobtitle`);

--
-- Indexes for table `employees_ops`
--
ALTER TABLE `employees_ops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employees_ops_catalog1_idx` (`catalog_id`),
  ADD KEY `fk_employees_ops_employees1_idx` (`employees_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`groupid`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_id_2` (`stock_id`,`cat_id`),
  ADD KEY `cat_it` (`cat_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`codcor`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_maintainance_assets1_idx` (`assets_aid`),
  ADD KEY `fk_maintainance_users1_idx` (`execby`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `fk_orders_document1_idx` (`doc_id`),
  ADD KEY `fk_orders_partners1_idx` (`partner_id`),
  ADD KEY `created_by` (`user_id`),
  ADD KEY `team` (`team`),
  ADD KEY `currency` (`currency`);

--
-- Indexes for table `orders_2_deliveries`
--
ALTER TABLE `orders_2_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_2_employees`
--
ALTER TABLE `orders_2_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderid` (`orderid`,`emplid`,`operation`),
  ADD KEY `emplid` (`emplid`),
  ADD KEY `orders_2_employees_ibfk_3` (`currency`),
  ADD KEY `orders_2_employees_ibfk_4` (`operation`);

--
-- Indexes for table `orders_costs`
--
ALTER TABLE `orders_costs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oid` (`oid`),
  ADD KEY `currency` (`currency`),
  ADD KEY `unit` (`unit`);

--
-- Indexes for table `orders_items`
--
ALTER TABLE `orders_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_items_orders1_idx` (`order`),
  ADD KEY `fk_orders_items_catalog1_idx` (`cat_id`),
  ADD KEY `currency` (`currency`),
  ADD KEY `um` (`unit`);

--
-- Indexes for table `orders_items_meta`
--
ALTER TABLE `orders_items_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_part_id` (`order_item_id`,`meta_key`);

--
-- Indexes for table `orders_meta`
--
ALTER TABLE `orders_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`,`meta_key`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `cod_fiscal` (`cod_fiscal`);

--
-- Indexes for table `rights`
--
ALTER TABLE `rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_document_numbers`
--
ALTER TABLE `settings_document_numbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `settings_document_types`
--
ALTER TABLE `settings_document_types`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq` (`type`,`location`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `stocks_registry`
--
ALTER TABLE `stocks_registry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stocks_registry_catalog1_idx` (`cat_id`),
  ADD KEY `fk_stocks_registry_stocks1_idx` (`stock_id`),
  ADD KEY `fk_stocks_registry_documents1_idx` (`documents_docid`),
  ADD KEY `fk_stocks_registry_orders_items1_idx` (`order_item_id`),
  ADD KEY `unit` (`unit`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `fk_table1_employees1_idx` (`teamlead`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetracking`
--
ALTER TABLE `timetracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_timetracking_employees1_idx` (`employee`),
  ADD KEY `fk_timetracking_catalog1_idx` (`operation`),
  ADD KEY `fk_timetracking_orders1_idx` (`order`),
  ADD KEY `fk_timetracking_currencies1_idx` (`currency`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unit`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `users_2_groups`
--
ALTER TABLE `users_2_groups`
  ADD PRIMARY KEY (`groupid`,`userid`),
  ADD KEY `users_2_groups_ibfk_2` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `aid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_meta`
--
ALTER TABLE `catalog_meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries_contents`
--
ALTER TABLE `deliveries_contents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries_labels`
--
ALTER TABLE `deliveries_labels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_2_deliveries`
--
ALTER TABLE `orders_2_deliveries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_2_employees`
--
ALTER TABLE `orders_2_employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_costs`
--
ALTER TABLE `orders_costs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_items`
--
ALTER TABLE `orders_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_items_meta`
--
ALTER TABLE `orders_items_meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_meta`
--
ALTER TABLE `orders_meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rights`
--
ALTER TABLE `rights`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings_document_numbers`
--
ALTER TABLE `settings_document_numbers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks_registry`
--
ALTER TABLE `stocks_registry`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `tid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timetracking`
--
ALTER TABLE `timetracking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_assets_catalog1` FOREIGN KEY (`catalog_catid`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_assets_employees1` FOREIGN KEY (`employeeid`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `catalog`
--
ALTER TABLE `catalog`
  ADD CONSTRAINT `catalog_ibfk_1` FOREIGN KEY (`unit`) REFERENCES `units` (`unit`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `catalog_ibfk_2` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `catalog_meta`
--
ALTER TABLE `catalog_meta`
  ADD CONSTRAINT `catalog_meta_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `currency_series`
--
ALTER TABLE `currency_series`
  ADD CONSTRAINT `fk_currency_series_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`);

--
-- Constraints for table `deliveries_contents`
--
ALTER TABLE `deliveries_contents`
  ADD CONSTRAINT `deliveries_contents_ibfk_1` FOREIGN KEY (`delivery`) REFERENCES `deliveries` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `deliveries_contents_ibfk_2` FOREIGN KEY (`item`) REFERENCES `orders_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`type`) REFERENCES `settings_document_types` (`type`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_documents_partners1` FOREIGN KEY (`partners_id`) REFERENCES `partners` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_documents_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`team`) REFERENCES `teams` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`jobtitle`) REFERENCES `jobs` (`codcor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_employees_users1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `employees_ops`
--
ALTER TABLE `employees_ops`
  ADD CONSTRAINT `fk_employees_ops_catalog1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_employees_ops_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_ibfk_3` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `fk_maintainance_assets1` FOREIGN KEY (`assets_aid`) REFERENCES `assets` (`aid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_maintainance_users1` FOREIGN KEY (`execby`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_document1` FOREIGN KEY (`doc_id`) REFERENCES `documents` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_partners1` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`team`) REFERENCES `teams` (`tid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `orders_2_employees`
--
ALTER TABLE `orders_2_employees`
  ADD CONSTRAINT `orders_2_employees_ibfk_1` FOREIGN KEY (`emplid`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_2_employees_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_2_employees_ibfk_3` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_2_employees_ibfk_4` FOREIGN KEY (`operation`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `orders_costs`
--
ALTER TABLE `orders_costs`
  ADD CONSTRAINT `orders_costs_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_costs_ibfk_2` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_costs_ibfk_3` FOREIGN KEY (`unit`) REFERENCES `units` (`unit`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `orders_items`
--
ALTER TABLE `orders_items`
  ADD CONSTRAINT `fk_orders_items_catalog1` FOREIGN KEY (`cat_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_items_ibfk_1` FOREIGN KEY (`order`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_items_ibfk_2` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_items_ibfk_3` FOREIGN KEY (`unit`) REFERENCES `units` (`unit`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orders_items_meta`
--
ALTER TABLE `orders_items_meta`
  ADD CONSTRAINT `orders_items_meta_ibfk_1` FOREIGN KEY (`order_item_id`) REFERENCES `orders_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders_meta`
--
ALTER TABLE `orders_meta`
  ADD CONSTRAINT `orders_meta_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `settings_document_numbers`
--
ALTER TABLE `settings_document_numbers`
  ADD CONSTRAINT `settings_document_numbers_ibfk_1` FOREIGN KEY (`type`) REFERENCES `settings_document_types` (`type`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`location`) REFERENCES `location` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `stocks_registry`
--
ALTER TABLE `stocks_registry`
  ADD CONSTRAINT `fk_stocks_registry_catalog1` FOREIGN KEY (`cat_id`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stocks_registry_documents1` FOREIGN KEY (`documents_docid`) REFERENCES `documents` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stocks_registry_orders_items1` FOREIGN KEY (`order_item_id`) REFERENCES `orders_items` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks_registry_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks_registry_ibfk_2` FOREIGN KEY (`unit`) REFERENCES `units` (`unit`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `fk_table1_employees1` FOREIGN KEY (`teamlead`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `timetracking`
--
ALTER TABLE `timetracking`
  ADD CONSTRAINT `fk_timetracking_catalog1` FOREIGN KEY (`operation`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_timetracking_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_timetracking_employees1` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `timetracking_ibfk_1` FOREIGN KEY (`order`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `users_2_groups`
--
ALTER TABLE `users_2_groups`
  ADD CONSTRAINT `users_2_groups_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_2_groups_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
