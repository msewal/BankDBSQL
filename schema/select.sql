-- 1) Her m��terinin toplam y�ll�k gelirini ve ortalamadan y�ksek olanlar� listele
SELECT m.MusteriID, m.Ad, m.Soyad, p.Meslek, 
	SUM(p.YillikGelir) AS ToplamGelir, 
    AVG(p.AylikGider) AS OrtalamaAylikGider 
FROM tblMusteri m 
INNER JOIN tblMusteriProfil p ON m.MusteriID = p.MusteriID 
GROUP BY m.MusteriID, m.Ad, m.Soyad, p.Meslek 
HAVING SUM(p.YillikGelir) > (SELECT AVG(YillikGelir) FROM tblMusteriProfil) 
ORDER BY ToplamGelir DESC;

-- 2) Kredi kart� limitinin %10'unu a�an toplam harcamalar� olan m��terileri listele
SELECT m.MusteriID, m.Ad, m.Soyad, k.KartNumarasi, k.Limit, 
	SUM(k.KullanilabilirLimit) AS KalanLimit, 
    (k.Limit - SUM(k.KullanilabilirLimit)) AS HarcananTutar 
FROM tblMusteri m INNER JOIN tblKrediKarti k ON m.MusteriID = k.MusteriID 
GROUP BY m.MusteriID, m.Ad, m.Soyad, k.KartNumarasi, k.Limit 
HAVING (k.Limit - SUM(k.KullanilabilirLimit)) > (k.Limit * 0.10) 
ORDER BY HarcananTutar DESC;

-- 3) Para �ekme i�lemleri ve i�lem kategorileri
SELECT ai.ATMIslemID, ai.HesapID, ai.IslemTipi, ai.IslemTarihi, ai.IslemMiktari,
    CASE 
        WHEN ai.IslemMiktari > 500 THEN 'B�y�k ��lem' ELSE 'K���k ��lem' 
    END AS IslemKategorisi, h.HesapTipi
FROM tblATMIslemleri ai JOIN tblHesap h ON ai.HesapID = h.HesapID
WHERE ai.IslemTipi = 'Para �ekme' AND ai.IslemMiktari > 750 
ORDER BY ai.IslemTarihi DESC;

-- 4) Y�ksek bakiyeli aktif hesaplar ve i�lem say�lar�
SELECT h.HesapNumarasi, h.HesapTipi, h.Bakiye, m.Ad AS MusteriAdi, m.Soyad AS MusteriSoyadi,
    (SELECT COUNT(*) FROM tblIslem i WHERE i.HesapID = h.HesapID) AS ToplamIslemSayisi
FROM tblHesap h JOIN tblMusteri m ON h.MusteriID = m.MusteriID
WHERE h.Bakiye > 5000 AND h.Durum = 'Aktif' ORDER BY h.Bakiye DESC;

-- 5) �ncelenen veya ��z�m bekleyen ileti�imler
SELECT i.MusteriID, m.Ad, m.Soyad, i.Konu, i.Mesaj, i.Durum,
    CASE 
        WHEN i.Durum = '�nceleniyor' THEN 'Acil' ELSE 'Normal' 
    END AS OncelikSeviyesi
FROM tblIletisim i JOIN tblMusteri m ON i.MusteriID = m.MusteriID
WHERE i.GonderimTarihi > '2023-01-01' AND i.Durum IN ('�nceleniyor', '��z�m Bekliyor')
ORDER BY i.GonderimTarihi DESC;

-- 6) Havale i�lemleri ve ilgili m��teri bilgileri
SELECT i.IslemID, i.HesapID, i.IslemTipi, i.IslemMiktari,
    i.IslemTarihi, h.Bakiye, m.Ad AS MusteriAdi, m.Soyad AS MusteriSoyadi
FROM tblIslem i JOIN tblHesap h ON i.HesapID = h.HesapID
JOIN tblMusteri m ON h.MusteriID = m.MusteriID WHERE i.IslemTipi = 'Havale'
AND i.IslemMiktari BETWEEN 1000 AND 5000 AND h.Durum = 'Aktif' ORDER BY i.IslemTarihi ASC;

-- 7) Onay durumu ve kredi detaylar�
SELECT kb.BasvuruID, kb.MusteriID, kb.KrediMiktari, kb.Vade, kb.FaizOrani, kb.Durum,
    CASE 
        WHEN kb.Durum = 'Onayland�' THEN 'Ba�ar�l�' 
        WHEN kb.Durum = 'Reddedildi' THEN 'Ba�ar�s�z' ELSE 'Bekliyor' 
    END AS BasvuruSonucu FROM tblKrediBasvurusu kb 
WHERE kb.Vade > 12 AND kb.FaizOrani < 2.0 ORDER BY kb.KrediMiktari DESC;

-- 8) Kullan�labilir limit d���k olan kartlar
SELECT kk.KartNumarasi, kk.Limit, kk.KullanilabilirLimit, m.Ad, m.Soyad,
    (kk.Limit - kk.KullanilabilirLimit) AS KullanilanLimit
