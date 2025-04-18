-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-01-22 10:48:58.893

-- tables
-- Table: Dozorca
CREATE TABLE Dozorca (
    ID_doz integer  NOT NULL,
    Osoba_pesel varchar(20)  NOT NULL,
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
    Osoba_pesel varchar(20)  NOT NULL,
    CONSTRAINT Kucharz_pk PRIMARY KEY (ID_Kucharz)
) ;

-- Table: Naczelnik
CREATE TABLE Naczelnik (
    ID_nacz integer  NOT NULL,
    Osoba_pesel varchar(20)  NOT NULL,
    CONSTRAINT Naczelnik_pk PRIMARY KEY (ID_nacz)
) ;

-- Table: Osoba
CREATE TABLE Osoba (
    pesel varchar(20)  NOT NULL,
    imie varchar(20)  NOT NULL,
    nazwisko varchar(20)  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (pesel)
) ;

-- Table: Skrzydlo
CREATE TABLE Skrzydlo (
    ID integer  NOT NULL,
    kierunek varchar(20)  NOT NULL,
    Naczelnik_ID_nacz integer  NOT NULL,
    CONSTRAINT Skrzydlo_pk PRIMARY KEY (ID)
) ;

-- Table: Stolowka
CREATE TABLE Stolowka (
    ID_Stolowki integer  NOT NULL,
    Ilosc_miejsc integer  NOT NULL,
    Skrzydlo_ID integer  NOT NULL,
    CONSTRAINT Stolowka_pk PRIMARY KEY (ID_Stolowki)
) ;

-- Table: cela
CREATE TABLE cela (
    ID_Celi integer  NOT NULL,
    ilosc_miejsc varchar(5)  NOT NULL,
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
    Osoba_pesel varchar(20)  NOT NULL,
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

 INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (91052623456, 'Piotr', 'Czarnecki');
 INSERT INTO Osoba (pesel, imie, nazwisko) VALUES (86030156789, 'Marcin', 'Włodarczyk');
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
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (52, '2001-06-15' , '2003-06-30', 67082612345);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (53, '2002-06-15' , '2019-04-21', 95090123456);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (54, '2003-06-15' , '2018-12-06', 81060456789);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (55, '2013-06-15' , '2015-03-12', 70071234567);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (56, '2020-06-15' , '2028-06-17', 93031278901);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (57, '2020-06-15' , '2026-06-15', 88060823456);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (58, '2020-06-15' , '2029-09-13', 75081956789);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (59, '2020-06-15' , '2021-05-15', 96031134567);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (60, '2020-06-15' , '2028-04-14', 79040278901);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (61, '2020-06-15' , '2025-02-13', 79040278901);
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel) values (62, '2020-06-15' , '2031-01-25', 81240278901);


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

--Procedura doda najpierw nowa osobe a potem przypisze ja do przestępcy i wyda wyrok
CREATE PROCEDURE DodajNowegoWieznia
    @V_pesel VARCHAR(20),
    @V_imie VARCHAR(50),
    @V_nazwisko VARCHAR(50),
    @v_dataWyjscia DATE
AS
BEGIN
    DECLARE @v_Czyjużjest INT;
    DECLARE @v_Idwieznia INT;

    SELECT @v_Czyjużjest = COUNT(*)
    FROM Osoba
    WHERE pesel = @V_pesel;

    SELECT @v_Idwieznia = ISNULL(MAX(ID) + 1, 1)
    FROM przestepca;

    IF @v_Czyjużjest > 0
    BEGIN
        PRINT 'Osoba o takim preselu juz istnieje prosze poddać inny';
    END
    ELSE
    BEGIN
        INSERT INTO Osoba (pesel, imie, nazwisko)
        VALUES (@V_pesel, @V_imie, @V_nazwisko);

        PRINT 'Nowa osoba zostala dodana';

        INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel)
        VALUES (@v_Idwieznia, GETDATE(), @v_dataWyjscia, @V_pesel);

        PRINT 'Osoba została skazana';
    END
END;
--WYWOŁANIE PROCEDURY POWYŻEJ DZIAŁA
exec DodajNowegoWieznia 12345678901, 'Jan', 'Kowalski', '2025-01-01';
--POKAZUJE NAM AKTUALNIE NAJDŁÓŻSZY WYROK OSADZONEJ OSOBY
CREATE PROCEDURE Najdłuższywyrok
AS
BEGIN
    DECLARE @v_wyrok INT;
    SELECT TOP 1 @v_wyrok = DATEDIFF(MONTH, data_rozpoczeciawyroku, data_wyjscia)
    FROM przestepca
    WHERE data_wyjscia > GETDATE()
    ORDER BY DATEDIFF(MONTH, data_rozpoczeciawyroku, data_wyjscia) DESC;

    PRINT 'Najdłuższy aktualnie odbywany wyrok: ' + CAST(@v_wyrok AS NVARCHAR(10));
END;
exec Najdłuższywyrok
--MUSIMY DODAĆ ID DOZORCY JAK I SKRZYŁA A TA PROCEDURA PRZYPISZE GO DO DANEGO SKRZYŁA JAKO OSOBE TAM PRACUJACĄ
CREATE PROCEDURE PrzypiszDozorceDoSkrzydla
    @v_ID_doz INT,
    @v_Skrzydlo_ID INT
