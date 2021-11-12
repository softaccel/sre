-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 12, 2021 at 10:35 AM
-- Server version: 8.0.27-0ubuntu0.20.04.1
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `addToDelivery` (IN `invId` INT, IN `dqty` FLOAT(10,3), IN `dlvrId` INT)  begin
	update inventory set qty=qty-dqty WHERE id=invId;
    insert into deliveries_contents(delivery,item,qty) VALUES(dlvrId,invId,dqty) on duplicate key update qty=qty+dqty;
END$$

CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `delete_zeroqty_costs` ()  DELETE FROM orders_costs WHERE qty=0$$

CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `detele_zerolength_tt` ()  NO SQL
DELETE FROM timetracking WHERE duration=0 AND stop IS NOT null$$

CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `log` (IN `msg` TEXT)  NO SQL
insert into log(message) VALUES(msg)$$

CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `login` (IN `uid` VARCHAR(50), IN `pass` VARCHAR(255), OUT `cnt` INT)  NO SQL
select count(*) into cnt from users where userid=uid and password=sha2(pass,224) and active=1$$

CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `stop_tt_allopen` ()  SQL SECURITY INVOKER
update timetracking set status="f" WHERE stop is null$$

CREATE DEFINER=`spaleck`@`localhost` PROCEDURE `stop_tt_exceed` ()  BEGIN
	SELECT `value` INTO @limit FROM settings WHERE `key`='timetracking.stop_after' LIMIT 0,1;
	IF(@limit is null) THEN
    	SET @limit = 540;
    END IF;
	UPDATE timetracking set stop=CURRENT_TIMESTAMP, status='f' WHERE stop IS null AND TIMESTAMPDIFF(MINUTE,start,CURRENT_TIMESTAMP) > @limit ORDER BY `timetracking`.`id`;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` int NOT NULL,
  `title` int NOT NULL,
  `description` int NOT NULL,
  `first_occured` datetime NOT NULL,
  `last_occured` datetime NOT NULL,
  `mute` tinyint(1) NOT NULL,
  `ack` int NOT NULL,
  `cleared` tinyint(1) NOT NULL,
  `category` int NOT NULL,
  `checkid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
,`hourlyrate` float(10,2)
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
  `grouping` varchar(50) DEFAULT NULL,
  `unit` varchar(45) NOT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `vat` float DEFAULT NULL
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
-- Table structure for table `checks`
--

CREATE TABLE `checks` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `cmd_type` enum('sql','php','shell') NOT NULL,
  `reccurence` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `cnt_ttrecs_big_duration`