FROM tblKrediKarti kk JOIN tblMusteri m ON kk.MusteriID = m.MusteriID
WHERE kk.KullanilabilirLimit < (kk.Limit * 0.88)
AND kk.SonKullanmaTarihi > GETDATE() ORDER BY KullanilanLimit DESC;

-- 9) Gelir ve gider analizleri
SELECT m.MusteriID, m.Ad, m.Soyad, mp.Meslek, mp.AylikGider, mp.YillikGelir,
    (mp.YillikGelir - (mp.AylikGider * 12)) AS NetYillikGelir
FROM tblMusteriProfil mp JOIN tblMusteri m ON mp.MusteriID = m.MusteriID
WHERE mp.YillikGelir > 80000 ORDER BY NetYillikGelir DESC;

-- 10) �ikayet durumlar�na g�re gruplama
SELECT s.SikayetID, m.Ad AS MusteriAdi, m.Soyad 
	AS MusteriSoyadi, s.SikayetKonusu, s.SikayetDurumu,
    COUNT(*) OVER(PARTITION BY s.SikayetDurumu) AS DurumSayisi
FROM tblSikayet s JOIN tblMusteri m ON s.MusteriID = m.MusteriID
WHERE s.SikayetDurumu IN ('��z�m Bekliyor', '�nceleniyor') 
ORDER BY s.SikayetTarihi DESC;

-- 11) Her m��terinin yapt��� �ikayetlerin say�s�n� 
--listele ve sadece 3'ten fazla �ikayeti olanlar� g�ste
SELECT MusteriID, COUNT(*) AS SikayetSayisi FROM tblSikayet
GROUP BY MusteriID HAVING COUNT(*) > 3;

-- 12) Son 7 g�n i�inde toplam i�lem miktar� belirli bir e�i�i a�an hesaplar� listele
SELECT h.HesapID,
    COUNT(i.IslemID) AS ToplamIslemSayisi, SUM(i.IslemMiktari) AS ToplamIslemMiktari,
    MAX(i.IslemMiktari) AS MaksimumIslemMiktari, i.IslemTipi
FROM tblHesap h JOIN tblIslem i ON h.HesapID = i.HesapID
WHERE DATEDIFF(DAY, i.IslemTarihi, GETDATE()) <= 7
GROUP BY h.HesapID, i.IslemTipi HAVING SUM(i.IslemMiktari) > 50000;

-- 13) �ikayeti "�nceleniyor" olan m��terilerin ad ve soyad�n� listele
SELECT MusteriID, Ad, Soyad FROM tblMusteri
WHERE MusteriID IN (SELECT MusteriID FROM tblSikayet 
WHERE SikayetDurumu = '�nceleniyor');

-- 14) M��terinin �ikayet ve i�lem ge�mi�ini tek bir tablo olarak g�ster:
SELECT MusteriID, SikayetKonusu AS Detay, SikayetTarihi AS Tarih
FROM tblSikayet
UNION
SELECT HesapID AS MusteriID, CAST(IslemMiktari AS NVARCHAR) 
AS Detay, IslemTarihi AS Tarih FROM tblIslem;

-- 15) Hem "Bloke" edilmi� hem de �ikayet kayd� olan m��terileri listele:
SELECT 
    m.MusteriID, 
    m.Ad AS MusteriAd, 
    m.Soyad AS MusteriSoyad, 
    s.SikayetKonusu, 
    s.SikayetDurumu, 
    COUNT(s.SikayetID) AS SikayetSayisi
FROM tblSikayet s
JOIN tblMusteri m ON s.MusteriID = m.MusteriID
GROUP BY m.MusteriID, m.Ad, m.Soyad, s.SikayetKonusu, s.SikayetDurumu
ORDER BY SikayetSayisi DESC, m.MusteriID;

-- 16) Hesap sahibi olup hi� �ikayet kayd� bulunmayan m��terileri listele
SELECT 
    i.HesapID, 
    h.MusteriID, 
    m.Ad AS MusteriAd, 
    m.Soyad AS MusteriSoyad, 
    i.IslemTipi, 
    COUNT(i.IslemID) AS ToplamIslemSayisi, 
    SUM(i.IslemMiktari) AS ToplamIslemMiktari
FROM tblIslem i
JOIN tblHesap h ON i.HesapID = h.HesapID
JOIN tblMusteri m ON h.MusteriID = m.MusteriID
WHERE DATEDIFF(DAY, i.IslemTarihi, GETDATE()) <= 30
GROUP BY i.HesapID, h.MusteriID, m.Ad, m.Soyad, i.IslemTipi
ORDER BY ToplamIslemMiktari DESC, i.HesapID;

-- 17) Her hesab�n ortalama i�lem miktar�n� hesapla ve sadece 1000'den fazla olanlar� g�ster
SELECT HesapID, AVG(IslemMiktari) AS OrtalamaIslemMiktari
FROM tblIslem
GROUP BY HesapID
HAVING AVG(IslemMiktari) > 1000;

