--DELETE FROM oceny;
--DELETE FROM tematy_ocen;
--DELETE FROM zapisy_na_przedmioty;
--DELETE FROM przedmioty;
--DELETE FROM studenci;

--SELECT table_name FROM user_tables;

INSERT INTO studenci (nr_albumu, nazwisko, imie, data_urodzenia, pesel) VALUES ('1234567', 'KOWALSKI', 'Jan', TO_DATE('1990-01-01', 'YYYY-MM-DD'), '12345678901');
INSERT INTO studenci (nr_albumu, nazwisko, imie, data_urodzenia, pesel) VALUES ('2345678', 'NOWAK', 'Anna', TO_DATE('1991-02-01', 'YYYY-MM-DD'), '89012234567');
INSERT INTO studenci (nr_albumu, nazwisko, imie, data_urodzenia, pesel) VALUES ('3456789', 'WAWRZYNSKI', 'Tomasz', TO_DATE('1993-02-01', 'YYYY-MM-DD'), '01223456789');
INSERT INTO studenci (nr_albumu, nazwisko, imie, data_urodzenia, pesel) VALUES ('4567890', 'TOMASZEWSKI', 'Jakub', TO_DATE('2000-12-30', 'YYYY-MM-DD'), '56789012234');
INSERT INTO studenci (nr_albumu, nazwisko, imie, data_urodzenia, pesel) VALUES ('5678901', 'TOMASZEWSKA', '£ucja', TO_DATE('2001-08-16', 'YYYY-MM-DD'), '56789234012');
INSERT INTO studenci (nr_albumu, nazwisko, imie, data_urodzenia, pesel) VALUES ('6789012', 'ZARAŒ', 'Jan', TO_DATE('1998-06-08', 'YYYY-MM-DD'), '23789045612');
COMMIT;

INSERT INTO przedmioty (kod_przedmiotu, nazwa, opis) VALUES ('MAT1', 'Matematyka', 'Podstawy matematyki');
INSERT INTO przedmioty (kod_przedmiotu, nazwa, opis) VALUES ('MAT2', 'Matematyka 2', 'Matematyka rozszerzona');
INSERT INTO przedmioty (kod_przedmiotu, nazwa, opis) VALUES ('FIZ', 'Fizyka', 'Podstawy fizyki');
COMMIT;


INSERT INTO tematy_ocen (nr_tematu, kod_przedmiotu, tytul, waga_tematu) VALUES (1,'MAT1', 'U³amki', 1);
INSERT INTO tematy_ocen (nr_tematu, kod_przedmiotu, tytul, waga_tematu) VALUES (2,'MAT1', 'Geometria', 2);
INSERT INTO tematy_ocen (nr_tematu, kod_przedmiotu, tytul, waga_tematu) VALUES (3, 'MAT1', 'Pierwiastki', 1);
INSERT INTO tematy_ocen (nr_tematu, kod_przedmiotu, tytul, waga_tematu) VALUES (1,'MAT2', 'Szeregi', 1);
INSERT INTO tematy_ocen (nr_tematu, kod_przedmiotu, tytul, waga_tematu) VALUES (2,'MAT2', 'Ca³ki', 2);
INSERT INTO tematy_ocen (nr_tematu, kod_przedmiotu, tytul, waga_tematu) VALUES (1,'FIZ', 'Mechanika', 1);
INSERT INTO tematy_ocen (nr_tematu, kod_przedmiotu, tytul, waga_tematu) VALUES (2,'FIZ', 'Elektrostatyka', 2);
COMMIT;

INSERT INTO zapisy_na_przedmioty (nr_albumu, kod_przedmiotu, data_zapisu) VALUES ('1234567', 'MAT1', TO_DATE('2023-02-15', 'YYYY-MM-DD'));
INSERT INTO zapisy_na_przedmioty (nr_albumu, kod_przedmiotu, data_zapisu) VALUES ('2345678', 'MAT1', TO_DATE('2022-02-15', 'YYYY-MM-DD'));
INSERT INTO zapisy_na_przedmioty (nr_albumu, kod_przedmiotu, data_zapisu) VALUES ('2345678', 'MAT1', TO_DATE('2021-10-01', 'YYYY-MM-DD'));
INSERT INTO zapisy_na_przedmioty (nr_albumu, kod_przedmiotu, data_zapisu) VALUES ('1234567', 'MAT2', TO_DATE('2023-10-01', 'YYYY-MM-DD'));
INSERT INTO zapisy_na_przedmioty (nr_albumu, kod_przedmiotu, data_zapisu) VALUES ('2345678', 'MAT2', TO_DATE('2023-10-02', 'YYYY-MM-DD'));
INSERT INTO zapisy_na_przedmioty (nr_albumu, kod_przedmiotu, data_zapisu) VALUES ('1234567', 'FIZ', TO_DATE('2024-02-05', 'YYYY-MM-DD'));
INSERT INTO zapisy_na_przedmioty (nr_albumu, kod_przedmiotu, data_zapisu) VALUES ('5678901', 'MAT1', TO_DATE('2021-10-11', 'YYYY-MM-DD'));
COMMIT;

-- Oceny dla studenta o nr_albumu '1234567'
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('1234567', 'MAT1', 1, 4.5, TO_DATE('2024-01-10', 'YYYY-MM-DD'));
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('1234567', 'MAT1', 2, 3.5, TO_DATE('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('1234567', 'MAT1', 3, 5, TO_DATE('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('1234567', 'MAT2', 2, 3.5, TO_DATE('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('1234567', 'FIZ', 1, 4.5, TO_DATE('2024-02-15', 'YYYY-MM-DD'));
COMMIT;

-- Oceny dla studenta o nr_albumu '2345678'
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('2345678', 'MAT1', 1, 4.0, TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('2345678', 'MAT1', 2, 3.0, TO_DATE('2024-01-25', 'YYYY-MM-DD'));
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('2345678', 'MAT2', 1, 3.5, TO_DATE('2024-02-26', 'YYYY-MM-DD'));
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc) VALUES ('2345678', 'MAT2', 2, 5);
COMMIT;

-- Oceny dla studenta o nr_albumu '5678901'
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('5678901', 'MAT1', 1, 5, TO_DATE('2024-01-14', 'YYYY-MM-DD'));
INSERT INTO oceny (nr_albumu, kod_przedmiotu, nr_tematu, wartosc, data_wystawienia) VALUES ('5678901', 'MAT1', 2, 4.5, TO_DATE('2024-01-25', 'YYYY-MM-DD'));
COMMIT;