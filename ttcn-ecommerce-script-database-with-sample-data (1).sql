-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ttcn-ecommerce
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `total_cost` decimal(19,2) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK624gtjin3po807j3vix093tlf` (`customer_id`),
  CONSTRAINT `FK624gtjin3po807j3vix093tlf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,NULL,NULL,NULL,NULL,'077123443',1000000.00,1,'Da Nang');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKlt3mrhyikkt94xukyqrv652jd` (`cart_id`),
  KEY `FKdfk89kr9xleu3aljo18y2lyec` (`product_id`),
  CONSTRAINT `FKdfk89kr9xleu3aljo18y2lyec` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKlt3mrhyikkt94xukyqrv652jd` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (1,NULL,NULL,NULL,NULL,1,1,1,1);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` text COLLATE utf8mb4_bin,
  `thumbnail` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,NULL,NULL,NULL,NULL,'laptop',NULL,'fas fa-laptop'),(2,NULL,NULL,NULL,NULL,'Tai nghe',NULL,'fas fa-headphones'),(5,'','2022-01-03 15:23:46.138000',NULL,NULL,'B??n ph??m','','fas fa-keyboard'),(6,'','2022-01-03 15:24:31.530000',NULL,NULL,'Chu???t','','fas fa-mouse'),(7,'','2022-01-03 15:25:23.928000',NULL,NULL,'Tay c???m ch??i game','','fab fa-xbox'),(8,'','2022-01-03 15:25:51.205000',NULL,NULL,'PC','','fas fa-hdd'),(9,'','2022-01-03 15:26:28.542000',NULL,NULL,'M??n h??nh','','fas fa-desktop'),(10,'','2022-01-03 15:27:05.446000',NULL,NULL,'Gh??? Gaming','','fas fa-chair');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `enabled` int DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `profile_picture` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `provider` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FKo2oh87rk6lunf0lic1svc9y75` (`role_id`),
  CONSTRAINT `FKo2oh87rk6lunf0lic1svc9y75` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,NULL,NULL,'customer01','2022-01-04 11:08:40.596000','customer01','Customer 01','customer01@gmail.com','0779439853','qu??n MK',1,1,'$2a$10$SpDn2RbYLQIIUM1EVD2KXOlzhp5DNMhsB3o7MBvSJhHPaw3qJU98m',NULL,1,NULL),(5,NULL,'2022-01-04 10:54:13.951000',NULL,NULL,'customer02','Customer 02','customer02@gmail.com','0779439854','qu??n MK',1,1,'$2a$10$SpDn2RbYLQIIUM1EVD2KXOlzhp5DNMhsB3o7MBvSJhHPaw3qJU98m',NULL,1,NULL),(7,NULL,'2022-01-05 16:10:37.792000',NULL,NULL,'customer03','Customer 03','customer03@gmail.com','0779439852','admin123',1,1,'$2a$10$mw2c5KcajC/0sm2VyH4eKueTcqNfgUX.MMTzsxHWl4IQ5YnBKoFNm',NULL,1,NULL),(8,NULL,'2022-01-05 16:20:14.427000',NULL,NULL,'customer04','Customer 04','customer04@gmail.com','0779439851',NULL,1,1,'$2a$10$Lcwtk8kAxHlesXIknHN4Iu68Q3haIfXNP5vSQPEO/i.1kFscf8QHK',NULL,1,NULL),(9,NULL,'2022-01-08 03:57:23.629000',NULL,NULL,'customer07','Customer 07','customer07@gmail.com','0779439891',NULL,1,1,'$2a$10$w/3atrN/jUnpyLH.9CsjJuM/NpLA64wSyq6/bLRLpWdimYactqI2i',NULL,1,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `enabled` int DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `profile_picture` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_role`
--

DROP TABLE IF EXISTS `employee_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_role` (
  `employee_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`employee_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_role`
--

LOCK TABLES `employee_role` WRITE;
/*!40000 ALTER TABLE `employee_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9k` (`product_id`),
  KEY `FK1mtsbus82frn64de7balymq9d` (`customer_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9k` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK1mtsbus82frn64de7balymq9d` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,NULL,NULL,NULL,NULL,1,1,5),(5,'','2022-01-08 04:31:56.418000',NULL,NULL,1,1,0),(6,'','2022-01-08 04:34:02.494000',NULL,NULL,1,1,5),(7,'','2022-01-08 04:35:49.772000',NULL,NULL,1,1,4),(8,'','2022-01-08 04:39:53.669000',NULL,NULL,1,1,4);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_bin,
  `description` text COLLATE utf8mb4_bin,
  `brand` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `unit_in_stock` int NOT NULL DEFAULT '0',
  `thumbnail` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,NULL,NULL,NULL,NULL,'M??y t??nh x??ch tay/ Laptop MacBook Air 2020 13.3\" MGN73SA/A','Laptop APPLE MacBook Pro 2020 MYD82SA/A c?? v??? ngo??i c???c k??? sang tr???ng ???????c k??? th???a t??? c??c th??? h??? ??i tr?????c nh??ng b??n trong ch???a ?????ng m???t c???u h??nh th???c s??? r???t ????ng g???m. S???n ph???m Macbook n??y h???a h???n s??? gi??p b???n v?????t qua m???i c??ng vi???c h???ng ng??y ??? v??n ph??ng hay c??? t???i nh?? ri??ng, th??ch h???p cho m???i ng?????i ??a th??ch s??? s??ng t???o, lu??n t??m t??i nh???ng ??i???u m???i m??? trong c??ng vi???c.','Apple','Laptop APPLE MacBook Pro 2020 MYD82SA/A ( 13.3\\\" Apple M1/8GB/256GB SSD/macOS/1.4kg)',31890000.00,100,'https://lh3.googleusercontent.com/6iW6tc0lHp4paCYznq-gC5mEXEGMSBmrSq2I4MaXdPne5XWQI4l8m-bGRVCRFH94d4PEqtUIdH3FERr-VNDWaT2k9qcZ5Ey_PQ=w500-rw',1),(2,NULL,NULL,NULL,NULL,NULL,'C??c d??ng s???n ph???m c???a th????ng hi???u Apple lu??n ???????c ????nh gi?? cao v??? ch???t l?????ng c??ng nh?? v??? h??nh d??ng, m???u m??. N???u b???n ??ang c???n m???t chi???c laptop m???ng, nh???, nh??? g???n ????? ti???n mang theo b??n m??nh th?? l???a ch???n Laptop APPLE MacBook Air 2020 MGN63SA/A l?? v?? c??ng h???p l??.','Apple','Laptop APPLE MacBook Air 2020 MGN63SA/A ( 13.3\\\" Apple M1/8GB/256GB SSD/macOS/1.3kg)',26500000.00,10,'https://lh3.googleusercontent.com/Ezh1zisXToaMPP30pXE50dnotXpEyxnGsYpbd6uZc6jEWRWhMrMY2EDuXNcWPhw4nfcwwC-mGGVEkkRtRSJE0P3hRPuvCjw=w500-rw',1),(19,'','2021-12-31 15:11:50.452000','','2021-12-31 15:30:52.004000','M??y t??nh x??ch tay/ Laptop MacBook Air 2020 13.3\" MGN73SA/A','M??y t??nh x??ch tay/ Laptop MacBook Air 2020 13.3\" MGN73SA/A mang ?????n hi???u n??ng x??? l?? m???nh m??? ???n b??n trong thi???t k??? sang tr???ng v?? tinh t???. L?? d??ng laptop cao c???p ?????n t??? th????ng hi???u n???i ti???ng Apple, MacBook Air 2020 13.3\" MGN73SA/A h???a h???n s??? l?? ng?????i b???n ?????ng h??nh tuy???t v???i, ????p ???ng ??a d???ng c??c nhu c???u s??? d???ng, t??? h???c t???p, c??ng vi???c ?????n gi???i tr??.','Apple','Laptop APPLE MacBook Air 2020 MGN73SA/A ( 13.3\" Apple M1/8GB/512GB SSD/macOS/1.3kg)',31790000.00,50,'https://lh3.googleusercontent.com/skwj0sp9gWzzKtL3cuFtE7kncj6bDcdGfezZpM6WByG8MUAykq_97iN5EzZefQVDPJrrQOaE5yvOsRMKXEup3N7qOoRJpK4p_A=w500-rw',1),(20,NULL,NULL,NULL,NULL,NULL,'Tai nghe Corsair HS70 PRO WIRELESS SE Cream (CA-9011210-AP) l?? d??ng tai nghe kh??ng d??y, ????y l?? phi??n b???n ti???p n???i 2 b???n HS60 v?? HS50. Ch??? v???i m???c gi?? t???m 2 ?????n 3 tri???u ?????ng, b???n ???? s??? h???u ???????c chi???c tai nghe kh?? ch???t l?????ng d??nh cho game th???. C??ng kh??m ph?? xem nh???ng chi???c tai nghe n??y c?? nh???ng ?????c ??i???m n???i b???t n??o.',NULL,'Tai nghe Corsair HS70 PRO WIRELESS SE Cream (CA-9011210-AP)',1949000.00,30,'https://lh3.googleusercontent.com/xBzwzaZwgdmnYNtpChmLij4_UJfnyIKglGLauf7vb2XD--tQa7p5yNsYjqwZke2THeUadGs7--UTXZjACQP3rs-hByMPinwN=w500-rw',2),(23,'','2021-12-31 15:55:00.831000',NULL,NULL,'','Laptop Dell Inspiron 5584 (N5I5413W) l?? chi???c laptop v??n ph??ng c?? c???u h??nh m???nh m??? v?????t tr???i v?? t???c ????? x??? l?? d??? li???u nhanh ch??ng. V???i card ????? h???a r???i MX130 2 GB, laptop c??n gi??p b???n x??? l?? c??ng vi???c ????? h???a v?? ch??i m???t s??? t???a game nh???.','Dell','Laptop Dell Inspiron 15 5584 (5584-N5I5353W) (i5-8265U) (B???c',15400000.00,50,'https://lh3.googleusercontent.com/NlaNmuQD7VOrBJn8_gc-ZBGv4OJsWMc3Ex-1yL2ZPeMXjOK7NXpbExKAl4Qlj2Dm_1bT4xVYL1hvb1CWJkd7rqoUitNyhRyi=w500-rw',1),(24,'','2022-01-07 11:59:07.335000',NULL,NULL,'','M??y t??nh x??ch tay MacBook Air 2020 MWTJ2SA/A s??? h???u v??? ngo??i hi???n ?????i v?? th???i th?????ng, k???t h???p c??ng card ????? h???a Intel Iris Plus Graphics ti??n ti???n. Ngo??i ra c??n ???????c trang b??? th??m c??ng ngh??? b???o m???t v??n tay si??u cao c???p, ????y ch??nh l?? d??ng m??y ???????c ????nh gi?? l?? v?? c??ng ph?? h???p v???i d??n v??n ph??ng mu???n c?? ???????c hi???u su???t cao.','Apple','Laptop APPLE MacBook Air 2020 MWTJ2SA/A MWTJ2SA/A ( 13.3\" Intel Core i3/8GB/256GB SSD/macOS/1.3kg)',28990000.00,50,'https://lh3.googleusercontent.com/CKmGHyidFQpjJ14lASQn6hWJC5lgzHOPJdzeQjR7m2elqiMV8VnoO7tdhrYd8hSuV5esCvdWoajktWcXPw=w500-rw',1),(25,'','2022-01-07 12:00:13.807000',NULL,NULL,'','Laptop MacBook Air 2020 MVH52SA/A (V??ng) s???? h????u ve?? ngoa??i ???si??u mo??ng nhe?????, ki????u da??ng thanh li??ch cu??ng ca??c ch????c n??ng ca??i ti????n h??????ng ??????n ??a??p ????ng mo??i y??u c????u cu??a ng??????i du??ng. ????y ch????c ch????n la?? s???? l????a cho??n hoa??n ha??o cho ca?? c??ng vi????c va?? gia??i tri??, la??m ha??i lo??ng nh????ng ng??????i s???? du??ng kho?? ti??nh nh????t.',NULL,'Laptop APPLE MacBook Air 2020 MVH52SA/A ( 13.3\" Intel Core i5/8GB/512GB SSD/macOS/1.3kg)',31990000.00,50,'https://lh3.googleusercontent.com/EbjsIwhx2dAJpZcXO22yALjLarSwZo3PMyBcfkmuuOhB6rm9y-ifCdDzdoTgT36SZXngri3cHvKUeInKpWQ=w500-rw',1),(26,'','2022-01-07 12:01:52.877000',NULL,NULL,'','M??y t??nh x??ch tay MacBook Pro 2018 MR9R2 s??? h???u v??? ngo??i hi???n ?????i v?? th???i th?????ng, k???t h???p c??ng card ????? h???a Intel Iris Plus Graphics ti??n ti???n. Ngo??i ra c??n ???????c trang b??? th??m c??ng ngh??? b???o m???t v??n tay si??u cao c???p, ????y ch??nh l?? d??ng m??y ???????c ????nh gi?? l?? v?? c??ng ph?? h???p v???i d??n v??n ph??ng mu???n c?? ???????c hi???u su???t cao.','Apple','Laptop Apple MacBook Pro 2018 13.3\" MR9R2 (13.3\"/Core i5/8GB/Iris Plus 650/macOS)',47790000.00,50,'https://lh3.googleusercontent.com/9eLN7Yv5USoT6IKyJ6iMIFpJwYfEDj2qqBPU9AQWcEIitp1Hy5vUskvqNBsfFNg1ShLopOeOjOSSXQuuEtQv=w500-rw',1),(27,'','2022-01-07 12:02:49.570000',NULL,NULL,'','M??y t??nh x??ch tay MacBook Pro 2018 MR9U2 s??? h???u v??? ngo??i hi???n ?????i v?? th???i th?????ng, k???t h???p c??ng card ????? h???a Intel Iris Plus Graphics ti??n ti???n. Ngo??i ra c??n ???????c trang b??? th??m c??ng ngh??? b???o m???t v??n tay si??u cao c???p, ????y ch??nh l?? d??ng m??y ???????c ????nh gi?? l?? v?? c??ng ph?? h???p v???i d??n v??n ph??ng mu???n c?? ???????c hi???u su???t cao.','Apple','Laptop Apple Macbook Pro 2018 13.3\" MR9U2 (13.3\"/Core i5/8GB/HD/macOS/1.4 kg)',41090000.00,50,'https://lh3.googleusercontent.com/qgVwPKOgCXFJjAO-HB7Su5OPg7sBv4pJj9hTJxdvuz7GlWzA4gVaIC19oasGWcjIUgbqwZBpH1_OkTjyj_M=w500-rw',1),(28,'','2022-01-07 12:03:51.257000',NULL,NULL,'','Laptop Acer Swift SF314 56 596E i5 (NX.H4CSV.006) l?? chi???c laptop h???c t???p v??n ph??ng v???i thi???t k??? sang tr???ng, hi???u n??ng l??m vi???c kh?? ????p ???ng nhu c???u h???c t???p v?? gi???i tr?? c???a m???i ng?????i.','Acer','Laptop Acer Swift 3 SF314-56-596E (NX.H4CSV.006) (i5-8265U) (B???c)',12940000.00,50,'https://lh3.googleusercontent.com/CEYIEVJGO1meaBNc2iEKb-ZTSbw1E5wfaLNUGZE3MrD7eB-vS3e-4luqrh8ZPvQ4buChJt7H4oV_Zoa7o9EVcTCJ9Ax2DR_l=w500-rw',1),(29,'','2022-01-07 12:05:27.519000',NULL,NULL,'','Acer Swift 5 SF514-53T-740R l?? d??ng m??y cao c???p acer thi???t k??? d??nh cho c??c doanh nh??n c???n m???t chi???c laptop m???ng nh???, thi???t k??? tinh t??? v?? sang tr???ng nh??ng v???n ????? m???nh m??? ????? th???c hi???n c??c t??c v??? t??? c?? b???n ?????n ph???c t???p,??p d???ng ng??n ng??? thi???t k??? ???gi???n l?????c l??m n??n t??nh sang tr???ng??? l?? xu h?????ng l??m n??n s???n ph???m n??y','Acer','Laptop Acer Swift 5 SF514-53T-740R (NX.H7KSV.002) (i7-8565U) (X??m)',9192000.00,50,'https://lh3.googleusercontent.com/0lxvvuZGMGV4cgfSjJrVXrN6_j_R1RBd0SrFnpUs0dog7Bq159BHNktmiwCsapK-bcxH86ejYGd1SjMQe9JTRNg8juOzxqQS=w500-rw',1),(30,'','2022-01-07 12:08:02.603000',NULL,NULL,'','aptop Acer Swift 5 SF514-55T-51NZ c?? v??? m??y ???????c l??m t??? h???p kim gi??p tr???ng l?????ng m??y ch??? 1.04kg. Khung m??y b???ng kim lo???i nguy??n kh???i v???i g??c c???nh ???????c gia c??ng t??? m??? v?? ch???c ch???n, ??em l???i s??? sang tr???ng t???i ??a cho ng?????i d??ng. Swift 5 m???i n??m nay ???????c n??ng c???p b???n l??? m???i, gi??p n??ng nh??? m??y l??n khi m??? m??n h??nh, cho ph??p tr???i nghi???m g?? v??n b???n ti???n d???ng h??n, kh??? n??ng t???n nhi???t t???t h??n v?? ????ng ch?? ?? nh???t l?? l??m m??n h??nh c???a m??y ???????c n???i b???t h??n.','Acer','Laptop Acer Swift 5 SF514-55T-51NZ (NX.HX9SV.002) (i5-1135G7) (V??ng)',47790000.00,50,'https://lh3.googleusercontent.com/S_7X9TEbHwbPE5W9_ygeTFvCgsHkFC8BbdGR_QLp5qm0e-x0GJlh-wwruQ2IV8RHNEQ3uFJwuRqUfgkSULU-6B9mLXSa7JkN=w500-rw',1),(31,'','2022-01-07 12:08:53.590000',NULL,NULL,'','Laptop Acer Gaming Aspire 7 A715 ???????c trang b??? ch??p x??? l?? AMD Ryzen 3000 series k???t h???p 8GB ho???c 16GB RAM DDR4 v?? card ????? ho??? r???i GeForce GTX1600 series gi??p chi???c laptop Acer x??? l?? m?????t c??c ???ng d???ng ????? ho???: photoshop, Ai,... B??n c???nh kh??? n??ng chi???n c??c game kh???ng ??? m???c t???t.','Acer','Laptop Acer Aspire 7 A715-41G-R282 (NH.Q8SSV.005) (AMD Ryzen 5 3550H) (??en) ',16641000.00,50,'https://lh3.googleusercontent.com/6oxfXnQB_zdzwxgF6vGRA8rq9YiPfFRRH9U8Ft-Dgz6harR8Q0Q46RH22ieLlu4LrOFd_tDX60V2OOwQCDcG4KKxRW3MN1E=w500-rw',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createddate` datetime(6) DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modifieddate` datetime(6) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,NULL,NULL,NULL,'ROLE_CUSTOMER','CUSTOMER'),(2,NULL,NULL,NULL,NULL,'ROLE_ADMIN','ADMIN'),(3,NULL,NULL,NULL,NULL,'ROLE_EMPLOYEE','EMPLOYEE');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-08 13:52:08
