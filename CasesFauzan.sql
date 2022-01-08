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
