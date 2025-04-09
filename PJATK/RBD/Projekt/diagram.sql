-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-06-15 19:34:01.874

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

