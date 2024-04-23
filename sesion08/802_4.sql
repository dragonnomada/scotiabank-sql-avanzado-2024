select 
    username, 
    count(*) todos_total, 
    sum(cast(checked as int)) todos_listos, 
    100.0 * sum(cast(checked as int)) / count(*) porcentaje_listo
from todos_users
group by username;