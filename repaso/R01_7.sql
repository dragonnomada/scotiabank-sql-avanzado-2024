create function userLoginBetween (
    @startAt datetime, 
    @endAt datetime
)
returns table
as return (
    select u.username, ul.sign_in_at from users u
    left join (
        select * from users_login
        where sign_in_at BETWEEN @startAt and @endAt
    ) ul on u.username = ul.username
)