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
