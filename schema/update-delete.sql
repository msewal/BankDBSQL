----UPDATE VE DELETE ÝÞLEMLERÝ----

--tblMusteri
UPDATE tblMusteri
SET TelefonNumarasi = '5559876543', Adres = 'Bakýrköy, Ýstanbul' WHERE MusteriID = 1;

DELETE FROM tblMusteri WHERE MusteriID = 50;

--tblHesap
UPDATE tblHesap SET Bakiye = Bakiye + 1000.00 WHERE HesapID = 2;

DELETE FROM tblHesap WHERE HesapID = 50;

--tblIslem
UPDATE tblIslem
SET IslemMiktari = 2000.00, Aciklama = 'Güncellenmiþ iþlem açýklamasý'
WHERE IslemID = 5;

DELETE FROM tblIslem WHERE IslemID = 25;

--tblKrediBasvurusu 
UPDATE tblKrediBasvurusu
SET Durum = 'Onaylandý', FaizOrani = 1.75 WHERE BasvuruID = 3;

DELETE FROM tblKrediBasvurusu
WHERE BasvuruID = 15;

--tblKrediOdeme
UPDATE tblKrediOdeme
SET OdemeMiktari = 2500.00, OdemeTarihi = '2023-03-15' WHERE OdemeID = 10;

DELETE FROM tblKrediOdeme WHERE OdemeID = 30;

--tblKrediKarti
UPDATE tblKrediKarti
SET KullanilabilirLimit = KullanilabilirLimit - 500.00 WHERE KrediKartiID = 2;

DELETE FROM tblKrediKarti WHERE KrediKartiID = 20;

--tblSube
UPDATE tblSube
SET TelefonNumarasi = '0212-654-9876', 
	Adres = 'Kadýköy, Ýstanbul' WHERE SubeID = 3;

DELETE FROM tblSube WHERE SubeID = 10;

--tblPersonel
UPDATE tblPersonel
SET Maas = Maas + 500.00, 
	Pozisyon = 'Kýdemli Þube Müdürü' 
WHERE PersonelID = 7;

DELETE FROM tblPersonel
WHERE PersonelID = 25;

--tblSigorta
UPDATE tblSigorta
SET Durum = 'Pasif', 
	BitisTarihi = '2023-12-31' 
WHERE SigortaID = 2;

DELETE FROM tblSigorta 
WHERE SigortaID = 20;

--tblATMIslemleri
UPDATE tblATMIslemleri
SET IslemMiktari = 1500.00, 
	IslemTipi = 'Para Yatýrma' 
WHERE ATMIslemID = 8;
 
DELETE FROM tblATMIslemleri WHERE ATMIslemID = 35;

--tblSikayet
UPDATE tblSikayet
SET SikayetDurumu = 'Çözüldü', SikayetKonusu = 'ATM sorunlarý çözülmüþtür.'
WHERE SikayetID = 5;
 
DELETE FROM tblSikayet WHERE SikayetID = 15;

--tblIletisim
UPDATE tblIletisim
SET 
    Durum = 'Oluþturuldu', 
    Mesaj = 'Talebiniz baþarýyla oluþturuldu.'
WHERE IletisimID = 3;

DELETE FROM tblIletisim
WHERE IletisimID = 20;

--tblMusteriProfil
SET GelirBilgisi = GelirBilgisi + 1000.00, 
    Aciklama = 'Gelir bilgisi güncellenmiþtir.'
WHERE ProfilID = 5;

DELETE FROM tblMusteriProfil WHERE ProfilID = 30;
