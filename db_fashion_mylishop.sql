-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 16, 2023 lúc 05:39 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_fashion_mylishop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'mylishop', '8A86E1AAF7327885729E5B450841FEF6');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Thời Trang Nam'),
(2, 'Thời Trang Nữ'),
(3, 'Hàng Mới Về');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contents` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `contents` text DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `title`, `contents`, `created`, `status`) VALUES
(1, 'Tạ Đình Phong', 'tadinhphong000@gmail.com', 'Demo web', 'Test thôi nhá', '2018-02-02 08:32:54', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `total` float NOT NULL,
  `date_order` datetime NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `total`, `date_order`, `status`, `user_id`) VALUES
(1, 245000, '2018-01-25 18:30:30', 1, 12),
(2, 225000, '2018-01-25 19:42:03', 1, 13),
(3, 245000, '2018-01-25 19:45:13', 1, 14),
(4, 245000, '2018-02-02 08:27:05', 1, 15),
(5, 245000, '2018-02-02 08:29:12', 1, 15),
(6, 235000, '2018-11-06 18:20:48', 0, 10),
(7, 245000, '2018-11-06 18:23:37', 0, 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `saleprice` float NOT NULL,
  `created` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `keyword` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `image`, `description`, `price`, `saleprice`, `created`, `quantity`, `keyword`, `status`) VALUES
(2, 'Áo Khoác Vest', 1, 'images/fashion_boy/men-cloth.jpg', '', 290000, 0, '2017-12-18', 8, '', 0),
(3, 'Quần Thời Thượng', 1, 'images/fashion_boy/men-wear.jpg', '', 210000, 0, '2017-12-18', 10, '', 0),
(4, 'Vest Xám Kẻ Sọc', 1, 'images/fashion_boy/vest-xam-ke-soc-an-tuong.jpg', '', 180000, 0, '2017-12-18', 7, '', 0),
(5, 'Áo Sơ Mi Nâu', 1, 'images/fashion_boy/so-mi-xanh-tim-hoa-tiet-tron.jpg', '', 250000, 0, '2017-12-18', 12, '', 0),
(6, 'Đầm viscose xanh', 2, 'images/fashion_girl/Green-Viscose-Dresses.jpg', '', 165000, 0, '2017-12-18', 15, '', 0),
(7, 'Váy Màu Xanh', 2, 'images/fashion_girl/Set_ao_croptop_co_sen_chan_vay_mau_xanh.jpg', '', 155000, 0, '2017-12-18', 9, '', 0),
(8, 'Váy Màu Hồng', 2, 'images/fashion_girl/Dress-Materials.jpg', '', 195000, 0, '2017-12-18', 19, '', 0),
(9, 'Áo Khoác kaki', 2, 'images/fashion_girl/Ao_khoac_kaki_hai_lop_mau_ke.jpg', '', 265000, 0, '2017-12-18', 15, '', 0),
(10, 'Đầm maxi hai dây', 2, 'images/fashion_girl/Dam_maxi_hai_day_kem_nit.jpg', '', 315000, 0, '2017-12-18', 10, '', 0),
(11, 'Áo Sơ Mi Xanh', 3, 'images/hangmoive/ao so mi.jpg', '', 225000, 0, '2017-12-18', 10, '', 0),
(12, 'Đầm Xòe Ren Màu Trắng', 3, 'images/hangmoive/Dam_xoe_phoi_ren_xinh_xan_mau_trang.jpg', '', 245000, 0, '2017-12-18', 20, '', 0),
(13, 'Váy Đẹp Cho Phái Nữ', 3, 'images/hangmoive/womens-georgette.jpg', '', 275000, 0, '2017-12-18', 21, '', 0),
(14, 'Vest Đen Chấm Nhỏ', 3, 'images/hangmoive/vest-den-cham-nho.jpg', '', 225000, 0, '2017-12-18', 17, '', 0),
(15, 'Áo Sơ Mi Xanh Tím', 3, 'images/hangmoive/so-mi-xanh-tim-hoa-tiet-tron.jpg', '', 225000, 0, '2017-12-18', 6, '', 0),
(16, 'Giày Nâu Xám Phái Nam', 3, 'images/hangmoive/Brown-Casual-Shoes.jpg', '', 235000, 0, '2017-12-18', 11, '', 0),
(17, 'Giày Nâu Giản dị', 3, 'images/hangmoive/Roadster-Casual-Shoes.jpg', '', 245000, 0, '2017-12-18', 13, '', 0),
(18, 'Giày adidas', 1, 'images/shoes/adidas-alphabounce-reflective-pack-2.jpg', '', 195000, 0, '2017-12-18', 15, '', 0),
(19, 'Dép Su Quay Hậu', 1, 'images/shoes/dep quay hau.jpg', '', 115000, 0, '2017-12-18', 13, '', 0),
(20, 'Giày Cao Gót Màu Nâu Bóng', 2, 'images/shoes/giay-cao-co-mau-nau-bong-tron.png', '', 199000, 0, '2017-12-18', 20, '', 0),
(21, 'Dép Bạc Gót', 2, 'images/shoes/Silver-Heeled-Sandals.jpg', '', 299000, 0, '2017-12-18', 10, '', 0),
(22, 'Giày Ống Cao', 3, 'images/hangmoive/Tan-Boots-425x498.jpg', '', 259000, 0, '2017-12-18', 10, '', 0),
(23, 'Giày Thể Thao Năng Động', 2, 'images/shoes/Giay the thao nu xanh.jpg', '', 169000, 0, '2017-12-18', 25, '', 0),
(24, 'Giày Cao Gót Su', 2, 'images/shoes/giay-cao-co-mau-nau-bong-tron.png', '', 269000, 0, '2017-12-18', 0, '', 0),
(25, 'Giày Thể Thao Nike', 1, 'images/shoes/xanhduongfreetr5printtrainings-.jpg', '', 199000, 0, '2017-12-18', 13, '', 0),
(26, 'Giày Thể Thao Xanh', 1, 'images/shoes/xanhairzoompegasus33runningsho.jpg', '', 189000, 0, '2017-12-18', 13, '', 0),
(27, 'Đầm Dự Tiệc Màu Hồng Cam', 2, 'images/fashion_girl/Dam_du_tiec_dun_eo_ta_xeo_mau_hong_cam.jpg', '', 219000, 0, '2017-12-18', 20, '', 0),
(28, 'Đầm Thai Sản Màu Xanh', 2, 'images/fashion_girl/Maternity-Store-300x351.jpg', '', 209000, 0, '2017-12-18', 30, '', 0),
(30, 'Thắt Lưng Do Chạm Khắc', 1, 'images/fashion_boy/that-lung-da-khoa-tron-cham-khac-noi.png', '', 89000, 0, '2017-12-18', 15, '', 0),
(31, 'Quần kaki Màu Nâu', 1, 'images/fashion_boy/quan-au-mau-bordeaux.jpg', '', 229000, 0, '2017-12-18', 15, '', 0),
(32, 'Bộ Cotton Henley', 1, 'images/fashion_boy/Cotton-Henley-T-shirt.jpg', '', 299000, 0, '2017-12-18', 12, '', 0),
(33, 'Váy Xám Đẹp', 2, 'images/fashion_girl/dress-f-blue.jpg', '', 239000, 0, '2017-12-22', 20, '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_order`
--

