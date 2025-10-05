-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 05, 2025 at 11:10 AM
-- Server version: 11.6.2-MariaDB
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `makanjiro`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'admins');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add affiliation', 7, 'add_affiliation'),
(26, 'Can change affiliation', 7, 'change_affiliation'),
(27, 'Can delete affiliation', 7, 'delete_affiliation'),
(28, 'Can view affiliation', 7, 'view_affiliation'),
(29, 'Can add affiliation_org', 8, 'add_affiliation_org'),
(30, 'Can change affiliation_org', 8, 'change_affiliation_org'),
(31, 'Can delete affiliation_org', 8, 'delete_affiliation_org'),
(32, 'Can view affiliation_org', 8, 'view_affiliation_org'),
(33, 'Can add choosing', 9, 'add_choosing'),
(34, 'Can change choosing', 9, 'change_choosing'),
(35, 'Can delete choosing', 9, 'delete_choosing'),
(36, 'Can view choosing', 9, 'view_choosing'),
(37, 'Can add contact', 10, 'add_contact'),
(38, 'Can change contact', 10, 'change_contact'),
(39, 'Can delete contact', 10, 'delete_contact'),
(40, 'Can view contact', 10, 'view_contact'),
(41, 'Can add flexibility', 11, 'add_flexibility'),
(42, 'Can change flexibility', 11, 'change_flexibility'),
(43, 'Can delete flexibility', 11, 'delete_flexibility'),
(44, 'Can view flexibility', 11, 'view_flexibility'),
(45, 'Can add mission', 12, 'add_mission'),
(46, 'Can change mission', 12, 'change_mission'),
(47, 'Can delete mission', 12, 'delete_mission'),
(48, 'Can view mission', 12, 'view_mission'),
(49, 'Can add mission_vision', 13, 'add_mission_vision'),
(50, 'Can change mission_vision', 13, 'change_mission_vision'),
(51, 'Can delete mission_vision', 13, 'delete_mission_vision'),
(52, 'Can view mission_vision', 13, 'view_mission_vision'),
(53, 'Can add project', 14, 'add_project'),
(54, 'Can change project', 14, 'change_project'),
(55, 'Can delete project', 14, 'delete_project'),
(56, 'Can view project', 14, 'view_project'),
(57, 'Can add quote', 15, 'add_quote'),
(58, 'Can change quote', 15, 'change_quote'),
(59, 'Can delete quote', 15, 'delete_quote'),
(60, 'Can view quote', 15, 'view_quote'),
(61, 'Can add reasons_for_choosing', 16, 'add_reasons_for_choosing'),
(62, 'Can change reasons_for_choosing', 16, 'change_reasons_for_choosing'),
(63, 'Can delete reasons_for_choosing', 16, 'delete_reasons_for_choosing'),
(64, 'Can view reasons_for_choosing', 16, 'view_reasons_for_choosing'),
(65, 'Can add service', 17, 'add_service'),
(66, 'Can change service', 17, 'change_service'),
(67, 'Can delete service', 17, 'delete_service'),
(68, 'Can view service', 17, 'view_service'),
(69, 'Can add slider', 18, 'add_slider'),
(70, 'Can change slider', 18, 'change_slider'),
(71, 'Can delete slider', 18, 'delete_slider'),
(72, 'Can view slider', 18, 'view_slider'),
(73, 'Can add special', 19, 'add_special'),
(74, 'Can change special', 19, 'change_special'),
(75, 'Can delete special', 19, 'delete_special'),
(76, 'Can view special', 19, 'view_special'),
(77, 'Can add special_point', 20, 'add_special_point'),
(78, 'Can change special_point', 20, 'change_special_point'),
(79, 'Can delete special_point', 20, 'delete_special_point'),
(80, 'Can view special_point', 20, 'view_special_point'),
(81, 'Can add story', 21, 'add_story'),
(82, 'Can change story', 21, 'change_story'),
(83, 'Can delete story', 21, 'delete_story'),
(84, 'Can view story', 21, 'view_story'),
(85, 'Can add team', 22, 'add_team'),
(86, 'Can change team', 22, 'change_team'),
(87, 'Can delete team', 22, 'delete_team'),
(88, 'Can view team', 22, 'view_team'),
(89, 'Can add value', 23, 'add_value'),
(90, 'Can change value', 23, 'change_value'),
(91, 'Can delete value', 23, 'delete_value'),
(92, 'Can view value', 23, 'view_value'),
(93, 'Can add vision', 24, 'add_vision'),
(94, 'Can change vision', 24, 'change_vision'),
(95, 'Can delete vision', 24, 'delete_vision'),
(96, 'Can view vision', 24, 'view_vision'),
(97, 'Can add faq', 25, 'add_faq'),
(98, 'Can change faq', 25, 'change_faq'),
(99, 'Can delete faq', 25, 'delete_faq'),
(100, 'Can view faq', 25, 'view_faq'),
(101, 'Can add success_story', 26, 'add_success_story'),
(102, 'Can change success_story', 26, 'change_success_story'),
(103, 'Can delete success_story', 26, 'delete_success_story'),
(104, 'Can view success_story', 26, 'view_success_story'),
(105, 'Can add visitor', 27, 'add_visitor'),
(106, 'Can change visitor', 27, 'change_visitor'),
(107, 'Can delete visitor', 27, 'delete_visitor'),
(108, 'Can view visitor', 27, 'view_visitor'),
(109, 'Can add shipment', 28, 'add_shipment'),
(110, 'Can change shipment', 28, 'change_shipment'),
(111, 'Can delete shipment', 28, 'delete_shipment'),
(112, 'Can view shipment', 28, 'view_shipment'),
(113, 'Can add price list', 29, 'add_pricelist'),
(114, 'Can change price list', 29, 'change_pricelist'),
(115, 'Can delete price list', 29, 'delete_pricelist'),
(116, 'Can view price list', 29, 'view_pricelist'),
(117, 'Can add address', 30, 'add_address'),
(118, 'Can change address', 30, 'change_address'),
(119, 'Can delete address', 30, 'delete_address'),
(120, 'Can view address', 30, 'view_address');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$w4uNyWDkBzG1wBd6v6sHdO$Mo7UzYGwkC4Usa8n9lh9Xmd+WG+YNymKCByF3eqa8fQ=', '2025-10-05 09:57:45.028189', 1, 'admin', '', '', '', 1, 1, '2025-10-05 09:57:27.880235'),
(2, 'pbkdf2_sha256$1000000$eNvinNxfQzDVTg7lp2Bb4T$CHveKgnz6Y8GGBNGb4rQp4mi8tyOzRC6WbYP4FNRqZw=', '2025-10-05 10:00:20.005634', 0, 'makanjiro', '', '', '', 0, 1, '2025-10-05 09:58:14.000000'),
(3, 'pbkdf2_sha256$1000000$uk3JmknrgLp3kfKbUFzmoq$vn/nTd3ynNICWC0sO7ENGyRiaxK581LnjeMmIncSc5Y=', NULL, 0, 'magaita', '', '', '', 0, 1, '2025-10-05 09:59:05.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1),
(2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-10-05 09:57:54.056863', '1', 'admins', 1, '[{\"added\": {}}]', 3, 1),
(2, '2025-10-05 09:58:15.735756', '2', 'makanjiro', 1, '[{\"added\": {}}]', 4, 1),
(3, '2025-10-05 09:58:23.502645', '2', 'makanjiro', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(4, '2025-10-05 09:59:06.749721', '3', 'magaita', 1, '[{\"added\": {}}]', 4, 1),
(5, '2025-10-05 09:59:12.569116', '3', 'magaita', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(30, 'mainapp', 'address'),
(7, 'mainapp', 'affiliation'),
(8, 'mainapp', 'affiliation_org'),
(9, 'mainapp', 'choosing'),
(10, 'mainapp', 'contact'),
(25, 'mainapp', 'faq'),
(11, 'mainapp', 'flexibility'),
(12, 'mainapp', 'mission'),
(13, 'mainapp', 'mission_vision'),
(29, 'mainapp', 'pricelist'),
(14, 'mainapp', 'project'),
(15, 'mainapp', 'quote'),
(16, 'mainapp', 'reasons_for_choosing'),
(17, 'mainapp', 'service'),
(28, 'mainapp', 'shipment'),
(18, 'mainapp', 'slider'),
(19, 'mainapp', 'special'),
(20, 'mainapp', 'special_point'),
(21, 'mainapp', 'story'),
(26, 'mainapp', 'success_story'),
(22, 'mainapp', 'team'),
(23, 'mainapp', 'value'),
(24, 'mainapp', 'vision'),
(27, 'mainapp', 'visitor'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-10-05 09:56:25.394713'),
(2, 'auth', '0001_initial', '2025-10-05 09:56:30.463797'),
(3, 'admin', '0001_initial', '2025-10-05 09:56:31.363955'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-10-05 09:56:31.397978'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-05 09:56:31.412002'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-10-05 09:56:32.094455'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-10-05 09:56:32.627093'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-10-05 09:56:32.993665'),
(9, 'auth', '0004_alter_user_username_opts', '2025-10-05 09:56:33.046319'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-10-05 09:56:33.427356'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-10-05 09:56:33.450229'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-10-05 09:56:33.466943'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-10-05 09:56:33.652547'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-10-05 09:56:33.952723'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-10-05 09:56:34.218711'),
(16, 'auth', '0011_update_proxy_permissions', '2025-10-05 09:56:34.236938'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-10-05 09:56:34.486214'),
(18, 'mainapp', '0001_initial', '2025-10-05 09:56:37.487372'),
(19, 'mainapp', '0002_faq_rename_sub_title_affiliation_description_and_more', '2025-10-05 09:56:41.998028'),
(20, 'mainapp', '0003_alter_affiliation_description_and_more', '2025-10-05 09:56:42.078831'),
(21, 'mainapp', '0004_choosing_image_flexibility_image_story_image', '2025-10-05 09:56:42.789394'),
(22, 'mainapp', '0005_alter_flexibility_image', '2025-10-05 09:56:42.816894'),
(23, 'mainapp', '0006_success_story', '2025-10-05 09:56:42.955849'),
(24, 'mainapp', '0007_visitor', '2025-10-05 09:56:43.131100'),
(25, 'mainapp', '0008_value_icon_class', '2025-10-05 09:56:43.714789'),
(26, 'mainapp', '0009_project_icon_class', '2025-10-05 09:56:44.223454'),
(27, 'mainapp', '0010_flexibility_icon_class', '2025-10-05 09:56:44.636368'),
(28, 'mainapp', '0011_reasons_for_choosing_icon_class', '2025-10-05 09:56:45.293748'),
(29, 'mainapp', '0012_shipment', '2025-10-05 09:56:45.473869'),
(30, 'mainapp', '0013_pricelist', '2025-10-05 09:56:45.640842'),
(31, 'mainapp', '0014_alter_pricelist_file', '2025-10-05 09:56:45.671887'),
(32, 'mainapp', '0015_address', '2025-10-05 09:56:45.815352'),
(33, 'mainapp', '0016_alter_address_address_name', '2025-10-05 09:56:46.557398'),
(34, 'sessions', '0001_initial', '2025-10-05 09:56:46.984683'),
(35, 'mainapp', '0017_alter_shipment_heading_alter_shipment_sub_heading', '2025-10-05 10:57:54.896124'),
(36, 'mainapp', '0018_alter_shipment_heading_alter_shipment_sub_heading', '2025-10-05 10:59:12.918202');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_address`
--

DROP TABLE IF EXISTS `mainapp_address`;
CREATE TABLE IF NOT EXISTS `mainapp_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) NOT NULL,
  `phone_number1` varchar(13) NOT NULL,
  `phone_number2` varchar(13) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_address`
--

INSERT INTO `mainapp_address` (`id`, `address_name`, `phone_number1`, `phone_number2`, `email`) VALUES
(1, 'P.O.Box 1494, Mtwara,Tanzania', '+255717318933', '+255680318933', 'info@makanjirocfs.co.tz');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_affiliation`
--

DROP TABLE IF EXISTS `mainapp_affiliation`;
CREATE TABLE IF NOT EXISTS `mainapp_affiliation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_affiliation`
--

INSERT INTO `mainapp_affiliation` (`id`, `title`, `description`, `date`) VALUES
(1, 'Affiliation', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Makanjiro Company Limited is proud to be affiliated with leading organizations in the agricultural and logistics sectors, enhancing our credibility and ensuring we operate in accordance with the highest industry standards. Our key affiliations include</span></p>', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_affiliation_org`
--

DROP TABLE IF EXISTS `mainapp_affiliation_org`;
CREATE TABLE IF NOT EXISTS `mainapp_affiliation_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_affiliation_org`
--

INSERT INTO `mainapp_affiliation_org` (`id`, `title`, `description`, `date`) VALUES
(1, 'Tanzania Ports Authority (TPA)', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Through our operations at the Container Freight Station (CFS), we work closely with the Tanzania Ports Authority to facilitate smooth export logistics, ensuring compliance with port regulations and international shipping standards</span></p>', '2025-10-05'),
(2, 'Tanzania Revenue Authority (TRA)', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">We maintain a strong relationship with the TRA to ensure all customs and trade activities are conducted in a compliant and efficient manner, streamlining the export process</span></p>', '2025-10-05'),
(3, 'Cashewnut Board Of Tanzania (CBT)', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">As we handle significant volumes of cashew nuts, we collaborate with the Tanzania Cashew Board to align with the national strategies for promoting cashew nut exports</span></p>', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_choosing`
--

DROP TABLE IF EXISTS `mainapp_choosing`;
CREATE TABLE IF NOT EXISTS `mainapp_choosing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_choosing`
--

INSERT INTO `mainapp_choosing` (`id`, `title`, `description`, `date`, `image`) VALUES
(1, 'Why Choosing Us', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Makanjiro CFS is located near Mtwara Port, providing easy access to import and export operations. The facility is equipped with a dedicated Customs office on-site, ensuring smooth clearance processes and compliance with regulations. With efficient, secure, and cost-effective logistics solutions, Makanjiro CFS offers seamless container stuffing, safe storage, and reliable freight management for businesses</span></p>', '2025-10-05', 'images/carousel-3_cLcJCh1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_contact`
--

DROP TABLE IF EXISTS `mainapp_contact`;
CREATE TABLE IF NOT EXISTS `mainapp_contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_contact`
--

INSERT INTO `mainapp_contact` (`id`, `name`, `email`, `website`, `subject`, `message`, `date`) VALUES
(1, 'working event', 'user1@gmail.com', 'mywebsite', 'heloo', 'DDS', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_faq`
--

DROP TABLE IF EXISTS `mainapp_faq`;
CREATE TABLE IF NOT EXISTS `mainapp_faq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_faq`
--

INSERT INTO `mainapp_faq` (`id`, `description`, `date`) VALUES
(1, '<p><span style=\"font-size:18px\"><strong>How does Makanjiro ensure the safety and efficiency of cargo handling?</strong></span></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><span style=\"font-size:18px\">Through state-of-the-art CFS and ICD facilities, streamlined processes, and strict compliance with international logistics standards.</span></p>\r\n	</li>\r\n</ul>', '2025-10-05'),
(2, '<p style=\"text-align:justify\"><span style=\"font-size:18px\"><strong>What services does Makanjiro Company Limited provide?</strong></span></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p style=\"text-align:justify\"><span style=\"font-size:18px\">We specialize in Container Freight Station (CFS) and Inland Container Depot (ICD) operations to ensure efficient cargo handling and logistics support.</span></p>\r\n	</li>\r\n</ul>', '2025-10-05'),
(3, '<p style=\"text-align:justify\"><span style=\"font-size:18px\"><strong>Where is Makanjiro Company Limited located?</strong></span></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p style=\"text-align:justify\"><span style=\"font-size:18px\">We operate in Tanzania, strategically positioned to support both regional trade and global supply chains.</span></p>\r\n	</li>\r\n</ul>', '2025-10-05'),
(4, '<p style=\"text-align:justify\"><span style=\"font-size:18px\"><strong>Which industries or products does Makanjiro focus on?</strong></span></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p style=\"text-align:justify\"><span style=\"font-size:18px\">Our primary focus is on facilitating the secure and efficient export of Tanzania&rsquo;s premier agricultural products.</span></p>\r\n	</li>\r\n</ul>', '2025-10-05'),
(5, '<p style=\"text-align:justify\"><span style=\"font-size:18px\"><strong>Who can benefit from Makanjiro&rsquo;s services?</strong></span></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p style=\"text-align:justify\"><span style=\"font-size:18px\">Exporters, importers, logistics companies, and regional traders seeking seamless movement of goods in and out of Tanzania.</span></p>\r\n	</li>\r\n</ul>', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_flexibility`
--

DROP TABLE IF EXISTS `mainapp_flexibility`;
CREATE TABLE IF NOT EXISTS `mainapp_flexibility` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  `title` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `icon_class` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_flexibility`
--

INSERT INTO `mainapp_flexibility` (`id`, `description`, `date`, `title`, `image`, `icon_class`) VALUES
(1, '<p><span style=\"font-size:18px\">Diam dolor ipsum sit amet eos erat ipsum lorem sed stet lorem sit clita duo justo magna erat amet</span></p>', '2025-10-05', 'Container Handling', 'images/air-freight_SyqAvlt.jpg', 'fa-star'),
(2, '<p><span style=\"font-size:18px\">Diam dolor ipsum sit amet eos erat ipsum lorem sed stet lorem sit clita duo justo magna erat amet</span></p>', '2025-10-05', 'On Time Delivery', '', 'fa-globe'),
(3, '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Diam dolor ipsum sit amet eos erat ipsum lorem sed stet lorem sit clita duo justo magna erat amet</span></p>', '2025-10-05', 'Timely Container Delivery', '', 'fa-chart-line'),
(4, '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Diam dolor ipsum sit amet eos erat ipsum lorem sed stet lorem sit clita duo justo magna erat amet</span></p>', '2025-10-05', 'Versatile in Operations', '', 'fa-users');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_mission`
--

DROP TABLE IF EXISTS `mainapp_mission`;
CREATE TABLE IF NOT EXISTS `mainapp_mission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_mission`
--

INSERT INTO `mainapp_mission` (`id`, `title`, `description`, `date`) VALUES
(1, 'Mission', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Our mission is to streamline cargo movement through reliable, tech-driven CFS and ICD operations. We ensure transparency, speed, and safety in every shipment, while fostering sustainable logistics practices that benefit our clients and communities.</span></p>', '2025-10-05'),
(2, 'Vision', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">To be the most trusted and innovative logistics partner in East Africa, delivering world-class CFS and ICD services that empower trade and economic growth. We aim to set new industry standards, transforming Tanzania&rsquo;s export infrastructure and positioning ourselves as the trusted partner for global trade</span></p>', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_mission_vision`
--

DROP TABLE IF EXISTS `mainapp_mission_vision`;
CREATE TABLE IF NOT EXISTS `mainapp_mission_vision` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_mission_vision`
--

INSERT INTO `mainapp_mission_vision` (`id`, `title`, `description`, `date`) VALUES
(1, 'Mission & Vision', '<p style=\"text-align:center\"><span style=\"font-size:18px\">Our mission and vision guide everything we do, ensuring we deliver reliable, innovative, and sustainable logistics solutions for our clients and partners.</span></p>', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_pricelist`
--

DROP TABLE IF EXISTS `mainapp_pricelist`;
CREATE TABLE IF NOT EXISTS `mainapp_pricelist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(200) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_pricelist`
--

INSERT INTO `mainapp_pricelist` (`id`, `file_name`, `file`, `date`) VALUES
(1, 'Price List', 'images/SGR_Ticket1_LxRCBty.pdf', '2025-10-05'),
(2, 'Price List1', 'images/SGR_Ticket1_qcqhnO8.pdf', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_project`
--

DROP TABLE IF EXISTS `mainapp_project`;
CREATE TABLE IF NOT EXISTS `mainapp_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  `icon_class` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_project`
--

INSERT INTO `mainapp_project` (`id`, `title`, `description`, `date`, `icon_class`) VALUES
(1, 'Collaborations with Shipping Lines', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Foster partnerships with major shipping lines to secure preferential rates and improve service offerings to customers</span></p>', '2025-10-05', 'fa-shield-alt'),
(2, 'Alliances with Technology Providers', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Partner with tech companies to stay ahead in adopting cutting-edge technologies that enhance operational efficiency</span></p>', '2025-10-05', 'fa-users'),
(3, 'Market Analysis', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Conduct regular market research to identify trends, customer needs, and competitive positioning to adapt strategies accordingly</span></p>', '2025-10-05', 'fa-globe'),
(4, 'Global Partnerships', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Build strategic alliances with global logistics providers to enhance service offerings and operational capabilities in new regions</span></p>', '2025-10-05', 'fa-chart-line');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_quote`
--

DROP TABLE IF EXISTS `mainapp_quote`;
CREATE TABLE IF NOT EXISTS `mainapp_quote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `origin` varchar(200) NOT NULL,
  `destination` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `cargo_details` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_reasons_for_choosing`
--

DROP TABLE IF EXISTS `mainapp_reasons_for_choosing`;
CREATE TABLE IF NOT EXISTS `mainapp_reasons_for_choosing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  `icon_class` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_reasons_for_choosing`
--

INSERT INTO `mainapp_reasons_for_choosing` (`id`, `title`, `description`, `date`, `icon_class`) VALUES
(1, 'Efficiency', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">We ensure fast, seamless, and optimized cargo handling to minimize delays and reduce costs</span></p>', '2025-10-05', 'fa-chart-line'),
(2, 'Integrity', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">We operate with honesty, transparency, and ethical business practices in all our operations</span></p>', '2025-10-05', 'fa-star'),
(3, 'Customer Focus', '<p><span style=\"font-size:18px\">We prioritize our customers&rsquo; needs and deliver tailored solutions to exceed expectations</span></p>', '2025-10-05', 'fa-shield-alt'),
(4, 'Innovation', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">We embrace new ideas and technologies to continuously improve our services</span></p>', '2025-10-05', 'fa-users'),
(5, 'Compliance & Safety', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">We adhere to regulations and maintain the highest standards of safety in all operations</span></p>', '2025-10-05', 'fa-globe'),
(6, 'Sustainability', '<p><span style=\"font-size:18px\">We are committed to environmentally responsible practices for a sustainable future</span></p>', '2025-10-05', 'fa-star');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_service`
--

DROP TABLE IF EXISTS `mainapp_service`;
CREATE TABLE IF NOT EXISTS `mainapp_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_service`
--

INSERT INTO `mainapp_service` (`id`, `title`, `description`, `image`, `date`) VALUES
(1, 'Stuffing', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Our stuffing service ensures that your cargo is securely loaded into containers with precision and care. We utilize experienced personnel and specialized equipment to maximize space utilization and safeguard the integrity of your goods during transport. Whether you have loose cargo or pallets, we can accommodate various types of shipments to ensure they are packed efficiently and safely</span></p>', 'images/carousel-3_Furj73T.jpg', '2025-10-05'),
(2, 'Lift Off/On Empty Containers', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">We provide comprehensive lift-off and lift-on services for empty containers. Our team efficiently manages the loading and unloading of empty containers, ensuring that they are handled with care to maintain their condition. This service is crucial for shipping companies looking to reposition empty containers quickly and effectively, minimizing downtime and optimizing their fleet management</span></p>', 'images/banner-new_kyhjUoU.png', '2025-10-05'),
(3, 'Lift Off/On Full Containers', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Our lift-off and lift-on service for full containers guarantees the safe and efficient transfer of loaded containers to and from transport vehicles. We utilize advanced lifting equipment and trained personnel to handle your full containers, ensuring that they are lifted and positioned securely. This service helps facilitate quick turnaround times, allowing your shipments to reach their destinations without unnecessary delays.</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:18px\">Our lift-off and lift-on service for full containers guarantees the safe and efficient transfer of loaded containers to and from transport vehicles. We utilize advanced lifting equipment and trained personnel to handle your full containers, ensuring that they are lifted and positioned securely. This service helps facilitate quick turnaround times, allowing your shipments to reach their destinations without unnecessary delays</span></p>', 'images/carousel-3_tOozBaJ.jpg', '2025-10-05'),
(4, 'Varified Gross Mass (VGM)', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Compliance with international shipping regulations is critical, and our Verified Gross Mass (VGM) service ensures that your container&#39;s weight is accurately measured and documented. We provide reliable weight verification to meet the SOLAS (Safety of Life at Sea) requirements, giving you peace of mind that your shipments comply with safety standards. Our team uses certified weighing equipment to ensure accurate measurements, which helps prevent potential penalties or shipping delays</span></p>', 'images/service-6_dG2pDGa.jpg', '2025-10-05'),
(5, 'Stuffing Space', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">We offer dedicated stuffing space within our facility to accommodate your container loading needs. Our spacious and organized environment allows for efficient packing of cargo, with easy access to necessary equipment and resources. This service is designed to optimize your operations, ensuring that you have the space and support needed to prepare your shipments without hassle.</span></p>', 'images/feature_kxFYiHh.jpg', '2025-10-05'),
(6, 'Empty Container Handling Services', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Makanjiro Company CFS offers efficient empty container handling services, including receiving, inspection, storage, and dispatch. To meet growing demand and improve service capacity, Makanjiro has expanded its dedicated empty container storage area from&nbsp;<var>22,000 sqm</var>&nbsp;to&nbsp;<var>37,000 sqm</var>, enabling faster turnaround, increased storage capability, and enhanced yard management</span></p>', 'images/service-5_mc3Uhxx.jpg', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_shipment`
--

DROP TABLE IF EXISTS `mainapp_shipment`;
CREATE TABLE IF NOT EXISTS `mainapp_shipment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `heading` varchar(200) DEFAULT NULL,
  `sub_heading` longtext DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_shipment`
--

INSERT INTO `mainapp_shipment` (`id`, `heading`, `sub_heading`, `title`, `description`, `image`) VALUES
(1, 'Shipment', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">At Mtwara Container Freight Services, we specialize in providing a range of essential services tailored to streamline your shipping and logistics operations. Our facility is equipped to handle all aspects of container management, ensuring that your cargo is processed efficiently and securely. Below are the key services we offer:</span></p>', 'Stuffing', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam lorem diam.</span></p>', 'images/service-5_j0s5Gcm.jpg'),
(2, NULL, '', 'Customs Clearance', '<p><span style=\"font-size:18px\">Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam lorem diam.</span></p>', 'images/feature_UClanX5.jpg'),
(3, NULL, '', 'Warehouse Solutions', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam lorem diam.</span></p>', 'images/service-6_xjjnEfp.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_slider`
--

DROP TABLE IF EXISTS `mainapp_slider`;
CREATE TABLE IF NOT EXISTS `mainapp_slider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_slider`
--

INSERT INTO `mainapp_slider` (`id`, `title`, `description`, `image`, `date`) VALUES
(1, 'Cargo Handling Made Easy', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">With efficient, secure, and cost-effective logistics solutions. Strategically located near Mtwara Port, our facility ensures smooth container stuffing, safe storage, and seamless freight management for exporters and importers</span></p>', 'images/banner-new_jdKk9RK.png', '2025-10-05'),
(2, 'Cargo Handling Made Easy', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">With efficient, secure, and cost-effective logistics solutions. Strategically located near Mtwara Port, our facility ensures smooth container stuffing, safe storage, and seamless freight management for exporters and importers</span></p>', 'images/carousel-3_1ad33zu.jpg', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_special`
--

DROP TABLE IF EXISTS `mainapp_special`;
CREATE TABLE IF NOT EXISTS `mainapp_special` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_special`
--

INSERT INTO `mainapp_special` (`id`, `title`, `description`, `date`) VALUES
(6, 'What Makes Us Special', '<h1>What Makes Us Special</h1>', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_special_point`
--

DROP TABLE IF EXISTS `mainapp_special_point`;
CREATE TABLE IF NOT EXISTS `mainapp_special_point` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_special_point`
--

INSERT INTO `mainapp_special_point` (`id`, `title`, `date`) VALUES
(1, 'Cost-effective Solutions', '2025-10-05'),
(2, 'Strategic Location', '2025-10-05'),
(3, 'Commitment to Sustainability', '2025-10-05'),
(4, 'Reliable Schedules', '2025-10-05'),
(5, 'Environmental Friendliness', '2025-10-05'),
(6, 'Comprehensive Logistics Solutions', '2025-10-05'),
(7, 'High Cargo Capacity', '2025-10-05'),
(8, 'Flexibility in Packaging', '2025-10-05'),
(9, 'Customs and Compliance Expertise', '2025-10-05'),
(10, 'Cost-effective Solutions', '2025-10-05'),
(11, 'Long-term Contracts', '2025-10-05'),
(12, 'Dedicated Client Support', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_story`
--

DROP TABLE IF EXISTS `mainapp_story`;
CREATE TABLE IF NOT EXISTS `mainapp_story` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_story`
--

INSERT INTO `mainapp_story` (`id`, `title`, `description`, `date`, `image`) VALUES
(1, 'Our Story', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Makanjiro Company Limited, established in July 2022, is an emerging leader in Container Freight Station (CFS) and Inland Container Depot (ICD) operations, with a focus on facilitating the seamless, secure and efficient export of Tanzania&rsquo;s premier agricultural products. Our CFS and ICD services are designed to support global supply chains and regional trade.</span></p>', '2025-10-05', 'images/container_tSgOalC.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_success_story`
--

DROP TABLE IF EXISTS `mainapp_success_story`;
CREATE TABLE IF NOT EXISTS `mainapp_success_story` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_success_story`
--

INSERT INTO `mainapp_success_story` (`id`, `title`, `description`, `image`, `date`) VALUES
(1, 'Our Success Story', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">At Makanjiro CFS, our journey has been defined by our unwavering commitment to providing efficient and reliable container handling services. Since our inception, we have continuously enhanced our capabilities to meet the evolving demands of the logistics industry. By leveraging cutting-edge technology and a skilled team, we have become a trusted partner in managing dry port operations, from container stuffing to seamless delivery to the main port. Our focus on customer satisfaction, timely execution, and adaptable solutions has enabled us to successfully handle diverse CFS-related business, solidifying our reputation as a leader in the industry</span></p>', 'images/container_l64boPK.jpg', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_team`
--

DROP TABLE IF EXISTS `mainapp_team`;
CREATE TABLE IF NOT EXISTS `mainapp_team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_team`
--

INSERT INTO `mainapp_team` (`id`, `title`, `description`, `image`, `date`) VALUES
(1, 'Meet Our Team', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">At Makanjiro CFS, our team is the foundation of our success, bringing together skilled professionals with extensive experience in logistics and port operations. Committed to excellence, we prioritize collaboration, innovation, and continuous improvement to ensure seamless container handling and timely deliveries. From operations managers to on-the-ground staff, each member plays a crucial role in maintaining high service standards, enabling us to remain a leader in the CFS industry</span></p>', 'images/team_YYCgJgm.JPG', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_value`
--

DROP TABLE IF EXISTS `mainapp_value`;
CREATE TABLE IF NOT EXISTS `mainapp_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  `icon_class` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_value`
--

INSERT INTO `mainapp_value` (`id`, `title`, `description`, `date`, `icon_class`) VALUES
(1, 'CUSTOMER FOCUS', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">Our customers are at the heart of everything we do. We strive to understand their needs and deliver tailored solutions that exceed expectations</span></p>', '2025-10-05', 'fa-lightbulb'),
(2, 'SAFETY FIRST', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">We prioritize the safety of our employees, customers, and cargo by maintaining a safe working environment and adhering to best practices.</span></p>', '2025-10-05', 'fa-star'),
(3, 'INNOVATION', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">We embrace change and continuously seek innovative solutions to improve efficiency and service quality through the latest technologies</span></p>', '2025-10-05', 'fa-users'),
(4, 'SUSTAINABILITY', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">We are dedicated to minimizing environmental impact by implementing sustainable practices and supporting the communities we serve.</span></p>', '2025-10-05', 'fa-balance-scale'),
(5, 'INTEGRITY', '<p style=\"text-align:justify\"><span style=\"font-size:18px\">We conduct our business with honesty and transparency, holding ourselves accountable to the highest ethical standards</span></p>', '2025-10-05', 'fa-shield-alt');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_vision`
--

DROP TABLE IF EXISTS `mainapp_vision`;
CREATE TABLE IF NOT EXISTS `mainapp_vision` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_visitor`
--

DROP TABLE IF EXISTS `mainapp_visitor`;
CREATE TABLE IF NOT EXISTS `mainapp_visitor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_address` char(39) NOT NULL,
  `visit_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mainapp_visitor`
--

INSERT INTO `mainapp_visitor` (`id`, `ip_address`, `visit_time`) VALUES
(1, '127.0.0.1', '2025-10-05 09:59:20.504403');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
