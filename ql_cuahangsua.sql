-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2024 at 05:46 AM
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
-- Database: `ql_cuahangsua`
--

-- --------------------------------------------------------

--
-- Table structure for table `cthoadon`
--

CREATE TABLE `cthoadon` (
  `SOHOADON` varchar(5) NOT NULL,
  `MASUA` varchar(6) NOT NULL,
  `SOLUONG` int(11) NOT NULL,
  `DONGIA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hangsua`
--

CREATE TABLE `hangsua` (
  `MAHANGSUA` varchar(20) NOT NULL,
  `TENHANGSUA` varchar(100) DEFAULT NULL,
  `DIACHI` varchar(100) NOT NULL,
  `DIENTHOAI` varchar(20) NOT NULL,
  `EMAIL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE `hoadon` (
  `SOHOADON` varchar(5) NOT NULL,
  `NGAYHOADON` date NOT NULL,
  `MAKH` varchar(5) NOT NULL,
  `TRIGIA` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `MAKH` varchar(5) NOT NULL,
  `TENKH` varchar(100) DEFAULT NULL,
  `PHAI` tinyint(4) NOT NULL,
  `DIACHI` varchar(100) NOT NULL,
  `DIENTHOAI` varchar(12) NOT NULL,
  `EMAIL` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loaisua`
--

CREATE TABLE `loaisua` (
  `MALOAISUA` varchar(3) NOT NULL,
  `TENLOAI` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sua`
--

CREATE TABLE `sua` (
  `MASUA` varchar(6) NOT NULL,
  `TENSUA` varchar(100) DEFAULT NULL,
  `MAHANGSUA` varchar(20) DEFAULT NULL,
  `MALOAISUA` varchar(3) DEFAULT NULL,
  `TRONGLUONG` int(11) NOT NULL,
  `DONGIA` int(11) NOT NULL,
  `TPDINHDUONG` varchar(50) NOT NULL,
  `CONGDUNG` varchar(200) NOT NULL,
  `HINH` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cthoadon`
--
ALTER TABLE `cthoadon`
  ADD PRIMARY KEY (`SOHOADON`),
  ADD UNIQUE KEY `MASUA` (`MASUA`),
  ADD KEY `SOHOADON` (`SOHOADON`);

--
-- Indexes for table `hangsua`
--
ALTER TABLE `hangsua`
  ADD PRIMARY KEY (`MAHANGSUA`);

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD KEY `SOHOADON` (`SOHOADON`,`MAKH`),
  ADD KEY `MAKH` (`MAKH`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MAKH`);

--
-- Indexes for table `loaisua`
--
ALTER TABLE `loaisua`
  ADD PRIMARY KEY (`MALOAISUA`);

--
-- Indexes for table `sua`
--
ALTER TABLE `sua`
  ADD PRIMARY KEY (`MASUA`),
  ADD KEY `MAHANGSUA` (`MAHANGSUA`,`MALOAISUA`),
  ADD KEY `MALOAISUA` (`MALOAISUA`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cthoadon`
--
ALTER TABLE `cthoadon`
  ADD CONSTRAINT `cthoadon_ibfk_1` FOREIGN KEY (`MASUA`) REFERENCES `sua` (`MASUA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MAKH`) REFERENCES `khachhang` (`MAKH`),
  ADD CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`SOHOADON`) REFERENCES `cthoadon` (`SOHOADON`);

--
-- Constraints for table `sua`
--
ALTER TABLE `sua`
  ADD CONSTRAINT `sua_ibfk_1` FOREIGN KEY (`MALOAISUA`) REFERENCES `loaisua` (`MALOAISUA`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `sua_ibfk_2` FOREIGN KEY (`MAHANGSUA`) REFERENCES `hangsua` (`MAHANGSUA`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `sua_ibfk_3` FOREIGN KEY (`MALOAISUA`) REFERENCES `loaisua` (`MALOAISUA`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
