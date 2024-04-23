CREATE TABLE todos_audit (
    id int IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(255) not null,
    operation VARCHAR(255) not null,
    todo_id int not null,
    created_at DATETIME
)