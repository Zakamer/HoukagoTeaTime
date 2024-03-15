-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2023 at 04:54 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_si_silalahi`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_barang` varchar(18) NOT NULL,
  `nama_barang` varchar(64) NOT NULL,
  `satuan` varchar(18) NOT NULL,
  `harga_jual` decimal(12,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_barang`, `nama_barang`, `satuan`, `harga_jual`, `stok`, `created_at`, `updated_at`) VALUES
('BR0001', 'Beras Ramos Krg', 'Karung', '15000.00', 115, '2023-07-30 22:14:16', '2023-09-11 21:51:43'),
('BR0002', 'Beras Ramos Kg', 'Kg', '10000.00', 95, '2023-07-30 22:14:59', '2023-09-11 20:31:02'),
('BR0003', 'Gudang Garam Slop', 'Slop', '25000.00', 135, '2023-07-30 22:15:18', '2023-09-11 20:24:10'),
('BR0004', 'Gudang garam Bks', 'Bks', '23000.00', 0, '2023-07-30 22:45:22', '2023-09-09 20:06:15'),
('BR0005', 'Aqua Gelas Box', 'box', '16500.00', 125, '2023-07-31 00:28:18', '2023-09-11 21:52:23'),
('BR0006', 'Aqua Gelas Pcs', 'Pcs', '450.00', 0, '2023-07-31 00:29:20', '2023-09-09 20:06:15'),
('BR0007', 'Le Mineral 600ml', 'box', '23000.00', 135, '2023-08-25 19:31:42', '2023-09-11 20:24:10'),
('BR0008', 'Le Mineral 600ml', 'Pcs', '11100.00', 0, '2023-08-25 19:37:45', '2023-08-25 19:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_konversi`
--

CREATE TABLE `tbl_konversi` (
  `id_konversi` varchar(18) NOT NULL,
  `id_brg_sumber` varchar(18) NOT NULL,
  `id_brg_tujuan` varchar(18) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl` datetime NOT NULL,
  `rasio1` int(11) NOT NULL,
  `rasio2` int(11) NOT NULL,
  `qty_sumber` int(11) NOT NULL,
  `stok_sumber_awal` int(11) NOT NULL,
  `qty_tujuan` int(11) NOT NULL,
  `stok_awal_tujuan` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_konversi`
--

INSERT INTO `tbl_konversi` (`id_konversi`, `id_brg_sumber`, `id_brg_tujuan`, `id_user`, `tgl`, `rasio1`, `rasio2`, `qty_sumber`, `stok_sumber_awal`, `qty_tujuan`, `stok_awal_tujuan`, `created_at`, `updated_at`) VALUES
('KV2309110001', 'BR0001', 'BR0002', 1, '2023-09-11 20:29:57', 1, 10, 10, 135, 100, 0, '2023-09-11 20:29:57', '2023-09-11 20:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `id_pel` varchar(36) NOT NULL,
  `nm_pel` varchar(64) NOT NULL,
  `kontak` varchar(36) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`id_pel`, `nm_pel`, `kontak`, `alamat`, `created_at`, `updated_at`) VALUES
('1', 'anonim', '-', '-', '2023-08-02 00:00:00', '2023-08-02 00:00:00'),
('PL0001', 'PL0001', 'PL0001', 'PL0001', '2023-08-16 00:00:00', '2023-08-09 00:00:00'),
('PL0002', 'Rina Mose', '0821334123', 'Jln Jambu', '2023-07-30 23:24:22', '2023-07-30 23:24:22'),
('PL0003', 'asdasd', 'asdasd', 'asdasd', '2023-08-25 19:38:46', '2023-08-25 19:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pemasok`
--

CREATE TABLE `tbl_pemasok` (
  `id_pemasok` varchar(36) NOT NULL,
  `nm_pemasok` varchar(36) NOT NULL,
  `kontak` varchar(36) NOT NULL,
  `nm_kontak` varchar(64) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pemasok`
--

INSERT INTO `tbl_pemasok` (`id_pemasok`, `nm_pemasok`, `kontak`, `nm_kontak`, `alamat`, `created_at`, `updated_at`) VALUES
('PS0001', 'PT. Nusa Indah', '0888212331', 'Isra', 'Pematangsiantar', '2023-08-25 00:00:00', '2023-08-16 00:00:00'),
('PS0002', 'UD. Sinar Berkah', '0219877182', 'Rizky', 'Tebingtinggi', '2023-07-29 22:47:40', '2023-07-30 19:47:12'),
('PS0003', 'asd', 'asda', 'asdasd', 'asdasd', '2023-08-25 19:36:40', '2023-08-25 19:36:40');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembelian`
--

CREATE TABLE `tbl_pembelian` (
  `id_pem` varchar(18) NOT NULL,
  `id_pemasok` varchar(36) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `tgl` datetime NOT NULL,
  `ket` text NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pembelian`
--

INSERT INTO `tbl_pembelian` (`id_pem`, `id_pemasok`, `id_user`, `tgl`, `ket`, `total`, `created_at`, `updated_at`) VALUES
('PB2307110001', 'PS0001', 1, '2023-07-11 18:16:32', '-', '150000000.00', '2023-09-11 18:16:32', '2023-09-11 18:16:32'),
('PB2307110002', 'PS0002', 1, '2023-07-11 18:17:07', '-', '13000000.00', '2023-09-11 18:17:07', '2023-09-11 18:17:07'),
('PB2307110003', 'PS0001', 1, '2023-07-11 18:19:51', '-', '1850000.00', '2023-09-11 18:19:51', '2023-09-11 18:19:51'),
('PB2307110004', 'PS0002', 1, '2023-07-11 18:22:41', '-', '2150000.00', '2023-09-11 18:22:41', '2023-09-11 18:22:41'),
('PB2308110005', 'PS0001', 1, '2023-08-11 18:24:24', '-', '83500000.00', '2023-09-11 18:24:24', '2023-09-11 18:24:24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembelian_dit`
--

CREATE TABLE `tbl_pembelian_dit` (
  `id_pem_dit` int(12) NOT NULL,
  `id_pem` varchar(18) NOT NULL,
  `id_barang` varchar(18) NOT NULL,
  `qty` int(11) NOT NULL,
  `stok_awal` int(11) NOT NULL,
  `harga` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pembelian_dit`
--

INSERT INTO `tbl_pembelian_dit` (`id_pem_dit`, `id_pem`, `id_barang`, `qty`, `stok_awal`, `harga`) VALUES
(84, 'PB2307110001', 'BR0001', 100, 0, '1500000.00'),
(85, 'PB2307110002', 'BR0003', 100, 0, '130000.00'),
(86, 'PB2307110003', 'BR0007', 100, 0, '18500.00'),
(87, 'PB2307110004', 'BR0005', 100, 0, '21500.00'),
(88, 'PB2308110005', 'BR0001', 50, 95, '1500000.00'),
(89, 'PB2308110005', 'BR0003', 50, 95, '130000.00'),
(90, 'PB2308110005', 'BR0005', 50, 95, '18500.00'),
(91, 'PB2308110005', 'BR0007', 50, 95, '21500.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan`
--

CREATE TABLE `tbl_penjualan` (
  `id_pen` varchar(18) NOT NULL,
  `id_pel` varchar(36) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `tgl` datetime NOT NULL,
  `ket` text NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penjualan`
--

INSERT INTO `tbl_penjualan` (`id_pen`, `id_pel`, `id_user`, `tgl`, `ket`, `total`, `created_at`, `updated_at`) VALUES
('PJ2307250001', '1', 1, '2023-07-25 19:32:21', '-', '397500.00', '2023-09-11 19:32:21', '2023-09-11 19:32:21'),
('PJ2308110002', 'PL0002', 1, '2023-08-11 20:24:10', '-', '795000.00', '2023-09-11 20:24:10', '2023-09-11 20:24:10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan_dit`
--

CREATE TABLE `tbl_penjualan_dit` (
  `id_pen_dit` int(12) NOT NULL,
  `id_pen` varchar(18) NOT NULL,
  `id_barang` varchar(18) NOT NULL,
  `qty` int(11) NOT NULL,
  `stok_awal` int(11) NOT NULL,
  `harga` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penjualan_dit`
--

INSERT INTO `tbl_penjualan_dit` (`id_pen_dit`, `id_pen`, `id_barang`, `qty`, `stok_awal`, `harga`) VALUES
(108, 'PJ2307250001', 'BR0001', 5, 100, '15000.00'),
(109, 'PJ2307250001', 'BR0003', 5, 100, '25000.00'),
(110, 'PJ2307250001', 'BR0005', 5, 100, '16500.00'),
(111, 'PJ2307250001', 'BR0007', 5, 100, '23000.00'),
(112, 'PJ2308110002', 'BR0001', 10, 145, '15000.00'),
(113, 'PJ2308110002', 'BR0003', 10, 145, '25000.00'),
(114, 'PJ2308110002', 'BR0005', 10, 145, '16500.00'),
(115, 'PJ2308110002', 'BR0007', 10, 145, '23000.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penyesuaian`
--

CREATE TABLE `tbl_penyesuaian` (
  `id` int(11) NOT NULL,
  `id_barang` varchar(64) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `tgl` datetime NOT NULL,
  `stok_awal` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `stok_akhir` int(11) NOT NULL,
  `harga_awal` decimal(12,2) NOT NULL,
  `harga_ubah` decimal(12,2) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penyesuaian`
--

INSERT INTO `tbl_penyesuaian` (`id`, `id_barang`, `id_user`, `tgl`, `stok_awal`, `qty`, `stok_akhir`, `harga_awal`, `harga_ubah`, `keterangan`) VALUES
(1, 'BR0002', 1, '2023-09-11 20:31:02', 100, -5, 95, '10000.00', '10000.00', 'di gigit tikus');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_retur`
--

CREATE TABLE `tbl_retur` (
  `id_retur` varchar(18) NOT NULL,
  `id_pem` varchar(18) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `tgl` datetime NOT NULL,
  `ket` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_retur`
--

INSERT INTO `tbl_retur` (`id_retur`, `id_pem`, `id_user`, `tgl`, `ket`, `created_at`, `updated_at`) VALUES
('RT2309110001', 'PB2307110001', 1, '2023-09-11 21:51:43', '-', '2023-09-11 21:51:43', '2023-09-11 21:51:43'),
('RT2309110002', 'PB2307110004', 1, '2023-09-11 21:52:23', '-', '2023-09-11 21:52:23', '2023-09-11 21:52:23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_retur_dit`
--

CREATE TABLE `tbl_retur_dit` (
  `id_ret_dit` int(12) NOT NULL,
  `id_retur` varchar(18) NOT NULL,
  `id_barang` varchar(18) NOT NULL,
  `qty` int(11) NOT NULL,
  `stok_awal` int(11) NOT NULL,
  `harga` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_retur_dit`
--

INSERT INTO `tbl_retur_dit` (`id_ret_dit`, `id_retur`, `id_barang`, `qty`, `stok_awal`, `harga`) VALUES
(12, 'RT2309110001', 'BR0001', 10, 125, '10.00'),
(13, 'RT2309110002', 'BR0005', 10, 135, '10.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `lvl` varchar(30) NOT NULL,
  `psw` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `lvl`, `psw`, `created_at`, `updated_at`) VALUES
(1, 'pemilik123', 'pemilik', 'pemilik123', '2023-07-29 00:00:00', '2023-07-29 00:00:00'),
(4, 'samsul1234', 'admin', 'samsul1234', '2023-07-29 23:59:00', '2023-08-05 19:54:16'),
(5, 'mutia123', 'user', 'mutia123', '2023-08-05 10:55:09', '2023-08-05 10:55:09'),
(6, 'jakie12381', 'user', 'jakie12381', '2023-08-05 19:54:43', '2023-08-05 19:54:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tbl_konversi`
--
ALTER TABLE `tbl_konversi`
  ADD PRIMARY KEY (`id_konversi`),
  ADD KEY `id_brg_sumber` (`id_brg_sumber`),
  ADD KEY `id_brg_tujuan` (`id_brg_tujuan`),
  ADD KEY `Id_user` (`id_user`);

--
-- Indexes for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`id_pel`);

--
-- Indexes for table `tbl_pemasok`
--
ALTER TABLE `tbl_pemasok`
  ADD PRIMARY KEY (`id_pemasok`);

--
-- Indexes for table `tbl_pembelian`
--
ALTER TABLE `tbl_pembelian`
  ADD PRIMARY KEY (`id_pem`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_pemasok` (`id_pemasok`);

--
-- Indexes for table `tbl_pembelian_dit`
--
ALTER TABLE `tbl_pembelian_dit`
  ADD PRIMARY KEY (`id_pem_dit`),
  ADD KEY `id_pem` (`id_pem`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD PRIMARY KEY (`id_pen`),
  ADD KEY `id_pel` (`id_pel`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tbl_penjualan_dit`
--
ALTER TABLE `tbl_penjualan_dit`
  ADD PRIMARY KEY (`id_pen_dit`),
  ADD KEY `id_pen` (`id_pen`),
  ADD KEY `tbl_penjualan_dit_ibfk_2` (`id_barang`);

--
-- Indexes for table `tbl_penyesuaian`
--
ALTER TABLE `tbl_penyesuaian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_retur`
--
ALTER TABLE `tbl_retur`
  ADD PRIMARY KEY (`id_retur`),
  ADD KEY `id_pem` (`id_pem`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_pem_2` (`id_pem`);

--
-- Indexes for table `tbl_retur_dit`
--
ALTER TABLE `tbl_retur_dit`
  ADD PRIMARY KEY (`id_ret_dit`),
  ADD KEY `id_retur` (`id_retur`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_pembelian_dit`
--
ALTER TABLE `tbl_pembelian_dit`
  MODIFY `id_pem_dit` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `tbl_penjualan_dit`
--
ALTER TABLE `tbl_penjualan_dit`
  MODIFY `id_pen_dit` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `tbl_penyesuaian`
--
ALTER TABLE `tbl_penyesuaian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_retur_dit`
--
ALTER TABLE `tbl_retur_dit`
  MODIFY `id_ret_dit` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_konversi`
--
ALTER TABLE `tbl_konversi`
  ADD CONSTRAINT `tbl_konversi_ibfk_1` FOREIGN KEY (`id_brg_sumber`) REFERENCES `tbl_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_konversi_ibfk_2` FOREIGN KEY (`id_brg_tujuan`) REFERENCES `tbl_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_konversi_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`);

--
-- Constraints for table `tbl_pembelian`
--
ALTER TABLE `tbl_pembelian`
  ADD CONSTRAINT `tbl_pembelian_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pembelian_ibfk_2` FOREIGN KEY (`id_pemasok`) REFERENCES `tbl_pemasok` (`id_pemasok`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pembelian_dit`
--
ALTER TABLE `tbl_pembelian_dit`
  ADD CONSTRAINT `tbl_pembelian_dit_ibfk_1` FOREIGN KEY (`id_pem`) REFERENCES `tbl_pembelian` (`id_pem`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pembelian_dit_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tbl_barang` (`id_barang`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD CONSTRAINT `tbl_penjualan_ibfk_1` FOREIGN KEY (`id_pel`) REFERENCES `tbl_pelanggan` (`id_pel`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_penjualan_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_penjualan_dit`
--
ALTER TABLE `tbl_penjualan_dit`
  ADD CONSTRAINT `tbl_penjualan_dit_ibfk_1` FOREIGN KEY (`id_pen`) REFERENCES `tbl_penjualan` (`id_pen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_penjualan_dit_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tbl_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_retur`
--
ALTER TABLE `tbl_retur`
  ADD CONSTRAINT `tbl_retur_ibfk_1` FOREIGN KEY (`id_pem`) REFERENCES `tbl_pembelian` (`id_pem`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tbl_retur_dit`
--
ALTER TABLE `tbl_retur_dit`
  ADD CONSTRAINT `tbl_retur_dit_ibfk_1` FOREIGN KEY (`id_retur`) REFERENCES `tbl_retur` (`id_retur`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
