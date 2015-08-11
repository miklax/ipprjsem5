-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 07, 2015 at 07:22 PM
-- Server version: 5.6.24-0ubuntu2
-- PHP Version: 5.6.4-4ubuntu6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nrtd412`
--

-- --------------------------------------------------------

--
-- Table structure for table `dogadjaj`
--

CREATE TABLE IF NOT EXISTS `dogadjaj` (
`id_dogadjaj` int(11) NOT NULL,
  `naziv_dogadjaja` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `vreme_dogadjaja` datetime NOT NULL,
  `id_lokacija` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dogadjaj`
--

INSERT INTO `dogadjaj` (`id_dogadjaj`, `naziv_dogadjaja`, `vreme_dogadjaja`, `id_lokacija`) VALUES
(1, 'Koncert Pink Floyd', '2015-06-27 21:00:00', 1),
(2, 'Koncert Metallica', '2015-06-30 20:00:00', 2),
(5, 'Predavanje TED', '2015-07-02 13:00:00', 3),
(6, 'Party Talamasca', '2015-07-06 20:00:00', 4),
(7, 'Party Dino Psaras', '2015-06-28 23:00:00', 1),
(8, 'Koncert Pearl Jam', '2015-07-17 20:00:00', 2),
(9, 'Party Atmos', '2015-07-17 22:00:00', 2),
(10, 'Koncert Radiohead', '2015-07-18 21:00:00', 2),
(11, 'Koncert Slayer', '2015-07-19 22:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE IF NOT EXISTS `korisnik` (
`id_korisnika` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `id_lokacija` int(11) DEFAULT NULL,
  `levelacc` tinyint(4) NOT NULL,
  `odobren` tinyint(4) NOT NULL,
  `banlevel` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id_korisnika`, `username`, `password`, `first_name`, `last_name`, `email`, `id_lokacija`, `levelacc`, `odobren`, `banlevel`) VALUES
(3, 'mikla', 'mikla123', 'Mihail', 'Miklasevskij', 'mikla79@gmail.com', NULL, 2, 1, 0),
(4, 'admin', 'admin', 'Administrator', 'Sistema', 'admin@admin.com', NULL, 0, 1, 0),
(5, 'blagajnik', '123', 'Blagajnik', 'Sistema', 'blagajnik@nbs.rs', 2, 1, 1, 0),
(6, 'pera', 'pera', 'Predrag', 'Petrovic', 'pera@pera.com', NULL, 2, 0, 3),
(7, 'zika', 'zika', 'Ziles', 'Zmajus', 'ziles@ubicazmajeva.com', NULL, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mesto`
--

CREATE TABLE IF NOT EXISTS `mesto` (
`id_lokacija` int(11) NOT NULL,
  `naziv_lokacije` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `adresa` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `mesto` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mesto`
--

INSERT INTO `mesto` (`id_lokacija`, `naziv_lokacije`, `adresa`, `mesto`) VALUES
(1, 'Sava Centar', 'Milentija Popovića 9', 'Beograd'),
(2, 'Spens', 'Sutjeska 2', 'Novi Sad'),
(3, 'Dom Omladine', 'Makedonska 22', 'Beograd'),
(4, 'SKC', 'Kralja Milana 48', 'Beograd');

-- --------------------------------------------------------

--
-- Table structure for table `prodaja`
--

CREATE TABLE IF NOT EXISTS `prodaja` (
`id_prodaje` int(11) NOT NULL,
  `id_korisnika` int(11) NOT NULL,
  `datum_izdavanja` datetime NOT NULL,
  `rezervacija_prodaja` int(11) NOT NULL,
  `id_karte_dogadjaja` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `prodaja`
--

INSERT INTO `prodaja` (`id_prodaje`, `id_korisnika`, `datum_izdavanja`, `rezervacija_prodaja`, `id_karte_dogadjaja`) VALUES
(1, 3, '2015-06-24 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tip_karte_dogadjaja`
--

CREATE TABLE IF NOT EXISTS `tip_karte_dogadjaja` (
`id_karte_dogadjaja` int(11) NOT NULL,
  `id_dogadjaja` int(11) NOT NULL,
  `tip_karata` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `raspolozivo_karata` int(11) NOT NULL,
  `ukupno_karata` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tip_karte_dogadjaja`
--

INSERT INTO `tip_karte_dogadjaja` (`id_karte_dogadjaja`, `id_dogadjaja`, `tip_karata`, `raspolozivo_karata`, `ukupno_karata`) VALUES
(1, 1, 'Fan pit', 2000, 2000),
(2, 1, 'Normalne ulaznice', 25000, 25000),
(3, 2, 'Fan pit', 1000, 1000),
(4, 2, 'Normalne ulaznice', 30000, 30000),
(5, 2, 'VIP ulaznice', 5, 500),
(6, 5, 'prvi red', 50, 50),
(7, 5, 'normalne ulaznice', 245, 500),
(8, 6, 'normalne ulaznice', 230, 5000),
(9, 7, 'normalne ulaznice', 123, 4000),
(10, 5, 'Fan pit desno', 100, 150),
(12, 11, 'vip desno', 1500, 3000),
(13, 11, 'vip sredina', 1000, 2400),
(14, 11, 'Obicne karte', 5000, 12000),
(15, 11, 'backstage', 10, 30),
(16, 11, 'backstage', 10, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dogadjaj`
--
ALTER TABLE `dogadjaj`
 ADD PRIMARY KEY (`id_dogadjaj`), ADD KEY `id_lokacija` (`id_lokacija`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
 ADD PRIMARY KEY (`id_korisnika`), ADD KEY `id_lokacija` (`id_lokacija`);

--
-- Indexes for table `mesto`
--
ALTER TABLE `mesto`
 ADD PRIMARY KEY (`id_lokacija`);

--
-- Indexes for table `prodaja`
--
ALTER TABLE `prodaja`
 ADD PRIMARY KEY (`id_prodaje`), ADD KEY `id_korisnika` (`id_korisnika`,`id_karte_dogadjaja`), ADD KEY `id_karte_dogadjaja` (`id_karte_dogadjaja`);

--
-- Indexes for table `tip_karte_dogadjaja`
--
ALTER TABLE `tip_karte_dogadjaja`
 ADD PRIMARY KEY (`id_karte_dogadjaja`), ADD KEY `id_dogadjaja` (`id_dogadjaja`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dogadjaj`
--
ALTER TABLE `dogadjaj`
MODIFY `id_dogadjaj` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
MODIFY `id_korisnika` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mesto`
--
ALTER TABLE `mesto`
MODIFY `id_lokacija` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `prodaja`
--
ALTER TABLE `prodaja`
MODIFY `id_prodaje` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tip_karte_dogadjaja`
--
ALTER TABLE `tip_karte_dogadjaja`
MODIFY `id_karte_dogadjaja` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dogadjaj`
--
ALTER TABLE `dogadjaj`
ADD CONSTRAINT `dogadjaj_ibfk_1` FOREIGN KEY (`id_lokacija`) REFERENCES `mesto` (`id_lokacija`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
ADD CONSTRAINT `korisnik_ibfk_1` FOREIGN KEY (`id_lokacija`) REFERENCES `mesto` (`id_lokacija`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prodaja`
--
ALTER TABLE `prodaja`
ADD CONSTRAINT `prodaja_ibfk_1` FOREIGN KEY (`id_korisnika`) REFERENCES `korisnik` (`id_korisnika`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `prodaja_ibfk_2` FOREIGN KEY (`id_karte_dogadjaja`) REFERENCES `tip_karte_dogadjaja` (`id_karte_dogadjaja`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tip_karte_dogadjaja`
--
ALTER TABLE `tip_karte_dogadjaja`
ADD CONSTRAINT `tip_karte_dogadjaja_ibfk_1` FOREIGN KEY (`id_dogadjaja`) REFERENCES `dogadjaj` (`id_dogadjaj`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
