INSERT INTO Staff 
VALUES 
('ST010', 'Edy Sutedja', 'edsu@hotmail.com', '087854963024', 'Jalan Jeruk RT 4 RW 17','1998-5-24','Male', 8500000),
('ST011', 'Bambang Sutanto', 'bamsut@yahoo.com', '081548572065', 'Jalan Sabar RT 10 RW 19','1977-11-17','Male', 15000000),
('ST012', 'Rachel Anastasia', 'anaspanas@coldmail.com', '082390152218', 'Serpong Terrace D17','1985-03-31','Female', 7500000);

INSERT INTO Vendor 
VALUES 
('VE010', 'Alifthio Suherman', '0877795438055', 'BSD Park unit 404', 'Alifganteng2@gmail.com'),
('VE011', 'James Volt', '085677952423', 'Bintaro Residence F23', 'nyetrum@gmail.com'),
('VE012', 'Alfred Pajero', '085720145254', 'Jalan Damai RT 7 RW 7', 'pajero1@gmail.com');

INSERT INTO Customer 
VALUES 
('CU010', 'Andrew Persia', '088858689828', 'Jalan Cendrawasih 1 RT 9 RW 19', 'Male', 'Andrew2013@rockmail.com','2002-08-27'),
('CU011', 'Abigail Gabrina', '089924658125', 'Jalan Ceger kavling 2458', 'Female', 'abimwehehe@sumail.com','2002-10-12'),
('CU012', 'Sarah Citra', '084957154685', 'Kebayoran Terrace C3', 'Female', 'sarter@atoyot.com','1999-01-4');

INSERT INTO BionicType 
VALUES 
('TY010', 'Arm', 72),
('TY011', 'Leg', 78),
('TY012', 'Eye', 97);

INSERT INTO Bionic 
VALUES 
('BI010', 'TY011', 'Zenirex Bar', 4 ,'2003-10-7', 785000),
('BI011', 'TY010', 'Fuji Tela', 2 ,'1989-04-22', 4285000),
('BI012', 'TY012', 'Orico Sang', 9 ,'2001-09-09', 125000);

INSERT INTO PurchaseTransaction 
VALUES 
('PU022', 'ST027', 'VE022','2019-02-22'),
('PU023', 'ST025', 'VE024','2019-04-15'),
('PU024', 'ST024', 'VE025','2019-07-22'),
('PU025', 'ST022', 'VE026','2019-08-25'),
('PU026', 'ST028', 'VE027','2019-10-24'),
('PU027', 'ST026', 'VE028','2019-11-15'),
('PU028', 'ST023', 'VE022','2019-12-21');

INSERT INTO SalesTransaction 
VALUES 
('SA022', 'ST024', 'CU024','2019-03-12'),
('SA023', 'ST025', 'CU022','2019-05-24'),
('SA024', 'ST026', 'CU023','2019-07-28'),
('SA025', 'ST027', 'CU026','2019-08-27'),
('SA026', 'ST024', 'CU022','2019-10-29'),
('SA027', 'ST023', 'CU024','2019-11-25'),
('SA028', 'ST022', 'CU022','2019-12-30');

INSERT INTO PurchaseTransactionDetail 
VALUES 
('PU022', 'BI010', 3),
('PU023', 'BI010', 7),
('PU024', 'BI011', 12),
('PU025', 'BI011', 5),
('PU026', 'BI012', 14),
('PU027', 'BI012', 18),
('PU028', 'BI010', 4);

INSERT INTO SalesTransactionDetail 
VALUES 
('SA022', 'BI010', 2),
('SA023', 'BI012', 4),
('SA024', 'BI011', 16),
('SA025', 'BI011', 5),
('SA026', 'BI010', 8),
('SA027', 'BI012', 1),
('SA028', 'BI010', 6);
