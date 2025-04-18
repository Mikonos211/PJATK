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

/*
	Zadanie 3 a:
Utwórz nowe zlecenie zaopatrzenia sklepu (tabela T_Zaopatrzenie) z dzisiejszą datą.
Następnie, korzystając z kursora, przypisz do tego zlecenia wszystkie produkty, które
sprzedały się w więcej niż 10 sztukach w grudniu 2022. W T_ZaopatrzenieProdukt jako ilość
podaj dwukrotność sprzedanej ilości sztuk danego produktu z grudnia 2022. Po dodaniu
każdego produktu wypisz informację: „Zamówiono produkt o ID= {id} w ilości= {ilość}”.
*/
insert into T_Zaopatrzenie ("data") values (GETDATE())

select * 
from T_ZaopatrzenieProdukt;

select *
from T_Produkt
join T_ListaProduktow on T_Produkt.Id = T_ListaProduktow.Produkt
join T_Zakup on T_Zakup.Id = T_ListaProduktow.Zakup

Select * 
from T_Produkt
join T_ZaopatrzenieProdukt on T_Produkt.Id = T_ZaopatrzenieProdukt.produkt
join T_Zaopatrzenie on T_Zaopatrzenie.id = T_ZaopatrzenieProdukt.Zaopatrzenie

DECLARE Zad3 CURSOR FOR
SELECT Produkt, ilosc, "data"
FROM T_ListaProduktow
JOIN T_Zakup ON T_ListaProduktow.Zakup = T_Zakup.Id
where  ilosc >= 10 AND MONTH(data) = 12 AND YEAR(data) = 2022

DECLARE @produkt INT, @ilosc INT, @data DATE, @idZaop INT, @iloscZamowienia INT;

OPEN Zad3;

FETCH NEXT FROM Zad3 INTO @produkt, @ilosc, @data;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @ilosc >= 10 AND MONTH(@data) = 12 AND YEAR(@data) = 2022
    BEGIN
        SET @idZaop = (SELECT max(id) FROM T_Zaopatrzenie);
        SET @iloscZamowienia = @ilosc * 2;

        INSERT INTO T_ZaopatrzenieProdukt (Zaopatrzenie, Produkt, Ilosc)
        VALUES (@idZaop, @produkt, @iloscZamowienia);

        PRINT 'Zamówiono produkt o ID=' + CAST(@produkt AS VARCHAR(10)) + ' w ilości=' + CAST(@iloscZamowienia AS VARCHAR(10));
    END

    FETCH NEXT FROM Zad3 INTO @produkt, @ilosc, @data;
END

CLOSE Zad3;
DEALLOCATE Zad3;

/*
	Zadanie 3 b:
Nie korzystaj z IF-a.
Najpierw należy utworzyć nowy rekord w tabeli T_Zaopatrzenie i przechwycić id używając
zmiennej systemowej @@Identity (PK ma właściwość Identity). Następnie przy użyciu
kursora należy wstawić do tabeli T_ZaopatrzenieProdukt rekordy dla produktów, które nas
interesują.
*/
set nocount on 
Declare zaopatrzenie cursor for
select produkt, SUM(ilosc) as ilosc
from  T_ListaProduktow 
join T_Zakup on T_ListaProduktow.Zakup = T_Zakup.id
where  MONTH("data") = 12 AND YEAR("data") = 2022 
group by Produkt
having sum(ilosc) > 10;

insert into T_Zaopatrzenie ("data" ) values (GETDATE())
declare @prod int, @ile int, @idZaopatrzenia int = @@Identity

open zaopatrzenie;
fetch next from zaopatrzenie into @prod, @ile
while @@FETCH_STATUS = 0
begin
	insert into T_ZaopatrzenieProdukt (Zaopatrzenie, Produkt, Ilosc)
	values (@idZaopatrzenia, @prod, @ile*2)
	print 'Zamówiono produkt o ID = ' + cast(@idZaopatrzenia as varchar) +
	' w ilosci =' + cast(@ile as varchar)

fetch next from zaopatrzenie into @prod, @ile
end
close zaopatrzenie;
deallocate zaopatrzenie;

/*
	Zadanie 4
Dodaj kolumnę „Bonus” typu money z opcją NULL do tabeli T_Pracownik. Następnie,
korzystając z kursora, przypisz wartość bonusu każdemu aktualnie zatrudnionemu
pracownikowi. Bonus jest wyliczany na podstawie stażu w miesiącach i wynosi: pensja *
ilość_miesięcy/100. Jest on przyznawany tylko osobom, które pracowały co najmniej 6
miesięcy i nie może wynieść więcej niż 30% pensji. Stwórz perspektywę przechowującą
id_pracownika i jego staż w miesiącach, która będzie wykorzystywana przez kursor. Po
dodaniu bonusu wypisz informację: „Pracownik od id= {id} ma przypisany bonus w
wysokości= {bonus} % pensji”.
*/

alter table T_pracownik
add bonus money null

insert into T_Pracownik (Id,Pensja, Szef, bonus)
values (8,5000, null, null)
insert into T_Zatrudnienie(Pracownik, Stanowisko, od, Do)
values (8, 1, '2025-01-01', null)
select *
from T_Pracownik;

