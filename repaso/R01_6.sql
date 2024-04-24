select u.username, ul.sign_in_at from users u
left join (
    select * from users_login
    where sign_in_at BETWEEN '2024-04-24 00:00:00' and '2024-04-25 00:00:00'
) ul on u.username = ul.username;