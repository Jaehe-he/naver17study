create table reboard (
	num smallint auto_increment primary key,
    writer varchar(30),
    photo varchar(200),
    passwd varchar(20),
    subject varchar(500),
    content varchar(2000),
    readcount smallint default 0,
    writeday datetime,
    regroup smallint,
    relevel smallint,
    restep smallint);