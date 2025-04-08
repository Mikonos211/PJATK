
/*
	Zadanie 1:
Napisz prosty program w Transact-SQL. Zadeklaruj zmienn�, przypisz na t� zmienn� liczb� 
rekord�w z tabeli T_Osoba i wypisz uzyskany wynik u�ywaj�c instrukcji PRINT, w postaci 
napisu np. "W tabeli jest 6 os�b"
*/
Declare @ile int = (Select COUNT(*) from T_Osoba);
print 'W tabeli jest ' + Cast(@ile as varchar) + ' os�b';

/* 
	Zadanie 2:
Policz liczb� os�b z tabeli T_Osoba. Je�li liczba jest mniejsza ni� 7, wstaw nowego 
cz�owieka �Thomas Theramenes� i wypisz komunikat o jego dodaniu. W przeciwnym 
wypadku wypisz komunikat informuj�cy o tym, �e nie wstawiono danych. Niech Id nowego
cz�owieka przyjmie warto�� najwi�kszego istniej�cego id + 1 z tej tabeli.
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
Napisz procedur� �ProduktyTanszeNiz�, kt�ra zwr�ci poprzez ResultSet nazwy i ceny 
wszystkich produkt�w z cen� mniejsz� od warto�ci podanej w parametrze.
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
Napisz procedur� �AktualizacjaCeny�, kt�ra b�dzie zwi�ksza� cen� wszystkich produkt�w o 
warto�� podan� w parametrze. Je�li warto�� nie zostanie podana to domy�lnie zwi�kszamy 
cen� o 0.01 (korzystaj�c z parametru DEFAULT). Dodatkowo wypisz komunikat z informacj� 
o liczbie zmodyfikowanych rekord�w �Ilo�� zaktualizowanych rekord�w:� u�ywaj�c do tego 
zmiennej systemowej @@ROWCOUNT. W procedurze wy��cz komunikat o liczbie wierszy, kt�re 
bra�y udzia� w operacji (SET NOCOUNT ON).

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
