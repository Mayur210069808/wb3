-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2026 at 07:43 AM
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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '$2y$10$LFfmWj29cluZPWZyj91e7uU4KNc3UX/SUNx/Yux50tnC3tMrM3eDu', '2026-09-12 06:30:07');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(20) DEFAULT '?️',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `created_at`) VALUES
(1, 'Salad', 'salad', '🥗', '2026-09-12 06:30:07'),
(2, 'Fruits', 'fruits', '🍎', '2026-09-12 06:30:07'),
(3, 'Smoothies', 'smoothies', '🥤', '2026-09-12 06:30:07'),
(4, 'Diet Meals', 'diet', '🥑', '2026-09-12 06:30:07'),
(5, 'Soups', 'soups', '🍲', '2026-09-12 06:30:07');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('active','blocked') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `password`, `status`, `created_at`) VALUES
(1, 'Mayur Nanjar', 'mayurnanjar01@gmail.com', '9106143654', '$2y$10$y4/AEwPLcTlNo5mm3zpagOv7HAwXHVZhlonJXSnYjZH/B79dUqjhe', 'active', '2026-09-12 06:38:33'),
(2, 'Dipi Pingal', 'dipi@gmail.com', '9825877077', '$2y$10$xIY29kBEVtcu/jedEOKj7u0MjthFbOAFF7fg3.MLAi4UsBnbEJVFi', 'active', '2026-09-12 07:12:53'),
(3, 'Priyank', 'Priyank@2025', '1111111111', '$2y$10$FgvTSTo7S7Z/5MBitrzbrOHqZnZ0lll1suy1rj6J7Vad76HPcrsWS', 'active', '2026-09-12 07:14:21'),
(4, 'Bhumi', 'Bhumi@2020', '2222222', '$2y$10$WtZ9usrtQyVa4dWE/cobGOXDteRzJIF9u4mMapnk5tZFJBgwZmACu', 'active', '2026-09-12 07:14:57'),
(5, 'parshva', 'parshva@2003', '1234567890', '$2y$10$4JngpHAOFNoShY/FSzvofeqSUYGKa6Rs4rMqq7adKu0162vIUg8pm', 'active', '2026-09-12 07:15:49'),
(6, 'Dipi Pingal', 'Dipi42@gmail.com', '9825877077', '$2y$10$wtztYT9o4acU3eCMNPolXOX1W6ZdKHKOluv.JudkGB11C3Z0gFA.i', 'active', '2026-09-26 00:16:07'),
(7, 'yash kotecha', 'yash2007@gmail.com', '1111111111', '$2y$10$0F3n1JDWDCu6IyqV7KDLM.IHqnRssIubihae.cdMJ4vnSq3QEdfbG', 'active', '2026-10-08 07:55:38'),
(8, 'dipu', 'dipu2007@gmail.com', '9106143654', '$2y$10$H1I54/3Eyw8uL67ULScT8OsZfbdJ86fLDW9oWykw8Q9BtKHaq.WTe', 'active', '2026-10-08 14:19:51'),
(9, 'Mayur Nanjar', 'mayurnanjar42@gmail.com', '9106143654', '$2y$10$8fzwi3VCRgH2u/3aWMyrY.WA26oYfSh8ooy8MjfbD6T5S4bLF5C8i', 'active', '2026-10-09 04:20:16'),
(10, 'Priyank Pingal', 'priyank22@gmail.com', '1234567890', '$2y$10$bzyEXFKkkmgU6gpM3S/.vu3oRukqb4NY2APhAAJwGdM0RX93WX11G', 'active', '2026-10-12 03:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(255) DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `image` varchar(255) DEFAULT '',
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `category_id`, `name`, `description`, `price`, `image`, `status`, `created_at`) VALUES
(1, 1, 'Green Salad', 'Fresh mixed green vegetable salad', 120.00, 'uploads/food_6ac9bb9e8b5d4.jpg', 'active', '2026-09-12 06:30:07'),
(2, 1, 'Greek Salad', 'Classic Greek salad with feta and olives', 150.00, 'uploads/food_6ac9bb86cf556.jpg', 'active', '2026-09-12 06:30:07'),
(3, 1, 'Fruit Salad', 'Seasonal fruit medley salad', 130.00, 'uploads/food_6ac9bb644faff.jpg', 'active', '2026-09-12 06:30:07'),
(4, 2, 'Mango', 'Fresh ripe mangoes', 90.00, 'uploads/food_6ac9bae1b8b6c.jpg', 'active', '2026-09-12 06:30:07'),
(5, 2, 'Banana', 'Fresh bananas, rich in potassium', 60.00, 'uploads/food_6aae0ee1f00c3.jpg', 'active', '2026-09-12 06:30:07'),
(6, 2, 'Orange', 'Juicy fresh oranges', 80.00, 'uploads/food_6aae0f02126c4.jpg', 'active', '2026-09-12 06:30:07'),
(7, 2, 'Papaya', 'Fresh cut papaya', 70.00, 'uploads/food_6ac9baa800e5f.jpg', 'active', '2026-09-12 06:30:07'),
(8, 3, 'Mango Smoothie', 'Creamy mango smoothie', 120.00, 'uploads/food_6ac9ba69a7520.jpg', 'active', '2026-09-12 06:30:07'),
(9, 3, 'Banana Smoothie', 'Banana smoothie with honey', 110.00, 'uploads/food_6ac9b9f8022d7.jpg', 'active', '2026-09-12 06:30:07'),
(10, 3, 'Apple Cinnamon Smoothie', 'Mixed berry smoothie', 140.00, 'uploads/food_6aae2716cdd2f.jpeg', 'active', '2026-09-12 06:30:07'),
(17, 1, 'Power Green Salad', '', 160.00, 'uploads/food_6aaa3e5edd390.jpg', 'active', '2026-09-16 06:59:42'),
(18, 1, 'Avocado Salad', '', 120.00, 'uploads/food_6aaa3f698b11a.jpg', 'active', '2026-09-16 07:04:09'),
(19, 1, 'Corn & Cucumber Salad', '', 170.00, 'uploads/food_6aaa3fa7afa47.jpg', 'active', '2026-09-16 07:05:11'),
(20, 1, 'Broccoli Salad', '', 200.00, 'uploads/food_6aaa3fe692b1c.jpg', 'active', '2026-09-16 07:06:14'),
(21, 1, 'Mexican Bean Salad', '', 150.00, 'uploads/food_6aaa402c67853.jpg', 'active', '2026-09-16 07:07:24'),
(22, 1, 'Tomato Cucumber Salad', '', 180.00, 'uploads/food_6aaa406a61fbd.jpg', 'active', '2026-09-16 07:08:26'),
(24, 2, 'Strawberries', '', 300.00, 'uploads/food_6aae1152c7b62.jpg', 'active', '2026-09-19 04:20:39'),
(25, 2, 'Coconut', '', 95.00, 'uploads/food_6aae0de756443.jpg', 'active', '2026-09-19 04:21:59'),
(26, 2, 'Cherry', '', 160.00, 'uploads/food_6aae0e0ede896.jpg', 'active', '2026-09-19 04:22:38'),
(27, 2, 'Blackberry', '', 120.00, 'uploads/food_6aae0e3c1c6fe.jpg', 'active', '2026-09-19 04:23:24'),
(28, 2, 'Guava', '', 170.00, 'uploads/food_6aae0e66c3464.jpg', 'active', '2026-09-19 04:24:06'),
(29, 2, 'Watermelon', '', 180.00, 'uploads/food_6aae0e928d5a7.jpg', 'active', '2026-09-19 04:24:50'),
(30, 2, 'Dragon Fruit', '', 450.00, 'uploads/food_6aae10ae45ec0.jpeg', 'active', '2026-09-19 04:33:50'),
(31, 2, 'Kiwi', '', 140.00, 'uploads/food_6aae111c4aa54.jpeg', 'active', '2026-09-19 04:35:40'),
(32, 1, 'Rainbow Salad', '', 150.00, 'uploads/food_6aae11d320539.jpeg', 'active', '2026-09-19 04:38:43'),
(33, 1, 'Healthy Protein Salad', '', 180.00, 'uploads/food_6aae12ad6c97a.jpeg', 'active', '2026-09-19 04:42:21'),
(35, 3, 'Strawberry Banana Smoothie', '', 150.00, 'uploads/food_6aae14281d840.jpeg', 'active', '2026-09-19 04:48:40'),
(36, 3, 'Blueberry Smoothie', '', 135.00, 'uploads/food_6aae1474821ff.jpeg', 'active', '2026-09-19 04:49:56'),
(37, 3, 'Strawberry Smoothie', '', 125.00, 'uploads/food_6aae14f525649.jpeg', 'active', '2026-09-19 04:52:05'),
(38, 3, 'Banana Oat Smoothie', '', 220.00, 'uploads/food_6aae157cc97d0.jpeg', 'active', '2026-09-19 04:54:20'),
(39, 3, 'Chocolate Banana Smoothie', '', 130.00, 'uploads/food_6aae15fb376c0.jpeg', 'active', '2026-09-19 04:56:27'),
(40, 3, 'Beetroot Berry Smoothie', '', 122.00, 'uploads/food_6aae16480edad.jpeg', 'active', '2026-09-19 04:57:44'),
(41, 3, 'Dry Fruit Smoothie', '', 300.00, 'uploads/food_6aae2558b3048.jpeg', 'active', '2026-09-19 06:02:00'),
(42, 3, 'Pineapple Ginger Smoothie', '', 110.00, 'uploads/food_6aae25d0769b5.jpeg', 'active', '2026-09-19 06:04:00'),
(43, 3, 'Dates Almond Smoothie', '', 150.00, 'uploads/food_6aae264f40335.jpeg', 'active', '2026-09-19 06:06:07'),
(44, 4, 'Paneer & Salad Bowl', '', 125.00, 'uploads/food_6aae27dd1b04b.jpeg', 'active', '2026-09-19 06:12:45'),
(45, 4, 'Oats Vegetable Khichdi', '', 155.00, 'uploads/food_6aae286bf1c4b.jpeg', 'active', '2026-09-19 06:15:07'),
(46, 4, 'Vegetable Upma', '', 125.00, 'uploads/food_6aae28cb82a18.jpeg', 'active', '2026-09-19 06:16:43'),
(47, 4, 'Moong Dal Chilla', '', 120.00, 'uploads/food_6aae2979eaa0f.jpeg', 'active', '2026-09-19 06:18:13'),
(48, 4, 'Grilled Paneer Bowl', '', 200.00, 'uploads/food_6aae2a070cda4.jpeg', 'active', '2026-09-19 06:21:59'),
(49, 4, 'Veggie Quinoa Bowl', '', 175.00, 'uploads/food_6aae2a6cbe698.jpeg', 'active', '2026-09-19 06:23:40'),
(50, 4, 'Dal & Brown Rice', '', 130.00, 'uploads/food_6aae2adb5f654.jpeg', 'active', '2026-09-19 06:25:31'),
(51, 4, 'Vegetable Dalia', '', 135.00, 'uploads/food_6aae2b5317c09.jpeg', 'active', '2026-09-19 06:27:31'),
(52, 4, 'Multigrain Roti & Sabzi', '', 125.00, 'uploads/food_6aae2ba05fd25.jpeg', 'active', '2026-09-19 06:28:48'),
(53, 5, 'Broccoli Soup', '', 120.00, 'uploads/food_6aae2c5c676b3.jpeg', 'active', '2026-09-19 06:31:56'),
(54, 5, 'Carrot Soup', '', 125.00, 'uploads/food_6aae2c926fb1f.jpeg', 'active', '2026-09-19 06:32:50'),
(55, 5, 'Mushroom Soup', '', 145.00, 'uploads/food_6aae2d2f32fa0.jpeg', 'active', '2026-09-19 06:35:27'),
(56, 5, 'Beetroot Soup', '', 155.00, 'uploads/food_6aae2d62a98a4.jpeg', 'active', '2026-09-19 06:36:18'),
(57, 5, 'Sweet Potato Soup', '', 155.00, 'uploads/food_6aae2dc41a600.jpeg', 'active', '2026-09-19 06:37:56'),
(58, 5, 'Broccoli & Spinach Soup', '', 145.00, 'uploads/food_6aae2e0a5d66e.jpeg', 'active', '2026-09-19 06:39:06'),
(60, 4, 'Oats Vegetable Khichdi', '', 144.00, 'uploads/food_6ab7431b5cc0b.jpeg', 'active', '2026-09-19 06:47:05'),
(61, 1, 'Paneer Salad', '', 180.00, 'uploads/food_6ab741ea2b12b.jpg', 'active', '2026-09-19 06:48:15'),
(63, 5, 'Sweet Corn Soup', '', 100.00, 'uploads/food_6ac9bc1f6f359.jpg', 'active', '2026-10-10 03:56:25'),
(64, 5, 'Tomato Soup', '', 90.00, 'uploads/food_6ac9b865106a8.jpg', 'active', '2026-10-10 03:57:31'),
(65, 5, 'Mixed Veg Soup', '', 100.00, 'uploads/food_6ac9b7e2e6f11.jpg', 'active', '2026-10-10 03:58:26'),
(66, 4, 'Oats Meal', '', 120.00, 'uploads/food_6ac9b925d2d6b.jpg', 'active', '2026-10-10 04:03:49'),
(67, 4, 'Sprouts Bowl', '', 110.00, 'uploads/food_6ac9b97ef0c00.jpg', 'active', '2026-10-10 04:05:18'),
(68, 5, 'Corn & Vegetable Soup', '', 140.00, 'uploads/food_6ac9bc8f091da.jpeg', 'active', '2026-10-10 04:18:23'),
(69, 5, 'Bean & Tomato Soup', '', 144.00, 'uploads/food_6ac9bce6ad20d.jpeg', 'active', '2026-10-10 04:19:50'),
(71, 5, 'Ginger Vegetable Soup', '', 170.00, 'uploads/food_6ac9bda6ebd8e.jpeg', 'active', '2026-10-10 04:23:02'),
(72, 1, 'Paneer Salad', '', 180.00, 'uploads/food_6ac9bfbdf35b5.jpg', 'active', '2026-10-10 04:31:57'),
(73, 3, 'Dates Almond Smoothie', '', 150.00, 'uploads/food_6ac9c013cf1d7.jpeg', 'active', '2026-10-10 04:33:23'),
(74, 4, 'Oats Meal', '', 120.00, 'uploads/food_6ac9c0c18a947.jpg', 'active', '2026-10-10 04:36:17');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT '',
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `title`, `code`, `discount_percent`, `description`, `valid_from`, `valid_to`, `status`, `created_at`) VALUES
(1, 'Welcome Offer', 'WELCOME10', 10, 'Get 10% off on your first order', '2026-09-12', '2026-11-11', 'inactive', '2026-09-12 06:30:07'),
(2, 'Weekend Special', 'WEEKEND20', 20, '20% off every weekend', '2026-09-12', '2026-12-11', 'inactive', '2026-09-12 06:30:07'),
(3, 'Navratri Special Offer', 'NAVRATRI20', 20, 'Get 20% OFF on selected healthy food items and smooothies during Navratri.', '2026-10-01', '2026-10-20', 'inactive', '2026-09-27 13:48:34');

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

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `method` varchar(50) NOT NULL,
  `status` enum('Pending','Paid','Failed','Refunded') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `amount`, `method`, `status`, `created_at`) VALUES
