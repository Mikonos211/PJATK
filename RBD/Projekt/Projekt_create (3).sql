-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-05-24 18:57:37.767

-- tables
-- Table: Dozorca
CREATE TABLE Dozorca (
    ID_doz integer  NOT NULL,
    Osoba_pesel integer  NOT NULL,
    CONSTRAINT Dozorca_pk PRIMARY KEY (ID_doz)
) ;

-- Table: Ilosc_dozorcow
CREATE TABLE Ilosc_dozorcow (
    Dozorca_ID_doz integer  NOT NULL,
    Skrzydlo_ID integer  NOT NULL,
    CONSTRAINT Ilosc_dozorcow_pk PRIMARY KEY (Dozorca_ID_doz,Skrzydlo_ID)
) ;

-- Table: Ilosc_kucharzy
CREATE TABLE Ilosc_kucharzy (
    Kucharz_ID_Kucharz integer  NOT NULL,
    Stolowka_ID_Stolowki integer  NOT NULL,
    CONSTRAINT Ilosc_kucharzy_pk PRIMARY KEY (Kucharz_ID_Kucharz,Stolowka_ID_Stolowki)
) ;

-- Table: Izolatka
CREATE TABLE Izolatka (
    ID_izolatka integer  NOT NULL,
    Skrzydlo_ID integer  NOT NULL,
    przestepca_ID integer  NOT NULL,
    CONSTRAINT Izolatka_pk PRIMARY KEY (ID_izolatka)
) ;

-- Table: Kucharz
CREATE TABLE Kucharz (
    ID_Kucharz integer  NOT NULL,
    Osoba_pesel integer  NOT NULL,
    CONSTRAINT Kucharz_pk PRIMARY KEY (ID_Kucharz)
) ;

-- Table: Naczelnik
CREATE TABLE Naczelnik (
    ID_nacz integer  NOT NULL,
    Osoba_pesel integer  NOT NULL,
    CONSTRAINT Naczelnik_pk PRIMARY KEY (ID_nacz)
) ;

-- Table: Osoba
CREATE TABLE Osoba (
    pesel integer  NOT NULL,
    imie varchar2(20)  NOT NULL,
    nazwisko varchar2(20)  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (pesel)
) ;

-- Table: Skrzydlo
CREATE TABLE Skrzydlo (
    ID integer  NOT NULL,
    kierunek varchar2(20)  NOT NULL,
    Naczelnik_ID_nacz integer  NOT NULL,
    CONSTRAINT Skrzydlo_pk PRIMARY KEY (ID)
) ;

-- Table: Stolowka
CREATE TABLE Stolowka (
    ID_Stolowki integer  NOT NULL,
    Ilosc_miejsc number(20,20)  NOT NULL,
    Skrzydlo_ID integer  NOT NULL,
    CONSTRAINT Stolowka_pk PRIMARY KEY (ID_Stolowki)
) ;

-- Table: cela
CREATE TABLE cela (
    ID_Celi integer  NOT NULL,
    ilosc_miejsc varchar2(5)  NOT NULL,
    Skrzydlo_ID integer  NOT NULL,
    CONSTRAINT cela_pk PRIMARY KEY (ID_Celi)
) ;

-- Table: ilosc_przestepcow
CREATE TABLE ilosc_przestepcow (
    przestepca_ID integer  NOT NULL,
    cela_ID_Celi integer  NOT NULL,
    CONSTRAINT ilosc_przestepcow_pk PRIMARY KEY (przestepca_ID,cela_ID_Celi)
) ;

-- Table: przestepca
CREATE TABLE przestepca (
    ID integer  NOT NULL,
    data_rozpoczeciawyroku date  NOT NULL,
    data_wyjscia date  NULL,
    Osoba_pesel integer  NOT NULL,
    CONSTRAINT przestepca_pk PRIMARY KEY (ID)
) ;

-- foreign keys
-- Reference: Dozorca_Osoba (table: Dozorca)
ALTER TABLE Dozorca ADD CONSTRAINT Dozorca_Osoba
    FOREIGN KEY (Osoba_pesel)
    REFERENCES Osoba (pesel);

