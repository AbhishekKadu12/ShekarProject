-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.35 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for shekar
CREATE DATABASE IF NOT EXISTS `shekar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shekar`;

-- Dumping structure for table shekar.addsupplier
CREATE TABLE IF NOT EXISTS `addsupplier` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `contact` varchar(200) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.addsupplier: ~0 rows (approximately)

-- Dumping structure for table shekar.assignemployeetocomplain
CREATE TABLE IF NOT EXISTS `assignemployeetocomplain` (
  `complainid` int NOT NULL,
  `cid` int DEFAULT NULL,
  `eid` int DEFAULT NULL,
  `datetosend` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`complainid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  CONSTRAINT `assigncomplaintoemployee_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`),
  CONSTRAINT `assigncomplaintoemployee_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.assignemployeetocomplain: ~0 rows (approximately)

-- Dumping structure for table shekar.complain
CREATE TABLE IF NOT EXISTS `complain` (
  `complainid` int NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  `complaindate` varchar(200) DEFAULT NULL,
  `complaintime` varchar(200) DEFAULT NULL,
  `complainstatus` varchar(200) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `custtype` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`complainid`),
  KEY `cid` (`cid`),
  KEY `pid` (`pid`),
  CONSTRAINT `complain_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`),
  CONSTRAINT `complain_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `producttable` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.complain: ~0 rows (approximately)

-- Dumping structure for table shekar.complainbill
CREATE TABLE IF NOT EXISTS `complainbill` (
  `complainid` int NOT NULL,
  `totalbill` varchar(200) DEFAULT NULL,
  `paid` varchar(100) DEFAULT NULL,
  `balance` varchar(100) DEFAULT NULL,
  `servicecharge` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`complainid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.complainbill: ~0 rows (approximately)

