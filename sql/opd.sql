-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2023 at 03:13 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opd`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(30, 'ICE CREAM', 'Indulge in our classic flavors like Vanilla, Chocolate, Strawberry, Ube, and many more! Each spoonful is a burst of pure bliss, delivering rich and smooth flavors that will transport you to ice cream paradise.', '2023-06-29 03:11:22'),
(31, 'Pinoy Street Foods', 'Immerse yourself in the rich and vibrant flavors of traditional Filipino street delicacies that are sure to tantalize your taste buds. From the savory goodness of sizzling pork skewers known as \"Isaw\" to the crispy and addictive \"Fish Balls\" drenched in a tangy sauce, our menu offers a delectable assortment of beloved Filipino street foods.', '2023-06-29 05:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contactId`, `userId`, `email`, `phoneNo`, `orderId`, `message`, `time`) VALUES
(5, 14, 'keyanandydelgado@gmail.com', 9280693642, 0, 'HELLO, POGI!', '2023-06-28 18:47:04'),
(6, 15, 'keyanandydelgado@gmail.com', 9280693642, 2, 'GUSTO KO PUNG MAG PATULONG KASI HINDI COMPLETE ANG AKING DELIVERY', '2023-06-29 09:03:01');

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactreply`
--

INSERT INTO `contactreply` (`id`, `contactId`, `userId`, `message`, `datetime`) VALUES
(3, 6, 15, 'ay sorry po ,kasi nag crashing kasi yung airoplano namin HUUHUHU\r\n', '2023-06-29 09:08:08');

-- --------------------------------------------------------

--
-- Table structure for table `delivereditems`
--

CREATE TABLE `delivereditems` (
  `id` int(11) NOT NULL,
  `orderId` int(21) DEFAULT NULL,
  `userId` int(21) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `itemdetails` varchar(255) NOT NULL,
  `amount` int(100) NOT NULL,
  `paymentMode` varchar(255) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivereditems`
--

INSERT INTO `delivereditems` (`id`, `orderId`, `userId`, `username`, `firstName`, `lastName`, `itemQuantity`, `itemdetails`, `amount`, `paymentMode`, `orderDate`, `delivery_date`, `itemId`) VALUES
(210, 181, 1, '', 'pogi ko', 'ko', 1, '1 Ube (Purple Yam), 1 Keso Ice Crean, ', 60, 'Cash on Delivery', '2023-06-29', '2023-06-29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliverydetails`
--

INSERT INTO `deliverydetails` (`id`, `orderId`, `deliveryBoyName`, `deliveryBoyPhoneNo`, `deliveryTime`, `dateTime`) VALUES
(7, 22, 'Keyan', 926240842, 10, '2023-06-19 15:43:11'),
(8, 30, 'keyan', 9280693642, 5, '2023-06-19 21:36:58'),
(9, 77, 'Juneil', 928069364, 10, '2023-06-22 10:43:10'),
(10, 177, 'Keyan Andy Delgado', 9280693642, 10, '2023-06-29 03:40:40'),
(11, 179, 'keyan', 9280693642, 12, '2023-06-29 09:06:36'),
(12, 181, 'nico', 9280693642, 12, '2023-06-29 13:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `itemId` int(11) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `itemPrice` int(11) NOT NULL,
  `itemDesc` varchar(255) NOT NULL,
  `itemCategoryId` int(11) NOT NULL,
  `itemPubDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemId`, `itemName`, `itemPrice`, `itemDesc`, `itemCategoryId`, `itemPubDate`) VALUES
(6, 'Ube (Purple Yam)', 30, 'Homemade Ube Ice Cream Made by Love', 30, '2023-06-29 03:12:08'),
(7, 'Keso Ice Crean', 30, 'Homemade Keso Ice Cream Made by Love', 30, '2023-06-29 05:06:51'),
(8, 'Mango Ice Cream', 30, 'Homemade Mango Ice Cream Made by Love', 30, '2023-06-29 05:08:29'),
(9, 'Strawberry Ice Cream', 50, 'Homemade Strawberry Ice Cream Made by Love', 30, '2023-06-29 05:10:09'),
(10, 'Buko Pandan Ice Cream', 30, 'Homemade Buko Pandan Ice Cream Made by Love', 30, '2023-06-29 05:11:01'),
(11, 'Balut', 20, 'UNANG HIGOP IKAY MAPAPA WOW', 31, '2023-06-29 05:17:23');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `itemId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `itemId`, `itemQuantity`) VALUES
(187, 174, 3, 3),
(188, 174, 4, 2),
(189, 175, 4, 2),
(190, 176, 5, 1),
(191, 177, 6, 2),
(192, 178, 6, 1),
(193, 179, 7, 1),
(194, 180, 6, 1),
(195, 181, 6, 1),
(196, 181, 7, 1),
(197, 182, 6, 1),
(198, 183, 11, 1),
(199, 184, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(182, 1, 'Purok Sampaguita Block 1, ', 9509, 9280693642, 30, '0', '0', '2023-06-30 10:35:40'),
(184, 1, 'Purok Sampaguita Block 1, ', 9509, 9280693642, 30, '0', '0', '2023-06-30 10:49:14');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviewId` int(12) NOT NULL,
  `username` varchar(21) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `rating` int(1) NOT NULL,
  `review` text NOT NULL,
  `reviewDate` datetime NOT NULL DEFAULT current_timestamp(),
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviewId`, `username`, `rating`, `review`, `reviewDate`, `userId`) VALUES
(88, 'admin', 5, '5 star kasi pogi ako', '2023-06-29 10:36:57', 1),
(89, 'admin', 5, 'VERY GOOD SHIT', '2023-06-30 10:59:43', 1),
(90, 'keyanpogi', 5, 'wow ang ganda ng delivery', '2023-11-14 10:10:10', 16);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `orderId`, `amount`, `created_at`) VALUES
(169, 181, 60.00, '2023-06-29 05:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'Bings Scoops & Bites', 'keyanandydelgado@gmail.com', 2515469442, 6304468851, 'Prk Sta Cecila<br> Sto Nino South Cotabato', '2021-03-23 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'pogi ko', 'ko', 'admin@gmail.com', 1111111111, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2021-04-11 11:40:58'),
(14, '2ez4KEyan', 'Keyan Andy', 'Delgado', 'keyanandydelgado@gmail.com', 92806936242, '0', '$2y$10$Qvq5ISnJuaaxAVgnMZHJU.0EMmGr578nwnSflYHWnupiPhIGPC1k6', '2023-06-28 18:07:24'),
(15, 'ADMIN12', 'NICA', 'FOTULAN', 'marotabdul@gmail.com', 9265423231, '0', '$2y$10$dCrDd//DkQFos0ly5rGsYumlckiFBlfKH3xY6rXWuDQUTtACYtePC', '2023-06-29 08:55:30'),
(16, 'keyanpogi', 'Keyan Andy', 'Delgado', 'keyanandydelgado@gmail.com', 9262408442, '0', '$2y$10$5FhBqi3PSVkcXKFL7MBOKev44Rxu5ZaSVHIC51lvWt73CPIatqkIG', '2023-11-14 10:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivereditems`
--
ALTER TABLE `delivereditems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemId`);
ALTER TABLE `items` ADD FULLTEXT KEY `itemName` (`itemName`,`itemDesc`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviewId`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivereditems`
--
ALTER TABLE `delivereditems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviewId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
