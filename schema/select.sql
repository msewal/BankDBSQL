-- 1) Her müþterinin toplam yýllýk gelirini ve ortalamadan yüksek olanlarý listele
SELECT m.MusteriID, m.Ad, m.Soyad, p.Meslek, 
	SUM(p.YillikGelir) AS ToplamGelir, 
    AVG(p.AylikGider) AS OrtalamaAylikGider 
FROM tblMusteri m 
INNER JOIN tblMusteriProfil p ON m.MusteriID = p.MusteriID 
GROUP BY m.MusteriID, m.Ad, m.Soyad, p.Meslek 
HAVING SUM(p.YillikGelir) > (SELECT AVG(YillikGelir) FROM tblMusteriProfil) 
ORDER BY ToplamGelir DESC;

-- 2) Kredi kartý limitinin %10'unu aþan toplam harcamalarý olan müþterileri listele
SELECT m.MusteriID, m.Ad, m.Soyad, k.KartNumarasi, k.Limit, 
	SUM(k.KullanilabilirLimit) AS KalanLimit, 
    (k.Limit - SUM(k.KullanilabilirLimit)) AS HarcananTutar 
FROM tblMusteri m INNER JOIN tblKrediKarti k ON m.MusteriID = k.MusteriID 
GROUP BY m.MusteriID, m.Ad, m.Soyad, k.KartNumarasi, k.Limit 
HAVING (k.Limit - SUM(k.KullanilabilirLimit)) > (k.Limit * 0.10) 
ORDER BY HarcananTutar DESC;

-- 3) Para çekme iþlemleri ve iþlem kategorileri
SELECT ai.ATMIslemID, ai.HesapID, ai.IslemTipi, ai.IslemTarihi, ai.IslemMiktari,
    CASE 
        WHEN ai.IslemMiktari > 500 THEN 'Büyük Ýþlem' ELSE 'Küçük Ýþlem' 
    END AS IslemKategorisi, h.HesapTipi
FROM tblATMIslemleri ai JOIN tblHesap h ON ai.HesapID = h.HesapID
WHERE ai.IslemTipi = 'Para Çekme' AND ai.IslemMiktari > 750 
ORDER BY ai.IslemTarihi DESC;

-- 4) Yüksek bakiyeli aktif hesaplar ve iþlem sayýlarý
SELECT h.HesapNumarasi, h.HesapTipi, h.Bakiye, m.Ad AS MusteriAdi, m.Soyad AS MusteriSoyadi,
    (SELECT COUNT(*) FROM tblIslem i WHERE i.HesapID = h.HesapID) AS ToplamIslemSayisi
FROM tblHesap h JOIN tblMusteri m ON h.MusteriID = m.MusteriID
WHERE h.Bakiye > 5000 AND h.Durum = 'Aktif' ORDER BY h.Bakiye DESC;

-- 5) Ýncelenen veya çözüm bekleyen iletiþimler
SELECT i.MusteriID, m.Ad, m.Soyad, i.Konu, i.Mesaj, i.Durum,
    CASE 
        WHEN i.Durum = 'Ýnceleniyor' THEN 'Acil' ELSE 'Normal' 
    END AS OncelikSeviyesi
FROM tblIletisim i JOIN tblMusteri m ON i.MusteriID = m.MusteriID
WHERE i.GonderimTarihi > '2023-01-01' AND i.Durum IN ('Ýnceleniyor', 'Çözüm Bekliyor')
ORDER BY i.GonderimTarihi DESC;

-- 6) Havale iþlemleri ve ilgili müþteri bilgileri
SELECT i.IslemID, i.HesapID, i.IslemTipi, i.IslemMiktari,
    i.IslemTarihi, h.Bakiye, m.Ad AS MusteriAdi, m.Soyad AS MusteriSoyadi
FROM tblIslem i JOIN tblHesap h ON i.HesapID = h.HesapID
JOIN tblMusteri m ON h.MusteriID = m.MusteriID WHERE i.IslemTipi = 'Havale'
AND i.IslemMiktari BETWEEN 1000 AND 5000 AND h.Durum = 'Aktif' ORDER BY i.IslemTarihi ASC;

