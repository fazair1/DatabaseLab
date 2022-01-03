INSERT INTO Staff VALUES 
('ST001', 'Chicony Evy', 'chiconyevy081@hotmail.com', '084561820512', '73 Orange Point','2000-12-25','Female', 6500000),
('ST002', 'Red Adam', 'adamred102@ymail.com', '084758192385', '56 Wood Street','1985-01-11','Male', 11250000),
('ST003', 'Lilia Eru', 'Lieru900@coldmail.com', '084701824725', '200 Palm Vanda','1996-07-18','Female', 9725000);

INSERT INTO Vendor VALUES 
('VE001', 'Dindes Manafe', '088324018248', '42 Pandan Street', 'dinnafe092@gmail.com'),
('VE002', 'Hallin Kaiser', '085293572934', '192 Manggo Lux', 'kaiserhall222@gmail.com'),
('VE003', 'Rupton Zynga', '085912508249', '29 Aster Rum', 'ruptonzynga1@gmail.com');

INSERT INTO Customer VALUES 
('CU001', 'Boxin Pacloss', '085278592105', '304 Citarum Street', 'Male', 'boxloss@fmail.com','2002-05-17'),
('CU002', 'Sajida Muna', '083495203473', '11 Holland Rees', 'Female', 'sajmun290@breemail.com','1995-11-09'),
('CU003', 'Dinda Jadawong', '084289410249', '2 Paulo Lemans', 'Female', 'dindawong00@suiimaik.com','1998-09-25');

INSERT INTO BionicType VALUES 
('TY001', 'Eye', 65),
('TY002', 'Arm', 75),
('TY003', 'Foot', 97);

INSERT INTO Bionic VALUES 
('BI001', 'TY002', 'Riot Wrest', 3 ,'2000-12-25', 925000),
('BI002', 'TY003', 'Mania Lest', 1 ,'1956-01-12', 3575000),
('BI003', 'TY001', 'Hybrid Eylest', 10 ,'2002-08-09', 125000);

INSERT INTO PurchaseTransaction VALUES 
('PU001', 'ST004', 'VE002','2019-01-19'),
('PU002', 'ST002', 'VE004','2019-05-04'),
('PU003', 'ST003', 'VE001','2019-06-12'),
('PU004', 'ST001', 'VE002','2019-08-10'),
('PU005', 'ST004', 'VE003','2019-11-25'),
('PU006', 'ST002', 'VE004','2019-12-30'),
('PU007', 'ST001', 'VE003','2019-12-01');

INSERT INTO SalesTransaction VALUES 
('SA001', 'ST002', 'CU004','2019-06-02'),
('SA002', 'ST004', 'CU002','2019-08-14'),
('SA003', 'ST001', 'CU003','2019-09-23'),
('SA004', 'ST002', 'CU001','2019-10-25'),
('SA005', 'ST004', 'CU002','2019-11-01'),
('SA006', 'ST002', 'CU004','2019-11-02'),
('SA007', 'ST003', 'CU001','2019-12-30');

INSERT INTO PurchaseTransactionDetail VALUES 
('PU001', 'BI001', 5),
('PU002', 'BI001', 8),
('PU003', 'BI003', 10),
('PU004', 'BI002', 1),
('PU005', 'BI001', 11),
('PU006', 'BI003', 20),
('PU007', 'BI003', 2);

INSERT INTO SalesTransactionDetail VALUES 
('SA001', 'BI003', 6),
('SA002', 'BI001', 3),
('SA003', 'BI003', 18),
('SA004', 'BI002', 1),
('SA005', 'BI001', 10),
('SA006', 'BI003', 5),
('SA007', 'BI001', 6);
