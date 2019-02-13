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
values ('a','a','a@a','1','1','1');

drop table member;

create table board(
	bno number PRIMARY KEY,
	title varchar2(50),
	content varchar2(3000),
	nickName varchar2(20),
	regdate date DEFAULT sysdate,
	viewcnt number DEFAULT 0
);

drop table board;

select * from board;

select bno, title, content, regdate, viewcnt 
from board
order by bno desc;

insert into board (bno, title, content, nickName) 
values ((select nvl(max (bno)+1,1) from board), 'title', 'content', 'nickName');

update;

delete;

commit;

rollback;