-- Reference: Ilosc_dozorcow_Dozorca (table: Ilosc_dozorcow)
ALTER TABLE Ilosc_dozorcow ADD CONSTRAINT Ilosc_dozorcow_Dozorca
    FOREIGN KEY (Dozorca_ID_doz)
    REFERENCES Dozorca (ID_doz);

-- Reference: Ilosc_dozorcow_Skrzydlo (table: Ilosc_dozorcow)
ALTER TABLE Ilosc_dozorcow ADD CONSTRAINT Ilosc_dozorcow_Skrzydlo
    FOREIGN KEY (Skrzydlo_ID)
    REFERENCES Skrzydlo (ID);

-- Reference: Ilosc_kucharzy_Kucharz (table: Ilosc_kucharzy)
ALTER TABLE Ilosc_kucharzy ADD CONSTRAINT Ilosc_kucharzy_Kucharz
    FOREIGN KEY (Kucharz_ID_Kucharz)
    REFERENCES Kucharz (ID_Kucharz);

-- Reference: Ilosc_kucharzy_Stolowka (table: Ilosc_kucharzy)
ALTER TABLE Ilosc_kucharzy ADD CONSTRAINT Ilosc_kucharzy_Stolowka
    FOREIGN KEY (Stolowka_ID_Stolowki)
    REFERENCES Stolowka (ID_Stolowki);

-- Reference: Izolatka_Skrzydlo (table: Izolatka)
ALTER TABLE Izolatka ADD CONSTRAINT Izolatka_Skrzydlo
    FOREIGN KEY (Skrzydlo_ID)
    REFERENCES Skrzydlo (ID);

-- Reference: Izolatka_przestepca (table: Izolatka)
ALTER TABLE Izolatka ADD CONSTRAINT Izolatka_przestepca
    FOREIGN KEY (przestepca_ID)
    REFERENCES przestepca (ID);

-- Reference: Kucharz_Osoba (table: Kucharz)
ALTER TABLE Kucharz ADD CONSTRAINT Kucharz_Osoba
    FOREIGN KEY (Osoba_pesel)
    REFERENCES Osoba (pesel);

-- Reference: Naczelnik_Osoba (table: Naczelnik)
ALTER TABLE Naczelnik ADD CONSTRAINT Naczelnik_Osoba
    FOREIGN KEY (Osoba_pesel)
    REFERENCES Osoba (pesel);

-- Reference: Skrzydlo_Naczelnik (table: Skrzydlo)
ALTER TABLE Skrzydlo ADD CONSTRAINT Skrzydlo_Naczelnik
    FOREIGN KEY (Naczelnik_ID_nacz)
    REFERENCES Naczelnik (ID_nacz);

-- Reference: Stolowka_Skrzydlo (table: Stolowka)
ALTER TABLE Stolowka ADD CONSTRAINT Stolowka_Skrzydlo
    FOREIGN KEY (Skrzydlo_ID)
    REFERENCES Skrzydlo (ID);

-- Reference: cela_Skrzydlo (table: cela)
ALTER TABLE cela ADD CONSTRAINT cela_Skrzydlo
    FOREIGN KEY (Skrzydlo_ID)
    REFERENCES Skrzydlo (ID);

-- Reference: ilosc_przestepcow_cela (table: ilosc_przestepcow)
ALTER TABLE ilosc_przestepcow ADD CONSTRAINT ilosc_przestepcow_cela
    FOREIGN KEY (cela_ID_Celi)
    REFERENCES cela (ID_Celi);

-- Reference: ilosc_przestepcow_przestepca (table: ilosc_przestepcow)
ALTER TABLE ilosc_przestepcow ADD CONSTRAINT ilosc_przestepcow_przestepca
    FOREIGN KEY (przestepca_ID)
    REFERENCES przestepca (ID);

-- Reference: przestepca_Osoba (table: przestepca)
ALTER TABLE przestepca ADD CONSTRAINT przestepca_Osoba
    FOREIGN KEY (Osoba_pesel)
    REFERENCES Osoba (pesel);

