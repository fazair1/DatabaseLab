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
--Insert New Customer
INSERT INTO Customer
	VALUES ('CU013', 'Bimo Putra Two Sibutarbutar', '081125538564', '0709 Vanda Garden Palm Spring', 'Male', 'boringdijokiin@gmail.com', '2002-12-25')

SELECT * FROM Customer


--Customer Buy A Bionic From Staff
INSERT INTO SalesTransaction
	VALUES ('SA022', 'ST005', 'CU013', '2020-04-17')
INSERT INTO SalesTransactionDetail
	VALUES('SA022', 'BI005', 5)
UPDATE Bionic
	SET BionicStock = BionicStock - 5
	FROM Bionic JOIN SalesTransactionDetail ON Bionic.BionicID = SalesTransactionDetail.BionicID
	WHERE SalesID = 'SA022'

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN SalesTransactionDetail ON SalesTransactionDetail.BionicID = Bionic.BionicID 
	WHERE SalesID LIKE 'SA022'
SELECT * FROM SalesTransaction JOIN SalesTransactionDetail ON SalesTransaction.SalesID = SalesTransactionDetail.SalesID


--Staff Restock From Vendor
INSERT INTO PurchaseTransaction
	VALUES ('PU023', 'ST007', 'VE006', '2020-05-12')
INSERT INTO PurchaseTransactionDetail
	VALUES('PU023', 'BI005', 20)
UPDATE Bionic
	SET BionicStock = BionicStock + 20
	FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
	WHERE PurchaseID = 'PU023'

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
	WHERE PurchaseID LIKE 'PU023'
SELECT * FROM PurchaseTransaction JOIN PurchaseTransactionDetail ON PurchaseTransaction.PurchaseID = PurchaseTransactionDetail.PurchaseID


ROLLBACK
COMMIT

-- 2. Seorang Staff dengan StaffID ST002 pergi ke Vendor untuk menyetok Produk Bionic, ia melakukan Purchase Transaction pada tanggal 2021-07-29 dengan VendorID VE010, dalam purchase transaction itu ia membeli 15 produk Bionic dengan BionicID BI008. pada tanggal 2022-02-07 seorang Customer lama dengan CustomerID CU003 bertemu dengan Staff Sales dengan StaffID ST001 untuk membeli 2 produk Bionic dengan BionicID BI003, setelah dicek stok produknya mencukupi sehingga customer tersebut langsung membelinya.
BEGIN TRAN
--Staff Restock From Vendor
INSERT INTO PurchaseTransaction
	VALUES ('PU024', 'ST002', 'VE010', '2021-07-29')
INSERT INTO PurchaseTransactionDetail
	VALUES('PU024', 'BI008', 15)
UPDATE Bionic
	SET BionicStock = BionicStock + 15
	FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
	WHERE PurchaseID = 'PU024'

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
	WHERE PurchaseID LIKE 'PU024'
SELECT * FROM PurchaseTransaction JOIN PurchaseTransactionDetail ON PurchaseTransaction.PurchaseID = PurchaseTransactionDetail.PurchaseID


--Customer Buy A Bionic From Staff
INSERT INTO SalesTransaction
	VALUES ('SA023', 'ST001', 'CU003', '2022-02-07')
INSERT INTO SalesTransactionDetail
	VALUES('SA023', 'BI003', 2)
UPDATE Bionic
	SET BionicStock = BionicStock - 2
	FROM Bionic JOIN SalesTransactionDetail ON Bionic.BionicID = SalesTransactionDetail.BionicID
	WHERE SalesID = 'SA023'

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN SalesTransactionDetail ON SalesTransactionDetail.BionicID = Bionic.BionicID 
	WHERE SalesID LIKE 'SA023'
SELECT * FROM SalesTransaction JOIN SalesTransactionDetail ON SalesTransaction.SalesID = SalesTransactionDetail.SalesID


ROLLBACK
COMMIT

-- 3.  
-- CustomerID CU014
-- CustomerName Lilia Rehbrandt
-- CustomerPhoneNum 089035273518
-- CustomerAddress 57 Cimone Popo Sori
-- CustomerGender Female
-- CustomerEmail liliaglory1500@gmail.com
-- CustomerDOB 2001-10-12
-- seorang Customer baru ingin membeli 3 Produk Bionic dengan BionicID BI012, ia ditangani oleh Staff dengan StaffID ST012, staff itupun pergi untuk mengecek ketersediaan Produk, setelah dicek ternyata produknya masih banyak, sehingga Customer tersebut harus mendaftarkan dirinya dengan data diatas. transaksi ini terjadi pada tanggal 2020-01-27, pada tanggal yang bersamaan Staff lain dengan StaffID ST009 pergi ke Vendor untuk Menambah stok Produk Bionic dengan BionicID BI004. ia membeli 15 Produk Bionic tersebut dari Vendor dengan VendorID VE004.
BEGIN TRAN
--Insert New Customer
INSERT INTO Customer
	VALUES ('CU014', 'Lilia Rehbrandt', '089035273518', '57 Cimone Popo Sori', 'Female', 'liliaglory1500@gmail.com', '2001-10-12')

