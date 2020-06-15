-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2020 at 07:00 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `Car_No` int(4) NOT NULL,
  `Car_Type` varchar(20) NOT NULL,
  `Car_Color` varchar(10) NOT NULL,
  `Driver_FK` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`Car_No`, `Car_Type`, `Car_Color`, `Driver_FK`) VALUES
(122, 'Hyundai', 'Sliver', 2011467831),
(159, 'Toyota', 'Red', 2015144912),
(464, 'Hyundai', 'Sliver', 2015144912),
(542, 'Hyundai', 'Sliver', 2018246159),
(3248, 'Ford', 'Yellow', 2016159757),
(3497, 'Bugatti', 'Gray', 2018246159),
(9456, 'Chevrolet', 'Red', 2016247831);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `Customer_Name` varchar(80) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Reservation_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `Customer_Name`, `Phone`, `Email`, `Reservation_FK`) VALUES
(1, 'Kamal', '01001248677', 'Kamal@gmail.com', 1),
(2, 'Gaber', '1005468478', 'Gaber@gmail.com', 2),
(3, 'Fathalla', '1008971246', 'Fathalla@gmail.com', 3),
(4, 'Khaled', '1215975346', 'Khaled@gmail.com', 4),
(5, 'Said', '1214679121', 'Said@gmail.com', 5),
(6, 'Loay', '1134791534', 'Loay@gmail.com', 6),
(7, 'Pasem', '1064741355', 'Pasem@gmail.com', 7);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `Driver_Name` varchar(80) NOT NULL,
  `License_No` int(10) NOT NULL,
  `Age` int(3) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Address` varchar(70) NOT NULL,
  `Book_Fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`Driver_Name`, `License_No`, `Age`, `Phone`, `Address`, `Book_Fk`) VALUES
('Yassen', 2011467831, 33, '1501476314', 'Alex,October', 1),
('Khamis', 2014684379, 32, '1264971348', 'MarsaMatroh', 7),
('Ahmed', 2015144912, 30, '1559782176', 'Alex,SedeGaber', 2),
('Fares', 2016159757, 31, '1546231789', 'Alex,Manshia', 6),
('Mostafa ', 2016247831, 37, '1547832196', 'Kafr_Elshikh,Byla', 4),
('Maher ', 2017246578, 47, '1247832134', 'Alex,Agamy', 3),
('Adel ', 2018246159, 50, '1147832645', 'Alex,Manshia', 5);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `ID` int(11) NOT NULL,
  `Book_Time` date NOT NULL DEFAULT current_timestamp(),
  `City` varchar(80) NOT NULL,
  `Street` varchar(80) NOT NULL,
  `Destination` varchar(80) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`ID`, `Book_Time`, `City`, `Street`, `Destination`, `Price`) VALUES
(1, '2020-06-12', 'Alex', 'Bitash', 'October', 50),
(2, '2020-06-12', 'Alex', 'Bahary', 'Mahata', 33),
(3, '2020-06-12', 'Alex', 'Hanoveel', 'Khairallah', 35),
(4, '2020-06-12', 'Kafr_Elshikh', 'Hamool', ' Sakha', 100),
(5, '2020-06-12', 'Alex', 'Asafra', 'Backoos', 40),
(6, '2020-06-12', 'Alex', 'SedeBichr', 'Somoha', 45),
(7, '2020-06-14', 'MarsaMatrouh', 'AlexStreet', 'Alexandria', 200);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`Car_No`),
  ADD KEY `Driver_FK` (`Driver_FK`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Reservation_FK` (`Reservation_FK`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`License_No`),
  ADD KEY `Book_Fk` (`Book_Fk`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`Driver_FK`) REFERENCES `driver` (`License_No`) ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Reservation_FK`) REFERENCES `reservation` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`Book_Fk`) REFERENCES `reservation` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
