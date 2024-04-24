create view users_login
as (
    select u.username, u.firstname, u.lastname, r.sign_in_at from users u
    left join (
        select row_number() over (partition by username order by sign_in_at desc) rn, username, sign_in_at, active from login
    ) r on u.username = r.username and r.rn = 1
);

-- select * from users_login;