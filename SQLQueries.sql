--Sorgu1: Personel personel ID bilgilerini listele.
Select PerID
From Personel


--Sorgu2: Personelin Personel ID, ad ve soyadlar�n� listele.
Select PerID, Ad, Soyad
From Personel 


--Sorgu3:Personel ID'si 101 olan personelin personel ID, ad, soyad, do�um tarihi ve adres listele.
Select PerID, Ad, Soyad, DogumTarih, Adres
From Personel
Where PerID=101


--Sorgu4: Ad� "Ali Y�lmaz" olan personelin do�um tarihi ve adresini listele.
Select DogumTarih, Adres
From Personel
Where Ad='Ali' and Soyad='Y�lmaz'


--Sorgu5: Maa�� 600 ile 700 aras�nda olan kad�n personelin perID, ad, soyad, (ad soyad birle�ik)
--maa� bilgilerini listele.Ad, soyad bilgisini AdSoyad olarak yeniden adland�r.
Select PerID as "PERSONEL ID", Ad +' '+ Soyad as 'Ad Soyad', Maas
From Personel
Where Maas>=600 and Maas<=700 and Cinsiyet='K'


--Sorgu6: 4 ve 6 numaral� b�l�mlerdeki personelin personelID ve b�l�m ID lerini listele.
Select PerID, BolumID
From Personel
Where BolumID=4 or BolumID=6

--Sorgu6 ALTERNAT�F
Select PerID, BolumID
From Personel
Where BolumID in(4,6)


--Sorgu7: B�l�m ad� ve y�neticilerinin perID, ad� ve soyad� listele.
Select BolumAd, PerID, Ad, Soyad
From Bolum, Personel
Where YoneticiID=PerID


--Sorgu8: "Pazarlama" b�l�m�nde �al��an personelin PerID, ad� ve �al��t��� b�l�m�n ad�n� listele.
Select p.PerID, p.Ad, b.BolumAd
From Bolum b, Personel p
Where b.BolumAd='Pazarlama' and p.BolumID=b.BolumID


--Sorgu9:"Pazarlama" b�l�m�nde �al��an personelin PerID, ad� ve �al��t��� b�l�m�n ad�n�, B�l�m ID listele.
Select p.PerID, p.Ad, b.BolumAd, p.BolumID
From Bolum b, Personel p
Where b.BolumAd='Pazarlama' and p.BolumID=b.BolumID


--Sorgu10:T�m personelin PerID, Ad ve �al��t��� b�l�m ad� listele
Select p.PerID, p.Ad, b.BolumAd
From Personel p, Bolum b
Where p.BolumID=b.BolumID

--Arkaplanda d�nen olay
Select p.PerID, p.Ad, b.BolumAd
From Personel p
	inner join Bolum b on p.BolumID=b.BolumID


--Sorgu11: Bir b�l�mde �al���p �al��m�yor mu bakmaks�z�n personelin PerID, Ad, Soyad listele.T�m personel gelsin i�in (EMEL geldi kar��l��� null oldu)
Select p.PerID, p.Ad, b.BolumAd
From Personel p
	left outer join Bolum b on p.BolumID=b.BolumID


--(EMEL hi� gelmedi kar��l��� olmad��� i�in ��kmad�)
Select p.PerID, p.Ad, b.BolumAd
From Personel p
	right outer join Bolum b on p.BolumID=b.BolumID



--Sorgu12: Her bir personelin PerID, Ad, Soyad yan�s�ra birincil amirinin PerID, Ad, Soyad lisete
--amiri yoksa bo� kals�n.
Select p.PerID, p.Ad, p.Soyad, a.PerID AmirID, a.Ad AmirAd, a.Soyad AmirSoyad
From Personel p, Personel a
Where p.AmirID=a.PerID

--Sorgu 12 daha do�ru syntax
Select p.PerID, p.Ad, p.Soyad, a.PerID AmirID, a.Ad AmirAd, a.Soyad AmirSoyad
From Personel p
	left outer join Personel a on p.AmirID=a.PerID


--Sorgu14: Personel tablosunun t�m kay�tlar�n� t�m alanlar�yla getirin.
Select *
From Personel p


--Sorgu15: B�l�m y�neticileri i�in B�l�m ve Personel tablolar�n�n t�m kay�tlar�n� t�m alanlar�yla listele.
Select *
From Bolum b, Personel p
where b.YoneticiID=p.PerID

--Sorgu15 Do�ru yaz�m
Select *
From Personel p
	inner join Bolum b on p.PerID=b.YoneticiID


