alter database test_curso
add file (
    name = 'Todos_fg1',
    filename = 'C:\Data\Filegroups\Todos_fg1.ndf',
    size = 100mb,
    maxsize = unlimited,
    filegrowth = 50mb
)
to filegroup todos_fg1;

alter database test_curso
add file (
    name = 'Todos_fg2',
    filename = 'C:\Data\Filegroups\Todos_fg2.ndf',
    size = 100mb,
    maxsize = unlimited,
    filegrowth = 50mb
)
to filegroup todos_fg2;

alter database test_curso
add file (
    name = 'Todos_fg3',
    filename = 'C:\Data\Filegroups\Todos_fg3.ndf',
    size = 100mb,
    maxsize = unlimited,
    filegrowth = 50mb
)
to filegroup todos_fg3;

alter database test_curso
add file (
    name = 'Todos_fg4',
    filename = 'C:\Data\Filegroups\Todos_fg4.ndf',
    size = 100mb,
    maxsize = unlimited,
    filegrowth = 50mb
)
to filegroup todos_fg4;

alter database test_curso
add file (
    name = 'Todos_fg5',
    filename = 'C:\Data\Filegroups\Todos_fg5.ndf',
    size = 100mb,
    maxsize = unlimited,
    filegrowth = 50mb
)
to filegroup todos_fg5;