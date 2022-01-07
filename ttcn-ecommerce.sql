-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 06, 2022 lúc 02:01 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ttcn-ecommerce`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `total_cost` decimal(19,2) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_item`
--

CREATE TABLE `cart_item` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` text COLLATE utf8mb4_bin DEFAULT NULL,
  `thumbnail` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `createdby`, `createddate`, `modifiedby`, `modifieddate`, `name`, `description`, `thumbnail`) VALUES
(1, NULL, NULL, NULL, NULL, 'laptop', NULL, 'fas fa-laptop'),
(2, NULL, NULL, NULL, NULL, 'Tai nghe', NULL, 'fas fa-headphones');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `profile_picture` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `provider` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `profile_picture` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee_role`
--

CREATE TABLE `employee_role` (
  `employee_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `createdby`, `createddate`, `modifiedby`, `modifieddate`, `product_id`, `customer_id`, `rating`) VALUES
(1, '', '2022-01-27 08:49:56.000000', NULL, NULL, 1, NULL, 5),
(2, '', '2022-01-04 08:49:56.000000', NULL, NULL, 1, NULL, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_bin DEFAULT NULL,
  `description` text COLLATE utf8mb4_bin DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `unit_in_stock` int(11) NOT NULL DEFAULT 0,
  `thumbnail` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `createdby`, `createddate`, `modifiedby`, `modifieddate`, `short_description`, `description`, `brand`, `name`, `price`, `unit_in_stock`, `thumbnail`, `category_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 'Laptop APPLE MacBook Pro 2020 MYD82SA/A có vẻ ngoài cực kỳ sang trọng được kế thừa từ các thế hệ đi trước nhưng bên trong chứa đựng một cấu hình thực sự rất đáng gờm. Sản phẩm Macbook này hứa hẹn sẽ giúp bạn vượt qua mọi công việc hằng ngày ở văn phòng hay cả tại nhà riêng, thích hợp cho mọi người ưa thích sự sáng tạo, luôn tìm tòi những điều mới mẻ trong công việc.', 'Apple', 'Laptop APPLE MacBook Pro 2020 MYD82SA/A ( 13.3\\\" Apple M1/8GB/256GB SSD/macOS/1.4kg)', '31890000.00', 100, 'https://lh3.googleusercontent.com/6iW6tc0lHp4paCYznq-gC5mEXEGMSBmrSq2I4MaXdPne5XWQI4l8m-bGRVCRFH94d4PEqtUIdH3FERr-VNDWaT2k9qcZ5Ey_PQ=w500-rw', 1),
(2, NULL, NULL, NULL, NULL, NULL, 'Các dòng sản phẩm của thương hiệu Apple luôn được đánh giá cao về chất lượng cũng như về hình dáng, mẫu mã. Nếu bạn đang cần một chiếc laptop mỏng, nhẹ, nhỏ gọn để tiện mang theo bên mình thì lựa chọn Laptop APPLE MacBook Air 2020 MGN63SA/A là vô cùng hợp lý.', 'Apple', 'Laptop APPLE MacBook Air 2020 MGN63SA/A ( 13.3\\\" Apple M1/8GB/256GB SSD/macOS/1.3kg)', '26500000.00', 10, 'https://lh3.googleusercontent.com/Ezh1zisXToaMPP30pXE50dnotXpEyxnGsYpbd6uZc6jEWRWhMrMY2EDuXNcWPhw4nfcwwC-mGGVEkkRtRSJE0P3hRPuvCjw=w500-rw', 1),
(19, '', '2021-12-31 15:11:50.452000', '', '2021-12-31 15:30:52.004000', 'Máy tính xách tay/ Laptop MacBook Air 2020 13.3\" MGN73SA/A', 'Máy tính xách tay/ Laptop MacBook Air 2020 13.3\" MGN73SA/A mang đến hiệu năng xử lý mạnh mẽ ẩn bên trong thiết kế sang trọng và tinh tế. Là dòng laptop cao cấp đến từ thương hiệu nổi tiếng Apple, MacBook Air 2020 13.3\" MGN73SA/A hứa hẹn sẽ là người bạn đồng hành tuyệt vời, đáp ứng đa dạng các nhu cầu sử dụng, từ học tập, công việc đến giải trí.', 'Apple', 'Laptop APPLE MacBook Air 2020 MGN73SA/A ( 13.3\" Apple M1/8GB/512GB SSD/macOS/1.3kg)', '31790000.00', 50, 'https://lh3.googleusercontent.com/skwj0sp9gWzzKtL3cuFtE7kncj6bDcdGfezZpM6WByG8MUAykq_97iN5EzZefQVDPJrrQOaE5yvOsRMKXEup3N7qOoRJpK4p_A=w500-rw', 1),
(20, NULL, NULL, NULL, NULL, NULL, 'Tai nghe Corsair HS70 PRO WIRELESS SE Cream (CA-9011210-AP) là dòng tai nghe không dây, đây là phiên bản tiếp nối 2 bản HS60 và HS50. Chỉ với mức giá tầm 2 đến 3 triệu đồng, bạn đã sở hữu được chiếc tai nghe khá chất lượng dành cho game thủ. Cùng khám phá xem những chiếc tai nghe này có những đặc điểm nổi bật nào.', NULL, 'Tai nghe Corsair HS70 PRO WIRELESS SE Cream (CA-9011210-AP)', '1949000.00', 30, 'https://lh3.googleusercontent.com/xBzwzaZwgdmnYNtpChmLij4_UJfnyIKglGLauf7vb2XD--tQa7p5yNsYjqwZke2THeUadGs7--UTXZjACQP3rs-hByMPinwN=w500-rw', 2),
(23, '', '2021-12-31 15:55:00.831000', NULL, NULL, '', 'Laptop Dell Inspiron 5584 (N5I5413W) là chiếc laptop văn phòng có cấu hình mạnh mẽ vượt trội và tốc độ xử lí dữ liệu nhanh chóng. Với card đồ họa rời MX130 2 GB, laptop còn giúp bạn xử lí công việc đồ họa và chơi một số tựa game nhẹ.', 'Dell', 'Laptop Dell Inspiron 15 5584 (5584-N5I5353W) (i5-8265U) (Bạc', '15400000.00', 50, 'https://lh3.googleusercontent.com/NlaNmuQD7VOrBJn8_gc-ZBGv4OJsWMc3Ex-1yL2ZPeMXjOK7NXpbExKAl4Qlj2Dm_1bT4xVYL1hvb1CWJkd7rqoUitNyhRyi=w500-rw', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK624gtjin3po807j3vix093tlf` (`customer_id`);

--
-- Chỉ mục cho bảng `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlt3mrhyikkt94xukyqrv652jd` (`cart_id`),
  ADD KEY `FKdfk89kr9xleu3aljo18y2lyec` (`product_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `FKo2oh87rk6lunf0lic1svc9y75` (`role_id`);

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `employee_role`
--
ALTER TABLE `employee_role`
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  ADD KEY `FK859n2jvi8ivhui0rl0esws6o` (`employee_id`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9k` (`product_id`),
  ADD KEY `FK1mtsbus82frn64de7balymq9d` (`customer_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK624gtjin3po807j3vix093tlf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Các ràng buộc cho bảng `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `FKdfk89kr9xleu3aljo18y2lyec` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKlt3mrhyikkt94xukyqrv652jd` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`);

--
-- Các ràng buộc cho bảng `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FKo2oh87rk6lunf0lic1svc9y75` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Các ràng buộc cho bảng `employee_role`
--
ALTER TABLE `employee_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9k` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK1mtsbus82frn64de7balymq9d` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