AS
BEGIN
    DECLARE @v_liczba INT;
    SELECT @v_liczba = COUNT(*)
    FROM Ilosc_dozorcow
    WHERE Dozorca_ID_doz = @v_ID_doz AND Skrzydlo_ID = @v_Skrzydlo_ID;
    IF @v_liczba = 0
    BEGIN
        INSERT INTO Ilosc_dozorcow (Dozorca_ID_doz, Skrzydlo_ID)
        VALUES (@v_ID_doz, @v_Skrzydlo_ID);
        PRINT 'Dozorca o ID ' + CAST(@v_ID_doz AS NVARCHAR(10)) + ' został przypisany do skrzydła ' + CAST(@v_Skrzydlo_ID AS NVARCHAR(10)) + '.';
    END
    ELSE
    BEGIN
        PRINT 'Dozorca o ID ' + CAST(@v_ID_doz AS NVARCHAR(10)) + ' już pracuje w skrzydle ' + CAST(@v_Skrzydlo_ID AS NVARCHAR(10)) + '.';
    END
END;

exec PrzypiszDozorceDoSkrzydla 21, 1;

--Wyzwalacz nie pozwala na zmainy w tabeli przestęcy w kolumnach id, data_rozpoczeciwyroku, Osoba_pesel oraz nie powzoli nam na dodanie wyroku na minusie
CREATE TRIGGER wyzwalacz1
ON przestepca
FOR UPDATE
AS
BEGIN
    DECLARE @data_wyjscia DATE;
    DECLARE @data_rozpoczeciawyroku DATE;
    SELECT @data_wyjscia = data_wyjscia FROM INSERTED;
    SELECT @data_rozpoczeciawyroku = data_rozpoczeciawyroku FROM INSERTED;
    IF UPDATE(ID) OR UPDATE(data_rozpoczeciawyroku) OR UPDATE(Osoba_pesel)
    BEGIN
        raiserror ('Można aktualizować tylko datę zakończenia wyroku', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    IF @data_wyjscia < @data_rozpoczeciawyroku
    BEGIN
        raiserror ('Data zakończenia wyroku nie może być mniejsza od daty rozpoczęcia', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;

--test1 działa
UPDATE przestepca
SET data_wyjscia = getdate()
WHERE  id = 61;

--test2 działa(error 1)
UPDATE przestepca
SET data_rozpoczeciawyroku = getdate()
WHERE  id = 64;

--test3 działa(wywołuje error 2)
UPDATE przestepca
SET data_wyjscia = '2020-06-15'
WHERE  id = 63;

--NIEPOZWOLI NA DODANIE NOWEGO WYROKU KTORY BEDZIE TRWAŁ MNIEJ NIZ 3 MIESIACE
CREATE TRIGGER wyzwalacz2
ON przestepca
AFTER INSERT
AS
BEGIN
    DECLARE @v_dlugoscwyroku INT;
    SELECT @v_dlugoscwyroku = DATEDIFF(MONTH, i.data_rozpoczeciawyroku, i.data_wyjscia)
    FROM INSERTED i;
    IF @v_dlugoscwyroku < 3
    BEGIN
        raiserror ('Minimalny wyrok musi trwać co najmniej 3 miesiące', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
--DZIAŁA JESLI CHCE SIE SPRAWDZIĆ NA WŁASNA RĘKE PROSZE DODAĆ JEDNA Z OSOB WYKREŚLONYCH KOMENTARZEM NASTĘPNIE ZAMIENIĆ NA JEGO PESEL PONIŻEJ
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel)
VALUES (64, '2023-01-01', '2023-03-01', 91052623456 );
--DZIAŁA WYWOŁUJE ERROR
INSERT INTO przestepca (ID, data_rozpoczeciawyroku, data_wyjscia, Osoba_pesel)
VALUES (65, '2023-01-01', '2023-02-01', 86030156789 );

--DAJE NAM INFORMACJE ILE KTO MIESIECY SPEDZIL W WIEZIENIU Z UWZGLEDNIENIEM TEGO CZY KTOS JEST JUZ PO CZY W TRAKIE WYROKU
CREATE PROCEDURE WyrokInfo
AS
BEGIN
    DECLARE @v_ID INT;
    DECLARE @v_data_rozpoczeciawyroku DATE;
    DECLARE @v_data_wyjscia DATE;
    DECLARE @v_dlugosc_wyroku INT;
    DECLARE c_przestepcy CURSOR FOR
        SELECT ID, data_rozpoczeciawyroku, data_wyjscia
        FROM przestepca;
    OPEN c_przestepcy;
    FETCH NEXT FROM c_przestepcy INTO @v_ID, @v_data_rozpoczeciawyroku, @v_data_wyjscia;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @v_data_wyjscia < GETDATE()
        BEGIN
            SET @v_dlugosc_wyroku = DATEDIFF(MONTH, @v_data_rozpoczeciawyroku, @v_data_wyjscia);
            PRINT 'Przestępca o ID ' + CAST(@v_ID AS NVARCHAR(10)) + ' miał wyrok trwający ' + CAST(@v_dlugosc_wyroku AS NVARCHAR(10)) + ' miesięcy.';
        END
        ELSE
        BEGIN
            SET @v_dlugosc_wyroku = DATEDIFF(MONTH, @v_data_rozpoczeciawyroku, @v_data_wyjscia);
            PRINT 'Przestępca o ID ' + CAST(@v_ID AS NVARCHAR(10)) + ' ma wyrok trwający ' + CAST(@v_dlugosc_wyroku AS NVARCHAR(10)) + ' miesięcy.';
        END;
        FETCH NEXT FROM c_przestepcy INTO @v_ID, @v_data_rozpoczeciawyroku, @v_data_wyjscia;
    END;

    CLOSE c_przestepcy;
    DEALLOCATE c_przestepcy;
END;

EXEC WyrokInfo