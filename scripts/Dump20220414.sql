CREATE DATABASE  IF NOT EXISTS `db_app_db2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_app_db2`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: db_app_db2
-- ------------------------------------------------------
-- Server version	8.0.18

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
  `leitor_1` varchar(11) DEFAULT NULL,
  `leitor2` varchar(11) DEFAULT NULL,
  UNIQUE KEY `amizade_unq` (`leitor_1`,`leitor2`),
  KEY `amizade_leitor_FK2` (`leitor2`),
  CONSTRAINT `amizade_leitor_FK` FOREIGN KEY (`leitor_1`) REFERENCES `leitor` (`leitor_cpf`),
  CONSTRAINT `amizade_leitor_FK2` FOREIGN KEY (`leitor2`) REFERENCES `leitor` (`leitor_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amizade_leitor`
--

LOCK TABLES `amizade_leitor` WRITE;
/*!40000 ALTER TABLE `amizade_leitor` DISABLE KEYS */;
INSERT INTO `amizade_leitor` VALUES ('22944954054','67115598033'),('22944954054','90856630037'),('22944954054','97647729025'),('67115598033','90856630037'),('90856630037','97647729025'),('97647729025','90856630037');
/*!40000 ALTER TABLE `amizade_leitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `NomeAutor` varchar(100) NOT NULL,
  `NascimentoAutor` date DEFAULT NULL,
  `Cpf` bigint(20) NOT NULL,
  PRIMARY KEY (`Cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES ('Paulo H.','1997-10-20',3345689465),('Gerda','2019-11-27',22940954054),('Keane','2006-01-18',67110698033),('Eustace','2007-05-22',90854530037),('Shepard','1998-12-24',97649229025);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratado`
--

DROP TABLE IF EXISTS `contratado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratado` (
  `Cnpj` varchar(20) DEFAULT NULL,
  `Cpf` bigint(20) DEFAULT NULL,
  KEY `Cnpj` (`Cnpj`),
  KEY `Cpf_fk` (`Cpf`),
  CONSTRAINT `Cpf_fk` FOREIGN KEY (`Cpf`) REFERENCES `autor` (`Cpf`),
  CONSTRAINT `contratado_ibfk_1` FOREIGN KEY (`Cnpj`) REFERENCES `editora` (`Cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratado`
--

LOCK TABLES `contratado` WRITE;
/*!40000 ALTER TABLE `contratado` DISABLE KEYS */;
INSERT INTO `contratado` VALUES ('75.521.498/0001-37',90854530037),('06.996.557/0001-00',90854530037),('12.873.418/0001-92',90854530037),('75.521.498/0001-37',90854530037),('12.873.418/0001-92',97649229025),('45.999.808/0001-62',67110698033),('75.521.498/0001-37',22940954054);
/*!40000 ALTER TABLE `contratado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editora` (
  `Cnpj` varchar(20) NOT NULL,
  `RazaoSocial` varchar(50) DEFAULT NULL,
  `Endereco` varchar(100) DEFAULT NULL,
  `Telefone` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES ('06.996.557/0001-00','editora Farroupilha',NULL,987654545),('12.873.418/0001-92','editora Caxias',NULL,987654545),('45.999.808/0001-62','editora LivruS',NULL,987654545),('75.521.498/0001-37','editora globo',NULL,987654545);
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
  `leitor_cpf` varchar(11) NOT NULL,
  `leitor_idade` date DEFAULT NULL,
  PRIMARY KEY (`leitor_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitor`
--

LOCK TABLES `leitor` WRITE;
/*!40000 ALTER TABLE `leitor` DISABLE KEYS */;
INSERT INTO `leitor` VALUES ('Cleber','22944954054','1997-11-27'),('Luana','67115598033','1965-05-10'),('monica','90856630037','1985-10-13'),('eduardo','97647729025','1999-02-24');
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
  `classificacao_livro` int(11) NOT NULL,
  `leitura_livro` bigint(30) DEFAULT NULL,
  `leitura_leitor` varchar(11) DEFAULT NULL,
  KEY `leitura_livro_FK` (`leitura_livro`),
  KEY `leitura_leitor_FK` (`leitura_leitor`),
  CONSTRAINT `leitura_leitor_FK` FOREIGN KEY (`leitura_leitor`) REFERENCES `leitor` (`leitor_cpf`),
  CONSTRAINT `leitura_livro_FK` FOREIGN KEY (`leitura_livro`) REFERENCES `livro` (`Ean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitura_efetivadas`
--

LOCK TABLES `leitura_efetivadas` WRITE;
/*!40000 ALTER TABLE `leitura_efetivadas` DISABLE KEYS */;
INSERT INTO `leitura_efetivadas` VALUES ('2019-11-27','2019-12-30',1,994701,'67115598033'),('2017-10-27','2018-10-30',5,3504672870,'67115598033'),('1999-10-25','1999-10-30',4,3504672870,'22944954054'),('2013-03-01','2015-01-30',3,2063762562,'97647729025');
/*!40000 ALTER TABLE `leitura_efetivadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `Ean` bigint(30) NOT NULL,
  `Titulo` varchar(100) DEFAULT NULL,
  `Genero` varchar(50) DEFAULT NULL,
  `Edicao` int(11) DEFAULT NULL,
  PRIMARY KEY (`Ean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (994701,'What Happened, Miss Simone?','Documentary',1),(2063762562,'There\'s Something About Mary','Comedy|Romance',2),(3504672870,'Six of a Kind','Comedy',3),(8776308677,'Satan Bug, The','Sci-Fi|Thriller',6),(8913238144,'Double Impact','Action',5),(9559269844,'Nina\'s Heavenly Delights','Comedy',4);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possui`
--

DROP TABLE IF EXISTS `possui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possui` (
  `Ean` bigint(30) DEFAULT NULL,
  `Cpf` bigint(20) DEFAULT NULL,
  KEY `Ean` (`Ean`),
  KEY `Cpf2_fk` (`Cpf`),
  CONSTRAINT `Cpf2_fk` FOREIGN KEY (`Cpf`) REFERENCES `autor` (`Cpf`),
  CONSTRAINT `possui_ibfk_1` FOREIGN KEY (`Ean`) REFERENCES `livro` (`Ean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possui`
--

LOCK TABLES `possui` WRITE;
/*!40000 ALTER TABLE `possui` DISABLE KEYS */;
INSERT INTO `possui` VALUES (994701,22940954054),(2063762562,67110698033),(3504672870,90854530037),(8913238144,97649229025),(8776308677,3345689465);
/*!40000 ALTER TABLE `possui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_app_db2'
--

--
-- Dumping routines for database 'db_app_db2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-14 20:13:46
