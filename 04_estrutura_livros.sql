CREATE DATABASE  IF NOT EXISTS `livros` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `livros`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: livros
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `nome_autor` varchar(20) NOT NULL,
  `endereco` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nome_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES ('Camus','Franca'),('Tolkien','Inglaterra'),('Twain','Eua');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposito`
--

DROP TABLE IF EXISTS `deposito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposito` (
  `codigo_deposito` smallint NOT NULL,
  `endereco` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo_deposito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposito`
--

LOCK TABLES `deposito` WRITE;
/*!40000 ALTER TABLE `deposito` DISABLE KEYS */;
INSERT INTO `deposito` VALUES (1456,'China'),(1934,'China'),(9078,'China');
/*!40000 ALTER TABLE `deposito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editora` (
  `nome_editora` varchar(20) NOT NULL,
  `endereco` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nome_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES ('Harper','EUA'),('Pearson','EUA'),('Penguin','EUA');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `ISBN` tinyint NOT NULL,
  `titulo_livro` varchar(20) DEFAULT NULL,
  `lancamento` date DEFAULT NULL,
  `nome_autor` varchar(20) DEFAULT NULL,
  `nome_editora` varchar(20) DEFAULT NULL,
  `codigo_deposito` smallint DEFAULT NULL,
  `numero_estoque` smallint DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `FK_nome_autor` (`nome_autor`),
  KEY `FK_nome_editora` (`nome_editora`),
  KEY `FK_codigo_deposito` (`codigo_deposito`),
  CONSTRAINT `FK_codigo_deposito` FOREIGN KEY (`codigo_deposito`) REFERENCES `deposito` (`codigo_deposito`),
  CONSTRAINT `FK_nome_autor` FOREIGN KEY (`nome_autor`) REFERENCES `autor` (`nome_autor`),
  CONSTRAINT `FK_nome_editora` FOREIGN KEY (`nome_editora`) REFERENCES `editora` (`nome_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'Dom Casmurro','2005-10-15','Tolkien','Penguin',1456,10454),(2,'A Arte da Guerra','2010-08-23','Camus','Harper',1934,20788),(3,'O Senhor dos Anéis','2001-04-30','Twain','Pearson',9078,14567);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro_didatico`
--

DROP TABLE IF EXISTS `livro_didatico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro_didatico` (
  `id_didatico` tinyint NOT NULL,
  `ISBN` tinyint DEFAULT NULL,
  `tipo` enum('Matematica','Lingua Portuguesa','Historia','Fisica','Biologia','Quimica','Geografia','Filosofia') DEFAULT NULL,
  PRIMARY KEY (`id_didatico`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `livro_didatico_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `livro` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro_didatico`
--

LOCK TABLES `livro_didatico` WRITE;
/*!40000 ALTER TABLE `livro_didatico` DISABLE KEYS */;
INSERT INTO `livro_didatico` VALUES (101,1,'Matematica'),(102,2,'Lingua Portuguesa'),(103,3,'Historia');
/*!40000 ALTER TABLE `livro_didatico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro_idiomas`
--

DROP TABLE IF EXISTS `livro_idiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro_idiomas` (
  `id_idiomas` smallint NOT NULL,
  `ISBN` tinyint DEFAULT NULL,
  `tipo` enum('Ingles','Alemao','Espanhol','Italiano','Frances') DEFAULT NULL,
  PRIMARY KEY (`id_idiomas`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `livro_idiomas_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `livro` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro_idiomas`
--

LOCK TABLES `livro_idiomas` WRITE;
/*!40000 ALTER TABLE `livro_idiomas` DISABLE KEYS */;
INSERT INTO `livro_idiomas` VALUES (201,1,'Ingles'),(202,2,'Espanhol'),(203,3,'Frances');
/*!40000 ALTER TABLE `livro_idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro_literario`
--

DROP TABLE IF EXISTS `livro_literario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro_literario` (
  `id_literario` smallint NOT NULL,
  `ISBN` tinyint DEFAULT NULL,
  `tipo` enum('Romance','Terror','Comedia','Misterio','Aventura') DEFAULT NULL,
  PRIMARY KEY (`id_literario`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `livro_literario_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `livro` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro_literario`
--

LOCK TABLES `livro_literario` WRITE;
/*!40000 ALTER TABLE `livro_literario` DISABLE KEYS */;
INSERT INTO `livro_literario` VALUES (301,1,'Romance'),(302,2,'Terror'),(303,3,'Aventura');
/*!40000 ALTER TABLE `livro_literario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-14 18:50:48
