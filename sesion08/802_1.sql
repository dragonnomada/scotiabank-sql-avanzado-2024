select t.id, t.title, t.checked, u.username from todos t
join users u on u.id = t.user_id;


