use [2019SBD]
/*
	Zadanie 1:
Przy pomocy kursora przejrzyj wszystkie produkty (tabela T_Produkt) i zmodyfikuj ceny tak,
aby produkty dro¿sze ni¿ $2 stania³y o 10%, a produkty tañsze ni¿ $1 podro¿a³y o 5%. Dla
ka¿dego zmienionego rekordu wypisz informacjê: „Cena {nazwa_produktu} zosta³a zmieniona
na: {nowa_cena}$”. Wykorzystaj pêtlê WHILE i zmienn¹ systemow¹ @@Fetch_status. Cenê
zaokr¹glij do 2 miejsc po przecinku.
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
	print 'Cena ' + @nazwa + 'zosta³a zmieniona o ' + cast(@cena as varchar)

	fetch next from test into @cena, @nazwa;
end	
close test
Deallocate test
