set echo on
set linesize 300
set pagesize 500
spool BD2C022_DML.LIS

-- Testowanie ogranicze� unikalno�ci dla tabeli 'studenci'
--Testy ograniczen wstawiania
INSERT INTO studenci (nr_albumu, nazwisko, imie, data_urodzenia, pesel) VALUES ('ABC1234', 'TESTOWY', 'Jan', TO_DATE('2003-01-01', 'YYYY-MM-DD'), '56789234016');
INSERT INTO studenci (nr_albumu, nazwisko, imie, data_urodzenia, pesel) VALUES ('5671234', 'TESTOWY', 'Jan', TO_DATE('2003-01-01', 'YYYY-MM-DD'), '56789234016');
DELETE FROM studenci WHERE nr_albumu = '5671234';
INSERT INTO studenci (nr_albumu, nazwisko, imie, data_urodzenia, pesel) VALUES ('1234566', 'Kowalski', 'Jan', TO_DATE('1991-01-01', 'YYYY-MM-DD'), '12345678902');
INSERT INTO studenci (nr_albumu, nazwisko, imie, data_urodzenia, pesel) VALUES ('1234566', 'KOWALSKI', 'Jan', TO_DATE('1991-01-01', 'YYYY-MM-DD'), '12345678902');
--Ponownie ten sam student
INSERT INTO studenci (nr_albumu, nazwisko, imie, data_urodzenia, pesel) VALUES ('1234566', 'KOWALSKI', 'Jan', TO_DATE('1991-01-01', 'YYYY-MM-DD'), '12345678902');

-- Proba dodania studenta z istniej�cym ju� PESEL-em
INSERT INTO studenci (nr_albumu, nazwisko, imie, data_urodzenia, pesel) VALUES ('7654321', 'NOWAK', 'ADAM', TO_DATE('2001-02-02','YYYY-MM-DD'), '12345678902');
DELETE FROM studenci WHERE nr_albumu = '1234566';

INSERT INTO tematy_ocen (nr_tematu, kod_przedmiotu, tytul, waga_tematu) VALUES (2, 'MAT1', 'U�amki', 2);
INSERT INTO oceny (nr_albumu, kod_przedmiotu, data_zapisu, nr_tematu, wartosc, data_wystawienia) VALUES ('1234567', 'MAT1', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 2, 3.5, TO_DATE('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('1234567', 'FIZ', 1, 4.5, TO_DATE('2024-02-01', 'YYYY-MM-DD'));

-- Testowanie ogranicze� dla tabeli 'oceny'
-- Dodanie oceny z dat� wystawienia wcze�niejsz� ni� data zapisu na przedmiot
INSERT INTO zapisy_na_przedmioty (nr_albumu, kod_przedmiotu, data_zapisu) VALUES ('3456789', 'MAT1', TO_DATE('2020-01-01', 'YYYY-MM-DD'));
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('3456789', 'MAT1', 1, 4, TO_DATE('2000-01-01','YYYY-MM-DD'));
DELETE FROM zapisy_na_przedmioty WHERE nr_albumu = '3456789' AND kod_przedmiotu = 'MAT1' AND data_zapisu = TO_DATE('2020-01-01', 'YYYY-MM-DD');;

-- Dodanie oceny z warto�ci� spoza dozwolonego zakresu
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('1234567', 'FIZ', 2, 6, TO_DATE('2024-01-15','YYYY-MM-DD'));

-- Testowanie ogranicze� dla tabeli 'tematy_ocen'
-- Dodanie tematu oceny z wag� spoza dozwolonego zakresu
INSERT INTO tematy_ocen (kod_przedmiotu, tytul, waga_tematu) VALUES ('PRZ001', 'Testowy temat', 3);

-- Testowanie ogranicze� dla tabeli 'zapisy_na_przedmioty'
-- Dodanie zapisu na przedmiot z ocen� ko�cow� spoza dozwolonego zakresu
INSERT INTO zapisy_na_przedmioty (nr_albumu, kod_przedmiotu, data_zapisu, ocena_koncowa) VALUES ('4567890', 'MAT2', TO_DATE('2024-01-15','YYYY-MM-DD'), 6);

-- Testowanie wyzwalaczy
-- Pr�ba zmiany kodu przedmiotu w tabeli 'tematy_ocen', co powinno naruszy� ograniczenie nietransferowalno�ci klucza obcego
UPDATE tematy_ocen SET kod_przedmiotu = 'MAT2' WHERE nr_tematu = 1 AND kod_przedmiotu = 'MAT1';

-- Pr�ba zmiany nr_albumu lub kod_przedmiotu w tabeli 'zapisy_na_przedmioty', co r�wnie� powinno naruszy� ograniczenie nietransferowalno�ci:
UPDATE zapisy_na_przedmioty SET kod_przedmiotu = 'FIZ' WHERE nr_albumu = '2345678' AND kod_przedmiotu = 'MAT2' AND data_zapisu = TO_DATE('2023-10-02', 'YYYY-MM-DD');

-- Test ograniczenia na usuni�cie przedmiotu, na kt�ry s� zapisani studenci, powinno spowodowa� b��d ze wzgl�du na ograniczenie klucza obcego z opcj� CASCADE
DELETE FROM przedmioty WHERE kod_przedmiotu = 'MAT1';

--Test na aktualizacj� danych studenta (UPDATE) zmiana daty urodzenia studenta:
UPDATE studenci SET data_urodzenia = TO_DATE('1999-01-01', 'YYYY-MM-DD') WHERE nr_albumu = '1234567';
UPDATE studenci SET data_urodzenia = TO_DATE('1992-01-01', 'YYYY-MM-DD') WHERE nr_albumu = '1234567';


spool off