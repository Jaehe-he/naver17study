-- emp 테이블로 연습
-- job 컬럼의 데이터 중 중복되는 데이터는 한번만 출력해보자.
select DISTINCT job from emp; -- DISTINCT : 중복되는 데이터를 한번씩만 출력해줌
select DISTINCT job,ename from emp; --DISTINCT는 다른 컬럼하고 같이 쓸 경우 적용이 안되거나 오류가 날 수도 있다
select * from emp;-- 전체 컬럼에 들어있는 데이터 조회
select ename,job from emp; -- 일부 컬럼만 조회
select ename,job from emp order by ename; -- ename의 오름차순 조회(asc인 경우는 생략)
select ename,job from emp order by ename desc; --ename의 내림차순 조회 (desc인 경우는 생략 안됨)

--job의 오름차순, 같은 job일 경우는 ename의 내림차순 조회
select job,ename from emp order by job, ename desc;

--job의 오름차순, 같은 job일 경우는 ename도 오름차순 조회
select job, ename from emp order by job, ename;

--순서를 정할때 컬럼명 대신 컬럼 번호로 해도 된다(첫번째 컬럼은 1)
select job, ename from emp order by 1,2; --job(1), ename(2)

--SAL의 오름차순 정렬로 조회를 원할 시
select * from emp order by 6;
select * from emp order by sal; --컬럼번호인 6으로 적어도 되고, 컬럼명을 적어도 됨

-- empno의 오름차순 조회
select ename,sal,comm,job,empno from emp order by 5;
select ename,sal,comm,job,empno from emp order by empno;

-- ename의 내림차순
select ename,sal,comm,job,empno from emp order by 1 desc;
select ename,sal,comm,job,empno from emp order by ename desc;

-- where 조건문
select ename,job,sal,comm from emp where sal >= 1500; -- sal이 1500 이상
select ename,job,sal,comm from emp where ename = 'allen'; --데이터는 대소문자 정확히 써야한다
select ename,job,sal,comm from emp where ename='ALLEN';

-- ENAME이 A로 시작하는 데이터 조회 - 시작 : 뒤에 %
select ename,job,sal,comm from emp where ename LIKE 'A'; --A를 찾는 것
select ename,job,sal,comm from emp where ename LIKE 'A%'; --A로 시작하는 모든 이름, 데이터를 조회

-- ENAME에 A가 포함되는 데이터 조회 - 포함 : 앞뒤로 %
select ename,job,sal,comm from emp where ename LIKE '%A%';

--ENAME에 A로 시작하거나 S로 시작하는 데이터 조회
select ename,job,sal,comm from emp where ename LIKE 'A%' OR ename LIKE 'S%'; --컬럼명까지 정확하게 두번 작성해줘야함

--ENAME에 A와 S를 모두 포함하는 데이터만 출력
select ename,job,sal,comm from emp where ename LIKE '%A%' AND ename LIKE '%S%';

--ENAME의 두번째 글자가 A인 사람만 조회
select ename,job,sal,comm from emp where ename LIKE '_A%'; --뒤에는 뭐가 나오는지 모르지만, 두번째 자리는 A일 경우 _로 자리 선정
select ename,job,sal,comm from emp where ename LIKE '_A%' OR ename LIKE '__A%';

select ename,job,sal,comm from emp where ename LIKE '_A%' ORDER BY SAL desc; --학생이 그냥 해본거에 대한 설명. SAL이 내림차순인걸로

--ENAME이 N이나 K로 끝나는 사람만 조회
select ename,job,sal,comm from emp where ename LIKE '%N' OR ename LIKE '%K';

--JOB이 ANALYST이면서 SAL이 1500 이상인 사람 조회
select ename,job,sal,comm from emp WHERE JOB='ANALYST' AND SAL >= 1500;

--SAL 1200~2000 사이값 조회
select ename,job,sal,comm from emp WHERE SAL>1200 AND SAL <= 2000; --방법1
select ename,job,sal,comm from emp WHERE SAL BETWEEN 1200 AND 2000; --방법2

--JOB이 MANAGER 이거나 SALESMAN 이거나 ANALYST 이 3가지 직업의 사람을 조회
select ename,job,sal,comm from emp WHERE JOB='MANAGER' OR JOB='SALESMAN' OR JOB='ANALYST'; --방법1
select ename,job,sal,comm from emp WHERE JOB IN ('MANAGER', 'SALESMAN', 'ANALYST'); --방법2

