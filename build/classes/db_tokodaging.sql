-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2022 at 05:59 AM
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
('SIRA1', 'Sirloin', 'A1', 100, 100000),
('SIRA2', 'Sirloin', 'A2', 20, 350000);

-- --------------------------------------------------------

--
-- Table structure for table `kematangan`
--

CREATE TABLE `kematangan` (
  `id_kematangan` varchar(5) NOT NULL,
  `tingkat_kematangan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `jumlah` int(5) NOT NULL,
  `total` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD KEY `kode_daging` (`kode_daging`),
  ADD KEY `harga` (`harga`),
  ADD KEY `username` (`username`),
  ADD KEY `tingkat_kematangan` (`tingkat_kematangan`);

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
  MODIFY `id_transaksi` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpass`
--
ALTER TABLE `userpass`
  MODIFY `no_akun` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kode_daging`) REFERENCES `daging` (`kode_daging`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`harga`) REFERENCES `daging` (`harga`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`username`) REFERENCES `userpass` (`username`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`tingkat_kematangan`) REFERENCES `kematangan` (`tingkat_kematangan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
