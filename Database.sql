-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: billing-system
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES (1,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 06:43:04','2025-07-30 06:43:04'),(2,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 06:54:27','2025-07-30 06:54:27'),(4,'default','Top-up: Rs. 50',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 07:00:41','2025-07-30 07:00:41'),(5,'default','Top-up: Rs. 50',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 07:02:52','2025-07-30 07:02:52'),(6,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 07:20:27','2025-07-30 07:20:27'),(7,'default','Paid Rs. 55 for Electricity',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 07:21:09','2025-07-30 07:21:09'),(8,'default','Paid Rs. 11 for Electricity',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 07:26:38','2025-07-30 07:26:38'),(9,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 07:34:32','2025-07-30 07:34:32'),(10,'default','Transferred Rs. 20 to Sewmi',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 07:36:22','2025-07-30 07:36:22'),(11,'default','User logged in: thimaya@gmail.com',NULL,NULL,NULL,'App\\Models\\User',2,'[]',NULL,'2025-07-30 07:39:43','2025-07-30 07:39:43'),(12,'default','Transferred Rs. 5 to Sewmi',NULL,NULL,NULL,'App\\Models\\User',2,'[]',NULL,'2025-07-30 07:40:08','2025-07-30 07:40:08'),(13,'default','Transferred Rs. 5 to Sewmi',NULL,NULL,NULL,'App\\Models\\User',2,'[]',NULL,'2025-07-30 07:50:54','2025-07-30 07:50:54'),(14,'default','User logged in: thimaya@gmail.com',NULL,NULL,NULL,'App\\Models\\User',2,'[]',NULL,'2025-07-30 11:19:26','2025-07-30 11:19:26'),(15,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:19:32','2025-07-30 11:19:32'),(16,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:19:34','2025-07-30 11:19:34'),(17,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:22:36','2025-07-30 11:22:36'),(18,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:23:32','2025-07-30 11:23:32'),(19,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:24:30','2025-07-30 11:24:30'),(20,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:25:16','2025-07-30 11:25:16'),(21,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:25:50','2025-07-30 11:25:50'),(22,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:26:48','2025-07-30 11:26:48'),(23,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:27:32','2025-07-30 11:27:32'),(24,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:29:02','2025-07-30 11:29:02'),(25,'default','Top-up: Rs. 10',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:39:46','2025-07-30 11:39:46'),(26,'default','User logged out: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:43:57','2025-07-30 11:43:57'),(27,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:44:11','2025-07-30 11:44:11'),(28,'default','Top-up: Rs. 12',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:50:46','2025-07-30 11:50:46'),(29,'default','Paid Rs. 12 for Internet',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:52:16','2025-07-30 11:52:16'),(30,'default','Transferred Rs. 5 to Sewmi',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:57:28','2025-07-30 11:57:28'),(31,'default','User logged out: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 11:58:50','2025-07-30 11:58:50'),(32,'default','User registered: sachi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',3,'[]',NULL,'2025-07-30 12:01:33','2025-07-30 12:01:33'),(33,'default','User logged in: sachi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',3,'[]',NULL,'2025-07-30 12:01:46','2025-07-30 12:01:46'),(34,'default','User logged out: sachi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',3,'[]',NULL,'2025-07-30 12:03:31','2025-07-30 12:03:31'),(35,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 12:03:52','2025-07-30 12:03:52'),(36,'default','User logged out: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 12:13:23','2025-07-30 12:13:23'),(37,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 12:13:50','2025-07-30 12:13:50'),(38,'default','Top-up: Rs. 4',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 12:13:58','2025-07-30 12:13:58'),(39,'default','User logged out: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 12:19:11','2025-07-30 12:19:11'),(40,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 12:22:02','2025-07-30 12:22:02'),(41,'default','User logged out: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 12:23:27','2025-07-30 12:23:27'),(42,'default','User logged in: sewmi@gmail.com',NULL,NULL,NULL,'App\\Models\\User',1,'[]',NULL,'2025-07-30 12:27:59','2025-07-30 12:27:59');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_07_30_104242_create_personal_access_tokens_table',2),(5,'2025_07_30_105746_add_balance_to_users_table',3),(6,'2025_07_30_120145_create_activity_log_table',4),(7,'2025_07_30_120146_add_event_column_to_activity_log_table',4),(8,'2025_07_30_120147_add_batch_uuid_column_to_activity_log_table',4),(9,'2025_07_30_121425_create_transactions_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',2,'auth_token','f712181632b5d15db0e3b04d883bef488c8ea214a024b03d8e19b1530a8ccb29','[\"*\"]',NULL,NULL,'2025-07-30 06:10:26','2025-07-30 06:10:26'),(2,'App\\Models\\User',1,'auth_token','a790fb0f5fa01e08723902b636eeffe2f6eea223366e17a5bdcda116b44fef0a','[\"*\"]',NULL,NULL,'2025-07-30 06:14:36','2025-07-30 06:14:36'),(4,'App\\Models\\User',1,'auth_token','b370122dba46449cce67ba004ce47c53e199a07c48f26b4261bf6ff878bfc48d','[\"*\"]',NULL,NULL,'2025-07-30 06:43:04','2025-07-30 06:43:04'),(5,'App\\Models\\User',1,'auth_token','5bff8353bfd7059b1def46028ae6a088fc0299e076bc4ad50e21f06ce6d9f09e','[\"*\"]','2025-07-30 07:02:52',NULL,'2025-07-30 06:54:27','2025-07-30 07:02:52'),(6,'App\\Models\\User',1,'auth_token','76d85a6992929bcc35148e92706e114735da3971eccf6d5a0b7b78a6dda756b8','[\"*\"]','2025-07-30 07:26:38',NULL,'2025-07-30 07:20:27','2025-07-30 07:26:38'),(7,'App\\Models\\User',1,'auth_token','26286fcd8b0c1bdf16a1bd39329cdf0b93575263233487d5ab1a280d0cf53d35','[\"*\"]','2025-07-30 07:36:22',NULL,'2025-07-30 07:34:32','2025-07-30 07:36:22'),(8,'App\\Models\\User',2,'auth_token','20fd3dfc164b3227286f11540aabc1ea43145d8e096017c50e9697bdd238124f','[\"*\"]','2025-07-30 07:50:54',NULL,'2025-07-30 07:39:43','2025-07-30 07:50:54'),(9,'App\\Models\\User',2,'auth_token','1c0d10c1554a088c68b334e50f5e6caeec67a7cbce520faee85b5efd2f40153d','[\"*\"]',NULL,NULL,'2025-07-30 11:19:26','2025-07-30 11:19:26'),(10,'App\\Models\\User',1,'auth_token','c377211580d3e16e8091170f800705bb12a9238d20db353ffe93112a694992a9','[\"*\"]',NULL,NULL,'2025-07-30 11:19:32','2025-07-30 11:19:32'),(11,'App\\Models\\User',1,'auth_token','0728c247ac3ae3101ad20d806f9b41ea2e0ae7699322a5b5f25248baafa633ab','[\"*\"]',NULL,NULL,'2025-07-30 11:19:34','2025-07-30 11:19:34'),(12,'App\\Models\\User',1,'auth_token','7d8284ac9a19626433023e69ee6c75ef860fecfd22e953664e42ccb6fc6e14f9','[\"*\"]',NULL,NULL,'2025-07-30 11:22:36','2025-07-30 11:22:36'),(13,'App\\Models\\User',1,'auth_token','e9a2b7fe462b47b5d40b38fe813d2c06334da8135e89b3c81fb567ebb9658359','[\"*\"]',NULL,NULL,'2025-07-30 11:23:32','2025-07-30 11:23:32'),(14,'App\\Models\\User',1,'auth_token','2a7f64553c1bfcbc1e43363be2ced2a1ab684a938af1a1518595ec601f574ba6','[\"*\"]',NULL,NULL,'2025-07-30 11:24:30','2025-07-30 11:24:30'),(15,'App\\Models\\User',1,'auth_token','ce5966f96282082dbe4dd53c9dcbe5e8007e60b2f07f023c5bc04358e259684f','[\"*\"]',NULL,NULL,'2025-07-30 11:25:15','2025-07-30 11:25:15'),(16,'App\\Models\\User',1,'auth_token','18aa71ddde284c478f0bf29033e6ecf982ecbb83610dd34e7736ba9d20bb17b1','[\"*\"]',NULL,NULL,'2025-07-30 11:25:50','2025-07-30 11:25:50'),(17,'App\\Models\\User',1,'auth_token','9c113d2cc0a61342717d75774006f89e565b1d1bd1d3c53997e3f3d20df093a8','[\"*\"]',NULL,NULL,'2025-07-30 11:26:48','2025-07-30 11:26:48'),(18,'App\\Models\\User',1,'auth_token','451c89b6e4b9e479523105dc991ed28da029b3e7bc403e59524672b52b89953f','[\"*\"]',NULL,NULL,'2025-07-30 11:27:32','2025-07-30 11:27:32'),(21,'App\\Models\\User',3,'auth_token','2246e0aef3727c8417bac46f95b0e7888b5c95b273a02eb3c0f21a937dec71a3','[\"*\"]',NULL,NULL,'2025-07-30 12:01:33','2025-07-30 12:01:33'),(26,'App\\Models\\User',1,'auth_token','8a0529136ca0779a472836d552a1824884f46ab00a174363ae351ffe89c25c67','[\"*\"]',NULL,NULL,'2025-07-30 12:27:59','2025-07-30 12:27:59');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('ElaB9nALaksGBt0aoKdcAUILXH1cHdbMIc28ESxZ',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoic1REV0VRVUpnNWhEOGd1NXNnOVFnRUxHdlN5RXk0czQ1UnNsT0ZZYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1753873705),('eRjb50l1D0zcFqSfpIDfau0Okw4fgndcDWPmkmUG',NULL,'127.0.0.1','PostmanRuntime/7.44.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkxoR0dsSkdRVVphSFdRdzcwdm5qVWtGY3I1Y2lXenFxQ250WmtUQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1753874469);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,'Top-up',50.00,NULL,'2025-07-30 07:00:41','2025-07-30 07:00:41'),(2,1,'Top-up',50.00,NULL,'2025-07-30 07:02:52','2025-07-30 07:02:52'),(3,1,'Bill Payment',55.00,'Electricity (Base: Rs. 50, Fee: Rs. 5)','2025-07-30 07:21:09','2025-07-30 07:21:09'),(4,1,'Bill Payment',11.00,'Electricity (Base: Rs. 10, Extra Fee: Rs. 1)','2025-07-30 07:26:38','2025-07-30 07:26:38'),(5,1,'Transfer Sent',20.00,'To Sewmi','2025-07-30 07:36:22','2025-07-30 07:36:22'),(6,2,'Transfer Received',20.00,'From Sewmi','2025-07-30 07:36:22','2025-07-30 07:36:22'),(7,2,'Transfer Sent',5.00,'To Sewmi','2025-07-30 07:40:08','2025-07-30 07:40:08'),(8,1,'Transfer Received',5.00,'From Sewmi','2025-07-30 07:40:08','2025-07-30 07:40:08'),(9,2,'Transfer Sent',5.00,'To Sewmi','2025-07-30 07:50:54','2025-07-30 07:50:54'),(10,1,'Transfer Received',5.00,'From Sewmi','2025-07-30 07:50:54','2025-07-30 07:50:54'),(11,1,'Top-up',10.00,NULL,'2025-07-30 11:39:46','2025-07-30 11:39:46'),(12,1,'Top-up',12.00,NULL,'2025-07-30 11:50:46','2025-07-30 11:50:46'),(13,1,'Bill Payment',12.00,'Internet (Base: Rs. 12, Extra Fee: Rs. 0)','2025-07-30 11:52:16','2025-07-30 11:52:16'),(14,1,'Transfer Sent',5.00,'To Sewmi','2025-07-30 11:57:28','2025-07-30 11:57:28'),(15,2,'Transfer Received',5.00,'From Sewmi','2025-07-30 11:57:28','2025-07-30 11:57:28'),(16,1,'Top-up',4.00,NULL,'2025-07-30 12:13:58','2025-07-30 12:13:58');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sewmi','sewmi@gmail.com',NULL,'$2y$12$SipW2c9P4QqCf.M6RBq84ub7eovDcCxLw/Fi00hEjTB5EhU.gbN7G',NULL,'2025-07-30 06:00:09','2025-07-30 12:13:58',33.00),(2,'Sewmi','thimaya@gmail.com',NULL,'$2y$12$AqZVpqVeZr4txJ58Pd4q2eBhJJPxTxpb.NQXlVN/TN1gyq6GG01/q',NULL,'2025-07-30 06:10:26','2025-07-30 11:57:28',15.00),(3,'Sachini','sachi@gmail.com',NULL,'$2y$12$yWBskRA7nNpiCiciLXA9JewiLd1wEY02L8OllmdLkpST.9tRBjiwq',NULL,'2025-07-30 12:01:33','2025-07-30 12:01:33',0.00);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-30 23:46:14
