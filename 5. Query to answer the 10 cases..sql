--1
SELECT	StaffID, [Total Purchase] = COUNT(PurchaseID)
	FROM Vendor JOIN PurchaseTransaction ON Vendor.VendorID = PurchaseTransaction.VendorID
	WHERE VendorName LIKE '% Tillman' 
	GROUP BY PurchaseTransaction.StaffID
	HAVING COUNT(PurchaseID) > 1;

--2
SELECT Staff.StaffID, StaffName, StaffSalary, [Total Bionic Sold] = SUM(SalesQuantity)
	FROM ((SalesTransactionDetail 
	INNER JOIN SalesTransaction ON SalesTransactionDetail.SalesID = SalesTransaction.SalesID) 
	INNER JOIN Staff ON SalesTransaction.StaffID = Staff.StaffID)
	WHERE (StaffSalary BETWEEN 8000000 AND 10000000)
	GROUP BY Staff.StaffID, StaffName, StaffSalary
	HAVING SUM(SalesQuantity)>10

--3
SELECT st.SalesID, CustomerName, CustomerGender, [Total Quantity Purchased] = SUM(SalesQuantity), [Total Bionic Purchased]= COUNT(BionicID), [Sales Date] = (CONVERT(varchar,SalesDate,7))
	FROM SalesTransaction st 
			JOIN SalesTransactionDetail std ON st.SalesID=std.SalesID
			JOIN Customer c ON st.CustomerID=c.CustomerID
	WHERE CustomerGender LIKE 'Female'
	GROUP BY st.SalesID, CustomerName, CustomerGender, SalesDate
	HAVING SUM(SalesQuantity) > 7

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
