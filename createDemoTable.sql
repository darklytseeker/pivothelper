CREATE TABLE ##Product(Cust VARCHAR(25), Product VARCHAR(20), QTY INT)
GO
-- Inserting Data into Table
INSERT INTO ##Product(Cust, Product, QTY)
VALUES('KATE','VEG',2)
INSERT INTO ##Product(Cust, Product, QTY)
VALUES('KATE','SODA',6)
INSERT INTO ##Product(Cust, Product, QTY)
VALUES('KATE','MILK',1)
INSERT INTO ##Product(Cust, Product, QTY)
VALUES('KATE','BEER',12)
INSERT INTO ##Product(Cust, Product, QTY)
VALUES('FRED','MILK',3)
INSERT INTO ##Product(Cust, Product, QTY)
VALUES('FRED','BEER',24)
INSERT INTO ##Product(Cust, Product, QTY)
VALUES('KATE','VEG',3)
GO
-- Selecting and checking entires in table
SELECT *
FROM ##Product
GO