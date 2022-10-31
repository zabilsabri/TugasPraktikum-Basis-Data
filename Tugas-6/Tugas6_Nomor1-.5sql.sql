-- 1
SELECT customers.customerName AS `Nama Pelanggan`, SUM(payments.amount) AS `Total Belanja`, customers.creditLimit AS `Batas Kredit`, (SUM(payments.amount) - customers.creditLimit) AS `Selisih` 
FROM customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
GROUP BY customers.customerName
HAVING Selisih > 0
ORDER BY Selisih DESC;

-- 2
-- SELECT @maxQuantity := MAX(quantityOrdered) FROM orderdetails;

SELECT CONCAT(customers.customerName, ' : ', customers.contactFirstName, ' ', customers.contactLastName, '@', customers.addressLine1) AS Pelanggan, orderDetails.quantityOrdered AS `Jumlah Orderan` FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
WHERE orderDetails.quantityOrdered = @maxQuantity;

-- 3
SELECT CONCAT("februari ", YEAR(payments.paymentDate)) AS "Hari Pembayaran", COUNT(CONCAT("februari ", YEAR(payments.paymentDate))) AS "Jumlah Pelanggan", GROUP_CONCAT(DISTINCT customers.customerName SEPARATOR ", ") AS "List Pelanggan", SUM(payments.amount) AS "Jumlah Pembayaran" FROM payments
INNER JOIN customers
ON customers.customerNumber = payments.customerNumber
WHERE payments.paymentDate LIKE '%-02-%'
GROUP BY YEAR(payments.paymentDate)
ORDER BY SUM(payments.amount) DESC;

-- 4
SELECT UPPER(products.productName) AS "Nama Produk", COUNT(orderdetails.priceEach) AS "Jumlah Di Order", GROUP_CONCAT(orders.orderDate SEPARATOR ", ") AS "Waktu Orderan", 
products.buyPrice AS "Harga Beli", orderdetails.priceEach AS "Harga Jual", SUM(orderdetails.quantityOrdered) AS "Total Jumlah Orderan", 
CONCAT(SUM(orderdetails.quantityOrdered) * orderdetails.priceEach, " - ",  SUM(orderdetails.quantityOrdered) * products.buyPrice, " = ", SUM(orderdetails.quantityOrdered) * orderdetails.priceEach - SUM(orderdetails.quantityOrdered) * products.buyPrice) AS "Pendapatan - Modal = Keuntungan"
FROM products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode
INNER JOIN orders
ON orderdetails.orderNumber = orders.orderNumber 
WHERE orderdetails.productCode = 'S12_1108'
GROUP BY orderdetails.priceEach
HAVING SUM(orderdetails.quantityOrdered) * orderdetails.priceEach - SUM(orderdetails.quantityOrdered) * products.buyPrice > 5000
ORDER BY SUM(orderdetails.quantityOrdered) * orderdetails.priceEach - SUM(orderdetails.quantityOrdered) * products.buyPrice DESC;

-- 5
SELECT offices.addressLine1, CONCAT(LEFT(offices.phone, LENGTH(offices.phone) - 6), "* ****"), COUNT(employees.officeCode) FROM employees
INNER JOIN offices
ON offices.officeCode = employees.officeCode
GROUP BY offices.officeCode;


SELECT offices.officeCode, count(customers.salesRepEmployeeNumber) FROM customers
INNER JOIN employees
ON employees.employeeNumber = customers.salesRepEmployeeNumber
INNER JOIN offices
ON offices.officeCode = employees.officeCode
GROUP BY offices.officeCode;

SELECT offices.addressLine1, CONCAT(LEFT(offices.phone, LENGTH(offices.phone) - 6), "* ****"), employees.officeCode, customers.salesRepEmployeeNumber
FROM employees
INNER JOIN offices
ON offices.officeCode = employees.officeCode
INNER JOIN customers
ON employees.employeeNumber = customers.salesRepEmployeeNumber;