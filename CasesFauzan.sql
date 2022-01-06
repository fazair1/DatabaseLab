--3
SELECT st.SalesID, CustomerName, CustomerGender, [Total Quantity Purchased] = SUM(SalesQuantity)
	FROM SalesTransaction st 
			JOIN SalesTransactionDetail std ON st.SalesID=std.SalesID
			JOIN Customer c ON st.CustomerID=c.CustomerID
