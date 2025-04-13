use [2019SBD]
  
/*
	Zadanie 1:
Napisz prosty wyzwalacz INSTEAD OF DELETE, który nie pozwoli nam na usunięcie
rekordów z tabeli T_ListaProduktow. Wypisz błąd „Nie można usuwać rekordów z tabeli 
T_ListaProduktow” poprzez raiserror.
  
*/
DELETE FROM T_ListaProduktow
WHERE zakup = 55 AND produkt = 10;

Create Trigger mytriger
on T_ListaProduktow
instead of delete 
as 
RAISERROR('Nie mo¿na usuwaæ rekordów z tabeli T_listaproduktow',16,1)

DELETE FROM T_ListaProduktow
WHERE zakup = 55 AND produkt = 5;

/*
	Zadanie 2:
Przekształć wyzwalacz z zadania 1 tak, aby dodatkowo wypisywał informację: „Usuwanie
rekordu dla zakupu= {IdZakupu} i produktu= {IdProduktu} nie powiodło się”. Wykorzystaj w
tym celu tabelę Deleted

*/

alter Trigger UzycieTabeliDeleted 
on T_listaProduktow 
instead of delete 
as
begin
Declare @idZakupu int, @idProduktu int 
select @idZakupu = Zakup, @idProduktu = Produkt
from deleted
 RAISERROR(
        'Usuwanie rekordu dla zakupu = %d i produktu = %d nie powiodło się.',
        16, 1,
        @idZakupu, @idProduktu
    );
end

select *
from T_ListaProduktow
WHERE zakup = 55 AND produkt = 5;

DELETE FROM T_ListaProduktow
WHERE zakup = 55 AND produkt = 5;

/*
	Zadanie 3:
Napisz wyzwalacz INSEAD OF INSERT dla tabeli T_Produkt, który będzie wypisywać:
„Naruszono więzy klucza głównego, rekord nie został dodany” jeśli podany klucz główny już
istnieje. W przeciwnym razie dodajemy rekord do tabeli wypisując informację: „{produkt}
został dodany”. Nie korzystaj z IF-a, zamiast tego użyj TRY CATCH.
*/
select *
from T_Produkt;

alter trigger Zad3
on T_Produkt
instead of insert
as 
begin
declare @id int, @nazwa varchar(50), @cena money, @kategoria int
SELECT @id = id, @nazwa = nazwa, @cena = cena, @kategoria = kategoria FROM Inserted; 
begin try
INSERT INTO T_Produkt(Id, Nazwa, Cena, Kategoria) VALUES (@Id, @Nazwa, @Cena,
@Kategoria);
PRINT(@Nazwa + ' został dodany')
END TRY
BEGIN CATCH
RAISERROR('Naruszono więzy klucza głównego, rekord nie został dodany', 16, 1)
END CATCH;
end

INSERT INTO T_Produkt(Id, Nazwa, Cena, Kategoria) VALUES (11, 'Cucumber', 0.25, 2)


/*
	Zadanie 5:
Przerób wyzwalacz z zad 4 na INSTEAD OF INSERT, który będzie działać tak samo.
*/

create Trigger Zad5
on T_osoba
instead of insert 
as
BEGIN
declare @ID int, @imie varchar(50) , @nazwisko varchar(50);
select @ID = id ,@imie = Imie ,@nazwisko = nazwisko from inserted;
if @nazwisko in (select nazwisko from T_osoba WHERE id <> @Id)
begin
	raiserror('takie nazwisko juz istnieje' , 16, 1);
	rollback;
end
ELSE
begin
	insert into T_Osoba (Id, Imie, Nazwisko, Ulubiony_produkt) 
	values (@ID, @imie, @nazwisko, null)
	print @nazwisko + 'zostal dodany'
end
end

INSERT INTO T_Osoba(Id, Imie, Nazwisko) VALUES (14, 'Trevor', 'pawel')
