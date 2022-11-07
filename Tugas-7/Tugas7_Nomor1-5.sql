-- 1
SELECT customers.customerNumber, customers.customerName AS `Nama Customers`, MAX(amount) AS `Pembayaran Terbesar`, MIN(amount) AS `Pembayaran Terkecil`
FROM customers
LEFT JOIN (SELECT payments.amount AS amount, payments.customerNumber AS numbers FROM payments) AS a
ON numbers = customers.customerNumber
GROUP BY customers.customerName;