-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: trip_planner
-- ------------------------------------------------------
-- Server version	5.7.40-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add login',7,'add_login'),(26,'Can change login',7,'change_login'),(27,'Can delete login',7,'delete_login'),(28,'Can view login',7,'view_login'),(29,'Can add package',8,'add_package'),(30,'Can change package',8,'change_package'),(31,'Can delete package',8,'delete_package'),(32,'Can view package',8,'view_package'),(33,'Can add staff',9,'add_staff'),(34,'Can change staff',9,'change_staff'),(35,'Can delete staff',9,'delete_staff'),(36,'Can view staff',9,'view_staff'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add itinerary',11,'add_itinerary'),(42,'Can change itinerary',11,'change_itinerary'),(43,'Can delete itinerary',11,'delete_itinerary'),(44,'Can view itinerary',11,'view_itinerary'),(45,'Can add plan',12,'add_plan'),(46,'Can change plan',12,'change_plan'),(47,'Can delete plan',12,'delete_plan'),(48,'Can view plan',12,'view_plan'),(49,'Can add category',13,'add_category'),(50,'Can change category',13,'change_category'),(51,'Can delete category',13,'delete_category'),(52,'Can view category',13,'view_category'),(53,'Can add booking',14,'add_booking'),(54,'Can change booking',14,'change_booking'),(55,'Can delete booking',14,'delete_booking'),(56,'Can view booking',14,'view_booking'),(57,'Can add payment',15,'add_payment'),(58,'Can change payment',15,'change_payment'),(59,'Can delete payment',15,'delete_payment'),(60,'Can view payment',15,'view_payment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(45) NOT NULL,
  `adults` varchar(45) NOT NULL,
  `children` varchar(45) NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,10,18,'2025-02-13','paid','',''),(2,10,18,'2025-02-22','pending','',''),(3,10,18,'2025-01-22','pending','',''),(4,10,18,'2025-01-22','pending','',''),(5,10,18,'2025-01-22','accepted','',''),(6,1,19,'2025-02-05','pending','',''),(7,1,19,'2025-02-05','paid','',''),(8,14,19,'2025-02-12','paid','',''),(9,15,20,'2025-02-13','pending','',''),(10,16,20,'2025-03-01','rejected','',''),(11,16,22,'2025-02-28','paid','',''),(12,15,20,'2025-03-14','rejected','',''),(13,15,20,'2025-03-14','paid','',''),(15,17,18,'2025-03-25','paid','',''),(16,17,20,'2025-03-05','paid','',''),(17,17,20,'2025-03-06','rejected','',''),(18,17,19,'2025-03-21','paid','',''),(19,18,22,'2025-03-15','paid','',''),(20,18,18,'2025-03-23','paid','',''),(21,1,19,'2025-03-08','pending','',''),(22,1,19,'2025-03-14','pending','',''),(23,1,19,'2025-03-14','pending','',''),(24,1,19,'2025-02-27','pending','',''),(25,1,19,'2025-03-14','pending','',''),(26,1,19,'2025-03-13','pending','',''),(27,16,19,'2025-03-14','pending','',''),(28,16,19,'2025-03-14','pending','',''),(29,16,19,'2025-03-15','Rejected','',''),(30,16,19,'2025-03-15','paid','',''),(31,16,19,'2025-03-13','paid','',''),(32,16,19,'2025-03-04','paid','',''),(33,16,19,'2025-02-27','paid','',''),(34,16,20,'2025-03-20','paid','',''),(35,16,22,'2025-03-15','paid','',''),(36,16,20,'2025-03-21','Rejected','',''),(37,17,22,'2025-03-21','Accepted','',''),(38,17,19,'2025-03-31','Rejected','',''),(39,17,18,'2025-03-22','paid','',''),(40,17,19,'2025-03-28','paid','',''),(41,20,22,'2025-04-15','paid','',''),(42,22,19,'2025-03-19','pending','',''),(43,22,19,'2025-03-20','paid','',''),(44,20,18,'2025-03-20','Accepted','',''),(46,19,22,'2025-03-21','paid','',''),(47,19,20,'2025-03-30','Rejected','',''),(48,17,19,'2025-03-22','paid','',''),(50,17,20,'2025-03-28','Accepted','1','1'),(51,24,23,'2025-07-15','paid','3','2'),(52,24,19,'2025-04-23','paid','2','2'),(53,26,18,'2026-01-01','waiting for approval','4','0'),(54,24,18,'2025-04-11','Accepted','4','2'),(55,24,20,'2025-10-15','waiting for approval','3','3');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Family'),(2,'Couple'),(3,'Holiday'),(4,'Individual');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(14,'booking','booking'),(13,'category','category'),(5,'contenttypes','contenttype'),(11,'itinerary','itinerary'),(12,'itinerary','plan'),(7,'login','login'),(8,'package','package'),(15,'payment','payment'),(6,'sessions','session'),(9,'staff','staff'),(10,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-01-25 11:53:08.563436'),(2,'auth','0001_initial','2025-01-25 11:53:09.190726'),(3,'admin','0001_initial','2025-01-25 11:53:09.415115'),(4,'admin','0002_logentry_remove_auto_add','2025-01-25 11:53:09.457569'),(5,'admin','0003_logentry_add_action_flag_choices','2025-01-25 11:53:09.474709'),(6,'contenttypes','0002_remove_content_type_name','2025-01-25 11:53:09.661494'),(7,'auth','0002_alter_permission_name_max_length','2025-01-25 11:53:09.724394'),(8,'auth','0003_alter_user_email_max_length','2025-01-25 11:53:09.755640'),(9,'auth','0004_alter_user_username_opts','2025-01-25 11:53:09.775280'),(10,'auth','0005_alter_user_last_login_null','2025-01-25 11:53:09.875449'),(11,'auth','0006_require_contenttypes_0002','2025-01-25 11:53:09.881462'),(12,'auth','0007_alter_validators_add_error_messages','2025-01-25 11:53:09.897095'),(13,'auth','0008_alter_user_username_max_length','2025-01-25 11:53:09.928341'),(14,'auth','0009_alter_user_last_name_max_length','2025-01-25 11:53:09.975578'),(15,'auth','0010_alter_group_name_max_length','2025-01-25 11:53:10.007274'),(16,'auth','0011_update_proxy_permissions','2025-01-25 11:53:10.038563'),(17,'auth','0012_alter_user_first_name_max_length','2025-01-25 11:53:10.080140'),(18,'login','0001_initial','2025-01-25 11:53:10.092764'),(19,'package','0001_initial','2025-01-25 11:53:10.107922'),(20,'sessions','0001_initial','2025-01-25 11:53:10.196535'),(21,'staff','0001_initial','2025-01-25 11:53:10.212166'),(22,'user','0001_initial','2025-01-25 11:53:10.212166'),(23,'booking','0001_initial','2025-03-14 11:31:23.848891'),(24,'category','0001_initial','2025-03-14 11:31:23.861616'),(25,'itinerary','0001_initial','2025-03-14 11:31:23.873072'),(26,'payment','0001_initial','2025-03-14 11:31:23.877037');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('20esroauqzf1gfhlxcvsmisaqea7pzso','eyJ1X2lkIjoxfQ:1tlPZT:JM_EUra0xR-SaZwe2YJPqXYnT-PymYlz6hDTFJXdKTA','2025-03-07 09:43:47.197432'),('i1w4ik76t091io58sl1adbwdrpz9nncg','eyJ1X2lkIjoxfQ:1tghmp:qx6hiltxYJFFTGzVYeUiaLaHEvx7DE4i4iut7OxerOE','2025-02-22 10:10:07.602606'),('p1uw647ywxr9v3ck6vho18tk8qw4mrz4','eyJ1X2lkIjoxfQ:1tfCHQ:KHzvJQqCn2-t_KFSPiFNeu_EqS1Hl-gbVI72H3u76aU','2025-02-18 06:19:28.484875'),('spmk0clajngqs75wuo9gavf1kxq916nb','eyJ1X2lkIjoxfQ:1te6zP:CznLXsy3qzUBq-Gl6aNCip2uABhPAFuJrTjmpImT_Oc','2025-02-15 06:28:23.526444'),('wghqj09ck8o5e6ugb82owe3fvb6eaemz','eyJ1X2lkIjoxLCJtc2ciOiJSZWdpc3RlcmVkIHN1Y2Nlc3NmdWxseSEgUGxlYXNlIGxvZyBpbi4iLCJwYXlpZCI6IjU3In0:1u1fLe:gwTpo5s0ly-WZBS15OnbF_z5UJ5x8LxZtN0NJui6IVo','2025-04-21 05:48:42.405711');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedbackid` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `rating` varchar(45) NOT NULL,
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (3,'nice',1,'2025-03-20','4'),(6,'good\r\n',20,'2025-03-21','3'),(7,'good\r\n',22,'2025-03-27','4');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itinerary`
--

