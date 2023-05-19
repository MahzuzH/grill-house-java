-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2022 at 10:55 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tokodaging`
--

-- --------------------------------------------------------

--
-- Table structure for table `daging`
--

CREATE TABLE `daging` (
  `kode_daging` varchar(5) NOT NULL,
  `bagian_daging` varchar(20) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `stok` int(3) NOT NULL,
  `harga` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daging`
--

INSERT INTO `daging` (`kode_daging`, `bagian_daging`, `grade`, `stok`, `harga`) VALUES
('RIBA1', 'Rib Eye', 'A1', 31, 180000),
('RIBA2', 'Rib Eye', 'A2', 38, 500000),
('RIBA3', 'Rib Eye', 'A3', 36, 1100000),
('RIBA5', 'Rib Eye', 'A5', 88, 2400000),
('SIRA1', 'Sirloin', 'A1', 60, 100000),
('SIRA2', 'Sirloin', 'A2', 108, 350000),
('SIRA3', 'Sirloin', 'A3', 37, 800000),
('SIRA4', 'Sirloin', 'A4', 118, 1000000),
('SIRA5', 'Sirloin', 'A5', 90, 1800000),
('TENA1', 'Tenderloin', 'A1', 86, 150000),
('TENA2', 'Tenderloin', 'A2', 112, 450000),
('TENA3', 'Tenderloin', 'A3', 30, 900000),
('TENA4', 'Tenderloin', 'A4', 36, 1500000),
('TENA5', 'Tenderloin', 'A5', 64, 2000000),
('TOMA1', 'Tomahawk', 'A1', 50, 250000),
('TOMA2', 'Tomahawk', 'A2', 49, 750000),
('TOMA3', 'Tomahawk', 'A3', 51, 1500000),
('TOMA4', 'Tomahawk', 'A4', 91, 2400000),
('TOMA5', 'Tomahawk', 'A5', 89, 3000000);

-- --------------------------------------------------------

--
-- Table structure for table `kematangan`
--

CREATE TABLE `kematangan` (
  `id_kematangan` varchar(5) NOT NULL,
  `tingkat_kematangan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kematangan`
--

INSERT INTO `kematangan` (`id_kematangan`, `tingkat_kematangan`) VALUES
('00003', 'Medium'),
('00002', 'Medium Rare'),
('00004', 'Medium Well'),
('00001', 'Rare'),
('00005', 'Well Done');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(5) NOT NULL,
  `username` varchar(25) NOT NULL,
  `kode_daging` varchar(5) NOT NULL,
  `tingkat_kematangan` varchar(25) NOT NULL,
  `harga` int(50) NOT NULL,
  `stok` int(5) NOT NULL,
  `total` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `username`, `kode_daging`, `tingkat_kematangan`, `harga`, `stok`, `total`) VALUES
