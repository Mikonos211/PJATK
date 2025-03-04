

CREATE TABLE EMP
       (EMPNO NUMBER(4) NOT NULL,
        ENAME VARCHAR2(10),
        JOB VARCHAR2(9),
        MGR NUMBER(4),
        HIREDATE DATE,
        SAL NUMBER(7, 2),
        COMM NUMBER(7, 2),
        DEPTNO NUMBER(2));

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        '1980-12-17',  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        TO_DATE('1981-02-20'), 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        TO_DATE('1981-02-22'), 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        TO_DATE('1981-04-02'),  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        TO_DATE('1981-09-28'), 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        TO_DATE('1981-05-01'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        TO_DATE('1981-06-09'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        TO_DATE('1982-12-09'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        TO_DATE('1981-11-17'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        TO_DATE('1981-09-08'),  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        TO_DATE('1983-01-12'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        TO_DATE('1981-12-03'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        TO_DATE('1981-12-03'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        TO_DATE('1982-01-13'), 1300, NULL, 10);

CREATE TABLE DEPT
       (DEPTNO NUMBER(2),
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE BONUS
        (ENAME VARCHAR2(10),
         JOB   VARCHAR2(9),
         SAL   NUMBER,
         COMM  NUMBER);

CREATE TABLE SALGRADE
        (GRADE NUMBER,
         LOSAL NUMBER,
         HISAL NUMBER);

INSERT INTO SALGRADE VALUES (1,  700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

CREATE TABLE DUMMY
        (DUMMY NUMBER);

INSERT INTO DUMMY VALUES (0);

COMMIT;

--1 Wybierz numery departamentów, nazwiska pracowników oraz numery pracownicze ich szefów z tabeli EMP
Select DEPTNO, EMPNO, MGR
from EMP;
--2 Wybierz wszystkie kolumny z tabeli EMP.
SELECT *
from EMP;
--3 Wylicz roczną pensję podstawową dla każdego pracownika.
SELECT sal * 12
from EMp;
--4 Wylicz roczną pensję podstawową dla każdego pracownika gdyby każdemu dać podwyżkę o 250.
select (sal+250) * 12
from EMP;
--5 Wybrane wyrażenie SAL*12 zaetykietuj nagłówkiem ROCZNA.
SELECT SAL * 12 as Roczna
from EMP;
--6 Wybrane wyrażenie SAL*12 zaetykietuj nagłówkiem R PENSJA.
SELECT SAL * 12 as "R pensja"
from EMP;
--7 Połącz EMPNO i nazwisko, opatrz je nagłówkiem EMPLOYEE.
SELECT EMPNO || Ename as EMPLOYEE
from EMP;
--8 Utwórz zapytanie zwracające wynik w postaci np. „Kowalski pracuje w dziale 20”
SELECT Ename ||' pracuje w '|| DEPTNO as EMPLOYEE
from EMP;
--9 Wylicz roczną pensję całkowitą dla każdego pracownika (z uwzględnieniem prowizji).
sELECT Ename, (sal * 12 + NVL(comm,0))
from EMP;
--10. Wyświetl wszystkie numery departamentów występujące w tabeli EMP.
SELECT deptno
FROM Emp;
--11. Wyświetl wszystkie różne numery departamentów występujące w tabeli EMP.
SELECT DISTINCT deptno
FROM Emp;
--12. Wybierz wszystkie wzajemnie różne kombinacje wartości DEPTNO i JOB.
SELECT distinct  DEPTNO, JOB
from EMP;
--13. Posortuj wszystkie dane tabeli EMP według ENAME.
SELECT *
from EMP
order by ENAME;
--14. Posortuj malejąco wszystkie dane tabeli EMP według daty ich zatrudnienia począwszy od ostatnio zatrudnionych.
SELECT *
from EMP
order by HIREDATE desc;
--15. Posortuj dane tabeli EMP według wzrastających wartości kolumn DEPTNO oraz malejących wartości kolumny SAL (bez wypisywania kolumny SAL).
SELECT *
from EMP
order by DEPTNO asc , Sal desc;
--16. Wybierz nazwiska, numery, stanowiska pracy i numery departamentów wszystkich pracowników zatrudnionych na stanowisku CLERK.
SELECT *
from EMP
where JOB = 'CLERK';
--17. Wybierz wszystkie nazwy i numery departamentów większe od nr 20.
SELECT deptno, ENAME
from EMP
where DEPTNO > 20;
--18. Wybierz pracowników, których prowizja przekracza miesięczną pensję.
SELECT *
from EMP
where SAL < COMM;
--19. Wybierz dane tych pracowników, których zarobki mieszczą się pomiędzy 1000 a 2000.
SELECT *
from EMP
where SAL between 1000 and 2000;
--20. Wybierz dane pracowników, których bezpośrednimi szefami są 7902,7566 lub 7788.
SELECT *
from EMP
where MGR IN (7902, 7566, 7788);
--21. Wybierz dane tych pracowników, których nazwiska zaczynają się na S.
SELECT *
from EMP
WHERE ename LIKE 'S%';
--22. Wybierz dane tych pracowników, których nazwiska są czteroliterowe.
SELECT *
FROM emp
WHERE LENGTH(ename) = 4;
--23. Wybierz dane tych pracowników, którzy nie posiadają szefa.
SELECT *
FROM emp
WHERE mgr IS NULL;
--24. Wybierz dane tych pracowników, których zarobki są poza przedziałem <1000,2000>.
SELECT *
FROM emp
WHERE NOT sal BETWEEN 1000 AND 2000;
--25. Wybierz dane tych pracowników, których nazwiska nie zaczynają się na M.
SELECT *
FROM emp
WHERE NOT ename LIKE 'M%';
--26. Wybierz dane tych pracowników, którzy mają szefa.
SELECT *
FROM emp
WHERE mgr IS NOT NULL;
--27. Wybierz dane tych pracowników zatrudnionych na stanowisku CLERK których zarobki SAL mieszczą się w przedziale <1000.2000).
SELECT *
FROM emp
WHERE job = 'CLERK' AND sal between 1000 and 2000;
--28 Wybierz dane pracowników zatrudnionych na stanowisku CLERK albo takich, których zarobki SAL mieszczą się w przedziale <1000.2000).
SELECT *
FROM emp
WHERE job = 'CLERK' or sal not between 1000 and 2000;
--29. Wybierz wszystkich pracowników zatrudnionych na stanowisku MANAGER z pensją powyżej 1500 oraz wszystkich pracowników na stanowisku SALESMAN, niezależnie od pensji.
SELECT *
FROM emp
where (sal > 1500 and job = 'MANAGER') or job = 'SALESMAN';
-- 30. Wybierz wszystkich pracowników zatrudnionych na stanowisku MANAGER lub na
-- stanowisku SALESMAN lecz zarabiających powyżej 1500.
SELECT *
FROM emp
WHERE job = 'MANAGER' OR (job = 'SALESMAN' AND sal >1500);
--30. Wybierz wszystkich pracowników zatrudnionych na stanowisku MANAGER ze wszystkich
--departamentów wraz ze wszystkimi pracownikami zatrudnionymi na stanowisku CLERK w
--departamencie 10.
SELECT *
FROM emp
WHERE job = 'MANAGER' OR (job = 'CLERK' AND deptno = 10);
-- 31. Wybierz dane pracowników zatrudnionych w departamentach 10 i 20 we kolejności
-- alfabetycznej ich nazwisk.
SELECT *
FROM emp
WHERE deptno = 10 OR deptno = 20 ORDER BY ename;
--37. Wybierz nazwiska pracowników, w których nazwisku występuje ciąg „TH” lub „LL”.
SELECT ename
FROM emp
WHERE ename LIKE '%TH%' OR ename LIKE '%LL%';
--38. Wybierz ENAME, DEPTNO i HIREDATE tych pracowników, którzy zostali zatrudnieni w 1980 r
SELECT ename, deptno, hiredate
FROM emp
WHERE EXTRACT (YEAR FROM hiredate) = 1980;
--39. Wybierz nazwiska, roczną pensję oraz prowizję tych wszystkich sprzedawców, których
-- miesięczna pensja przekracza prowizję. Wyniki posortuj według malejących zarobków,
-- potem nazwisk.
SELECT ename, sal * 12, comm
FROM emp
WHERE sal > NVL(comm,0) ORDER BY sal DESC, ename;