-- End of file.


--Naczelnicy
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (92010212345, 'Jan', 'Paryski');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (75051278901, 'Marek', 'Nowak');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (88102545670, 'Piotr', 'Lewandowski');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (63070898763, 'Michał', 'Dąbrowski');

--Dozorcy
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (80041589026, 'Grzegorz', 'Kamiński');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (89071356789, 'Tomasz', 'Zieliński');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (74090787650, 'Kamil', 'Wójcik');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (69052478901, 'Rafał', 'Lis');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (82122745670, 'Marcin', 'Pawlak');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (94050223418, 'Adam', 'Adamczyk');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (73031934567, 'Patryk', 'Kowal');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (62062487650, 'Robert', 'Michalski');


--Kucharze
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (88022012345, 'Patryk', 'Witkowski');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (67071378901, 'Dominik', 'Kaczmarek');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (81100145670, 'Paweł', 'Zając');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (90050893418, 'Mateusz', 'Sikora');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (93091146789, 'Krzysztof', 'Olszewski');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (80021438901, 'Kacper', 'Górecki');

--Wiezniowe
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (85010877650, 'Wojciech', 'Jaworski');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (67082612345, 'Bartosz', 'Sobczak');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (95090123456, 'Kamil', 'Kowalski');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (81060456789, 'Bartłomiej', 'Nowicki');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (70071234567, 'Maciej', 'Kaczmarczyk');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (93031278901, 'Artur', 'Jankowski');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (88060823456, 'Szymon', 'Wójcicki');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (75081956789, 'Paweł', 'Duda');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (96031134567, 'Krzysztof', 'Lisowski');
INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (79040278901, 'Mateusz', 'Mazur');
INSERT INTO Osoba (pesel, imie, nazwisko) values (81240278901, 'Pawel', 'Janowski');

-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (91052623456, 'Piotr', 'Czarnecki');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (86030156789, 'Marcin', 'Włodarczyk');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (74061734567, 'Rafał', 'Nowakowski');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (92072078901, 'Adrian', 'Jaworski');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (78040823456, 'Damian', 'Kamiński');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (94091256789, 'Błażej', 'Zając');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (89062334567, 'Tomasz', 'Pawlak');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (72081378901, 'Wojciech', 'Sikorski');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (93092623456, 'Kacper', 'Olszewski');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (80071556789, 'Mikołaj', 'Krawczyk');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (89092834567, 'Michał', 'Górecki');
-- INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (76070978901, 'Artur', 'Jaworski');

INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (51, '2000-06-15' , '2023-06-15', 85010877650);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (52, '2001-06-15' , '2023-06-15', 67082612345);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (53, '2002-06-15' , '2023-06-15', 95090123456);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (54, '2003-06-15' , '2023-06-15', 81060456789);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (55, '2013-06-15' , '2023-06-15', 70071234567);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (56, '2020-06-15' , '2023-06-15', 93031278901);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (57, '2020-06-15' , '2023-06-15', 88060823456);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (58, '2020-06-15' , '2023-06-15', 75081956789);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (59, '2020-06-15' , '2023-06-15', 96031134567);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (60, '2020-06-15' , '2023-06-15', 79040278901);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (60, '2020-06-15' , '2023-06-15', 79040278901);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (61, '2020-06-15' , '2023-06-15', 81240278901);

