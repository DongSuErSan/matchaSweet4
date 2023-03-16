-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: matcha_sweet
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `app01_comment`
--

DROP TABLE IF EXISTS `app01_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_comment` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `shop_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_comment_shop_id_cc4fe8ff_fk_app01_shopinfo_nid` (`shop_id`),
  KEY `app01_comment_user_id_7f913f03_fk_app01_userinfo_nid` (`user_id`),
  CONSTRAINT `app01_comment_shop_id_cc4fe8ff_fk_app01_shopinfo_nid` FOREIGN KEY (`shop_id`) REFERENCES `app01_shopinfo` (`nid`),
  CONSTRAINT `app01_comment_user_id_7f913f03_fk_app01_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_comment`
--

LOCK TABLES `app01_comment` WRITE;
/*!40000 ALTER TABLE `app01_comment` DISABLE KEYS */;
INSERT INTO `app01_comment` VALUES (1,'excellent！',1,1,'2023-03-14 08:42:26.902146'),(2,'123456',1,1,'2023-03-14 14:41:43.027231');
/*!40000 ALTER TABLE `app01_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_matchaimage`
--

DROP TABLE IF EXISTS `app01_matchaimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_matchaimage` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_matchaimage`
--

LOCK TABLES `app01_matchaimage` WRITE;
/*!40000 ALTER TABLE `app01_matchaimage` DISABLE KEYS */;
INSERT INTO `app01_matchaimage` VALUES (1,'image/g.jpg'),(2,'image/slider2.jpg'),(3,'image/banner5.jpg');
/*!40000 ALTER TABLE `app01_matchaimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_order`
--

DROP TABLE IF EXISTS `app01_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_order` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `order_number` int NOT NULL,
  `total_price` int NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `shop_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_order_shop_id_ffab1255_fk_app01_shopinfo_nid` (`shop_id`),
  KEY `app01_order_user_id_2bad9964_fk_app01_userinfo_nid` (`user_id`),
  CONSTRAINT `app01_order_shop_id_ffab1255_fk_app01_shopinfo_nid` FOREIGN KEY (`shop_id`) REFERENCES `app01_shopinfo` (`nid`),
  CONSTRAINT `app01_order_user_id_2bad9964_fk_app01_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_order`
--

LOCK TABLES `app01_order` WRITE;
/*!40000 ALTER TABLE `app01_order` DISABLE KEYS */;
INSERT INTO `app01_order` VALUES (3,2,40,'2023-03-14 08:37:11.881947',1,1),(4,1,20,'2023-03-14 14:41:58.151317',1,1);
/*!40000 ALTER TABLE `app01_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_shopinfo`
--

DROP TABLE IF EXISTS `app01_shopinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_shopinfo` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(64) DEFAULT NULL,
  `price` int NOT NULL,
  `details` longtext,
  `number` int NOT NULL,
  `avatar_id` int DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_shopinfo_avatar_id_fdc28feb_fk_app01_matchaimage_nid` (`avatar_id`),
  CONSTRAINT `app01_shopinfo_avatar_id_fdc28feb_fk_app01_matchaimage_nid` FOREIGN KEY (`avatar_id`) REFERENCES `app01_matchaimage` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_shopinfo`
--

LOCK TABLES `app01_shopinfo` WRITE;
/*!40000 ALTER TABLE `app01_shopinfo` DISABLE KEYS */;
INSERT INTO `app01_shopinfo` VALUES (1,'matcha',20,'Black pepper may be added and the Kalmyks sometimes add bay leaf or nutmeg.Chaisuma, a tea drink used in Tibet, is a hot, well whipped mix of a strong infusion of pressed tea with yak butter and salt.Marie: Well it\'s having real clotted cream on your scones with home-made strawberry jam to go with your tea.Applied to the skin of laboratory mice, it also seems to reduce the incidence of skin cancer.Love vanquishes time To lovers, a moment can be eternity, eternity can be the tick of a clock.Time spent in vice or folly is doubly lost',6,2,'2023-03-14 08:19:32.388955'),(2,'sweet',10,'Sweet',10,3,'2023-03-14 08:23:02.505712');
/*!40000 ALTER TABLE `app01_shopinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo`
--

DROP TABLE IF EXISTS `app01_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nid` int NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(64) DEFAULT NULL,
  `tel` varchar(64) DEFAULT NULL,
  `addr` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `sex` varchar(64) DEFAULT NULL,
  `national` varchar(64) DEFAULT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo`
--

LOCK TABLES `app01_userinfo` WRITE;
/*!40000 ALTER TABLE `app01_userinfo` DISABLE KEYS */;
INSERT INTO `app01_userinfo` VALUES ('pbkdf2_sha256$390000$Qx9OWqBZBcfcqUXMGgqY6t$L4+377t4gpxwPIQyZwI1bRXBoy2x5JqAzO5U8Y1eT5Y=','2023-03-14 14:39:01.310110',1,'admin','','','',1,1,'2023-03-14 02:28:55.474252',1,NULL,'15566666666',NULL,'Jason','man','han',20),('pbkdf2_sha256$390000$aDJL5JoSwlsGYshpJMkROa$LPNQhHd6xRAJtvp71g67vVyZ4opsyp4rrs+3UDzi5uM=','2023-03-14 14:35:30.933669',0,'test1','','','',0,1,'2023-03-14 14:35:24.217477',2,NULL,'16655555555',NULL,'test','man','China',20);
/*!40000 ALTER TABLE `app01_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_groups`
--

DROP TABLE IF EXISTS `app01_userinfo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_groups_userinfo_id_group_id_48ba2aa6_uniq` (`userinfo_id`,`group_id`),
  KEY `app01_userinfo_groups_group_id_30b9b2c4_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app01_userinfo_groups_group_id_30b9b2c4_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `app01_userinfo_groups_userinfo_id_04be482a_fk_app01_userinfo_nid` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_groups`
--

LOCK TABLES `app01_userinfo_groups` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_shop_cart`
--

DROP TABLE IF EXISTS `app01_userinfo_shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo_shop_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `shopinfo_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_shop_cart_userinfo_id_shopinfo_id_045ecfe3_uniq` (`userinfo_id`,`shopinfo_id`),
  KEY `app01_userinfo_shop__shopinfo_id_66638c33_fk_app01_sho` (`shopinfo_id`),
  CONSTRAINT `app01_userinfo_shop__shopinfo_id_66638c33_fk_app01_sho` FOREIGN KEY (`shopinfo_id`) REFERENCES `app01_shopinfo` (`nid`),
  CONSTRAINT `app01_userinfo_shop__userinfo_id_727e0014_fk_app01_use` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_shop_cart`
--

LOCK TABLES `app01_userinfo_shop_cart` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_shop_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo_shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_user_permissions`
--

DROP TABLE IF EXISTS `app01_userinfo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_userinfo_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_user_perm_userinfo_id_permission_i_8bd06903_uniq` (`userinfo_id`,`permission_id`),
  KEY `app01_userinfo_user__permission_id_826033c9_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app01_userinfo_user__permission_id_826033c9_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `app01_userinfo_user__userinfo_id_3a67a872_fk_app01_use` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_user_permissions`
--

LOCK TABLES `app01_userinfo_user_permissions` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_userinfo'),(22,'Can change user',6,'change_userinfo'),(23,'Can delete user',6,'delete_userinfo'),(24,'Can view user',6,'view_userinfo'),(25,'Can add order',7,'add_order'),(26,'Can change order',7,'change_order'),(27,'Can delete order',7,'delete_order'),(28,'Can view order',7,'view_order'),(29,'Can add matcha image',8,'add_matchaimage'),(30,'Can change matcha image',8,'change_matchaimage'),(31,'Can delete matcha image',8,'delete_matchaimage'),(32,'Can view matcha image',8,'view_matchaimage'),(33,'Can add comment',9,'add_comment'),(34,'Can change comment',9,'change_comment'),(35,'Can delete comment',9,'delete_comment'),(36,'Can view comment',9,'view_comment'),(37,'Can add shop info',10,'add_shopinfo'),(38,'Can change shop info',10,'change_shopinfo'),(39,'Can delete shop info',10,'delete_shopinfo'),(40,'Can view shop info',10,'view_shopinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app01_userinfo_nid` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app01_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `app01_userinfo` (`nid`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-03-14 04:43:22.432092','1','matcha',1,'[{\"added\": {}}]',10,1),(2,'2023-03-14 04:43:39.035944','1','matcha',2,'[{\"changed\": {\"fields\": [\"Number\"]}}]',10,1),(3,'2023-03-14 04:43:52.536099','1','image/g.jpg',1,'[{\"added\": {}}]',8,1),(4,'2023-03-14 04:43:59.592628','1','matcha',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',10,1),(5,'2023-03-14 07:41:31.558907','1','matcha',2,'[{\"changed\": {\"fields\": [\"Details\"]}}]',10,1),(6,'2023-03-14 07:42:42.658009','2','image/slider2.jpg',1,'[{\"added\": {}}]',8,1),(7,'2023-03-14 07:42:46.781326','1','matcha',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',10,1),(8,'2023-03-14 08:23:01.121780','3','image/banner5.jpg',1,'[{\"added\": {}}]',8,1),(9,'2023-03-14 08:23:02.506710','2','sweet',1,'[{\"added\": {}}]',10,1),(10,'2023-03-14 08:37:02.427609','2','2',3,'',7,1),(11,'2023-03-14 08:37:02.429602','1','1',3,'',7,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'app01','comment'),(8,'app01','matchaimage'),(7,'app01','order'),(10,'app01','shopinfo'),(6,'app01','userinfo'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-14 02:28:36.016078'),(2,'contenttypes','0002_remove_content_type_name','2023-03-14 02:28:36.065945'),(3,'auth','0001_initial','2023-03-14 02:28:36.220532'),(4,'auth','0002_alter_permission_name_max_length','2023-03-14 02:28:36.255438'),(5,'auth','0003_alter_user_email_max_length','2023-03-14 02:28:36.261422'),(6,'auth','0004_alter_user_username_opts','2023-03-14 02:28:36.266409'),(7,'auth','0005_alter_user_last_login_null','2023-03-14 02:28:36.271396'),(8,'auth','0006_require_contenttypes_0002','2023-03-14 02:28:36.274388'),(9,'auth','0007_alter_validators_add_error_messages','2023-03-14 02:28:36.281369'),(10,'auth','0008_alter_user_username_max_length','2023-03-14 02:28:36.286385'),(11,'auth','0009_alter_user_last_name_max_length','2023-03-14 02:28:36.292339'),(12,'auth','0010_alter_group_name_max_length','2023-03-14 02:28:36.305305'),(13,'auth','0011_update_proxy_permissions','2023-03-14 02:28:36.310292'),(14,'auth','0012_alter_user_first_name_max_length','2023-03-14 02:28:36.316275'),(15,'app01','0001_initial','2023-03-14 02:28:36.499323'),(16,'admin','0001_initial','2023-03-14 02:28:36.585093'),(17,'admin','0002_logentry_remove_auto_add','2023-03-14 02:28:36.593072'),(18,'admin','0003_logentry_add_action_flag_choices','2023-03-14 02:28:36.600053'),(19,'sessions','0001_initial','2023-03-14 02:28:36.623990'),(20,'app01','0002_matchaimage_shopinfo_order_comment_and_more','2023-03-14 04:11:50.177641'),(21,'app01','0003_comment_create_date','2023-03-14 04:29:21.044560'),(22,'app01','0004_alter_shopinfo_details','2023-03-14 05:44:45.535031'),(23,'app01','0005_shopinfo_create_date','2023-03-14 08:19:32.440816'),(24,'app01','0006_userinfo_amount_alter_shopinfo_number_and_more','2023-03-14 12:38:46.358892');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('01aikii2m28hllubfr0v05vqcil96kug','.eJxVjDsOwjAQBe_iGln-APFS0ucM1u56jQPIluKkQtwdIqWA9s3Me6mI61Li2mWOU1IXZdXhdyPkh9QNpDvWW9Pc6jJPpDdF77TrsSV5Xnf376BgL99aBB0KcQKbwZ0TEzuxaFwIBJBPg2HKmQXJAobgs_ceLALyYIPho3p_AClXOR8:1pbv0a:dgEGjGXBsVFAZHrouDtyEAl9qj0on9G_LYnFh4B29ek','2023-03-28 03:07:28.896657'),('4dud4yspki2tyrkzq8pzyyu3ftf77kwo','.eJy1lbtuwjAUhl8l8gwkTrgk3WiHTqhDxVQQOr6EuE1sZCdLEe9emyDaui2kILbonN-ffb5EzhatoKmLVWO4XgmG7hBGva81AvSNS9dgryDXakCVrLUgAxcZHLpmMFOMl_eH7DdAAaawqzmHGDihLMN5Fo8ZJTTmGKI4TUmW5aNJREmeUw4EZ5CmSZ4kSYYhAzrBaUSHDlpx2RjLetkukISKL9BdsEDTzSbCC9Szj8Ieri3moIMc-lRoWvK2WbkjGtf-vv5BVRZcmw6IRpdtLwRWCRmC2zqkLSBsM8DY_GTMBg5RojkwqpuK_HKsLmPtesElo-yWrs0Fc10cRbHPmUFNCwhEBWt-uZdqT9lDzrn5Gr2hn__M5UtKfNiTZlxfbke55ee8tKEbGuk0hK9i6FOeC7UJhMzV5TqMRTjCOSPH3A2ldB7HFzPySXNzzSfi7s8uTo65GzrpMomvY-wXsE-d2t-EvbAEhVooGYBkgSspLd73lZ8bGrehKQQvWR_K-vTV_qhVs_nl1HuIs2b6VK3_eAX2HOHaAU7o_8x0VX_9wL7DrkP6LyP1C5PdEu0-AF_ojHo:1pc5vU:AuRS3Tzn0jQXriNzvnDTrY9jouRN2quLW8Vr7zNAFHg','2023-03-28 14:46:56.244720');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-14 22:52:31
