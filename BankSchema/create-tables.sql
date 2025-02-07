-- TABLO OLUÞTURMA (CREATE)

CREATE TABLE tblMusteri (
    MusteriID INT PRIMARY KEY,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    TCKimlikNo NVARCHAR(11) UNIQUE,
    DogumTarihi DATE,
    Cinsiyet NVARCHAR(10),
    Email NVARCHAR(100) UNIQUE,
    TelefonNumarasi NVARCHAR(15),
    Adres NVARCHAR(255),
    Sehir NVARCHAR(50),
    PostaKodu NVARCHAR(10),
    Uyruk NVARCHAR(50),
    HesapDurumu NVARCHAR(20)
);

CREATE TABLE tblHesap (
    HesapID INT PRIMARY KEY,
    MusteriID INT FOREIGN KEY REFERENCES tblMusteri(MusteriID),
    HesapNumarasi NVARCHAR(20) UNIQUE,
    HesapTipi NVARCHAR(30),
    Bakiye DECIMAL(18,2),
    OlusturmaTarihi DATETIME,
    Durum NVARCHAR(20)
);

CREATE TABLE tblIslem (
    IslemID INT PRIMARY KEY,
    HesapID INT FOREIGN KEY REFERENCES tblHesap(HesapID),
    IslemTipi NVARCHAR(50),
    IslemMiktari DECIMAL(18,2),
    IslemTarihi DATETIME,
    Aciklama NVARCHAR(255)
);

CREATE TABLE tblKrediBasvurusu (
    BasvuruID INT PRIMARY KEY,
    MusteriID INT FOREIGN KEY REFERENCES tblMusteri(MusteriID),
    BasvuruTarihi DATETIME,
    KrediMiktari DECIMAL(18,2),
    Vade INT,
    FaizOrani DECIMAL(5,2),
    Durum NVARCHAR(20)
);

CREATE TABLE tblKrediOdeme (
    OdemeID INT PRIMARY KEY,
    BasvuruID INT FOREIGN KEY REFERENCES tblKrediBasvurusu(BasvuruID),
    OdemeTarihi DATETIME,
    OdemeMiktari DECIMAL(18,2),
    KalanBorc DECIMAL(18,2)
);

CREATE TABLE tblKrediKarti (
    KrediKartiID INT PRIMARY KEY,
    MusteriID INT FOREIGN KEY REFERENCES tblMusteri(MusteriID),
    KartNumarasi NVARCHAR(16) UNIQUE,
    KartTipi NVARCHAR(50),
    SonKullanmaTarihi DATETIME,
    CVV NVARCHAR(3),
    Limit DECIMAL(18,2),
    KullanilabilirLimit DECIMAL(18,2)
);

CREATE TABLE tblSube (
    SubeID INT PRIMARY KEY,
    SubeAdi NVARCHAR(100),
    Adres NVARCHAR(255),
    Sehir NVARCHAR(50),
    TelefonNumarasi NVARCHAR(15)
);

CREATE TABLE tblPersonel (
    PersonelID INT PRIMARY KEY,
    SubeID INT FOREIGN KEY REFERENCES tblSube(SubeID),
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    TCKimlikNo NVARCHAR(11),
    DogumTarihi DATE,
    Cinsiyet NVARCHAR(10),
    Pozisyon NVARCHAR(50),
    Maas DECIMAL(18,2),
    IseBaslamaTarihi DATETIME
);

CREATE TABLE tblSigorta (
    SigortaID INT PRIMARY KEY,
    MusteriID INT FOREIGN KEY REFERENCES tblMusteri(MusteriID),
    SigortaTipi NVARCHAR(50),
    BaslangicTarihi DATETIME,
    BitisTarihi DATETIME,
    PrimTutari DECIMAL(18,2),
    Durum NVARCHAR(20)
);

CREATE TABLE tblATMIslemleri (
    ATMIslemID INT PRIMARY KEY,
    HesapID INT FOREIGN KEY REFERENCES tblHesap(HesapID),
    IslemTipi NVARCHAR(50),
    IslemTarihi DATETIME,
    IslemMiktari DECIMAL(18,2),
    ATMNumarasi NVARCHAR(20)
);

CREATE TABLE tblSikayet (
    SikayetID INT PRIMARY KEY,
    MusteriID INT FOREIGN KEY REFERENCES tblMusteri(MusteriID),
    SikayetTarihi DATETIME,
    SikayetKonusu NVARCHAR(255),
    SikayetDurumu NVARCHAR(50)
);

CREATE TABLE tblIletisim (
    IletisimID INT PRIMARY KEY,
    MusteriID INT FOREIGN KEY REFERENCES tblMusteri(MusteriID),
    Konu NVARCHAR(100),
    Mesaj NVARCHAR(1000),
    GonderimTarihi DATETIME,
    Durum NVARCHAR(50)
);

CREATE TABLE tblMusteriProfil (
    ProfilID INT PRIMARY KEY,
    MusteriID INT FOREIGN KEY REFERENCES tblMusteri(MusteriID),
    GelirBilgisi DECIMAL(18,2),
    Meslek NVARCHAR(50),
    MedeniDurum NVARCHAR(20),
    AylikGider DECIMAL(18,2),
    YillikGelir DECIMAL(18,2),
    Aciklama NVARCHAR(255)
);