--Sorgu16:Kad�k�yde yer alan her proje i�in ProjeID, ilgili B�l�mID,ilgili b�l�m�n 
--Y�neticisinin soyad�, adresi ve o�um tarihi listele
Select pj.ProID, pj.BolumID, p.Soyad, p.Adres, p.DogumTarih
From Proje pj 
	inner join Bolum b on pj.BolumID=b.BolumID
	inner join Personel p on b.YoneticiID=p.PerID
Where pj.Lokasyon='Kad�k�y'

--Sorgu16 Alternatif
Select pj.ProID, pj.BolumID, p.Soyad, p.Adres, p.DogumTarih
From Proje pj, Bolum b, Personel p
Where pj.Lokasyon='Kad�k�y'
	and pj.BolumID=b.BolumID and b.YoneticiID=p.PerID


--Sorgu17: 1,2 ve 4 numaral� b�l�mlerde �al��an PerID ve syoyad listele
Select p.PerID, p.Soyad 
From Personel p
where p.BolumID in (1,2,4)


--Sorgu18:"Merkez", "Arge" ve "Pazarlama" b�l�mlerinde �al��an perID ve soyad listele
Select p.PerID, p.Soyad
From Personel p
	inner join Bolum b on p.BolumID=b.BolumID
where b.BolumAd in ('Merkez', 'Arge','Pazarlama')

--Alternatif
Select p.PerID, p.Soyad
From Personel p, Bolum b
Where p.BolumID=b.BolumID and b.BolumAd in ('Merkez','Arge','Pazarlama')



--Sorgu19:T�m �al��anlar�n maa� bilgisini listeleyiniz.
Select p.Maas
From Personel p


--Sorgu20:Farkl� maa� de�erlerini tekrars�z olarak listeleyiniz.
Select distinct p.Maas
From Personel p


--Sorgu21:Oyad� "�irin" olan personelin, projeyi kontrol eden b�l�m�n y�neticisi
Select pj.ProID
From Proje pj
	inner join Bolum b on pj.BolumID=b.BolumID
	inner join Personel p on b.YoneticiID=p.PerID
Where p.Soyad='�irin'
union --birle�im U

--Sorgu21 devam:Soyad� �irin proje �al��an� olarak yer ald��� projelerin projeIDlerini listele
Select pp.ProID
From PersonelProje pp
	inner join Personel p on pp.PerID=p.PerID
Where p.Soyad='�irin'


--Sorgu22:Kad�k�yde ya�ayan personelin PerID, Ad, Soyad
--like '%string%' i�inde var m� diye bakar
Select *
From Personel p
Where p.Adres like '%Kad�k�y%'


--Sorgu23:ad� a ile bitip ���nc� karakteri r
select *
from Personel p
where p.Ad like '__r%m'


--Sorgu24:Bilgisayar E�itimi projesinde �al��an personelin maa��na y�zde 10 art�� yap�l�rsa
--personel PerID, Soyad ve Yeni Maa�� listele
Select p.PerID, p.Soyad,p.Maas YeniMaas
From Proje pj
	inner join PersonelProje pp on pj.ProID=pp.ProID
	inner join Personel p on pp.PerID=p.PerID
Where pj.ProAd='Bilgisayar E�itimi'


--Sorgu25:Personelin perID ad soyad �al��t��� proje ad� �nce personelin �al��t��� b�l�m ad� 
--sonra soyad� ve ad� s�ral� olarak getir (desc tersten s�ralar)
select p.PerID, p.Ad, p.Soyad, pj.ProAd, b.BolumAd
from Personel p
	inner join PersonelProje pp on pp.PerID=p.PerID
	inner join Proje pj on pp.ProID=pj.ProID
	inner join Bolum b on p.BolumID=b.BolumID
order by b.BolumAd, p.Soyad desc, p.Ad


--Sorgu26:Amiri olmayan personelin ad ve soyad�n� listele
-- '' =>empty stringi
select p.PerID, p.Ad,p.Soyad
from Personel p
where p.AmirID is NULL

--Sorgu26:Amiri olan personelin ad ve soyad�n� listele
select p.PerID, p.Ad,p.Soyad
from Personel p
where p.AmirID is not NULL



--Sorgu27:Herhangi bir projede �al��mayan personelin PerID, Ad, Soyad listele.
select p.PerID, p.Ad, p.Soyad, pp.ProID
from personel p
	left join PersonelProje pp on pp.perID=p.PerID 
