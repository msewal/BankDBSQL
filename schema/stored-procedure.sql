----STORED PROCEDURE----

--#1--
CREATE PROCEDURE SP_SüpheliIslemleriListele
AS
BEGIN
    SELECT 
        s.SikayetID,
        m.Ad AS MusteriAd,
        m.Soyad AS MusteriSoyad,
        s.SikayetTarihi,
        s.SikayetKonusu,
        s.SikayetDurumu
    FROM tblSikayet s
    JOIN tblMusteri m ON s.MusteriID = m.MusteriID
    WHERE s.SikayetDurumu = 'Ýnceleniyor'
    ORDER BY s.SikayetTarihi DESC;
END;

--#2--
CREATE PROCEDURE SP_SüpheliHesapBlokeEt
    @HesapID INT,
    @EsikMiktar DECIMAL(18, 2) = 500000 -- Varsayýlan eþik deðeri
AS
BEGIN
    BEGIN TRANSACTION;
    -- Son 7 gün içindeki iþlemlerin toplam tutarýný kontrol et
    IF (SELECT SUM(IslemMiktari) FROM tblIslem
        WHERE HesapID = @HesapID
          AND DATEDIFF(DAY, IslemTarihi, GETDATE()) <= 7) > @EsikMiktar
    BEGIN
        -- Hesabý bloke et
        UPDATE tblHesap SET Durum = 'Bloke' WHERE HesapID = @HesapID;
        INSERT INTO tblSikayet (MusteriID, SikayetTarihi, SikayetKonusu, SikayetDurumu)
        SELECT MusteriID, GETDATE(), 'Hesap bloke edildi.', 'Ýnceleniyor'
        FROM tblHesap
        WHERE HesapID = @HesapID;
        PRINT 'Hesap bloke edildi ve þikayet kaydý oluþturuldu.';
    END
    ELSE
    BEGIN
        PRINT 'Hesap þüpheli iþlem sýnýrýnýn altýnda.';
    END
    COMMIT TRANSACTION;
END;

