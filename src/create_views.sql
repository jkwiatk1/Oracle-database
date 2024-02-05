CREATE OR REPLACE VIEW widok_ocen_studentow AS
    SELECT 
        s.nr_albumu,
        s.nazwisko,
        s.imie,
        p.kod_przedmiotu,
        p.nazwa AS nazwa_przedmiotu,
        o.nr_tematu,
        t.waga_tematu,
        o.wartosc AS ocena,
        o.data_wystawienia
    FROM 
        studenci s
    JOIN 
        oceny o ON s.nr_albumu = o.nr_albumu
    JOIN 
        przedmioty p ON o.kod_przedmiotu = p.kod_przedmiotu
    JOIN
        tematy_ocen t ON o.kod_przedmiotu = t.kod_przedmiotu AND o.nr_tematu = t.nr_tematu;


CREATE OR REPLACE VIEW srednia_ocen_studentow AS
    SELECT 
        o.nr_albumu,
        s.nazwisko,
        s.imie,
        o.kod_przedmiotu,
        p.nazwa AS nazwa_przedmiotu,
        SUM(o.wartosc * t.waga_tematu) / SUM(t.waga_tematu) AS srednia_ocena
    FROM 
        oceny o
    JOIN 
        studenci s ON o.nr_albumu = s.nr_albumu
    JOIN 
        przedmioty p ON o.kod_przedmiotu = p.kod_przedmiotu
    JOIN 
        tematy_ocen t ON o.kod_przedmiotu = t.kod_przedmiotu AND o.nr_tematu = t.nr_tematu
    GROUP BY 
        o.nr_albumu, s.nazwisko, s.imie, o.kod_przedmiotu, p.nazwa;
    
GRANT SELECT ON widok_ocen_studentow TO bd2c022_app;
GRANT SELECT ON srednia_ocen_studentow TO bd2c022_app;

