CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
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
-- Table structure for table `administracao`
--

DROP TABLE IF EXISTS `administracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administracao` (
  `id_administracao` mediumint NOT NULL,
  `cid` text,
  `carta` text,
  `endosso` text,
  `id_registroMedico` mediumint DEFAULT NULL,
  PRIMARY KEY (`id_administracao`),
  KEY `id_registroMedico` (`id_registroMedico`),
  CONSTRAINT `administracao_ibfk_1` FOREIGN KEY (`id_registroMedico`) REFERENCES `registromedico` (`id_registroMedico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administracao`
--

LOCK TABLES `administracao` WRITE;
/*!40000 ALTER TABLE `administracao` DISABLE KEYS */;
INSERT INTO `administracao` VALUES (1,'A01','Carta A','Endosso A',1),(2,'B02','Carta B','Endosso B',2),(3,'C03','Carta C','Endosso C',3);
/*!40000 ALTER TABLE `administracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escritorio`
--

DROP TABLE IF EXISTS `escritorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escritorio` (
  `id_escritorio` mediumint NOT NULL,
  `id_administracao` mediumint DEFAULT NULL,
  `recepcao` text,
  `entrega` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_escritorio`),
  KEY `id_administracao` (`id_administracao`),
  CONSTRAINT `escritorio_ibfk_1` FOREIGN KEY (`id_administracao`) REFERENCES `administracao` (`id_administracao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escritorio`
--

LOCK TABLES `escritorio` WRITE;
/*!40000 ALTER TABLE `escritorio` DISABLE KEYS */;
INSERT INTO `escritorio` VALUES (1,1,'Recepção A','Entrega A'),(2,2,'Recepção B','Entrega B'),(3,3,'Recepção C','Entrega C');
/*!40000 ALTER TABLE `escritorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id_medico` mediumint NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `genero` enum('M','F') DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `id_paciente` mediumint DEFAULT NULL,
  PRIMARY KEY (`id_medico`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'Ana','F','1980-11-25',1),(2,'Carlos','M','1975-09-30',2),(3,'Mariana','F','1988-06-12',3);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` mediumint NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `genero` enum('M','F') DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'João','M','1990-05-15','Paciente com histórico de alergia a penicilina.'),(2,'Maria','F','1985-08-20','Paciente com pressão alta.'),(3,'Pedro','M','1978-03-10','Paciente com histórico de diabetes.');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro` (
  `id_registro` mediumint NOT NULL,
  `data_registro` date DEFAULT NULL,
  `garantia` varchar(20) DEFAULT NULL,
  `id_paciente` mediumint DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES (1,'2024-02-15','Seguro saúde',1),(2,'2024-02-16','Particular',2),(3,'2024-02-17','Plano de saúde',3);
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registromedico`
--

DROP TABLE IF EXISTS `registromedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registromedico` (
  `id_registroMedico` mediumint NOT NULL,
  `data_registro` date DEFAULT NULL,
  `diagnostico` text,
  `medicamentos` text,
  `referencia` text,
  `id_medico` mediumint DEFAULT NULL,
  PRIMARY KEY (`id_registroMedico`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `registromedico_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registromedico`
--

LOCK TABLES `registromedico` WRITE;
/*!40000 ALTER TABLE `registromedico` DISABLE KEYS */;
INSERT INTO `registromedico` VALUES (1,'2024-02-15','Febre e dor de garganta','Paracetamol, Amoxicilina','Otorrinolaringologista',1),(2,'2024-02-16','Fratura na perna','Imobilização, Analgésicos','Ortopedista',2),(3,'2024-02-17','Hipertensão','Anti-hipertensivos','Cardiologista',3);
/*!40000 ALTER TABLE `registromedico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-18 11:31:20
