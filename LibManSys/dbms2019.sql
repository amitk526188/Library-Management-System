-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2019 at 06:55 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbms2019`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `Book_Id` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Publication` varchar(30) DEFAULT NULL,
  `Author` varchar(50) NOT NULL,
  `Genre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `Book_Id`, `Title`, `Publication`, `Author`, `Genre`) VALUES
('978-3-16-1484', 123, 'The Thorn Birds', 'BBQ', 'Colleen McCullough', 'Drama,Romance'),
('978-3-16-1117', 223, 'And Then There Were None', 'BBQ', 'Agatha Christie', 'fiction: mystery'),
('978-3-16-5628', 237, 'The Da Vinci Code', 'BBQ', 'Dan Brown', 'fiction: mystery, thriller'),
('978-3-16-1923', 339, 'This Is How You Lose Her', 'RND', 'Junot Díaz', 'Short story, Fiction, Romance novel'),
('978-3-16-2344', 456, 'Fault In Our Stars', 'RNR', 'John Green', 'Young adult fiction'),
('978-3-16-2335', 457, 'Paper Towns', 'RNR', 'John Green', 'Young adult fiction');

-- --------------------------------------------------------

--
-- Table structure for table `books_branch_contains`
--

CREATE TABLE `books_branch_contains` (
  `Branch_Name` varchar(50) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `Book_Id` int(11) NOT NULL,
  `No_Of_Copies_Actual` int(11) NOT NULL,
  `No_Of_Copies_Current` int(11) NOT NULL,
  `Shelf_No` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books_branch_contains`
--

INSERT INTO `books_branch_contains` (`Branch_Name`, `ISBN`, `Book_Id`, `No_Of_Copies_Actual`, `No_Of_Copies_Current`, `Shelf_No`) VALUES
('Fedora', '978-3-16-1117', 223, 2, 2, 'F1-10'),
('Fedora', '978-3-16-1484', 123, 2, 2, 'F1-12'),
('Fedora', '978-3-16-1923', 339, 2, 2, 'F1-11'),
('Fedora', '978-3-16-2335', 457, 2, 2, 'F3-11'),
('Fedora', '978-3-16-2344', 456, 2, 2, 'F3-10'),
('Fedora', '978-3-16-5628', 237, 2, 2, 'F2-10');

-- --------------------------------------------------------

--
-- Table structure for table `book_copy`
--

CREATE TABLE `book_copy` (
  `ISBN` varchar(20) NOT NULL,
  `Book_Id` int(11) NOT NULL,
  `Acc_No` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_copy`
--

INSERT INTO `book_copy` (`ISBN`, `Book_Id`, `Acc_No`) VALUES
('978-3-16-1484', 123, '190.1'),
('978-3-16-1484', 123, '190.2'),
('978-3-16-2344', 456, '191.1'),
('978-3-16-2344', 456, '191.2'),
('978-3-16-2335', 457, '192.1'),
('978-3-16-2335', 457, '192.2'),
('978-3-16-1923', 339, '193.1'),
('978-3-16-1923', 339, '193.2'),
('978-3-16-1117', 223, '194.1'),
('978-3-16-1117', 223, '194.2'),
('978-3-16-5628', 237, '195.1'),
('978-3-16-5628', 237, '195.2');

-- --------------------------------------------------------

--
-- Table structure for table `borrowal`
--

CREATE TABLE `borrowal` (
  `Borrower_Id` char(10) NOT NULL,
  `Acc_No` char(5) NOT NULL,
  `Borrowed_From_Date` date NOT NULL,
  `Borrowed_To_Date` date NOT NULL,
  `Actual_Return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrowal`
--

INSERT INTO `borrowal` (`Borrower_Id`, `Acc_No`, `Borrowed_From_Date`, `Borrowed_To_Date`, `Actual_Return_date`) VALUES
('M1', '193.1', '2019-03-02', '2019-03-12', NULL),
('M1', '195.2', '2019-02-10', '2019-02-20', '2019-03-01'),
('M2', '191.1', '2019-02-20', '2019-03-01', '2019-03-01'),
('M2', '191.1', '2019-03-01', '2019-03-10', '2019-03-08'),
('M2', '192.2', '2019-02-15', '2019-02-25', '2019-02-01'),
('M4', '195.1', '2019-03-05', '2019-03-15', NULL),
('M8', '191.2', '2019-02-23', '2019-02-04', '2019-03-09'),
('M9', '194.2', '2019-02-17', '2019-02-27', '2019-02-26'),
('M9', '191.2', '2019-02-12', '2019-02-22', '2019-02-19'),
('M5', '193.2', '2019-03-08', '2019-03-18', NULL),
('M5', '192,1', '2019-02-24', '2019-03-05', '2019-03-08'),
('M2', '195.2', '2019-02-15', '2019-02-25', '2019-02-01'),
('M7', '194.1', '2019-02-17', '2019-02-27', '2019-03-08');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `Branch_Name` varchar(50) NOT NULL,
  `Branch_Location` varchar(300) NOT NULL,
  `Membership_Fee` int(11) NOT NULL,
  `Late_Fine_Rate` int(11) NOT NULL,
  `Borrow_Limit` int(11) NOT NULL DEFAULT '3',
  `Age_Limit` int(11) NOT NULL DEFAULT '6'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`Branch_Name`, `Branch_Location`, `Membership_Fee`, `Late_Fine_Rate`, `Borrow_Limit`, `Age_Limit`) VALUES
('Fedora', 'Dallas, Houston,TX', 200, 5, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `branch_supplier`
--

CREATE TABLE `branch_supplier` (
  `Branch_Name` varchar(50) NOT NULL,
  `Supplier_Id` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch_supplier`
--

INSERT INTO `branch_supplier` (`Branch_Name`, `Supplier_Id`) VALUES
('Fedora', 'F-M10'),
('Fedora', 'F-N07'),
('Fedora', 'F-V23');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `Member_Id` char(10) NOT NULL,
  `Member_Name` varchar(30) NOT NULL,
  `Gender` char(1) NOT NULL,
  `bdate` date NOT NULL,
  `Phone_No` varchar(10) NOT NULL DEFAULT '0',
  `Member_Address` varchar(50) DEFAULT NULL,
  `Emergency_Contact_Name` varchar(30) NOT NULL,
  `Emergency_Contact_Number` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`Member_Id`, `Member_Name`, `Gender`, `bdate`, `Phone_No`, `Member_Address`, `Emergency_Contact_Name`, `Emergency_Contact_Number`) VALUES
