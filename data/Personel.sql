INSERT INTO tblPersonel (PersonelID, SubeID, Ad, Soyad, TCKimlikNo, DogumTarihi, Cinsiyet, Pozisyon, Maas, IseBaslamaTarihi)
VALUES
-- Merkez �ube (SubeID = 1)
	(1, 1, 'Mustafa', 'Keskin', '12345678901', '1985-03-15', 'Erkek', '�ube M�d�r�', 12000.00, '2015-05-01'),
	(2, 1, 'Nur', 'Aksoy', '12345678902', '1990-07-10', 'Kad�n', 'Banka Memuru', 8000.00, '2018-03-15'),
	(3, 1, 'U�ur', 'Kara', '12345678913', '1987-09-15', 'Erkek', 'Gi�e Memuru', 7500.00, '2020-02-01'),
	(4, 1, 'Melih', '�etin', '12345678925', '1995-04-12', 'Erkek', 'Banka Memuru', 8200.00, '2021-07-01'),
	(5, 1, 'Ezgi', 'Durmaz', '12345678926', '1998-06-18', 'Kad�n', 'Gi�e Memuru', 7600.00, '2022-09-01'),

-- Be�ikta� �ube (SubeID = 2)
	(6, 2, 'Kemal', 'Y�ld�r�m', '12345678903', '1982-11-25', 'Erkek', '�ube M�d�r�', 12500.00, '2012-11-20'),
	(7, 2, 'Fatma', '�elik', '12345678904', '1988-09-12', 'Kad�n', 'Banka Memuru', 8000.00, '2019-08-12'),
	(8, 2, 'Gizem', 'Yal��n', '12345678914', '1993-04-05', 'Kad�n', 'Gi�e Memuru', 7000.00, '2021-08-01'),
	(9, 2, 'Kadir', 'Tan', '12345678927', '1994-02-17', 'Erkek', 'Banka Memuru', 8100.00, '2022-05-01'),
	(10, 2, 'Dilara', 'Alt�n', '12345678928', '1996-11-10', 'Kad�n', 'Gi�e Memuru', 7500.00, '2023-01-15'),

-- �ankaya �ube (SubeID = 3)
	(11, 3, 'Halil', 'Do�an', '12345678915', '1984-06-12', 'Erkek', '�ube M�d�r�', 12000.00, '2016-07-15'),
	(12, 3, 'G�rkem', 'Tuna', '12345678905', '1995-02-05', 'Erkek', 'Banka Memuru', 7500.00, '2021-06-01'),
	(13, 3, 'Asl�', 'Tanr�kulu', '12345678924', '1997-08-10', 'Kad�n', 'Gi�e Memuru', 7500.00, '2022-06-01'),
	(14, 3, 'Kerem', 'Ayd�n', '12345678929', '1993-09-15', 'Erkek', 'Banka Memuru', 8000.00, '2020-12-01'),
	(15, 3, 'Sevgi', 'Ko�', '12345678930', '1998-01-20', 'Kad�n', 'Gi�e Memuru', 7200.00, '2023-04-01'),

-- Konak �ube (SubeID = 4)
	(16, 4, 'Nihan', '�etinkaya', '12345678906', '1992-01-30', 'Kad�n', '�ube M�d�r�', 13000.00, '2017-10-01'),
	(17, 4, 'Deniz', 'Ko�ak', '12345678916', '1990-11-10', 'Kad�n', 'Banka Memuru', 8000.00, '2019-05-15'),
	(18, 4, 'Zeynep', '�en', '12345678918', '1995-01-25', 'Kad�n', 'Gi�e Memuru', 7000.00, '2021-10-01'),
	(19, 4, 'Burak', 'Kaya', '12345678931', '1988-03-28', 'Erkek', 'Banka Memuru', 7800.00, '2020-01-01'),
	(20, 4, 'Ebru', 'Turan', '12345678932', '1994-12-10', 'Kad�n', 'Gi�e Memuru', 7200.00, '2023-06-01'),

-- Osmangazi �ube (SubeID = 5)
	(21, 5, 'Ali', 'Bayraktar', '12345678907', '1987-12-17', 'Erkek', '�ube M�d�r�', 8500.00, '2020-01-10'),
	(22, 5, 'Baran', '�ift�i', '12345678917', '1989-12-20', 'Erkek', 'Banka Memuru', 8000.00, '2020-06-10'),
	(23, 5, 'Dilan', '�elik', '12345678923', '1993-02-20', 'Kad�n', 'Gi�e Memuru', 7500.00, '2021-01-15'),
	(24, 5, 'Yusuf', 'Acar', '12345678933', '1995-05-15', 'Erkek', 'Banka Memuru', 7700.00, '2021-10-01'),
	(25, 5, 'Elif', 'Bozkurt', '12345678934', '1997-03-05', 'Kad�n', 'Gi�e Memuru', 7100.00, '2022-08-01'),