select *
from T_Pracownik
join T_Zatrudnienie on T_Pracownik.id = T_Zatrudnienie.Pracownik



select *
from T_Zatrudnienie

--Wersja bez Widoku
declare WyliczBonus cursor for
select Pracownik,  DATEDIFF(MONTH, MIN(Od), GETDATE())
from T_Pracownik
join T_Zatrudnienie on T_Pracownik.id = T_Zatrudnienie.Pracownik
where do is null
GROUP BY  Pracownik

declare @idPracownika int ,@dlugoscStarzu int, @wysokoscBonusu money

open WyliczBonus;

fetch next from WyliczBonus into @idPracownika, @dlugoscStarzu

while @@FETCH_STATUS = 0
begin
	if @dlugoscStarzu < 6
	begin 
		print 'Za krotki starz na procentowy bonus'
	end
	else
	begin
		set @wysokoscBonusu = (select pensja from T_Pracownik where id = @idPracownika) *  (CAST(@dlugoscStarzu AS decimal(5,2)) /100) 
		if @wysokoscBonusu >  (select pensja from T_Pracownik where id = @idPracownika) * 0.3
			begin
			set @wysokoscBonusu = (select pensja from T_Pracownik where id = @idPracownika) * 0.3
			end	
		UPDATE T_Pracownik
		SET bonus = @wysokoscBonusu
		where id = @idPracownika;
	end
	fetch next from WyliczBonus into @idPracownika, @dlugoscStarzu
end
close WyliczBonus
deallocate WyliczBonus


--wersja z widokiem
CREATE VIEW StazPracownikow(Pracownik, Staz) 
as
select Pracownik,  DATEDIFF(MONTH, MIN(Od), GETDATE()) 
from T_Pracownik
join T_Zatrudnienie on T_Pracownik.id = T_Zatrudnienie.Pracownik
where do is null
GROUP BY  Pracownik
 
declare BonusDlaPracownika cursor for
select Pracownik, 
	case 
		when Staz < 5 then null
		when Staz > 30 then 30
		else Staz
	end as bonus
	from StazPracownikow

declare @idPracownika2 int ,  @wysokoscBonusu2 money

open BonusDlaPracownika;

fetch next from BonusDlaPracownika into @idPracownika2, @wysokoscBonusu2;
while @@FETCH_STATUS = 0
	begin
		update T_Pracownik
		set bonus = ROUND(pensja * @wysokoscBonusu2/100, 2)
		where Id = @idPracownika2
	fetch next from BonusDlaPracownika into @idPracownika2, @wysokoscBonusu2;
	end
close BonusDlaPracownika;
deallocate BonusDlaPracownika;

/*
	Zadanie 5:
Dodaj kolumnę „Ulubiony_produkt” typu int z opcją NULL do tabeli T_Osoba. Następnie,
korzystając z kursora, jako wartość ulubionego produktu przypisz produkt, który dana osoba
kupiła w największej ilości we wszystkich zakupach. Po dodaniu produktu wypisz informację:
„Dodano ulubiony produkt o id= {id} dla osoby o id= {id}”.

*/
select *
from T_Osoba;


declare dodajulubiony_produkt cursor for
SELECT 
    T_Osoba.Id, 
    T_Osoba.Imie, 
    SUM(T_ListaProduktow.Ilosc) AS Ilosc, 
    T_Produkt.Id AS ProduktId
FROM 
    T_Osoba
JOIN T_Zakup ON T_Osoba.Id = T_Zakup.Klient
JOIN T_ListaProduktow ON T_Zakup.Id = T_ListaProduktow.Zakup
JOIN T_Produkt ON T_Produkt.Id = T_ListaProduktow.Produkt
WHERE 
    T_Produkt.Id = (
        SELECT TOP(1) T_ListaProduktow.Produkt 
        FROM T_Zakup 
        JOIN T_ListaProduktow ON T_Zakup.Id = T_ListaProduktow.Zakup
        WHERE T_Zakup.Klient = T_Osoba.Id
        GROUP BY T_ListaProduktow.Produkt
        ORDER BY SUM(T_ListaProduktow.Ilosc) DESC
    )
GROUP BY 
    T_Osoba.Id, T_Osoba.Imie, T_Produkt.Id;

set nocount on
declare @OsobaID int, @imieOsoba varchar(50), @IloscPro int, @ProduktID int;
open dodajulubiony_produkt
Fetch next from dodajulubiony_produkt into  @OsobaID , @imieOsoba , @IloscPro , @ProduktID ;
WHILE @@Fetch_status = 0
begin
update T_Osoba
set Ulubiony_produkt = @ProduktID
where id = @OsobaID
PRINT('Dodano ulubiony produkt o id= ' + CAST(@ProduktID AS Varchar(5)) + '
dla osoby o id= ' + CAST(@OsobaID AS Varchar(5)));
Fetch next from dodajulubiony_produkt into  @OsobaID , @imieOsoba , @IloscPro , @ProduktID ;
end;
close dodajulubiony_produkt;
DEALLOCATE dodajulubiony_produkt; 

