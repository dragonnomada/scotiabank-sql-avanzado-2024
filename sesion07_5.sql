select top(5) 
    ta.id, 
    ta.username, 
    ta.operation, 
    ta.todo_id, 
    ta.created_at,
    t.title
from todos_audit ta
    join todos t on t.id = ta.todo_id