-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3305
-- Thời gian đã tạo: Th5 28, 2024 lúc 01:17 PM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `larave`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_phanquyen` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `diachi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sdt` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `id_phanquyen`, `created_at`, `updated_at`, `diachi`, `sdt`) VALUES
(5, 'Lien', '123@gmail.com', '$2y$12$7LAKadKvw5tAtazfEVtSgOPvBKbjgVIZQuvABD/xVw7BcUMavb5U6', 2, '2024-05-21 18:46:36', '2024-05-21 18:46:36', NULL, NULL),
(6, 'Tăng Thị Mỹ Liên', '2051010167lien@ou.edu.vn', '$2y$12$52VRRAjvyABJPIWXqzyTqOgh7h8YCA1W8YzqWywK6xp2.XNkpw76K', 1, '2024-05-22 19:13:38', '2024-05-22 19:13:38', NULL, NULL),
(7, 'lyn', 'staff1@gmail.com', '$2y$12$okrsMc0..a.9YA189MmkfeYeNU..eDA2AsYfB2m4JRO/3kkl4cWFW', 3, '2024-05-22 19:14:22', '2024-05-22 19:14:22', NULL, NULL),
(8, 'ly', 'staff2@gmail.com', '$2y$12$9MJ86SxyfMO4hy/cAhHg1uTU.ItoDhzAGld.X7ksvcaF60EyUMhH6', 3, '2024-05-22 19:15:04', '2024-05-22 19:15:04', NULL, NULL),
(9, 'lyy', 'admin2@gmail.com', '$2y$12$96lNwIrhslVGdg5AwnhlSeOwQOGMd1pWFGgUnqiSetUGMFnMXd01y', 1, '2024-05-22 19:15:39', '2024-05-22 19:15:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiet_donhang`
--

