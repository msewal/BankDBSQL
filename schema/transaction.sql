----ÝKÝ HESAP ARASINDA PARA TRANSFERÝ----
BEGIN TRANSACTION; IF (SELECT Bakiye FROM tblHesap WHERE HesapID = 49) >= 200
BEGIN
    UPDATE tblHesap SET Bakiye = Bakiye - 200 WHERE HesapID = 49;
    UPDATE tblHesap SET Bakiye = Bakiye + 200 WHERE HesapID = 50;
    INSERT INTO tblIslem (HesapID, IslemTipi, IslemMiktari, IslemTarihi, Aciklama)
    VALUES (49, 'Para Transferi', -200, GETDATE(), 'Hesap ID 50’ye transfer'),
           (50, 'Para Transferi', 200, GETDATE(), 'Hesap ID 49’dan transfer');
    COMMIT TRANSACTION; PRINT 'Transfer iþlemi baþarýyla tamamlandý.';
END
ELSE
BEGIN
    ROLLBACK TRANSACTION; PRINT 'Gönderen hesabýn bakiyesi yetersiz.';
END;

----KREDÝ ÖDEME ÝÞLEMÝ----
BEGIN TRANSACTION;
DECLARE @KalanBorc FLOAT;
SET @KalanBorc = (SELECT TOP 1 KalanBorc FROM tblKrediOdeme WHERE BasvuruID = 1 ORDER BY OdemeID DESC);

DECLARE @OdemeMiktari FLOAT; SET @OdemeMiktari = @KalanBorc * 0.10;

INSERT INTO tblKrediOdeme (BasvuruID, OdemeTarihi, OdemeMiktari, KalanBorc)
VALUES (1, GETDATE(), @OdemeMiktari, @KalanBorc - @OdemeMiktari);
UPDATE tblKrediBasvurusu SET KrediMiktari = KrediMiktari - @OdemeMiktari WHERE BasvuruID = 1;

IF @@ERROR = 0
BEGIN
    COMMIT TRANSACTION; PRINT 'Kredi ödeme iþlemi baþarýyla tamamlandý.';
END
ELSE
BEGIN
    ROLLBACK TRANSACTION; PRINT 'Bir hata oluþtu. Ýþlem geri alýndý.';
END;