-- 7) Onay durumu ve kredi detaylarý
SELECT kb.BasvuruID, kb.MusteriID, kb.KrediMiktari, kb.Vade, kb.FaizOrani, kb.Durum,
    CASE 
        WHEN kb.Durum = 'Onaylandý' THEN 'Baþarýlý' 
        WHEN kb.Durum = 'Reddedildi' THEN 'Baþarýsýz' ELSE 'Bekliyor' 
    END AS BasvuruSonucu FROM tblKrediBasvurusu kb 
WHERE kb.Vade > 12 AND kb.FaizOrani < 2.0 ORDER BY kb.KrediMiktari DESC;

-- 8) Kullanýlabilir limit düþük olan kartlar
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

-- 10) Þikayet durumlarýna göre gruplama
SELECT s.SikayetID, m.Ad AS MusteriAdi, m.Soyad 
	AS MusteriSoyadi, s.SikayetKonusu, s.SikayetDurumu,
    COUNT(*) OVER(PARTITION BY s.SikayetDurumu) AS DurumSayisi
FROM tblSikayet s JOIN tblMusteri m ON s.MusteriID = m.MusteriID
WHERE s.SikayetDurumu IN ('Çözüm Bekliyor', 'Ýnceleniyor') 
ORDER BY s.SikayetTarihi DESC;

-- 11) Her müþterinin yaptýðý þikayetlerin sayýsýný 
--listele ve sadece 3'ten fazla þikayeti olanlarý göste
SELECT MusteriID, COUNT(*) AS SikayetSayisi FROM tblSikayet
GROUP BY MusteriID HAVING COUNT(*) > 3;

-- 12) Son 7 gün içinde toplam iþlem miktarý belirli bir eþiði aþan hesaplarý listele
SELECT h.HesapID,
    COUNT(i.IslemID) AS ToplamIslemSayisi, SUM(i.IslemMiktari) AS ToplamIslemMiktari,
    MAX(i.IslemMiktari) AS MaksimumIslemMiktari, i.IslemTipi
FROM tblHesap h JOIN tblIslem i ON h.HesapID = i.HesapID
WHERE DATEDIFF(DAY, i.IslemTarihi, GETDATE()) <= 7
GROUP BY h.HesapID, i.IslemTipi HAVING SUM(i.IslemMiktari) > 50000;

-- 13) Þikayeti "Ýnceleniyor" olan müþterilerin ad ve soyadýný listele
SELECT MusteriID, Ad, Soyad FROM tblMusteri
WHERE MusteriID IN (SELECT MusteriID FROM tblSikayet 
WHERE SikayetDurumu = 'Ýnceleniyor');

-- 14) Müþterinin þikayet ve iþlem geçmiþini tek bir tablo olarak göster:
SELECT MusteriID, SikayetKonusu AS Detay, SikayetTarihi AS Tarih
FROM tblSikayet
UNION
SELECT HesapID AS MusteriID, CAST(IslemMiktari AS NVARCHAR) 
AS Detay, IslemTarihi AS Tarih FROM tblIslem;

-- 15) Hem "Bloke" edilmiþ hem de þikayet kaydý olan müþterileri listele:
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

-- 16) Hesap sahibi olup hiç þikayet kaydý bulunmayan müþterileri listele
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

-- 17) Her hesabýn ortalama iþlem miktarýný hesapla ve sadece 1000'den fazla olanlarý göster
SELECT HesapID, AVG(IslemMiktari) AS OrtalamaIslemMiktari
FROM tblIslem
GROUP BY HesapID
HAVING AVG(IslemMiktari) > 1000;

-- 18) Hangi hesaplarýn hiç þikayeti olmadýðýný listele
SELECT h.HesapID, h.Bakiye , s.SikayetID, s.SikayetDurumu
FROM tblHesap h
LEFT JOIN tblSikayet s ON h.MusteriID = s.MusteriID
WHERE s.MusteriID IS NULL;

