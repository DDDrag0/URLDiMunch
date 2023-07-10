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
INSERT INTO `listaordini` VALUES ('ord-586018633','The Wave&David&Venus&The Little Mermaid','prod-1213&prod-1212&prod-1111&prod-1512','2&1&1&1','/image/urasawa.jpg&/image/David.png&/image/VenereMilo.jpg&/image/sirenetta.jpg','admin',3797,'2023-07-10','LucaAbate, 32',22);
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
INSERT INTO `prodotto` VALUES ('prod-1021','Self-Portrait without Beard','Vincent van Gogh','Painting','1889','70cm x 100cm','Van Gogh\'s self-portraits offer glimpses into his inner world. Own a replica of this introspective piece, showcasing the artist\'s distinctive style and capturing his essence',3213,22,500,'/image/vanghogritratto.jpg','2023-07-08'),('prod-1111','Venus','Milo','Statue','100 BC','40cm','This iconic ancient Greek sculpture celebrates the timeless beauty of the female form. Own a replica of this enduring symbol of grace and elegance, a true conversation piece for your home',434,22,600,'/image/VenereMilo.jpg','2023-07-08'),('prod-1212','David','Michelangelo ','Statue','1501-1504','60cm','Michelangelo\'s masterpiece captures the strength and beauty of the biblical hero. Display a replica of this Renaissance sculpture and appreciate the exquisite craftsmanship that made it legendary',533,22,800,'/image/David.png','2023-07-07'),('prod-1213','The Wave','Hokusai','Painting','1800-1900','100cm x 70cm','This iconic artwork depicts a breathtaking ocean scene with a large wave rising ominously near Mount Fuji. This 19th-century ukiyo-e painting captures the energy and power of nature, becoming one of the art world\'s most recognizable and beloved masterpieces. With this high-quality replica, you will be able to bring home the dynamic atmosphere and distinctive aesthetics of Hokusai. Every detail, from the signature wave style to the bold use of color, is faithfully reproduced to give you an authentic experience. Add a touch of beauty and serenity to your home with this magnificent reproduction of \"Hokusai\'s Wave\"',319,22,600,'/image/urasawa.jpg','2023-07-09'),('prod-1312','The Pietà','Michelangelo ','Statue','1498-1499','100cm','This poignant depiction of the Virgin Mary cradling the body of Jesus reflects Michelangelo\'s unparalleled talent. Showcase a replica of this emotionally charged sculpture, embodying compassion and spiritual devotion',234,22,900,'/image/Pieta.jpg','2023-07-08'),('prod-1412','Statue of Liberty','Frédéric Auguste Bartholdi','Statue','1886','60cm','This iconic symbol of freedom and democracy stands tall in New York Harbor. Own a replica of Lady Liberty, a reminder of hope and the pursuit of liberty for all',543,22,700,'/image/statuaLiberta.jpg','2023-07-08'),('prod-1512','The Little Mermaid','Edvard Eriksen','Statue','1913','40cm','Inspired by Hans Christian Andersen\'s fairytale, this sculpture captures the allure and enchantment of the mermaid. Adorn your space with a replica, evoking a sense of magic and wonder',542,22,500,'/image/sirenetta.jpg','2023-07-07'),('prod-1612','The Thinker','Auguste Rodin ','Statue','1902','60cm','Rodin\'s contemplative masterpiece invites reflection and introspection. Display a replica of this iconic sculpture, encouraging thought and adding a touch of intellectualism to your decor',134,22,600,'/image/pensatore.jpg','2023-07-08'),('prod-1712','Winged Victory of Samothrace','Pitocrito','Statue','190 BC','40cm','This Hellenistic sculpture embodies the triumph of victory. Own a replica of this majestic statue, capturing the dynamic energy and sense of triumph in your own space',543,22,700,'/image/vittoriaalata.jpg','2023-07-08'),('prod-1812','Apollo Belvedere','Giovanni Angelo Montorsoli','Statue','120-140 AD','60cm','This ancient Roman sculpture represents the god Apollo. Bring classical beauty and mythological allure into your home with a replica of this remarkable artwork',412,22,800,'/image/apollodibelvedere.jpg','2023-07-07'),('prod-1932','Discobolus','Myron ','Statue','460-450 BC','40cm','This ancient Greek sculpture immortalizes the athletic skill of a discus thrower. Display a replica of this dynamic artwork, celebrating the human body\'s strength and precision',124,22,600,'/image/discobolo.jpg','2023-07-09'),('prod-2123','Mona Lisa','Leonardo da Vinci','Painting','1500-1600','70cm x 100cm','The enigmatic smile of the \"Mona Lisa\" has captivated audiences for centuries. Own a replica of this timeless masterpiece, meticulously recreated with attention to detail',534,22,900,'/image/gioconda.png','2023-07-08'),('prod-2154','Ardabil Carpet','Cultural carpet','Carpet','1539-1540','240 cm x 330 cm','Replicate the intricate patterns and rich colors of this Persian carpet, representing a true work of art for your floors. Crafted with meticulous detail, this replica radiates elegance and cultural heritage',645,22,400,'/image/Ardabil.jpg','2023-07-07'),('prod-2265','Pazyryk Carpet','Cultural carpet','Carpet','4th-5th century BC','150 cm x 240 cm','Inspired by the ancient Scythian carpet, this replica evokes a sense of history and craftsmanship. Adorn your space with this cultural treasure, showcasing exquisite designs and vibrant colors',756,22,500,'/image/Pazyryk.jpg','2023-07-07'),('prod-2376','Bayeux Tapestry','Cultural carpet','Carpet','11th century','350 cm x 450 cm','Recreate the historical narrative of the Norman conquest of England with this replica of the Bayeux Tapestry. Marvel at the intricate embroidery and relive this captivating piece of history in your own home',876,22,600,'/image/Bayeux.jpg','2023-07-07'),('prod-2442','Aubusson Carpet','Cultural carpet','Carpet','17th-18th century','240 cm x 330 cm','Embrace the elegance of French tradition with a replica of an Aubusson carpet. This intricately woven piece showcases delicate motifs and pastel colors, adding sophistication to your interior',243,22,400,'/image/Aubusson.jpg','2023-07-07'),('prod-2512','Sardarabad Carpet','Cultural carpet','Carpet','20th century','150 cm x 240 cm','An Armenian carpet that embodies the cultural and artistic heritage of Armenia. This high-quality replica features traditional motifs and a combination of vibrant colors that bring a touch of tradition and warmth to your home',432,22,500,'/image/Sardarabad.jpg','2023-07-07'),('prod-2632','Isfahan Carpet','Cultural carpet','Carpet','20th century','350 cm x 450 cm','A Persian carpet with intricate design and exceptional craftsmanship. This fascinating replica reflects the elegance and sophistication of the original, adding a touch of luxury to your space',134,22,600,'/image/Isfahan.jpg','2023-07-07'),('prod-3123','Starry Night','Vincent van Gogh','Painting','1800-1900','100cm x 70cm','Van Gogh\'s swirling night sky and luminous stars come to life in this replica. Experience the emotional intensity of this iconic artwork in your own space',312,22,800,'/image/notte.jpg','2023-07-07'),('prod-4123','The Last Supper','Leonardo da Vinci','Painting','1495-1498','100cm x 70cm','This profound depiction of Jesus and his disciples captures a pivotal moment in biblical history. Display a faithful replica of this renowned mural and bring its spiritual significance into your home',123,22,1200,'/image/cena.png','2023-07-08'),('prod-5123','Guernica','Pablo Picasso','Painting','1937','100cm x 70cm','Picasso\'s powerful anti-war statement conveys the horrors of conflict and the suffering it inflicts on innocent lives. Showcase this replica and make a bold statement against violence and injustice',432,22,900,'/image/guernica.jpg','2023-07-09'),('prod-6123','The Birth of Venus','Sandro Botticelli','Painting','1484-1486','100cm x 70cm','Botticelli\'s masterpiece portrays the goddess of love emerging from the sea. This replica captures the grace and beauty of Venus, adding a touch of classical elegance to your surroundings',142,22,800,'/image/venere.jpg','2023-07-09'),('prod-7123','The Kiss','Gustav Klimt','Painting','1907-1908','70cm x 100cm','Klimt\'s sensual and ornate artwork celebrates love and passion. Revel in the golden hues and intricate details of this replica, infusing your space with romance and artistic allure',321,22,700,'/image/Klimt_Il_Bacio.jpg','2023-07-08'),('prod-8123','The Scream','Edvard Munch','Painting','1893','70cm x 100cm','Munch\'s iconic portrayal of existential anguish is instantly recognizable. This replica vividly captures the emotional intensity of the original, making a thought-provoking addition to your collection',534,22,600,'/image/urlo.jpg','2023-07-08'),('prod-9123','The Persistence of Memory','Salvador Dalí','Painting','1931','100cm x 70cm','Dalí\'s surrealist masterpiece challenges our perception of time. Display this replica, with its melting clocks and dreamlike imagery, and evoke a sense of wonder and introspection',324,22,700,'/image/persistenza.jpg','2023-07-08');
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
INSERT INTO `recensione` VALUES (2321321,'2_Urlo','Francuccio','veramente bello'),(778647919,'1_Venere','admin','un quadro eccezzionale!');
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
INSERT INTO `utente` VALUES ('admin','Ab123456','Admin','Admin','lucaabate@csa.com','xxxxxxxxxxxx1111','333 222 1112','LucaAbate','LucaAbate, 32',1),('banana','Banana123','empty','empty','banana@s','empty','empty','empty','empty',0);
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

-- Dump completed on 2023-07-10  9:11:55
