CREATE DATABASE  IF NOT EXISTS `urldimunch` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `urldimunch`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: urldimunch
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
-- Table structure for table `imgordini`
--

DROP TABLE IF EXISTS `imgordini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imgordini` (
  `idimgOrdini` int NOT NULL,
  `idOrdine` varchar(45) DEFAULT NULL,
  `image` mediumblob,
  PRIMARY KEY (`idimgOrdini`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imgordini`
--

LOCK TABLES `imgordini` WRITE;
/*!40000 ALTER TABLE `imgordini` DISABLE KEYS */;
/*!40000 ALTER TABLE `imgordini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listaordini`
--

DROP TABLE IF EXISTS `listaordini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listaordini` (
  `idOrdine` varchar(45) NOT NULL,
  `nomeProdotto` varchar(1000) NOT NULL,
  `idProdotto` varchar(1000) NOT NULL,
  `quantità` varchar(1000) DEFAULT NULL,
  `idUtente` varchar(45) NOT NULL,
  `prezzo` double NOT NULL,
  `dataOrdine` date NOT NULL,
  `indirizzoConsegna` varchar(100) NOT NULL,
  `iva` double NOT NULL,
  PRIMARY KEY (`idOrdine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listaordini`
--

LOCK TABLES `listaordini` WRITE;
/*!40000 ALTER TABLE `listaordini` DISABLE KEYS */;
INSERT INTO `listaordini` VALUES ('ord-157027494','Notte Stellata','3_Notte',NULL,'admin',259,'2023-07-03','LucaAbate, 32',22),('ord-199015920','Notte Stellata','3_Notte',NULL,'admin',259,'2023-07-03','LucaAbate, 32',22),('ord-230806768','Notte Stellata&Venere','3_Notte&1_Venere',NULL,'a',503,'2023-07-01','empty',22),('ord-251251205','Notte Stellata','3_Notte',NULL,'Michele',259,'2023-07-02','empty',22),('ord-308215366','Notte Stellata','3_Notte',NULL,'admin',747,'2023-07-03','LucaAbate, 32',22),('ord-36130111','Notte Stellata','3_Notte',NULL,'admin',259,'2023-07-03','LucaAbate, 32',22),('ord-386615235','Notte Stellata&Venere&Guernica','3_Notte&1_Venere&4_Guernica',NULL,'admin',706.74,'2023-07-03','LucaAbate, 32',22),('ord-42938973','Notte Stellata&Venere','3_Notte&1_Venere',NULL,'admin',503,'2023-07-03','LucaAbate, 32',22),('ord-468669397','Notte Stellata&aaaa','3_Notte&aaaa',NULL,'admin',529.84,'2023-07-03','LucaAbate, 32',22),('ord-480390573','Venere&Guernica','1_Venere&4_Guernica',NULL,'Michele',462.74,'2023-07-02','empty',22),('ord-584815311','Venere&Guernica','1_Venere&4_Guernica',NULL,'admin',462.74,'2023-07-03','LucaAbate, 32',22),('ord-598481604','pazzo&Notte Stellata','pazzo&3_Notte',NULL,'a',261.44,'2023-07-01','empty',22),('ord-7028136','Venere&Notte Stellata&aaaa','1_Venere&3_Notte&aaaa',NULL,'admin',773.84,'2023-07-03','LucaAbate, 32',22),('ord-820396432','Notte Stellata','3_Notte',NULL,'3_Notte',259,'2023-06-28','empty',22),('ord-862062904','Venere&Guernica','1_Venere&4_Guernica',NULL,'admin',462.74,'2023-07-03','LucaAbate, 32',22),('ord-868988559','Notte Stellata&Venere&Guernica','3_Notte&1_Venere&4_Guernica',NULL,'admin',706.74,'2023-07-03','LucaAbate, 32',22),('ord-907500005','Venere&Guernica','1_Venere&4_Guernica',NULL,'admin',462.74,'2023-07-03','LucaAbate, 32',22),('ord-918283182','Notte Stellata&Venere','3_Notte&1_Venere',NULL,'3_Notte&1_Venere',503,'2023-07-01','empty',22),('ord-971922035','Notte Stellata&Venere','3_Notte&1_Venere',NULL,'admin',503,'2023-07-03','LucaAbate, 32',22),('ord-97529639','Venere&Guernica','1_Venere&4_Guernica',NULL,'admin',462.74,'2023-07-03','LucaAbate, 32',22),('ord-983697640','Notte Stellata&aaaa','3_Notte&aaaa',NULL,'3_Notte&aaaa',773.84,'2023-06-28','empty',22);
/*!40000 ALTER TABLE `listaordini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `idProdotto` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `artista` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `epoca` varchar(45) DEFAULT NULL,
  `dimensioni` varchar(45) DEFAULT NULL,
  `descrizione` varchar(1000) DEFAULT NULL,
  `quantità` int DEFAULT NULL,
  `iva` double DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `imagepath` varchar(100) DEFAULT NULL,
  `immagine` mediumblob,
  PRIMARY KEY (`idProdotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES ('1_Venere','Venere','Botticelli','Quadro','Vecchia','20*20','Venere dipinta da Botticelli',984,22,200,'/image/venere.jpg',NULL),('2_Urlo','Urlo di Munch','Munch','Quadro','Vecchia','30*30','L\'urlo di Munch dipinto dall\'Omonimo',999,22,450,'/image/urlo.jpg',NULL),('3_Notte','Notte Stellata','Van Gogh','Quadro','Vecchia','20*20','Notte stellata di Van Gogh',-4369,22,200,'/image/notte.jpg',NULL),('4_Guernica','Guernica','Picasso','Quadro','Vecchia','20*20','Guernica di Picasso',989,22,167,'/image/guernica.jpg',NULL),('5_Gioconda','Gioconda','Lenoardo Da Vinci','Quadro','Vecchia','30*30','La famosa Gioconda di Leonardo da Vinci',999,22,432,'/image/gioconda.png',NULL),('aaaa','aaaa','a','a','a','aa','a',996,22,222,NULL,NULL),('b','b','b','b','b','b','b',34,33,223,NULL,NULL),('pazzo','pazzo','veramente pazzo','pazzissimo','pazza','pazze','pazza descrizione',11,22,2,NULL,NULL);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recensione`
--

DROP TABLE IF EXISTS `recensione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recensione` (
  `idrecensione` int NOT NULL,
  `idProdotto` varchar(45) DEFAULT NULL,
  `idUtente` varchar(45) DEFAULT NULL,
  `recensione` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idrecensione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recensione`
--

LOCK TABLES `recensione` WRITE;
/*!40000 ALTER TABLE `recensione` DISABLE KEYS */;
/*!40000 ALTER TABLE `recensione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `idutente` varchar(45) NOT NULL,
  `password` varchar(16) NOT NULL,
  `nome` varchar(45) NOT NULL DEFAULT 'empty',
  `cognome` varchar(45) NOT NULL DEFAULT 'empty',
  `email` varchar(65) NOT NULL,
  `carta` varchar(19) NOT NULL DEFAULT 'empty',
  `telefono` varchar(13) NOT NULL DEFAULT 'empty',
  `indirizzoFatturazione` varchar(100) NOT NULL DEFAULT 'empty',
  `indirizzoSpedizione` varchar(100) NOT NULL DEFAULT 'empty',
  `amministratore` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idutente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('admin','Ab123456','SonoIO','Parito','lucaabate@csa.com','xxxxxxxxxxxx1111','333 222 1112','LucaAbate','LucaAbate, 32',1);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'urldimunch'
--

--
-- Dumping routines for database 'urldimunch'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-04 20:50:10
