select *
from EMP
where sal = (select min(SAL) from emp);
--Zadani 2
select *
from EMP
where job = (select job from emp where ENAME = 'BLAKE');
--Zadanie 3
select *
from EMP
where SAL in (select min(sal) from EMP group by DEPTNO);
--Zadanie 4
select *
from EMP a
where SAL = (select min(sal) from EMP b where a.DEPTNO = b.DEPTNO);
--Zadanie 5
select *
from EMP
where sal > any (select min(SAL) from emp where DEPTNO = 30);
--Zadanie 6
select *
from EMP
where sal > all (select min(SAL) from emp where DEPTNO = 30);
--Zadanie 7
select  DEPTNO
from EMP
group by DEPTNO
having avg(sal) > (select avg(sal)
from emp
where DEPTNO = 30
);
--Zadanie 8
select job
from emp
group by job
having avg(sal) = (select max(avg(sal)) from EMP group by job);
--Zadanie 9
select ENAME, job
from EMP
where sal > (select max(SAL) from EMP where DEPTNO = 30);
--Zadanie 10
select *
from EMP a
where sal > (select avg(sal) from emp where DEPTNO = a.DEPTNO);
--Zadanie 11
select *
from EMP a
where exists (select * from EMP b where a.EMPNO = b.MGR);
--Zadanie 12
select *
from EMP a
WHERE NOT EXISTS ( select DEPTNO from DEPT b where a.DEPTNO = b.DEPTNO);
--Zadanie 13
select *
from emp
where (deptno, HIREDATE) in (select DEPTNO, max(HIREDATE) from EMP group by deptno)
order by hiredate;
--Zadanie 14
select ENAME,SAL,DEPTNO
from EMP a
where SAL > (select avg(SAL) from EMP b  where a.DEPTNO = b.DEPTNO );
--Zadanie 15
select *
from DEPT
where DEPTNO not in (select  DEPTNO from EMP);
--Zadanie 16
SELECT deptno, w_dziale / razem * 100
FROM (SELECT COUNT(*) AS razem FROM emp) a,
(SELECT deptno, COUNT(*) AS w_dziale FROM emp GROUP BY deptno) b