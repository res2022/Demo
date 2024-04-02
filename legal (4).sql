-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 10, 2024 at 11:46 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `legal`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `casereg`
--

CREATE TABLE IF NOT EXISTS `casereg` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cnam` varchar(100) NOT NULL,
  `cdet` varchar(150) NOT NULL,
  `ctyp` varchar(200) NOT NULL,
  `vic` varchar(45) NOT NULL,
  `uid` int(20) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `casereg`
--

INSERT INTO `casereg` (`cid`, `cnam`, `cdet`, `ctyp`, `vic`, `uid`) VALUES
(76, 'template 1', 'template 1', 'criminal', 'victim', 105),
(77, 'template2', 'template2', 'criminal', 'victim', 105),
(78, 'achu template 3', 'template3', 'criminal', 'nonvictim', 118);

-- --------------------------------------------------------

--
-- Table structure for table `chatm`
--

CREATE TABLE IF NOT EXISTS `chatm` (
  `chatid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `lid` int(10) NOT NULL,
  `chatdate` date NOT NULL,
  PRIMARY KEY (`chatid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `chatm`
--

INSERT INTO `chatm` (`chatid`, `uid`, `lid`, `chatdate`) VALUES
(73, 115, 226, '2024-03-07'),
(74, 105, 227, '2024-03-10'),
(75, 105, 226, '2024-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE IF NOT EXISTS `chats` (
  `chatid` int(20) NOT NULL,
  `msg` varchar(6000) NOT NULL,
  `typ` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`chatid`, `msg`, `typ`) VALUES
(74, 'HI SAKSHI WHAT ABOUT THE CASE', 'user'),
(75, 'hiii shivaaaaa', 'lawyer'),
(75, 'WHERE ARE YOU', 'user'),
(75, 'HOOOOOOPPOO', 'user'),
(75, 'hi daaa', 'lawyer'),
(75, 'hiii', 'lawyer');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `django_admin_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-02-28 06:39:32'),
(2, 'auth', '0001_initial', '2022-02-28 06:39:32'),
(3, 'admin', '0001_initial', '2022-02-28 06:39:32'),
(4, 'contenttypes', '0002_remove_content_type_name', '2022-02-28 06:39:32'),
(5, 'auth', '0002_alter_permission_name_max_length', '2022-02-28 06:39:32'),
(6, 'auth', '0003_alter_user_email_max_length', '2022-02-28 06:39:32'),
(7, 'auth', '0004_alter_user_username_opts', '2022-02-28 06:39:32'),
(8, 'auth', '0005_alter_user_last_login_null', '2022-02-28 06:39:32'),
(9, 'auth', '0006_require_contenttypes_0002', '2022-02-28 06:39:32'),
(10, 'sessions', '0001_initial', '2022-02-28 06:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('19737jvecwgoyrmlewxk9hovvihfpadt', 'N2ZmOTA1OGQzOWI0ZWY5NzcwYmE1NWQ5ODJjZTVhMTBmNDhmNWU4NTp7InR5cGUiOiJ1c2VyIiwiaWQiOjR9', '2022-11-21 07:34:17'),
('28kotfuwgebuulldiu609ifo7rlfncmx', 'YWIyODYxYzExOWZkNDA2ODZiYWU2ODQ0ZWEyOTNlZmMxNjJkZWJiZTp7InR5cGUiOiJhZG1pbiIsImlkIjoxfQ==', '2022-11-20 20:05:59'),
('29if2eyu78fzjy6370bapwiuh98q7w7n', 'ZGI3ZjVkZmJiODBmZGFmYjJiZDhkYmE3NmNmNmE2ZjdiY2VkODU1ODp7InR5cGUiOiJ1c2VyIiwiaWQiOjF9', '2022-04-23 16:34:16'),
('2ga2x0lgeul3f3jmq7y3o8j42hf3k6zz', 'ZGI3ZjVkZmJiODBmZGFmYjJiZDhkYmE3NmNmNmE2ZjdiY2VkODU1ODp7InR5cGUiOiJ1c2VyIiwiaWQiOjF9', '2022-04-24 15:08:28'),
('31vyi74mt1uldqag9h5ybg1wl6wemp27', 'NzM0MGNlNDEyMGMzODU0MzQzYjcxMWNlMTMzNmIwOTJkMWJjYmIxNDp7InR5cGUiOiJ1c2VyIiwiZW1haWwiOiJyZWV0aHVzaGFqaUBnbWFpbC5jb20iLCJpZCI6MX0=', '2022-04-23 05:42:43'),
('50xeiq65meam6e6y64q7acq2r91e5c28', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1ptsbt:6PJ0DECYWHLN0BzKFTM9hc8OYqaswDR4ePwqRAZE8Dg', '2023-05-16 16:12:13'),
('63emwbn31nqkxu5rass6le9tar832up5', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1py7yC:6WUgfjx42iAORWpghkwhRjWxF3E7GRaDNyeyuI_nfFo', '2023-05-28 09:24:48'),
('6ufrpxfatkjwgfgwp1r4d47ta8qylgpd', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1puPOW:Dz_wywXugm_7XlGcefJkpY1977GnKBDvJm4LM4nGUfM', '2023-05-18 03:12:36'),
('783hk250hu3ab54hhosk84us2ljmhtw5', 'YWIyODYxYzExOWZkNDA2ODZiYWU2ODQ0ZWEyOTNlZmMxNjJkZWJiZTp7InR5cGUiOiJhZG1pbiIsImlkIjoxfQ==', '2022-10-23 16:33:39'),
('9stcvahc0q61ala5q20558sshqby1m8i', 'Mjg2ZjFiZjJmZWJlMzhlNmZjOThlZWIzMmI3NDE3YjQyOGI2ZjU2YTp7InR5cGUiOiJidWlsZGVyIiwiZW1haWwiOjF9', '2022-03-30 14:45:03'),
('c1dwdyttjlpkby76tmb7ypduk972xx54', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1pzhdq:Yu8FM4ARlQRHYEPFPZ9EGeR0B1DqT4CGB67qW6eIPOc', '2023-06-01 17:42:18'),
('c629696y9dmdnkck7dca8w3dhg3t7prv', 'N2ZmOTA1OGQzOWI0ZWY5NzcwYmE1NWQ5ODJjZTVhMTBmNDhmNWU4NTp7InR5cGUiOiJ1c2VyIiwiaWQiOjR9', '2022-11-14 12:53:43'),
('kixcuakh7cx0rqv8a68axg5sly58jl25', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1ovXDS:o4rAr0tY62A4tKKJwl8HL4Y4besW9kdeUVP5WIdbYQs', '2022-12-01 05:13:34'),
('pel88llq6eicx7hum2017vk7j138s1f6', '.eJyrVsrJTFGyMjHTUSoFMYyMzIGsvMTcVCUrpeLE7OKMTIf03MTMHL3k_FwloFRBYnExUMrQyBjEK6ksACnMSSyvTC1SqgUApaMYSA:1rjFzH:JaPGRxfW3suaWlUyyBE-5GTHfMWO_e7EIxYnwZhywoQ', '2024-03-24 10:00:59'),
('qupq6i83w1qgqgwcl7kmx1stvnkrql78', 'N2ZmOTA1OGQzOWI0ZWY5NzcwYmE1NWQ5ODJjZTVhMTBmNDhmNWU4NTp7InR5cGUiOiJ1c2VyIiwiaWQiOjR9', '2022-11-21 06:51:04'),
('rk113xdeway6zrqyij6d47tfbnmpg5s0', 'N2ZmOTA1OGQzOWI0ZWY5NzcwYmE1NWQ5ODJjZTVhMTBmNDhmNWU4NTp7InR5cGUiOiJ1c2VyIiwiaWQiOjR9', '2022-11-21 04:29:45'),
('ruda6ve46lm7trr9m2qty3vwygmms8sl', 'YWIyODYxYzExOWZkNDA2ODZiYWU2ODQ0ZWEyOTNlZmMxNjJkZWJiZTp7InR5cGUiOiJhZG1pbiIsImlkIjoxfQ==', '2022-11-21 07:47:30'),
('sceoazvlj29xsus3vvmxhzhpjp1v6zml', 'eyJ1aWQiOjEsInV0eXBlIjoidXNlciJ9:1pyrke:_v-eq0uskinEUe_k1FThRcCzkXySx2lvVedRlggmCNQ', '2023-05-30 10:17:52'),
('wfmszz9pidle9htjx7u6dywphlan8h0t', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4ifQ:1puQGy:cszh9adoFPOnEjnboayMEephhxzRjFYl4r8cAhD7BJ4', '2023-05-18 04:08:52'),
('zncj4alnj7ulrpdn1l8667ahnjuugsyo', 'YWIyODYxYzExOWZkNDA2ODZiYWU2ODQ0ZWEyOTNlZmMxNjJkZWJiZTp7InR5cGUiOiJhZG1pbiIsImlkIjoxfQ==', '2022-11-10 09:22:47');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE IF NOT EXISTS `fees` (
  `fid` int(20) NOT NULL AUTO_INCREMENT,
  `ctype` varchar(100) NOT NULL,
  `cfees` varchar(20) NOT NULL,
  `lid` int(20) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `fees`
--


-- --------------------------------------------------------

--
-- Table structure for table `law`
--

CREATE TABLE IF NOT EXISTS `law` (
  `sid` int(15) NOT NULL AUTO_INCREMENT,
  `sno` varchar(20) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `des` varchar(300) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `law`
--

INSERT INTO `law` (`sid`, `sno`, `sname`, `des`) VALUES
(1, '09999', 'MKLO', 'GBBBB'),
(2, '2333', 'vishnu divorce', 'very good'),
(3, '12333', 'vishnu criminal', 'good '),
(4, 'sec:1233', 'ipc104', 'nothing');

-- --------------------------------------------------------

--
-- Table structure for table `lawyer`
--

CREATE TABLE IF NOT EXISTS `lawyer` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(20) NOT NULL,
  `laddr` varchar(50) NOT NULL,
  `lphn` varchar(10) NOT NULL,
  `lemail` varchar(30) NOT NULL,
  `lgender` varchar(10) NOT NULL,
  `lexpr` varchar(8) NOT NULL,
  `lqualification` varchar(10) NOT NULL,
  `lnumber` varchar(15) NOT NULL,
  `lspec` varchar(15) NOT NULL,
  `lstatus` varchar(10) NOT NULL,
  `hlawyer` varchar(12) NOT NULL,
  `rdate` varchar(20) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=232 ;

--
-- Dumping data for table `lawyer`
--

INSERT INTO `lawyer` (`lid`, `lname`, `laddr`, `lphn`, `lemail`, `lgender`, `lexpr`, `lqualification`, `lnumber`, `lspec`, `lstatus`, `hlawyer`, `rdate`) VALUES
(203, 'sabu', 'wwww', '233444', 'sa@gmail.com', 'male', '22', '3444', '333', 'criminal', 'approved', '', ''),
(226, 'lucy', '56788888', '0210021028', 'lucy@gmail.com', 'female', '2', 'bsc', '2333', 'civil,criminal', 'approved', 'lowercourt', '2024-02-17'),
(227, 'sakshi', '1234', '3455666666', 'sakshi@gmail.com', 'male', '23', 'bsc', '23444444', 'criminal', 'approved', 'lowercourt', '2024-02-23'),
(231, 'avanya', 'avanya101010101', '1414141414', 'avanya@gmail.com', 'female', '2', 'bca', '104', 'criminal', 'approved', 'lowercourt', '2024-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `lid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `upass` varchar(20) NOT NULL,
  `utype` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`lid`, `uid`, `uname`, `upass`, `utype`, `status`) VALUES
(4, 0, 'admin', 'admin', 'admin', 'true'),
(10, 203, 'sa@gmail.com', '123', 'lawyer', 'true'),
(21, 105, 'shiv@gmail.com', '123', 'user', 'true'),
(44, 226, 'lucy@gmail.com', '123', 'lawyer', 'true'),
(46, 227, 'sakshi@gmail.com', '123', 'lawyer', 'true'),
(54, 231, 'avanya@gmail.com', '123', 'lawyer', 'true'),
(55, 118, 'akm@gmail.com', '123', 'user', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `pay`
--

CREATE TABLE IF NOT EXISTS `pay` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `pdate` varchar(10) NOT NULL,
  `rdate` varchar(10) NOT NULL,
  `amt` varchar(20) NOT NULL,
  `cid` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `pay`
--

INSERT INTO `pay` (`pid`, `pdate`, `rdate`, `amt`, `cid`, `status`) VALUES
(24, '2024-02-26', '2024-02-26', '20000000000', 69, 'paid'),
(25, '2024-02-29', '2024-02-29', '10000', 71, 'paid'),
(26, '', '2024-03-10', '10000000000000', 76, ''),
(27, '2024-03-10', '2024-03-10', '2100021000', 77, 'paid'),
(28, '2024-03-10', '2024-03-10', '35000', 78, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `paydet`
--

CREATE TABLE IF NOT EXISTS `paydet` (
  `pdid` int(20) NOT NULL AUTO_INCREMENT,
  `cname` varchar(15) NOT NULL,
  `acno` varchar(20) NOT NULL,
  `cvv` varchar(20) NOT NULL,
  `amt` varchar(20) NOT NULL,
  `edate` varchar(10) NOT NULL,
  `pid` int(10) NOT NULL,
  PRIMARY KEY (`pdid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `paydet`
--

INSERT INTO `paydet` (`pdid`, `cname`, `acno`, `cvv`, `amt`, `edate`, `pid`) VALUES
(16, 'shiva123', '12222', '34444', '40000000000', '2024-02-21', 21),
(17, 'pranav 1', '1234', '12333', '40000000', '2024-02-21', 22),
(18, '`11111', 'asdddd', 'vghhhh', '20000000000', '2024-02-20', 24),
(19, 'ishaan', '12000000', '2024', '10000', '2024-02-29', 25),
(20, 'template2', '222', '222222', '2100021000', '2024-03-10', 27),
(21, 'achu template 4', '104', '100099999', '35000', '2024-03-10', 28);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `rqid` int(20) NOT NULL AUTO_INCREMENT,
  `lid` int(20) NOT NULL,
  `uid` int(20) NOT NULL,
  `cid` int(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`rqid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`rqid`, `lid`, `uid`, `cid`, `status`) VALUES
(74, 226, 113, 69, 'accepted'),
(75, 227, 114, 70, 'accepted'),
(76, 228, 115, 71, 'accepted'),
(77, 228, 115, 72, 'changed'),
(78, 226, 115, 73, 'accepted'),
(79, 227, 115, 74, 'accepted'),
(80, 228, 115, 75, 'accepted'),
(81, 227, 105, 76, 'accepted'),
(82, 226, 105, 77, 'accepted'),
(83, 226, 105, 77, 'pending'),
(84, 231, 118, 78, 'accepted');

-- --------------------------------------------------------

--
-- Table structure for table `uploadcase`
--

CREATE TABLE IF NOT EXISTS `uploadcase` (
  `ucid` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `ufiles` varchar(200) NOT NULL,
  `cid` int(20) NOT NULL,
  `uid` int(20) NOT NULL,
  PRIMARY KEY (`ucid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `uploadcase`
--

INSERT INTO `uploadcase` (`ucid`, `title`, `ufiles`, `cid`, `uid`) VALUES
(32, 'cas2222', 'upload/cv_5vuhqfb.jpg', 72, 115),
(33, 'TEMPLATE 1', 'upload/OIP_YS1SGgP.jpg', 76, 105),
(34, 'achutemplate 4', 'upload/OIP_V9ugZ0v.jpg', 78, 118);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `adr` varchar(25) NOT NULL,
  `phn` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `udate` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=119 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `adr`, `phn`, `email`, `udate`) VALUES
(105, 'shiva', 'qwwww', '2222222222', 'shiv@gmail.com', ''),
(118, 'achu', 'achu105', '102045555', 'akm@gmail.com', '2024-03-10');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin_log_ibfk_2` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);
