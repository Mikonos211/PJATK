
/*
	Zadanie 1:
Napisz prosty program w Transact-SQL. Zadeklaruj zmienn¹, przypisz na t¹ zmienn¹ liczbê 
rekordów z tabeli T_Osoba i wypisz uzyskany wynik u¿ywaj¹c instrukcji PRINT, w postaci 
napisu np. "W tabeli jest 6 osób"
*/
Declare @ile int = (Select COUNT(*) from T_Osoba);
print 'W tabeli jest ' + Cast(@ile as varchar) + ' osób';

/* 
	Zadanie 2:
Policz liczbê osób z tabeli T_Osoba. Jeœli liczba jest mniejsza ni¿ 7, wstaw nowego 
cz³owieka “Thomas Theramenes” i wypisz komunikat o jego dodaniu. W przeciwnym 
wypadku wypisz komunikat informuj¹cy o tym, ¿e nie wstawiono danych. Niech Id nowego
cz³owieka przyjmie wartoœæ najwiêkszego istniej¹cego id + 1 z tej tabeli.
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
Napisz procedurê „ProduktyTanszeNiz”, która zwróci poprzez ResultSet nazwy i ceny 
wszystkich produktów z cen¹ mniejsz¹ od wartoœci podanej w parametrze.
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
Napisz procedurê „AktualizacjaCeny”, która bêdzie zwiêkszaæ cenê wszystkich produktów o 
wartoœæ podan¹ w parametrze. Jeœli wartoœæ nie zostanie podana to domyœlnie zwiêkszamy 
cenê o 0.01 (korzystaj¹c z parametru DEFAULT). Dodatkowo wypisz komunikat z informacj¹ 
o liczbie zmodyfikowanych rekordów „Iloœæ zaktualizowanych rekordów:” u¿ywaj¹c do tego 
zmiennej systemowej @@ROWCOUNT. W procedurze wy³¹cz komunikat o liczbie wierszy, które 
bra³y udzia³ w operacji (SET NOCOUNT ON).

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
