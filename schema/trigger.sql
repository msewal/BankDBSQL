----TRIGGER----

----#trigger 1----
--Ayn� hesaptan 1 dakika i�inde 5,000 TL�den b�y�k birden fazla i�lem yap�l�rsa, 
--bu durum tblSikayet tablosuna kaydedilir.

CREATE TRIGGER trigger_S�pheliArtArdaIslem
ON tblIslem
AFTER INSERT
AS
BEGIN
    INSERT INTO tblSikayet (MusteriID, SikayetTarihi, SikayetKonusu, SikayetDurumu)
    SELECT 
        h.MusteriID, 
        GETDATE(), 
        'Ayn� hesapta 1 dakika i�inde y�ksek tutarl� birden fazla i�lem tespit edildi.', 
        '�nceleniyor'
    FROM INSERTED i
    JOIN tblHesap h ON i.HesapID = h.HesapID
    WHERE EXISTS (
        SELECT 1 
        FROM tblIslem t
        WHERE t.HesapID = i.HesapID
          AND t.IslemTarihi BETWEEN DATEADD(MINUTE, -1, i.IslemTarihi) AND i.IslemTarihi
          AND t.IslemMiktari > 5000
    )
    AND NOT EXISTS (
        SELECT 1 
        FROM tblSikayet s
        WHERE s.MusteriID = h.MusteriID
          AND s.SikayetKonusu = 'Ayn� hesapta 1 dakika i�inde y�ksek tutarl� birden fazla i�lem tespit edildi.'
          AND DATEDIFF(MINUTE, s.SikayetTarihi, GETDATE()) <= 1
    );

    PRINT '��pheli art arda i�lem tespit edildi, Sikayet tablosuna kaydedildi.';
END;

----#trigger 2----
--100,000 TL �zerindeki i�lemleri tespit eder 
--ve tblSikayet tablosuna �ikayet olarak kaydeder.

CREATE TRIGGER trigger_S�pheliTransferTespiti
ON tblIslem
AFTER INSERT
AS
BEGIN
    DECLARE @EsikMiktar DECIMAL(18,2) = 100000;
    INSERT INTO tblSikayet (MusteriID, SikayetTarihi, SikayetKonusu, SikayetDurumu)
    SELECT 
        m.MusteriID, 
        GETDATE(), 
        '��pheli i�lem: ' + CAST(i.IslemMiktari AS NVARCHAR(50)) + ' TL transfer.', 
        '�nceleniyor'
    FROM INSERTED i
    JOIN tblHesap h ON i.HesapID = h.HesapID
    JOIN tblMusteri m ON h.MusteriID = m.MusteriID
    WHERE i.IslemMiktari > @EsikMiktar;

    PRINT '��pheli transfer i�lemi tespit edildi, Sikayet tablosuna kaydedildi.';
END;

