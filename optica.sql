-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2020 at 07:05 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `optica`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom_client` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefon` int(11) NOT NULL,
  `data_Registre` date NOT NULL,
  `adreca_postal` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id_client`, `nom_client`, `email`, `telefon`, `data_Registre`, `adreca_postal`) VALUES
(1, 'Sergio', 'nanook@sergio.com', 0, '2020-08-01', 'carrer sol 2'),
(3, 'Sergio3', 'nanook@sergio.com', 0, '2020-08-01', 'carrer mercuri 1'),
(22, 'Sergio2', 'nanook@sergio.com', 0, '2020-08-01', 'carrer lluna 2');

-- --------------------------------------------------------

--
-- Table structure for table `empleats`
--

CREATE TABLE `empleats` (
  `id_empleat` int(11) NOT NULL,
  `nom_empleat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `empleats`
--

INSERT INTO `empleats` (`id_empleat`, `nom_empleat`) VALUES
(1, 'andres del pino'),
(39, 'Antonio de Paz');

-- --------------------------------------------------------

--
-- Table structure for table `marca_ulleres`
--

CREATE TABLE `marca_ulleres` (
  `id_marca` int(11) NOT NULL,
  `marca_ulleres` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marca_ulleres`
--

INSERT INTO `marca_ulleres` (`id_marca`, `marca_ulleres`) VALUES
(1, 'rayban'),
(2, 'james dean'),
(3, 'ulleres bones');

-- --------------------------------------------------------

--
-- Table structure for table `proveidor`
--

CREATE TABLE `proveidor` (
  `id_proveidor` int(11) NOT NULL,
  `NIF` varchar(10) NOT NULL,
  `nom_proveidor` varchar(30) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `carrer` varchar(30) NOT NULL,
  `numero` int(11) NOT NULL,
  `pis` varchar(30) NOT NULL,
  `porta` varchar(30) NOT NULL,
  `ciutat` varchar(30) NOT NULL,
  `codi postal` int(11) NOT NULL,
  `pais` varchar(30) NOT NULL,
  `telefon` int(11) NOT NULL,
  `fax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proveidor`
--

INSERT INTO `proveidor` (`id_proveidor`, `NIF`, `nom_proveidor`, `id_marca`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi postal`, `pais`, `telefon`, `fax`) VALUES
(1, '000000', 'proveidor_rayban', 1, 'carrer de les rayban', 1, '2', '3', 'Barcino', 8808, 'Pais feliz', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `recomanacio`
--

CREATE TABLE `recomanacio` (
  `id_client_recomanador` int(11) NOT NULL,
  `id_client_recomanat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recomanacio`
--

INSERT INTO `recomanacio` (`id_client_recomanador`, `id_client_recomanat`) VALUES
(1, 22);

-- --------------------------------------------------------

--
-- Table structure for table `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(11) NOT NULL,
  `marca_ulleres` int(11) NOT NULL,
  `graduacio_1` int(11) NOT NULL,
  `graduacio_2` int(11) NOT NULL,
  `montura` enum('flotant','pasta','metal·lica','') NOT NULL,
  `color montura` varchar(30) NOT NULL,
  `color_vidre1` varchar(30) NOT NULL,
  `color_vidre2` varchar(30) NOT NULL,
  `preu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `marca_ulleres`, `graduacio_1`, `graduacio_2`, `montura`, `color montura`, `color_vidre1`, `color_vidre2`, `preu`) VALUES
(1, 1, 1, 2, 'flotant', 'verd', 'verd', 'verd', 11),
(2, 2, 2, 1, 'pasta', 'blau', 'blau', 'blau', 12);

-- --------------------------------------------------------

--
-- Table structure for table `venda_productes`
--

CREATE TABLE `venda_productes` (
  `id_venda` int(11) NOT NULL,
  `venuda_per_empleat` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_ulleres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venda_productes`
--

INSERT INTO `venda_productes` (`id_venda`, `venuda_per_empleat`, `id_client`, `id_ulleres`) VALUES
(1, 39, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indexes for table `marca_ulleres`
--
ALTER TABLE `marca_ulleres`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indexes for table `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id_proveidor`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indexes for table `recomanacio`
--
ALTER TABLE `recomanacio`
  ADD KEY `id_client_recomanador` (`id_client_recomanador`),
  ADD KEY `id_client_recomanat` (`id_client_recomanat`);

--
-- Indexes for table `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD KEY `marca_ulleres` (`marca_ulleres`);

--
-- Indexes for table `venda_productes`
--
ALTER TABLE `venda_productes`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `venuda_per_empleat` (`venuda_per_empleat`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_ulleres` (`id_ulleres`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `proveidor`
--
ALTER TABLE `proveidor`
  ADD CONSTRAINT `proveidor_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca_ulleres` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recomanacio`
--
ALTER TABLE `recomanacio`
  ADD CONSTRAINT `recomanacio_ibfk_1` FOREIGN KEY (`id_client_recomanador`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recomanacio_ibfk_2` FOREIGN KEY (`id_client_recomanat`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `importa_id_marca` FOREIGN KEY (`marca_ulleres`) REFERENCES `marca_ulleres` (`id_marca`);

--
-- Constraints for table `venda_productes`
--
ALTER TABLE `venda_productes`
  ADD CONSTRAINT `venda_productes_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venda_productes_ibfk_2` FOREIGN KEY (`id_ulleres`) REFERENCES `ulleres` (`id_ulleres`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venda_productes_ibfk_3` FOREIGN KEY (`venuda_per_empleat`) REFERENCES `empleats` (`id_empleat`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
