--Sorgu1: Personel personel ID bilgilerini listele.
Select PerID
From Personel


--Sorgu2: Personelin Personel ID, ad ve soyadlarýný listele.
Select PerID, Ad, Soyad
From Personel 


--Sorgu3:Personel ID'si 101 olan personelin personel ID, ad, soyad, doðum tarihi ve adres listele.
Select PerID, Ad, Soyad, DogumTarih, Adres
From Personel
Where PerID=101


--Sorgu4: Adý "Ali Yýlmaz" olan personelin doðum tarihi ve adresini listele.
Select DogumTarih, Adres
From Personel
Where Ad='Ali' and Soyad='Yýlmaz'


--Sorgu5: Maaþý 600 ile 700 arasýnda olan kadýn personelin perID, ad, soyad, (ad soyad birleþik)
--maaþ bilgilerini listele.Ad, soyad bilgisini AdSoyad olarak yeniden adlandýr.
Select PerID as "PERSONEL ID", Ad +' '+ Soyad as 'Ad Soyad', Maas
From Personel
Where Maas>=600 and Maas<=700 and Cinsiyet='K'


--Sorgu6: 4 ve 6 numaralý bölümlerdeki personelin personelID ve bölüm ID lerini listele.
Select PerID, BolumID
From Personel
Where BolumID=4 or BolumID=6

--Sorgu6 ALTERNATÝF
Select PerID, BolumID
From Personel
Where BolumID in(4,6)


--Sorgu7: Bölüm adý ve yöneticilerinin perID, adý ve soyadý listele.
Select BolumAd, PerID, Ad, Soyad
From Bolum, Personel
Where YoneticiID=PerID


--Sorgu8: "Pazarlama" bölümünde çalýþan personelin PerID, adý ve çalýþtýðý bölümün adýný listele.
Select p.PerID, p.Ad, b.BolumAd
From Bolum b, Personel p
Where b.BolumAd='Pazarlama' and p.BolumID=b.BolumID


--Sorgu9:"Pazarlama" bölümünde çalýþan personelin PerID, adý ve çalýþtýðý bölümün adýný, Bölüm ID listele.
Select p.PerID, p.Ad, b.BolumAd, p.BolumID
From Bolum b, Personel p
Where b.BolumAd='Pazarlama' and p.BolumID=b.BolumID


--Sorgu10:Tüm personelin PerID, Ad ve çalýþtýðý bölüm adý listele
Select p.PerID, p.Ad, b.BolumAd
From Personel p, Bolum b
Where p.BolumID=b.BolumID

--Arkaplanda dönen olay
Select p.PerID, p.Ad, b.BolumAd
From Personel p
	inner join Bolum b on p.BolumID=b.BolumID


--Sorgu11: Bir bölümde çalýþýp çalýþmýyor mu bakmaksýzýn personelin PerID, Ad, Soyad listele.Tüm personel gelsin için (EMEL geldi karþýlýðý null oldu)
Select p.PerID, p.Ad, b.BolumAd
From Personel p
	left outer join Bolum b on p.BolumID=b.BolumID


--(EMEL hiç gelmedi karþýlýðý olmadýðý için çýkmadý)
Select p.PerID, p.Ad, b.BolumAd
From Personel p
	right outer join Bolum b on p.BolumID=b.BolumID



--Sorgu12: Her bir personelin PerID, Ad, Soyad yanýsýra birincil amirinin PerID, Ad, Soyad lisete
--amiri yoksa boþ kalsýn.
Select p.PerID, p.Ad, p.Soyad, a.PerID AmirID, a.Ad AmirAd, a.Soyad AmirSoyad
From Personel p, Personel a
Where p.AmirID=a.PerID

--Sorgu 12 daha doðru syntax
Select p.PerID, p.Ad, p.Soyad, a.PerID AmirID, a.Ad AmirAd, a.Soyad AmirSoyad
From Personel p
	left outer join Personel a on p.AmirID=a.PerID


--Sorgu14: Personel tablosunun tüm kayýtlarýný tüm alanlarýyla getirin.
Select *
From Personel p


--Sorgu15: Bölüm yöneticileri için Bölüm ve Personel tablolarýnýn tüm kayýtlarýný tüm alanlarýyla listele.
Select *
From Bolum b, Personel p
where b.YoneticiID=p.PerID

--Sorgu15 Doðru yazým
Select *
From Personel p
	inner join Bolum b on p.PerID=b.YoneticiID


--Sorgu16:Kadýköyde yer alan her proje için ProjeID, ilgili BölümID,ilgili bölümün 
--Yöneticisinin soyadý, adresi ve oðum tarihi listele
Select pj.ProID, pj.BolumID, p.Soyad, p.Adres, p.DogumTarih
From Proje pj 
	inner join Bolum b on pj.BolumID=b.BolumID
	inner join Personel p on b.YoneticiID=p.PerID
