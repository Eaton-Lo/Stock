CREATE DATABASE  IF NOT EXISTS `stock` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `stock`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: stock
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `symbols`
--

DROP TABLE IF EXISTS `symbols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symbols` (
  `symbol` varchar(255) NOT NULL,
  `symbol_name` varchar(255) NOT NULL,
  `exchange` varchar(255) NOT NULL,
  `is_forign` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symbols`
--

LOCK TABLES `symbols` WRITE;
/*!40000 ALTER TABLE `symbols` DISABLE KEYS */;
INSERT INTO `symbols` VALUES ('AAPL','Apple','NASDAQ','Y'),('ADANIPORTS','Adani Ports & SEZ Limited','NSE','Y'),('AMBUJACEM','Ambuja Cements Ltd.','NSE','Y'),('ASIANPAINT','Asian Paints Ltd','NSE','Y'),('AUROPHARMA','Aurobindo Pharma Ltd.','NSE','Y'),('AXISBANK','Axis Bank Ltd.','NSE','Y'),('AXP','American Express','NYSE','Y'),('BA','Boeing','NYSE','Y'),('BAJAJ-AUTO','Bajaj Auto Ltd.','NSE','Y'),('BAJFINANCE','Bajaj Finance Ltd','NSE','Y'),('BANKBARODA','Bank of Baroda','NSE','Y'),('BHARTIARTL','Bharti Airtel Ltd.','NSE','Y'),('BOSCHLTD','Bosch Ltd.','NSE','Y'),('BPCL','Bharat Petroleum Corporation','NSE','Y'),('CAT','Caterpillar','NYSE','Y'),('CIPLA','Cipla Ltd.','NSE','Y'),('COALINDIA','Coal India Ltd.','NSE','Y'),('CSCO','Cisco Systems','NASDAQ','Y'),('CVX','Chevron','NYSE','Y'),('DD','DuPont','NYSE','Y'),('DIS','Walt Disney','NYSE','Y'),('DRREDDY','Dr. Reddy\'s Laboratories Ltd.','NSE','Y'),('EICHERMOT','Eicher Motors','NSE','Y'),('GAIL','GAIL (India) Ltd.','NSE','Y'),('GE','General Electric','NYSE','Y'),('GRASIM','Grasim Industries Ltd.','NSE','Y'),('GS','Goldman Sachs','NYSE','Y'),('HCLTECH','HCL Technologies Ltd.','NSE','Y'),('HD','Home Depot','NYSE','Y'),('HDFC','Housing Development Finance Corporation Ltd.','NSE','Y'),('HDFCBANK','HDFC Bank Ltd.','NSE','Y'),('HEROMOTOCO','Hero MotoCorp Ltd.','NSE','Y'),('HINDALCO','Hindalco Industries Ltd.','NSE','Y'),('HINDUNILVR','Hindustan Unilever Ltd.','NSE','Y'),('IBM','IBM','NYSE','Y'),('IBULHSGFIN','Indiabulls Housing Finance','NSE','Y'),('ICICIBANK','ICICI Bank Ltd.','NSE','Y'),('INDUSINDBK','IndusInd Bank Ltd.','NSE','Y'),('INFRATEL','Bharti Infratel','NSE','Y'),('INFY','Infosys Ltd.','NSE','Y'),('INTC','Intel','NASDAQ','Y'),('IOC','Indian Oil Corporation','NSE','Y'),('ITC','ITC Limited','NSE','Y'),('JNJ','Johnson & Johnson','NYSE','Y'),('JPM','JPMorgan Chase','NYSE','Y'),('KO','Coca-Cola','NYSE','Y'),('KOTAKBANK','Kotak Mahindra Bank Ltd.','NSE','Y'),('LT','Larsen & Toubro Ltd.','NSE','Y'),('LUPIN','Lupin Limited','NSE','Y'),('M&M','Mahindra & Mahindra Ltd.','NSE','Y'),('MARUTI','Maruti Suzuki India Ltd.','NSE','Y'),('MCD','McDonald\'s','NYSE','Y'),('MMM','3M Company','NYSE','Y'),('MRK','Merck','NYSE','Y'),('MSFT','Microsoft','NASDAQ','Y'),('NKE','Nike','NYSE','Y'),('NTPC','NTPC Limited','NSE','Y'),('ONGC','Oil & Natural Gas Corporation Ltd.','NSE','Y'),('PFE','Pfizer','NYSE','Y'),('PG','Procter & Gamble','NYSE','Y'),('POWERGRID','PowerGrid Corporation of India Ltd.','NSE','Y'),('RELIANCE','Reliance Industries Ltd.','NSE','Y'),('SBIN','State Bank of India','NSE','Y'),('SUNPHARMA','Sun Pharmaceutical Industries Ltd.','NSE','Y'),('TATAMOTORS','Tata Motors Ltd.','NSE','Y'),('TATAPOWER','Tata Power Co. Ltd.','NSE','Y'),('TATASTEEL','Tata Steel Ltd.','NSE','Y'),('TCS','Tata Consultancy Services Ltd.','NSE','Y'),('TECHM','Tech Mahindra Ltd.','NSE','Y'),('TRV','The Travelers','NYSE','Y'),('ULTRACEMCO','UltraTech Cement Ltd.','NSE','Y'),('UNH','UnitedHealth','NYSE','Y'),('UTX','United Technologies','NYSE','Y'),('V','Visa','NYSE','Y'),('VZ','Verizon','NYSE','Y'),('WIPRO','Wipro','NSE','Y'),('WMT','Wal-Mart','NYSE','Y'),('XOM','ExxonMobil','NYSE','Y'),('YESBANK','Yes Bank Ltd.','NSE','Y'),('ZEEL','Zee Entertainment Enterprises Ltd.','NSE','Y');
/*!40000 ALTER TABLE `symbols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `portfolio_id` bigint(20) NOT NULL,
  `transaction_type` varchar(25) NOT NULL,
  `transaction_datetime` datetime NOT NULL DEFAULT '2017-09-01 12:00:00',
  `balance` bigint(20) NOT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `shares` bigint(20) DEFAULT NULL,
  `stock_price` bigint(20) DEFAULT NULL,
  `stock_country` varchar(25) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_portfolios`
--

DROP TABLE IF EXISTS `user_portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_portfolios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `val` bigint(20) DEFAULT NULL,
  `cash` bigint(20) DEFAULT NULL,
  `cash_india` bigint(20) DEFAULT NULL,
  `portfolio_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_portfolios`
--

LOCK TABLES `user_portfolios` WRITE;
/*!40000 ALTER TABLE `user_portfolios` DISABLE KEYS */;
INSERT INTO `user_portfolios` VALUES (1,5,NULL,NULL,NULL,'test'),(2,5,NULL,NULL,NULL,'test'),(3,5,NULL,NULL,NULL,'qwe');
/*!40000 ALTER TABLE `user_portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_stocks`
--

DROP TABLE IF EXISTS `user_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_stocks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock_id` bigint(20) NOT NULL,
  `portfolio_id` bigint(20) NOT NULL,
  `stock_symbol` varchar(255) NOT NULL,
  `stock_name` varchar(255) NOT NULL,
  `stock_country` varchar(255) NOT NULL,
  `stock_quantity` bigint(20) NOT NULL,
  `cost_basis` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_stocks`
--

LOCK TABLES `user_stocks` WRITE;
/*!40000 ALTER TABLE `user_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'eaton','lo','eaton1632@gmail.com','1233'),(4,'test','test','eeee','123'),(5,'123','123','123','123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-29  3:00:49
