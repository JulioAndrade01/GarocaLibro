-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: DJANGO_G
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Categoria',7,'add_categoria'),(26,'Can change Categoria',7,'change_categoria'),(27,'Can delete Categoria',7,'delete_categoria'),(28,'Can view Categoria',7,'view_categoria'),(29,'Can add Leitor',8,'add_leitor'),(30,'Can change Leitor',8,'change_leitor'),(31,'Can delete Leitor',8,'delete_leitor'),(32,'Can view Leitor',8,'view_leitor'),(33,'Can add Livro',9,'add_livro'),(34,'Can change Livro',9,'change_livro'),(35,'Can delete Livro',9,'delete_livro'),(36,'Can view Livro',9,'view_livro'),(37,'Can add Empréstimo',10,'add_emprestimo'),(38,'Can change Empréstimo',10,'change_emprestimo'),(39,'Can delete Empréstimo',10,'delete_emprestimo'),(40,'Can view Empréstimo',10,'view_emprestimo'),(41,'Can add user',11,'add_user'),(42,'Can change user',11,'change_user'),(43,'Can delete user',11,'delete_user'),(44,'Can view user',11,'view_user'),(45,'Can add Agendamento de Retirada',12,'add_agendamento'),(46,'Can change Agendamento de Retirada',12,'change_agendamento'),(47,'Can delete Agendamento de Retirada',12,'delete_agendamento'),(48,'Can view Agendamento de Retirada',12,'view_agendamento');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$bakiNTuvAUaYQzoDwxnpBj$W7AdCKITE+xcSlDrXamMX+NmY5nNUVpoOdCzTWoyiZ8=','2024-10-03 01:51:54.744848',1,'Julio','','','juliocesarsilvabol223@gmail.com',1,1,'2024-05-23 16:48:40.653683'),(2,'pbkdf2_sha256$390000$szKgQXaTTO6P41ZNbYqmrp$wRuuKNN9P3rUok/ndfQPicb5lrhkjGL6ZSkmmdGWRFM=',NULL,1,'JU','','','julio_andrade@gmail.com',1,1,'2024-05-24 15:08:37.419747');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_agendamento`
--

DROP TABLE IF EXISTS `core_agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_agendamento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado` datetime(6) NOT NULL,
  `modificado` datetime(6) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `data_retirada` datetime(6) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leitor_id` bigint NOT NULL,
  `livro_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_agendamento_leitor_id_e6e74dea_fk_core_leitor_id` (`leitor_id`),
  KEY `core_agendamento_livro_id_1db6b503_fk_core_livro_id` (`livro_id`),
  CONSTRAINT `core_agendamento_leitor_id_e6e74dea_fk_core_leitor_id` FOREIGN KEY (`leitor_id`) REFERENCES `core_leitor` (`id`),
  CONSTRAINT `core_agendamento_livro_id_1db6b503_fk_core_livro_id` FOREIGN KEY (`livro_id`) REFERENCES `core_livro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_agendamento`
--

