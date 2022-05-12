CREATE DATABASE  IF NOT EXISTS `db_app_db2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_app_db2`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: db_app_db2
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `amizade_leitor`
--

DROP TABLE IF EXISTS `amizade_leitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amizade_leitor` (
  `leitor_1` bigint DEFAULT NULL,
  `leitor2` bigint DEFAULT NULL,
  UNIQUE KEY `amizade_unq` (`leitor_1`,`leitor2`),
  KEY `amizade_leitor_FK2` (`leitor2`),
  CONSTRAINT `amizade_leitor_FK` FOREIGN KEY (`leitor_1`) REFERENCES `leitor` (`leitor_ID`),
  CONSTRAINT `amizade_leitor_FK2` FOREIGN KEY (`leitor2`) REFERENCES `leitor` (`leitor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amizade_leitor`
--

LOCK TABLES `amizade_leitor` WRITE;
/*!40000 ALTER TABLE `amizade_leitor` DISABLE KEYS */;
INSERT INTO `amizade_leitor` VALUES (1,2),(1,3),(1,4),(2,3),(3,4),(4,3);
/*!40000 ALTER TABLE `amizade_leitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `NomeAutor` varchar(100) DEFAULT NULL,
  `NascimentoAutor` date DEFAULT NULL,
  `autor_id` bigint NOT NULL AUTO_INCREMENT,
  `Cpf` bigint DEFAULT NULL,
  PRIMARY KEY (`autor_id`),
  UNIQUE KEY `Cpf` (`Cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES ('Gerda','2019-11-27',1,22940954054),('Keane','2006-01-18',2,67110698033),('Eustace','2007-05-22',3,90854530037),('Shepard','1998-12-24',4,97649229025);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoria_livros`
--

DROP TABLE IF EXISTS `autoria_livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoria_livros` (
  `autoria_livro_FK` bigint DEFAULT NULL,
  `autoria_autor_FK` bigint DEFAULT NULL,
  KEY `autoria_livro_FK` (`autoria_livro_FK`),
  KEY `autoria_autor_FK` (`autoria_autor_FK`),
  CONSTRAINT `autoria_autor_FK` FOREIGN KEY (`autoria_autor_FK`) REFERENCES `autor` (`autor_id`),
  CONSTRAINT `autoria_livro_FK` FOREIGN KEY (`autoria_livro_FK`) REFERENCES `livro` (`livro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoria_livros`
--

LOCK TABLES `autoria_livros` WRITE;
/*!40000 ALTER TABLE `autoria_livros` DISABLE KEYS */;
INSERT INTO `autoria_livros` VALUES (1,1),(2,1),(1,2),(3,3),(4,4),(2,4),(6,2),(5,3);
/*!40000 ALTER TABLE `autoria_livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca_contem`
--

DROP TABLE IF EXISTS `biblioteca_contem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca_contem` (
  `biblioteca` int DEFAULT NULL,
  `livro` bigint DEFAULT NULL,
  KEY `contem_livro_fk` (`livro`),
  KEY `biblioteca_contem_fk` (`biblioteca`),
  CONSTRAINT `biblioteca_contem_fk` FOREIGN KEY (`biblioteca`) REFERENCES `biblioteca_leitor` (`id_biblioteca`),
  CONSTRAINT `contem_livro_fk` FOREIGN KEY (`livro`) REFERENCES `livro` (`livro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca_contem`
--

LOCK TABLES `biblioteca_contem` WRITE;
/*!40000 ALTER TABLE `biblioteca_contem` DISABLE KEYS */;
INSERT INTO `biblioteca_contem` VALUES (1,2),(1,3),(1,4),(2,5),(2,6),(3,3),(3,1),(3,4),(3,2),(3,6);
/*!40000 ALTER TABLE `biblioteca_contem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca_leitor`
--

DROP TABLE IF EXISTS `biblioteca_leitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca_leitor` (
  `id_biblioteca` int NOT NULL AUTO_INCREMENT,
  `nome_biblioteca` varchar(100) DEFAULT NULL,
  `proprietario_biblio` bigint DEFAULT NULL,
  PRIMARY KEY (`id_biblioteca`),
  KEY `dono_biblioteca_fk` (`proprietario_biblio`),
  CONSTRAINT `dono_biblioteca_fk` FOREIGN KEY (`proprietario_biblio`) REFERENCES `leitor` (`leitor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca_leitor`
--

LOCK TABLES `biblioteca_leitor` WRITE;
/*!40000 ALTER TABLE `biblioteca_leitor` DISABLE KEYS */;
INSERT INTO `biblioteca_leitor` VALUES (1,'Conto de fadas',2),(2,'Preferidos Do Cleber',1),(3,'Livros para Estudo',3);
/*!40000 ALTER TABLE `biblioteca_leitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratado`
--

DROP TABLE IF EXISTS `contratado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratado` (
  `contratado_editora_id_editora_FK` bigint DEFAULT NULL,
  `contratado_autor_id_autor_FK` bigint DEFAULT NULL,
  KEY `contratado_editora_id_editora_FK` (`contratado_editora_id_editora_FK`),
  KEY `contratado_autor_id_autor_FK` (`contratado_autor_id_autor_FK`),
  CONSTRAINT `contratado_ibfk_1` FOREIGN KEY (`contratado_editora_id_editora_FK`) REFERENCES `editora` (`editora_id`),
  CONSTRAINT `contratado_ibfk_2` FOREIGN KEY (`contratado_autor_id_autor_FK`) REFERENCES `autor` (`autor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratado`
--

LOCK TABLES `contratado` WRITE;
/*!40000 ALTER TABLE `contratado` DISABLE KEYS */;
INSERT INTO `contratado` VALUES (1,3),(2,3),(3,3),(1,3),(3,4),(4,2),(1,1);
/*!40000 ALTER TABLE `contratado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editora` (
  `Cnpj` varchar(20) DEFAULT NULL,
  `RazaoSocial` varchar(50) DEFAULT NULL,
  `Telefone` int DEFAULT NULL,
  `editora_id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`editora_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES ('75.521.498/0001-37','editora globo',987654545,1),('06.996.557/0001-00','editora Farroupilha',987654545,2),('12.873.418/0001-92','editora Caxias',987654545,3),('45.999.808/0001-62','editora LivruS',987654545,4);
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitor`
--

DROP TABLE IF EXISTS `leitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitor` (
  `leitor_nome` varchar(100) DEFAULT NULL,
  `leitor_cpf` varchar(11) DEFAULT NULL,
  `leitor_idade` date DEFAULT NULL,
  `leitor_ID` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`leitor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitor`
--

LOCK TABLES `leitor` WRITE;
/*!40000 ALTER TABLE `leitor` DISABLE KEYS */;
INSERT INTO `leitor` VALUES ('Cleber','22944954054','1997-11-27',1),('Luana','67115598033','1965-05-10',2),('monica','90856630037','1985-10-13',3),('eduardo','97647729025','1999-02-24',4);
/*!40000 ALTER TABLE `leitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitura_efetivadas`
--

DROP TABLE IF EXISTS `leitura_efetivadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitura_efetivadas` (
  `inicio_leitura` date NOT NULL,
  `final_leitura` date DEFAULT NULL,
  `classificacao_livro` int NOT NULL,
  `leitura_livro` bigint DEFAULT NULL,
  `leitura_leitor` bigint DEFAULT NULL,
  KEY `leitura_livro_FK` (`leitura_livro`),
  KEY `leitura_leitor_FK` (`leitura_leitor`),
  CONSTRAINT `leitura_leitor_FK` FOREIGN KEY (`leitura_leitor`) REFERENCES `leitor` (`leitor_ID`),
  CONSTRAINT `leitura_livro_FK` FOREIGN KEY (`leitura_livro`) REFERENCES `livro` (`livro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitura_efetivadas`
--

LOCK TABLES `leitura_efetivadas` WRITE;
/*!40000 ALTER TABLE `leitura_efetivadas` DISABLE KEYS */;
INSERT INTO `leitura_efetivadas` VALUES ('2019-11-27','2019-12-30',1,1,2),('2017-10-27','2018-10-30',5,3,2),('1999-10-25','1999-10-30',4,3,1),('2013-03-01','2015-01-30',3,2,4);
/*!40000 ALTER TABLE `leitura_efetivadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `Ean` bigint NOT NULL,
  `Titulo` varchar(100) DEFAULT NULL,
  `Genero` varchar(50) DEFAULT NULL,
  `Edicao` int DEFAULT NULL,
  `livro_id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`livro_id`),
  UNIQUE KEY `Ean` (`Ean`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (994701,'What Happened, Miss Simone?','Documentary',1,1),(2063762562,'There\'s Something About Mary','Comedy|Romance',2,2),(3504672870,'Six of a Kind','Comedy',3,3),(9559269844,'Nina\'s Heavenly Delights','Comedy',4,4),(8913238144,'Double Impact','Action',5,5),(8776308677,'Satan Bug, The','Sci-Fi|Thriller',6,6);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possui`
--

DROP TABLE IF EXISTS `possui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possui` (
  `possui_livro_id_livro_FK` bigint DEFAULT NULL,
  `possui_leitor_id_FK` bigint DEFAULT NULL,
  KEY `possui_livro_id_livro_FK` (`possui_livro_id_livro_FK`),
  KEY `Cpf2_fk` (`possui_leitor_id_FK`),
  CONSTRAINT `Cpf2_fk` FOREIGN KEY (`possui_leitor_id_FK`) REFERENCES `leitor` (`leitor_ID`),
  CONSTRAINT `possui_ibfk_1` FOREIGN KEY (`possui_livro_id_livro_FK`) REFERENCES `livro` (`livro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possui`
--

LOCK TABLES `possui` WRITE;
/*!40000 ALTER TABLE `possui` DISABLE KEYS */;
INSERT INTO `possui` VALUES (1,1),(2,2),(3,3),(5,4),(6,3),(1,2),(2,3);
/*!40000 ALTER TABLE `possui` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-11 22:49:25
