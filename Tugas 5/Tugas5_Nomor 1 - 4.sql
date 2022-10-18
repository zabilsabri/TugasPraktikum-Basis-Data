-- 1
SELECT customers.customerNumber, customers.customerName, orders.`status`, orders.comments FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.`status` = 'On Hold' && orders.comments LIKE '%exceed%';

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

-- 4
INSERT INTO orders (orderNumber, orderDate, requiredDate, `status`, customerNumber)
VALUES (10426, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 1 YEAR), 'In Process', 465);

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (10426, 'S18_2957', 50, 62.46 * 0.75, 1);

SELECT * FROM orders WHERE orderNumber = 10426;
SELECT * FROM orderdetails WHERE orderNumber = 10426;