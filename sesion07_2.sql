CREATE TABLE todos_audit (
    id int IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(255),
    operation VARCHAR(255),
    created_at DATETIME
)