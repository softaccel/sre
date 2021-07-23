-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 09, 2021 at 04:18 PM
-- Server version: 8.0.25-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET FOREIGN_KEY_CHECKS=0;
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
CREATE DEFINER=`vsergiu`@`localhost` PROCEDURE `addToDelivery` (IN `invId` INT, IN `dqty` FLOAT(10,3), IN `dlvrId` INT)  begin
	update inventory set qty=qty-dqty WHERE id=invId;
    insert into deliveries_contents(delivery,item,qty) VALUES(dlvrId,invId,dqty) on duplicate key update qty=qty+dqty;
END$$

DELIMITER ;

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
,`op_name` varchar(50)
,`order_id` int
,`order_name` varchar(45)
,`unq` varchar(106)
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
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` varchar(10) NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `prio` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `desc`, `prio`) VALUES
('CHF', 'Swiss Franc', 0),
('DDD', 'DDD', 0),
('EUR', 'EURO', 10),
('RON', 'Romanian Leu', 9),
('USD', 'US Dollar', 0);

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
  `status` enum('created','loading','ready','delivered','received') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'created',
  `dlv_date` date DEFAULT NULL,
  `lastupdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `label`, `status`, `dlv_date`) VALUES
(1, 'unu', 'created', NULL),
(2, 'doi', 'created', NULL),
(3, 'new', 'created', NULL),
(4, 'new', 'created', NULL),
(5, 'new', 'created', NULL),
(6, 'old', 'created', NULL),
(7, 'new', 'created', NULL),
(8, 'new', 'created', NULL),
(9, 'new', 'created', NULL),
(10, 'new', 'created', NULL),
(11, 'new', 'created', NULL),
(12, 'new', 'created', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deliveries_contents`
--

CREATE TABLE `deliveries_contents` (
  `id` int NOT NULL,
  `delivery` int NOT NULL,
  `item` int NOT NULL,
  `qty` float NOT NULL,
  `labels` int NOT NULL DEFAULT '0',
  `checkout` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `deliveries_contents`
--

INSERT INTO `deliveries_contents` (`id`, `delivery`, `item`, `qty`, `labels`, `checkout`) VALUES
(30, 1, 352, 3, 0, 0),
(31, 1, 353, 9, 0, 0),
(32, 1, 354, 6, 0, 0),
(33, 1, 355, 3, 0, 0),
(34, 1, 356, 39, 0, 0),
(35, 1, 357, 3, 0, 0),
(36, 1, 358, 3, 0, 0),
(37, 1, 359, 54, 0, 0),
(38, 1, 360, 51, 0, 0),
(39, 1, 361, 3, 0, 0),
(40, 1, 362, 3, 0, 0),
(41, 1, 363, 6, 0, 0),
(42, 1, 364, 3, 0, 0),
(43, 1, 365, 18, 0, 0),
(44, 1, 366, 6, 0, 0),
(45, 1, 367, 12, 0, 0),
(46, 1, 368, 3, 0, 0),
(47, 1, 369, 3, 0, 0),
(48, 1, 370, 18, 0, 0),
(49, 1, 371, 3, 0, 0),
(50, 1, 372, 3, 0, 0),
(51, 1, 373, 54, 0, 0),
(52, 1, 374, 12, 0, 0),
(53, 1, 375, 3, 0, 0),
(54, 1, 376, 3, 0, 0),
(55, 1, 377, 3, 0, 0),
(56, 1, 378, 3, 0, 0),
(57, 1, 379, 39, 0, 0),
(58, 1, 380, 6, 0, 0),
(59, 1, 381, 12, 0, 0),
(60, 1, 382, 6, 0, 0),
(61, 1, 383, 114, 0, 0);

--
-- Triggers `deliveries_contents`
--
DELIMITER $$
CREATE TRIGGER `move_items_back_to_inventory` AFTER DELETE ON `deliveries_contents` FOR EACH ROW update inventory set qty=qty+old.qty where id=old.item
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `dlvrcontents_expanded`
-- (See below for the actual view)
--
CREATE TABLE `dlvrcontents_expanded` (
`checkout` int
,`delivery` int
,`design` text
,`docnum` varchar(45)
,`id` int
,`item` int
,`labels` int
,`name` tinytext
,`order` int
,`partid` text
,`qty` float
);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int NOT NULL,
  `docnum` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `issued_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `partners_id` int DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `docnum`, `issued_date`, `userid`, `partners_id`, `type`) VALUES
(6, 'A114', '2021-04-20 16:56:23', 'vsergiu', 1, 'order'),
(7, 'A115', '2021-04-20 16:56:38', 'vsergiu', 3, 'order'),
(8, 'A116', '2021-04-20 16:56:50', 'vsergiu', 2, 'order'),
(9, 'A117', '2021-04-27 11:32:02', 'vsergiu', 1, 'order'),
(10, 'A118', '2021-05-05 10:00:05', 'vsergiu', 1, 'order'),
(11, 'A119', '2021-05-14 09:41:36', 'vsergiu', 1, 'order'),
(12, 'A120', '2021-05-14 09:48:26', 'vsergiu', 1, 'order'),
(20, 'A121', '2021-05-14 16:07:21', 'vsergiu', 1, 'order'),
(21, 'A122', '2021-05-14 16:26:39', 'vsergiu', 1, 'order'),
(22, 'A123', '2021-05-14 16:27:09', 'vsergiu', 1, 'order'),
(23, 'A124', '2021-05-14 16:28:20', 'vsergiu', 1, 'order'),
(24, 'A125', '2021-05-17 08:42:50', 'vsergiu', 1, 'order'),
(25, 'A126', '2021-05-17 08:47:19', 'vsergiu', 1, 'order'),
(26, 'A127', '2021-05-17 08:51:06', 'vsergiu', 1, 'order'),
(27, 'A128', '2021-05-17 08:52:20', 'vsergiu', 1, 'order'),
(28, 'A129', '2021-05-17 08:58:01', 'vsergiu', 1, 'order'),
(30, 'A130', '2021-05-17 09:14:49', 'vsergiu', 1, 'order'),
(31, 'A131', '2021-05-17 09:15:17', 'vsergiu', 1, 'order'),
(33, 'A132', '2021-05-17 09:15:52', 'vsergiu', 1, 'order'),
(34, 'A133', '2021-05-17 09:16:23', 'vsergiu', 1, 'order'),
(35, 'A134', '2021-05-17 09:17:11', 'vsergiu', 1, 'order'),
(36, 'A135', '2021-05-17 09:17:31', 'vsergiu', 1, 'order'),
(37, 'A136', '2021-05-17 09:18:14', 'vsergiu', 1, 'order'),
(38, 'A137', '2021-05-17 09:19:32', 'vsergiu', 1, 'order'),
(39, 'A138', '2021-05-17 09:19:55', 'vsergiu', 1, 'order'),
(40, 'A139', '2021-05-17 09:20:40', 'vsergiu', 1, 'order'),
(41, 'A140', '2021-05-17 09:26:48', 'vsergiu', 1, 'order'),
(42, 'A141', '2021-05-17 09:28:15', 'vsergiu', 1, 'order'),
(43, 'A142', '2021-05-17 09:28:39', 'vsergiu', 1, 'order'),
(44, 'A143', '2021-05-17 09:29:02', 'vsergiu', 1, 'order'),
(45, 'A144', '2021-05-17 09:29:10', 'vsergiu', 1, 'order'),
(46, 'A145', '2021-05-17 09:29:28', 'vsergiu', 1, 'order'),
(47, 'A146', '2021-05-17 09:30:04', 'vsergiu', 1, 'order'),
(48, 'A147', '2021-05-17 09:30:32', 'vsergiu', 1, 'order'),
(49, 'A148', '2021-05-17 09:31:02', 'vsergiu', 1, 'order'),
(50, 'A149', '2021-05-17 09:31:20', 'vsergiu', 1, 'order'),
(51, 'A150', '2021-05-17 09:32:20', 'vsergiu', 1, 'order'),
(52, 'A151', '2021-05-17 09:32:40', 'vsergiu', 1, 'order'),
(53, 'A152', '2021-05-17 09:32:57', 'vsergiu', 1, 'order'),
(54, 'A153', '2021-05-17 09:33:26', 'vsergiu', 1, 'order'),
(55, 'A154', '2021-05-17 09:33:50', 'vsergiu', 1, 'order'),
(56, 'A155', '2021-05-17 09:34:15', 'vsergiu', 1, 'order'),
(57, 'A156', '2021-05-17 09:34:30', 'vsergiu', 1, 'order'),
(58, 'A157', '2021-05-17 09:38:54', 'vsergiu', 1, 'order'),
(59, 'A158', '2021-05-17 10:29:02', 'vsergiu', 1, 'order'),
(60, 'A159', '2021-05-17 10:30:21', 'vsergiu', 1, 'order'),
(61, 'A160', '2021-05-17 10:30:39', 'vsergiu', 1, 'order'),
(62, 'A161', '2021-05-17 10:33:54', 'vsergiu', 1, 'order'),
(63, 'A162', '2021-05-17 10:36:32', 'vsergiu', 1, 'order'),
(64, 'A163', '2021-05-17 10:36:47', 'vsergiu', 1, 'order'),
(65, 'A164', '2021-05-17 10:37:45', 'vsergiu', 1, 'order'),
(66, 'A165', '2021-05-17 10:40:30', 'vsergiu', 1, 'order'),
(67, 'A166', '2021-05-17 10:41:37', 'vsergiu', 1, 'order'),
(68, 'A167', '2021-05-17 10:42:40', 'vsergiu', 1, 'order'),
(69, 'A168', '2021-05-17 10:43:21', 'vsergiu', 1, 'order'),
(70, 'A169', '2021-05-17 10:43:54', 'vsergiu', 1, 'order'),
(71, 'A170', '2021-05-24 10:55:33', 'vsergiu', 1, 'order'),
(72, 'A171', '2021-05-25 09:49:36', 'vsergiu', 1, 'order'),
(74, 'A172', '2021-05-25 09:53:26', 'vsergiu', 1, 'order');

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

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `fname`, `lname`, `bdate`, `cnp`, `address_1`, `address_2`, `city`, `postcode`, `county`, `country`, `userid`, `docs`, `team`, `activ`, `jobtitle`, `card`) VALUES
(1, 'Sergiu', 'Voicu', '1979-05-11', '1790511113709', 'Campului 32', '', 'Ghirodas', 307200, 'Timis', 'Romania', 'vsergiu', NULL, 1, 1, '311306', '0006075014'),
(4, 'Florin', 'Maranescu', '1979-05-11', '1790511113709', 'Campului 32', NULL, 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 3, 1, '311306', '0008400098'),
(5, 'Iulian', 'Parvulescu', '1979-05-11', '1790511113709', 'Campului 32', NULL, 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 1, 1, '332201', '0008400095'),
(6, 'Bogdan', 'Onetiu', '1979-05-11', '1790511113709', 'Campului 32', NULL, 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 1, 1, '332201', '0008399744'),
(7, 'Georgel', 'Orolan', '1979-05-11', '1790511113709', 'Campului 32', NULL, 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 1, 1, '332201', '0008398503'),
(8, 'Petru', 'Cercel', '1979-05-11', '1790511113709', 'Campului 32', '', 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 1, 1, '721410', NULL),
(9, 'Aaron A 2', 'Pumnul 2', '1979-05-12', '1790511113709', 'Ialomita', '2', 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 2, 1, '332201', '0008399741'),
(10, 'Alistar1', 'Concoley', '1979-05-01', '1790511113709', 'Campului 32', '22', 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 3, 1, '332201', ''),
(13, 'asd', 'asdasd', '2021-05-11', '', '', NULL, '', NULL, '', 'Romania', NULL, NULL, NULL, 1, '332201', NULL),
(14, 'yscyx', 'yxcyxcyxc', '2021-04-27', '', '', NULL, '', NULL, '', 'Romania', NULL, NULL, NULL, 1, '311306', NULL),
(15, 'yxcyxc', 'yxcyxccas', '2021-05-03', '', '', NULL, '', NULL, '', 'Romania', NULL, NULL, NULL, 1, '311306', NULL),
(16, 'yxcxc', 'asdasd', '2021-04-27', '', '', NULL, '', NULL, '', 'Romania', NULL, NULL, NULL, 1, '332201', NULL),
(17, 'asd', 's', '2021-05-04', '', '', NULL, '', NULL, '', 'Romania', NULL, NULL, NULL, 1, '332201', 'asd'),
(18, 'sdyxcyxcyxc', 'xyyxcxcxcyxc', '2021-04-26', '', '', NULL, '', NULL, '', 'Romania', NULL, NULL, NULL, 1, '311306', NULL),
(19, 'sd', 'asdasd', '2021-05-11', '', '', NULL, '', NULL, '', 'Romania', NULL, NULL, NULL, 1, '332201', NULL);

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
,`opname` varchar(50)
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

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`groupid`, `description`) VALUES
('admin', ''),
('sales', ''),
('tehnic', '');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int NOT NULL,
  `order` int DEFAULT NULL,
  `name` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `catalog_id` int DEFAULT NULL,
  `um` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qty` float(10,2) DEFAULT NULL,
  `order_qty` float(10,2) NOT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `vat_proc` float(10,2) DEFAULT NULL,
  `vat_value` float(10,2) DEFAULT NULL,
  `total_price` float(10,2) DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `order`, `name`, `catalog_id`, `um`, `qty`, `order_qty`, `unit_price`, `vat_proc`, `vat_value`, `total_price`, `currency`) VALUES
(351, 11, 'Futterblech Siebkasten / Lagergehäuse / 3D-Combi / ', NULL, 'Stk', 6.00, 6.00, 9.90, NULL, NULL, NULL, 'E'),
(352, 11, 'Futterblech Motor /  / 3D Combi 833+ / ', NULL, 'Stk', 0.00, 3.00, 12.80, NULL, NULL, NULL, 'E'),
(353, 11, 'Klemmleiste / L1390 /  / ', NULL, 'Stk', 0.00, 9.00, 11.70, NULL, NULL, NULL, 'E'),
(354, 11, 'Schubstange / L5450 / Terex / ', NULL, 'Stk', 0.00, 6.00, 352.30, NULL, NULL, NULL, 'E'),
(355, 11, 'Klemmleiste / L1450 /  / ', NULL, 'Stk', 0.00, 3.00, 12.50, NULL, NULL, NULL, 'E'),
(356, 11, 'Winkel AK OB spg. /  /  / ', NULL, 'Stk', 0.00, 39.00, 2.60, NULL, NULL, NULL, 'E'),
(357, 11, 'Siebkasten / SZWS 1510x6000 / 693+ / ', NULL, 'Stk', 0.00, 3.00, 5689.20, NULL, NULL, NULL, 'E'),
(358, 11, 'Aufgabeboden / LW1510 / 693+ / ', NULL, 'Stk', 0.00, 3.00, 391.20, NULL, NULL, NULL, 'E'),
(359, 11, 'Siebtraverse Schwingrahmen FSC / LW1510 / 693+ / ', NULL, 'Stk', 0.00, 54.00, 94.30, NULL, NULL, NULL, 'E'),
(360, 11, 'Siebtraverse Grundrahmen FSC / LW 1510 / 683+ / ', NULL, 'Stk', 0.00, 51.00, 105.70, NULL, NULL, NULL, 'E'),
(361, 11, 'Siebtraverse Grundrahmen Abgab / LW 1510 /  / ', NULL, 'Stk', 0.00, 3.00, 236.40, NULL, NULL, NULL, 'E'),
(362, 11, 'Siebtraverse Abgabe / LW 1510 /  / ', NULL, 'Stk', 0.00, 3.00, 432.00, NULL, NULL, NULL, 'E'),
(363, 11, 'Winkel Halter Rückwand /  / 693+ / ', NULL, 'Stk', 0.00, 6.00, 7.70, NULL, NULL, NULL, 'E'),
(364, 11, 'Rückwand /  / 693+ / ', NULL, 'Stk', 0.00, 3.00, 250.30, NULL, NULL, NULL, 'E'),
(365, 11, 'Klemmleiste / Siebdurchgang / 693+ / ', NULL, 'Stk', 0.00, 18.00, 41.50, NULL, NULL, NULL, 'E'),
(366, 11, 'Konsole Verlagerung fb / ø114 /  / ', NULL, 'Stk', 0.00, 6.00, 120.00, NULL, NULL, NULL, 'E'),
(367, 11, 'Verdrehbare Verlagerung / ø114 / 693+ / ', NULL, 'Stk', 0.00, 12.00, 81.50, NULL, NULL, NULL, 'E'),
(368, 11, 'Vorfertigung Terex Schutzhaube /  /  / ', NULL, 'Stk', 0.00, 3.00, 247.00, NULL, NULL, NULL, 'E'),
(369, 11, 'Vorfertigung Terex Schutzhaube /  /  / ', NULL, 'Stk', 0.00, 3.00, 241.50, NULL, NULL, NULL, 'E'),
(370, 11, 'Klemmleiste / L1890 /  / ', NULL, 'Stk', 0.00, 18.00, 15.00, NULL, NULL, NULL, 'E'),
(371, 11, 'Klemmleiste / L1450 /  / ', NULL, 'Stk', 0.00, 3.00, 14.30, NULL, NULL, NULL, 'E'),
(372, 11, 'Siebtraverse Grundrahmen Abgab / LW 1510 /  / ', NULL, 'Stk', 0.00, 3.00, 411.10, NULL, NULL, NULL, 'E'),
(373, 11, 'Futterblech /  / Schwingtraverse 693+ / ', NULL, 'Stk', 0.00, 54.00, 3.70, NULL, NULL, NULL, 'E'),
(374, 11, 'Transportsicherung /  / 693+ / ', NULL, 'Stk', 0.00, 12.00, 19.50, NULL, NULL, NULL, 'E'),
(375, 11, 'Abdichtung Aufgabe /  /  / ', NULL, 'Stk', 0.00, 3.00, 8.10, NULL, NULL, NULL, 'E'),
(376, 11, 'Abdichtung Aufgabe spg. /  /  / ', NULL, 'Stk', 0.00, 3.00, 8.10, NULL, NULL, NULL, 'E'),
(377, 11, 'Winkel AK OB 2 spg. /  /  / ', NULL, 'Stk', 0.00, 3.00, 2.90, NULL, NULL, NULL, 'E'),
(378, 11, 'Winkel AK OB 2 /  /  / ', NULL, 'Stk', 0.00, 3.00, 2.90, NULL, NULL, NULL, 'E'),
(379, 11, 'Winkel AK OB /  /  / ', NULL, 'Stk', 0.00, 39.00, 2.60, NULL, NULL, NULL, 'E'),
(380, 11, 'Konsole Verlagerung Fa / ø114 /  / ', NULL, 'Stk', 0.00, 6.00, 120.00, NULL, NULL, NULL, 'E'),
(381, 11, 'Transportöse inkl. Schrauben / Typ SEWU / schmale Ausführung / ', NULL, 'Stk', 0.00, 12.00, 39.30, NULL, NULL, NULL, 'E'),
(382, 11, 'Schubstange / L5450 / Terex / ', NULL, 'Stk', 0.00, 6.00, 352.70, NULL, NULL, NULL, 'E'),
(383, 11, 'Vorrichtung Traverse FSC-Tech / kurz / Fine Side Cover / ', NULL, 'Stk', 0.00, 114.00, 7.70, NULL, NULL, NULL, 'E'),
(384, 11, 'Auflage Matte Seitlich /  /  / ', NULL, 'Stk', 3.00, 3.00, 1.80, NULL, NULL, NULL, 'E'),
(385, 11, 'Auflage Matte Seitlich spg. /  /  / ', NULL, 'Stk', 3.00, 3.00, 1.80, NULL, NULL, NULL, 'E'),
(421, 13, 'Futterblech Siebkasten / Lagergehäuse / 3D-Combi / ', NULL, 'Stk', 6.00, 6.00, 9.90, NULL, NULL, NULL, 'E'),
(422, 13, 'Futterblech Motor /  / 3D Combi 833+ / ', NULL, 'Stk', 3.00, 3.00, 12.80, NULL, NULL, NULL, 'E'),
(423, 13, 'Klemmleiste / L1390 /  / ', NULL, 'Stk', 9.00, 9.00, 11.70, NULL, NULL, NULL, 'E'),
(424, 13, 'Schubstange / L5450 / Terex / ', NULL, 'Stk', 6.00, 6.00, 352.30, NULL, NULL, NULL, 'E'),
(425, 13, 'Klemmleiste / L1450 /  / ', NULL, 'Stk', 3.00, 3.00, 12.50, NULL, NULL, NULL, 'E'),
(426, 13, 'Winkel AK OB spg. /  /  / ', NULL, 'Stk', 39.00, 39.00, 2.60, NULL, NULL, NULL, 'E'),
(427, 13, 'Siebkasten / SZWS 1510x6000 / 693+ / ', NULL, 'Stk', 3.00, 3.00, 5689.20, NULL, NULL, NULL, 'E'),
(428, 13, 'Aufgabeboden / LW1510 / 693+ / ', NULL, 'Stk', 3.00, 3.00, 391.20, NULL, NULL, NULL, 'E'),
(429, 13, 'Siebtraverse Schwingrahmen FSC / LW1510 / 693+ / ', NULL, 'Stk', 54.00, 54.00, 94.30, NULL, NULL, NULL, 'E'),
(430, 13, 'Siebtraverse Grundrahmen FSC / LW 1510 / 683+ / ', NULL, 'Stk', 51.00, 51.00, 105.70, NULL, NULL, NULL, 'E'),
(431, 13, 'Siebtraverse Grundrahmen Abgab / LW 1510 /  / ', NULL, 'Stk', 3.00, 3.00, 236.40, NULL, NULL, NULL, 'E'),
(432, 13, 'Siebtraverse Abgabe / LW 1510 /  / ', NULL, 'Stk', 3.00, 3.00, 432.00, NULL, NULL, NULL, 'E'),
(433, 13, 'Winkel Halter Rückwand /  / 693+ / ', NULL, 'Stk', 6.00, 6.00, 7.70, NULL, NULL, NULL, 'E'),
(434, 13, 'Rückwand /  / 693+ / ', NULL, 'Stk', 3.00, 3.00, 250.30, NULL, NULL, NULL, 'E'),
(435, 13, 'Klemmleiste / Siebdurchgang / 693+ / ', NULL, 'Stk', 18.00, 18.00, 41.50, NULL, NULL, NULL, 'E'),
(436, 13, 'Konsole Verlagerung fb / ø114 /  / ', NULL, 'Stk', 6.00, 6.00, 120.00, NULL, NULL, NULL, 'E'),
(437, 13, 'Verdrehbare Verlagerung / ø114 / 693+ / ', NULL, 'Stk', 12.00, 12.00, 81.50, NULL, NULL, NULL, 'E'),
(438, 13, 'Vorfertigung Terex Schutzhaube /  /  / ', NULL, 'Stk', 3.00, 3.00, 247.00, NULL, NULL, NULL, 'E'),
(439, 13, 'Vorfertigung Terex Schutzhaube /  /  / ', NULL, 'Stk', 3.00, 3.00, 241.50, NULL, NULL, NULL, 'E'),
(440, 13, 'Klemmleiste / L1890 /  / ', NULL, 'Stk', 18.00, 18.00, 15.00, NULL, NULL, NULL, 'E'),
(441, 13, 'Klemmleiste / L1450 /  / ', NULL, 'Stk', 3.00, 3.00, 14.30, NULL, NULL, NULL, 'E'),
(442, 13, 'Siebtraverse Grundrahmen Abgab / LW 1510 /  / ', NULL, 'Stk', 3.00, 3.00, 411.10, NULL, NULL, NULL, 'E'),
(443, 13, 'Futterblech /  / Schwingtraverse 693+ / ', NULL, 'Stk', 54.00, 54.00, 3.70, NULL, NULL, NULL, 'E'),
(444, 13, 'Transportsicherung /  / 693+ / ', NULL, 'Stk', 12.00, 12.00, 19.50, NULL, NULL, NULL, 'E'),
(445, 13, 'Abdichtung Aufgabe /  /  / ', NULL, 'Stk', 13.00, 3.00, 8.10, NULL, NULL, NULL, 'E'),
(446, 13, 'Abdichtung Aufgabe spg. /  /  / ', NULL, 'Stk', 3.00, 3.00, 8.10, NULL, NULL, NULL, 'E'),
(447, 13, 'Winkel AK OB 2 spg. /  /  / ', NULL, 'Stk', 3.00, 3.00, 2.90, NULL, NULL, NULL, 'E'),
(448, 13, 'Winkel AK OB 2 /  /  / ', NULL, 'Stk', 3.00, 3.00, 2.90, NULL, NULL, NULL, 'E'),
(449, 13, 'Winkel AK OB /  /  / ', NULL, 'Stk', 39.00, 39.00, 2.60, NULL, NULL, NULL, 'E'),
(450, 13, 'Konsole Verlagerung Fa / ø114 /  / ', NULL, 'Stk', 6.00, 6.00, 120.00, NULL, NULL, NULL, 'E'),
(451, 13, 'Transportöse inkl. Schrauben / Typ SEWU / schmale Ausführung / ', NULL, 'Stk', 12.00, 12.00, 39.30, NULL, NULL, NULL, 'E'),
(452, 13, 'Schubstange / L5450 / Terex / ', NULL, 'Stk', 6.00, 6.00, 352.70, NULL, NULL, NULL, 'E'),
(453, 13, 'Vorrichtung Traverse FSC-Tech / kurz / Fine Side Cover / ', NULL, 'Stk', 114.00, 114.00, 7.70, NULL, NULL, NULL, 'E'),
(454, 13, 'Auflage Matte Seitlich /  /  / ', NULL, 'Stk', 3.00, 3.00, 1.80, NULL, NULL, NULL, 'E'),
(455, 13, 'Auflage Matte Seitlich spg. /  /  / ', NULL, 'Stk', 3.00, 3.00, 1.80, NULL, NULL, NULL, 'E');

--
-- Triggers `inventory`
--
DELIMITER $$
CREATE TRIGGER `check_negative_qty` BEFORE UPDATE ON `inventory` FOR EACH ROW BEGIN
	IF (NEW.qty < 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'negative values of inventory quantity are not allowed';
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `inventory_extented`
-- (See below for the actual view)
--
CREATE TABLE `inventory_extented` (
`catalog_id` int
,`currency` varchar(10)
,`design` text
,`docnum` varchar(45)
,`id` int
,`name` tinytext
,`order` int
,`partid` text
,`qty` float(10,2)
,`total_price` float(10,2)
,`um` varchar(45)
,`unit_price` float(10,2)
,`vat_proc` float(10,2)
,`vat_value` float(10,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_meta`
--

