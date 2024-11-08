-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2024 at 01:55 PM
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
-- Database: `angkatan3_kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `qty` int(9) NOT NULL,
  `harga` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `id_kategori`, `nama_barang`, `satuan`, `qty`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ciki Zeky', 'karton', 10, 2000, '2024-11-06 09:01:35', '2024-11-08 12:54:26'),
(2, 2, 'Okky Jelly Drink', 'karton', 13, 3000, '2024-11-06 09:01:35', '2024-11-08 12:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` double(10,2) NOT NULL,
  `total_harga` double(10,2) NOT NULL,
  `sub_total` double(10,2) NOT NULL,
  `nominal_bayar` double(10,2) NOT NULL,
  `kembalian` double(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id`, `id_penjualan`, `id_barang`, `jumlah`, `harga`, `total_harga`, `sub_total`, `nominal_bayar`, `kembalian`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 3, 2000.00, 6000.00, 0.00, 10000.00, 4000.00, '2024-11-07 12:52:48', '2024-11-07 12:52:48'),
(2, 3, 1, 8, 2000.00, 16000.00, 0.00, 20000.00, 4000.00, '2024-11-08 06:52:24', '2024-11-08 06:52:24'),
(3, 4, 1, 1, 2000.00, 2000.00, 0.00, 5000.00, 3000.00, '2024-11-08 12:06:29', '2024-11-08 12:06:29'),
(4, 5, 1, 2, 2000.00, 10000.00, 0.00, 10000.00, 0.00, '2024-11-08 12:22:41', '2024-11-08 12:22:41'),
(5, 5, 2, 2, 3000.00, 10000.00, 0.00, 10000.00, 0.00, '2024-11-08 12:22:41', '2024-11-08 12:22:41'),
(6, 6, 1, 3, 2000.00, 1.00, 6000.00, 20000.00, 8000.00, '2024-11-08 12:47:22', '2024-11-08 12:47:22'),
(7, 6, 2, 2, 3000.00, 2.00, 6000.00, 20000.00, 8000.00, '2024-11-08 12:47:22', '2024-11-08 12:47:22'),
(8, 7, 1, 2, 2000.00, 7000.00, 4000.00, 10000.00, 3000.00, '2024-11-08 12:51:30', '2024-11-08 12:51:30'),
(9, 7, 2, 1, 3000.00, 7000.00, 3000.00, 10000.00, 3000.00, '2024-11-08 12:51:30', '2024-11-08 12:51:30'),
(10, 8, 1, 1, 2000.00, 8000.00, 2000.00, 10000.00, 2000.00, '2024-11-08 12:54:26', '2024-11-08 12:54:26'),
(11, 8, 2, 2, 3000.00, 8000.00, 6000.00, 10000.00, 2000.00, '2024-11-08 12:54:26', '2024-11-08 12:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Makanan', '2024-11-06 08:43:33', '2024-11-06 08:43:33'),
(2, 'Minuman', '2024-11-06 08:43:33', '2024-11-06 08:43:33');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `kode_transaksi` varchar(50) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `id_user`, `kode_transaksi`, `tanggal_transaksi`, `created_at`, `updated_at`) VALUES
(1, 1, 'TR-241107193338', '2024-11-07', '2024-11-07 12:34:06', '2024-11-07 12:34:06'),
(2, 1, 'TR-241107195237', '2024-11-07', '2024-11-07 12:52:48', '2024-11-07 12:52:48'),
(3, 1, 'TR-241108135158', '2024-11-08', '2024-11-08 06:52:24', '2024-11-08 06:52:24'),
(4, 1, 'TR-241108190132', '2024-11-08', '2024-11-08 12:06:29', '2024-11-08 12:06:29'),
(5, 1, 'TR-241108192103', '2024-11-08', '2024-11-08 12:22:41', '2024-11-08 12:22:41'),
(6, 1, 'TR-241108194554', '2024-11-08', '2024-11-08 12:47:22', '2024-11-08 12:47:22'),
(7, 1, 'TR-241108195107', '2024-11-08', '2024-11-08 12:51:30', '2024-11-08 12:51:30'),
(8, 1, 'TR-241108195406', '2024-11-08', '2024-11-08 12:54:26', '2024-11-08 12:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `nama_pengguna`, `email`, `password`, `foto`, `cover`, `created_at`, `updated_at`) VALUES
(1, 'Edwar Ibrahim', 'ed.ibraa', 'edwar@gmail.com', '12345678', 'hajime.jpg', 'cover2.png', '2024-10-31 13:12:35', '2024-11-04 11:53:03');

-- --------------------------------------------------------

--
-- Table structure for table `usercoba`
--

CREATE TABLE `usercoba` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori_to_kategori_id_` (`id_kategori`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penjualan_to_penjualan_id` (`id_penjualan`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usercoba`
--
ALTER TABLE `usercoba`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usercoba`
--
ALTER TABLE `usercoba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `id_kategori_to_kategori_id_` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `id_penjualan_to_penjualan_id` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
