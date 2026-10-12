-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2026 at 07:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wellnessbite`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_name` varchar(150) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `food_id` int(11) DEFAULT NULL,
  `food_name` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(50) NOT NULL,
  `status` enum('Pending','Confirmed','Preparing','Out for Delivery','Delivered','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_name`, `mobile`, `address`, `food_id`, `food_name`, `price`, `payment_method`, `status`, `created_at`) VALUES
(1, NULL, 'Mayur Nanjar', '9106143654', 'Lalpur', 1, 'Green Salad', 120.00, 'UPI', 'Delivered', '2026-09-12 07:01:59'),
(2, NULL, 'Dipi Pingal', '9825877077', 'Jamnagar', 4, 'Mango', 90.00, 'UPI', 'Delivered', '2026-09-12 07:02:54'),
(3, NULL, 'parshva', '1234567890', 'Patel colony', 10, 'Berry Smoothie', 140.00, 'UPI', 'Delivered', '2026-09-12 07:03:55'),
(4, NULL, 'priyank', '1111111111', 'Jamnagar', NULL, 'Veggie Bowl', 130.00, 'UPI', 'Delivered', '2026-09-12 07:04:26'),
(5, NULL, 'Bhumi', '2222222', 'Lalpur', NULL, 'Mixed Veg Soup', 100.00, 'UPI', 'Delivered', '2026-09-12 07:04:52'),
(6, NULL, 'Mayur Nanjar', '9106143654', 'Jamnagar', 8, 'Mango Smoothie', 120.00, 'UPI', 'Cancelled', '2026-09-25 15:07:16'),
(7, NULL, 'Khushi', '12234455667', 'Jamnagar', 28, 'Guava', 170.00, 'UPI', 'Delivered', '2026-09-25 15:26:17'),
(8, NULL, 'Priya', '2233445667', 'Patel Colony', 10, 'Apple Cinnamon Smoothie', 140.00, 'Cash on Delivery', 'Delivered', '2026-09-25 15:27:11'),
(9, NULL, 'Shradhdha', '122334456', 'Jamnagar', 55, 'Mushroom Soup', 145.00, 'Cash on Delivery', 'Delivered', '2026-09-25 15:28:21'),
(10, NULL, 'Kajal', '1928374656', 'Jaypur', NULL, 'Oats Meal', 120.00, 'UPI', 'Delivered', '2026-09-25 15:29:20'),
(11, NULL, 'Mayur Nanjar', '1111111111', 'lalpur', NULL, 'Veggie Bowl', 130.00, 'UPI', 'Delivered', '2026-09-30 15:00:25'),
(12, NULL, 'naresh', '1594891596', 'sadhna colony', 29, 'Watermelon', 180.00, 'Cash on Delivery', 'Delivered', '2026-10-07 09:09:55'),
(13, NULL, 'naresh', '1111111111', 'greencity', 29, 'Watermelon', 180.00, 'UPI', 'Delivered', '2026-10-07 09:11:42'),
(14, NULL, 'Mayur Nanjar', '9106143654', 'lalpur', NULL, 'Food', 0.00, 'UPI', 'Delivered', '2026-10-08 05:50:20'),
(15, NULL, 'Mayur Nanjar', '9825877077', 'Lalpur', 4, 'Mango', 90.00, 'UPI', 'Delivered', '2026-10-08 07:13:32'),
(16, NULL, 'Mayur Nanjar', '9825877077', 'Lalpur', 24, 'Strawberries', 300.00, 'Cash on Delivery', 'Delivered', '2026-10-08 07:13:58'),
(17, NULL, 'Mayur Nanjar', '9825877077', 'jcr', 35, 'Strawberry Banana Smoothie', 150.00, 'UPI', 'Delivered', '2026-10-08 07:21:30'),
(18, 7, 'yash kotecha', '1111111111', 'sadhana', NULL, 'paneer salad', 220.00, 'Cash on Delivery', 'Delivered', '2026-10-08 08:23:15'),
(19, 7, 'yash kotecha', '1111111111', 'sadhana', 8, 'Mango Smoothie', 120.00, 'Cash on Delivery', 'Delivered', '2026-10-08 08:25:28'),
(20, NULL, 'Mayur Nanjar', '9825877077', 'lalpur', NULL, 'Mixed Veg Soup', 100.00, 'UPI', 'Delivered', '2026-10-08 08:32:25'),
(21, NULL, 'Mayur Nanjar', '9106143654', 'JCR', 24, 'Strawberries', 300.00, 'Cash on Delivery', 'Delivered', '2026-10-08 09:08:57'),
(22, NULL, 'Mayur Nanjar', '9106143654', 'jamnagar', NULL, 'paneer salad', 550.00, 'Cash on Delivery', 'Delivered', '2026-10-08 13:15:23'),
(23, 8, 'dipu', '9106143654', 'jamnagar', 9, 'Banana Smoothie', 550.00, 'UPI', 'Delivered', '2026-10-08 14:21:09'),
(24, 8, 'dipu', '9106143654', 'sadhna', 1, 'Green Salad', 360.00, 'UPI', 'Delivered', '2026-10-08 15:39:32'),
(25, 8, 'dipu', '9106143654', 'jamnagar', 2, 'Greek Salad', 150.00, 'Cash on Delivery', 'Delivered', '2026-10-08 15:40:04'),
(26, 8, 'dipu', '9106143654', 'jamnagar', 32, 'Rainbow Salad', 150.00, 'UPI', 'Delivered', '2026-10-08 15:40:31'),
(27, 8, 'dipu', '9106143654', 'lalpur', 43, 'Dates Almond Smoothie', 150.00, 'UPI', 'Delivered', '2026-10-08 15:41:08'),
(28, 8, 'dipu', '9106143654', 'jamnagar', 24, 'Strawberries', 300.00, 'UPI', 'Delivered', '2026-10-08 16:15:31'),
(29, 8, 'dipu', '9106143654', 'JCR, Jamnagar', 6, 'Orange', 320.00, 'UPI', 'Delivered', '2026-10-09 04:00:40'),
(30, 9, 'Mayur Nanjar', '9106143654', 'sadhana', NULL, 'paneer salad', 550.00, 'UPI', 'Delivered', '2026-10-09 04:21:22'),
(31, NULL, 'Priyank Pingal', '1234567890', 'JCR', 74, 'Oats Meal', 360.00, 'UPI', 'Delivered', '2026-10-12 03:52:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `food_id` (`food_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