-- (See below for the actual view)
--
CREATE TABLE `cnt_ttrecs_big_duration` (
`id` int
,`num` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cnt_ttrecs_not_alloc`
-- (See below for the actual view)
--
CREATE TABLE `cnt_ttrecs_not_alloc` (
`cnt` bigint
,`id` int
);

-- --------------------------------------------------------

--
-- Table structure for table `conturi_contabile`
--

CREATE TABLE `conturi_contabile` (
  `cont` varchar(20) NOT NULL,
  `denumire` varchar(30) NOT NULL,
  `parent` varchar(20) DEFAULT NULL
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
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastupdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries_contents`
--

CREATE TABLE `deliveries_contents` (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `delivery` int NOT NULL,
  `item` int NOT NULL,
  `seqno` int UNSIGNED DEFAULT NULL,
  `label_printed` tinyint(1) NOT NULL DEFAULT '0',
  `checkout` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `deliveries_contents`
--
DELIMITER $$
CREATE TRIGGER `create_sqqno` BEFORE INSERT ON `deliveries_contents` FOR EACH ROW BEGIN
	
	SELECT count(*) +1 INTO @seqno from deliveries_contents where delivery=NEW.delivery and item=NEW.item;
    SET NEW.seqno=@seqno;
    
    SET NEW.id=CONCAT(LPAD(NEW.delivery,6,"0"),".",LPAD(NEW.item,5,"0"),".",LPAD(NEW.seqno,3,"0"));
    
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
-- Stand-in structure for view `deliveries_contents_notdlvd`
-- (See below for the actual view)
--
CREATE TABLE `deliveries_contents_notdlvd` (
`checkout` tinyint(1)
,`delivery` int
,`id` varchar(20)
,`item` int
,`label_printed` tinyint(1)
,`seqno` int unsigned
);

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
-- Stand-in structure for view `delivery_items_aggregated`
-- (See below for the actual view)
--
CREATE TABLE `delivery_items_aggregated` (
`checkout` decimal(25,0)
,`code` text
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
    IF(@cnt != 1 ) THEN
    	signal sqlstate '45010' set message_text = 'Nu a putut fi generat numar de document';
    END IF; 
    SET NEW.docnum = @docnum;
    UPDATE settings_document_numbers set lastissued=lastissued+1 WHERE type=NEW.type ;     
   
END IF
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
  `jobtitle` varchar(50) NOT NULL,
  `card` varchar(30) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `employees_names`
-- (See below for the actual view)
--
CREATE TABLE `employees_names` (
`fullname` varchar(91)
,`id` int
,`team` int
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
-- Stand-in structure for view `employees_work`
-- (See below for the actual view)
--
CREATE TABLE `employees_work` (
`d` decimal(35,2)
,`day` varchar(10)
,`employee` int
,`operation` int
,`order` int
);

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
,`hourlyrate` float(10,2)
,`id` int
,`label` varchar(255)
,`lname` varchar(45)
,`oid` int
,`opid` int
,`opname` varchar(255)
,`status` enum('offer','ord','proc','ready','dlvd','canceled')
);

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
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int NOT NULL,
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
  `issued_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `invoices`
--
DELIMITER $$
CREATE TRIGGER `create_document_entry` BEFORE INSERT ON `invoices` FOR EACH ROW BEGIN
	IF(NEW.doc_id IS NULL) THEN
    	INSERT INTO documents(user_id,type) VALUES(NEW.issued_by,'invoice');
    	SET NEW.doc_id=LAST_INSERT_ID();
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `name` int NOT NULL,
  `qty` float(10,3) NOT NULL,
  `unit` int NOT NULL,
  `unit_price` float(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `vat` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  `order_item` int DEFAULT NULL,
  `order_id` int DEFAULT NULL
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
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
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
  `comments` varchar(255) DEFAULT NULL,
  `state` enum('offer','ord','proc','ready','dlvd','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'ord',
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
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `team` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `create_document` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
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
  `hourlyrate` float(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_costs`
--

CREATE TABLE `orders_costs` (
  `id` int NOT NULL,
  `oid` int NOT NULL,
  `cat_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grouping` varchar(50) DEFAULT NULL,
  `qty` float(10,2) NOT NULL,
  `unit` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `unit_price` float(10,2) NOT NULL,
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
	IF(NEW.vat IS NULL) THEN
    	SET NEW.vat = 19;
    END IF;
	IF(NEW.total is null) THEN
		SET NEW.total=NEW.qty*NEW.unit_price;
    END IF;
    SET NEW.total_wvat = NEW.total + NEW.vat * NEW.total/100;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `recalc_total` BEFORE UPDATE ON `orders_costs` FOR EACH ROW BEGIN
	IF(NEW.vat IS NULL) THEN
    	SET NEW.vat = 19;
    END IF;
    SET NEW.total=NEW.qty*NEW.unit_price;
    SET NEW.total_wvat = NEW.total + NEW.vat * NEW.total/100;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_costs_aggregated`
-- (See below for the actual view)
--
CREATE TABLE `orders_costs_aggregated` (
`currency` varchar(10)
,`grouping` varchar(50)
,`oid` int
,`qty` double(19,2)
,`total` double(19,2)
,`unit` varchar(45)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_costs_total`
-- (See below for the actual view)
--
CREATE TABLE `orders_costs_total` (
`currency` varchar(10)
,`oid` int
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
,`state` enum('offer','ord','proc','ready','dlvd','canceled')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_extended`
-- (See below for the actual view)
--
CREATE TABLE `orders_extended` (
`closed_on` date
,`comments` varchar(255)
,`created_on` datetime
,`doc_id` int
,`docnum` varchar(45)
,`final_value` float(10,2)
,`label` varchar(255)
,`oid` int
,`partner_id` int
,`pname` varchar(255)
,`state` enum('offer','ord','proc','ready','dlvd','canceled')
,`user_id` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_in_delay`
-- (See below for the actual view)
--
CREATE TABLE `orders_in_delay` (
`calculated_value` float(10,2)
,`closed_on` date
,`comments` varchar(255)
,`created_on` datetime
,`currency` varchar(10)
,`cust_int_ref` varchar(50)
,`doc_id` int
,`final_value` float(10,2)
,`label` varchar(255)
,`multiplied_by` int
,`oid` int
,`order_value` float(10,2)
,`partner_id` int
,`readytodeliver_on` date
,`startwork_on` datetime
,`state` enum('offer','ord','proc','ready','dlvd','canceled')
,`team` int
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
-- Stand-in structure for view `orders_items_wdocnum`
-- (See below for the actual view)
--
CREATE TABLE `orders_items_wdocnum` (
`cat_id` int
,`currency` varchar(10)
,`dlvd_qty` float(10,3)
,`docnum` varchar(45)
,`id` int
,`match_key` varchar(50)
,`match_value` varchar(255)
,`name` tinytext
,`order` int
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
-- Stand-in structure for view `orders_states_cnt`
-- (See below for the actual view)
--
CREATE TABLE `orders_states_cnt` (
`cnt` bigint
,`state` enum('offer','ord','proc','ready','dlvd','canceled')
);

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
-- Stand-in structure for view `orders_working_hours`
-- (See below for the actual view)
--
CREATE TABLE `orders_working_hours` (
`estimated` text
,`order_id` int
,`total` decimal(34,1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_to_delivery`
-- (See below for the actual view)
--
CREATE TABLE `order_to_delivery` (
`did` int
,`label` varchar(255)
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
  `address1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `county` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
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
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int NOT NULL,
  `parent_id` int NOT NULL,
  `component_id` int NOT NULL,
  `qty` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `recipes_expanded`
-- (See below for the actual view)
--
CREATE TABLE `recipes_expanded` (
`currency` varchar(10)
,`id` int
,`name` varchar(255)
,`parent_id` int
,`rcpid` int
,`type` enum('product','product_composed','service')
,`unit` varchar(45)
,`unit_price` float(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_agg_order_tt_op`
-- (See below for the actual view)
--
CREATE TABLE `report_agg_order_tt_op` (
`comments` varchar(255)
,`docnum` varchar(45)
,`hourly_rate` float(10,2)
,`label` varchar(255)
,`name` varchar(255)
,`operation` int
,`order` int
,`ROUND(SUM(duration)/60,2)` decimal(35,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_agg_order_tt_op_empl`
-- (See below for the actual view)
--
CREATE TABLE `report_agg_order_tt_op_empl` (
`comments` varchar(255)
,`d` decimal(35,2)
,`docnum` varchar(45)
,`employee` int
,`hourly_rate` float(10,2)
,`label` varchar(255)
,`operation` int
,`opname` varchar(255)
,`order` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_tt_agg_byempl`
-- (See below for the actual view)
--
CREATE TABLE `report_tt_agg_byempl` (
`comments` varchar(255)
,`date` varchar(10)
,`doc_id` int
,`docnum` varchar(45)
,`duration` decimal(35,2)
,`employee` int
,`fname` varchar(45)
,`label` varchar(255)
,`lname` varchar(45)
,`operation` int
,`opname` varchar(255)
,`order` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_tt_agg_by_order`
-- (See below for the actual view)
--
CREATE TABLE `report_tt_agg_by_order` (
`comments` varchar(255)
,`currency` varchar(10)
,`docnum` varchar(45)
,`duration` decimal(35,2)
,`hourly_rate` float(10,2)
,`label` varchar(255)
,`operation` int
,`opname` varchar(255)
,`order` int
);

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
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL
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
  `validto` datetime DEFAULT '2051-04-01 08:30:52',
  `last_udpated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` datetime NOT NULL,
  `contcontabil` varchar(20) NOT NULL,
  `locatie` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` float(10,3) NOT NULL,
  `ordered_qty` int DEFAULT NULL,
  `unit_price` int NOT NULL,
  `vat_level` float(2,2) NOT NULL,
  `doc_id` int NOT NULL,
  `order_item` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `order` int NOT NULL,
  `bittape` bit(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timetracking`
--

CREATE TABLE `timetracking` (
  `id` int NOT NULL,
  `employee` int NOT NULL,
  `team` int DEFAULT NULL,
  `start` datetime DEFAULT CURRENT_TIMESTAMP,
  `stop` datetime DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `operation` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `hourly_rate` float(10,2) DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` enum('w','f') NOT NULL DEFAULT 'w'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `timetracking`
--
DELIMITER $$
CREATE TRIGGER `add_cost_on_full_insert` AFTER INSERT ON `timetracking` FOR EACH ROW BEGIN
	IF(NEW.stop IS NOT NULL and NEW.order IS NOT NULL AND NEW.hourly_rate IS NOT NULL) THEN
        SELECT name,unit,`grouping` into @new_op,@new_op_unit,@grp FROM catalog WHERE id=NEW.operation;
	    INSERT INTO orders_costs(oid, cat_id,`grouping`, name, qty, unit, unit_price, currency)
    		VALUES (NEW.order, NEW.operation,@grp, @new_op, NEW.duration/60, @new_op_unit, NEW.hourly_rate, NEW.currency) 
    		ON duplicate KEY update qty=qty+NEW.duration/60, total=total+NEW.duration/60*NEW.hourly_rate;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `add_cost_on_update` AFTER UPDATE ON `timetracking` FOR EACH ROW BEGIN
  
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
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert` BEFORE INSERT ON `timetracking` FOR EACH ROW BEGIN
	
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
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update` BEFORE UPDATE ON `timetracking` FOR EACH ROW BEGIN
  	
	IF (NEW.stop IS NOT NULL AND NEW.stop<NEW.start) THEN
    	SIGNAL SQLSTATE '45050' SET message_text = 'Data la oprire este mai veche decat data la pornire';
    END IF;
    
	
    IF(NEW.team IS NULL) THEN
		SELECT team into @team FROM employees WHERE id=NEW.employee;
    	SET NEW.team=@team;
    END IF;
    
    
    IF(NEW.stop IS NOT NULL) THEN
    	SET NEW.duration = TIMESTAMPDIFF(MINUTE,NEW.start,NEW.stop);
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_cost_on_ttentry_delete` BEFORE DELETE ON `timetracking` FOR EACH ROW BEGIN
	SELECT name,unit into @old_op,@old_op_unit FROM catalog WHERE id=OLD.operation;
  
    IF( (OLD.stop is NOT NULL) AND (OLD.order IS NOT NULL) AND (OLD.hourly_rate IS NOT NULL) ) THEN
        
        SELECT sum(total) INTO @total FROM orders_costs WHERE oid=OLD.order AND name=@old_op AND cat_id=OLD.operation AND currency=OLD.currency;
        IF(@total-OLD.duration/60*OLD.hourly_rate > 0) THEN
        	UPDATE orders_costs SET qty=qty-OLD.duration/60, total=total-OLD.duration/60*OLD.hourly_rate WHERE oid=OLD.order AND name=@old_op AND cat_id=OLD.operation AND currency=OLD.currency;
        ELSE
        	DELETE FROM orders_costs WHERE oid=OLD.order AND name=@old_op AND cat_id=OLD.operation AND currency=OLD.currency;
        END IF;
    END IF;
END
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
  `level` tinyint UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `add_user_rights` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO users_meta (user_id, meta_key, meta_val)
    SELECT NEW.userid, CONCAT('rights', SUBSTR(s.key, 7)), '[]' FROM settings s WHERE s.key LIKE 'module.%';
END
$$
DELIMITER ;
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
	if(NEW.password!="" and NEW.password is not null and NEW.password!=OLD.password) THEN
    	SET NEW.password=sha2(NEW.password,224);
    end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_meta`
--

CREATE TABLE `users_meta` (
  `id` int NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_val` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `users_rights`
-- (See below for the actual view)
--
CREATE TABLE `users_rights` (
`id` int
,`meta_val` text
,`module` varchar(248)
,`user_id` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `alloc_orders`
--
DROP TABLE IF EXISTS `alloc_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `alloc_orders`  AS SELECT `e`.`id` AS `emplid`, `e`.`fname` AS `fname`, `e`.`lname` AS `lname`, `e`.`card` AS `card`, `op`.`name` AS `op_name`, `op`.`id` AS `op_id`, `d`.`docnum` AS `order_name`, `o`.`oid` AS `order_id`, `o2e`.`hourlyrate` AS `hourlyrate`, `o2e`.`currency` AS `currency`, concat(`e`.`id`,`d`.`docnum`,`op`.`name`) AS `unq` FROM ((((`employees` `e` left join `orders_2_employees` `o2e` on((`o2e`.`emplid` = `e`.`id`))) left join `orders` `o` on((`o`.`oid` = `o2e`.`orderid`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) left join `catalog` `op` on((`op`.`id` = `o2e`.`operation`))) WHERE ((`d`.`docnum` is not null) AND (`o`.`state` = 'proc')) ;

-- --------------------------------------------------------

--
-- Structure for view `cnt_ttrecs_big_duration`
--
DROP TABLE IF EXISTS `cnt_ttrecs_big_duration`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `cnt_ttrecs_big_duration`  AS SELECT 1 AS `id`, count(0) AS `num` FROM `timetracking` WHERE (timestampdiff(MINUTE,`timetracking`.`start`,`timetracking`.`stop`) > 420) ;

-- --------------------------------------------------------

--
-- Structure for view `cnt_ttrecs_not_alloc`
--
DROP TABLE IF EXISTS `cnt_ttrecs_not_alloc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `cnt_ttrecs_not_alloc`  AS SELECT 1 AS `id`, count(0) AS `cnt` FROM `timetracking_wdiff` WHERE (`timetracking_wdiff`.`order` is null) ;

-- --------------------------------------------------------

--
-- Structure for view `deliveries_contents_notdlvd`
--
DROP TABLE IF EXISTS `deliveries_contents_notdlvd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `deliveries_contents_notdlvd`  AS SELECT `deliveries_contents`.`id` AS `id`, `deliveries_contents`.`delivery` AS `delivery`, `deliveries_contents`.`item` AS `item`, `deliveries_contents`.`seqno` AS `seqno`, `deliveries_contents`.`label_printed` AS `label_printed`, `deliveries_contents`.`checkout` AS `checkout` FROM `deliveries_contents` WHERE (`deliveries_contents`.`checkout` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `delivery_items_aggregated`
--
DROP TABLE IF EXISTS `delivery_items_aggregated`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `delivery_items_aggregated`  AS SELECT `oim`.`meta_val` AS `code`, `a`.`delivery` AS `delivery`, `a`.`label` AS `label`, `a`.`item` AS `item`, `a`.`totalcnt` AS `totalcnt`, `a`.`printed` AS `printed`, `a`.`checkout` AS `checkout`, (`a`.`totalcnt` - `a`.`printed`) AS `notprinted`, (`a`.`totalcnt` - `a`.`checkout`) AS `notcheckout` FROM ((select `deliveries_contents`.`delivery` AS `delivery`,`orders_items`.`name` AS `label`,`deliveries_contents`.`item` AS `item`,count(0) AS `totalcnt`,sum(`deliveries_contents`.`label_printed`) AS `printed`,sum(`deliveries_contents`.`checkout`) AS `checkout` from (`orders_items` join `deliveries_contents`) where (`orders_items`.`id` = `deliveries_contents`.`item`) group by `deliveries_contents`.`delivery`,`deliveries_contents`.`item`) `a` left join `orders_items_meta` `oim` on(((`oim`.`order_item_id` = `a`.`item`) and (`oim`.`meta_key` = 'P.A.P_ZeichnungSpr.Zeichnung')))) ;

-- --------------------------------------------------------

--
-- Structure for view `employees_names`
--
DROP TABLE IF EXISTS `employees_names`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `employees_names`  AS SELECT `employees`.`id` AS `id`, concat(`employees`.`fname`,' ',`employees`.`lname`) AS `fullname`, `employees`.`team` AS `team` FROM `employees` ;

-- --------------------------------------------------------

--
-- Structure for view `employees_work`
--
DROP TABLE IF EXISTS `employees_work`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY INVOKER VIEW `employees_work`  AS SELECT round((sum(`tt`.`duration`) / 60),2) AS `d`, `tt`.`employee` AS `employee`, `tt`.`operation` AS `operation`, left(`tt`.`start`,10) AS `day`, `tt`.`order` AS `order` FROM `timetracking` AS `tt` GROUP BY `tt`.`order`, `tt`.`operation`, `day`, `tt`.`employee` ORDER BY `tt`.`employee` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `emplToOrdAssoc`
--
DROP TABLE IF EXISTS `emplToOrdAssoc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `emplToOrdAssoc`  AS SELECT `o2e`.`id` AS `id`, `ord`.`oid` AS `oid`, `ord`.`state` AS `status`, `doc`.`docnum` AS `docnum`, `ops`.`name` AS `opname`, `o2e`.`hourlyrate` AS `hourlyrate`, `o2e`.`currency` AS `currency`, `empl`.`fname` AS `fname`, `empl`.`lname` AS `lname`, `o2e`.`emplid` AS `emplid`, `ord`.`label` AS `label`, `ops`.`id` AS `opid` FROM ((((`orders_2_employees` `o2e` left join `orders` `ord` on((`ord`.`oid` = `o2e`.`orderid`))) left join `catalog` `ops` on((`ops`.`id` = `o2e`.`operation`))) left join `documents` `doc` on((`doc`.`id` = `ord`.`doc_id`))) left join `employees` `empl` on((`empl`.`id` = `o2e`.`emplid`))) ORDER BY `o2e`.`emplid` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `orders_costs_aggregated`
--
DROP TABLE IF EXISTS `orders_costs_aggregated`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_costs_aggregated`  AS SELECT `orders_costs`.`oid` AS `oid`, `orders_costs`.`unit` AS `unit`, `orders_costs`.`currency` AS `currency`, `orders_costs`.`grouping` AS `grouping`, sum(`orders_costs`.`qty`) AS `qty`, sum(`orders_costs`.`total`) AS `total` FROM `orders_costs` GROUP BY `orders_costs`.`oid`, `orders_costs`.`grouping`, `orders_costs`.`unit`, `orders_costs`.`currency` ORDER BY `orders_costs`.`oid` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `orders_costs_total`
--
DROP TABLE IF EXISTS `orders_costs_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_costs_total`  AS SELECT `orders_costs`.`currency` AS `currency`, `orders_costs`.`oid` AS `oid`, sum(`orders_costs`.`total`) AS `total`, sum(`orders_costs`.`total_wvat`) AS `total_wvat` FROM `orders_costs` GROUP BY `orders_costs`.`oid`, `orders_costs`.`currency` ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_extended`  AS SELECT `o`.`oid` AS `oid`, `o`.`label` AS `label`, `o`.`comments` AS `comments`, `o`.`state` AS `state`, `o`.`doc_id` AS `doc_id`, `o`.`partner_id` AS `partner_id`, `o`.`created_on` AS `created_on`, `o`.`closed_on` AS `closed_on`, `o`.`final_value` AS `final_value`, `o`.`user_id` AS `user_id`, `p`.`name` AS `pname`, `d`.`docnum` AS `docnum` FROM ((`orders` `o` left join `partners` `p` on((`p`.`id` = `o`.`partner_id`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `orders_in_delay`
--
DROP TABLE IF EXISTS `orders_in_delay`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_in_delay`  AS SELECT `o`.`oid` AS `oid`, `o`.`label` AS `label`, `o`.`comments` AS `comments`, `o`.`state` AS `state`, `o`.`multiplied_by` AS `multiplied_by`, `o`.`doc_id` AS `doc_id`, `o`.`cust_int_ref` AS `cust_int_ref`, `o`.`partner_id` AS `partner_id`, `o`.`created_on` AS `created_on`, `o`.`startwork_on` AS `startwork_on`, `o`.`readytodeliver_on` AS `readytodeliver_on`, `o`.`closed_on` AS `closed_on`, `o`.`order_value` AS `order_value`, `o`.`calculated_value` AS `calculated_value`, `o`.`final_value` AS `final_value`, `o`.`currency` AS `currency`, `o`.`user_id` AS `user_id`, `o`.`team` AS `team` FROM (`orders` `o` left join `orders_meta` `om` on(((`om`.`order_id` = `o`.`oid`) and (`om`.`meta_key` = 'estimated_delivery')))) WHERE ((`o`.`state` in ('proc','ready')) AND (`om`.`meta_val` is not null) AND (`om`.`meta_val` < curdate())) ;

-- --------------------------------------------------------

--
-- Structure for view `orders_items_labels`
--
DROP TABLE IF EXISTS `orders_items_labels`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_items_labels`  AS SELECT `o`.`oid` AS `orderId`, `oi`.`id` AS `itemId`, `oi`.`name` AS `title`, `om`.`meta_val` AS `belegNum`, `d`.`docnum` AS `docnum`, `oim1`.`meta_val` AS `partId`, `oim2`.`meta_val` AS `designId` FROM (((((`orders_items` `oi` left join `orders` `o` on((`o`.`oid` = `oi`.`order`))) left join `orders_items_meta` `oim1` on(((`oim1`.`order_item_id` = `oi`.`id`) and (`oim1`.`meta_key` = 'P.A.E_BelegPos.Artikel')))) left join `orders_items_meta` `oim2` on(((`oim2`.`order_item_id` = `oi`.`id`) and (`oim2`.`meta_key` = 'P.A.P_ZeichnungSpr.Zeichnung')))) left join `orders_meta` `om` on(((`om`.`order_id` = `o`.`oid`) and (`om`.`meta_key` = 'K.E.E_BelegKopf.BelegNummer')))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) ORDER BY `o`.`oid` ASC, `oi`.`id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `orders_items_wdocnum`
--
DROP TABLE IF EXISTS `orders_items_wdocnum`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_items_wdocnum`  AS SELECT `oi`.`id` AS `id`, `oi`.`order` AS `order`, `oi`.`name` AS `name`, `oi`.`cat_id` AS `cat_id`, `oi`.`unit` AS `unit`, `oi`.`qty` AS `qty`, `oi`.`dlvd_qty` AS `dlvd_qty`, `oi`.`unit_price` AS `unit_price`, `oi`.`vat` AS `vat`, `oi`.`unit_price_wvat` AS `unit_price_wvat`, `oi`.`vat_value` AS `vat_value`, `oi`.`total_value` AS `total_value`, `oi`.`total_value_wvat` AS `total_value_wvat`, `oi`.`currency` AS `currency`, `oi`.`match_key` AS `match_key`, `oi`.`match_value` AS `match_value`, `d`.`docnum` AS `docnum` FROM ((`orders_items` `oi` left join `orders` `o` on((`o`.`oid` = `oi`.`order`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `orders_items_wmeta`
--
DROP TABLE IF EXISTS `orders_items_wmeta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_items_wmeta`  AS SELECT `oi`.`id` AS `id`, `oi`.`order` AS `order`, `oi`.`name` AS `name`, `oi`.`cat_id` AS `cat_id`, `oi`.`unit` AS `unit`, `oi`.`qty` AS `qty`, `oi`.`dlvd_qty` AS `dlvd_qty`, `oi`.`unit_price` AS `unit_price`, `oi`.`vat` AS `vat`, `oi`.`unit_price_wvat` AS `unit_price_wvat`, `oi`.`vat_value` AS `vat_value`, `oi`.`total_value` AS `total_value`, `oi`.`total_value_wvat` AS `total_value_wvat`, `oi`.`currency` AS `currency`, `oi`.`match_key` AS `match_key`, `oi`.`match_value` AS `match_value`, `opm1`.`meta_val` AS `partid`, `opm2`.`meta_val` AS `design`, `cm`.`meta_val` AS `gallery` FROM (((`orders_items` `oi` left join `orders_items_meta` `opm1` on(((`opm1`.`order_item_id` = `oi`.`id`) and (`opm1`.`meta_key` = 'P.A.E_BelegPos.Artikel')))) left join `orders_items_meta` `opm2` on(((`opm2`.`order_item_id` = `oi`.`id`) and (`opm2`.`meta_key` = 'P.A.P_ZeichnungSpr.Zeichnung')))) left join `catalog_meta` `cm` on(((`cm`.`cat_id` = `oi`.`cat_id`) and (`cm`.`meta_key` = 'Gallery')))) ;

-- --------------------------------------------------------

--
-- Structure for view `orders_items_wmeta_notdlvd`
--
DROP TABLE IF EXISTS `orders_items_wmeta_notdlvd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_items_wmeta_notdlvd`  AS SELECT `oi`.`id` AS `id`, `oi`.`order` AS `order`, `oi`.`name` AS `name`, `oi`.`cat_id` AS `cat_id`, `oi`.`unit` AS `unit`, `oi`.`qty` AS `qty`, `oi`.`dlvd_qty` AS `dlvd_qty`, `oi`.`unit_price` AS `unit_price`, `oi`.`vat` AS `vat`, `oi`.`unit_price_wvat` AS `unit_price_wvat`, `oi`.`vat_value` AS `vat_value`, `oi`.`total_value` AS `total_value`, `oi`.`total_value_wvat` AS `total_value_wvat`, `oi`.`currency` AS `currency`, `oi`.`match_key` AS `match_key`, `oi`.`match_value` AS `match_value`, `opm1`.`meta_val` AS `partid`, `opm2`.`meta_val` AS `design`, `cm`.`meta_val` AS `gallery` FROM (((`orders_items` `oi` left join `catalog_meta` `opm1` on(((`opm1`.`cat_id` = `oi`.`cat_id`) and (`opm1`.`meta_key` = 'P.A.E_BelegPos.Artikel')))) left join `catalog_meta` `opm2` on(((`opm2`.`cat_id` = `oi`.`cat_id`) and (`opm2`.`meta_key` = 'P.A.P_ZeichnungSpr.Zeichnung')))) left join `catalog_meta` `cm` on(((`cm`.`cat_id` = `oi`.`cat_id`) and (`cm`.`meta_key` = 'Gallery')))) WHERE (`oi`.`qty` > `oi`.`dlvd_qty`) ;

-- --------------------------------------------------------

--
-- Structure for view `orders_states_cnt`
--
DROP TABLE IF EXISTS `orders_states_cnt`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_states_cnt`  AS SELECT `orders`.`state` AS `state`, count(0) AS `cnt` FROM `orders` WHERE (`orders`.`state` not in ('offer','canceled')) GROUP BY `orders`.`state` ;

-- --------------------------------------------------------

--
-- Structure for view `orders_totalcnt_item`
--
DROP TABLE IF EXISTS `orders_totalcnt_item`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_totalcnt_item`  AS SELECT `o`.`oid` AS `oid`, `d`.`docnum` AS `docnum`, sum((`oi`.`qty` - `oi`.`dlvd_qty`)) AS `cnt` FROM ((`orders_items` `oi` left join `orders` `o` on((`o`.`oid` = `oi`.`order`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) GROUP BY `oi`.`order` ;

-- --------------------------------------------------------

--
-- Structure for view `orders_working_hours`
--
DROP TABLE IF EXISTS `orders_working_hours`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `orders_working_hours`  AS SELECT `tt`.`order` AS `order_id`, round((sum(`tt`.`duration`) / 60),1) AS `total`, `om`.`meta_val` AS `estimated` FROM (`timetracking` `tt` left join `orders_meta` `om` on(((`om`.`meta_key` = 'estimated_work') and (`om`.`order_id` = `tt`.`order`)))) WHERE ((`tt`.`hourly_rate` <> 0) AND (`tt`.`duration` is not null)) GROUP BY `tt`.`order` ;

-- --------------------------------------------------------

--
-- Structure for view `order_to_delivery`
--
DROP TABLE IF EXISTS `order_to_delivery`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `order_to_delivery`  AS SELECT DISTINCT `o`.`oid` AS `oid`, `d`.`id` AS `did`, `d`.`label` AS `label` FROM (((`orders` `o` join `orders_items` `oi` on((`oi`.`order` = `o`.`oid`))) join `deliveries_contents` `dc` on((`dc`.`item` = `oi`.`id`))) join `deliveries` `d` on((`d`.`id` = `dc`.`delivery`))) ;

-- --------------------------------------------------------

--
-- Structure for view `recipes_expanded`
--
DROP TABLE IF EXISTS `recipes_expanded`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `recipes_expanded`  AS SELECT `rcp`.`id` AS `rcpid`, `rcp`.`parent_id` AS `parent_id`, `cat`.`id` AS `id`, `cat`.`name` AS `name`, `cat`.`type` AS `type`, `cat`.`unit` AS `unit`, `cat`.`unit_price` AS `unit_price`, `cat`.`currency` AS `currency` FROM (`recipes` `rcp` left join `catalog` `cat` on((`cat`.`id` = `rcp`.`component_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `report_agg_order_tt_op`
--
DROP TABLE IF EXISTS `report_agg_order_tt_op`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `report_agg_order_tt_op`  AS SELECT `a`.`order` AS `order`, `a`.`operation` AS `operation`, `a`.`hourly_rate` AS `hourly_rate`, `a`.`ROUND(SUM(duration)/60,2)` AS `ROUND(SUM(duration)/60,2)`, `c`.`name` AS `name`, `o`.`label` AS `label`, `o`.`comments` AS `comments`, `o`.`docnum` AS `docnum` FROM (((select `timetracking`.`order` AS `order`,`timetracking`.`operation` AS `operation`,`timetracking`.`hourly_rate` AS `hourly_rate`,round((sum(`timetracking`.`duration`) / 60),2) AS `ROUND(SUM(duration)/60,2)` from `timetracking` group by `timetracking`.`order`,`timetracking`.`operation`,`timetracking`.`hourly_rate`) `a` left join `orders_extended` `o` on((`o`.`oid` = `a`.`order`))) left join `catalog` `c` on((`c`.`id` = `a`.`operation`))) ;

-- --------------------------------------------------------

--
-- Structure for view `report_agg_order_tt_op_empl`
--
DROP TABLE IF EXISTS `report_agg_order_tt_op_empl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `report_agg_order_tt_op_empl`  AS SELECT `o`.`docnum` AS `docnum`, `o`.`label` AS `label`, `o`.`comments` AS `comments`, `c`.`name` AS `opname`, `a`.`d` AS `d`, `a`.`employee` AS `employee`, `a`.`operation` AS `operation`, `a`.`order` AS `order`, `a`.`hourly_rate` AS `hourly_rate` FROM (((select round((sum(`tt`.`duration`) / 60),2) AS `d`,`tt`.`employee` AS `employee`,`tt`.`operation` AS `operation`,`tt`.`order` AS `order`,`tt`.`hourly_rate` AS `hourly_rate` from `timetracking` `tt` group by `tt`.`employee`,`tt`.`operation`,`tt`.`hourly_rate`,`tt`.`order`) `a` left join `orders_extended` `o` on((`o`.`oid` = `a`.`order`))) left join `catalog` `c` on((`c`.`id` = `a`.`operation`))) ;

-- --------------------------------------------------------

--
-- Structure for view `report_tt_agg_byempl`
--
DROP TABLE IF EXISTS `report_tt_agg_byempl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `report_tt_agg_byempl`  AS SELECT `e`.`fname` AS `fname`, `e`.`lname` AS `lname`, `a`.`employee` AS `employee`, `a`.`st` AS `date`, `a`.`order` AS `order`, `a`.`operation` AS `operation`, `a`.`round(sum(duration)/60,2)` AS `duration`, `o`.`label` AS `label`, `o`.`comments` AS `comments`, `o`.`doc_id` AS `doc_id`, `d`.`docnum` AS `docnum`, `c`.`name` AS `opname` FROM (((((select `timetracking`.`employee` AS `employee`,left(`timetracking`.`start`,10) AS `st`,`timetracking`.`order` AS `order`,`timetracking`.`operation` AS `operation`,round((sum(`timetracking`.`duration`) / 60),2) AS `round(sum(duration)/60,2)` from `timetracking` where (`timetracking`.`duration` is not null) group by `timetracking`.`employee`,`st`,`timetracking`.`order`,`timetracking`.`operation`) `a` left join `orders` `o` on((`o`.`oid` = `a`.`order`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) left join `catalog` `c` on((`c`.`id` = `a`.`operation`))) left join `employees` `e` on((`e`.`id` = `a`.`employee`))) ;

-- --------------------------------------------------------

--
-- Structure for view `report_tt_agg_by_order`
--
DROP TABLE IF EXISTS `report_tt_agg_by_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `report_tt_agg_by_order`  AS SELECT `a`.`duration` AS `duration`, `a`.`order` AS `order`, `a`.`operation` AS `operation`, `a`.`hourly_rate` AS `hourly_rate`, `a`.`currency` AS `currency`, `o`.`label` AS `label`, `o`.`comments` AS `comments`, `d`.`docnum` AS `docnum`, `c`.`name` AS `opname` FROM ((((select round((sum(`timetracking`.`duration`) / 60),2) AS `duration`,`timetracking`.`order` AS `order`,`timetracking`.`operation` AS `operation`,`timetracking`.`hourly_rate` AS `hourly_rate`,`timetracking`.`currency` AS `currency` from `timetracking` where (`timetracking`.`duration` is not null) group by `timetracking`.`order`,`timetracking`.`operation`,`timetracking`.`hourly_rate`,`timetracking`.`currency`) `a` left join `orders` `o` on((`o`.`oid` = `a`.`order`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) left join `catalog` `c` on((`c`.`id` = `a`.`operation`))) ;

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
-- Structure for view `users_rights`
--
DROP TABLE IF EXISTS `users_rights`;

CREATE ALGORITHM=UNDEFINED DEFINER=`spaleck`@`localhost` SQL SECURITY DEFINER VIEW `users_rights`  AS SELECT `users_meta`.`id` AS `id`, `users_meta`.`user_id` AS `user_id`, substr(`users_meta`.`meta_key`,8) AS `module`, `users_meta`.`meta_val` AS `meta_val` FROM `users_meta` WHERE (`users_meta`.`meta_key` like 'rights.%') ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alerts_ibfk_1` (`checkid`);

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
-- Indexes for table `checks`
--
ALTER TABLE `checks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conturi_contabile`
--
ALTER TABLE `conturi_contabile`
  ADD PRIMARY KEY (`cont`);

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
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_id_2` (`stock_id`,`cat_id`),
  ADD KEY `cat_it` (`cat_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoiced_to` (`invoiced_to`),
  ADD KEY `issuer` (`issuer`),
  ADD KEY `doc_id` (`doc_id`),
  ADD KEY `invoices_ibfk_4` (`issued_by`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `invoice_items_ibfk_2` (`currency`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_item` (`order_item`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`codcor`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
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
  ADD UNIQUE KEY `oid` (`oid`,`name`,`unit_price`,`currency`,`cat_id`) USING BTREE,
  ADD KEY `currency` (`currency`),
  ADD KEY `unit` (`unit`),
  ADD KEY `cat_id` (`cat_id`);

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
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `component_id` (`component_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `rights`
--
ALTER TABLE `rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`key`);

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
  ADD KEY `contcontabil` (`contcontabil`),
  ADD KEY `doc_id` (`doc_id`),
  ADD KEY `locatie` (`locatie`),
  ADD KEY `order_item` (`order_item`),
  ADD KEY `product_id` (`product_id`);

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
  ADD KEY `fk_timetracking_currencies1_idx` (`currency`),
  ADD KEY `team` (`team`);

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
-- Indexes for table `users_meta`
--
ALTER TABLE `users_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `aid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `catalog_meta`
--
ALTER TABLE `catalog_meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3350;

--
-- AUTO_INCREMENT for table `checks`
--
ALTER TABLE `checks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `deliveries_labels`
--
ALTER TABLE `deliveries_labels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `orders_2_deliveries`
--
ALTER TABLE `orders_2_deliveries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_2_employees`
--
ALTER TABLE `orders_2_employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=362;

--
-- AUTO_INCREMENT for table `orders_costs`
--
ALTER TABLE `orders_costs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=961;

--
-- AUTO_INCREMENT for table `orders_items`
--
ALTER TABLE `orders_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1069;

--
-- AUTO_INCREMENT for table `orders_items_meta`
--
ALTER TABLE `orders_items_meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3349;

--
-- AUTO_INCREMENT for table `orders_meta`
--
ALTER TABLE `orders_meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rights`
--
ALTER TABLE `rights`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings_document_numbers`
--
ALTER TABLE `settings_document_numbers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stocks_registry`
--
ALTER TABLE `stocks_registry`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `tid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timetracking`
--
ALTER TABLE `timetracking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=801;

--
-- AUTO_INCREMENT for table `users_meta`
--
ALTER TABLE `users_meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alerts`
--
ALTER TABLE `alerts`
  ADD CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`checkid`) REFERENCES `checks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`invoiced_to`) REFERENCES `partners` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`issuer`) REFERENCES `partners` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`doc_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_4` FOREIGN KEY (`issued_by`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_items_ibfk_2` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_items_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_items_ibfk_4` FOREIGN KEY (`order_item`) REFERENCES `orders_items` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_orders_document1` FOREIGN KEY (`doc_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `orders_costs_ibfk_3` FOREIGN KEY (`unit`) REFERENCES `units` (`unit`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_costs_ibfk_4` FOREIGN KEY (`cat_id`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

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
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recipes_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `settings_document_numbers`
--
ALTER TABLE `settings_document_numbers`
  ADD CONSTRAINT `settings_document_numbers_ibfk_1` FOREIGN KEY (`type`) REFERENCES `settings_document_types` (`type`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `stocks_registry`
--
ALTER TABLE `stocks_registry`
  ADD CONSTRAINT `stocks_registry_ibfk_1` FOREIGN KEY (`contcontabil`) REFERENCES `conturi_contabile` (`cont`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks_registry_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks_registry_ibfk_3` FOREIGN KEY (`locatie`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks_registry_ibfk_4` FOREIGN KEY (`order_item`) REFERENCES `orders_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks_registry_ibfk_5` FOREIGN KEY (`product_id`) REFERENCES `catalog` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

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
  ADD CONSTRAINT `timetracking_ibfk_1` FOREIGN KEY (`order`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `timetracking_ibfk_2` FOREIGN KEY (`team`) REFERENCES `teams` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `users_meta`
--
ALTER TABLE `users_meta`
  ADD CONSTRAINT `users_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
