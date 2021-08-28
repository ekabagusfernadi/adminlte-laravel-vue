-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2021 at 07:38 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggotas`
--

CREATE TABLE `anggotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anggotas`
--

INSERT INTO `anggotas` (`id`, `nama`, `sex`, `telp`, `alamat`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Eka Bagus Fernadi', 'L', '089123456789', 'Sadang, Taman, Sidoarjo.', 'bagusfernadieka@gmail.com', '2021-08-23 03:44:34', NULL),
(2, 'Uzumaki Bayu', 'L', '089123456123', 'Wonokromo, Surabaya', 'bayu@gmail.com', '2021-08-23 03:45:58', NULL),
(3, 'Intan Novi', 'P', '089123453421', 'Gresik', 'intannovi@gmail.com', '2021-08-24 03:41:21', NULL),
(4, 'Ali Usman', 'L', '089123498765', 'Tandes, Surabaya', 'aliusman@gmail.com', '2021-08-24 03:43:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `isbn` int(11) NOT NULL,
  `judul` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` int(11) NOT NULL,
  `id_penerbit` bigint(20) UNSIGNED NOT NULL,
  `id_pengarang` bigint(20) UNSIGNED NOT NULL,
  `id_katalog` bigint(20) UNSIGNED NOT NULL,
  `qty_stok` int(11) NOT NULL,
  `harga_pinjam` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bukus`
--

INSERT INTO `bukus` (`id`, `isbn`, `judul`, `tahun`, `id_penerbit`, `id_pengarang`, `id_katalog`, `qty_stok`, `harga_pinjam`, `created_at`, `updated_at`) VALUES
(1, 1, 'Iqro 4', 1997, 1, 1, 2, 9, 2000, '2021-08-24 03:55:10', NULL),
(2, 2, 'Tutorial Hero Alucard', 2021, 3, 2, 5, 192, 200000, '2021-08-24 03:56:44', NULL),
(3, 3, 'Panduan Kalistenik Lengkap', 2020, 1, 1, 4, 14, 10000, '2021-08-24 03:57:57', NULL),
(4, 4, 'Membuat Nasi Goreng Viral', 2020, 1, 1, 3, 22, 15000, '2021-08-24 03:59:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_peminjaman` bigint(20) UNSIGNED NOT NULL,
  `id_buku` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_peminjaman`
--

INSERT INTO `detail_peminjaman` (`id`, `id_peminjaman`, `id_buku`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '2021-08-09 04:00:39', NULL),
(2, 2, 1, 2, '2021-08-12 04:01:28', NULL),
(3, 2, 3, 1, '2021-08-12 04:02:18', NULL),
(4, 3, 2, 1, '2021-08-09 04:02:31', NULL),
(5, 4, 4, 1, '2021-08-12 04:02:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `katalogs`
--

CREATE TABLE `katalogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `katalogs`
--

INSERT INTO `katalogs` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Buku Pelajaran', '2021-08-24 03:49:42', NULL),
(2, 'Buku Agama', '2021-08-24 03:50:11', NULL),
(3, 'Buku Kuliner', '2021-08-24 03:50:25', NULL),
(4, 'Buku Olahraga', '2021-08-24 03:50:49', NULL),
(5, 'Buku Hiburan', '2021-08-24 03:51:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_08_19_140303_create_anggotas_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2021_08_19_135718_create_penerbits_table', 1),
(6, '2021_08_19_135905_create_pengarangs_table', 1),
(7, '2021_08_19_135934_create_katalogs_table', 1),
(8, '2021_08_19_140044_create_bukus_table', 1),
(9, '2021_08_19_140045_create_peminjaman_table', 1),
(10, '2021_08_19_140136_create_detail_peminjaman_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_anggota` bigint(20) UNSIGNED NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `id_anggota`, `tgl_pinjam`, `tgl_kembali`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-08-09', '2021-08-13', '2021-08-09 03:51:59', '2021-08-13 03:51:59'),
(2, 1, '2021-08-12', '2021-08-19', '2021-08-12 03:52:44', '2021-08-19 03:52:44'),
(3, 2, '2021-08-09', '2021-08-13', '2021-08-09 03:53:23', '2021-08-13 03:53:23'),
(4, 3, '2021-08-12', '2021-08-19', '2021-08-12 03:53:55', '2021-08-19 03:53:55');