UPDATE przestepca
SET data_rozpoczeciawyroku = '2000-06-16', data_wyjscia = '2023-06-16'
WHERE ID = 51;
UPDATE przestepca
SET data_rozpoczeciawyroku = '2002-16-17', data_wyjscia = '2003-06-30'
WHERE ID = 52;
UPDATE przestepca
SET data_rozpoczeciawyroku = '2014-08-24', data_wyjscia = '2019-04-21'
WHERE ID = 53;
UPDATE przestepca
SET data_rozpoczeciawyroku = '2005-08-07', data_wyjscia = '2018-12-06'
WHERE ID = 54;
UPDATE przestepca
SET data_rozpoczeciawyroku = '2001-06-16', data_wyjscia = '2015-03-12'
WHERE ID = 55;
UPDATE przestepca
SET data_rozpoczeciawyroku ='2007-07-09'
, data_wyjscia = '2012-06-17'
WHERE ID = 56;
UPDATE przestepca
SET data_rozpoczeciawyroku = '2013-02-09', data_wyjscia = '2022-09-27'
WHERE ID = 57;
UPDATE przestepca
SET data_rozpoczeciawyroku = '2004-04-01'
, data_wyjscia = '2023-06-17'
WHERE ID = 58;
UPDATE przestepca
SET data_rozpoczeciawyroku = '2010-03-25', data_wyjscia = '2023-01-23'
WHERE ID = 59;
UPDATE przestepca
SET data_rozpoczeciawyroku ='2009-11-11', data_wyjscia = '2020-07-03'
WHERE ID = 60;


INSERT INTO Kucharz (ID_Kucharz, Osoba_pesel) values (31, 88022012345);
INSERT INTO Kucharz (ID_Kucharz, Osoba_pesel) values (32, 67071378901);
INSERT INTO Kucharz (ID_Kucharz, Osoba_pesel) values (33, 81100145670);

INSERT INTO Naczelnik (ID_nacz, Osoba_pesel) values (11,92010212345);

INSERT INTO Dozorca (ID_doz, Osoba_pesel) values (21, 80041589026);
INSERT INTO Dozorca (ID_doz, Osoba_pesel) values (22, 89071356789);
INSERT INTO Dozorca (ID_doz, Osoba_pesel) values (23, 74090787650);

INSERT INTO Skrzydlo (ID, kierunek, Naczelnik_ID_nacz) values (1,'Polnoce', 11);

INSERT INTO Stolowka (ID_Stolowki, Ilosc_miejsc, Skrzydlo_ID) values (81, 10, 1);

INSERT INTO Ilosc_kucharzy (Kucharz_ID_Kucharz, Stolowka_ID_Stolowki) values (31, 81);
INSERT INTO Ilosc_kucharzy (Kucharz_ID_Kucharz, Stolowka_ID_Stolowki) values (32, 81);
INSERT INTO Ilosc_kucharzy (Kucharz_ID_Kucharz, Stolowka_ID_Stolowki) values (33, 81);

INSERT INTO cela (ID_Celi, ilosc_miejsc, Skrzydlo_ID) values (00, 4,1);
INSERT INTO cela (ID_Celi, ilosc_miejsc, Skrzydlo_ID) values (01, 3, 1);
INSERT INTO cela (ID_Celi, ilosc_miejsc, Skrzydlo_ID) values (02, 3, 1);

INSERT INTO ilosc_przestepcow (przestepca_ID, cela_ID_Celi) values (51,00);
INSERT INTO ilosc_przestepcow (przestepca_ID, cela_ID_Celi) values (52,00);
INSERT INTO ilosc_przestepcow (przestepca_ID, cela_ID_Celi) values (53,00);
INSERT INTO ilosc_przestepcow (przestepca_ID, cela_ID_Celi) values (54,00);

INSERT INTO ilosc_przestepcow (przestepca_ID, cela_ID_Celi) values (55,01);
INSERT INTO ilosc_przestepcow (przestepca_ID, cela_ID_Celi) values (56,01);
INSERT INTO ilosc_przestepcow (przestepca_ID, cela_ID_Celi) values (57,01);

INSERT INTO ilosc_przestepcow (przestepca_ID, cela_ID_Celi) values (58,02);
INSERT INTO ilosc_przestepcow (przestepca_ID, cela_ID_Celi) values (59,02);
INSERT INTO ilosc_przestepcow (przestepca_ID, cela_ID_Celi) values (60,02);

INSERT INTO Izolatka (ID_izolatka, Skrzydlo_ID, przestepca_ID) values (001, 1, 61);
--Wypisuje osoby z imieniem zaczynajacym sie na k
SELECT imie, nazwisko
from Osoba
WHERE imie like 'K%';
--Informacje i wiezniu z numerem 51
SELECT *
from przestepca
    where id=51;