('M1', 'James Borg', 'M', '1937-11-10', '888665555', 'Stone, Houston,TX', 'Tony Stark', '9090909090'),
('M2', 'Franklin Wong', 'M', '1955-12-08', '333445555', 'Voss,Houston,TX', 'Steve Rogers', '8883955551'),
('M3', 'John Smith', 'M', '1965-01-09', '123456789', 'Fondren,Houston,TX', 'Natasha Romanoff', '3334458975'),
('M4', 'Jennifer Wallace', 'F', '1941-06-20', '987654321', 'Berry, Bellaire,Tx', 'Bucky Barnes', '9888665555'),
('M5', 'Dax Shepard', 'M', '1962-09-15', '666884444', 'Fire Oak, Humble, TX', 'Nick Fury', '9991445555'),
('M6', 'Joyce Beck', 'F', '1972-07-31', '453453453', 'Rice,Houston,TX', 'Carol Danvers', '3334455552'),
('M7', 'Kate Winslet', 'F', '1969-03-29', '987987987', 'Dallas, Houston,TX', 'Thor Odinson', '8987654321'),
('M8', 'Alicia Vikander', 'F', '1968-01-19', '999887777', 'Castle,Spring,Tx', 'Wanda Maximoff', '7987654321'),
('M9', 'Amy Newcomer', 'F', '1980-01-01', '100123001', 'Stone, Houston,TX', 'Alan Baldwin', '987654321');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_Id` char(5) NOT NULL,
  `Supplier_Contact_No` varchar(50) NOT NULL,
  `Supplier_Address` varchar(50) NOT NULL,
  `Publication` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_Id`, `Supplier_Contact_No`, `Supplier_Address`, `Publication`) VALUES
('F-M10', '9078341238', 'Miami,Florida', 'RND'),
('F-N07', '9078341238', 'NYC,New York', 'RNR'),
('F-V23', '9078341238', 'Vegas,Nevada', 'BBQ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Book_Id`),
  ADD UNIQUE KEY `ISBN` (`ISBN`),
  ADD UNIQUE KEY `Title` (`Title`);

--
-- Indexes for table `books_branch_contains`
--
ALTER TABLE `books_branch_contains`
  ADD UNIQUE KEY `ISBN` (`ISBN`),
  ADD UNIQUE KEY `Book_Id` (`Book_Id`),
  ADD KEY `Books_Branch_Contains_fk0` (`Branch_Name`);

--
-- Indexes for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD PRIMARY KEY (`Acc_No`),
  ADD UNIQUE KEY `Acc_No` (`Acc_No`),
  ADD KEY `Book_Copy_fk0` (`ISBN`),
  ADD KEY `Book_Copy_fk1` (`Book_Id`);

--
-- Indexes for table `borrowal`
--
ALTER TABLE `borrowal`
  ADD KEY `Borrowal_fk0` (`Borrower_Id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`Branch_Name`);

--
-- Indexes for table `branch_supplier`
--
ALTER TABLE `branch_supplier`
  ADD KEY `Branch_Supplier_fk0` (`Branch_Name`),
  ADD KEY `Branch_Supplier_fk1` (`Supplier_Id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`Member_Id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books_branch_contains`
--
ALTER TABLE `books_branch_contains`
  ADD CONSTRAINT `Books_Branch_Contains_fk0` FOREIGN KEY (`Branch_Name`) REFERENCES `branch` (`Branch_Name`),
  ADD CONSTRAINT `Books_Branch_Contains_fk1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `Books_Branch_Contains_fk2` FOREIGN KEY (`Book_Id`) REFERENCES `book` (`Book_Id`);

--
-- Constraints for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD CONSTRAINT `Book_Copy_fk0` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `Book_Copy_fk1` FOREIGN KEY (`Book_Id`) REFERENCES `book` (`Book_Id`);

--
-- Constraints for table `borrowal`
--
ALTER TABLE `borrowal`
  ADD CONSTRAINT `Borrowal_fk0` FOREIGN KEY (`Borrower_Id`) REFERENCES `member` (`Member_Id`);

--
-- Constraints for table `branch_supplier`
--
ALTER TABLE `branch_supplier`
  ADD CONSTRAINT `Branch_Supplier_fk0` FOREIGN KEY (`Branch_Name`) REFERENCES `branch` (`Branch_Name`),
  ADD CONSTRAINT `Branch_Supplier_fk1` FOREIGN KEY (`Supplier_Id`) REFERENCES `supplier` (`Supplier_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