-- Kar��yaka �ube (SubeID = 6)
	(26, 6, 'Canan', 'Eren', '12345678908', '1993-04-20', 'Kad�n', '�ube M�d�r�', 7500.00, '2021-05-01'),
	(27, 6, '�lker', 'Bulut', '12345678920', '1991-03-15', 'Erkek', 'Banka Memuru', 7500.00, '2022-03-01'),
	(28, 6, 'Ali', 'Tekin', '12345678921', '1988-05-30', 'Erkek', 'Banka Memuru', 7800.00, '2021-02-01'),
	(29, 6, 'Eda', 'Sar�', '12345678935', '1995-11-25', 'Kad�n', 'Gi�e Memuru', 7100.00, '2022-11-01'),
	(30, 6, 'Asl�', 'Ko�', '12345678936', '1994-02-14', 'Kad�n', 'Gi�e Memuru', 7300.00, '2023-04-01'),

-- �i�li �ube (SubeID = 7)
	(31, 7, 'Suat', 'Tuncer', '12345678909', '1980-10-08', 'Erkek', '�ube M�d�r�', 14000.00, '2010-03-12'),
	(32, 7, 'Burak', 'Deniz', '12345678919', '1982-07-15', 'Erkek', 'Banka Memuru', 13500.00, '2008-04-20'),
	(33, 7, 'Can', 'Kara', '12345678911', '1985-08-10', 'Erkek', 'Banka Memuru', 8100.00, '2021-08-01'),
	(34, 7, 'Merve', 'Kurt', '12345678937', '1990-06-15', 'Kad�n', 'Gi�e Memuru', 7400.00, '2023-03-01'),
	(35, 7, 'Ebru', 'Ayd�n', '12345678938', '1996-09-25', 'Kad�n', 'Gi�e Memuru', 7000.00, '2022-10-01'),

-- Bornova �ube (SubeID = 8)
	(36, 8, 'Ay�eg�l', 'Y�ksel', '12345678912', '1991-03-18', 'Kad�n', '�ube M�d�r�', 13500.00, '2020-12-01'),
	(37, 8, 'Selin', 'Ko�', '12345678922', '1996-09-05', 'Kad�n', 'Banka Memuru', 8000.00, '2021-12-15'),
	(38, 8, 'Serhat', '�zt�rk', '12345678939', '1989-07-10', 'Erkek', 'Banka Memuru', 8100.00, '2021-05-01'),
	(39, 8, 'Neslihan', 'Demir', '12345678940', '1993-08-12', 'Kad�n', 'Gi�e Memuru', 7300.00, '2022-07-01'),
	(40, 8, 'Mert', '�en', '12345678941', '1995-01-10', 'Erkek', 'Gi�e Memuru', 7200.00, '2023-02-01'),

-- Kad�k�y �ube (SubeID = 9)
	(41, 9, 'Haluk', 'Demirkan', '12345678942', '1981-04-18', 'Erkek', '�ube M�d�r�', 12500.00, '2018-01-10'),
	(42, 9, 'Zehra', 'Erden', '12345678943', '1990-11-22', 'Kad�n', 'Banka Memuru', 7800.00, '2021-09-01'),
	(43, 9, 'Taylan', '�zer', '12345678944', '1987-03-05', 'Erkek', 'Banka Memuru', 7700.00, '2022-05-01'),
	(44, 9, 'Ecem', 'Bilir', '12345678945', '1992-08-30', 'Kad�n', 'Gi�e Memuru', 7300.00, '2023-03-01'),
	(45, 9, 'Bar��', 'Y�lmaz', '12345678946', '1995-05-12', 'Erkek', 'Gi�e Memuru', 7200.00, '2022-12-01'),

-- Bak�rk�y �ube (SubeID = 10)
	(46, 10, 'Nihat', 'Kaya', '12345678947', '1983-12-07', 'Erkek', '�ube M�d�r�', 13000.00, '2019-08-01'),
	(47, 10, 'Duygu', 'Kara', '12345678948', '1992-02-27', 'Kad�n', 'Banka Memuru', 7900.00, '2020-09-01'),
	(48, 10, 'Selim', 'Arslan', '12345678949', '1986-06-15', 'Erkek', 'Banka Memuru', 8000.00, '2021-04-01'),
	(49, 10, 'Seda', '��nar', '12345678950', '1994-01-25', 'Kad�n', 'Gi�e Memuru', 7400.00, '2023-02-01'),
	(50, 10, 'Buse', 'G�k', '12345678951', '1996-03-14', 'Kad�n', 'Gi�e Memuru', 7100.00, '2022-11-01');