--EMPNO가 7654, 7788, 7844, 7902인 사람을 조회
select empno, ename,job,sal,comm from emp WHERE empno IN (7654,7788,7844,7902);

--COMM이 NULL인 데이터만 조회
select ename,job,sal,comm from emp WHERE COMM IS NULL;

--COMM이 NULL이 아닌 경우의 데이터만 조회
select ename,job,sal,comm from emp WHERE COMM IS NOT NULL;

--MGR이 NULL이 아닌 경우만 조회
select * from emp where mgr is not null;

--comm이 null인 경우는 0으로 출력. mgr은 null인 경우 100 출력
select ename,job,sal, NVL(mgr, 100), NVL(comm,0) from emp;

--값 + null = null
select sal,comm,sal+comm from emp; -- comm이 null일 경우 sal+comm도 null

--위의 경우 sal+comm인 경우 comm이 null이면 0으로 계산
select sal,comm,sal+NVL(comm,0) from emp;

--컬럼제목에 별칭 주기(alias)
select ename as "사원명",sal as "월급여" from emp; --생략없이 alias 지정
select ename as "사원명",sal as "월급여" from emp; --as생략하고 alias 지정하는 방법
select ename 사원명,sal 월급여 from emp; --alias에 공백이 없는 경우는 ""도 생략가능
select ename "사원 이름",sal "월 급여" from emp; --중간에 공백이 있는 경우 "" 반드시 넣어야함

-- 총 레코드 갯수(데이터 갯수)
select count(*) from emp; --이 경우는 컬럼명이 count(*)
select count(*) count from emp; --이 경우는 컬럼명이 count
select count(*) 총갯수 from emp; --이 경우는 컬럼명이 총갯수

select sal,comm,sal+NVL(comm,0) sum from emp; --sal+NVL(comm,0)의 컬럼명을 sum으로 주려면 해당 코드로 작성하면 됨
select sal 월급여, comm 커미션,sal+NVL(comm,0) 총금액 from emp; --컬럼명을 한글로

--문자열을 컬럼에 추가시 || 연산자 사용
select '내이름은 '||ename||'입니다' 자기소개 from emp;

--내 직업은 salesman이고 내 월 급여는 1600입니다라고 컬럼명 "자기소개"에 나오도록 작성
select '내 직업은 '||job||'이고, 내 월 급여는 '||sal||'입니다' 자기소개 from emp;

--sal이 1500~2000 사이가 아닌경우만 조회
select * from emp where sal not between 1500 and 2000;
select * from emp where sal<1500 or sal > 2000;

--not in을 사용하여 job이 salesman,clerk가 아닌 경우만 조회
select * from emp where job not in ('SALESMAN','CLERK');

--GROUP 함수(COUNT, SUM, AVG, MAX, MIN)
select count(*) from emp; -- 전체 데이터수
select sum(sal) from emp; --sal의 총합계
select avg(sal) from emp; --sal의 평균. 소수점 이하가 너무 많이 나온다
select round(avg(sal),2) from emp; --sal의 평균을 구하는데 소숫점 이하 2자리로 구한다.
select max(sal) from emp; --최고 급여액수
select min(sal) from emp; --최소 급여액수

--평균 급여보다 sal이 더 높은 사람을 조회하시오(서브쿼리)
select * from emp where (select avg(sal) from emp)<sal;

--SCOTT의 직업과 같은 직업을 가진 사람을 조회하시오(서브쿼리)
select * from emp where (select job from emp where ename = 'SCOTT') = job;

--SCOTT의 MGR과 같은 MGR을 가진 사람
select * from emp where (select mgr from emp where ename = 'SCOTT') = mgr;

--GROUP BY
SELECT JOB FROM EMP GROUP BY JOB; --JOB이 그룹별로 나열이 됨

--JOB의 GROUP별로 인원수를 구해보자
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB;

--제목에 별칭 부여
SELECT JOB 직업, COUNT(*) 인원수 FROM EMP GROUP BY JOB;

--JOB의 GROUP 별로 인원수를 구해보자(인원이 3명이상인 경우에만 조회)
SELECT JOB 직업, COUNT(*) 인원수 FROM EMP GROUP BY JOB HAVING COUNT(JOB) >= 3;

--JOB의 GROUP 별로 인원수를 구해보자(인원이 3명이상인 경우에만 조회) - 인원순으로 출력(오름차순)
SELECT JOB 직업, COUNT(*) 인원수 FROM EMP GROUP BY JOB HAVING COUNT(JOB) >= 3 ORDER BY 인원수; --방법1
SELECT JOB 직업, COUNT(*) 인원수 FROM EMP GROUP BY JOB HAVING COUNT(JOB) >= 3 ORDER BY 2; --방법2

