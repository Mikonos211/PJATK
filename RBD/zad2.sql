-- 1. Połącz dane z tabel EMP i DEPT przy pomocy warunku złączenia w WHERE.
select *
from Emp, DEPT
where DEPT.DEPTNO = Emp.DEPTNO;
-- 2. Połącz dane z tabel EMP i DEPT przy pomocy INNER JOIN
select *
from EMP
join DEPT on EMP.DEptno = DEPT.DEPTNO;
-- 3. Wybierz nazwiska oraz nazwy departamentów wszystkich pracowników w kolejności
-- alfabetycznej.
SELECT ENAME, Dname
from EMP
join DEPT on EMP.DEptno = DEPT.DEPTNO
order by ENAME;
-- 4. Wybierz nazwiska wszystkich pracowników wraz z numerami i nazwami departamentów
-- w których są zatrudnieni
SELECT ENAME, Dname, DEPT.DEPTNO
from EMP
join DEPT on EMP.DEptno = DEPT.DEPTNO;
-- 5. Dla pracowników o miesięcznej pensji powyżej 1500 podaj ich nazwiska, miejsca
-- usytuowania ich departamentów oraz nazwy tych departamentów.
Select ENAME,Loc, DNAME
from EMP
join DEPT on EMP.DEptno = DEPT.DEPTNO
where SAL > 1500;
-- 6. Utwórz listę pracowników podając ich nazwisko, zawód, pensję i stopień zaszeregowania.
SELECT ename, job, sal, GRADE
from EMP
join SALGRADE on SAL between LOSAL and  HISAL;
-- 7. Wybierz informacje o pracownikach, których zarobki odpowiadają klasie zarobkowej 3.
SELECT *
from EMP
join SALGRADE on SAL between LOSAL and HISAL and GRADE = 3;
-- 8. Wybierz pracowników zatrudnionych w Dallas.
SELECT *
from EMP
join DEPT on EMP.DEptno = DEPT.DEPTNO
where loc = 'DALLAS';
-- 9. Wybierz nazwiska pracowników, nazwy działów i stopnie zaszeregowania.
SELECT ENAME, DEPT.Dname, GRADE
from EMP
join DEPT on Emp.DEPTNO = DEPT.DEPTNO
join SALGRADE on sal between LOSAL and  HISAL;
-- 10. Wypisz dane wszystkich działów oraz ich pracowników tak, aby dane działu pojawiły się,
-- nawet jeśli nie ma w dziale żadnego pracownika.
Select *
from DEPT
left join EMP on EMP.DEptno = DEPT.DEPTNO;
-- 11. Wypisz dane wszystkich działów oraz ich pracowników tak, aby dane pracownika pojawiły się, nawet jeśli pracownik nie jest przypisany do działu.
Select *
from DEPT
right join EMP on EMP.DEptno = DEPT.DEPTNO;
-- 12. Wybierz pracowników (nazwisko, numer działu) z działu 30 i 20.Wypisz dział 20 bez
-- nazwisk.
SELECT ename, deptno FROM emp WHERE deptno = 30
UNION all
SELECT '', deptno FROM emp WHERE deptno = 20;
-- 13. Wypisz stanowiska występujące w dziale 10 oraz 30.
SELECT JOB
from EMP
where DEPTNO = 10
union
select JOB
from EMP
where DEPTNO = 30;
-- lub
SELECT DISTINCT job
FROM emp
WHERE deptno IN (10, 30);
-- 14. Wypisz stanowiska występujące zarówno w dziale 10 jak i 30.
select job from EMP
where DEPTNO =10
intersect
select job from emp where DEPTNO = 30;
-- 15. Wypisz stanowiska występujące w dziale 10 a nie występujące w dziale 30.
select job from emp where DEPTNO = 10
minus select job from EMP where DEPTNO = 30;
-- 16. Wybierz pracowników, którzy zarabiają mniej od swoich kierowników.
select pracownik.ENAME, pracownik.SAL
from EMP pracownik
join emp kierownik on pracownik.MGR = kierownik.EMPNO and pracownik.sal < kierownik.SAL;
-- 17. Dla każdego pracownika wypisz jego nazwisko oraz nazwisko jego szefa. Posortuj według nazwiska szefa.
select PRACOWNIK.Ename, kierownik.ename
from EMP pracownik
join EMP kierownik on pracownik.Mgr = kierownik.EMPNO
order by kierownik.EMPNO;