GO
CREATE PROCEDURE InsertNewCustomer
	@customerid CHAR(5),
	@name VARCHAR(50),
	@phonenum VARCHAR(50),
	@address VARCHAR(50),
	@gender VARCHAR(10),
	@email VARCHAR(50),
	@dob DATE
AS
	BEGIN
		INSERT INTO Customer
		VALUES (@customerid, @name, @phonenum, @address, @gender, @email, @dob)
	END
GO

GO
CREATE PROCEDURE CustomerBuyFromStaff
	@SalesID CHAR(5),
	@StaffIDSales CHAR(5),
	@CustomerID CHAR(5),
	@SalesDate DATE,
	@BionicIDSales CHAR(5),
	@SalesQuantity INT
AS
	BEGIN
		INSERT INTO SalesTransaction
		VALUES (@SalesID, @StaffIDSales, @CustomerID, @SalesDate)
	END
	BEGIN
		INSERT INTO SalesTransactionDetail
		VALUES(@SalesID, @BionicIDSales, @SalesQuantity)
	END
	BEGIN
		SET NOCOUNT ON;
		UPDATE Bionic
		SET BionicStock = BionicStock - @SalesQuantity
		FROM Bionic JOIN SalesTransactionDetail ON Bionic.BionicID = SalesTransactionDetail.BionicID
		WHERE SalesID = @SalesID
	END
GO

GO
CREATE PROCEDURE StaffBuyFromVendor
	@PurchaseID CHAR(5),
	@StaffIDPurchase CHAR(5),
	@VendorID CHAR(5),
	@PurchaseDate DATE,
	@BionicIDPurchase CHAR(5),
	@PurchaseQuantity INT
AS
	BEGIN
		INSERT INTO PurchaseTransaction
		VALUES (@PurchaseID, @StaffIDPurchase, @VendorID, @PurchaseDate)
	END
	BEGIN
		INSERT INTO PurchaseTransactionDetail
		VALUES(@PurchaseID, @BionicIDPurchase, @PurchaseQuantity)
	END
	BEGIN
		SET NOCOUNT ON;
		UPDATE Bionic
		SET BionicStock = BionicStock + @PurchaseQuantity
		FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
		WHERE PurchaseID = @PurchaseID
	END
GO

-- 1. 
-- CustomerID CU013
-- CustomerName Bimo Putra Two Sibutarbutar 
-- CustomerPhoneNum 081125538564
-- CustomerAddress 0709 Vanda Garden Palm Spring
-- CustomerGender Male
-- CustomerEmail boringdijokiin@gmail.com
-- CustomerDOB 2002-12-25
-- Staff mendaftarkan Customer baru dengan data seperti diatas, dan pada tanggal 2020-04-17 seorang Customer baru tersebut ingin membeli 7 Produk Bionic Dengan BionicID BI005, Customer itu bertemu dengan Staff dengan StaffID ST005. Staff yang melakukan sales itupun melakukan pengecekan stok Bionic tersebut, setelah dicek ternyata stok Bionic tersisa 5. maka dari itu Customer terpaksa hanya bisa membeli 5 stok. karena stok produk Bionic tersebut habis Staff lain dengan StaffID ST007 pergi ke Vendor untuk membeli Produk BionicID BI005. Staff itu bertemu dengan Vendor dengan VendorID VE006 pada tanggal 2020-05-12, dan membeli 20 produk.
BEGIN TRAN
EXEC InsertNewCustomer @customerid = 'CU013', @name = 'Bimo Putra Two Sibutarbutar', @phonenum = '081125538564', @address = '0709 Vanda Garden Palm Spring', @gender = 'Male', @email = 'boringdijokiin@gmail.com', @dob = '2002-12-25'

SELECT * FROM Customer


EXEC CustomerBuyFromStaff @SalesID = 'SA022', @StaffIDSales = 'ST005', @CustomerID = 'CU013', @SalesDate = '2020-04-17', @BionicIDSales = 'BI005' , @SalesQuantity = 5

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN SalesTransactionDetail ON SalesTransactionDetail.BionicID = Bionic.BionicID 
	WHERE SalesID LIKE 'SA022'
SELECT * FROM SalesTransaction JOIN SalesTransactionDetail ON SalesTransaction.SalesID = SalesTransactionDetail.SalesID


EXEC StaffBuyFromVendor @PurchaseID = 'PU023' , @StaffIDPurchase = 'ST007', @VendorID = 'VE006', @PurchaseDate = '2020-05-12', @BionicIDPurchase = 'BI005', @PurchaseQuantity = 20

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
	WHERE PurchaseID LIKE 'PU023'
SELECT * FROM PurchaseTransaction JOIN PurchaseTransactionDetail ON PurchaseTransaction.PurchaseID = PurchaseTransactionDetail.PurchaseID


ROLLBACK
COMMIT
-- 2. Seorang Staff dengan StaffID ST002 pergi ke Vendor untuk menyetok Produk Bionic, ia melakukan Purchase Transaction pada tanggal 2021-07-29 dengan VendorID VE010, dalam purchase transaction itu ia membeli 15 produk Bionic dengan BionicID BI008. pada tanggal 2022-02-07 seorang Customer lama dengan CustomerID CU003 bertemu dengan Staff Sales dengan StaffID ST001 untuk membeli 2 produk Bionic dengan BionicID BI003, setelah dicek stok produknya mencukupi sehingga customer tersebut langsung membelinya.
BEGIN TRAN
EXEC CustomerBuyFromStaff @SalesID = 'SA023', @StaffIDSales = 'ST001', @CustomerID = 'CU003', @SalesDate = '2021-02-07', @BionicIDSales = 'BI003' , @SalesQuantity = 2

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN SalesTransactionDetail ON SalesTransactionDetail.BionicID = Bionic.BionicID 
	WHERE SalesID LIKE 'SA023'