-- 직업별 인원수, 최저연봉, 최고연봉, 평균연봉(소숫점이하 없이)을 구하시오
SELECT JOB 직업, COUNT(*) 인원수, min(sal) 최저연봉, max(sal) 최고연봉, ROUND(avg(sal),0) 평균연봉 FROM EMP GROUP BY JOB ORDER BY 직업;

-- 48페이지 숫자함수
SELECT ABS(-5),ABS(5) FROM DUAL; -- 5 5 절대값 출력 모두 양수

-- ROUND : 반올림, CEIL : 무조건 올림, FLOOR : 무조거 내림
SELECT ROUND(3.6, 0), CEIL(3.6), FLOOR(3.6) FROM DUAL; -- 4 4 3
SELECT ROUND(3.4, 0), CEIL(3.4), FLOOR(3.4) FROM DUAL; -- 3 4 3

SELECT ROUND(328947, -2) FROM DUAL;--328900 (-2번째 자리에서 올림)
SELECT ROUND(328467, -2) FROM DUAL; -- 328500

SELECT ROUND(AVG(SAL),0), CEIL(AVG(SAL)), FLOOR(AVG(SAL)) FROM EMP;

--POWER(M,N):M의 N승값을 구함. MOD(M,N) : M을 N으로 나눈 나머지
SELECT POWER(3, 3), MOD(10,3) FROM DUAL; --27/1

-- 문자함수 CONCAT(두문자 더하기), LOWER(소문자), UPPER(대문자), INITCAP(첫글자만 대문자)
SELECT ENAME, CONCAT(ENAME,'님'), LOWER(ENAME), UPPER(ENAME), INITCAP(ENAME) FROM EMP;

SELECT LPAD(SAL,10,'*') FROM EMP; --총 10자리에 남는부분을 * 채움(왼쪽부터 채움)
SELECT RPAD(SAL,10,'*') FROm EMP; --총 10자리에 남는부분을 * 채움(오른쪽부터 채움)

SELECT SUBSTR('HAPPY DAY', 7, 3) FROM DUAL; --7번글자부터 3글자 추출
SELECT SUBSTR('HAPPY DAY', -6, 3) FROM DUAL; --뒤에서부터 6번째글자부터 3글자 추출

--EMP 테이블의 ENAME에서 왼쪽에서 3글자를 추출후 나머지 총 7자리 중 우측 빈 공간은 *로 채워서 출력
SELECT RPAD(SUBSTR(ENAME,1,3), 7, '*'), SAL FROM EMP;

--LENGTH 길이 구하기
SELECT ENAME 이름, LENGTH(ENAME) 문자길이 FROM EMP;

--REPLACE (HAPPY를 GOOD으로 변경)
SELECT REPLACE('HAPPY DAY', 'HAPPY', 'GOOD') FROM DUAL;

--TRIM : 앞뒤 공백제거
SELECT '*'||'  LEE SU JI  '||'*' FROM DUAL; -- 앞뒤 공백 제거 안됨
SELECT '*'||TRIM('    LEE SU JI    ')||'*' FROM DUAL; --앞뒤 공백이 제거됨

-- 일단 현재 날짜를 나타내는 sysdate
select sysdate from dual; --현재 날짜
select sysdate+7 from dual; --오늘로부터 7일뒤 날짜
select sysdate+1 from dual; --내일 날짜

--to_char 함수를 이용해서 원하는 날짜 모양으로 출력해보자
select to_char(sysdate, 'yyyy-mm-dd') from dual; -- 2024-12-30
-- mm:월 mi:분 hh:12시간 표시 am/pm : 오전이나 오후 표시 (둘중 하나 쓰면 알아서 나옴)
select to_char(sysdate, 'yyyy-mm-dd am hh:mi') from dual; --2024-12-30 오후 04:41

select to_char(sysdate, 'month') from dual; -- 12월 (month : 지역화에 따라 다르게 나오므로 잘 사용 안함)

--현재 년도 4자리만 추출
select to_char(sysdate, 'yyyy') from dual;

--현재 월 추출
select to_char(sysdate, 'mm') from dual;
select to_char(to_date('2024-5-10'), 'mm') from dual; --05 -- 문자열(2024-5-10)을 날짜타입으로 변환해서 추출

--emp의 hiredate는 날짜타입이다
select to_char(hiredate, 'yyyy-mm-dd') 입사일 from emp; --앞에 1900이 붙음