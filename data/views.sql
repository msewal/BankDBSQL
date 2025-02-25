----VIEWS----
-- 1) 
CREATE VIEW ATMIslem_View AS
SELECT 
    a.ATMIslemID, 
    a.IslemTipi, 
    a.IslemMiktari, 
    a.ATMNumarasi, 
    a.IslemTarihi, 
    m.Ad AS MusteriAd, 
    m.Soyad AS MusteriSoyad
FROM tblATMIslemleri a
INNER JOIN tblHesap h ON a.HesapID = h.HesapID
INNER JOIN tblMusteri m ON h.MusteriID = m.MusteriID;

-- 2)
CREATE VIEW IletisimKayit_View AS
SELECT 
    i.IletisimID, 
    m.MusteriID, 
    m.Ad AS MusteriAd, 
    m.Soyad AS MusteriSoyad, 
    i.Konu, 
    i.Mesaj, 
    i.GonderimTarihi, 
    i.Durum
FROM tblIletisim i
INNER JOIN tblMusteri m ON i.MusteriID = m.MusteriID;

-- 3)	IslemBilgileri
CREATE VIEW IslemBilgileri_View AS
SELECT i.IslemID, i.IslemTipi, i.IslemMiktari, i.IslemTarihi, h.HesapNumarasi, m.Ad 
AS MusteriAd, m.Soyad AS MusteriSoyad
FROM tblIslem i INNER JOIN tblHesap h ON i.HesapID = h.HesapID  
INNER JOIN tblMusteri m ON h.MusteriID = m.MusteriID;

-- 4)	SigortaDetay
CREATE VIEW SigortaDetay_View AS
SELECT s.SigortaID, m.MusteriID, m.Ad AS MusteriAd, m.Soyad 
AS MusteriSoyad, s.SigortaTipi, s.BaslangicTarihi, s.BitisTarihi, s.PrimTutari
FROM tblSigorta s INNER JOIN tblMusteri m ON s.MusteriID = m.MusteriID;

-- 5)	--HesapBilgileri
CREATE VIEW HesapBilgileri_View AS
SELECT h.HesapID, h.HesapNumarasi, 
    h.Bakiye, h.Durum, m.Ad AS MusteriAd, m.Soyad AS MusteriSoyad
FROM tblHesap h
INNER JOIN tblMusteri m ON h.MusteriID = m.MusteriID;

-- 6)	--KrediBasvuruAnalizi
CREATE VIEW KrediBasvuruAnalizi_View AS
SELECT kb.BasvuruID, m.MusteriID, m.Ad AS MusteriAd, m.Soyad 
AS MusteriSoyad, kb.KrediMiktari, kb.Vade, kb.FaizOrani, kb.Durum
FROM tblKrediBasvurusu kb INNER JOIN tblMusteri m ON kb.MusteriID = m.MusteriID;

-- 7)	GelirAnalizi
CREATE VIEW GelirAnalizi_View AS
SELECT 
    m.MusteriID, m.Ad AS MusteriAd, m.Soyad AS MusteriSoyad, p.GelirBilgisi, 
    p.AylikGider, (p.GelirBilgisi - p.AylikGider) AS NetGelir, p.YillikGelir
FROM tblMusteri m INNER JOIN tblMusteriProfil p ON m.MusteriID = p.MusteriID;



SELECT * FROM ATMIslem_View;
SELECT * FROM IletisimKayit_View;
SELECT * FROM IslemBilgileri_View;
SELECT * FROM SigortaDetay_View;
SELECT * FROM HesapBilgileri_View;
SELECT * FROM KrediBasvuruAnalizi_View;
SELECT * FROM GelirAnalizi_View;
