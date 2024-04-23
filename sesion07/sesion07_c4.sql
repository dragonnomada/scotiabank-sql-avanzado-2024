create table cliente (
    id int identity(1, 1) primary key,
    nombre varchar(255),
    no_cuenta varbinary(max),
    pin varbinary(max)
) 