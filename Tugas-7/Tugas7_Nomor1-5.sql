-- 1
SELECT customers.customerNumber, customers.customerName AS `Nama Customers`, MAX(amount) AS `Pembayaran Terbesar`, MIN(amount) AS `Pembayaran Terkecil`
FROM customers
LEFT JOIN (SELECT payments.amount AS amount, payments.customerNumber AS numbers FROM payments) AS a
ON numbers = customers.customerNumber
GROUP BY customers.customerName;

-- 2
SELECT * FROM employees WHERE officeCode = 
(SELECT oCode1 FROM (SELECT fName AS fName1, oCode AS oCode1, MAX(cnt) AS cnt1
FROM (SELECT employees.firstName AS fName, employees.officeCode AS oCode, COUNT(*) AS cnt FROM employees
GROUP BY employees.officeCode) AS t) AS b);

-- 3
SELECT b.productName, b.productScale
FROM products AS b
WHERE EXISTS (SELECT products.productName FROM products WHERE b.productName LIKE '%ford%');

-- 4
SELECT cName, fName, oNumber, MAX(pAmount)
FROM (SELECT customers.customerName AS cName, employees.firstName AS fName, orders.orderNumber AS oNumber, payments.amount AS pAmount FROM payments
INNER JOIN customers
ON payments.customerNumber = customers.customerNumber
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber) AS t;

-- 5
SELECT DISTINCT LENGTH(country) AS `karakter`, country
FROM customers
WHERE LENGTH(country) IN 
	((SELECT MAX(LENGTH(country)) FROM customers),(SELECT MIN(LENGTH(country)) FROM customers))
ORDER BY `karakter` DESC;