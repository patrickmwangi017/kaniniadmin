-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2020 at 12:36 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stesco`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountants`
--

CREATE TABLE `accountants` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_accountant` enum('Approved','Rejected','Archived','Pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accountants`
--

INSERT INTO `accountants` (`id`, `name`, `email`, `phone`, `address`, `password`, `is_accountant`, `remember_token`, `created_at`, `updated_at`) VALUES
(10, 'Test Accountant', 'admin@gmail.com', '0789765345', 'accountants', '$2y$10$Bp5yDVmsyrcVjrL6UiS3oOpDUdpxg555ByriULGf7iee.ZTGxIeOm', 'Approved', 'fctEV3PCyE7FAxbS1UxwwbsMw11dPgtC7lYzZG8BxuPv4G5PvdrnIQXrHG0Z', '2020-05-05 08:09:29', '2020-10-10 06:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `address`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', '0741761232', 'admin', '$2y$10$EkkmGFb46jBmp6cpjHIOKuKRX6kqZXKos43iB9z3YQUYGF.r913ge', 'BS6QMOUoi7CVzgyoOzWCLiELvefsXVqF757trGWLTt4yNzE441IkrvZvxLmR', '2020-03-29 03:20:16', '2020-03-29 03:20:16');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_driver` enum('Approved','Pending','Archived','Rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('On Duty','Free','','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `email`, `address`, `password`, `is_driver`, `remember_token`, `created_at`, `updated_at`, `phone`, `status`) VALUES
(1, 'Driver A', 'admin@gmail.com', '456', '$2y$10$Qp9gwK1VFR1DEj8Vd8aoHOqQ3DujNEwS4izB5V1S5sl8qzZLS9Qm2', 'Approved', 'MKS0cP61dek9aYxwNAR1Tst8VQIndxVziAJcPnxoO9IOYqXmurKgFJ5ynndB', '2020-02-23 05:32:23', '2020-10-10 03:51:43', '0741761239', 'Free'),
(6, 'Driver B', 'driver@gmail.com', '456', '$2y$10$owL1tQRmnkAc8pI8B92JfO98f8gSGOPrMjFwgEdFgVvQtGbC9tc.K', 'Approved', NULL, '2020-10-02 22:02:12', '2020-10-02 22:02:44', '0741761232', 'Free');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` int(11) NOT NULL,
  `feedbackMessage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Archived','Pending','','') COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `userstatus` enum('Archived','Pending','','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `created_at`, `updated_at`, `user_id`, `name`, `Email`, `telephone`, `feedbackMessage`, `reply`, `status`, `userstatus`) VALUES
(7, '2020-10-10 04:04:03', '2020-10-10 04:04:03', 1, 'Test User', 'admin@gmail.com', 741761232, 'Hello can\'t login', NULL, 'Pending', 'Pending');

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
(89, '2020_01_21_124134_create_products_table', 1),
(90, '2020_01_21_163120_create_table_users', 1),
(91, '2020_01_29_084407_create_drivers_table', 1),
(92, '2020_02_05_133123_create_accountants_table', 1),
(93, '2020_02_06_140942_create_masons_table', 1),
(94, '2020_02_08_083337_create_orders_table', 1),
(95, '2020_02_16_153248_create_payments_table', 1),
(96, '2020_02_21_050033_create_services_table', 1),
(97, '2020_02_21_050136_create_shipments_table', 1),
(98, '2020_02_23_063154_create_bookedservices_table', 1),
(99, '2020_02_23_064703_create_servicedeliveries_table', 1),
(100, '2020_02_23_103700_create_feedback_table', 2),
(102, '2020_03_29_054338_create_table_admins', 3),
(103, '2020_10_01_113348_create_table_password_resets', 4),
(104, '2014_10_12_000000_create_users_table', 5),
(105, '2014_10_12_100000_create_password_resets_table', 5),
(106, '2014_10_12_200000_add_two_factor_columns_to_users_table', 5),
(107, '2019_12_14_000001_create_personal_access_tokens_table', 5),
(108, '2020_05_21_100000_create_teams_table', 5),
(109, '2020_05_21_200000_create_team_user_table', 5),
(110, '2020_10_01_214805_create_sessions_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `user_id`, `cart`, `town`, `address`, `name`, `payment_id`, `status`) VALUES
(55, '2020-10-10 03:43:31', '2020-10-10 03:43:31', 1, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:1:{i:11;a:3:{s:3:\"qty\";i:3;s:5:\"price\";i:1500;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:7:\"Picture\";i:1;s:11:\"productName\";i:2;s:11:\"Description\";i:3;s:5:\"Price\";i:4;s:18:\"quantity_available\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:11;s:11:\"productName\";s:20:\"Ufuta cookong oil 3l\";s:7:\"Picture\";s:12:\"ufuta 3l.jpg\";s:10:\"created_at\";N;s:10:\"updated_at\";s:19:\"2020-10-02 23:55:28\";s:11:\"Description\";s:46:\"Best colesterol free cooking oil made in kenya\";s:5:\"Price\";i:500;s:18:\"quantity_available\";i:100;s:4:\"unit\";s:3:\"Jar\";s:6:\"status\";s:9:\"Published\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:11;s:11:\"productName\";s:20:\"Ufuta cookong oil 3l\";s:7:\"Picture\";s:12:\"ufuta 3l.jpg\";s:10:\"created_at\";N;s:10:\"updated_at\";s:19:\"2020-10-02 23:55:28\";s:11:\"Description\";s:46:\"Best colesterol free cooking oil made in kenya\";s:5:\"Price\";i:500;s:18:\"quantity_available\";i:100;s:4:\"unit\";s:3:\"Jar\";s:6:\"status\";s:9:\"Published\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:3;s:10:\"totalPrice\";i:1500;}', 'Nairobi', '56', 'Test User', 60, 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mwangipatrick017@gmail.com', '$2y$10$oyTgbiyiLhZpYQGS3iOCpOkOutE0gpvW8J0Rb7rWgREM3uxiWVh0m', '2020-10-10 07:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `totalexpected` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mpesa_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `totalexpected`, `created_at`, `updated_at`, `mpesa_code`, `cart`, `town`, `address`, `booking`, `name`) VALUES
(60, 1, 1500, '2020-10-10 03:43:31', '2020-10-10 03:43:31', 'OIUZYCVU56', 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:1:{i:11;a:3:{s:3:\"qty\";i:3;s:5:\"price\";i:1500;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:7:\"Picture\";i:1;s:11:\"productName\";i:2;s:11:\"Description\";i:3;s:5:\"Price\";i:4;s:18:\"quantity_available\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:11;s:11:\"productName\";s:20:\"Ufuta cookong oil 3l\";s:7:\"Picture\";s:12:\"ufuta 3l.jpg\";s:10:\"created_at\";N;s:10:\"updated_at\";s:19:\"2020-10-02 23:55:28\";s:11:\"Description\";s:46:\"Best colesterol free cooking oil made in kenya\";s:5:\"Price\";i:500;s:18:\"quantity_available\";i:100;s:4:\"unit\";s:3:\"Jar\";s:6:\"status\";s:9:\"Published\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:11;s:11:\"productName\";s:20:\"Ufuta cookong oil 3l\";s:7:\"Picture\";s:12:\"ufuta 3l.jpg\";s:10:\"created_at\";N;s:10:\"updated_at\";s:19:\"2020-10-02 23:55:28\";s:11:\"Description\";s:46:\"Best colesterol free cooking oil made in kenya\";s:5:\"Price\";i:500;s:18:\"quantity_available\";i:100;s:4:\"unit\";s:3:\"Jar\";s:6:\"status\";s:9:\"Published\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:3;s:10:\"totalPrice\";i:1500;}', 'Nairobi', '56', NULL, 'Test User');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `productName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Price` int(11) NOT NULL,
  `quantity_available` int(255) NOT NULL,
  `unit` enum('Tonne','Piece','Jar','Kg','Bag','Bale') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Published','Archived','','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Archived'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `productName`, `Picture`, `created_at`, `updated_at`, `Description`, `Price`, `quantity_available`, `unit`, `status`) VALUES
(9, 'Rina vagetable oil 20l', 'rina 20l.jfif', NULL, '2020-10-02 20:52:38', 'Best quality vegetable salad ccoking oil', 2500, 100, 'Jar', 'Published'),
(10, 'Jasmin Rice 25Kgs', 'jasmin rice img.jfif', NULL, '2020-10-02 20:54:07', 'Best quality cooking rice for tasty meals', 2300, 100, 'Bag', 'Published'),
(11, 'Ufuta cookong oil 3l', 'ufuta 3l.jpg', NULL, '2020-10-10 03:43:31', 'Best colesterol free cooking oil made in kenya', 500, 97, 'Jar', 'Published'),
(12, 'Maisha Baking flour 2Kg bale', 'maisha.jpg', NULL, '2020-10-02 20:56:53', 'A bale of the best quality wheat baking flour. Made in Kenya', 1230, 100, 'Bale', 'Published'),
(13, 'Soko Maize meal 2Kgs Bale', 'soko2.jpg', NULL, '2020-10-02 20:57:58', 'Best quality puer kenyan maize flour', 1200, 100, 'Bale', 'Published'),
(14, 'Brown Sugar 50 Kgs', 'brown sugar.jfif', NULL, '2020-10-02 20:58:53', 'Best pure quality premium sugar', 5000, 100, 'Bag', 'Published'),
(15, 'Ufuta cookong oil 10 l', 'ufuta 10l.jfif', NULL, '2020-10-02 21:00:15', 'Best quality vegetable salad ccoking oil', 1100, 100, 'Jar', 'Published'),
(16, 'Ufuta cookong oil 20 l', 'ufuta 20l.jpg', NULL, '2020-10-02 21:00:52', 'Best quality vegetable salad ccoking oil', 2560, 100, 'Jar', 'Published'),
(17, 'Ufuta cookong oil 2l', 'ufuta 2li.jfif', NULL, '2020-10-02 21:02:44', 'Best quality vegetable salad ccoking oil', 350, 100, 'Jar', 'Published'),
(18, 'Pishori Rice 25 Kgs', 'rice2.jfif', '2020-03-31 14:12:37', '2020-10-02 21:03:41', 'Best quality pure quality kenyan Rice', 1130, 100, 'Bag', 'Published'),
(23, 'Soko Baking Flour 2Kg Bale', 'wheat flour.jpg', '2020-10-02 21:15:07', '2020-10-02 21:15:07', 'Best pure wheat flour in Kenya', 1260, 100, 'Bale', 'Published');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dm4A9WAdpwWJDtI43qO4dVGTICPVHhqghR12tHZ2', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0lybkdpWjZqQnUwUGRkZTdUd3hMb0Z0TFk5MzIyb052MEQ0ZFAxSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly9sb2NhbGhvc3Qvc3Rlc2NvYXBwLW1hc3Rlci9wdWJsaWMvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1601593382),
('OXS6ZZq8E0A6qA8hkrqPU1nBGfQBIPvyQg1doW4n', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSXdlMUVScktvSEMxTldTeTF0TmxOR1NtQXRlWURrb1hvTTMza01mRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly9sb2NhbGhvc3Qvc3Rlc2NvYXBwLW1hc3Rlci9wdWJsaWMvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1601590938);

-- --------------------------------------------------------

--
-- Table structure for table `shipmentmanagers`
--

CREATE TABLE `shipmentmanagers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(20) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_shipmentmanager` enum('Approved','Rejected','Archived','Pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipmentmanagers`
--

