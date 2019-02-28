create table memberdetail(
memID varchar2(20),
memJIBUN varchar2(200),
memJIBUNDETAIL varchar2(200),
memZIPNO number
); 

alter table memberdetail add constraint fk_member
foreign key(memID) references member(memID);

insert into memberdetail
values ('memID1','','');

select * 
from member m, memberdetail md
where m.memID=md.memID and m.memID = 'memID1';

drop table memberdetail;

commit;