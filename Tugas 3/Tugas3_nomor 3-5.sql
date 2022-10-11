ALTER TABLE mahasiswa
MODIFY no_telp VARCHAR (20) NOT NULL,
MODIFY alamat VARCHAR (100),
MODIFY email VARCHAR (50) NOT NULL,
MODIFY keterangan VARCHAR (20);

-- 3
INSERT INTO mahasiswa (nama, nim, jk, no_telp, email, alamat, keterangan) VALUES
('Zabil Sabri Muhammad', 'H071211016', 'L', '08998754122', 'test`@`gmail.com', 'Jl. Panjang', 'semester 4'),
('Adhitya Fajar', 'H071211017', 'L', '08998754122', 'test`@`gmail.com', 'Jl. Panjang', 'semester 4'),
('Aflah ALifu', 'H071211018', 'L', '08998754122', 'test`@`gmail.com', 'Jl. Panjang', 'semester 4'),
('Emilia Damayanti', 'H071211019', 'L', '08998754122', 'test`@`gmail.com', 'Jl. Panjang', 'semester 4'),
('Indah Kurnia Ilahi', 'H071211020', 'L', '08998754122', 'test`@`gmail.com', 'Jl. Panjang', 'semester 4'),
('WD Ananda Lesmono', 'H071211021', 'L', '08998754122', 'test`@`gmail.com', 'Jl. Panjang', 'semester 4'),
('Andi Bagoes Malolo', 'H071211022', 'L', '08998754122', 'test`@`gmail.com', 'Jl. Panjang', 'semester 4'),
('Muhammad Arya Ramdani', 'H071211023', 'L', '08998754122', 'test`@`gmail.com', 'Jl. Panjang', 'semester 4'),
('Hasan Azyumardi Azra', 'H071211024', 'L', '08998754122', 'test`@`gmail.com', 'Jl. Panjang', 'semester 4'),
('Bulqis Ramadani', 'H071211025', 'L', '08998754122', 'test`@`gmail.com', 'Jl. Panjang', 'semester 4'),
('Emha Ismaulidin', 'H071211026', 'L', '08998754122', 'test`@`gmail.com', 'Jl. Panjang', 'semester 4');

DESC mahasiswa;
SELECT * FROM mahasiswa;

-- 4
INSERT INTO buku VALUES
('Tenggelamnya kapal phinisi', 2022, 'zabil', 1),
('Doraemon', 2003, 'Diva', 2),
('Spongebob', 2001, 'Aflah', 3),
('Upin - ipin', 2004, 'Emil', 4),
('Diary `OF` Dajjal', 2009, 'Fajar', 5);

INSERT INTO pinjam VALUES
('2022-09-10 00:00:00', 37, 1, 1, 1),
('2022-09-10 00:00:00', 38, 2, 0, 2),
('2022-09-10 00:00:00', 39, 3, 1, 3),
('2022-09-10 00:00:00', 40, 4, 0, 4),
('2022-09-10 00:00:00', 41, 5, 1, 5);

SELECT * FROM buku;
SELECT * FROM pinjam;

-- 5
INSERT INTO mahasiswa (nama, nim, jk, no_telp, email, alamat, keterangan) VALUES
('fajar aditya', 'H071211099', 'L', '0811789778', '', 'Jl. Dayak', 'semester 3');

INSERT INTO mahasiswa (nama, nim, jk, no_telp, email, keterangan) VALUES
('Arif', 'H071211003', 'L', '0811895645', 'arief`@`gmail.com', 'semester 3');

SELECT * FROM mahasiswa;