-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2023 at 01:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_women`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(25, 'Can add act', 7, 'add_act'),
(26, 'Can change act', 7, 'change_act'),
(27, 'Can delete act', 7, 'delete_act'),
(28, 'Can view act', 7, 'view_act'),
(29, 'Can add complaint', 8, 'add_complaint'),
(30, 'Can change complaint', 8, 'change_complaint'),
(31, 'Can delete complaint', 8, 'delete_complaint'),
(32, 'Can view complaint', 8, 'view_complaint'),
(33, 'Can add employee', 9, 'add_employee'),
(34, 'Can change employee', 9, 'change_employee'),
(35, 'Can delete employee', 9, 'delete_employee'),
(36, 'Can view employee', 9, 'view_employee'),
(37, 'Can add gallery', 10, 'add_gallery'),
(38, 'Can change gallery', 10, 'change_gallery'),
(39, 'Can delete gallery', 10, 'delete_gallery'),
(40, 'Can view gallery', 10, 'view_gallery'),
(41, 'Can add helpline', 11, 'add_helpline'),
(42, 'Can change helpline', 11, 'change_helpline'),
(43, 'Can delete helpline', 11, 'delete_helpline'),
(44, 'Can view helpline', 11, 'view_helpline'),
(45, 'Can add login', 12, 'add_login'),
(46, 'Can change login', 12, 'change_login'),
(47, 'Can delete login', 12, 'delete_login'),
(48, 'Can view login', 12, 'view_login'),
(49, 'Can add news', 13, 'add_news'),
(50, 'Can change news', 13, 'change_news'),
(51, 'Can delete news', 13, 'delete_news'),
(52, 'Can view news', 13, 'view_news'),
(53, 'Can add tips', 14, 'add_tips'),
(54, 'Can change tips', 14, 'change_tips'),
(55, 'Can delete tips', 14, 'delete_tips'),
(56, 'Can view tips', 14, 'view_tips'),
(57, 'Can add training', 15, 'add_training'),
(58, 'Can change training', 15, 'change_training'),
(59, 'Can delete training', 15, 'delete_training'),
(60, 'Can view training', 15, 'view_training'),
(61, 'Can add user', 16, 'add_user'),
(62, 'Can change user', 16, 'change_user'),
(63, 'Can delete user', 16, 'delete_user'),
(64, 'Can view user', 16, 'view_user'),
(65, 'Can add mail', 17, 'add_mail'),
(66, 'Can change mail', 17, 'change_mail'),
(67, 'Can delete mail', 17, 'delete_mail'),
(68, 'Can view mail', 17, 'view_mail');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'power', 'act'),
(8, 'power', 'complaint'),
(9, 'power', 'employee'),
(10, 'power', 'gallery'),
(11, 'power', 'helpline'),
(12, 'power', 'login'),
(17, 'power', 'mail'),
(13, 'power', 'news'),
(14, 'power', 'tips'),
(15, 'power', 'training'),
(16, 'power', 'user'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-07 13:38:39.935639'),
(2, 'auth', '0001_initial', '2022-05-07 13:38:47.857140'),
(3, 'admin', '0001_initial', '2022-05-07 13:38:50.665049'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-07 13:38:50.743373'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-07 13:38:50.804520'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-07 13:38:51.399899'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-07 13:38:51.975331'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-07 13:38:52.870335'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-07 13:38:52.938076'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-07 13:38:53.320100'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-07 13:38:53.385332'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-07 13:38:53.459531'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-07 13:38:54.399426'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-07 13:38:55.457404'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-07 13:38:56.068960'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-07 13:38:56.132126'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-07 13:38:56.615090'),
(18, 'power', '0001_initial', '2022-05-07 13:39:05.840729'),
(19, 'sessions', '0001_initial', '2022-05-07 13:39:06.554853'),
(20, 'power', '0002_remove_news_news_img', '2022-05-08 11:29:14.134582');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('008qcv8jp6y24tzk55zohszd1blrrctu', 'e30:1nnxTA:cEUtK42FdAE8OagSRtiJQXum5tZxOQmXCR3tJyY7NcY', '2022-05-23 07:06:12.574911'),
('0cetzec3p6acwmxj7rjuxsfq39ml63z7', 'e30:1rIoxk:HLkPC_BjJnyvbxUJQRyZI41qm-icxZIi0x9WsHELnE0', '2024-01-11 11:54:08.809242'),
('zv47hb1j3zft8rc3wa57m43n8oy0bvab', '.eJyrViotTi3KS8xNVbJSSkzJzcxT0lEqys9B5mamKFkZ1gIAMM4NdQ:1rIj8j:T6g9RjRWTVf5IoqAGED-wZAZNgPnypiod6aMznG4f8s', '2024-01-11 05:41:05.164631');

-- --------------------------------------------------------

--
-- Table structure for table `power_act`
--

CREATE TABLE `power_act` (
  `act_id` int(11) NOT NULL,
  `act_title` varchar(100) NOT NULL,
  `act_details` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `power_act`
--

INSERT INTO `power_act` (`act_id`, `act_title`, `act_details`) VALUES
(2, 'THE DOWRY PROHIBITION ACT, 1961', 'In this act, `dowry’ means any property or valuable\r\nsecurity given or agreed to be given either directly or indirectly-\r\n(a) by one party to a marriage\r\nto the other party to the\r\nmarriage; or\r\n(b) by the parents of either\r\nparty to a marriage or by any\r\nother person, to either party to\r\nthe marriage');

