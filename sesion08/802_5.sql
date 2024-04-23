create view dbo.todos_pendientes
with schemabinding
as
select 
    username, 
    count_big(*) todos_total, 
    sum(cast(checked as int)) todos_listos, 
    100.0 * sum(cast(checked as int)) / count_big(*) porcentaje_listo
from dbo.todos_users
group by username;