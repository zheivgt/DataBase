-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2023 at 03:20 AM
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
-- Database: `tugas`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_Admin` int(20) NOT NULL,
  `Admin_Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apply`
--

CREATE TABLE `apply` (
  `ID_Apply` int(11) NOT NULL,
  `JS_ID` int(11) NOT NULL,
  `Date_Apply` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `approve`
--

CREATE TABLE `approve` (
  `ID_Approve` int(11) NOT NULL,
  `ID_Admin` int(11) NOT NULL,
  `Date_Approve` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Username` varchar(20) NOT NULL,
  `ID_Role` int(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobseeker`
--

CREATE TABLE `jobseeker` (
  `JS_ID` int(20) NOT NULL,
  `JS_Name` varchar(20) NOT NULL,
  `JS_Address` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Contact_Num` varchar(20) NOT NULL,
  `Gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_provider`
--

CREATE TABLE `job_provider` (
  `JP_ID` int(20) NOT NULL,
  `Company_Name` varchar(20) NOT NULL,
  `Company_Address` varchar(20) NOT NULL,
  `Company_Contact_Num` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `ID_Request` int(11) NOT NULL,
  `JP_ID` int(11) NOT NULL,
  `Data_Request` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `ID_Role` int(20) NOT NULL,
  `Name_Role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vacancy`
--

CREATE TABLE `vacancy` (
  `ID_Vacancy` int(20) NOT NULL,
  `ID_Approve` int(20) NOT NULL,
  `ID_Apply` int(20) NOT NULL,
  `ID_Request` int(20) NOT NULL,
  `Vacancy_Title` varchar(20) NOT NULL,
  `Vacancy_Desc` varchar(20) NOT NULL,
  `Num_Of_Jobs` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_Admin`);

--
-- Indexes for table `apply`
--
ALTER TABLE `apply`
  ADD PRIMARY KEY (`ID_Apply`),
  ADD KEY `JS_ID` (`JS_ID`);

--
-- Indexes for table `approve`
--
ALTER TABLE `approve`
  ADD PRIMARY KEY (`ID_Approve`),
  ADD KEY `ID_Admin` (`ID_Admin`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Username`),
  ADD KEY `ID_Role` (`ID_Role`);

--
-- Indexes for table `jobseeker`
--
ALTER TABLE `jobseeker`
  ADD PRIMARY KEY (`JS_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `job_provider`
--
ALTER TABLE `job_provider`
  ADD PRIMARY KEY (`JP_ID`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`ID_Request`),
  ADD KEY `JP_ID` (`JP_ID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID_Role`);

--
-- Indexes for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD PRIMARY KEY (`ID_Vacancy`),
  ADD KEY `ID_Approve` (`ID_Approve`),
  ADD KEY `ID_Apply` (`ID_Apply`),
  ADD KEY `ID_Request` (`ID_Request`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apply`
--
ALTER TABLE `apply`
  ADD CONSTRAINT `fk_JS_ID` FOREIGN KEY (`JS_ID`) REFERENCES `jobseeker` (`JS_ID`);

--
-- Constraints for table `approve`
--
ALTER TABLE `approve`
  ADD CONSTRAINT `fk_ID_Admin` FOREIGN KEY (`ID_Admin`) REFERENCES `admin` (`ID_Admin`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_ID_Role` FOREIGN KEY (`ID_Role`) REFERENCES `role` (`ID_Role`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `fk_JP_ID` FOREIGN KEY (`JP_ID`) REFERENCES `job_provider` (`JP_ID`);

--
-- Constraints for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD CONSTRAINT `fk_ID_Apply` FOREIGN KEY (`ID_Apply`) REFERENCES `apply` (`ID_Apply`),
  ADD CONSTRAINT `fk_ID_Approve` FOREIGN KEY (`ID_Approve`) REFERENCES `approve` (`ID_Approve`),
  ADD CONSTRAINT `fk_ID_Request` FOREIGN KEY (`ID_Request`) REFERENCES `request` (`ID_Request`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
