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
