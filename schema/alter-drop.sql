----ALTER VE DROP ÝÞLEMLERÝ----

-- tblMusteri Tablosu
ALTER TABLE tblMusteri ADD VergiNumarasi NVARCHAR(15);
ALTER TABLE tblMusteri ALTER COLUMN TelefonNumarasi NVARCHAR(20);
ALTER TABLE tblMusteri ADD KayitTarihi DATETIME;
ALTER TABLE tblMusteri DROP COLUMN PostaKodu;
ALTER TABLE tblMusteri ADD CONSTRAINT CK_Cinsiyet CHECK (Cinsiyet IN ('Erkek', 'Kadýn'));
DROP TABLE tblMusteri;

-- tblHesap Tablosu
ALTER TABLE tblHesap ADD IBAN NVARCHAR(34);
ALTER TABLE tblHesap ALTER COLUMN HesapNumarasi NVARCHAR(30);
ALTER TABLE tblHesap ADD Aciklama NVARCHAR(255);
ALTER TABLE tblHesap DROP COLUMN Durum;
ALTER TABLE tblHesap ADD CONSTRAINT CK_Bakiye CHECK (Bakiye >= 0);
DROP TABLE tblHesap;

-- tblIslem Tablosu
ALTER TABLE tblIslem ADD ReferansNo NVARCHAR(50);
ALTER TABLE tblIslem ALTER COLUMN IslemMiktari DECIMAL(18,4);
ALTER TABLE tblIslem ADD IslemDurumu NVARCHAR(50);
ALTER TABLE tblIslem DROP COLUMN Aciklama;
ALTER TABLE tblIslem ADD CONSTRAINT CK_IslemTipi CHECK (IslemTipi IN ('Para Çekme', 'Para Yatýrma', 'Havale'));
DROP TABLE tblIslem;

-- tblKrediBasvurusu Tablosu
ALTER TABLE tblKrediBasvurusu ADD Teminat NVARCHAR(255);
ALTER TABLE tblKrediBasvurusu ALTER COLUMN FaizOrani DECIMAL(6,3);
ALTER TABLE tblKrediBasvurusu ADD OnayTarihi DATETIME;
ALTER TABLE tblKrediBasvurusu DROP COLUMN Vade;
ALTER TABLE tblKrediBasvurusu ADD CONSTRAINT CK_KrediDurumu CHECK (Durum IN ('Onaylandý', 'Reddedildi', 'Ýnceleniyor'));
DROP TABLE tblKrediBasvurusu;

-- tblKrediOdeme Tablosu
ALTER TABLE tblKrediOdeme ADD GecikmeTutari DECIMAL(18,2);
ALTER TABLE tblKrediOdeme ALTER COLUMN OdemeMiktari DECIMAL(18,4);
ALTER TABLE tblKrediOdeme ADD OdemeYeri NVARCHAR(50);
ALTER TABLE tblKrediOdeme DROP COLUMN KalanBorc;
ALTER TABLE tblKrediOdeme ADD CONSTRAINT CK_OdemeDurumu CHECK (OdemeMiktari >= 0);
DROP TABLE tblKrediOdeme;

-- tblKrediKarti Tablosu
ALTER TABLE tblKrediKarti ADD KartDurumu NVARCHAR(50);
ALTER TABLE tblKrediKarti DROP COLUMN CVV;
ALTER TABLE tblKrediKarti ALTER COLUMN Limit DECIMAL(18,4);
ALTER TABLE tblKrediKarti ADD BankaAdi NVARCHAR(100);
ALTER TABLE tblKrediKarti ADD SonGuncellemeTarihi DATETIME;
DROP TABLE tblKrediKarti;

-- tblSube Tablosu
ALTER TABLE tblSube ADD SubeKodu NVARCHAR(10);
ALTER TABLE tblSube DROP COLUMN TelefonNumarasi;
ALTER TABLE tblSube ALTER COLUMN Adres NVARCHAR(500);
ALTER TABLE tblSube ADD Ilce NVARCHAR(50);
ALTER TABLE tblSube ADD Yetkili NVARCHAR(100);
DROP TABLE tblSube;

-- tblPersonel Tablosu
ALTER TABLE tblPersonel ADD TelefonNumarasi NVARCHAR(15);
ALTER TABLE tblPersonel DROP COLUMN Cinsiyet;
ALTER TABLE tblPersonel ALTER COLUMN Maas DECIMAL(18,4);
ALTER TABLE tblPersonel ADD IzinHakki INT;
ALTER TABLE tblPersonel ADD Birim NVARCHAR(50);
DROP TABLE tblPersonel;

-- tblSigorta Tablosu
ALTER TABLE tblSigorta ADD SigortaTuru NVARCHAR(50);
ALTER TABLE tblSigorta DROP COLUMN Durum;
ALTER TABLE tblSigorta ALTER COLUMN PrimTutari DECIMAL(18,4);
ALTER TABLE tblSigorta ADD PoliçeNumarasi NVARCHAR(20);
ALTER TABLE tblSigorta ADD SigortaAciklamasi NVARCHAR(255);
DROP TABLE tblSigorta;

-- tblATMIslemleri Tablosu
ALTER TABLE tblATMIslemleri ADD ATMModeli NVARCHAR(50);
ALTER TABLE tblATMIslemleri DROP COLUMN ATMNumarasi;
ALTER TABLE tblATMIslemleri ALTER COLUMN IslemMiktari DECIMAL(18,4);
ALTER TABLE tblATMIslemleri ADD ATMAdresi NVARCHAR(255);
ALTER TABLE tblATMIslemleri ADD OnayKodu NVARCHAR(20);
DROP TABLE tblATMIslemleri;

-- tblSikayet Tablosu
ALTER TABLE tblSikayet ADD SikayetTuru NVARCHAR(100);
ALTER TABLE tblSikayet DROP COLUMN SikayetDurumu;
ALTER TABLE tblSikayet ALTER COLUMN SikayetKonusu NVARCHAR(500);
ALTER TABLE tblSikayet ADD SikayetCevabi NVARCHAR(255);
ALTER TABLE tblSikayet ADD SikayetSonucTarihi DATETIME;
DROP TABLE tblSikayet;

-- tblIletisim Tablosu
ALTER TABLE tblIletisim ADD GeriDonusTarihi DATETIME;
ALTER TABLE tblIletisim DROP COLUMN Durum;
ALTER TABLE tblIletisim ALTER COLUMN Mesaj NVARCHAR(2000);
ALTER TABLE tblIletisim ADD KonuKategorisi NVARCHAR(50);
ALTER TABLE tblIletisim ADD IletisimDurumu NVARCHAR(50);
DROP TABLE tblIletisim;

-- tblMusteriProfil Tablosu
ALTER TABLE tblMusteriProfil ADD Yas INT;
ALTER TABLE tblMusteriProfil DROP COLUMN Aciklama;
ALTER TABLE tblMusteriProfil ALTER COLUMN GelirBilgisi DECIMAL(18,4);
ALTER TABLE tblMusteriProfil ADD Hobi NVARCHAR(255);
ALTER TABLE tblMusteriProfil ADD EkGelir DECIMAL(18,2);
DROP TABLE tblMusteriProfil;