Where pj.Lokasyon='Kadýköy'

--Sorgu16 Alternatif
Select pj.ProID, pj.BolumID, p.Soyad, p.Adres, p.DogumTarih
From Proje pj, Bolum b, Personel p
Where pj.Lokasyon='Kadýköy'
	and pj.BolumID=b.BolumID and b.YoneticiID=p.PerID


--Sorgu17: 1,2 ve 4 numaralý bölümlerde çalýþan PerID ve syoyad listele
Select p.PerID, p.Soyad 
From Personel p
where p.BolumID in (1,2,4)


--Sorgu18:"Merkez", "Arge" ve "Pazarlama" bölümlerinde çalýþan perID ve soyad listele
Select p.PerID, p.Soyad
From Personel p
	inner join Bolum b on p.BolumID=b.BolumID
where b.BolumAd in ('Merkez', 'Arge','Pazarlama')

--Alternatif
Select p.PerID, p.Soyad
From Personel p, Bolum b
Where p.BolumID=b.BolumID and b.BolumAd in ('Merkez','Arge','Pazarlama')



--Sorgu19:Tüm çalýþanlarýn maaþ bilgisini listeleyiniz.
Select p.Maas
From Personel p


--Sorgu20:Farklý maaþ deðerlerini tekrarsýz olarak listeleyiniz.
Select distinct p.Maas
From Personel p


--Sorgu21:Oyadý "Þirin" olan personelin, projeyi kontrol eden bölümün yöneticisi
Select pj.ProID
From Proje pj
	inner join Bolum b on pj.BolumID=b.BolumID
	inner join Personel p on b.YoneticiID=p.PerID
Where p.Soyad='Þirin'
union --birleþim U

--Sorgu21 devam:Soyadý Þirin proje çalýþaný olarak yer aldýðý projelerin projeIDlerini listele
Select pp.ProID
From PersonelProje pp
	inner join Personel p on pp.PerID=p.PerID
Where p.Soyad='Þirin'


--Sorgu22:Kadýköyde yaþayan personelin PerID, Ad, Soyad
--like '%string%' içinde var mý diye bakar
Select *
From Personel p
Where p.Adres like '%Kadýköy%'


--Sorgu23:adý a ile bitip üçüncü karakteri r
select *
from Personel p
where p.Ad like '__r%m'


--Sorgu24:Bilgisayar Eðitimi projesinde çalýþan personelin maaþýna yüzde 10 artýþ yapýlýrsa
--personel PerID, Soyad ve Yeni Maaþý listele
Select p.PerID, p.Soyad,p.Maas YeniMaas
From Proje pj
	inner join PersonelProje pp on pj.ProID=pp.ProID
	inner join Personel p on pp.PerID=p.PerID
Where pj.ProAd='Bilgisayar Eðitimi'


--Sorgu25:Personelin perID ad soyad çalýþtýðý proje adý önce personelin çalýþtýðý bölüm adý 
--sonra soyadý ve adý sýralý olarak getir (desc tersten sýralar)
select p.PerID, p.Ad, p.Soyad, pj.ProAd, b.BolumAd
from Personel p
	inner join PersonelProje pp on pp.PerID=p.PerID
	inner join Proje pj on pp.ProID=pj.ProID
	inner join Bolum b on p.BolumID=b.BolumID
order by b.BolumAd, p.Soyad desc, p.Ad


--Sorgu26:Amiri olmayan personelin ad ve soyadýný listele
-- '' =>empty stringi
select p.PerID, p.Ad,p.Soyad
from Personel p
where p.AmirID is NULL

--Sorgu26:Amiri olan personelin ad ve soyadýný listele
select p.PerID, p.Ad,p.Soyad
from Personel p
where p.AmirID is not NULL



--Sorgu27:Herhangi bir projede çalýþmayan personelin PerID, Ad, Soyad listele.
select p.PerID, p.Ad, p.Soyad, pp.ProID
from personel p
	left join PersonelProje pp on pp.perID=p.PerID 
where pp.ProID is NULL


--ALTERNATÝF
select *
from Personel p
where p.PerID not in (select distinct pp.PerID
						from PersonelProje pp)



--Sorgu28:Kendi adý ve cinisyetiyle ayný ad ve cinsiyette bakmakla yükümlü bir kimsesi olan
--personelin ADýný,Soyadýný listele
select *
from Personel p
	inner join BakmaklaYukumlu bk on p.PerID=bk.PerID
where p.Ad=bk.BakYukAd and p.Cinsiyet=bk.Cinsiyet



select *
from Personel p
	inner join BakmaklaYukumlu bk on (p.PerID=bk.PerID and p.Ad=bk.BakYukAd and p.Cinsiyet=bk.Cinsiyet)



