create table reply(
rno number,
bno number default 0,
replytext varchar2(1000),
userid varchar2(50),--memID
regdate date default sysdate,
updatedate date default sysdate
);

select * from reply;

alter table reply add constraint fk_board
foreign key(bno) references board(bno);

create sequence reply_seq
start with 1
increment by 1;

insert into reply (rno, bno, replytext, userid) 
values (reply_seq.nextval, '300', 'asdf', 'memID1');

SELECT rno, bno, replytext, m.memID, r.regdate, r.updatedate,
	(SELECT b.memID FROM board b, reply r WHERE b.bno = r.bno) as writer
FROM reply r, member m
WHERE r.memID=m.memID and bno = '300'
ORDER BY r.rno desc;
select * from member;

SELECT rno, bno, replytext, m.memID, r.regdate, r.updatedate
FROM reply r, member m
WHERE r.memID=m.memID and bno = '300'
ORDER BY r.rno desc;

drop table reply;

commit;

rollback;
		SELECT * 
		FROM (
			SELECT rownum as rn, A.*
			FROM (
                    SELECT rno, bno, replytext, m.memID, r.regdate, r.updatedate,
                        (SELECT memID FROM board WHERE bno = r.bno) as writer
                    FROM reply r, member m
                    WHERE r.memID=m.memID and bno = 1
                    ORDER BY rno desc
                    ) A 
                );