CREATE TABLE `chitiet_donhang` (
  `id_ctdonhang` int UNSIGNED NOT NULL,
  `tensp` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soluong` tinyint DEFAULT NULL,
  `giamgia` int DEFAULT NULL,
  `giatien` int DEFAULT NULL,
  `giakhuyenmai` int DEFAULT NULL,
  `id_sanpham` int NOT NULL,
  `id_dathang` int UNSIGNED NOT NULL,
  `id_kh` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiet_donhang`
--

INSERT INTO `chitiet_donhang` (`id_ctdonhang`, `tensp`, `soluong`, `giamgia`, `giatien`, `giakhuyenmai`, `id_sanpham`, `id_dathang`, `id_kh`) VALUES
(1, 'Thức Ăn Cho Chó Trưởng Thành Giống Lớn – Eminent Adult Large Breed – 500g', 1, 0, 72000, 72000, 1, 1, 1),
(2, 'Thức Ăn Cho Chó Trưởng Thành Giống Lớn – Eminent Adult Large Breed – 500g', 1, 0, 72000, 72000, 1, 2, 1),
(3, 'Chó Bull', 1, 0, 72000, 72000, 3, 3, 3),
(4, 'Chó Bull', 1, 0, 72000, 72000, 3, 5, 3),
(5, 'Cheems', 1, 0, 20000, 72000, 4, 6, 3),
(6, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 7, 3),
(7, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 8, 3),
(8, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 9, 3),
(9, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 10, 3),
(10, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 12, 3),
(11, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 18, 3),
(12, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 19, 3),
(13, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 20, 3),
(14, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 21, 3),
(15, 'Mèo Anh lông ngắn', 1, 0, 20000, 20000, 4, 21, 3),
(16, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 22, 3),
(17, 'Mèo Anh lông ngắn', 1, 0, 20000, 20000, 4, 22, 3),
(18, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 23, 3),
(19, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 24, 3),
(20, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 25, 3),
(21, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 26, 3),
(22, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 27, 3),
(23, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 28, 3),
(24, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 29, 3),
(25, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 30, 3),
(26, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 31, 3),
(27, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 32, 3),
(28, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 33, 3),
(29, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 34, 3),
(30, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 35, 3),
(31, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 36, 3),
(32, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 37, 3),
(33, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 38, 3),
(34, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 39, 3),
(35, 'Bánh Gặm Cho Chó – Smoked Beefy Dental Bone -14g', 2, 0, 20000, 20000, 6, 40, 3),
(36, 'Chó Bull', 2, 0, 72000, 72000, 3, 40, 3),
(37, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 41, 3),
(38, 'Pate Cho Mèo – Pate Fit4 Cats -Cá Ngừ Và Thanh Cua 160g', 1, 0, 20000, 72000, 2, 41, 3),
(39, 'Mèo Anh lông ngắn', 1, 6, 20000, 18800, 4, 42, 2),
(40, 'Chó chihuahua', 1, 0, 20000, 20000, 5, 43, 3),
(41, 'Bánh Gặm Cho Chó – Smoked Beefy Dental Bone -14g', 1, 0, 20000, 20000, 6, 44, 3),
(42, 'Nệm vuông size M', 1, NULL, 255000, 255000, 8, 44, 3),
(43, 'Mèo Ba Tư', 1, NULL, 900000, 900000, 7, 45, 3),
(44, 'Mèo Ba Tư', 1, NULL, 900000, 900000, 7, 46, 3),
(45, 'Mèo Ba Tư', 1, NULL, 900000, 900000, 7, 47, 3),
(46, 'Nệm vuông size M', 1, NULL, 255000, 255000, 8, 48, 3),
(47, 'Pate Cho Mèo – Pate Fit4 Cats -Cá Ngừ Và Thanh Cua 160g', 5, 0, 20000, 72000, 2, 48, 3),
(48, 'Chó Bull', 1, 15, 72000, 61200, 3, 48, 3),
(49, 'Nệm vuông size M', 1, NULL, 255000, 255000, 8, 49, 3),
(50, 'Pate Cho Mèo – Pate Fit4 Cats -Cá Ngừ Và Thanh Cua 160g', 5, 0, 20000, 72000, 2, 49, 3),
(51, 'Chó Bull', 1, 15, 72000, 61200, 3, 49, 3),
(52, 'Nệm vuông size M', 1, NULL, 255000, 255000, 8, 50, 3),
(53, 'Pate Cho Mèo – Pate Fit4 Cats -Cá Ngừ Và Thanh Cua 160g', 5, 0, 20000, 72000, 2, 50, 3),
(54, 'Chó Bull', 1, 15, 72000, 61200, 3, 50, 3),
(55, 'Nệm vuông size M', 1, NULL, 255000, 255000, 8, 51, 3),
(56, 'Pate Cho Mèo – Pate Fit4 Cats -Cá Ngừ Và Thanh Cua 160g', 5, 0, 20000, 72000, 2, 51, 3),
(57, 'Chó Bull', 1, 15, 72000, 61200, 3, 51, 3),
(58, 'Nệm vuông size M', 1, NULL, 255000, 255000, 8, 52, 3),
(59, 'Pate Cho Mèo – Pate Fit4 Cats -Cá Ngừ Và Thanh Cua 160g', 5, 0, 20000, 72000, 2, 52, 3),
(60, 'Chó Bull', 1, 15, 72000, 61200, 3, 52, 3),
(61, 'Nệm vuông size M', 1, NULL, 255000, 255000, 8, 53, 3),
(62, 'Pate Cho Mèo – Pate Fit4 Cats -Cá Ngừ Và Thanh Cua 160g', 5, 0, 20000, 72000, 2, 53, 3),
(63, 'Chó Bull', 1, 15, 72000, 61200, 3, 53, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sanpham` int NOT NULL,
  `id_kh` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rating` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `content`, `id_sanpham`, `id_kh`, `created_at`, `updated_at`, `rating`) VALUES
(5, 'dep ngoan', 7, 3, '2024-05-19 18:58:38', '2024-05-19 18:58:38', 5),
(6, 're', 3, 3, '2024-05-19 19:35:34', '2024-05-19 19:35:34', 5),
(7, 'tuyet', 3, 3, '2024-05-19 19:37:52', '2024-05-19 19:37:52', 5),
(8, 'g', 7, 3, '2024-05-21 16:23:28', '2024-05-21 16:23:28', 1),
(9, 'r', 7, 3, '2024-05-21 16:25:04', '2024-05-21 16:25:04', 1),
(10, 'good', 9, 7, '2024-05-26 16:59:41', '2024-05-26 16:59:41', 2),
(11, 'dep lam, rat ngoan.', 4, 1, '2024-05-28 10:29:19', '2024-05-28 10:29:19', 5),
(12, 'màu lông không giống hình lắm', 4, 10, '2024-05-28 10:30:53', '2024-05-28 10:30:53', 3),
(13, 'sản phẩm tốt', 4, 3, '2024-05-28 10:32:43', '2024-05-28 10:32:43', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id_danhmuc` int NOT NULL,
  `ten_danhmuc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id_danhmuc`, `ten_danhmuc`) VALUES
(1, 'Sản phẩm cho chó'),
(2, 'Sản phẩm cho mèo'),
(3, 'tất cả sản phẩm'),
(4, 'con giống'),
(5, 'nổi bật'),
(6, 'chó giống'),
(7, 'mèo giống'),
(8, 'phụ kiện cho chó'),
(9, 'phụ kiện cho mèo'),
(10, 'hạt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dathang`
--

CREATE TABLE `dathang` (
  `id_dathang` int UNSIGNED NOT NULL,
  `ngaydathang` datetime DEFAULT CURRENT_TIMESTAMP,
  `ngaygiaohang` datetime DEFAULT CURRENT_TIMESTAMP,
  `tongtien` int NOT NULL,
  `phuongthucthanhtoan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diachigiaohang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trangthai` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_kh` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dathang`
--

INSERT INTO `dathang` (`id_dathang`, `ngaydathang`, `ngaygiaohang`, `tongtien`, `phuongthucthanhtoan`, `diachigiaohang`, `trangthai`, `id_kh`) VALUES
(1, '2024-05-04 02:56:18', NULL, 72000, 'COD', NULL, 'đang xử lý', 1),
(2, '2024-05-04 02:56:32', '2024-05-04 00:00:00', 72000, 'VNPAY', 'Đống Đa, Hà nội', 'giao thành công', 1),
(3, '2024-05-14 08:16:30', '2024-05-23 00:00:00', 72000, 'VNPAY', 'nhà trọ Hải Âu, đường 30/4', 'đang giao hàng', 3),
(4, '2024-05-14 08:20:12', '2024-05-23 00:00:00', 72000, 'VNPAY', 'nhà trọ Hải Âu, đường 30/4', 'đang xử lý', 3),
(5, '2024-05-14 08:20:55', '2024-05-23 00:00:00', 72000, 'VNPAY', 'nhà trọ Hải Âu, đường 30/4', 'chờ lấy hàng', 3),
(6, '2024-05-14 08:43:00', NULL, 72000, 'VNPAY', 'nhà trọ Hải Âu, đường 30/4', 'đang xử lý', 3),
(7, '2024-05-14 08:52:59', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(8, '2024-05-14 08:53:04', '2024-05-23 00:00:00', 20000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'giao thành công', 3),
(9, '2024-05-14 08:56:33', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(10, '2024-05-14 08:56:38', NULL, 20000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'đang xử lý', 3),
(11, '2024-05-14 09:00:48', '2024-05-23 00:00:00', 0, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'đã hủy', 3),
(12, '2024-05-14 09:01:05', NULL, 20000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'đang xử lý', 3),
(13, '2024-05-14 09:24:51', '2024-05-23 00:00:00', 20000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'đang giao hàng', 3),
(14, '2024-05-14 09:32:57', NULL, 0, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(15, '2024-05-14 09:35:16', '2024-05-23 00:00:00', 0, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'đã hủy', 3),
(16, '2024-05-14 09:35:23', NULL, 0, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(17, '2024-05-14 09:37:34', '2024-05-23 00:00:00', 0, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'đã hủy', 3),
(18, '2024-05-14 09:37:51', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(19, '2024-05-14 09:38:10', NULL, 20000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'đang xử lý', 3),
(20, '2024-05-14 12:03:12', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(21, '2024-05-14 12:04:55', NULL, 40000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(22, '2024-05-14 12:12:14', NULL, 40000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'đang xử lý', 3),
(23, '2024-05-14 12:12:37', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(24, '2024-05-14 12:12:47', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(25, NULL, '2024-05-23 00:00:00', 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ lấy hàng', 3),
(26, '2024-05-14 12:13:20', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(27, '2024-05-14 12:17:18', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(28, '2024-05-14 12:18:44', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(29, '2024-05-14 12:19:14', '2024-05-23 00:00:00', 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'đang xử lý', 3),
(30, '2024-05-14 12:22:16', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(31, '2024-05-14 12:27:50', NULL, 20000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'đang xử lý', 3),
(32, '2024-05-14 19:32:38', NULL, 20000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'đang xử lý', 3),
(33, '2024-05-14 19:37:02', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(34, '2024-05-14 19:38:51', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(35, '2024-05-14 19:57:33', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(36, '2024-05-14 20:13:14', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(37, '2024-05-14 20:19:21', NULL, 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(38, '2024-05-14 20:19:21', NULL, 20000, 'VNPAY', 'nhà trọ Hải Âu, đường 30/4', 'đang xử lý', 3),
(39, '2024-05-14 20:57:00', '2024-05-14 20:57:34', 20000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'đã thanh toán', 3),
(40, '2024-05-14 21:04:48', '2024-05-14 00:00:00', 184000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'đã hủy', 3),
(41, '2024-05-20 02:59:39', '2024-05-20 00:00:00', 92000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'đã hủy', 3),
(42, '2024-05-20 03:04:15', NULL, 18800, 'COD', NULL, 'đang xử lý', 2),
(43, '2024-05-20 03:05:23', '2024-05-20 00:00:00', 20000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'giao thành công', 3),
(44, '2024-05-21 22:12:33', '2024-05-23 00:00:00', 275000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'giao thành công', 3),
(45, '2024-05-23 00:39:20', NULL, 900000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(46, '2024-05-23 00:39:27', '2024-05-27 00:00:00', 900000, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'đã hủy', 3),
(47, '2024-05-23 00:40:10', '2024-05-23 00:00:00', 900000, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'đang giao hàng', 3),
(48, '2024-05-23 16:33:27', NULL, 676200, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'chờ thanh toán', 3),
(49, '2024-05-23 16:33:46', '2024-05-27 00:00:00', 676200, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'đã hủy', 3),
(50, '2024-05-23 16:34:13', '2024-05-27 00:00:00', 676200, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'đã hủy', 3),
(51, '2024-05-23 16:34:33', '2024-05-27 00:00:00', 676200, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'đã hủy', 3),
(52, '2024-05-23 16:34:50', '2024-05-24 00:00:00', 676200, 'vnpay', 'nhà trọ Hải Âu, đường 30/4', 'đang xử lý', 3),
(53, '2024-05-23 16:37:41', '2024-05-24 00:00:00', 676200, 'COD', 'nhà trọ Hải Âu, đường 30/4', 'đã hủy', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `id_kh` int NOT NULL,
  `hoten` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diachi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sdt` int DEFAULT NULL,
  `id_phanquyen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`id_kh`, `hoten`, `email`, `password`, `diachi`, `sdt`, `id_phanquyen`) VALUES
(1, 'ly', 'teo@gmail.com', '$2y$12$o42vmZrn2TzpqtP0NJ/VyOd0qgv2coPm76eyZ/ZNwUgBHNUUW6H2y', 'Đống Đa, Hà nội', 379487241, 2),
(2, 'admin', 'admin@gmail.com', '$2y$12$JjPydOKxMwUUQWS2bG5ZJOTO7m0gwYnyF4umA4OMU.NtDzvBoMbim', 'Đống Đa, Hà nội', 379487352, 1),
(3, 'tang thi my lien', '2051010167lien@ou.edu.vn', '$2y$12$0DWz8d4LvL35VkV/vxy5WOnZftYnvOZwHxKitfk8WIh2xhgwGqBki', 'nhà trọ Hải Âu, đường 30/4', 374666707, 2),
(7, 'tang thi my lien', '123@gmail.com', '$2y$12$12GtaKGYAWqPZXmqK5CUWevenZIUXYh86nnnLyr3ks.t9rxtvHyZG', NULL, NULL, 1),
(10, 'Lie', 'staff@gmail.com', '$2y$12$fh2Cr7fYAT01Mol9ICpb.Oq2818AZMkGjVijsp1koTkT.75ZZ/3vu', NULL, NULL, 3),
(11, 'tang thi my lien', 'muahang@gmail.com', '$2y$12$6u0brl3Qy4PAj1Zb8jhZdOSAu1578axaE7r7BlczU9LrezuOA016W', 'nhà trọ Hải Âu, đường 30/4', 374666707, 2),
(12, 'lienn', 'muahang2@gmail.com', '$2y$12$Lvj8qp9ceIBqQz3jrc5/I.NHKXFffJwhaPiLrkA4aTx1YaTp0yfza', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_04_21_090007_create_chitiet_donhang_table', 1),
(3, '2024_04_21_090007_create_danhmuc_table', 1),
(4, '2024_04_21_090007_create_dathang_table', 1),
(5, '2024_04_21_090007_create_phanquyen_table', 1),
(6, '2024_04_21_090007_create_sanpham_table', 1),
(7, '2024_04_21_090010_add_foreign_keys_to_sanpham_table', 1),
(8, '2024_04_21_092420_add_foreign_key_to_chitiet_donhang_table', 1),
(9, '2024_04_22_080854_create_khachhang_table', 1),
(10, '2024_04_22_080855_add_foreign_keys_to_khachhang_table', 1),
(11, '2024_04_21_090010_add_foreign_keys_to_khachhang_table', 2),
(12, '2024_05_14_205947_create_admins_table', 3),
(13, '2024_05_15_005658_add_foreign_key_to_admins_table', 3),
(14, '2024_05_15_011823_add_updated_at_to_admins_table', 4),
(15, '2024_05_19_221429_create_comments_table', 5),
(16, '2024_05_19_222551_add_foreign_keys_at_to_comments_table', 5),
(17, '2024_05_19_230940_create_comments_table', 6),
(18, '2024_05_20_001032_create_comments_table', 7),
(19, '2024_05_20_001820_create_comments_table', 8),
(20, '2024_05_20_003005_add_rating_to_comments_table', 9),
(21, '2024_05_26_213409_add_updated_at_to_admins_table', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phanquyen`
--

CREATE TABLE `phanquyen` (
  `id_phanquyen` int NOT NULL,
  `tenquyen` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phanquyen`
--

INSERT INTO `phanquyen` (`id_phanquyen`, `tenquyen`) VALUES
(1, 'admin'),
(2, 'user'),
(3, 'staff');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id_sanpham` int NOT NULL,
  `tensp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anhsp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `giasp` int DEFAULT NULL,
  `mota` text COLLATE utf8mb4_unicode_ci,
  `giamgia` int DEFAULT NULL,
  `giakhuyenmai` int DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `id_danhmuc` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id_sanpham`, `tensp`, `anhsp`, `giasp`, `mota`, `giamgia`, `giakhuyenmai`, `soluong`, `id_danhmuc`) VALUES
(1, 'Thức Ăn Cho Chó Trưởng Thành Giống Lớn – Eminent Adult Large Breed – 500g', 'frontend/upload/Eminent.jpg', 72000, 'abc', 0, 72000, 2, 1),
(2, 'Pate Cho Mèo – Pate Fit4 Cats -Cá Ngừ Và Thanh Cua 160g', 'frontend/upload/dohop.jpg', 20000, NULL, 0, 72000, 5, 2),
(3, 'Chó Bull', 'frontend/upload/Chó-Bully.jpg', 72000, NULL, 15, 61200, 5, 6),
(4, 'Mèo Anh lông ngắn', 'frontend/upload/wft4tJYLkUhaWQFfn2LqhH7yacwSg0olxthv3v3J.jpg', 20000, 'là giống mèo bám người và sống tình cảm', 6, 18800, 2, 7),
(5, 'Chó chihuahua', 'frontend/upload/Chó-chi-hua-hua.jpg', 20000, NULL, 0, 20000, 3, 6),
(6, 'Bánh Gặm Cho Chó – Smoked Beefy Dental Bone -14g', 'frontend/upload/dochocho.jpg', 20000, NULL, 0, 20000, 6, 1),
(7, 'Mèo Ba Tư', 'frontend/upload/EM2xgetZQSA20pHrPw8zeES7pbZOWINnbnuhUF7x.jpg', 900000, 'giống mèo quý tộc ở Châu ÂU', NULL, 900000, 3, 7),
(8, 'Nệm vuông size M', 'frontend/upload/OUO7YM4PWIkjoBjivKw29zfyvAQdZFPP3r7qEtHi.jpg', 255000, 'dành cho mèo từ 4kg trở xuống', NULL, 255000, 2, 9),
(9, 'Mèo Sphynx', 'frontend/upload/I6blpXykLmm6JpD3w1I6nTI71Q9hGhiYSIlUinIi.jpg', 1000000, 'giống mèo Ai Cập', NULL, 1000000, 1, 7),
(10, 'Chó xoáy Phú Quốc', 'frontend/upload/OjpVOJwOpx59U7E0YOlplwWYWgFWT2CENSlsWIdC.jpg', 300000, NULL, NULL, 300000, 1, 6);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `fk_admins` (`id_phanquyen`);

--
-- Chỉ mục cho bảng `chitiet_donhang`
--
ALTER TABLE `chitiet_donhang`
  ADD PRIMARY KEY (`id_ctdonhang`),
  ADD KEY `chitiet_donhang_id_dathang_foreign` (`id_dathang`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_id_sanpham_foreign` (`id_sanpham`),
  ADD KEY `comments_id_kh_foreign` (`id_kh`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id_danhmuc`);

--
-- Chỉ mục cho bảng `dathang`
--
ALTER TABLE `dathang`
  ADD PRIMARY KEY (`id_dathang`),
  ADD KEY `dathang_id_dathang_index` (`id_dathang`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`id_kh`),
  ADD KEY `fk_dk` (`id_phanquyen`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `phanquyen`
--
ALTER TABLE `phanquyen`
  ADD PRIMARY KEY (`id_phanquyen`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id_sanpham`),
  ADD KEY `fk_customer` (`id_danhmuc`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `chitiet_donhang`
--
ALTER TABLE `chitiet_donhang`
  MODIFY `id_ctdonhang` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id_danhmuc` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `dathang`
--
ALTER TABLE `dathang`
  MODIFY `id_dathang` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `id_kh` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id_sanpham` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `fk_admins` FOREIGN KEY (`id_phanquyen`) REFERENCES `phanquyen` (`id_phanquyen`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `chitiet_donhang`
--
ALTER TABLE `chitiet_donhang`
  ADD CONSTRAINT `chitiet_donhang_id_dathang_foreign` FOREIGN KEY (`id_dathang`) REFERENCES `dathang` (`id_dathang`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_id_kh_foreign` FOREIGN KEY (`id_kh`) REFERENCES `khachhang` (`id_kh`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_id_sanpham_foreign` FOREIGN KEY (`id_sanpham`) REFERENCES `sanpham` (`id_sanpham`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `fk_dk` FOREIGN KEY (`id_phanquyen`) REFERENCES `phanquyen` (`id_phanquyen`),
  ADD CONSTRAINT `fk_dk_new` FOREIGN KEY (`id_phanquyen`) REFERENCES `phanquyen` (`id_phanquyen`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`id_danhmuc`) REFERENCES `danhmuc` (`id_danhmuc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
