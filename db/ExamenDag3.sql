-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 21 jun 2023 om 09:59
-- Serverversie: 5.7.31
-- PHP-versie: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ExamenDag3`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Contact`
--

DROP TABLE IF EXISTS `Contact`;
CREATE TABLE IF NOT EXISTS `Contact` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Straat` varchar(100) NOT NULL,
  `Huisnummer` int(11) NOT NULL,
  `Toevoeging` varchar(5) DEFAULT NULL,
  `Postcode` varchar(6) NOT NULL,
  `Woonplaats` varchar(50) NOT NULL DEFAULT 'Maaskantje',
  `Email` varchar(100) NOT NULL,
  `Mobiel` varchar(13) DEFAULT '+31623456123',
  `IsActief` bit(1) NOT NULL DEFAULT b'0',
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Contact`
--

INSERT INTO `Contact` (`Id`, `Straat`, `Huisnummer`, `Toevoeging`, `Postcode`, `Woonplaats`, `Email`, `Mobiel`, `IsActief`, `Opmerking`, `AangemaaktOp`, `GewijzigdOp`) VALUES
(1, 'Prinses Irenestraat', 12, 'A', '5271TH', 'Maaskantje', 'j.van.zevenhuizen@gmail.com', '+31623456123', b'0', NULL, '2023-06-21 00:00:00', '2023-06-21 00:00:00'),
(2, 'Gibraltarstraat', 234, NULL, '5271TJ', 'Maaskantje', 'a.bergkamp@hotmail.com', '+31623456123', b'0', NULL, '2023-06-21 00:00:00', '2023-06-21 00:00:00'),
(3, 'Der Kinderenstraat', 456, 'bis', '5271TH', 'Maaskantje', 's.van.de.heuvel@gmail.com', '+31623456123', b'0', NULL, '2023-06-21 00:00:00', '2023-06-21 00:00:00'),
(4, 'Nachtegaalstraat', 233, 'A', '5271TJ', 'Maaskantje', 'e.scherder@gmail.com', '+31623456123', b'0', NULL, '2023-06-21 10:22:25', '2023-06-21 10:22:25'),
(5, 'Bertram Russellstraat', 45, NULL, '5271TH', 'Maaskantje', 'f.de.jong@hotmail.com', '+31623456123', b'0', NULL, '2023-06-21 10:22:25', '2023-06-21 10:22:25'),
(6, 'Leonardo Da VinciHof', 34, NULL, '5271ZE', 'Maaskantje', 'h.van.der.berg@gmail.com', '+31623456123', b'0', NULL, '2023-06-21 10:37:48', '2023-06-21 10:37:48'),
(7, 'Siegfried Knutsenlaan', 234, NULL, '5271ZE', 'Maaskantje', 'r.ter.weijden@gmail.com', '+31623456123', b'0', NULL, '2023-06-21 10:37:48', '2023-06-21 10:37:48'),
(8, 'Theo de Bokstraat', 256, NULL, '5271ZH', 'Maaskantje', 'l.pastoor@gmail.com', '+31623456123', b'0', NULL, '2023-06-21 10:37:48', '2023-06-21 10:37:48'),
(9, 'Meester van Leerhof', 2, 'A', '5271ZH', 'Maaskantje', 'm.yazidi@gemeenteutrecht.nl', '+31623456123', b'0', NULL, '2023-06-21 10:37:48', '2023-06-21 10:37:48'),
(10, 'Van Wemelenplantsoen', 300, '', '5271TH', 'Maaskantje', 'b.van.driel@gmail.com', '+31623456123', b'0', NULL, '2023-06-21 10:37:48', '2023-06-21 10:37:48'),
(11, 'Terlingenhof', 20, '', '5271TH', 'Maaskantje', 'j.pastorius@gmail.com', '+31623456356', b'0', NULL, '2023-06-21 10:37:48', '2023-06-21 10:37:48'),
(12, 'Veldhoen', 31, '', '5271ZE', 'Maaskantje', 's.dollaard@gmail.com', '+31623456314', b'0', NULL, '2023-06-21 10:37:48', '2023-06-21 10:37:48'),
(13, 'ScheringaDreef', 37, '', '5271ZE', 'Vught', 'j.blokker@gemeentevught.nl', '+31623456314', b'0', NULL, '2023-06-21 10:37:48', '2023-06-21 10:38:18');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ContactPerLeverancier`
--

DROP TABLE IF EXISTS `ContactPerLeverancier`;
CREATE TABLE IF NOT EXISTS `ContactPerLeverancier` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LeverancierId` int(11) NOT NULL,
  `ContactId` int(11) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'0',
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `LeverancierId` (`LeverancierId`),
  KEY `ContactId` (`ContactId`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `ContactPerLeverancier`
--

INSERT INTO `ContactPerLeverancier` (`Id`, `LeverancierId`, `ContactId`, `IsActief`, `Opmerking`, `AangemaaktOp`, `GewijzigdOp`) VALUES
(1, 1, 7, b'0', NULL, '2023-06-21 10:50:06', '2023-06-21 10:50:06'),
(2, 2, 8, b'0', NULL, '2023-06-21 10:50:06', '2023-06-21 10:50:06'),
(3, 3, 9, b'0', NULL, '2023-06-21 10:50:06', '2023-06-21 10:50:06'),
(4, 4, 10, b'0', NULL, '2023-06-21 10:50:06', '2023-06-21 10:50:06'),
(5, 6, 11, b'0', NULL, '2023-06-21 10:50:06', '2023-06-21 10:50:06'),
(6, 7, 12, b'0', NULL, '2023-06-21 10:50:06', '2023-06-21 10:50:06'),
(7, 8, 13, b'0', NULL, '2023-06-21 10:50:06', '2023-06-21 10:50:06');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Leverancier`
--

DROP TABLE IF EXISTS `Leverancier`;
CREATE TABLE IF NOT EXISTS `Leverancier` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) NOT NULL,
  `ContactPersoon` varchar(100) NOT NULL,
  `LeverancierNummer` varchar(5) NOT NULL,
  `LeverancierType` varchar(20) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'0',
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Leverancier`
--

INSERT INTO `Leverancier` (`Id`, `Naam`, `ContactPersoon`, `LeverancierNummer`, `LeverancierType`, `IsActief`, `Opmerking`, `AangemaaktOp`, `GewijzigdOp`) VALUES
(1, 'Albert Heijn', 'Ruud ter Weijden', 'L0001', 'Bedrijf', b'0', NULL, '2023-06-21 10:41:42', '2023-06-21 10:41:42'),
(2, 'Albertus Kerk', 'Leo Pastoor', 'L0002', 'Instelling', b'0', NULL, '2023-06-21 10:41:42', '2023-06-21 10:41:42'),
(3, 'Gemeente Utrecht', 'Mohammed Yazidi', 'L0003', 'Overheid', b'0', NULL, '2023-06-21 10:41:42', '2023-06-21 10:41:42'),
(4, 'Boerderij Meerhoven', 'Bertus van Driel', 'L0004', 'Particulier', b'0', NULL, '2023-06-21 10:41:42', '2023-06-21 10:41:42'),
(5, 'Jan van der Heijden', 'Jan van der Heijden', 'L0005', 'Donor', b'0', NULL, '2023-06-21 10:41:42', '2023-06-21 10:41:42'),
(6, 'Vomar', 'Jaco Pastorius', 'L0006', 'Bedrijf', b'0', NULL, '2023-06-21 10:41:42', '2023-06-21 10:41:42'),
(7, 'DekaMarkt', 'Sil den Dollaard', 'L0007', 'Bedrijf', b'0', NULL, '2023-06-21 10:41:42', '2023-06-21 10:41:42'),
(8, 'Gemeente Vught', 'Jan Blokker', 'L0008', 'Overheid', b'0', NULL, '2023-06-21 10:41:42', '2023-06-21 10:41:42');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Product`
--

DROP TABLE IF EXISTS `Product`;
CREATE TABLE IF NOT EXISTS `Product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductCategorieId` int(11) NOT NULL,
  `Naam` varchar(20) NOT NULL,
  `SoortAllergie` varchar(20) DEFAULT NULL,
  `Barcode` varchar(13) NOT NULL,
  `Houdbaarheidsdatum` date NOT NULL,
  `Omschrijving` varchar(30) NOT NULL,
  `Status` varchar(22) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'0',
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Product`
--

INSERT INTO `Product` (`Id`, `ProductCategorieId`, `Naam`, `SoortAllergie`, `Barcode`, `Houdbaarheidsdatum`, `Omschrijving`, `Status`, `IsActief`, `Opmerking`, `AangemaaktOp`, `GewijzigdOp`) VALUES
(1, 1, 'Aardappel', NULL, '8719587321239', '2023-06-12', 'Kruimige aardappel', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(2, 1, 'Ui', NULL, '8719437321335', '2023-05-02', 'Gele ui', 'NietOpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(3, 1, 'Appel', NULL, '8719486321332', '2023-09-16', 'Granny Smith', 'NietLeverbaar', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(4, 1, 'Banaan', 'Banaan', '8719484321336', '2023-04-12', 'Biologische Banaan', 'OverHoudbaarheidsDatum', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(5, 2, 'Kaas', 'Lactose', '8719487421338', '2023-07-19', 'Jonge Kaas', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(6, 2, 'Rosbief', NULL, '8719487421331', '2023-08-23', 'Rundvlees', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(7, 3, 'Melk', 'Lactose', '8719447321332', '2023-08-23', 'Halfvolle melk', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(8, 3, 'Margarine', NULL, '8719486321336', '2023-07-02', 'Plantaardige boter', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(9, 3, 'Ei', 'Eier', '8719487421334', '2023-02-04', 'Scharrelei', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(10, 4, 'Brood', 'Gluten', '8719487721337', '2023-05-07', 'Volkoren brood', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(11, 4, 'Gevulde Koek', 'Amandel', '8719483321333', '2023-05-04', 'Banketbakkers kwaliteit', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(12, 5, 'Fristi', 'Lactose', '8719487121331', '2023-05-28', 'Frisdrank', 'NietOpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(13, 5, 'Appelsap', NULL, '8719487521335', '2023-05-19', '100% vruchtensap', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(14, 5, 'Koffie', 'Caffeïne', '8719487381338', '2023-05-23', 'Arabica koffie', 'OverHoudbaarheidsDatum', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(15, 5, 'Thee', 'Theïne', '8719487329339', '2023-04-02', 'Ceylon thee', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(16, 6, 'Pasta', 'Gluten', '8719487321334', '2023-05-16', 'Macaroni', 'NietLeverbaar', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(17, 6, 'Rijst', NULL, '8719487331332', '2023-05-25', 'Basmati Rijst', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(18, 6, 'Knorr Nasi Mix', NULL, '8719487351354', '2023-05-13', 'Nasi kruiden', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(19, 7, 'Tomatensoep', NULL, '8719487371337', '2023-05-23', 'Romige tomatensoep', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(20, 7, 'Tomatensaus', NULL, '8719487341334', '2023-05-21', 'Pizza saus', 'NietOpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(21, 7, 'Peterselie', NULL, '8719487321636', '2023-05-31', 'Verse kruidenpot', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(22, 8, 'Olie', NULL, '8719487327337', '2023-05-27', 'Olijfolie', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(23, 8, 'Mars', NULL, '8719487324334', '2023-05-11', 'Snoep', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(24, 8, 'Biscuit', NULL, '8719487311331', '2023-05-07', 'San Francisco biscuit', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(25, 8, 'Paprika Chips', NULL, '8719487321839', '2023-05-22', 'Ribbelchips paprika', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(26, 8, 'Chocolade reep', 'Cacoa', '8719487321533', '2023-05-21', 'Tony Chocolonely', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(27, 9, 'Luier', NULL, '8719487321436', '2023-05-30', 'Baby luier', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(28, 9, 'Scheerschuim', NULL, '8719487323338', '2023-02-22', 'Verzorgende scheerschuim', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28'),
(29, 9, 'Toiletpapier', NULL, '8719487321535', '2023-01-02', '24 rollen 3 laags toiletpapier', 'OpVoorraad', b'0', NULL, '2023-06-21 10:46:28', '2023-06-21 10:46:28');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ProductPerLeverancier`
--

DROP TABLE IF EXISTS `ProductPerLeverancier`;
CREATE TABLE IF NOT EXISTS `ProductPerLeverancier` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LeverancierId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `DatumAangeleverd` date NOT NULL,
  `DatumEerstVolgendeLevering` date NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'0',
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `LeverancierId` (`LeverancierId`),
  KEY `ProductId` (`ProductId`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `ProductPerLeverancier`
--

INSERT INTO `ProductPerLeverancier` (`Id`, `LeverancierId`, `ProductId`, `DatumAangeleverd`, `DatumEerstVolgendeLevering`, `IsActief`, `Opmerking`, `AangemaaktOp`, `GewijzigdOp`) VALUES
(1, 4, 1, '2023-04-12', '2023-05-12', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(2, 4, 2, '2023-03-02', '2023-04-02', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(3, 2, 3, '2023-07-16', '2023-08-16', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(4, 1, 4, '2023-02-12', '2023-03-12', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(5, 4, 5, '2023-05-19', '2023-06-19', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(6, 1, 6, '2023-06-23', '2023-07-23', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(7, 4, 7, '2023-06-20', '2023-07-20', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(8, 4, 8, '2023-05-02', '2023-06-02', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(9, 4, 9, '2022-12-04', '2023-01-04', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(10, 3, 10, '2023-03-07', '2023-04-07', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(11, 3, 11, '2023-02-04', '2023-03-04', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(12, 3, 12, '2023-02-28', '2023-03-28', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(13, 3, 13, '2023-03-19', '2023-04-19', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(14, 2, 14, '2023-03-23', '2023-04-23', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(15, 2, 15, '2023-02-02', '2023-03-02', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(16, 1, 16, '2023-02-16', '2023-03-16', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(17, 1, 17, '2023-03-25', '2023-04-25', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(18, 1, 18, '2023-03-13', '2023-04-13', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(19, 1, 19, '2023-03-23', '2023-04-23', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(20, 4, 20, '2023-02-21', '2023-03-21', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(21, 2, 21, '2023-03-31', '2023-04-30', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(22, 1, 22, '2023-03-27', '2023-04-27', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(23, 3, 23, '2023-04-11', '2023-04-18', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(24, 3, 24, '2023-04-07', '2023-04-14', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(25, 1, 25, '2023-05-07', '2023-05-14', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(26, 2, 26, '2023-05-05', '2023-05-12', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(27, 1, 27, '2023-05-02', '2023-05-09', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(28, 4, 28, '2022-12-22', '2023-01-22', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04'),
(29, 4, 29, '2022-12-12', '2023-01-19', b'0', NULL, '2023-06-21 10:49:04', '2023-06-21 10:49:04');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
