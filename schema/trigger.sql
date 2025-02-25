----TRIGGER----

----#trigger 1----
--Ayný hesaptan 1 dakika içinde 5,000 TL’den büyük birden fazla iþlem yapýlýrsa, 
--bu durum tblSikayet tablosuna kaydedilir.

CREATE TRIGGER trigger_SüpheliArtArdaIslem
ON tblIslem
AFTER INSERT
AS
BEGIN
    INSERT INTO tblSikayet (MusteriID, SikayetTarihi, SikayetKonusu, SikayetDurumu)
    SELECT 
        h.MusteriID, 
        GETDATE(), 
        'Ayný hesapta 1 dakika içinde yüksek tutarlý birden fazla iþlem tespit edildi.', 
        'Ýnceleniyor'
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
          AND s.SikayetKonusu = 'Ayný hesapta 1 dakika içinde yüksek tutarlý birden fazla iþlem tespit edildi.'
          AND DATEDIFF(MINUTE, s.SikayetTarihi, GETDATE()) <= 1
    );

    PRINT 'Þüpheli art arda iþlem tespit edildi, Sikayet tablosuna kaydedildi.';
END;

----#trigger 2----
--100,000 TL üzerindeki iþlemleri tespit eder 
--ve tblSikayet tablosuna þikayet olarak kaydeder.

CREATE TRIGGER trigger_SüpheliTransferTespiti
ON tblIslem
AFTER INSERT
AS
BEGIN
    DECLARE @EsikMiktar DECIMAL(18,2) = 100000;
    INSERT INTO tblSikayet (MusteriID, SikayetTarihi, SikayetKonusu, SikayetDurumu)
    SELECT 
        m.MusteriID, 
        GETDATE(), 
        'Þüpheli iþlem: ' + CAST(i.IslemMiktari AS NVARCHAR(50)) + ' TL transfer.', 
        'Ýnceleniyor'
    FROM INSERTED i
    JOIN tblHesap h ON i.HesapID = h.HesapID
    JOIN tblMusteri m ON h.MusteriID = m.MusteriID
    WHERE i.IslemMiktari > @EsikMiktar;

    PRINT 'Þüpheli transfer iþlemi tespit edildi, Sikayet tablosuna kaydedildi.';
END;

