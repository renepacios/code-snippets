
/*
  View Index Fragmentation - 08.2021
  
  Notes:
    - Azure SQL Mantenance Store Procedure Script: https://raw.githubusercontent.com/yochananrachamim/AzureSQL/master/AzureSQLMaintenance.txt 

*/


SELECT
OBJECT_SCHEMA_NAME(ips.OBJECT_ID) 'Schema',
OBJECT_NAME(ips.OBJECT_ID) 'Table',
i.NAME,
ips.index_id,
index_type_desc,
avg_fragmentation_in_percent,
avg_page_space_used_in_percent,
page_count
FROM
sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'SAMPLED') ips
INNER JOIN
sys.indexes i
ON (ips.object_id = i.object_id)
AND
(
ips.index_id = i.index_id
)
-- where OBJECT_NAME(ips.OBJECT_ID) in ('Persona','Usuario')
ORDER BY
avg_fragmentation_in_percent DESC