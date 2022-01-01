--1
SELECT	StaffID, [Total Purchase] = COUNT(PurchaseID)
	FROM PurchaseTransaction,Vendor
	WHERE PurchaseTransaction.VendorId = Vendor.VendorID AND VendorName LIKE '% Tillman' AND COUNT(PurchaseID) > 1

--2
SELECT	StaffID, StaffName, StaffSalary, [Total Bionic Sold] = SalesBionicQuan
	FROM SalesTransaction,Staff
	WHERE SalesTransaction.StaffId = Staff.StaffID AND (StaffSalary BETWEEN 8000000 AND 10000000) AND SalesBionicQuan > 10

--3
SELECT	SalesId, CustomerName, CustomerGender, [Total Quantity Purchased] = PurchaseBionicQuan, [Total Bionic Purchased] = COUNT(PurchaseID), [SalesDate] = (CONVERT(varchar,SalesDate,7) as [MMM DD,YYYY]) 
	FROM ((SalesTransaction 
	INNER JOIN PurchaseTransaction ON SalesTransaction.StaffId = PurchaseTransaction.StaffID) 
	INNER JOIN Customer ON SalesTransaction.CustomerId = Customer.CustomerID)
	WHERE CustomerGender LIKE 'Female' AND PurchaseBionicQuan > 7

--4
SELECT	[Purchase Id] = REPLACE(PurchaseID, 'PU', 'Purchase '), [Total Purchase Detail] = COUNT(PurchaseID), [Highest Bionic Price] = MAX(BionicPrice), BionicTypeName
	FROM ((PurchaseTransaction 
	INNER JOIN Bionic ON PurchaseTransaction.BionicID = Bionic.BionicID) 
	INNER JOIN BionicType ON Bionic.BionicTypeID = BionicType.BionicTypeID)
	WHERE BionicTypeName LIKE 'Hand' AND COUNT(PurchaseID) > 1

--5

--6

--7

--8

--9

--10