where pp.ProID is NULL


--ALTERNAT�F
select *
from Personel p
where p.PerID not in (select distinct pp.PerID
						from PersonelProje pp)



--Sorgu28:Kendi ad� ve cinisyetiyle ayn� ad ve cinsiyette bakmakla y�k�ml� bir kimsesi olan
--personelin AD�n�,Soyad�n� listele
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


--Sorgu29:bakmakla y�k�ml� kimsesi olmayan per ad soyad listele
select *
from personel p
	left join BakmaklaYukumlu bk on p.PerID=bk.PerID
where bk.PerID is NULL


--Sorgu30:En az bir bakmakla y�k�ml�
select distinct p.PerID
from personel p
	inner join BakmaklaYukumlu bk on p.PerID=bk.PerID


--Sorgu31: En az bir bakmakla y�k�ml� kimsesi olan b�l�m y�neticlerinin perId Ad soyad listele
select distinct p.PerID
from personel p
	inner join BakmaklaYukumlu bk on p.PerID=bk.PerID
	inner join Bolum b on p.PerID=b.YoneticiID





--Sorgu32:Personel toplam maa� en y�ksek maa� en d���k maa� ort maa� bilgilerini listele
select sum(p.Maas) TopMaas, max(p.Maas) EnYuksekMaas, min(p.Maas) EnAzMaas, AVG(p.Maas*1.0) OrtMaas, COUNT(*) PersonelSay,count(p.Maas) MaasliPerSay
from Personel p


--Sorgu33:Merkez b�l�m�nde �al��an personelin toplam maa�, max maa�, min maa�, ort maa� listele
select sum(p.Maas) TopMaas, max(p.Maas) EnYuksekMaas, min(p.Maas) EnAzMaas, AVG(p.Maas*1.0) OrtMaas
from personel p
	inner join bolum b on p.BolumID=b.BolumID
where b.BolumAd='Merkez'


--Sorgu34:�irkette ka� personel �al���yor
select count(*) toplamKisi,count(p.Maas) MaasAlanlar, count(p.AmirID) amir 
from personel p


--Sorgu35:Merkez bolumunda ka� adet pers �al���r
select count(*) 
from personel p
	inner join bolum b on p.BolumID=b.BolumID
where b.BolumAd='Merkez'


--Sorgu36:Veritaban�nda ka� adet farkl� maa� var
select count(distinct p.Maas) Maas 
from personel p


--Sorgu37:her bir b�l�m i�in bolum �d ve per say�s� listele
Select p.BolumID, count(*) KisiSayisi
from Personel p
group by p.BolumID



--Sorgu38:Her bir b�l�m i�in bolumID �al��an personel say�s� ve ort maas
Select p.BolumID, count(*) KisiSayisi, AVG(p.Maas*1.0) OrtMaas
from Personel p
group by p.BolumID


--Sorgu39:her bir proje i�in proID,Ad�, ve projede �al��an ki�i say listele
Select pj.ProID,pj.ProAd,count(*) PerSay
from proje pj
	inner join PersonelProje pp on pj.ProID=pp.ProID
group by pj.ProID, pj.ProAd



--Sorgu40:her bir per i�in perID,Soyad,toplam �al��ma saati listele
select p.PerID, p.Soyad, sum(pp.CalismaSaat)
from Personel p
	inner join PersonelProje pp on p.PerID=pp.PerID
group by p.PerID, p.Soyad


--Sorgu41:bakmakla y�k�ml� kimsesi olan perID ve bakmakla y�k�ml� oldu�u ki�i say�s� listele
Select p.PerID, count(*) BakYukKisSay
from Personel p
	inner join BakmaklaYukumlu bk on bk.PerID=p.PerID
group by p.PerID


--ALTERNAT�F
Select p.PerID, count(bk.PerID) BakYukKisSay
from Personel p
	left join BakmaklaYukumlu bk on bk.PerID=p.PerID
group by p.PerID

--Sorgu43:�sk�darda y�r�t�len projelerde �al��an perID proID top �al��ma saati listele
select pp.PerID, pp.ProID, sum(pp.CalismaSaat) TopSaat
from proje pj
	inner join PersonelProje pp on pp.ProID=pj.ProID
where pj.Lokasyon='�sk�dar' 
group by pp.PerID, pp.ProID

--Alternatif
select pp.PerID, pp.ProID, pp.CalismaSaat TopSaat
from proje pj
	inner join PersonelProje pp on pp.ProID=pj.ProID
where pj.Lokasyon='�sk�dar'



