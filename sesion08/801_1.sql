alter table todos
add PartitionColumn as year(create_at) persisted;

-- Podemos calcular la columna de partición
-- a partir de un CAST o alguna conversión
-- CONVERT(*) | CAST(*) | LEFT(*,*) | RIGHT(*,*)
