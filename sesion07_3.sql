CREATE TRIGGER tg_AuditTodos
ON todos
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @operation VARCHAR(255);
    DECLARE @username VARCHAR(255);
    DECLARE @todoId int;

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        SET @operation = 'UPDATE';
    END
    ELSE
    BEGIN
        SET @operation = 'INSERT';
    END

    SET @username = SUSER_NAME();

    select @todoId = id from inserted;

    INSERT INTO todos_audit (username, operation, todo_id, created_at)
        VALUES (@username, @operation, @todoId, SYSDATETIME());
END