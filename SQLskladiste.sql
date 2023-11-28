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
mjernajedinica varchar(20) not null
); 

create table skladistari(

sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
brojtelefona varchar(20)
);

create table osobe(

sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
brojtelefona varchar(20)
);

create table izdatnice(

sifra int not null primary key identity(1,1),
brojizdatnice int not null,
datum datetime,
osoba int not null references osobe(sifra),
skladistar int not null references skladistari(sifra),
napomena varchar(250)
);

create table izdatniceproizvodi (

proizvod int not null references proizvodi(sifra),
izdatnica int not null references izdatnice(sifra),
kolicina int
);


--alter table izdatniceproizvodi add foreign key (proizvod) references proizvodi(sifra);
--alter table izdatniceproizvodi add foreign key (izdatnica) references izdatnice(sifra);
--alter table izdatnice add foreign key (skladistar) references skladistari(sifra);
--alter table izdatnice add foreign key (osoba) references osobe(sifra);



insert into skladistari(ime,prezime) 
values
--1
('Roman','Žarić'),
--2
('Miroslav','Janić');

insert into proizvodi(naziv,mjernajedinica) 
values
--1
('lopata','kom'),
--2
('metla','kom'),
--3
('sapun','kom'),
--4
('šampon','lit'),
--5
('gedore','gar'),
--6
('deterđent','kg'),
--7
('pijesak','t');


insert into osobe(prezime,ime,brojtelefona) 
values
('Božić','Petra',null),
('Farkaš','Dominik',null),
('Glavaš','Natalija',null),
('Janić','Miroslav',null),
('Janješić','Filip',null),
('Jović','Nataša',null),
('Barić','Luka',null),
('Kelava','Antonio',null),
('Kešinović','Marijan',null),
('Leninger','Ivan',null),
('Macanga','Antonio',null),
('Miloloža','Antonio',null),
('Pavković','Matija',null),
('Peterfaj','Karlo',null),
('Plečaš','Adriana',null),
('Senčić','Ivan',null),
('Šuler','Zvonimir',null),
('Turček','Mario',null),
('Veseli','Domagoj',null),
('Vuković','Kristijan',null),
('Vukušić','Ivan',null),
('Žarić','Roman',null),
('Pavlović','Ivan',null),
('Županić','Andrea',null),
('Županić','Tomislav',null),
('Petak','Martina',null),
('Perak','Marko',null),
('Mokriš','Bartol',null),
('Jularić','Ljubomir',null),
('Čelić','Ivor',null);


insert into izdatnice(brojizdatnice,osoba,skladistar) 
values
(100,1,1),(101,12,2),(102,19,1),(103,24,2);

insert into izdatniceproizvodi(proizvod,izdatnica) 
values
(2,2),(1,2),(3,2),(4,3),(7,4);
