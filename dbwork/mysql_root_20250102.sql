-- 전체 table 확인하기
show tables;

-- 현재 날짜와 시간 구하는 방법들
select now() from dual;
select sysdate() from dual;
select current_timestamp() from dual;

-- 날짜 함수들
select year(now()) from dual; -- year(날짜) : 2025 숫자로 반환
select month(now()) from dual; -- month(날짜) : 월을 숫자로 반환
select day(now()) from dual; -- 일
select dayofmonth(now()) from dual; -- 일 
select monthname(now()) from dual; -- 월을 영어로 
select dayname(now()) from dual; -- 요일을 영어로

-- data_format(날짜, '형식') -> 오라클의 to_char와 같다.
-- %Y(연도4자리), %y(연도2자리), %M(월을 영어로), %m(월을 숫자로), %d:일(얜 대문자 없음)
select date_format(now(),'%Y-%M-%d') from dual; -- 2025-January-02
select date_format(now(),'%y-%m-%d') from dual; -- 25-01-02
-- %H:24시간, %h:12시간 표시, %i:분 
select date_format(now(),'%Y-%m-%d %H:%i') from dual; -- 2025-01-02 15:02
select date_format(now(),'%Y년 %m월 %d일 %H시 %i분') from dual; -- 2025년 01월 02일 15시 04분

-- 문자함수들
-- concat(a,b):문자연결합, 여러 개도 가능 (오라클은 2개만 가능)
select concat('Happy', 'Day') from dual;
select concat('Happy', 'Day', '!!') from dual;

-- replace('문자열', '기존문자열', '새로운문자열'):문자열 변경
select replace('bitcamp', 'bit', '비트') from dual; -- 비트camp

-- instr('문자열', '찾는문자열'):위치 반환
select instr('최은영', '은영') from dual; -- 2 (2번째에 있다는 뜻)
select instr('최은영', '재희') from dual; -- 0 (0은 없다, 오라클에선 -1)

-- left('문자열', '개수'):왼쪽에서 추출
-- right('문자열', '개수'):오른쪽에서 추출
-- mid('문자열', 시작위치, 개수):시작위치부터 개수만큼 추출
-- substring('문자열', 시작위치, 개수):시작위치부터 개수만큼 추출
select left('Have a nice day', 4) from dual; -- Have
select right('Have a nice day', 3) from dual; -- day
select mid('Have a nice day', 8, 4) from dual; -- nice
select substring('Have a nice day', 8, 4) from dual; -- nice

-- ltrim, rtrim, trim: 공백 제거
select concat('*', ltrim('   Happy   '), '*') from dual;
select concat('*', rtrim('   Happy   '), '*') from dual;
select concat('*', trim('   Happy   '), '*') from dual;

-- lower,lcase: 소문자 변환 / upper, ucase: 대문자 변환
select lower('HappY dAy HahA') from dual;
select lcase('HappY dAy HahA') from dual;
select upper('HappY dAy HahA') from dual;
select ucase('HappY dAy HahA') from dual;
select reverse('HappY dAy HahA') from dual;

-- 조건 함수
-- if(조건식, 참일 때, 거짓일 때)
select if(100>200, '참', '거짓') from dual;
select if(100>200, '참', '거짓') result from dual; -- 컬럼 제목 변경

-- ifnull(컬럼값, null일 때의 대치값): 오라클의 NVL과 같음.
select ifnull(null,1) from dual;  -- 1
select ifnull('na',1) from dual;  -- na

-- 숫자 함수
-- abs: 절대값
select abs(6), abs(-6) from dual;

-- ceiling: 무조건 올림 / floor: 무조건 내림 / round: 반올림
select ceiling(3.1), floor(3.5) from dual; -- 4  3
select round(3.16,1) from dual; -- 3.2
select round(567892,-2) from dual; -- 567900

-- pow: 제곱, mod: 나머지
select pow(2,3), mod(10,3) from dual; -- 8   1

-- greatest(숫자1, 숫자2...): 가장 큰 숫자 구하기
-- least(숫자1, 숫자2...): 가장 작은 숫자 구하기
select greatest(100, 34, 56, 200, 49) from dual; -- 200
select least(100, 34, 56, 200, 49) from dual; -- 34


-- ==================================================================

-- 2025.01.06.월
-- 연습용 테이블 생성
create table shop( -- 만약 shop으로 했을 때 오류뜰 경우 DB명.shop으로 작성
	idx smallint auto_increment primary key,
	sangpum varchar(30),
    su smallint default 1,
    danga int,
    ipgoday datetime);