LOCK TABLES `core_agendamento` WRITE;
/*!40000 ALTER TABLE `core_agendamento` DISABLE KEYS */;
INSERT INTO `core_agendamento` VALUES (1,'2024-10-17 21:41:53.159990','2024-10-17 21:41:53.159990',1,'2024-10-25 03:00:00.000000','scheduled',1,1);
/*!40000 ALTER TABLE `core_agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_categoria`
--

DROP TABLE IF EXISTS `core_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado` datetime(6) NOT NULL,
  `modificado` datetime(6) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_categoria`
--

LOCK TABLES `core_categoria` WRITE;
/*!40000 ALTER TABLE `core_categoria` DISABLE KEYS */;
INSERT INTO `core_categoria` VALUES (1,'2024-10-16 23:19:59.729088','2024-10-16 23:19:59.729088',1,'Romance'),(2,'2024-10-16 23:21:59.176926','2024-10-16 23:21:59.177926',1,'Poema');
/*!40000 ALTER TABLE `core_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_emprestimo`
--

DROP TABLE IF EXISTS `core_emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_emprestimo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado` datetime(6) NOT NULL,
  `modificado` datetime(6) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `devolucao` datetime(6) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leitor_id` bigint NOT NULL,
  `livro_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_emprestimo_leitor_id_b32c1f05_fk_core_leitor_id` (`leitor_id`),
  KEY `core_emprestimo_livro_id_f773843b_fk_core_livro_id` (`livro_id`),
  CONSTRAINT `core_emprestimo_leitor_id_b32c1f05_fk_core_leitor_id` FOREIGN KEY (`leitor_id`) REFERENCES `core_leitor` (`id`),
  CONSTRAINT `core_emprestimo_livro_id_f773843b_fk_core_livro_id` FOREIGN KEY (`livro_id`) REFERENCES `core_livro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_emprestimo`
--

LOCK TABLES `core_emprestimo` WRITE;
/*!40000 ALTER TABLE `core_emprestimo` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_leitor`
--

DROP TABLE IF EXISTS `core_leitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_leitor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado` datetime(6) NOT NULL,
  `modificado` datetime(6) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_perfil` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_leitor_email_8f4638b0_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_leitor`
--

LOCK TABLES `core_leitor` WRITE;
/*!40000 ALTER TABLE `core_leitor` DISABLE KEYS */;
INSERT INTO `core_leitor` VALUES (1,'2024-10-10 20:56:05.648411','2024-10-10 20:56:05.648411',1,'teste001','Desconhecido','teste001@usuario.com',NULL,'','2024-10-18 13:20:14.998772','pbkdf2_sha256$390000$dM6JAKBlX28ECq7OtrQAFR$RcJu22V5jCMjAaw6tC63IQDm45phyB1nXDomzDK1Ytk=',0,0),(2,'2024-10-16 23:10:04.036429','2024-10-16 23:10:04.036429',1,'julio','','juliocesarsilvabol223@gmail.com',NULL,'','2024-10-18 12:16:24.185118','pbkdf2_sha256$390000$H6yhXFZWd4n9R5WRAEoYjx$ATVetML16Yoc90Bm1dlvSUS6yYyqx2Y9RgmlS7rP23o=',1,1);
/*!40000 ALTER TABLE `core_leitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_leitor_groups`
--

DROP TABLE IF EXISTS `core_leitor_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_leitor_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `leitor_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_leitor_groups_leitor_id_group_id_0c7cf38d_uniq` (`leitor_id`,`group_id`),
  KEY `core_leitor_groups_group_id_9af9445d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_leitor_groups_group_id_9af9445d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `core_leitor_groups_leitor_id_9556c751_fk_core_leitor_id` FOREIGN KEY (`leitor_id`) REFERENCES `core_leitor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_leitor_groups`
--

LOCK TABLES `core_leitor_groups` WRITE;
/*!40000 ALTER TABLE `core_leitor_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_leitor_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_leitor_user_permissions`
--

DROP TABLE IF EXISTS `core_leitor_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_leitor_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `leitor_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_leitor_user_permiss_leitor_id_permission_id_d9b8cf00_uniq` (`leitor_id`,`permission_id`),
  KEY `core_leitor_user_per_permission_id_cf046235_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_leitor_user_per_leitor_id_c837c1ce_fk_core_leit` FOREIGN KEY (`leitor_id`) REFERENCES `core_leitor` (`id`),
  CONSTRAINT `core_leitor_user_per_permission_id_cf046235_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_leitor_user_permissions`
--

LOCK TABLES `core_leitor_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_leitor_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_leitor_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_livro`
--

DROP TABLE IF EXISTS `core_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_livro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado` datetime(6) NOT NULL,
  `modificado` datetime(6) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `codigo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autor` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `categoria_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `core_livro_categoria_id_80a00f89_fk_core_categoria_id` (`categoria_id`),
  CONSTRAINT `core_livro_categoria_id_80a00f89_fk_core_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `core_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_livro`
--

LOCK TABLES `core_livro` WRITE;
/*!40000 ALTER TABLE `core_livro` DISABLE KEYS */;
INSERT INTO `core_livro` VALUES (1,'2024-10-16 23:20:07.733863','2024-10-17 21:41:54.379202',1,'001','Dom Casmurro','Machado de Assis',0,1),(2,'2024-10-16 23:22:02.517040','2024-10-16 23:22:02.517040',1,'002','Morte e Vida Severina','João Cabral de Melo Neto',1,2);
/*!40000 ALTER TABLE `core_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `telefone` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (1,'pbkdf2_sha256$390000$NIPc8FZ2Zbj2WzpqVIOcC2$tgRPUVYJe4rzsXxUX3l544YyS6AfBLCHQQMkK2CSe5s=','2024-10-09 19:47:51.047165',1,'JULIO','','','juliocesarsilvabol223@gmail.com',1,1,'2024-10-03 04:20:09.360314',NULL),(2,'pbkdf2_sha256$390000$63DcMIVYzZD7E7Q88iZ4hA$GUwedAu2PiD7qBf4WutDj1jPfIrl952nKEjReHwvv00=','2024-10-03 20:12:25.582833',0,'joao_vitor','','','',0,1,'2024-10-03 20:12:23.880892',NULL),(3,'pbkdf2_sha256$390000$chHmT9BZAjuZoS9wUp5CsK$WL8EA9hkbusLsT0ygzwkOCAEuFxvaL1AIuT5Mp7fa04=','2024-10-06 13:41:20.925148',0,'Luiz_miguel','','','',0,1,'2024-10-03 21:14:58.323563',NULL),(4,'pbkdf2_sha256$390000$0am5CyC0irt0Edm3TuFLje$jAaHS0779Ncl+QMRZcg+P9F9weOmdA+tIej+cxPymTY=','2024-10-08 20:55:11.716297',0,'joaof','','','',0,1,'2024-10-08 19:25:43.379661',NULL);
/*!40000 ALTER TABLE `core_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_groups`
--

DROP TABLE IF EXISTS `core_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_groups_user_id_group_id_c82fcad1_uniq` (`user_id`,`group_id`),
  KEY `core_user_groups_group_id_fe8c697f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_user_groups_group_id_fe8c697f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `core_user_groups_user_id_70b4d9b8_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_groups`
--

LOCK TABLES `core_user_groups` WRITE;
/*!40000 ALTER TABLE `core_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_user_permissions`
--

DROP TABLE IF EXISTS `core_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_user_permissions_user_id_permission_id_73ea0daa_uniq` (`user_id`,`permission_id`),
  KEY `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `core_user_user_permissions_user_id_085123d3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_user_permissions`
--

LOCK TABLES `core_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_core_leitor_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_leitor_id` FOREIGN KEY (`user_id`) REFERENCES `core_leitor` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-10-16 23:19:59.738329','1','Romance',1,'[{\"added\": {}}]',7,2),(2,'2024-10-16 23:20:08.020010','1','Dom Casmurro',1,'[{\"added\": {}}]',9,2),(3,'2024-10-16 23:21:59.196105','2','Poema',1,'[{\"added\": {}}]',7,2),(4,'2024-10-16 23:22:02.518034','2','Morte e Vida Severina',1,'[{\"added\": {}}]',9,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'core','agendamento'),(7,'core','categoria'),(10,'core','emprestimo'),(8,'core','leitor'),(9,'core','livro'),(11,'core','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-23 16:47:13.754881'),(2,'auth','0001_initial','2024-05-23 16:47:28.351714'),(6,'contenttypes','0002_remove_content_type_name','2024-05-23 16:47:32.273169'),(7,'auth','0002_alter_permission_name_max_length','2024-05-23 16:47:33.683516'),(8,'auth','0003_alter_user_email_max_length','2024-05-23 16:47:33.943327'),(9,'auth','0004_alter_user_username_opts','2024-05-23 16:47:34.068323'),(10,'auth','0005_alter_user_last_login_null','2024-05-23 16:47:35.345591'),(11,'auth','0006_require_contenttypes_0002','2024-05-23 16:47:35.423718'),(12,'auth','0007_alter_validators_add_error_messages','2024-05-23 16:47:35.481566'),(13,'auth','0008_alter_user_username_max_length','2024-05-23 16:47:36.366368'),(14,'auth','0009_alter_user_last_name_max_length','2024-05-23 16:47:37.272961'),(15,'auth','0010_alter_group_name_max_length','2024-05-23 16:47:37.462418'),(16,'auth','0011_update_proxy_permissions','2024-05-23 16:47:37.571791'),(17,'auth','0012_alter_user_first_name_max_length','2024-05-23 16:47:38.592287'),(19,'sessions','0001_initial','2024-05-23 16:47:43.937600'),(20,'core','0002_leitor_endereco_alter_emprestimo_devolucao_and_more','2024-10-03 01:47:36.000471'),(21,'core','0003_user','2024-10-03 02:22:56.820123'),(22,'core','0004_alter_user_options_remove_user_endereco_and_more','2024-10-04 12:15:37.904598'),(23,'core','0005_alter_leitor_telefone','2024-10-05 20:05:01.391039'),(24,'core','0006_alter_categoria_criado_alter_categoria_modificado_and_more','2024-10-05 20:38:12.886699'),(25,'core','0007_alter_emprestimo_status_alter_leitor_email_and_more','2024-10-06 13:39:22.432008'),(26,'core','0008_alter_emprestimo_devolucao','2024-10-06 14:10:47.295267'),(27,'core','0009_alter_livro_status','2024-10-06 19:34:45.159969'),(28,'core','0010_alter_leitor_modificado','2024-10-06 21:15:01.693142'),(29,'core','0011_alter_leitor_modificado_alter_livro_status','2024-10-07 21:01:03.215137'),(30,'core','0012_auto_20241009_1213','2024-10-09 15:14:01.359681'),(31,'core','0001_initial','2024-10-10 19:45:42.666749'),(32,'admin','0001_initial','2024-10-10 19:45:45.896710'),(33,'admin','0002_logentry_remove_auto_add','2024-10-10 19:45:45.990467'),(34,'admin','0003_logentry_add_action_flag_choices','2024-10-10 19:45:46.103609'),(35,'core','0002_remove_leitor_status_leitor_endereco_and_more','2024-10-10 19:46:04.083916'),(36,'core','0003_agendamento','2024-10-16 20:53:47.586789'),(37,'core','0004_leitor_is_staff_leitor_is_superuser','2024-10-16 22:43:14.039761'),(38,'core','0005_remove_leitor_is_superuser','2024-10-16 22:59:36.197299'),(39,'core','0006_leitor_is_superuser','2024-10-16 23:09:24.569703'),(40,'core','0007_alter_leitor_options_leitor_groups_and_more','2024-10-16 23:17:28.571373');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0qj3y6cpqqrj48rawb40b908e729hv0s','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1Dms:J9_u0ZcFhu3-Ou0DaPmMRsLgJzBTi4hG-zRNSzm1b6Y','2024-10-30 23:50:42.137187'),('1ihyiia2wel3at9tjn31ug1p3nqodz9o','.eJxVjMEOwiAQRP-FsyHC0goevfcbyLK7SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6KlCn3y4hPaXugB9Y75OmqS7zmPSu6IM2PUwsr9vh_h0UbGVbS-ZgrINsMzgCMMlaEWsc8qXPkENAD-eM7EmsdEQBjWDPnWfhLanPF_nyOSc:1sxBAc:WJ6b4Fueq5hmxRNxsFBDRC-6VoFNcwq7tVbzQnHN4C8','2024-10-19 20:14:30.648643'),('233agylyi11q9j8mnx9cvbx74sdo57m9','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syXc6:74yx0v8YtTJtvbU3MLNnwJC1RbJHQwq35Q86VBiOshk','2024-10-23 14:24:30.226418'),('29jg91uey11kyikl2a9ojuhjgjzx3fgc','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1DSj:i2DwSVMQ8qKHBgpFLe8y75L2cnBjLv5vUjAFyOB70cI','2024-10-30 23:29:53.979313'),('33w1qeq9hoyefjs4n4jurbyy9yoky6bu','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syFl3:k3ZIX7HMX04zYbGJQRR1e5fDC1TwaMPZLpttn1ulWEg','2024-10-22 19:20:33.340330'),('348a63jz0lvvor02kk76pfsurlmt09sn','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syJyY:2NGFvvsCCHe0vhs1Zm8OCQZzMMz2mKp5rsKSAwo2FJo','2024-10-22 23:50:46.667769'),('37ifmlxcnjgr44ns2v2fzu22ayl3c3np','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1sz0hj:bppB7o8Qk8qMtGPNppnh3nKrbU875bg11q2iM_p0-dI','2024-10-24 21:28:15.087403'),('37z7j4dyxglov67gto7hxvklnmc6tg0u','.eJxVjMEOwiAQRP-FsyHC0goevfcbyLK7SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6KlCn3y4hPaXugB9Y75OmqS7zmPSu6IM2PUwsr9vh_h0UbGVbS-ZgrINsMzgCMMlaEWsc8qXPkENAD-eM7EmsdEQBjWDPnWfhLanPF_nyOSc:1sxBLe:8RaHBKwihAp9ToHGbO4R0NsIAtkAVt2VK868QLJFNZs','2024-10-19 20:25:54.013530'),('3s6t8w0lf8cjsn7xc6jr1ahp7tvk0dkz','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syIla:klU-7f8XmeEMf5ZHRh_wmHq3iwQEpqyTJVnfBp1xcNo','2024-10-22 22:33:18.115973'),('42kof030qp2vcelpjjb9nf4oonl596q6','.eJxVjMEOwiAQRP-FsyHC0goevfcbyLK7SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6KlCn3y4hPaXugB9Y75OmqS7zmPSu6IM2PUwsr9vh_h0UbGVbS-ZgrINsMzgCMMlaEWsc8qXPkENAD-eM7EmsdEQBjWDPnWfhLanPF_nyOSc:1sxApa:-W7V5KPXOlDhez3PRL9twEawn4ZA4psb_DkoGpk4f2Q','2024-10-19 19:52:46.433995'),('4gc3czq7iss5g39krkrrnqfv93akunxb','.eJxVjEEOwiAQRe_C2pCBAgWX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWWpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WxRalLDgfMJgExmhiM9gRtWU1UoaBSmDl0YFWECBYH4zPBKyMd4Di_QG_Dja2:1t1lu4:XhrsqIEB9_u3zd23SFHmY03xeoRUfYz3RkRS4wEa5h8','2024-11-01 12:16:24.507653'),('4xjegj3tw3r2flbsbiimw55yxbmwct5d','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1szMSF:cBkrGtp6yH_DmfKZt4lWvKr_t3V-v4QnuOy88b3XdZA','2024-10-25 20:41:43.304288'),('6kudklbl6relowohsays7vlab7b4cgoi','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1B37:K47JAGBdRWg36KUPqK8ns7rbBJ96UJMsAHrn4OkXXNo','2024-10-30 20:55:17.258582'),('6r0wm0ugavk8mpfud80sq90a5ilnuq0r','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1W7e:9FLqY0ZsNOvTV0w6PTdHCRdVW7w8KdrwgbkPsD6iqgE','2024-10-31 19:25:22.067301'),('7m9hydaqxebsl0y5xrlmz8rlmb516zcz','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1BDQ:xNIDTcy6-ru6WGVgLrrcKSL9wxds1Qj1z3EFI74-R8M','2024-10-30 21:05:56.104808'),('7nkzg0mhbrl8qzbqyb58djp3xx9mxot1','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t0Oco:v2kC86LscRQTY6XD_vBrHVs17uz59BPleUllybKvhy0','2024-10-28 17:12:54.998905'),('9jq0rkgf61lcoextqljs9qtp9w9w2060','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1sxvDr:G2pI6BQ492fnNtMX_RwBdzcB1TZmRPZR-kGazab9-gQ','2024-10-21 21:24:55.377898'),('9xx92z5js3e6d8ohkpeqw08t0nchzjd8','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1DcR:rivASza0xxp_xkoGcwKHE9WVJq16BiokISxLei7L8Pg','2024-10-30 23:39:55.964545'),('a2rq299yddym0myb10fc8uhjek1gmv7t','.eJxVjMEOwiAQRP-FsyHC0goevfcbyLK7SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6KlCn3y4hPaXugB9Y75OmqS7zmPSu6IM2PUwsr9vh_h0UbGVbS-ZgrINsMzgCMMlaEWsc8qXPkENAD-eM7EmsdEQBjWDPnWfhLanPF_nyOSc:1swhPF:V-RhX8A6E85USxmNzD2QVK9rmZ0VR8FTSDK0DwZ9dto','2024-10-18 12:27:37.462976'),('ansn1o5mqjg82tyim7hzfyx5wxfna53s','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t0OoZ:huwvd0Vi0VebnSIOizycP0Y07EgNyfrr7ciIf8qHGI4','2024-10-28 17:25:03.471323'),('bbjemiutinw17hma3uvsfjaseip3phxb','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1sz0XU:dwfUSfmU9st4_t5HRUKmSjQS1cbi9QeOQ0X3cNchguI','2024-10-24 21:17:40.422410'),('cgk4q2a359hgef2kxz8dy3bohgu54t9r','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syIgI:rso__aG06meAAOlC3oG4uFfZ5LOwjgXRCd05B5VDcJ8','2024-10-22 22:27:50.326236'),('d9kk8nuteqcst662f9fv1e03og50uf1v','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1sz1Eo:bPrraNMfn5awl2YBa5I_LizVtKgGwC2pF3Qpmw_jgWc','2024-10-24 22:02:26.042950'),('e75vj7nx6y8k4v5t66lf1ysjgmmq00bx','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1W0c:Wq1Zy23tcO7wP9U9T2PFAIK4GdEaX79Cz0bNjNLW3r4','2024-10-31 19:18:06.850217'),('efhniahxd20vkd7b38claifs3qt4v4cu','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syYHb:_lcZsgnvQscP5R-lkiMfGfMcqBEfvxA2Hk2B_kgJWGw','2024-10-23 15:07:23.285719'),('esvofdmxt6hzy8sa9bp4k2e9szlm0t02','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syHrv:aP_eRFaCJlvFLMn7n7loIcSvxALBdcrP4CRFU5CkGTc','2024-10-22 21:35:47.619228'),('fbrn9gb2h5cko722amudmp31g1yhkavk','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1S4g:1hgzLIqcA0FkfvA5BZu7V7vmko_LFv97EY_pmoh0q7k','2024-10-31 15:06:02.114589'),('fhbkpzsk858pesjy1c70bxlfm09k13s6','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syK4w:Yrcp5FkEo7WV_b2tXts_x2NTGYwf16PVXyZMTVoRs7w','2024-10-22 23:57:22.487121'),('g7chga59srbz09e4da5c7laing3upjuv','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syInz:ZCrvuVbhUPqlVgqjf2FeTkWRPo5_9OrHlsfcaAKx77w','2024-10-22 22:35:47.708308'),('ge6mt5jbxbqa0u4k7oc6q08ry01at40y','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1VUd:6aVTQ_sq8jmPeuu6boGcyl_1wmbxTwB74VKu6ClPggs','2024-10-31 18:45:03.029730'),('ggh4rh5tm07gb7a52fctah6n31uw60xz','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1W1k:HqlufXfxjEKihfzji2x8oBZc7lZ8OkDx1WSqfJ5aUis','2024-10-31 19:19:16.823479'),('gm831nzwsnyfs6gt0wv357cb9shq5l1s','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1mtr:9-QuWTM0miw2jTCORpxg55xhoitEcIcQdU_05DQZbzw','2024-11-01 13:20:15.248741'),('gv44ri5er1kh8oe56rt96612hx93ojhe','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syIL8:_oF64hkt_x5v4SdJDJLpFUjwDRPqOymdbHKNzzT-SdM','2024-10-22 22:05:58.106685'),('h7oxnywljkirst091szxgl60aozb2xjq','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1Doh:RFMdETv6tq8rfFaq7tsfTy66EYDV6UJhIfj8RWiIoPA','2024-10-30 23:52:35.079181'),('hm5v3ej08n8sxwmuws73pmtp010fpjyk','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syHmi:7FAjxcsYx_c6z5RxNHFZ70EOkCbO4dQLhXEQnBP84sY','2024-10-22 21:30:24.981477'),('hr99v4nqgglkbkbkqlflwr2ocxtxm2iz','.eJxVjEEOwiAQRe_C2pCBAgWX7j0DgZlBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInEWWpx-t5zwwW0HdE_tNkuc27pMWe6KPGiX15n4eTncv4Oaev3WxRalLDgfMJgExmhiM9gRtWU1UoaBSmDl0YFWECBYH4zPBKyMd4Di_QG_Dja2:1t1DAD:pqaeKHw8jepPpGZI52A4l8fGbkupYBK9D4u0-fxzsUk','2024-10-30 23:10:45.329330'),('ieqpkj52h89jdqnfirt5r89spfzeq30a','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1Dqp:LT_omKII1g64JUnYIRrbRFsaBkLJDBSjbH5KClmP_Ac','2024-10-30 23:54:47.052555'),('ju7dmvz4qx2xtzu9xawvdznmqza07na1','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syHuS:rJ95Irb4I4cmOPsMy5uwRlyrO2zNxuTUzQqyzF337qc','2024-10-22 21:38:24.710548'),('k70borj8ti1z6npt5agvz7tkf664sush','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syIUb:F6r_WhL9Q3jVUesm24cIi6HQ0n-RVErWqqVeeDcStJw','2024-10-22 22:15:45.128334'),('kuinw0q0uefqf5mpzijzjvowungzfkdv','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syXaX:VkTT8QQeHIiG95yozkDzfD_O5O5LD0cbQMAaCSKOrdk','2024-10-23 14:22:53.099927'),('lmitcq9e5gnxpksv926pwsuer25e8ee5','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1WS9:lQNsgELNEHa-1r1zXIiXe5YOD3hfbh19PC_o2T0lcRI','2024-10-31 19:46:33.168570'),('ltqzhra5m88p75kvfouc0oyxuxts491q','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1WOa:x6Agf6ix_byt0-Lo5aHmkQr7yJxzAQYE6Wnv44SssXI','2024-10-31 19:42:52.711970'),('lyrjon2utlyc1azsm4ky3k2n0akxiscf','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1Wfh:LtFhplixxGrTTuyr1bDPzTi2KxkOEJiPEzm-JBcEEMo','2024-10-31 20:00:33.483140'),('nd8gwvmtvwr45laiyopzon6cobn7urph','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syYFu:JBfAI1AqZyH6kDQN2KW5257snUUW-meWvUUdbtedQWg','2024-10-23 15:05:38.690641'),('oefew0qa5hha383esji3udj23sdasbro','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syHok:cEh3C3C7Pa1jt-AkKuPfdkXehkO-4pOJraPfzxa5PTo','2024-10-22 21:32:30.038735'),('p8wbmb762nwba62exl6gqka5k47tsf9w','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t0psK:eN9S1XmqC7w4xmJFgFKQzxFNYHzHzoQ46e3oz8gqlS4','2024-10-29 22:18:44.037324'),('p9t2n9dj0i97e33cf6ormt6klxvyu8bc','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1sz159:d786YDoOosMun6EXZOv_EqhgaRtWBmUOp8Vk9bOW4aU','2024-10-24 21:52:27.572252'),('q5e7y6roln7fx8an17dtsrnaayu1pj3n','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syKSu:wwusZOabeQclQbqXShb4S3PwUOxa0zLsfhHJxYFubeM','2024-10-23 00:22:08.281974'),('qzaaw6mxvxqxgi0u8017a0id18f1dppu','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1sycf1:pHHiBbln2ByCMSpNrIAm5nLRc_4Fm_mGY0MWclaL1pY','2024-10-23 19:47:51.653647'),('r02xivydyltzufsa6kxhmcpwdvokxkyu','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1mK2:RfG_NC90uQTccu29xcLM4tp23DUFjNJAClW7Ty7SVmk','2024-11-01 12:43:14.163226'),('rphe9zzoxy3wstbow4qw48ctvrwzookj','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t0R23:Ez0CAz20a5zcTHgPCKdPthHpUdWPcW5JQrjeSdtIYdY','2024-10-28 19:47:07.677587'),('rxniobqmpe0c5vxbbtlva6bkshkw1oyy','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t0phQ:I0mnFiwML6aahV5GeQoU8ZsBmRE6OHhxtV0osMIOLcE','2024-10-29 22:07:28.374934'),('s2yokvyrvxd5ox3eoa3uomy2fbnuczw5','.eJxVjEEOwiAQRe_C2hAYmBZduu8ZGoYZbNVAUtqV8e7apAvd_vfef6kxbus0bk2WcWZ1UVadfjeK6SFlB3yP5VZ1qmVdZtK7og_a9FBZntfD_TuYYpu-NXDqA-VAkjsPvUMTPQYyKBF6AETbMZAhCzaIBCbvneFsXWfOgC6r9wfYszcw:1sABlE:af1_13ZWgC8SWC3JKx88Ba5oCTV-p4tqwGZYc8WrXPA','2024-06-06 16:57:48.397249'),('s92yneh475w2o7fm3sb1wfvf7fxvbcz2','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1sxXJH:fTLxlQTbxuv4euT9f9h356qaxnQiRDJdxqUHVhJgDuY','2024-10-20 19:52:55.324666'),('sdsxncysrqzl4ql1fu29yketzje86b1k','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t0PKJ:WW4fbHaO5JDld2YavLjtHvj8nBhIkjkJXMV1SsME56w','2024-10-28 17:57:51.151745'),('sn2c4dc71gd1vz57ja1t00hrhytu20wu','.eJxVjMEOwiAQRP-FsyHC0goevfcbyLK7SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6KlCn3y4hPaXugB9Y75OmqS7zmPSu6IM2PUwsr9vh_h0UbGVbS-ZgrINsMzgCMMlaEWsc8qXPkENAD-eM7EmsdEQBjWDPnWfhLanPF_nyOSc:1swqS1:Fee-kWfMxuUkU4aPpClexQxqLHVsEE2TKkTQU0CvwUA','2024-10-18 22:07:05.550036'),('ssg9r56rfisszgcuxy1rb985kldqxqbb','.eJxVjMsOwiAQRf-FtSE8AjIu3fsNZIYBqRpISrtq_Hdt0oVu7znnbiLiutS4jjzHicVFaHH63QjTM7cd8APbvcvU2zJPJHdFHnTIW-f8uh7u30HFUb91CLZkoKJSYgLFqNGb5LLSyoPDgNoxGATiVCyQgbNXkDUXo8liYPH-AAFFOI4:1syIrK:-LC-PrpaaWz7CYkgK6UIPmUi3y6uz9GMykOOyR0jWZc','2024-10-22 22:39:14.513732'),('syjn00z5gm0hosm5iql84hllp48npzvi','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1DZA:iuf1ihdBJ9uBoCJJan-ILRC9-ePpK7v2vl7l_aiBzPs','2024-10-30 23:36:32.722388'),('ubqsijft36p237bo5frqei6vilgw83rn','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t0PzY:2fdCLcwDqqlKGUTu5AImRHWZezPPphxfsviQkLyMkxM','2024-10-28 18:40:28.619275'),('ud7z6jqrqji41868jz4hlz267g5xj1gr','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t0RAO:CPqH2-oZVQa4yK3A018109OpAyC14teGvbX3wNpgSKQ','2024-10-28 19:55:44.225246'),('uzdxk1o41tpto07bkmsxwywi1ghlf3dh','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1YAy:yru2CpnqVCtndMbH9752EuT8hBVDjuF2BfnNrRr-A4c','2024-10-31 21:36:56.796223'),('vckcm2eqdv2w4ce91fw3b1kz7pdnye7q','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t0Pr5:6fQJegD5bDlyOMUXMk-1xkZ-ZreA8nOzk2r-HWIWAjQ','2024-10-28 18:31:43.535762'),('vheffby86b866t5uk1223qibphrgrv3w','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1WhR:uF__G6sLBAvSNJcRdYACplUjGhVn7SOF5ilUuUlXoko','2024-10-31 20:02:21.593337'),('whjc83p2eyji2oqga6topczkjusdekd6','.eJxVjEEOwiAQRe_C2hCG0lJcuu8ZyAwDtmogKe3KeHdL0oX-5X8v7y087tvs9xpXv7C4ChCX348wPGNugB-Y70WGkrd1IdkUedIqp8LxdTvdv8CMdW5ZHA04HNMI6digTKQOFQECB0hRM9mDkAnY2xRCx47i4LRmpcFCLz5fDtc43g:1sAWdm:XAHsQt5rCb3MZ6nQnqJQHr8ifE-yCRqgAenGYrYroeE','2024-06-07 15:15:30.436979'),('xkalhgivz7fwem6zeovdq9za7an4wug2','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1VgX:Nlpfij0UhZSfwHCThxsJ042QzM2lQlco7W6U76igYLA','2024-10-31 18:57:21.066075'),('xxhn0bg70zi2omk8caebe92d0hqx8pkd','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1B7Y:OB4L77eMlQvHEE0x8OemPo8Svh72PSSBoIRPkyhOSYI','2024-10-30 20:59:52.362221'),('zha1yu6nuw4c3oymaf5qfv1gnb44vajc','.eJxVjEEOwiAQRe_C2hCgDDgu3fcMZICpVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3ERWpx-t0jpwXUH-U711mRqdV3mKHdFHrTLsWV-Xg_376BQL986gUIAIovoveZBG9DaDqgdO1DgTbIqI02OE2C05I1LykxDNohnBi_eH6mlNpI:1t1C1l:wn9POGDncW7O6q_MEhPZ67fkKcLTROmskxS-k7fuCsQ','2024-10-30 21:57:57.187861');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos_perfil`
--

DROP TABLE IF EXISTS `fotos_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos_perfil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `caminho_imagem` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_upload` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fotos_perfil_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos_perfil`
--

LOCK TABLES `fotos_perfil` WRITE;
/*!40000 ALTER TABLE `fotos_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotos_perfil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-27 15:46:27
