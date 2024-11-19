-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 05. Jul 2024 um 18:49
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_lap_wandertaxi`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_routen`
--

CREATE TABLE `tbl_routen` (
  `IDRoute` int(10) UNSIGNED NOT NULL,
  `Route` varchar(64) NOT NULL,
  `Beschreibung` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_routen`
--

INSERT INTO `tbl_routen` (`IDRoute`, `Route`, `Beschreibung`) VALUES
(1, 'Route 1', 'Linie 965'),
(2, 'Route 2', 'Linie 966 – nur in den Sommermonaten');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_routenfuehrung`
--

CREATE TABLE `tbl_routenfuehrung` (
  `IDRoutenfuehrung` int(10) UNSIGNED NOT NULL,
  `FIDRoute` int(10) UNSIGNED NOT NULL,
  `FIDStation` int(10) UNSIGNED NOT NULL,
  `Reihenfolge` tinyint(2) UNSIGNED NOT NULL,
  `isEndstation` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_routenfuehrung`
--

INSERT INTO `tbl_routenfuehrung` (`IDRoutenfuehrung`, `FIDRoute`, `FIDStation`, `Reihenfolge`, `isEndstation`) VALUES
(1, 1, 1, 0, 0),
(2, 1, 2, 1, 0),
(3, 1, 3, 2, 0),
(4, 1, 4, 3, 0),
(5, 1, 5, 4, 0),
(6, 1, 6, 5, 1),
(7, 1, 6, 6, 0),
(8, 1, 5, 7, 0),
(9, 1, 4, 8, 0),
(10, 1, 3, 9, 0),
(11, 1, 1, 10, 1),
(12, 2, 1, 0, 0),
(13, 2, 2, 1, 0),
(14, 2, 4, 2, 0),
(15, 2, 3, 3, 0),
(16, 2, 7, 4, 0),
(17, 2, 8, 5, 1),
(18, 2, 8, 6, 0),
(19, 2, 7, 7, 0),
(20, 2, 3, 8, 0),
(21, 2, 4, 9, 0),
(22, 2, 1, 10, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_routentage`
--

CREATE TABLE `tbl_routentage` (
  `IDRoutentag` int(10) UNSIGNED NOT NULL,
  `FIDRoute` int(10) UNSIGNED NOT NULL,
  `FIDWochentag_von` int(10) UNSIGNED NOT NULL,
  `FIDWochentag_bis` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_routentage`
--

INSERT INTO `tbl_routentage` (`IDRoutentag`, `FIDRoute`, `FIDWochentag_von`, `FIDWochentag_bis`) VALUES
(1, 1, 1, 4),
(2, 1, 5, 5),
(3, 1, 6, 7),
(4, 2, 1, 5),
(5, 2, 6, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_routentage_routenfuehrung`
--

CREATE TABLE `tbl_routentage_routenfuehrung` (
  `IDRoutentagRoutenfuehrung` int(10) UNSIGNED NOT NULL,
  `FIDRoutentag` int(10) UNSIGNED NOT NULL,
  `FIDRoutenfuehrung` int(10) UNSIGNED NOT NULL,
  `Uhrzeit` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_routentage_routenfuehrung`
--

INSERT INTO `tbl_routentage_routenfuehrung` (`IDRoutentagRoutenfuehrung`, `FIDRoutentag`, `FIDRoutenfuehrung`, `Uhrzeit`) VALUES
(1, 1, 1, '07:34:00'),
(2, 1, 2, '07:37:00'),
(3, 1, 3, '07:40:00'),
(4, 1, 4, '07:45:00'),
(5, 1, 5, '07:50:00'),
(6, 1, 6, '08:05:00'),
(7, 1, 7, '16:45:00'),
(8, 1, 8, '16:55:00'),
(9, 1, 9, '17:05:00'),
(10, 1, 10, '17:10:00'),
(11, 1, 11, '17:16:00'),
(12, 2, 1, '07:14:00'),
(13, 2, 2, '07:17:00'),
(14, 2, 3, '07:20:00'),
(15, 2, 4, '07:25:00'),
(16, 2, 5, '07:30:00'),
(17, 2, 6, '07:45:00'),
(18, 2, 7, '17:05:00'),
(19, 2, 8, '17:15:00'),
(20, 2, 9, '17:25:00'),
(21, 2, 10, '17:30:00'),
(22, 2, 11, '17:36:00'),
(23, 3, 1, '06:34:00'),
(24, 3, 2, '06:37:00'),
(25, 3, 3, '06:40:00'),
(26, 3, 4, '06:45:00'),
(27, 3, 5, '06:50:00'),
(28, 3, 6, '07:05:00'),
(29, 3, 7, '17:15:00'),
(30, 3, 8, '17:25:00'),
(31, 3, 9, '17:35:00'),
(32, 3, 10, '17:40:00'),
(33, 3, 11, '17:46:00'),
(34, 4, 12, '07:34:00'),
(35, 4, 13, '07:37:00'),
(36, 4, 14, '08:25:00'),
(37, 4, 15, '08:30:00'),
(38, 4, 16, '08:40:00'),
(39, 4, 17, '08:55:00'),
(40, 4, 18, '16:00:00'),
(41, 4, 19, '16:10:00'),
(42, 4, 20, '16:15:00'),
(43, 4, 21, '16:20:00'),
(44, 4, 22, '17:12:00'),
(45, 5, 12, '07:04:00'),
(46, 5, 13, '07:07:00'),
(47, 5, 14, '07:55:00'),
(48, 5, 15, '08:00:00'),
(49, 5, 16, '08:10:00'),
(50, 5, 17, '08:55:00'),
(51, 5, 18, '16:15:00'),
(52, 5, 19, '16:25:00'),
(53, 5, 20, '16:30:00'),
(54, 5, 21, '16:35:00'),
(55, 5, 22, '17:27:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_stationen`
--

CREATE TABLE `tbl_stationen` (
  `IDStation` int(10) UNSIGNED NOT NULL,
  `Station` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_stationen`
--

INSERT INTO `tbl_stationen` (`IDStation`, `Station`) VALUES
(4, 'Außervillgraten'),
(2, 'Heinfels'),
(3, 'Innervillgraten'),
(7, 'Maxer'),
(5, 'Reiterstube'),
(1, 'Silian'),
(8, 'Unterstalleralm'),
(6, 'Volkzeinerhütte');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_wochentage`
--

CREATE TABLE `tbl_wochentage` (
  `IDWochentag` int(10) UNSIGNED NOT NULL,
  `Wochentag` varchar(16) NOT NULL,
  `Kurzzeichen` varchar(2) NOT NULL,
  `Reihenfolge` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_wochentage`
--

INSERT INTO `tbl_wochentage` (`IDWochentag`, `Wochentag`, `Kurzzeichen`, `Reihenfolge`) VALUES
(1, 'Montag', 'Mo', 0),
(2, 'Dienstag', 'Di', 1),
(3, 'Mittwoch', 'Mi', 2),
(4, 'Donnerstag', 'Do', 3),
(5, 'Freitag', 'Fr', 4),
(6, 'Samstag', 'Sa', 5),
(7, 'Sonntag', 'So', 6);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_routen`
--
ALTER TABLE `tbl_routen`
  ADD PRIMARY KEY (`IDRoute`),
  ADD UNIQUE KEY `Route` (`Route`);

--
-- Indizes für die Tabelle `tbl_routenfuehrung`
--
ALTER TABLE `tbl_routenfuehrung`
  ADD PRIMARY KEY (`IDRoutenfuehrung`),
  ADD KEY `FIDOrt` (`FIDStation`),
  ADD KEY `FIDRoute` (`FIDRoute`);

--
-- Indizes für die Tabelle `tbl_routentage`
--
ALTER TABLE `tbl_routentage`
  ADD PRIMARY KEY (`IDRoutentag`),
  ADD UNIQUE KEY `FIDRoute` (`FIDRoute`,`FIDWochentag_von`),
  ADD KEY `FIDWochentag_bis` (`FIDWochentag_bis`),
  ADD KEY `FIDWochentag_von` (`FIDWochentag_von`);

--
-- Indizes für die Tabelle `tbl_routentage_routenfuehrung`
--
ALTER TABLE `tbl_routentage_routenfuehrung`
  ADD PRIMARY KEY (`IDRoutentagRoutenfuehrung`),
  ADD KEY `FIDRoutentag` (`FIDRoutentag`),
  ADD KEY `FIDRoutenfuehrung` (`FIDRoutenfuehrung`);

--
-- Indizes für die Tabelle `tbl_stationen`
--
ALTER TABLE `tbl_stationen`
  ADD PRIMARY KEY (`IDStation`),
  ADD UNIQUE KEY `Station` (`Station`);

--
-- Indizes für die Tabelle `tbl_wochentage`
--
ALTER TABLE `tbl_wochentage`
  ADD PRIMARY KEY (`IDWochentag`),
  ADD UNIQUE KEY `Wochentag` (`Wochentag`),
  ADD UNIQUE KEY `Kurzzeichen` (`Kurzzeichen`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_routen`
--
ALTER TABLE `tbl_routen`
  MODIFY `IDRoute` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `tbl_routenfuehrung`
--
ALTER TABLE `tbl_routenfuehrung`
  MODIFY `IDRoutenfuehrung` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT für Tabelle `tbl_routentage`
--
ALTER TABLE `tbl_routentage`
  MODIFY `IDRoutentag` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `tbl_routentage_routenfuehrung`
--
ALTER TABLE `tbl_routentage_routenfuehrung`
  MODIFY `IDRoutentagRoutenfuehrung` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT für Tabelle `tbl_stationen`
--
ALTER TABLE `tbl_stationen`
  MODIFY `IDStation` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `tbl_wochentage`
--
ALTER TABLE `tbl_wochentage`
  MODIFY `IDWochentag` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_routenfuehrung`
--
ALTER TABLE `tbl_routenfuehrung`
  ADD CONSTRAINT `tbl_routenfuehrung_ibfk_2` FOREIGN KEY (`FIDStation`) REFERENCES `tbl_stationen` (`IDStation`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_routenfuehrung_ibfk_3` FOREIGN KEY (`FIDRoute`) REFERENCES `tbl_routen` (`IDRoute`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_routentage`
--
ALTER TABLE `tbl_routentage`
  ADD CONSTRAINT `tbl_routentage_ibfk_1` FOREIGN KEY (`FIDRoute`) REFERENCES `tbl_routen` (`IDRoute`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_routentage_ibfk_2` FOREIGN KEY (`FIDWochentag_von`) REFERENCES `tbl_wochentage` (`IDWochentag`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_routentage_ibfk_3` FOREIGN KEY (`FIDWochentag_bis`) REFERENCES `tbl_wochentage` (`IDWochentag`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_routentage_routenfuehrung`
--
ALTER TABLE `tbl_routentage_routenfuehrung`
  ADD CONSTRAINT `tbl_routentage_routenfuehrung_ibfk_1` FOREIGN KEY (`FIDRoutentag`) REFERENCES `tbl_routentage` (`IDRoutentag`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_routentage_routenfuehrung_ibfk_2` FOREIGN KEY (`FIDRoutenfuehrung`) REFERENCES `tbl_routenfuehrung` (`IDRoutenfuehrung`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
