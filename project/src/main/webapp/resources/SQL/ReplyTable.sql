create table reply(
rno number unique,
bno number default 0,
replytext varchar2(1000),
replyer varchar2(50),
regdate date default sysdate,
updatedate date default sysdate
);

alter table reply add constraint fk_board
foreign key(bno) references board(bno);

create sequence reply_seq
start with 1
increment by 1;

commit;

rollback;
