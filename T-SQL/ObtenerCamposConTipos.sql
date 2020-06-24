SELECT 
      table_id    = c.object_id,
      table_name  = OBJECT_NAME(c.object_id),
      column_id   = c.column_id,
      column_name = c.name,
      column_type = 
            CASE WHEN t.system_type_id IN (167,175,231,239) THEN 
                  t.name + ' (' + CAST(c.max_length AS VARCHAR) + ')'
            ELSE 
                  t.name
            END,
      primary_key =
            (
                  SELECT COUNT(*)
                  FROM       sys.key_constraints k
                  INNER JOIN sys.index_columns  ic ON  ic.object_id = k.parent_object_id
                                                                 AND ic.index_id  = k.unique_index_id
                  INNER JOIN sys.columns         c1 ON   c1.object_id = k.parent_object_id
                                                                 AND  c1.column_id = ic.column_id
                  WHERE  c1.object_id = c.object_id
                  AND      c1.column_id = c.column_id
                  AND    k.type = 'PK'
            ),
      foreign_key = 
            (
                  SELECT COUNT(*)
                  FROM       sys.foreign_keys        f
                  INNER JOIN sys.foreign_key_columns k  ON  k.constraint_object_id = f.object_id
                  INNER JOIN sys.indexes             i  ON  f.referenced_object_id = i.object_id              
                                                                         AND f.key_index_id = i.index_id
                  INNER JOIN sys.columns                c1 ON   c1.object_id = f.parent_object_id
                                                                AND  c1.column_id = k.parent_column_id
                  WHERE f.type = 'F'
                  AND   c1.object_id = c.object_id
                  AND     c1.column_id = c.column_id
            ),
      indexed = 
            (
                  SELECT COUNT(*)
                  FROM       sys.indexes        i  
                  INNER JOIN sys.index_columns ic  ON i.index_id = ic.index_id 
                                                                 AND i.object_id = ic.object_id 
                  INNER JOIN sys.columns       c1  ON ic.column_id = c1.column_id 
                                                                 AND ic.object_id = c1.object_id
                  WHERE i.object_id = c.object_id
                  AND   c1.column_id =c.column_id
            ),
      is_nullable = c.is_nullable,
      description = 
            (
                  SELECT TOP 1 value  
                  FROM  sys.extended_properties  
                  WHERE major_id = c.object_id
                  AND minor_id = c.column_id
                  AND name = 'MS_Description'  
            ), is_identity
FROM       sys.columns c
INNER JOIN sys.types   t ON c.system_type_id = t.system_type_id
where  OBJECT_NAME(c.object_id) not like 'sys%' and OBJECT_NAME(c.object_id) not like '%!_%' escape '!'
ORDER BY OBJECT_NAME(c.object_id)
