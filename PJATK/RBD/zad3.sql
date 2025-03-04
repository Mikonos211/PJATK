-- 1. Oblicz średni zarobek w firmie.
select avg(SAL) from emp;
-- 2. Znajdź minimalne zarobki na stanowisku CLERK.
select min(sal) from emp where job ='CLERK';
-- 3. Znajdź ilu pracowników zatrudniono w departamencie 20.
select count(*) from emp where DEPTNO = 20;
-- 4. Obliczśrednie zarobki na każdym ze stanowisk pracy.
select avg(sal) as zarobki, emp.DEPTNO from emp
group by emp.DEPTNO;
-- 5. Obliczśrednie zarobki na każdym ze stanowisk pracy z wyjątkiem stanowiska MANAGER.
select avg(sal) as zarobki , emp.job
from EMP
where job != 'MANAGER'
group by emp.job;
-- 6. Oblicz średnie zarobki na każdym ze stanowisk pracy w każdym departamencie.
select avg(SAL) as zarobki, job , DEPTNO
from EMP
group by job, DEPTNO;
-- 7. Dla każdego stanowiska oblicz maksymalne zarobki.
select max(sal), job from emp group by job ;
-- 8. Wybierz średnie zarobki tylko tych departamentów, które zatrudniają więcej niż trzech pracowników.
select avg(SAL), DEPTNO
from EMP
group by DEPTNO
having count(*) > 3;
-- 9. Wybierz tylko te stanowiska, na których średni zarobek wynosi 3000 lub więcej.
select avg(sal), JOB
from EMP
group by JOB
having avg(sal) > 3000;
-- 10. Znajdź średnie miesięczne pensje oraz średnie roczne zarobki dla każdego stanowiska, pamiętaj o prowizji.
select avg(sal), avg(SAL * 12 + nvl(COMM, 0)), job from emp
group by EMP.JOB;
-- 11. Znajdź różnicę miedzy najwyższą i najniższa pensją.
select max(sal) - min(sal)
from EMP;
-- 12. Znajdź departamenty zatrudniające powyżej trzech pracowników.
select count(DEPTNO)from EMP
group by DEPTNO
having count(DEPTNO) > 3;
-- 13. Sprawdź, czy wszystkie numery pracowników są rzeczywiście wzajemnie różne.
select EMPNO
from EMP
group by EMPNO
having count(*) > 1;
-- 14. Podaj najniższe pensje wypłacane podwładnym swoich kierowników. Wyeliminuj grupy o minimalnych zarobkach niższych niż 1000. Uporządkuj według pensji
select mgr, min(SAL)
from EMP
group by MGR
having min(SAL) >= 1000
order by min(SAL) ;
-- 15. Wypisz ilu pracowników ma dział mający siedzibę w DALLAS.
select count(*), loc from EMP
join DEPT on emp.DEPTNO = DEPT.DEPTNO
where loc = 'DALLAS'
group by loc;
-- 16. Podaj maksymalne zarobki dla każdej klasy zarobkowej.
select max(sal), GRADE
from EMP
join SALGRADE on sal between LOSAL and HISAL
group by GRADE;
-- 17. Sprawdź, które wartości zarobków powtarzają się.
select SAL, count(*)
from EMP
group by SAL
having count(* ) > 1;
-- 18. Podaj średni zarobek pracowników z drugiej klasy zarobkowej.
select avg(sal)
from EMP
join SALGRADE on SAL between LOSAL and HISAL
where GRADE = 2;
-- 19. Sprawdź ilu podwładnych ma każdy kierownik.
select mgr , count(*) from EMP group by mgr;
-- 20. Podaj sumę, którą zarabiają razem wszyscy pracownicy z pierwszej klasy zarobkowej.
SELECT SUM(sal) FROM emp, salgrade WHERE sal BETWEEN losal AND hisal AND grade = 1;