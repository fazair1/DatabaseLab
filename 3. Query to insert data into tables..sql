--Master Table

INSERT INTO Staff VALUES 
('ST001', 'Chicony Evy', 'chiconyevy081@hotmail.com', '084561820512', '73 Orange Point','2000-12-25','Female', 6500000),
('ST002', 'Red Adam', 'adamred102@ymail.com', '084758192385', '56 Wood Street','1985-01-11','Male', 11250000),
('ST003', 'Lilia Eru', 'Lieru900@coldmail.com', '084701824725', '200 Palm Vanda','1996-07-18','Female', 9725000),
('ST004', 'Reinhart Kjelberg', 'TillHart@gmail.com', '085976390712', '21 Papandayan Fruit','1998-12-12','Male', 9500000),
('ST005', 'Rina Roosevelt', 'choochoorina@gmail.com', '087757667992', '9 Baltimore Estate','1997-02-07','Female', 15000000),
('ST006', 'Jenny Lindzey', 'JennyGurl@gmail.com', '081221345478', '11 Land Of Dawn','1999-06-17','Female', 8000000),
('ST007','Ojan Irawan','ojanwan@gmail.com','086212349876','Jalan Rambutan RT 07 RW 01','2000-12-5','Male',1000000),
('ST008','Budi Jago','budija@gmail.com','086274562985','Jalan Mangga RT 01 RW 02','2000-1-9','Male',9000000),
('ST009','Tama Wawa','tamawa@gmail.com','086227642456','Jalan Jeruk RT 02 RW 06','2000-4-6','Female',6000000);

INSERT INTO Vendor VALUES 
('VE001', 'Dindes Manafe', '088324018248', '42 Pandan Street', 'dinnafe092@gmail.com'),
('VE002', 'Hallin Kaiser', '085293572934', '192 Manggo Lux', 'kaiserhall222@gmail.com'),
('VE003', 'Rupton Zynga', '085912508249', '29 Aster Rum', 'ruptonzynga1@gmail.com'),
('VE004', 'Randy Tillman', '081299878413', '52 Ares Street', 'randyman@gmail.com'),
('VE005', 'Guinevere Baroque', '087785976844', '37 Castle George', 'supermagicguin@gmail.com'),
('VE006', 'Gusion Paxley', '082358975648', '5 Aberleen Cluster', 'emperorgusion@gmail.com'),
('VE007','Opi Opea','086254389462','Jalan Rujak RT 09 RW 07','opiea@gmail.com'),
('VE008','Dimas Siu','086216782315','Jalan Otewe RT 03 RW 05','dimasu@gmail.com'),
('VE009','Mirana Arrow','086218644863','Jalan Dire RT 03 RW 22','miranarow@gmail.com');

INSERT INTO Customer VALUES 
('CU001', 'Boxin Pacloss', '085278592105', '304 Citarum Street', 'Male', 'boxloss@fmail.com','2002-05-17'),
('CU002', 'Sajida Muna', '083495203473', '11 Holland Rees', 'Female', 'sajmun290@breemail.com','1995-11-09'),
('CU003', 'Dinda Jadawong', '084289410249', '2 Paulo Lemans', 'Female', 'dindawong00@suiimaik.com','1998-09-25'),
('CU004', 'Ramado Dragomax', '083254665432', '20 simpang leomord', 'Male', 'salamdaribinjai@gmail.com','2001-11-21'),
('CU005', 'Hakku Venna', '085567432917', 'D9 The Suites', 'Female', 'bananamcd@gmail.com','2003-05-01'),
('CU006', 'Sunarto Up', '088876554765', '46 Antapani Reprepan', 'Male', 'baratsjoget@gmail.com','1958-12-29'),
('CU007','Sapei Derman','086274289532','Jalan Ben RT 10 RW 03','Male','speiderman@gmail.com','2004-8-25'),
('CU008','Hulek Ijo','086268425734','Jalan Smash RT 08 RW 09','Male','hulekijo@gmail.com','2006-10-24'),
('CU009','Thoriq Thunder','086218760953','Jalan Val RT 01 RW 10','Male','thoriqthunder@gmail.com','2010-7-10');

INSERT INTO BionicType VALUES 
('TY001', 'Eye', 65),
('TY002', 'Arm', 75),
('TY003', 'Foot', 97),
('TY004', 'Hand', 100),
('TY005', 'Leg', 88),
('TY006', 'Eye', 71),
('TY007','Foot',78),
('TY008','Leg',80),
('TY009','Eye',100);

INSERT INTO Bionic VALUES 
('BI001', 'TY002', 'Riot Wrest', 3 ,'2000-12-25', 925000),
('BI002', 'TY003', 'Mania Lest', 1 ,'1956-01-12', 3575000),
('BI003', 'TY001', 'Hybrid Eylest', 10 ,'2002-08-09', 125000),
('BI004', 'TY004', 'Encode', 2 ,'2021-11-04', 4500000),
('BI005', 'TY005', 'SeaBasilisk', 5 ,'2009-01-27', 2800000),
('BI006', 'TY006', 'Ignite', 13 ,'2015-07-23', 925000),
('BI007','TY009','Sharingan',15,'2020-12-30',5000000),
('BI008','TY007','AX007',10,'2015-10-24',3500000),
('BI009','TY008','Terminator',13,'2021-6-17',4250000);

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
