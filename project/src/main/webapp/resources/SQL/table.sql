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

insert into board (bno, title, content, memID) 
values ((select nvl(max (bno)+1,1) from board), 'title', 'content', 'memID');

insert into board (bno, title, content, memID) 
values (seq_board.nextval, 'title', 'content', 'memID');

create sequence seq_board
start with 1
increment by 1;

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
        select rownum, bno, title, content,b.regdate, viewcnt, m.memID
        from board b, member m
        where b.memID = m.memID
        order by bno desc, regdate desc
    ) A
)where rn between 1 and 200;

commit;

rollback;

		SELECT * FROM (
		    SELECT rownum as rn, A.* from(
		        SELECT rownum, bno, title, regdate, viewcnt, m.memID
		        FROM board b, member m
				WHERE b.memID = m.memID
                    and (
                    m.memID like '%'||''||'%'
                    or content like '%'||''||'%'
                    or title like '%'||''||'%'
                    )
		        ORDER BY bno desc, regdate desc
		    ) A
		) WHERE rn between 1 and 200;
