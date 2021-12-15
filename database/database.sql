DROP DATABASE IF EXISTS `trab2-ia`;

CREATE DATABASE  IF NOT EXISTS `trab2-ia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trab2-ia`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trab2-ia
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `title_modified` varchar(500) DEFAULT NULL,
  `url_notice` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=612 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'2021-11-04','Magazine Luiza: ação fecha em queda de 4,07% nesta quinta...','Magazine Luiza: ação fecha queda péssima de 4,07% nesta quinta','https://economia.uol.com.br/mais/ultimas-noticias/2021/11/04/acao-magazine-luiza-hoje-cotacao-ibovespa.htm'),
							(2,'2021-11-05','Magazine Luiza: ação tem maior alta em mais de um ano nesta sexta...','Magazine Luiza: ação tem ótima cotação em mais de um ano nesta sexta','https://economia.uol.com.br/mais/ultimas-noticias/2021/11/05/acao-magazine-luiza-hoje-cotacao-ibovespa.htm'),
							(3,'2021-11-08','Magazine Luiza: ação fecha em queda de 3,38% nesta segunda...','Magazine Luiza: ação fecha em queda de 3,38% nesta segunda','https://economia.uol.com.br/mais/ultimas-noticias/2021/11/08/acao-magazine-luiza-hoje-cotacao-ibovespa.htm'),
							(4,'2021-11-09','Magazine Luiza: ação fecha em alta de 10,06% nesta terça...','Magazine Luiza: ação boa cotação de 10,06% nesta terça','https://economia.uol.com.br/mais/ultimas-noticias/2021/11/09/acao-magazine-luiza-hoje-cotacao-ibovespa.htm'),
							(5,'2021-11-10','Magazine Luiza: ação fecha em queda de 0,84% nesta quarta...','Magazine Luiza: ação fecha em queda de 0,84% nesta quarta','https://economia.uol.com.br/mais/ultimas-noticias/2021/11/10/acao-magazine-luiza-hoje-cotacao-ibovespa.htm'),
							(6,'2021-11-11','Magazine Luiza: ação fecha em alta de 4,84% nesta quinta...','Magazine Luiza: ação teve alta de 4,84% nesta quinta','https://economia.uol.com.br/mais/ultimas-noticias/2021/11/11/acao-magazine-luiza-hoje-cotacao-ibovespa.htm'),
							(7,'2021-11-12','Magazine Luiza: ação tem maior baixa em mais de 1 ano nesta sexta...','Magazine Luiza: ação fecha em queda horrível de 18,32% nesta sexta','https://economia.uol.com.br/mais/ultimas-noticias/2021/11/12/acao-magazine-luiza-hoje-cotacao-ibovespa.htm'),
							(8,'2021-11-16','Ibovespa fecha com Vale e Magazine Luiza entre maiores pressões de baixa','Magazine Luiza: ação fecha mal com queda  de 12,65% nesta terça','https://www.moneytimes.com.br/ibovespa-fecha-com-vale-e-magazine-luiza-entre-maiores-pressoes-de-baixa/'),
							(9,'2021-11-17','Magazine Luiza: ação fecha em queda de 4,83% nesta quarta...','Magazine Luiza: ação fecha queda péssima de 4,83% nesta quarta','https://economia.uol.com.br/mais/ultimas-noticias/2021/11/17/acao-magazine-luiza-hoje-cotacao-ibovespa.htm'),
							(10,'2021-11-18','Magazine Luiza: ação fecha em queda de 2,91% nesta quinta...','Magazine Luiza: ação fecha em queda de 2,91% nesta quinta','https://economia.uol.com.br/mais/ultimas-noticias/2021/11/18/acao-magazine-luiza-hoje-cotacao-ibovespa.htm'),
							(11,'2021-11-19','Magazine Luiza: ação fecha em alta de 3,11% nesta sexta...','Magazine Luiza: ação teve alta de 3,11% nesta sexta','https://economia.uol.com.br/mais/ultimas-noticias/2021/11/19/acao-magazine-luiza-hoje-cotacao-ibovespa.htm'),
							(12,'2021-11-22','Magazine Luiza: ação fecha em queda de 4,64% nesta segunda...','Magazine Luiza: ação fecha em queda de 4,64% nesta segunda','https://economia.uol.com.br/mais/ultimas-noticias/2021/11/22/acao-magazine-luiza-hoje-cotacao-ibovespa.htm');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotation`
--

DROP TABLE IF EXISTS `quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `variation` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=621 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation`
--

LOCK TABLES `quotation` WRITE;
/*!40000 ALTER TABLE `quotation` DISABLE KEYS */;
INSERT INTO `quotation` VALUES (1,'2021-11-01',11.26,0.00),(2,'2021-11-03',11.66,0.40),(3,'2021-11-04',11.10,-0.56),(4,'2021-11-05',12.44,1.34),(5,'2021-11-08',12.02,-0.42),(6,'2021-11-09',13.00,0.98),(7,'2021-11-10',12.95,-0.05),(8,'2021-11-11',13.64,0.69),(9,'2021-11-12',11.34,-2.30),(10,'2021-11-16',9.84,-1.50),(11,'2021-11-17',9.31,-0.53),(12,'2021-11-18',9.12,-0.19),(13,'2021-11-19',9.28,0.16),(14,'2021-11-22',8.91,-0.37),(15,'2021-11-23',8.60,-0.31),(16,'2021-11-24',8.82,0.22);
/*!40000 ALTER TABLE `quotation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-24 22:38:04
