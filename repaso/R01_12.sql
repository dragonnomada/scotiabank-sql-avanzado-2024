create procedure userSignIn
    @username varchar(255)
as
begin
    update login set active=0 where username=@username;

    insert into login (username, sign_in_at)
        values(@username, sysdatetime());
end