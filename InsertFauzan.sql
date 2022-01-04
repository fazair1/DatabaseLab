INSERT INTO Staff
VALUES 
('ST007','Ojan Irawan','ojanwan@gmail.com','086212349876','Jalan Rambutan RT 07 RW 01','2000-12-5','Male',1000000),
('ST008','Budi Jago','budija@gmail.com','086274562985','Jalan Mangga RT 01 RW 02','2000-1-9','Male',9000000),
('ST009','Tama Wawa','tamawa@gmail.com','086227642456','Jalan Jeruk RT 02 RW 06','2000-4-6','Female',6000000);

INSERT INTO VENDOR
VALUES 
('VE007','Opi Opea','086254389462','Jalan Rujak RT 09 RW 07','opiea@gmail.com'),
('VE008','Dimas Siu','086216782315','Jalan Otewe RT 03 RW 05','dimasu@gmail.com'),
('VE009','Mirana Arrow','086218644863','Jalan Dire RT 03 RW 22','miranarow@gmail.com');

INSERT INTO Customer
VALUES
('CU007','Sapei Derman','086274289532','Jalan Ben RT 10 RW 03','Male','speiderman@gmail.com','2004-8-25'),
('CU008','Hulek Ijo','086268425734','Jalan Smash RT 08 RW 09','Male','hulekijo@gmail.com','2006-10-24'),
('CU009','Thoriq Thunder','086218760953','Jalan Val RT 01 RW 10','Male','thoriqthunder@gmail.com','2010-7-10');

INSERT INTO BionicType
VALUES
('TY007','Foot',78),
('TY008','Leg',80),
('TY009','Eye',100);

INSERT INTO Bionic
VALUES
('BI007','TY009','Sharingan',15,'2020-12-30',5000000),
('BI008','TY007','AX007',10,'2015-10-24',3500000),
('BI009','TY008','Terminator',13,'2021-6-17',4250000);

INSERT INTO PurchaseTransaction
VALUES
('PU015','ST009','VE007','2018-04-08'),
('PU016','ST007','VE008','2018-07-12'),
('PU017','ST008','VE009','2018-10-09'),
('PU018','ST007','VE007','2018-07-25'),
('PU019','ST009','VE008','2018-03-01'),
('PU020','ST008','VE009','2018-08-08'),
('PU021','ST007','VE009','2018-11-05'),

INSERT INTO SalesTransaction
VALUES
('SA015','ST007','CU007','2020-09-03'),
('SA016','ST007','CU008','2020-06-12'),
('SA017','ST007','CU009','2020-11-16'),
('SA018','ST008','CU007','2020-08-22'),
('SA019','ST008','CU009','2020-07-07'),
('SA020','ST009','CU008','2020-01-27'),
('SA021','ST009','CU009','2020-02-09'),

INSERT INTO PurchaseTransactionDetail 
VALUES
('PU015','BI007',7),
('PU016','BI008',3),
('PU017','BI009',7),
('PU018','BI007',5),
('PU019','BI008',7),
('PU020','BI009',6),
('PU021','BI007',3),

INSERT INTO SalesTransactionDetail 
VALUES
('SA015','BI007',1),
('SA016','BI008',2),
('SA017','BI009',4),
('SA018','BI007',8),
('SA019','BI008',5),
('SA020','BI009',3),
('SA021','BI008',1),