select *
from Personel p
where exists (select*
				from BakmaklaYukumlu bk 
				where p.Ad=bk.BakYukAd and p.Cinsiyet=bk.Cinsiyet)


--Sorgu29:bakmakla yükümlü kimsesi olmayan per ad soyad listele
select *
from personel p
	left join BakmaklaYukumlu bk on p.PerID=bk.PerID
where bk.PerID is NULL


--Sorgu30:En az bir bakmakla yükümlü
select distinct p.PerID
from personel p
	inner join BakmaklaYukumlu bk on p.PerID=bk.PerID


--Sorgu31: En az bir bakmakla yükümlü kimsesi olan bölüm yöneticlerinin perId Ad soyad listele
select distinct p.PerID
from personel p
	inner join BakmaklaYukumlu bk on p.PerID=bk.PerID
	inner join Bolum b on p.PerID=b.YoneticiID





--Sorgu32:Personel toplam maaþ en yüksek maaþ en düþük maaþ ort maaþ bilgilerini listele
select sum(p.Maas) TopMaas, max(p.Maas) EnYuksekMaas, min(p.Maas) EnAzMaas, AVG(p.Maas*1.0) OrtMaas, COUNT(*) PersonelSay,count(p.Maas) MaasliPerSay
from Personel p


--Sorgu33:Merkez bölümünde çalýþan personelin toplam maaþ, max maaþ, min maaþ, ort maaþ listele
select sum(p.Maas) TopMaas, max(p.Maas) EnYuksekMaas, min(p.Maas) EnAzMaas, AVG(p.Maas*1.0) OrtMaas
from personel p
	inner join bolum b on p.BolumID=b.BolumID
where b.BolumAd='Merkez'


--Sorgu34:þirkette kaç personel çalýþýyor
select count(*) toplamKisi,count(p.Maas) MaasAlanlar, count(p.AmirID) amir 
from personel p


--Sorgu35:Merkez bolumunda kaç adet pers çalýþýr
select count(*) 
from personel p
	inner join bolum b on p.BolumID=b.BolumID
where b.BolumAd='Merkez'


--Sorgu36:Veritabanýnda kaç adet farklý maaþ var
select count(distinct p.Maas) Maas 
from personel p


--Sorgu37:her bir bölüm için bolum ýd ve per sayýsý listele
Select p.BolumID, count(*) KisiSayisi
from Personel p
group by p.BolumID



--Sorgu38:Her bir bölüm için bolumID çalýþan personel sayýsý ve ort maas
Select p.BolumID, count(*) KisiSayisi, AVG(p.Maas*1.0) OrtMaas
from Personel p
group by p.BolumID


--Sorgu39:her bir proje için proID,Adý, ve projede çalýþan kiþi say listele
Select pj.ProID,pj.ProAd,count(*) PerSay
from proje pj
	inner join PersonelProje pp on pj.ProID=pp.ProID
group by pj.ProID, pj.ProAd



--Sorgu40:her bir per için perID,Soyad,toplam çalýþma saati listele
select p.PerID, p.Soyad, sum(pp.CalismaSaat)
from Personel p
	inner join PersonelProje pp on p.PerID=pp.PerID
group by p.PerID, p.Soyad


--Sorgu41:bakmakla yükümlü kimsesi olan perID ve bakmakla yükümlü olduðu kiþi sayýsý listele
Select p.PerID, count(*) BakYukKisSay
from Personel p
	inner join BakmaklaYukumlu bk on bk.PerID=p.PerID
group by p.PerID


--ALTERNATÝF
Select p.PerID, count(bk.PerID) BakYukKisSay
from Personel p
	left join BakmaklaYukumlu bk on bk.PerID=p.PerID
group by p.PerID

--Sorgu43:Üsküdarda yürütülen projelerde çalýþan perID proID top çalýþma saati listele
select pp.PerID, pp.ProID, sum(pp.CalismaSaat) TopSaat
from proje pj
	inner join PersonelProje pp on pp.ProID=pj.ProID
where pj.Lokasyon='Üsküdar' 
group by pp.PerID, pp.ProID

--Alternatif
select pp.PerID, pp.ProID, pp.CalismaSaat TopSaat
from proje pj
	inner join PersonelProje pp on pp.ProID=pj.ProID
where pj.Lokasyon='Üsküdar'



--Sorgu44: en az bir çalýþaný olan projelerin proýd, adý ve projede çalýþan sayýsýný listele.
select pp.ProID, pj.ProAd, count(*) PerSay
from PersonelProje pp
	inner join Proje pj on pp.ProID=pj.ProID
group by pp.ProID, pj.ProAd


--Sorgu45:birden çok çalýþaný olan projelerin proýd, adý ve projede çalýþan sayýsýný listele.
select pp.ProID, pj.ProAd, count(*) PerSay
from PersonelProje pp
	inner join Proje pj on pp.ProID=pj.ProID
