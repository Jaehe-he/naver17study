-- cmd 창에서 접속시
-- mysql -u root -p 엔터누른후 비번 1234 입력후 엔터로 접속
show databases; -- database 전체 종류
-- 연습용 database study502 생성하기
create database study502;

-- cmd 창에서 접속한 경우 use database 명으로 이동한다


-- database 제거
-- 연습용 생성 후 제거해보자
create database test; -- 생성
show databases; -- 확인
drop database test; -- 제거
