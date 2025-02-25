----INDEX----

--# index 1
CREATE INDEX tblMusteri_Email_Index
ON tblMusteri (Email);

--# index 2
CREATE INDEX tblHesap_Bakiye_Index
ON tblHesap (Bakiye);

--# index 3
CREATE INDEX tblIslem_IslemTarihi_Index
ON tblIslem (IslemTarihi);

--# index 4
CREATE INDEX tblKrediBasvurusu_Durum_Index
ON tblKrediBasvurusu (Durum);

--# index 5
CREATE INDEX tblSigorta_SigortaTipi_Index
ON tblSigorta (SigortaTipi);

--# index 6
CREATE INDEX tblATMIslemleri_ATMNumarasi_Index
ON tblATMIslemleri (ATMNumarasi);