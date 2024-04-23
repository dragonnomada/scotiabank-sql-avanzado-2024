alter database test_curso
add filegroup todos_fg6;

alter database test_curso
add file (
    name = 'Todos_fg6',
    filename = 'C:\Data\Filegroups\Todos_fg6.ndf',
    size = 100mb,
    maxsize = unlimited,
    filegrowth = 50mb
)
to filegroup todos_fg6;

alter partition scheme todosPartitionScheme
next used todos_fg6;

alter partition function todosPartitionFunction()
split range (2025);
