


SELECT OBJECT_NAME(A.[OBJECT_ID]) AS [OBJECTNAME],
       I.[NAME] AS [INDEX NAME],
       a.*,
       i.*
FROM   SYS.dm_db_index_usage_stats  A
       INNER JOIN SYS.INDEXES AS I
         ON I.[OBJECT_ID] = A.[OBJECT_ID]
            AND I.INDEX_ID = A.INDEX_ID
WHERE  OBJECTPROPERTY(A.[OBJECT_ID],'IsUserTable') = 1 and 
OBJECT_NAME(A.[OBJECT_ID]) in ('tb_cupones')
and a.user_seeks = 0 and user_scans = 0  and user_lookups = 0