SELECT * FROM Customer


--Customer Buy A Bionic From Staff
INSERT INTO SalesTransaction
	VALUES ('SA024', 'ST012', 'CU014', '2020-01-27')
INSERT INTO SalesTransactionDetail
	VALUES('SA024', 'BI012', 3)
UPDATE Bionic
	SET BionicStock = BionicStock - 3
	FROM Bionic JOIN SalesTransactionDetail ON Bionic.BionicID = SalesTransactionDetail.BionicID
	WHERE SalesID = 'SA024'

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN SalesTransactionDetail ON SalesTransactionDetail.BionicID = Bionic.BionicID 
	WHERE SalesID LIKE 'SA024'
SELECT * FROM SalesTransaction JOIN SalesTransactionDetail ON SalesTransaction.SalesID = SalesTransactionDetail.SalesID


--Staff Restock From Vendor
INSERT INTO PurchaseTransaction
	VALUES ('PU025', 'ST009', 'VE004', '2020-01-27')
INSERT INTO PurchaseTransactionDetail
	VALUES('PU025', 'BI004', 15)
UPDATE Bionic
	SET BionicStock = BionicStock + 15
	FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
	WHERE PurchaseID = 'PU025'

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
	WHERE PurchaseID LIKE 'PU025'
SELECT * FROM PurchaseTransaction JOIN PurchaseTransactionDetail ON PurchaseTransaction.PurchaseID = PurchaseTransactionDetail.PurchaseID


ROLLBACK
COMMIT
-- 4. Pada tanggal 2021-01-09 seorang Customer dengan CustomerID CU012 pergi untuk membeli 3 produk Bionic dengan BionicID BI007 dan 1 produk Bionic dengan BionicID BI011, ia bertemu dengan Staff dengan StaffID ST006, staff itu pergi untuk mengecek ketersediaan produk, setelah dicek ternyata stoknya masih banyak sehingga customer tersebut bisa membeli semua produk yang di inginkan. 2 hari kemudian pada tanggal 2021-01-11 Staff tersebut pergi ke tempat vendor dengan VendorID VE001 untuk membeli 5 stok Produk Bionic dengan BionicID BI010.
BEGIN TRAN
--Customer Buy A Bionic From Staff
INSERT INTO SalesTransaction
	VALUES ('SA025', 'ST006', 'CU012', '2021-01-09')
INSERT INTO SalesTransactionDetail
	VALUES('SA025', 'BI007', 3)
UPDATE Bionic
	SET BionicStock = BionicStock - 3
	FROM Bionic JOIN SalesTransactionDetail ON Bionic.BionicID = SalesTransactionDetail.BionicID
	WHERE SalesID = 'SA025' AND SalesTransactionDetail.BionicID = 'BI007'
INSERT INTO SalesTransactionDetail
	VALUES('SA025', 'BI011', 1)
UPDATE Bionic
	SET BionicStock = BionicStock - 1
	FROM Bionic JOIN SalesTransactionDetail ON Bionic.BionicID = SalesTransactionDetail.BionicID
	WHERE SalesID = 'SA025' AND SalesTransactionDetail.BionicID = 'BI011'

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN SalesTransactionDetail ON SalesTransactionDetail.BionicID = Bionic.BionicID 
	WHERE SalesID LIKE 'SA025'
SELECT * FROM SalesTransaction JOIN SalesTransactionDetail ON SalesTransaction.SalesID = SalesTransactionDetail.SalesID


--Staff Restock From Vendor
INSERT INTO PurchaseTransaction
	VALUES ('PU026', 'ST006', 'VE001', '2021-01-11')
INSERT INTO PurchaseTransactionDetail
	VALUES('PU026', 'BI010', 5)
UPDATE Bionic
	SET BionicStock = BionicStock + 5
	FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
	WHERE PurchaseID = 'PU026'

SELECT Bionic.BionicID,BionicTypeID,BionicName,BionicStock,BionicLaunchDate,BionicPrice 
	FROM Bionic JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.BionicID = Bionic.BionicID 
	WHERE PurchaseID LIKE 'PU026'
SELECT * FROM PurchaseTransaction JOIN PurchaseTransactionDetail ON PurchaseTransaction.PurchaseID = PurchaseTransactionDetail.PurchaseID



ROLLBACK
COMMIT
