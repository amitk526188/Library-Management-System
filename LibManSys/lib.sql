CREATE TABLE Branch (
	Branch_Name varchar(50) NOT NULL,
	Branch_Location varchar(300) NOT NULL,
	Membership_Fee integer NOT NULL,
	Late_Fine_Rate integer NOT NULL,
	Borrow_Limit integer NOT NULL DEFAULT 3,
	Age_Limit integer NOT NULL DEFAULT 6,
	PRIMARY KEY (Branch_Name)
);

CREATE TABLE Supplier (
	Supplier_Id char(5) NOT NULL,
	Supplier_Contact_No varchar NOT NULL,
	Supplier_Address varchar(50) NOT NULL,
	Publication varchar(30),
	PRIMARY KEY (Supplier_Id)
);

CREATE TABLE Book (
	ISBN varchar(20) NOT NULL UNIQUE,
	Book_Id integer NOT NULL,
	Title varchar(50) NOT NULL UNIQUE,
	Publication varchar(30),
	Author varchar(50) NOT NULL,
	Genre varchar(50) NOT NULL,
	PRIMARY KEY (Book_Id)
);

CREATE TABLE Book_Copy (
	ISBN varchar(20) NOT NULL,
	Book_Id integer NOT NULL ,
	Acc_No char(5) NOT NULL UNIQUE,
	PRIMARY KEY (Acc_No)
);

CREATE TABLE Member (
	Member_Id char(10) NOT NULL,
	Member_Name varchar(30) NOT NULL,
	Gender char(1) NOT NULL,
	bdate DATE NOT NULL,
	Phone_No varchar(10) NOT NULL DEFAULT 00000000,
	Member_Address varchar(50),
	Emergency_Contact_Name varchar(30) NOT NULL,
	Emergency_Contact_Number varchar(30) NOT NULL,
	PRIMARY KEY (Member_Id)
);

CREATE TABLE Borrowal (
	Borrower_Id char(10) NOT NULL,
	Acc_No char(5) NOT NULL,
	Borrowed_From_Date DATE NOT NULL,
	Borrowed_To_Date DATE NOT NULL,
	Actual_Return_date DATE
);

CREATE TABLE Books_Branch_Contains (
	Branch_Name varchar(50) NOT NULL,
	ISBN varchar(20) NOT NULL UNIQUE,
	Book_Id integer NOT NULL UNIQUE,
	No_Of_Copies_Actual integer NOT NULL,
	No_Of_Copies_Current integer NOT NULL,
	Shelf_No char(5) NOT NULL
);

CREATE TABLE Branch_Supplier (
	Branch_Name varchar(50) NOT NULL,
	Supplier_Id char(5) NOT NULL
);


ALTER TABLE Book_Copy ADD CONSTRAINT Book_Copy_fk0 FOREIGN KEY (ISBN) REFERENCES Book(ISBN);

ALTER TABLE Book_Copy ADD CONSTRAINT Book_Copy_fk1 FOREIGN KEY (Book_Id) REFERENCES Book(Book_Id);

ALTER TABLE Borrowal ADD CONSTRAINT Borrowal_fk0 FOREIGN KEY (Borrower_Id) REFERENCES Member(Member_Id);

ALTER TABLE Books_Branch_Contains ADD CONSTRAINT Books_Branch_Contains_fk0 FOREIGN KEY (Branch_Name) REFERENCES Branch(Branch_Name);

ALTER TABLE Books_Branch_Contains ADD CONSTRAINT Books_Branch_Contains_fk1 FOREIGN KEY (ISBN) REFERENCES Book(ISBN);

ALTER TABLE Books_Branch_Contains ADD CONSTRAINT Books_Branch_Contains_fk2 FOREIGN KEY (Book_Id) REFERENCES Book(Book_Id);

ALTER TABLE Branch_Supplier ADD CONSTRAINT Branch_Supplier_fk0 FOREIGN KEY (Branch_Name) REFERENCES Branch(Branch_Name);

ALTER TABLE Branch_Supplier ADD CONSTRAINT Branch_Supplier_fk1 FOREIGN KEY (Supplier_Id) REFERENCES Supplier(Supplier_Id);


INSERT INTO Branch(Branch_Name,Branch_Location,Membership_Fee,Late_Fine_Rate)
VALUES
('Fedora','Dallas, Houston,TX',200,5);

INSERT INTO Supplier(Supplier_Id,Supplier_Contact_No,Supplier_Address,Publication)
VALUES
('F-M10',9078341238,'Miami,Florida','RND'),
('F-N07',9078341238,'NYC,New York','RNR'),
('F-V23',9078341238,'Vegas,Nevada','BBQ');

