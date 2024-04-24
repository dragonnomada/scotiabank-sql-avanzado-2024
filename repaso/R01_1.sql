select u.username, sum(cast(t.checked as int)) as checked, sum(1 - cast(t.checked as int)) as unchecked, count(*) as total, min(t.PartitionColumn) as minYear, max(t.PartitionColumn) as maxYear from todos t
join users u on t.user_id = u.id
group by u.username