DROP TABLE IF EXISTS `itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itinerary` (
  `itinerary_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  PRIMARY KEY (`itinerary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerary`
--

LOCK TABLES `itinerary` WRITE;
/*!40000 ALTER TABLE `itinerary` DISABLE KEYS */;
INSERT INTO `itinerary` VALUES (20,18,7,'Day 1: Arrival and Local Sightseeing\r\nPickup from Cochin Airport / Railway Station\r\nDrive to Munnar (Approx 4 hrs) via scenic tea plantations\r\nCheck-in at the hotel & freshen up\r\nVisit Tea Museum & Pothamedu Viewpoint\r\nExplore Blossom Park & enjoy a leisure evening\r\nOvernight stay in Munnar.\r\nDay 2: Munnar Sightseeing\r\nBreakfast at the hotel\r\nVisit Eravikulam National Park (home of the Nilgiri Tahr)\r\nExplore Mattupetty Dam & Echo Point\r\nVisit Kundala Lake – boating & scenic views\r\nOptional visit to Top Station (panoramic views)\r\nReturn to the hotel & overnight stay.\r\nDay 3: Departure\r\nBreakfast and check-out from the hotel\r\nVisit Attukal Waterfalls on the way back\r\nDrive back to Cochin & drop at Airport or Railway Station.','',0,0),(21,19,14,'Day 1: Munnar Sightseeing\r\nPickup from Cochin Airport/Railway Station\r\nDrive to Munnar (Approx. 4 hrs) via scenic tea plantations\r\nVisit Tea Museum, Mattupetty Dam & Echo Point\r\nExplore Eravikulam National Park (if time permits)\r\nEvening drive to Thekkady (Approx. 3.5 hrs)\r\nCheck-in at hotel & overnight stay\r\nDay 2: Thekkady – Alleppey\r\nEarly morning Periyar Wildlife Sanctuary boat safari\r\nExplore Spice Plantation & local market\r\nDrive to Alleppey (Approx. 4.5 hrs)\r\nCheck-in to Houseboat & enjoy backwater cruise\r\nOvernight stay on houseboat with all meals\r\nDay 3: Departure from Alleppey\r\nBreakfast on houseboat & check-out\r\nDrop-off at Cochin Airport/Railway Station','',0,0),(22,20,14,'Day 1: Explore Kochi\r\nPickup from Cochin Airport / Railway Station\r\nVisit Fort Kochi, Mattancherry Palace & Jew Town\r\nExplore St. Francis Church & Chinese Fishing Nets\r\nVisit Marine Drive & Lulu Mall (if time permits)\r\nEvening drive to Munnar (Approx. 4.5 hrs)\r\nCheck-in at hotel & overnight stay in Munnar\r\nDay 2: Munnar Sightseeing\r\nBreakfast at the hotel\r\nVisit Eravikulam National Park (home of the Nilgiri Tahr)\r\nExplore Tea Museum, Mattupetty Dam, & Echo Point\r\nVisit Kundala Lake & Top Station for stunning views\r\nOptional activities: Boating, Jeep Safari\r\nReturn to hotel & overnight stay in Munnar\r\nDay 3: Departure\r\nBreakfast & check-out from the hotel\r\nVisit Pothamedu Viewpoint & Attukal Waterfalls\r\nDrive back to Cochin & drop at Airport/Railway Station.','',0,0),(25,22,9,'Day 1: Arrival & Kovalam Sightseeing\r\nArrive at Trivandrum Airport/Railway Station & transfer to Kovalam\r\nCheck-in at the hotel & relax at Kovalam Beach\r\nVisit Lighthouse Beach, Hawa Beach, & Samudra Beach\r\nExplore Vizhinjam Marine Aquarium & Halcyon Castle\r\nEnjoy a sunset at Kovalam Beach\r\nOvernight stay in Kovalam.\r\nDay 2: Kanyakumari Excursion\r\nBreakfast & check-out from Kovalam\r\nDrive to Kanyakumari (Approx. 2.5 hrs)\r\nVisit Vivekananda Rock Memorial & Thiruvalluvar Statue\r\nExplore Kanyakumari Temple, Gandhi Memorial, & Triveni Sangam\r\nEnjoy a breathtaking sunset at Sunset Point\r\nOvernight stay in Kanyakumari.\r\nDay 3: Departure\r\nEarly morning sunrise view at Kanyakumari\r\nBreakfast & check-out\r\nVisit Padmanabhapuram Palace (optional) en route\r\nDrop-off at Trivandrum Airport/Railway Station.','',0,0),(26,23,1,'Day 1: Alleppey\r\nMorning: Arrival in Alleppey. Check into a houseboat or resort.\r\nAfternoon: Cruise through the serene backwaters. Enjoy lunch onboard.\r\nEvening: Sunset at Alleppey Beach and explore the local market.\r\nStay: Overnight in Alleppey (houseboat or hotel).\r\nDay 2: Kumarakom\r\nMorning: Drive to Kumarakom (approx. 45 mins). Visit the Kumarakom Bird Sanctuary.\r\nAfternoon: Relax by Vembanad Lake, try canoeing or a shikara ride.\r\nEvening: Enjoy a peaceful sunset. Travel to Kovalam (approx. 4-5 hrs).\r\nStay: Overnight in Kovalam.\r\nDay 3: Kovalam\r\nMorning: Visit Lighthouse Beach and Hawa Beach.\r\nAfternoon: Explore the Vizhinjam Marine Aquarium or indulge in Ayurvedic spa treatments.\r\nEvening: Enjoy the sunset before departing.',NULL,NULL,NULL);
/*!40000 ALTER TABLE `itinerary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin','admin','admin',1),(2,'yguh','13456','staff',3),(4,'Amala','5678990','user',3),(5,'Amala','5678990','user',4),(6,'Diya','8086498763','user',5),(7,'Hljlk87098-0','9876543323','user',6),(8,'987','9087665544','staff',6),(9,'Wertyuy','9877665556','user',7),(10,'Amala','8086498763','staff',7),(11,'ewrtyu','8086498763','staff',8),(12,'ewrtyu','8086498763','staff',9),(13,'ewrtyu','8086498763','staff',10),(14,'ewrtyu','8086498763','staff',11),(15,'ewrtyu','8086498763','staff',12),(16,'Wesrdtfygh','9999992340','staff',13),(17,'Afnan','9876543567','user',8),(18,'Raju','9999999999','user',9),(19,'Smitha M','9999999999','staff',14),(20,'Abhishek','8086585538','user',10),(21,'Aaaa','9876549876','user',11),(22,'Aaa','9999999999','user',12),(23,'Wertyu','9999992340','user',13),(24,'Abhi N','8888888888','user',14),(25,'Ashok','9497210670','user',15),(26,'Fasna','9999992340','user',16),(27,'Ashik','9999992340','staff',15),(28,'Aswin','9876543567','staff',16),(29,'Aswin','9876543567','staff',17),(30,'Ramu','9999992340','staff',18),(31,'Ramu','9999992340','staff',19),(33,'archanavadakkedath002@gmail.com','9999999999','staff',21),(34,'ramu','ramu','user',17),(35,'diya','diya','user',18),(36,'amala','amala','user',19),(37,'amalachinnu25@gmail.com','8086498763','staff',22),(38,'huda','huda','user',20),(39,'huda','huda','user',21),(40,'risvana','risvana','user',22),(41,'risvana','risvana','user',23),(42,'Archana','9999999999','staff',23),(43,'Archana','9999999999','staff',24),(44,'Archana','9999999999','staff',26),(45,'Archana','9999999999','staff',27),(46,'Saritha','9497210670','staff',28),(47,'Sanu J','8086498763','staff',29),(48,'Sanvika','8086498764','staff',30),(49,'Sanvika','8086498764','staff',31),(50,'sayanth','sayanth','user',24),(51,'111','111','user',26);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `destination` varchar(300) NOT NULL,
  `descriptiom` varchar(300) NOT NULL,
  `amount` int(11) NOT NULL,
  `days` varchar(45) NOT NULL,
  `image` varchar(500) NOT NULL,
  `category_id` int(11) NOT NULL,
  `people` int(11) NOT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (18,'Munnar (3D)','A Blissful Tour In Munnar',17998,'2Nights / 3Days','munnar_VKctSgC.jpg',1,2),(19,'Munnar (1D) Thekkady (1D) Alleppey (1D)','Best Selling Kerala Houseboat & Jungle Safari Tour Package ',20599,'2Nights / 2Days','munnar_P0gTgS1.jpg',2,2),(20,'Cochin (1D) Munnar (2D)','Enriching Kochi Munnar Tour Package',12899,'2Nights / 3Days','munnar_4IkkB9F.jpg',3,3),(22,'Kovalam (2D) Kanyakumari (2D)','Exciting Kanyakumari-Kovalam Family Tour Package	',30699,'3Nights / 2Days','munnar_AO7XLWg.jpg',2,2),(23,'Alleppey(1D) Kumarakom(1D) Kovalam(1D)','Scenic Kerala Family Package',10520,'2Nights / 3Days','munnar_oAyG3KJ.jpg',1,2);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,8,14,20599,'2025-02-28','paid'),(2,8,14,20599,'2025-02-28','pending'),(3,10,16,12899,'2025-02-28','pending'),(4,10,16,12899,'2025-02-28','pending'),(5,8,1,20599,'2025-03-01','pending'),(6,11,16,30699,'2025-03-01','pending'),(7,13,15,12899,'2025-03-01','pending'),(8,13,15,12899,'2025-03-01','paid'),(9,15,17,7998,'2025-03-01','paid'),(10,16,17,12899,'2025-03-04','paid'),(11,18,17,20599,'2025-03-04','paid'),(12,18,17,20599,'2025-03-04','paid'),(13,18,17,20599,'2025-03-04','paid'),(14,15,17,7998,'2025-03-07','paid'),(15,11,16,30699,'2025-03-07','paid'),(16,11,16,30699,'2025-03-07','paid'),(17,19,18,30699,'2025-03-07','paid'),(18,20,18,7998,'2025-03-07','paid'),(19,15,17,7998,'2025-03-07','paid'),(20,1,1,7998,'2025-03-10','paid'),(21,1,1,7998,'2025-03-10','pending'),(22,18,1,20599,'2025-03-10','pending'),(23,7,1,20599,'2025-03-10','paid'),(24,30,16,20599,'2025-03-10','pending'),(25,30,16,20599,'2025-03-10','paid'),(26,31,16,20599,'2025-03-10','pending'),(27,31,16,20599,'2025-03-10','paid'),(28,32,16,20599,'2025-03-10','paid'),(29,33,16,20599,'2025-03-10','paid'),(30,34,16,12899,'2025-03-10','paid'),(31,34,16,12899,'2025-03-10','pending'),(32,35,16,30699,'2025-03-10','pending'),(33,35,16,30699,'2025-03-10','pending'),(34,35,16,30699,'2025-03-10','pending'),(35,35,16,30699,'2025-03-10','pending'),(36,35,16,30699,'2025-03-10','paid'),(37,33,16,20599,'2025-03-10','pending'),(38,18,17,20599,'2025-03-10','paid'),(39,18,17,20599,'2025-03-10','pending'),(40,37,17,30699,'2025-03-10','pending'),(41,37,17,30699,'2025-03-10','pending'),(42,39,17,7998,'2025-03-10','pending'),(43,39,17,7998,'2025-03-10','pending'),(44,39,17,7998,'2025-03-10','paid'),(45,40,17,20599,'2025-03-10','paid'),(46,41,20,30699,'2025-03-11','paid'),(47,43,22,20599,'2025-03-12','paid'),(48,43,22,20599,'2025-03-14','pending'),(49,43,22,20599,'2025-03-14','paid'),(50,44,20,7998,'2025-03-14','pending'),(51,46,19,30699,'2025-03-14','paid'),(52,48,17,20599,'2025-03-14','paid'),(53,51,24,10520,'2025-03-14','pending'),(54,51,24,10520,'2025-03-14','paid'),(55,52,24,20599,'2025-04-03','paid'),(56,54,24,17998,'2025-04-06','pending'),(57,54,24,17998,'2025-04-06','pending');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `planid` int(11) NOT NULL AUTO_INCREMENT,
  `plan` varchar(3000) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`planid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (2,'Here is a low-budget trip plan for 2 days in Kannur, Kerala:\n\nDay 1:\n- Arrive in Kannur and check-in to a budget hotel or guesthouse (approx. INR 500-1000 per night).\n- Visit St. Angelo’s Fort, a historic fort overlooking the Arabian Sea.\n- Explore Payyambalam Beach and relax by the sea.\n- Have a budget-friendly meal at a local restaurant (approx. INR 200-300 per person).\n\nDay 2:\n- Start the day with a visit to Arakkal Museum, showcasing the history of the Arakkal family.\n- Explore Muzhappilangad Drive-in Beach, known for being one of the longest drive-in beaches in Asia.\n- Visit Parassinikadavu Snake Park and experience the unique collection of snakes and reptiles.\n- Enjoy a traditional Malabar meal at a local eatery (approx. INR 150-250 per person).\n\nApproximate Budget for 2 days (per person):\n- Accommodation: INR 1000\n- Meals: INR 1000\n- Local Transportation: INR 500\n- Entrance Fees and Miscellaneous: INR 500\n\nTotal Approximate Budget: INR 3000 per person\n\nPlease note that these are approximate budget estimates and actual expenses may vary based on personal preferences and choices. It\'s always a good idea to carry some extra cash for emergencies or unexpected expenses. Enjoy your trip to Kannur!',1),(3,'Sure! Here is a suggested itinerary for a budget trip to Ooty for 2 days:\n\nDay 1:\n- Arrive in Ooty and check into a budget hotel or guesthouse\n- Visit the Government Botanical Garden to enjoy the beautiful flower beds and lush greenery\n- Take a walk around Ooty Lake and enjoy boating (optional)\n- Visit the Rose Garden to see a variety of roses\n- Explore the local market for some shopping and try local street food\n- Overnight stay in Ooty\n\nDay 2:\n- Visit the Doddabetta Peak for panoramic views of the Nilgiri Hills\n- Explore the Tea Museum to learn about the history of tea in the region\n- Visit the Pykara Waterfalls for a relaxing time in nature\n- Enjoy a boat ride at Pykara Lake (optional)\n- Head back to the hotel, pack up, and check out\n- Depart from Ooty\n\nApproximate budget for a 2-day trip to Ooty for one person:\n- Accommodation: INR 1000-1500 per night (for budget hotel or guesthouse)\n- Food: INR 500-700 per day\n- Local transportation: INR 500-800 for two days\n- Entrance fees and activities: INR 500-1000\n- Total approximate budget: INR 3500-5000\n\nPlease note that the budget can vary depending on your preferences, the type of accommodation, and the activities you choose to do. It\'s always a good idea to plan and book in advance to get the best deals.',1),(4,'Sure! Here\'s a suggested trip plan for Ooty for 2 days with a low budget:\n\nDay 1:\n- Start your day with a visit to the Botanical Gardens\n- Head to Ooty Lake for boating\n- Visit the Rose Garden\n- Explore the Doddabetta Peak for panoramic views\n- Enjoy a budget-friendly lunch at a local eatery\n- Visit the Tea Museum\n- Relax and unwind at your budget accommodation\n\nDay 2:\n- Take a toy train ride on the Nilgiri Mountain Railway\n- Visit the Government Museum\n- Explore the Pykara Lake and Waterfalls\n- Enjoy a picnic lunch at Pykara Lake\n- Explore the local markets for souvenirs\n- Depart from Ooty in the evening\n\nApproximate budget for a low-budget trip to Ooty for 2 days:\n- Accommodation: INR 1500-2000 per night (for 2 nights)\n- Food: INR 500-700 per day\n- Local transportation: INR 500-700 for 2 days\n- Entry fees and activities: INR 500-700 per day\n- Miscellaneous expenses: INR 500-700\n\nTotal approximate budget for 2 days: INR 5000-7000 (excluding travel to and from Ooty). Prices may vary based on your preferences and choices.',1),(5,'Sure! Here is a suggested 2-day trip plan to Calicut with a low budget:\n\nDay 1:\n- Arrive in Calicut and check into a budget hotel or guesthouse (approx. Rs. 1000 per night)\n- Visit Kozhikode Beach for a relaxing evening by the sea\n- Explore the local markets like SM Street for shopping and trying local street food\n- Dinner at a budget-friendly local restaurant (approx. Rs. 500 for two people)\n\nDay 2:\n- Have breakfast at a local tea stall or bakery (approx. Rs. 200 for two people)\n- Visit Beypore Beach and experience the unique sight of traditional wooden shipbuilding\n- Explore the Mananchira Square and take a leisurely walk around the Mananchira Pond\n- Have lunch at a local eatery serving traditional Malabar cuisine (approx. Rs. 600 for two people)\n- Visit the Kappad Beach, known for its historical significance as the place where Vasco da Gama landed in India\n- Enjoy a budget-friendly dinner at a local restaurant or food stall (approx. Rs. 500 for two people)\n\nApproximate budget for the 2-day trip for two people:\n- Accommodation: Rs. 2000\n- Meals: Rs. 2000\n- Transportation (local buses, auto-rickshaws): Rs. 1000\n- Miscellaneous (entry fees, souvenirs, etc.): Rs. 1000\n\nTotal approximate budget: Rs. 6000\n\nPlease note that the prices mentioned are approximate and can vary based on your preferences and choices during the trip.',18),(6,'For a low-budget trip to a destination within a day, I recommend exploring local attractions or areas near your city. Here\'s a trip plan for a day trip to Lonavala, which is around 45 km from Pune and is a popular destination for a quick getaway.\n\nTrip Plan:\n- Start early in the morning to make the most of your day.\n- Take a bus or train to Lonavala from Pune.\n- Visit the famous Tiger\'s Point for panoramic views of the valley.\n- Explore the Bhushi Dam and enjoy a relaxing time by the water.\n- Visit the Karla Caves to explore ancient Buddhist rock-cut caves.\n- Enjoy local street food and snacks.\n- Return to Pune by evening.\n\nApproximate Budget (in Indian Rupees):\n- Bus/Train Fare: Rs. 200-300 (round trip)\n- Snacks and Food: Rs. 300-500\n- Entry Fees (if any): Rs. 50-100\n- Miscellaneous: Rs. 200\n\nTotal Approximate Budget: Rs. 750-1100\n\nPlease note that the budget may vary based on your preferences and additional expenses. Also, make sure to check the current travel guidelines and restrictions before planning your trip.',19),(7,'Sure! Here is a one-day trip plan to a nearby location within a low budget for you:\n\nDestination: A nearby hill station or a historical site\nBudget: Approximately INR 2,000-3,000 per person\n\nTrip Plan:\n- Start early in the morning to make the most of your day.\n- Take public transportation or carpool with friends to save on travel costs.\n- Pack a homemade lunch and snacks to avoid eating out at expensive restaurants.\n- Visit local attractions or enjoy nature walks/hikes to explore the destination.\n- Take photographs and make memories without spending much on souvenirs.\n- Return home in the evening to avoid additional accommodation costs.\n\nRemember to plan your trip according to your interests and preferences, and adjust the budget as necessary based on the activities you choose to do. Have a great trip!',19),(8,'Sure! Here is a budget-friendly trip plan for a 2-day trip to Munnar:\n\nDay 1:\n- Start your day early and visit the Tea Museum to learn about the history and process of tea making in Munnar.\n- Enjoy a leisurely walk through the tea plantations and take in the scenic beauty of the surroundings.\n- Visit the Mattupetty Dam and enjoy a boat ride on the reservoir.\n- Explore the Echo Point and Top Station for panoramic views of the Western Ghats.\n- Spend the evening relaxing at your budget accommodation.\n\nDay 2:\n- Start your day with a visit to the Eravikulam National Park to spot the Nilgiri Tahr and enjoy the lush greenery.\n- Visit the Rose Garden for a peaceful walk amidst beautiful flowers.\n- Head to the Pothamedu View Point for stunning views of the hills and valleys.\n- Explore the local markets for some souvenirs and local delicacies.\n- End your trip with a visit to the Attukal Waterfalls for some tranquility and natural beauty.\n\nApproximate Budget for 2 days:\n- Accommodation (budget guesthouse): INR 2000 - 3000\n- Food (local restaurants): INR 1500 - 2000\n- Transportation (local buses/taxis): INR 500 - 1000\n- Entry fees and miscellaneous expenses: INR 1000 - 1500\n\nTotal Approximate Budget: INR 5000 - 7500\n\nPlease note that the above budget is an estimate and can vary based on your preferences, type of accommodation chosen, and additional activities you may want to include in your itinerary.',19),(9,'Here is a suggested trip plan to Munnar for 2 days on a low budget:\n\nDay 1:\n- Arrive in Munnar and check into a budget hotel or guesthouse.\n- Visit the Tea Museum to learn about the history and process of tea making in Munnar.\n- Explore the local markets and try some authentic South Indian cuisine for lunch.\n- Visit the picturesque Attukal Waterfalls for some nature sightseeing.\n- Enjoy a leisurely evening walk through the tea plantations and watch the sunset.\n\nDay 2:\n- Have an early breakfast and head to Eravikulam National Park to see the endangered Nilgiri Tahr and enjoy the scenic views.\n- Visit the Mattupetty Dam for some boating and enjoy the surrounding hills and tea plantations.\n- Explore the Echo Point, where you can hear your voice echo across the hills.\n- Visit the Top Station for panoramic views of the Western Ghats.\n- Head back to the hotel and relax before your departure.\n\nApproximate Budget for 2 days in Munnar:\n- Accommodation: INR 1500 - 2000 per night (for a budget hotel or guesthouse)\n- Meals: INR 500 - 700 per day (for budget dining options)\n- Transportation: INR 1000 - 1500 (for local travel within Munnar)\n- Entry fees and miscellaneous expenses: INR 1000 - 1500\n\nTotal Approximate Budget for 2 days: INR 6000 - 8000\n\nPlease note that the budget may vary based on your preferences, the season of travel, and any additional activities you choose to include.',19),(10,'Sure! Here\'s a suggested itinerary for a 3-day trip to Munnar on a low budget:\n\nDay 1:\n- Arrive in Munnar and check into a budget guesthouse or homestay.\n- Visit the Tea Museum to learn about the history and process of tea making in Munnar.\n- Explore the local markets and indulge in some shopping.\n- Enjoy a sunset at the Pothamedu View Point.\n- Dinner at a local eatery.\n\nDay 2:\n- Start the day with a visit to the Eravikulam National Park to see the Nilgiri Tahr.\n- Head to the Mattupetty Dam and enjoy a boat ride on the reservoir.\n- Visit the Echo Point and take a short trek to enjoy the scenic views.\n- Explore the Top Station for panoramic views of the Western Ghats.\n- Return to your accommodation for the night.\n\nDay 3:\n- Visit the beautiful Attukal Waterfalls for a refreshing experience.\n- Explore the lush greenery of the Tea Gardens and take a leisurely walk.\n- Visit the Rose Garden to see a variety of flowers.\n- Check out from your accommodation and head back to your departure location.\n\nApproximate budget for a low-cost trip to Munnar for 3 days:\n- Accommodation (budget guesthouse/homestay): Rs. 1500 to Rs. 2000 per night (x2 nights)\n- Meals: Rs. 500 to Rs. 700 per day (x3 days)\n- Local transportation (bus/taxi): Rs. 500 to Rs. 800 per day (x3 days)\n- Entry fees and miscellaneous expenses: Rs. 1000 to Rs. 1500 for the entire trip\n\nTotal approximate budget: Rs. 6000 to Rs. 9000 per person\n\nPlease note that these are rough estimates and prices may vary based on the season and specific preferences. It\'s always a good idea to research and book in advance to get the best deals.',1),(11,'Here is a suggested itinerary for a 2-day trip to Palakkad on a low budget:\n\nDay 1:\n- Morning: Start your day by visiting the famous Palakkad Fort, which is a historical landmark in the city. You can explore the fort and learn about its history.\n- Lunch: Enjoy a traditional Kerala meal at a local restaurant or try some street food to experience the local flavors.\n- Afternoon: Visit the Malampuzha Dam and Gardens, a popular picnic spot among locals and tourists. You can take a boat ride in the reservoir or explore the beautiful gardens.\n- Evening: Head to the Palakkad Tipu Sultan\'s Fort, another historical site in the city. Enjoy the sunset from the fort and take in the panoramic views.\n- Dinner: Have dinner at a budget-friendly local restaurant or try some street food for a taste of authentic Kerala cuisine.\n\nDay 2:\n- Morning: Visit the Silent Valley National Park, located around 80 km from Palakkad. It is a biodiversity hotspot and home to a variety of flora and fauna. You can go for a nature walk or trek in the park.\n- Lunch: Have a packed lunch or eat at a local eatery near the national park.\n- Afternoon: Explore the Dhoni Waterfalls, a scenic waterfall located near Palakkad. You can take a short trek to reach the waterfall and enjoy the natural beauty.\n- Evening: Spend some time at the Kanjirapuzha Dam, a serene spot to relax and unwind. You can enjoy the sunset and take a leisurely walk around the dam.\n- Dinner: Have dinner at a local restaurant in Palakkad before heading back to your accommodation.\n\nAccommodation: Look for budget-friendly guesthouses, homestays, or budget hotels in Palakkad for your overnight stay.\n\nTransport: You can use public transport like buses or hire a local taxi for sightseeing within the city and nearby attractions.\n\nThis itinerary should give you a good mix of exploring the cultural and natural attractions in Palakkad while staying within a low budget. Enjoy your trip!',1),(12,'Day 1:\n- Start your day with a visit to the Tea Museum to learn about the history and process of tea making in Munnar.\n- Enjoy a picnic lunch at the picturesque Mattupetty Dam.\n- Visit the Echo Point, where you can shout out and hear your voice echo back.\n- Spend the evening at the Attukal Waterfalls for a scenic view and relaxation.\n- Stay overnight at a budget-friendly guesthouse or homestay in Munnar.\n\nDay 2:\n- Begin your day with a visit to the beautiful Top Station, offering panoramic views of the Western Ghats.\n- Explore the Eravikulam National Park to spot the endangered Nilgiri Tahr and enjoy the lush greenery.\n- Have lunch at a local eatery to experience authentic Kerala cuisine.\n- Visit the Rose Garden to admire the colorful blooms and relax in a tranquil setting.\n- End your trip with a visit to the Chinnar Wildlife Sanctuary for some wildlife spotting.\n- Depart from Munnar in the evening, with memories of a wonderful budget-friendly trip.\n\nRemember to pack light, carry water and snacks, and wear comfortable clothing and shoes for the trip.',1),(13,'I\'m sorry, but it is not possible to plan a 2-day trip to Munnar within a budget of $100. Munnar is a popular hill station in Kerala, India, and expenses such as accommodation, transportation, food, and sightseeing will likely exceed $100 for a 2-day trip. It is important to consider the cost of accommodation, transportation, meals, and any additional activities you plan to do during your trip. I recommend budgeting at least $150-$200 for a 2-day trip to Munnar to ensure a comfortable and enjoyable experience. Let me know if you would like help planning a trip within a different budget range.',17),(14,'Here\'s a suggested itinerary for a 2-day trip to Munnar on a low budget:\n\nDay 1:\n- Start early in the morning and head to Munnar from your location. You can either take a bus or hire a cab for a budget-friendly option.\n- Check into a budget hotel or guesthouse in Munnar. There are several affordable accommodation options available in the area.\n- After freshening up, head to the Tea Museum to learn about the history and production of tea in Munnar. The entry fee is minimal.\n- Enjoy a walk through the lush tea gardens and take in the scenic views of the surrounding hills.\n- Have a simple and delicious lunch at a local eatery or street food stall.\n- In the afternoon, visit the Rose Garden and enjoy a leisurely stroll among various colorful flowers.\n- End the day with a visit to the Attukal Waterfalls for some relaxation and beautiful views.\n- Have dinner at a budget-friendly restaurant in town before heading back to your accommodation for a good night\'s rest.\n\nDay 2:\n- Start the day with a visit to the Mattupetty Dam, where you can enjoy boating and take in the picturesque surroundings.\n- Visit the Echo Point to experience the natural echo phenomenon and enjoy the panoramic views of the hills.\n- Have a simple lunch at a local restaurant before heading to the Top Station for breathtaking views of the Western Ghats.\n- Explore the local markets in Munnar for some souvenir shopping and try out some local delicacies.\n- In the evening, visit the Pothamedu View Point for a stunning sunset view over the hills.\n- Enjoy a budget-friendly dinner at a local restaurant before heading back to your accommodation.\n\nRemember to pack light and carry essentials like water, snacks, and comfortable clothing for your trip. Enjoy your budget-friendly 2-day trip to Munnar!',17),(15,'Day 1:\n- Start your day with a visit to the Tea Museum to learn about the history and process of tea production in Munnar.\n- Enjoy a leisurely stroll through the lush tea plantations and take in the scenic beauty of the surroundings.\n- Head to the Pothamedu View Point for panoramic views of the valley and the mist-covered hills.\n- Visit the Attukal Waterfalls for a relaxing time amidst nature.\n- Check-in at a budget-friendly homestay or guesthouse for the night.\n\nDay 2:\n- Begin your day with a visit to the Eravikulam National Park to spot the endangered Nilgiri Tahr and enjoy a nature walk.\n- Head to the Mattupetty Dam for boating and picturesque views of the reservoir and surrounding hills.\n- Visit the Rose Garden for a colorful display of various flowers and plants.\n- Explore the local markets for souvenirs and try out some local cuisine.\n- Depart Munnar with wonderful memories and a rejuvenated spirit.',22),(16,'Here is a suggested itinerary for a 2-day trip to Munnar within a budget of 100000:\n\nDay 1:\n- Arrive in Munnar and check into a budget-friendly hotel or homestay. (Approx. INR 3000 per night)\n- Have breakfast at a local eatery or at the hotel.\n- Visit the Tea Museum to learn about the history and process of tea production. (Entrance fee: INR 125 per person)\n- Explore the beautiful tea plantations in Munnar, such as the Kolukkumalai Tea Estate.\n- Have lunch at a local restaurant (Approx. INR 500 per person)\n- Visit the Mattupetty Dam and enjoy a boat ride on the serene waters. (Boat ride fee: INR 300 per person)\n- Visit the Echo Point and enjoy the natural beauty and echo phenomenon.\n- Return to your accommodation for dinner and rest.\n\nDay 2:\n- Have breakfast at your hotel.\n- Visit the Eravikulam National Park to spot the endangered Nilgiri Tahr and enjoy the scenic beauty. (Entrance fee: INR 120 per person)\n- Visit the Anamudi Peak, the highest peak in South India, for stunning views.\n- Have lunch at a local restaurant (Approx. INR 500 per person)\n- Explore the beautiful Attukal Waterfalls and enjoy the lush green surroundings.\n- Visit the Rose Garden to see a variety of roses and other flowers.\n- Spend some time shopping for local souvenirs or tea products.\n- Depart from Munnar and head back home.\n\nBudget breakdown for 2 days:\n- Accommodation: INR 6000\n- Meals: INR 2500\n- Entrance fees and activities: INR 1045\n- Transportation (if not included in the budget): INR 5000\n- Miscellaneous expenses: INR 1000\n\nTotal estimated cost: INR 14545\n\nYou can adjust the activities and expenses based on your preferences and budget. Enjoy your trip to Munnar!',26);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `place` varchar(45) NOT NULL,
  `phone number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (2,'Archana','Mukkam','9497210670','archana123@gmail.com','blocked'),(4,'Saritha','Koodathai','9999992323','saritha@gmail.com','blocked'),(5,'Risvana','Mukam','9876545670','cdcd@gmail.com','blocked'),(7,'Amala','Kallanthod','8086498763','amala@gmail.com',''),(9,'Ramesh','Kozhikode','8909890876','ramesh@gmail.com','pending'),(14,'Smitha M','Mukkam','9999999999','smitha123@gmail.com',''),(15,'Ashik','Kallanthod','9999992340','ashik@gmail.com',''),(16,'Aswin','Calicut','9876543567','aswin@gmail.com',''),(17,'Aswin','Calicut','9876543567','aswin@gmail.com',''),(18,'Ramu','Koodathai','9999992340','hg@gmail.com',''),(19,'Ramu','Koodathai','9999992340','ramu@gmail.com','blocked'),(21,'Archana','Mukkam','9999999999','archanavadakkedath002@gmail.com',''),(22,'Amala','Mukkam','8086498763','amalachinnu25@gmail.com',''),(28,'Saritha','Koodathai','9497210670','saritha123@gmail.com',''),(29,'Sanu J','Kallanthod','8086498763','sanu@gmail.com',''),(31,'Sanvika','Calicut','8086498764','sanvika@gmail.com','');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `place` varchar(45) NOT NULL,
  `phone number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Ramu','Calicut','9087654433','cdcd@gmail.com','',''),(2,'archana','mukkam','678','archana@gmail.com','',''),(3,'Amala','Mukkam','5678990','amala@gmail.com','',''),(4,'Amala','Mukkam','5678990','amala@gmail.com','',''),(5,'Diya','Kallanthod','8086498764','diya123@gmail.com','',''),(6,'Hljlk87098-0','Jnbkjnkj890','9876543323','yhgyftyfuygiuhiuhoij@gmail.com','',''),(7,'Wertyuy','Dfghghhj','9877665556','cdc@gmail.com','',''),(8,'Afnan','Mukkam','9497210670','afnan@gmail.com','',''),(9,'Raju','Kallanthod','9999999998','raju@gmail.com','',''),(10,'Abhishek','Koodathai','8086585538','abhi@gmail.com','',''),(14,'Abhi N','Calicut','8888888888','abi123@gmail.com','',''),(15,'Ashok','Wer','9497210670','cdcd@gmail.com','wert','12345'),(16,'Fasna','Kannur','9999992340','fasna@gmail.com','fasna','fasna'),(17,'Ramu','Kallanthod','9999992340','ramu@gmail.com','ramu','ramu'),(18,'Diya','Calicut','8086498764','diya@gmail.com','diya','diya'),(19,'Amala','Mukkam','9497210670','amala@gmail.com','amala','amala'),(20,'Huda','Mukkam','9497210670','huda@gmail.com','huda','huda'),(21,'Huda','Mukkam','8086498763','huda@gmail.com','huda','huda'),(22,'Riswana','Kallanthod','9876543567','risvana@gmail.com','risvana','risvana'),(24,'Sayanth','Kallanthod','8888888880','sayanth@gmail.com','sayanth','sayanth'),(25,'Padmam','Mukkam','7777777777','padmam@gmail.com','padmam','fcvb'),(26,'Ajay','Pgt','6666666666','123@456','111','111');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-07 11:47:29
