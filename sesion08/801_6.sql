create partition function todosPartitionFunction (int)
as range right for values (2021, 2022, 2023, 2024);