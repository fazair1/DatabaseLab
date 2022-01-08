--1
SELECT	[StaffId] = StaffID, [Total Purchase] = COUNT(PurchaseID), VendorName
	FROM Vendor JOIN PurchaseTransaction ON Vendor.VendorID = PurchaseTransaction.VendorID
	WHERE VendorName LIKE '% Tillman' 
	GROUP BY PurchaseTransaction.StaffID, VendorName
	HAVING COUNT(PurchaseID) > 1;

--2
SELECT [StaffId] = Staff.StaffID, StaffName, StaffSalary, [Total Bionic Sold] = SUM(SalesQuantity)
	FROM ((SalesTransactionDetail 
	INNER JOIN SalesTransaction ON SalesTransactionDetail.SalesID = SalesTransaction.SalesID) 
	INNER JOIN Staff ON SalesTransaction.StaffID = Staff.StaffID)
	WHERE (StaffSalary BETWEEN 8000000 AND 10000000)
	GROUP BY Staff.StaffID, StaffName, StaffSalary
	HAVING SUM(SalesQuantity)>10

--3
SELECT [SalesId] = st.SalesID, CustomerName, CustomerGender, [Total Quantity Purchased] = SUM(SalesQuantity), [Total Bionic Purchased]= COUNT(BionicID), [Sales Date] = (CONVERT(varchar,SalesDate,7))
	FROM SalesTransaction st 
			JOIN SalesTransactionDetail std ON st.SalesID=std.SalesID
			JOIN Customer c ON st.CustomerID=c.CustomerID
	WHERE CustomerGender LIKE 'Female'
	GROUP BY st.SalesID, CustomerName, CustomerGender, SalesDate
	HAVING SUM(SalesQuantity) > 7

--4
SELECT	[Purchase Id] = REPLACE(PurchaseID, 'PU', 'Purchase '), [Total Purchase Detail] = COUNT(PurchaseTransactionDetail.PurchaseID), [Highest Bionic Price] = MAX(BionicPrice), BionicTypeName
	FROM ((PurchaseTransactionDetail 
	INNER JOIN Bionic ON PurchaseTransactionDetail.BionicID = Bionic.BionicID) 
	INNER JOIN BionicType ON Bionic.BionicTypeID = BionicType.BionicTypeID)
	WHERE BionicTypeName LIKE 'Hand'
	GROUP BY BionicType.BionicTypeName, PurchaseTransactionDetail.PurchaseID
	HAVING COUNT(PurchaseTransactionDetail.PurchaseID) > 1;

--5
SELECT s.StaffName, [StaffSalary]=CONCAT('Rp. ',StaffSalary), StaffGender, [PurchaseDate] = (CONVERT(varchar,PurchaseDate,107)), VendorName
	FROM Staff s 
		JOIN PurchaseTransaction pt ON s.StaffID=pt.StaffID
		JOIN Vendor v ON pt.VendorID=v.VendorID
	WHERE StaffSalary > (SELECT AVG(StaffSalary) FROM Staff)
		AND PurchaseDate LIKE '2020-%-%'

--6
SELECT [SalesId] = st.SalesID, [StaffId] = s.StaffID, StaffName, StaffSalary, [StaffGender]=LEFT(StaffGender,1), BionicName, [Total Sold Price] = BionicPrice*SalesQuantity, [SalesDate] = (CONVERT(varchar,SalesDate,106))
	FROM SalesTransaction st
		JOIN Staff s ON st.StaffID=s.StaffID
		JOIN SalesTransactionDetail std ON st.SalesID=std.SalesID
		JOIN Bionic b ON b.BionicID=std.BionicID
	WHERE BionicPrice*SalesQuantity > (SELECT AVG(BionicPrice) FROM SalesTransactionDetail std JOIN Bionic b ON std.BionicID=b.BionicID)
		AND StaffSalary < 5000000

--7
SELECT [SalesId] = REPLACE(st.SalesID,'SA','Sales '), [SalesDate] = CONVERT(varchar,SalesDate,107), [Total Quantity] = CONCAT(SalesQuantity, ' Pc(s)'), BionicName, [TypeName] = BionicTypeName, [TypeDurability] = BionicTypeDurability
	FROM SalesTransaction st
		JOIN SalesTransactionDetail std ON st.SalesID=std.SalesID
		JOIN Bionic b ON b.BionicID=std.BionicID
		JOIN BionicType bt ON bt.BionicTypeID=b.BionicTypeID
	WHERE BionicTypeDurability < (SELECT AVG(BionicTypeDurability) FROM BionicType)
		AND SalesDate >= CONVERT(datetime,'2016-1-1')

--8
SELECT [VendorId] = REPLACE(VendorID, 'VE', 'Vendor '), [Total Quantity] = CONCAT(PurchaseQuantity, ' Pc(s)'), PurchaseTransactionDetail.BionicID, BionicTypeName, BionicTypeDurability,BionicStock
	FROM Bionic INNER JOIN BionicType ON Bionic.BionicTypeID = BionicType.BionicTypeID 
				INNER JOIN PurchaseTransactionDetail ON Bionic.BionicID = PurchaseTransactionDetail.BionicID 
				INNER JOIN PurchaseTransaction ON PurchaseTransactionDetail.PurchaseID = PurchaseTransaction.PurchaseID,
				(
		SELECT
			[MaximumBionicStock] = MAX(BionicStock)
		FROM
			Bionic
	) d
	WHERE BionicTypeName LIKE 'Eye' AND PurchaseQuantity >= MaximumBionicStock
	ORDER BY PurchaseQuantity DESC

--9
GO
CREATE VIEW [LoyalCustomer] AS
SELECT [CustomerId] = SalesTransaction.CustomerID, CustomerName, CustomerGender, [Total Transaction] = COUNT(SalesTransaction.CustomerID), [Total Bionic Bought] = SUM(SalesQuantity)
	FROM Customer JOIN SalesTransaction ON SalesTransaction.CustomerID = Customer.CustomerID JOIN SalesTransactionDetail ON SalesTransactionDetail.SalesID = SalesTransaction.SalesID
	WHERE SalesQuantity > 10
	GROUP BY SalesTransaction.CustomerID, CustomerName,CustomerGender,SalesTransactionDetail.SalesID
	HAVING COUNT(SalesTransactionDetail.SalesID) > 1
GO

--10
CREATE VIEW [StaffPurchaseRecap] AS
SELECT [StaffId] = PurchaseTransaction.StaffID, StaffName, StaffSalary, [Total Purchase Finished] = COUNT(PurchaseTransactionDetail.PurchaseID), [Total Bionic Purchased] = SUM(PurchaseQuantity)
	FROM Staff JOIN PurchaseTransaction ON PurchaseTransaction.StaffID = Staff.StaffID JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.PurchaseID = PurchaseTransaction.PurchaseID
	WHERE YEAR(PurchaseDate) > 2016
	GROUP BY PurchaseTransaction.StaffID, StaffName, StaffSalary
	HAVING COUNT(PurchaseTransactionDetail.PurchaseID) > 1
GO