 -- 데이타타입
   -- 문자 : char,varchar
--    숫자 :  tinyint  1 byte
--           smallint  2byte
--           mediumint 3byte
--           int       4byte
--           bigint    8byte
--           float     실수타입 4byte
--           double      "      8byte
--           decimal(m,n) : m자리수,n소숫점자릿수
--    날짜 :    date   CCYY-MM-DD  :now() 로 저장한다해도 날짜만 저장된다
--           datetime   CCYY-MM-DD hh:mm:ss : now() 로 저장하면 날짜와 시간이저장된다
--           timestamp     "
--           time          hh:mm:ss
--           year        CCYY 또는 YY

create table person (
	num smallint auto_increment primary key, -- primary key : null값 허용 X
    name varchar(20),
    blood varchar(10) default 'B',
    age smallint,
    today date,
    writeday datetime);
    
    
-- table 구조 확인
desc person;
show create table person; -- 좀 더 디테일한 구조 확인

-- 데이터 추가하기
insert into person (name, age, today, writeday) values ('이영자', 23, now(), now());

-- 모든 컬럼명 생략하고 순서대로 넣기 -- num은 시퀀스 컬럼이므로 null로 줘도 숫자로 들어간다
insert into person values (null, '강호동', 'AB', 45, now(), now());
insert into person values (null, '유재석', 'O', 19, now(), now());
insert into person values (null, '고릴라', 'A', 22, now(), now());
insert into person values (null, '이효리', 'AB', 45, now(), now());
insert into person values (null, '손진아', 'B', 29, now(), now());

-- 각종 조회 연습
select num, name, age from person order by age asc;
select num, name, age from person order by age desc;
select * from person order by age >= 20 and age <= 30;
select * from person order by age between 20 and 30; -- 20~30
select * from person where blood = 'A' or blood = 'O' or blood = 'AB';
select * from person where blood in ('A', 'O', 'AB'); -- A, O, AB인 사람
select * from person where name like '강%'; -- 강으로 시작하는 사람
select * from person where name like '%영%'; -- 영을 포함한 경우
select * from person where name like '_진%';

-- 그룹함수 : count, avg, sum, max, min (group by랑 써도 되고 안써도 됨)
select count(*) from person; -- 총갯수
select avg(age) from person; -- 평균나이
select round(avg(age),0) from person; -- 평균나이(정수타입으로)
select max(age) 최고나이, min(age) 최소나이 from person;

-- 혈액형별 인원수와 평균나이를 구해보자
select blood, count(*) 인원수, round(avg(age),0) 평균나이
from person group by blood order by blood asc;

-- limit 시작위치, 가져올 글의 갯수
select * from person limit 0, 3; -- 첫글(0번)부터 3개만 가져오기
select * from person limit 2, 3; -- 2번글부터(시작은 0번) 3개만 가져오기 (mysql에만 있음)

-- where 조건과 limit 사용시
select * from person where age>=20 limit 1, 2; -- 결과 : 고릴라, 이효리

-- update
update person set blood = 'B', age = 20 where name = '고릴라';

select * from person;


