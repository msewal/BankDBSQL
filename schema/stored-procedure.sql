----STORED PROCEDURE----

--#1--
CREATE PROCEDURE SP_S�pheliIslemleriListele
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
    WHERE s.SikayetDurumu = '�nceleniyor'
    ORDER BY s.SikayetTarihi DESC;
END;

--#2--
CREATE PROCEDURE SP_S�pheliHesapBlokeEt
    @HesapID INT,
    @EsikMiktar DECIMAL(18, 2) = 500000 -- Varsay�lan e�ik de�eri
AS
BEGIN
    BEGIN TRANSACTION;
    -- Son 7 g�n i�indeki i�lemlerin toplam tutar�n� kontrol et
    IF (SELECT SUM(IslemMiktari) FROM tblIslem
        WHERE HesapID = @HesapID
          AND DATEDIFF(DAY, IslemTarihi, GETDATE()) <= 7) > @EsikMiktar
    BEGIN
        -- Hesab� bloke et
        UPDATE tblHesap SET Durum = 'Bloke' WHERE HesapID = @HesapID;
        INSERT INTO tblSikayet (MusteriID, SikayetTarihi, SikayetKonusu, SikayetDurumu)
        SELECT MusteriID, GETDATE(), 'Hesap bloke edildi.', '�nceleniyor'
        FROM tblHesap
        WHERE HesapID = @HesapID;
        PRINT 'Hesap bloke edildi ve �ikayet kayd� olu�turuldu.';
    END
    ELSE
    BEGIN
        PRINT 'Hesap ��pheli i�lem s�n�r�n�n alt�nda.';
    END
    COMMIT TRANSACTION;
END;

