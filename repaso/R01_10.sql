create function userHasLogin(@startAt datetime, @endAt datetime)
returns table
as return (
    select username, count(sign_in_at) as login from userLoginBetween(@startAt, @endAt)
    group by username
)