-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2024 at 09:35 PM
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
-- Database: `eigene_filmverwaltung`
--

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

CREATE TABLE `films` (
  `idfilm` int(11) NOT NULL,
  `Filmtitel` varchar(50) NOT NULL,
  `erscheinungsdatum` date NOT NULL,
  `idprodfirma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `films`
--

INSERT INTO `films` (`idfilm`, `Filmtitel`, `erscheinungsdatum`, `idprodfirma`) VALUES
(3, 'Dirty Dancing', '1987-08-21', 2),
(4, 'Sister Act', '1992-05-29', 3),
(5, 'Harry Potter u. der Stein der Weisen', '2001-11-23', 4),
(6, 'Casanova', '2006-02-09', 3),
(7, 'Die unendliche Geschichte', '1984-05-20', 1),
(8, 'Die Welle', '2008-03-13', 1),
(9, 'Krieg in Chinatown', '1987-09-25', 2),
(10, 'I Am Legend', '2008-01-10', 4),
(11, 'Transcendence', '2014-04-18', 4),
(12, 'Bruce Allmächtig', '2003-06-12', 2),
(13, 'Ghost - Nachricht von Sam', '1990-07-13', 5);

-- --------------------------------------------------------

--
-- Table structure for table `film_schauspieler`
--

CREATE TABLE `film_schauspieler` (
  `idfilm` int(11) NOT NULL,
  `idschauspieler` int(11) NOT NULL,
  `Rolle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film_schauspieler`
--

INSERT INTO `film_schauspieler` (`idfilm`, `idschauspieler`, `Rolle`) VALUES
(6, 1, 'Casanova'),
(8, 2, 'Rainer Wenger'),
(3, 3, 'Dr. Jake Houseman'),
(11, 4, 'Joseph Tagger'),
(12, 4, 'Gott'),
(3, 5, 'Frances \"Baby\" Houseman'),
(3, 6, 'Johnny Castle'),
(13, 6, 'Sam'),
(3, 7, 'Penny Johnson'),
(10, 8, 'Robert Neville'),
(10, 9, 'Dr. Alice Krippin');

-- --------------------------------------------------------

--
-- Table structure for table `produktionsfirma`
--

CREATE TABLE `produktionsfirma` (
  `idprodfirma` int(11) NOT NULL,
  `Filmstudio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produktionsfirma`
--

INSERT INTO `produktionsfirma` (`idprodfirma`, `Filmstudio`) VALUES
(1, 'Bavaria Filmstudios'),
(2, 'Great American Films'),
(3, 'Touchstones Pictures'),
(4, 'Warner Brothers Pictures'),
(5, 'Paramount Pictures');

-- --------------------------------------------------------

--
-- Table structure for table `schauspieler`
--

CREATE TABLE `schauspieler` (
  `idSchauspieler` int(11) NOT NULL,
  `vorname` varchar(25) NOT NULL,
  `nachname` varchar(25) NOT NULL,
  `herkunftsland` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schauspieler`
--

INSERT INTO `schauspieler` (`idSchauspieler`, `vorname`, `nachname`, `herkunftsland`) VALUES
(1, 'Heath', 'Ledger', 'Australien'),
(2, 'Jürgen', 'Vogel', 'Deutschland'),
(3, 'Jerry', 'Orbach', 'USA'),
(4, 'Morgan', 'Freeman', 'USA'),
(5, 'Jennifer', 'Grey', 'USA'),
(6, 'Patrick', 'Swayze', 'USA'),
(7, 'Cynthia', 'Rhodes', 'USA'),
(8, 'Will', 'Smith', 'USA'),
(9, 'Emma', 'Thompson', 'England');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`idfilm`),
  ADD KEY `idprodfirma` (`idprodfirma`);

--
-- Indexes for table `produktionsfirma`
--
ALTER TABLE `produktionsfirma`
  ADD PRIMARY KEY (`idprodfirma`);

--
-- Indexes for table `schauspieler`
--
ALTER TABLE `schauspieler`
  ADD PRIMARY KEY (`idSchauspieler`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `films`
--
ALTER TABLE `films`
  MODIFY `idfilm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `produktionsfirma`
--
ALTER TABLE `produktionsfirma`
  MODIFY `idprodfirma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schauspieler`
--
ALTER TABLE `schauspieler`
  MODIFY `idSchauspieler` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
