-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2024 at 09:44 PM
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
-- Database: `onlineshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `benutzerprofil`
--

CREATE TABLE `benutzerprofil` (
  `idprofil` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `benutzerprofil`
--

INSERT INTO `benutzerprofil` (`idprofil`, `email`, `password`) VALUES
(2000, 'test2@gmail.com', 'test'),
(2003, 'test@gmail.com', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `bestellung`
--

CREATE TABLE `bestellung` (
  `idbestellung` int(11) NOT NULL,
  `datum` datetime NOT NULL,
  `idbenutzer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bestellung`
--

INSERT INTO `bestellung` (`idbestellung`, `datum`, `idbenutzer`) VALUES
(1, '2024-11-15 11:42:37', 2003),
(2, '2024-11-15 11:42:45', 2003),
(3, '2024-11-15 12:36:04', 2003),
(4, '2024-11-15 12:46:26', 2000),
(5, '2024-11-15 12:53:18', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `bestellung_hat_produkt`
--

CREATE TABLE `bestellung_hat_produkt` (
  `idbestellung` int(11) NOT NULL,
  `idprodukt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bestellung_hat_produkt`
--

INSERT INTO `bestellung_hat_produkt` (`idbestellung`, `idprodukt`) VALUES
(5, 1),
(5, 9),
(5, 10),
(5, 9),
(5, 5),
(5, 1),
(5, 4),
(5, 10),
(5, 10),
(5, 10),
(5, 10),
(5, 10),
(5, 1),
(5, 10),
(5, 2),
(5, 8),
(5, 8),
(5, 3),
(5, 1),
(5, 8),
(5, 6),
(5, 6),
(5, 10),
(5, 10),
(5, 9),
(5, 7),
(5, 6),
(5, 1),
(5, 2),
(5, 6),
(5, 2),
(5, 8),
(5, 10),
(5, 9),
(5, 6),
(5, 10),
(5, 2),
(5, 3),
(5, 8),
(5, 6),
(5, 8),
(5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `durchschnittlichewertung` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `durchschnittlichewertung`) VALUES
(1, 'iphone', 0),
(2, 'samsung', 0),
(3, 'ipad', 0),
(4, 'samsung tablet', 0),
(5, 'allmight figure', 0),
(6, 'iphone 5', 0),
(7, 'samsung s23', 0),
(8, 'ipad 5', 0),
(9, 'samsung tablet s23', 0),
(10, 'allmight figure xl', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `idreview` int(11) NOT NULL,
  `bewertung` tinyint(5) NOT NULL,
  `beschreibung` varchar(255) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `idbenutzer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `benutzerprofil`
--
ALTER TABLE `benutzerprofil`
  ADD PRIMARY KEY (`idprofil`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `bestellung`
--
ALTER TABLE `bestellung`
  ADD PRIMARY KEY (`idbestellung`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`idreview`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `benutzerprofil`
--
ALTER TABLE `benutzerprofil`
  MODIFY `idprofil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2005;

--
-- AUTO_INCREMENT for table `bestellung`
--
ALTER TABLE `bestellung`
  MODIFY `idbestellung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `idreview` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
