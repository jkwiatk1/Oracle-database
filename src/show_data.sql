set echo on
set linesize 300
set pagesize 500
spool BD2C022_APP_TEST.LIS

SELECT * FROM studenci ORDER BY nazwisko;
SELECT * FROM studenci WHERE data_urodzenia > '2000-01-01';

SELECT * FROM przedmioty;

SELECT * FROM tematy_ocen;

SELECT * FROM zapisy_na_przedmioty;

SELECT * FROM oceny;

--Informacje o ocenach danego studenta z danego przedmiotu:
SELECT s.imie, s.nazwisko, p.nazwa, o.wartosc FROM oceny o
    JOIN studenci s ON o.nr_albumu = s.nr_albumu
    JOIN przedmioty p ON o.kod_przedmiotu = p.kod_przedmiotu
    WHERE s.nr_albumu = '1234567' AND p.kod_przedmiotu = 'MAT1';
    
--Wszystkie oceny z danego tematu:
SELECT s.nr_albumu, s.nazwisko, o.nr_tematu, o.wartosc
    FROM oceny o
    JOIN studenci s ON o.nr_albumu = s.nr_albumu
    WHERE o.kod_przedmiotu = 'MAT1' and o.nr_tematu = 1;
    
--Studenci zapisani na przedmioty:
SELECT s.nr_albumu, s.nazwisko, s.imie, p.kod_przedmiotu, z.data_zapisu, p.nazwa
    FROM zapisy_na_przedmioty z
    JOIN studenci s ON z.nr_albumu = s.nr_albumu
    JOIN przedmioty p ON z.kod_przedmiotu = p.kod_przedmiotu;

--Perspektywa:
SELECT * FROM widok_ocen_studentow WHERE nr_albumu = '2345678' AND kod_przedmiotu = 'MAT2';
SELECT * FROM srednia_ocen_studentow WHERE nr_albumu = '2345678' AND kod_przedmiotu = 'MAT2';

spool off