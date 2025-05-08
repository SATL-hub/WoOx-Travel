/*
SQLyog Community v12.4.0 (64 bit)
MySQL - 5.6.12-log : Database - trip_plan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`trip_plan` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `trip_plan`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can add permission',2,'add_permission'),
(5,'Can change permission',2,'change_permission'),
(6,'Can delete permission',2,'delete_permission'),
(7,'Can add group',3,'add_group'),
(8,'Can change group',3,'change_group'),
(9,'Can delete group',3,'delete_group'),
(10,'Can add user',4,'add_user'),
(11,'Can change user',4,'change_user'),
(12,'Can delete user',4,'delete_user'),
(13,'Can add content type',5,'add_contenttype'),
(14,'Can change content type',5,'change_contenttype'),
(15,'Can delete content type',5,'delete_contenttype'),
(16,'Can add session',6,'add_session'),
(17,'Can change session',6,'change_session'),
(18,'Can delete session',6,'delete_session'),
(19,'Can add confirmation',7,'add_confirmation'),
(20,'Can change confirmation',7,'change_confirmation'),
(21,'Can delete confirmation',7,'delete_confirmation'),
(22,'Can add feedback',8,'add_feedback'),
(23,'Can change feedback',8,'change_feedback'),
(24,'Can delete feedback',8,'delete_feedback'),
(25,'Can add reservation',9,'add_reservation'),
(26,'Can change reservation',9,'change_reservation'),
(27,'Can delete reservation',9,'delete_reservation'),
(28,'Can add state',10,'add_state'),
(29,'Can change state',10,'change_state'),
(30,'Can delete state',10,'delete_state'),
(31,'Can add tourist_place',11,'add_tourist_place'),
(32,'Can change tourist_place',11,'change_tourist_place'),
(33,'Can delete tourist_place',11,'delete_tourist_place'),
(34,'Can add userregister',12,'add_userregister'),
(35,'Can change userregister',12,'change_userregister'),
(36,'Can delete userregister',12,'delete_userregister');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$100000$M2YwqbHS53ot$QE2sz/eNuYoZ+RKJC3lQA3gDeCrzZ4fzY/JH8QdH04E=','2025-04-26 04:41:03.087572',1,'admin','','','',1,1,'2025-03-29 07:46:05.069981'),
(2,'pbkdf2_sha256$100000$mVC14R0x1VHR$/E1s93Im/PxMD1a/U96FRX7XZ9l6rcMyS5JTPB/NpgQ=','2025-04-26 03:49:52.676087',0,'santeena.at@gmail.com','santeena','','santeena.at@gmail.com',0,1,'2025-03-29 07:59:10.725689'),
(3,'pbkdf2_sha256$100000$qkTAhAeM3hO8$UL49mwPNmKuH3nhwtXSpJ/AINlk5BAi48bwS1DQwWIU=','2025-04-03 09:40:25.850249',0,'gourisaji3113@gmail.com','gouri','','gourisaji3113@gmail.com',0,1,'2025-04-03 09:39:46.289828');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2025-03-29 07:48:13.754288','1','Kerala',1,'[{\"added\": {}}]',10,1),
(2,'2025-03-29 07:48:52.495109','2','Tamilnadu',1,'[{\"added\": {}}]',10,1),
(3,'2025-03-29 07:49:28.456227','3','Rajasthan',1,'[{\"added\": {}}]',10,1),
(4,'2025-03-29 07:50:10.051699','4','Delhi',1,'[{\"added\": {}}]',10,1),
(5,'2025-03-29 07:54:27.952964','1','Kerala-Cochin - Munnar - Periyar - Kumarakom - Kovalam - Trivandrum',1,'[{\"added\": {}}]',11,1),
(6,'2025-03-29 07:55:09.860220','2','Kerala-Trivandrum',1,'[{\"added\": {}}]',11,1),
(7,'2025-03-29 07:55:55.447350','3','Tamilnadu-Mudaliarkuppam - Auroville - Pitchavaram',1,'[{\"added\": {}}]',11,1),
(8,'2025-03-29 07:56:27.723296','4','Tamilnadu-Trichy- Puliansolai - Kollihills Tour',1,'[{\"added\": {}}]',11,1),
(9,'2025-03-29 07:57:13.124907','5','Delhi-JANTAR MANTAR - RED FORT - AKSHARDHA-QUM TEMPLE--NATIONAL MUSEUM - MODERN ART GALLERY - HUMAYUN TOMB',1,'[{\"added\": {}}]',11,1),
(10,'2025-03-29 07:57:57.069387','6','Delhi-Delhi - Agra - Jaipur',1,'[{\"added\": {}}]',11,1),
(11,'2025-03-29 07:58:35.048147','7','Rajasthan-Jaipur-Jodhpur-Udaipur-Jaipur',1,'[{\"added\": {}}]',11,1),
(12,'2025-04-26 04:43:21.088872','35','Kerala-Trivandrum',1,'[{\"added\": {}}]',9,1),
(13,'2025-04-26 04:43:42.897073','31','santeena',1,'[{\"added\": {}}]',7,1),
(14,'2025-04-26 05:20:43.385448','36','Delhi-JANTAR MANTAR - RED FORT - AKSHARDHA-QUM TEMPLE--NATIONAL MUSEUM - MODERN ART GALLERY - HUMAYUN TOMB',1,'[{\"added\": {}}]',9,1),
(15,'2025-04-26 05:21:05.781842','32','santeena',1,'[{\"added\": {}}]',7,1),
(16,'2025-04-26 05:27:47.414144','31','santeena',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),
(17,'2025-04-26 05:28:04.502174','32','santeena',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),
(18,'2025-04-26 05:54:19.767056','8','Tamilnadu-dgcfgdgdgdg',1,'[{\"added\": {}}]',11,1),
(19,'2025-04-26 05:54:25.692609','9','Tamilnadu-dfgfdgdfgdfgdfgd',1,'[{\"added\": {}}]',11,1),
(20,'2025-04-26 05:56:26.565680','8','Tamilnadu-dgcfgdgdgdg',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',11,1),
(21,'2025-04-26 05:56:36.410945','9','Tamilnadu-dfgfdgdfgdfgdfgd',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',11,1),
(22,'2025-04-26 05:57:34.328380','9','Tamilnadu-dfgfdgdfgdfgdfgd',3,'',11,1),
(23,'2025-04-26 05:57:34.331372','8','Tamilnadu-dgcfgdgdgdg',3,'',11,1),
(24,'2025-04-26 06:03:41.283813','1','Kerala-Cochin - Munnar - Periyar - Kumarakom - Kovalam - Trivandrum',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',11,1),
(25,'2025-04-26 06:05:18.073314','1','Kerala',2,'[{\"changed\": {\"fields\": [\"image1\"]}}]',10,1),
(26,'2025-04-26 06:10:05.658957','2','Tamilnadu',2,'[{\"changed\": {\"fields\": [\"image1\"]}}]',10,1),
(27,'2025-04-26 06:11:48.973178','3','Tamilnadu-Mudaliarkuppam - Auroville - Pitchavaram',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',11,1),
(28,'2025-04-26 06:17:12.883934','4','Tamilnadu-Trichy- Puliansolai - Kollihills Tour',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',11,1),
(29,'2025-04-26 06:20:04.105716','5','Delhi-JANTAR MANTAR - RED FORT - AKSHARDHA-QUM TEMPLE--NATIONAL MUSEUM - MODERN ART GALLERY - HUMAYUN TOMB',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',11,1),
(30,'2025-04-26 06:21:01.402038','6','Delhi-Delhi - Agra - Jaipur',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',11,1),
(31,'2025-04-26 06:22:22.718725','4','Delhi',2,'[{\"changed\": {\"fields\": [\"image1\"]}}]',10,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'trip_plan','confirmation'),
(8,'trip_plan','feedback'),
(9,'trip_plan','reservation'),
(10,'trip_plan','state'),
(11,'trip_plan','tourist_place'),
(12,'trip_plan','userregister');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2025-03-29 07:44:29.563522'),
(2,'auth','0001_initial','2025-03-29 07:44:30.875714'),
(3,'admin','0001_initial','2025-03-29 07:44:31.172522'),
(4,'admin','0002_logentry_remove_auto_add','2025-03-29 07:44:31.188141'),
(5,'contenttypes','0002_remove_content_type_name','2025-03-29 07:44:31.328733'),
(6,'auth','0002_alter_permission_name_max_length','2025-03-29 07:44:31.438083'),
(7,'auth','0003_alter_user_email_max_length','2025-03-29 07:44:31.563054'),
(8,'auth','0004_alter_user_username_opts','2025-03-29 07:44:31.578674'),
(9,'auth','0005_alter_user_last_login_null','2025-03-29 07:44:31.656780'),
(10,'auth','0006_require_contenttypes_0002','2025-03-29 07:44:31.656780'),
(11,'auth','0007_alter_validators_add_error_messages','2025-03-29 07:44:31.672403'),
(12,'auth','0008_alter_user_username_max_length','2025-03-29 07:44:31.781752'),
(13,'auth','0009_alter_user_last_name_max_length','2025-03-29 07:44:31.875480'),
(14,'sessions','0001_initial','2025-03-29 07:44:32.000449'),
(15,'trip_plan','0001_initial','2025-03-29 07:44:33.297021'),
(16,'trip_plan','0002_state_image1','2025-03-29 07:44:33.359505'),
(17,'trip_plan','0003_userregister_gender','2025-03-29 07:44:33.453233'),
(18,'trip_plan','0004_tourist_place_days','2025-03-29 07:44:33.546962'),
(19,'trip_plan','0005_reservation_name','2025-03-29 07:44:33.671932'),
(20,'trip_plan','0006_auto_20250329_0954','2025-03-29 07:44:33.781282'),
(21,'trip_plan','0007_auto_20250329_0959','2025-03-29 07:44:33.999981'),
(22,'trip_plan','0008_reservation_gst_amount','2025-03-29 07:44:34.124952'),
(23,'trip_plan','0009_reservation_total','2025-03-29 07:44:34.249921'),
(24,'trip_plan','0010_feedback_reservation','2025-04-26 04:21:25.903319'),
(25,'trip_plan','0011_remove_feedback_reservation','2025-04-26 04:40:28.989051'),
(26,'trip_plan','0012_reservation_feedback_given','2025-04-26 05:14:21.398016');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('09n1xtht1jr14njycfeu9z43yu5eldea','NWM5Zjc0ZTRhM2Q5N2Y0MDFjYzJjMjk1NmM5NTdlMDkwYzgyMmY5ZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0M2M4OWU4YWU5M2M0Y2Y2YTFiNWFmZGRhYTQyYmRmYTk0YTdlOTMzIn0=','2025-04-12 07:59:17.337183'),
('7mnzsczenf4jsn44z00we3xiolr11il4','NzZjZWFjM2UzNzM4MGNhZmNkMmQwNjY5YTE0MTBiYmUzNWZmZGY0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNzc1OGYwZTI0NDdlMTg5MjQxM2UwOGI5YmM3MDkzM2Y1NGRjMjA2In0=','2025-04-12 07:47:10.101568'),
('kluz05c1yq13fstrzmxwrh4hyj9knrep','NWM5Zjc0ZTRhM2Q5N2Y0MDFjYzJjMjk1NmM5NTdlMDkwYzgyMmY5ZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0M2M4OWU4YWU5M2M0Y2Y2YTFiNWFmZGRhYTQyYmRmYTk0YTdlOTMzIn0=','2025-05-10 03:49:52.692840'),
('l3a1mfr69kn0dwfzw6eo3fg9cg3y2oar','NWM5Zjc0ZTRhM2Q5N2Y0MDFjYzJjMjk1NmM5NTdlMDkwYzgyMmY5ZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0M2M4OWU4YWU5M2M0Y2Y2YTFiNWFmZGRhYTQyYmRmYTk0YTdlOTMzIn0=','2025-05-09 09:40:19.178593'),
('rgq9mn0ot1y8p7k8pgn80eivxnf0viu7','NzZjZWFjM2UzNzM4MGNhZmNkMmQwNjY5YTE0MTBiYmUzNWZmZGY0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNzc1OGYwZTI0NDdlMTg5MjQxM2UwOGI5YmM3MDkzM2Y1NGRjMjA2In0=','2025-05-10 04:41:03.103193'),
('tsizj5h2ohtd2gn2opc661xaswo4bgsv','NWM5Zjc0ZTRhM2Q5N2Y0MDFjYzJjMjk1NmM5NTdlMDkwYzgyMmY5ZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0M2M4OWU4YWU5M2M0Y2Y2YTFiNWFmZGRhYTQyYmRmYTk0YTdlOTMzIn0=','2025-04-12 08:48:31.393843'),
('y3mx3cfcelfonbwk0ahc2brx8nylliog','NWM5Zjc0ZTRhM2Q5N2Y0MDFjYzJjMjk1NmM5NTdlMDkwYzgyMmY5ZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0M2M4OWU4YWU5M2M0Y2Y2YTFiNWFmZGRhYTQyYmRmYTk0YTdlOTMzIn0=','2025-04-18 04:19:02.295412');

/*Table structure for table `trip_plan_confirmation` */

