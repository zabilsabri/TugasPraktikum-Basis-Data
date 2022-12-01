SELECT c.customerName, (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) AS 'total',
case
   when (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) > 0 then "you are safe"
   when (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) < 0 then "you are in debt"
ELSE  "you are running out of credits "
END AS `Are you safe?`
FROM customers c 
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING(orderNumber) 
GROUP BY c.customerNumber;