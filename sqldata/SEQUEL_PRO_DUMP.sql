# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.15)
# Database: netflix_db
# Generation Time: 2017-04-30 23:15:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Account`;

CREATE TABLE `Account` (
  `AcctNum` int(11) NOT NULL AUTO_INCREMENT,
  `AcctType` char(20) NOT NULL,
  `AccountDate` date NOT NULL,
  `CustomerId` char(64) NOT NULL,
  PRIMARY KEY (`AcctNum`),
  KEY `CustomerId` (`CustomerId`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`Email`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;

INSERT INTO `Account` (`AcctNum`, `AcctType`, `AccountDate`, `CustomerId`)
VALUES
	(1,'unlimited-2','2006-10-01','pml@cs.sunysb.edu'),
	(2,'limited','2006-10-15','vicdu@cs.sunysb.edu'),
	(3,'unlimited-3','2010-11-05','jsmith@ic.sunysb.edu'),
	(4,'unlimited-2','2017-04-29','SirWilliams@yahoo.com');

/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Actor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Actor`;

CREATE TABLE `Actor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(64) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Actor` WRITE;
/*!40000 ALTER TABLE `Actor` DISABLE KEYS */;

INSERT INTO `Actor` (`Id`, `Name`, `Rating`, `Age`, `Gender`)
VALUES
	(1,'Al Pacino',5,63,'M'),
	(2,'Tim Robbins',2,53,'M'),
	(3,'Peter Weller',3,69,'M');

/*!40000 ALTER TABLE `Actor` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `ActorGender_Check` BEFORE INSERT ON `Actor` FOR EACH ROW BEGIN
	IF NEW.Gender NOT IN ('M', 'F') THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID Gender';
	END IF;
  END */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `Gender_CheckUpdate` BEFORE UPDATE ON `Actor` FOR EACH ROW BEGIN
	IF NEW.Gender NOT IN ('M', 'F') THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID Gender';
	END IF;
  END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table APPEAREDIN
# ------------------------------------------------------------

DROP TABLE IF EXISTS `APPEAREDIN`;

CREATE TABLE `APPEAREDIN` (
  `MovieId` int(11) NOT NULL,
  `ActorId` int(11) NOT NULL,
  PRIMARY KEY (`MovieId`,`ActorId`),
  KEY `ActorId` (`ActorId`),
  CONSTRAINT `appearedin_ibfk_1` FOREIGN KEY (`MovieId`) REFERENCES `Movie` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `appearedin_ibfk_2` FOREIGN KEY (`ActorId`) REFERENCES `Actor` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `APPEAREDIN` WRITE;
/*!40000 ALTER TABLE `APPEAREDIN` DISABLE KEYS */;

INSERT INTO `APPEAREDIN` (`MovieId`, `ActorId`)
VALUES
	(1,1),
	(3,1),
	(1,2),
	(4,3);

/*!40000 ALTER TABLE `APPEAREDIN` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer` (
  `Email` char(64) NOT NULL,
  `PersonId` int(11) NOT NULL,
  `CreditCard` char(20) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Password` char(40) DEFAULT NULL,
  PRIMARY KEY (`Email`,`PersonId`),
  KEY `PersonId` (`PersonId`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`PersonId`) REFERENCES `Person` (`PersonId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;

INSERT INTO `Customer` (`Email`, `PersonId`, `CreditCard`, `Rating`, `Password`)
VALUES
	('fueg0@gmail.com',23,'39484',NULL,'pass'),
	('jsmith@ic.sunysb.edu',3,'2345-6789-2345-6789',1,'Dad'),
	('pml@cs.sunysb.edu',4,'6789-2345-6789-2345',1,'Dad'),
	('SirWilliams@yahoo.com',25,NULL,NULL,'MyPassword'),
	('syang@cs.sunysb.edu',1,'1234-5678-1234-5678',1,'Dad'),
	('vicdu@cs.sunysb.edu',2,'5678-1234-5678-1234',1,'Dad');

/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `Email_Check` BEFORE INSERT ON `Customer` FOR EACH ROW BEGIN
	IF NEW.Email NOT LIKE '%@%' THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID EMAIL';
	END IF;
  END */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `Email_CheckUpdate` BEFORE UPDATE ON `Customer` FOR EACH ROW BEGIN
	IF NEW.Email NOT LIKE '%@%' THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID EMAIL';
	END IF;
  END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table Employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Employee`;

CREATE TABLE `Employee` (
  `SSN` int(11) NOT NULL,
  `PersonId` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `HourlyRate` decimal(5,2) NOT NULL,
  `Position` char(10) DEFAULT NULL,
  `Password` char(40) DEFAULT NULL,
  PRIMARY KEY (`SSN`,`PersonId`),
  KEY `PersonId` (`PersonId`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`PersonId`) REFERENCES `Person` (`PersonId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;

INSERT INTO `Employee` (`SSN`, `PersonId`, `StartDate`, `HourlyRate`, `Position`, `Password`)
VALUES
	(123456789,5,'2005-11-01',60.00,'Manager',NULL),
	(789123456,6,'2006-02-02',50.00,'Employee',NULL);

/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table FuegoOrder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FuegoOrder`;

CREATE TABLE `FuegoOrder` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `MovieId` int(11) NOT NULL,
  `CustomerId` char(64) NOT NULL,
  `TimeDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReturnDate` date DEFAULT NULL,
  `EmployeeId` int(11) DEFAULT NULL,
  `STATE` char(8) DEFAULT 'Held',
  PRIMARY KEY (`OrderId`,`CustomerId`,`MovieId`),
  KEY `MovieId` (`MovieId`),
  KEY `CustomerId` (`CustomerId`),
  KEY `EmployeeId` (`EmployeeId`),
  CONSTRAINT `fuegoorder_ibfk_1` FOREIGN KEY (`MovieId`) REFERENCES `MOVIE` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fuegoorder_ibfk_2` FOREIGN KEY (`CustomerId`) REFERENCES `CUSTOMER` (`Email`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fuegoorder_ibfk_3` FOREIGN KEY (`EmployeeId`) REFERENCES `Employee` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `FuegoOrder` WRITE;
/*!40000 ALTER TABLE `FuegoOrder` DISABLE KEYS */;

INSERT INTO `FuegoOrder` (`OrderId`, `MovieId`, `CustomerId`, `TimeDate`, `ReturnDate`, `EmployeeId`, `STATE`)
VALUES
	(1,1,'pml@cs.sunysb.edu','2009-11-11 10:00:00','2009-11-14',789123456,'Returned'),
	(2,3,'vicdu@cs.sunysb.edu','2009-11-11 18:15:00',NULL,789123456,'Held'),
	(3,3,'pml@cs.sunysb.edu','2009-11-12 09:30:00',NULL,789123456,'Held'),
	(4,2,'vicdu@cs.sunysb.edu','2009-10-21 22:22:00',NULL,789123456,'Held'),
	(6,1,'syang@cs.sunysb.edu','2017-04-28 00:35:46',NULL,789123456,'Held'),
	(8,3,'syang@cs.sunysb.edu','2017-04-30 15:54:33',NULL,123456789,'Held'),
	(10,11,'syang@cs.sunysb.edu','2017-04-30 17:51:50','2017-04-30',123456789,'Returned');

/*!40000 ALTER TABLE `FuegoOrder` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `OrderState_Check` BEFORE INSERT ON `FuegoOrder` FOR EACH ROW BEGIN
	IF NEW.STATE NOT IN ('Held', 'Returned') THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID ORDER STATE';
	END IF;
  END */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `State_UpdateCheck` BEFORE UPDATE ON `FuegoOrder` FOR EACH ROW BEGIN
	IF NEW.STATE NOT IN ('Held', 'Returned') THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID ORDER STATE';
	END IF;
  END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table Movie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Movie`;

CREATE TABLE `Movie` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MovieType` char(10) DEFAULT NULL,
  `Name` char(64) NOT NULL,
  `Fee` decimal(65,2) NOT NULL,
  `NumCopies` int(11) DEFAULT NULL,
  `Rating` decimal(3,2) DEFAULT NULL,
  `TotalRating` int(11) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;

INSERT INTO `Movie` (`Id`, `MovieType`, `Name`, `Fee`, `NumCopies`, `Rating`, `TotalRating`)
VALUES
	(1,'Drama','The GodFather',1.99,35,5.00,1),
	(2,'Drama','Shawshank Redemption',2.99,30,4.00,1),
	(3,'Comedy','Borat',1.99,35,4.00,1),
	(4,'Action','Robocop',2.99,50,3.00,1),
	(8,'Drama','Lion King',1.99,50,5.00,1),
	(9,'Drama','There Will Be Blood',1.99,1,5.00,1),
	(10,'Comedy','Evil Dead',5.99,1,1.00,1),
	(11,'Action','Street Fighter',2.99,1,NULL,0);

/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `MovieType_Check` BEFORE INSERT ON `Movie` FOR EACH ROW BEGIN
	IF NEW.MovieType NOT IN
	('Comedy', 'Drama', 'Action', 'Foreign') THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID MOVIE TYPE';
	END IF;
  END */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `MovieType_UpdateCheck` BEFORE UPDATE ON `Movie` FOR EACH ROW BEGIN
	IF NEW.MovieType NOT IN
	('Comedy', 'Drama', 'Action', 'Foreign') THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID MOVIE TYPE';
	END IF;
  END */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `MovieCopies_CheckUpdate` BEFORE UPDATE ON `Movie` FOR EACH ROW BEGIN
	IF NEW.NumCopies < 0
	THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No More Copies Available';
	END IF;
  END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table Person
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Person`;

CREATE TABLE `Person` (
  `PersonId` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` char(24) NOT NULL,
  `FirstName` char(24) NOT NULL,
  `Address` char(50) NOT NULL,
  `City` char(24) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` char(5) NOT NULL,
  `Telephone` char(15) NOT NULL,
  PRIMARY KEY (`PersonId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;

INSERT INTO `Person` (`PersonId`, `LastName`, `FirstName`, `Address`, `City`, `State`, `Zip`, `Telephone`)
VALUES
	(1,'Yang','Shang','123 Success Street','Stony Brook','NY','11790','516-632-8959'),
	(2,'Du','Victor','456 Fortune Road','Stony Brook','NY','11790','516-632-4360'),
	(3,'Smith','John','789 Peace Blvd.','Los Angeles','CA','93536','315-443-4321'),
	(4,'Philip','Lewis','135 Knowledge Lane','Stony Brook','NY','11794','516-666-8888'),
	(5,'Smith','David','123 College road','Stony Brook','NY','11790','516-215-2345'),
	(6,'Warren','David','456 Sunken Street','Stony Brook','NY','11794','631-632-9987'),
	(23,'alvarez','edwin','ahahaha','bx','NY','10466','wweeerrr'),
	(25,'Williams','Justin','123 Add street','Baldwin','NY','12345','123-456-7890');

/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Queued
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Queued`;

CREATE TABLE `Queued` (
  `AccountId` int(11) NOT NULL,
  `MovieId` int(11) NOT NULL,
  PRIMARY KEY (`AccountId`,`MovieId`),
  KEY `MovieId` (`MovieId`),
  CONSTRAINT `queued_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `Account` (`AcctNum`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `queued_ibfk_2` FOREIGN KEY (`MovieId`) REFERENCES `MOVIE` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Queued` WRITE;
/*!40000 ALTER TABLE `Queued` DISABLE KEYS */;

INSERT INTO `Queued` (`AccountId`, `MovieId`)
VALUES
	(1,1),
	(2,2),
	(1,3),
	(2,3);

/*!40000 ALTER TABLE `Queued` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping routines (PROCEDURE) for database 'netflix_db'
--
DELIMITER ;;

# Dump of PROCEDURE AddCustomer
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `AddCustomer` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `AddCustomer`(
IN Lname CHAR(24),
IN Fname CHAR(24),
IN Addr CHAR(50),
IN City CHAR(24),
IN State CHAR(2),
IN Zip CHAR(5),
IN Tele CHAR(15),
IN email Char(64),
IN creditCard Char(20),
IN Pass CHAR(40)
)
BEGIN
START TRANSACTION;
INSERT INTO Person (LastName, FirstName, Address, City, State, Zip, Telephone) VALUES (Lname, Fname, Addr, City, State, Zip, Tele);
SELECT P.PersonId INTO @pid FROM Person P WHERE P.FirstName = Fname AND P.LastName = Lname LIMIT 1;
INSERT INTO Customer (Email,PersonId,CreditCard,Password) VALUES (email, @pid, creditCard, Pass);
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE AddEmployee
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `AddEmployee` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `AddEmployee`(
IN Lname CHAR(24),
IN Fname CHAR(24),
IN Addr CHAR(50),
IN City CHAR(24),
IN State CHAR(2),
IN Zip CHAR(5),
IN Tele CHAR(15),
IN Ssn INT,
IN Sdate DATE,
IN Rate DECIMAL(5,2),
IN Pos CHAR(10),
IN pass CHAR(40)
)
BEGIN
START TRANSACTION;
INSERT INTO Person (LastName, FirstName, Address, City, State, Zip, Telephone) VALUES (Lname, Fname, Addr, City, State, Zip, Tele);
SELECT P.PersonId INTO @pid FROM Person P WHERE P.FirstName = Fname AND P.LastName = Lname LIMIT 1;
INSERT INTO Employee (SSN,PersonId,StartDate,HourlyRate,Position,Password) VALUES (Ssn, @pid, Sdate, Rate, Pos, pass);
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE AddMovie
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `AddMovie` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `AddMovie`(
  IN Name VARCHAR(64),
  IN MovieType VARCHAR(10),
  IN NumCopies INT,
  IN Fee DECIMAL(65,2),
  IN Rating INT
)
BEGIN
START TRANSACTION;

/*Adds more copies of the movie if it exist*/
IF EXISTS(SELECT M.Name FROM MOVIE M WHERE M.Name = Name LIMIT 1) THEN
  Update Movie M
  Set M.NumCopies = M.NumCopies + NumCopies
  WHERE M.Name = Name LIMIT 1;

/*Adds a Movie if it doesn't exist*/
ELSE
  SET @tRating = 1;
  IF RATING IS NULL THEN
    SET @tRating = 0;
  END IF;

  INSERT INTO Movie(Name, MovieType, NumCopies, Fee, Rating, TotalRating) VALUES
  (Name,MovieType,NumCopies,Fee,Rating,@tRating);

END IF;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Add_Account
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Add_Account` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Add_Account`(
IN AcctType CHAR(20),
IN AccountDate DATE,
IN CustomerId CHAR(64)
)
BEGIN
START TRANSACTION;
INSERT INTO Account (AcctType, AccountDate, CustomerId)
VALUES (AcctType, AccountDate, CustomerId);

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Add_Order
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Add_Order` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Add_Order`(
IN MovieId INT,
IN CustomerId char(64),
IN EmployeeId INT
)
BEGIN
START TRANSACTION;

IF EXISTS(SELECT M.NumCopies FROM MOVIE M
          WHERE M.id = MovieId and M.NumCopies > 0 LIMIT 1) THEN

  UPDATE MOVIE M
  SET M.NumCopies = M.NumCopies - 1
  WHERE M.Id = MovieId LIMIT 1;

  INSERT INTO FuegoOrder (MovieId, CustomerId, EmployeeId)
  VALUES (MovieId, CustomerId, EmployeeId);

END IF;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE ALLMovies
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `ALLMovies` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `ALLMovies`()
BEGIN

  START TRANSACTION;
  SELECT * FROM MOVIE;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE AllOrders
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `AllOrders` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `AllOrders`(IN customer CHAR(64))
BEGIN
SELECT    *
FROM    FuegoOrder F
WHERE     F.CustomerId = customer;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE BestSellers
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `BestSellers` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `BestSellers`(IN num_wanted INT)
BEGIN
SELECT 	M.*
FROM   	Movie M, FuegoOrder F
WHERE    	M.Id = F.MovieId
GROUP BY     M.name
ORDER BY     COUNT(*) DESC
LIMIT num_wanted;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE CurrentOrders
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `CurrentOrders` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `CurrentOrders`(IN customer CHAR(64))
BEGIN
START TRANSACTION;
  SELECT    *
  FROM      FuegoOrder F
  WHERE     F.CustomerId = customer and F.State = 'Held';
COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Customer_Wish_List
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Customer_Wish_List` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Customer_Wish_List`(IN person_id INT)
BEGIN
START TRANSACTION;

  SELECT M.*
  FROM CUSTOMER C, MOVIE M, QUEUED Q, ACCOUNT A
  WHERE C.PersonId = person_id AND A.CustomerId = C.Email
  AND A.AcctNum = Q.AccountId AND Q.MovieId = M.id;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE DelCustomer
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `DelCustomer` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `DelCustomer`(
  IN cEmail Char(64)
)
BEGIN
START TRANSACTION;

  SELECT P.PersonId INTO @pid FROM Person P, Customer C
  WHERE C.Email = cEmail AND C.PersonId = P.PersonId;

  SELECT A.AcctNum INTO @AcNum FROM Account A
  WHERE A.CustomerId = cEmail;

  DELETE FROM FuegoOrder WHERE CustomerId = cEmail;
  DELETE FROM QUEUED WHERE AccountId = @AcNum;
  DELETE FROM Account WHERE AcctNum = @AcNum;
  DELETE FROM Customer WHERE Email = cEmail;

  /* If the customer is not also an Employee then we will delete the person*/
  IF not exists(
    SELECT * FROM Employee
    WHERE PersonId = @pid LIMIT 1)
  THEN
    DELETE FROM Person WHERE PersonId = @pid;
  END IF;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE DelEmployee
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `DelEmployee` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `DelEmployee`(
IN _ssn INT
)
BEGIN
START TRANSACTION;
SELECT P.PersonId INTO @pid FROM Person P, Employee E
WHERE E.SSN = _ssn AND E.PersonId = P.PersonId;
DELETE FROM Employee WHERE SSN = _ssn;
DELETE FROM Person WHERE PersonId = @pid;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE DeleteMovie
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `DeleteMovie` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `DeleteMovie`(IN M_Name CHAR(64))
BEGIN
START TRANSACTION;
DELETE FROM MOVIE
WHERE Name = M_Name;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE EditEmployee
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `EditEmployee` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `EditEmployee`(
IN LastName CHAR(24),
IN FirstName CHAR(24),
IN Address CHAR(50),
IN City CHAR(24),
IN State CHAR(2),
IN Zip CHAR(5),
IN Telephone CHAR(15),
IN SSN INT,
IN StartDate DATE,
IN HourlyRate DECIMAL(5,2),
IN Position CHAR(10),
IN Password CHAR(40)
)
BEGIN

START TRANSACTION;

SET @query = 'Update Employee SET ';

IF StartDate IS NOT NULL THEN
  SET @query = CONCAT(@query, 'StartDate = \'', StartDate, '\' , ');
END if;

IF HourlyRate IS NOT NULL THEN
  SET @query = CONCAT(@query, 'HourlyRate = ', HourlyRate, ' , ');
END if;

IF Position IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Position = \'', Position, '\' , ');
END if;

IF Password IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Password = \'', Password, '\' , ');
END if;

SET @query = SUBSTRING(@query, 1, CHAR_LENGTH(@query)-2);
SET @query = CONCAT(@query, 'WHERE SSN = ', SSN, ';');


PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @query = 'Update Person SET ';

IF LastName IS NOT NULL THEN
  SET @query = CONCAT(@query, 'LastName = \'', LastName, '\' , ');
END if;

IF FirstName IS NOT NULL THEN
  SET @query = CONCAT(@query, 'FirstName = \'', FirstName, '\' , ');
END if;

IF Address IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Address = \'', Address, '\' , ');
END if;

IF City IS NOT NULL THEN
  SET @query = CONCAT(@query, 'City = \'', City, '\' , ');
END if;

IF State IS NOT NULL THEN
  SET @query = CONCAT(@query, 'State = \'', State, '\' , ');
END if;

IF Zip IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Zip = \'', Zip, '\' , ');
END if;

IF Telephone IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Telephone = \'', Telephone, '\' , ');
END if;

SELECT E.PersonId INTO @pid FROM Employee E
WHERE E.SSN = SSN LIMIT 1;

SET @query = SUBSTRING(@query, 1, CHAR_LENGTH(@query)-2);
SET @query = CONCAT(@query, 'WHERE PersonId = \'', @pid, '\';');

PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE EditMovie
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `EditMovie` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `EditMovie`(
/*If there is attribute that the manager doesn?t want to change, it will passed it as NULL*/
  IN Name VARCHAR(64),
  IN MovieType VARCHAR(10),
  IN NumCopies INT,
  IN Fee DECIMAL(65,2),
  IN Rating INT
)
BEGIN

START TRANSACTION;

SET @query = 'Update Movie SET ';

IF MovieType IS NOT NULL THEN
  SET @query = CONCAT(@query, 'MovieType = \'', MovieType, '\' , ');
END if;

IF NumCopies IS NOT NULL THEN
  SET @query = CONCAT(@query, 'NumCopies = ', NumCopies, ' , ');
END if;

IF Fee IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Fee = ', Fee, ' , ');
END if;

IF Rating IS NOT NULL THEN
  SET @query = CONCAT(@query, 'Rating = ', Rating, ' , ');
END if;

SET @query = SUBSTRING(@query, 1, CHAR_LENGTH(@query)-2);
SET @query = CONCAT(@query, 'WHERE Name = \'', Name, '\';');

PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Edit_Account_Type
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Edit_Account_Type` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Edit_Account_Type`(
  IN acctType Char(20),
  IN email Char(64),
  IN acctNum INT
)
BEGIN
START TRANSACTION;

UPDATE Account
SET AcctType = acctType
WHERE CustomerId = email AND AcctNum = acctNum;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Edit_Customer_CreditCard
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Edit_Customer_CreditCard` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Edit_Customer_CreditCard`(
  IN creditcard Char(40),
  IN email Char(64)
)
BEGIN
START TRANSACTION;

UPDATE Customer
SET CreditCard = creditcard
WHERE Email = email;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Edit_Customer_Email
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Edit_Customer_Email` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Edit_Customer_Email`(
  IN new_email Char(64),
  IN old_email Char(64)
)
BEGIN
START TRANSACTION;

UPDATE Customer
SET Email = new_email
WHERE Email = old_email;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Edit_Customer_Location
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Edit_Customer_Location` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Edit_Customer_Location`(
  IN address Char(50),
  IN city Char(24),
  IN state Char(2),
  IN zip Char(5),
  IN telephone Char(15),
  IN person_id INT)
BEGIN
START TRANSACTION;

UPDATE Person
SET Address = address, City = city, State = state,
    Zip = zip, Telephone = telephone
WHERE PersonId = person_id;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Edit_Customer_Name
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Edit_Customer_Name` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Edit_Customer_Name`(
  IN firstName Char(24),
  IN lastName Char(24),
  IN person_id INT
)
BEGIN
START TRANSACTION;

UPDATE Person
SET FirstName = firstName, LastName = lastName
WHERE PersonId = person_id;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Edit_Customer_Password
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Edit_Customer_Password` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Edit_Customer_Password`(
  IN password Char(40),
  IN email Char(64)
)
BEGIN
START TRANSACTION;

UPDATE Customer
SET Password = password
WHERE Email = email;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE GetCustomerAccount
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerAccount` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `GetCustomerAccount`(IN email CHAR(64))
BEGIN
START TRANSACTION;
  SELECT A.*
  FROM Account A
  WHERE A.CustomerId=email;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE KeywordMovie
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `KeywordMovie` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `KeywordMovie`(IN keyword CHAR(64))
BEGIN

START TRANSACTION;

SET @newKeyWord = CONCAT('%', keyword, '%');

SELECT M.*
FROM MOVIE M
WHERE M.Name Like @newKeyWord;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE ListHeld
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `ListHeld` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `ListHeld`(IN customer CHAR(64))
BEGIN
SELECT    M.Id, M.Name
FROM    Movie M, FuegoOrder F
WHERE     F.CustomerId = customer AND F.MovieId = M.id AND f.STATE = 'Held';
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE List_Account_Settings
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `List_Account_Settings` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `List_Account_Settings`(IN customer CHAR(64))
BEGIN
START TRANSACTION;
SELECT A.*
FROM Account A
WHERE customer = A.CustomerId;
COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE MostActivelyRented
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `MostActivelyRented` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `MostActivelyRented`(IN num_wanted INT)
BEGIN
SELECT 	M.Name
FROM   	Movie M, FuegoOrder F
WHERE    	M.Id = F.MovieId
GROUP BY     M.name
ORDER BY     COUNT(*) DESC
LIMIT num_wanted;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE MostActiveUsers
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `MostActiveUsers` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `MostActiveUsers`(IN num_wanted INT)
BEGIN
SELECT P.FirstName, P.LastName, C.Email
FROM Customer C, Person P
WHERE P.PersonId = C.PersonId AND
    C.Email IN
    (SELECT 	F.`CustomerId`
    FROM   	FuegoOrder F
    GROUP BY 	F.`CustomerId`
    ORDER BY 	COUNT(*) DESC)
LIMIT num_wanted;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE MostEmployeeTrans
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `MostEmployeeTrans` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `MostEmployeeTrans`()
BEGIN
  START TRANSACTION;

  SELECT P.FirstName, P.LastName , E.SSN, E.Position,
      Count(E.SSN) as Transactions
  FROM EMPLOYEE E, FuegoOrder F, Person P
  Where F.EmployeeId = E.SSN AND P.PersonId = E.PersonId
  GROUP BY E.SSN, E.PersonId
  ORDER BY Transactions DESC
  LIMIT 1;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE MovieByType
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `MovieByType` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `MovieByType`(IN m_type CHAR(10))
BEGIN
START TRANSACTION;
  SELECT    M.*
  FROM      Movie M
  WHERE     M.MovieType = m_type;
COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Movies_Starring_Actor
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Movies_Starring_Actor` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Movies_Starring_Actor`(IN Actor_Name CHAR(64))
BEGIN
START TRANSACTION;
SELECT M.*
FROM APPEAREDIN AP, Movie M, Actor A
WHERE M.Id = AP.MovieId AND AP.ActorId = A.Id AND A.Name = Actor_Name;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Orders_By_MovieName
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Orders_By_MovieName` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Orders_By_MovieName`(IN name char(64))
BEGIN

  START TRANSACTION;
  SELECT F.*
  FROM FuegoOrder F, Movie M
  WHERE F.MovieId = M.Id AND M.Name = name;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Orders_By_MovieType
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Orders_By_MovieType` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Orders_By_MovieType`(IN type char(10))
BEGIN

  START TRANSACTION;
  SELECT F.*
  FROM FuegoOrder F, Movie M
  WHERE F.MovieId = M.Id AND M.MovieType = type;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Orders_By_Name
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Orders_By_Name` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Orders_By_Name`(IN firstName char(24), lastName char(24))
BEGIN

  START TRANSACTION;
  SELECT DISTINCT F.*
  FROM FuegoOrder F, Movie M, Person P, Customer C
  WHERE F.CustomerId = C.Email AND C.PersonId = P.PersonId
   AND P.FirstName = firstName AND P.LastName = lastName;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE PastOrders
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `PastOrders` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `PastOrders`(IN customer CHAR(64))
BEGIN
START TRANSACTION;
  SELECT   	*
  FROM      FuegoOrder F
  WHERE     F.CustomerId = customer and F.State = 'Returned';
COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Rate_Movie_Rented
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Rate_Movie_Rented` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Rate_Movie_Rented`(IN Customer_Id CHAR(64), IN MovieId INT, IN newRating INT)
BEGIN
START TRANSACTION;

UPDATE Movie
Inner JOIN FuegoOrder ON
		Movie.id = FuegoOrder.MovieId
    AND FuegoOrder.CustomerId = Customer_Id
    AND Movie.id = MovieId

/*Adds the new rating to the average*/
SET Rating = ((Rating*TotalRating)+newRating) / (TotalRating + 1),
    TotalRating = TotalRating + 1;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Return_Customer_Mailing_List
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Return_Customer_Mailing_List` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Return_Customer_Mailing_List`()
BEGIN
  START TRANSACTION;
SELECT P.Address
FROM CUSTOMER C, Person P
WHERE P.PersonId = C.PersonId;

COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE Return_Movie
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `Return_Movie` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Return_Movie`(
IN MovieId INT,
IN CustomerId char(64)
)
BEGIN
START TRANSACTION;

SELECT F.OrderId INTO @FOId
FROM FuegoOrder F
WHERE F.MovieId = MovieId AND F.CustomerId = CustomerId LIMIT 1;

UPDATE MOVIE M
SET M.NumCopies = M.NumCopies + 1
WHERE M.id = MovieId LIMIT 1;

Update FuegoOrder
SET STATE = 'Returned', ReturnDate = CURDATE()
WHERE OrderId = @FOId;


COMMIT;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
