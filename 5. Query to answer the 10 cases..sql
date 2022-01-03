--1
SELECT	StaffID, [Total Purchase] = COUNT(PurchaseID)
	FROM Vendor JOIN PurchaseTransaction ON Vendor.VendorID = PurchaseTransaction.VendorID
	WHERE VendorName LIKE '% Tillman' 
	GROUP BY PurchaseTransaction.StaffID
	HAVING COUNT(PurchaseID) > 1;

--2
SELECT	Staff.StaffID, StaffName, StaffSalary, [Total Bionic Sold] = SalesQuanity
	FROM ((SalesTransactionDetail 
	INNER JOIN SalesTransaction ON SalesTransactionDetail.SalesID = SalesTransaction.SalesID) 
	INNER JOIN Staff ON SalesTransaction.StaffID = Staff.StaffID)
	WHERE (StaffSalary BETWEEN 8000000 AND 10000000) AND SalesQuanity > 10

--3
SELECT	SalesId, CustomerName, CustomerGender, [Total Quantity Purchased] = PurchaseBionicQuan, [Total Bionic Purchased] = COUNT(PurchaseID), [SalesDate] = (CONVERT(varchar,SalesDate,7) as [MMM DD,YYYY]) 
	FROM ((SalesTransaction 
	INNER JOIN PurchaseTransaction ON SalesTransaction.StaffId = PurchaseTransaction.StaffID) 
	INNER JOIN Customer ON SalesTransaction.CustomerId = Customer.CustomerID)
	WHERE CustomerGender LIKE 'Female' AND PurchaseBionicQuan > 7

--4
SELECT	[Purchase Id] = REPLACE(PurchaseID, 'PU', 'Purchase '), [Total Purchase Detail] = COUNT(PurchaseID), [Highest Bionic Price] = MAX(BionicPrice), BionicTypeName
	FROM ((PurchaseTransactionDetail 
	INNER JOIN Bionic ON PurchaseTransactionDetail.BionicID = Bionic.BionicID) 
	INNER JOIN BionicType ON Bionic.BionicTypeID = BionicType.BionicTypeID)
	WHERE BionicTypeName LIKE 'Hand'
	GROUP BY BionicType.BionicTypeName, PurchaseTransactionDetail.PurchaseID
	HAVING COUNT(PurchaseID) > 1;

--5

--6

--7

--8

--9

--10