CREATE TABLE `product_order` (
  `product_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `product_order`
--

INSERT INTO `product_order` (`product_id`, `order_id`, `quantity`) VALUES
(12, 1, 1),
(14, 2, 1),
(17, 3, 1),
(12, 4, 1),
(17, 5, 1),
(16, 6, 1),
(17, 7, 1),
(22, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `contents` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `slides`
--

INSERT INTO `slides` (`id`, `image`, `status`) VALUES
(1, 'images/background.jpg', 0),
(2, 'images/slide/slide-3.jpg', 1),
(3, 'images/slide/slide-4.jpg', 1),
(4, 'images/slide/slide-5.jpg', 1),
(5, 'images/slide/slide-2.jpg', 1),
(6, 'images/banner/2.jpg', 2),
(7, 'images/banner/3.jpg', 2),
(8, 'images/banner/banner.jpg', 2),
(9, 'images/banner/khuyenmaithang12.png', 2),
(10, 'images/partner/partner1.png', 3),
(11, 'images/partner/partner2.png', 3),
(12, 'images/partner/partner3.png', 3),
(13, 'images/partner/partner4.png', 3),
(14, 'images/partner/partner5.png', 3),
(15, 'images/partner/partner6.jpg', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`, `email`, `address`, `phone`, `created`, `role`) VALUES
(10, 'Hoih My', 'my.hoih', '49CDB4C2B576011E554669632DFBD7CC', 'my.hoih@student.passerellesnumeriques.org', 'Đà Nẵng', '01697450200', NULL, 1),
(11, 'y blir', 'blir.y', 'C00813256690A14079A569831F9BAAD6', 'blir.y@student.passerellesnumeriques.org', 'Đà Nẵng', '0926055983', NULL, 1),
(12, 'Ly Ca Tiếu', '', '', 'hoihmy2712@gmail.com', 'Đà Nẵng', '01697450200', NULL, 0),
(13, 'Ly Ca Tiếu', '', '', 'hoihmy2712@gmail.com', 'Đà Nẵng', '01697450200', NULL, 0),
(14, 'Ly Ca Tiếu', '', '', 'hoihmy2712@gmail.com', 'Đà Nẵng', '01697450200', NULL, 0),
(22, 'Mr DInh', 'dinhvcvn', '123abc', 'dinhvcvn@gmail.com', NULL, NULL, '2023-04-01 05:25:22', 1);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_groupby_idorder`
-- (See below for the actual view)
--
CREATE TABLE `view_groupby_idorder` (
`idOrder` int(11)
,`status` tinyint(2)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `view_order_list`
-- (See below for the actual view)
--
CREATE TABLE `view_order_list` (
`idOrder` int(11)
,`fullname` varchar(50)
,`phone` varchar(20)
,`email` varchar(100)
,`idUser` int(11)
,`address` varchar(50)
,`idProduct` int(11)
,`nameProduct` varchar(255)
,`price` float
,`saleprice` float
,`quantity` int(11)
,`status` tinyint(2)
,`dateOrder` datetime
);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_groupby_idorder`
--
DROP TABLE IF EXISTS `view_groupby_idorder`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_groupby_idorder`  AS SELECT `orders`.`id` AS `idOrder`, `orders`.`status` AS `status` FROM (((`orders` join `users` on(`orders`.`user_id` = `users`.`id`)) join `product_order` on(`product_order`.`order_id` = `orders`.`id`)) join `products` on(`product_order`.`product_id` = `products`.`id`)) GROUP BY `orders`.`id` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `view_order_list`
--
DROP TABLE IF EXISTS `view_order_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order_list`  AS SELECT `orders`.`id` AS `idOrder`, `users`.`fullname` AS `fullname`, `users`.`phone` AS `phone`, `users`.`email` AS `email`, `users`.`id` AS `idUser`, `users`.`address` AS `address`, `products`.`id` AS `idProduct`, `products`.`name` AS `nameProduct`, `products`.`price` AS `price`, `products`.`saleprice` AS `saleprice`, `product_order`.`quantity` AS `quantity`, `orders`.`status` AS `status`, `orders`.`date_order` AS `dateOrder` FROM (((`orders` join `users` on(`orders`.`user_id` = `users`.`id`)) join `product_order` on(`product_order`.`order_id` = `orders`.`id`)) join `products` on(`product_order`.`product_id` = `products`.`id`)) ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `product_order`
--
ALTER TABLE `product_order`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `product_order`
--
ALTER TABLE `product_order`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
