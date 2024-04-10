-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2024 at 05:40 AM
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
-- Database: `interview`
--
CREATE DATABASE IF NOT EXISTS `interview` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `interview`;

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` varchar(64) NOT NULL,
  `intent` varchar(64) NOT NULL,
  `subintent` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `intent`, `subintent`, `point`, `date`) VALUES
('0049e52b433e76712ad7420ed1d7299ddcdc1a5ab59b1ef7880b80260c5fba45', 'Reset', 1, 7, '2024-04-10'),
('234f71b9decec2173b032869ac311c439839f2e632646d40359d16576f3c4c19', 'change', 2, 5, '2024-04-10'),
('2fdd3b6d8673cb8168d58ec62654ff99b1b6ce1a4ef5d33600b23a54117d1a8e', 'unlock', 1, 9, '2024-04-10'),
('596b691d45207dd391950ed7dc6cdcbe46464bc8361cc5700e1eae42a5e51e43', 'unlock', 2, 6, '2024-04-10'),
('a71e9e2f25373ca283a21aee8bd89888d77d3ad398a9afd52d79145845f19aca', 'Change', 1, 8, '2024-04-10'),
('e1a590e25c8e707b80d0b1348e19b6639e88a405eaa58bf9b26e19c9e168750d', 'reset', 2, 10, '2024-04-10');

-- --------------------------------------------------------

--
-- Table structure for table `subintent`
--

CREATE TABLE `subintent` (
  `id` int(11) NOT NULL,
  `subintent` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subintent`
--

INSERT INTO `subintent` (`id`, `subintent`) VALUES
(1, 'sap'),
(2, 'ad');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subintent` (`subintent`);

--
-- Indexes for table `subintent`
--
ALTER TABLE `subintent`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `subintent`
--
ALTER TABLE `subintent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data`
--
ALTER TABLE `data`
  ADD CONSTRAINT `subintent` FOREIGN KEY (`subintent`) REFERENCES `subintent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
