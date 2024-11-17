-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2024 at 03:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `file_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `admin_user` text NOT NULL,
  `admin_password` text NOT NULL,
  `admin_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`id`, `name`, `admin_user`, `admin_password`, `admin_status`) VALUES
(13, 'Admin', 'admin@gmail.com', '$2a$12$Ttx8lswZAZNehJzr51GuBeyreVg3moK9hFpWR5Pjw8p1EN01Xgbci', '');

-- --------------------------------------------------------

--
-- Table structure for table `history_log`
--

CREATE TABLE `history_log` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `email_address` text NOT NULL,
  `action` varchar(100) NOT NULL,
  `actions` varchar(200) NOT NULL DEFAULT 'Has LoggedOut the system at',
  `ip` text NOT NULL,
  `host` text NOT NULL,
  `login_time` varchar(200) NOT NULL,
  `logout_time` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `history_log`
--

INSERT INTO `history_log` (`log_id`, `id`, `email_address`, `action`, `actions`, `ip`, `host`, `login_time`, `logout_time`) VALUES
(0, 3, 'william@gmail.com', 'Has Logged In the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 09:33 AM', 'Nov-17-2024 12:27 PM'),
(0, 3, 'william@gmail.com', 'Has Logged In the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 09:40 AM', 'Nov-17-2024 12:27 PM'),
(0, 3, 'william@gmail.com', 'Has Logged In the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 09:42 AM', 'Nov-17-2024 12:27 PM'),
(0, 3, 'william@gmail.com', 'Has Logged In the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 09:45 AM', 'Nov-17-2024 12:27 PM'),
(0, 3, 'william@gmail.com', 'Has Logged In the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 10:37 AM', 'Nov-17-2024 12:27 PM'),
(0, 3, 'william@gmail.com', 'Has Logged In the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 10:46 AM', 'Nov-17-2024 12:27 PM'),
(0, 3, 'william@gmail.com', 'Has Logged In the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 10:49 AM', 'Nov-17-2024 12:27 PM'),
(0, 3, 'william@gmail.com', 'Has Logged In the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 11:06 AM', 'Nov-17-2024 12:27 PM'),
(0, 3, 'william@gmail.com', 'Has Logged In the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 12:09 PM', 'Nov-17-2024 12:27 PM');

-- --------------------------------------------------------

--
-- Table structure for table `history_log1`
--

CREATE TABLE `history_log1` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `admin_user` text NOT NULL,
  `action` varchar(100) NOT NULL,
  `actions` varchar(200) NOT NULL DEFAULT 'Has LoggedOut the system at',
  `ip` text NOT NULL,
  `host` text NOT NULL,
  `login_time` varchar(200) NOT NULL,
  `logout_time` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `history_log1`
--

INSERT INTO `history_log1` (`log_id`, `id`, `admin_user`, `action`, `actions`, `ip`, `host`, `login_time`, `logout_time`) VALUES
(0, 13, 'admin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 09:28 AM', 'Nov-17-2024 01:16 PM'),
(0, 13, 'admin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 09:32 AM', 'Nov-17-2024 01:16 PM'),
(0, 13, 'admin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 09:34 AM', 'Nov-17-2024 01:16 PM'),
(0, 13, 'admin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 11:52 AM', 'Nov-17-2024 01:16 PM'),
(0, 13, 'admin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 11:58 AM', 'Nov-17-2024 01:16 PM'),
(0, 13, 'admin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 11:59 AM', 'Nov-17-2024 01:16 PM'),
(0, 13, 'admin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-AGNJM3Q', 'Nov-17-2024 12:28 PM', 'Nov-17-2024 01:16 PM');

-- --------------------------------------------------------

--
-- Table structure for table `login_user`
--

CREATE TABLE `login_user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email_address` text NOT NULL,
  `user_password` text NOT NULL,
  `user_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login_user`
--

INSERT INTO `login_user` (`id`, `name`, `email_address`, `user_password`, `user_status`) VALUES
(3, 'william', 'william@gmail.com', '$2y$12$y//9B7GMQBuoyV..bwlHpOOyTu4u77y3bCXnKNPpsinxqKSjQNGhG', '');

-- --------------------------------------------------------

--
-- Table structure for table `upload_files`
--

CREATE TABLE `upload_files` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `upload_files`
--

INSERT INTO `upload_files` (`ID`, `NAME`, `SIZE`, `DOWNLOAD`, `TIMERS`, `ADMIN_STATUS`, `EMAIL`) VALUES
(4, 'vtaccounting system.pdf', '1514481', '5', 'Nov-17-2024 09:31 AM', 'Admin', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_user`
--
ALTER TABLE `login_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload_files`
--
ALTER TABLE `upload_files`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `login_user`
--
ALTER TABLE `login_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `upload_files`
--
ALTER TABLE `upload_files`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
