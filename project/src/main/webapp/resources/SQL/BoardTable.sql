create table board(
	bno number PRIMARY KEY,
	title varchar2(50),
	content varchar2(3000),
	memID varchar2(20),
	regdate date DEFAULT sysdate,
	viewcnt number DEFAULT 0
);

select*from board;

drop table board;

INSERT INTO board (bno, title, content, memID) 
VALUES (seq_board.nextval, 'asdf', 'asdf', 'asdf');
        
select bno, title, content, regdate, viewcnt 
from board
order by bno desc;

insert into board (bno, title, content, memID) 
values ((select nvl(max (bno)+1,1) from board), 'title', 'content', 'memID');

insert into board (bno, title, content, memID) 
values (seq_board.nextval, 'asdf', 'asdf', 'asdf');

create sequence seq_board
start with 300
increment by 1;

drop sequence seq_board;

declare
    i number := 1;
begin
    while i<= 300 loop
        insert into board (bno, title, content, memID) 
        values ((select nvl(max (bno)+1,1) from board), 'title'||i, 'content'||i, 'memID'||i);
        i := i+1;
    end loop;
end;

select * from (
    select rownum as rn, A.* from(
        select rownum, bno, title, content,b.regdate, viewcnt, m.memID,
        	(SELECT count(*) FROM reply WHERE bno = 100) as C
        from board b, member m
        where b.memID = m.memID
        order by bno desc, regdate desc
    ) A
)where rn between 1 and 200;

UPDATE board
SET title = 'ti', content = 'con'
WHERE bno = 1;

DELETE FROM board WHERE bno=2;

commit;

rollback;
