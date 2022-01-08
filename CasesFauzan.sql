--3
SELECT st.SalesID, CustomerName, CustomerGender, [Total Quantity Purchased] = SUM(SalesQuantity), [Total Bionic Purchased]= COUNT(BionicID), [Sales Date] = (CONVERT(varchar,SalesDate,7))
	FROM SalesTransaction st 
			JOIN SalesTransactionDetail std ON st.SalesID=std.SalesID
			JOIN Customer c ON st.CustomerID=c.CustomerID
	WHERE CustomerGender LIKE 'Female'
	GROUP BY st.SalesID, CustomerName, CustomerGender, SalesDate
	HAVING SUM(SalesQuantity) > 7

--5
SELECT s.StaffName, [StaffSalary]=CONCAT('Rp. ',StaffSalary), StaffGender, [PurchaseDate] = (CONVERT(varchar,PurchaseDate,107)), VendorName
	FROM Staff s 
		JOIN PurchaseTransaction pt ON s.StaffID=pt.StaffID
		JOIN Vendor v ON pt.VendorID=v.VendorID
	WHERE StaffSalary > (SELECT AVG(StaffSalary) FROM Staff)
		AND PurchaseDate LIKE '2020-%-%'

--6
SELECT st.SalesID, s.StaffID, StaffName, StaffSalary, [StaffGender]=LEFT(StaffGender,1), BionicName, [Total Sold Price] = BionicPrice*SalesQuantity, [SalesDate] = (CONVERT(varchar,SalesDate,106))
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