create view dbo.todos_users
with schemabinding
as
select t.id, t.title, t.checked, u.username from dbo.todos t
join dbo.users u on u.id = t.user_id;