INSERT INTO Book(ISBN,Book_Id,Title,Author,Publication,Genre)
VALUES
('978-3-16-1484',123,'The Thorn Birds','Colleen McCullough','BBQ','Drama,Romance'),
('978-3-16-2344',456,'Fault In Our Stars','John Green','RNR','Young adult fiction'),
('978-3-16-2335',457,'Paper Towns','John Green','RNR','Young adult fiction'),
('978-3-16-1923',339,'This Is How You Lose Her','Junot Díaz','RND','Short story, Fiction, Romance novel'),
('978-3-16-1117',223,'And Then There Were None','Agatha Christie','BBQ','fiction: mystery'),
('978-3-16-5628',237,'The Da Vinci Code','Dan Brown','BBQ','fiction: mystery, thriller');

INSERT INTO Book_Copy(ISBN,Book_Id,Acc_No)
VALUES
('978-3-16-1484',123,'190.1'),
('978-3-16-1484',123,'190.2'),
('978-3-16-2344',456,'191.1'),
('978-3-16-2344',456,'191.2'),
('978-3-16-2335',457,'192.1'),
('978-3-16-2335',457,'192.2'),
('978-3-16-1923',339,'193.1'),
('978-3-16-1923',339,'193.2'),
('978-3-16-1117',223,'194.1'),
('978-3-16-1117',223,'194.2'),
('978-3-16-5628',237,'195.1'),
('978-3-16-5628',237,'195.2');

INSERT INTO Member(Member_Id,Member_Name,Gender,bdate,Phone_No,Member_Address,Emergency_Contact_Name,Emergency_Contact_Number)
VALUES
('M1','James Borg', 'M','1937-11-10',888665555,'Stone, Houston,TX','Tony Stark',9090909090),
('M2','Franklin Wong','M','1955-12-08',333445555,'Voss,Houston,TX','Steve Rogers',8883955551),
('M3','John Smith','M','1965-01-09',123456789,'Fondren,Houston,TX','Natasha Romanoff',3334458975),
('M4','Jennifer Wallace','F','1941-06-20',987654321,'Berry, Bellaire,Tx','Bucky Barnes',9888665555),
('M5','Dax Shepard','M','1962-09-15',666884444,'Fire Oak, Humble, TX','Nick Fury' ,9991445555),
('M6','Joyce Beck','F','1972-07-31',453453453,'Rice,Houston,TX','Carol Danvers',3334455552),
('M7','Kate Winslet','F','1969-03-29',987987987,'Dallas, Houston,TX','Thor Odinson',8987654321),
('M8','Alicia Vikander','F','1968-01-19',999887777,'Castle,Spring,Tx','Wanda Maximoff',7987654321),
('M9','Amy Newcomer','F','1980-01-01',100123001,'Stone, Houston,TX','Alan Baldwin',987654321);

INSERT INTO Branch_Supplier(Branch_Name,Supplier_Id)
VALUES
('Fedora','F-M10'),
('Fedora','F-N07'),
('Fedora','F-V23');

INSERT INTO Books_Branch_Contains(Branch_Name,ISBN,Book_Id,No_Of_Copies_Actual,No_Of_Copies_Current,Shelf_No)
VALUES
('Fedora','978-3-16-1484',123,2,2,'R1R12'),
('Fedora','978-3-16-2344',456,2,2,'R3S11'),
('Fedora','978-3-16-2335',457,2,2,'R3S11'),
('Fedora','978-3-16-1923',339,2,2,'R1R12'),
('Fedora','978-3-16-1117',223,2,2,'R1R12'),
('Fedora','978-3-16-5628',237,2,2,'R2V10');

INSERT INTO Borrowal(Borrower_Id,Acc_No,Borrowed_From_Date,Borrowed_To_Date,Actual_Return_date)
VALUES
('M1','193.1','2019-03-02','2019-03-12',NULL),
('M1','195.2','2019-02-10','2019-02-20','2019-03-01'),
('M2','191.1','2019-02-20','2019-03-01','2019-03-01'),
('M2','191.1','2019-03-01','2019-03-10','2019-03-08'),
('M2','192.2','2019-02-15','2019-02-25','2019-02-01'),
('M4','195.1','2019-03-05','2019-03-15',NULL),
('M8','191.2','2019-02-23','2019-02-04','2019-03-09'),
('M9','194.2','2019-02-17','2019-02-27','2019-02-26'),
('M9','191.2','2019-02-12','2019-02-22','2019-02-19'),
('M5','193.2','2019-03-08','2019-03-18',NULL),
('M5','192,1','2019-02-24','2019-03-05','2019-03-08'),
('M2','195.2','2019-02-15','2019-02-25','2019-02-01'),
('M7','194.1','2019-02-17','2019-02-27','2019-03-08');


