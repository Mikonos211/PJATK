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

/*
	Zadanie 6:
Utwórz wyzwalacz AFTER, który po wstawieniu nowego pracownika w tabeli T_Pracownik
automatycznie przypisze mu szefa (o id= 2) jeśli nie podamy tej wartości w instrukcji
INSERT. Wykorzystaj w tym celu tabelę Inserted.
Uwaga: W tym zadaniu używamy wyzwalacza jedynie w celach treningowych, ponieważ
taką funkcjonalność najlepiej byłoby zrealizować zakładając ograniczenie DEFAULT na
kolumnę „Szef” w następujący sposób:
*/
select *
from T_pracownik
SELECT id, pensja, szef FROM T_Pracownik WHERE id = 10;

alter Trigger Zad6
on T_Pracownik
After insert
as 
begin
declare @szef int, @id int
select @id= id, @szef = Szef  from inserted
if @szef is null
begin 
	update T_Pracownik
	set Szef = 2
	where Id = @id
end	
end

INSERT INTO T_Pracownik(id, pensja) VALUES (10, 5555);
DELETE FROM T_Pracownik WHERE id = 9;


/*
	Zadanie 7:
Utwórz wyzwalacz, który przy wstawianiu lub modyfikowaniu danych w tabeli T_Pracownik
sprawdzi czy nowe zarobki (wstawiane lub modyfikowane) są mniejsze niż 10 000. Jeśli
warunek nie zostanie spełniony wyzwalacz powinien zgłosić błąd poprzez raiserror i nie
dopuścić do wstawienia rekordu.

Uwaga: W tym zadaniu używamy wyzwalacza jedynie w celach treningowych, ponieważ
taką funkcjonalność najlepiej byłoby zrealizować poprzez założenie więzów spójności typu
CHECK na kolumnę pensja w następujący sposób:
*/

select *
from T_pracownik

Create trigger Zad7
on T_pracownik
instead of insert, update
as
begin
declare @zarobki money
select  @zarobki = pensja from inserted

if @zarobki >= 10000
begin
	raiserror('nie spelnia warunku zarobkow', 16,1)
	rollback
end
end
	
/*
	Zadanie 8:
Napisz wyzwalacz FOR UPDATE dla tabeli T_Zatrudnienie, który nie pozwoli na
modyfikowanie wartości żadnej z kolumn z wyjątkiem kolumny Do. Dodatkowo kolumnę Do
można modyfikować tylko wtedy gdy jej wartość jest NULLem i nie może mieć przypisanej
daty Do wcześniejszej niż data Od
*/
select *
from T_zatrudnienie

create Trigger zad8
on T_Zatrudnienie
for update 
as
begin
IF Update(pracownik) OR Update(stanowisko) OR UPDATE(od)
begin 
raiserror('nie wolno edytowac kolumn pracownik stanowisko i od', 16, 1)
rollback
end
else if (select do from deleted) is null
begin 
	raiserror('w tym wierszu od jest null wiec lipa', 16, 1)
	rollback
end
else if exists (select 1 from inserted where do < od)
BEGIN
RAISERROR('Data "Do" nie może być wcześniejsza niż data "Od"',16,1);
ROLLBACK;
END;
end

/*
	Zadanie 9:
Napisz wyzwalacz FOR INSERT dla tabeli T_Zatrudnienie, który:
• Nie pozwoli na ręczne przypisywanie wartości dla kolumny Do (czyli przy dodawaniu
rekordu wartość Do powinna zostać pominięta)
• Nie pozwoli na przypisanie pracownika na stanowisko na którym jest już aktualnie
zatrudniony (czyli ma NULL w kolumnie Do dla tego samego stanowiska)
• Nie pozwoli na przypisanie daty Od, która jest wcześniejsza niż jakakolwiek inna
data Od lub Do dla danego pracownika
• Wypisze pracownika ze starego stanowiska kiedy przypisujemy mu nowe (czyli
zmieni Do dla starego stanowiska na datę przypisania nowego stanowiska)
*/
select *
from T_Zatrudnienie
where Pracownik = 4 and Stanowisko = 2

create trigger Zad9
on T_Zatrudnienie
for insert
as
begin
declare @pracownik int , @stanowsko int, @od date, @do date
select @pracownik = pracownik, @stanowsko = stanowisko, @od = od, @do = do
from inserted;

if @do is not null
begin 
	raiserror('do powinno byc null podczas dodawania' 16, 1)
	rollback
end

if @stanowsko in (select stanowisko from T_Zatrudnienie  WHERE pracownik = @Pracownik 
      AND Od <> @Od 
      AND Do IS NULL)
begin
	RAISERROR('Pracownik jest już aktualnie zatrudniony na dane stanowisko, rekord
	nie został dodany',16,1);
	rollback
end
else if @do < any (SELECT IIF(Do IS NULL, Od, Do) FROM T_Zatrudnienie WHERE
pracownik = @pracownik)
BEGIN
RAISERROR('Data "Od" nie może być wcześniejsza niż inne daty "Od" i "Do" danego
pracownika, rekord nie został dodany',16,1);
ROLLBACK;
END;
ELSE
UPDATE T_Zatrudnienie
SET Do = @Od
WHERE pracownik = @pracownik AND stanowisko <> @stanowsko AND Do IS NULL;
END;
