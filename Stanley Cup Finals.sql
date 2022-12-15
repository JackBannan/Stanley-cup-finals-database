-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: bann4500
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CoachTeam`
--

DROP TABLE IF EXISTS `CoachTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CoachTeam` (
  `Team ID` int NOT NULL,
  `Coach ID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Coach ID`),
  UNIQUE KEY `Coach ID_UNIQUE` (`Coach ID`),
  KEY `b_idx` (`Team ID`),
  CONSTRAINT `b` FOREIGN KEY (`Team ID`) REFERENCES `Team` (`Team ID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoachTeam`
--

LOCK TABLES `CoachTeam` WRITE;
/*!40000 ALTER TABLE `CoachTeam` DISABLE KEYS */;
INSERT INTO `CoachTeam` VALUES (1,41),(2,42),(3,43),(4,44),(5,45),(6,46),(7,47),(8,48);
/*!40000 ALTER TABLE `CoachTeam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Coachs`
--

DROP TABLE IF EXISTS `Coachs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Coachs` (
  `Coach ID` int NOT NULL,
  `Team` varchar(45) NOT NULL,
  `Coach Name` varchar(45) NOT NULL,
  `Cups Won` varchar(45) NOT NULL DEFAULT '0',
  `Date Hired` date NOT NULL,
  `Date Fired/Last day on the Job` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Coach Name`),
  KEY `Team_idx` (`Team`),
  KEY `c_idx` (`Coach ID`),
  CONSTRAINT `f` FOREIGN KEY (`Coach ID`) REFERENCES `CoachTeam` (`Coach ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coachs`
--

LOCK TABLES `Coachs` WRITE;
/*!40000 ALTER TABLE `Coachs` DISABLE KEYS */;
INSERT INTO `Coachs` VALUES (43,'Washington Capitals','Barry Trotz','1','2014-05-26','2018-06-07 12:00:00'),(41,'Boston Bruins','Bruce Cassidy','0','2016-05-24','2022-06-06 12:00:00'),(48,'St. Louis Blues','Craig Berube','1','2018-11-19','2022-12-05 22:37:35'),(47,'Montreal Canadiens','Dominique Ducharme','0','2021-07-13','2022-02-09 12:00:00'),(44,'Vegas Golden Knights','Gerard Gallant','0','2017-04-13','2020-01-15 12:00:00'),(42,'Colorado Avalanche','Jared Bednar','1','2016-08-25','2022-12-05 22:37:35'),(45,'Tampa Bay Lightning','Jon Cooper','2','2013-03-25','2022-12-05 22:37:35'),(46,'Dallas Stars','Rick Bowness','0','2018-06-22','2022-05-20 12:00:00');
/*!40000 ALTER TABLE `Coachs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Finals`
--

DROP TABLE IF EXISTS `Finals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Finals` (
  `NHL Season` int NOT NULL AUTO_INCREMENT,
  `Winner` varchar(45) NOT NULL,
  `Loser` varchar(45) NOT NULL,
  `Series Score` varchar(45) NOT NULL,
  `Conn Smythe Winner` varchar(45) NOT NULL,
  `Series Winning Goal Scorer` varchar(45) NOT NULL,
  PRIMARY KEY (`NHL Season`),
  UNIQUE KEY `NHL Season_UNIQUE` (`NHL Season`)
) ENGINE=InnoDB AUTO_INCREMENT=2039 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Finals`
--

LOCK TABLES `Finals` WRITE;
/*!40000 ALTER TABLE `Finals` DISABLE KEYS */;
INSERT INTO `Finals` VALUES (2018,'Washington Capitals','Vegas Golden Knights','4-1','Alex Ovechkin','Lars Eller'),(2019,'St. Louis Blues','Boston Bruins','4-3','Ryan O\'Reilly','Alex Pietrangelo'),(2020,'Tampa Bay Lightning','Dallas Stars','4-2','Victor Hedman','Brayden Point'),(2021,'Tampa Bay Lightning','Montreal Canadiens','4-1','Andrei Vasilevskiy','Ross Colton'),(2022,'Colorado Avalanche','Tampa Bay Lightning','4-2','Cale Makar','Artturi Lehkonen');
/*!40000 ALTER TABLE `Finals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Finals Games Start Times (EST)`
--

DROP TABLE IF EXISTS `Finals Games Start Times (EST)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Finals Games Start Times (EST)` (
  `NHL season` int NOT NULL,
  `Game 1` datetime NOT NULL,
  `Game 2` datetime NOT NULL,
  `Game 3` datetime NOT NULL,
  `Game 4` datetime NOT NULL,
  `Game 5` datetime DEFAULT NULL,
  `Game 6` datetime DEFAULT NULL,
  `Game 7` datetime DEFAULT NULL,
  PRIMARY KEY (`Game 1`),
  UNIQUE KEY `Game 2_UNIQUE` (`Game 2`),
  KEY `x_idx` (`NHL season`),
  CONSTRAINT `x` FOREIGN KEY (`NHL season`) REFERENCES `Finals` (`NHL Season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Finals Games Start Times (EST)`
--

LOCK TABLES `Finals Games Start Times (EST)` WRITE;
/*!40000 ALTER TABLE `Finals Games Start Times (EST)` DISABLE KEYS */;
INSERT INTO `Finals Games Start Times (EST)` VALUES (2018,'2018-05-28 22:00:00','2018-05-30 22:00:00','2018-06-02 19:00:00','2018-06-04 19:00:00','2018-06-07 22:00:00',NULL,NULL),(2019,'2019-05-27 19:00:00','2019-05-29 19:00:00','2019-06-01 19:00:00','2019-06-03 19:00:00','2019-06-06 19:00:00','2019-06-09 19:00:00','2019-06-12 19:00:00'),(2020,'2020-09-19 19:00:00','2020-09-21 19:00:00','2020-09-23 19:00:00','2020-09-25 19:00:00','2020-09-26 19:00:00','2020-09-28 19:00:00',NULL),(2021,'2021-06-28 19:00:00','2021-06-30 19:00:00','2021-07-02 19:00:00','2021-07-05 19:00:00','2021-07-07 19:00:00',NULL,NULL),(2022,'2022-06-15 22:00:00','2022-06-18 22:00:00','2022-06-20 19:00:00','2022-06-22 19:00:00','2022-06-24 22:00:00','2022-06-26 19:00:00',NULL);
/*!40000 ALTER TABLE `Finals Games Start Times (EST)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Goalie Stats`
--

DROP TABLE IF EXISTS `Goalie Stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Goalie Stats` (
  `NHL Season` int NOT NULL,
  `Team` varchar(45) NOT NULL,
  `Goalie Name` varchar(45) NOT NULL,
  `Games Played` int NOT NULL,
  `Saves` int NOT NULL,
  `Shots_Against` int NOT NULL,
  `Save Percentage` decimal(4,3) GENERATED ALWAYS AS (((`Saves` * 1.000) / `Shots_Against`)) STORED,
  `Handedness` char(1) NOT NULL DEFAULT 'L',
  `Goalie Season ID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Goalie Season ID`),
  KEY `NHL Season_idx` (`NHL Season`),
  CONSTRAINT `a` FOREIGN KEY (`NHL Season`) REFERENCES `Finals` (`NHL Season`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Goalie Stats`
--

LOCK TABLES `Goalie Stats` WRITE;
/*!40000 ALTER TABLE `Goalie Stats` DISABLE KEYS */;
INSERT INTO `Goalie Stats` (`NHL Season`, `Team`, `Goalie Name`, `Games Played`, `Saves`, `Shots_Against`, `Handedness`, `Goalie Season ID`) VALUES (2022,'Colorado Avalanche','Darcy Kuemper',6,138,152,'L',1),(2022,'Colorado Avalanche','Pavel Francouz',1,10,11,'L',2),(2022,'Tampa Bay Lightning','Andrei Vasilevskiy',6,191,211,'L',3),(2021,'Montreal Canadiens','Carey Price',5,127,143,'L',4),(2021,'Tampa Bay Lightning','Andrei Vasilevskiy',5,132,140,'L',5),(2020,'Dallas Stars','Anton Khudobin',6,183,201,'L',6),(2020,'Dallas Stars','Jake Oettinger',1,3,3,'L',7),(2020,'Tampa Bay Lightning','Andrei Vasilevskiy',6,143,157,'L',8),(2019,'Boston Bruins','Tuukka Rask',7,176,193,'L',9),(2019,'St. Louis Blues','Jordan Binnington',7,187,205,'L',10),(2019,'St. Louis Blues','Jake Allen',1,3,4,'L',11),(2018,'Vegas Golden Knights','Marc-Andre Fluery',5,116,136,'L',12),(2018,'Washington Capitals','Braden Holtby',5,142,155,'L',13);
/*!40000 ALTER TABLE `Goalie Stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerTeam`
--

DROP TABLE IF EXISTS `PlayerTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlayerTeam` (
  `Player Season ID` int NOT NULL AUTO_INCREMENT,
  `Team ID` int NOT NULL,
  `PlayerTeamID` int NOT NULL,
  PRIMARY KEY (`PlayerTeamID`),
  KEY `Player Season ID_idx` (`Player Season ID`),
  KEY `ff_idx` (`Team ID`),
  CONSTRAINT `ff` FOREIGN KEY (`Team ID`) REFERENCES `Team` (`Team ID`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerTeam`
--

LOCK TABLES `PlayerTeam` WRITE;
/*!40000 ALTER TABLE `PlayerTeam` DISABLE KEYS */;
INSERT INTO `PlayerTeam` VALUES (211,1,1),(212,1,2),(213,1,3),(214,1,4),(215,1,5),(216,1,6),(217,1,7),(218,1,8),(219,1,9),(220,1,10),(221,1,11),(222,1,12),(223,1,13),(224,1,14),(225,1,15),(226,1,16),(227,1,17),(228,1,18),(229,1,19),(230,1,20),(231,1,21),(232,2,23),(233,2,24),(234,2,25),(235,2,26),(236,2,27),(237,2,28),(238,2,29),(239,2,30),(240,2,31),(241,2,32),(242,2,33),(243,2,34),(244,2,35),(245,2,36),(246,2,37),(247,2,38),(248,2,39),(249,2,40),(250,2,41),(251,2,42),(252,2,43),(253,3,44),(254,3,45),(255,3,46),(256,3,47),(257,3,48),(258,3,49),(259,3,50),(260,3,51),(261,3,52),(262,3,53),(263,3,54),(264,3,55),(265,3,56),(266,3,57),(267,3,58),(268,3,59),(269,3,60),(270,3,61),(271,3,62),(272,3,63),(273,4,64),(274,4,65),(275,4,66),(276,4,67),(277,4,68),(278,4,69),(279,4,70),(280,4,71),(281,4,72),(282,4,73),(283,4,74),(284,4,75),(285,4,76),(286,4,77),(287,4,78),(288,4,79),(289,4,80),(290,4,81),(291,4,82),(292,4,83),(293,4,84),(294,5,85),(295,5,86),(296,5,87),(297,5,88),(298,5,89),(299,5,90),(300,5,91),(301,5,92),(302,5,93),(303,5,94),(304,5,95),(305,5,96),(306,5,97),(307,5,98),(308,5,99),(309,5,100),(310,5,101),(311,5,102),(312,5,103),(313,5,104),(314,5,105),(315,5,106),(316,5,107),(317,5,108),(318,5,109),(319,5,110),(320,5,111),(321,5,112),(322,5,113),(323,5,114),(324,5,115),(325,5,116),(326,5,117),(327,5,118),(328,5,119),(329,5,120),(330,5,121),(331,5,122),(332,5,123),(333,5,124),(334,5,125),(335,5,126),(336,5,127),(337,5,128),(338,5,129),(339,5,130),(340,5,131),(341,5,132),(342,5,133),(343,5,134),(344,5,135),(345,5,136),(346,5,137),(347,5,138),(348,5,139),(349,5,140),(350,5,141),(351,5,142),(352,5,143),(353,5,144),(354,6,145),(355,6,146),(356,6,147),(357,6,148),(358,6,149),(359,6,150),(360,6,151),(361,6,152),(362,6,153),(363,6,154),(364,6,155),(365,6,156),(366,6,157),(367,6,158),(368,6,159),(369,6,160),(370,6,161),(371,6,162),(372,6,163),(373,6,164),(374,7,165),(375,7,166),(376,7,167),(377,7,168),(378,7,169),(379,7,170),(380,7,171),(381,7,172),(382,7,173),(383,7,174),(384,7,175),(385,7,176),(386,7,177),(387,7,178),(388,7,179),(389,7,180),(390,7,181),(391,7,182),(392,7,183),(393,7,184),(394,7,185),(395,7,186),(396,7,187),(397,7,188),(398,7,189),(399,8,190),(400,8,191),(401,8,192),(402,8,193),(403,8,194),(404,8,195),(405,8,196),(406,8,197),(407,8,198),(408,8,199),(409,8,200),(410,8,201),(411,8,202),(412,8,203),(413,8,204),(414,8,205),(415,8,206),(416,8,207),(417,8,208),(418,8,209),(419,8,210);
/*!40000 ALTER TABLE `PlayerTeam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayersStats`
--

DROP TABLE IF EXISTS `PlayersStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlayersStats` (
  `NHL Season` int NOT NULL,
  `Team` varchar(45) NOT NULL,
  `Player Name` longtext NOT NULL,
  `GamesPlayed` int NOT NULL,
  `Goals` int NOT NULL DEFAULT '0',
  `Assists` int NOT NULL DEFAULT '0',
  `Points` int GENERATED ALWAYS AS ((`Goals` + `Assists`)) STORED,
  `Points Per Game` decimal(3,2) GENERATED ALWAYS AS (((`Points` * 1.00) / `GamesPlayed`)) STORED,
  `Handedness` char(1) NOT NULL DEFAULT 'L',
  `Players Season ID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Players Season ID`),
  UNIQUE KEY `Players Season ID_UNIQUE` (`Players Season ID`),
  KEY `NHL Season_idx` (`NHL Season`),
  CONSTRAINT `NHL Season` FOREIGN KEY (`NHL Season`) REFERENCES `Finals` (`NHL Season`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayersStats`
--

LOCK TABLES `PlayersStats` WRITE;
/*!40000 ALTER TABLE `PlayersStats` DISABLE KEYS */;
INSERT INTO `PlayersStats` (`NHL Season`, `Team`, `Player Name`, `GamesPlayed`, `Goals`, `Assists`, `Handedness`, `Players Season ID`) VALUES (2022,'Colorado Avalanche','Nicolas Aube-Kubel',2,0,0,'R',1),(2022,'Colorado Avalanche','Andre Burakovsky',2,2,1,'L',2),(2022,'Colorado Avalanche','Bowen Byram',6,0,2,'L',4),(2022,'Colorado Avalanche','Andrew Cogliano',5,1,2,'L',5),(2022,'Colorado Avalanche','J.T Compher',6,0,1,'R',6),(2022,'Colorado Avalanche','Darren Helm',6,1,1,'L',7),(2022,'Colorado Avalanche','Erik Johnson',6,0,0,'R',8),(2022,'Colorado Avalanche','Jack Johnson',6,0,0,'L',9),(2022,'Colorado Avalanche','Nazem Kadri',3,1,0,'L',10),(2022,'Colorado Avalanche','Gabriel Landeskog',6,3,2,'L',11),(2022,'Colorado Avalanche','Artturi Lehkonen',6,2,1,'L',12),(2022,'Colorado Avalanche','Nathan Mackinnon',6,2,4,'R',13),(2022,'Colorado Avalanche','Cale Makar',6,3,4,'R',14),(2022,'Colorado Avalanche','Josh Manson',6,1,1,'R',15),(2022,'Colorado Avalanche','Alex Newhook',6,0,2,'L',16),(2022,'Colorado Avalanche','Valeri Nichushkin',6,4,2,'L',17),(2022,'Colorado Avalanche','Logan O\'Connor',6,0,1,'R',18),(2022,'Colorado Avalanche','Mikko Rantanen',6,0,8,'L',19),(2022,'Colorado Avalanche','Nico Sturm',6,0,1,'L',20),(2022,'Colorado Avalanche','Devon Toews',6,0,2,'L',21),(2022,'Tampa Bay Lightning','Pierre-Edouard Bellemare',6,0,0,'L',22),(2022,'Tampa Bay Lightning','Zach Bogosian',6,0,1,'R',23),(2022,'Tampa Bay Lightning','Erik Cernak',6,0,1,'R',24),(2022,'Tampa Bay Lightning','Anthony Cirelli',6,2,1,'L',25),(2022,'Tampa Bay Lightning','Ross Colton',6,0,1,'L',26),(2022,'Tampa Bay Lightning','Brandon Hagel',6,0,1,'L',27),(2022,'Tampa Bay Lightning','Victor Hedman',6,1,4,'L',28),(2022,'Tampa Bay Lightning','Alex Killorn',6,0,0,'L',29),(2022,'Tampa Bay Lightning','Nikita Kucherov',6,1,3,'L',30),(2022,'Tampa Bay Lightning','Pat Maroon',6,1,1,'L',31),(2022,'Tampa Bay Lightning','Ryan McDonagh',6,0,1,'L',32),(2022,'Tampa Bay Lightning','Riley Nash',4,0,0,'R',33),(2022,'Tampa Bay Lightning','Ondrej Palat',6,3,2,'L',34),(2022,'Tampa Bay Lightning','Nick Paul',6,2,0,'L',35),(2022,'Tampa Bay Lightning','Corey Perry',6,1,2,'R',36),(2022,'Tampa Bay Lightning','Brayden Point',2,0,1,'R',37),(2022,'Tampa Bay Lightning','Jan Rutta',6,1,1,'R',38),(2022,'Tampa Bay Lightning','Mikhail Sergachev',6,1,2,'L',39),(2022,'Tampa Bay Lightning','Steven Stamkos',6,2,2,'R',40),(2021,'Montreal Canadiens','Josh Anderson',5,2,0,'R',41),(2021,'Montreal Canadiens','Joel Armia',4,0,0,'R',42),(2021,'Montreal Canadiens','Paul Byron',5,0,0,'L',43),(2021,'Montreal Canadiens','Cole Caufield',5,0,3,'R',44),(2021,'Montreal Canadiens','Ben Chiarot',5,1,1,'L',45),(2021,'Montreal Canadiens','Phillip Danault',5,1,0,'L',46),(2021,'Montreal Canadiens','Joel Edmundson',5,0,0,'L',47),(2021,'Montreal Canadiens','Jake Evans',3,0,1,'R',48),(2021,'Montreal Canadiens','Brendan Gallagher',5,0,1,'R',49),(2021,'Montreal Canadiens','Erik Gustafsson',3,0,0,'L',50),(2021,'Montreal Canadiens','Jesperi Kotkaniemi',3,0,1,'L',51),(2021,'Montreal Canadiens','Brett Kulak',2,0,0,'L',52),(2021,'Montreal Canadiens','Artturi Lehkonen',5,0,0,'L',53),(2021,'Montreal Canadiens','Jonathon Merrill',3,0,0,'L',54),(2021,'Montreal Canadiens','Corey Perry',5,1,0,'R',55),(2021,'Montreal Canadiens','Jeff Petry',5,0,1,'R',56),(2021,'Montreal Canadiens','Alexander Romanov',2,1,0,'L',57),(2021,'Montreal Canadiens','Eric Staal',5,0,0,'L',58),(2021,'Montreal Canadiens','Nick Suzuki',5,2,1,'R',59),(2021,'Montreal Canadiens','Tyler Toffoli',5,0,0,'R',60),(2021,'Montreal Canadiens','Shea Weber',5,0,2,'R',61),(2021,'Tampa Bay Lightning','Erik Cernak',5,1,1,'R',62),(2021,'Tampa Bay Lightning','Anthony Cirelli',5,1,1,'L',63),(2021,'Tampa Bay Lightning','Blake Coleman',5,2,2,'L',64),(2021,'Tampa Bay Lightning','Ross Colton',5,1,0,'L',65),(2021,'Tampa Bay Lightning','Barclay Goodrow',5,1,3,'L',66),(2021,'Tampa Bay Lightning','Yanni Gourde',5,1,0,'L',67),(2021,'Tampa Bay Lightning','Victor Hedman',5,1,1,'L',68),(2021,'Tampa Bay Lightning','Tyler Johnson',5,2,2,'R',69),(2021,'Tampa Bay Lightning','Mathieu Joseph',4,0,2,'L',70),(2021,'Tampa Bay Lightning','Alex Killorn',1,0,0,'L',71),(2021,'Tampa Bay Lightning','Nikita Kucherov',5,3,2,'L',72),(2021,'Tampa Bay Lightning','Pat Maroon',5,1,0,'L',73),(2021,'Tampa Bay Lightning','Ryan McDonagh',5,0,3,'L',74),(2021,'Tampa Bay Lightning','Ondrej Palat',5,1,3,'L',75),(2021,'Tampa Bay Lightning','Brayden Point',5,0,3,'R',76),(2021,'Tampa Bay Lightning','Jan Rutta',5,1,1,'R',77),(2021,'Tampa Bay Lightning','David Savard',5,0,2,'R',78),(2021,'Tampa Bay Lightning','Mikhail Sergachev',5,0,1,'L',79),(2021,'Tampa Bay Lightning','Steven Stamkos',5,1,0,'R',80),(2020,'Dallas Stars','Jamie Benn',6,0,1,'L',81),(2020,'Dallas Stars','Nicholas Caamano',4,0,0,'L',82),(2020,'Dallas Stars','Andrew Cogliano',6,0,1,'L',83),(2020,'Dallas Stars','Blake Comeau',2,0,1,'R',84),(2020,'Dallas Stars','Jason Dickinson',6,2,0,'L',85),(2020,'Dallas Stars','Justin Dowling',2,0,0,'L',86),(2020,'Dallas Stars','Denis Gurianov',6,0,0,'L',87),(2020,'Dallas Stars','Joel Hanley',6,1,0,'L',88),(2020,'Dallas Stars','Miro Heiskanen',6,1,3,'L',89),(2020,'Dallas Stars','Roope Hintz',4,0,2,'L',90),(2020,'Dallas Stars','Mattias Janmark',6,1,2,'L',91),(2020,'Dallas Stars','Joel Kiviranta',6,1,0,'L',92),(2020,'Dallas Stars','John Klingberg',6,1,4,'R',93),(2020,'Dallas Stars','Esa Lindell',6,0,2,'L',94),(2020,'Dallas Stars','Jamie Oleksiak',6,1,1,'L',95),(2020,'Dallas Stars','Joe Pavelski',6,4,1,'R',96),(2020,'Dallas Stars','Corey Perry',6,3,0,'R',97),(2020,'Dallas Stars','Alexander Radulov',6,0,4,'L',98),(2020,'Dallas Stars','Tyler Seguin',6,0,5,'R',99),(2020,'Dallas Stars','Andrej Sekera',6,0,0,'L',100),(2020,'Tampa Bay Lightning','Zach Bogosian',2,0,0,'R',103),(2020,'Tampa Bay Lightning','Erik Cernak',6,0,0,'R',104),(2020,'Tampa Bay Lightning','Anthony Cirelli',6,0,3,'L',105),(2020,'Tampa Bay Lightning','Blake Coleman',6,1,2,'L',106),(2020,'Tampa Bay Lightning','Barclay Goodrow',6,0,1,'L',107),(2020,'Tampa Bay Lightning','Yanni Gourde',6,2,0,'L',108),(2020,'Tampa Bay Lightning','Victor Hedman',6,1,6,'L',109),(2020,'Tampa Bay Lightning','Tyler Johnson',6,0,0,'R',110),(2020,'Tampa Bay Lightning','Alex Killorn',6,1,1,'L',111),(2020,'Tampa Bay Lightning','Nikita Kucherov',6,1,7,'L',112),(2020,'Tampa Bay Lightning','Pat Maroon',6,0,2,'L',113),(2020,'Tampa Bay Lightning','Ryan McDonagh',6,0,0,'L',114),(2020,'Tampa Bay Lightning','Ondrej Palat',6,3,2,'L',115),(2020,'Tampa Bay Lightning','Cedric Paquette',6,0,1,'L',116),(2020,'Tampa Bay Lightning','Brayden Point',6,5,3,'R',117),(2020,'Tampa Bay Lightning','Jan Rutta',4,0,1,'R',124),(2020,'Tampa Bay Lightning','Luke Schenn',1,0,0,'R',125),(2020,'Tampa Bay Lightning','Mikhail Sergachev',6,1,2,'L',126),(2020,'Tampa Bay Lightning','Kevin Shattenkirk',6,2,2,'R',127),(2020,'Tampa Bay Lightning','Steven Stamkos',1,1,0,'R',128),(2020,'Tampa Bay Lightning','Carter Verhaeghe',3,0,0,'L',129),(2020,'Tampa Bay Lightning','Alexander Volkov',1,0,0,'L',130),(2019,'Boston Bruins','Noel Acciari',7,1,1,'R',131),(2019,'Boston Bruins','David Backes',4,0,0,'R',132),(2019,'Boston Bruins','Patrice Bergeron',7,1,3,'R',133),(2019,'Boston Bruins','Brandon Carlo',7,2,0,'R',134),(2019,'Boston Bruins','Zdeno Chara',7,1,2,'L',135),(2019,'Boston Bruins','Connor Clifton',6,1,1,'R',136),(2019,'Boston Bruins','Charlie Coyle',7,3,1,'R',137),(2019,'Boston Bruins','Jake Debrusk',7,1,3,'L',138),(2019,'Boston Bruins','Matt Grzelcyk',3,1,0,'L',139),(2019,'Boston Bruins','Danton Heinen',7,0,1,'L',140),(2019,'Boston Bruins','Marcus Johansson',7,1,1,'L',141),(2019,'Boston Bruins','Steven Kampfer',1,0,0,'L',142),(2019,'Boston Bruins','David Krejci',7,0,2,'R',143),(2019,'Boston Bruins','Torey Krug',7,1,5,'L',144),(2019,'Boston Bruins','Karson Kuhlman',2,1,0,'L',145),(2019,'Boston Bruins','Sean Kuraly',7,2,3,'L',146),(2019,'Boston Bruins','Brad Marchand',7,2,3,'L',147),(2019,'Boston Bruins','Charlie McAvoy',7,1,0,'R',148),(2019,'Boston Bruins','John Moore',5,0,0,'L',149),(2019,'Boston Bruins','Joakim Nordstrom',7,1,3,'L',150),(2019,'Boston Bruins','David Pastrnak',7,2,2,'L',151),(2019,'St. Louis Blues','Ivan Barbashev',6,1,0,'L',152),(2019,'St. Louis Blues','Sammy Blais',7,0,0,'L',153),(2019,'St. Louis Blues','Robert Bortuzzo',5,1,0,'R',154),(2019,'St. Louis Blues','Jay Bouwmeester',7,0,2,'L',155),(2019,'St. Louis Blues','Tyler Bozak',7,0,3,'R',156),(2019,'St. Louis Blues','Vince Dunn',4,0,1,'L',157),(2019,'St. Louis Blues','Joel Edmundson',5,0,0,'L',158),(2019,'St. Louis Blues','Robby Fabri',2,0,0,'L',159),(2019,'St. Louis Blues','Carl Gunnarsson',7,1,2,'L',160),(2019,'St. Louis Blues','Pat Maroon',7,0,0,'L',161),(2019,'St. Louis Blues','Ryan O\'Reilly',7,5,4,'L',162),(2019,'St. Louis Blues','Colton Parayko',7,1,0,'R',163),(2019,'St. Louis Blues','David Perron',7,1,2,'R',164),(2019,'St. Louis Blues','Alex Pietrangelo',7,1,5,'R',165),(2019,'St. Louis Blues','Zach Sanford',5,1,3,'L',166),(2019,'St. Louis Blues','Brayden Schenn',7,3,2,'L',167),(2019,'St. Louis Blues','Jaden Schwartz',7,0,4,'L',168),(2019,'St. Louis Blues','Alex Steen',7,0,1,'L',169),(2019,'St. Louis Blues','Oskar Sundqvist',6,0,1,'R',170),(2019,'St. Louis Blues','Vladimir Tarasenko',7,3,1,'L',171),(2019,'St. Louis Blues','Robert Thomas',2,0,0,'R',172),(2018,'Vegas Golden Knights','Pierre-Edouard Bellemare',5,0,2,'L',173),(2018,'Vegas Golden Knights','Ryan Carpenter',4,0,0,'R',174),(2018,'Vegas Golden Knights','William Carrier',1,0,0,'L',175),(2018,'Vegas Golden Knights','Cody Eakin',5,0,0,'L',176),(2018,'Vegas Golden Knights','Deryk Engelland',5,0,2,'L',177),(2018,'Vegas Golden Knights','Erik Haula',5,0,2,'L',178),(2018,'Vegas Golden Knights','William Karlsson',5,1,1,'L',179),(2018,'Vegas Golden Knights','Jonathan Marchessault',5,0,3,'R',180),(2018,'Vegas Golden Knights','Brayden McNabb',5,0,0,'L',181),(2018,'Vegas Golden Knights','Colin Miller',5,1,3,'R',182),(2018,'Vegas Golden Knights','James Neal',5,2,0,'L',183),(2018,'Vegas Golden Knights','Tomas Nosek',5,3,0,'L',184),(2018,'Vegas Golden Knights','David Perron',4,1,1,'R',185),(2018,'Vegas Golden Knights','Ryan Reaves',4,1,0,'R',186),(2018,'Vegas Golden Knights','Luca Sbisa',5,0,2,'L',187),(2018,'Vegas Golden Knights','Nate Schmidt',5,1,0,'L',188),(2018,'Vegas Golden Knights','Reilly Smith',5,3,3,'L',189),(2018,'Vegas Golden Knights','Tomas Tatar',2,0,1,'L',190),(2018,'Vegas Golden Knights','Shea Theodore',5,1,2,'L',191),(2018,'Vegas Golden Knights','Alex Tuch',5,0,1,'R',192),(2018,'Washington Capitals','Nicklas Backstrom',5,1,6,'L',193),(2018,'Washington Capitals','Jay Beagle',5,0,2,'R',194),(2018,'Washington Capitals','Andre Burakovsky',5,0,4,'L',195),(2018,'Washington Capitals','John Carlson',5,2,2,'R',196),(2018,'Washington Capitals','Brett Connolly',5,2,1,'R',197),(2018,'Washington Capitals','Christian Djoos',5,0,0,'R',198),(2018,'Washington Capitals','Lars Eller',5,2,2,'L',199),(2018,'Washington Capitals','Michal Kempny',5,1,2,'L',200),(2018,'Washington Capitals','Evgeny Kuznetsov',5,1,7,'L',201),(2018,'Washington Capitals','Matt Niskanen',5,0,1,'R',202),(2018,'Washington Capitals','Dmitry Orlov',5,0,0,'L',203),(2018,'Washington Capitals','Brooks Orpik',5,1,1,'L',204),(2018,'Washington Capitals','T.J Oshie',5,1,5,'R',205),(2018,'Washington Capitals','Alex Ovechkin',5,3,2,'R',206),(2018,'Washington Capitals','Devante Smith-Pelly',5,3,0,'R',207),(2018,'Washington Capitals','Chandler Stephenson',5,0,0,'L',208),(2018,'Washington Capitals','Jakub Vrana',5,1,1,'L',209),(2018,'Washington Capitals','Tom Wilson',5,2,1,'R',210);
/*!40000 ALTER TABLE `PlayersStats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team` (
  `Team ID` int NOT NULL,
  `Team Name` varchar(45) NOT NULL,
  `Team Abreviation` varchar(45) NOT NULL,
  PRIMARY KEY (`Team ID`),
  KEY `Team ID_idx` (`Team ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team`
--

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;
INSERT INTO `Team` VALUES (1,'Boston Bruins','BOS'),(2,'Colorado Avalanche','COL'),(3,'Washington Capitals','WAS'),(4,'Vegas Golden Knights','VGK'),(5,'Tampa Bay Lightning','TB'),(6,'Dallas Stars','DAL'),(7,'Montreal Canadiens','MTL'),(8,'St. Louis Blues','STL');
/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-15 16:36:50
