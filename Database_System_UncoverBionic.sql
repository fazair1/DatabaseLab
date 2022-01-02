use master
go
drop database UncoverBionic
CREATE DATABASE UncoverBionic
GO
USE UncoverBionic
GO

CREATE TABLE Staff(
	StaffID CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(50) NOT NULL,
	StaffEmail VARCHAR(50) CHECK(StaffEmail LIKE '%@%.%') NOT NULL,
	StaffPhoneNum VARCHAR(50) NOT NULL,
	StaffAddress VARCHAR(50) CHECK (LEN(StaffAddress) > 10) NOT NULL,
	StaffDOB DATE NOT NULL,
	StaffGender VARCHAR(10) CHECK (StaffGender IN ('Male', 'Female')) NOT NULL,
	StaffSalary INT NOT NULL
);

CREATE TABLE Vendor(
	VendorID CHAR(5) PRIMARY KEY CHECK (VendorID LIKE 'VE[0-9][0-9][0-9]'),
	VendorName VARCHAR(50) NOT NULL,
	VendorPhoneNum VARCHAR(50) NOT NULL,
	VendorAddress VARCHAR(50) CHECK (LEN(VendorAddress) > 10) NOT NULL,
	VendorEmail VARCHAR(50) CHECK(VendorEmail LIKE '%@%.%') NOT NULL
);

CREATE TABLE Customer(
	CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) NOT NULL,
	CustomerPhoneNum VARCHAR(50) NOT NULL,
	CustomerAddress VARCHAR(50) CHECK (LEN(CustomerAddress) > 10) NOT NULL,
	CustomerGender VARCHAR(10) CHECK (CustomerGender IN ('Male', 'Female')) NOT NULL,
	CustomerEmail VARCHAR(50) CHECK(CustomerEmail LIKE '%@%.%') NOT NULL,
	CustomerDOB DATE NOT NULL
);

CREATE TABLE BionicType(
	BionicTypeID CHAR(5) PRIMARY KEY CHECK (BionicTypeID LIKE 'TY[0-9][0-9][0-9]'),
	BionicTypeName VARCHAR(50) CHECK (BionicTypeName IN ('Hand', 'Foot', 'Leg', 'Arm', 'Eye')) NOT NULL,
	BionicTypeDurability VARCHAR(50) CHECK (BionicTypeDurability BETWEEN 50 AND 100) NOT NULL
);

CREATE TABLE Bionic(
	BionicID CHAR(5) PRIMARY KEY CHECK (BionicID LIKE 'BI[0-9][0-9][0-9]'),
	BionicTypeID CHAR(5) FOREIGN KEY REFERENCES BionicType(BionicTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	BionicName VARCHAR(50) NOT NULL,
	BionicStock INT NOT NULL,
	BionicLaunchDate DATE NOT NULL,
	BionicPrice INT NOT NULL
);

CREATE TABLE PurchaseTransaction(
	PurchaseID CHAR(5) PRIMARY KEY CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	VendorID CHAR(5) FOREIGN KEY REFERENCES Vendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseDate DATE NOT NULL
);

CREATE TABLE SalesTransaction(
	SalesID CHAR(5) PRIMARY KEY CHECK (SalesID LIKE 'SA[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesDate DATE NOT NULL
);

CREATE TABLE PurchaseTransactionDetail(
	PurchaseID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransaction(PurchaseID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	BionicID CHAR(5) FOREIGN KEY REFERENCES Bionic(BionicID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseQuantity INT CHECK (PurchaseQuantity > 0) NOT NULL,
	PRIMARY KEY(PurchaseID, BionicID)
);

CREATE TABLE SalesTransactionDetail(
	SalesID CHAR(5) FOREIGN KEY REFERENCES SalesTransaction(SalesID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	BionicID CHAR(5) FOREIGN KEY REFERENCES Bionic(BionicID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesQuanity INT CHECK (SalesQuanity > 0) NOT NULL,
	PRIMARY KEY(SalesID, BionicID)
);
