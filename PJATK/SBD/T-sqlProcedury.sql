
/*
	Zadanie 1:
Napisz prosty program w Transact-SQL. Zadeklaruj zmienną, przypisz na tą zmienną liczbę 
rekordów z tabeli T_Osoba i wypisz uzyskany wynik używając instrukcji PRINT, w postaci 
napisu np. "W tabeli jest 6 osób"
*/
Declare @ile int = (Select COUNT(*) from T_Osoba);
print 'W tabeli jest ' + Cast(@ile as varchar) + ' osób';

/* 
	Zadanie 2:
Policz liczbę osób z tabeli T_Osoba. Jeśli liczba jest mniejsza niż 7, wstaw nowego 
człowieka “Thomas Theramenes” i wypisz komunikat o jego dodaniu. W przeciwnym 
wypadku wypisz komunikat informujący o tym, że nie wstawiono danych. Niech Id nowego
człowieka przyjmie wartość największego istniejącego id + 1 z tej tabeli.
*/

Select *
from T_Osoba;

Declare @ile2 int = (Select COUNT(*) from T_Osoba);

if @ile2 < 7 
	begin 
		insert Into T_Osoba (id, imie, nazwisko)  
		values (@ile2 +1, 'Thomas' , 'Theramenes')
		print 'dodano osobe'
	end
/* 
	Zadanie 3:
Napisz procedurę „ProduktyTanszeNiz”, która zwróci poprzez ResultSet nazwy i ceny 
wszystkich produktów z ceną mniejszą od wartości podanej w parametrze.
*/
select nazwa,cena
from T_produkt
create procedure ProduktyTanszeNiz @cena money
as	
begin 
	select nazwa,cena
	from T_produkt
	where cena < @cena
end
	
exec ProduktyTanszeNiz 1.55
/* 
	Zadanie 4:
Napisz procedurę „AktualizacjaCeny”, która będzie zwiększać cenę wszystkich produktów o 
wartość podaną w parametrze. Jeśli wartość nie zostanie podana to domyślnie zwiększamy 
cenę o 0.01 (korzystając z parametru DEFAULT). Dodatkowo wypisz komunikat z informacją 
o liczbie zmodyfikowanych rekordów „Ilość zaktualizowanych rekordów:” używając do tego 
zmiennej systemowej @@ROWCOUNT. W procedurze wyłącz komunikat o liczbie wierszy, które 
brały udział w operacji (SET NOCOUNT ON).

*/
create procedure AktualizacjaCenyprodeura @zwiekszenie money = 0.01
as 
begin 
set nocount on
update T_produkt
set cena = cena + @zwiekszenie;
print 'zaktualizowana liczba rekordow: ' + cast(@@rowcount as Varchar(10));
end

exec AktualizacjaCenyprodeura default

/* 
	Zadanie 5:
Napisz procedurę „NowyZakup”, która będzie rejestrować nowy zakup dla danego klienta z
dzisiejszą datą. Nasza procedura ma przyjmować id klienta i zwracać Id stworzonego zakupu
w parametrze OUTPUT korzystając ze zmiennej systemowej @@IDENTITY. Dodatkowo
wewnątrz procedury chcemy wypisywać informację „Zarejestrowano nowy zakup o id : [id]”.
Klucz główny „id” w tabeli T_Zakup ma właściwość IDENTITY, dlatego przy dodawaniu
rekordu nie podajemy tej wartości, bo zostanie ona automatycznie wygenerowana.

*/

select *
from T_Zakup

alter procedure NowyZaku 
	@idKlienta int,
	@idZakup int output
as 
begin
	insert into T_Zakup ("data", Klient) 
	values (GETDATE(), @idKlienta)
	set @idZakup = @@IDENTITY
	print 'zarejestrowano nowy zakup o id:' + cast(@idZakup as varchar(10))
end

declare @zakup int
exec NowyZaku 1, @zakup output;

/*
	Zadanie 6:
Kontynuując zadanie 5 napisz procedurę „DodajProduktDoZakupu”, która doda produkt do
danego zakupu. Jako parametry procedura ma przyjmować Id produktu, Ilość oraz Id
zakupu, który otrzymamy z procedury „NowyZakup” poprzez parametr OUTPUT. Należy
sprawdzić czy produkt i zakup o podanym id istnieją i czy ilość jest większa od 0, jeśli nie to
wypisujemy odpowiedni komunikat i kończymy procedurę. W przeciwnym razie dodajemy
produkt do zakupu i wypisujemy: „Do zakupu [id] dodano produkt [id], w ilości: [ilość]”.

Korzystając z tych procedur dodaj zakup dla klienta o id=3, w którym kupił produkt o id=3 w
ilości 13, oraz produkt o id=1 w ilości 6.

*/
select *
from T_ListaProduktow



alter procedure DodajProduktDoZakupu 
	@IdProduktu int,
	@ilosc int,
	@IdZakupu int output
as 
begin
	if @IdProduktu not in (select id from T_Produkt)
	print 'produkt o id' + cast(@IdProduktu as varchar(10))
	else if @ilosc <=  0 
	print 'za mała ilosc'
	else if @IdZakupu not in (select Id from T_Zakup)
	print 'zakup o id' + cast(@IdZakupu as varchar(10))
	else 
	begin
	insert into T_ListaProduktow (Zakup , Produkt, Ilosc)
	values (@IdZakupu, @IdProduktu, @ilosc)
	print 'dodano produkt'
	end
end

