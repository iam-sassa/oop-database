-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2022 at 03:51 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bestaditek`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `open_hour` time NOT NULL,
  `close_hour` time NOT NULL,
  `phone` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `id` int(11) NOT NULL,
  `nik` int(16) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('girl','boy') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trx_detail`
--

CREATE TABLE `trx_detail` (
  `id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `header_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(3) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trx_detail`
--

INSERT INTO `trx_detail` (`id`, `header_id`, `goods`, `quantity`, `price`) VALUES
('G1', 'trx1', 'Quidditch Robe', 3, 50000),
('G2', 'trx2', 'chocolate bar', 8, 15000),
('G3', 'trx5', 'banana milk', 2, 5000),
('G4', 'trx3', 'chinamon roll', 10, 10000),
('G5', 'trx4', 'cheese cake', 15, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `trx_header`
--

CREATE TABLE `trx_header` (
  `id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `info_id` int(3) DEFAULT NULL,
  `trx_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_discount` double NOT NULL,
  `total_price` double NOT NULL,
  `total_cost` double NOT NULL,
  `total_change` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trx_header`
--

INSERT INTO `trx_header` (`id`, `info_id`, `trx_date`, `total_discount`, `total_price`, `total_cost`, `total_change`, `created_at`, `updated_at`) VALUES
('trx1', 2, '2022-11-28 02:13:14', 60000, 150000, 100000, 10000, '2022-11-28 02:02:45', NULL),
('trx2', 5, '2022-11-28 02:13:14', 40000, 120000, 100000, 20000, '2022-11-28 02:02:45', NULL),
('trx3', 3, '2022-11-28 02:13:14', 0, 10000, 10000, 0, '2022-11-28 02:02:45', NULL),
('trx4', 1, '2022-12-21 02:13:14', 20000, 100000, 90000, 10000, '2022-11-28 02:02:45', NULL),
('trx5', NULL, '2022-11-28 03:48:52', 80000, 245000, 170000, 5000, '2022-11-28 02:02:45', NULL),
('trx6', 3, '2022-11-29 01:23:43', 40, 30, 20, 10, '2022-11-29 07:10:50', '2022-11-29 01:23:43');

-- --------------------------------------------------------

--
-- Table structure for table `trx_info`
--

CREATE TABLE `trx_info` (
  `id` int(11) NOT NULL,
  `branch_info` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `cashier_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trx_info`
--

INSERT INTO `trx_info` (`id`, `branch_info`, `cashier_name`, `isActive`, `created_at`, `updated_at`) VALUES
(1, 'Bintaro Arcade 22', 'Sanzeale', 1, '2022-11-28 01:54:37', '2022-11-28 01:51:32'),
(2, 'Bintaro Arcade 2', 'Fieddozekkan', 0, '2022-11-28 01:54:37', NULL),
(3, 'Borough of Islington', 'Yathalleon', 1, '2022-11-28 01:54:37', NULL),
(4, 'Privet Drive', 'Ronald', 0, '2022-11-28 01:54:37', NULL),
(5, 'Privet Drive', 'Hermione', 1, '2022-11-28 01:54:37', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trx_detail`
--
ALTER TABLE `trx_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trx_detail_header` (`header_id`);

--
-- Indexes for table `trx_header`
--
ALTER TABLE `trx_header`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trx_header` (`info_id`);

--
-- Indexes for table `trx_info`
--
ALTER TABLE `trx_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cashier`
--
ALTER TABLE `cashier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trx_info`
--
ALTER TABLE `trx_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `trx_detail`
--
ALTER TABLE `trx_detail`
  ADD CONSTRAINT `fk_trx_detail_header` FOREIGN KEY (`header_id`) REFERENCES `trx_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trx_header`
--
ALTER TABLE `trx_header`
  ADD CONSTRAINT `fk_trx_header` FOREIGN KEY (`info_id`) REFERENCES `trx_info` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
