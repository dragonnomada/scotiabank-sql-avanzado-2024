select username, count(sign_in_at) as login from userLoginBetween('2024-04-22 00:00:00', '2024-04-22 23:59:59')
group by username