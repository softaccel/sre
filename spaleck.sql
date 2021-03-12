-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 12, 2021 at 01:35 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
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
-- Table structure for table `access_rights`
--

CREATE TABLE `access_rights` (
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Table structure for table `assignemnts`
--

CREATE TABLE `assignemnts` (
  `id` int NOT NULL,
  `employees_id` int NOT NULL,
  `order` int NOT NULL,
  `hourly_rate` varchar(45) DEFAULT NULL,
  `currency` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
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
-- Table structure for table `catalog_product_structure`
--

CREATE TABLE `catalog_product_structure` (
  `id` int NOT NULL,
  `parent` int NOT NULL,
  `item` int NOT NULL,
  `qty` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_properties`
--

CREATE TABLE `catalog_properties` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `val` varchar(255) NOT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `catid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` varchar(10) NOT NULL,
  `desc` varchar(45) DEFAULT NULL
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
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `docid` int NOT NULL,
  `series` varchar(45) DEFAULT NULL,
  `number` varchar(45) NOT NULL,
  `issued` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `users_userid` varchar(20) NOT NULL,
  `partners_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doc_series`
--

CREATE TABLE `doc_series` (
  `id` int NOT NULL,
  `label` varchar(45) DEFAULT NULL,
  `series` varchar(45) DEFAULT NULL,
  `lastissued` int DEFAULT NULL,
  `maxval` int DEFAULT NULL,
  `validfrom` datetime DEFAULT NULL,
  `validto` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `jobtitle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `fname`, `lname`, `bdate`, `cnp`, `address_1`, `address_2`, `city`, `postcode`, `county`, `country`, `userid`, `docs`, `team`, `activ`, `jobtitle`) VALUES
(1, 'Sergiu', 'Voicu', '1979-05-11', '1790511113709', 'Campului 32', NULL, 'Ghiroda', 307200, 'Timis', 'Romania', 'vsergiu', NULL, 1, 1, '332201'),
(4, 'Florin', 'Maranescu', '1979-05-11', '1790511113709', 'Campului 32', NULL, 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 1, 1, '332201'),
(5, 'Iulian', 'Parvulescu', '1979-05-11', '1790511113709', 'Campului 32', NULL, 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 1, 1, '332201'),
(6, 'Bogdan', 'Onetiu', '1979-05-11', '1790511113709', 'Campului 32', NULL, 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 1, 1, '332201'),
(7, 'Georgel', 'Orolan', '1979-05-11', '1790511113709', 'Campului 32', NULL, 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 1, 1, '332201'),
(8, 'Petru', 'Cercel', '1979-05-11', '1790511113709', 'Campului 32', NULL, 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 1, 1, '332201'),
(9, 'Aaron A', 'Pumnul', '1979-05-11', '1790511113709', 'Ialomita', '2', 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 1, 1, '332201'),
(10, 'Alistar1', 'Concoley', '1979-05-01', '1790511113709', 'Campului 32', '22', 'Ghiroda', 307200, 'Timis', 'Romania', NULL, NULL, 1, 1, '332201');

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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `oid` int NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `partner` varchar(45) DEFAULT NULL,
  `state` enum('offer','ord','proc','ctc','fix','ready','dlvd') DEFAULT NULL,
  `docs` text,
  `document_docid` int NOT NULL,
  `partners_id` int NOT NULL,
  `estimate_hours` varchar(45) DEFAULT NULL,
  `estimated_price` float DEFAULT NULL,
  `final_price` float DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `start_work_on` datetime DEFAULT NULL,
  `ready_on` datetime DEFAULT NULL,
  `delivered_on` datetime DEFAULT NULL,
  `currency` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_items`
--

CREATE TABLE `orders_items` (
  `id` int NOT NULL,
  `order` int NOT NULL,
  `catalog_id` int NOT NULL,
  `units_unit` varchar(45) NOT NULL,
  `qty` float(10,3) DEFAULT NULL,
  `order_qty` float(10,3) DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `currency` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_metaproperties`
--

CREATE TABLE `orders_metaproperties` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `prop` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int NOT NULL,
  `cod_saga` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cod_fiscal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reg_com` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `cod_saga`, `name`, `cod_fiscal`, `reg_com`, `address`, `city`, `county`, `country`, `analitic`, `zs`, `discount`, `bank_name`, `bank_account`, `branch`, `branch_rep`, `personal_id_serie`, `personal_id_number`, `personal_id_issuer`, `license_plate`, `comments`, `agent`, `agent_name`, `group`, `type_tert`, `phone`, `email`, `is_vat`, `blocked`, `date_v_vat`, `cb_card`, `date_s_vat`, `credit_limit`, `create_date`, `is_customer`, `is_supplier`) VALUES
(1, NULL, 'Spaleck Gmbh', NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-11 19:46:56', 1, 0);

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
(1, 'Echipa 1', NULL),
(2, 'Echipa 2', NULL),
(3, 'Echipa 3', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timetracking`
--

CREATE TABLE `timetracking` (
  `id` int NOT NULL,
  `employee` int NOT NULL,
  `start` datetime DEFAULT NULL,
  `stop` datetime DEFAULT NULL,
  `catid` int NOT NULL,
  `order` int NOT NULL,
  `hourly_rate` varchar(45) DEFAULT NULL,
  `currency` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` varchar(20) NOT NULL,
  `password` varchar(45) NOT NULL,
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
('vsergiu', 'parola123', 'Sergiu', 'Voicu', 'sv@softaccel.net', '2020-12-08 09:25:26', NULL, 1, 'adm');

-- --------------------------------------------------------

--
-- Table structure for table `users_rights`
--

CREATE TABLE `users_rights` (
  `id` int NOT NULL,
  `access_rights_name` varchar(40) NOT NULL,
  `users_userid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_rights`
--
ALTER TABLE `access_rights`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `sn_UNIQUE` (`sn`),
  ADD KEY `fk_assets_employees1_idx` (`employeeid`),
  ADD KEY `fk_assets_catalog1_idx` (`catalog_catid`);

--
-- Indexes for table `assignemnts`
--
ALTER TABLE `assignemnts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_assignemnts_employees1_idx` (`employees_id`),
  ADD KEY `fk_assignemnts_orders1_idx` (`order`),
  ADD KEY `fk_assignemnts_currencies1_idx` (`currency`);

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`catid`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_catalog_units1_idx` (`units_unit`),
  ADD KEY `fk_catalog_stocks1_idx` (`default_stock`),
  ADD KEY `fk_catalog_currencies1_idx` (`currency`);

--
-- Indexes for table `catalog_product_structure`
--
ALTER TABLE `catalog_product_structure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_catalog_product_items_catalog1_idx` (`parent`),
  ADD KEY `fk_catalog_product_items_catalog2_idx` (`item`);

--
-- Indexes for table `catalog_properties`
--
ALTER TABLE `catalog_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_catalog_properties_catalog1_idx` (`catid`);

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
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`docid`),
  ADD KEY `fk_documents_users1_idx` (`users_userid`),
  ADD KEY `fk_documents_partners1_idx` (`partners_id`);

--
-- Indexes for table `doc_series`
--
ALTER TABLE `doc_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid_UNIQUE` (`userid`),
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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `fk_orders_document1_idx` (`document_docid`),
  ADD KEY `fk_orders_partners1_idx` (`partners_id`),
  ADD KEY `fk_orders_currencies1_idx` (`currency`);

--
-- Indexes for table `orders_items`
--
ALTER TABLE `orders_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_items_orders1_idx` (`order`),
  ADD KEY `fk_orders_items_catalog1_idx` (`catalog_id`),
  ADD KEY `fk_orders_items_units1_idx` (`units_unit`),
  ADD KEY `fk_orders_items_currencies1_idx` (`currency`);

--
-- Indexes for table `orders_metaproperties`
--
ALTER TABLE `orders_metaproperties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `fk_timetracking_catalog1_idx` (`catid`),
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
-- Indexes for table `users_rights`
--
ALTER TABLE `users_rights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_rights_access_rights_idx` (`access_rights_name`),
  ADD KEY `fk_users_rights_users1_idx` (`users_userid`);

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
  MODIFY `catid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_product_structure`
--
ALTER TABLE `catalog_product_structure`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `docid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doc_series`
--
ALTER TABLE `doc_series`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_items`
--
ALTER TABLE `orders_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_metaproperties`
--
ALTER TABLE `orders_metaproperties`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `tid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `timetracking`
--
ALTER TABLE `timetracking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_rights`
--
ALTER TABLE `users_rights`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_assets_catalog1` FOREIGN KEY (`catalog_catid`) REFERENCES `catalog` (`catid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_assets_employees1` FOREIGN KEY (`employeeid`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `assignemnts`
--
ALTER TABLE `assignemnts`
  ADD CONSTRAINT `assignemnts_ibfk_1` FOREIGN KEY (`order`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_assignemnts_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_assignemnts_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `catalog`
--
ALTER TABLE `catalog`
  ADD CONSTRAINT `fk_catalog_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_catalog_stocks1` FOREIGN KEY (`default_stock`) REFERENCES `stocks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_catalog_units1` FOREIGN KEY (`units_unit`) REFERENCES `units` (`unit`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_structure`
--
ALTER TABLE `catalog_product_structure`
  ADD CONSTRAINT `fk_catalog_product_items_catalog1` FOREIGN KEY (`parent`) REFERENCES `catalog` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_catalog_product_items_catalog2` FOREIGN KEY (`item`) REFERENCES `catalog` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_properties`
--
ALTER TABLE `catalog_properties`
  ADD CONSTRAINT `fk_catalog_properties_catalog1` FOREIGN KEY (`catid`) REFERENCES `catalog` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `currency_series`
--
ALTER TABLE `currency_series`
  ADD CONSTRAINT `fk_currency_series_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`);

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `fk_documents_partners1` FOREIGN KEY (`partners_id`) REFERENCES `partners` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_documents_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_employees_ops_catalog1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_employees_ops_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`);

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
  ADD CONSTRAINT `fk_orders_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_document1` FOREIGN KEY (`document_docid`) REFERENCES `documents` (`docid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_partners1` FOREIGN KEY (`partners_id`) REFERENCES `partners` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `orders_items`
--
ALTER TABLE `orders_items`
  ADD CONSTRAINT `fk_orders_items_catalog1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`catid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_items_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_items_ibfk_1` FOREIGN KEY (`order`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `unit` FOREIGN KEY (`units_unit`) REFERENCES `units` (`unit`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `stocks_content`
--
ALTER TABLE `stocks_content`
  ADD CONSTRAINT `fk_products_stocks_catalog1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`catid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_products_stocks_stocks1` FOREIGN KEY (`stocks_id`) REFERENCES `stocks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `stocks_initial`
--
ALTER TABLE `stocks_initial`
  ADD CONSTRAINT `fk_stocks_initial_catalog1` FOREIGN KEY (`catalog_catid`) REFERENCES `catalog` (`catid`),
  ADD CONSTRAINT `fk_stocks_initial_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `fk_stocks_initial_stocks1` FOREIGN KEY (`stocks_id`) REFERENCES `stocks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `stocks_registry`
--
ALTER TABLE `stocks_registry`
  ADD CONSTRAINT `fk_stocks_registry_catalog1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`catid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stocks_registry_documents1` FOREIGN KEY (`documents_docid`) REFERENCES `documents` (`docid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stocks_registry_orders_items1` FOREIGN KEY (`oiid`) REFERENCES `orders_items` (`id`),
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
  ADD CONSTRAINT `fk_timetracking_catalog1` FOREIGN KEY (`catid`) REFERENCES `catalog` (`catid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_timetracking_currencies1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_timetracking_employees1` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `timetracking_ibfk_1` FOREIGN KEY (`order`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `users_rights`
--
ALTER TABLE `users_rights`
  ADD CONSTRAINT `fk_users_rights_access_rights` FOREIGN KEY (`access_rights_name`) REFERENCES `access_rights` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users_rights_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