-- Dumping structure for table shekar.contract
CREATE TABLE IF NOT EXISTS `contract` (
  `contractno` int NOT NULL AUTO_INCREMENT,
  `fdate` varchar(50) DEFAULT NULL,
  `tdate` varchar(50) DEFAULT NULL,
  `modal` varchar(50) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  PRIMARY KEY (`contractno`),
  KEY `cid` (`cid`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.contract: ~0 rows (approximately)

-- Dumping structure for table shekar.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `custmername` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `conatct` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `custid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.customer: ~0 rows (approximately)

-- Dumping structure for table shekar.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `eid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contact` varchar(200) DEFAULT NULL,
  `jdate` varchar(200) DEFAULT NULL,
  `Designation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.employee: ~0 rows (approximately)

-- Dumping structure for table shekar.producttable
CREATE TABLE IF NOT EXISTS `producttable` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(200) DEFAULT NULL,
  `compname` varchar(200) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.producttable: ~0 rows (approximately)

-- Dumping structure for table shekar.producttype
CREATE TABLE IF NOT EXISTS `producttype` (
  `typeid` int unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(45) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.producttype: ~0 rows (approximately)

-- Dumping structure for table shekar.saleorder
CREATE TABLE IF NOT EXISTS `saleorder` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `odate` varchar(200) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `total` varchar(200) DEFAULT NULL,
  `paid` varchar(50) DEFAULT NULL,
  `balance` varchar(50) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `gst` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `cid` (`cid`),
  CONSTRAINT `saleorder_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.saleorder: ~0 rows (approximately)

-- Dumping structure for table shekar.saleorderentry
CREATE TABLE IF NOT EXISTS `saleorderentry` (
  `oid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `quantity` varchar(200) DEFAULT NULL,
  `rate` varchar(200) DEFAULT NULL,
  `total` varchar(200) DEFAULT NULL,
  `Warrenty_Upto` varchar(50) DEFAULT NULL,
  `gst` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `disc` tinyint unsigned DEFAULT NULL,
  KEY `pid` (`pid`),
  KEY `oid` (`oid`),
  CONSTRAINT `saleorderentry_ibfk_11` FOREIGN KEY (`pid`) REFERENCES `producttable` (`pid`),
  CONSTRAINT `saleorderentry_ibfk_22` FOREIGN KEY (`oid`) REFERENCES `saleorder` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.saleorderentry: ~0 rows (approximately)

-- Dumping structure for table shekar.saleorderstockwise
CREATE TABLE IF NOT EXISTS `saleorderstockwise` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `totalstock` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `pid` (`pid`),
  CONSTRAINT `saleorderstockwise_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `producttable` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.saleorderstockwise: ~0 rows (approximately)

-- Dumping structure for table shekar.servicecard
CREATE TABLE IF NOT EXISTS `servicecard` (
  `complainid` int DEFAULT NULL,
  `visittype` varchar(50) DEFAULT NULL,
  `SDate` varchar(50) DEFAULT NULL,
  `WorkDetails` varchar(50) DEFAULT NULL,
  `ICRNO` varchar(50) DEFAULT NULL,
  `CFDate` varchar(50) DEFAULT NULL,
  `CTDate` varchar(50) DEFAULT NULL,
  `ContractNO` varchar(50) DEFAULT NULL,
  KEY `complainid` (`complainid`),
  CONSTRAINT `servicecard_ibfk_1` FOREIGN KEY (`complainid`) REFERENCES `assignemployeetocomplain` (`complainid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.servicecard: ~0 rows (approximately)

-- Dumping structure for table shekar.spare
CREATE TABLE IF NOT EXISTS `spare` (
  `spareid` int NOT NULL AUTO_INCREMENT,
  `sparename` varchar(200) DEFAULT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  PRIMARY KEY (`spareid`),
  KEY `pid` (`pid`),
  CONSTRAINT `spare_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `producttable` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.spare: ~0 rows (approximately)

-- Dumping structure for table shekar.sparechangetocomplain
CREATE TABLE IF NOT EXISTS `sparechangetocomplain` (
  `complainid` int NOT NULL,
  `eid` int DEFAULT NULL,
  `spareid` int DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `cost` varchar(200) DEFAULT NULL,
  `datetosend` varchar(200) DEFAULT NULL,
  `qty` varchar(50) DEFAULT NULL,
  `rate` varchar(50) DEFAULT NULL,
  KEY `eid` (`eid`),
  KEY `spareid` (`spareid`),
  KEY `complainid` (`complainid`),
  CONSTRAINT `sparechangetocomplain_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`),
  CONSTRAINT `sparechangetocomplain_ibfk_2` FOREIGN KEY (`spareid`) REFERENCES `spare` (`spareid`),
  CONSTRAINT `sparechangetocomplain_ibfk_3` FOREIGN KEY (`complainid`) REFERENCES `complain` (`complainid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.sparechangetocomplain: ~0 rows (approximately)

-- Dumping structure for table shekar.spareorder
CREATE TABLE IF NOT EXISTS `spareorder` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `supplierid` int DEFAULT NULL,
  `orderdate` varchar(100) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `paid` varchar(50) DEFAULT NULL,
  `balance` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `supplierid` (`supplierid`),
  CONSTRAINT `spareorder_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `addsupplier` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.spareorder: ~0 rows (approximately)

-- Dumping structure for table shekar.sparestock
CREATE TABLE IF NOT EXISTS `sparestock` (
  `spareid` int DEFAULT NULL,
  `totalstock` int DEFAULT NULL,
  KEY `spareid` (`spareid`),
  CONSTRAINT `sparestock_ibfk_1` FOREIGN KEY (`spareid`) REFERENCES `spare` (`spareid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.sparestock: ~0 rows (approximately)

-- Dumping structure for table shekar.totalstock
CREATE TABLE IF NOT EXISTS `totalstock` (
  `pid` int NOT NULL DEFAULT '0',
  `totalstock` int DEFAULT NULL,
  KEY `pid` (`pid`),
  CONSTRAINT `totalstock_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `producttable` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table shekar.totalstock: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
