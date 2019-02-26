create table users(
userid varchar2(255) PRIMARY KEY,
passwd varchar2(255) not null,
name varchar2(255) not null,
enabled number(1) default 1,
authority varchar2(20) default 'ROLE_USER'
);

--spring security

select *
from users
where userid = #{userid};

commit;

rollback;