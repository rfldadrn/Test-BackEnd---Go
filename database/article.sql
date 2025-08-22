-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2025 at 11:21 AM
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
-- Database: `article`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `created_date` datetime(3) DEFAULT NULL,
  `updated_date` datetime(3) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `category`, `created_date`, `updated_date`, `status`) VALUES
(1, 'Testing 1', 'Content test 1', 'category Test 1', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(3, 'Testing 2', 'Content test 2', 'category Test 2', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(4, 'Testing 2', 'Content test 2', 'category Test 2', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(5, 'Testing 2', 'Content test 2', 'category Test 2', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(6, 'Testing 2', 'Content test 2', 'category Test 2', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(7, 'Testing 2', 'Content test 2', 'category Test 2', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(8, 'Testing 2', 'Content test 2', 'category Test 2', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(9, 'Testing 2', 'Content test 2', 'category Test 2', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(10, 'NEW11112222 - Test back end 20 char Test back end 20 char', 'Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 v Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2', 'AAa', '0000-00-00 00:00:00.000', '2025-08-22 16:01:01.667', 'publish'),
(11, 'Testing 2', 'Content test 2', 'category Test 2', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(12, 'Testing 2', 'Content test 2', 'category Test 2', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(13, 'Testing 2', 'Content test 2', '1', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(14, 'Test back end 20 char Test back end 20 char', 'Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 v Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2', 'AIA', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(15, 'Test back end 20 char Test back end 20 char', 'Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 v Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2', 'AIA', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Draft'),
(16, 'Test back end 20 char Test back end 20 char', 'Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 v Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2', 'AAa', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Publish'),
(17, 'Test back end 20 char Test back end 20 char', 'Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 v Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2', 'AAa', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Publish'),
(18, 'NEW - Test back end 20 char Test back end 20 char', 'Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 v Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2', 'AAa', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Publish'),
(19, 'NEW - Test back end 20 char Test back end 20 char', 'Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 v Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2', 'AAa', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Publish'),
(20, 'NEW - Test back end 20 char Test back end 20 char', 'Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 v Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2', 'AAa', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Publish'),
(21, 'NEW1111 - Test back end 20 char Test back end 20 char', 'Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 v Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2', 'AAa', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'Publish'),
(22, 'NEW1111 - Test back end 20 char Test back end 20 char', 'Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 v Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2', 'AAa', '0000-00-00 00:00:00.000', '0000-00-00 00:00:00.000', 'publish'),
(23, 'NEW1111 - Test back end 20 char Test back end 20 char', 'Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 v Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2 Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2v v Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2Content test 2', 'AAa', '2025-08-22 16:00:58.890', '0000-00-00 00:00:00.000', 'publish');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