-- --------------------------------------------------------

--
-- Table structure for table `power_complaint`
--

CREATE TABLE `power_complaint` (
  `Complaint_id` int(11) NOT NULL,
  `Complaint_subject` varchar(100) NOT NULL,
  `Complaint_message` varchar(500) NOT NULL,
  `Complaint_date` varchar(100) NOT NULL,
  `incident_date` varchar(100) NOT NULL,
  `incident_type` varchar(100) NOT NULL,
  `Complaint_reply` varchar(500) NOT NULL,
  `assign_date` varchar(100) NOT NULL,
  `finish_date` varchar(100) NOT NULL,
  `remarks` varchar(500) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `power_complaint`
--

INSERT INTO `power_complaint` (`Complaint_id`, `Complaint_subject`, `Complaint_message`, `Complaint_date`, `incident_date`, `incident_type`, `Complaint_reply`, `assign_date`, `finish_date`, `remarks`, `staff_id`, `user_id`) VALUES
(1, 'sfdsf', 'fdsfds', '2022-05-09', '2022-05-09', 'fdsfds', 'not yet Seen', '', '', '', 1, 1),
(2, 'misbehavior of staff', 'Actually, the case is that this employee takes female staff for granted & misbehaves with every female employees. Every female staff have a complaint about him. ', '2023-12-27', '2023-12-27', 'Misbevaiour', 'dfertret', '', '', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `power_employee`
--

CREATE TABLE `power_employee` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(100) NOT NULL,
  `staff_address` varchar(500) NOT NULL,
  `staff_email` varchar(200) NOT NULL,
  `staff_phone` varchar(100) NOT NULL,
  `staff_location` varchar(200) NOT NULL,
  `staff_status` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `staff_logid_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `power_employee`
--

INSERT INTO `power_employee` (`staff_id`, `staff_name`, `staff_address`, `staff_email`, `staff_phone`, `staff_location`, `staff_status`, `designation`, `staff_logid_id`) VALUES
(1, 'ammu', 'jhhg', 'gf@gmail.com', '8956895689', 'ghdf', 'waiting', 'gfh', 5),
(4, 'Aju', 'Aju Villa', 'aju@gmail.com', '7485963214', 'Pathanamthitta', 'waiting', 'Co-ordinator', 8);

-- --------------------------------------------------------

--
-- Table structure for table `power_gallery`
--

CREATE TABLE `power_gallery` (
  `g_id` int(11) NOT NULL,
  `g_details` varchar(1000) NOT NULL,
  `gal_img` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `power_gallery`
--

INSERT INTO `power_gallery` (`g_id`, `g_details`, `gal_img`) VALUES
(2, 'Photo', 'images/demo.png'),
(3, 'sadasd', 'images/demo_Hps2B92.png');

-- --------------------------------------------------------

--
-- Table structure for table `power_helpline`
--

CREATE TABLE `power_helpline` (
  `h_id` int(11) NOT NULL,
  `h_title` varchar(100) NOT NULL,
  `h_details` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `power_helpline`
--

INSERT INTO `power_helpline` (`h_id`, `h_title`, `h_details`) VALUES
(3, 'Mithra 181 WHL.', 'Adolescent girls, women facing domestic violence or other forms of harassment and transgender can avail the 24/7 services');

-- --------------------------------------------------------

--
-- Table structure for table `power_login`
--

CREATE TABLE `power_login` (
  `logid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `power_login`
--

INSERT INTO `power_login` (`logid`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin'),
(3, 'user', 'user', 'user'),
(4, 'sarath', '123', 'user'),
(5, 'ammu', '123', 'staff'),
(8, 'aju123', 'aju123', 'staff'),
(15, 'anu123', 'anu123', 'user'),
(21, 'aneena123', 'aneena123', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `power_mail`
--

CREATE TABLE `power_mail` (
  `mail_id` int(11) NOT NULL,
  `mail_message` varchar(500) NOT NULL,
  `mail_date` varchar(100) NOT NULL,
  `complaint_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `power_mail`
--

INSERT INTO `power_mail` (`mail_id`, `mail_message`, `mail_date`, `complaint_id`, `staff_id`, `user_id`) VALUES
(1, 'bvcbvcb', '2022-05-09', 1, NULL, 1),
(2, 'ghdhdg', '2022-05-09', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `power_news`
--

CREATE TABLE `power_news` (
  `news_id` int(11) NOT NULL,
  `news_subject` varchar(100) NOT NULL,
  `news_details` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `power_news`
--

INSERT INTO `power_news` (`news_id`, `news_subject`, `news_details`) VALUES
(2, 'Not a political tool but a Bill to empower women', 'Political representation is a fundamental aspect of women’s empowerment, and the government has taken steps to increase the participation of women in politics');

-- --------------------------------------------------------

--
-- Table structure for table `power_tips`
--

CREATE TABLE `power_tips` (
  `tip_id` int(11) NOT NULL,
  `tip_safty` varchar(100) NOT NULL,
  `tip_details` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `power_tips`
--

INSERT INTO `power_tips` (`tip_id`, `tip_safty`, `tip_details`) VALUES
(7, 'Embrace a mindset of worthiness', 'Cultivating a mindset of worthiness is essential. Take the time to acknowledge and appreciate your positive qualities. Create a daily ritual of writing down affirmations and reading them aloud. Even if you don\'t initially feel connected to them, continue to practice them with a relaxed mind, and over time you\'ll begin to internalize them.'),
(8, 'Prioritize self care do what brings you joy', 'Practicing self-care and engaging in activities you enjoy is vital in valuing yourself as a woman. So, set aside time each day to do something that\'s solely for your benefit.\r\n\r\nIt could be reading a book, taking a walk in nature, or pursuing a hobby you love. And, remember that engaging in activities that make you happy and remind you of your capabilities is an act of self-love.'),
(9, 'Surround yourself with uplifting people', 'Surround yourself with positive, supportive individuals who encourage and empower you to be your authentic self. Spend time with people who uplift you, make you feel good about yourself, and contribute to your overall well-being.');

-- --------------------------------------------------------

--
-- Table structure for table `power_training`
--

CREATE TABLE `power_training` (
  `t_id` int(11) NOT NULL,
  `t_subject` varchar(100) NOT NULL,
  `t_message` varchar(500) NOT NULL,
  `t_date` varchar(100) NOT NULL,
  `t_name` varchar(500) NOT NULL,
  `resource_person` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `power_training`
--

INSERT INTO `power_training` (`t_id`, `t_subject`, `t_message`, `t_date`, `t_name`, `resource_person`) VALUES
(2, 'Trainig For Women', 'International Women’s Health and Human Rights', '2023-12-29', 'Jithu', 'Jithin Abraham');

-- --------------------------------------------------------

--
-- Table structure for table `power_user`
--

CREATE TABLE `power_user` (
  `User_id` int(11) NOT NULL,
  `User_name` varchar(200) NOT NULL,
  `User_address` varchar(200) NOT NULL,
  `User_email` varchar(100) NOT NULL,
  `User_phone` varchar(100) NOT NULL,
  `User_gender` varchar(200) NOT NULL,
  `User_dob` varchar(200) NOT NULL,
  `User_aadhar` varchar(200) NOT NULL,
  `User_state` varchar(200) NOT NULL,
  `User_district` varchar(200) NOT NULL,
  `User_village` varchar(200) NOT NULL,
  `User_status` varchar(200) NOT NULL,
  `Log_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `power_user`
--

INSERT INTO `power_user` (`User_id`, `User_name`, `User_address`, `User_email`, `User_phone`, `User_gender`, `User_dob`, `User_aadhar`, `User_state`, `User_district`, `User_village`, `User_status`, `Log_id_id`) VALUES
(1, 'sarath', 'jhgjfgfrtg', 'sarath@gmail.com', '8597456321', 'Male', '1993-05-15', '677', 'kerala', 'kollam', 'kollam', 'approved', 4),
(2, 'any', 'Anu Villa', 'dddd@dd.com', '8596362541', 'Male', '2023-12-28', '748596362514', 'Kerala', 'Kottayam', 'Kottayam', 'approved', 15),
(8, 'Aneena', 'Aneena Villa', 'aneena@gmail.com', '7854693214', 'Male', '2023-12-28', '789654789654', 'Kerala', 'Kottatam', 'Pampady', 'approved', 21);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `power_act`
--
ALTER TABLE `power_act`
  ADD PRIMARY KEY (`act_id`);

--
-- Indexes for table `power_complaint`
--
ALTER TABLE `power_complaint`
  ADD PRIMARY KEY (`Complaint_id`),
  ADD KEY `power_complaint_staff_id_4e4fcb2b_fk_power_employee_staff_id` (`staff_id`),
  ADD KEY `power_complaint_user_id_8ff70707_fk_power_user_User_id` (`user_id`);

--
-- Indexes for table `power_employee`
--
ALTER TABLE `power_employee`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `power_employee_staff_logid_id_bc3542fc_fk_power_login_logid` (`staff_logid_id`);

--
-- Indexes for table `power_gallery`
--
ALTER TABLE `power_gallery`
  ADD PRIMARY KEY (`g_id`);

--
-- Indexes for table `power_helpline`
--
ALTER TABLE `power_helpline`
  ADD PRIMARY KEY (`h_id`);

--
-- Indexes for table `power_login`
--
ALTER TABLE `power_login`
  ADD PRIMARY KEY (`logid`);

--
-- Indexes for table `power_mail`
--
ALTER TABLE `power_mail`
  ADD PRIMARY KEY (`mail_id`),
  ADD KEY `power_mail_complaint_id_5ebbf07c_fk_power_complaint_Complaint_id` (`complaint_id`),
  ADD KEY `power_mail_staff_id_59e69956_fk_power_employee_staff_id` (`staff_id`),
  ADD KEY `power_mail_user_id_2a200e92_fk_power_user_User_id` (`user_id`);

--
-- Indexes for table `power_news`
--
ALTER TABLE `power_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `power_tips`
--
ALTER TABLE `power_tips`
  ADD PRIMARY KEY (`tip_id`);

--
-- Indexes for table `power_training`
--
ALTER TABLE `power_training`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `power_user`
--
ALTER TABLE `power_user`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `power_user_Log_id_id_8dc3de7e_fk_power_login_logid` (`Log_id_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `power_act`
--
ALTER TABLE `power_act`
  MODIFY `act_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `power_complaint`
--
ALTER TABLE `power_complaint`
  MODIFY `Complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `power_employee`
--
ALTER TABLE `power_employee`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `power_gallery`
--
ALTER TABLE `power_gallery`
  MODIFY `g_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `power_helpline`
--
ALTER TABLE `power_helpline`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `power_login`
--
ALTER TABLE `power_login`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `power_mail`
--
ALTER TABLE `power_mail`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `power_news`
--
ALTER TABLE `power_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `power_tips`
--
ALTER TABLE `power_tips`
  MODIFY `tip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `power_training`
--
ALTER TABLE `power_training`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `power_user`
--
ALTER TABLE `power_user`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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

--
-- Constraints for table `power_complaint`
--
ALTER TABLE `power_complaint`
  ADD CONSTRAINT `power_complaint_staff_id_4e4fcb2b_fk_power_employee_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `power_employee` (`staff_id`),
  ADD CONSTRAINT `power_complaint_user_id_8ff70707_fk_power_user_User_id` FOREIGN KEY (`user_id`) REFERENCES `power_user` (`User_id`);

--
-- Constraints for table `power_employee`
--
ALTER TABLE `power_employee`
  ADD CONSTRAINT `power_employee_staff_logid_id_bc3542fc_fk_power_login_logid` FOREIGN KEY (`staff_logid_id`) REFERENCES `power_login` (`logid`);

--
-- Constraints for table `power_mail`
--
ALTER TABLE `power_mail`
  ADD CONSTRAINT `power_mail_complaint_id_5ebbf07c_fk_power_complaint_Complaint_id` FOREIGN KEY (`complaint_id`) REFERENCES `power_complaint` (`Complaint_id`),
  ADD CONSTRAINT `power_mail_staff_id_59e69956_fk_power_employee_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `power_employee` (`staff_id`),
  ADD CONSTRAINT `power_mail_user_id_2a200e92_fk_power_user_User_id` FOREIGN KEY (`user_id`) REFERENCES `power_user` (`User_id`);

--
-- Constraints for table `power_user`
--
ALTER TABLE `power_user`
  ADD CONSTRAINT `power_user_Log_id_id_8dc3de7e_fk_power_login_logid` FOREIGN KEY (`Log_id_id`) REFERENCES `power_login` (`logid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
