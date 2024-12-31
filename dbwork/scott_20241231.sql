-- EQUI JOIN 또는 INNER JOIN : 두 테이블의 결합

-- 방법1. 컬럼명 앞에 테이블명이나 테이블명칭을 붙인다.
SELECT E.ENAME, E.JOB, E.SAL, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO;

-- 방법2. 조인할 테이블에 컬럼명이 켭치지 않은 경우는 테이블명이나 별칭을 붙이지 않아도 된다
SELECT E.DEPTNO,ENAME,JOB, SAL, DNAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO;

-- DECODE 함수 - 다중 IF문 같은 함수이다
SELECT ENAME, DEPTNO, DECODE(DEPTNO, 10, '홍보부', 20, '교육부', 30, '인사부) 부서명 FROM EMP;

