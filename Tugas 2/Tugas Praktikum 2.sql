USE classicmodels;

-- NOMOR 1
SELECT * FROM offices WHERE city = "San Francisco";

-- NOMOR 2
SELECT * FROM orderdetails WHERE quantityOrdered > 70 ORDER BY orderLineNumber;

-- NOMOR 3
SELECT DISTINCT productLine FROM products;

-- NOMOR 4
SELECT customerNumber AS `Nomor Kostumer`, customerName AS `Nama Kostumer` FROM customers WHERE customerNumber >= 100 AND customerNumber <= 150;

-- NOMOR 5
SELECT * FROM customers WHERE creditLimit = 0 ORDER BY customerName LIMIT 9, 10;