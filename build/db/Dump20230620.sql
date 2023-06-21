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
-- Table structure for table `listaordini`
--

DROP TABLE IF EXISTS `listaordini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listaordini` (
  `idOrdine` varchar(45) NOT NULL,
  `nomeProdotto` varchar(1000) NOT NULL,
  `idProdotto` varchar(1000) NOT NULL,
  `prezzo` double NOT NULL,
  `dataOrdine` varchar(45) NOT NULL,
  `dataConsegna` varchar(45) NOT NULL,
  `dataArrivo` varchar(45) NOT NULL,
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
  `artista` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `epoca` varchar(45) NOT NULL,
  `dimensioni` varchar(45) NOT NULL,
  `descrizione` varchar(1000) NOT NULL,
  `quantità` int NOT NULL,
  `iva` double NOT NULL,
  `prezzo` double NOT NULL,
  `imagepath` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProdotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES ('1_Venere','Venere','Botticelli','Quadro','Vecchia','20*20','Venere dipinta da Botticelli',4,22,200,'/image/venere.jpg'),('2_Urlo','Urlo di Munch','Munch','Quadro','Vecchia','30*30','L\'urlo di Munch dipinto dall\'Omonimo',5,22,450,'/image/urlo.jpg'),('3_Notte','Notte Stellata','Van Gogh','Quadro','Vecchia','20*20','Notte stellata di Van Gogh',2,22,200,'/image/notte.jpg'),('4_Guernica','Guernica','Picasso','Quadro','Vecchia','20*20','Guernica di Picasso',6,22,167,'/image/guernica.jpg'),('5_Gioconda','Gioconda','Lenoardo Da Vinci','Quadro','Vecchia','30*30','La famosa Gioconda di Leonardo da Vinci',7,22,432,'/image/gioconda.png');
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
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
  `carta` varchar(16) NOT NULL DEFAULT 'empty',
  `telefono` varchar(10) NOT NULL DEFAULT 'empty',
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
INSERT INTO `utente` VALUES ('gennarin','gg','vai','gennaro','pis311in@gmail.com','empty','sei','troppo','forte',0),('Gennaro','gennaro','Gennaro','Nero','xde@gmail.com','32132132','312233','indFatt','IndSped',0),('luca','luca','luca','palle','asdadsad','non aggiunta','palle','palle','palle',0),('Michele200','michele','Michele','D\'Arienzo','michele@gmail.com','2232323','32323232','si ','no',1);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `idProdotto` varchar(45) NOT NULL,
  `idUtente` varchar(45) NOT NULL,
  PRIMARY KEY (`idProdotto`,`idUtente`),
  KEY `idUtente_idx` (`idUtente`),
  CONSTRAINT `idProdotto` FOREIGN KEY (`idProdotto`) REFERENCES `prodotto` (`idProdotto`),
  CONSTRAINT `idUtente` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idutente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
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

-- Dump completed on 2023-06-20 11:39:07