-- 18) Hangi hesaplar�n hi� �ikayeti olmad���n� listele
SELECT h.HesapID, h.Bakiye , s.SikayetID, s.SikayetDurumu
FROM tblHesap h
LEFT JOIN tblSikayet s ON h.MusteriID = s.MusteriID
WHERE s.MusteriID IS NULL;

-- 19) Bir hesapta 2,000'den b�y�k bir i�lem olup olmad��� 
SELECT HesapID, Bakiye
FROM tblHesap h
WHERE EXISTS (
    SELECT 1
    FROM tblIslem i
    WHERE i.HesapID = h.HesapID
      AND i.IslemMiktari > 2000);

-- 20) Son 30 g�n i�inde yap�lan �ikayetlerin say�s� 
--ve �ikayet tarihlerine g�re gruplanmas�
SELECT 
    COUNT(*) AS SikayetSayisi, 
    CONVERT(DATE, SikayetTarihi) AS Gun
FROM tblSikayet
WHERE DATEDIFF(DAY, SikayetTarihi, GETDATE()) <= 30
GROUP BY CONVERT(DATE, SikayetTarihi)
ORDER BY Gun DESC;

-- 21) M��terilerin isimlerini ve ilgili �ikayetlerin detaylar�n� listele
SELECT 
    m.MusteriID, 
    m.Ad, 
    m.Soyad, 
    s.SikayetKonusu, 
    s.SikayetDurumu
FROM tblMusteri m
INNER JOIN tblSikayet s ON m.MusteriID = s.MusteriID;

-- 22) Hangi m��terilerin �ikayet kayd� olmad���n� belirle
SELECT 
    m.MusteriID, 
    m.Ad, 
    m.Soyad, 
    s.SikayetID
FROM tblMusteri m
LEFT JOIN tblSikayet s ON m.MusteriID = s.MusteriID
WHERE s.SikayetID IS NULL;

-- 23) T�m �ikayetlerin yan�nda aktif hesaplara dair bilgileri g�ster
SELECT 
    h.HesapID, 
    h.Bakiye, 
    h.Durum, 
    s.SikayetDurumu
FROM tblSikayet s
RIGHT JOIN tblHesap h ON s.MusteriID = h.MusteriID
WHERE h.Durum = 'Aktif';

-- 24) M��terilerin �ikayet yap�p yapmad���n� belirlemek i�in t�m kay�tlar� listele
SELECT 
    m.MusteriID, 
    m.Ad, 
    m.Soyad, 
    s.SikayetKonusu, 
    s.SikayetDurumu
FROM tblMusteri m
FULL OUTER JOIN tblSikayet s ON m.MusteriID = s.MusteriID;

-- 25) Her m��terinin kredi kart� bilgilerini g�ster
SELECT 
    m.MusteriID, 
    m.Ad, 
    m.Soyad, 
    k.KartNumarasi, 
    k.Limit, 
    k.KullanilabilirLimit
FROM tblMusteri m
JOIN tblKrediKarti k ON m.MusteriID = k.MusteriID;

-- 26) Her �ikayet ile ilgili m��teri hesab�n� ve bakiyesini listele
SELECT 
    s.SikayetID, 
    s.SikayetKonusu, 
    h.HesapID, 
    h.Bakiye
FROM tblSikayet s
JOIN tblHesap h ON s.MusteriID = h.MusteriID;

-- 27) Her bir i�lemi ve ilgili hesap detaylar�n� g�ster
SELECT 
    i.IslemID, 
    i.IslemTipi, 
    i.IslemMiktari, 
    h.Bakiye, 
    h.HesapTipi
FROM tblIslem i
JOIN tblHesap h ON i.HesapID = h.HesapID;

-- 28) Kredi ba�vurusu olmayan m��terileri belirlemek i�in
SELECT 
    m.MusteriID, 
    m.Ad, 
    m.Soyad, 
    k.Durum AS KrediDurumu
FROM tblMusteri m
LEFT JOIN tblKrediBasvurusu k ON m.MusteriID = k.MusteriID
WHERE k.Durum IS NULL;

-- 29) Her ATM i�lemini ve hesab�n m��teri bilgilerini g�ster
SELECT 
    ai.ATMIslemID, 
    ai.IslemTipi, 
    ai.IslemMiktari, 
    m.Ad, 
    m.Soyad
FROM tblATMIslemleri ai
JOIN tblHesap h ON ai.HesapID = h.HesapID
JOIN tblMusteri m ON h.MusteriID = m.MusteriID;

-- 30) M��terilerin gelir durumlar� ve yapt�klar� �ikayetleri analiz et
SELECT 
    m.MusteriID, 
    m.Ad, 
    m.Soyad, 
    mp.YillikGelir, 
    s.SikayetKonusu, 
    s.SikayetDurumu
FROM tblMusteri m
JOIN tblMusteriProfil mp ON m.MusteriID = mp.MusteriID
JOIN tblSikayet s ON m.MusteriID = s.MusteriID;