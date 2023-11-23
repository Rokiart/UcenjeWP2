﻿-- select lista nalazi se izmeðu select i from

-- filtriranje kolona

-- * sve kolone
select * from smjerovi;

-- nazivi kolona
select naziv, cijena from smjerovi;

-- konstanta
select naziv, 'Osijek', 8, 9.8 from smjerovi;

-- kolonama se može dati zamjensko ime
select naziv as smjer, 'Osijek' as grad from smjerovi;

-- izraz
select naziv, len(naziv) as duzina, 
getdate() as datum from smjerovi;

-- najjednostavniji select
select 1;

-- najkompliciranji primjer
select sifra as s, naziv as n, 'Edunova' as skola,
len(naziv) as duzina, * from smjerovi;

-- filtriranje redova - where dio

select * from smjerovi where sifra=1;

-- operatori
-- usporeðivanje = > >= < <= !=
select * from polaznici where sifra!=7;

select * from polaznici where ime='Ivan';

select * from grupe where datumpocetka>'2023-09-01';

-- logièke operatori: and, or
select * from polaznici where
not (ime='Ivan' or ime='Ivor');

-- ostali operatori: like
select * from polaznici where ime not like '%a%';

-- koji su polaznici s poèetnim slovom prezimena B
select * from polaznici where prezime like 'B%žiæ';

-- kaladont
select * from polaznici where prezime like '%nt';

select * from polaznici where 
sifra=2 or sifra=4 or sifra=7;

-- jednostavnija sintaksa
select * from polaznici where sifra in (2,4,7);

select * from polaznici where
sifra>=6 and sifra<=10;

-- jednostavnija sintaksa
select * from polaznici where
 sifra between 6 and 10;

select * from grupe where
datumpocetka between '2023-01-01' and '2023-12-31';

-- na null vrijednosti u tavlicama ne može se primjenjivati niti jedan prethodno opisan operator
select * from smjerovi where brojsati=NULL;

-- koristi se: is null, is not null
select * from smjerovi where brojsati is not null;

select isnull(brojsati,30) as bs from smjerovi;


-- slaganje podataka

select * from polaznici order by prezime desc, 2 desc;

-- limitiranje podataka

select top 10 * from polaznici;

select top 10 percent * from polaznici;


select ime as djever, brojugovora as racun 
into nova
from polaznici; 


select * from nova;

drop table nova;







----------------------------------------
--- BAZA knjiznica

-- izlistajte imena i prezimena autora

select * from autor;
select ime from autor;


-- koliko ima redova u tablici autor
select * from autor;
select * from autor count;


-- izlistajte sve autore koji su roðeni u 
-- Vašoj godini roðenja

select * from autor where
datumrodenja between '1969-01-01'and'1969-12-31';


-- unesite sebe kao autora

insert into autor (sifra,ime,prezime,datumRodenja) values
(20775,'Roman','Žarić','1969-02-14');
select * from autor;


-- Mladiæa je ostavila djevojka i on pati
-- Moli pomoæ knjižnièarke koje knjige da 
-- posudi kako bi ju prebolio

select * from katalog where (naslov='ljubav' or naslov='bol');

select * from katalog;
-- islistajte sve neaktivne izdavaèe
select * from izdavac;
select * from izdavac where (aktivan=0);

-- izlistajte sve izdavaèe koji su
-- društva s ogranièenom odgovornošæu

select * from izdavac where (naziv like '%d.o.o');


-- Izlistajte sva mjesta u osjeèko baranjskoj županiji
select * from mjesto;
select * from mjesto where postanskiBroj like '31%';
select distinct mjesto where postanskiBroj like '31%';




-- S najmanjom pogreškom
-- islistajte sve autorice
select * from autor;
select * from autor where ime like '%a';

-- jedinstveni rezultati
select distinct ime from autor where ime like '%a';