INSERT INTO `shipmentmanagers` (`id`, `name`, `email`, `phone`, `address`, `password`, `is_shipmentmanager`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test ShipmentManager', 'admin@gmail.com', 123121101, 'nairobi', '$2y$10$qJ6I0iOBJedKieJb0MfU5.hYO9lSU5s3NvM3.fAqoTH17aaZkgU3e', 'Approved', '80OVq4P5uoG4JnLVieSM8xyNrehMa1YT93GW9YuI4UcJrgjtkaEbsztBaTxO', '2020-02-23 05:15:31', '2020-10-02 21:59:14');

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_shipment` enum('Order','Shipment','','') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `bookedservice_id` int(11) DEFAULT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('Approved','Rejected','Pending','Archived') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `refund_status` enum('Pending','Refunded','','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `order_status` enum('Approved','Rejected','Archived','Pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `booking_status` enum('Pending','Approved','Rejected','Archived') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `allocation_status` enum('Pending','Allocated','','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `driver_id` int(11) DEFAULT NULL,
  `mason_id` int(11) DEFAULT NULL,
  `deliverystatus` enum('Pending','Delivered','','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `receivestatus` enum('Received','Pending','','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `town` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int(11) NOT NULL,
  `totalexpected` int(11) NOT NULL,
  `mpesa_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `order_shipment`, `created_at`, `updated_at`, `user_id`, `order_id`, `bookedservice_id`, `cart`, `booking`, `payment_status`, `refund_status`, `order_status`, `booking_status`, `allocation_status`, `driver_id`, `mason_id`, `deliverystatus`, `receivestatus`, `town`, `address`, `name`, `payment_id`, `totalexpected`, `mpesa_code`) VALUES
