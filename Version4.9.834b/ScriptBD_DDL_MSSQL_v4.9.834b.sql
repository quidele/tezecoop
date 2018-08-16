
-- Cambios de DDL version 4.9.834b
use dbSG2000
go

-- Agregamos el campo nro_trans en  TB_Comprobantes
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_Comprobantes'  and  c.Name = 'nrCAE' )
	ALTER TABLE dbo.TB_Comprobantes ADD  nrCAE varchar(15)

GO


-- Agregamos el campo nro_trans en  TB_Comprobantes
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_Comprobantes'  and  c.Name = 'dtVencimientoCAE' )
	ALTER TABLE dbo.TB_Comprobantes ADD  dtVencimientoCAE varchar(15)


GO