declare @zakup int
exec NowyZaku 3, @zakup output;	
exec DodajProduktDoZakupu 3, 0, @zakup	
/*
	Zadanie 7:
Napisz procedurę „DanePracownika”, która będzie przyjmować Id pracownika i zwracać jego
Imię i Nazwisko przy użyciu parametru OUTPUT. Jeśli pracownik o podanym Id nie istnieje
powinniśmy zwracać o tym informacje: “Pracownik o podanym id nie istnieje”. 
*/
select *
from T_Osoba
join T_Pracownik on T_Osoba.Id = T_Pracownik.id	;

alter procedure danePracownika 
	@idPracownika int, 
	@imie varchar(50) output,
	@nzawisko varchar(50) output
as 
begin
	if @idPracownika not in (Select id from T_Pracownik)
	print 'pracownik nie istnieje'
	else 
	begin
	print 'pracownik istnieje'
	select @imie = Imie, @nzawisko = Nazwisko
	from T_Osoba
	where id = @idPracownika
	print 'Jego imie to ' + @imie + ' ' + @nzawisko
	end
end

declare @Pimie varchar(50), @Pnzawisko varchar(50);
exec danePracownika 2 , @Pimie output, @Pnzawisko output

/*
	Zadanie 8:
Napisz procedurę służącą do wstawiania produktów do tabeli Produkt. Procedura będzie
pobierać jako parametry: nazwę, cenę oraz kategorię nowego produktu. Należy sprawdzić,
czy produkt o takiej nazwie już istnieje. Jeżeli istnieje, to nie wstawiamy nowego rekordu.
Należy też sprawdzić czy podana kategoria istnieje, jeśli nie to nie dodajemy rekordu i
wypisujemy komunikat: „Podana kategoria nie istnieje, produkt nie został dodany”. Niech Id
nowego produktu przyjmie wartość największego istniejącego id + 1 z tej tabeli.
*/
select *
from T_Produkt

select Nazwa from T_Kategoria
alter procedure Dodaj 
	@nazwe varchar(50),
	@cene money, 
	@kateogira varchar(50)
as
begin
	if @nazwe in (select nazwa from T_Produkt)
	print 'produkt już istnieje nie dodaje nic'
	else if @kateogira not in (select Nazwa from T_Kategoria)
	print 'kateogira nie istnieje pordukt nie zostal dodany'
	else
	begin 
	declare @newID int = (select max(id) + 1 from T_Produkt)
	insert into T_Produkt (id , nazwa, cena, kategoria)
	values (@newID, @nazwe, @cene, (Select id from T_Kategoria where Nazwa = @kateogira))
	print 'produkt został dodany'
	end
end

exec Dodaj 'dory' , 8.09, 'fish'

/*
	Zadanie 9:
Napisz procedurę która zaktualizuje stanowisko danego pracownika. Procedura ma
przypisać pracownika do nowego stanowiska z dzisiejszą datą, i jednocześnie wypisać go ze
starego stanowiska również z dzisiejszą datą (wartość “Do” w tabeli T_Zatrudnienie). Jako
argumenty procedura powinna przyjmować @Id_pracownika i @Id_stanowiska. Jeśli
pracownik jest aktualnie przypisany na podane stanowisko, to nie dodajemy go ponownie
tylko wpisujemy informacje „Pracownik jest już przypisany na to stanowisko”. Jeśli pracownik
lub stanowisko o podanym id nie istnieje wypisujemy o tym informacje i kończymy procedurę.
Stanowisko dla danego pracownika można zmieniać tylko raz dziennie, jeśli dzisiejsza data
istnieje już w kolumnie „Do” w tabeli T_Zatrudnienie dla danego pracownika, wtedy nie
aktualizujemy jego stanowiska i wypisujemy informacje: „Zmiany nie zostały zapisane,
stanowisko można aktualizować tylko raz dziennie”. W procedurze wyłącz komunikat o
liczbie wierszy, które brały udział w operacji (SET NOCOUNT ON).

*/

select *
from T_Pracownik
select *
from T_Zatrudnienie

delete from T_Zatrudnienie
where Od = '2025-04-09'

select *
from T_Stanowisko

select *
from T_Pracownik
join T_Zatrudnienie on T_Pracownik.id = T_Zatrudnienie.Pracownik
join T_Stanowisko on T_Zatrudnienie.Stanowisko = T_Stanowisko.Id;

alter procedure AktualizacjaStanowiska 
	@Id_pracownika int,
	@Id_stanowiska int
as 
begin
set nocount on
	declare @dotady date = getdate()
	declare @aktualnieStanowisko int = (select Stanowisko from T_Zatrudnienie where Pracownik = @Id_pracownika and do is null) 
	if @Id_pracownika in (select Pracownik from T_Zatrudnienie where Stanowisko = @Id_stanowiska and do is null)
	print 'pracownik obejmuje już to stanowisko'
	else if @Id_pracownika not in (select id from T_Pracownik)
	print 'pracownik o takim id nie istnieje'
	else if @Id_stanowiska not in (select id from T_Stanowisko)
	print 'takie stanowisko nie istnieje'
	else if @dotady = (select do from T_Zatrudnienie where Pracownik = @Id_pracownika)
	print 'mozna zmieniac jedynie raz dziennie'
	else
	begin 
	update T_Zatrudnienie
	set do = @dotady
	where Pracownik = @Id_pracownika and do is null
	print 'wypisano z stanowiska'
	insert into T_Zatrudnienie (Pracownik, Stanowisko, od, Do)
	values (@Id_pracownika, @Id_stanowiska, @dotady, null)
	print 'dodano nowego pracownika'
	end	
end

exec AktualizacjaStanowiska 4, 2;
