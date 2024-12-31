-- 12월 30일 오라클 문제

-- 1. 어떤 종류의 직업이 있는지 job을 한번씩만 출력하는데 직업의 오름차순으로 출력하시오'
SELECT DISTINCT JOB FROM EMP ORDER BY JOB;

-- 2. ename에 대소문자 상관없이 's'를 포함하고 있는 데이터출력(컬럼:ename,job,sal)(Lower or Upper 사용)
SELECT ENAME, JOB, SAL FROM EMP WHERE ENAME LIKE '%s%' OR ENAME LIKE '%S%';
SELECT ENAME, JOB, SAL FROM EMP WHERE LOWER(ENAME) LIKE '%s%';
SELECT ENAME, JOB, SAL FROM EMP WHERE UPPER(ENAME) LIKE '%S%';

-- 3. ename의 3번째 글자가 L인 사람을 조회하시오(컬럼 :ename, sal, comm)
SELECT ENAME, SAL, COMM FROM EMP WHERE ENAME LIKE '__L%';

-- 4. comm이 null이 아닌 사람 중에 sal이 1500 이상인 사람 출력(컬럼 : ename, sal, comm)
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM IS NOT NULL AND SAL >= 1500;

-- 5. hiredate 입사일이 5월인 사람은 모두 출력(컬럼 : ename, hiredate, sal)
SELECT ENAME, to_char(hiredate, 'yyyy-mm-dd') 입사일, SAL FROM EMP WHERE to_char(hiredate, 'mm') = 05; --결과 : 1981-05-01, 1987-05-23
SELECT ENAME, to_char(hiredate, 'mm') 입사일, SAL FROM EMP WHERE to_char(hiredate, 'mm') = 05; --결과 : 05, 05
SELECT ENAME, HIREDATE, SAL FROM EMP WHERE TO_CHAR(HIREDATE,'mm')='05'; --결과 : 81/05/01, 87/05/23
SELECT ENAME, HIREDATE, SAL FROM EMP WHERE TO_CHAR(HIREDATE,'mm')=5;

-- 6. hiredate 입사일이 1985-01-01 이후에 입사한사람 출력(컬럼 : ename, hiredate, sal)
SELECT ENAME, to_char(HIREDATE, 'yyyy-mm-dd') 입사일, SAL FROM EMP WHERE to_char(HIREDATE) >= to_date('1985-01-01');
SELECT ENAME, HIREDATE, SAL FROM EMP WHERE HIREDATE>='1985-01-01';

-- 7. sal이 1500~3000 사이인 사람을 출력하는데 관계연산자와 and를 이용해서 출력
SELECT * FROM EMP WHERE SAL >= 1500 AND SAL <= 3000;

-- 8. 7번의 결과를 between을 이용해서 출력(컬럼 : ename, sal, mgr)
SELECT ENAME, SAL, MGR FROM EMP WHERE SAL BETWEEN 1500 AND 3000;

-- 9. in을 이용해서 job이 clerk, president, manager인 사람의 전체 컬럼을 모두 출력
SELECT * FROM EMP WHERE JOB IN ('CLERK', 'PRESIDENT', 'MANAGER');

-- 10. ename, sal, comm, sal*comm을 출력하는데 comm이 null인 경우 1로 변경해서 출력하고 계산하기
SELECT ENAME, SAL, NVL(COMM,1), SAL*NVL(COMM,1) FROM EMP;

-- 11. ename이 ADAMS인 사람의 SAL보다 더 많이 받는 사람 출력(컬럼명 : ENAME, JOB, SAL)
SELECT ENAME, JOB, SAL FROM EMP WHERE (SELECT SAL FROM EMP WHERE ENAME = 'ADAMS') < SAL;

-- 12. 평균SAL 보다 작은 사람의 전체 컬럼 출력
SELECT * FROM EMP WHERE (SELECT avg(sal) FROM EMP) > SAL;

-- 13. ENAME이 A나 S나 M으로 시작하는 모든 사람 출력(컬럼 : ENAME, JOB, SAL)
SELECT ENAME, JOB, SAL FROM EMP WHERE ENAME LIKE 'A%' OR ENAME LIKE 'S%' OR ENAME LIKE 'M%';
-- SELECT ENAME, JOB, SAL FROM EMP WHERE ENAME LIKE IN ('A%', 'S%', 'M%'); -- 정확한 값일 때만 IN 가능

-- 14. MGR을 GROUP로 인원수와 평균 SAL을 구하시오(평균 SAL은 무조건 올림으로)
SELECT MGR, CEIL(AVG(sal)), COUNT(*) 인원수 FROM EMP GROUP BY MGR; --MGR이 GROUP BY되고 평균 SAL을 어떻게 구해야할지 모르겠음
SELECT MGR, COUNT(*), ROUND(AVG(SAL,-1) FROM EMP WHERE MGR IS NOT NULL GROUP BY MGR;

-- 15. SCOTT의 SAL과 같은 SAL을 받는사람을 조회하시오(컬럼 : ENAME, SAL)
SELECT ENAME, SAL FROM EMP WHERE (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT') = SAL;

-- 16. ENAME의 글자 길이가 4글자인 사람만 조회(컬럼 : ENAME, JOB)
SELECT ENAME, JOB, length(ENAME) FROM EMP WHERE length(ENAME) = 4;

-- 17. ENAME의 3번째 글자가 R이거나 A인사람 조회(컬럼 : ENAME, JOB)
SELECT ENAME, JOB FROM EMP WHERE ENAME LIKE '__R%' OR ENAME LIKE '__A%';

-- 18. JOB 직업별로 인원수와 최고 연봉을 출력하는데 직업의 오름차순으로 출력
SELECT JOB, COUNT(*), MAX(SAL) FROM EMP GROUP BY JOB ORDER BY JOB; --오름차순 : ORDER BY

-- 19. || 연산자를 이용하여 다음과 같이 하나의 컬럼으로 출력하시오(EMP 테이블로)
----      (예) SCOTT의 직업은 CLERK이며 입사년도는 1989년 05월입니다.
SELECT ENAME||'의 직업은 '||JOB||'이며 입사년도는 '||to_char(hiredate, 'yyyy')||'년 ' ||to_char(hiredate, 'mm')||'월입니다.' FROM EMP;


-- SELECT * FROM EMP WHERE HIREDATE BETWEEN TO_DATE('1981-02-20', 'YYYY-MM-DD') AND TO_DATE('1981-02-21', 'YYYY-MM-DD') + 0.999999;
-- SELECT * FROM EMP WHERE HIREDATE BETWEEN TO_DATE('1981-02-20', 'YYYY-MM-DD') AND TO_DATE('1981-02-21', 'YYYY-MM-DD') + 0.999995;