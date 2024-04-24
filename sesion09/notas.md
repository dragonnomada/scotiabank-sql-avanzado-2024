# Curso de SQL Avanzado - Sesión 9

<img src="https://amei.mx/wp-content/uploads/2016/08/Scotiabank-logo.jpg" alt="Scotiabank Logo" height="60">
<img src="https://www.belatrix.com/wp-content/uploads/2023/08/belatrix-logosweb-1.png" alt="Belatrix Logo" height="60">

**[Scotiabank](https://www.scotiabank.com.mx)** | **[Belatrix](https://www.belatrix.com)**

Instructor: [Alan Badillo Salas](alan@nomadacode.com)

---

## Contenido

    Módulo 7: Tuning y Monitoreo Avanzado

    1. Herramientas de monitoreo y diagnóstico
    2. Estrategias para identificar y resolver cuellos de botella
    3. Ajuste de parámetros avanzados

### Temas

901. Herramientas de monitoreo y diagnóstico
902. Estrategias para identificar y resolver cuellos de botella
903. Ajuste de parámetros avanzados
Claro, puedo ayudarte a entender mejor estos temas de SQL Server relacionados con el Tuning y Monitoreo Avanzado. Vamos a desglosar cada uno de los subtemas que mencionaste, proporcionando explicaciones paso a paso y ejemplos prácticos.

## 901. Herramientas de monitoreo y diagnóstico

SQL Server proporciona varias herramientas que ayudan a monitorear y diagnosticar problemas de rendimiento. Aquí algunas de las principales:

- **SQL Server Management Studio (SSMS)**: Es la herramienta principal para la administración de SQL Server, que permite visualizar consultas en ejecución, historial de ejecución y mucho más.
- **Dynamic Management Views (DMVs)**: Permiten ver información interna del servidor que puede ser utilizada para monitorear la salud del servidor y diagnosticar problemas.
- **SQL Server Profiler**: Herramienta para capturar eventos en una instancia de SQL Server, lo que permite analizar y encontrar cuellos de botella.
- **Activity Monitor**: Proporciona una vista rápida del rendimiento de SQL Server, incluyendo procesos en ejecución, uso de la CPU, I/O de disco y otros.

**Ejemplo**: Para utilizar el Activity Monitor en SSMS:

1. Conecta a tu instancia de SQL Server en SSMS.
2. Haz clic derecho en el servidor y selecciona "Activity Monitor".
3. Explora las diferentes áreas como Procesos, Esperas de Recursos, Uso de la CPU, y más para obtener detalles en tiempo real del rendimiento.

### Uso de Herramientas de Monitoreo y Diagnóstico en SQL Server

Vamos a detallar cómo utilizar cada una de estas herramientas paso a paso, lo que te ayudará a gestionar y optimizar tu instancia de SQL Server.

#### 1. SQL Server Management Studio (SSMS)

**SQL Server Management Studio** (SSMS) es una herramienta integral para la gestión de SQL Server. Veamos cómo puedes visualizar consultas en ejecución y el historial de ejecución:

- **Conectar y navegar**:
  1. Abre SSMS y conecta a tu instancia de SQL Server.
  2. Navega en el "Object Explorer" hasta tu base de datos de interés.

- **Ver consultas en ejecución**:
  1. Haz clic derecho en el servidor en "Object Explorer" y selecciona "Activity Monitor".
  2. En el "Activity Monitor", expande la sección "Processes". Aquí puedes ver todas las consultas y procesos en ejecución, junto con información detallada como el usuario, estado, CPU, y uso de memoria.

- **Ver historial de ejecución**:
  1. Para ver el historial de ejecuciones, puedes utilizar herramientas como "SQL Server Profiler" (ver más abajo) o consultar las DMVs relacionadas con el historial de consultas.

#### 2. Dynamic Management Views (DMVs)

Las **Dynamic Management Views** ofrecen una visión interna de la salud del servidor. Aquí hay un ejemplo simple de cómo usar DMVs para obtener información sobre las sesiones activas:

- **Consulta básica a DMVs**:
  ```sql
  SELECT session_id, status, 
         total_elapsed_time, 
         cpu_time, memory_usage, 
         (SELECT text FROM sys.dm_exec_sql_text(sql_handle))
  FROM sys.dm_exec_requests
  WHERE status = 'running';
  ```

  Esta consulta te proporcionará detalles de las consultas que están actualmente en ejecución, incluyendo el tiempo total de ejecución, el tiempo de CPU utilizado y el uso de memoria.

#### 3. SQL Server Profiler

**SQL Server Profiler** es una herramienta poderosa para capturar eventos en SQL Server. Aquí está cómo puedes usarlo para identificar cuellos de botella:

- **Iniciar una nueva traza**:
  1. Abre SQL Server Profiler y selecciona "File" > "New Trace".
  2. Conecta al servidor que deseas monitorear.
  3. Configura las propiedades de la traza, eligiendo los eventos y columnas que quieres capturar, como "SQL:BatchStarting", "SQL:BatchCompleted", y "Showplan XML".
  4. Inicia la traza y observa los eventos en tiempo real. Puedes filtrar y buscar eventos específicos para analizar consultas lentas o problemáticas.

#### 4. Activity Monitor

**Activity Monitor** proporciona una visión rápida del rendimiento de SQL Server. Para usarlo:

- **Abrir Activity Monitor**:
  1. Conecta a tu servidor en SSMS.
  2. Haz clic derecho en el servidor en "Object Explorer" y selecciona "Activity Monitor".
  3. Explora las diversas secciones como "Processes", "Resource Waits", "Data File I/O", y "Recent Expensive Queries".

Cada sección del "Activity Monitor" te brinda datos en tiempo real sobre diferentes aspectos del rendimiento del servidor, permitiéndote identificar rápidamente problemas potenciales.

Estas herramientas son fundamentales para un administrador de SQL Server. Utilizándolas correctamente, puedes monitorear el rendimiento, identificar y solucionar problemas de rendimiento de manera proactiva. Si tienes alguna pregunta específica sobre estas herramientas o necesitas ejemplos más detallados, no dudes en preguntar.

## 902. Estrategias para identificar y resolver cuellos de botella

Identificar y resolver cuellos de botella en SQL Server es crucial para mejorar el rendimiento. Aquí algunas estrategias efectivas:

- **Monitorización del rendimiento**: Usa herramientas como DMVs para identificar operaciones lentas y recursos bajo presión (CPU, memoria, I/O).
- **Análisis de consultas**: Revisa las consultas con tiempos de ejecución prolongados o gran consumo de recursos. Utiliza el Plan de Ejecución para entender cómo SQL Server está ejecutando tus consultas.
- **Indexación eficaz**: Asegúrate de que tus tablas están adecuadamente indexadas para mejorar el rendimiento de las consultas. Los índices faltantes o ineficientes pueden ser cuellos de botella significativos.

**Ejemplo**: Utilizar DMVs para encontrar consultas lentas:

```sql
SELECT TOP 10
    qs.total_elapsed_time / qs.execution_count AS avg_duration,
    qs.execution_count,
    SUBSTRING(qt.text, qs.statement_start_offset / 2 + 1, 
        (CASE WHEN qs.statement_end_offset = -1 
              THEN LEN(CONVERT(nvarchar(max), qt.text)) * 2 
              ELSE qs.statement_end_offset END - qs.statement_start_offset) / 2) AS statement_text
FROM
    sys.dm_exec_query_stats AS qs
CROSS APPLY
    sys.dm_exec_sql_text(qs.sql_handle) AS qt
ORDER BY
    avg_duration DESC;
```

## 903. Ajuste de parámetros avanzados

Ajustar los parámetros de configuración de SQL Server puede tener un impacto significativo en el rendimiento. Algunos parámetros clave incluyen:

- **Max Degree of Parallelism (MAXDOP)**: Limita el número de procesadores que SQL Server utilizará para ejecutar una sola consulta.
- **Cost Threshold for Parallelism**: Define el coste mínimo que una consulta debe tener antes de que SQL Server considere ejecutarla en paralelo.
- **Memory Allocation**: Asegúrate de que SQL Server tiene suficiente memoria asignada, pero no tanto como para que interfiera con las operaciones del sistema operativo.

**Ejemplo**: Configurar el MAXDOP:

```sql
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'max degree of parallelism', 4;
RECONFIGURE;
```

Estas explicaciones y ejemplos deberían proporcionarte una buena base para entender y trabajar con tuning y monitoreo avanzado en SQL Server. Si necesitas más detalles o ejemplos adicionales sobre algún punto específico, házmelo saber.