(4, '5', 'SIRA1', 'Rare', 100000, 1, 100000),
(6, '5', 'SIRA1', 'Medium', 100000, 5, 500000),
(9, '5', 'TENA2', 'Medium Rare', 450000, 1, 450000),
(10, '5', 'SIRA2', 'Rare', 350000, 1, 350000),
(11, '5', 'TENA3', 'Medium Rare', 900000, 1, 900000),
(13, '5', 'TENA2', 'Rare', 450000, 1, 450000),
(14, '5', 'SIRA2', 'Medium Rare', 350000, 1, 350000),
(15, '5', 'TOMA3', 'Medium Rare', 1500000, 1, 1500000),
(17, '5', 'TENA2', 'Medium Rare', 450000, 1, 450000),
(18, '5', 'RIBA2', 'Rare', 500000, 1, 500000),
(19, '5', 'RIBA2', 'Medium Rare', 500000, 1, 500000),
(21, '5', 'TENA3', 'Rare', 900000, 1, 900000),
(22, '5', 'SIRA1', 'Rare', 100000, 1, 100000),
(23, '5', 'TENA2', 'Rare', 450000, 1, 450000),
(25, '5', 'SIRA1', 'Rare', 100000, 1, 100000),
(33, '5', 'SIRA1', 'Rare', 100000, 1, 100000),
(34, '5', 'SIRA2', 'Medium', 350000, 1, 350000),
(35, '5', 'SIRA1', 'Medium', 100000, 10, 1000000),
(36, '7', 'TENA1', 'Rare', 150000, 1, 150000),
(37, '7', 'TENA2', 'Medium Rare', 450000, 1, 450000),
(44, '5', 'RIBA5', 'Medium', 2400000, 1, 2400000),
(45, '5', 'TENA2', 'Rare', 450000, 1, 450000),
(46, '5', 'TENA2', 'Rare', 450000, 1, 450000),
(47, 'djoes', 'SIRA1', 'Rare', 100000, 1, 100000),
(48, 'djoes', 'TENA2', 'Rare', 450000, 1, 450000),
(49, 'djoes', 'TOMA2', 'Rare', 3000000, 4, 3000000),
(50, '5', 'TOMA2', 'Medium', 2400000, 4, 9600000),
(52, 'djoes', 'TOMA2', 'Medium Rare', 3000000, 4, 12000000),
(53, 'djoes', 'TOMA5', 'Well Done', 3000000, 4, 12000000),
(54, 'djoes', 'TOMA5', 'Well Done', 3000000, 4, 12000000),
(55, 'jos', 'SIRA2', 'Medium', 350000, 2, 700000),
(56, 'jos', 'RIBA3', 'Well Done', 1100000, 1, 1100000),
(57, 'jos', 'SIRA2', 'Medium', 350000, 2, 700000),
(58, 'jos', 'RIBA3', 'Medium Well', 1100000, 1, 1100000),
(59, 'jos', 'RIBA3', 'Medium Well', 1100000, 1, 1100000),
(60, 'jos', 'SIRA2', 'Medium', 350000, 2, 700000),
(61, 'jos', 'RIBA3', 'Medium', 1100000, 1, 1100000),
(64, 'jus', 'SIRA1', 'Rare', 100000, 1, 100000),
(65, 'jus', 'TENA3', 'Rare', 900000, 1, 900000),
(66, 'jus', 'TENA1', 'Medium Rare', 150000, 1, 150000),
(67, 'jus', 'TOMA2', 'Medium', 750000, 1, 750000),
(68, 'jus', 'SIRA1', 'Rare', 100000, 1, 100000);

--
-- Triggers `transaksi`
--
DELIMITER $$
CREATE TRIGGER `updateStok` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN
	UPDATE daging SET stok = stok - NEW.stok WHERE kode_daging = new.kode_daging;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `userpass`
--

CREATE TABLE `userpass` (
  `no_akun` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` enum('admin','pelanggan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userpass`
--

INSERT INTO `userpass` (`no_akun`, `username`, `password`, `role`) VALUES
(1, 'mahzuz', 'mahzuz', 'admin'),
(2, '2', '2', 'admin'),
(3, '1', '1', 'admin'),
(5, 'djoes', 'djoes', 'pelanggan'),
(9, '5', '5', 'pelanggan'),
(10, 'juice', 'juice', 'pelanggan'),
(16, '6', '6', 'admin'),
(17, '7', '7', 'pelanggan'),
(23, 'jos', 'jos', 'pelanggan'),
(25, 'jus', 'jus', 'pelanggan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daging`
--
ALTER TABLE `daging`
  ADD PRIMARY KEY (`kode_daging`),
  ADD KEY `harga` (`harga`);

--
-- Indexes for table `kematangan`
--
ALTER TABLE `kematangan`
  ADD PRIMARY KEY (`id_kematangan`),
  ADD KEY `tingkat_kematangan` (`tingkat_kematangan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `username` (`username`),
  ADD KEY `transaksi_ibfk_1` (`kode_daging`),
  ADD KEY `transaksi_ibfk_4` (`tingkat_kematangan`),
  ADD KEY `transaksi_ibfk_5` (`harga`);

--
-- Indexes for table `userpass`
--
ALTER TABLE `userpass`
  ADD PRIMARY KEY (`no_akun`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `userpass`
--
ALTER TABLE `userpass`
  MODIFY `no_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kode_daging`) REFERENCES `daging` (`kode_daging`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`username`) REFERENCES `userpass` (`username`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`tingkat_kematangan`) REFERENCES `kematangan` (`tingkat_kematangan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_5` FOREIGN KEY (`harga`) REFERENCES `daging` (`harga`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
