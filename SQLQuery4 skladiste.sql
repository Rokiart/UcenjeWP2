
use master;
go
drop database if exists skladisnoposlovanje;
go
create database skladisnoposlovanje;
go
alter database skladisnoposlovanje collate Croatian_CI_AS;
go
use skladisnoposlovanje;


create table proizvodi(

sifra int not null primary key identity(1,1),
naziv varchar(50) not null,
sifraproizvoda int,
mjernajedinica varchar(20) not null,
);

create table izdatnice(

sifra int not null primary key identity(1,1),
brojizdatnice int not null,
datum datetime,
osoba int not null,
skladistar int not null,
kolicina int,
napomena varchar(250)
);

create table osobe(

sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
brojtelefona int
);

create table skladistari(

sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
brojtelefona int
);

create table izdatniceproizvodi (

sifra int not null primary key identity(1,1),
proizvod int not null,
izdatnica int not null
);


alter table izdatniceproizvodi add foreign key (proizvod) references proizvodi(sifra);
alter table izdatniceproizvodi add foreign key (izdatnica) references izdatnice(sifra);
alter table izdatnice add foreign key (skladistar) references skladistari(sifra);
alter table izdatnice add foreign key (osoba) references osobe(sifra);



insert into skladistari(ime,prezime) 
values
--1
('Roman','�ari�'),
--2
('Miroslav','Jani�');

insert into proizvodi(naziv,mjernajedinica) 
values
--1
('lopata','kom'),
--2
('metla','kom'),
--3
('sapun','kom'),
--4
('�ampon','lit'),
--5
('gedore','gar'),
--6
('deter�ent','kg'),
--7
('pijesak','t');


insert into osobe(prezime,ime,brojtelefona) 
values
('Bo�i�','Petra',null),
('Farka�','Dominik',null),
('Glava�','Natalija',null),
('Jani�','Miroslav',null),
('Janje�i�','Filip',null),
('Jovi�','Nata�a',null),
('Bari�','Luka',null),
('Kelava','Antonio',null),
('Ke�inovi�','Marijan',null),
('Leninger','Ivan',null),
('Macanga','Antonio',null),
('Milolo�a','Antonio',null),
('Pavkovi�','Matija',null),
('Peterfaj','Karlo',null),
('Ple�a�','Adriana',null),
('Sen�i�','Ivan',null),
('�uler','Zvonimir',null),
('Tur�ek','Mario',null),
('Veseli','Domagoj',null),
('Vukovi�','Kristijan',null),
('Vuku�i�','Ivan',null),
('�ari�','Roman',null),
('Pavlovi�','Ivan',null),
('�upani�','Andrea',null),
('�upani�','Tomislav',null),
('Petak','Martina',null),
('Perak','Marko',null),
('Mokri�','Bartol',null),
('Julari�','Ljubomir',null),
('�eli�','Ivor',null);


insert into izdatnice(brojizdatnice,osoba,skladistar) 
values
(100,1,1),(101,12,2),(102,19,1),(103,24,2);

insert into izdatniceproizvodi(proizvod,izdatnica) 
values
(2,2),(1,2),(3,2),(4,3),(7,4);