--Sorgu44: en az bir �al��an� olan projelerin pro�d, ad� ve projede �al��an say�s�n� listele.
select pp.ProID, pj.ProAd, count(*) PerSay
from PersonelProje pp
	inner join Proje pj on pp.ProID=pj.ProID
group by pp.ProID, pj.ProAd


--Sorgu45:birden �ok �al��an� olan projelerin pro�d, ad� ve projede �al��an say�s�n� listele.
select pp.ProID, pj.ProAd, count(*) PerSay
from PersonelProje pp
	inner join Proje pj on pp.ProID=pj.ProID
group by pp.ProID, pj.ProAd
having count(*)>1

--Sorgu46:birden �ok �al��an� olan projelerin pro�d
select pp.ProID
from PersonelProje pp
	inner join Proje pj on pp.ProID=pj.ProID
group by pp.ProID, pj.ProAd
having count(*)>1


--Sorgu47:maa�� 500 den �ok olan en az 3 �al��an� olan bolumler�n bolum�d, ad  ve persay listele.
select b.BolumID,b.BolumAd,COUNT(p.PerID) PerSay
from Personel P
	inner join Bolum b on b.BolumID=p.BolumID
where p.Maas>500 
group by b.BolumID, b.BolumAd
having COUNT(p.PerID)>=3

--Sorgu48:en az �� �al��an� olan b�l�mlerin bolumID, ad ve personel say�s� listele
select b.BolumID,b.BolumAd,COUNT(p.PerID) PerSay
from Personel P
	inner join Bolum b on b.BolumID=p.BolumID
group by b.BolumID, b.BolumAd
having COUNT(*)>=3

--Sorgu49:en az �� �al��an� olan b�l�mlerin bolumID, ad ve maas� 500den b�y�k olan
select p.BolumID, b.BolumAd, count(*) PerSayM500
from personel p
	inner join Bolum b on b.BolumID=p.BolumID
where p.BolumID in (select p2.BolumID
					from Personel p2
					group by p2.BolumID
					having COUNT(*)>=3)
	and p.Maas>500
group by p.BolumID, b.BolumAd


--Sorgu50:en az iki bakmakla y�k�ml� personelin perID, ad, soyad(AdSoyad birle�ik), �al��t��� b�l�m
--Top�al��ma saati, �al��t��� proje say�s� ve ort �al��ma saati listele 
--b�l�m ad� artan �al��ma saati azalan listele


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


--Sorgu52:personelproje tablosundan personel ID'si 505 ve proje ID si 7 olan kay�tlar� sil.
delete from PersonelProje where PerID=505 and ProID=7

select * from PersonelProje where PerID=505 and ProID=7


--Sorgu53:projelerde en �ok 3saat �al��an personeli sil
delete from Personel
where PerID not in (select pp.PerID from PersonelProje pp group by pp.PerID having sum(pp.CalismaSaat)>3)


--Sorgu54:'meryem beyza' adl� personelin adresini �sk�dar olarak g�ncelle
update Personel
set Adres='�sk�dar'
where Ad='Meryem' and Soyad='Beyza'

select * from Personel
where Ad='Meryem' and Soyad='Beyza'

update p
set p.Adres='Ata�ehir'
from Personel p
where p.Ad='Meryem' and Soyad='Beyza'


--Sorgu55:projelerde 5 saatten fazla �al��an sat�� b�l�m� personelinin maa��n� 20% artt�r g�ncelle
update p
set p.Maas=p.Maas*1.2
from Personel p
	inner join Bolum b on p.BolumID=b.BolumID
where b.BolumAd='Sat��' and p.PerID in (select pp.perID 
										from PersonelProje pp 
										group by pp.PerID 
										having sum(pp.CalismaSaat)>5)

select * from Personel p
	inner join Bolum b on p.BolumID=b.BolumID
where b.BolumAd='Sat��'


--Sorgu56:LogID, KullaniciID ve LogAciklama alanlar�yla KullaniciLog ad�nda yeni bir tablo olu�turunuz. LogID tekil
--olup KullaniciID Personel tablosunun PerID alan�na i�aret edecektir.
create table KullaniciLog (
LogID int identity(1,1),
KullaniciID int,
LogAciklama nvarchar(100),
Primary Key(LogID),
Foreign Key(KullaniciID) references Personel(PerID)
)

--Sorgu57: KullaniciLog tablosuna LogTarih ad�nda yeni alan ekleyiniz.
alter table KullaniciLog
add LogTarih datetime



