create partition scheme todosPartitionScheme
as partition todosPartitionFunction
to (todos_fg1, todos_fg2, todos_fg3, todos_fg4, todos_fg5);