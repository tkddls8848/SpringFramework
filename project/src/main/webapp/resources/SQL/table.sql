create table member(
memID varchar2(20) PRIMARY KEY,
memPW varchar2(20),
memEMAIL varchar2(20),
memPHONE1 varchar2(20),
memPHONE2 varchar2(20),
memPHONE varchar2(20)
);

drop table member;

commit;

rollback;