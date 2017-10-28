# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.35)
# Database: stock
# Generation Time: 2017-10-21 03:39:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `user_stock_id` bigint(20) DEFAULT NULL,
  `balance` bigint(20) NOT NULL,
  `transaction_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `transaction_stock_country` varchar(255) DEFAULT NULL,
  `shares` bigint(20) DEFAULT NULL,
  `stock_symbol` varchar(255) DEFAULT NULL,
  `stock_price` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table symbols
# ------------------------------------------------------------

DROP TABLE IF EXISTS `symbols`;

CREATE TABLE `symbols` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(255) NOT NULL,
  `symbol_name` varchar(255) NOT NULL,
  `exchange` varchar(255) NOT NULL,
  `is_forign` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user_portfolios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_portfolios`;

CREATE TABLE `user_portfolios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `val` bigint(20) DEFAULT NULL,
  `cash` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user_stocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_stocks`;

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



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_email`, `user_password`)
VALUES
	(3,'eaton','lo','eaton1632@gmail.com','1233');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
