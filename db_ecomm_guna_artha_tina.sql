-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2023 at 12:39 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ecomm_guna_artha_tina`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat_customers`
--

CREATE TABLE `alamat_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_penerima` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tipe_alamat` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alamat_customers`
--

INSERT INTO `alamat_customers` (`id`, `nama_penerima`, `alamat`, `no_telp`, `keterangan`, `tipe_alamat`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 'Rumah', 1, '2023-11-06 07:14:13', '2023-11-06 07:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `barangs`
--

CREATE TABLE `barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `total_stok` int(11) NOT NULL DEFAULT 0,
  `harga_jual` int(11) NOT NULL,
  `jumlah_terjual` int(11) NOT NULL DEFAULT 0,
  `keterangan` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `foto_barang` varchar(255) DEFAULT NULL,
  `kategori_barang_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangs`
--

INSERT INTO `barangs` (`id`, `kode_barang`, `nama_barang`, `total_stok`, `harga_jual`, `jumlah_terjual`, `keterangan`, `status`, `foto_barang`, `kategori_barang_id`, `created_at`, `updated_at`) VALUES
(1, '1514646464', 'Coca-cola 1L', 120, 12000, 11, 'Minuman soda enak', NULL, 'foto_barang/koXUPZ8i2FA0dpOk2DXmCU7UiB1JIJ5ESsdbwzGx.jpg', 3, '2023-11-06 07:11:16', '2023-12-11 04:01:30'),
(2, '465463135', 'Aqua 1500ml', 229, 5000, 5, 'Minuman', NULL, 'foto_barang/pRy2bf988W2nIqaCV5pwvEnNq9ESHhBs2rVY1Sxc.jpg', 3, '2023-11-06 07:11:41', '2023-12-01 00:07:24'),
(3, '468446466', 'Roma Malkist Coklat 120gr', 118, 6000, 5, 'Cemilan coklat enak', NULL, 'foto_barang/xKzmOSxFMPbtgImyqLo4vBCtXCTWOv2NBC8cg3eb.jpg', 2, '2023-11-06 07:12:18', '2023-12-01 00:06:12');

-- --------------------------------------------------------

--
-- Table structure for table `bumdes`
--

CREATE TABLE `bumdes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_perusahaan` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `link_facebook` varchar(255) NOT NULL,
  `link_instagram` varchar(255) NOT NULL,
  `link_twitter` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_customer` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `nama_customer`, `jenis_kelamin`, `no_telp`, `email`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Akeno', 'Perempuan', '081234567890', 'akeno@gmail.com', 'foto_customer/zgbXPqjGz96AjqNuk3O3rTPpggoB1LvCpvKKkAxr.png', 1, '2023-11-06 07:00:47', '2023-11-06 07:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualans`
--

CREATE TABLE `detail_penjualans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `penjualan_id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_penjualans`
--

INSERT INTO `detail_penjualans` (`id`, `penjualan_id`, `barang_id`, `harga_barang`, `jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 12000, 4, '2023-11-06 07:16:46', '2023-11-06 07:16:46'),
(2, 1, 2, 5000, 4, '2023-11-06 07:16:46', '2023-11-06 07:16:46'),
(3, 1, 3, 6000, 4, '2023-11-06 07:16:46', '2023-11-06 07:16:46'),
(4, 2, 1, 12000, 4, '2023-11-06 07:16:52', '2023-11-06 07:16:52'),
(5, 3, 1, 12000, 2, '2023-11-09 18:45:14', '2023-11-09 18:45:14'),
(6, 4, 3, 6000, 1, '2023-12-01 00:10:00', '2023-12-01 00:10:00'),
(7, 5, 2, 5000, 1, '2023-12-04 21:00:04', '2023-12-04 21:00:04');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesanans`
--

CREATE TABLE `detail_pesanans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pesanan_id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_pesanans`
--

INSERT INTO `detail_pesanans` (`id`, `pesanan_id`, `barang_id`, `harga_barang`, `jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 12000, 4, '2023-11-06 07:15:47', '2023-11-06 07:15:47'),
(2, 1, 2, 5000, 4, '2023-11-06 07:15:47', '2023-11-06 07:15:47'),
(3, 1, 3, 6000, 4, '2023-11-06 07:15:47', '2023-11-06 07:15:47'),
(4, 2, 1, 12000, 4, '2023-11-06 07:16:08', '2023-11-06 07:16:08'),
(5, 3, 1, 12000, 2, '2023-11-09 18:32:52', '2023-11-09 18:32:52'),
(6, 4, 3, 6000, 1, '2023-12-01 00:06:12', '2023-12-01 00:06:12'),
(7, 5, 2, 5000, 1, '2023-12-01 00:07:24', '2023-12-01 00:07:24'),
(8, 6, 1, 12000, 1, '2023-12-11 04:01:30', '2023-12-11 04:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `detail_stock_opnames`
--

CREATE TABLE `detail_stock_opnames` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_opname_id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `stok_sistem` int(11) NOT NULL DEFAULT 0,
  `stok_fisik` int(11) NOT NULL DEFAULT 0,
  `selisih` int(11) NOT NULL DEFAULT 0,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_stock_opnames`
--

INSERT INTO `detail_stock_opnames` (`id`, `stock_opname_id`, `barang_id`, `stok_sistem`, `stok_fisik`, `selisih`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 123, 123, 0, NULL, '2023-11-06 07:17:49', '2023-11-06 09:30:14'),
(2, 2, 2, 230, 223, 7, NULL, '2023-11-06 07:17:49', '2023-11-06 09:30:20'),
(3, 2, 3, 119, 118, 1, NULL, '2023-11-06 07:17:49', '2023-11-06 09:30:24'),
(4, 3, 1, 121, 120, 1, NULL, '2023-11-09 18:39:16', '2023-11-09 18:39:53'),
(5, 3, 2, 0, 0, 0, NULL, '2023-11-09 18:39:16', '2023-11-09 18:39:16'),
(6, 3, 3, 0, 0, 0, NULL, '2023-11-09 18:39:16', '2023-11-09 18:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barangs`
--

CREATE TABLE `kategori_barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_barangs`
--

INSERT INTO `kategori_barangs` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Makanan', '2023-11-06 07:09:55', '2023-11-06 07:09:55'),
(2, 'Cemilan', '2023-11-06 07:09:57', '2023-11-06 07:09:57'),
(3, 'Minuman', '2023-11-06 07:10:01', '2023-11-06 07:10:01');

-- --------------------------------------------------------

--
-- Table structure for table `keranjangs`
--

CREATE TABLE `keranjangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_05_163058_create_customers_table', 1),
(6, '2023_09_28_110047_create_kategori_barangs_table', 1),
(7, '2023_10_13_112153_create_pegawais_table', 1),
(8, '2023_10_15_123021_create_barangs_table', 1),
(9, '2023_10_15_123431_create_stok_barangs_table', 1),
(10, '2023_10_15_135259_create_bumdes_table', 1),
(11, '2023_10_24_170852_create_keranjangs_table', 1),
(12, '2023_10_29_113833_create_alamat_customers_table', 1),
(13, '2023_10_31_151044_create_pesanans_table', 1),
(14, '2023_10_31_151646_create_detail_pesanans_table', 1),
(15, '2023_11_03_124403_create_penjualans_table', 1),
(16, '2023_11_03_124641_create_detail_penjualans_table', 1),
(17, '2023_11_04_124416_create_stock_opnames_table', 1),
(18, '2023_11_04_124450_create_detail_stock_opnames_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawais`
--

CREATE TABLE `pegawais` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `NIK` varchar(255) NOT NULL,
  `nama_pegawai` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `posisi` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pegawais`
--

INSERT INTO `pegawais` (`id`, `NIK`, `nama_pegawai`, `jenis_kelamin`, `email`, `alamat`, `no_telp`, `posisi`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '1245646612155646', 'Rias Gremory', 'Perempuan', 'rias@gmail.com', 'Denpasar', '081234567890', 'Admin', 'foto_pegawai/qX50Ba28OO1dQspnRqq5ZUoHEIY4HjDNs0aw3FwO.png', 2, '2023-11-06 15:04:24', '2023-11-06 07:06:50'),
(2, '12312312321323242', 'Rem', 'Laki-laki', 'rem@gmail.com', 'Denpasar', '081234567890', 'Admin', 'foto_pegawai/fuGxmsStDQvRAptmSfbyRZosY6IoAqxMEgjpJtED.png', 3, '2023-11-29 18:57:43', '2023-11-29 18:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `penjualans`
--

CREATE TABLE `penjualans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `pegawai_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_penjualan` date NOT NULL DEFAULT current_timestamp(),
  `nama_penerima` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `keterangan_alamat` varchar(255) DEFAULT NULL,
  `total_penjualan` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualans`
--

INSERT INTO `penjualans` (`id`, `customer_id`, `pegawai_id`, `tanggal_penjualan`, `nama_penerima`, `alamat`, `no_telp`, `keterangan_alamat`, `total_penjualan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-11-06', 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 92000, '2023-11-06 07:16:46', '2023-11-06 07:16:46'),
(2, 1, 1, '2023-12-06', 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 48000, '2023-11-06 07:16:52', '2023-11-06 07:16:52'),
(3, 1, 1, '2023-11-10', 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 24000, '2023-11-09 18:45:14', '2023-11-09 18:45:14'),
(4, 1, 1, '2023-12-01', 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 6000, '2023-12-01 00:10:00', '2023-12-01 00:10:00'),
(5, 1, 1, '2023-12-05', 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 5000, '2023-12-04 21:00:04', '2023-12-04 21:00:04');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanans`
--

CREATE TABLE `pesanans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `pegawai_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_pesanan` date NOT NULL DEFAULT current_timestamp(),
  `nama_penerima` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `keterangan_alamat` varchar(255) DEFAULT NULL,
  `total_pesanan` int(11) NOT NULL,
  `status_pesanan` varchar(255) NOT NULL,
  `konfirmasi_customer` varchar(255) NOT NULL DEFAULT 'Belum Dikonfirmasi',
  `konfirmasi_admin` varchar(255) NOT NULL DEFAULT 'Belum Dikonfirmasi',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pesanans`
--

INSERT INTO `pesanans` (`id`, `customer_id`, `pegawai_id`, `tanggal_pesanan`, `nama_penerima`, `alamat`, `no_telp`, `keterangan_alamat`, `total_pesanan`, `status_pesanan`, `konfirmasi_customer`, `konfirmasi_admin`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-11-06', 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 92000, 'Dikonfirmasi', 'Dikonfirmasi', 'Dikonfirmasi', '2023-11-06 07:15:47', '2023-11-06 07:16:46'),
(2, 1, 1, '2023-11-06', 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 48000, 'Dikonfirmasi', 'Dikonfirmasi', 'Dikonfirmasi', '2023-11-06 07:16:08', '2023-11-06 07:16:52'),
(3, 1, 1, '2023-11-10', 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 24000, 'Dikonfirmasi', 'Dikonfirmasi', 'Dikonfirmasi', '2023-11-09 18:32:52', '2023-11-09 18:45:14'),
(4, 1, 1, '2023-12-01', 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 6000, 'Dikonfirmasi', ' Dikonfirmasi', ' Dikonfirmasi', '2023-12-01 00:06:12', '2023-12-01 00:10:00'),
(5, 1, 1, '2023-12-01', 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 5000, 'Dikonfirmasi', 'Dikonfirmasi', 'Dikonfirmasi', '2023-12-01 00:07:24', '2023-12-04 21:02:06'),
(6, 1, NULL, '2023-12-11', 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 12000, 'Dipesan', 'Belum Dikonfirmasi', 'Belum Dikonfirmasi', '2023-12-11 04:01:30', '2023-12-11 04:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `stock_opnames`
--

CREATE TABLE `stock_opnames` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_opname` date NOT NULL,
  `barang_selisih` int(11) NOT NULL DEFAULT 0,
  `pegawai_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_opname` varchar(255) NOT NULL DEFAULT 'On Proses',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_opnames`
--

INSERT INTO `stock_opnames` (`id`, `tanggal_opname`, `barang_selisih`, `pegawai_id`, `status_opname`, `created_at`, `updated_at`) VALUES
(2, '2023-11-06', 2, 1, 'On Proses', '2023-11-06 07:17:49', '2023-11-06 09:30:24'),
(3, '2023-11-17', 1, 1, 'On Proses', '2023-11-09 18:39:16', '2023-11-09 18:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `stok_barangs`
--

CREATE TABLE `stok_barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_catat` date NOT NULL DEFAULT current_timestamp(),
  `jumlah_stok` int(11) NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stok_barangs`
--

INSERT INTO `stok_barangs` (`id`, `tanggal_catat`, `jumlah_stok`, `barang_id`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, '2023-11-06', 131, 1, 'Tambah Stok', '2023-11-06 07:12:47', '2023-11-06 07:12:47'),
(2, '2023-11-06', 234, 2, 'Tambah Stok', '2023-11-06 07:12:51', '2023-11-06 07:12:51'),
(3, '2023-11-06', 123, 3, 'Tambah Stok', '2023-11-06 07:12:54', '2023-11-06 07:12:54'),
(4, '2023-11-06', 4, 1, 'Terjual', '2023-11-06 07:15:47', '2023-11-06 07:15:47'),
(5, '2023-11-06', 4, 2, 'Terjual', '2023-11-06 07:15:47', '2023-11-06 07:15:47'),
(6, '2023-11-06', 4, 3, 'Terjual', '2023-11-06 07:15:47', '2023-11-06 07:15:47'),
(7, '2023-11-06', 4, 1, 'Terjual', '2023-11-06 07:16:08', '2023-11-06 07:16:08'),
(8, '2023-11-10', 2, 1, 'Terjual', '2023-11-09 18:32:52', '2023-11-09 18:32:52'),
(9, '2023-12-01', 1, 3, 'Terjual', '2023-12-01 00:06:12', '2023-12-01 00:06:12'),
(10, '2023-12-01', 1, 2, 'Terjual', '2023-12-01 00:07:24', '2023-12-01 00:07:24'),
(11, '2023-12-11', 1, 1, 'Terjual', '2023-12-11 04:01:30', '2023-12-11 04:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `hak_akses` varchar(255) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `hak_akses`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Akeno', 'akeno@gmail.com', NULL, '$2y$10$I4Qxh3rJ1lPPwabNjHp2n.TReYAaMEBOCCYG6iNorE/3b5DpbQF1G', 'Customer', NULL, '2023-11-06 07:00:47', '2023-11-06 07:00:47'),
(2, 'Rias Gremory', 'rias@gmail.com', NULL, '$2y$10$IoLI.4ysUPV0tNyb7TJdCuwM6fQUSm8b5EP99VvHSkvf9RUwpcsKy', 'Admin', NULL, '2023-11-06 07:01:19', '2023-11-06 07:01:19'),
(3, 'Rem', 'rem@gmail.com', NULL, '$2y$10$MSOrQHjlCmGLQ5Eq2z28m.l2Drb0FlQJxD8eGqRc5YvL9ylktwaCy', 'Kepala BUMDes', NULL, '2023-11-29 18:57:43', '2023-11-29 18:57:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat_customers`
--
ALTER TABLE `alamat_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alamat_customers_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barangs_kode_barang_unique` (`kode_barang`),
  ADD UNIQUE KEY `barangs_nama_barang_unique` (`nama_barang`),
  ADD KEY `barangs_kategori_barang_id_foreign` (`kategori_barang_id`);

--
-- Indexes for table `bumdes`
--
ALTER TABLE `bumdes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `detail_penjualans`
--
ALTER TABLE `detail_penjualans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_penjualans_penjualan_id_foreign` (`penjualan_id`),
  ADD KEY `detail_penjualans_barang_id_foreign` (`barang_id`);

--
-- Indexes for table `detail_pesanans`
--
ALTER TABLE `detail_pesanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_pesanans_pesanan_id_foreign` (`pesanan_id`),
  ADD KEY `detail_pesanans_barang_id_foreign` (`barang_id`);

--
-- Indexes for table `detail_stock_opnames`
--
ALTER TABLE `detail_stock_opnames`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_stock_opnames_stock_opname_id_foreign` (`stock_opname_id`),
  ADD KEY `detail_stock_opnames_barang_id_foreign` (`barang_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategori_barangs`
--
ALTER TABLE `kategori_barangs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kategori_barangs_nama_kategori_unique` (`nama_kategori`);

--
-- Indexes for table `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keranjangs_barang_id_foreign` (`barang_id`),
  ADD KEY `keranjangs_customer_id_foreign` (`customer_id`);

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
-- Indexes for table `pegawais`
--
ALTER TABLE `pegawais`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pegawais_nik_unique` (`NIK`),
  ADD UNIQUE KEY `pegawais_email_unique` (`email`),
  ADD KEY `pegawais_user_id_foreign` (`user_id`);

--
-- Indexes for table `penjualans`
--
ALTER TABLE `penjualans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualans_customer_id_foreign` (`customer_id`),
  ADD KEY `penjualans_pegawai_id_foreign` (`pegawai_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pesanans`
--
ALTER TABLE `pesanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pesanans_customer_id_foreign` (`customer_id`),
  ADD KEY `pesanans_pegawai_id_foreign` (`pegawai_id`);

--
-- Indexes for table `stock_opnames`
--
ALTER TABLE `stock_opnames`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_opnames_pegawai_id_foreign` (`pegawai_id`);

--
-- Indexes for table `stok_barangs`
--
ALTER TABLE `stok_barangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stok_barangs_barang_id_foreign` (`barang_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alamat_customers`
--
ALTER TABLE `alamat_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bumdes`
--
ALTER TABLE `bumdes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_penjualans`
--
ALTER TABLE `detail_penjualans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `detail_pesanans`
--
ALTER TABLE `detail_pesanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `detail_stock_opnames`
--
ALTER TABLE `detail_stock_opnames`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_barangs`
--
ALTER TABLE `kategori_barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `keranjangs`
--
ALTER TABLE `keranjangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pegawais`
--
ALTER TABLE `pegawais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penjualans`
--
ALTER TABLE `penjualans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanans`
--
ALTER TABLE `pesanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stock_opnames`
--
ALTER TABLE `stock_opnames`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stok_barangs`
--
ALTER TABLE `stok_barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alamat_customers`
--
ALTER TABLE `alamat_customers`
  ADD CONSTRAINT `alamat_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `barangs`
--
ALTER TABLE `barangs`
  ADD CONSTRAINT `barangs_kategori_barang_id_foreign` FOREIGN KEY (`kategori_barang_id`) REFERENCES `kategori_barangs` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `detail_penjualans`
--
ALTER TABLE `detail_penjualans`
  ADD CONSTRAINT `detail_penjualans_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`),
  ADD CONSTRAINT `detail_penjualans_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualans` (`id`);

--
-- Constraints for table `detail_pesanans`
--
ALTER TABLE `detail_pesanans`
  ADD CONSTRAINT `detail_pesanans_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`),
  ADD CONSTRAINT `detail_pesanans_pesanan_id_foreign` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanans` (`id`);

--
-- Constraints for table `detail_stock_opnames`
--
ALTER TABLE `detail_stock_opnames`
  ADD CONSTRAINT `detail_stock_opnames_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`),
  ADD CONSTRAINT `detail_stock_opnames_stock_opname_id_foreign` FOREIGN KEY (`stock_opname_id`) REFERENCES `stock_opnames` (`id`);

--
-- Constraints for table `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD CONSTRAINT `keranjangs_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`),
  ADD CONSTRAINT `keranjangs_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `pegawais`
--
ALTER TABLE `pegawais`
  ADD CONSTRAINT `pegawais_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `penjualans`
--
ALTER TABLE `penjualans`
  ADD CONSTRAINT `penjualans_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `penjualans_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawais` (`id`);

--
-- Constraints for table `pesanans`
--
ALTER TABLE `pesanans`
  ADD CONSTRAINT `pesanans_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `pesanans_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawais` (`id`);

--
-- Constraints for table `stock_opnames`
--
ALTER TABLE `stock_opnames`
  ADD CONSTRAINT `stock_opnames_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawais` (`id`);

--
-- Constraints for table `stok_barangs`
--
ALTER TABLE `stok_barangs`
  ADD CONSTRAINT `stok_barangs_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
