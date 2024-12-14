-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2024 at 10:15 PM
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
-- Database: `catalogo`
--

-- --------------------------------------------------------

--
-- Table structure for table `lista`
--

CREATE TABLE `lista` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lista`
--

INSERT INTO `lista` (`id`, `nombre`, `descripcion`, `precio`, `imagen`) VALUES
(1, 'Cafe', '500 gramos', 5000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Roasted_coffee_beans.jpg/1200px-Roasted_coffee_beans.jpg'),
(3, 'Yogurt Griego', '250ml', 25000, 'https://vaquitaexpress.com.co/media/catalog/product/cache/e89ece728e3939ca368b457071d3c0be/7/7/7702001163946_23.jpg'),
(4, 'Arepas', 'con mucho queso ', 6000, 'https://vecinavegetariana.com/wp-content/uploads/2021/09/20210915_150420_edited-1-1.jpeg'),
(5, 'Leche de Vaca', 'Alpina entera 1000ml', 7000, 'https://jumbocolombiaio.vtexassets.com/arquivos/ids/192885/7702001041404-leche-entera-bolsa-1100ml.jpg?v=637814022532630000'),
(6, 'Aceite de Oliva', 'Extra Virgen 1000ml ', 160000, 'https://exitocol.vtexassets.com/arquivos/ids/25724015-800-auto?v=638695406138070000&width=400&height=auto&aspect=true'),
(7, 'Jamon Serrano', '400 gramos', 48000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScEIz3IMfd_ocKguWBGKFjW18Eiyntyj34Sw&s');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lista`
--
ALTER TABLE `lista`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lista`
--
ALTER TABLE `lista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
