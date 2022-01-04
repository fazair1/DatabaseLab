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
SELECT	SalesTransaction.SalesID, CustomerName, CustomerGender, [Total Quantity Purchased] = PurchaseQuantity, [Total Bionic Purchased] = COUNT(PurchaseTransaction.PurchaseID), [SalesDate] = (CONVERT(varchar,SalesDate,7)) 
	FROM SalesTransaction INNER JOIN
                  Customer ON SalesTransaction.CustomerID = Customer.CustomerID INNER JOIN
                  SalesTransactionDetail ON SalesTransaction.SalesID = SalesTransactionDetail.SalesID CROSS JOIN
                  PurchaseTransactionDetail INNER JOIN
                  PurchaseTransaction ON PurchaseTransactionDetail.PurchaseID = PurchaseTransaction.PurchaseID
	WHERE CustomerGender LIKE 'Female' AND PurchaseQuantity > 7
	GROUP BY SalesTransaction.SalesID, CustomerName, CustomerGender,PurchaseQuantity,PurchaseTransaction.PurchaseID,SalesDate

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