(51, 'Order', '2020-10-10 03:43:31', '2020-10-10 03:51:43', 1, 55, NULL, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:1:{i:11;a:3:{s:3:\"qty\";i:3;s:5:\"price\";i:1500;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:7:\"Picture\";i:1;s:11:\"productName\";i:2;s:11:\"Description\";i:3;s:5:\"Price\";i:4;s:18:\"quantity_available\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:11;s:11:\"productName\";s:20:\"Ufuta cookong oil 3l\";s:7:\"Picture\";s:12:\"ufuta 3l.jpg\";s:10:\"created_at\";N;s:10:\"updated_at\";s:19:\"2020-10-02 23:55:28\";s:11:\"Description\";s:46:\"Best colesterol free cooking oil made in kenya\";s:5:\"Price\";i:500;s:18:\"quantity_available\";i:100;s:4:\"unit\";s:3:\"Jar\";s:6:\"status\";s:9:\"Published\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:11;s:11:\"productName\";s:20:\"Ufuta cookong oil 3l\";s:7:\"Picture\";s:12:\"ufuta 3l.jpg\";s:10:\"created_at\";N;s:10:\"updated_at\";s:19:\"2020-10-02 23:55:28\";s:11:\"Description\";s:46:\"Best colesterol free cooking oil made in kenya\";s:5:\"Price\";i:500;s:18:\"quantity_available\";i:100;s:4:\"unit\";s:3:\"Jar\";s:6:\"status\";s:9:\"Published\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:3;s:10:\"totalPrice\";i:1500;}', NULL, 'Approved', 'Pending', 'Pending', 'Pending', 'Allocated', 1, NULL, 'Delivered', 'Pending', 'Nairobi', '56', 'Test User', 60, 1500, 'OIUZYCVU56');

-- --------------------------------------------------------

--
-- Table structure for table `stockmanagers`
--

CREATE TABLE `stockmanagers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(20) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_stockmanager` enum('Approved','Rejected','Archived','Pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stockmanagers`
--

INSERT INTO `stockmanagers` (`id`, `name`, `email`, `phone`, `address`, `password`, `is_stockmanager`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test StockManager', 'admin@gmail.com', 123121101, 'nairobi', '$2y$10$cSLgJZiMMA/4HgzXx7Uy0.jclsgwsSA8snz6B8qaJ44lOhWfTnlE6', 'Approved', 'kSl3RLsLxImuKTDYn8yPaUAJRwcwfxqcBvgvbO2YvGItV0OmWutG8OyPtrjp', '2020-02-23 05:15:31', '2020-02-23 05:15:31');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_supplier` enum('Approved','Rejected','Archived','Pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `product`, `password`, `is_supplier`, `remember_token`, `created_at`, `updated_at`) VALUES
(10, 'Test Supplier', 'admin@gmail.com', '0789765345', 'Ufuta cookong oil 3l', '$2y$10$tFm/CDazPhg9xANBN45NROvBZRAgWE9i7fBzBxQn.kjIT82UtSjyK', 'Approved', 'RJ1eEndzxiHmZqmxUz9GK8FGLdETAoo19Gqdg3c7spGr2S7fUvEIXKuhYKVT', '2020-05-05 08:09:29', '2020-10-02 21:59:34');

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

CREATE TABLE `supplies` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `phone` text NOT NULL,
  `product` text NOT NULL,
  `quantity` text NOT NULL,
  `comment` text NOT NULL,
  `request_status` enum('Pending','Accepted','Rejected','') NOT NULL DEFAULT 'Pending',
  `receive_status` enum('Pending','Received','','') NOT NULL DEFAULT 'Pending',
  `supply_status` enum('Pending','Done','','') NOT NULL DEFAULT 'Pending',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postaladdress` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user` enum('Pending','Approved','Rejected','Archived') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `postaladdress`, `town`, `phone`, `email`, `email_verified_at`, `password`, `is_user`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Test User', '62', 'Nyeri', '0741761232', 'admin@gmail.com', NULL, '$2y$10$mMW6eJCnGj1PuzQnsvu4YOui1fHPzaAYaYncViPW4qI4ePaI.IC5y', 'Approved', NULL, NULL, '53MAkkRcGu0KD9NAczIImPfmvICPfqysWJwP2vo66hYvrJ6uTG26UEHyjGRI', NULL, NULL, '2020-10-01 19:22:18', '2020-10-10 03:58:18'),
(3, 'Test User2', NULL, NULL, '0786547323', 'mwangipatrick017@gmail.com', NULL, '$2y$10$fILLsCwwosHxV/9tYLcnJu.H4dCHY0w12.YAwPLHFDH5.ZOysi5T.', 'Approved', NULL, NULL, 'VgA0jkBhelKxiVYMrpQgI844Yo5bcTBNQ2PdZ3I9AMzNasOKYwp2ojo0LeaI', NULL, NULL, '2020-10-10 06:40:02', '2020-10-10 06:45:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountants`
--
ALTER TABLE `accountants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_payment_id_unique` (`payment_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shipmentmanagers`
--
ALTER TABLE `shipmentmanagers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockmanagers`
--
ALTER TABLE `stockmanagers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `accountants`
--
ALTER TABLE `accountants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `shipmentmanagers`
--
ALTER TABLE `shipmentmanagers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `stockmanagers`
--
ALTER TABLE `stockmanagers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `supplies`
--
ALTER TABLE `supplies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
