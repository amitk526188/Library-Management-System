CREATE TABLE `Branch` (
	`Branch_Name` varchar(50) NOT NULL,
	`Branch_Location` varchar(300) NOT NULL,
	`Membership_Fee` int NOT NULL,
	`Late_Fine_Rate` int NOT NULL,
	`Borrow_Limit` int NOT NULL DEFAULT '3',
	`Age_Limit` int NOT NULL DEFAULT '6',
	PRIMARY KEY (`Branch_Name`)
);

CREATE TABLE `Supplier` (
	`Supplier_Id` char(5) NOT NULL,
	`Supplier_Contact_No` varchar NOT NULL,
	`Supplier_Address` varchar(50) NOT NULL,
	`Publication` varchar(30) NOT NULL,
	PRIMARY KEY (`Supplier_Id`)
);

CREATE TABLE `Book` (
	`ISBN` varchar(20) NOT NULL,
	`Book_Id` INT NOT NULL,
	`Title` varchar(50) NOT NULL UNIQUE,
	`Publication` varchar(30),
	`Author` varchar(50) NOT NULL,
	`Genre` varchar(50) NOT NULL,
	PRIMARY KEY (`Book_Id`)
);

CREATE TABLE `Book_Copy` (
	`ISBN` varchar(20) NOT NULL,
	`Book_Id` INT NOT NULL UNIQUE,
	`Acc_No` char(5) NOT NULL UNIQUE,
	PRIMARY KEY (`Acc_No`)
);

CREATE TABLE `Member` (
	`Member_Id` char(10) NOT NULL,
	`Member_Name` varchar(30) NOT NULL,
	`Gender` char(1) NOT NULL,
	`bdate` DATE NOT NULL,
	`Phone_No` varchar(10) NOT NULL DEFAULT '0',
	`Member_Address` varchar(50) DEFAULT '"..."',
	`Emergency_Contact_Name` varchar(30) NOT NULL,
	`Emergency_Contact_Number` varchar(30) NOT NULL,
	PRIMARY KEY (`Member_Id`)
);

CREATE TABLE `Borrowal` (
	`Borrower_Id` char(10) NOT NULL,
	`Acc_No` char(5) NOT NULL,
	`Borrowed_From_Date` DATE NOT NULL,
	`Borrowed_To_Date` DATE NOT NULL,
	`Actual_Return_date` DATE NOT NULL
);

CREATE TABLE `Books_Branch_Contains` (
	`Branch_Name` varchar(50) NOT NULL,
	`ISBN` varchar(20) NOT NULL,
	`Book_Id` INT NOT NULL,
	`No_Of_Copies_Actual` int NOT NULL,
	`No_Of_Copies_Current` int NOT NULL,
	`Shelf_No` char(5) NOT NULL
);

CREATE TABLE `Branch_Supplier` (
	`Branch_Name` varchar(50) NOT NULL,
	`Supplier_Id` char(5) NOT NULL
);

ALTER TABLE `Book_Copy` ADD CONSTRAINT `Book_Copy_fk0` FOREIGN KEY (`ISBN`) REFERENCES `Book`(`ISBN`);

ALTER TABLE `Book_Copy` ADD CONSTRAINT `Book_Copy_fk1` FOREIGN KEY (`Book_Id`) REFERENCES `Book`(`Book_Id`);

ALTER TABLE `Borrowal` ADD CONSTRAINT `Borrowal_fk0` FOREIGN KEY (`Borrower_Id`) REFERENCES `Member`(`Member_Id`);

ALTER TABLE `Borrowal` ADD CONSTRAINT `Borrowal_fk1` FOREIGN KEY (`Acc_No`) REFERENCES `Book_Copy`(`Acc_No`);

ALTER TABLE `Books_Branch_Contains` ADD CONSTRAINT `Books_Branch_Contains_fk0` FOREIGN KEY (`Branch_Name`) REFERENCES `Branch`(`Branch_Name`);

ALTER TABLE `Books_Branch_Contains` ADD CONSTRAINT `Books_Branch_Contains_fk1` FOREIGN KEY (`ISBN`) REFERENCES `Book`(`ISBN`);

ALTER TABLE `Books_Branch_Contains` ADD CONSTRAINT `Books_Branch_Contains_fk2` FOREIGN KEY (`Book_Id`) REFERENCES `Book`(`Book_Id`);

ALTER TABLE `Branch_Supplier` ADD CONSTRAINT `Branch_Supplier_fk0` FOREIGN KEY (`Branch_Name`) REFERENCES `Branch`(`Branch_Name`);

ALTER TABLE `Branch_Supplier` ADD CONSTRAINT `Branch_Supplier_fk1` FOREIGN KEY (`Supplier_Id`) REFERENCES `Supplier`(`Supplier_Id`);

