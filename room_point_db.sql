-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2023 at 09:34 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `room_point_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `room_address_tbl`
--

CREATE TABLE `room_address_tbl` (
  `address_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `appartment_house` varchar(100) NOT NULL,
  `landmark` varchar(200) NOT NULL,
  `area` varchar(100) NOT NULL,
  `city_village` varchar(100) NOT NULL,
  `dist` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `pincode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_address_tbl`
--

INSERT INTO `room_address_tbl` (`address_id`, `room_id`, `appartment_house`, `landmark`, `area`, `city_village`, `dist`, `state`, `country`, `pincode`) VALUES
(1, 1, 'Gokuldham', 'Ganesh Chouk', 'Bolhegoan', 'Ahmednagar', 'Ahmed Nagar', 'Maharashtra', 'India', '414111'),
(2, 8, 'Govind Niwas', 'Ganesh Chouk', 'Bolhegoan', 'Ahmednagar', 'Ahmed Nagar', 'Maharashtra', 'India', '414111'),
(3, 9, 'vrundavan sadan', 'Ganesh Chouk', 'Bolhegoan', 'Ahmednagar', 'Ahmed Nagar', 'Maharashtra', 'India', '413204'),
(4, 10, 'vrundavan sadan', 'Ganesh Chouk', 'Savedi', 'Ahmednagar', 'Ahmed Nagar', 'Maharashtra', 'India', '414111');

-- --------------------------------------------------------

--
-- Table structure for table `room_condition_tbl`
--

CREATE TABLE `room_condition_tbl` (
  `condition_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `no_smoking` varchar(10) NOT NULL,
  `no_drinking` varchar(10) NOT NULL,
  `no_pets` varchar(10) NOT NULL,
  `vegetarian` varchar(10) NOT NULL,
  `no_visitors` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_condition_tbl`
--

INSERT INTO `room_condition_tbl` (`condition_id`, `room_id`, `no_smoking`, `no_drinking`, `no_pets`, `vegetarian`, `no_visitors`) VALUES
(1, 1, 'yes', 'yes', 'yes', 'no', 'no'),
(8, 8, 'yes', 'yes', 'yes', 'no', 'no'),
(9, 9, 'yes', 'yes', 'no', 'no', 'no'),
(10, 10, 'no', 'no', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `room_img_tbl`
--

CREATE TABLE `room_img_tbl` (
  `img_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `img1` text NOT NULL,
  `img2` text NOT NULL,
  `img3` text NOT NULL,
  `img4` text NOT NULL,
  `img5` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_img_tbl`
--

INSERT INTO `room_img_tbl` (`img_id`, `room_id`, `img1`, `img2`, `img3`, `img4`, `img5`) VALUES
(1, 1, 'room1.jpeg', 'room2.webp', '0', '0', '0'),
(19, 8, 'room4.webp', 'room4.webp', '0', '0', '0'),
(20, 9, 'room2.webp', '0', '0', '0', '0'),
(21, 10, 'room2.webp', '0', '0', '0', '0'),
(22, 0, 'room4.webp', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `room_tbl`
--

CREATE TABLE `room_tbl` (
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_type` varchar(100) NOT NULL,
  `property_type` varchar(100) NOT NULL,
  `rent` int(11) NOT NULL,
  `deposit` int(11) NOT NULL,
  `electricity` int(11) NOT NULL,
  `available_from` varchar(20) NOT NULL,
  `posted_on` varchar(20) NOT NULL,
  `current_occupancy` int(11) NOT NULL,
  `available_occupancy` int(11) NOT NULL,
  `preference` varchar(15) NOT NULL,
  `owner_mobile` varchar(13) NOT NULL,
  `room_desc` text NOT NULL,
  `available_now` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_tbl`
--

INSERT INTO `room_tbl` (`room_id`, `user_id`, `room_type`, `property_type`, `rent`, `deposit`, `electricity`, `available_from`, `posted_on`, `current_occupancy`, `available_occupancy`, `preference`, `owner_mobile`, `room_desc`, `available_now`) VALUES
(1, 1, 'private', 'Independent House', 2000, 1500, 8, '2023-03-25', '', 0, 0, 'Family', 'undefined', '', 'yes'),
(8, 1, 'private', 'Flat', 2000, 2000, 7, '2023-03-23', '', 0, 0, 'Family', 'undefined', '', 'yes'),
(9, 1, 'private', 'Flat', 2000, 1000, 12, '2023-03-21', '', 0, 0, 'Family', 'undefined', 'only family', 'yes'),
(10, 0, 'private', 'Flat', 1000, 1000, 0, '2023-03-24', '', 0, 0, 'Family', 'undefined', '', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(300) NOT NULL,
  `user_mobile` varchar(13) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_tbl`
--

INSERT INTO `user_tbl` (`user_id`, `user_name`, `user_mobile`, `user_email`, `user_password`) VALUES
(1, 'Avinash Mane', '7057496577', 'avinash@gmail.com', 'avi512'),
(2, 'Raj Mane', '7588937945', 'raj@gamail.com', 'raj512');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `room_address_tbl`
--
ALTER TABLE `room_address_tbl`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `room_condition_tbl`
--
ALTER TABLE `room_condition_tbl`
  ADD PRIMARY KEY (`condition_id`);

--
-- Indexes for table `room_img_tbl`
--
ALTER TABLE `room_img_tbl`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `room_tbl`
--
ALTER TABLE `room_tbl`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `room_address_tbl`
--
ALTER TABLE `room_address_tbl`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `room_condition_tbl`
--
ALTER TABLE `room_condition_tbl`
  MODIFY `condition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `room_img_tbl`
--
ALTER TABLE `room_img_tbl`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `room_tbl`
--
ALTER TABLE `room_tbl`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