CREATE TABLE `inventory_meta` (
  `id` int NOT NULL,
  `order_part_id` int NOT NULL,
  `meta_key` varchar(100) NOT NULL,
  `meta_val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventory_meta`
--

INSERT INTO `inventory_meta` (`id`, `order_part_id`, `meta_key`, `meta_val`) VALUES
(6651, 351, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par Gesamtgewicht der 3 Maschinen: 12.100,00Kg\\par\\par ----------\\par }'),
(6652, 351, 'P.A..PreisbezugMitME', 'Stk'),
(6653, 351, 'P.A.E_BelegPos.Artikel', '3812930'),
(6654, 351, 'P.A.E_BelegPos.Einzelpreis', '9,90'),
(6655, 351, 'P.A.E_BelegPos.Menge', '6'),
(6656, 351, 'P.A.E_BelegPos.PF_Gewicht', '16,20 kg'),
(6657, 351, 'P.A.E_BelegPos.PositionsNr', '1'),
(6658, 351, 'P.A.E_BelegPos.Warenwert', '59,40'),
(6659, 351, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6660, 351, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6661, 351, 'P.A.P_Zeichnung.IndexNr', '001'),
(6662, 351, 'P.A.P_ZeichnungSpr.Zeichnung', '1335620'),
(6663, 351, 'P.A.S_Artikel.DIN_ISO', '-'),
(6664, 351, 'P.A.S_Artikel.Werkstoff', '-'),
(6665, 351, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Futterblech Siebkasten'),
(6666, 351, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'Lagergehäuse'),
(6667, 351, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '3D-Combi'),
(6668, 351, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6669, 351, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6670, 351, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6671, 352, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(6672, 352, 'P.A..PreisbezugMitME', 'Stk'),
(6673, 352, 'P.A.E_BelegPos.Artikel', '3812931'),
(6674, 352, 'P.A.E_BelegPos.Einzelpreis', '12,80'),
(6675, 352, 'P.A.E_BelegPos.Menge', '3'),
(6676, 352, 'P.A.E_BelegPos.PF_Gewicht', '10,50 kg'),
(6677, 352, 'P.A.E_BelegPos.PositionsNr', '2'),
(6678, 352, 'P.A.E_BelegPos.Warenwert', '38,40'),
(6679, 352, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6680, 352, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6681, 352, 'P.A.P_Zeichnung.IndexNr', '001'),
(6682, 352, 'P.A.P_ZeichnungSpr.Zeichnung', '1335622'),
(6683, 352, 'P.A.S_Artikel.DIN_ISO', '-'),
(6684, 352, 'P.A.S_Artikel.Werkstoff', '-'),
(6685, 352, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Futterblech Motor'),
(6686, 352, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '3D Combi 833+'),
(6687, 352, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6688, 352, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6689, 352, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6690, 353, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(6691, 353, 'P.A..PreisbezugMitME', 'Stk'),
(6692, 353, 'P.A.E_BelegPos.Artikel', '3900089'),
(6693, 353, 'P.A.E_BelegPos.Einzelpreis', '11,70'),
(6694, 353, 'P.A.E_BelegPos.Menge', '9'),
(6695, 353, 'P.A.E_BelegPos.PF_Gewicht', '28,80 kg'),
(6696, 353, 'P.A.E_BelegPos.PositionsNr', '3'),
(6697, 353, 'P.A.E_BelegPos.Warenwert', '105,30'),
(6698, 353, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6699, 353, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6700, 353, 'P.A.P_Zeichnung.IndexNr', '003'),
(6701, 353, 'P.A.P_ZeichnungSpr.Zeichnung', '1002276'),
(6702, 353, 'P.A.S_Artikel.DIN_ISO', '-'),
(6703, 353, 'P.A.S_Artikel.Werkstoff', 'S355MC / 1.0978'),
(6704, 353, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Klemmleiste'),
(6705, 353, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'L1390'),
(6706, 353, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6707, 353, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6708, 353, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6709, 354, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(6710, 354, 'P.A..PreisbezugMitME', 'Stk'),
(6711, 354, 'P.A.E_BelegPos.Artikel', '3902927'),
(6712, 354, 'P.A.E_BelegPos.Einzelpreis', '352,30'),
(6713, 354, 'P.A.E_BelegPos.Menge', '6'),
(6714, 354, 'P.A.E_BelegPos.PF_Gewicht', '576,00 kg'),
(6715, 354, 'P.A.E_BelegPos.PositionsNr', '4'),
(6716, 354, 'P.A.E_BelegPos.Warenwert', '2.113,80'),
(6717, 354, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6718, 354, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6719, 354, 'P.A.P_Zeichnung.IndexNr', '004'),
(6720, 354, 'P.A.P_ZeichnungSpr.Zeichnung', '1351073'),
(6721, 354, 'P.A.S_Artikel.DIN_ISO', '-'),
(6722, 354, 'P.A.S_Artikel.Werkstoff', 'S355MC / 1.0978'),
(6723, 354, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Schubstange'),
(6724, 354, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'L5450'),
(6725, 354, 'P.A.S_ArtikelSpr.Bezeichnung[3]', 'Terex'),
(6726, 354, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6727, 354, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6728, 354, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6729, 355, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(6730, 355, 'P.A..PreisbezugMitME', 'Stk'),
(6731, 355, 'P.A.E_BelegPos.Artikel', '3903239'),
(6732, 355, 'P.A.E_BelegPos.Einzelpreis', '12,50'),
(6733, 355, 'P.A.E_BelegPos.Menge', '3'),
(6734, 355, 'P.A.E_BelegPos.PF_Gewicht', '10,20 kg'),
(6735, 355, 'P.A.E_BelegPos.PositionsNr', '5'),
(6736, 355, 'P.A.E_BelegPos.Warenwert', '37,50'),
(6737, 355, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6738, 355, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6739, 355, 'P.A.P_Zeichnung.IndexNr', '001'),
(6740, 355, 'P.A.P_ZeichnungSpr.Zeichnung', '1454845'),
(6741, 355, 'P.A.S_Artikel.DIN_ISO', '-'),
(6742, 355, 'P.A.S_Artikel.Werkstoff', '-'),
(6743, 355, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Klemmleiste'),
(6744, 355, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'L1450'),
(6745, 355, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6746, 355, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6747, 355, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6748, 356, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(6749, 356, 'P.A..PreisbezugMitME', 'Stk'),
(6750, 356, 'P.A.E_BelegPos.Artikel', '80079069'),
(6751, 356, 'P.A.E_BelegPos.Einzelpreis', '2,60'),
(6752, 356, 'P.A.E_BelegPos.Menge', '39'),
(6753, 356, 'P.A.E_BelegPos.PF_Gewicht', '27,30 kg'),
(6754, 356, 'P.A.E_BelegPos.PositionsNr', '6'),
(6755, 356, 'P.A.E_BelegPos.Warenwert', '101,40'),
(6756, 356, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6757, 356, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6758, 356, 'P.A.P_Zeichnung.IndexNr', '000'),
(6759, 356, 'P.A.P_ZeichnungSpr.Zeichnung', '80079069'),
(6760, 356, 'P.A.S_Artikel.DIN_ISO', '-'),
(6761, 356, 'P.A.S_Artikel.Werkstoff', '-'),
(6762, 356, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Winkel AK OB spg.'),
(6763, 356, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6764, 356, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6765, 356, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6766, 357, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(6767, 357, 'P.A..PreisbezugMitME', 'Stk'),
(6768, 357, 'P.A.E_BelegPos.Artikel', '80073942'),
(6769, 357, 'P.A.E_BelegPos.Einzelpreis', '5.689,20'),
(6770, 357, 'P.A.E_BelegPos.Menge', '3'),
(6771, 357, 'P.A.E_BelegPos.PF_Gewicht', '4.638,30 kg'),
(6772, 357, 'P.A.E_BelegPos.PositionsNr', '7'),
(6773, 357, 'P.A.E_BelegPos.Warenwert', '17.067,60'),
(6774, 357, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6775, 357, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6776, 357, 'P.A.P_Zeichnung.IndexNr', '003'),
(6777, 357, 'P.A.P_ZeichnungSpr.Zeichnung', '80073942'),
(6778, 357, 'P.A.S_Artikel.DIN_ISO', '-'),
(6779, 357, 'P.A.S_Artikel.Werkstoff', '-'),
(6780, 357, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Siebkasten'),
(6781, 357, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'SZWS 1510x6000'),
(6782, 357, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(6783, 357, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6784, 357, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6785, 357, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6786, 358, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(6787, 358, 'P.A..PreisbezugMitME', 'Stk'),
(6788, 358, 'P.A.E_BelegPos.Artikel', '80073945'),
(6789, 358, 'P.A.E_BelegPos.Einzelpreis', '391,20'),
(6790, 358, 'P.A.E_BelegPos.Menge', '3'),
(6791, 358, 'P.A.E_BelegPos.PF_Gewicht', '319,80 kg'),
(6792, 358, 'P.A.E_BelegPos.PositionsNr', '8'),
(6793, 358, 'P.A.E_BelegPos.Warenwert', '1.173,60'),
(6794, 358, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6795, 358, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6796, 358, 'P.A.P_Zeichnung.IndexNr', '001'),
(6797, 358, 'P.A.P_ZeichnungSpr.Zeichnung', '80073945'),
(6798, 358, 'P.A.S_Artikel.DIN_ISO', '-'),
(6799, 358, 'P.A.S_Artikel.Werkstoff', '-'),
(6800, 358, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Aufgabeboden'),
(6801, 358, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'LW1510'),
(6802, 358, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(6803, 358, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6804, 358, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6805, 358, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6806, 359, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(6807, 359, 'P.A..PreisbezugMitME', 'Stk'),
(6808, 359, 'P.A.E_BelegPos.Artikel', '80074017'),
(6809, 359, 'P.A.E_BelegPos.Einzelpreis', '94,30'),
(6810, 359, 'P.A.E_BelegPos.Menge', '54'),
(6811, 359, 'P.A.E_BelegPos.PF_Gewicht', '1.387,80 kg'),
(6812, 359, 'P.A.E_BelegPos.PositionsNr', '9'),
(6813, 359, 'P.A.E_BelegPos.Warenwert', '5.092,20'),
(6814, 359, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6815, 359, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6816, 359, 'P.A.P_Zeichnung.IndexNr', '000'),
(6817, 359, 'P.A.P_ZeichnungSpr.Zeichnung', '80074017'),
(6818, 359, 'P.A.S_Artikel.DIN_ISO', '-'),
(6819, 359, 'P.A.S_Artikel.Werkstoff', '-'),
(6820, 359, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Siebtraverse Schwingrahmen FSC'),
(6821, 359, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'LW1510'),
(6822, 359, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(6823, 359, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6824, 359, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6825, 359, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6826, 360, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(6827, 360, 'P.A..PreisbezugMitME', 'Stk'),
(6828, 360, 'P.A.E_BelegPos.Artikel', '80074019'),
(6829, 360, 'P.A.E_BelegPos.Einzelpreis', '105,70'),
(6830, 360, 'P.A.E_BelegPos.Menge', '51'),
(6831, 360, 'P.A.E_BelegPos.PF_Gewicht', '1.468,80 kg'),
(6832, 360, 'P.A.E_BelegPos.PositionsNr', '10'),
(6833, 360, 'P.A.E_BelegPos.Warenwert', '5.390,70'),
(6834, 360, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6835, 360, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6836, 360, 'P.A.P_Zeichnung.IndexNr', '000'),
(6837, 360, 'P.A.P_ZeichnungSpr.Zeichnung', '80074019'),
(6838, 360, 'P.A.S_Artikel.DIN_ISO', '-'),
(6839, 360, 'P.A.S_Artikel.Werkstoff', '-'),
(6840, 360, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Siebtraverse Grundrahmen FSC'),
(6841, 360, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'LW 1510'),
(6842, 360, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '683+'),
(6843, 360, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6844, 360, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6845, 360, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6846, 361, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(6847, 361, 'P.A..PreisbezugMitME', 'Stk'),
(6848, 361, 'P.A.E_BelegPos.Artikel', '80074067'),
(6849, 361, 'P.A.E_BelegPos.Einzelpreis', '236,40'),
(6850, 361, 'P.A.E_BelegPos.Menge', '3'),
(6851, 361, 'P.A.E_BelegPos.PF_Gewicht', '193,20 kg'),
(6852, 361, 'P.A.E_BelegPos.PositionsNr', '11'),
(6853, 361, 'P.A.E_BelegPos.Warenwert', '709,20'),
(6854, 361, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6855, 361, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6856, 361, 'P.A.P_Zeichnung.IndexNr', '000'),
(6857, 361, 'P.A.P_ZeichnungSpr.Zeichnung', '80074067'),
(6858, 361, 'P.A.S_Artikel.DIN_ISO', '-'),
(6859, 361, 'P.A.S_Artikel.Werkstoff', '-'),
(6860, 361, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Siebtraverse Grundrahmen Abgab'),
(6861, 361, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'LW 1510'),
(6862, 361, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6863, 361, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6864, 361, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6865, 362, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(6866, 362, 'P.A..PreisbezugMitME', 'Stk'),
(6867, 362, 'P.A.E_BelegPos.Artikel', '80074071'),
(6868, 362, 'P.A.E_BelegPos.Einzelpreis', '432,00'),
(6869, 362, 'P.A.E_BelegPos.Menge', '3'),
(6870, 362, 'P.A.E_BelegPos.PF_Gewicht', '353,10 kg'),
(6871, 362, 'P.A.E_BelegPos.PositionsNr', '12'),
(6872, 362, 'P.A.E_BelegPos.Warenwert', '1.296,00'),
(6873, 362, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6874, 362, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6875, 362, 'P.A.P_Zeichnung.IndexNr', '001'),
(6876, 362, 'P.A.P_ZeichnungSpr.Zeichnung', '80074071'),
(6877, 362, 'P.A.S_Artikel.DIN_ISO', '-'),
(6878, 362, 'P.A.S_Artikel.Werkstoff', '-'),
(6879, 362, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Siebtraverse Abgabe'),
(6880, 362, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'LW 1510'),
(6881, 362, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6882, 362, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6883, 362, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6884, 363, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(6885, 363, 'P.A..PreisbezugMitME', 'Stk'),
(6886, 363, 'P.A.E_BelegPos.Artikel', '80074103'),
(6887, 363, 'P.A.E_BelegPos.Einzelpreis', '7,70'),
(6888, 363, 'P.A.E_BelegPos.Menge', '6'),
(6889, 363, 'P.A.E_BelegPos.PF_Gewicht', '12,60 kg'),
(6890, 363, 'P.A.E_BelegPos.PositionsNr', '13'),
(6891, 363, 'P.A.E_BelegPos.Warenwert', '46,20'),
(6892, 363, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6893, 363, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6894, 363, 'P.A.P_Zeichnung.IndexNr', '000'),
(6895, 363, 'P.A.P_ZeichnungSpr.Zeichnung', '80074103'),
(6896, 363, 'P.A.S_Artikel.DIN_ISO', '-'),
(6897, 363, 'P.A.S_Artikel.Werkstoff', '-'),
(6898, 363, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Winkel Halter Rückwand'),
(6899, 363, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(6900, 363, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6901, 363, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6902, 363, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6903, 364, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(6904, 364, 'P.A..PreisbezugMitME', 'Stk'),
(6905, 364, 'P.A.E_BelegPos.Artikel', '80074105'),
(6906, 364, 'P.A.E_BelegPos.Einzelpreis', '250,30'),
(6907, 364, 'P.A.E_BelegPos.Menge', '3'),
(6908, 364, 'P.A.E_BelegPos.PF_Gewicht', '204,90 kg'),
(6909, 364, 'P.A.E_BelegPos.PositionsNr', '14'),
(6910, 364, 'P.A.E_BelegPos.Warenwert', '750,90'),
(6911, 364, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6912, 364, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6913, 364, 'P.A.P_Zeichnung.IndexNr', '003'),
(6914, 364, 'P.A.P_ZeichnungSpr.Zeichnung', '80074105'),
(6915, 364, 'P.A.S_Artikel.DIN_ISO', '-'),
(6916, 364, 'P.A.S_Artikel.Werkstoff', '-'),
(6917, 364, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Rückwand'),
(6918, 364, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(6919, 364, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6920, 364, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6921, 364, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6922, 365, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par\\par }'),
(6923, 365, 'P.A..PreisbezugMitME', 'Stk'),
(6924, 365, 'P.A.E_BelegPos.Artikel', '80074121'),
(6925, 365, 'P.A.E_BelegPos.Einzelpreis', '41,50'),
(6926, 365, 'P.A.E_BelegPos.Menge', '18'),
(6927, 365, 'P.A.E_BelegPos.PF_Gewicht', '203,40 kg'),
(6928, 365, 'P.A.E_BelegPos.PositionsNr', '15'),
(6929, 365, 'P.A.E_BelegPos.Warenwert', '747,00'),
(6930, 365, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6931, 365, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6932, 365, 'P.A.P_Zeichnung.IndexNr', '000'),
(6933, 365, 'P.A.P_ZeichnungSpr.Zeichnung', '80074121'),
(6934, 365, 'P.A.S_Artikel.DIN_ISO', '-'),
(6935, 365, 'P.A.S_Artikel.Werkstoff', '-'),
(6936, 365, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Klemmleiste'),
(6937, 365, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'Siebdurchgang'),
(6938, 365, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(6939, 365, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6940, 365, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6941, 365, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6942, 366, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(6943, 366, 'P.A..PreisbezugMitME', 'Stk'),
(6944, 366, 'P.A.E_BelegPos.Artikel', '80076877'),
(6945, 366, 'P.A.E_BelegPos.Einzelpreis', '120,00'),
(6946, 366, 'P.A.E_BelegPos.Menge', '6'),
(6947, 366, 'P.A.E_BelegPos.PF_Gewicht', '196,20 kg'),
(6948, 366, 'P.A.E_BelegPos.PositionsNr', '16'),
(6949, 366, 'P.A.E_BelegPos.Warenwert', '720,00'),
(6950, 366, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6951, 366, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6952, 366, 'P.A.P_Zeichnung.IndexNr', '000'),
(6953, 366, 'P.A.P_ZeichnungSpr.Zeichnung', '80076877'),
(6954, 366, 'P.A.S_Artikel.DIN_ISO', '-'),
(6955, 366, 'P.A.S_Artikel.Werkstoff', '-'),
(6956, 366, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Konsole Verlagerung fb'),
(6957, 366, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'ø114'),
(6958, 366, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6959, 366, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6960, 366, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6961, 367, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(6962, 367, 'P.A..PreisbezugMitME', 'Stk'),
(6963, 367, 'P.A.E_BelegPos.Artikel', '80078596'),
(6964, 367, 'P.A.E_BelegPos.Einzelpreis', '81,50'),
(6965, 367, 'P.A.E_BelegPos.Menge', '12'),
(6966, 367, 'P.A.E_BelegPos.PF_Gewicht', '266,40 kg'),
(6967, 367, 'P.A.E_BelegPos.PositionsNr', '17'),
(6968, 367, 'P.A.E_BelegPos.Warenwert', '978,00'),
(6969, 367, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6970, 367, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6971, 367, 'P.A.P_Zeichnung.IndexNr', '001'),
(6972, 367, 'P.A.P_ZeichnungSpr.Zeichnung', '80078596'),
(6973, 367, 'P.A.S_Artikel.DIN_ISO', '-'),
(6974, 367, 'P.A.S_Artikel.Werkstoff', '-'),
(6975, 367, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Verdrehbare Verlagerung'),
(6976, 367, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'ø114'),
(6977, 367, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(6978, 367, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6979, 367, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6980, 367, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6981, 368, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(6982, 368, 'P.A..PreisbezugMitME', 'Stk'),
(6983, 368, 'P.A.E_BelegPos.Artikel', '80078710'),
(6984, 368, 'P.A.E_BelegPos.Einzelpreis', '247,00'),
(6985, 368, 'P.A.E_BelegPos.Menge', '3'),
(6986, 368, 'P.A.E_BelegPos.PF_Gewicht', '201,90 kg'),
(6987, 368, 'P.A.E_BelegPos.PositionsNr', '18'),
(6988, 368, 'P.A.E_BelegPos.Warenwert', '741,00'),
(6989, 368, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(6990, 368, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(6991, 368, 'P.A.P_Zeichnung.IndexNr', '001'),
(6992, 368, 'P.A.P_ZeichnungSpr.Zeichnung', '80078710'),
(6993, 368, 'P.A.S_Artikel.DIN_ISO', '-'),
(6994, 368, 'P.A.S_Artikel.Werkstoff', '-'),
(6995, 368, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Vorfertigung Terex Schutzhaube'),
(6996, 368, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(6997, 368, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(6998, 368, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(6999, 369, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(7000, 369, 'P.A..PreisbezugMitME', 'Stk'),
(7001, 369, 'P.A.E_BelegPos.Artikel', '80078716'),
(7002, 369, 'P.A.E_BelegPos.Einzelpreis', '241,50'),
(7003, 369, 'P.A.E_BelegPos.Menge', '3'),
(7004, 369, 'P.A.E_BelegPos.PF_Gewicht', '197,40 kg'),
(7005, 369, 'P.A.E_BelegPos.PositionsNr', '19'),
(7006, 369, 'P.A.E_BelegPos.Warenwert', '724,50'),
(7007, 369, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7008, 369, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7009, 369, 'P.A.P_Zeichnung.IndexNr', '001'),
(7010, 369, 'P.A.P_ZeichnungSpr.Zeichnung', '80078716'),
(7011, 369, 'P.A.S_Artikel.DIN_ISO', '-'),
(7012, 369, 'P.A.S_Artikel.Werkstoff', '-'),
(7013, 369, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Vorfertigung Terex Schutzhaube'),
(7014, 369, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7015, 369, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7016, 369, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7017, 370, 'P.A..PreisbezugMitME', 'Stk'),
(7018, 370, 'P.A.E_BelegPos.Artikel', '80078997'),
(7019, 370, 'P.A.E_BelegPos.Einzelpreis', '15,00'),
(7020, 370, 'P.A.E_BelegPos.Menge', '18'),
(7021, 370, 'P.A.E_BelegPos.PF_Gewicht', '73,80 kg'),
(7022, 370, 'P.A.E_BelegPos.PositionsNr', '20'),
(7023, 370, 'P.A.E_BelegPos.Warenwert', '270,00'),
(7024, 370, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7025, 370, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7026, 370, 'P.A.P_Zeichnung.IndexNr', '000'),
(7027, 370, 'P.A.P_ZeichnungSpr.Zeichnung', '80078997'),
(7028, 370, 'P.A.S_Artikel.DIN_ISO', '-'),
(7029, 370, 'P.A.S_Artikel.Werkstoff', '-'),
(7030, 370, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Klemmleiste'),
(7031, 370, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'L1890'),
(7032, 370, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7033, 370, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7034, 370, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7035, 371, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(7036, 371, 'P.A..PreisbezugMitME', 'Stk'),
(7037, 371, 'P.A.E_BelegPos.Artikel', '80079015'),
(7038, 371, 'P.A.E_BelegPos.Einzelpreis', '14,30'),
(7039, 371, 'P.A.E_BelegPos.Menge', '3'),
(7040, 371, 'P.A.E_BelegPos.PF_Gewicht', '11,70 kg'),
(7041, 371, 'P.A.E_BelegPos.PositionsNr', '21'),
(7042, 371, 'P.A.E_BelegPos.Warenwert', '42,90'),
(7043, 371, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7044, 371, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7045, 371, 'P.A.P_Zeichnung.IndexNr', '000'),
(7046, 371, 'P.A.P_ZeichnungSpr.Zeichnung', '80079015'),
(7047, 371, 'P.A.S_Artikel.DIN_ISO', '-'),
(7048, 371, 'P.A.S_Artikel.Werkstoff', '-'),
(7049, 371, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Klemmleiste'),
(7050, 371, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'L1450'),
(7051, 371, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7052, 371, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7053, 371, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7054, 372, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(7055, 372, 'P.A..PreisbezugMitME', 'Stk'),
(7056, 372, 'P.A.E_BelegPos.Artikel', '80079020'),
(7057, 372, 'P.A.E_BelegPos.Einzelpreis', '411,10'),
(7058, 372, 'P.A.E_BelegPos.Menge', '3'),
(7059, 372, 'P.A.E_BelegPos.PF_Gewicht', '339,00 kg'),
(7060, 372, 'P.A.E_BelegPos.PositionsNr', '22'),
(7061, 372, 'P.A.E_BelegPos.Warenwert', '1.233,30'),
(7062, 372, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7063, 372, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7064, 372, 'P.A.P_Zeichnung.IndexNr', '001'),
(7065, 372, 'P.A.P_ZeichnungSpr.Zeichnung', '80079020'),
(7066, 372, 'P.A.S_Artikel.DIN_ISO', '-'),
(7067, 372, 'P.A.S_Artikel.Werkstoff', '-'),
(7068, 372, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Siebtraverse Grundrahmen Abgab'),
(7069, 372, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'LW 1510'),
(7070, 372, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7071, 372, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7072, 372, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7073, 373, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(7074, 373, 'P.A..PreisbezugMitME', 'Stk'),
(7075, 373, 'P.A.E_BelegPos.Artikel', '80079041'),
(7076, 373, 'P.A.E_BelegPos.Einzelpreis', '3,70'),
(7077, 373, 'P.A.E_BelegPos.Menge', '54'),
(7078, 373, 'P.A.E_BelegPos.PF_Gewicht', '54,00 kg'),
(7079, 373, 'P.A.E_BelegPos.PositionsNr', '23'),
(7080, 373, 'P.A.E_BelegPos.Warenwert', '199,80'),
(7081, 373, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7082, 373, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7083, 373, 'P.A.P_Zeichnung.IndexNr', '000'),
(7084, 373, 'P.A.P_ZeichnungSpr.Zeichnung', '80079041'),
(7085, 373, 'P.A.S_Artikel.DIN_ISO', '-'),
(7086, 373, 'P.A.S_Artikel.Werkstoff', '-'),
(7087, 373, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Futterblech'),
(7088, 373, 'P.A.S_ArtikelSpr.Bezeichnung[3]', 'Schwingtraverse 693+'),
(7089, 373, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7090, 373, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7091, 373, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7092, 374, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(7093, 374, 'P.A..PreisbezugMitME', 'Stk'),
(7094, 374, 'P.A.E_BelegPos.Artikel', '80079043'),
(7095, 374, 'P.A.E_BelegPos.Einzelpreis', '19,50'),
(7096, 374, 'P.A.E_BelegPos.Menge', '12'),
(7097, 374, 'P.A.E_BelegPos.PF_Gewicht', '64,80 kg'),
(7098, 374, 'P.A.E_BelegPos.PositionsNr', '24'),
(7099, 374, 'P.A.E_BelegPos.Warenwert', '234,00'),
(7100, 374, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7101, 374, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7102, 374, 'P.A.P_Zeichnung.IndexNr', '000'),
(7103, 374, 'P.A.P_ZeichnungSpr.Zeichnung', '80079043'),
(7104, 374, 'P.A.S_Artikel.DIN_ISO', '-'),
(7105, 374, 'P.A.S_Artikel.Werkstoff', '-'),
(7106, 374, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Transportsicherung'),
(7107, 374, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(7108, 374, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7109, 374, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7110, 374, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7111, 375, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(7112, 375, 'P.A..PreisbezugMitME', 'Stk'),
(7113, 375, 'P.A.E_BelegPos.Artikel', '80079046'),
(7114, 375, 'P.A.E_BelegPos.Einzelpreis', '8,10'),
(7115, 375, 'P.A.E_BelegPos.Menge', '3'),
(7116, 375, 'P.A.E_BelegPos.PF_Gewicht', '6,60 kg'),
(7117, 375, 'P.A.E_BelegPos.PositionsNr', '25'),
(7118, 375, 'P.A.E_BelegPos.Warenwert', '24,30'),
(7119, 375, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7120, 375, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7121, 375, 'P.A.P_Zeichnung.IndexNr', '001');
INSERT INTO `inventory_meta` (`id`, `order_part_id`, `meta_key`, `meta_val`) VALUES
(7122, 375, 'P.A.P_ZeichnungSpr.Zeichnung', '80079046'),
(7123, 375, 'P.A.S_Artikel.DIN_ISO', '-'),
(7124, 375, 'P.A.S_Artikel.Werkstoff', '-'),
(7125, 375, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Abdichtung Aufgabe'),
(7126, 375, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7127, 375, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7128, 375, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7129, 376, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(7130, 376, 'P.A..PreisbezugMitME', 'Stk'),
(7131, 376, 'P.A.E_BelegPos.Artikel', '80079064'),
(7132, 376, 'P.A.E_BelegPos.Einzelpreis', '8,10'),
(7133, 376, 'P.A.E_BelegPos.Menge', '3'),
(7134, 376, 'P.A.E_BelegPos.PF_Gewicht', '6,60 kg'),
(7135, 376, 'P.A.E_BelegPos.PositionsNr', '26'),
(7136, 376, 'P.A.E_BelegPos.Warenwert', '24,30'),
(7137, 376, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7138, 376, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7139, 376, 'P.A.P_Zeichnung.IndexNr', '001'),
(7140, 376, 'P.A.P_ZeichnungSpr.Zeichnung', '80079064'),
(7141, 376, 'P.A.S_Artikel.DIN_ISO', '-'),
(7142, 376, 'P.A.S_Artikel.Werkstoff', '-'),
(7143, 376, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Abdichtung Aufgabe spg.'),
(7144, 376, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7145, 376, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7146, 376, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7147, 377, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(7148, 377, 'P.A..PreisbezugMitME', 'Stk'),
(7149, 377, 'P.A.E_BelegPos.Artikel', '80079065'),
(7150, 377, 'P.A.E_BelegPos.Einzelpreis', '2,90'),
(7151, 377, 'P.A.E_BelegPos.Menge', '3'),
(7152, 377, 'P.A.E_BelegPos.PF_Gewicht', '2,40 kg'),
(7153, 377, 'P.A.E_BelegPos.PositionsNr', '27'),
(7154, 377, 'P.A.E_BelegPos.Warenwert', '8,70'),
(7155, 377, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7156, 377, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7157, 377, 'P.A.P_Zeichnung.IndexNr', '000'),
(7158, 377, 'P.A.P_ZeichnungSpr.Zeichnung', '80079065'),
(7159, 377, 'P.A.S_Artikel.DIN_ISO', '-'),
(7160, 377, 'P.A.S_Artikel.Werkstoff', '-'),
(7161, 377, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Winkel AK OB 2 spg.'),
(7162, 377, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7163, 377, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7164, 377, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7165, 378, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(7166, 378, 'P.A..PreisbezugMitME', 'Stk'),
(7167, 378, 'P.A.E_BelegPos.Artikel', '80079074'),
(7168, 378, 'P.A.E_BelegPos.Einzelpreis', '2,90'),
(7169, 378, 'P.A.E_BelegPos.Menge', '3'),
(7170, 378, 'P.A.E_BelegPos.PF_Gewicht', '2,40 kg'),
(7171, 378, 'P.A.E_BelegPos.PositionsNr', '28'),
(7172, 378, 'P.A.E_BelegPos.Warenwert', '8,70'),
(7173, 378, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7174, 378, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7175, 378, 'P.A.P_Zeichnung.IndexNr', '000'),
(7176, 378, 'P.A.P_ZeichnungSpr.Zeichnung', '80079074'),
(7177, 378, 'P.A.S_Artikel.DIN_ISO', '-'),
(7178, 378, 'P.A.S_Artikel.Werkstoff', '-'),
(7179, 378, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Winkel AK OB 2'),
(7180, 378, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7181, 378, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7182, 378, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7183, 379, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(7184, 379, 'P.A..PreisbezugMitME', 'Stk'),
(7185, 379, 'P.A.E_BelegPos.Artikel', '80079076'),
(7186, 379, 'P.A.E_BelegPos.Einzelpreis', '2,60'),
(7187, 379, 'P.A.E_BelegPos.Menge', '39'),
(7188, 379, 'P.A.E_BelegPos.PF_Gewicht', '27,30 kg'),
(7189, 379, 'P.A.E_BelegPos.PositionsNr', '29'),
(7190, 379, 'P.A.E_BelegPos.Warenwert', '101,40'),
(7191, 379, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7192, 379, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7193, 379, 'P.A.P_Zeichnung.IndexNr', '000'),
(7194, 379, 'P.A.P_ZeichnungSpr.Zeichnung', '80079076'),
(7195, 379, 'P.A.S_Artikel.DIN_ISO', '-'),
(7196, 379, 'P.A.S_Artikel.Werkstoff', '-'),
(7197, 379, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Winkel AK OB'),
(7198, 379, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7199, 379, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7200, 379, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7201, 380, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par\\par }'),
(7202, 380, 'P.A..PreisbezugMitME', 'Stk'),
(7203, 380, 'P.A.E_BelegPos.Artikel', '80079083'),
(7204, 380, 'P.A.E_BelegPos.Einzelpreis', '120,00'),
(7205, 380, 'P.A.E_BelegPos.Menge', '6'),
(7206, 380, 'P.A.E_BelegPos.PF_Gewicht', '196,20 kg'),
(7207, 380, 'P.A.E_BelegPos.PositionsNr', '30'),
(7208, 380, 'P.A.E_BelegPos.Warenwert', '720,00'),
(7209, 380, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7210, 380, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7211, 380, 'P.A.P_Zeichnung.IndexNr', '000'),
(7212, 380, 'P.A.P_ZeichnungSpr.Zeichnung', '80079083'),
(7213, 380, 'P.A.S_Artikel.DIN_ISO', '-'),
(7214, 380, 'P.A.S_Artikel.Werkstoff', '-'),
(7215, 380, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Konsole Verlagerung Fa'),
(7216, 380, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'ø114'),
(7217, 380, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7218, 380, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7219, 380, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7220, 381, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(7221, 381, 'P.A..PreisbezugMitME', 'Stk'),
(7222, 381, 'P.A.E_BelegPos.Artikel', '80079089'),
(7223, 381, 'P.A.E_BelegPos.Einzelpreis', '39,30'),
(7224, 381, 'P.A.E_BelegPos.Menge', '12'),
(7225, 381, 'P.A.E_BelegPos.PF_Gewicht', '128,40 kg'),
(7226, 381, 'P.A.E_BelegPos.PositionsNr', '31'),
(7227, 381, 'P.A.E_BelegPos.Warenwert', '471,60'),
(7228, 381, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7229, 381, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7230, 381, 'P.A.P_Zeichnung.IndexNr', '000'),
(7231, 381, 'P.A.P_ZeichnungSpr.Zeichnung', '80079089'),
(7232, 381, 'P.A.S_Artikel.DIN_ISO', '-'),
(7233, 381, 'P.A.S_Artikel.Werkstoff', '-'),
(7234, 381, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Transportöse inkl. Schrauben'),
(7235, 381, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'Typ SEWU'),
(7236, 381, 'P.A.S_ArtikelSpr.Bezeichnung[3]', 'schmale Ausführung'),
(7237, 381, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7238, 381, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7239, 381, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7240, 382, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(7241, 382, 'P.A..PreisbezugMitME', 'Stk'),
(7242, 382, 'P.A.E_BelegPos.Artikel', '80082966'),
(7243, 382, 'P.A.E_BelegPos.Einzelpreis', '352,70'),
(7244, 382, 'P.A.E_BelegPos.Menge', '6'),
(7245, 382, 'P.A.E_BelegPos.PF_Gewicht', '576,60 kg'),
(7246, 382, 'P.A.E_BelegPos.PositionsNr', '32'),
(7247, 382, 'P.A.E_BelegPos.Warenwert', '2.116,20'),
(7248, 382, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7249, 382, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7250, 382, 'P.A.P_Zeichnung.IndexNr', '000'),
(7251, 382, 'P.A.P_ZeichnungSpr.Zeichnung', '80082966'),
(7252, 382, 'P.A.S_Artikel.DIN_ISO', '-'),
(7253, 382, 'P.A.S_Artikel.Werkstoff', '-'),
(7254, 382, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Schubstange'),
(7255, 382, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'L5450'),
(7256, 382, 'P.A.S_ArtikelSpr.Bezeichnung[3]', 'Terex'),
(7257, 382, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7258, 382, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7259, 382, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7260, 383, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(7261, 383, 'P.A..PreisbezugMitME', 'Stk'),
(7262, 383, 'P.A.E_BelegPos.Artikel', '80044766'),
(7263, 383, 'P.A.E_BelegPos.Einzelpreis', '7,70'),
(7264, 383, 'P.A.E_BelegPos.Menge', '114'),
(7265, 383, 'P.A.E_BelegPos.PF_Gewicht', '239,40 kg'),
(7266, 383, 'P.A.E_BelegPos.PositionsNr', '33'),
(7267, 383, 'P.A.E_BelegPos.Warenwert', '877,80'),
(7268, 383, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7269, 383, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7270, 383, 'P.A.P_Zeichnung.IndexNr', '000'),
(7271, 383, 'P.A.P_ZeichnungSpr.Zeichnung', '80044766'),
(7272, 383, 'P.A.S_Artikel.DIN_ISO', '-'),
(7273, 383, 'P.A.S_Artikel.Werkstoff', '-'),
(7274, 383, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Vorrichtung Traverse FSC-Tech'),
(7275, 383, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'kurz'),
(7276, 383, 'P.A.S_ArtikelSpr.Bezeichnung[3]', 'Fine Side Cover'),
(7277, 383, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7278, 383, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7279, 383, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7280, 384, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(7281, 384, 'P.A..PreisbezugMitME', 'Stk'),
(7282, 384, 'P.A.E_BelegPos.Artikel', '80079075'),
(7283, 384, 'P.A.E_BelegPos.Einzelpreis', '1,80'),
(7284, 384, 'P.A.E_BelegPos.Menge', '3'),
(7285, 384, 'P.A.E_BelegPos.PF_Gewicht', '1,50 kg'),
(7286, 384, 'P.A.E_BelegPos.PositionsNr', '34'),
(7287, 384, 'P.A.E_BelegPos.Warenwert', '5,40'),
(7288, 384, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7289, 384, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7290, 384, 'P.A.P_Zeichnung.IndexNr', '001'),
(7291, 384, 'P.A.P_ZeichnungSpr.Zeichnung', '80079075'),
(7292, 384, 'P.A.S_Artikel.DIN_ISO', '-'),
(7293, 384, 'P.A.S_Artikel.Werkstoff', '-'),
(7294, 384, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Auflage Matte Seitlich'),
(7295, 384, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7296, 384, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7297, 384, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7298, 385, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(7299, 385, 'P.A..PreisbezugMitME', 'Stk'),
(7300, 385, 'P.A.E_BelegPos.Artikel', '80079066'),
(7301, 385, 'P.A.E_BelegPos.Einzelpreis', '1,80'),
(7302, 385, 'P.A.E_BelegPos.Menge', '3'),
(7303, 385, 'P.A.E_BelegPos.PF_Gewicht', '1,50 kg'),
(7304, 385, 'P.A.E_BelegPos.PositionsNr', '35'),
(7305, 385, 'P.A.E_BelegPos.Warenwert', '5,40'),
(7306, 385, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7307, 385, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7308, 385, 'P.A.P_Zeichnung.IndexNr', '002'),
(7309, 385, 'P.A.P_ZeichnungSpr.Zeichnung', '80079066'),
(7310, 385, 'P.A.S_Artikel.DIN_ISO', '-'),
(7311, 385, 'P.A.S_Artikel.Werkstoff', '-'),
(7312, 385, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Auflage Matte Seitlich spg.'),
(7313, 385, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7314, 385, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(7315, 385, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(7981, 421, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par Gesamtgewicht der 3 Maschinen: 12.100,00Kg\\par\\par ----------\\par }'),
(7982, 421, 'P.A..PreisbezugMitME', 'Stk'),
(7983, 421, 'P.A.E_BelegPos.Artikel', '3812930'),
(7984, 421, 'P.A.E_BelegPos.Einzelpreis', '9,90'),
(7985, 421, 'P.A.E_BelegPos.Menge', '6'),
(7986, 421, 'P.A.E_BelegPos.PF_Gewicht', '16,20 kg'),
(7987, 421, 'P.A.E_BelegPos.PositionsNr', '1'),
(7988, 421, 'P.A.E_BelegPos.Warenwert', '59,40'),
(7989, 421, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(7990, 421, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(7991, 421, 'P.A.P_Zeichnung.IndexNr', '001'),
(7992, 421, 'P.A.P_ZeichnungSpr.Zeichnung', '1335620'),
(7993, 421, 'P.A.S_Artikel.DIN_ISO', '-'),
(7994, 421, 'P.A.S_Artikel.Werkstoff', '-'),
(7995, 421, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Futterblech Siebkasten'),
(7996, 421, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'Lagergehäuse'),
(7997, 421, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '3D-Combi'),
(7998, 421, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(7999, 421, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8000, 421, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8001, 422, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8002, 422, 'P.A..PreisbezugMitME', 'Stk'),
(8003, 422, 'P.A.E_BelegPos.Artikel', '3812931'),
(8004, 422, 'P.A.E_BelegPos.Einzelpreis', '12,80'),
(8005, 422, 'P.A.E_BelegPos.Menge', '3'),
(8006, 422, 'P.A.E_BelegPos.PF_Gewicht', '10,50 kg'),
(8007, 422, 'P.A.E_BelegPos.PositionsNr', '2'),
(8008, 422, 'P.A.E_BelegPos.Warenwert', '38,40'),
(8009, 422, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8010, 422, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8011, 422, 'P.A.P_Zeichnung.IndexNr', '001'),
(8012, 422, 'P.A.P_ZeichnungSpr.Zeichnung', '1335622'),
(8013, 422, 'P.A.S_Artikel.DIN_ISO', '-'),
(8014, 422, 'P.A.S_Artikel.Werkstoff', '-'),
(8015, 422, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Futterblech Motor'),
(8016, 422, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '3D Combi 833+'),
(8017, 422, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8018, 422, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8019, 422, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8020, 423, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8021, 423, 'P.A..PreisbezugMitME', 'Stk'),
(8022, 423, 'P.A.E_BelegPos.Artikel', '3900089'),
(8023, 423, 'P.A.E_BelegPos.Einzelpreis', '11,70'),
(8024, 423, 'P.A.E_BelegPos.Menge', '9'),
(8025, 423, 'P.A.E_BelegPos.PF_Gewicht', '28,80 kg'),
(8026, 423, 'P.A.E_BelegPos.PositionsNr', '3'),
(8027, 423, 'P.A.E_BelegPos.Warenwert', '105,30'),
(8028, 423, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8029, 423, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8030, 423, 'P.A.P_Zeichnung.IndexNr', '003'),
(8031, 423, 'P.A.P_ZeichnungSpr.Zeichnung', '1002276'),
(8032, 423, 'P.A.S_Artikel.DIN_ISO', '-'),
(8033, 423, 'P.A.S_Artikel.Werkstoff', 'S355MC / 1.0978'),
(8034, 423, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Klemmleiste'),
(8035, 423, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'L1390'),
(8036, 423, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8037, 423, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8038, 423, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8039, 424, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8040, 424, 'P.A..PreisbezugMitME', 'Stk'),
(8041, 424, 'P.A.E_BelegPos.Artikel', '3902927'),
(8042, 424, 'P.A.E_BelegPos.Einzelpreis', '352,30'),
(8043, 424, 'P.A.E_BelegPos.Menge', '6'),
(8044, 424, 'P.A.E_BelegPos.PF_Gewicht', '576,00 kg'),
(8045, 424, 'P.A.E_BelegPos.PositionsNr', '4'),
(8046, 424, 'P.A.E_BelegPos.Warenwert', '2.113,80'),
(8047, 424, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8048, 424, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8049, 424, 'P.A.P_Zeichnung.IndexNr', '004'),
(8050, 424, 'P.A.P_ZeichnungSpr.Zeichnung', '1351073'),
(8051, 424, 'P.A.S_Artikel.DIN_ISO', '-'),
(8052, 424, 'P.A.S_Artikel.Werkstoff', 'S355MC / 1.0978'),
(8053, 424, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Schubstange'),
(8054, 424, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'L5450'),
(8055, 424, 'P.A.S_ArtikelSpr.Bezeichnung[3]', 'Terex'),
(8056, 424, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8057, 424, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8058, 424, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8059, 425, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8060, 425, 'P.A..PreisbezugMitME', 'Stk'),
(8061, 425, 'P.A.E_BelegPos.Artikel', '3903239'),
(8062, 425, 'P.A.E_BelegPos.Einzelpreis', '12,50'),
(8063, 425, 'P.A.E_BelegPos.Menge', '3'),
(8064, 425, 'P.A.E_BelegPos.PF_Gewicht', '10,20 kg'),
(8065, 425, 'P.A.E_BelegPos.PositionsNr', '5'),
(8066, 425, 'P.A.E_BelegPos.Warenwert', '37,50'),
(8067, 425, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8068, 425, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8069, 425, 'P.A.P_Zeichnung.IndexNr', '001'),
(8070, 425, 'P.A.P_ZeichnungSpr.Zeichnung', '1454845'),
(8071, 425, 'P.A.S_Artikel.DIN_ISO', '-'),
(8072, 425, 'P.A.S_Artikel.Werkstoff', '-'),
(8073, 425, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Klemmleiste'),
(8074, 425, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'L1450'),
(8075, 425, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8076, 425, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8077, 425, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8078, 426, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8079, 426, 'P.A..PreisbezugMitME', 'Stk'),
(8080, 426, 'P.A.E_BelegPos.Artikel', '80079069'),
(8081, 426, 'P.A.E_BelegPos.Einzelpreis', '2,60'),
(8082, 426, 'P.A.E_BelegPos.Menge', '39'),
(8083, 426, 'P.A.E_BelegPos.PF_Gewicht', '27,30 kg'),
(8084, 426, 'P.A.E_BelegPos.PositionsNr', '6'),
(8085, 426, 'P.A.E_BelegPos.Warenwert', '101,40'),
(8086, 426, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8087, 426, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8088, 426, 'P.A.P_Zeichnung.IndexNr', '000'),
(8089, 426, 'P.A.P_ZeichnungSpr.Zeichnung', '80079069'),
(8090, 426, 'P.A.S_Artikel.DIN_ISO', '-'),
(8091, 426, 'P.A.S_Artikel.Werkstoff', '-'),
(8092, 426, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Winkel AK OB spg.'),
(8093, 426, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8094, 426, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8095, 426, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8096, 427, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8097, 427, 'P.A..PreisbezugMitME', 'Stk'),
(8098, 427, 'P.A.E_BelegPos.Artikel', '80073942'),
(8099, 427, 'P.A.E_BelegPos.Einzelpreis', '5.689,20'),
(8100, 427, 'P.A.E_BelegPos.Menge', '3'),
(8101, 427, 'P.A.E_BelegPos.PF_Gewicht', '4.638,30 kg'),
(8102, 427, 'P.A.E_BelegPos.PositionsNr', '7'),
(8103, 427, 'P.A.E_BelegPos.Warenwert', '17.067,60'),
(8104, 427, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8105, 427, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8106, 427, 'P.A.P_Zeichnung.IndexNr', '003'),
(8107, 427, 'P.A.P_ZeichnungSpr.Zeichnung', '80073942'),
(8108, 427, 'P.A.S_Artikel.DIN_ISO', '-'),
(8109, 427, 'P.A.S_Artikel.Werkstoff', '-'),
(8110, 427, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Siebkasten'),
(8111, 427, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'SZWS 1510x6000'),
(8112, 427, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(8113, 427, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8114, 427, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8115, 427, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8116, 428, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8117, 428, 'P.A..PreisbezugMitME', 'Stk'),
(8118, 428, 'P.A.E_BelegPos.Artikel', '80073945'),
(8119, 428, 'P.A.E_BelegPos.Einzelpreis', '391,20'),
(8120, 428, 'P.A.E_BelegPos.Menge', '3'),
(8121, 428, 'P.A.E_BelegPos.PF_Gewicht', '319,80 kg'),
(8122, 428, 'P.A.E_BelegPos.PositionsNr', '8'),
(8123, 428, 'P.A.E_BelegPos.Warenwert', '1.173,60'),
(8124, 428, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8125, 428, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8126, 428, 'P.A.P_Zeichnung.IndexNr', '001'),
(8127, 428, 'P.A.P_ZeichnungSpr.Zeichnung', '80073945'),
(8128, 428, 'P.A.S_Artikel.DIN_ISO', '-'),
(8129, 428, 'P.A.S_Artikel.Werkstoff', '-'),
(8130, 428, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Aufgabeboden'),
(8131, 428, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'LW1510'),
(8132, 428, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(8133, 428, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8134, 428, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8135, 428, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8136, 429, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8137, 429, 'P.A..PreisbezugMitME', 'Stk'),
(8138, 429, 'P.A.E_BelegPos.Artikel', '80074017'),
(8139, 429, 'P.A.E_BelegPos.Einzelpreis', '94,30'),
(8140, 429, 'P.A.E_BelegPos.Menge', '54'),
(8141, 429, 'P.A.E_BelegPos.PF_Gewicht', '1.387,80 kg'),
(8142, 429, 'P.A.E_BelegPos.PositionsNr', '9'),
(8143, 429, 'P.A.E_BelegPos.Warenwert', '5.092,20'),
(8144, 429, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8145, 429, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8146, 429, 'P.A.P_Zeichnung.IndexNr', '000'),
(8147, 429, 'P.A.P_ZeichnungSpr.Zeichnung', '80074017'),
(8148, 429, 'P.A.S_Artikel.DIN_ISO', '-'),
(8149, 429, 'P.A.S_Artikel.Werkstoff', '-'),
(8150, 429, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Siebtraverse Schwingrahmen FSC'),
(8151, 429, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'LW1510'),
(8152, 429, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(8153, 429, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8154, 429, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8155, 429, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8156, 430, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8157, 430, 'P.A..PreisbezugMitME', 'Stk'),
(8158, 430, 'P.A.E_BelegPos.Artikel', '80074019'),
(8159, 430, 'P.A.E_BelegPos.Einzelpreis', '105,70'),
(8160, 430, 'P.A.E_BelegPos.Menge', '51'),
(8161, 430, 'P.A.E_BelegPos.PF_Gewicht', '1.468,80 kg'),
(8162, 430, 'P.A.E_BelegPos.PositionsNr', '10'),
(8163, 430, 'P.A.E_BelegPos.Warenwert', '5.390,70'),
(8164, 430, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8165, 430, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8166, 430, 'P.A.P_Zeichnung.IndexNr', '000'),
(8167, 430, 'P.A.P_ZeichnungSpr.Zeichnung', '80074019'),
(8168, 430, 'P.A.S_Artikel.DIN_ISO', '-'),
(8169, 430, 'P.A.S_Artikel.Werkstoff', '-'),
(8170, 430, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Siebtraverse Grundrahmen FSC'),
(8171, 430, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'LW 1510'),
(8172, 430, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '683+'),
(8173, 430, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8174, 430, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8175, 430, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8176, 431, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8177, 431, 'P.A..PreisbezugMitME', 'Stk'),
(8178, 431, 'P.A.E_BelegPos.Artikel', '80074067'),
(8179, 431, 'P.A.E_BelegPos.Einzelpreis', '236,40'),
(8180, 431, 'P.A.E_BelegPos.Menge', '3'),
(8181, 431, 'P.A.E_BelegPos.PF_Gewicht', '193,20 kg'),
(8182, 431, 'P.A.E_BelegPos.PositionsNr', '11'),
(8183, 431, 'P.A.E_BelegPos.Warenwert', '709,20'),
(8184, 431, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8185, 431, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8186, 431, 'P.A.P_Zeichnung.IndexNr', '000'),
(8187, 431, 'P.A.P_ZeichnungSpr.Zeichnung', '80074067'),
(8188, 431, 'P.A.S_Artikel.DIN_ISO', '-'),
(8189, 431, 'P.A.S_Artikel.Werkstoff', '-'),
(8190, 431, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Siebtraverse Grundrahmen Abgab'),
(8191, 431, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'LW 1510'),
(8192, 431, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8193, 431, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8194, 431, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8195, 432, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8196, 432, 'P.A..PreisbezugMitME', 'Stk'),
(8197, 432, 'P.A.E_BelegPos.Artikel', '80074071'),
(8198, 432, 'P.A.E_BelegPos.Einzelpreis', '432,00'),
(8199, 432, 'P.A.E_BelegPos.Menge', '3'),
(8200, 432, 'P.A.E_BelegPos.PF_Gewicht', '353,10 kg'),
(8201, 432, 'P.A.E_BelegPos.PositionsNr', '12'),
(8202, 432, 'P.A.E_BelegPos.Warenwert', '1.296,00'),
(8203, 432, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8204, 432, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8205, 432, 'P.A.P_Zeichnung.IndexNr', '001'),
(8206, 432, 'P.A.P_ZeichnungSpr.Zeichnung', '80074071'),
(8207, 432, 'P.A.S_Artikel.DIN_ISO', '-'),
(8208, 432, 'P.A.S_Artikel.Werkstoff', '-'),
(8209, 432, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Siebtraverse Abgabe'),
(8210, 432, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'LW 1510'),
(8211, 432, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8212, 432, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8213, 432, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8214, 433, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8215, 433, 'P.A..PreisbezugMitME', 'Stk'),
(8216, 433, 'P.A.E_BelegPos.Artikel', '80074103'),
(8217, 433, 'P.A.E_BelegPos.Einzelpreis', '7,70'),
(8218, 433, 'P.A.E_BelegPos.Menge', '6'),
(8219, 433, 'P.A.E_BelegPos.PF_Gewicht', '12,60 kg'),
(8220, 433, 'P.A.E_BelegPos.PositionsNr', '13'),
(8221, 433, 'P.A.E_BelegPos.Warenwert', '46,20'),
(8222, 433, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8223, 433, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8224, 433, 'P.A.P_Zeichnung.IndexNr', '000'),
(8225, 433, 'P.A.P_ZeichnungSpr.Zeichnung', '80074103'),
(8226, 433, 'P.A.S_Artikel.DIN_ISO', '-'),
(8227, 433, 'P.A.S_Artikel.Werkstoff', '-'),
(8228, 433, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Winkel Halter Rückwand'),
(8229, 433, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(8230, 433, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8231, 433, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8232, 433, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8233, 434, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8234, 434, 'P.A..PreisbezugMitME', 'Stk'),
(8235, 434, 'P.A.E_BelegPos.Artikel', '80074105'),
(8236, 434, 'P.A.E_BelegPos.Einzelpreis', '250,30'),
(8237, 434, 'P.A.E_BelegPos.Menge', '3'),
(8238, 434, 'P.A.E_BelegPos.PF_Gewicht', '204,90 kg'),
(8239, 434, 'P.A.E_BelegPos.PositionsNr', '14'),
(8240, 434, 'P.A.E_BelegPos.Warenwert', '750,90'),
(8241, 434, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8242, 434, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8243, 434, 'P.A.P_Zeichnung.IndexNr', '003'),
(8244, 434, 'P.A.P_ZeichnungSpr.Zeichnung', '80074105'),
(8245, 434, 'P.A.S_Artikel.DIN_ISO', '-'),
(8246, 434, 'P.A.S_Artikel.Werkstoff', '-'),
(8247, 434, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Rückwand'),
(8248, 434, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(8249, 434, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8250, 434, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8251, 434, 'P.A.S_WaehrungSpr.Kurzbez', '€');
INSERT INTO `inventory_meta` (`id`, `order_part_id`, `meta_key`, `meta_val`) VALUES
(8252, 435, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par\\par }'),
(8253, 435, 'P.A..PreisbezugMitME', 'Stk'),
(8254, 435, 'P.A.E_BelegPos.Artikel', '80074121'),
(8255, 435, 'P.A.E_BelegPos.Einzelpreis', '41,50'),
(8256, 435, 'P.A.E_BelegPos.Menge', '18'),
(8257, 435, 'P.A.E_BelegPos.PF_Gewicht', '203,40 kg'),
(8258, 435, 'P.A.E_BelegPos.PositionsNr', '15'),
(8259, 435, 'P.A.E_BelegPos.Warenwert', '747,00'),
(8260, 435, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8261, 435, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8262, 435, 'P.A.P_Zeichnung.IndexNr', '000'),
(8263, 435, 'P.A.P_ZeichnungSpr.Zeichnung', '80074121'),
(8264, 435, 'P.A.S_Artikel.DIN_ISO', '-'),
(8265, 435, 'P.A.S_Artikel.Werkstoff', '-'),
(8266, 435, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Klemmleiste'),
(8267, 435, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'Siebdurchgang'),
(8268, 435, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(8269, 435, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8270, 435, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8271, 435, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8272, 436, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8273, 436, 'P.A..PreisbezugMitME', 'Stk'),
(8274, 436, 'P.A.E_BelegPos.Artikel', '80076877'),
(8275, 436, 'P.A.E_BelegPos.Einzelpreis', '120,00'),
(8276, 436, 'P.A.E_BelegPos.Menge', '6'),
(8277, 436, 'P.A.E_BelegPos.PF_Gewicht', '196,20 kg'),
(8278, 436, 'P.A.E_BelegPos.PositionsNr', '16'),
(8279, 436, 'P.A.E_BelegPos.Warenwert', '720,00'),
(8280, 436, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8281, 436, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8282, 436, 'P.A.P_Zeichnung.IndexNr', '000'),
(8283, 436, 'P.A.P_ZeichnungSpr.Zeichnung', '80076877'),
(8284, 436, 'P.A.S_Artikel.DIN_ISO', '-'),
(8285, 436, 'P.A.S_Artikel.Werkstoff', '-'),
(8286, 436, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Konsole Verlagerung fb'),
(8287, 436, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'ø114'),
(8288, 436, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8289, 436, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8290, 436, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8291, 437, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8292, 437, 'P.A..PreisbezugMitME', 'Stk'),
(8293, 437, 'P.A.E_BelegPos.Artikel', '80078596'),
(8294, 437, 'P.A.E_BelegPos.Einzelpreis', '81,50'),
(8295, 437, 'P.A.E_BelegPos.Menge', '12'),
(8296, 437, 'P.A.E_BelegPos.PF_Gewicht', '266,40 kg'),
(8297, 437, 'P.A.E_BelegPos.PositionsNr', '17'),
(8298, 437, 'P.A.E_BelegPos.Warenwert', '978,00'),
(8299, 437, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8300, 437, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8301, 437, 'P.A.P_Zeichnung.IndexNr', '001'),
(8302, 437, 'P.A.P_ZeichnungSpr.Zeichnung', '80078596'),
(8303, 437, 'P.A.S_Artikel.DIN_ISO', '-'),
(8304, 437, 'P.A.S_Artikel.Werkstoff', '-'),
(8305, 437, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Verdrehbare Verlagerung'),
(8306, 437, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'ø114'),
(8307, 437, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(8308, 437, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8309, 437, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8310, 437, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8311, 438, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8312, 438, 'P.A..PreisbezugMitME', 'Stk'),
(8313, 438, 'P.A.E_BelegPos.Artikel', '80078710'),
(8314, 438, 'P.A.E_BelegPos.Einzelpreis', '247,00'),
(8315, 438, 'P.A.E_BelegPos.Menge', '3'),
(8316, 438, 'P.A.E_BelegPos.PF_Gewicht', '201,90 kg'),
(8317, 438, 'P.A.E_BelegPos.PositionsNr', '18'),
(8318, 438, 'P.A.E_BelegPos.Warenwert', '741,00'),
(8319, 438, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8320, 438, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8321, 438, 'P.A.P_Zeichnung.IndexNr', '001'),
(8322, 438, 'P.A.P_ZeichnungSpr.Zeichnung', '80078710'),
(8323, 438, 'P.A.S_Artikel.DIN_ISO', '-'),
(8324, 438, 'P.A.S_Artikel.Werkstoff', '-'),
(8325, 438, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Vorfertigung Terex Schutzhaube'),
(8326, 438, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8327, 438, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8328, 438, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8329, 439, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8330, 439, 'P.A..PreisbezugMitME', 'Stk'),
(8331, 439, 'P.A.E_BelegPos.Artikel', '80078716'),
(8332, 439, 'P.A.E_BelegPos.Einzelpreis', '241,50'),
(8333, 439, 'P.A.E_BelegPos.Menge', '3'),
(8334, 439, 'P.A.E_BelegPos.PF_Gewicht', '197,40 kg'),
(8335, 439, 'P.A.E_BelegPos.PositionsNr', '19'),
(8336, 439, 'P.A.E_BelegPos.Warenwert', '724,50'),
(8337, 439, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8338, 439, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8339, 439, 'P.A.P_Zeichnung.IndexNr', '001'),
(8340, 439, 'P.A.P_ZeichnungSpr.Zeichnung', '80078716'),
(8341, 439, 'P.A.S_Artikel.DIN_ISO', '-'),
(8342, 439, 'P.A.S_Artikel.Werkstoff', '-'),
(8343, 439, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Vorfertigung Terex Schutzhaube'),
(8344, 439, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8345, 439, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8346, 439, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8347, 440, 'P.A..PreisbezugMitME', 'Stk'),
(8348, 440, 'P.A.E_BelegPos.Artikel', '80078997'),
(8349, 440, 'P.A.E_BelegPos.Einzelpreis', '15,00'),
(8350, 440, 'P.A.E_BelegPos.Menge', '18'),
(8351, 440, 'P.A.E_BelegPos.PF_Gewicht', '73,80 kg'),
(8352, 440, 'P.A.E_BelegPos.PositionsNr', '20'),
(8353, 440, 'P.A.E_BelegPos.Warenwert', '270,00'),
(8354, 440, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8355, 440, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8356, 440, 'P.A.P_Zeichnung.IndexNr', '000'),
(8357, 440, 'P.A.P_ZeichnungSpr.Zeichnung', '80078997'),
(8358, 440, 'P.A.S_Artikel.DIN_ISO', '-'),
(8359, 440, 'P.A.S_Artikel.Werkstoff', '-'),
(8360, 440, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Klemmleiste'),
(8361, 440, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'L1890'),
(8362, 440, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8363, 440, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8364, 440, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8365, 441, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8366, 441, 'P.A..PreisbezugMitME', 'Stk'),
(8367, 441, 'P.A.E_BelegPos.Artikel', '80079015'),
(8368, 441, 'P.A.E_BelegPos.Einzelpreis', '14,30'),
(8369, 441, 'P.A.E_BelegPos.Menge', '3'),
(8370, 441, 'P.A.E_BelegPos.PF_Gewicht', '11,70 kg'),
(8371, 441, 'P.A.E_BelegPos.PositionsNr', '21'),
(8372, 441, 'P.A.E_BelegPos.Warenwert', '42,90'),
(8373, 441, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8374, 441, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8375, 441, 'P.A.P_Zeichnung.IndexNr', '000'),
(8376, 441, 'P.A.P_ZeichnungSpr.Zeichnung', '80079015'),
(8377, 441, 'P.A.S_Artikel.DIN_ISO', '-'),
(8378, 441, 'P.A.S_Artikel.Werkstoff', '-'),
(8379, 441, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Klemmleiste'),
(8380, 441, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'L1450'),
(8381, 441, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8382, 441, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8383, 441, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8384, 442, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8385, 442, 'P.A..PreisbezugMitME', 'Stk'),
(8386, 442, 'P.A.E_BelegPos.Artikel', '80079020'),
(8387, 442, 'P.A.E_BelegPos.Einzelpreis', '411,10'),
(8388, 442, 'P.A.E_BelegPos.Menge', '3'),
(8389, 442, 'P.A.E_BelegPos.PF_Gewicht', '339,00 kg'),
(8390, 442, 'P.A.E_BelegPos.PositionsNr', '22'),
(8391, 442, 'P.A.E_BelegPos.Warenwert', '1.233,30'),
(8392, 442, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8393, 442, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8394, 442, 'P.A.P_Zeichnung.IndexNr', '001'),
(8395, 442, 'P.A.P_ZeichnungSpr.Zeichnung', '80079020'),
(8396, 442, 'P.A.S_Artikel.DIN_ISO', '-'),
(8397, 442, 'P.A.S_Artikel.Werkstoff', '-'),
(8398, 442, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Siebtraverse Grundrahmen Abgab'),
(8399, 442, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'LW 1510'),
(8400, 442, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8401, 442, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8402, 442, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8403, 443, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8404, 443, 'P.A..PreisbezugMitME', 'Stk'),
(8405, 443, 'P.A.E_BelegPos.Artikel', '80079041'),
(8406, 443, 'P.A.E_BelegPos.Einzelpreis', '3,70'),
(8407, 443, 'P.A.E_BelegPos.Menge', '54'),
(8408, 443, 'P.A.E_BelegPos.PF_Gewicht', '54,00 kg'),
(8409, 443, 'P.A.E_BelegPos.PositionsNr', '23'),
(8410, 443, 'P.A.E_BelegPos.Warenwert', '199,80'),
(8411, 443, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8412, 443, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8413, 443, 'P.A.P_Zeichnung.IndexNr', '000'),
(8414, 443, 'P.A.P_ZeichnungSpr.Zeichnung', '80079041'),
(8415, 443, 'P.A.S_Artikel.DIN_ISO', '-'),
(8416, 443, 'P.A.S_Artikel.Werkstoff', '-'),
(8417, 443, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Futterblech'),
(8418, 443, 'P.A.S_ArtikelSpr.Bezeichnung[3]', 'Schwingtraverse 693+'),
(8419, 443, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8420, 443, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8421, 443, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8422, 444, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8423, 444, 'P.A..PreisbezugMitME', 'Stk'),
(8424, 444, 'P.A.E_BelegPos.Artikel', '80079043'),
(8425, 444, 'P.A.E_BelegPos.Einzelpreis', '19,50'),
(8426, 444, 'P.A.E_BelegPos.Menge', '12'),
(8427, 444, 'P.A.E_BelegPos.PF_Gewicht', '64,80 kg'),
(8428, 444, 'P.A.E_BelegPos.PositionsNr', '24'),
(8429, 444, 'P.A.E_BelegPos.Warenwert', '234,00'),
(8430, 444, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8431, 444, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8432, 444, 'P.A.P_Zeichnung.IndexNr', '000'),
(8433, 444, 'P.A.P_ZeichnungSpr.Zeichnung', '80079043'),
(8434, 444, 'P.A.S_Artikel.DIN_ISO', '-'),
(8435, 444, 'P.A.S_Artikel.Werkstoff', '-'),
(8436, 444, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Transportsicherung'),
(8437, 444, 'P.A.S_ArtikelSpr.Bezeichnung[3]', '693+'),
(8438, 444, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8439, 444, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8440, 444, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8441, 445, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8442, 445, 'P.A..PreisbezugMitME', 'Stk'),
(8443, 445, 'P.A.E_BelegPos.Artikel', '80079046'),
(8444, 445, 'P.A.E_BelegPos.Einzelpreis', '8,10'),
(8445, 445, 'P.A.E_BelegPos.Menge', '3'),
(8446, 445, 'P.A.E_BelegPos.PF_Gewicht', '6,60 kg'),
(8447, 445, 'P.A.E_BelegPos.PositionsNr', '25'),
(8448, 445, 'P.A.E_BelegPos.Warenwert', '24,30'),
(8449, 445, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8450, 445, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8451, 445, 'P.A.P_Zeichnung.IndexNr', '001'),
(8452, 445, 'P.A.P_ZeichnungSpr.Zeichnung', '80079046'),
(8453, 445, 'P.A.S_Artikel.DIN_ISO', '-'),
(8454, 445, 'P.A.S_Artikel.Werkstoff', '-'),
(8455, 445, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Abdichtung Aufgabe'),
(8456, 445, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8457, 445, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8458, 445, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8459, 446, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8460, 446, 'P.A..PreisbezugMitME', 'Stk'),
(8461, 446, 'P.A.E_BelegPos.Artikel', '80079064'),
(8462, 446, 'P.A.E_BelegPos.Einzelpreis', '8,10'),
(8463, 446, 'P.A.E_BelegPos.Menge', '3'),
(8464, 446, 'P.A.E_BelegPos.PF_Gewicht', '6,60 kg'),
(8465, 446, 'P.A.E_BelegPos.PositionsNr', '26'),
(8466, 446, 'P.A.E_BelegPos.Warenwert', '24,30'),
(8467, 446, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8468, 446, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8469, 446, 'P.A.P_Zeichnung.IndexNr', '001'),
(8470, 446, 'P.A.P_ZeichnungSpr.Zeichnung', '80079064'),
(8471, 446, 'P.A.S_Artikel.DIN_ISO', '-'),
(8472, 446, 'P.A.S_Artikel.Werkstoff', '-'),
(8473, 446, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Abdichtung Aufgabe spg.'),
(8474, 446, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8475, 446, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8476, 446, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8477, 447, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8478, 447, 'P.A..PreisbezugMitME', 'Stk'),
(8479, 447, 'P.A.E_BelegPos.Artikel', '80079065'),
(8480, 447, 'P.A.E_BelegPos.Einzelpreis', '2,90'),
(8481, 447, 'P.A.E_BelegPos.Menge', '3'),
(8482, 447, 'P.A.E_BelegPos.PF_Gewicht', '2,40 kg'),
(8483, 447, 'P.A.E_BelegPos.PositionsNr', '27'),
(8484, 447, 'P.A.E_BelegPos.Warenwert', '8,70'),
(8485, 447, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8486, 447, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8487, 447, 'P.A.P_Zeichnung.IndexNr', '000'),
(8488, 447, 'P.A.P_ZeichnungSpr.Zeichnung', '80079065'),
(8489, 447, 'P.A.S_Artikel.DIN_ISO', '-'),
(8490, 447, 'P.A.S_Artikel.Werkstoff', '-'),
(8491, 447, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Winkel AK OB 2 spg.'),
(8492, 447, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8493, 447, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8494, 447, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8495, 448, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8496, 448, 'P.A..PreisbezugMitME', 'Stk'),
(8497, 448, 'P.A.E_BelegPos.Artikel', '80079074'),
(8498, 448, 'P.A.E_BelegPos.Einzelpreis', '2,90'),
(8499, 448, 'P.A.E_BelegPos.Menge', '3'),
(8500, 448, 'P.A.E_BelegPos.PF_Gewicht', '2,40 kg'),
(8501, 448, 'P.A.E_BelegPos.PositionsNr', '28'),
(8502, 448, 'P.A.E_BelegPos.Warenwert', '8,70'),
(8503, 448, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8504, 448, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8505, 448, 'P.A.P_Zeichnung.IndexNr', '000'),
(8506, 448, 'P.A.P_ZeichnungSpr.Zeichnung', '80079074'),
(8507, 448, 'P.A.S_Artikel.DIN_ISO', '-'),
(8508, 448, 'P.A.S_Artikel.Werkstoff', '-'),
(8509, 448, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Winkel AK OB 2'),
(8510, 448, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8511, 448, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8512, 448, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8513, 449, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8514, 449, 'P.A..PreisbezugMitME', 'Stk'),
(8515, 449, 'P.A.E_BelegPos.Artikel', '80079076'),
(8516, 449, 'P.A.E_BelegPos.Einzelpreis', '2,60'),
(8517, 449, 'P.A.E_BelegPos.Menge', '39'),
(8518, 449, 'P.A.E_BelegPos.PF_Gewicht', '27,30 kg'),
(8519, 449, 'P.A.E_BelegPos.PositionsNr', '29'),
(8520, 449, 'P.A.E_BelegPos.Warenwert', '101,40'),
(8521, 449, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8522, 449, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8523, 449, 'P.A.P_Zeichnung.IndexNr', '000'),
(8524, 449, 'P.A.P_ZeichnungSpr.Zeichnung', '80079076'),
(8525, 449, 'P.A.S_Artikel.DIN_ISO', '-'),
(8526, 449, 'P.A.S_Artikel.Werkstoff', '-'),
(8527, 449, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Winkel AK OB'),
(8528, 449, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8529, 449, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8530, 449, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8531, 450, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par\\par }'),
(8532, 450, 'P.A..PreisbezugMitME', 'Stk'),
(8533, 450, 'P.A.E_BelegPos.Artikel', '80079083'),
(8534, 450, 'P.A.E_BelegPos.Einzelpreis', '120,00'),
(8535, 450, 'P.A.E_BelegPos.Menge', '6'),
(8536, 450, 'P.A.E_BelegPos.PF_Gewicht', '196,20 kg'),
(8537, 450, 'P.A.E_BelegPos.PositionsNr', '30'),
(8538, 450, 'P.A.E_BelegPos.Warenwert', '720,00'),
(8539, 450, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8540, 450, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8541, 450, 'P.A.P_Zeichnung.IndexNr', '000'),
(8542, 450, 'P.A.P_ZeichnungSpr.Zeichnung', '80079083'),
(8543, 450, 'P.A.S_Artikel.DIN_ISO', '-'),
(8544, 450, 'P.A.S_Artikel.Werkstoff', '-'),
(8545, 450, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Konsole Verlagerung Fa'),
(8546, 450, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'ø114'),
(8547, 450, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8548, 450, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8549, 450, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8550, 451, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8551, 451, 'P.A..PreisbezugMitME', 'Stk'),
(8552, 451, 'P.A.E_BelegPos.Artikel', '80079089'),
(8553, 451, 'P.A.E_BelegPos.Einzelpreis', '39,30'),
(8554, 451, 'P.A.E_BelegPos.Menge', '12'),
(8555, 451, 'P.A.E_BelegPos.PF_Gewicht', '128,40 kg'),
(8556, 451, 'P.A.E_BelegPos.PositionsNr', '31'),
(8557, 451, 'P.A.E_BelegPos.Warenwert', '471,60'),
(8558, 451, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8559, 451, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8560, 451, 'P.A.P_Zeichnung.IndexNr', '000'),
(8561, 451, 'P.A.P_ZeichnungSpr.Zeichnung', '80079089'),
(8562, 451, 'P.A.S_Artikel.DIN_ISO', '-'),
(8563, 451, 'P.A.S_Artikel.Werkstoff', '-'),
(8564, 451, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Transportöse inkl. Schrauben'),
(8565, 451, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'Typ SEWU'),
(8566, 451, 'P.A.S_ArtikelSpr.Bezeichnung[3]', 'schmale Ausführung'),
(8567, 451, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8568, 451, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8569, 451, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8570, 452, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8571, 452, 'P.A..PreisbezugMitME', 'Stk'),
(8572, 452, 'P.A.E_BelegPos.Artikel', '80082966'),
(8573, 452, 'P.A.E_BelegPos.Einzelpreis', '352,70'),
(8574, 452, 'P.A.E_BelegPos.Menge', '6'),
(8575, 452, 'P.A.E_BelegPos.PF_Gewicht', '576,60 kg'),
(8576, 452, 'P.A.E_BelegPos.PositionsNr', '32'),
(8577, 452, 'P.A.E_BelegPos.Warenwert', '2.116,20'),
(8578, 452, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8579, 452, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8580, 452, 'P.A.P_Zeichnung.IndexNr', '000'),
(8581, 452, 'P.A.P_ZeichnungSpr.Zeichnung', '80082966'),
(8582, 452, 'P.A.S_Artikel.DIN_ISO', '-'),
(8583, 452, 'P.A.S_Artikel.Werkstoff', '-'),
(8584, 452, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Schubstange'),
(8585, 452, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'L5450'),
(8586, 452, 'P.A.S_ArtikelSpr.Bezeichnung[3]', 'Terex'),
(8587, 452, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8588, 452, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8589, 452, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8590, 453, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par\\pard\\itap0\\nowidctlpar\\par }'),
(8591, 453, 'P.A..PreisbezugMitME', 'Stk'),
(8592, 453, 'P.A.E_BelegPos.Artikel', '80044766'),
(8593, 453, 'P.A.E_BelegPos.Einzelpreis', '7,70'),
(8594, 453, 'P.A.E_BelegPos.Menge', '114'),
(8595, 453, 'P.A.E_BelegPos.PF_Gewicht', '239,40 kg'),
(8596, 453, 'P.A.E_BelegPos.PositionsNr', '33'),
(8597, 453, 'P.A.E_BelegPos.Warenwert', '877,80'),
(8598, 453, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8599, 453, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8600, 453, 'P.A.P_Zeichnung.IndexNr', '000'),
(8601, 453, 'P.A.P_ZeichnungSpr.Zeichnung', '80044766'),
(8602, 453, 'P.A.S_Artikel.DIN_ISO', '-'),
(8603, 453, 'P.A.S_Artikel.Werkstoff', '-'),
(8604, 453, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Vorrichtung Traverse FSC-Tech'),
(8605, 453, 'P.A.S_ArtikelSpr.Bezeichnung[2]', 'kurz'),
(8606, 453, 'P.A.S_ArtikelSpr.Bezeichnung[3]', 'Fine Side Cover'),
(8607, 453, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8608, 453, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8609, 453, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8610, 454, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8611, 454, 'P.A..PreisbezugMitME', 'Stk'),
(8612, 454, 'P.A.E_BelegPos.Artikel', '80079075'),
(8613, 454, 'P.A.E_BelegPos.Einzelpreis', '1,80'),
(8614, 454, 'P.A.E_BelegPos.Menge', '3'),
(8615, 454, 'P.A.E_BelegPos.PF_Gewicht', '1,50 kg'),
(8616, 454, 'P.A.E_BelegPos.PositionsNr', '34'),
(8617, 454, 'P.A.E_BelegPos.Warenwert', '5,40'),
(8618, 454, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8619, 454, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8620, 454, 'P.A.P_Zeichnung.IndexNr', '001'),
(8621, 454, 'P.A.P_ZeichnungSpr.Zeichnung', '80079075'),
(8622, 454, 'P.A.S_Artikel.DIN_ISO', '-'),
(8623, 454, 'P.A.S_Artikel.Werkstoff', '-'),
(8624, 454, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Auflage Matte Seitlich'),
(8625, 454, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8626, 454, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8627, 454, 'P.A.S_WaehrungSpr.Kurzbez', '€'),
(8628, 455, 'P.A..EBELP', '{\\rtf1\\ansi\\ansicpg1252\\uc1\\deff0{\\fonttbl{\\f0\\fswiss\\fcharset0\\fprq2 Arial;}{\\f1\\froman\\fcharset2\\fprq2 Symbol;}}{\\colortbl;\\red0\\green0\\blue0;\\red255\\green255\\blue255;}{\\stylesheet{\\s0\\itap0\\nowidctlpar\\f0\\fs24 [Normal];}{\\*\\cs10\\additive Default Paragraph Font;}}{\\*\\generator TX_RTF32 14.0.520.503;}\\deftab1134\\paperw11907\\paperh32767\\margl0\\margt1440\\margr0\\margb1440\\widowctrl\\formshade{\\*\\background{\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbxignore\\shpbymargin\\shpbyignore\\shpwr0\\shpwrk0\\shpfblwtxt1\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv 16777215}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn fBackground}{\\sv 1}}{\\sp{\\sn fLayoutInCell}{\\sv 1}}}}}\\sectd\\headery720\\footery720\\pgwsxn11907\\pghsxn32767\\marglsxn0\\margtsxn1440\\margrsxn0\\margbsxn1440\\pard\\itap0\\nowidctlpar\\plain\\f0\\fs20 Komplettfertigung nach Zeichnung inkl. Material und grundieren\\par }'),
(8629, 455, 'P.A..PreisbezugMitME', 'Stk'),
(8630, 455, 'P.A.E_BelegPos.Artikel', '80079066'),
(8631, 455, 'P.A.E_BelegPos.Einzelpreis', '1,80'),
(8632, 455, 'P.A.E_BelegPos.Menge', '3'),
(8633, 455, 'P.A.E_BelegPos.PF_Gewicht', '1,50 kg'),
(8634, 455, 'P.A.E_BelegPos.PositionsNr', '35'),
(8635, 455, 'P.A.E_BelegPos.Warenwert', '5,40'),
(8636, 455, 'P.A.E_BelegPos.wert_RZ_2', '0,00'),
(8637, 455, 'P.A.E_BelegPos.WunschTermin', '21.08.2020'),
(8638, 455, 'P.A.P_Zeichnung.IndexNr', '002'),
(8639, 455, 'P.A.P_ZeichnungSpr.Zeichnung', '80079066'),
(8640, 455, 'P.A.S_Artikel.DIN_ISO', '-'),
(8641, 455, 'P.A.S_Artikel.Werkstoff', '-'),
(8642, 455, 'P.A.S_ArtikelSpr.Bezeichnung[1]', 'Auflage Matte Seitlich spg.'),
(8643, 455, 'P.A.S_MengenEinheitSpr.KurzBez', 'Stk'),
(8644, 455, 'P.A.S_PreisEinheitSpr.KurzBez', 'E'),
(8645, 455, 'P.A.S_WaehrungSpr.Kurzbez', '€');

-- --------------------------------------------------------

--
-- Stand-in structure for view `inventory_wmeta`
-- (See below for the actual view)
--
CREATE TABLE `inventory_wmeta` (
`catalog_id` int
,`currency` varchar(10)
,`design` text
,`id` int
,`name` tinytext
,`order` int
,`partid` text
,`qty` float(10,2)
,`total_price` float(10,2)
,`um` varchar(45)
,`unit_price` float(10,2)
,`vat_proc` float(10,2)
,`vat_value` float(10,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `codcor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`codcor`, `name`) VALUES
('721410', 'Lacatus mecanic'),
('332201', 'Reprezentant tehnic'),
('311306', 'Tehnician energetician/electrician');

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
-- Table structure for table `operations`
--

CREATE TABLE `operations` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `hourly_price` float(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `operations`
--

INSERT INTO `operations` (`id`, `name`, `desc`, `hourly_price`, `currency`) VALUES
(1, 'sudura', '', 10.00, 'EUR'),
(2, 'lacatuserie', '', 10.00, 'EUR'),
(3, 'taiere plasma', '', 10.00, 'EUR'),
(4, 'taiere CNC', '', 10.00, 'EUR');

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
  `created_by` varchar(20) DEFAULT NULL,
  `team` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`oid`, `label`, `state`, `doc_id`, `partner_id`, `created_on`, `startwork_on`, `readytodeliver_on`, `closed_on`, `order_value`, `calculated_value`, `final_value`, `currency`, `meta`, `created_by`, `team`) VALUES
(11, 'new', 'ord', 72, 1, '2021-05-25 09:49:36', NULL, NULL, NULL, 44236.50, NULL, NULL, NULL, NULL, 'vsergiu', 2),
(13, '3 Stück Terex 693+ LA-00024159', 'ord', 74, 1, '2021-05-25 09:53:26', NULL, NULL, NULL, 44236.50, NULL, NULL, NULL, NULL, 'vsergiu', NULL);

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `create_document` BEFORE INSERT ON `orders` FOR EACH ROW ##################################################################################
BEGIN
	IF(NEW.doc_id IS NULL) THEN
		SELECT id, series,lastissued+1 into @settid,@ser,@num FROM `settings_document_numbers` where type="order" and validfrom<CURRENT_TIMESTAMP() and validto>CURRENT_TIMESTAMP() and (maxval is NULL or lastissued<maxval) LIMIT 0,1;
    	UPDATE `settings_document_numbers` SET lastissued=@num WHERE id=@settid;
    	INSERT INTO documents(docnum,userid,partners_id,type) VALUES(CONCAT(@ser,@num),NEW.created_by,NEW.partner_id,'order');
    	SET NEW.doc_id=LAST_INSERT_ID();
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

--
-- Dumping data for table `orders_2_employees`
--

INSERT INTO `orders_2_employees` (`id`, `orderid`, `emplid`, `operation`, `hourlyrate`, `currency`) VALUES
(4, 13, 1, 2, 2, 'CHF'),
(5, 11, 1, 1, 2, 'CHF'),
(7, 11, 9, 2, 22, 'EUR'),
(8, 11, 9, 3, 22, 'EUR'),
(9, 13, 9, 4, 22, 'EUR'),
(10, 13, 9, 2, 22, 'EUR'),
(11, 11, 9, 1, 10, 'EUR');

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
,`created_by` varchar(20)
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

--
-- Dumping data for table `orders_meta`
--

INSERT INTO `orders_meta` (`id`, `order_id`, `meta_key`, `meta_val`) VALUES
(1, 13, 'K.F.E_BelegKopf.BelegDatum', '08.07.2020'),
(2, 13, 'K.F.E_BelegKopf.BelegNummer', '273403'),
(3, 13, 'K.E..EBELK', ''),
(4, 13, 'K.E.Best_Adresse.PF_AdrRow1', 'Spaleck S.r.l.'),
(5, 13, 'K.E.Best_Adresse.PF_AdrRow2', ''),
(6, 13, 'K.E.Best_Adresse.PF_AdrRow3', 'Str. Castanilor Nr. 113'),
(7, 13, 'K.E.Best_Adresse.PF_AdrRow4', 'RO -   Resita, Caras Severin'),
(8, 13, 'K.E.Best_Adresse.PF_AdrRow5', ''),
(9, 13, 'K.E.Best_Adresse.PF_AdrRow6', ''),
(10, 13, 'K.E.Best_Adresse.PF_AdrRow7', ''),
(11, 13, 'K.E.Best_Adresse.PF_AdrRow8', ''),
(12, 13, 'K.E.Best_Adresse.PF_AdrRow9', ''),
(13, 13, 'K.E.BU_Benutzer.EMail', ''),
(14, 13, 'K.E.BU_Benutzer.Name', 'Christopher Mathmann'),
(15, 13, 'K.E.BU_Benutzer.Telefon', '0 28 71 / 21 34 -'),
(16, 13, 'K.E.E_BelegKopf.BelegDatum', '08.07.2020'),
(17, 13, 'K.E.E_BelegKopf.BelegInfo', '3 Stück Terex 693+ LA-00024159'),
(18, 13, 'K.E.E_BelegKopf.BelegNummer', '273403'),
(19, 13, 'K.E.E_BelegKopf.Bemerkung[1]', ''),
(20, 13, 'K.E.E_BelegKopf.Bemerkung[2]', ''),
(21, 13, 'K.E.E_BelegKopf.Bemerkung[3]', ''),
(22, 13, 'K.E.E_BelegKopf.Empfaenger', 'Herr Leonard Leinstein'),
(23, 13, 'K.E.E_BelegKopf.KopfText[1]', ''),
(24, 13, 'K.E.E_BelegKopf.KopfText[2]', ''),
(25, 13, 'K.E.E_BelegKopf.KopfText[3]', ''),
(26, 13, 'K.E.E_BelegKopf.KopfText[4]', ''),
(27, 13, 'K.E.E_BelegKopf.Lieferant', '82684'),
(28, 13, 'K.E.E_BelegKopf.LieferHinweis', ''),
(29, 13, 'K.E.Lief_Adresse.PF_AdrRow1', 'Spaleck GmbH & Co. KG'),
(30, 13, 'K.E.Lief_Adresse.PF_AdrRow2', ''),
(31, 13, 'K.E.Lief_Adresse.PF_AdrRow3', 'Robert-Bosch-Straße 15'),
(32, 13, 'K.E.Lief_Adresse.PF_AdrRow4', 'DE -  46397 Bocholt'),
(33, 13, 'K.E.Lief_Adresse.PF_AdrRow5', ''),
(34, 13, 'K.E.Lief_Adresse.PF_AdrRow6', ''),
(35, 13, 'K.E.Lief_Adresse.PF_AdrRow7', ''),
(36, 13, 'K.E.Lief_Adresse.PF_AdrRow8', ''),
(37, 13, 'K.E.Lief_Adresse.PF_AdrRow9', ''),
(38, 13, 'K.E.S_Adresse.Telefax', ''),
(39, 13, 'K.E.S_Lieferant.Kundennummer', ''),
(40, 13, 'S.S..FinalAmount_AsOptions', '44.236,50'),
(41, 13, 'S.S..SLIEX', ''),
(42, 13, 'S.S..SLIEY', ''),
(43, 13, 'S.S..SurchSum_AsOptions', ''),
(44, 13, 'S.S.E_BelegKopf.UStID', 'DE124172203'),
(45, 13, 'S.S.E_BelegKopf.Warenwert', '44.236,50'),
(46, 13, 'S.S.S_WaehrungSpr.KurzBez', '€'),
(47, 13, 'F.L..Bestimmungsort_Kurz', ''),
(48, 13, 'F.L.S_LieferBed.Incoterm', 'DDP'),
(49, 13, 'F.L.S_VersandArtSpr.Bezeichnung', 'LKW'),
(50, 13, 'F.L.S_ZahlZielSpr.Bezeichnung', '30 Tage netto');

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

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `cod_saga`, `name`, `cod_fiscal`, `reg_com`, `address1`, `address2`, `city`, `county`, `country`, `analitic`, `zs`, `discount`, `bank_name`, `bank_account`, `branch`, `branch_rep`, `personal_id_serie`, `personal_id_number`, `personal_id_issuer`, `license_plate`, `comments`, `agent`, `agent_name`, `group`, `type_tert`, `phone`, `email`, `is_vat`, `blocked`, `date_v_vat`, `cb_card`, `date_s_vat`, `credit_limit`, `create_date`, `is_customer`, `is_supplier`) VALUES
(1, NULL, 'Spaleck', NULL, NULL, 'asd3', '', 'Timisoara', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-11 19:46:56', 1, 0),
(2, NULL, 'Sers', NULL, NULL, '', '', 'Timisoara1', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-11 19:46:56', 1, 0),
(3, NULL, 'Ikea SRL1', '', '', '', '', 'Timisoara', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-11 19:46:56', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `catid` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `type` enum('pcomposed','product','service','asset') NOT NULL,
  `unit_price` varchar(45) DEFAULT NULL,
  `units_unit` varchar(45) NOT NULL,
  `docs` text,
  `active` tinyint NOT NULL DEFAULT '1',
  `default_stock` int DEFAULT NULL,
  `currency` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_meta`
--

CREATE TABLE `products_meta` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `val` varchar(255) NOT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `catid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_structure`
--

CREATE TABLE `products_structure` (
  `id` int NOT NULL,
  `parent` int NOT NULL,
  `item` int NOT NULL,
  `qty` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `series` varchar(45) DEFAULT NULL,
  `lastissued` int DEFAULT NULL,
  `maxval` int DEFAULT NULL,
  `validfrom` datetime DEFAULT NULL,
  `validto` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings_document_numbers`
--

INSERT INTO `settings_document_numbers` (`id`, `type`, `label`, `series`, `lastissued`, `maxval`, `validfrom`, `validto`) VALUES
(1, 'order', 'order', 'A', 172, NULL, '2021-04-01 08:30:52', '2022-04-01 08:30:52');

-- --------------------------------------------------------

--
-- Table structure for table `settings_document_types`
--

CREATE TABLE `settings_document_types` (
  `type` varchar(50) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings_document_types`
--

INSERT INTO `settings_document_types` (`type`, `description`) VALUES
('order', NULL);

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
,`operation_name` varchar(50)
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
  `type` enum('mat','marf') DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks_content`
--

CREATE TABLE `stocks_content` (
  `id` int NOT NULL,
  `catalog_id` int NOT NULL,
  `stocks_id` int NOT NULL,
  `qty` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks_initial`
--

CREATE TABLE `stocks_initial` (
  `id` int NOT NULL,
  `ts` datetime NOT NULL,
  `stocks_id` int NOT NULL,
  `catalog_catid` int NOT NULL,
  `qty` float(10,3) NOT NULL,
  `value` float(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks_registry`
--

CREATE TABLE `stocks_registry` (
  `id` int NOT NULL,
  `ts` datetime DEFAULT NULL,
  `catalog_id` int NOT NULL,
  `stocks_id` int NOT NULL,
  `type` enum('receptie','consum','vanzare','transfer','conversie') DEFAULT NULL,
  `documents_docid` int NOT NULL,
  `oiid` int NOT NULL
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

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`tid`, `name`, `teamlead`) VALUES
(1, 'Echipa 1', 5),
(2, 'Echipa 2', NULL),
(3, 'Echipa 3', NULL),
(4, 'Echipa 4', NULL),
(5, 'Echipa 5', NULL),
(6, 'Echipa 6', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timetracking`
--

CREATE TABLE `timetracking` (
  `id` int NOT NULL,
  `employee` int NOT NULL,
  `start` datetime DEFAULT CURRENT_TIMESTAMP,
  `stop` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `duration` time DEFAULT NULL,
  `operation` int NOT NULL,
  `order` int NOT NULL,
  `hourly_rate` float(10,2) DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `status` enum('w','f') NOT NULL DEFAULT 'w'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `timetracking`
--

INSERT INTO `timetracking` (`id`, `employee`, `start`, `stop`, `duration`, `operation`, `order`, `hourly_rate`, `currency`, `status`) VALUES
(1, 9, '2021-06-02 07:05:50', '2021-06-09 15:26:28', '176:20:38', 4, 13, 13.00, 'EUR', 'f'),
(2, 9, '2021-06-02 07:05:50', '2021-06-08 08:16:58', '145:11:08', 1, 11, 20.00, 'EUR', 'f');

--
-- Triggers `timetracking`
--
DELIMITER $$
CREATE TRIGGER `calc_duration` BEFORE UPDATE ON `timetracking` FOR EACH ROW BEGIN
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
,`op_name` varchar(50)
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
  `type` varchar(45) DEFAULT NULL
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `password`, `fname`, `lname`, `email`, `creationtime`, `lastlogin`, `active`, `type`) VALUES
('vsergiu', '$2y$10$S2P2hGLg16iwszyUq3ZlUukIDfsakTn0y89q9g6BdENmb8U/Xrr/2', 'Sergiu', 'Voicu', 'sv@softaccel.net', '2020-12-08 09:25:26', NULL, 1, 'adm');

-- --------------------------------------------------------

--
-- Table structure for table `users_2_groups`
--

CREATE TABLE `users_2_groups` (
  `groupid` varchar(20) NOT NULL,
  `userid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users_2_groups`
--

INSERT INTO `users_2_groups` (`groupid`, `userid`) VALUES
('admin', 'vsergiu'),
('sales', 'vsergiu'),
('tehnic', 'vsergiu');

-- --------------------------------------------------------

--
-- Structure for view `alloc_orders`
--
DROP TABLE IF EXISTS `alloc_orders`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `alloc_orders`  AS  select `e`.`id` AS `emplid`,`e`.`fname` AS `fname`,`e`.`lname` AS `lname`,`e`.`card` AS `card`,`op`.`name` AS `op_name`,`op`.`id` AS `op_id`,`d`.`docnum` AS `order_name`,`o`.`oid` AS `order_id`,`o2e`.`hourlyrate` AS `hourlyrate`,`o2e`.`currency` AS `currency`,concat(`e`.`id`,`d`.`docnum`,`op`.`name`) AS `unq` from ((((`employees` `e` left join `orders_2_employees` `o2e` on((`o2e`.`emplid` = `e`.`id`))) left join `orders` `o` on((`o`.`oid` = `o2e`.`orderid`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) left join `operations` `op` on((`op`.`id` = `o2e`.`operation`))) where (`d`.`docnum` is not null) ;

-- --------------------------------------------------------

--
-- Structure for view `dlvrcontents_expanded`
--
DROP TABLE IF EXISTS `dlvrcontents_expanded`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `dlvrcontents_expanded`  AS  select `dc`.`id` AS `id`,`dc`.`delivery` AS `delivery`,`dc`.`item` AS `item`,`dc`.`qty` AS `qty`,`dc`.`labels` AS `labels`,`dc`.`checkout` AS `checkout`,`i`.`order` AS `order`,`i`.`docnum` AS `docnum`,`i`.`name` AS `name`,`i`.`partid` AS `partid`,`i`.`design` AS `design` from (`deliveries_contents` `dc` left join `inventory_extented` `i` on((`i`.`id` = `dc`.`item`))) ;

-- --------------------------------------------------------

--
-- Structure for view `employeesExtended`
--
DROP TABLE IF EXISTS `employeesExtended`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `employeesExtended`  AS  select `empl`.`id` AS `id`,`empl`.`fname` AS `fname`,`empl`.`lname` AS `lname`,`empl`.`bdate` AS `bdate`,`empl`.`cnp` AS `cnp`,`empl`.`address_1` AS `address_1`,`empl`.`address_2` AS `address_2`,`empl`.`city` AS `city`,`empl`.`postcode` AS `postcode`,`empl`.`county` AS `county`,`empl`.`country` AS `country`,`empl`.`userid` AS `userid`,`empl`.`docs` AS `docs`,`empl`.`team` AS `team`,`empl`.`activ` AS `activ`,`empl`.`jobtitle` AS `jobtitle`,`empl`.`card` AS `card`,`j`.`name` AS `jobname`,`t`.`name` AS `teamname` from ((`employees` `empl` left join `jobs` `j` on((`j`.`codcor` = `empl`.`jobtitle`))) left join `teams` `t` on((`t`.`tid` = `empl`.`team`))) ;

-- --------------------------------------------------------

--
-- Structure for view `employees_names`
--
DROP TABLE IF EXISTS `employees_names`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `employees_names`  AS  select `employees`.`id` AS `id`,concat(`employees`.`fname`,' ',`employees`.`lname`) AS `fullname` from `employees` ;

-- --------------------------------------------------------

--
-- Structure for view `emplToOrdAssoc`
--
DROP TABLE IF EXISTS `emplToOrdAssoc`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `emplToOrdAssoc`  AS  select `o2e`.`id` AS `id`,`ord`.`oid` AS `oid`,`ord`.`state` AS `status`,`doc`.`docnum` AS `docnum`,`ops`.`name` AS `opname`,`o2e`.`hourlyrate` AS `hourlyrate`,`o2e`.`currency` AS `currency`,`empl`.`fname` AS `fname`,`empl`.`lname` AS `lname`,`o2e`.`emplid` AS `emplid`,`ord`.`label` AS `label`,`ops`.`id` AS `opid` from ((((`orders_2_employees` `o2e` left join `orders` `ord` on((`ord`.`oid` = `o2e`.`orderid`))) left join `operations` `ops` on((`ops`.`id` = `o2e`.`operation`))) left join `documents` `doc` on((`doc`.`id` = `ord`.`doc_id`))) left join `employees` `empl` on((`empl`.`id` = `o2e`.`emplid`))) order by `o2e`.`emplid` ;

-- --------------------------------------------------------

--
-- Structure for view `inventory_extented`
--
DROP TABLE IF EXISTS `inventory_extented`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `inventory_extented`  AS  select `i`.`id` AS `id`,`i`.`order` AS `order`,`d`.`docnum` AS `docnum`,`i`.`name` AS `name`,`i`.`catalog_id` AS `catalog_id`,`i`.`um` AS `um`,`i`.`qty` AS `qty`,`i`.`unit_price` AS `unit_price`,`i`.`vat_proc` AS `vat_proc`,`i`.`vat_value` AS `vat_value`,`i`.`total_price` AS `total_price`,`i`.`currency` AS `currency`,`opm1`.`meta_val` AS `partid`,`opm2`.`meta_val` AS `design` from ((((`inventory` `i` left join `inventory_meta` `opm1` on(((`opm1`.`order_part_id` = `i`.`id`) and (`opm1`.`meta_key` = 'P.A.E_BelegPos.Artikel')))) left join `inventory_meta` `opm2` on(((`opm2`.`order_part_id` = `i`.`id`) and (`opm2`.`meta_key` = 'P.A.P_ZeichnungSpr.Zeichnung')))) left join `orders` `o` on((`o`.`oid` = `i`.`order`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `inventory_wmeta`
--
DROP TABLE IF EXISTS `inventory_wmeta`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `inventory_wmeta`  AS  select `op`.`id` AS `id`,`op`.`order` AS `order`,`op`.`name` AS `name`,`op`.`catalog_id` AS `catalog_id`,`op`.`um` AS `um`,`op`.`qty` AS `qty`,`op`.`unit_price` AS `unit_price`,`op`.`vat_proc` AS `vat_proc`,`op`.`vat_value` AS `vat_value`,`op`.`total_price` AS `total_price`,`op`.`currency` AS `currency`,`opm1`.`meta_val` AS `partid`,`opm2`.`meta_val` AS `design` from ((`inventory` `op` left join `inventory_meta` `opm1` on(((`opm1`.`order_part_id` = `op`.`id`) and (`opm1`.`meta_key` = 'P.A.E_BelegPos.Artikel')))) left join `inventory_meta` `opm2` on(((`opm2`.`order_part_id` = `op`.`id`) and (`opm2`.`meta_key` = 'P.A.P_ZeichnungSpr.Zeichnung')))) ;

-- --------------------------------------------------------

--
-- Structure for view `orders_count_bystate`
--
DROP TABLE IF EXISTS `orders_count_bystate`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `orders_count_bystate`  AS  select `orders`.`state` AS `state`,count(0) AS `cnt` from `orders` group by `orders`.`state` ;

-- --------------------------------------------------------

--
-- Structure for view `orders_extended`
--
DROP TABLE IF EXISTS `orders_extended`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `orders_extended`  AS  select `o`.`oid` AS `oid`,`o`.`label` AS `label`,`o`.`state` AS `state`,`o`.`doc_id` AS `doc_id`,`o`.`partner_id` AS `partner_id`,`o`.`created_on` AS `created_on`,`o`.`closed_on` AS `closed_on`,`o`.`final_value` AS `final_value`,`o`.`meta` AS `meta`,`o`.`created_by` AS `created_by`,`p`.`name` AS `pname`,`d`.`docnum` AS `docnum` from ((`orders` `o` left join `partners` `p` on((`p`.`id` = `o`.`partner_id`))) left join `documents` `d` on((`d`.`id` = `o`.`doc_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `started_work`
--
DROP TABLE IF EXISTS `started_work`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `started_work`  AS  select `tt`.`id` AS `id`,`tt`.`employee` AS `employee`,`tt`.`start` AS `start`,`tt`.`stop` AS `stop`,timediff(now(),`tt`.`start`) AS `worktime`,`tt`.`operation` AS `operation`,`op`.`name` AS `operation_name`,`tt`.`order` AS `order`,`doc`.`docnum` AS `order_label`,`tt`.`hourly_rate` AS `hourly_rate`,`tt`.`currency` AS `currency`,`e`.`card` AS `card` from ((((`timetracking` `tt` left join `employees` `e` on((`e`.`id` = `tt`.`employee`))) left join `operations` `op` on((`op`.`id` = `tt`.`operation`))) left join `orders` `o` on((`o`.`oid` = `tt`.`order`))) left join `documents` `doc` on((`doc`.`id` = `o`.`doc_id`))) where (`tt`.`stop` is null) ;

-- --------------------------------------------------------

--
-- Structure for view `tags`
--
DROP TABLE IF EXISTS `tags`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `tags`  AS  select `employees`.`id` AS `emplid`,`employees`.`fname` AS `fname`,`employees`.`lname` AS `lname`,`employees`.`card` AS `card` from `employees` where (`employees`.`card` is not null) ;

-- --------------------------------------------------------

--
-- Structure for view `timetracking_wdiff`
--
DROP TABLE IF EXISTS `timetracking_wdiff`;

CREATE ALGORITHM=MERGE SQL SECURITY DEFINER VIEW `timetracking_wdiff`  AS  select `timetracking`.`id` AS `id`,`timetracking`.`employee` AS `employee`,`timetracking`.`start` AS `start`,`timetracking`.`stop` AS `stop`,`timetracking`.`operation` AS `operation`,`timetracking`.`order` AS `order`,`timetracking`.`hourly_rate` AS `hourly_rate`,`timetracking`.`currency` AS `currency`,`timetracking`.`status` AS `status`,timediff(`timetracking`.`stop`,`timetracking`.`start`) AS `diff` from `timetracking` ;

-- --------------------------------------------------------

--
-- Structure for view `tt_expanded`
--
DROP TABLE IF EXISTS `tt_expanded`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `tt_expanded`  AS  select `tt`.`id` AS `id`,`tt`.`employee` AS `employee`,`tt`.`start` AS `start`,`tt`.`stop` AS `stop`,`tt`.`operation` AS `operation`,timediff(`tt`.`stop`,`tt`.`start`) AS `duration`,`tt`.`order` AS `order`,`tt`.`hourly_rate` AS `hourly_rate`,`tt`.`currency` AS `currency`,`tt`.`status` AS `status`,concat(`e`.`fname`,' ',`e`.`lname`) AS `empl_name`,`ops`.`name` AS `op_name`,`doc`.`docnum` AS `docnum` from ((((`timetracking` `tt` left join `employees` `e` on((`e`.`id` = `tt`.`employee`))) left join `operations` `ops` on((`ops`.`id` = `tt`.`operation`))) left join `orders` `o` on((`o`.`oid` = `tt`.`order`))) left join `documents` `doc` on((`doc`.`id` = `o`.`doc_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `usergroups`
--
DROP TABLE IF EXISTS `usergroups`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `usergroups`  AS  select `g`.`groupid` AS `groupid`,`g`.`description` AS `description`,`u2g`.`userid` AS `userid` from (`users_2_groups` `u2g` left join `groups` `g` on((`u2g`.`groupid` = `g`.`groupid`))) ;

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
  ADD UNIQUE KEY `delivery` (`delivery`,`item`),
  ADD KEY `inventory` (`item`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_documents_users1_idx` (`userid`),
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
  ADD KEY `fk_orders_items_orders1_idx` (`order`),
  ADD KEY `fk_orders_items_catalog1_idx` (`catalog_id`);

--
-- Indexes for table `inventory_meta`
--
ALTER TABLE `inventory_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_part_id` (`order_part_id`,`meta_key`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`codcor`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_maintainance_assets1_idx` (`assets_aid`),
  ADD KEY `fk_maintainance_users1_idx` (`execby`);

--
-- Indexes for table `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operations_ibfk_1` (`currency`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `fk_orders_document1_idx` (`doc_id`),
  ADD KEY `fk_orders_partners1_idx` (`partner_id`),
  ADD KEY `created_by` (`created_by`),
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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`catid`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_catalog_units1_idx` (`units_unit`),
  ADD KEY `fk_catalog_stocks1_idx` (`default_stock`),
  ADD KEY `fk_catalog_currencies1_idx` (`currency`);

--
-- Indexes for table `products_meta`
--
ALTER TABLE `products_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_catalog_properties_catalog1_idx` (`catid`);

--
-- Indexes for table `products_structure`
--
ALTER TABLE `products_structure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_catalog_product_items_catalog1_idx` (`parent`),
  ADD KEY `fk_catalog_product_items_catalog2_idx` (`item`);

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
  ADD UNIQUE KEY `unq` (`type`,`location`);

--
-- Indexes for table `stocks_content`
--
ALTER TABLE `stocks_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_stocks_catalog1_idx` (`catalog_id`),
  ADD KEY `fk_products_stocks_stocks1_idx` (`stocks_id`);

--
-- Indexes for table `stocks_initial`
--
ALTER TABLE `stocks_initial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stocks_initial_stocks1_idx` (`stocks_id`),
  ADD KEY `fk_stocks_initial_catalog1_idx` (`catalog_catid`),
  ADD KEY `fk_stocks_initial_currencies1_idx` (`currency`);

--
-- Indexes for table `stocks_registry`
--
ALTER TABLE `stocks_registry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stocks_registry_catalog1_idx` (`catalog_id`),
  ADD KEY `fk_stocks_registry_stocks1_idx` (`stocks_id`),
  ADD KEY `fk_stocks_registry_documents1_idx` (`documents_docid`),
  ADD KEY `fk_stocks_registry_orders_items1_idx` (`oiid`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `fk_table1_employees1_idx` (`teamlead`);

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
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `deliveries_contents`
--
ALTER TABLE `deliveries_contents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=456;

--
-- AUTO_INCREMENT for table `inventory_meta`
--
ALTER TABLE `inventory_meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8646;

--
-- AUTO_INCREMENT for table `operations`
--
ALTER TABLE `operations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders_2_deliveries`
--
ALTER TABLE `orders_2_deliveries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_2_employees`
--
ALTER TABLE `orders_2_employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders_meta`
--
ALTER TABLE `orders_meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `catid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_structure`
--
ALTER TABLE `products_structure`
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `tid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `timetracking`
--
ALTER TABLE `timetracking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_assets_catalog1` FOREIGN KEY (`catalog_catid`) REFERENCES `products` (`catid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_assets_employees1` FOREIGN KEY (`employeeid`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `currency_series`
--
ALTER TABLE `currency_series`
  ADD CONSTRAINT `fk_currency_series_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`);

--
-- Constraints for table `deliveries_contents`
--
ALTER TABLE `deliveries_contents`
  ADD CONSTRAINT `deliveries_contents_ibfk_1` FOREIGN KEY (`delivery`) REFERENCES `deliveries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deliveries_contents_ibfk_2` FOREIGN KEY (`item`) REFERENCES `inventory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`type`) REFERENCES `settings_document_types` (`type`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_documents_partners1` FOREIGN KEY (`partners_id`) REFERENCES `partners` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_documents_users1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_employees_ops_catalog1` FOREIGN KEY (`catalog_id`) REFERENCES `products` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_employees_ops_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_orders_items_catalog1` FOREIGN KEY (`catalog_id`) REFERENCES `products` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`order`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory_meta`
--
ALTER TABLE `inventory_meta`
  ADD CONSTRAINT `inventory_meta_ibfk_1` FOREIGN KEY (`order_part_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `fk_maintainance_assets1` FOREIGN KEY (`assets_aid`) REFERENCES `assets` (`aid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_maintainance_users1` FOREIGN KEY (`execby`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `operations`
--
ALTER TABLE `operations`
  ADD CONSTRAINT `operations_ibfk_1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_document1` FOREIGN KEY (`doc_id`) REFERENCES `documents` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_partners1` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`team`) REFERENCES `teams` (`tid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `orders_2_employees`
--
ALTER TABLE `orders_2_employees`
  ADD CONSTRAINT `orders_2_employees_ibfk_1` FOREIGN KEY (`emplid`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_2_employees_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_2_employees_ibfk_3` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_2_employees_ibfk_4` FOREIGN KEY (`operation`) REFERENCES `operations` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `orders_meta`
--
ALTER TABLE `orders_meta`
  ADD CONSTRAINT `orders_meta_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_catalog_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_catalog_stocks1` FOREIGN KEY (`default_stock`) REFERENCES `stocks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_catalog_units1` FOREIGN KEY (`units_unit`) REFERENCES `units` (`unit`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `products_meta`
--
ALTER TABLE `products_meta`
  ADD CONSTRAINT `fk_catalog_properties_catalog1` FOREIGN KEY (`catid`) REFERENCES `products` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_structure`
--
ALTER TABLE `products_structure`
  ADD CONSTRAINT `fk_catalog_product_items_catalog1` FOREIGN KEY (`parent`) REFERENCES `products` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_catalog_product_items_catalog2` FOREIGN KEY (`item`) REFERENCES `products` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `settings_document_numbers`
--
ALTER TABLE `settings_document_numbers`
  ADD CONSTRAINT `settings_document_numbers_ibfk_1` FOREIGN KEY (`type`) REFERENCES `settings_document_types` (`type`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `stocks_content`
--
ALTER TABLE `stocks_content`
  ADD CONSTRAINT `fk_products_stocks_catalog1` FOREIGN KEY (`catalog_id`) REFERENCES `products` (`catid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_products_stocks_stocks1` FOREIGN KEY (`stocks_id`) REFERENCES `stocks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `stocks_initial`
--
ALTER TABLE `stocks_initial`
  ADD CONSTRAINT `fk_stocks_initial_catalog1` FOREIGN KEY (`catalog_catid`) REFERENCES `products` (`catid`),
  ADD CONSTRAINT `fk_stocks_initial_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `fk_stocks_initial_stocks1` FOREIGN KEY (`stocks_id`) REFERENCES `stocks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `stocks_registry`
--
ALTER TABLE `stocks_registry`
  ADD CONSTRAINT `fk_stocks_registry_catalog1` FOREIGN KEY (`catalog_id`) REFERENCES `products` (`catid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stocks_registry_documents1` FOREIGN KEY (`documents_docid`) REFERENCES `documents` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stocks_registry_orders_items1` FOREIGN KEY (`oiid`) REFERENCES `inventory` (`id`),
  ADD CONSTRAINT `fk_stocks_registry_stocks1` FOREIGN KEY (`stocks_id`) REFERENCES `stocks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `fk_table1_employees1` FOREIGN KEY (`teamlead`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `timetracking`
--
ALTER TABLE `timetracking`
  ADD CONSTRAINT `fk_timetracking_catalog1` FOREIGN KEY (`operation`) REFERENCES `operations` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_timetracking_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_timetracking_employees1` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `timetracking_ibfk_1` FOREIGN KEY (`order`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `users_2_groups`
--
ALTER TABLE `users_2_groups`
  ADD CONSTRAINT `users_2_groups_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `groups` (`groupid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_2_groups_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