--Wypisuje imie i nazwiko zaczynajace sie na k
SELECT imie, nazwisko
from Osoba
WHERE imie like 'K%' and nazwisko like 'K%';
--Wyposuje pesel który nie zaczyna sie na 8
SELECT Osoba_pesel
from przestepca where Osoba_pesel not like '8%';
--Wypisuje informacje na temat celi z ilościa miejsc 4
SELECT *
from cela
WHERE ilosc_miejsc = 4;
--Wypisuje najdłuższe nazwiska
SELECT nazwisko
FROM Osoba
WHERE LENGTH(nazwisko) = (
    SELECT MAX(LENGTH(nazwisko))
    FROM Osoba
);
--Wypisuje przestępce  z najdłóższym nazwiskiem
SELECT Osoba.imie, Osoba.nazwisko
FROM Osoba
JOIN przestepca ON Osoba.pesel = przestepca.Osoba_pesel
WHERE LENGTH(nazwisko) = (
    SELECT MAX(LENGTH(nazwisko))
    FROM Osoba
);
--Wypisuje przestępców i ich wyroki które zaczeły się przed 2015
SELECT Osoba.imie, przestepca.data_rozpoczeciawyroku
FROM Osoba
JOIN przestepca ON Osoba.pesel = przestepca.Osoba_pesel
WHERE przestepca.data_rozpoczeciawyroku < '2015-03-12';
--Wypisuje naczelnika i Skrzydło nad którym sprawuje władze
SELECT Osoba.imie AS "Naczelnik Skrzydla" , Skrzydlo.kierunek
FROM Skrzydlo
JOIN Naczelnik ON Skrzydlo.Naczelnik_ID_nacz = Naczelnik.ID_nacz
JOIN Osoba ON Naczelnik.Osoba_pesel = Osoba.pesel;
--Wypisuje kucharzy i ich ID
SELECT Osoba.imie, Osoba.nazwisko, Kucharz.ID_Kucharz
FROM Osoba
JOIN Kucharz ON Osoba.pesel = Kucharz.Osoba_pesel;
--Wypisuje Więźniów których pesel nie konczy sie na 7
SELECT Osoba.imie, Osoba.nazwisko, przestepca.Osoba_pesel
FROM Osoba
JOIN przestepca ON Osoba.pesel = przestepca.Osoba_pesel
WHERE pesel not like '%7';
--Wypisuje kucharzy Których imie zaczyna się na p
SELECT Osoba.imie, COUNT(Kucharz.ID_Kucharz) AS LiczbaKucharzy
FROM Osoba
JOIN Kucharz ON Osoba.pesel = Kucharz.Osoba_pesel
WHERE imie LIKE 'P%'
GROUP BY Osoba.imie
HAVING COUNT(Kucharz.ID_Kucharz) <= 2;
--Wypisuje więzniów i ich pesele
SELECT Osoba.imie, Osoba.nazwisko, przestepca.Osoba_pesel
FROM Osoba
JOIN przestepca ON Osoba.pesel = przestepca.Osoba_pesel
GROUP BY Osoba.imie, Osoba.nazwisko, przestepca.Osoba_pesel;
--Wypisuje wyroku które zczeły się po 2012-06-17
SELECT data_rozpoczeciawyroku
from przestepca
GROUP BY data_rozpoczeciawyroku
HAVING data_rozpoczeciawyroku >= '2012-06-17';
--Liczy ile jest Więzniów z numerem powyżej 58
SELECT SUM(przestepcy) AS liczba_przestepcow
FROM (
  SELECT COUNT(*) AS przestepcy
  FROM przestepca
  GROUP BY ID
  HAVING ID >= 58
);
--Zlicza liczbę persolenu
SELECT rola, COUNT(*) AS liczba_personelu
FROM (
  SELECT 'nadzorca' AS rola FROM Naczelnik
  UNION ALL
  SELECT 'dozorcy' AS rola FROM Dozorca
  UNION ALL
  SELECT 'kucharze' AS rola FROM Kucharz
)
GROUP BY rola
HAVING rola = 'nadzorca' OR COUNT(*) > 1;

COMMIT;