SELECT * FROM SalesTransaction JOIN SalesTransactionDetail ON SalesTransaction.SalesID = SalesTransactionDetail.SalesID


EXEC StaffBuyFromVendor @PurchaseID = 'PU024' , @StaffIDPurchase = 'ST002', @VendorID = 'VE010', @PurchaseDate = '2021-07-29', @BionicIDPurchase = 'BI008', @PurchaseQuantity = 15

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
	WHERE PurchaseID LIKE 'PU024'
SELECT * FROM PurchaseTransaction JOIN PurchaseTransactionDetail ON PurchaseTransaction.PurchaseID = PurchaseTransactionDetail.PurchaseID


ROLLBACK
COMMIT
-- 3.  
-- CustomerID CU014
-- CustomerName Raka Rebran Ft Lilia 
-- CustomerPhoneNum 089035273518
-- CustomerAddress 57 Cimone Popo Sori
-- CustomerGender Female
-- CustomerEmail liliaglory1500@gmail.com
-- CustomerDOB 2001-10-12
-- seorang Customer baru ingin membeli 3 Produk Bionic dengan BionicID BI012, ia ditangani oleh Staff dengan StaffID ST012, staff itupun pergi untuk mengecek ketersediaan Produk, setelah dicek ternyata produknya masih banyak, sehingga Customer tersebut harus mendaftarkan dirinya dengan data diatas. transaksi ini terjadi pada tanggal 2020-01-27, pada tanggal yang bersamaan Staff lain dengan StaffID ST009 pergi ke Vendor untuk Menambah stok Produk Bionic dengan BionicID BI004. ia membeli 15 Produk Bionic tersebut dari Vendor dengan VendorID VE004.
BEGIN TRAN
EXEC InsertNewCustomer @customerid = 'CU014', @name = 'Raka Rebran Ft Lilia', @phonenum = '089035273518', @address = '57 Cimone Popo Sori', @gender = 'Female', @email = 'liliaglory1500@gmail.com', @dob = '2001-10-12'

SELECT * FROM Customer


EXEC CustomerBuyFromStaff @SalesID = 'SA024', @StaffIDSales = 'ST012', @CustomerID = 'CU014', @SalesDate = '2020-01-27', @BionicIDSales = 'BI012' , @SalesQuantity = 3

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN SalesTransactionDetail ON SalesTransactionDetail.BionicID = Bionic.BionicID 
	WHERE SalesID LIKE 'SA024'
SELECT * FROM SalesTransaction JOIN SalesTransactionDetail ON SalesTransaction.SalesID = SalesTransactionDetail.SalesID


EXEC StaffBuyFromVendor @PurchaseID = 'PU025' , @StaffIDPurchase = 'ST009', @VendorID = 'VE004', @PurchaseDate = '2020-01-27', @BionicIDPurchase = 'BI004', @PurchaseQuantity = 15

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
	WHERE PurchaseID LIKE 'PU025'
SELECT * FROM PurchaseTransaction JOIN PurchaseTransactionDetail ON PurchaseTransaction.PurchaseID = PurchaseTransactionDetail.PurchaseID


ROLLBACK
COMMIT
-- 4. Pada tanggal 2021-01-09 seorang Customer dengan CustomerID CU012 pergi untuk membeli 3 produk Bionic dengan BionicID BI007 dan 1 produk Bionic dengan BionicID BI011, ia bertemu dengan Staff dengan StaffID ST006, staff itu pergi untuk mengecek ketersediaan produk, setelah dicek ternyata stoknya masih banyak sehingga customer tersebut bisa membeli semua produk yang di inginkan. 2 hari kemudian pada tanggal 2021-01-11 Staff tersebut pergi ke tempat vendor dengan VendorID VE001 untuk membeli 5 stok Produk Bionic dengan BionicID BI010.
BEGIN TRAN
EXEC CustomerBuyFromStaff @SalesID = 'SA025', @StaffIDSales = 'ST006', @CustomerID = 'CU012', @SalesDate = '2021-01-09', @BionicIDSales = 'BI007' , @SalesQuantity = 3
EXEC CustomerBuyFromStaff @SalesID = 'SA025', @StaffIDSales = 'ST006', @CustomerID = 'CU012', @SalesDate = '2021-01-09', @BionicIDSales = 'BI011' , @SalesQuantity = 1
SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN SalesTransactionDetail ON SalesTransactionDetail.BionicID = Bionic.BionicID 
	WHERE SalesID LIKE 'SA025'
SELECT * FROM SalesTransaction JOIN SalesTransactionDetail ON SalesTransaction.SalesID = SalesTransactionDetail.SalesID


EXEC StaffBuyFromVendor @PurchaseID = 'PU026' , @StaffIDPurchase = 'ST006', @VendorID = 'VE001', @PurchaseDate = '2021-01-11', @BionicIDPurchase = 'BI010', @PurchaseQuantity = 5

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
	WHERE PurchaseID LIKE 'PU026'
SELECT * FROM PurchaseTransaction JOIN PurchaseTransactionDetail ON PurchaseTransaction.PurchaseID = PurchaseTransactionDetail.PurchaseID



ROLLBACK
COMMIT
