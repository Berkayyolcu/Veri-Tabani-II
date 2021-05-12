create database proje_erp;
use proje_erp;

create table Müsteri(
mid int not null,
tc varchar(14)not null,
Adı_Soyadı varchar(60) not null,
E_posta varchar(50) not null,
il_ilce varchar(50) not null,
Sifre varchar(45) not null,
primary key (mid)
);
insert into Müsteri(mid,tc,Adı_Soyadı,E_posta,il_ilce,Sifre)
values(1,'1234567891011','Ahmet günes','ahmetgünes@gmail.com','İstanbul/eyüp','12345'),
(2,'1234567891012','Tarık metin','tarıketin@gmail.com','İstanbul/fatih','tm12'),
(3,'1234567891013','Esra danıs','esradanıs@gmail.com','Ankara/cankaya','ed1234'),
(4,'1234567891014','Ece yılmaz','eceyılmaz@gmail.com','Ankara/Batıkent','ey12'),
(5,'1234567891015','Salih kaya','salihkaya@gmail.com','Kastamonu/kuzeykent','sk12345'),
(6,'1234567891016','Sinan karabulut','sinankarabulut@gmail.com','Mugla/fethiye','sk12');
select *from Müsteri;
drop table Müsteri;

create table Ürün(
üid int not null,
Adı varchar(50)not null,
Adet int not null,
Birim_fiyatı varchar(10)not null,
mid int not null,
primary key (üid)
);
insert into Ürün(üid,Adı,Adet,Birim_fiyatı,mid)
values(1,'Excalibur G770','1','7800 Tl','1'),
(2,'Siyah Erkek Oversize Bisiklet Yaka Baskılı','2','50 Tl','2'),
(3,'LEGEND ESSENTIAL 2 Siyah','1','530 TL','3'),
(4,'Aqua Di Polo Unisex Kol Saati APL12C195H02','2','70 Tl','4'),
(5,'Pars Afrodizyak Parfüm 50ml Erkek Aphrodisiac','1','100 Tl','5'),
(6,'Xiaomi Mi 10T Pro 256 GB Cosmic Black','1','6500 Tl','6');
select *from Ürün;
drop table Ürün;

create table Siparis(
sid int not null,
Siparis_adı varchar(45),
Siparis_adet int not null,
Birim_fiyatı varchar(10)not null,
üid int not null,
mid int not null,
primary key (sid)
);
insert into Siparis(sid,Siparis_adı,Siparis_adet,Birim_fiyatı,üid,mid)
values(1,'Excalibur G770','1','7800 Tl','1','1'),
(2,'Siyah Erkek Oversize Bisiklet Yaka Baskılı','2','50 Tl','2','2'),
(3,'LEGEND ESSENTIAL 2 Siyah','1','530 TL','3','3'),
(4,'Aqua Di Polo Unisex Kol Saati APL12C195H02','2','70 Tl','4','4'),
(5,'Pars Afrodizyak Parfüm 50ml Erkek Aphrodisiac','1','100 Tl','5','5'),
(6,'Xiaomi Mi 10T Pro 256 GB Cosmic Black','1','6500 Tl','6','6');
select *from Siparis;
drop table siparis;

create table Kargo(
kid int not null,
Adı varchar(25)not null,
Adres varchar(65)not null,
mid int not null,
primary key (kid)
);
insert into Kargo(kid,Adı,Adres,mid)
values(1,'Yurt İci','Topçular, Rami Kışla Cd. No: 68 D:M, 34055 Eyüpsultan/İstanbul','1'),
(2,'Mng',' Aksaray, Asım Bey Sk. No:18/1, 34096 Fatih/İstanbul','2'),
(3,'Sürat','Burç, 694. Sk No: 2 / 1, 06210 Yenimahalle/Ankara','3'),
(4,'Ptt',' Çamlıca, 176. Sk., 06374 Yenimahalle/Ankara','4'),
(5,'Aras','Topçuoğlu, Onay Sok No:17/A, 37100 Merkez/Kastamonu','5'),
(6,'Ups','Ortakentyahşi, Cumhuriyet Cd. No:1 D:No:42, 48420 Bodrum/Muğla','6');
select*from Kargo;
drop table Kargo;

create table Fatura(
fid int not null,
Tarih date,
mid int not null,
primary key (fid)
);
insert into Fatura(fid,Tarih,mid)
values(1,'2020-08-03','1'),
(2,'2021-05-05','2'),
(3,'2021-01-10','3'),
(4,'2021-06-08','4'),
(5,'2020-07-15','5'),
(6,'2021-02-20','6');
select *from Fatura;
drop table Fatura;

create table Satıs_temsilcisi(
stid int not null,
tc varchar(14)not null,
Adı_Soyadı varchar(25),
E_posta varchar(50) not null,
üid int not null,
mid int not null,
primary key (stid)
);
insert into  Satıs_temsilcisi(stid,tc,Adı_Soyadı,E_posta,üid,mid)
values(1,'1234567891017','Berkay Yolcu','berkayyolcu@gmail.com','1','1'),
(2,'1234567891018','Hasan gülgün','hasangülgün@gmail.com','2','2'),
(3,'1234567891019','Hüseyin tamer','hüseyintamer@gmail.com','3','3'),
(4,'1234567891020','Atakan arslan','atakanarslan@gmail.com','4','4'),
(5,'1234567891021','İbrahim hatkenti','ibrahimhatkenli@gmail.com','5','5'),
(6,'1234567891016','mehmet selvi','mehmetselvi@gmail.com','6','6');
select*from Satıs_temsilcisi;
drop table Satıs_temsilcisi;

create table Kategori(
kaid int not null,
Adı varchar(25),
üid int not null,
primary key (kaid)
);
insert into  Kategori(kaid,Adı,üid)
values(1,'Teknoloji',1),
(2,'Giyim',2),
(3,'Ayakkabı',3),
(4,'Saat&Aksesuar',4),
(5,'Kisisel bakım',5),
(6,'Teknoloji',6);
select*from Kategori;
drop table Kategori;


select * from Fatura
inner join  Müsteri on Fatura.mid = Müsteri.mid;  

select * from Satıs_temsilcisi
inner join  Müsteri on Satıs_temsilcisi.mid=Müsteri.mid;

select * from Ürün
inner join  Müsteri on Ürün.mid=Müsteri.mid;

select * from Siparis
inner join  Müsteri on Siparis.mid = Müsteri.mid;

select * from Kargo
inner join  Müsteri on Kargo.mid=Müsteri.mid;

select * from Satıs_temsilcisi
inner join Ürün on Satıs_temsilcisi.üid=Ürün.üid;

select * from Siparis
inner join Ürün on Siparis.üid=Ürün.üid;

select * from Kategori
inner join Ürün on Kategori.üid = Ürün.üid;





