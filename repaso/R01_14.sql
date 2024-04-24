-- drop trigger tg_usersVerifyLogin
create trigger tg_usersVerifyLogin
on login
instead of insert
as
begin

    declare @username varchar(255);
    declare @sign_in_at datetime;

    select 
        @username = username, 
        @sign_in_at = sign_in_at 
    from inserted;

    if @sign_in_at > sysdatetime()
    begin
        insert into login_audit (sysuser, code, severity, title, description, username, create_at)
            values (suser_name(), 1001, 1, 'Login incorrect', 'User try to login in future date', @username, sysdatetime());

        raiserror ('La fecha de inicio de sesión es posterior a la fecha actual', 16, 1);
    end

    insert into login (username, sign_in_at)
    values(@username, sysdatetime());

end