-- 19) Bir hesapta 2,000'den büyük bir iþlem olup olmadýðý 
SELECT HesapID, Bakiye
FROM tblHesap h
WHERE EXISTS (
    SELECT 1
    FROM tblIslem i
    WHERE i.HesapID = h.HesapID
      AND i.IslemMiktari > 2000);

-- 20) Son 30 gün içinde yapýlan þikayetlerin sayýsý 
--ve þikayet tarihlerine göre gruplanmasý
SELECT 
    COUNT(*) AS SikayetSayisi, 
    CONVERT(DATE, SikayetTarihi) AS Gun
FROM tblSikayet
WHERE DATEDIFF(DAY, SikayetTarihi, GETDATE()) <= 30
GROUP BY CONVERT(DATE, SikayetTarihi)
ORDER BY Gun DESC;

-- 21) Müþterilerin isimlerini ve ilgili þikayetlerin detaylarýný listele
SELECT 
    m.MusteriID, 
    m.Ad, 
    m.Soyad, 
    s.SikayetKonusu, 
    s.SikayetDurumu
FROM tblMusteri m
INNER JOIN tblSikayet s ON m.MusteriID = s.MusteriID;

-- 22) Hangi müþterilerin þikayet kaydý olmadýðýný belirle
SELECT 
    m.MusteriID, 
    m.Ad, 
    m.Soyad, 
    s.SikayetID
FROM tblMusteri m
LEFT JOIN tblSikayet s ON m.MusteriID = s.MusteriID
WHERE s.SikayetID IS NULL;

-- 23) Tüm þikayetlerin yanýnda aktif hesaplara dair bilgileri göster
SELECT 
    h.HesapID, 
    h.Bakiye, 
    h.Durum, 
    s.SikayetDurumu
FROM tblSikayet s
RIGHT JOIN tblHesap h ON s.MusteriID = h.MusteriID
WHERE h.Durum = 'Aktif';

-- 24) Müþterilerin þikayet yapýp yapmadýðýný belirlemek için tüm kayýtlarý listele
SELECT 
    m.MusteriID, 
    m.Ad, 
    m.Soyad, 
    s.SikayetKonusu, 
    s.SikayetDurumu
FROM tblMusteri m
FULL OUTER JOIN tblSikayet s ON m.MusteriID = s.MusteriID;

-- 25) Her müþterinin kredi kartý bilgilerini göster
SELECT 
    m.MusteriID, 
    m.Ad, 
    m.Soyad, 
    k.KartNumarasi, 
    k.Limit, 
    k.KullanilabilirLimit
FROM tblMusteri m
JOIN tblKrediKarti k ON m.MusteriID = k.MusteriID;

-- 26) Her þikayet ile ilgili müþteri hesabýný ve bakiyesini listele
SELECT 
    s.SikayetID, 
    s.SikayetKonusu, 
    h.HesapID, 
    h.Bakiye
FROM tblSikayet s
JOIN tblHesap h ON s.MusteriID = h.MusteriID;

-- 27) Her bir iþlemi ve ilgili hesap detaylarýný göster
SELECT 
    i.IslemID, 
    i.IslemTipi, 
    i.IslemMiktari, 
    h.Bakiye, 
    h.HesapTipi
FROM tblIslem i
JOIN tblHesap h ON i.HesapID = h.HesapID;

-- 28) Kredi baþvurusu olmayan müþterileri belirlemek için
SELECT 
    m.MusteriID, 
    m.Ad, 
    m.Soyad, 
    k.Durum AS KrediDurumu
FROM tblMusteri m
LEFT JOIN tblKrediBasvurusu k ON m.MusteriID = k.MusteriID
WHERE k.Durum IS NULL;

-- 29) Her ATM iþlemini ve hesabýn müþteri bilgilerini göster
SELECT 
    ai.ATMIslemID, 
    ai.IslemTipi, 
    ai.IslemMiktari, 
    m.Ad, 
    m.Soyad
FROM tblATMIslemleri ai
JOIN tblHesap h ON ai.HesapID = h.HesapID
JOIN tblMusteri m ON h.MusteriID = m.MusteriID;

-- 30) Müþterilerin gelir durumlarý ve yaptýklarý þikayetleri analiz et
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