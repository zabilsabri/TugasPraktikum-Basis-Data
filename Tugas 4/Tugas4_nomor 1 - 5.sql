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
ADD `status` VARCHAR (7);