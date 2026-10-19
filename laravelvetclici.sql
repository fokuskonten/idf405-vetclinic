-- ========================================================
-- FOKUSKONTEN OFFICIAL DATABASE SCHEME
-- SKU: IDF405 | Aplikasi: VetClinic
-- Kurasi & Distribusi: FokusKonten Digital (fokuskonten.my.id)
-- Kompatibilitas: MySQL 5.7+ / MariaDB 10.4+ / XAMPP / Laragon
-- ========================================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelvetclici`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `branches`
--

INSERT INTO `branches` (`id`, `branch_code`, `branch_name`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `address`) VALUES
(1, 'AS', 'Alam Sutera', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 'Ruko Spectra blok 23c no 19 Alam Sutera'),
(2, 'KB', 'Kebagusan', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 'Jl. Kebagusan Raya no 48 Jaksel'),
(3, 'TJ', 'Tanjung Duren', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 'Jl. Tanjung Duren Barat 1 no 19c Jakbar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_item`
--

CREATE TABLE `category_item` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `category_item`
--

INSERT INTO `category_item` (`id`, `category_name`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Git', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(2, 'Antibiotik', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(3, 'Suplemen', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(4, 'Antiseptik & Densifektan', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(5, 'Anti Radang', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(6, 'Parasit', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(7, 'Jamur', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `check_up_results`
--

CREATE TABLE `check_up_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_registration_id` bigint(20) UNSIGNED NOT NULL,
  `anamnesa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnosa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_outpatient_inpatient` tinyint(1) NOT NULL,
  `status_finish` tinyint(1) NOT NULL,
  `status_paid_off` tinyint(1) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_item_patients`
--

CREATE TABLE `detail_item_patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `check_up_result_id` int(11) NOT NULL,
  `price_item_id` int(11) NOT NULL,
  `quantity` decimal(18,2) NOT NULL,
  `price_overall` decimal(18,2) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `detail_medicine_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_medicine_group_check_up_results`
--

CREATE TABLE `detail_medicine_group_check_up_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `check_up_result_id` int(11) NOT NULL,
  `medicine_group_id` int(11) NOT NULL,
  `status_paid_off` tinyint(1) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_service_patients`
--

CREATE TABLE `detail_service_patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `check_up_result_id` int(11) NOT NULL,
  `price_service_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_overall` decimal(18,2) NOT NULL,
  `status_paid_off` tinyint(1) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `doctor_acceptances`
--

CREATE TABLE `doctor_acceptances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_registration_id` int(11) NOT NULL,
  `acceptance_status` int(11) NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_spend` date NOT NULL,
  `user_id_spender` int(11) NOT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `amount_overall` decimal(18,2) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `history_item_movements`
--

CREATE TABLE `history_item_movements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price_item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `images_check_up_results`
--

CREATE TABLE `images_check_up_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `check_up_result_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `in_patients`
--

CREATE TABLE `in_patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `check_up_result_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `in_patients`
--

INSERT INTO `in_patients` (`id`, `check_up_result_id`, `description`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'ini adalah contoh kondisi pasien', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(2, 1, 'ini adalah contoh kondisi pasien', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_of_items`
--

CREATE TABLE `list_of_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_item` decimal(18,2) NOT NULL,
  `unit_item_id` int(11) NOT NULL,
  `category_item_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit_item` decimal(18,2) NOT NULL,
  `diff_item` decimal(18,2) NOT NULL,
  `diff_expired_days` int(11) NOT NULL,
  `expired_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `list_of_items`
--

INSERT INTO `list_of_items` (`id`, `item_name`, `total_item`, `unit_item_id`, `category_item_id`, `branch_id`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `limit_item`, `diff_item`, `diff_expired_days`, `expired_date`) VALUES
(1, 'Vosea', '30.00', 3, 1, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(2, 'Kaotin', '30.00', 4, 1, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(3, 'Loperamide', '30.00', 3, 1, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(4, 'Metronidazole', '30.00', 3, 2, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(5, 'Cefixime', '30.00', 3, 2, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(6, 'Doxy', '30.00', 3, 2, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(7, 'Zinc', '30.00', 3, 3, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(8, 'Imboost', '30.00', 3, 3, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(9, 'Fish Oil', '30.00', 3, 3, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(10, 'Betadine', '30.00', 3, 4, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(11, 'Alkohol', '30.00', 3, 4, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(12, 'H2O2', '30.00', 3, 4, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(13, 'Metil Prednisolone', '30.00', 3, 5, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(14, 'Dexa', '30.00', 3, 5, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(15, 'Revolution', '30.00', 3, 6, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(16, 'Caniverm', '30.00', 3, 6, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(17, 'Itraconazole', '30.00', 3, 7, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(18, 'GRISEOFULVIN', '30.00', 3, 7, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(19, 'TEOPILIN', '30.00', 3, 7, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(20, 'Vosea', '30.00', 3, 1, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(21, 'Kaotin', '30.00', 4, 1, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(22, 'Loperamide', '30.00', 3, 1, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(23, 'Metronidazole', '30.00', 3, 2, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(24, 'Cefixime', '30.00', 3, 2, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(25, 'Doxy', '30.00', 3, 2, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(26, 'Zinc', '30.00', 3, 3, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(27, 'Imboost', '30.00', 3, 3, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(28, 'Fish Oil', '30.00', 3, 3, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(29, 'Betadine', '30.00', 3, 4, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(30, 'Alkohol', '30.00', 3, 4, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(31, 'H2O2', '30.00', 3, 4, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(32, 'Metil Prednisolone', '30.00', 3, 5, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(33, 'Dexa', '30.00', 3, 5, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(34, 'Revolution', '30.00', 3, 6, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(35, 'Caniverm', '30.00', 3, 6, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(36, 'Itraconazole', '30.00', 3, 7, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(37, 'GRISEOFULVIN', '30.00', 3, 7, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(38, 'TEOPILIN', '30.00', 3, 7, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(39, 'Vosea', '30.00', 3, 1, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(40, 'Kaotin', '30.00', 4, 1, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(41, 'Loperamide', '30.00', 3, 1, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(42, 'Metronidazole', '30.00', 3, 2, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(43, 'Cefixime', '30.00', 3, 2, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(44, 'Doxy', '30.00', 3, 2, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(45, 'Zinc', '30.00', 3, 3, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(46, 'Imboost', '30.00', 3, 3, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(47, 'Fish Oil', '30.00', 3, 3, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(48, 'Betadine', '30.00', 3, 4, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(49, 'Alkohol', '30.00', 3, 4, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(50, 'H2O2', '30.00', 3, 4, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(51, 'Metil Prednisolone', '30.00', 3, 5, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(52, 'Dexa', '30.00', 3, 5, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(53, 'Revolution', '30.00', 3, 6, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(54, 'Caniverm', '30.00', 3, 6, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(55, 'Itraconazole', '30.00', 3, 7, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(56, 'GRISEOFULVIN', '30.00', 3, 7, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00'),
(57, 'TEOPILIN', '30.00', 3, 7, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, '0.00', '0.00', 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_of_item_pet_shops`
--

CREATE TABLE `list_of_item_pet_shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_item` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `limit_item` decimal(18,2) NOT NULL,
  `diff_item` decimal(18,2) NOT NULL,
  `diff_expired_days` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_of_payments`
--

CREATE TABLE `list_of_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `check_up_result_id` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_of_payment_items`
--

CREATE TABLE `list_of_payment_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` decimal(18,2) NOT NULL,
  `list_of_payment_medicine_group_id` int(11) NOT NULL,
  `price_item_id` int(11) NOT NULL,
  `price_overall` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_of_payment_medicine_groups`
--

CREATE TABLE `list_of_payment_medicine_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `list_of_payment_id` int(11) NOT NULL,
  `detail_medicine_group_check_up_result_id` int(11) NOT NULL,
  `medicine_group_id` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_method_id` int(11) NOT NULL,
  `discount` decimal(18,2) NOT NULL,
  `amount_discount` decimal(18,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_of_payment_services`
--

CREATE TABLE `list_of_payment_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `check_up_result_id` int(11) NOT NULL,
  `detail_service_patient_id` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `list_of_payment_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `discount` decimal(18,2) NOT NULL,
  `amount_discount` decimal(18,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_of_services`
--

CREATE TABLE `list_of_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_category_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `list_of_services`
--

INSERT INTO `list_of_services` (`id`, `service_name`, `service_category_id`, `branch_id`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'rawat jalan', 2, 1, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(2, 'rawat inap', 3, 2, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(3, 'operasi caesar', 1, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(4, 'operasi biasa', 1, 3, 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_payment_petshops`
--

CREATE TABLE `master_payment_petshops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `medicine_groups`
--

CREATE TABLE `medicine_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `medicine_groups`
--

INSERT INTO `medicine_groups` (`id`, `group_name`, `branch_id`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Anti Diare', 1, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(2, 'Pasca Operasi', 2, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(3, 'Pasca Hamil', 3, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(4, 'Paket Pilek', 1, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(5, 'Paket Tetanus', 2, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(6, 'Anti Tetanus', 3, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(7, 'Imunitas', 1, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(8, 'Anti Diare', 2, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(9, 'Imunitas', 3, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(10, 'Anti Diare', 1, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(11, 'Anti Radang', 2, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(12, 'Anti Parvo', 3, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(13, 'Paket Operasi', 1, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(14, 'Paket Steril', 2, 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_21_111329_create_branches_table', 1),
(5, '2020_12_27_100623_create_patients_table', 1),
(6, '2020_12_31_113755_create_category_goods_table', 1),
(7, '2020_12_31_113932_create_unit_goods_table', 1),
(8, '2021_01_02_003236_create_listof_items_table', 1),
(9, '2021_01_04_184538_create_service_categories_table', 1),
(10, '2021_01_05_230611_create_listof_services_table', 1),
(11, '2021_01_08_105757_create_price_services_table', 1),
(12, '2021_01_09_111338_create_price_items_table', 1),
(13, '2021_01_19_083211_create_registrations_table', 1),
(14, '2021_01_20_001618_create_doctor_acceptances_table', 1),
(15, '2021_01_21_083502_create_check_up_results_table', 1),
(16, '2021_01_22_075028_create_history_item_movements_table', 1),
(17, '2021_01_31_205846_create_in_patients_table', 1),
(18, '2021_01_31_211339_create_detail_service_patients_table', 1),
(19, '2021_01_31_211353_create_detail_item_patients_table', 1),
(20, '2021_02_12_232958_create_listof_payment_items_table', 1),
(21, '2021_02_12_233114_create_listof_payment_services_table', 1),
(22, '2021_02_22_220101_create_listof_payments_table', 1),
(23, '2021_02_28_215743_add_delete_status_user_table', 1),
(24, '2021_03_07_115754_create_medicine_groups_table', 1),
(25, '2021_03_12_222946_add_medicine_group_in_detail_item_patients', 1),
(26, '2021_03_27_221955_create_price_medicine_groups_table', 1),
(27, '2021_04_01_160537_create_temp_count_items_table', 1),
(28, '2021_04_25_113807_add_coulumn_address_on_table_branch', 1),
(29, '2021_05_06_233808_create_images_check_up_results_table', 1),
(30, '2021_07_20_162526_create_detail_medicine_group_check_up_results_table', 1),
(31, '2021_07_20_162731_add_detail_medicine_group_in_detail_item_patient', 1),
(32, '2021_07_23_202316_add_detail_medicine_group_id_in_list_of_payment_items', 1),
(33, '2021_07_26_002237_add_quantity_in_list_of_payment_items', 1),
(34, '2021_07_26_213622_add_detail_medicine_group_check_up_result_id_in_list_of_payment_items', 1),
(35, '2021_07_28_122325_create_list_of_payment_medicine_groups_table', 1),
(36, '2021_07_28_122858_edit_column_list_of_payment_items', 1),
(37, '2021_08_28_121443_create_payrolls_table', 1),
(38, '2021_10_06_141244_create_owners_table', 1),
(39, '2021_12_23_123204_edit_datatype_from_int_to_decimal', 1),
(40, '2022_01_16_161430_create_payment_methods_table', 1),
(41, '2022_01_16_195427_add_grooming_in_payrolls', 1),
(42, '2022_01_18_172233_add_qty_in_detail_medicine_group_check_up_results', 1),
(43, '2022_01_23_113654_add_discount_and_method_payment_in_payments', 1),
(44, '2022_02_06_185006_add_quantity', 1),
(45, '2022_05_31_070740_add_expired_date_and_limit_item', 1),
(46, '2022_06_01_141857_create_expenses_table', 1),
(47, '2022_09_24_140126_add_remark_to_detail_medicine_group_check_up_result_table', 1),
(48, '2022_09_24_182346_create_listof_items_pet_shops_table', 1),
(49, '2022_09_24_194448_create_price_item_pet_shops_table', 1),
(50, '2022_10_09_181511_create_master_payment_petshops_table', 1),
(51, '2022_10_09_181641_create_payment_petshops_table', 1),
(52, '2022_10_20_042411_create_payment_petshop_with_clinics_table', 1),
(53, '2022_11_02_025334_add_payment_method_on_master_payment_petshop', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `owners`
--

CREATE TABLE `owners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` int(11) NOT NULL,
  `owner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` int(11) NOT NULL,
  `id_member` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pet_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pet_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pet_gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pet_year_age` int(11) NOT NULL,
  `pet_month_age` int(11) NOT NULL,
  `owner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `patients`
--

INSERT INTO `patients` (`id`, `branch_id`, `id_member`, `pet_category`, `pet_name`, `pet_gender`, `pet_year_age`, `pet_month_age`, `owner_name`, `owner_address`, `owner_phone_number`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `owner_id`) VALUES
(1, 1, 'BVC-P-AS-0001', 'kucing', 'kuki', 'betina', 2, 10, 'agus', 'tangerang selatan', '081234567890', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(2, 1, 'BVC-P-AS-0002', 'monyet', 'kimbo', 'jantan', 5, 10, 'yudi', 'duri', '081234567890', 0, 1, NULL, NULL, NULL, '2021-03-19 17:00:00', NULL, 0),
(3, 1, 'BVC-P-AS-0003', 'anjing', 'sisi', 'betina', 6, 8, 'cindy', 'alam sutera', '081234567890', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(4, 3, 'BVC-P-TJ-0001', 'anjing', 'rambo', 'jantan', 2, 10, 'tina', 'lebak bulus', '081234567890', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(5, 3, 'BVC-P-TJ-0002', 'kucing', 'butet', 'jantan', 10, 10, 'raka', 'kemanggisan', '081234567890', 0, 1, NULL, NULL, NULL, '2021-01-11 17:00:00', NULL, 0),
(6, 3, 'BVC-P-TJ-0003', 'anjing', 'godart', 'jantan', 8, 10, 'ricky', 'ilir', '081234567890', 0, 1, NULL, NULL, NULL, '2021-02-17 17:00:00', NULL, 0),
(7, 2, 'BVC-P-KB-0001', 'kucing', 'tabi', 'tidak diketahui', 2, 10, 'tono', 'pondok indah', '081234567890', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(8, 2, 'BVC-P-KB-0002', 'kucing', 'mpus', 'betina', 11, 10, 'lisa', 'pondok indah', '081234567890', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(9, 2, 'BVC-P-KB-0003', 'ikan', 'woofy', 'tidak diketahui', 6, 10, 'tono', 'pondok indah', '081234567890', 0, 1, NULL, NULL, NULL, '2021-04-21 17:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_petshops`
--

CREATE TABLE `payment_petshops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price_item_pet_shop_id` int(11) NOT NULL,
  `master_payment_petshop_id` int(11) NOT NULL,
  `total_item` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_petshop_with_clinics`
--

CREATE TABLE `payment_petshop_with_clinics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price_item_pet_shop_id` int(11) NOT NULL,
  `list_of_payment_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `total_item` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payrolls`
--

CREATE TABLE `payrolls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_employee_id` int(11) NOT NULL,
  `date_payed` date NOT NULL,
  `basic_sallary` decimal(18,2) NOT NULL,
  `accomodation` decimal(18,2) NOT NULL,
  `percentage_turnover` int(11) NOT NULL,
  `amount_turnover` decimal(18,2) NOT NULL,
  `total_turnover` decimal(18,2) NOT NULL,
  `amount_inpatient` decimal(18,2) NOT NULL,
  `count_inpatient` int(11) NOT NULL,
  `total_inpatient` decimal(18,2) NOT NULL,
  `percentage_surgery` int(11) NOT NULL,
  `amount_surgery` decimal(18,2) NOT NULL,
  `total_surgery` decimal(18,2) NOT NULL,
  `total_overall` decimal(18,2) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount_grooming` decimal(18,2) NOT NULL,
  `count_grooming` int(11) NOT NULL,
  `total_grooming` decimal(18,2) NOT NULL,
  `minus_turnover` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `payrolls`
--

INSERT INTO `payrolls` (`id`, `user_employee_id`, `date_payed`, `basic_sallary`, `accomodation`, `percentage_turnover`, `amount_turnover`, `total_turnover`, `amount_inpatient`, `count_inpatient`, `total_inpatient`, `percentage_surgery`, `amount_surgery`, `total_surgery`, `total_overall`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `amount_grooming`, `count_grooming`, `total_grooming`, `minus_turnover`) VALUES
(1, 1, '2021-08-29', '2000000.00', '2000000.00', 20, '120000.00', '40000.00', '50000.00', 5, '250000.00', 15, '30000.00', '30000.00', '2650000.00', 0, 0, NULL, NULL, NULL, '2021-08-28 17:00:00', NULL, '0.00', 0, '0.00', '0.00'),
(2, 2, '2021-08-29', '2000000.00', '2000000.00', 20, '120000.00', '40000.00', '50000.00', 5, '250000.00', 15, '30000.00', '30000.00', '2650000.00', 0, 0, NULL, NULL, NULL, '2021-08-28 17:00:00', NULL, '0.00', 0, '0.00', '0.00'),
(3, 3, '2021-08-29', '2000000.00', '2000000.00', 20, '120000.00', '40000.00', '50000.00', 5, '250000.00', 15, '30000.00', '30000.00', '2650000.00', 0, 0, NULL, NULL, NULL, '2021-08-28 17:00:00', NULL, '0.00', 0, '0.00', '0.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `price_items`
--

CREATE TABLE `price_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `list_of_items_id` int(11) NOT NULL,
  `selling_price` decimal(18,2) NOT NULL,
  `capital_price` decimal(18,2) NOT NULL,
  `doctor_fee` decimal(18,2) NOT NULL,
  `petshop_fee` decimal(18,2) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `price_items`
--

INSERT INTO `price_items` (`id`, `list_of_items_id`, `selling_price`, `capital_price`, `doctor_fee`, `petshop_fee`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, '900000.00', '300000.00', '300000.00', '300000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(2, 2, '800000.00', '100000.00', '300000.00', '400000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(3, 3, '700000.00', '150000.00', '300000.00', '250000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(4, 4, '600000.00', '200000.00', '200000.00', '200000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(5, 5, '500000.00', '100000.00', '125000.00', '275000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(6, 6, '400000.00', '50000.00', '150000.00', '200000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(7, 7, '300000.00', '100000.00', '100000.00', '100000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(8, 8, '200000.00', '50000.00', '50000.00', '100000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(9, 9, '100000.00', '25000.00', '25000.00', '50000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(10, 10, '90000.00', '30000.00', '30000.00', '30000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(11, 11, '80000.00', '20000.00', '30000.00', '30000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(12, 12, '70000.00', '15000.00', '25000.00', '30000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(13, 13, '60000.00', '20000.00', '20000.00', '20000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(14, 14, '500000.00', '200000.00', '100000.00', '200000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(15, 15, '50000.00', '15000.00', '10000.00', '25000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(16, 16, '40000.00', '10000.00', '10000.00', '20000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(17, 17, '30000.00', '5000.00', '10000.00', '15000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(18, 18, '20000.00', '5000.00', '5000.00', '10000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(19, 19, '10000.00', '2500.00', '2500.00', '5000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(20, 20, '20000.00', '5000.00', '5000.00', '10000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(21, 21, '30000.00', '10000.00', '10000.00', '10000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(22, 22, '40000.00', '10000.00', '10000.00', '20000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(23, 23, '50000.00', '15000.00', '10000.00', '25000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(24, 24, '60000.00', '20000.00', '20000.00', '20000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(25, 25, '80000.00', '20000.00', '20000.00', '40000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(26, 26, '70000.00', '30000.00', '20000.00', '20000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(27, 27, '80000.00', '25000.00', '15000.00', '40000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(28, 28, '90000.00', '30000.00', '30000.00', '30000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(29, 29, '10000.00', '3000.00', '3000.00', '4000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(30, 30, '20000.00', '5000.00', '5000.00', '10000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(31, 31, '50000.00', '15000.00', '25000.00', '10000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(32, 32, '60000.00', '20000.00', '20000.00', '20000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(33, 33, '800000.00', '200000.00', '200000.00', '400000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(34, 34, '70000.00', '20000.00', '20000.00', '30000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(35, 35, '75000.00', '25000.00', '25000.00', '25000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(36, 36, '65000.00', '20000.00', '15000.00', '30000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(37, 37, '87000.00', '29000.00', '29000.00', '29000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(38, 38, '85000.00', '20000.00', '25000.00', '40000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(39, 39, '65000.00', '20000.00', '25000.00', '20000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(40, 40, '80000.00', '20000.00', '25000.00', '35000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(41, 41, '9000.00', '3000.00', '3000.00', '3000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(42, 42, '36000.00', '12000.00', '12000.00', '12000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(43, 43, '545000.00', '100000.00', '245000.00', '200000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(44, 44, '66000.00', '22000.00', '22000.00', '22000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(45, 45, '50000.00', '20000.00', '20000.00', '10000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(46, 46, '650000.00', '200000.00', '200000.00', '250000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(47, 47, '98000.00', '30000.00', '38000.00', '30000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(48, 48, '78000.00', '26000.00', '26000.00', '26000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(49, 49, '81000.00', '27000.00', '27000.00', '27000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(50, 50, '65000.00', '20000.00', '20000.00', '25000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(51, 51, '960000.00', '320000.00', '320000.00', '320000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(52, 52, '850000.00', '300000.00', '250000.00', '300000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(53, 53, '622000.00', '200000.00', '200000.00', '222000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(54, 54, '540000.00', '180000.00', '180000.00', '180000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(55, 55, '540000.00', '180000.00', '180000.00', '180000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(56, 56, '870000.00', '290000.00', '290000.00', '290000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09'),
(57, 57, '120000.00', '40000.00', '40000.00', '40000.00', 0, 1, NULL, NULL, NULL, '2021-07-26 23:05:09', '2021-07-26 23:05:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `price_item_pet_shops`
--

CREATE TABLE `price_item_pet_shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `list_of_item_pet_shop_id` int(11) NOT NULL,
  `selling_price` decimal(18,2) NOT NULL,
  `capital_price` decimal(18,2) NOT NULL,
  `profit` decimal(18,2) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `price_medicine_groups`
--

CREATE TABLE `price_medicine_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `medicine_group_id` int(11) NOT NULL,
  `selling_price` decimal(18,2) NOT NULL,
  `capital_price` decimal(18,2) NOT NULL,
  `doctor_fee` decimal(18,2) NOT NULL,
  `petshop_fee` decimal(18,2) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `price_medicine_groups`
--

INSERT INTO `price_medicine_groups` (`id`, `medicine_group_id`, `selling_price`, `capital_price`, `doctor_fee`, `petshop_fee`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, '500000.00', '100000.00', '100000.00', '300000.00', 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(2, 6, '1000000.00', '400000.00', '400000.00', '200000.00', 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(3, 4, '200000.00', '50000.00', '50000.00', '100000.00', 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(4, 13, '1000000.00', '200000.00', '400000.00', '400000.00', 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(5, 11, '150000.00', '25000.00', '50000.00', '75000.00', 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL),
(6, 14, '1300000.00', '200000.00', '500000.00', '600000.00', 0, 1, NULL, NULL, NULL, '2021-07-22 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `price_services`
--

CREATE TABLE `price_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `list_of_services_id` int(11) NOT NULL,
  `selling_price` decimal(18,2) NOT NULL,
  `capital_price` decimal(18,2) NOT NULL,
  `doctor_fee` decimal(18,2) NOT NULL,
  `petshop_fee` decimal(18,2) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `price_services`
--

INSERT INTO `price_services` (`id`, `list_of_services_id`, `selling_price`, `capital_price`, `doctor_fee`, `petshop_fee`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, '100000.00', '0.00', '70000.00', '30000.00', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(2, 2, '120000.00', '20000.00', '70000.00', '30000.00', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(3, 3, '200000.00', '60000.00', '70000.00', '70000.00', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `registrations`
--

CREATE TABLE `registrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int(11) NOT NULL,
  `complaint` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registrant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `doctor_user_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `acceptance_status` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `registrations`
--

INSERT INTO `registrations` (`id`, `id_number`, `patient_id`, `complaint`, `registrant`, `isDeleted`, `doctor_user_id`, `user_id`, `acceptance_status`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'BVC-RP-TJ-0001', 4, 'pilek', 'agus', 0, 3, 1, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(2, 'BVC-RP-KB-0001', 7, 'gatal-gatal', 'kuncoro', 0, 4, 1, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(3, 'BVC-RP-AS-0001', 1, 'batuk', 'supri', 0, 7, 1, 2, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(4, 'BVC-RP-AS-0002', 1, 'diare', 'sartoni', 0, 3, 1, 3, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `service_categories`
--

INSERT INTO `service_categories` (`id`, `category_name`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Operasi', 0, 1, NULL, NULL, NULL, '2020-12-28 17:00:00', NULL),
(2, 'Tindakan 1', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(3, 'Tindakan 2', 0, 1, NULL, NULL, NULL, '2020-12-30 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `temp_count_items`
--

CREATE TABLE `temp_count_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price_item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `unit_item`
--

CREATE TABLE `unit_item` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `user_update_id` int(11) DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `unit_item`
--

INSERT INTO `unit_item` (`id`, `unit_name`, `isDeleted`, `user_id`, `user_update_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Pcs', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(2, 'Box', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(3, 'Strip', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL),
(4, 'Botol', 0, 1, NULL, NULL, NULL, '2020-12-29 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staffing_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `blood_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_card_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT IGNORE INTO `users` (`id`, `staffing_number`, `username`, `fullname`, `gender`, `religion`, `birth_place`, `birthdate`, `blood_group`, `id_card_number`, `email`, `password`, `home_number`, `phone_number`, `address`, `image_profile`, `role`, `branch_id`, `status`, `created_by`, `update_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `isDeleted`) VALUES
(1, '12345', 'budi', 'budi saputri', NULL, NULL, NULL, NULL, NULL, NULL, 'budi@fokuskonten.my.id', '$2y$10$htbwHBzUcYHJBCkQ/mfU6.IM46csxF/k8/TnycRNwZqzn46x63tHe', NULL, '081234567801', NULL, NULL, 'admin', 1, 1, 'budi saputri', NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(2, '12345', 'susi', 'susi saputri', NULL, NULL, NULL, NULL, NULL, NULL, 'susi@fokuskonten.my.id', '$2y$10$OHpQanjnE5SMA/4KjdISgeEzyFwLG66v6dYRq60g.cUWlhmbRU0De', NULL, '081234567802', NULL, NULL, 'resepsionis', 1, 1, 'budi saputri', NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(3, '12345', 'tono', 'tono saputri', NULL, NULL, NULL, NULL, NULL, NULL, 'tono@fokuskonten.my.id', '$2y$10$GBZIVIDB8SD9M.25KnUaJOZImuFWDJiX48WW0aVFKD9qzkXSVW2k.', NULL, '081234567803', NULL, NULL, 'dokter', 1, 1, 'budi saputri', NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(4, '12345', 'tona', 'tona saputri', NULL, NULL, NULL, NULL, NULL, NULL, 'tona@fokuskonten.my.id', '$2y$10$K4.FPHD3RlPm1OTlnlCP0OPJK9EaDMCWoKJ/E1gND60kD4B2rYRGi', NULL, '081234567804', NULL, NULL, 'dokter', 1, 0, 'budi saputri', NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(5, '12345', 'toto', 'toto saputri', NULL, NULL, NULL, NULL, NULL, NULL, 'toto@fokuskonten.my.id', '$2y$10$3hDYxPOV6So9uS8P/yfCEegXfoCgbRjTmBuX7ZQfqNIdoTtSTnUEO', NULL, '081234567805', NULL, NULL, 'admin', 2, 1, 'budi saputri', NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(6, '12345', 'susan', 'susan saputri', NULL, NULL, NULL, NULL, NULL, NULL, 'susan@fokuskonten.my.id', '$2y$10$TdULMVqMjOHG5B7EVE5yTugvwovFOyHOhcqn8J0B1p8PpveZYjJEq', NULL, '081234567806', NULL, NULL, 'resepsionis', 2, 1, 'budi saputri', NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(7, '12345', 'deni', 'deni saputra', NULL, NULL, NULL, NULL, NULL, NULL, 'deni@fokuskonten.my.id', '$2y$10$H5CyrDK2NjYy4M0tzVR9UuTVh5shzcCQpT4EcY0a3l.ClyRtlIbxa', NULL, '081234567807', NULL, NULL, 'dokter', 2, 1, 'budi saputri', NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(8, '12345', 'dena', 'dena saputra', NULL, NULL, NULL, NULL, NULL, NULL, 'dena@fokuskonten.my.id', '$2y$10$.y1yqVFHVWq8OjCYxw6CnOr0Ls.pPBbhxBRNkUDevwMf5MOrLSh3O', NULL, '081234567808', NULL, NULL, 'dokter', 2, 0, 'budi saputri', NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(9, '12345', 'tati', 'tati saputri', NULL, NULL, NULL, NULL, NULL, NULL, 'tati@fokuskonten.my.id', '$2y$10$wm8XOqb99utl1wWSHWgK1O1tADB5mx1lPpoHtqt8maeFfCjSvCcuK', NULL, '081234567809', NULL, NULL, 'admin', 3, 1, 'budi saputri', NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(10, '12345', 'sasa', 'sasa saputri', NULL, NULL, NULL, NULL, NULL, NULL, 'sasa@fokuskonten.my.id', '$2y$10$Bkr82PliVc8KNNMnuyzMuec.5MeiWaztQ5Wd5aZTfJHcCJSMKQFem', NULL, '081234567810', NULL, NULL, 'resepsionis', 3, 1, 'budi saputri', NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(11, '12345', 'desi', 'desi saputri', NULL, NULL, NULL, NULL, NULL, NULL, 'desi@fokuskonten.my.id', '$2y$10$0GoetAeRUfQBWsZWqgodQO.fwKupbHEZienbFxDxAZ4b6KiQNTcCO', NULL, '081234567811', NULL, NULL, 'dokter', 3, 1, 'budi saputri', NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0),
(12, '12345', 'desna', 'desna saputri', NULL, NULL, NULL, NULL, NULL, NULL, 'desna@fokuskonten.my.id', '$2y$10$OjyxiA8nrT71C5tOXvOOtOoIWTMJLt3oaKfLbgeo5h8JBLGQYZTla', NULL, '081234567812', NULL, NULL, 'dokter', 3, 0, 'budi saputri', NULL, NULL, NULL, '2020-12-29 17:00:00', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category_item`
--
ALTER TABLE `category_item`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `check_up_results`
--
ALTER TABLE `check_up_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `check_up_results_user_id_foreign` (`user_id`),
  ADD KEY `check_up_results_patient_registration_id_foreign` (`patient_registration_id`);

--
-- Indeks untuk tabel `detail_item_patients`
--
ALTER TABLE `detail_item_patients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_medicine_group_check_up_results`
--
ALTER TABLE `detail_medicine_group_check_up_results`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_service_patients`
--
ALTER TABLE `detail_service_patients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `doctor_acceptances`
--
ALTER TABLE `doctor_acceptances`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `history_item_movements`
--
ALTER TABLE `history_item_movements`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `images_check_up_results`
--
ALTER TABLE `images_check_up_results`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `in_patients`
--
ALTER TABLE `in_patients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `list_of_items`
--
ALTER TABLE `list_of_items`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `list_of_item_pet_shops`
--
ALTER TABLE `list_of_item_pet_shops`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `list_of_payments`
--
ALTER TABLE `list_of_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `list_of_payment_items`
--
ALTER TABLE `list_of_payment_items`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `list_of_payment_medicine_groups`
--
ALTER TABLE `list_of_payment_medicine_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `list_of_payment_services`
--
ALTER TABLE `list_of_payment_services`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `list_of_services`
--
ALTER TABLE `list_of_services`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_payment_petshops`
--
ALTER TABLE `master_payment_petshops`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `medicine_groups`
--
ALTER TABLE `medicine_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `payment_petshops`
--
ALTER TABLE `payment_petshops`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `payment_petshop_with_clinics`
--
ALTER TABLE `payment_petshop_with_clinics`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `price_items`
--
ALTER TABLE `price_items`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `price_item_pet_shops`
--
ALTER TABLE `price_item_pet_shops`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `price_medicine_groups`
--
ALTER TABLE `price_medicine_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `price_services`
--
ALTER TABLE `price_services`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `temp_count_items`
--
ALTER TABLE `temp_count_items`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `unit_item`
--
ALTER TABLE `unit_item`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `category_item`
--
ALTER TABLE `category_item`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `check_up_results`
--
ALTER TABLE `check_up_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_item_patients`
--
ALTER TABLE `detail_item_patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_medicine_group_check_up_results`
--
ALTER TABLE `detail_medicine_group_check_up_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_service_patients`
--
ALTER TABLE `detail_service_patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `doctor_acceptances`
--
ALTER TABLE `doctor_acceptances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `history_item_movements`
--
ALTER TABLE `history_item_movements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `images_check_up_results`
--
ALTER TABLE `images_check_up_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `in_patients`
--
ALTER TABLE `in_patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `list_of_items`
--
ALTER TABLE `list_of_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `list_of_item_pet_shops`
--
ALTER TABLE `list_of_item_pet_shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `list_of_payments`
--
ALTER TABLE `list_of_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `list_of_payment_items`
--
ALTER TABLE `list_of_payment_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `list_of_payment_medicine_groups`
--
ALTER TABLE `list_of_payment_medicine_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `list_of_payment_services`
--
ALTER TABLE `list_of_payment_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `list_of_services`
--
ALTER TABLE `list_of_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `master_payment_petshops`
--
ALTER TABLE `master_payment_petshops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `medicine_groups`
--
ALTER TABLE `medicine_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT untuk tabel `owners`
--
ALTER TABLE `owners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payment_petshops`
--
ALTER TABLE `payment_petshops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payment_petshop_with_clinics`
--
ALTER TABLE `payment_petshop_with_clinics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `price_items`
--
ALTER TABLE `price_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `price_item_pet_shops`
--
ALTER TABLE `price_item_pet_shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `price_medicine_groups`
--
ALTER TABLE `price_medicine_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `price_services`
--
ALTER TABLE `price_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `temp_count_items`
--
ALTER TABLE `temp_count_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `unit_item`
--
ALTER TABLE `unit_item`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `check_up_results`
--
ALTER TABLE `check_up_results`
  ADD CONSTRAINT `check_up_results_patient_registration_id_foreign` FOREIGN KEY (`patient_registration_id`) REFERENCES `registrations` (`id`),
  ADD CONSTRAINT `check_up_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT IGNORE INTO `users` (`id`, `staffing_number`, `username`, `fullname`, `gender`, `religion`, `birth_place`, `birthdate`, `blood_group`, `id_card_number`, `email`, `password`, `home_number`, `phone_number`, `address`, `image_profile`, `role`, `branch_id`, `status`, `created_by`, `update_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `isDeleted`) VALUES (99, '10001', 'admin', 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, 'admin@fokuskonten.my.id', '$2y$10$0hDy1r9Oq6/.gDxe7/fLW.yiLn3MntxYcQSzNnCudIgcoFPjm4xvC', NULL, '081234567890', NULL, NULL, 'admin', 1, 1, 'system', NULL, NULL, NULL, '2026-10-10 00:00:00', NULL, 0);
