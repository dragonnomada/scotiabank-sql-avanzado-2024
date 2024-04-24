-- drop table login_audit
create table login_audit (
    id int identity(1, 1) primary key,
    sysuser varchar(255),
    code int,
    severity int,
    title varchar(255), 
    description varchar(255), 
    username varchar(255),
    create_at datetime
)