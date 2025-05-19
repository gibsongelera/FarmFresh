-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2025 at 05:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vegetable`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(15) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_desc` varchar(255) NOT NULL,
  `price` int(10) NOT NULL,
  `units` int(5) NOT NULL,
  `total` int(15) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_code`, `product_name`, `product_desc`, `price`, `units`, `total`, `date`, `email`) VALUES
(14, 'POTATO', 'Potato', ' If you eat potatoes regularly, you ensure a good supply of water and ions in your body. This is because they are rich in potassium. The concentration is highest in the skin of the vegetable and just beneath it. ', 20, 1, 20, '2019-11-07 05:34:11', 'user@email.com'),
(13, 'POTATO', 'Potato', ' If you eat potatoes regularly, you ensure a good supply of water and ions in your body. This is because they are rich in potassium. The concentration is highest in the skin of the vegetable and just beneath it. ', 20, 1, 20, '2019-11-03 04:18:22', 'billgates@gmail.com'),
(15, 'POTATO', 'Potato', ' If you eat potatoes regularly, you ensure a good supply of water and ions in your body. This is because they are rich in potassium. The concentration is highest in the skin of the vegetable and just beneath it. ', 20, 1, 20, '2019-11-07 06:42:54', 'user@email.com'),
(16, 'POTATO', 'Potato', ' If you eat potatoes regularly, you ensure a good supply of water and ions in your body. This is because they are rich in potassium. The concentration is highest in the skin of the vegetable and just beneath it. ', 20, 1, 20, '2025-05-18 03:32:14', 'gibsongelera@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_code` varchar(60) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_desc` tinytext NOT NULL,
  `product_img_name` varchar(60) NOT NULL,
  `qty` int(5) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_desc`, `product_img_name`, `qty`, `price`) VALUES
(1, 'TOMATO', 'Tomato', 'The health benefits of tomatoes are many and include eye care, good stomach health, and reduced blood pressure. They may provide relief from skin problems, and urinary tract infections, and may reduce the risk of diabetes, too.', 'tomato.jpg', 157, 50.00),
(2, 'POTATO', 'Potato', ' If you eat potatoes regularly, you ensure a good supply of water and ions in your body. This is because they are rich in potassium. The concentration is highest in the skin of the vegetable and just beneath it. ', 'potato.jpg', 1, 20.00),
(3, 'LADYFINGER', 'Lady Finger', 'Lady fingers has great effect to lowering blood sugar level into normal level. It\'s fiber also assures an easy passage out of waste from the body. It contain high fiber which is excellent to feed the good bacteria or probiotics in gut.', 'lady_finger.jpeg', 34, 75.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pin` int(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(15) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `address`, `city`, `pin`, `email`, `password`, `type`) VALUES
(1, 'Elham', 'Alvarez', 'Zamboanga', 'Zamboanga City', 95014, 'elham@gmail.com', 'elham', 'user'),
(2, 'Admin', 'Webmaster', 'Internet', 'Electricity', 101010, 'admin@admin.com', 'admin', 'admin'),
(5, 'first', 'Last', 'Adress', 'City', 93284, 'email@email.com', 'password', 'user'),
(6, 'gibson', 'gelera', 'Zamboanga', 'Zamboanga City', 70021, 'gibsongelera@hotmail.com', '123456', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`product_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
