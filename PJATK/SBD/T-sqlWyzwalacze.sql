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