(1, 1, 120.00, 'UPI', 'Paid', '2026-09-12 07:01:59'),
(2, 2, 90.00, 'UPI', 'Paid', '2026-09-12 07:02:54'),
(3, 3, 140.00, 'UPI', 'Paid', '2026-09-12 07:03:55'),
(4, 4, 130.00, 'UPI', 'Paid', '2026-09-12 07:04:26'),
(5, 5, 100.00, 'UPI', 'Paid', '2026-09-12 07:04:52'),
(6, 6, 120.00, 'UPI', 'Paid', '2026-09-25 15:07:16'),
(7, 7, 170.00, 'UPI', 'Paid', '2026-09-25 15:26:17'),
(8, 8, 140.00, 'Cash on Delivery', 'Paid', '2026-09-25 15:27:11'),
(9, 9, 145.00, 'Cash on Delivery', 'Paid', '2026-09-25 15:28:21'),
(10, 10, 120.00, 'UPI', 'Paid', '2026-09-25 15:29:20'),
(11, 11, 130.00, 'UPI', 'Paid', '2026-09-30 15:00:25'),
(12, 12, 180.00, 'Cash on Delivery', 'Paid', '2026-10-07 09:09:55'),
(13, 13, 180.00, 'UPI', 'Paid', '2026-10-07 09:11:42'),
(14, 14, 0.00, 'UPI', 'Paid', '2026-10-08 05:50:20'),
(15, 15, 90.00, 'UPI', 'Paid', '2026-10-08 07:13:32'),
(16, 16, 300.00, 'Cash on Delivery', 'Paid', '2026-10-08 07:13:58'),
(17, 17, 150.00, 'UPI', 'Paid', '2026-10-08 07:21:30'),
(18, 18, 220.00, 'Cash on Delivery', 'Paid', '2026-10-08 08:23:15'),
(19, 19, 120.00, 'Cash on Delivery', 'Paid', '2026-10-08 08:25:28'),
(20, 20, 100.00, 'UPI', 'Paid', '2026-10-08 08:32:25'),
(21, 21, 300.00, 'Cash on Delivery', 'Paid', '2026-10-08 09:08:57'),
(22, 22, 550.00, 'Cash on Delivery', 'Paid', '2026-10-08 13:15:23'),
(23, 23, 550.00, 'UPI', 'Paid', '2026-10-08 14:21:09'),
(24, 24, 360.00, 'UPI', 'Paid', '2026-10-08 15:39:32'),
(25, 25, 150.00, 'Cash on Delivery', 'Paid', '2026-10-08 15:40:04'),
(26, 26, 150.00, 'UPI', 'Paid', '2026-10-08 15:40:31'),
(27, 27, 150.00, 'UPI', 'Paid', '2026-10-08 15:41:08'),
(28, 28, 300.00, 'UPI', 'Paid', '2026-10-08 16:15:31'),
(29, 29, 320.00, 'UPI', 'Paid', '2026-10-09 04:00:40'),
(30, 30, 550.00, 'UPI', 'Paid', '2026-10-09 04:21:22'),
(31, 31, 360.00, 'UPI', 'Paid', '2026-10-12 03:52:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