group by pp.ProID, pj.ProAd
having count(*)>1

--Sorgu46:birden çok çalýþaný olan projelerin proýd
select pp.ProID
from PersonelProje pp
	inner join Proje pj on pp.ProID=pj.ProID
group by pp.ProID, pj.ProAd
having count(*)>1


--Sorgu47:maaþý 500 den çok olan en az 3 çalýþaný olan bolumlerýn bolumýd, ad  ve persay listele.
select b.BolumID,b.BolumAd,COUNT(p.PerID) PerSay
from Personel P
	inner join Bolum b on b.BolumID=p.BolumID
where p.Maas>500 
group by b.BolumID, b.BolumAd
having COUNT(p.PerID)>=3

--Sorgu48:en az üç çalýþaný olan bölümlerin bolumID, ad ve personel sayýsý listele
select b.BolumID,b.BolumAd,COUNT(p.PerID) PerSay
from Personel P
	inner join Bolum b on b.BolumID=p.BolumID
group by b.BolumID, b.BolumAd
having COUNT(*)>=3

--Sorgu49:en az üç çalýþaný olan bölümlerin bolumID, ad ve maasý 500den büyük olan
select p.BolumID, b.BolumAd, count(*) PerSayM500
from personel p
	inner join Bolum b on b.BolumID=p.BolumID
where p.BolumID in (select p2.BolumID
					from Personel p2
					group by p2.BolumID
					having COUNT(*)>=3)
	and p.Maas>500
group by p.BolumID, b.BolumAd


--Sorgu50:en az iki bakmakla yükümlü personelin perID, ad, soyad(AdSoyad birleþik), çalýþtýðý bölüm
--TopÇalýþma saati, çalýþtýðý proje sayýsý ve ort çalýþma saati listele 
--bölüm adý artan çalýþma saati azalan listele


select p.PerID, p.Ad +' '+p.Soyad 'Ad Soyad', b.BolumAd, SUM(pp.CalismaSaat) TopSaat,
	count(*) ProSay, avg(1.0*pp.CalismaSaat) OrtSaat
from personel p
	inner join Bolum b on p.BolumID=b.BolumID
	inner join PersonelProje pp on p.PerID=pp.PerID
where p.PerID in (select bk.PerID
					from BakmaklaYukumlu bk
					group by bk.PerID
					having count(*)>=2)
group by p.PerID, p.Ad +' '+p.Soyad, b.BolumAd
order by b.BolumAd, OrtSaat desc

--Sorgu51:personel proje tablosuna yeni pers gir
insert into PersonelProje(PerID, ProID)--,calismaSaat)
values(505,7,8)

select * from PersonelProje


--Sorgu52:personelproje tablosundan personel ID'si 505 ve proje ID si 7 olan kayýtlarý sil.
delete from PersonelProje where PerID=505 and ProID=7

select * from PersonelProje where PerID=505 and ProID=7


--Sorgu53:projelerde en çok 3saat çalýþan personeli sil
delete from Personel
where PerID not in (select pp.PerID from PersonelProje pp group by pp.PerID having sum(pp.CalismaSaat)>3)


--Sorgu54:'meryem beyza' adlý personelin adresini üsküdar olarak güncelle
update Personel
set Adres='Üsküdar'
where Ad='Meryem' and Soyad='Beyza'

select * from Personel
where Ad='Meryem' and Soyad='Beyza'

update p
set p.Adres='Ataþehir'
from Personel p
where p.Ad='Meryem' and Soyad='Beyza'


--Sorgu55:projelerde 5 saatten fazla çalýþan satýþ bölümü personelinin maaþýný 20% arttýr güncelle
update p
set p.Maas=p.Maas*1.2
from Personel p
	inner join Bolum b on p.BolumID=b.BolumID
where b.BolumAd='Satýþ' and p.PerID in (select pp.perID 
										from PersonelProje pp 
										group by pp.PerID 
										having sum(pp.CalismaSaat)>5)

select * from Personel p
	inner join Bolum b on p.BolumID=b.BolumID
where b.BolumAd='Satýþ'


--Sorgu56:LogID, KullaniciID ve LogAciklama alanlarýyla KullaniciLog adýnda yeni bir tablo oluþturunuz. LogID tekil
--olup KullaniciID Personel tablosunun PerID alanýna iþaret edecektir.
create table KullaniciLog (
LogID int identity(1,1),
KullaniciID int,
LogAciklama nvarchar(100),
Primary Key(LogID),
Foreign Key(KullaniciID) references Personel(PerID)
)

--Sorgu57: KullaniciLog tablosuna LogTarih adýnda yeni alan ekleyiniz.
alter table KullaniciLog
add LogTarih datetime