DROP TABLE IF EXISTS `trip_plan_confirmation`;

CREATE TABLE `trip_plan_confirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paid_amount` bigint(20) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_plan_confirmati_reservation_id_e919a728_fk_trip_plan` (`reservation_id`),
  KEY `trip_plan_confirmation_user_id_06f54e95_fk_auth_user_id` (`user_id`),
  CONSTRAINT `trip_plan_confirmation_user_id_06f54e95_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `trip_plan_confirmati_reservation_id_e919a728_fk_trip_plan` FOREIGN KEY (`reservation_id`) REFERENCES `trip_plan_reservation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `trip_plan_confirmation` */

insert  into `trip_plan_confirmation`(`id`,`paid_amount`,`status`,`reservation_id`,`user_id`) values 
(30,44250,'Partial',34,2),
(31,40000,'Full',35,2),
(32,15000,'Full',36,2);

/*Table structure for table `trip_plan_feedback` */

DROP TABLE IF EXISTS `trip_plan_feedback`;

CREATE TABLE `trip_plan_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `content` longtext NOT NULL,
  `name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_plan_feedback_name_id_ab2b4d1e_fk_auth_user_id` (`name_id`),
  CONSTRAINT `trip_plan_feedback_name_id_ab2b4d1e_fk_auth_user_id` FOREIGN KEY (`name_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `trip_plan_feedback` */

insert  into `trip_plan_feedback`(`id`,`date`,`rating`,`content`,`name_id`) values 
(9,'2025-04-26',5,'nice trip',2),
(10,'2025-04-26',3,'good journey',2);

/*Table structure for table `trip_plan_reservation` */

DROP TABLE IF EXISTS `trip_plan_reservation`;

CREATE TABLE `trip_plan_reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `checkin` date DEFAULT NULL,
  `guest` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `t_place_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gst_amount` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `feedback_given` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_plan_reservatio_t_place_id_85c5a529_fk_trip_plan` (`t_place_id`),
  KEY `trip_plan_reservation_user_id_7b5ea51f_fk_auth_user_id` (`user_id`),
  CONSTRAINT `trip_plan_reservation_user_id_7b5ea51f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `trip_plan_reservatio_t_place_id_85c5a529_fk_trip_plan` FOREIGN KEY (`t_place_id`) REFERENCES `trip_plan_tourist_place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `trip_plan_reservation` */

insert  into `trip_plan_reservation`(`id`,`phone`,`email`,`checkin`,`guest`,`total_amount`,`t_place_id`,`user_id`,`name`,`gst_amount`,`total`,`feedback_given`) values 
(34,919400537541,'santeena.at@gmail.com','2025-05-08',3,177000,7,2,'santeena',27000,150000,0),
(35,9400537541,'santeena.at@gmail.com','2025-04-10',2,44000,2,2,'santeena',4000,40000,1),
(36,9400537541,'santeena.at@gmail.com','2025-04-14',2,17600,5,2,'santeena',1600,16000,1);

/*Table structure for table `trip_plan_state` */

DROP TABLE IF EXISTS `trip_plan_state`;

CREATE TABLE `trip_plan_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `population` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `content` longtext NOT NULL,
  `image1` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `trip_plan_state` */

insert  into `trip_plan_state`(`id`,`name`,`population`,`area`,`image`,`content`,`image1`) values 
(1,'Kerala','35,000,000','38,863','state/kerala.jpg','<p>Here is a bouquet of unforgettable experiences Kerala offers: charming village life, thrilling treks, serene safaris, vibrant farms, unique cuisine, tranquil houseboats and the magic of monsoon. Each moment in Kerala is a story waiting to be told, a memory etched in time.</p>','state/k1_otMozfj.jpg'),
(2,'Tamilnadu','72,100,000','130,058','state/tn.jpg','<p>Discover Tamil Nadu\'s unique destinations - from UNESCO World Heritage Sites to soothing beaches and hill stations.<p>','state/t1_JkyYNNp.jpg'),
(3,'Rajasthan','68,500,000','342,239','state/rj.jpg','<p>Rajasthan, known as the \"Land of Kings,\" is a popular tourist destination in India, drawing visitors with its rich history, vibrant culture, majestic forts and palaces, and the vast Thar Desert. </p>','state/r1_yERIHAV.jpg'),
(4,'Delhi','33,807,000','1,483','state/delhi.jpg','<p>A symbol of the country\'s rich past and thriving present, Delhi is a city where ancient and modern blend seamlessly together. It is a place that not only touches your pulse but even fastens it to a frenetic speed.</p>','state/delhi_Y5SonNq.jpg');

/*Table structure for table `trip_plan_tourist_place` */

DROP TABLE IF EXISTS `trip_plan_tourist_place`;

CREATE TABLE `trip_plan_tourist_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place` varchar(100) DEFAULT NULL,
  `details` longtext,
  `price_per` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `name_id` int(11) NOT NULL,
  `days` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_plan_tourist_place_name_id_6d356058_fk_trip_plan_state_id` (`name_id`),
  CONSTRAINT `trip_plan_tourist_place_name_id_6d356058_fk_trip_plan_state_id` FOREIGN KEY (`name_id`) REFERENCES `trip_plan_state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `trip_plan_tourist_place` */

insert  into `trip_plan_tourist_place`(`id`,`place`,`details`,`price_per`,`image`,`name_id`,`days`) values 
(1,'Cochin - Munnar - Periyar - Kumarakom - Kovalam - Trivandrum','<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>11 Days & 10 Nights: Enchanting Kerala Tour</title>\r\n    <style>\r\n        body { font-family: Arial, sans-serif; line-height: 1.6; margin: 20px; }\r\n        h1 { color: #2c3e50; }\r\n        h2 { color: #16a085; }\r\n        div { margin-bottom: 15px; }\r\n    </style>\r\n</head>\r\n<body>\r\n    <h1>11 Days & 10 Nights: Enchanting Kerala Tour</h1><br>\r\n\r\n    <h2>Day 1: Arrival in Cochin</h2>\r\n    <div>Welcome to Kerala! Our representative will receive you at <strong>Cochin Lulu Mall</strong> and escort you to your hotel. Spend a relaxing evening soaking in the charm of this picturesque <em>port city</em>. Enjoy an overnight stay at the hotel.</div>\r\n\r\n    <h2>Day 2: Exploring Cochin</h2>\r\n    <div>Embark on a guided sightseeing tour of <strong>Cochin</strong>. Discover its rich heritage with visits to:</div>\r\n    <ul>\r\n        <li><strong>Fort Cochin</strong>, preserving its ancient Jewish traditions</li>\r\n        <li><strong>Santa Cruz Basilica</strong></li>\r\n        <li><strong>Mattancherry Palace</strong></li>\r\n        <li><strong>St. Francis Church</strong></li>\r\n        <li>The vibrant <strong>Jew’s Street</strong></li>\r\n        <li>The iconic <strong>Chinese fishing nets at Fort Cochin Beach</strong></li>\r\n    </ul>\r\n    <div>Return to your hotel for a restful overnight stay.</div>\r\n\r\n    <h2>Day 3: Journey to Munnar</h2>\r\n    <div>In the morning, drive to the mesmerizing <strong>Munnar</strong> (approx. 4.5 hours). Upon arrival, check into the hotel and unwind amidst the serene landscapes. Overnight stay at the hotel.</div>\r\n\r\n    <h2>Day 4: Munnar Sightseeing</h2>\r\n    <div>Explore the breathtaking beauty of <strong>Munnar</strong>:</div>\r\n    <ul>\r\n        <li><strong>Anamudi Peak</strong> (2,695 m) – the highest in South India</li>\r\n        <li><strong>Christ Church</strong></li>\r\n        <li><strong>Eravikulam National Park</strong></li>\r\n        <li><strong>Rajamala Hills</strong></li>\r\n        <li><strong>Top Station & Mattupetty Dam</strong></li>\r\n    </ul>\r\n    <div>Engage in exciting activities like <em>boating</em> and <em>horse riding</em> before returning to the hotel for an overnight stay.</div>\r\n\r\n    <h2>Day 5: Off to Periyar</h2>\r\n    <div>After lunch, proceed to <strong>Periyar</strong>, an enchanting resort ideal for unwinding. Upon arrival, check in at <strong>Spice Village</strong>. In the evening, embark on a mesmerizing <strong>boat safari</strong> on <strong>Periyar Lake</strong>, where you might spot rare birds and animals at <strong>Periyar National Park</strong>. Overnight stay at the hotel.</div>\r\n\r\n    <h2>Day 6: Plantation Tour in Periyar</h2>\r\n    <div>Spend the day on a <strong>guided plantation tour</strong>, exploring the fragrant spice gardens of Periyar. Relax in the evening and enjoy another restful overnight stay at Periyar.</div>\r\n\r\n    <h2>Day 7: Tranquility in Kumarakom</h2>\r\n    <div>After a delightful breakfast, travel to <strong>Kumarakom</strong>, a stunning destination on the banks of <strong>Lake Vembanad</strong>. Experience authentic Kerala culture by:</div>\r\n    <ul>\r\n        <li>Learning to <em>pluck and de-husk coconuts</em></li>\r\n        <li>Cooking with exotic <em>local spices</em></li>\r\n    </ul>\r\n    <div>Visit the famous <strong>Kumarakom Bird Sanctuary</strong>, home to thousands of rare bird species. Return to the hotel for an overnight stay.</div>\r\n\r\n    <h2>Day 8: Houseboat Cruise in Alleppey</h2>\r\n    <div>Board a <strong>traditionally decorated houseboat</strong> for an <strong>overnight backwater cruise</strong>. As you sail through Kerala’s tranquil waters, witness:</div>\r\n    <ul>\r\n        <li><strong>Chinese fishing nets</strong></li>\r\n        <li>Lush <strong>paddy fields</strong></li>\r\n        <li>Locals engaged in <strong>coir-making</strong></li>\r\n        <li><strong>Ancient temples & rustic homes</strong></li>\r\n        <li>Swaying <strong>coconut groves</strong></li>\r\n    </ul>\r\n    <div>Savor delicious <strong>onboard meals</strong> and enjoy a peaceful overnight stay on the houseboat.</div>\r\n\r\n    <h2>Day 9: Beach Bliss in Kovalam</h2>\r\n    <div>After breakfast, disembark from the houseboat and drive to <strong>Kovalam</strong>, a renowned <strong>beach paradise</strong>. Check into your beachside hotel and spend the day indulging in <em>sunbathing, swimming, kayaking, surfing, and skiing</em>. Unwind with a <strong>traditional herbal massage</strong> at one of the many certified wellness centers. Overnight stay near the beach.</div>\r\n\r\n    <h2>Day 10: Trivandrum Sightseeing</h2>\r\n    <div>Set out on a <strong>guided tour of Trivandrum</strong>, exploring:</div>\r\n    <ul>\r\n        <li><strong>Padmanabhaswamy Temple</strong>, renowned for its majestic gopurams and exquisite paintings</li>\r\n        <li>The temple’s <strong>grand pavilion</strong>, supported by 400 intricately carved granite pillars</li>\r\n    </ul>\r\n    <div>In the evening, return to <strong>Kovalam</strong> for another serene overnight stay.</div>\r\n\r\n    <h2>Day 11: Departure from Kerala</h2>\r\n    <div>Bid farewell to the <strong>God’s Own Country</strong> as we drop you at <strong>Trivandrum International Airport</strong> for your flight back home. Depart with wonderful memories of your unforgettable Kerala journey!</div>\r\n</body>\r\n</html>',50000,'place/kerala_WyTu34b_lYgsqiu.jpg',1,'11 Days 10 Nights'),
(2,'Trivandrum','<h1> 2 Days & 1 Night</h1>\r\n<h1>Day 1</h1> \r\n<p>Trivandrum Places to Visit,\r\nSree Padmanabhaswamy Temple,\r\nKanakakunnu Palace,\r\nPoovar Island,\r\nAstronomical Observatory,\r\nAgasthyarkoodam</p>\r\n<h1>Day 2</h1> \r\n<p>\r\n Trivandrum Places to Visit,\r\nShanghumukham Beach,\r\nZoological Park,\r\nNapier Museum,\r\nScience & Technology Museum and Planetarium,\r\nAttukal Bhagavathy Temple,\r\nNeyyar Wildlife Sanctuary</p>',20000,'place/tvm.jpg',1,'2 Days 1 Night'),
(3,'Mudaliarkuppam - Auroville - Pitchavaram','<h1>3 Days & 2 Night</h1>\r\n<h1>Day 1</h1>\r\n<p>Tour starts from Tourism complex & proceed to BRC - Mamallapuram.Breakfast at BRC - Mamallapuram,Visit Sea Shell Museum,10.40 AM to 11.40 AM Proceed to Parameshwara Mangalam - Kailasanathar Temple,Visit Kailasanathar Temple,Proceed to Mudaliar Kuppam boat House,Lunch at Mudaliar Kuppam,Boating to Island,Beach Walk /Activity at island,Return to Boathouse,Evening Snacks at Boat HouseProceed to Auroville,Check-in at auroville Stay,Night Halt at Auroville</p>\r\n<h1>Day 2</h1>\r\n<p>Yoga Session,Refreshment,Organic Breakfast at auroville,Check-out after Organic Breakfast,Sound Therapy and sound park at swaram,visit Bamboo Forest & Herbal Garden,Organic Lunch at Solar Kitchen - Auroville,Natural Soap Making / Permaculture Farm\r\n,Proceed to Pondicherry promenade Beach\r\n,Beach Walk\r\n,Proceed to Pichavaram\r\n,Dinner at Pichavaram\r\n,Night Halt at HTN - Pichavaram\r\n</p>\r\n<h1>Day 3</h1>\r\n<p>Check-out after Breakfast and proceed to Boat House\r\n,NPichavaram Boating\r\n,Lunch at HTN\r\n,Proceed to Pondicherry\r\n,Visit Aurobindo Ashram\r\n,visit Manakula Vinayagar Temple for Darshan\r\n,Night Halt at HTN - Pichavaram\r\n,Proceed to Chennai\r\n,Tour Ends at Tourism Complex\r\n</p>',13600,'place/mku_DGyxuC2.png',2,'3 Days 2 Nights'),
(4,'Trichy- Puliansolai - Kollihills Tour','<h1>2 Days & 1 Night</h1>\r\n<h1>Day1</h1>\r\n<p>Tour Starts from HTN Trichy\r\n,Proceed to Thiruvanaikovil Jambukeshwarar Temple\r\n,Sri Jambukeshwarar Darshan\r\n,Proceed to Srirangam - Ranganathaswamy Temple\r\n,Sri Ranganathaswamy Darshan,Proceed to Butterfly Park,Visit Park ( Box Lunch ),Proceed to Mukkombu,Visit Mukkombu,Proceed to Uchipillayar Koil,Uchipillayar Darshan & Shopping,Proceed Back to HTN - Trichy,Dinner at HTN - Trichy and Night Halt\r\n</p>\r\n<h1>Day2</h1>\r\n<p>Check-out after Breakfast,Proceed to Puliyancholai,Explore Puliyancholai,Proceed to Kolli Hills ( Box Lunch on the way),Bathing at Agayagangai Waterfalls,Herbs shopping / Refreshment,Proceed back to Hotel,Dinner at HTN - Trichy,Tour ends\r\n</p>',6600,'place/kolli_Lc1zx4M.png',2,'2 Days 1 Night'),
(5,'JANTAR MANTAR - RED FORT - AKSHARDHA-QUM TEMPLE--NATIONAL MUSEUM - MODERN ART GALLERY - HUMAYUN TOMB','<h1>3 Days & 2 Night</h1>\r\n<h1>Day 1</h1>\r\n<p>Jantar Mantar,Birla Mandir / Laksminarayan Temple,Jama Masjid,Red Fort,Raj Ghat,Akshardham Temple / Swaminarayan Temple</p>\r\n<h1>Day 2</h1>\r\n<p>India Gate,National Museum,National Gallery Of Modern Art,Safdarjung Tomb,Lodi Garden\r\n\r\nHumayun\'s Tomb,</p>\r\n<h1>Day 3</h1>\r\n<p>Qutub Minar,Alai Minar,Alai Darwaza,Alauddin Khilji Tomb And Madrasa,Tomb Of Iltutmish,Iron Pillar,Mehrauli Archaeological Park,Lotus Temple / Bahai Temple,</p>',8800,'place/078212846Delhi_Lotus_Temple_Main_thumb_EtmxHfL.jpg',4,'3 Days 2 Nights'),
(6,'Delhi - Agra - Jaipur','<h1>3 Days 2 Nights</h1>\r\n<h1>Day 1</h1>\r\n<p>Pick-Up in Delhi, Old and New Delhi Sightseeing, Drive to Agra Your sightseeing journey of Old and New Delhi kicks off with a 9:00 AM pick-up at your preferred location, where our driver will warmly welcome you. After refreshing, your tour guide will provide a detailed itinerary. Explore Old Delhi, including visits to Jama Masjid, the Red Fort (outside), and Chandni Chowk market. Indulge in a delightful lunch at a local restaurant. Next, discover New Delhi\'s attractions like India Gate, Rastrapati Bhawan, Humayun\'s Tomb, and Qutub Minar. In the evening, travel to Agra, check into your hotel, and spend the night in the city.</p>\r\n<h1>Day 2</h1>\r\n<p>Agra Sightseeing Tour and Drive to Jaipur Be ready for a scenic sunrise experience at the Taj Mahal as our driver picks you up from your hotel at 6:30 AM. Following the sunrise exploration, enjoy breakfast and a brief rest back at the hotel. Post-breakfast and check-out, visit Agra Fort. Later, continue your journey to Jaipur, making a stop at Fatehpur Sikri. Upon reaching Jaipur, check in at your hotel for an overnight stay.</p>\r\n<h1>Day 3</h1>\r\n<p>Jaipur Sightseeing Tour and Drive back to Delhi Following breakfast and check-out, our driver and guide will collect you from the hotel to commence your Jaipur Sightseeing tour. Explore the Amber Fort, witness the Jal Mahal, Hawa Mahal, City Palace, Jantar Mantar, and Panna Meena Ka Kund. Post-lunch and sightseeing, indulge in souvenir shopping at the local market before returning to Delhi in the evening. Conclude your 2 Nights 3 Days Golden Triangle tour with a drop-off at your hotel or the Delhi Airport, carrying enchanting memories with you.</p>',40000,'place/f125bd71-1c4d-45f9-9919-91667dc37ccb_3A249aw.jpg',4,'3 Days 2 Nights'),
(7,'Jaipur-Jodhpur-Udaipur-Jaipur','<h1> 7 Days 6 Nights</h1>\r\n<h1>Day 1</h1>\r\n<p>Arrival at Jaipur:Airport/ Railway Station/ Bus Station transfer drop at RTDC Hotel Teej , Night Stay. Evening free for shopping.</p>\r\n<h1>Day 2</h1>\r\n<p>Jaipur:Morning excursion to amber fort. make your ascent to the palace fortress on the gaily caparisoned elephant back (optional). Tour the chamber & hallways of the palace, which are famous for the excellence of their design & decoration. After noon tour of jaipur known as “The Pink City of Rajasthan” Visit the unique Jantar Mantar observatory, which was built in 1700’s, yet even today still looks futuristic or almost surrealistic: The city palace & its museum, The Hawa Mahal or The Palace of Winds. Night Stay at RTDC Hotel Teej.</p>\r\n<h1>Day 3</h1>\r\n<p>Jaipur - Jodhpur via Ajmer/Pushkar:After break fast leave for JODHPUR enroute visiting Ajmer- Dargah of Khwaja Saheb, Adhai Din ka Jhonpra, break for lunch at Hotel KHADIM and visit to Pushkar – Brahma Temple and Sarovar Lake. Arrive Jodhpur by evening. Check in at Hotel GHOOMAR, JODHPUR, Night Stay.</p>\r\n<h1>Day 4</h1>\r\n<p>Jodhpur:after break fast leave for morning sight seeing tour of JODHPUR gateway to the desert beyond, home of the rathores of Marwar. Visit the Meharangarh Fort, Rising up on a hilly scrap, built on the advice of a hermit, which over looks the cities blue houses, the image of a long sentinel. inside the fort are a number of palaces added by successive ruler and the Canon Rampart. Also visit the Jaswanthada, which Corvrded White Marble Cenotaph of Maharaja Jaswant Singh-II, which preservis the genealogy of the rulers of jodhpur along with their life-size portraits. Early after noon, visiting Mandore gardens set on a plateau are the ruins of the ancient Marwar capital now surrounded with beautiful gardens. See the pillared ‘Hall Of Heroes’ and the ‘Shrine Of The 300 Million Gods’ return to the old city walk through Sojati Gate, which leads to Sadar Bazar with its Ornate Clock Tower. Night Stay at Hotel.</p>\r\n<h1>Day 5</h1>\r\n<p>Jodhpur - Udaipur:After breakfast morning drive from Jodhpur to Udaipur enroute visiting Ranakpur. Visit the famous Jain Temples; dating back to the 15th century. Its 29 halls are supported by 1444 pillars none of, which are similar. The temple abounds with intricate friezes and sculptures. Includes visit to two more Jain Temples and the temple of the Sun God with its erotic sculptures. Continue your drive to “Lake City” Upon arrival check in at Hotel Kajri, Udaipur for Night Stay.</p>\r\n<h1>Day 6</h1>\r\n<p>Udaipur:After breakfast full day sightseeing tour of Udaipur. This is possibly the most romantic city in Rajasthan. There would be no doubt as to why it is called “The Venice of East” The City was founded by Maharana Udai Singh is situated on the edge of three lakes and surrounded by The Aravali Mountain Ranges. The Ambience, Climate and history combined make Udaipur a tourist heaven. Morning excursion to famous temples of Eklingji & Nagda. Afternoon half day city tour visiting city palace museum, Jagdish temple and Saheliyon Ki Bari. Night Stay at Hotel Kajri, Udaipur.</p>\r\n<h1>Day 7</h1>\r\n<p>Udaipur/Departure:Break fast at Hotel and transfer from Hotel to the Airport / Railway Station to catch flight / Train for onwards destination. Tours ends or have a choice to come back to Jaipur and tour ends.</p>',50000,'place/d9e0011a-2edb-40d0-970d-f161b263a82f.jpg',3,'7 Days 6 Nights');

/*Table structure for table `trip_plan_userregister` */

DROP TABLE IF EXISTS `trip_plan_userregister`;

CREATE TABLE `trip_plan_userregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `password` varchar(12) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_plan_userregister_user_id_fbe2adc3_fk_auth_user_id` (`user_id`),
  CONSTRAINT `trip_plan_userregister_user_id_fbe2adc3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `trip_plan_userregister` */

insert  into `trip_plan_userregister`(`id`,`name`,`email`,`phone`,`password`,`user_id`,`gender`) values 
(1,'santeena','santeena.at@gmail.com',9400537541,'123',2,'female'),
(2,'gouri','gourisaji3113@gmail.com',9400537541,'123',3,'female');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
