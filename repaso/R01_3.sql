create table login (
    id int identity(1, 1) primary key,
    username varchar(255),
    sign_in_at datetime,
    active bit default 1
);

insert into login (username, sign_in_at)
    values('paty123', '2024-04-24 07:23:36');

insert into login (username, sign_in_at)
    values('paco456', '2024-04-24 08:12:33');

update login set active=0 where username='paty123';

insert into login (username, sign_in_at)
    values('paty123', '2024-04-24 09:55:12');

update login set active=0 where username='paco456';

insert into login (username, sign_in_at)
    values('paco456', '2024-04-24 10:10:33');

update login set active=0 where username='daniela98';

insert into login (username, sign_in_at)
    values('daniela98', '2024-04-24 11:11:11');

update login set active=0 where username='pepe54';

insert into login (username, sign_in_at)
    values('pepe54', '2024-04-27 07:01:32');

-- select * from users

select * from login;