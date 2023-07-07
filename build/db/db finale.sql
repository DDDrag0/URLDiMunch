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
  `quantita` varchar(1000) NOT NULL,
  `imagepath` varchar(10000) NOT NULL,
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
INSERT INTO `listaordini` VALUES ('ord-587540054','Notte Stellata&Guernica','3_Notte&4_Guernica','3&1','/image/notte.jpg&/image/guernica.jpg','admin',950.74,'2023-07-07','LucaAbate, 32',22);
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
  `nome` varchar(1000) NOT NULL,
  `artista` varchar(1000) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `epoca` varchar(45) DEFAULT NULL,
  `dimensioni` varchar(45) DEFAULT NULL,
  `descrizione` varchar(1000) DEFAULT NULL,
  `quantità` int DEFAULT NULL,
  `iva` double DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `imagepath` varchar(1000) DEFAULT NULL,
  `dataaggiunta` date DEFAULT NULL,
  PRIMARY KEY (`idProdotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES ('1_Venere','Venere','Botticelli','Quadro','Vecchia','20*20','Venere dipinta da Botticelli',984,22,200,'/image/venere.jpg',NULL),('2_Urlo','Urlo di Munch','Munch','Quadro','Vecchia','30*30','L\'urlo di Munch dipinto dall\'Omonimo',999,22,450,'/image/urlo.jpg',NULL),('3_Notte','Notte Stellata','Van Gogh','Quadro','Vecchia','20*20','Notte stellata di Van Gogh',-4372,22,200,'/image/notte.jpg',NULL),('4_Guernica','Guernica','Picasso','Quadro','Vecchia','20*20','Guernica di Picasso',988,22,167,'/image/guernica.jpg',NULL),('5_Gioconda','Gioconda','Lenoardo Da Vinci','Quadro','Vecchia','30*30','La famosa Gioconda di Leonardo da Vinci',999,22,432,'/image/gioconda.png',NULL),('prod-20560','Composition with Red, Blue, and Yellow','Piet Mondrian','Painting','1900-2000','40cm x 40cm','Questo quadro astratto rappresenta l\'essenza della pittura neoplasticista di Mondrian. Caratterizzato da linee rette, forme geometriche e l\'uso di colori primari, è considerato un\'icona del movimento De Stijl.',543,22,90,'/image/Piet_Mondriaan,_1930_-_Mondrian_Composition_II_in_Red,_Blue,_and_Yellow.jpg','2023-07-07'),('prod-30078','Nighthawks','Edward Hopper','Painting','before 1500','70cm x 100cm','Questo dipinto realista americano ritrae un gruppo di persone solitarie in un locale notturno. La composizione suggestiva, l\'uso del colore e l\'atmosfera di solitudine hanno reso questo quadro un\'icona dell\'arte moderna.',232,22,134,'/image/Hopper_Nighthawks.jpg','2023-07-07'),('prod-59546','Il giardino delle delizie','Hieronymus Bosch','Painting','1500-1600','100cm x 70cm','Questo dipinto surrealista del Rinascimento olandese è noto per la sua complessità e il suo simbolismo enigmatico. Raffigura una scena paradisiaca nella parte sinistra, una scena di peccato e desiderio al centro e una visione apocalittica dell\'inferno nella parte destra.',322,22,323,'/image/El_jardín_de_las_Delicias,_de_El_Bosco.jpg','2023-07-07'),('prod-82604','Persistenza della Memoria','Salvador Dali','Painting','before 1500','40cm x 40cm','\r\nLa Persistenza della Memoria è un celebre dipinto di Salvador Dalí creato nel 1931. È un\'opera surrealista che rappresenta un paesaggio desertico con orologi molli e deformati. Gli orologi pendono da rami di alberi morti o giacciono sul terreno, creando un senso di tempo fluido e instabile. Il quadro è dipinto ad olio su tela e misura 24 x 33 cm. È custodito nel Museum of Modern Art di New York. La scena si svolge in un ambiente lunare con un mare tranquillo sullo sfondo. Questa immagine surreale sfida la nostra percezione convenzionale del tempo. La Persistenza della Memoria è diventata un\'icona dell\'arte surrealista, simbolo dell\'interesse di Dalí per l\'inconscio e la psicoanalisi. L\'opera invita a esplorare le profondità dell\'inconscio e a riflettere sulla relatività del tempo e della realtà.',233,22,75,'/image/salvador-dali-persistenza-memoria.jpg','2023-07-06');
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
INSERT INTO `recensione` VALUES (2321321,'2_Urlo','Francuccio','veramente bello'),(3213213,'2_Urlo','Felice','sono felice'),(64322721,'2_Urlo','admin','spettacolare sto quadro!'),(312321313,'2_Urlo','Lucariello','Ottimo servizio'),(778647919,'1_Venere','admin','un quadro eccezzionale!');
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
INSERT INTO `utente` VALUES ('admin','Ab123456','SonoIO','Parito','lucaabate@csa.com','xxxxxxxxxxxx1111','333 222 1112','LucaAbate','LucaAbate, 32',1),('banana','Banana123','empty','empty','banana@s','empty','empty','empty','empty',0),('Ciao','Hsasd232','empty','empty','sicaio@ahhaha','empty','empty','empty','empty',0),('dsadsadas','dsdadsadas2A','empty','empty','Adasdsa@asd','empty','empty','empty','empty',0);
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

-- Dump completed on 2023-07-07  2:46:15
