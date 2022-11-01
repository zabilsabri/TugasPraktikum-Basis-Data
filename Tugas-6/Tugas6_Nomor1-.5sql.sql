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

SELECT MAX(orderdetails.quantityOrdered) FROM orderdetails;

SELECT CONCAT(customers.customerName, ' : ', customers.contactFirstName, ' ', customers.contactLastName, '@', customers.addressLine1) AS "Pelanggan", orderdetails.quantityOrdered AS "Jumlah Orderan" FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
WHERE orderdetails.quantityOrdered = 97;

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
WHERE orderdetails.productCode = 'S12_1108' #
GROUP BY orderdetails.priceEach
HAVING SUM(orderdetails.quantityOrdered) * orderdetails.priceEach - SUM(orderdetails.quantityOrdered) * products.buyPrice > 5000
ORDER BY SUM(orderdetails.quantityOrdered) * orderdetails.priceEach - SUM(orderdetails.quantityOrdered) * products.buyPrice DESC;

-- 5
SELECT offices.addressLine1 AS "Alamat", CONCAT(LEFT(offices.phone, LENGTH(offices.phone) - 6), "* ****") AS "Nomor Telp", COUNT(DISTINCT employees.employeeNumber) AS "Jumlah Karyawan", COUNT( DISTINCT customers.customerName) AS "Jumlah Pelanggan", CAST(AVG(payments.amount) AS DECIMAL(7,2)) AS "Rata - Rata Penghasilan"
FROM offices
INNER JOIN employees
ON offices.officeCode = employees.officeCode
LEFT JOIN customers
ON customers.salesRepEmployeeNumber = employees.employeeNumber
LEFT JOIN payments
ON customers.customerNumber = payments.customerNumber
GROUP BY offices.officeCode