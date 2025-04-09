use [2019SBD]
/*
	Zadanie 1:
Przy pomocy kursora przejrzyj wszystkie produkty (tabela T_Produkt) i zmodyfikuj ceny tak,
aby produkty droższe niż $2 staniały o 10%, a produkty tańsze niż $1 podrożały o 5%. Dla
każdego zmienionego rekordu wypisz informację: „Cena {nazwa_produktu} została zmieniona
na: {nowa_cena}$”. Wykorzystaj pętlę WHILE i zmienną systemową @@Fetch_status. Cenę
zaokrąglij do 2 miejsc po przecinku.
*/
set Nocount on
declare test cursor for 
Select Cena, Nazwa from T_Produkt
declare @cena money, @nazwa varchar(30)

open test;

fetch next from test into @cena, @nazwa;
while @@FETCH_STATUS = 0
begin
	if @cena > 2 
		set @cena += ROUND(@cena * 0.05, 2)
	else 
		set @cena += ROUND(@cena * 0.1, 2)
	update T_Produkt
	set cena = @cena
	where nazwa = @nazwa
	print 'Cena ' + @nazwa + 'została zmieniona o ' + cast(@cena as varchar)

	fetch next from test into @cena, @nazwa;
end	
close test
Deallocate test
	
/*
	Zadanie 2:
Przerób kod z zadania 1 na procedurę wykorzystującą kursor tak, aby wartości cen
produktów do obniżki i podwyżki nie były stałe, tylko były parametrami procedury. Nie
korzystaj z IF-a, zamiast tego użyj CASE.
*/

alter procedure ZmianyCen 
	@WartoscDolna money, 
	@WartoscGorna money
as 
begin
declare Kursor cursor for
select nazwa, 
		case 
		when cena < @WartoscDolna then ROUND(cena + (cena + 0.05), 2)
		when cena > @WartoscGorna then ROUND(cena + (cena + 0.1), 2)
		else cena
		end
from T_Produkt where cena not between @WartoscDolna and @WartoscGorna
DECLARE @Nazwa Varchar(30), @Cena money;
open Kursor;

FETCH NEXT FROM Kursor INTO @Nazwa, @Cena;
while @@FETCH_STATUS = 0
begin	
update T_Produkt
set Cena = @cena
where Nazwa =@nazwa

PRINT('Cena ' + @Nazwa + ' została zmieniona na: ' + CAST(@Cena AS Varchar(5)) + '$.')
FETCH NEXT FROM Kursor INTO @Nazwa, @Cena;
end
CLOSE Kursor;
DEALLOCATE Kursor;
END;

EXEC ZmianyCen 1, 2;
