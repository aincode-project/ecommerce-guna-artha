-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 12, 2023 at 11:37 AM
-- Server version: 10.6.14-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u973222809_guna_artha`
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
(1, 'Akeno', 'Jl. Raya Sesetan No. 212', '081234567890', NULL, 'Rumah', 1, '2023-11-06 07:14:13', '2023-11-06 07:14:13'),
(2, 'Rias Gremory', 'Denpasar', '081234567890', NULL, 'Rumah', 1, '2023-12-03 15:42:12', '2023-12-08 12:06:40'),
(3, 'Rias Gremory', 'Denpasar', '081234567890', NULL, 'Rumah', 1, '2023-12-03 15:44:31', '2023-12-08 12:06:35'),
(4, 'Kadek sintya', 'Gg. Sandat, no 3 Br. Telun wayah beduuran, Desa Tri eka Buana', '081234567890', 'rumah', 'rumah', 4, '2023-12-08 14:16:24', '2023-12-08 14:16:24'),
(5, 'Bagus Aditya', 'Br. Telun wayah betenan, no. 4 Desa Tri Eka Buana', '087762750821', 'rumah', 'rumah', 5, '2023-12-08 14:24:11', '2023-12-08 14:24:11'),
(6, 'Ngurah adi', 'Br. jasri, no. 10 Desa Tri Eka Buana', '0882356874', 'rumah', 'rumah', 6, '2023-12-08 14:31:22', '2023-12-08 14:31:47'),
(7, 'Wayan Nata', 'Br. Jasri, gang mangga no.8 Desa Tri Eka Buana', '087762908543', 'rumah', 'rumah', 7, '2023-12-08 14:40:14', '2023-12-08 14:40:14'),
(8, 'Komang ayu', 'Br. Telunwayah betenan, Gg. Manggis no.7 Desa Tri Eka Buana', '087762431657', 'Rumah', 'Rumah', 8, '2023-12-11 04:06:17', '2023-12-11 04:06:17'),
(9, 'Putu Anggi', 'Br. Pungutan, Gg. Cempaka no.6 Desa Tri Eka Buana', '087762453217', 'Rumah', 'Rumah', 9, '2023-12-11 08:03:24', '2023-12-11 08:03:24'),
(22, 'De An', 'Br. Jasri, no.10 desa Tri Eka Buana', '081980765423', 'Rumah', 'Rumah', 11, '2023-12-11 08:33:09', '2023-12-11 08:33:09'),
(23, 'Made nonik', 'Br. Telunwayah duuran, Gg. Sandat no.7', '087762786950', 'Rumah', 'Rumah', 12, '2023-12-12 02:02:19', '2023-12-12 02:02:19'),
(24, 'Sri Ayu Lestari', 'Br. Telunwayah duuran, Gg. Gadung no.8', '085737102503', 'Rumah', 'Rumah', 13, '2023-12-12 02:05:41', '2023-12-12 02:05:41'),
(25, 'Kadek adi', 'Br. Telunwayah betenan, no.5', '085904141597', 'Rumah', 'Rumah', 14, '2023-12-12 02:17:03', '2023-12-12 02:17:03'),
(27, 'Ayu Linda', 'Br. Pungutan, Gg. Mawar no.4', '082341692382', 'Rumah', 'Rumah', 15, '2023-12-12 11:23:29', '2023-12-12 11:23:29'),
(28, 'Ayu Tina Suciari', 'Br. Jasri no.12 Desa Tri eka buana', '08238759012', 'Warung', 'Warung', 16, '2023-12-12 11:34:43', '2023-12-12 11:34:43');

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
(1, '10000688', 'Coca-Cola Soft Drink 1500Ml', 99, 12000, 1, 'Coca cola minuman beraroma kola berkarbonasi botol 1500mL', NULL, 'foto_barang/2OU0w0XKa6Cr3XU85KcpZpN2oW5OCK46Q3PyTHHE.jpg', 3, '2023-11-06 07:11:16', '2023-12-09 23:32:54'),
(2, '10000426', 'Aqua Air Mineral 1500Ml', 99, 6600, 1, 'AQUA berasal dari sumber mata air yang terpilih dengan segala kemurnian dan kandungan mineral alami yang terpelihara./nDengan proses yang baik, memastikan higienis tetap terjaga./nAQUA dikemas dengan proses higienis dalam beberapa ukuran.', NULL, 'foto_barang/9dKZQuVHt39jmoNJyxfhOCV1KzkNQJXkJA6NeKX3.jpg', 12, '2023-11-06 07:11:41', '2023-12-09 23:12:25'),
(3, '20063359', 'Roma Crackers Malkist Belgian Style Cokelat 90G', 99, 9000, 1, 'Roma malkist Belgian Style cokelat dapat menjadi pilihan kamu untuk menikmati waktu luang atau waktu kerja kamu jadi lebih asyik dan tidak membosankan bersama keluarga atau teman kerja.', NULL, 'foto_barang/PZGMg4SLSId4iWGuYkJFIyXDumxzxCiA5qIWAv6Y.jpg', 2, '2023-11-06 07:12:18', '2023-12-09 23:12:25'),
(4, '20034340', 'Clear Shampoo Anti Dandruff Complete Soft Care 160mL', 100, 20000, 0, 'Shampoo anti ketombe', NULL, 'foto_barang/n5jhNkaCIh6oJurXP5HjiIFHSYXSF3apUaCh9tdN.jpg', 5, '2023-12-02 10:07:31', '2023-12-08 11:48:16'),
(5, '20094320', 'Clear Shampoo Anti Dandruff Fresh Cool Lemon 160mL', 100, 20000, 0, 'Baru dengan triple anti-dandruff technology mengandung vitamin B3 dan komponen protein. Menghilangkan, melawan dan mencegah dari ketombe.', NULL, 'foto_barang/xV9CcedY4kNIbKmNvRT8lSEsuYv6Xz64UUueHuN8.jpg', 5, '2023-12-02 10:08:35', '2023-12-08 11:48:19'),
(6, '20091440', 'Clear Shampoo Anti Dandruff Ice Cool Menthol Fresh 160mL', 99, 20000, 1, 'Sensasi dingin menthol yang segar. Menghilangkan, melawan dan mencegah dari ketombe. Bebas ketombe selamanya.', NULL, 'foto_barang/WUTvPQKQp9vE9XRATw12J5Hz8Hfha8aYAKhOF0L0.jpg', 5, '2023-12-02 10:09:21', '2023-12-09 23:39:18'),
(7, '20054964', 'Head & Shoulders Shampoo Anti Dandruff Anti Bacterial Bersih & Harum 300mL', 99, 39000, 1, 'Head & Shoulders Shampo Clean & Balanced merupakan salah satu varian sampo perawatan rambut berketombe dari brand ternama Head & Shoulders, terbukti mampu mengatasi ketombe karena sudah menjelajah di seluruh dunia untuk merawat rambut menjadi sehat.', NULL, 'foto_barang/bBH7Re3fwVOUORcXeyJi4JSY5rMw9IoMWPLKZzBO.jpg', 5, '2023-12-02 10:10:49', '2023-12-12 02:13:09'),
(8, '20055798', 'Head & Shoulders Shampoo Anti Dandruff Lemon Fresh 300Ml', 100, 39000, 0, 'Formula dengan keharuman jeruk lemon, membersihkan minyak dan kotoran, sehingga rambut terasa ringan, bersih dan harum. Head & Shoulders, shampo anti danruff terbaik.', NULL, 'foto_barang/wWnnRVwHsA0cKcI92oSEmUZsmTN10ABK3qbipc6C.jpg', 5, '2023-12-02 10:16:44', '2023-12-08 11:48:32'),
(9, '20010383', 'Lifebuoy Shampoo Anti Dandruff 340Ml', 100, 29500, 0, 'Dengan Milk Protein Lock Formula & Zinc, merawat kulit kepala dan membantu mengatasi timbulnya ketombe.', NULL, 'foto_barang/5GC9QQcQt2giKJ5R9SLMY4Sb6cF1gr7NkyjdiHoJ.jpg', 5, '2023-12-02 10:17:29', '2023-12-08 11:48:35'),
(10, '20028002', 'Lifebuoy Shampoo Strong & Shiny 340Ml', 99, 29500, 1, 'LIFEBUOY SHAMPOO STRONG & SHINY WITH MILK PROTEIN LOCK FORMULA BTL 340mL', NULL, 'foto_barang/Ujp8tTAzLCtdjaSo8rmt2KvKHlmPVPOKExlKc5Ae.jpg', 5, '2023-12-02 10:18:11', '2023-12-12 02:18:52'),
(11, '20034341', 'Pantene Shampoo Black Glow 290mL', 99, 30000, 1, 'Formula Pantene Hitam Glow adalah formula terbaik untuk rambut hitam. Diciptakan untuk mengatasi masalah rambut hitam secara khusus.', NULL, 'foto_barang/bLFhyUuefNj4pFwZct6OnFUMuHpKQi5cUtc9mIX7.jpg', 5, '2023-12-02 10:19:43', '2023-12-11 08:04:49'),
(12, '20125186', 'Pantene Shampoo Pro-V Anti Lepek 290mL', 100, 55000, 0, 'Paduan pro-v dengan busa yang berlimpah. Rambut kuat dan lebih berkilau, melawan rambut lepek dan lusuh untuk rambut mengembang sampai keujung.', NULL, 'foto_barang/fJEqzCQHrxHQ9j3HmQ8gN29WEQf8GdEwe9wn55Gl.jpg', 5, '2023-12-02 10:20:26', '2023-12-08 11:49:11'),
(13, '20127380', 'Pantene Shampoo Pro-V Anti Lepek 750mL', 100, 99000, 0, 'Kini hadir varian baru dari Pantene Shampo, yaitu Pantene Shampoo Anti Lepek merupakan sampo persembahan Pantene yang dapat membantu Anda dalam mengatasi rambut lepek dan lusuh hingga keujungnya.', NULL, 'foto_barang/tNo6Aoj6p2o4eZO1HdqOA7TkmPyikvp9G8JfedeP.jpg', 5, '2023-12-02 10:21:04', '2023-12-08 11:49:14'),
(14, '20094731', 'Kobe Tepung Roti 200G', 199, 12500, 0, 'KOBE Breadcrumbs diformulasikan demi memastikan tingkat kerenyahan yang terbaik. Sajian gorengan Anda dapat menjadi lebih renyah dan gurih dalam waktu yang lebih lama.', NULL, 'foto_barang/ZvoelkzGUNw9PcnyTxVFDenzsgRVkbXCKY4GQU3m.jpg', 6, '2023-12-02 11:42:35', '2023-12-08 11:49:17'),
(15, '20096440', 'Rose Brand Gula Halus 500G', 98, 12000, 2, 'Rosebrand gula halus adalah bahan masakan atau baking berbahan gula berbentuk tepung. Biasanya gula halus digunakan untuk bahan dasar pembuatan kue.', NULL, 'foto_barang/zvIU3LY3twB5s3HwSklPgUw7EWzWDFRMRfAFSsS1.jpg', 6, '2023-12-02 11:43:28', '2023-12-12 11:27:07'),
(16, '10000508', 'Rose Tepung Beras Ketan 500G', 100, 15000, 0, 'Terbuat dari bahan ketan berkualitas, Diproses secara higenis, Cocok untuk bahan baku membuat semua jenis kue-kue tradisional atau hidangan lainnya', NULL, 'foto_barang/r3MxgmRgYYy5wgDsAPtajH0fypOAi9KZs87RCKYF.jpg', 6, '2023-12-02 11:44:04', '2023-12-08 11:49:30'),
(17, '20076765', 'Rose Brand Gula Pasir Putih 1Kg', 100, 16000, 0, 'Gula pasir putih yang terbuat dari gula tebu asli pilihan dan diproses secara higienis yang telah memenuhi standar mutu. Menghasilkan gula yang manis, alami, murni dan bersih', NULL, 'foto_barang/o4vuqOyMKGxxBzjqfdjOLgjTw05k3xjZ8BqbPYCU.jpg', 6, '2023-12-02 11:55:50', '2023-12-08 11:49:32'),
(18, '20076768', 'Rose Brand Gula Pasir Kuning 1Kg', 100, 16000, 0, 'Berasal dari gula tebu pilihan dan berkualitas yang diproses dengan menggunakan mesin berteknologi modern untuk menghasilkan gula yang putih higienis dan berkualitas', NULL, 'foto_barang/A6eCFrCDh4tXclaMebVnQFIUBFz2XQRT0jfEDw9L.jpg', 1, '2023-12-02 11:56:28', '2023-12-08 11:49:35'),
(19, '10005600', 'Kunci Biru Tepung Terigu 1000G', 100, 16000, 0, 'Bogasari Kunci Biru', NULL, 'foto_barang/DTn74FfTibPPg0mLrEnKHPuDgVf5huccbR296FHI.jpg', 6, '2023-12-02 11:57:12', '2023-12-08 11:49:37'),
(20, '10021010', 'Gulaku Gula Tebu (Putih) Premium 1000G', 100, 16000, 0, 'Gulaku premium adalah gula pasir putih produksi nasional yang berkualitas lebih putih dan lebih jernih, serta diproduksi dari tebu alami langsung dari perkebunan.', NULL, 'foto_barang/1FPeFx42I76udP0WOwmQnkpkowzv8G3BpDoNU3jE.jpg', 6, '2023-12-02 11:57:47', '2023-12-08 11:49:41'),
(21, '10005599', 'Segitiga Biru Tepung Terigu 1000G', 100, 15000, 0, 'Segitiga Biru adalah tepung terigu yang cocok untukmembuat aneka makanan seperti bolu, brownies, cake, pisang, martabak manis, muffin, kue bulan, croissant, puff pastry, denish, bapia, pastel, kroket, risoles, dan lain-lain', NULL, 'foto_barang/0g4lOABMDFXoxFtUzVUtDgPY1xTdJ2r5mRY8g42X.jpg', 6, '2023-12-02 11:58:56', '2023-12-08 11:50:05'),
(22, '20022639', 'Mamasuka Tepung Roti 100G', 100, 9500, 0, 'Tepung roti mamasuka terbuat dari bahan terigu berkualitas, sehingga harum aromanya, ranyah dan garing serta sedap rasanya.', NULL, 'foto_barang/RIAum6dvaz1TvONtMj5CFErTaGLf6EgT6YwDKP0Q.jpg', 6, '2023-12-02 11:59:44', '2023-12-08 11:50:08'),
(23, '20117389', 'Finna Tepung Roti Panko 200g', 100, 16000, 0, 'Biasanya digunakan sebagai pelapis gorengan atau taburan, seperti katsu atau tempura.', NULL, 'foto_barang/vrutCQ731hJ2ynLNHBNJ7zZlKRM2DsJeytXgZjoi.jpg', 6, '2023-12-02 12:00:13', '2023-12-08 11:50:11'),
(24, '20043943', 'Larisst Minyak Goreng 2L', 100, 33000, 0, 'Larisst Minyak goreng merupakan minyak goreng yang dihasilkan dari kelapa sawit pilihan dan diproses dengan teknologi yang canggih.', NULL, 'foto_barang/usZqgFoQMbeI7CGFenajxC9cdWablfCIMWonGwRW.jpg', 7, '2023-12-02 12:13:21', '2023-12-08 11:50:13'),
(25, '20120496', 'Harumas Minyak Goreng 1L', 99, 16000, 1, 'Harumas minyak goreng multiguna cocok untuk goreng dan tumis, dibuat dengan minyak kelapa sawit yang bermutu, cocok untuk dikonsumsi keluarga dan dikemas dalam kemasan yang ekonomis menjadikannya praktis.', NULL, 'foto_barang/ht4NsRuwMUv8mZuZ5N57CGL1l8yoIu892Frxooxv.jpg', 7, '2023-12-02 12:14:01', '2023-12-12 02:11:12'),
(26, '20120493', 'Camar Minyak Goreng 1L', 100, 16500, 0, 'Camar minyak goreng multiguna cocok untuk goreng dan tumis, dibuat dengan minyak kelapa sawit yang bermutu, cocok untuk dikonsumsi keluarga dan dikemas dalam kemasan yang ekonomis menjadikannya praktis.', NULL, 'foto_barang/aWP6p1E9sDhu3XnrJvcDwE1vMUJv45m5jiwxyQzl.jpg', 7, '2023-12-02 12:14:30', '2023-12-08 11:50:20'),
(27, '10038881', 'Tropical Minyak Goreng 1000Ml', 99, 20500, 1, 'Tropical minyak goreng dengan 2x penyaringa, yang kaya akan Vitamin E yang baik. Minyak goreng sawit dengan 90mg Omega 3 per saji, 1.7g Omega 6 per saji, dan 6.7g Omega 9 per saji.', NULL, 'foto_barang/9tohj7ccEOGFR9U3kBdnqwZ437k09wGGwaKPWTQe.jpg', 7, '2023-12-02 12:15:13', '2023-12-09 23:32:54'),
(28, '20120992', 'Camar Minyak Goreng 2L', 100, 32000, 0, 'dibuat dengan minyak kelapa sawit yang bermutu, cocok untuk dikonsumsi keluarga , dan dikemas dalam kemasan yang ekonomis menjadikannya praktis', NULL, 'foto_barang/rmmYJwmbo038TX60sL4JhE2G9yPfC9Y44GLA4j4n.jpg', 7, '2023-12-02 12:15:51', '2023-12-08 11:50:25'),
(29, '20120993', 'Harumas Minyak Goreng 2L', 100, 32000, 0, 'minyak goreng multiguna cocok untuk goreng dan tumis, dibuat dengan minyak kelapa sawit yang bermutu.', NULL, 'foto_barang/dzcY5EPPDEjfASTPwgUIewT5fsBczdl0xfa7NXnQ.jpg', 7, '2023-12-02 12:30:45', '2023-12-08 11:50:28'),
(30, '20077116', 'Sovia Minyak Goreng 1L', 100, 17000, 0, 'Sovia adalah minyak goreng berkualitas yang diproses dari kelapa sawit pilihan yang mengandung vitamin A dan vitamin D, juga dilengkapi 1.9g omega 6 dan 5.7g omega 9 per sajian', NULL, 'foto_barang/2QnI6ryma1gHY3rZMu1SXyyunCdEwWrWnG8zIREc.jpg', 7, '2023-12-02 12:31:25', '2023-12-08 11:50:30'),
(31, '10000178', 'Bimoli Minyak Goreng 2000Ml', 100, 37500, 0, 'Bimoli dibuat dari kelapa sawit berkualitas. Warna kuning keemasan berasal dari beta karoten alami. Stabil panasnya. Matang luar dalam.', NULL, 'foto_barang/F4CYeOMD5D5212TjhSI69VNBfiNw71lX0NDMbaVp.jpg', 7, '2023-12-02 12:31:58', '2023-12-08 11:50:51'),
(32, '10003974', 'Tropical Minyak Goreng 2000Ml', 100, 33500, 0, 'Tropical minyak goreng dengan 2x penyaringan.', NULL, 'foto_barang/UpwWoHYkppbrekzs75WwNMtkSXupGHZu9hDMFq9p.jpg', 7, '2023-12-02 12:32:27', '2023-12-08 11:50:55'),
(33, '10000442', 'Fortune Minyak Goreng Refill 2000Ml', 100, 33100, 0, 'Fortune adalah minyak goreng nabati yang diproses dari buah kelapa sawit segar dan bermutu, serta pengawasan mutu yang ketat.', NULL, 'foto_barang/ktCZkHUBz09lBkIG4Ip8B8azmndKv2Wbpfru7zTE.jpg', 7, '2023-12-02 12:32:56', '2023-12-08 11:50:58'),
(34, '20122733', 'Fitri Margarine Serba Guna 200G', 100, 7500, 0, 'Margarine Serbaguna yang diproses dengan formulasi ganda, dijamin Halal dan Higienis serta Aman Berkualitas, membuat segala jenis masakan jadi lebih lezat sehingga sangat layak dikonsumsi bagi anggota Keluarga.', NULL, 'foto_barang/fYaXNDfz1jfy7itoKvzO48KR2l9yTScFk8kU6Y34.jpg', 8, '2023-12-02 12:43:06', '2023-12-08 11:51:04'),
(35, '20034353', 'Amanda Margarine Dapur 200G', 100, 5500, 0, 'Margarin serbaguna yang berbahan dasar minyak kelapa sawit dengan kegunaannya untuk membuat roti maupun memasak di dapur.', NULL, 'foto_barang/vkdJLslr4xd6KdyFBlIqKMNB5oypjFRluMjIUwUu.jpg', 8, '2023-12-02 12:43:38', '2023-12-08 11:51:06'),
(36, '20052877', 'Palmia Royal Butter Margarine 200G', 100, 8000, 0, 'Diperkaya dengan 8 vitamin (A, B1, B2, B12, D, E, Niasin, Asam Folat) yang sangat baik. Palmia Serbaguna dengan formula baru membuat aroma dari margarin ini semakin harum.', NULL, 'foto_barang/D3WeCd4YbLon1QxmRiUuZ3rFuI4vUScNLNhXSu6E.jpg', 8, '2023-12-02 12:44:06', '2023-12-08 11:51:09'),
(37, '20041164', 'Blue Band Margarine Cake & Cookie 200G', 100, 15000, 0, 'Blue Band Cake & Cookie dengan vitamin B2 yang bermanfaat bagi kebutuhan nutrisi keluarga. Memiliki citarasa dan aroma butter ideal digunakan untuk membuat kue dan roti', NULL, 'foto_barang/sOygKbWEhip6ZbIhi1uyyc1iR6e0CtCETvaMlKOe.jpg', 8, '2023-12-02 12:44:40', '2023-12-08 11:51:12'),
(38, '20002415', 'Filma Margarine Bernutrisi 200G', 100, 5000, 0, 'Filma Margarine, 100% margarin asli dengan tekstur lembut dan rasa gurih yang cocok untuk semua jenis makanan.', NULL, 'foto_barang/8GSxUKeldVCSjqFo4iof0YS8a9PkEgFoD2w2rDeC.jpg', 8, '2023-12-02 12:45:06', '2023-12-08 11:51:15'),
(39, '10005073', 'Blue Band Margarine Serbaguna 200G', 100, 10500, 0, 'Blue Band Serbaguna Margarine memasak dan menghidangkan berbagai masakan lezat setiap hari dan melihat seluruh anggota keluarga tersenyum bahagia adalah sebuah kenikmatan tersendiri.', NULL, 'foto_barang/YRXcP2bhmUHFxmpvp7HVUTG9K1B9xElO18dKDBlj.jpg', 8, '2023-12-02 12:45:38', '2023-12-08 11:51:17'),
(40, '10000210', 'Blue Band Margarine Serbaguna 250G', 100, 30000, 0, 'Blue band margarine serba guna dengan omega 3 & 6 dan 6 vitamin.', NULL, 'foto_barang/Nm37WKL17QqFKyqR9CQJb2pf0xBxtSMBiMjK41zr.jpg', 8, '2023-12-02 12:46:04', '2023-12-08 11:50:48'),
(41, '20019315', 'Forvita Margarine Gold 250G', 100, 12500, 0, 'FORVITA merupakan margarin sehat dengan fortifikasi Vitamin A yang diolah dan diproses secara higienis untuk menghasilkan olahan masakan yang sehat dan lezat.', NULL, 'foto_barang/Qr76HKaDFee9X1SkwNYPgBCw1NU9JulhkUFxiWlb.jpg', 8, '2023-12-02 12:46:34', '2023-12-08 11:52:07'),
(42, '20003405', 'Forvita Margarine 200G', 100, 7500, 0, 'Merupakan margarin sehat dgn fortifikasi Vitamin A yang diolah & diproses secara higienis untuk menghasilkan olahan masakan yang sehat & lezat.', NULL, 'foto_barang/jgqUXHQfIyvi37aENnqHLLcwFvmWkNoNJoBvnwHW.jpg', 8, '2023-12-02 12:49:07', '2023-12-08 11:52:10'),
(43, '10000439', 'Palmia Margarine Serbaguna 200G', 100, 6000, 0, 'Margarine serbaguna mengandung 8 vitamin : A, B1, B2, B12, D, E, Niosin, Asam folat', NULL, 'foto_barang/k8pJsYB7JiFOYbnpOvXSxmXnHj3Mz8Y8ipX2IfnZ.jpg', 8, '2023-12-02 12:49:48', '2023-12-08 11:52:12'),
(44, '20129054', 'Anchor Cheddar Cheese 150G', 100, 26500, 0, 'Tinggi Kalsium membantu dalam pembentukan dan mempertahankan kepadatan tulang dan gigi.', NULL, 'foto_barang/oOeDwk0HZTNU3XDBp0XlGRLj5dcrKftN9K46UEzW.jpg', 9, '2023-12-02 12:54:17', '2023-12-08 11:52:15'),
(45, '20118903', 'Pro Chiz Keju Gold Cheddar 60G', 100, 5500, 0, 'Prochiz gold cheddar processed cheddar cheese, Keju cheddar olahan, lebih mudah diparut. halus dan mudah untuk parut.', NULL, 'foto_barang/ZO3VMAS9AAKXndMq8ZQmtkLqTSDhwVb1Lxim1N8p.jpg', 9, '2023-12-02 12:54:52', '2023-12-08 11:52:17'),
(46, '20091583', 'Pro Chiz Keju Mozzarella 160g', 99, 26000, 1, 'Prochiz Mozzarella merupakan keju mozzarella olahan yang terbuat dari bahan berkualitas, memiliki tekstur lembut dan padat, mudah meleleh dan melar (stretchy) ketika dipanaskan.', NULL, 'foto_barang/fHQ8PvcctllQk0Kurq3V9IPwJ96zlxq6RCPgPzpZ.jpg', 9, '2023-12-02 12:55:30', '2023-12-12 02:11:12'),
(47, '20113339', 'Emina Block Cheese Mozza 160G', 100, 19500, 0, 'Dengan campuran keju cheddar dan mozarella, EMINA Cheese Block MOZZA memiliki tekstur lembut dan kenyal sehingga menghadirkan rasa baru yang unik di setiap makanan.', NULL, 'foto_barang/2KccME8vOM277F5dxMRThNqaLggdxh7wGjm8yQoB.jpg', 9, '2023-12-02 12:55:59', '2023-12-08 11:52:21'),
(48, '20113341', 'Emina Cheese Slice Mozza 5\'S', 100, 9000, 0, 'Dengan campuran keju cheddar dan mozarella, EMINA Cheese Block MOZZA memiliki tekstur lembut dan kenyal sehingga menghadirkan rasa baru yang unik di setiap makanan.', NULL, 'foto_barang/A9SuWmEyzeZyCyNtjg24L2CnnYz1aGLkZvC3KfKt.jpg', 9, '2023-12-02 12:56:32', '2023-12-08 11:52:24'),
(49, '20096979', 'Pro Chiz Keju Gold Slice 12\'S 156G', 100, 12500, 0, 'Prochiz Gold Slice adalah keju cheddar olahan yang berbentuk lembaran yang sangat elastis.', NULL, 'foto_barang/zHv10k9MmeQyqQgcCUj22iZamFTWgg4Y9YmbnmIT.jpg', 9, '2023-12-02 12:56:59', '2023-12-08 11:52:26'),
(50, '20044861', 'Pro Chiz Keju Slice 5\'S 85G', 100, 8000, 0, 'Prochiz Keju Slice diolah dengan teknologi terbaru untuk menghasilkan rasa yang lebih enak.', NULL, 'foto_barang/BWV7JG8VOc0Yir32LdWpahMiyE1wyq19J4MR3yF5.jpg', 9, '2023-12-02 12:57:32', '2023-12-08 11:52:01'),
(51, '20103166', 'Meg Keju Serbaguna 10\'S 150G', 100, 12000, 0, 'Keju cheddar olahan dari MEG ini ideal untuk membantu Anda menghasilkan sajian kue atau masakan yang lezat dengan citarasa istimewa.', NULL, 'foto_barang/klpMEcW0E4ySCEyiwv62loPUaQP8VBrZQtwD93cG.jpg', 9, '2023-12-02 12:58:12', '2023-12-08 11:52:48'),
(52, '20058306', 'Pro Chiz Keju Gold 160G', 100, 13000, 0, 'halus dan mudah untuk parut. Ini tidak mudah terbakar selama pembakaran, dan itu unggul dalam rasa.', NULL, 'foto_barang/O7NZSFEqoQJ5EGPSV2ZLp6dH3CgSsYP8LsAgE6GZ.jpg', 9, '2023-12-02 12:58:43', '2023-12-08 11:52:51'),
(53, '20069701', 'Meg Keju Serbaguna 160G', 100, 11000, 0, 'Keju dengan kebaikan susu yang tinggi kalsium serta vitamin dan protein yang sanagat baik untuk tubuh.', NULL, 'foto_barang/kMURMR0ATpcPJyoNobIzUAax0QBN0Kahf0Ulsn9i.jpg', 9, '2023-12-02 12:59:15', '2023-12-08 11:52:55'),
(54, '20029278', 'Adinata Note Book Character B6 Assorted', 100, 35500, 0, 'Adinata Note Book Character B6 Assorted adalah sebuah buku catatan berkualitas tinggi dengan ukuran B6 yang praktis.', NULL, 'foto_barang/s1i7yuPJW8vzCvYdx8gt0fZAdn4ia7jPohrUjbLw.jpg', 4, '2023-12-02 13:11:52', '2023-12-08 11:52:57'),
(55, '20014590', 'Adinata Pencil Case Paper Assorted', 100, 34000, 0, 'Adinata Pencil Case Paper Assorted merupakan tempat pensil yang didesain dengan kreativitas dan kepraktisan sebagai fokus utama.', NULL, 'foto_barang/Igf5f76mIxdzwZaOTo0LQz8vpuxpIZ6zdyeMkcCB.jpg', 4, '2023-12-02 13:12:52', '2023-12-08 11:53:01'),
(56, '10014129', 'Adinata Penggaris Character 30Cm', 100, 19000, 0, 'Adinata Penggaris Character 30cm adalah penggaris dengan desain karakter yang menarik, memberikan sentuhan unik pada peralatan tulis sehari-hari.', NULL, 'foto_barang/uvvHCgZMnjQpeX8D8F51ELBxIi0dSqdCQDGyfQ1L.jpg', 4, '2023-12-02 13:13:31', '2023-12-08 11:53:03'),
(57, '20012674', 'Adinata Stationary Character 7\'S', 99, 40000, 1, 'Adinata Stationery Character 7\'S adalah paket perlengkapan tulis yang menawarkan keberagaman dalam desain karakter yang menarik.', NULL, 'foto_barang/Cbps7kdpykY97THK6vQjMzDYiiFz829laeHGNy0B.jpg', 4, '2023-12-02 13:14:09', '2023-12-09 23:32:54'),
(58, '10024555', 'Faber Castell Paket Umptn', 100, 28000, 0, 'Faber-Castell merupakan produsen alat tulis dan perlengkapan seni terkemuka dengan sejarah lebih dari dua setengah abad.', NULL, 'foto_barang/uhvkXfZQz8lzyOT8FaeHYbwdB2NJxusirQtOrMRw.jpg', 4, '2023-12-02 13:16:49', '2023-12-08 11:53:08'),
(59, '20018825', 'Faster Ballpoint C-600/F3 3\'S Hitam', 99, 17000, 1, 'Faster Ballpoint C-600/F3 3\'S Hitam adalah paket tiga pulpen bola dengan model C-600/F3 yang tangguh dan efisien.', NULL, 'foto_barang/p0AoHRd9wWGVFDFi4ON1l8u8djLSeXz0hx773zDq.jpg', 4, '2023-12-02 13:17:33', '2023-12-12 02:11:12'),
(60, '20044534', 'Kenko Ballpoint Easy Gel (2Black +1Blue)', 100, 20500, 0, 'Kenko Ballpoint Easy Gel (2 Hitam + 1 Biru) adalah paket tiga pulpen bola yang memberikan pengalaman menulis yang halus dan nyaman.', NULL, 'foto_barang/HhlXXPAvzYRP1GiwjhKCOiDuSzX6Uccsu0cX7Uyy.jpg', 4, '2023-12-02 13:18:09', '2023-12-08 11:52:42'),
(61, '20071871', 'Max Isi Stapler No.10-1M(1000)', 97, 12500, 3, 'Max Isi Stapler No.10-1M (1000) adalah produk stapler isi ulang yang didesain untuk keperluan stapling sehari-hari.', NULL, 'foto_barang/STNLMoOwPxO7yrjhxMXTs2K6ihAf0Enog6OBDfUl.jpg', 4, '2023-12-02 13:18:50', '2023-12-12 11:27:07'),
(62, '10000475', 'Max Stapler Hd-10', 100, 31000, 0, 'Max Stapler HD-10 adalah stapler yang handal dan tahan lama yang dirancang untuk penggunaan sehari-hari di berbagai lingkungan, seperti kantor, sekolah, atau rumah.', NULL, 'foto_barang/PiK09sWRprwpwqvlQHrVPvU6Bsmt1ilkAMFFDRIO.jpg', 4, '2023-12-02 13:19:33', '2023-12-08 11:53:46'),
(63, '20112782', 'Kenko Sticky Notes SN-0303 75X75mm', 99, 10000, 1, 'Kenko Sticky Notes SN-0303 75x75mm adalah set lembaran catatan yang dirancang dengan ukuran 75x75mm, yang membuatnya cukup besar untuk menuliskan pesan atau catatan penting.', NULL, 'foto_barang/Zbp1Nnq16JJ30A9zqSp2OG5ChQMBEWyYET5uyMa5.jpg', 4, '2023-12-02 13:20:53', '2023-12-09 23:36:12'),
(64, '10038450', 'Snowman Spidol Whiteboard Hitam', 100, 13500, 0, 'Snowman Spidol Whiteboard Hitam adalah spidol yang dirancang khusus untuk digunakan pada papan tulis (whiteboard).', NULL, 'foto_barang/sDiIF3oMrOZJLtikGDOdObgY0Ld7jol9oYNJGFAI.jpg', 4, '2023-12-02 13:22:43', '2023-12-08 11:53:51'),
(65, '10038449', 'Snowman Spidol Giant Hitam', 100, 13500, 0, 'Spidol ini dirancang untuk digunakan pada berbagai permukaan, termasuk kertas, karton, dan sebagian besar bahan.', NULL, 'foto_barang/jso7PpHUrHupLrxc4bo3XlTfpVv24Le7emlonsGc.jpg', 4, '2023-12-02 13:24:19', '2023-12-08 11:53:54'),
(66, '10000280', 'Uhu Lem All Purpose', 100, 18000, 0, 'UHU Lem All Purpose adalah lem serbaguna yang umumnya digunakan untuk berbagai keperluan perekatan di rumah, kantor, atau sekolah.', NULL, 'foto_barang/jgY32FGMjGy79Qkn4PkaW47KJSQYL9nmuT7VnDne.jpg', 4, '2023-12-02 13:26:24', '2023-12-08 11:53:57'),
(67, '20122345', 'Deli Paper Clips No.0024', 100, 15000, 0, 'Deli Paper Clips No. 0024 adalah klip kertas yang diproduksi oleh merek Deli.', NULL, 'foto_barang/lwD5Py66Dx7oRDa52d3C7lTGSvTVbRjBX5hfPSee.jpg', 4, '2023-12-02 13:27:06', '2023-12-08 11:53:59'),
(68, '20098365', 'Deli School Correction Tape - 8101', 100, 10000, 0, 'Deli School Correction Tape - 8101 adalah korektor tape yang dirancang untuk memperbaiki kesalahan tulisan atau pencetakan pada kertas.', NULL, 'foto_barang/O4baZOnmYP43Iz9YHzgLKRiSDbqNZagtyKk6w2Yi.jpg', 4, '2023-12-02 13:28:04', '2023-12-08 11:54:01'),
(69, '10038814', 'Kenko/Buterfly Binder Clip No.107/12\'s', 100, 8000, 0, 'Binder Clip Kenko/Butterfly No.107/12\'s adalah set klip pengikat kertas yang diproduksi oleh merek Kenko atau Butterfly.', NULL, 'foto_barang/HHQinboafRvFyfv4ND8n5NYuIhzUmlJx9iNXdp1D.jpg', 4, '2023-12-02 13:28:41', '2023-12-08 11:54:04'),
(70, '20027074', 'Sinar Dunia Buku Gambar A4', 100, 7000, 0, 'Buku gambar A4 cocok untuk menggambar, mewarnai, atau mencatat di kelas atau di rumah.', NULL, 'foto_barang/S9CBNTRwBrPr35MHoExCchWQkOUNNwgf96HyYPmA.jpg', 4, '2023-12-02 13:29:29', '2023-12-08 11:53:38'),
(71, '20042258', 'Scotch Transparent Tape 500 Small 12mm x 33m', 100, 8500, 0, 'Mudah digunakan, cocok untuk ditempel di berbagai jenis permukaan, dan mudah dipotong.', NULL, 'foto_barang/J2EdHMWAXaepaFm3RUor9qG0gP0trOOuzTMcbtDD.jpg', 4, '2023-12-02 13:30:02', '2023-12-08 11:54:23'),
(72, '20042255', 'Scotch Transparent Tape 500 Medium 12mm x 66m', 100, 15500, 0, 'Mudah digunakan, cocok untuk ditempel di berbagai jenis permukaan & mudah dipotong', NULL, 'foto_barang/6d35JHMTxpUwbwEeBRMjpDaXlQuiTbskAu6Nu6RI.jpg', 4, '2023-12-02 13:30:29', '2023-12-08 11:54:27'),
(73, '20007824', 'Dua Kelinci Kacang Sangrai 180G', 100, 14000, 0, 'Dua kelinci kacang sangrai, terbuat dari kacang kulit pilihan.', NULL, 'foto_barang/9mNcZ4VVV69ne26Kca4cusWub7fpfQGgrJ8pN1y8.jpg', 2, '2023-12-02 13:45:31', '2023-12-08 11:54:29'),
(74, '20130147', 'Rebo Kuaci Coconut 150G', 99, 12000, 1, 'TINGGI PROTEIN TINGGI SERAT TINGGI VITAMIN E SUMBER ZAT BESI', NULL, 'foto_barang/hBWJ9kUncUtbyAuttjaOkMwwVIrduY13RyEr7iLg.jpg', 2, '2023-12-02 13:46:07', '2023-12-09 23:36:12'),
(75, '10026501', 'Dua Kelinci Kacang Sukro 95G', 99, 8500, 1, 'kacang berbalut tepung dengan bumbu/rempah asli khas Indonesia yang menghasilkan cita rasa yang unik, cocok untuk teman makan dan camilan sehari-hari.', NULL, 'foto_barang/CUR8ZPY4f0oZCDIu9Q5aZJe8l7doSdvJx6tE9MmC.jpg', 2, '2023-12-02 13:46:40', '2023-12-11 08:34:06'),
(76, '20130673', 'Garuda Puffy Stick Jagung Bakar 45G', 99, 5500, 1, 'GARUDA PUFFY STICK ROASTED CORN', NULL, 'foto_barang/si91VWWs29ZoVr0e1Fuw1mWbtoq2KGeL87xDKGVq.jpg', 2, '2023-12-02 13:47:08', '2023-12-11 08:14:42'),
(77, '10000341', 'Dua Kelinci Kacang Garing 370G', 100, 30500, 0, 'Dua kelinci kacang garing, terbuat dari kacang kulit pilihan.', NULL, 'foto_barang/3dBz888YfAbkgKbPKTrOUraqGzRgTkznOFeSd567.jpg', 2, '2023-12-02 13:47:33', '2023-12-08 11:54:38'),
(78, '20053216', 'Nissin Biscuit Kelapa Ijo 280G', 100, 8000, 0, 'Nissin Kelapa Ijo mengandung serat alami karena terbuat dari parutan kelapa asli, dg vitamin dan mineral yang baik untuk tubuh dan proses pembuatan dengan dipanggan sehingga lebih healty', NULL, 'foto_barang/5c1ox7Mu7RnSMGO5o86ljQ4OR78LVkBpRLoh1WWt.jpg', 2, '2023-12-02 13:48:03', '2023-12-08 11:54:40'),
(79, '20130454', 'Dilan Sandwich Biscuit Cokelat Vanilla 80G', 98, 6000, 2, 'BISKUIT SANDWICH SALUT COKELAT DENGAN ISI KRIM VANILA', NULL, 'foto_barang/zxxonDKCg41N18ZvHbo1qWJMHr9M3lG25I95Umxz.jpg', 2, '2023-12-02 13:48:28', '2023-12-11 08:14:42'),
(80, '20131213', 'Kraft Sandwich Oreo Original 6X27.6G', 100, 17000, 0, 'OREO BISCUIT SANDWICH DENGAN KRIM VANILLA HADIR DENGAN KEMASAN PRAKTIS DAN HIGIENIS UNTUK KELUARGA.', NULL, 'foto_barang/V6gq5wQxJksopvuhQaGepmo76uINO0frlDHrhqBC.jpg', 2, '2023-12-02 13:48:59', '2023-12-08 11:54:45'),
(81, '20130007', 'Better Sandwich Biscuit 10\'S Vanilla 100G', 100, 11500, 0, 'Better Sandwich Biscuit adalah biskuit lezat dengan dua lapis biskuit vanila yang diisi dengan krim lembut, menciptakan pengalaman rasa yang memuaskan.', NULL, 'foto_barang/kz8m6NjAX8TDBzBcxxhgF8bN0WxMITtpLzRvdsYd.jpg', 2, '2023-12-02 13:51:12', '2023-12-08 11:55:08'),
(82, '10017675', 'Arnott\'s Biscuit Nyam Nyam Fantasy Stick Choco Berry 25G', 100, 4500, 0, 'Nyam nyam snack biskuit yang enak dengan cokelat yang lezat.', NULL, 'foto_barang/Z7eQ4R6yX80Gb0KzQe1aW7QW6p3RiqTs4wgd9hn1.jpg', 2, '2023-12-02 13:51:36', '2023-12-08 11:55:12'),
(83, '20124895', 'Good Time Cookies Choco Dip 71G', 99, 7000, 1, 'Kukis cokelat dengan cokelat chips lapis cokelat.', NULL, 'foto_barang/xgqAx2NF45FWxf660ttS2ZxPfQX5QeqatN4frJQX.jpg', 2, '2023-12-02 13:52:03', '2023-12-11 08:34:06'),
(84, '20097406', 'Roma Biscuit Susu+Selai Slai O\'lai Blueberry 128G', 99, 6500, 1, 'Biskuit lembut dengan selai yang lezat.', NULL, 'foto_barang/TcQDFFFeuoowlJnDTStmxAxQPemF87H6HJp1rsj8.jpg', 2, '2023-12-02 13:52:31', '2023-12-09 23:36:12'),
(85, '20129863', 'Arnott\'s Nyam Nyam Smiley Cokelat 45G', 100, 8500, 0, 'BISCUIT SANDWICH DENGAN KRIM COKELAT', NULL, 'foto_barang/2a4kuvOWxNRCRlS7C6RHO84ZpL8GBcNNSjcjNykP.jpg', 2, '2023-12-02 13:53:03', '2023-12-08 11:55:18'),
(86, '10016170', 'Kraft Sandwich Oreo Chocolate Creme 119.6G', 98, 10500, 2, 'Oreo biskuit sandwich coklat dengan krim coklat.', NULL, 'foto_barang/F5JOL5qN0YfGFTEB7hwu1gkPOan0dBlJpgnBSncF.jpg', 2, '2023-12-02 13:53:39', '2023-12-11 08:14:42'),
(87, '20112994', 'Nissin Wafer Ovaltine Chocolate Malt 133G', 100, 15500, 0, 'Wafer pertama dengan varian rasa coklatmalt yang merupakan perpaduan sempurna dari wafer renyah Nissin dan krim lembut Ovaltine.', NULL, 'foto_barang/bJdex9mq67kB03VdkGpFZR2UUkjo6KurMvQavEqG.jpg', 2, '2023-12-02 13:54:14', '2023-12-08 11:55:22'),
(88, '10000726', 'Astor Wafer Stick Chocolate 150G', 100, 18500, 0, 'Wafer roll cokelat dengan kombinasi wafer renyah dengan isi cokelat yang banyak.', NULL, 'foto_barang/BIb5pRenZiBuBCt2hHwsGU99bwQMnTCLnRHb9VGf.jpg', 2, '2023-12-02 13:54:52', '2023-12-08 11:55:25'),
(89, '20102638', 'Deka Mini Wafer Bites Choco Choco 80G', 100, 8000, 0, 'Deka Mini Wafer Bites Choco Choco Wafer cokelat persembahan Deka yang crispy diluar dan creamy di dalam, karena terdapat krim cokelat yang manis dan lezat di setiap gigitannya.', NULL, 'foto_barang/sfs3zlCQgdmUfWHkEKWfzffwI0bTF0lVlNDX2lmp.jpg', 2, '2023-12-02 13:55:17', '2023-12-08 11:55:26'),
(90, '10008579', 'Delfi Wafer Stick Twister Minis Black Vanilla 70G', 99, 8500, 1, 'Delfi black cocoa wafer stik dengan krim susu vanilla.', NULL, 'foto_barang/Qa1ncsHSVtdYqk7kFpT2yyFXBnK7LYOGQwP0U2UN.jpg', 2, '2023-12-02 13:55:41', '2023-12-09 23:32:54'),
(91, '20095220', 'Gery Crackers Malkist Saluut Coklat Coconut 105G', 99, 8500, 1, 'Gery malkist saluut krim cokelat dengan taburan kelapa menajadikan salah satu snack yang enak dan sehat.', NULL, 'foto_barang/T9CtJIv3mCeuHjjWMFCnmfrQ5CegEOYaWtRpuWi6.jpg', 2, '2023-12-02 13:56:03', '2023-12-09 23:39:18'),
(92, '20093941', 'Potabee Snack Potato Chips Ayam Bakar 68G', 100, 8000, 0, 'Potabee Keripik kentang rasa ayam bakar dengan bumbu terpisah dan atur sendiri pedasmu.', NULL, 'foto_barang/SRRT5rXIRmn8isTkPg6rhZJ3A854o4klahTOgVDy.jpg', 2, '2023-12-02 13:56:39', '2023-12-08 11:55:49'),
(93, '20118828', 'Chiki Snack Net Potato Barbecue 65G', 100, 5000, 0, 'CHIKI NET snack terbaru dari CHIKI dengan rasa Potato Barbecue yang lezat menjadikan Chiki kesukaan anak Indonesia.', NULL, 'foto_barang/9nmWQ7HbmgW50SHZcwnfusgCUALvapza8AfabBhr.jpg', 2, '2023-12-02 13:57:03', '2023-12-08 11:55:51'),
(94, '20023845', 'Pringles Potato Crisps Cheesy Cheese 102G', 100, 20500, 0, 'Pringles potato crisps cheesy cheese', NULL, 'foto_barang/TCrj80RXYGDJbO0qOybYmfwSgjvjlBSgoHGbrWZu.jpg', 2, '2023-12-02 13:57:31', '2023-12-08 11:55:53'),
(95, '20057730', 'Tic Tic Snack Crunchy Stick Bawang 70G', 100, 6500, 0, 'Stick renyah rasa bawang', NULL, 'foto_barang/PLhknXjYXytQiIdApCmsVR9P1dW3xZXGiwxIPR2Z.jpg', 2, '2023-12-02 13:57:58', '2023-12-08 11:55:55'),
(96, '20124903', 'Qtela Keripik Singkong Ayam Lada Hitam 100g', 99, 9000, 1, 'RENYAHNYA KERIPIK KHAS INDONESIA TERSAJI DISETIAP BUNGKUS QTELA, DENGAN BAHAN BERKUALITAS, KENIKMATAN CITA RASA TRADISIONALTERJAGA LEWAT PROSES PENGOLAHAN BERMUTU DAN TERPERCAYA.', NULL, 'foto_barang/7lUeyBKJa5qI6qggmB82uqBTHR2tInWiXr7pomcw.jpg', 2, '2023-12-02 13:58:28', '2023-12-09 23:12:25'),
(97, '10036562', 'Gaga Sardines Chili & Tomato 155G', 100, 8000, 0, 'Gaga sarden adalah makanan kaleng ikan sarden dengan segala manfaat ikan, terbuat dari ikan dengan kualitas terbaik dan saus yang terbuat dari bahan bahan berkualitas.', NULL, 'foto_barang/fitB3eMBQ4OGaDtiUXCs537440Z39caQKqS6tBBV.jpg', 1, '2023-12-02 14:09:15', '2023-12-08 11:56:00'),
(98, '20025412', 'King\'s Fisher Sarden Goreng Balado 155G', 100, 9500, 0, 'King Fisher sarden adalah makanan kaleng ikan sarden dengan segala manfaat ikan, terbuat dari ikan dengan kualitas terbaik dan saus yang terbuat dari bahan bahan berkualitas.', NULL, 'foto_barang/qUDmJuV3QioVAsNssxRhz7HCApiOqTIb99XZ6LaM.jpg', 1, '2023-12-02 14:09:45', '2023-12-08 11:56:03'),
(99, '10003683', 'Maya Sardines Tomato & Chili Sauce 155G', 100, 9000, 0, 'Maya Sardines Chili Sauce Makanan Kaleng merupakan varian produk Maya berupa ikan yang dikalengkan yang kualitas ikan dan sausnya selalu menjadi perhatian utama', NULL, 'foto_barang/Ev49shFxiNnEQzMQy4Ls1PxVx4fJOjh9QSkQNJHt.jpg', 1, '2023-12-02 14:10:19', '2023-12-08 11:56:05'),
(100, '10036561', 'Maya Sardine In Tomato Sauce 155G', 100, 9000, 0, 'Maya Makarel Saus Tomat merupakan varian produk Maya berupa ikan yang dikalengkan yang kualitas ikan dan sausnya selalu menjadi perhatian utama.', NULL, 'foto_barang/DIrkSLcTnLONcLZuwCsLGcuJSVpaW1yXZQsPvapo.jpg', 1, '2023-12-02 14:11:21', '2023-12-08 11:55:44'),
(101, '20084767', 'Fiesta Mackerel In Chili Sauce 425G', 100, 19000, 0, 'Fiesta mackerel adalah makanan kaleng ikan sarden dengan segala manfaat ikan, terbuat dari ikan dengan kualitas terbaik dan saus yang terbuat dari bahan bahan berkualitas.', NULL, 'foto_barang/y1uVYKOpHtScULbTRQ5Ce9KHLiIL4Yoe6OAjBf6M.jpg', 1, '2023-12-02 14:11:59', '2023-12-08 11:56:26'),
(102, '20096154', 'Asahi Sardines Saus Pedas 155G', 100, 9000, 0, 'Asahi sarden adalah sarden instan yang mudah disipakan. Menggunakan ikan sarden yang diolah dalam varian rasa saus yang nikmat.', NULL, 'foto_barang/Q3HFzGgiGvbtY62lqVOV4sXP7eZJmkWk9KrfECY1.jpg', 1, '2023-12-02 14:12:26', '2023-12-08 11:56:28'),
(103, '20127603', 'Abc Sardines Bumbu Serundeng Goreng 155G', 100, 12000, 0, 'BARU! Sarden ABC Siap Goreng Bumbu Serundeng. Rasanya gurih dan lezat dengan serundeng asli.', NULL, 'foto_barang/YhV6hORrlD6Mdd4ALQ1S7Dy2iaKSp4QxUbFmNNvY.jpg', 1, '2023-12-02 14:13:13', '2023-12-08 11:56:30'),
(104, '10003520', 'Abc Sardines Chili 425G', 99, 29000, 1, 'ABC Sarden Saus Cabai 425g adalah resep masakan Indonesia yang dihasilkan dari perpaduan ikan terbaik dan bumbu berkualitas.', NULL, 'foto_barang/cvOiby1dwYtpFLCaKnzcp0We4fT5iJcWsJI3NddP.jpg', 1, '2023-12-02 14:14:05', '2023-12-09 23:39:18'),
(105, '20096155', 'Asahi Sardines Saus Tomat 155G', 100, 9500, 0, 'Asahi sarden adalah sarden instan yang mudah disipakan. Menggunakan ikan sarden yang diolah dalam varian rasa saus yang nikmat.', NULL, 'foto_barang/JxZsANKXhKANK8G3yZ5V28tVhcLprc8dLtZ9WN4L.jpg', 1, '2023-12-02 14:14:33', '2023-12-08 11:56:37'),
(106, '20108842', 'Pronas Beef Luncheon 198G', 100, 27500, 0, 'Pronas Luncheon Sapi (Daging Sapi Blok Serbaguna) Kemasan kaleng EOE (easy open end) sehingga mudah di buka dan praktis', NULL, 'foto_barang/tQ7zgwsfiz1iHzkpMe3yZ11RaYJA5sPipHonHyJL.jpg', 1, '2023-12-02 14:15:10', '2023-12-08 11:56:39'),
(107, '8942736105', 'INFARM - Pupuk Kandang Kohe Kambing Organik 1L Tidak Berbau dan Tidak Panas', 100, 15000, 0, 'Pupuk kandang kambing memiliki kandungan bahan organik yang tinggi, yang berhasiat untuk memperbaiki kualitas tanah.', NULL, 'foto_barang/kXsev3ovzh6D60KEhnWYYYBLyMRGJnC35ueCexqG.jpg', 10, '2023-12-02 14:25:55', '2023-12-08 11:56:41'),
(108, '3251689740', 'Kompos Pupuk Murni Organik Media Tanam 1Kg Purie Garden', 99, 3500, 1, 'Pupuk Kompos Organik Media Tanam Pupuk kompos organik yang cocok dicampur dengan media apapun. Telah terjual lebih dari 2 ton dan terbukti kualitasnya.', NULL, 'foto_barang/PLdLYLRGV7kIdyUITkr0n0kGHPGA3PbBlPRAOk2o.jpg', 10, '2023-12-02 14:26:28', '2023-12-09 23:39:18'),
(109, '7104938265', 'Pupuk NPK Grower 1Kg Pertumbuhan Tanaman', 100, 25000, 0, 'NPK Mutiara Grower mengandung kombinasi terbaik dari Nitrat-Nitrogen (NO3), yang langsung tersedia untuk tanaman. Pupuk ini juga mengandung Amonium-Nitrogen (NH4), yang secara perlahan tersedia sebagai cadangan.', NULL, 'foto_barang/zs6rtvUCQkRQrQF23EYufWuX4qV0N4HPVMXa32Vv.jpg', 10, '2023-12-02 14:27:49', '2023-12-08 11:56:46'),
(110, '4592873610', 'Benih Seribuan - Pupuk NPK Booster 15-10-20', 100, 10000, 0, 'NPK Mutiara Boost 15-10-20+TE memberikan reaksi super cepat pada tanaman untuk membentuk Bunga dan Buah karena mengandung kombinasi terbaik dari Nitrat-Nitrogen (NO3), yang langsung tersedia untuk tanaman serta mengandung Amonium-Nitrogen (NH4)', NULL, 'foto_barang/1ujXpBJf6Fj7MeIxZJGc8PoobhpGlN4nk1zPctts.jpg', 10, '2023-12-02 14:30:36', '2023-12-08 11:56:24'),
(111, '6310972458', 'EM4 Pertanian 1Liter Mikro Organisme Pupuk Organik Cair Tanaman', 99, 26000, 1, 'EM-4 merupakan suatu cairan yang berwarna kecoklatan dan beraroma manis asam (segar) yang mana didalamnya terkandung campuran dari beberapa mikroorganisme hidup', NULL, 'foto_barang/OsvZr2ds38iHCParyAcIVlCoQBHrRsBRGyLISoC9.jpg', 10, '2023-12-02 14:32:11', '2023-12-12 02:13:09'),
(112, '8021563749', 'Nanem Taneman - Pupuk VITAMIN B1 liquinox 100ml', 100, 32500, 0, 'vitamin B1 liquinox menjadi tanaman menjadi subur', NULL, 'foto_barang/3Bd1xOvWd06KOxpvZXzDBcETanPthIUlG26kylUF.jpg', 10, '2023-12-02 14:33:01', '2023-12-08 11:57:16'),
(113, '1478905326', 'MEROKE KLINITRA 1 KG Pupuk Tanaman Petani', 100, 55000, 0, 'Menyediakan kombinasi terbaik untuk memberikan hasil dan pendapatan yang tinggi. Tanaman tumbuh dengan sehat dan memaksimalkan produktivitas jangka panjang.', NULL, 'foto_barang/kVTYBc22ZKEQdjlz1glaqpgpHoBufHwYLMxySl6c.jpg', 10, '2023-12-02 14:33:42', '2023-12-08 11:57:18'),
(114, '9362058741', 'Pupuk Organik Humat Pro 100gr', 100, 10000, 0, 'Meningkatkan pengisian bulir padi, besar buah dan umbi serta jumlah biji/polong. Meningkatkan ketahanan tanaman terhadap cekaman stress lingkungan.', NULL, 'foto_barang/uoXMaIxkLiECMu6sMIXkVMTxQEMj92T7R9tujH8G.jpg', 10, '2023-12-02 14:34:31', '2023-12-08 11:57:20'),
(115, '5846301972', 'AGRICON - AGRIMORE Even Vitamin Pupuk Tanaman 500 gram', 100, 60500, 0, 'Agrimore Even adalah Pupuk daun lengkap berbentuk butiran berwarna biru yang bersifat mudah larut di dalam air (kelarutan homogen), mudah diserap tanaman dengan sempurna.', NULL, 'foto_barang/w0WRbGqsrV1nqBkxAH7R3vNJ9pgyXX6kOlXr9Qpz.jpg', 10, '2023-12-02 14:35:11', '2023-12-08 11:57:23'),
(116, '2198745036', 'Benih Seribuan - Pestisida Nabati 150mL Formula Organik Tipe Konsentrat untuk Semua Hama Tanaman', 100, 17500, 0, 'Formula Lengkap 3in1 : Insektisida, Fungisida dan Bakterisida. Mampu bekerja Kontak dan Sistemik secara bersamaan', NULL, 'foto_barang/iYlbDPdUfxK9E9QxFiLXEgZMRdjcxl0nDImutDw0.jpg', 10, '2023-12-02 14:36:36', '2023-12-08 11:57:25'),
(117, '478512936', 'Beras Ratu Ayu 10kg', 100, 105000, 0, 'Beras Ratu Ayu kemasan 10kg', NULL, 'foto_barang/8cTeAw4WC25qHsTEIBP2nY0NSx8eQD54z5DYczrN.jpg', 11, '2023-12-02 14:57:00', '2023-12-08 11:57:27'),
(118, '693247185', 'Beras Ratu Premium Ungu 10kg', 100, 140000, 0, 'Beras Ratu Premium Ungu 10kg', NULL, 'foto_barang/fZpEqFkn2gs7PxuoWQPU4GYWYuop7g4oiF2Srd8l.jpg', 11, '2023-12-02 14:57:27', '2023-12-08 11:57:29'),
(119, '812365497', 'Beras Ratu Ayu 25kg', 99, 258000, 1, 'Beras Ratu Ayu kemasan 25kg', NULL, 'foto_barang/BqsqJG2yVp7uIC2MHc1GI2UcENWcn9JgOeT0wK4I.jpg', 11, '2023-12-02 14:57:56', '2023-12-12 02:18:52'),
(120, '245198763', 'Beras Putri Sejati 10kg', 99, 145000, 1, 'Beras Putri Sejati 10kg adalah beras yang termasuk jenis beras pulen dengan aroma wangi dan bersih. Beras ini tidak memakai pemutih, pengawet, dan pewangi. Cocok untuk makan di rumah maupun restoran', NULL, 'foto_barang/hAYWwSIr6o38o1Hh9B8BcsMkOMHGz5h325nRbZc4.jpg', 11, '2023-12-02 14:58:24', '2023-12-11 04:08:51'),
(121, '976431258', 'Beras super Putri sejati 5 kg', 99, 80000, 1, 'Beras putri sejati 5kg', NULL, 'foto_barang/8hSdBPIA4ip36AFGINz2lEjZF76ddNJRaH9fK4jc.jpg', 11, '2023-12-02 14:58:59', '2023-12-09 23:12:25'),
(122, '531824679', 'SANIA BERAS 5 KG', 100, 69500, 0, 'Sania Beras Yang Banyak Diminati Orang Karena Berasnya Yang Gurih Dan Aman Di Gunakandengsn Design Yang Menarik', NULL, 'foto_barang/4gyytV54iDTQv3FgFpoKg2dRC5kUcm0t4FeDa5O3.jpg', 11, '2023-12-02 14:59:30', '2023-12-08 11:58:01'),
(123, '689703124', 'RAJA ULTIMA BERAS SLYP SUPER 5 KG', 100, 69500, 0, 'Beras raja Ultima adalah beras yang Dikemas secara modern dan berkualitas dengan Rasa beras yang gurih sehingga enak dan lezat pada saat di makan', NULL, 'foto_barang/AL4LRY4taOpu4Y5228QVFybJqyyosmcfys9mRlvX.jpg', 11, '2023-12-02 15:00:03', '2023-12-08 11:58:03'),
(124, '20090527', 'Crystalin Air Mineral 600mL', 100, 3000, 0, 'Air minum dalam kemasan berasal dari sumber mata air yang terpilih dengan segala kemurnian dan kandungan mineral alami.', NULL, 'foto_barang/c8OfUXGxCh2mOFfWlwcR4BzKrVJNMtFE3t5QCIp7.jpg', 12, '2023-12-05 05:51:04', '2023-12-08 11:58:05'),
(125, '20121514', 'Le Minerale Air Mineral 15L', 98, 19500, 2, 'Le minerale air minum dalam kemasan. Air mineral pegunungan, dibotolkan langsung di sumbernya.', NULL, 'foto_barang/iEAXSuG5XwZKQgtQUw4wniaDRjJy905rAkFsFSCv.jpg', 12, '2023-12-05 05:51:29', '2023-12-12 02:13:09'),
(126, '10003814', 'Aqua Air Mineral 600Ml', 100, 4000, 0, 'AQUA berasal dari sumber mata air yang terpilih dengan segala kemurnian dan kandungan mineral alami yang terpelihara./nDengan proses yang baik, memastikan higienis tetap terjaga./nAQUA dikemas dengan proses higienis dalam beberapa ukuran.', NULL, 'foto_barang/jEDBEb2PpxXaFOr0xLevk0bGv0OSp31O3d6MePwh.jpg', 12, '2023-12-05 05:51:58', '2023-12-08 11:58:09'),
(127, '20047247', 'Aqua Air Mineral Click N Go 750Ml', 100, 6500, 0, 'AQUA berasal dari sumber mata air yang terpilih dengan segala kemurnian dan kandungan mineral alami yang terpelihara./nDengan proses yang baik, memastikan higienis tetap terjaga./nAQUA dikemas dengan proses higienis dalam beberapa ukuran.', NULL, 'foto_barang/r8ySRYdsL8j5HrRfqSp0y0Nd9IZ43sy8cTuOohKT.jpg', 12, '2023-12-05 05:52:25', '2023-12-08 11:58:12'),
(128, '20085988', 'Le Minerale Air Mineral 1500Ml', 100, 6500, 0, 'Le minerale air minum dalam kemasan. Air mineral pegunungan, dibotolkan langsung di sumbernya.', NULL, 'foto_barang/XnPxbmxn9P6Ftxf57p1zcNuAWsnsQeryMic2oaBB.jpg', 12, '2023-12-05 05:53:03', '2023-12-08 11:58:14'),
(129, '20069208', 'Le Minerale Air Mineral 600Ml', 100, 3500, 0, 'Le minerale air minum dalam kemasan. Air mineral pegunungan, dibotolkan langsung di sumbernya.', NULL, 'foto_barang/goCnTbubpaQ8hL9vA0pRUPNR0A4UtStUe0RfL5tg.jpg', 12, '2023-12-05 05:53:31', '2023-12-08 11:58:16'),
(130, '10036631', 'Aqua Galon Refill (Hanya Isi) 19L', 99, 21500, 1, 'AQUA berasal dari sumber mata air yang terpilih dengan segala kemurnian dan kandungan mineral alami yang terpelihara. Dengan proses yang baik, memastikan higienis tetap terjaga. AQUA dikemas dengan proses higienis.', NULL, 'foto_barang/EV2YycJEuiUYb6ngSm3s9QrhmMSq6LEvKLlqKpDr.jpg', 12, '2023-12-05 05:54:13', '2023-12-12 02:18:52'),
(131, '10037807', 'Aqua (Galon + Isi) 19L', 100, 56500, 0, 'AQUA berasal dari sumber mata air yang terpilih dengan segala kemurnian dan kandungan mineral alami yang terpelihara. Dengan proses yang baik, memastikan higienis tetap terjaga. AQUA dikemas dengan proses higienis dalam beberapa ukuran kemasan botol plast', NULL, 'foto_barang/9WapTq0lsbBkPW6x2QE7tqdCvUDq04MdUrlo2nyJ.jpg', 12, '2023-12-05 05:54:43', '2023-12-08 11:58:53'),
(132, '20061938', 'Super O2 Air Mineral Sportivo 600Ml', 100, 10500, 0, 'Air minum dalam kemasan pet yang lebih banyak mengandung oksigen. Berasal dari mata air pegunungan Pangrango yang begitu alami.', NULL, 'foto_barang/LpUqZ8kmQN6V95oZ0HYdxYgc7wC3ZY0jjhcw8FXN.jpg', 12, '2023-12-05 05:55:41', '2023-12-08 11:58:56'),
(133, '20066629', 'Hemaviton Health Drink C1000 + Collagen Orange 150Ml', 100, 3500, 0, 'Hemaviton C1000+collagen dengan rasa orange dapat membantu memelihara daya tahan tubuh', NULL, 'foto_barang/3A253SodHT6eD8UzlA9CXjCinAX1EFujAvBdvs0B.jpg', 3, '2023-12-05 06:02:37', '2023-12-08 11:58:58'),
(134, '20119547', 'Tebs Sparkling Lemon Lime 300Ml', 99, 5000, 1, 'Dari air berkualitas dan rasa buah pilihan sehingga lebih terasa kesegarannya', NULL, 'foto_barang/d3a6eXszlwxHlBJUZBaTLRRG7META8UyWvczku3a.jpg', 3, '2023-12-05 06:03:10', '2023-12-11 08:14:42'),
(135, '10002602', 'M-150 Minuman Kesehatan 150mL', 100, 5000, 0, 'Menyegarkan badan, baik diminum pada saat kerja keras atau berolahraga.', NULL, 'foto_barang/TUmefsk7ylYRb4coCoCKUXiemCmt8z33dmNpwgO4.jpg', 3, '2023-12-05 06:03:34', '2023-12-08 11:59:02'),
(136, '20014608', 'Neo Hormoviton Energi Drink 150Ml', 100, 6500, 0, 'Neo hormoviton pasak bumi mengandung komposisi pilihan untuk membantu menjaga stamina.', NULL, 'foto_barang/zeWmE3vPDLrX0zYNgkiQdPYVRLolyIC8RY2feokP.jpg', 3, '2023-12-05 06:03:59', '2023-12-08 11:59:05'),
(137, '10000690', 'Fanta Soft Drink Strawberry 1500Ml', 99, 11500, 1, 'Fanta minuman berkarbonasi rasa stroberi yang menyegarkan.', NULL, 'foto_barang/fqcENbOgFLeDMIY9W0z0OJHrZ5xH5isMjhLCpJFH.jpg', 3, '2023-12-05 06:04:28', '2023-12-11 04:08:51'),
(138, '10000689', 'Sprite Soft Drink 1500Ml', 98, 11500, 2, 'Sprite minuman rasa jeruk lemon & lime berkarbonasi botol 1500mL', NULL, 'foto_barang/61g24dY6OQnzYmsgIMmHwdhCuSIOSgvqa1Ra6rnx.jpg', 3, '2023-12-05 06:05:00', '2023-12-11 08:34:06'),
(139, '20116490', 'Hydro Coco Natural Health Drink 1L', 99, 25000, 1, 'Hydro coco dibuat dengan air kelapa asli (bukan konsentrat) tanpa menambahkan air serta diproses secara aseptis.', NULL, 'foto_barang/cjvMcvQpdPmRp3BE3jxGq5YWBfhFCx3xShNzgvKE.jpg', 3, '2023-12-05 06:05:28', '2023-12-11 08:04:49'),
(140, '10003389', 'Kiranti Sehat Datang Bulan 150Ml', 100, 7000, 0, 'Membantu mengatasi keluhan saat haid seperti: nyeri haid dan bau tak sedap serta membantu memperlancar haid sehingga tubuh terasa segar dan sehat.', NULL, 'foto_barang/FT1UZUzSTaHBAo9D0EY6Onf1TocoHS5HkZ1yqxea.jpg', 3, '2023-12-05 06:05:55', '2023-12-08 11:59:36'),
(141, '20097484', 'Sprite Soft Drink Waterlymon 425Ml', 100, 6000, 0, 'Minuman berkarbonasi dengan lemon lime yang menyegarkan.', NULL, 'foto_barang/QEZvNtv4Y8vuw36vDpxvn1ZZxQrjVcA1UkdKDwuy.jpg', 3, '2023-12-05 06:06:20', '2023-12-08 11:59:39'),
(142, '20040276', 'Adem Sari Ching Ku Lemon 320Ml', 99, 8500, 1, 'Redakan panas dalam, sakit tenggorokan, sariawan, bibir pecah-pecah, dan buang-buang air besar dengan Adem Sari Chingku, yang menjadi sari penyegar yang mengandung ekstrak Citrus Aurantifolia.', NULL, 'foto_barang/pIqUyPULMecQZpCcxz5ZcqqtV9npUqGe2s4AbZQM.jpg', 3, '2023-12-05 06:06:52', '2023-12-09 23:36:12'),
(143, '20053540', 'Adem Sari Ching Ku Minuman Penyejuk 350Ml', 100, 8500, 0, 'Adem sari ck minuman perisa lemon yang dibuat dengan 3 ekstrak herbal yang menyegarkan botol 350mL', NULL, 'foto_barang/IKYYFp5mkUwnvtVOdU9cywglWfi4JULzcXxlRd9N.jpg', 3, '2023-12-05 06:07:13', '2023-12-08 11:59:43'),
(144, '10008581', 'Cap Badak Larutan Penyegar Putih 500Ml', 100, 9000, 0, 'Membantu meredakan sariawan, panas dalam yang disertai tenggorokan kering, susah buang air besar.', NULL, 'foto_barang/luTspnsujruCcoZEyd0h8LjdiF67jqmNdkeuUm8Q.jpg', 3, '2023-12-05 06:07:37', '2023-12-08 11:59:45'),
(145, '20032785', 'Big Soft Drink Cola 375mL', 100, 3500, 0, 'Minuman berkarbonasi rasa cola', NULL, 'foto_barang/ZiTF8V6sZ118KvfzA07KVH2PGPLoPuVMnn1uFMKW.jpg', 3, '2023-12-05 06:07:59', '2023-12-08 11:59:47'),
(146, '10003842', 'Cap Badak Larutan Penyegar Jambu 320mL', 99, 7500, 1, 'Membantu meredakan sariawan, panas dalam yang disertai tenggorokan kering, susah buang air besar.', NULL, 'foto_barang/QTae9VqIplMvWp66GuYRDFNjHvGEGMyXNDtn3ept.jpg', 3, '2023-12-05 06:08:22', '2023-12-12 02:11:12'),
(147, '10003373', 'Indomilk Susu Cair Botol Chocolate 190Ml', 100, 4500, 0, 'Susu indomilk sebagai sumber kalsium, fosfor dan vitamin D mengandung vitamin A, B2, B3 dan B6. Kalsium berperan didalam pembentukan dan mempertahankan kepadatan tulang dan gigi.', NULL, 'foto_barang/vWE8WwvUIQUFImYNfSWr6yMyDO3ToIlwuOoDIsu2.jpg', 13, '2023-12-05 14:45:23', '2023-12-08 11:59:51'),
(148, '20115188', 'Cimory Fresh Milk Uht Almond 250Ml', 100, 6500, 0, 'Susu Cimory dibuat dari susu sapi segar yang berasal dari pegunungan Puncak, Jawa Barat. Susu Cimory memiliki rasa yang creamy, ciri khas susu sapi segar.Dengan berbagai rasa coklat yang unik', NULL, 'foto_barang/6crSqF7gd2ANEEq3P3KSgxmN1quOLfyHDI2hWDVi.jpg', 13, '2023-12-05 14:45:51', '2023-12-08 11:59:53'),
(149, '20122822', 'Cimory Fresh Milk Uht Marie Biscuits 250mL', 100, 6500, 0, 'Susu Cimory dibuat dari susu sapi segar yang berasal dari pegunungan Puncak, Jawa Barat. Susu Cimory memiliki rasa yang creamy, ciri khas susu sapi segar.Dengan berbagai rasa coklat yang unik', NULL, 'foto_barang/apFT2LyzYXoh2WpOF5xYQmY42WZQcXZfAyU6T5GD.jpg', 13, '2023-12-05 14:46:53', '2023-12-08 11:59:33'),
(150, '20117682', 'Delmonte Boba Milk Tea Red Velvet 240Ml', 100, 10000, 0, 'Minuman rasa red velvet dengan popping bobo. Lebih nikmat disajikan dalam keadaan dingin.', NULL, 'foto_barang/DRJ7pbEHcof4XCSWqvxxWqQtmschu97qz729v1IY.jpg', 13, '2023-12-05 14:47:21', '2023-12-08 12:00:15'),
(151, '20130183', 'Greenfields Uht Milk Extra Choco Malt 200mL', 100, 7500, 0, 'Susu UHT rasa cokelat malt', NULL, 'foto_barang/2MMa8H9FdIc2S0OaHowuZFlws7L7eRMphtdqUWDN.jpg', 13, '2023-12-05 14:47:59', '2023-12-08 12:00:18'),
(152, '10004906', 'Bear Brand Susu Encer Steril 189Ml', 100, 10500, 0, 'Bear brand terbuat dari 100% susu sapi steril murni. Susu steril dianjurkan untuk setiap kegunaan yang membutuhkan susu dan dapat di konsumsi setiap hari sesuai kebutuhan.', NULL, 'foto_barang/4alvjjsLgHvNojmBcgNHKIytPB09DHLoMJONI5ik.jpg', 13, '2023-12-05 14:48:24', '2023-12-08 12:00:20'),
(153, '20019180', 'Bear Brand Susu Encer Gold Teh Putih 140Ml', 100, 11500, 0, 'Bear brand GOLD susu steril rendah lemak tinggi kalsium dengan rasa yang enak mengandung sari teh putih (white tea) vitamin A, B1, B2, B6, B12, C, D dan E.', NULL, 'foto_barang/ENx5Db8AyvGQ1D9PRHE6TYqCk9Ij2rgRPllsBENC.jpg', 13, '2023-12-05 14:48:46', '2023-12-08 12:00:21'),
(154, '20034080', 'Frisian Flag Susu Cair Low Fat Strawberry 225Ml', 100, 7500, 0, 'Untuk kamu yang aktif dan energik, pastikan kebutuhan kalsiummu terpenuhi setiap hari. Frisian flag dengan kandungan tinggi kalsium dan rendah lemak, serta vitamin C dan E yang tinggi.', NULL, 'foto_barang/FiNqRdltp63wvQlMJGDbsOWqIfyM1zK14n3WlO8N.jpg', 13, '2023-12-05 14:49:10', '2023-12-08 12:00:23'),
(155, '20070253', 'Frisian Flag Susu Cair Uht Coconut Delight 225Ml', 100, 6500, 0, 'Susu cair dengan rasa kelapa muda yang lezat dan kandungan vitamin dan mineral.', NULL, 'foto_barang/sC0EmTvi5XYlkyceFoumEtOg0wjKjHoxNMU4WvFz.jpg', 13, '2023-12-05 14:49:46', '2023-12-08 12:00:25'),
(156, '20118209', 'Greenfields Uht Milk Strawberry 250Ml', 100, 7500, 0, 'susu cair siap minum yang terbuat dari 100% susu sapi segar dengan kandungan vitamin dan mineral serta tinggi kalsium', NULL, 'foto_barang/aKrTjw5vsZFx1WjYYRu0ZEjdObgOIwNKpnq1hpZ7.jpg', 13, '2023-12-05 14:50:07', '2023-12-08 12:00:27'),
(157, '20103378', 'Top Coffee Kopi Gula 2 In 1 20X25g', 100, 18000, 0, 'Top Coffee Gula merupakan kopi yang terbuat dari perpaduan sempurna biji kopi Robusta dan Arabika pilihan. Perpaduan sempurna ini menghadirkan aroma kopi dengan karakter yang khas dan berbeda serta menghasilkan cita rasa yang tinggi.', NULL, 'foto_barang/WpnkHxKzsO5uJV6tv1T0ijWXJP9OeEeflsLduO5C.jpg', 14, '2023-12-05 14:56:54', '2023-12-08 12:00:29'),
(158, '20099155', 'Neo Coffee Kopi Instant (6+3) Caramel Machiato 180g', 100, 8500, 0, 'Miniman kopi bubuk instant dengan rasa dan aroma yang mantap.', NULL, 'foto_barang/dC96iXeyia3andYdvgpigrwWXxPmLQRIxkeOfDIn.jpg', 14, '2023-12-05 14:57:27', '2023-12-08 12:00:32'),
(159, '20055193', 'Top Coffee Kopi Gula Susu 3 In 1 20X31g', 100, 22500, 0, 'Kombinasi biji kopi berkualitas baik dengan gula ditambah dengan susu memberikan rasa dan aroma yang nikmat', NULL, 'foto_barang/27ULiMCusPd7T7Tp3iSkizwMIJMDFR1YBuDfwBR6.jpg', 14, '2023-12-05 14:57:49', '2023-12-08 12:00:13');
INSERT INTO `barangs` (`id`, `kode_barang`, `nama_barang`, `total_stok`, `harga_jual`, `jumlah_terjual`, `keterangan`, `status`, `foto_barang`, `kategori_barang_id`, `created_at`, `updated_at`) VALUES
(160, '20031318', 'Good Day Kopi Instant Cappuccino W/Coklat Granul 10X25g', 99, 21000, 1, 'Kopi seduh rasa cappucinno dengan coklat granule', NULL, 'foto_barang/Q01vtYDIFoYI6Ow4aDIkHe8ws1qaZRWKKCqufrqd.jpg', 14, '2023-12-05 14:58:10', '2023-12-09 23:32:54'),
(161, '20124713', 'Luwak Coffee Drink Kopi + Gula 220mL', 100, 6000, 0, 'Minuman Kopi + gula siap minum dibuat dari biji kopi pilihan dan gula. Paduan kopi dan gula siap minum, memudahkan anda dalam menikmati kopi yang harum sedan dan enak.', NULL, 'foto_barang/aBwev8GAgkeNxrrEMdhhLlwPlU0x383oIG6b6IXf.jpg', 14, '2023-12-05 14:58:33', '2023-12-08 12:00:54'),
(162, '20056193', 'Good Day Coffee Drink Avocado Delight 250Ml', 100, 7000, 0, 'Minuman kopi dalam kemasan botol dengan perpaduan rasa dan aroma kopi dan alpukat yang lembut dan istimewa.', NULL, 'foto_barang/AgQV6H9urD1X99O4NBsbsAEiZ1mdYXitOtRoc8l3.jpg', 14, '2023-12-05 14:58:59', '2023-12-08 12:00:56'),
(163, '20130531', 'Kopi Kenangan Hanya Untukmu Coffee Drink Indonesiano 200mL', 100, 7000, 0, 'Kopi Kenangan Hanya Untukmu Indonesiano', NULL, 'foto_barang/PrJ10OtirvzjUOElowG5TJs2dWqE6Q1607MplthW.jpg', 14, '2023-12-05 14:59:28', '2023-12-08 12:00:58'),
(164, '20060370', 'Good Day Kopi Instant 3 In 1 Chococinno 10X20g', 100, 15000, 0, 'Buat kamu-kamu yang emang cinta banget ama coklat, ini dia pilihannya!, Nikmat dan aroma khas kopi berbaur dengan rasa coklat yang gak ada duanya. Tiap teguk good day chococinno memberi sensasi yang bener-bener beda.', NULL, 'foto_barang/KBHvaWB9j0mLLjpVFFf0YLKhW9oiVpSnL61KFyvW.jpg', 14, '2023-12-05 14:59:52', '2023-12-08 12:01:01'),
(165, '20102790', 'Abc Coffee Drink Milk Coffee 200mL', 100, 3500, 0, 'ABC Kopi Susu terbuat dari perpaduan biji kopi brazil pilihan dan susu new zealand yang nikmat', NULL, 'foto_barang/msstcUAYJrsdrKcDkqgm0NELNnE2jARYBiGXcHcY.jpg', 14, '2023-12-05 15:00:22', '2023-12-08 12:01:03'),
(166, '20124961', 'Caffino Kopi Instant 3 In 1 Mocca 10X20G', 100, 15500, 0, 'Caffino Kopi Latte mocca kopi Instant 3 in 1 dengan kopi asli yang suka perpaduan pas antara kopi dan mocca untuk penikmat kopi kekinian ala Cafe.', NULL, 'foto_barang/afBnoTyKjvAEzKO4vOymMgnPd2K45YVpvFgqWP6h.jpg', 14, '2023-12-05 15:00:52', '2023-12-08 12:01:05'),
(167, '10037725', 'Sun Bubur Tim Instan 8+ Ati Ayam & Jagung Manis 100G', 100, 14500, 0, 'Sun bubur lanjutan kini dengan Esenutri. Memenuhi kebutuhan zat besi 55% kebutuhan bayi usia 8-12 bulan dan di lengkapi dengan 11 vitamin dan 6 mineral.', NULL, 'foto_barang/iDA4W39RqVDS0eU5C3DxlA1z6eskuO3M2ghe5Plr.jpg', 15, '2023-12-08 10:53:32', '2023-12-08 12:01:08'),
(168, '20047669', 'Sun Bubur Tim Instan 8+ Ayam & Sayur 100G', 100, 14500, 0, 'Sun bubur lanjutan kini dengan Esenutri. Memenuhi kebutuhan zat besi 50% kebutuhan bayi usia 8-12 bulan dan di lengkapi dengan 11 vitamin dan 6 mineral.', NULL, 'foto_barang/CgZc8v1MhlR66cabGBR5znLskyPSpfi6nSI5uSVa.jpg', 15, '2023-12-08 10:53:58', '2023-12-08 12:01:10'),
(169, '20001701', 'Milna Biskuit Bayi Original 130G', 100, 18000, 0, 'Milna biskuit bayi 6+ bln, makanan pendamping asi biskuit untuk bayi dan anak usia 6-24 bln.', NULL, 'foto_barang/HMwZChJm4WioU6OznoT58isKuFf305XoNo358WrX.jpg', 15, '2023-12-08 10:54:26', '2023-12-08 12:01:13'),
(170, '20103062', 'Milna Nature Puffs Organic Apple & Mix Berries 15G', 100, 8000, 0, 'MILNA Nature Puff Organic Apple and Mix Berries Pouch - 15gr merupakan produk dari MILNA berupa makanan ringan untuk bayi 8 bulan ke atas. Terbuat dari bahan-bahan alami yang dapat memenuhi nutrisi bayi, seperti beras, gandum, dan buah.', NULL, 'foto_barang/kGORctjEU7aKnLguqV9lxMitO82e0nT8NrjNAqtd.jpg', 15, '2023-12-08 10:54:55', '2023-12-08 12:01:33'),
(171, '10010351', 'Frisian Flag 123 Jelajah Susu Bubuk Pertumbuhan Madu 800G', 100, 95000, 0, 'Susu pertumbuhan untuk anak usia 1-3 tahun dengan nutrisi yang lengkap, seimbang dan rasa yang enak.', NULL, 'foto_barang/zuKWF06c10PrqMNQs0p3qsaDcxf9Ban91u7oz66F.jpg', 15, '2023-12-08 10:55:21', '2023-12-08 12:01:36'),
(172, '10022197', 'Sun Bubur Susu (Ekonomis) Pisang 120G', 100, 8000, 0, 'Makanan pendemping ASI bubuk instan untuk bayi dan anak usia 6-24 bulan dengan nutrisi lengkap dan seimbang.', NULL, 'foto_barang/DWsF5i0ZasZCD8GYTpq240KS3awP2WEN0HN6PPRL.jpg', 15, '2023-12-08 10:55:45', '2023-12-08 12:01:39'),
(173, '20049082', 'Sgm Soya 1+ Eksplor Pro-Gressmaxx Madu 400G', 100, 58000, 0, 'Susu pertumbuhan anak usia 1-5 tahun dengan berbahan dasar kedelai, sangat disarankan untuk anak yang alergi dengan susu sapi.', NULL, 'foto_barang/37YUE2jK5P26n9GOo8zpkdLJntuyUCNjl4TNxtB0.jpg', 15, '2023-12-08 10:56:09', '2023-12-08 12:01:41'),
(174, '20122273', 'My Baby Hair Lotion Black & Shine 100mL', 100, 20000, 0, 'Diperkaya dengan Kemiri dan Alpukat untuk membantu merawat kesehatan rambut, membuat rambut terlihat lebih tebal, hitam, dan berkilau. Dengan keharuman segar yang disukai dari buah-buahan. Lotion perawatan rambut dan kulit kepala bayi.', NULL, 'foto_barang/ymf5PEeZQsODqH8doNNQs0755NyZ1uc5k9PIS5zL.jpg', 15, '2023-12-08 10:56:38', '2023-12-08 12:01:43'),
(175, '20087203', 'Cussons Baby Wipes Fresh & Nourish 2x45\'s', 100, 15000, 0, 'Membersihkan, menyegarkan, membantu menutrisi kulit bayi. Dapat digunakan sehari-hari untuk membersihkan tangan dan mulut bayi saat dirumah, dalam perjalanan dan mengganti popok.', NULL, 'foto_barang/VL7hBRGdi4xvS6Y9sRYO2pZ7O84d94fmbMVwsRmw.jpg', 15, '2023-12-08 10:57:26', '2023-12-08 12:01:45'),
(176, '20009872', 'Zwitsal Baby Sabun Mandi Cair Natural Milk Honey 200Ml', 100, 30000, 0, 'Zwitsal Natural Baby Bath Milk & Honey 200ml adalah sabun cair untuk si kecil dengan kandungan Protein Susu dan Madu akan membersihkan dan menjaga kulit bayi tetap halus dan tampak segar dalam kemasan botol.', NULL, 'foto_barang/OOWQsIPew6JQB0VmFiam1Lo5EjTaezXwWlofRRgd.jpg', 15, '2023-12-08 10:57:49', '2023-12-08 12:01:48'),
(177, '20125110', 'My Baby Kids Kids Toothpaste Orange 45g', 100, 6000, 0, 'Pasta gigi yang diformulasikan khusus untuk anak-anak dengan rasa buah yang segar agar anak senang menggosok gigi secara teratur. Kombinasi Double Flouride (SMFP dan Sodium Flouride) dan Calcium membantu menjaga kesehatan dan kekuatan gigi', NULL, 'foto_barang/0oWtDNXjSVdNAKCqLPRE0ild0Cl0CNYgVuDsXOxa.jpg', 15, '2023-12-08 10:58:20', '2023-12-08 12:01:50'),
(178, '10004106', 'Kodomo Pasta Gigi Anak-Anak Orange 45G', 100, 7000, 0, 'Kodomo pasta gigi untuk anak-anak dengan rasa jeruk yang mengandung fluoride dan xylitol untuk membantu mencegah gigi berlubang dengan remineralisasi gigi dan sekaligus menjaga kesehatan gigi anak.', NULL, 'foto_barang/gqnazb3eDy8r0Ic69uAWVTLxXCLSRV7nAOTBVYlW.jpg', 15, '2023-12-08 10:58:47', '2023-12-08 12:01:52'),
(179, '20090400', 'Kodomo Body Wash Strawberry 200Ml', 100, 17000, 0, 'Kodomo Shampoo dan conditioner anak', NULL, 'foto_barang/j9ifc4POBC84qt7BtbUk06fM58LxINuD0BbBgHRx.jpg', 15, '2023-12-08 10:59:06', '2023-12-08 12:01:30'),
(180, '20105698', 'Zwitsal Kids Bubble Bath Clean & Fresh 280Ml', 100, 29000, 0, 'Sabun cair yang cocok untuk anak, dengan keharuman buah melon yang segar. Membersihkan dan melembabkan kulit secara menyeluruh, menjaga kesegaran setiap hari. Busa wangi yang melimpah bikin mandi jadi seru!', NULL, 'foto_barang/bjqkm1EkiDMjxWrtFxOiYaXbuOpQtPdW2roCL5MO.jpg', 15, '2023-12-08 10:59:28', '2023-12-08 12:02:21'),
(181, '20082402', 'Cussons Kids Hair & Body Cologne Fruity Berries 100Ml', 100, 19000, 0, 'Cussons Kids Hair & Body Cologne Fruity Berries 100ml adalah produk perawatan multifungsi yang dirancang khusus untuk anak-anak.', NULL, 'foto_barang/LF3Dj6BjKQs99UpzJFnrQ6Q8slPh1DRWEuOyFyNi.jpg', 15, '2023-12-08 11:00:35', '2023-12-08 12:02:24'),
(182, '20045421', 'Mamy Poko Pants Standar 24\'S XXL', 100, 74000, 0, 'Gel extra serap untuk pemakaian lebih lama dapat menyerap pipis sampai gel berkembang menjadi 40x ukurannya sehingga bayi merasa lebih nyaman.', NULL, 'foto_barang/ye7Q5zmsGmYaqKBL4lmiOoUdYrzDng4fRCrRLGAS.jpg', 15, '2023-12-08 11:01:04', '2023-12-08 12:02:26'),
(183, '20009855', 'Baby Happy ! Baby Diapers Pants 18\'S XXL', 100, 50000, 0, 'Popok celana sekali pakai dari Baby Happy kini dirancang dengan daya serap extra 70%, dengan Air Through Technology sehingga mampu menyerap cairan lebih cepat dan menjaga kulit bayi tetap kering.', NULL, 'foto_barang/Rdu1BYon2UwBAynZYwcBkQzsabqA1MT7CtxrAa8R.jpg', 15, '2023-12-08 11:01:43', '2023-12-08 12:02:28'),
(184, '20072923', 'Baby Happy ! Baby Diapers Pants 32\'S Medium', 100, 57000, 0, 'Popok celana sekali pakai dari Baby Happy ini dirancang praktis untuk dikenakan pada bayi yang aktif bergerak.', NULL, 'foto_barang/UAEOO5jmmek8UPfUf86z9M54mX866ZHUU6NqgF3D.jpg', 15, '2023-12-08 11:02:22', '2023-12-08 12:02:30'),
(185, '20045422', 'Mamy Poko Pants Standar isi 28 L', 100, 65000, 0, 'Mamy poko pants standar popok bayi tipe celana L 9-14kg isi 28 pcs, 12 Jam daya serap. Meyerap banyak lebih cepat kering, Si kecil nyaman sepanjang hari.', NULL, 'foto_barang/F2N6dUcKgIDg0LgNr2K8wZubK3xOEcHVL1oAynp8.jpg', 15, '2023-12-08 11:02:50', '2023-12-08 12:02:33'),
(186, '20045419', 'Mamy Poko Pants Standar isi 32 M', 100, 68000, 0, 'Mamy poko pants standar popok bayi tipe celana M 7-12kg isi 32 pcs, 12 Jam daya serap. Meyerap banyak lebih cepat kering, Si kecil nyaman sepanjang hari.', NULL, 'foto_barang/yLW2W6Qubt7u5Yfpzd9nNd3IZgrkdW0ErnEFYdKL.jpg', 15, '2023-12-08 11:03:21', '2023-12-08 12:02:35'),
(187, '20110323', 'Posh Deo Roll On Charcoal 50Ml', 100, 16000, 0, 'Posh Roll On Charcoal dengan charcoal powder dan anti bacaterial untuk melawan bakteri penyebab bau badan. Formulasi khusus dari Lion Japan, mengurangi bau badan dan keringat berlebih hinga 48jam serta menjag kulit ketiak cerah, halus, dan lembut', NULL, 'foto_barang/V9NO1bzcv5XFEOUKlb353kSIXUNQndqiAuO0lahr.jpg', 5, '2023-12-08 11:12:30', '2023-12-08 12:02:37'),
(188, '20108294', 'Romano Eau De Toilette Attitude 100mL', 100, 50000, 0, '100% Diformulasikan khusus untuk Pria, ciptakan Kesan Elegant Memikat dengan wangi manis yang mewah, tahan hingga 8 JAM.', NULL, 'foto_barang/EZW1n8fWayTxjDpGpqd3CWCzIHJgSgK9Nr0w7REt.jpg', 5, '2023-12-08 11:12:52', '2023-12-08 12:02:39'),
(189, '20116990', 'Posh Men Deo Roll On Active Cool 50Ml', 100, 16000, 0, 'Posh Roll On Men Active Pro dengan formula Active Sense siap menjaga kesegaranmu 48 jam dari bau badan dan keringat tanpa meninggalkan noda di pakaian. Posh Roll On Men menjaga kulit ketiak kering dan tidak lengket.', NULL, 'foto_barang/TIlVnNyaDH7nbM5aVaQcgHgfFwQySEtu5pKjPKwb.jpg', 5, '2023-12-08 11:13:16', '2023-12-08 12:02:42'),
(190, '20126266', 'Gillette Razor Flexi + Cartridge isi 1 Vibe', 100, 23000, 0, 'Pisau cukur pria persembahan Gillette Hadir dengan 3 mata pisau cukur membuat hasilnya menjadi lebih bersih dan sangat nyaman digunakan.', NULL, 'foto_barang/BtW2buUwxQoUQ6C2O5MIbEblpnAqR6lmNFhhmsj5.jpg', 5, '2023-12-08 11:13:38', '2023-12-08 12:03:08'),
(191, '20081456', 'Gillette Razor Blue 3 Simple Single', 100, 13000, 0, 'Gillette Razor Blue 3 Simple adalah pisau cukur pria dengan desain pegangan yang fleksibel serta mudah digunakan, membuat pencukur ini sangat aman digunakan sehingga dapat terhindar dari cedera ketika mencukur.', NULL, 'foto_barang/BwDB4skIIQHkIOOyKAxoA9BjAVkZ16DmUhXHP5Y4.jpg', 5, '2023-12-08 11:14:09', '2023-12-08 12:03:10'),
(192, '20092400', 'Rexona Deodorant Roll On Women Dreamy Bright 40mL', 100, 17000, 0, 'Deodorant untuk remaja perempuan dengan formulasi mencerahkan kulit ketiak secara alami dengan kandungan vitamin E&F yang teruji efektif mencerahkan kulit dalam 7 hari.', NULL, 'foto_barang/NJPov1T3qof6mmjxtOkvwuBjUJRUCwr8HyqimSOW.jpg', 5, '2023-12-08 11:14:43', '2023-12-08 12:03:12'),
(193, '20091575', 'Rexona Roll-On Glowing White 40Ml', 100, 17000, 0, 'Deodorant untuk wanita remaja dengan formulasi mencerahkan dengan multivitamin dan 0% alcohol yang teruji efektif mencerahkan kulit dalam 7hari. Dilengkapi perlindungan terhadap keringat&bau badan hingga 48jam, serta wangi lembut bunga Mawar', NULL, 'foto_barang/LRaFeUUKdw2OcFqA7AjKFQjXq4Ntownu8UzHPTYC.jpg', 5, '2023-12-08 11:15:11', '2023-12-08 12:03:15'),
(194, '20102723', 'Dettol Body Wash Onzen Peach 410g', 100, 30000, 0, 'DETTOL Body Wash Onzen Peach merupakan sabun mandi cair anti bakteri yang menggabungkan perlindungan terpercaya terhadap kuman dan keharuman Peach yang menyegarkan.', NULL, 'foto_barang/ZsIg1FRKqFHmNicCqyYI4V07FzQTjgDFkjcwMGUj.jpg', 5, '2023-12-08 11:15:37', '2023-12-08 12:03:18'),
(195, '20060392', 'Nuvo Sabun Kesehatan Cair (Biru) Caring 400mL', 100, 20000, 0, 'Nuvo Mild Protect Body Wash. Sabun cair ini adalah sabun mandi yang dapat digunakan setiap hari untuk menjaga kebersihan dan kesehatan kulit. Hadir dengan sensasi wangi yang segar sehingga kulit sehat terlindungi dan membuat kulit menjadi halus.', NULL, 'foto_barang/l45LPqslEsesMFc2FVDHiea5syrX8fojUZPU4NDj.jpg', 5, '2023-12-08 11:16:05', '2023-12-08 12:03:20'),
(196, '20105341', 'Axe Body Spray Deodorant Ice Chill 135mL', 100, 40000, 0, 'Axe Bodyspray Ice Chill baru, wangi Frozen Mint dan Lemon yang segar alami, melindungi dari bakteri dan keringat berlebih, bikin badan dingin dan segar selama 48 jam', NULL, 'foto_barang/RbAof5sVlkwzoMVmuaxR7wr4YDpFeeA26TyjA3ti.jpg', 5, '2023-12-08 11:16:25', '2023-12-08 12:03:22'),
(197, '20064018', 'Formula Pasta Gigi Twin Pack Strong Protector 2x60G', 100, 20000, 0, 'Pasta gigi Formula yang diformulasi untuk melindungi gigi dari penyebab utama gigi berlubang.', NULL, 'foto_barang/19wFZmr8gTllNTPsr8687nem9jdFtyG2W6brv6ZL.jpg', 5, '2023-12-08 11:17:04', '2023-12-08 12:03:24'),
(198, '10003569', 'Close Up Pasta Gigi Gel Green Ever Fresh 160G', 100, 20000, 0, 'CloseUp dengan kandungan formulasi anti-bacterial mouthwash dan micro shine crystals untuk memberikan nafas segar hingga serta gigi putih', NULL, 'foto_barang/UHVntAJiW4fSCnEBirflS4E2EunL7CNn02Ld1wgG.jpg', 5, '2023-12-08 11:17:29', '2023-12-08 12:03:27'),
(199, '10005836', 'Formula Sikat Gigi Silver Ptotector3\'s Diamond Medium', 100, 12000, 0, 'Sikat gigi Formula yang dirancang khusus untuk merawat kebersihan dan kesehatan gigi secara optimal. Dengan bulu sikat medium dan ujung kepala sikat mengecil yang mampu menjangkau dan membersihkan hingga gigi paling belakang.', NULL, 'foto_barang/fjRUiqkmReKc9F04f1XYNgbOLRuq9ZnBFLRIF0Uf.jpg', 5, '2023-12-08 11:17:57', '2023-12-08 12:03:04'),
(200, '10003503', 'Formula Sikat Gigi Trendy 3\'S Soft', 100, 12000, 0, 'Formula sikat gigi trendy, bersihkan gigi lebih nyaman.', NULL, 'foto_barang/HmWYB3THyPyNQx7RIuZomtKOcP5epfWlrMQsyj79.jpg', 5, '2023-12-08 11:18:16', '2023-12-08 12:03:48'),
(201, '20070183', 'Ciptadent Pasta Gigi Herbal Anti Bakteri 190G', 100, 17000, 0, 'Ciptadent pasta gigi herbal anti bakteri tub.', NULL, 'foto_barang/C6cmyZ0bLMR01X3NkZzNFBxhjtxQNtGZeR0RgFmB.jpg', 5, '2023-12-08 11:18:47', '2023-12-08 12:03:52'),
(202, '10006957', 'Selection Kapas Kecantikan 75G', 100, 16000, 0, 'For your beautiful, healthy and natural skin care', NULL, 'foto_barang/tGpk2yw6gwCJzyIEt2GLNlJj86SZCEtqc7Fic2ct.jpg', 5, '2023-12-08 11:19:10', '2023-12-08 12:03:54'),
(203, '20114622', 'Selection Kapas Special Tipis 60G', 100, 16000, 0, 'cocok untuk pemakaian micellar water, face toner dan kemasan bisa ditutup kembali', NULL, 'foto_barang/yoWWJjWTG20mOW4P45r85F6iNequ593hW43GgOxt.jpg', 5, '2023-12-08 11:19:30', '2023-12-08 12:03:57'),
(204, '20125498', 'Silcot Cleansing Cotton 82\'s', 100, 25000, 0, 'Kapas untuk membersihkan makeup dengan teknologi moist cleansing fiber yang dapat 1x usap untuk bersih maksimal. Kapas dapat menyebarkan cairan remover secara merata sehingga efektif membersihkan makeup.', NULL, 'foto_barang/ic82fTyJoIiHNIjgnpDLCMFpHrjuIggtzdizvmYY.jpg', 5, '2023-12-08 11:19:52', '2023-12-08 12:03:59'),
(205, '20096787', 'Citra Fresh Glow Multifunction Gel Aloe Vera 180mL', 100, 32000, 0, 'Gel yang ringan dan tidak lengket. Melembabkan dan mencerahkan kulit dari paparan sinar matahari serta menyamarkan noda hitam. Gunakan sebagai pelembab wajah dan tubuh sehari hari.', NULL, 'foto_barang/BINqZqt3pPDnFT1uqK2oKLT7yQxRqcrMjzvkjyWT.jpg', 5, '2023-12-08 11:20:12', '2023-12-08 12:04:01'),
(206, '20092317', 'Poise Facial Foam Whitening 100G', 100, 25000, 0, 'Mampu membersihkan dengan lembut serta mengangkat kotoran pada kulit wajah secara menyeluruh.', NULL, 'foto_barang/nqM9pAjyWHZSp2rBzRkYxtyNsyhVbyEXOLzuujK9.jpg', 5, '2023-12-08 11:20:33', '2023-12-08 12:04:03'),
(207, '20121228', 'Nuvo Wet Tissue Fresh Biru 50\'S', 100, 20000, 0, 'NUVO Tisu Basah Antiseptik adalah tisu basah antiseptik yang dapat membunuh kuman selama 10 detik, bebas alkohol, dan teruji dermatologis sehingga dapat digunakan sehari-hari.', NULL, 'foto_barang/sjPXdI5NxHxMY7nYWZRoyfmgrmlUySbzGGOUYyd1.jpg', 16, '2023-12-08 11:37:23', '2023-12-08 12:04:05'),
(208, '20121229', 'Nuvo Wet Tissue Original Merah 50\'S', 100, 20000, 0, 'NUVO Tisu Basah Antiseptik adalah tisu basah antiseptik yang dapat membunuh kuman selama 10 detik, bebas alkohol, dan teruji dermatologis sehingga dapat digunakan sehari-hari.', NULL, 'foto_barang/Wy1YwHLT3SspJegz48aVL1676OletpO0X2S94VMC.jpg', 16, '2023-12-08 11:37:43', '2023-12-08 12:04:08'),
(209, '10038692', 'Multi Facial Tissue Mp-01 250\'S Non Parfumed', 100, 19000, 0, 'Multi Facial Tissue MP-01 250\'s Non-Parfumed adalah solusi praktis dan higienis untuk kebersihan wajah dan tangan sehari-hari.', NULL, 'foto_barang/n2SF43cuj5abhEaT9XpnZ1nvCERw84S2biINJ2oJ.jpg', 16, '2023-12-08 11:38:22', '2023-12-08 12:03:45'),
(210, '20034036', 'Paseo Smart Facial Tissue Soft 540Ply', 99, 18000, 1, 'Terbuat dari 100% serat alami, tissue paseo memiliki kekuatan dan daya serap serta sentuhan kelembutan untuk anda.', NULL, 'foto_barang/NHFURR47UeQ2n6SblH7gudZv311T8nzyEHoH7xhs.jpg', 16, '2023-12-08 11:38:47', '2023-12-09 23:39:18'),
(211, '20026897', 'Tessa Facial Tissue Tp-02/260\'S', 100, 22000, 0, 'Tessa Tissue Facial Terra TP-02 adalah tissue wajah yang terbuat dari bahan berkualitas dan diproses secara higienis sehingga nyaman, dan lembut saat dipakai.', NULL, 'foto_barang/525R5JxniSgmgNXuDofaIUPdvISQxY1WY32IRtxa.jpg', 16, '2023-12-08 11:39:05', '2023-12-08 12:05:16'),
(212, '20087479', 'Downy Softener Floral Pink 700mL', 100, 25000, 0, 'Downy Pelembut & Pewangi Pakaian Konsentrat Floral Pink.', NULL, 'foto_barang/3FmZkQ8yuBut9lliws1XptUDh5at1HeE4KNvoOCj.jpg', 16, '2023-12-08 11:39:31', '2023-12-08 12:05:19'),
(213, '20074226', 'Downy Softener Sunrise Fresh 700mL', 100, 27000, 0, 'Downy mempersembahkan Downy Sunrise Fresh dengan aroma bunga yang menyegarkan untuk membantu Anda menghasilkan cucian yang lembut dan wangi segar tahan lama.', NULL, 'foto_barang/YsqGxCfasUsadQ61fT3CV7HjQzUUZjllWAbA78kE.jpg', 16, '2023-12-08 11:39:55', '2023-12-08 12:05:22'),
(214, '20106821', 'Molto Pewangi Pakaian Sport Fresh Purple 780Ml', 100, 16000, 0, 'MOLTO Pewangi Purple Delight dengan sentuhan kesegaran bunga yang memikat. Memberikan keharuman segar untuk bajumu dan hari-harimu', NULL, 'foto_barang/uWPoBWhDAeEnULHoascGsUop7eMDTFM8XHHT2pQm.jpg', 16, '2023-12-08 11:40:21', '2023-12-08 12:05:24'),
(215, '20129370', 'Molto Pelembut & Pewangi Pakaian Refill Morning Fresh 650mL', 100, 27000, 0, '10 X LEBIH WANGI RAWAT BAJU', NULL, 'foto_barang/kcNNGzVcHb8aHsyh4c1jIVujo5MYPf4MlI923ba8.jpg', 16, '2023-12-08 11:40:46', '2023-12-08 12:05:26'),
(216, '20104281', 'Harpic Pembersih Kloset Triple Action /Power 750mL', 100, 40000, 0, 'Harpic Power Plus 10x membersihkan noda membandel lebih baik. Harpic Power Plus adalah produk pembersih untuk berbagai masalah kebersihan toilet.', NULL, 'foto_barang/7uByEk5VsEKB8RCxJ6mep14RtsNB7ENQDcCigv8z.jpg', 16, '2023-12-08 11:41:12', '2023-12-08 12:05:29'),
(217, '10014263', 'Wipol Karbol Wangi Cemara 750Ml', 100, 20000, 0, 'Karbol wangi dengan pine action, efektif membunuh kuman sekaligus memberikan keharuman khas cemara menjadikan ruangan harum dan segar lebih lama.', NULL, 'foto_barang/CAaICGqRw7e5Lzts46po7yXz68vuh4jkQWuQjXPE.jpg', 16, '2023-12-08 11:41:43', '2023-12-08 12:05:31'),
(218, '20106983', 'Autan Lotion Anti Nyamuk Sakura 50Ml', 100, 12000, 0, 'Melindungi kulit lembut anda, efektif dan tahan lama.', NULL, 'foto_barang/MKW8vr4b6M2maWx1GCcI1aLuoljkhPgcmZ5auffD.jpg', 16, '2023-12-08 11:42:00', '2023-12-08 12:05:34'),
(219, '20016897', 'Glade Car Freshener Sweet Apple 70G', 100, 12000, 0, 'Glade Car Freshener Sweet Apple 70g adalah produk penyegar udara khusus untuk kendaraan yang dirancang untuk memberikan aroma segar dan menyenangkan dalam mobil Anda.', NULL, 'foto_barang/G3GiuN8DCnIHllQVgmPfcc9XmKT0AtXRxRpGRDdf.jpg', 16, '2023-12-08 11:42:32', '2023-12-08 12:05:09'),
(220, '10037355', 'Eveready Battery Hitam (4\'S) 1215/R6', 100, 18000, 0, 'Eveready battery hitam (4\'s), World\'s Longest Lasting Battery, 20 year shelf life, Analog clock, TV remote', NULL, 'foto_barang/Q6YNaobEY2ei9CQ4YVSr063rZwjZ0liWFTndgLUk.jpg', 16, '2023-12-08 11:44:16', '2023-12-08 12:05:51'),
(221, '10037234', 'Force Magic Insektisida Spray Lemon 600Ml', 100, 40000, 0, 'Insektisida kontak dan pernapasan berbentuk aerosol berwarna kuning muda untuk mengendalikan nyamuk culex sp, aedes aegypti, lalat musca domestica, semut anoplolepis sp, dan kecoa periplaneta sp didalam ruangan.', NULL, 'foto_barang/lRqYJZJwXjC89t8tvjUESUGReTXwAUsbb1HYl4v2.jpg', 16, '2023-12-08 11:44:36', '2023-12-08 12:05:53'),
(222, '10015438', 'Energizer Battery Alkln Max Aa/Lr6 4\'S E91.Bp4', 100, 45000, 0, 'Energizer battery alkalin 10 year shelf life, 3x Longer Lasting than Carbon Zinc (result may vary by devices), Everyday use devices, Digital Clocks.', NULL, 'foto_barang/eUVoBGP0IuA6zmwcZ6DDGSJlwxYVxPylddiAD2SM.jpg', 16, '2023-12-08 11:44:57', '2023-12-08 12:05:57'),
(223, '10006200', 'Bagus Shoe Brush W-3354', 100, 20000, 0, 'Terbuat dari kayu pilihan dan berkualiatas yang dapat *membersihkan noda dan kotoran pada sepatu dengan maksimal. Bulu sikat awet, penampang bulu sikat lebih besar dan rapat.', NULL, 'foto_barang/f8EZbs4JD85hgxz4qYiTL3uuPU6KhDhUTaSpoiVK.jpg', 16, '2023-12-08 11:45:16', '2023-12-08 12:05:59'),
(224, '10000090', 'Abc Battery Biru R6 4\'S', 100, 15500, 0, 'ABC Battery Biru R6 4\'s adalah paket baterai alkaline yang dirancang untuk memberikan daya tahan dan kinerja yang handal. Dengan kode warna biru, baterai ini biasanya dikenal dengan nama umum \"AA\" atau \"penlight\".', NULL, 'foto_barang/2xPCVjfmvWuPmzNsDjMyfoE3Hj7DHyI1btX7A5vO.jpg', 16, '2023-12-08 11:45:48', '2023-12-08 12:06:01'),
(225, '20098808', 'Bagus Sarung Tangan Plastik 100\'S', 100, 20000, 0, '100% HDPE Food Grade, BPA FREE, Lebih panjang dan nyaman untuk dipakai, Bisa anda gunakan untuk memasak, mencuci piring, Bisa untuk berkebun maupun untuk membersihkan kamar mandi', NULL, 'foto_barang/am3Jn5ZSzTt3uGFAOghrOjWTQcdX0Na2GhrIRGNg.jpg', 16, '2023-12-08 11:46:07', '2023-12-08 12:05:49'),
(226, '20018812', 'Prenagen Lactam Susu Bubuk Ibu Menyusui Coklat 360G', 100, 85500, 0, 'Prenagen lactamom merupakan susu bernutrisi lengkap untuk ibu hamil dengan keunggulan PRENAPRO. Terdiri dari sumber protein untuk membangun dan memperbaiki jaringan tubuh , tinggi kalsium dan Vit D untuk membantu dalam pembentukan tulang bayi', NULL, 'foto_barang/qutX5sve4AuHzSvqTzdqcbK3p0GgkI6Ow5N5jfAW.jpg', 15, '2023-12-11 17:23:17', '2023-12-11 17:53:20'),
(227, '20027837', 'Prenagen Esenss Susu Bubuk Perencanaan Hamil Coklat 360g', 100, 70100, 0, 'Prenagen esensis merupakan susu bernutrisi lengkap untuk persiapan kehamilan dengan keunggulan PRENAPRO. Terdiri dari sumber protein yang beguna untuk membangun dan memperbaiki jaringan tubuh', NULL, 'foto_barang/g4zBTLzwoxwVVsfcbljYOa5UBpwqm4ObHHLysZ3N.jpg', 15, '2023-12-11 17:23:54', '2023-12-11 17:53:23'),
(228, '20117977', 'Prenagen Mommy Minuman Khusus Ibu Hamil Almond Soya 200g', 100, 48000, 0, 'Minuman khusus ibu hamil sebagai sumber protein nabati dari almond dan soya. Sebagai alternatif ibu hamil yang tidak dapat mengonsumsi susu sapi dan menyukai susu kedelai & almond', NULL, 'foto_barang/1l7tdxAPVLQbjOps3vOGKvGwnbSrAajinxo4vzqy.jpg', 15, '2023-12-11 17:24:24', '2023-12-11 17:53:27'),
(229, '20011068', 'Prenagen Mommy Susu Bubuk Ibu Hamil Strawberry 400G', 100, 85500, 0, 'Prenagen mommy nutrisi kehamilan rasa lebih enak, Minuman khusus ibu hamil rasa stroberi.', NULL, 'foto_barang/EB6YZixpzJnyJH30XLoA8yJ79ceXfIIeafKPvxTu.jpg', 15, '2023-12-11 17:24:47', '2023-12-11 17:53:29'),
(230, '20042444', 'Prenagen Emesis Susu Bubuk Ibu Hamil Velvety Chocolate 400G', 100, 85500, 0, 'Minuman khusus ibu hamil yang mengalami gangguan mual dan muntah', NULL, 'foto_barang/YhuBvW3amZCrV24jC0RtYCsx8ChvinziItGKZaCo.jpg', 15, '2023-12-11 17:25:15', '2023-12-11 17:53:32'),
(231, '20117393', 'Frisian Flag 3+ Susu Bubuk Pertumbuhan Madu 2000G', 100, 233500, 0, 'Frisian Flag 456 PRIMANUTRI adalah susu bubuk yang diformulasikan sebagai tambahan nutrisi untuk mendukung pertumbuhan si Kecil di usia pra-sekolah dengan rasa madu yang lezat.', NULL, 'foto_barang/9EgACJInjLjNX5EtNvhPFOWfl7qVco1ncAKlvxYQ.jpg', 15, '2023-12-11 17:25:52', '2023-12-11 17:53:34'),
(232, '20117361', 'Frisian Flag 3+ Susu Bubuk Pertumbuhan Madu 1200G', 100, 143000, 0, 'Frisian Flag 456 PRIMANUTRI adalah susu bubuk yang diformulasikan sebagai tambahan nutrisi untuk mendukung pertumbuhan si Kecil di usia pra-sekolah dengan rasa madu yang lezat.', NULL, 'foto_barang/yi5Vmoh0xbwXWxrnskFszuZlRIfyCDKvENAJesBx.jpg', 15, '2023-12-11 17:30:33', '2023-12-11 17:53:36'),
(233, '20117358', 'Frisian Flag 1+ Susu Bubuk Pertumbuhan Vanila 1200G', 100, 150000, 0, 'Frisian Flag 123 PRIMANUTRI adalah susu bubuk pertumbuhan yang diformulasikan khusus untuk anak usia 1-3 tahun dengan VANILA yang lezat sebagai tambahan nutrisi bagi si Kecil agar tumbuh optimal di periode emas pertumbuhannya.', NULL, 'foto_barang/JtYYt40dOr9MedNgTSgF4rIr9w3j3YC7kZymcPUT.jpg', 15, '2023-12-11 17:31:01', '2023-12-11 17:53:38'),
(234, '20117360', 'Frisian Flag 1+ Susu Bubuk Pertumbuhan Vanila 2000G', 100, 246000, 0, 'Frisian Flag 123 PRIMANUTRI adalah susu bubuk pertumbuhan yang diformulasikan khusus untuk anak usia 1-3 tahun dengan VANILA yang lezat sebagai tambahan nutrisi bagi si Kecil agar tumbuh optimal di periode emas pertumbuhannya.', NULL, 'foto_barang/mW3YrWGEef0KsYrbTPCaUwEJF5jQst6rh3p4nE3z.jpg', 15, '2023-12-11 17:31:26', '2023-12-11 17:53:41'),
(235, '20034119', 'Frisian Flag 1+ Susu Bubuk Pertumbuhan Madu 360G', 100, 50000, 0, 'Susu pertumbuhan untuk anak usia 1-3 tahun dengan nutrisi yang lengkap, seimbang dan rasa yang enak.', NULL, 'foto_barang/JXmrJnTbKG4ALBLXM6QfXrDIV3WbHY0e7GhYJoKL.jpg', 15, '2023-12-11 17:31:51', '2023-12-11 17:53:12'),
(236, '20058308', 'Morinaga BMT 1 Susu Formula Bayi P-HP 400g', 100, 184000, 0, 'Susu formula bayi usia 0-6 bulan dengan protein hidrolisa parsial (P-HP)', NULL, 'foto_barang/BkEjiGv4ogR7KeX3cPMBNLBPQacUKktTE27WnRB1.jpg', 15, '2023-12-11 17:32:21', '2023-12-11 17:54:03'),
(237, '10003653', 'Morinaga Bmt Lactoferin 400G', 100, 100000, 0, 'Susu formula bayi untuk usia 0-6 bulan', NULL, 'foto_barang/3q3jOEzYGVBGhmRC4kHO15mGJ05gsQLcXAiyFlYT.jpg', 15, '2023-12-11 17:32:46', '2023-12-11 17:54:06'),
(238, '20120461', 'Sgm Family Susu Bubuk Yummi-Nutri Cokelat 330G', 100, 36000, 0, 'SGM Family Yummi-Nutri dengan kombinasi unik IronC, Minyak Ikan, Kalsium, dan nutrisi penting lainnya bantu penuhi kebutuhan nutrisi anak, ayah, ibu, seluruh keluarga.', NULL, 'foto_barang/iH60XkZQhXTo1NffoF1RrmPXkrjFlvUzfpyMdFOj.jpg', 15, '2023-12-11 17:33:30', '2023-12-11 17:54:09'),
(239, '20049108', 'Sgm Eksplor 5+ Pro-Gressmaxx Susu Pertumbuhan Madu 400G', 100, 42000, 0, 'Susu pertumbahan anak usia 5 tahun dengan presinutri, vitamin, kalsium dan zinc serta serat pangan inulin.', NULL, 'foto_barang/bxQOXBQN1wYroeH1xXDdd30ymvLIGkvCmm614wIU.jpg', 15, '2023-12-11 17:34:05', '2023-12-11 17:54:12'),
(240, '20056930', 'Sgm Eksplor 3+ Pro-Gressmaxx Susu Pertumbuhan Madu 150G', 100, 16000, 0, 'Susu pertumbahan anak usia 3-5 tahun dengan presinutri, vitamin, kalsium dan zinc serta serat pangan inulin.', NULL, 'foto_barang/HovQLlBTxG1BjLpn06xzgJ46Qd9UMQ7hT5pDh5TB.jpg', 15, '2023-12-11 17:34:37', '2023-12-11 17:54:16'),
(241, '20047323', 'Sgm Ananda 1 Formula Bayi Bubuk 0-6 Bulan 600G', 100, 62000, 0, 'Protein whey, campuran minyak nabati, laktosa, susu bubuk skim, Maltodekstrin, Fos-Inulin, AA-DHA, Mineral, Pengemulsi lesitin kedelai, Vitamin.', NULL, 'foto_barang/5gMLdxDDpdQUc0aNC6DNYLVzu05T2XsQJ85fKjfU.jpg', 15, '2023-12-11 17:35:09', '2023-12-11 17:55:07'),
(242, '20037097', 'Sgm Ananda Soya 2 Susu Formula Bayi 6 -12 Bulan 400G', 100, 63000, 0, 'Susu formula lanjutan presinutri untuk bayi usia 6-12 bulan', NULL, 'foto_barang/Dwm2c9HROpadrBGrSycztO8Ybm6AIQmgYuNGAhmZ.jpg', 15, '2023-12-11 17:35:34', '2023-12-11 17:54:25'),
(243, '20087025', 'Sgm Eksplor 3+ Pro-Gressmaxx Vanilla Susu Pertumbuhan (Belajar) 600G', 100, 59000, 0, 'Susu pertumbahan anak usia 3-5 tahun dengan presinutri, vitamin, kalsium dan zinc serta serat pangan inulin.', NULL, 'foto_barang/HGEOrmsbKNvVJyxPxdkzwfG4JJgzMOs66tAh5F2M.jpg', 15, '2023-12-11 17:36:21', '2023-12-11 17:54:27'),
(244, '20077508', 'Sgm Eksplor 1+ Pro-Gressmaxx Vanilla Susu Pertumbuhan 1-3 Tahun 600G', 100, 61000, 0, 'Susu pertumbahan anak usia 1-3 tahun dengan presinutri, vitamin, kalsium dan zinc serta serat pangan inulin.', NULL, 'foto_barang/A1k4Ldv83eEXjMp6cX1XPoytmFd91V8FHLJUprk0.jpg', 15, '2023-12-11 17:36:58', '2023-12-11 17:54:30'),
(245, '20071686', 'Sgm Soya 1+ Eksplor Pro-Gressmaxx Madu Formula Pertumbuhan 700G', 100, 99000, 0, 'Susu pertumbuhan anak usia 1-5 tahun dengan berbahan dasar kedelai, sangat disarankan untuk anak yang alergi dengan susu sapi.', NULL, 'foto_barang/MZ8TElxxlv3n6STupTGxlK3Nh8SPJ2rtdiCnHEv8.jpg', 15, '2023-12-11 17:37:51', '2023-12-11 17:53:59'),
(246, '10005338', 'Dancow Fortigro Susu Bubuk Instant 195G', 100, 28000, 0, 'Susu bubuk bergizi khusus anak usia diatas 1 tahun dengan rasa yang enak.', NULL, 'foto_barang/4fqfkB1FQubH8AEKlQA6TwYx816DOUkWf90cLgR0.jpg', 15, '2023-12-11 17:39:11', '2023-12-11 17:55:10'),
(247, '10010874', 'Dancow 1+ Susu Bubuk Pertumbuhan Dha Madu 160G', 100, 28000, 0, 'Dancow 1+ merupakan susu dengan zat-zat gizi yang dibutuhkan untuk anak usia 1 sampai dengan 3 tahun, setelah usia 3 tahun lanjutkan dengan dancow 3+.', NULL, 'foto_barang/1u5dCki69D9YhNj9B5ZioZrkLzOt8fuwCVDYOQW8.jpg', 15, '2023-12-11 17:39:36', '2023-12-11 17:55:12'),
(248, '10010509', 'Dancow Fortigro Susu Bubuk Cokelat 195G', 100, 25000, 0, 'Susu bubuk bergizi khusus anak usia diatas 1 tahun dengan rasa cokelat yang enak.', NULL, 'foto_barang/eHHWKvQDNXRaSgAipl4x3ptxbsu6DElBRvMXvQGV.jpg', 15, '2023-12-11 17:39:59', '2023-12-11 17:55:14'),
(249, '10015651', 'Dancow 3+ Susu Bubuk Protectus Probio Vanila 350G + 80G', 100, 51000, 0, 'Dancow Batita 3+ diperkaya dengan DHA Probiotik yang khusus diformulasikan untuk batita berusia 3-5 tahun.', NULL, 'foto_barang/IjdPHYxfkzTjuVeXVA1bbyyGfY4O6k3YQ54d64f3.jpg', 15, '2023-12-11 17:40:34', '2023-12-11 17:55:16'),
(250, '10015653', 'Dancow 1+ Susu Bubuk Protectus Probio Vanila 350G + 80G', 100, 54000, 0, 'Dancow 1+ merupakan susu dengan zat-zat gizi yang dibutuhkan untuk anak usia 1 sampai dengan 3 tahun, setelah usia 3 tahun lanjutkan dengan dancow 3+.', NULL, 'foto_barang/PYuMHmRy8Us7mICXjW8p6oCNpguHDrnPUZ62jTwR.jpg', 15, '2023-12-11 17:40:59', '2023-12-11 17:55:18'),
(251, '14233578', 'AQUA 220ml 1 Dus', 13, 35000, 12, 'Aqua 220ML (1 dus isi 48 Gelas)', NULL, 'foto_barang/5VJgmPGJ7eCzAPUjw9JhiA0xt4cVFj96nmtMIPTB.jpg', 12, '2023-12-11 17:44:42', '2023-12-12 11:27:07'),
(252, '16367832', 'Teh Gelas 160 ml (isi 24 Cup)', 25, 22000, 0, 'teh gelas manis dan enak', NULL, 'foto_barang/ERfObexSFPmPaH6X9I3oh2J5fBkT9RiZRvad3qFp.jpg', 3, '2023-12-11 17:45:23', '2023-12-11 17:55:29'),
(253, '20087730', 'Merries Premium Tape 18\'S Large', 100, 111000, 0, 'Merries Premium Tape 18\'S Large adalah popok berkualitas tinggi yang dirancang khusus untuk memberikan kenyamanan dan perlindungan optimal bagi bayi Anda.', NULL, 'foto_barang/IOFmSQsc4FEl38CuKDtsQpr2Pm5T6GWK2wXfhMxH.jpg', 15, '2023-12-11 17:49:40', '2023-12-11 17:55:31'),
(254, '20087732', 'Merries Premium Tape 32\'S Large', 100, 191000, 0, 'Merries Premium Tape 32\'S Large adalah pilihan terbaik untuk memberikan perlindungan dan kenyamanan yang luar biasa bagi bayi Anda.', NULL, 'foto_barang/vuEaoWB75BBq1EqSVkSMCzRsfOfukOMygd6NFumf.jpg', 15, '2023-12-11 17:50:15', '2023-12-11 17:55:34'),
(255, '20093912', 'Mamy Poko Pants Royal Soft 34\'S M', 100, 82000, 0, 'Lembut dibagian pinggang menjaga kulit bayi tetap lembut tanpa khawatir meninggalkan bekas kemerahan', NULL, 'foto_barang/s9N6uEBMpFfc1sBn9lw90rUzlKcHSU44atGd3Qq9.jpg', 15, '2023-12-11 17:50:41', '2023-12-11 17:55:51'),
(256, '20094207', 'Mamy Poko Baby Diapers Extra Soft 28\'S Tipe Perekat Small', 100, 65000, 0, 'Merupakan popok perekat sekali pakai yang praktis untuk dikenakan pada bayi yang mulai aktif bergerak.', NULL, 'foto_barang/ubpTw8f5KdVLoW6aQdipieZZGJa4AP06M5KQ5Qi7.jpg', 15, '2023-12-11 17:51:11', '2023-12-11 17:55:54'),
(257, '20112586', 'Sweety Silver Pants 32\'S Small', 100, 61500, 0, 'Baru! 1 detik menyerap lebih kering dengan Diamond Layer Technology untuk kulit lebih sehat! Ekstra lembut dan elastis pas di badan dengan desain baru yang keren bersama Coby!', NULL, 'foto_barang/VO0kody1ePSsMbwzsF63dWkkTXR4FejAwqju15J5.jpg', 15, '2023-12-11 17:51:39', '2023-12-11 17:55:55'),
(258, '20103708', 'Sweety Bronze Comfort Diapers 24\'S New Born', 100, 41000, 0, 'Perlindungan Semalaman, Menyerap 7 + 1 kali pipis. * 1 gelas = 40 ml. Ekstra Lembut, Bahan yang lembut dan nyaman di kulit, cegah iritasi. Karet Pinggang Elastis dan Lembut, Tidak meninggalkan bekas kemerahan dan lebih pas di badan bayi.', NULL, 'foto_barang/MipV45TInsnrIbyXzm9Z3f79SYsETGpn8mGq57ds.jpg', 15, '2023-12-11 17:52:06', '2023-12-11 17:55:59'),
(259, '20103709', 'Sweety Silver Pants Baby 18\'S XXL', 100, 73000, 0, 'Baru! 1 detik menyerap lebih kering dengan Diamond Layer Technology untuk kulit lebih sehat! Ekstra lembut dan elastis pas di badan dengan desain baru yang keren bersama Coby!', NULL, 'foto_barang/GL5e9KEOcBtPhqd13qOgzgTzcKaAH2ncfMr4Nmzr.jpg', 15, '2023-12-11 17:52:29', '2023-12-11 17:56:01');

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
(1, 'Akeno', 'Perempuan', '081234567890', 'akeno@gmail.com', 'foto_customer/MD2zey6BForEogWRK9Py4hk3aNSamoV6jlkYN6S6.png', 1, '2023-11-06 07:00:47', '2023-12-02 10:52:39'),
(4, 'Kadek sintya', 'Perempuan', '087762876390', 'kadeksintya05@gmail.com', 'foto_customer/AeozfXN4vPCtiinNUuTf40sbXG3xzsICHztSeMxZ.jpg', 5, '2023-12-08 14:12:09', '2023-12-08 14:12:09'),
(5, 'bagus aditya', 'Laki-laki', '087762750821', 'bagusaditya5@gmail.com', 'foto_customer/2FZ375xZs3HtwlegCS1zH7g6UC9yan9lzYJQ9BNl.jpg', 6, '2023-12-08 14:21:26', '2023-12-08 14:21:26'),
(6, 'Ngurah adi', 'Laki-laki', '0882356874', 'ngurahadi76@gmail.com', 'foto_customer/AmapZzKN5wStyGHySP65SHwSNuo4A0Q9eKZr5NSJ.jpg', 7, '2023-12-08 14:29:52', '2023-12-08 14:29:52'),
(7, 'Wayan nata', 'Laki-laki', '087762908543', 'wayannata08@gmail.com', 'foto_customer/djA4mCPt1VRF99u1E8vxWjTtps5kKiuJUiefyWDn.jpg', 8, '2023-12-08 14:37:08', '2023-12-08 14:37:08'),
(8, 'Komang Ayu', 'Perempuan', '087762431657', 'komangayu04@gmail.com', 'foto_customer/bEQum1MXHZkiVLPKpVIyEWrPE6UQNQ3rPNlBnXTb.jpg', 12, '2023-12-11 04:04:01', '2023-12-11 04:04:01'),
(9, 'Putu Anggi', 'Perempuan', '087762453217', 'anggi97@gmail.com', 'foto_customer/5KXAgWIOBVWtfR7sBn8Jt2NpxL6Atoc5pV0BnI2w.jpg', 13, '2023-12-11 08:01:24', '2023-12-11 08:01:24'),
(11, 'De An', 'Laki-laki', '081980765423', 'gedeanjana@gmail.com', 'foto_customer/kHn4XxXoNGlD7vnzDZOiCG4l7YrmKJjvkoSoBQlX.jpg', 15, '2023-12-11 08:31:49', '2023-12-11 08:31:49'),
(12, 'Made Nonik', 'Perempuan', '087762786950', 'nonik20@gmail.com', 'foto_customer/jX9slXqowO8nyfXMlZypVAOEAV05Spjt0gm4tpMF.jpg', 16, '2023-12-12 01:59:51', '2023-12-12 01:59:51'),
(13, 'Sri ayu lestari', 'Perempuan', '082238760945', 'sriayu02@gmail.com', 'foto_customer/a5ETd4RJeujzMTpI4Yx7v10Jh2BwvsCBnNz9CRLv.jpg', 17, '2023-12-12 02:03:56', '2023-12-12 02:03:56'),
(14, 'Kadek Adi', 'Laki-laki', '085859160792', 'dekadi89@gmail.com', 'foto_customer/YvAYKsynh3LJSPsa2z8eMR8N9F8Za5WDaSkELi89.jpg', 18, '2023-12-12 02:15:18', '2023-12-12 02:15:18'),
(15, 'Ayu Linda', 'Perempuan', '082341692382', 'ayulinda91@gmail.com', 'foto_customer/DzVt2oIIjhB6CaF5ZPo5OAIT4z1j0KhVOrUcaNK9.jpg', 19, '2023-12-12 11:21:27', '2023-12-12 11:21:27'),
(16, 'Putu rasmini', 'Perempuan', '082341557823', 'rasmini8@gmail.com', 'foto_customer/sEHhnNTlKMZFMDvMprqddxGuB2LNy5KH7Ol0bMWV.jpg', 20, '2023-12-12 11:29:55', '2023-12-12 11:29:55');

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
(1, 1, 121, 80000, 1, '2023-12-10 01:50:42', '2023-12-10 01:50:42'),
(2, 1, 3, 9000, 1, '2023-12-10 01:50:42', '2023-12-10 01:50:42'),
(3, 1, 86, 10500, 1, '2023-12-10 01:50:42', '2023-12-10 01:50:42'),
(4, 1, 2, 6600, 1, '2023-12-10 01:50:42', '2023-12-10 01:50:42'),
(5, 1, 96, 9000, 1, '2023-12-10 01:50:42', '2023-12-10 01:50:42'),
(6, 2, 90, 8500, 1, '2023-12-10 01:50:54', '2023-12-10 01:50:54'),
(7, 2, 1, 12000, 1, '2023-12-10 01:50:54', '2023-12-10 01:50:54'),
(8, 2, 27, 20500, 1, '2023-12-10 01:50:54', '2023-12-10 01:50:54'),
(9, 2, 57, 40000, 1, '2023-12-10 01:50:54', '2023-12-10 01:50:54'),
(10, 2, 160, 21000, 1, '2023-12-10 01:50:54', '2023-12-10 01:50:54'),
(11, 3, 63, 10000, 1, '2023-12-10 01:51:06', '2023-12-10 01:51:06'),
(12, 3, 138, 11500, 1, '2023-12-10 01:51:06', '2023-12-10 01:51:06'),
(13, 3, 74, 12000, 1, '2023-12-10 01:51:06', '2023-12-10 01:51:06'),
(14, 3, 142, 8500, 1, '2023-12-10 01:51:06', '2023-12-10 01:51:06'),
(15, 3, 84, 6500, 1, '2023-12-10 01:51:06', '2023-12-10 01:51:06'),
(16, 4, 6, 20000, 1, '2023-12-10 01:51:13', '2023-12-10 01:51:13'),
(17, 4, 108, 3500, 1, '2023-12-10 01:51:13', '2023-12-10 01:51:13'),
(18, 4, 104, 29000, 1, '2023-12-10 01:51:13', '2023-12-10 01:51:13'),
(19, 4, 91, 8500, 1, '2023-12-10 01:51:13', '2023-12-10 01:51:13'),
(20, 4, 210, 18000, 1, '2023-12-10 01:51:13', '2023-12-10 01:51:13'),
(21, 5, 11, 30000, 1, '2023-12-11 08:19:43', '2023-12-11 08:19:43'),
(22, 5, 125, 19500, 1, '2023-12-11 08:19:43', '2023-12-11 08:19:43'),
(23, 5, 139, 25000, 1, '2023-12-11 08:19:43', '2023-12-11 08:19:43'),
(28, 7, 79, 6000, 1, '2023-12-11 08:34:45', '2023-12-11 08:34:45'),
(29, 7, 120, 145000, 1, '2023-12-11 08:34:45', '2023-12-11 08:34:45'),
(30, 7, 137, 11500, 1, '2023-12-11 08:34:45', '2023-12-11 08:34:45'),
(31, 8, 75, 8500, 1, '2023-12-11 08:35:08', '2023-12-11 08:35:08'),
(32, 8, 138, 11500, 1, '2023-12-11 08:35:08', '2023-12-11 08:35:08'),
(33, 8, 83, 7000, 1, '2023-12-11 08:35:08', '2023-12-11 08:35:08'),
(34, 9, 59, 17000, 1, '2023-12-12 03:54:27', '2023-12-12 03:54:27'),
(35, 9, 146, 7500, 1, '2023-12-12 03:54:27', '2023-12-12 03:54:27'),
(36, 9, 25, 16000, 1, '2023-12-12 03:54:27', '2023-12-12 03:54:27'),
(37, 9, 46, 26000, 1, '2023-12-12 03:54:27', '2023-12-12 03:54:27'),
(38, 10, 7, 39000, 1, '2023-12-12 03:55:00', '2023-12-12 03:55:00'),
(39, 10, 125, 19500, 1, '2023-12-12 03:55:00', '2023-12-12 03:55:00'),
(40, 10, 111, 26000, 1, '2023-12-12 03:55:00', '2023-12-12 03:55:00'),
(41, 11, 130, 21500, 1, '2023-12-12 03:55:30', '2023-12-12 03:55:30'),
(42, 11, 119, 258000, 1, '2023-12-12 03:55:30', '2023-12-12 03:55:30'),
(43, 11, 10, 29500, 1, '2023-12-12 03:55:30', '2023-12-12 03:55:30');

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
(1, 1, 121, 80000, 1, '2023-12-09 23:12:25', '2023-12-09 23:12:25'),
(2, 1, 3, 9000, 1, '2023-12-09 23:12:25', '2023-12-09 23:12:25'),
(3, 1, 86, 10500, 1, '2023-12-09 23:12:25', '2023-12-09 23:12:25'),
(4, 1, 2, 6600, 1, '2023-12-09 23:12:25', '2023-12-09 23:12:25'),
(5, 1, 96, 9000, 1, '2023-12-09 23:12:25', '2023-12-09 23:12:25'),
(6, 2, 90, 8500, 1, '2023-12-09 23:32:54', '2023-12-09 23:32:54'),
(7, 2, 1, 12000, 1, '2023-12-09 23:32:54', '2023-12-09 23:32:54'),
(8, 2, 27, 20500, 1, '2023-12-09 23:32:54', '2023-12-09 23:32:54'),
(9, 2, 57, 40000, 1, '2023-12-09 23:32:54', '2023-12-09 23:32:54'),
(10, 2, 160, 21000, 1, '2023-12-09 23:32:54', '2023-12-09 23:32:54'),
(11, 3, 63, 10000, 1, '2023-12-09 23:36:12', '2023-12-09 23:36:12'),
(12, 3, 138, 11500, 1, '2023-12-09 23:36:12', '2023-12-09 23:36:12'),
(13, 3, 74, 12000, 1, '2023-12-09 23:36:12', '2023-12-09 23:36:12'),
(14, 3, 142, 8500, 1, '2023-12-09 23:36:12', '2023-12-09 23:36:12'),
(15, 3, 84, 6500, 1, '2023-12-09 23:36:12', '2023-12-09 23:36:12'),
(16, 4, 6, 20000, 1, '2023-12-09 23:39:18', '2023-12-09 23:39:18'),
(17, 4, 108, 3500, 1, '2023-12-09 23:39:18', '2023-12-09 23:39:18'),
(18, 4, 104, 29000, 1, '2023-12-09 23:39:18', '2023-12-09 23:39:18'),
(19, 4, 91, 8500, 1, '2023-12-09 23:39:18', '2023-12-09 23:39:18'),
(20, 4, 210, 18000, 1, '2023-12-09 23:39:18', '2023-12-09 23:39:18'),
(21, 5, 79, 6000, 1, '2023-12-11 04:08:51', '2023-12-11 04:08:51'),
(22, 5, 120, 145000, 1, '2023-12-11 04:08:51', '2023-12-11 04:08:51'),
(23, 5, 137, 11500, 1, '2023-12-11 04:08:51', '2023-12-11 04:08:51'),
(24, 6, 11, 30000, 1, '2023-12-11 08:04:49', '2023-12-11 08:04:49'),
(25, 6, 125, 19500, 1, '2023-12-11 08:04:49', '2023-12-11 08:04:49'),
(26, 6, 139, 25000, 1, '2023-12-11 08:04:49', '2023-12-11 08:04:49'),
(31, 8, 75, 8500, 1, '2023-12-11 08:34:06', '2023-12-11 08:34:06'),
(32, 8, 138, 11500, 1, '2023-12-11 08:34:06', '2023-12-11 08:34:06'),
(33, 8, 83, 7000, 1, '2023-12-11 08:34:06', '2023-12-11 08:34:06'),
(34, 9, 59, 17000, 1, '2023-12-12 02:11:12', '2023-12-12 02:11:12'),
(35, 9, 146, 7500, 1, '2023-12-12 02:11:12', '2023-12-12 02:11:12'),
(36, 9, 25, 16000, 1, '2023-12-12 02:11:12', '2023-12-12 02:11:12'),
(37, 9, 46, 26000, 1, '2023-12-12 02:11:12', '2023-12-12 02:11:12'),
(38, 10, 7, 39000, 1, '2023-12-12 02:13:09', '2023-12-12 02:13:09'),
(39, 10, 125, 19500, 1, '2023-12-12 02:13:09', '2023-12-12 02:13:09'),
(40, 10, 111, 26000, 1, '2023-12-12 02:13:09', '2023-12-12 02:13:09'),
(41, 11, 130, 21500, 1, '2023-12-12 02:18:52', '2023-12-12 02:18:52'),
(42, 11, 119, 258000, 1, '2023-12-12 02:18:52', '2023-12-12 02:18:52'),
(43, 11, 10, 29500, 1, '2023-12-12 02:18:52', '2023-12-12 02:18:52'),
(44, 12, 251, 35000, 12, '2023-12-12 11:27:07', '2023-12-12 11:27:07'),
(45, 12, 61, 12500, 3, '2023-12-12 11:27:07', '2023-12-12 11:27:07'),
(46, 12, 15, 12000, 2, '2023-12-12 11:27:07', '2023-12-12 11:27:07');

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
(1, 'Makanan Kaleng', '2023-11-06 07:09:55', '2023-12-02 14:04:20'),
(2, 'Cemilan & Biskuit', '2023-11-06 07:09:57', '2023-12-02 13:38:16'),
(3, 'Minuman Ringan', '2023-11-06 07:10:01', '2023-12-05 05:58:37'),
(4, 'Alat Tulis & Perlengkapan Kantor', '2023-12-02 09:46:46', '2023-12-02 13:07:42'),
(5, 'Kesehatan & Kecantikan', '2023-12-02 10:04:40', '2023-12-05 06:25:18'),
(6, 'Gula & Tepung', '2023-12-02 11:41:26', '2023-12-02 11:41:26'),
(7, 'Minyak Goreng', '2023-12-02 12:12:19', '2023-12-02 12:34:57'),
(8, 'Mentega & Margarin', '2023-12-02 12:39:18', '2023-12-02 12:39:18'),
(9, 'Keju', '2023-12-02 12:51:52', '2023-12-02 12:51:52'),
(10, 'Pupuk & Obat-obatan Tanaman', '2023-12-02 14:22:27', '2023-12-02 14:22:27'),
(11, 'Beras', '2023-12-02 14:55:50', '2023-12-02 14:55:50'),
(12, 'Air Mineral', '2023-12-05 05:46:16', '2023-12-05 05:46:16'),
(13, 'Susu', '2023-12-05 14:44:39', '2023-12-05 14:44:39'),
(14, 'Kopi', '2023-12-05 14:56:07', '2023-12-05 14:56:07'),
(15, 'Ibu & Anak', '2023-12-08 10:52:33', '2023-12-08 10:52:33'),
(16, 'Perlengkapan Rumah Tangga', '2023-12-08 11:25:09', '2023-12-08 11:25:09');

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
(1, '1245646612155646', 'Rias Gremory', 'Perempuan', 'rias@gmail.com', 'Denpasar', '081234567890', 'Admin', 'foto_pegawai/EThEXWDzWm5wq9w8kQ4PTfW5B2zX9HlWgbbShNIq.png', 2, '2023-11-06 15:04:24', '2023-12-01 16:24:03'),
(2, '12312312321323242', 'Rem', 'Laki-laki', 'rem@gmail.com', 'Denpasar', '081234567890', 'Admin', 'foto_pegawai/JBM1VjYZUtxegkhkONP7VAGwCcTpp1rlbQIfD8rR.png', 3, '2023-11-29 18:57:43', '2023-12-01 17:07:35'),
(3, '5107022205750002', 'Wayan Gede Sudana', 'Laki-laki', 'gedesudana75@gmail.com', 'Br. Telunwayah duuran, Gg.sandat no. 8 desa Tri Eka Buana', '088225781286', 'Kepala BUMDes', 'foto_pegawai/8WfQqz12T4qpfUSGSjcZzDBw5K5sb0MoB9KlAL00.jpg', 9, '2023-12-09 13:31:06', '2023-12-09 13:31:06'),
(4, '5107026506010003', 'Luh Ami', 'Perempuan', 'luhami23@gmail.com', 'Br. Jasri, No. 2, Desa Tri Eka Buana', '087762456784', 'Admin', 'foto_pegawai/p2PlfwKTdc3TnVRA4r7yQBW0vutGFk3quCIrNj5t.jpg', 10, '2023-12-09 13:38:11', '2023-12-09 13:38:11'),
(5, '5107025408020001', 'Komang Sinta', 'Perempuan', 'komangsinta87E@gmail.com', 'Br. Jasri, No.16 Esa Tri Eka Buana', '087762235674', 'Admin', 'foto_pegawai/iVSJpqmSRIRORuPWxg84nomrPPYFbjRZAsjD1mza.jpg', 11, '2023-12-09 13:44:15', '2023-12-09 13:44:15');

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
(1, 7, 4, '2023-12-10', 'Wayan Nata', 'Br. Jasri, gang mangga no.8 Desa Tri Eka Buana', '087762908543', 'rumah', 115100, '2023-12-10 01:50:42', '2023-12-10 01:50:42'),
(2, 4, 4, '2023-12-10', 'Kadek sintya', 'Gg. Sandat, no 3 Br. Telun wayah beduuran, Desa Tri eka Buana', '081234567890', 'rumah', 102000, '2023-12-10 01:50:54', '2023-12-10 01:50:54'),
(3, 5, 4, '2023-12-10', 'Bagus Aditya', 'Br. Telun wayah betenan, no. 4 Desa Tri Eka Buana', '087762750821', 'rumah', 48500, '2023-12-10 01:51:06', '2023-12-10 01:51:06'),
(4, 6, 4, '2023-12-10', 'Ngurah adi', 'Br. jasri, no. 10 Desa Tri Eka Buana', '0882356874', 'rumah', 79000, '2023-12-10 01:51:13', '2023-12-10 01:51:13'),
(5, 9, 4, '2023-12-11', 'Putu Anggi', 'Br. Pungutan, Gg. Cempaka no.6 Desa Tri Eka Buana', '087762453217', 'Rumah', 74500, '2023-12-11 08:19:43', '2023-12-11 08:19:43'),
(7, 8, 4, '2023-12-11', 'Komang ayu', 'Br. Telunwayah betenan, Gg. Manggis no.7 Desa Tri Eka Buana', '087762431657', 'Rumah', 162500, '2023-12-11 08:34:45', '2023-12-11 08:34:45'),
(8, 11, 4, '2023-12-11', 'De An', 'Br. Jasri, no.10 desa Tri Eka Buana', '081980765423', 'Rumah', 27000, '2023-12-11 08:35:08', '2023-12-11 08:35:08'),
(9, 13, 4, '2023-12-12', 'Sri Ayu Lestari', 'Br. Telunwayah duuran, Gg. Gadung no.8', '085737102503', 'Rumah', 66500, '2023-12-12 03:54:27', '2023-12-12 03:54:27'),
(10, 12, 4, '2023-12-12', 'Made nonik', 'Br. Telunwayah duuran, Gg. Sandat no.7', '087762786950', 'Rumah', 84500, '2023-12-12 03:55:00', '2023-12-12 03:55:00'),
(11, 14, 4, '2023-12-12', 'Kadek adi', 'Br. Telunwayah betenan, no.5', '085904141597', 'Rumah', 309000, '2023-12-12 03:55:30', '2023-12-12 03:55:30');

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
(1, 7, 4, '2023-12-09', 'Wayan Nata', 'Br. Jasri, gang mangga no.8 Desa Tri Eka Buana', '087762908543', 'rumah', 115100, 'Dikonfirmasi', 'Dikonfirmasi', 'Belum Dikonfirmasi', '2023-12-09 23:12:25', '2023-12-10 01:50:42'),
(2, 4, 4, '2023-12-09', 'Kadek sintya', 'Gg. Sandat, no 3 Br. Telun wayah beduuran, Desa Tri eka Buana', '081234567890', 'rumah', 102000, 'Dikonfirmasi', 'Dikonfirmasi', 'Belum Dikonfirmasi', '2023-12-09 23:32:54', '2023-12-10 01:50:54'),
(3, 5, 4, '2023-12-09', 'Bagus Aditya', 'Br. Telun wayah betenan, no. 4 Desa Tri Eka Buana', '087762750821', 'rumah', 48500, 'Dikonfirmasi', 'Dikonfirmasi', 'Belum Dikonfirmasi', '2023-12-09 23:36:12', '2023-12-10 01:51:06'),
(4, 6, 4, '2023-12-09', 'Ngurah adi', 'Br. jasri, no. 10 Desa Tri Eka Buana', '0882356874', 'rumah', 79000, 'Dikonfirmasi', 'Dikonfirmasi', 'Belum Dikonfirmasi', '2023-12-09 23:39:18', '2023-12-10 01:51:13'),
(5, 8, 4, '2023-12-11', 'Komang ayu', 'Br. Telunwayah betenan, Gg. Manggis no.7 Desa Tri Eka Buana', '087762431657', 'Rumah', 162500, 'Dikonfirmasi', 'Belum Dikonfirmasi', 'Dikonfirmasi', '2023-12-11 04:08:51', '2023-12-11 08:34:45'),
(6, 9, 4, '2023-12-11', 'Putu Anggi', 'Br. Pungutan, Gg. Cempaka no.6 Desa Tri Eka Buana', '087762453217', 'Rumah', 74500, 'Dikonfirmasi', 'Dikonfirmasi', 'Belum Dikonfirmasi', '2023-12-11 08:04:49', '2023-12-11 08:19:43'),
(8, 11, 4, '2023-12-11', 'De An', 'Br. Jasri, no.10 desa Tri Eka Buana', '081980765423', 'Rumah', 27000, 'Dikonfirmasi', 'Belum Dikonfirmasi', 'Dikonfirmasi', '2023-12-11 08:34:06', '2023-12-11 08:35:08'),
(9, 13, 4, '2023-12-12', 'Sri Ayu Lestari', 'Br. Telunwayah duuran, Gg. Gadung no.8', '085737102503', 'Rumah', 66500, 'Dikonfirmasi', 'Belum Dikonfirmasi', 'Dikonfirmasi', '2023-12-12 02:11:12', '2023-12-12 03:54:27'),
(10, 12, 4, '2023-12-12', 'Made nonik', 'Br. Telunwayah duuran, Gg. Sandat no.7', '087762786950', 'Rumah', 84500, 'Dikonfirmasi', 'Belum Dikonfirmasi', 'Dikonfirmasi', '2023-12-12 02:13:09', '2023-12-12 03:55:00'),
(11, 14, 4, '2023-12-12', 'Kadek adi', 'Br. Telunwayah betenan, no.5', '085904141597', 'Rumah', 309000, 'Dikonfirmasi', 'Belum Dikonfirmasi', 'Dikonfirmasi', '2023-12-12 02:18:52', '2023-12-12 03:55:30'),
(12, 15, NULL, '2023-12-12', 'Ayu Linda', 'Br. Pungutan, Gg. Mawar no.4', '082341692382', 'Rumah', 481500, 'Dipesan', 'Belum Dikonfirmasi', 'Belum Dikonfirmasi', '2023-12-12 11:27:07', '2023-12-12 11:27:07');

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
(1, '2023-12-08', 100, 1, 'Tambah Stok', '2023-12-08 11:48:06', '2023-12-08 11:48:06'),
(2, '2023-12-08', 100, 2, 'Tambah Stok', '2023-12-08 11:48:11', '2023-12-08 11:48:11'),
(3, '2023-12-08', 100, 3, 'Tambah Stok', '2023-12-08 11:48:14', '2023-12-08 11:48:14'),
(4, '2023-12-08', 100, 4, 'Tambah Stok', '2023-12-08 11:48:16', '2023-12-08 11:48:16'),
(5, '2023-12-08', 100, 5, 'Tambah Stok', '2023-12-08 11:48:19', '2023-12-08 11:48:19'),
(6, '2023-12-08', 100, 6, 'Tambah Stok', '2023-12-08 11:48:22', '2023-12-08 11:48:22'),
(7, '2023-12-08', 100, 7, 'Tambah Stok', '2023-12-08 11:48:26', '2023-12-08 11:48:26'),
(8, '2023-12-08', 100, 8, 'Tambah Stok', '2023-12-08 11:48:32', '2023-12-08 11:48:32'),
(9, '2023-12-08', 100, 9, 'Tambah Stok', '2023-12-08 11:48:35', '2023-12-08 11:48:35'),
(10, '2023-12-08', 100, 10, 'Tambah Stok', '2023-12-08 11:48:39', '2023-12-08 11:48:39'),
(11, '2023-12-08', 100, 11, 'Tambah Stok', '2023-12-08 11:49:07', '2023-12-08 11:49:07'),
(12, '2023-12-08', 100, 12, 'Tambah Stok', '2023-12-08 11:49:11', '2023-12-08 11:49:11'),
(13, '2023-12-08', 100, 13, 'Tambah Stok', '2023-12-08 11:49:14', '2023-12-08 11:49:14'),
(14, '2023-12-08', 199, 14, 'Tambah Stok', '2023-12-08 11:49:17', '2023-12-08 11:49:17'),
(15, '2023-12-08', 100, 15, 'Tambah Stok', '2023-12-08 11:49:25', '2023-12-08 11:49:25'),
(16, '2023-12-08', 100, 16, 'Tambah Stok', '2023-12-08 11:49:30', '2023-12-08 11:49:30'),
(17, '2023-12-08', 100, 17, 'Tambah Stok', '2023-12-08 11:49:32', '2023-12-08 11:49:32'),
(18, '2023-12-08', 100, 18, 'Tambah Stok', '2023-12-08 11:49:35', '2023-12-08 11:49:35'),
(19, '2023-12-08', 100, 19, 'Tambah Stok', '2023-12-08 11:49:37', '2023-12-08 11:49:37'),
(20, '2023-12-08', 100, 20, 'Tambah Stok', '2023-12-08 11:49:41', '2023-12-08 11:49:41'),
(21, '2023-12-08', 100, 21, 'Tambah Stok', '2023-12-08 11:50:05', '2023-12-08 11:50:05'),
(22, '2023-12-08', 100, 22, 'Tambah Stok', '2023-12-08 11:50:08', '2023-12-08 11:50:08'),
(23, '2023-12-08', 100, 23, 'Tambah Stok', '2023-12-08 11:50:11', '2023-12-08 11:50:11'),
(24, '2023-12-08', 100, 24, 'Tambah Stok', '2023-12-08 11:50:13', '2023-12-08 11:50:13'),
(25, '2023-12-08', 100, 25, 'Tambah Stok', '2023-12-08 11:50:17', '2023-12-08 11:50:17'),
(26, '2023-12-08', 100, 26, 'Tambah Stok', '2023-12-08 11:50:20', '2023-12-08 11:50:20'),
(27, '2023-12-08', 100, 27, 'Tambah Stok', '2023-12-08 11:50:22', '2023-12-08 11:50:22'),
(28, '2023-12-08', 100, 28, 'Tambah Stok', '2023-12-08 11:50:25', '2023-12-08 11:50:25'),
(29, '2023-12-08', 100, 29, 'Tambah Stok', '2023-12-08 11:50:28', '2023-12-08 11:50:28'),
(30, '2023-12-08', 100, 30, 'Tambah Stok', '2023-12-08 11:50:30', '2023-12-08 11:50:30'),
(31, '2023-12-08', 100, 40, 'Tambah Stok', '2023-12-08 11:50:48', '2023-12-08 11:50:48'),
(32, '2023-12-08', 100, 31, 'Tambah Stok', '2023-12-08 11:50:51', '2023-12-08 11:50:51'),
(33, '2023-12-08', 100, 32, 'Tambah Stok', '2023-12-08 11:50:55', '2023-12-08 11:50:55'),
(34, '2023-12-08', 100, 33, 'Tambah Stok', '2023-12-08 11:50:58', '2023-12-08 11:50:58'),
(35, '2023-12-08', 100, 34, 'Tambah Stok', '2023-12-08 11:51:04', '2023-12-08 11:51:04'),
(36, '2023-12-08', 100, 35, 'Tambah Stok', '2023-12-08 11:51:06', '2023-12-08 11:51:06'),
(37, '2023-12-08', 100, 36, 'Tambah Stok', '2023-12-08 11:51:09', '2023-12-08 11:51:09'),
(38, '2023-12-08', 100, 37, 'Tambah Stok', '2023-12-08 11:51:12', '2023-12-08 11:51:12'),
(39, '2023-12-08', 100, 38, 'Tambah Stok', '2023-12-08 11:51:15', '2023-12-08 11:51:15'),
(40, '2023-12-08', 100, 39, 'Tambah Stok', '2023-12-08 11:51:17', '2023-12-08 11:51:17'),
(41, '2023-12-08', 100, 50, 'Tambah Stok', '2023-12-08 11:52:01', '2023-12-08 11:52:01'),
(42, '2023-12-08', 100, 41, 'Tambah Stok', '2023-12-08 11:52:07', '2023-12-08 11:52:07'),
(43, '2023-12-08', 100, 42, 'Tambah Stok', '2023-12-08 11:52:10', '2023-12-08 11:52:10'),
(44, '2023-12-08', 100, 43, 'Tambah Stok', '2023-12-08 11:52:12', '2023-12-08 11:52:12'),
(45, '2023-12-08', 100, 44, 'Tambah Stok', '2023-12-08 11:52:15', '2023-12-08 11:52:15'),
(46, '2023-12-08', 100, 45, 'Tambah Stok', '2023-12-08 11:52:17', '2023-12-08 11:52:17'),
(47, '2023-12-08', 100, 46, 'Tambah Stok', '2023-12-08 11:52:19', '2023-12-08 11:52:19'),
(48, '2023-12-08', 100, 47, 'Tambah Stok', '2023-12-08 11:52:21', '2023-12-08 11:52:21'),
(49, '2023-12-08', 100, 48, 'Tambah Stok', '2023-12-08 11:52:24', '2023-12-08 11:52:24'),
(50, '2023-12-08', 100, 49, 'Tambah Stok', '2023-12-08 11:52:26', '2023-12-08 11:52:26'),
(51, '2023-12-08', 100, 60, 'Tambah Stok', '2023-12-08 11:52:42', '2023-12-08 11:52:42'),
(52, '2023-12-08', 100, 51, 'Tambah Stok', '2023-12-08 11:52:48', '2023-12-08 11:52:48'),
(53, '2023-12-08', 100, 52, 'Tambah Stok', '2023-12-08 11:52:51', '2023-12-08 11:52:51'),
(54, '2023-12-08', 100, 53, 'Tambah Stok', '2023-12-08 11:52:55', '2023-12-08 11:52:55'),
(55, '2023-12-08', 100, 54, 'Tambah Stok', '2023-12-08 11:52:57', '2023-12-08 11:52:57'),
(56, '2023-12-08', 100, 55, 'Tambah Stok', '2023-12-08 11:53:01', '2023-12-08 11:53:01'),
(57, '2023-12-08', 100, 56, 'Tambah Stok', '2023-12-08 11:53:03', '2023-12-08 11:53:03'),
(58, '2023-12-08', 100, 57, 'Tambah Stok', '2023-12-08 11:53:06', '2023-12-08 11:53:06'),
(59, '2023-12-08', 100, 58, 'Tambah Stok', '2023-12-08 11:53:08', '2023-12-08 11:53:08'),
(60, '2023-12-08', 100, 59, 'Tambah Stok', '2023-12-08 11:53:11', '2023-12-08 11:53:11'),
(61, '2023-12-08', 100, 70, 'Tambah Stok', '2023-12-08 11:53:38', '2023-12-08 11:53:38'),
(62, '2023-12-08', 100, 61, 'Tambah Stok', '2023-12-08 11:53:42', '2023-12-08 11:53:42'),
(63, '2023-12-08', 100, 62, 'Tambah Stok', '2023-12-08 11:53:46', '2023-12-08 11:53:46'),
(64, '2023-12-08', 100, 63, 'Tambah Stok', '2023-12-08 11:53:49', '2023-12-08 11:53:49'),
(65, '2023-12-08', 100, 64, 'Tambah Stok', '2023-12-08 11:53:51', '2023-12-08 11:53:51'),
(66, '2023-12-08', 100, 65, 'Tambah Stok', '2023-12-08 11:53:54', '2023-12-08 11:53:54'),
(67, '2023-12-08', 100, 66, 'Tambah Stok', '2023-12-08 11:53:57', '2023-12-08 11:53:57'),
(68, '2023-12-08', 100, 67, 'Tambah Stok', '2023-12-08 11:53:59', '2023-12-08 11:53:59'),
(69, '2023-12-08', 100, 68, 'Tambah Stok', '2023-12-08 11:54:01', '2023-12-08 11:54:01'),
(70, '2023-12-08', 100, 69, 'Tambah Stok', '2023-12-08 11:54:04', '2023-12-08 11:54:04'),
(71, '2023-12-08', 100, 71, 'Tambah Stok', '2023-12-08 11:54:23', '2023-12-08 11:54:23'),
(72, '2023-12-08', 100, 72, 'Tambah Stok', '2023-12-08 11:54:27', '2023-12-08 11:54:27'),
(73, '2023-12-08', 100, 73, 'Tambah Stok', '2023-12-08 11:54:29', '2023-12-08 11:54:29'),
(74, '2023-12-08', 100, 74, 'Tambah Stok', '2023-12-08 11:54:31', '2023-12-08 11:54:31'),
(75, '2023-12-08', 100, 75, 'Tambah Stok', '2023-12-08 11:54:33', '2023-12-08 11:54:33'),
(76, '2023-12-08', 100, 76, 'Tambah Stok', '2023-12-08 11:54:35', '2023-12-08 11:54:35'),
(77, '2023-12-08', 100, 77, 'Tambah Stok', '2023-12-08 11:54:38', '2023-12-08 11:54:38'),
(78, '2023-12-08', 100, 77, 'Tambah Stok', '2023-12-08 11:54:38', '2023-12-08 11:54:38'),
(79, '2023-12-08', 100, 78, 'Tambah Stok', '2023-12-08 11:54:40', '2023-12-08 11:54:40'),
(80, '2023-12-08', 100, 79, 'Tambah Stok', '2023-12-08 11:54:42', '2023-12-08 11:54:42'),
(81, '2023-12-08', 100, 80, 'Tambah Stok', '2023-12-08 11:54:45', '2023-12-08 11:54:45'),
(82, '2023-12-08', 100, 90, 'Tambah Stok', '2023-12-08 11:55:05', '2023-12-08 11:55:05'),
(83, '2023-12-08', 100, 81, 'Tambah Stok', '2023-12-08 11:55:08', '2023-12-08 11:55:08'),
(84, '2023-12-08', 100, 82, 'Tambah Stok', '2023-12-08 11:55:12', '2023-12-08 11:55:12'),
(85, '2023-12-08', 100, 83, 'Tambah Stok', '2023-12-08 11:55:14', '2023-12-08 11:55:14'),
(86, '2023-12-08', 100, 84, 'Tambah Stok', '2023-12-08 11:55:16', '2023-12-08 11:55:16'),
(87, '2023-12-08', 100, 85, 'Tambah Stok', '2023-12-08 11:55:18', '2023-12-08 11:55:18'),
(88, '2023-12-08', 100, 86, 'Tambah Stok', '2023-12-08 11:55:20', '2023-12-08 11:55:20'),
(89, '2023-12-08', 100, 87, 'Tambah Stok', '2023-12-08 11:55:22', '2023-12-08 11:55:22'),
(90, '2023-12-08', 100, 88, 'Tambah Stok', '2023-12-08 11:55:25', '2023-12-08 11:55:25'),
(91, '2023-12-08', 100, 89, 'Tambah Stok', '2023-12-08 11:55:26', '2023-12-08 11:55:26'),
(92, '2023-12-08', 100, 100, 'Tambah Stok', '2023-12-08 11:55:44', '2023-12-08 11:55:44'),
(93, '2023-12-08', 100, 91, 'Tambah Stok', '2023-12-08 11:55:47', '2023-12-08 11:55:47'),
(94, '2023-12-08', 100, 92, 'Tambah Stok', '2023-12-08 11:55:49', '2023-12-08 11:55:49'),
(95, '2023-12-08', 100, 93, 'Tambah Stok', '2023-12-08 11:55:51', '2023-12-08 11:55:51'),
(96, '2023-12-08', 100, 94, 'Tambah Stok', '2023-12-08 11:55:53', '2023-12-08 11:55:53'),
(97, '2023-12-08', 100, 95, 'Tambah Stok', '2023-12-08 11:55:55', '2023-12-08 11:55:55'),
(98, '2023-12-08', 100, 96, 'Tambah Stok', '2023-12-08 11:55:58', '2023-12-08 11:55:58'),
(99, '2023-12-08', 100, 97, 'Tambah Stok', '2023-12-08 11:56:00', '2023-12-08 11:56:00'),
(100, '2023-12-08', 100, 98, 'Tambah Stok', '2023-12-08 11:56:03', '2023-12-08 11:56:03'),
(101, '2023-12-08', 100, 99, 'Tambah Stok', '2023-12-08 11:56:05', '2023-12-08 11:56:05'),
(102, '2023-12-08', 100, 110, 'Tambah Stok', '2023-12-08 11:56:24', '2023-12-08 11:56:24'),
(103, '2023-12-08', 100, 101, 'Tambah Stok', '2023-12-08 11:56:26', '2023-12-08 11:56:26'),
(104, '2023-12-08', 100, 102, 'Tambah Stok', '2023-12-08 11:56:28', '2023-12-08 11:56:28'),
(105, '2023-12-08', 100, 103, 'Tambah Stok', '2023-12-08 11:56:30', '2023-12-08 11:56:30'),
(106, '2023-12-08', 100, 104, 'Tambah Stok', '2023-12-08 11:56:35', '2023-12-08 11:56:35'),
(107, '2023-12-08', 100, 105, 'Tambah Stok', '2023-12-08 11:56:37', '2023-12-08 11:56:37'),
(108, '2023-12-08', 100, 106, 'Tambah Stok', '2023-12-08 11:56:39', '2023-12-08 11:56:39'),
(109, '2023-12-08', 100, 107, 'Tambah Stok', '2023-12-08 11:56:41', '2023-12-08 11:56:41'),
(110, '2023-12-08', 100, 108, 'Tambah Stok', '2023-12-08 11:56:44', '2023-12-08 11:56:44'),
(111, '2023-12-08', 100, 109, 'Tambah Stok', '2023-12-08 11:56:46', '2023-12-08 11:56:46'),
(112, '2023-12-08', 100, 120, 'Tambah Stok', '2023-12-08 11:57:10', '2023-12-08 11:57:10'),
(113, '2023-12-08', 100, 111, 'Tambah Stok', '2023-12-08 11:57:14', '2023-12-08 11:57:14'),
(114, '2023-12-08', 100, 112, 'Tambah Stok', '2023-12-08 11:57:16', '2023-12-08 11:57:16'),
(115, '2023-12-08', 100, 113, 'Tambah Stok', '2023-12-08 11:57:18', '2023-12-08 11:57:18'),
(116, '2023-12-08', 100, 114, 'Tambah Stok', '2023-12-08 11:57:20', '2023-12-08 11:57:20'),
(117, '2023-12-08', 100, 115, 'Tambah Stok', '2023-12-08 11:57:23', '2023-12-08 11:57:23'),
(118, '2023-12-08', 100, 116, 'Tambah Stok', '2023-12-08 11:57:25', '2023-12-08 11:57:25'),
(119, '2023-12-08', 100, 117, 'Tambah Stok', '2023-12-08 11:57:27', '2023-12-08 11:57:27'),
(120, '2023-12-08', 100, 118, 'Tambah Stok', '2023-12-08 11:57:29', '2023-12-08 11:57:29'),
(121, '2023-12-08', 100, 119, 'Tambah Stok', '2023-12-08 11:57:33', '2023-12-08 11:57:33'),
(122, '2023-12-08', 100, 121, 'Tambah Stok', '2023-12-08 11:57:58', '2023-12-08 11:57:58'),
(123, '2023-12-08', 100, 122, 'Tambah Stok', '2023-12-08 11:58:01', '2023-12-08 11:58:01'),
(124, '2023-12-08', 100, 123, 'Tambah Stok', '2023-12-08 11:58:03', '2023-12-08 11:58:03'),
(125, '2023-12-08', 100, 124, 'Tambah Stok', '2023-12-08 11:58:05', '2023-12-08 11:58:05'),
(126, '2023-12-08', 100, 125, 'Tambah Stok', '2023-12-08 11:58:07', '2023-12-08 11:58:07'),
(127, '2023-12-08', 100, 126, 'Tambah Stok', '2023-12-08 11:58:09', '2023-12-08 11:58:09'),
(128, '2023-12-08', 100, 127, 'Tambah Stok', '2023-12-08 11:58:12', '2023-12-08 11:58:12'),
(129, '2023-12-08', 100, 128, 'Tambah Stok', '2023-12-08 11:58:14', '2023-12-08 11:58:14'),
(130, '2023-12-08', 100, 129, 'Tambah Stok', '2023-12-08 11:58:16', '2023-12-08 11:58:16'),
(131, '2023-12-08', 100, 130, 'Tambah Stok', '2023-12-08 11:58:49', '2023-12-08 11:58:49'),
(132, '2023-12-08', 100, 131, 'Tambah Stok', '2023-12-08 11:58:53', '2023-12-08 11:58:53'),
(133, '2023-12-08', 100, 132, 'Tambah Stok', '2023-12-08 11:58:56', '2023-12-08 11:58:56'),
(134, '2023-12-08', 100, 133, 'Tambah Stok', '2023-12-08 11:58:58', '2023-12-08 11:58:58'),
(135, '2023-12-08', 100, 134, 'Tambah Stok', '2023-12-08 11:59:00', '2023-12-08 11:59:00'),
(136, '2023-12-08', 100, 135, 'Tambah Stok', '2023-12-08 11:59:02', '2023-12-08 11:59:02'),
(137, '2023-12-08', 100, 136, 'Tambah Stok', '2023-12-08 11:59:05', '2023-12-08 11:59:05'),
(138, '2023-12-08', 100, 137, 'Tambah Stok', '2023-12-08 11:59:07', '2023-12-08 11:59:07'),
(139, '2023-12-08', 100, 138, 'Tambah Stok', '2023-12-08 11:59:09', '2023-12-08 11:59:09'),
(140, '2023-12-08', 100, 139, 'Tambah Stok', '2023-12-08 11:59:12', '2023-12-08 11:59:12'),
(141, '2023-12-08', 100, 149, 'Tambah Stok', '2023-12-08 11:59:33', '2023-12-08 11:59:33'),
(142, '2023-12-08', 100, 140, 'Tambah Stok', '2023-12-08 11:59:36', '2023-12-08 11:59:36'),
(143, '2023-12-08', 100, 141, 'Tambah Stok', '2023-12-08 11:59:39', '2023-12-08 11:59:39'),
(144, '2023-12-08', 100, 142, 'Tambah Stok', '2023-12-08 11:59:41', '2023-12-08 11:59:41'),
(145, '2023-12-08', 100, 143, 'Tambah Stok', '2023-12-08 11:59:43', '2023-12-08 11:59:43'),
(146, '2023-12-08', 100, 144, 'Tambah Stok', '2023-12-08 11:59:45', '2023-12-08 11:59:45'),
(147, '2023-12-08', 100, 145, 'Tambah Stok', '2023-12-08 11:59:47', '2023-12-08 11:59:47'),
(148, '2023-12-08', 100, 146, 'Tambah Stok', '2023-12-08 11:59:49', '2023-12-08 11:59:49'),
(149, '2023-12-08', 100, 147, 'Tambah Stok', '2023-12-08 11:59:51', '2023-12-08 11:59:51'),
(150, '2023-12-08', 100, 148, 'Tambah Stok', '2023-12-08 11:59:53', '2023-12-08 11:59:53'),
(151, '2023-12-08', 100, 159, 'Tambah Stok', '2023-12-08 12:00:13', '2023-12-08 12:00:13'),
(152, '2023-12-08', 100, 150, 'Tambah Stok', '2023-12-08 12:00:15', '2023-12-08 12:00:15'),
(153, '2023-12-08', 100, 151, 'Tambah Stok', '2023-12-08 12:00:18', '2023-12-08 12:00:18'),
(154, '2023-12-08', 100, 152, 'Tambah Stok', '2023-12-08 12:00:20', '2023-12-08 12:00:20'),
(155, '2023-12-08', 100, 153, 'Tambah Stok', '2023-12-08 12:00:21', '2023-12-08 12:00:21'),
(156, '2023-12-08', 100, 154, 'Tambah Stok', '2023-12-08 12:00:23', '2023-12-08 12:00:23'),
(157, '2023-12-08', 100, 155, 'Tambah Stok', '2023-12-08 12:00:25', '2023-12-08 12:00:25'),
(158, '2023-12-08', 100, 156, 'Tambah Stok', '2023-12-08 12:00:27', '2023-12-08 12:00:27'),
(159, '2023-12-08', 100, 157, 'Tambah Stok', '2023-12-08 12:00:29', '2023-12-08 12:00:29'),
(160, '2023-12-08', 100, 158, 'Tambah Stok', '2023-12-08 12:00:32', '2023-12-08 12:00:32'),
(161, '2023-12-08', 100, 160, 'Tambah Stok', '2023-12-08 12:00:50', '2023-12-08 12:00:50'),
(162, '2023-12-08', 100, 161, 'Tambah Stok', '2023-12-08 12:00:54', '2023-12-08 12:00:54'),
(163, '2023-12-08', 100, 162, 'Tambah Stok', '2023-12-08 12:00:56', '2023-12-08 12:00:56'),
(164, '2023-12-08', 100, 163, 'Tambah Stok', '2023-12-08 12:00:58', '2023-12-08 12:00:58'),
(165, '2023-12-08', 100, 164, 'Tambah Stok', '2023-12-08 12:01:01', '2023-12-08 12:01:01'),
(166, '2023-12-08', 100, 165, 'Tambah Stok', '2023-12-08 12:01:03', '2023-12-08 12:01:03'),
(167, '2023-12-08', 100, 166, 'Tambah Stok', '2023-12-08 12:01:05', '2023-12-08 12:01:05'),
(168, '2023-12-08', 100, 167, 'Tambah Stok', '2023-12-08 12:01:08', '2023-12-08 12:01:08'),
(169, '2023-12-08', 100, 168, 'Tambah Stok', '2023-12-08 12:01:10', '2023-12-08 12:01:10'),
(170, '2023-12-08', 100, 169, 'Tambah Stok', '2023-12-08 12:01:13', '2023-12-08 12:01:13'),
(171, '2023-12-08', 100, 179, 'Tambah Stok', '2023-12-08 12:01:30', '2023-12-08 12:01:30'),
(172, '2023-12-08', 100, 170, 'Tambah Stok', '2023-12-08 12:01:33', '2023-12-08 12:01:33'),
(173, '2023-12-08', 100, 171, 'Tambah Stok', '2023-12-08 12:01:36', '2023-12-08 12:01:36'),
(174, '2023-12-08', 100, 172, 'Tambah Stok', '2023-12-08 12:01:39', '2023-12-08 12:01:39'),
(175, '2023-12-08', 100, 173, 'Tambah Stok', '2023-12-08 12:01:41', '2023-12-08 12:01:41'),
(176, '2023-12-08', 100, 174, 'Tambah Stok', '2023-12-08 12:01:43', '2023-12-08 12:01:43'),
(177, '2023-12-08', 100, 175, 'Tambah Stok', '2023-12-08 12:01:45', '2023-12-08 12:01:45'),
(178, '2023-12-08', 100, 176, 'Tambah Stok', '2023-12-08 12:01:48', '2023-12-08 12:01:48'),
(179, '2023-12-08', 100, 177, 'Tambah Stok', '2023-12-08 12:01:50', '2023-12-08 12:01:50'),
(180, '2023-12-08', 100, 178, 'Tambah Stok', '2023-12-08 12:01:52', '2023-12-08 12:01:52'),
(181, '2023-12-08', 100, 180, 'Tambah Stok', '2023-12-08 12:02:21', '2023-12-08 12:02:21'),
(182, '2023-12-08', 100, 181, 'Tambah Stok', '2023-12-08 12:02:24', '2023-12-08 12:02:24'),
(183, '2023-12-08', 100, 182, 'Tambah Stok', '2023-12-08 12:02:26', '2023-12-08 12:02:26'),
(184, '2023-12-08', 100, 183, 'Tambah Stok', '2023-12-08 12:02:28', '2023-12-08 12:02:28'),
(185, '2023-12-08', 100, 184, 'Tambah Stok', '2023-12-08 12:02:30', '2023-12-08 12:02:30'),
(186, '2023-12-08', 100, 185, 'Tambah Stok', '2023-12-08 12:02:33', '2023-12-08 12:02:33'),
(187, '2023-12-08', 100, 186, 'Tambah Stok', '2023-12-08 12:02:35', '2023-12-08 12:02:35'),
(188, '2023-12-08', 100, 187, 'Tambah Stok', '2023-12-08 12:02:37', '2023-12-08 12:02:37'),
(189, '2023-12-08', 100, 188, 'Tambah Stok', '2023-12-08 12:02:39', '2023-12-08 12:02:39'),
(190, '2023-12-08', 100, 189, 'Tambah Stok', '2023-12-08 12:02:42', '2023-12-08 12:02:42'),
(191, '2023-12-08', 100, 199, 'Tambah Stok', '2023-12-08 12:03:04', '2023-12-08 12:03:04'),
(192, '2023-12-08', 100, 190, 'Tambah Stok', '2023-12-08 12:03:08', '2023-12-08 12:03:08'),
(193, '2023-12-08', 100, 191, 'Tambah Stok', '2023-12-08 12:03:10', '2023-12-08 12:03:10'),
(194, '2023-12-08', 100, 192, 'Tambah Stok', '2023-12-08 12:03:12', '2023-12-08 12:03:12'),
(195, '2023-12-08', 100, 193, 'Tambah Stok', '2023-12-08 12:03:15', '2023-12-08 12:03:15'),
(196, '2023-12-08', 100, 194, 'Tambah Stok', '2023-12-08 12:03:18', '2023-12-08 12:03:18'),
(197, '2023-12-08', 100, 195, 'Tambah Stok', '2023-12-08 12:03:20', '2023-12-08 12:03:20'),
(198, '2023-12-08', 100, 196, 'Tambah Stok', '2023-12-08 12:03:22', '2023-12-08 12:03:22'),
(199, '2023-12-08', 100, 197, 'Tambah Stok', '2023-12-08 12:03:24', '2023-12-08 12:03:24'),
(200, '2023-12-08', 100, 198, 'Tambah Stok', '2023-12-08 12:03:27', '2023-12-08 12:03:27'),
(201, '2023-12-08', 100, 209, 'Tambah Stok', '2023-12-08 12:03:45', '2023-12-08 12:03:45'),
(202, '2023-12-08', 100, 200, 'Tambah Stok', '2023-12-08 12:03:48', '2023-12-08 12:03:48'),
(203, '2023-12-08', 100, 201, 'Tambah Stok', '2023-12-08 12:03:52', '2023-12-08 12:03:52'),
(204, '2023-12-08', 100, 202, 'Tambah Stok', '2023-12-08 12:03:54', '2023-12-08 12:03:54'),
(205, '2023-12-08', 100, 203, 'Tambah Stok', '2023-12-08 12:03:57', '2023-12-08 12:03:57'),
(206, '2023-12-08', 100, 204, 'Tambah Stok', '2023-12-08 12:03:59', '2023-12-08 12:03:59'),
(207, '2023-12-08', 100, 205, 'Tambah Stok', '2023-12-08 12:04:01', '2023-12-08 12:04:01'),
(208, '2023-12-08', 100, 206, 'Tambah Stok', '2023-12-08 12:04:03', '2023-12-08 12:04:03'),
(209, '2023-12-08', 100, 207, 'Tambah Stok', '2023-12-08 12:04:05', '2023-12-08 12:04:05'),
(210, '2023-12-08', 100, 208, 'Tambah Stok', '2023-12-08 12:04:08', '2023-12-08 12:04:08'),
(211, '2023-12-08', 100, 219, 'Tambah Stok', '2023-12-08 12:05:09', '2023-12-08 12:05:09'),
(212, '2023-12-08', 100, 210, 'Tambah Stok', '2023-12-08 12:05:13', '2023-12-08 12:05:13'),
(213, '2023-12-08', 100, 211, 'Tambah Stok', '2023-12-08 12:05:16', '2023-12-08 12:05:16'),
(214, '2023-12-08', 100, 212, 'Tambah Stok', '2023-12-08 12:05:19', '2023-12-08 12:05:19'),
(215, '2023-12-08', 100, 213, 'Tambah Stok', '2023-12-08 12:05:22', '2023-12-08 12:05:22'),
(216, '2023-12-08', 100, 214, 'Tambah Stok', '2023-12-08 12:05:24', '2023-12-08 12:05:24'),
(217, '2023-12-08', 100, 215, 'Tambah Stok', '2023-12-08 12:05:26', '2023-12-08 12:05:26'),
(218, '2023-12-08', 100, 216, 'Tambah Stok', '2023-12-08 12:05:29', '2023-12-08 12:05:29'),
(219, '2023-12-08', 100, 217, 'Tambah Stok', '2023-12-08 12:05:31', '2023-12-08 12:05:31'),
(220, '2023-12-08', 100, 218, 'Tambah Stok', '2023-12-08 12:05:34', '2023-12-08 12:05:34'),
(221, '2023-12-08', 100, 225, 'Tambah Stok', '2023-12-08 12:05:49', '2023-12-08 12:05:49'),
(222, '2023-12-08', 100, 220, 'Tambah Stok', '2023-12-08 12:05:51', '2023-12-08 12:05:51'),
(223, '2023-12-08', 100, 221, 'Tambah Stok', '2023-12-08 12:05:53', '2023-12-08 12:05:53'),
(224, '2023-12-08', 100, 222, 'Tambah Stok', '2023-12-08 12:05:57', '2023-12-08 12:05:57'),
(225, '2023-12-08', 100, 223, 'Tambah Stok', '2023-12-08 12:05:59', '2023-12-08 12:05:59'),
(226, '2023-12-08', 100, 224, 'Tambah Stok', '2023-12-08 12:06:01', '2023-12-08 12:06:01'),
(227, '2023-12-09', 1, 121, 'Terjual', '2023-12-09 23:12:25', '2023-12-09 23:12:25'),
(228, '2023-12-09', 1, 3, 'Terjual', '2023-12-09 23:12:25', '2023-12-09 23:12:25'),
(229, '2023-12-09', 1, 86, 'Terjual', '2023-12-09 23:12:25', '2023-12-09 23:12:25'),
(230, '2023-12-09', 1, 2, 'Terjual', '2023-12-09 23:12:25', '2023-12-09 23:12:25'),
(231, '2023-12-09', 1, 96, 'Terjual', '2023-12-09 23:12:25', '2023-12-09 23:12:25'),
(232, '2023-12-09', 1, 90, 'Terjual', '2023-12-09 23:32:54', '2023-12-09 23:32:54'),
(233, '2023-12-09', 1, 1, 'Terjual', '2023-12-09 23:32:54', '2023-12-09 23:32:54'),
(234, '2023-12-09', 1, 27, 'Terjual', '2023-12-09 23:32:54', '2023-12-09 23:32:54'),
(235, '2023-12-09', 1, 57, 'Terjual', '2023-12-09 23:32:54', '2023-12-09 23:32:54'),
(236, '2023-12-09', 1, 160, 'Terjual', '2023-12-09 23:32:54', '2023-12-09 23:32:54'),
(237, '2023-12-09', 1, 63, 'Terjual', '2023-12-09 23:36:12', '2023-12-09 23:36:12'),
(238, '2023-12-09', 1, 138, 'Terjual', '2023-12-09 23:36:12', '2023-12-09 23:36:12'),
(239, '2023-12-09', 1, 74, 'Terjual', '2023-12-09 23:36:12', '2023-12-09 23:36:12'),
(240, '2023-12-09', 1, 142, 'Terjual', '2023-12-09 23:36:12', '2023-12-09 23:36:12'),
(241, '2023-12-09', 1, 84, 'Terjual', '2023-12-09 23:36:12', '2023-12-09 23:36:12'),
(242, '2023-12-09', 1, 6, 'Terjual', '2023-12-09 23:39:18', '2023-12-09 23:39:18'),
(243, '2023-12-09', 1, 108, 'Terjual', '2023-12-09 23:39:18', '2023-12-09 23:39:18'),
(244, '2023-12-09', 1, 104, 'Terjual', '2023-12-09 23:39:18', '2023-12-09 23:39:18'),
(245, '2023-12-09', 1, 91, 'Terjual', '2023-12-09 23:39:18', '2023-12-09 23:39:18'),
(246, '2023-12-09', 1, 210, 'Terjual', '2023-12-09 23:39:18', '2023-12-09 23:39:18'),
(247, '2023-12-11', 1, 79, 'Terjual', '2023-12-11 04:08:51', '2023-12-11 04:08:51'),
(248, '2023-12-11', 1, 120, 'Terjual', '2023-12-11 04:08:51', '2023-12-11 04:08:51'),
(249, '2023-12-11', 1, 137, 'Terjual', '2023-12-11 04:08:51', '2023-12-11 04:08:51'),
(250, '2023-12-11', 1, 11, 'Terjual', '2023-12-11 08:04:49', '2023-12-11 08:04:49'),
(251, '2023-12-11', 1, 125, 'Terjual', '2023-12-11 08:04:49', '2023-12-11 08:04:49'),
(252, '2023-12-11', 1, 139, 'Terjual', '2023-12-11 08:04:49', '2023-12-11 08:04:49'),
(253, '2023-12-11', 1, 76, 'Terjual', '2023-12-11 08:14:42', '2023-12-11 08:14:42'),
(254, '2023-12-11', 1, 79, 'Terjual', '2023-12-11 08:14:42', '2023-12-11 08:14:42'),
(255, '2023-12-11', 1, 86, 'Terjual', '2023-12-11 08:14:42', '2023-12-11 08:14:42'),
(256, '2023-12-11', 1, 134, 'Terjual', '2023-12-11 08:14:42', '2023-12-11 08:14:42'),
(257, '2023-12-11', 1, 75, 'Terjual', '2023-12-11 08:34:06', '2023-12-11 08:34:06'),
(258, '2023-12-11', 1, 138, 'Terjual', '2023-12-11 08:34:06', '2023-12-11 08:34:06'),
(259, '2023-12-11', 1, 83, 'Terjual', '2023-12-11 08:34:06', '2023-12-11 08:34:06'),
(260, '2023-12-11', 100, 235, 'Tambah Stok', '2023-12-11 17:53:12', '2023-12-11 17:53:12'),
(261, '2023-12-11', 100, 226, 'Tambah Stok', '2023-12-11 17:53:20', '2023-12-11 17:53:20'),
(262, '2023-12-11', 100, 227, 'Tambah Stok', '2023-12-11 17:53:23', '2023-12-11 17:53:23'),
(263, '2023-12-11', 100, 228, 'Tambah Stok', '2023-12-11 17:53:27', '2023-12-11 17:53:27'),
(264, '2023-12-11', 100, 229, 'Tambah Stok', '2023-12-11 17:53:29', '2023-12-11 17:53:29'),
(265, '2023-12-11', 100, 230, 'Tambah Stok', '2023-12-11 17:53:32', '2023-12-11 17:53:32'),
(266, '2023-12-11', 100, 231, 'Tambah Stok', '2023-12-11 17:53:34', '2023-12-11 17:53:34'),
(267, '2023-12-11', 100, 232, 'Tambah Stok', '2023-12-11 17:53:36', '2023-12-11 17:53:36'),
(268, '2023-12-11', 100, 233, 'Tambah Stok', '2023-12-11 17:53:38', '2023-12-11 17:53:38'),
(269, '2023-12-11', 100, 234, 'Tambah Stok', '2023-12-11 17:53:41', '2023-12-11 17:53:41'),
(270, '2023-12-11', 100, 245, 'Tambah Stok', '2023-12-11 17:53:59', '2023-12-11 17:53:59'),
(271, '2023-12-11', 100, 236, 'Tambah Stok', '2023-12-11 17:54:03', '2023-12-11 17:54:03'),
(272, '2023-12-11', 100, 237, 'Tambah Stok', '2023-12-11 17:54:06', '2023-12-11 17:54:06'),
(273, '2023-12-11', 100, 238, 'Tambah Stok', '2023-12-11 17:54:09', '2023-12-11 17:54:09'),
(274, '2023-12-11', 100, 239, 'Tambah Stok', '2023-12-11 17:54:12', '2023-12-11 17:54:12'),
(275, '2023-12-11', 100, 240, 'Tambah Stok', '2023-12-11 17:54:16', '2023-12-11 17:54:16'),
(276, '2023-12-11', 100, 242, 'Tambah Stok', '2023-12-11 17:54:25', '2023-12-11 17:54:25'),
(277, '2023-12-11', 100, 243, 'Tambah Stok', '2023-12-11 17:54:27', '2023-12-11 17:54:27'),
(278, '2023-12-11', 100, 244, 'Tambah Stok', '2023-12-11 17:54:30', '2023-12-11 17:54:30'),
(279, '2023-12-11', 100, 241, 'Tambah Stok', '2023-12-11 17:55:07', '2023-12-11 17:55:07'),
(280, '2023-12-11', 100, 246, 'Tambah Stok', '2023-12-11 17:55:10', '2023-12-11 17:55:10'),
(281, '2023-12-11', 100, 247, 'Tambah Stok', '2023-12-11 17:55:12', '2023-12-11 17:55:12'),
(282, '2023-12-11', 100, 248, 'Tambah Stok', '2023-12-11 17:55:14', '2023-12-11 17:55:14'),
(283, '2023-12-11', 100, 249, 'Tambah Stok', '2023-12-11 17:55:16', '2023-12-11 17:55:16'),
(284, '2023-12-11', 100, 250, 'Tambah Stok', '2023-12-11 17:55:18', '2023-12-11 17:55:18'),
(285, '2023-12-11', 25, 251, 'Tambah Stok', '2023-12-11 17:55:26', '2023-12-11 17:55:26'),
(286, '2023-12-11', 25, 252, 'Tambah Stok', '2023-12-11 17:55:29', '2023-12-11 17:55:29'),
(287, '2023-12-11', 100, 253, 'Tambah Stok', '2023-12-11 17:55:31', '2023-12-11 17:55:31'),
(288, '2023-12-11', 100, 254, 'Tambah Stok', '2023-12-11 17:55:34', '2023-12-11 17:55:34'),
(289, '2023-12-11', 100, 255, 'Tambah Stok', '2023-12-11 17:55:51', '2023-12-11 17:55:51'),
(290, '2023-12-11', 100, 256, 'Tambah Stok', '2023-12-11 17:55:54', '2023-12-11 17:55:54'),
(291, '2023-12-11', 100, 257, 'Tambah Stok', '2023-12-11 17:55:55', '2023-12-11 17:55:55'),
(292, '2023-12-11', 100, 258, 'Tambah Stok', '2023-12-11 17:55:59', '2023-12-11 17:55:59'),
(293, '2023-12-11', 100, 259, 'Tambah Stok', '2023-12-11 17:56:01', '2023-12-11 17:56:01'),
(294, '2023-12-12', 1, 59, 'Terjual', '2023-12-12 02:11:12', '2023-12-12 02:11:12'),
(295, '2023-12-12', 1, 146, 'Terjual', '2023-12-12 02:11:12', '2023-12-12 02:11:12'),
(296, '2023-12-12', 1, 25, 'Terjual', '2023-12-12 02:11:12', '2023-12-12 02:11:12'),
(297, '2023-12-12', 1, 46, 'Terjual', '2023-12-12 02:11:12', '2023-12-12 02:11:12'),
(298, '2023-12-12', 1, 7, 'Terjual', '2023-12-12 02:13:09', '2023-12-12 02:13:09'),
(299, '2023-12-12', 1, 125, 'Terjual', '2023-12-12 02:13:09', '2023-12-12 02:13:09'),
(300, '2023-12-12', 1, 111, 'Terjual', '2023-12-12 02:13:09', '2023-12-12 02:13:09'),
(301, '2023-12-12', 1, 130, 'Terjual', '2023-12-12 02:18:52', '2023-12-12 02:18:52'),
(302, '2023-12-12', 1, 119, 'Terjual', '2023-12-12 02:18:52', '2023-12-12 02:18:52'),
(303, '2023-12-12', 1, 10, 'Terjual', '2023-12-12 02:18:52', '2023-12-12 02:18:52'),
(304, '2023-12-12', 12, 251, 'Terjual', '2023-12-12 11:27:07', '2023-12-12 11:27:07'),
(305, '2023-12-12', 3, 61, 'Terjual', '2023-12-12 11:27:07', '2023-12-12 11:27:07'),
(306, '2023-12-12', 2, 15, 'Terjual', '2023-12-12 11:27:07', '2023-12-12 11:27:07');

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
(1, 'Akeno', 'akeno@gmail.com', NULL, '$2y$10$I4Qxh3rJ1lPPwabNjHp2n.TReYAaMEBOCCYG6iNorE/3b5DpbQF1G', 'Customer', NULL, '2023-11-06 07:00:47', '2023-12-02 10:52:39'),
(2, 'Rias Gremory', 'rias@gmail.com', NULL, '$2y$10$Pu1/T9ZJdz70AkF2SBMjpuDIag/KF3MpgrAM/x/VZcp7sNtf9xeW.', 'Admin', NULL, '2023-11-06 07:01:19', '2023-12-01 16:08:08'),
(3, 'Rem', 'rem@gmail.com', NULL, '$2y$10$MSOrQHjlCmGLQ5Eq2z28m.l2Drb0FlQJxD8eGqRc5YvL9ylktwaCy', 'Kepala BUMDes', NULL, '2023-11-29 18:57:43', '2023-11-29 18:57:43'),
(5, 'Kadek sintya', 'kadeksintya05@gmail.com', NULL, '$2y$10$rqBhOGMJ4YFUhA4rLxnFCeOUrra.n5KkwWol.mxgkPdYTyjN6mz6G', 'Customer', NULL, '2023-12-08 14:12:09', '2023-12-08 14:12:09'),
(6, 'bagus aditya', 'bagusaditya5@gmail.com', NULL, '$2y$10$rnt33vjGuRoUtP34sBoXRugf.KFRTu/kxo.quYccz0xEysPBtc2cq', 'Customer', NULL, '2023-12-08 14:21:26', '2023-12-08 14:21:26'),
(7, 'Ngurah adi', 'ngurahadi76@gmail.com', NULL, '$2y$10$F5EFXBwe1cQe2OJONrnRh.9OXsXWn.xDqCXL9imcKYgKBI2XjFFI.', 'Customer', NULL, '2023-12-08 14:29:52', '2023-12-08 14:29:52'),
(8, 'Wayan nata', 'wayannata08@gmail.com', NULL, '$2y$10$MsYELbFsynlc52j2XOXKoeOO4/KsUjuUbp52fZltzm7WlYhqQAs.i', 'Customer', NULL, '2023-12-08 14:37:08', '2023-12-08 14:37:08'),
(9, 'Wayan Gede Sudana', 'gedesudana75@gmail.com', NULL, '$2y$10$VAEXwuKCP.3bkxT0t8rMh.uy4/jEj7LZnNzS43Xw/jNvcWFDECPi2', 'Kepala BUMDes', NULL, '2023-12-09 13:31:06', '2023-12-09 13:31:06'),
(10, 'Luh Ami', 'luhami23@gmail.com', NULL, '$2y$10$ena03hxxs594dwaP4zThw.RA1re5Sl3uv7GPScJ7an0P1yOCXjMNy', 'Admin', NULL, '2023-12-09 13:38:11', '2023-12-09 13:38:11'),
(11, 'Komang Sinta', 'komangsinta87E@gmail.com', NULL, '$2y$10$ooKKuzWDUDvMlEuIgRQg9ewtqM8kB9kH0Dah9DvGwea/J2QGX3fyu', 'Admin', NULL, '2023-12-09 13:44:15', '2023-12-09 13:44:15'),
(12, 'Komang Ayu', 'komangayu04@gmail.com', NULL, '$2y$10$sabt57jKkvh44X0IfjkPZOAZLTEWFbAG4d4UEkY3eO5i0.KZBJYIi', 'Customer', NULL, '2023-12-11 04:04:01', '2023-12-11 04:04:01'),
(13, 'Putu Anggi', 'anggi97@gmail.com', NULL, '$2y$10$5J3ziiTjnZEGnJiiU89fsOR9Rc3DJNIZlqVlafLbr5VoN6l9eZlFO', 'Customer', NULL, '2023-12-11 08:01:24', '2023-12-11 08:01:24'),
(15, 'De An', 'gedeanjana@gmail.com', NULL, '$2y$10$bU7OUxy/bBIpEGQbjPiM3uTAzCKMHXZTFI6CmzZmFIkDZpq0NTY2G', 'Customer', NULL, '2023-12-11 08:31:49', '2023-12-11 08:31:49'),
(16, 'Made Nonik', 'nonik20@gmail.com', NULL, '$2y$10$Zb/h.4BOYveR1VaOcH4mQOjNpPyHUjtYWrh2QGgnDUdnp2rXKDvNq', 'Customer', NULL, '2023-12-12 01:59:51', '2023-12-12 01:59:51'),
(17, 'Sri ayu lestari', 'sriayu02@gmail.com', NULL, '$2y$10$TKHTUvpV9bwt6xVQIIVGVOPlbLQQ13TU1r3p4SbqWBEtBEpMCcr32', 'Customer', NULL, '2023-12-12 02:03:56', '2023-12-12 02:03:56'),
(18, 'Kadek Adi', 'dekadi89@gmail.com', NULL, '$2y$10$CZ5.ZBLfz2TKiuViLj8wT.714QdYGKlFIJHYGNchEfuyPtCQyjWGe', 'Customer', NULL, '2023-12-12 02:15:18', '2023-12-12 02:15:18'),
(19, 'Ayu Linda', 'ayulinda91@gmail.com', NULL, '$2y$10$mRWXwyZV4ulqC5j2GNZMuePxqbS7G7I4UoJKJE.7l4/eqn.v8ZbUy', 'Customer', NULL, '2023-12-12 11:21:27', '2023-12-12 11:21:27'),
(20, 'Putu rasmini', 'rasmini8@gmail.com', NULL, '$2y$10$fxR/KH2KezWfXPMEnL5HjuyUrxh1r87PDawm8N5BozyFhY.HTwLN.', 'Customer', NULL, '2023-12-12 11:29:55', '2023-12-12 11:29:55');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT for table `bumdes`
--
ALTER TABLE `bumdes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `detail_penjualans`
--
ALTER TABLE `detail_penjualans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `detail_pesanans`
--
ALTER TABLE `detail_pesanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `detail_stock_opnames`
--
ALTER TABLE `detail_stock_opnames`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_barangs`
--
ALTER TABLE `kategori_barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `keranjangs`
--
ALTER TABLE `keranjangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pegawais`
--
ALTER TABLE `pegawais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penjualans`
--
ALTER TABLE `penjualans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanans`
--
ALTER TABLE `pesanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `stock_opnames`
--
ALTER TABLE `stock_opnames`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok_barangs`
--
ALTER TABLE `stok_barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
