-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2019 at 02:49 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `title`) VALUES
(1, 'Goodnight Moon'),
(2, 'Web Programming II'),
(3, 'Million'),
(4, 'Database II'),
(5, 'Madeline'),
(6, 'Trump'),
(7, 'The Rainbow Fish'),
(8, 'Microprocessors'),
(9, 'Bankrupt'),
(10, 'Hardware'),
(11, 'Mickey Mouse '),
(12, 'Elements of Computing'),
(13, 'The Billion '),
(14, 'Algorithms'),
(15, 'Petter Rabbit'),
(16, 'Investor'),
(17, 'Peter and Wendy'),
(18, 'Hackers'),
(19, 'The Best Seller'),
(20, 'Python');

-- --------------------------------------------------------

--
-- Table structure for table `book_author`
--

CREATE TABLE `book_author` (
  `book` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_author`
--

INSERT INTO `book_author` (`book`, `author`) VALUES
(1, 'Mark'),
(2, 'Jose'),
(3, 'Andres'),
(4, 'Anderson'),
(5, 'Ludwig'),
(6, 'Bemelmans'),
(7, 'Mark'),
(8, 'Mark'),
(9, 'Mark'),
(10, 'Mark'),
(11, 'Disney'),
(12, 'Albert'),
(13, 'Smith'),
(14, 'Sastry'),
(15, 'Joe'),
(16, 'Jonathan'),
(17, 'Ferdinand'),
(18, 'Jintong'),
(19, 'Gaudier'),
(20, 'McCornick');

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `book` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`book`, `category`) VALUES
(1, 'Children'),
(2, 'Computers'),
(3, 'Finance'),
(4, 'Computers'),
(5, 'Children'),
(6, 'Finance'),
(7, 'Children'),
(8, 'Computers'),
(9, 'Finance'),
(10, 'Computers'),
(11, 'Children'),
(12, 'Computers'),
(13, 'Finance'),
(14, 'Computers'),
(15, 'Children'),
(16, 'Finance'),
(17, 'Children'),
(18, 'Computers'),
(19, 'Finance'),
(20, 'Computers');

-- --------------------------------------------------------

--
-- Table structure for table `book_price`
--

CREATE TABLE `book_price` (
  `book` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_price`
--

INSERT INTO `book_price` (`book`, `price`) VALUES
(1, '22.43'),
(2, '122.43'),
(3, '99.99'),
(4, '272.43'),
(5, '22.43'),
(6, '22.43'),
(7, '14.88'),
(8, '234.99'),
(9, '300.00'),
(10, '40.95'),
(11, '15.95'),
(12, '222.43'),
(13, '44.99'),
(14, '200.00'),
(15, '22.43'),
(16, '134.60'),
(17, '16.97'),
(18, '300.99'),
(19, '85.00'),
(20, '60.90');

-- --------------------------------------------------------

--
-- Table structure for table `book_year`
--

CREATE TABLE `book_year` (
  `book` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_year`
--

INSERT INTO `book_year` (`book`, `year`) VALUES
(1, 1999),
(2, 1998),
(3, 2003),
(4, 2002),
(5, 1998),
(6, 2005),
(7, 1989),
(8, 2004),
(9, 2013),
(10, 1996),
(11, 2005),
(12, 2009),
(13, 2004),
(14, 1992),
(15, 2007),
(16, 2006),
(17, 1970),
(18, 207),
(19, 2017),
(20, 2016);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Children'),
(2, 'Computers'),
(3, 'Finance');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_author`
--
ALTER TABLE `book_author`
  ADD KEY `book_author` (`book`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD KEY `book_category` (`book`);

--
-- Indexes for table `book_price`
--
ALTER TABLE `book_price`
  ADD UNIQUE KEY `book` (`book`);

--
-- Indexes for table `book_year`
--
ALTER TABLE `book_year`
  ADD UNIQUE KEY `book` (`book`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `book_price`
--
ALTER TABLE `book_price`
  ADD CONSTRAINT `book_price` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `book_year`
--
ALTER TABLE `book_year`
  ADD CONSTRAINT `book_year` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
