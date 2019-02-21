create table users(
userid varchar2(255) PRIMARY KEY,
passwd varchar2(255) not null,
name varchar2(255) not null,
enabled number(1) default 1,
authority varchar2(20) default 'ROLE_USER'
);

--spring security

create table member(
memID varchar2(20) PRIMARY KEY,
memPW varchar2(20),
memEMAIL varchar2(20),
memPHONE1 varchar2(20),
memPHONE2 varchar2(20),
memPHONE3 varchar2(20)
);

select * from member;

insert into member (memID, memPW, memEMAIL, memPHONE1, memPHONE2, memPHONE3)
values ('memID','a','a@a','1','1','1');

drop table member;


--member


create table board(
	bno number PRIMARY KEY,
	title varchar2(50),
	content varchar2(3000),
	memID varchar2(20),
	regdate date DEFAULT sysdate,
	viewcnt number DEFAULT 0
);

drop table board;

select * from board;

select bno, title, content, regdate, viewcnt 
from board
order by bno desc;

select bno, title, content, b.memID, regdate, viewcnt 
from board b, member m
where b.memID=m.memID
order by bno desc;

create sequence	seq_board
start with 1
increment by 1;

insert into board (bno, title, content, memID) 
values ((seq_board.nextval), 'title', 'content', 'memID');

declare
    i number := 1;
begin
    while i < 1000 loop     
      insert into board (bno, title, content, memID) 
      values ((select nvl(max(bno)+1, 1)from board), 'title'||i, 'content', 'memID');
    i := i+1;
    end loop;
end;

select *
from (
    select rownum rn, A.*
    from (
        select rownum, bno, title, content, b.memID, regdate, viewcnt
        from board b, member m
        where b.memID=m.memID
        order by bno desc
    )A
)
where rn between 1 and 10;

update;

delete from board;

commit;

rollback;