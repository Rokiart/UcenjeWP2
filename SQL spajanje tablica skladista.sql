



select a.sifra,a.brojizdatnice,a.datum,b.ime,b.prezime,c.ime,c.prezime
,e.naziv,d.kolicina,
concat(e.naziv,e.sifraproizvoda , e.mjernajedinica) as proizvod
from izdatnice a inner join osobe b 
on b.sifra=a. osoba
left join skladistari c
on c.sifra=a.skladistar
inner join izdatniceproizvodi d
on a.sifra=d.izdatnica
inner join proizvodi e
on d.proizvod=e.sifra;
