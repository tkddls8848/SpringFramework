create table board(
	bno number PRIMARY KEY,
	title varchar2(50),
	content varchar2(3000),
	userid varchar2(20),
	regdate date DEFAULT sysdate,
	viewcnt number DEFAULT 0
);

select*from board b, users u where b.userid = u.userid;

		SELECT * FROM (
		    SELECT rownum as rn, A.* from(
		        SELECT rownum, bno, title, regdate, viewcnt, u.userid, 
					(SELECT count(*) FROM reply WHERE bno = b.bno) as cnt
		        FROM board b, users u
		        ORDER BY bno desc, regdate desc
		    ) A
		);
        
drop table board;

INSERT INTO board (bno, title, content, userid) 
VALUES (seq_board.nextval, 'asdf', 'asdf', 'admin');
        
select bno, title, content, regdate, viewcnt 
from board
order by bno desc;

insert into board (bno, title, content, memID) 
values ((select nvl(max (bno)+1,1) from board), 'title', 'content', 'memID');

insert into board (bno, title, content, userid) 
values (seq_board.nextval, 'asdf', 'asdf', 'asdf');

create sequence seq_board
start with 1
increment by 1;

drop sequence seq_board;

declare
    i number := 1;
begin
    while i<= 300 loop
        insert into board (bno, title, content, userid) 
        values ((select nvl(max (bno)+1,1) from board), 'title'||i, 'content'||i, 'userid'||i);
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
);

UPDATE board
SET title = 'ti', content = 'con'
WHERE bno = 1;

DELETE FROM board WHERE bno=2;

commit;

rollback;
