create table users(
userid varchar2(255) PRIMARY KEY,
passwd varchar2(255) not null,
name varchar2(255) not null,
enabled number(1) default 1,
authority varchar2(20) default 'ROLE_USER'
);


--spring security

create table member(
userid varchar2(20) PRIMARY KEY,
memPW varchar2(20),
memEMAIL varchar2(20),
memPHONE1 varchar2(20),
memPHONE2 varchar2(20),
memPHONE3 varchar2(20)
);

declare
    i number := 1001;
begin
    while i<= 1004 loop
        insert into member (userid, memPW, memEMAIL, memPHONE1, memPHONE2, memPHONE3) 
        values ('userid'||i, 'memPW'||i, 'memEMAIL'||i, 'memPHONE1'||i, 'memPHONE2'||i, 'memPHONE3'||i);
        i := i+1;
    end loop;
end;

select * from member m;

insert into member (userid, memPW, memEMAIL, memPHONE1, memPHONE2, memPHONE3)
values ('memID','a','a@a','1','1','1');

drop table member;