-- --------------------------------------------------------

--
-- Table structure for table `penerbits`
--

CREATE TABLE `penerbits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_penerbit` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` char(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penerbits`
--

INSERT INTO `penerbits` (`id`, `nama_penerbit`, `email`, `telp`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'Kijangcitys', 'kijangcitys@gmail.com', '089123453444', 'Sidoarjo', '2021-08-24 03:47:04', NULL),
(2, 'Varmintz', 'varmintz@gmail.com', '089123453555', 'Ponorogo', '2021-08-24 03:48:43', NULL),
(3, 'Jaegerjaquest', 'jaeger@gmail.com', '089123453666', 'Ngawi', '2021-08-24 03:48:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengarangs`
--

CREATE TABLE `pengarangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_pengarang` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` char(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengarangs`
--

INSERT INTO `pengarangs` (`id`, `nama_pengarang`, `email`, `telp`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'Muhammad Nur Alim', 'nuralim@gmail.com', '089123453111', 'Jember', '2021-08-24 03:44:55', NULL),
(2, 'Firza Hardi', 'firzahardi@gmail.com', '089123453222', 'Surabaya', '2021-08-24 03:45:50', NULL),
(3, 'Nur Rochmania', 'rochmania@gmail.com', '089123453333', 'Gresik', '2021-08-24 03:46:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_anggota` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `id_anggota`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Eka Bagus Fernadi', 'bagusfernadieka@gmail.com', NULL, '$2y$10$Rzrkh35OODj5JTmzjcRq.ev2MicnwwcEIdVEATLaBL8dISVELVO46', 1, NULL, '2021-08-22 21:34:42', '2021-08-22 21:34:42'),
(3, 'Uzumaki Bayu', 'bayu@gmail.com', NULL, '$2y$10$JSbmoHRmIoEQT20kjCY4IOYJ/jjySvHrFq0uPz/fbTRBwUA5yNJY.', 2, NULL, '2021-08-22 21:38:21', '2021-08-22 21:38:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggotas`
--
ALTER TABLE `anggotas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bukus_id_penerbit_foreign` (`id_penerbit`),
  ADD KEY `bukus_id_pengarang_foreign` (`id_pengarang`),
  ADD KEY `bukus_id_katalog_foreign` (`id_katalog`);

--
-- Indexes for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_peminjaman_id_peminjaman_foreign` (`id_peminjaman`),
  ADD KEY `detail_peminjaman_id_buku_foreign` (`id_buku`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `katalogs`
--
ALTER TABLE `katalogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peminjaman_id_anggota_foreign` (`id_anggota`);

--
-- Indexes for table `penerbits`
--
ALTER TABLE `penerbits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengarangs`
--
ALTER TABLE `pengarangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_id_anggota_foreign` (`id_anggota`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggotas`
--
ALTER TABLE `anggotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `katalogs`
--
ALTER TABLE `katalogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penerbits`
--
ALTER TABLE `penerbits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengarangs`
--
ALTER TABLE `pengarangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bukus`
--
ALTER TABLE `bukus`
  ADD CONSTRAINT `bukus_id_katalog_foreign` FOREIGN KEY (`id_katalog`) REFERENCES `katalogs` (`id`),
  ADD CONSTRAINT `bukus_id_penerbit_foreign` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbits` (`id`),
  ADD CONSTRAINT `bukus_id_pengarang_foreign` FOREIGN KEY (`id_pengarang`) REFERENCES `pengarangs` (`id`);

--
-- Constraints for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD CONSTRAINT `detail_peminjaman_id_buku_foreign` FOREIGN KEY (`id_buku`) REFERENCES `bukus` (`id`),
  ADD CONSTRAINT `detail_peminjaman_id_peminjaman_foreign` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_id_anggota_foreign` FOREIGN KEY (`id_anggota`) REFERENCES `anggotas` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_anggota_foreign` FOREIGN KEY (`id_anggota`) REFERENCES `anggotas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
