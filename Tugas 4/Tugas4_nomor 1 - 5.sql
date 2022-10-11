-- 1
SELECT orders.orderDate FROM products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode
INNER JOIN orders
ON orderdetails.orderNumber = orders.orderNumber
WHERE products.productName = "1940 Ford Pickup Truck" ORDER BY orders.orderDate DESC;

-- 2
SELECT productName FROM products WHERE MSRP < 80;

-- 3
SELECT ss_dosen.nama FROM ss_pembimbing
INNER JOIN ss_dosen
ON ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen
INNER JOIN ss_mahasiswa
ON ss_pembimbing.id_mahasiswa = ss_mahasiswa.id_mahasiswa
WHERE ss_mahasiswa.nama = "Sulaeman";

-- 4
ALTER TABLE customers
ADD `status` VARCHAR (7) DEFAULT "Reguler";

UPDATE customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
SET customers.`status` = "VIP"
WHERE payments.amount > 100000 OR orderdetails.quantityOrdered > 50


-- 5

select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME,
REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'nama_tabel';

ALTER TABLE orders DROP CONSTRAINT orders_ibfk_1;
ALTER TABLE orderdetails DROP CONSTRAINT orderdetails_ibfk_1;
ALTER TABLE payments DROP CONSTRAINT payments_ibfk_1;

DELETE customers FROM customers
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.`status` = "Cancelled";

-- SELECT * FROM orders WHERE `status` = "Cancelled";