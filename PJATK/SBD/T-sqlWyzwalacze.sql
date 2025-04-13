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
