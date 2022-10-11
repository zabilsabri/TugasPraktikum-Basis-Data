USE 'classicmodels';

-- 1
INSERT INTO employees VALUES 
(1010, 'Sabri', 'Zabil', 'X666', 'zabilsabrimuhammad0@gmail.com', '3', 1102, 'President'), 
(1011, 'Jeff', 'Bezos', 'X420', 'realjeffbezos@gmail.com', '3', 1102, 'Sales Rep'),
(1012, 'Holland', 'Tom', 'X69', 'spiderman@gmail.com', '2', 1102, 'Sales Rep');

SELECT * FROM employees;

-- 2
INSERT INTO offices VALUES
('8', 'Makassar', '+62 811 4613 767', 'Jln. Kumala no. 3', 'Depan rumah sakit', 'Makassar', 'Indonesia', '90225', 'NA');

UPDATE employees SET officeCode = 8 WHERE jobTitle = 'Sales Rep' AND officeCode = '4';

SELECT * FROM employees WHERE jobTitle = 'Sales Rep' AND officeCode = '4';