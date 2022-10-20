-- 1
SELECT customers.customerNumber, customers.customerName, orders.`status`, orders.comments FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.`status` = 'On Hold' && orders.comments LIKE '%credit limit%';

-- 2 
SELECT customers.customerName, orders.`status`, orders.comments FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.comments LIKE '%dhl%';

-- 3
SELECT customers.customerName, products.productName, orders.`status`, orders.shippedDate FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode
WHERE products.productName LIKE '%ferrari%' ORDER BY orders.shippedDate DESC;

-- 4-- 
INSERT INTO orders (orderNumber, orderDate, requiredDate, `status`, customerNumber)
SELECT 10426, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 1 YEAR), 'In Process', customerNumber FROM customers
WHERE customerName = 'Anton Designs, Ltd.'; 

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
SELECT 10426, productCode, 50, MSRP * 0.75, 1 FROM products
WHERE productName = '1934 Ford V8 Coupe';

