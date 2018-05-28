
-- Cambios de DDL version 4.9.832
use dbSG2000
go


-- Modificamos la definicion del campo  nrLicencia
ALTER TABLE TB_ObligacionesTitulares ALTER COLUMN nrLicencia int;

-- Corregimos la definicion del campo 
ALTER TABLE TB_transCab ALTER COLUMN estado_registro char(2);



-- Agregamos el campo estado_registro en  TB_ObligacionesCuotas
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_ObligacionesCuotas'  and  c.Name = 'estado_registro' )
	ALTER TABLE dbo.TB_ObligacionesCuotas ADD 	estado_registro char(2) NULL

GO


-- Agregamos el campo nro_trans 
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_ObligacionesTitulares'  and  c.Name = 'estado_registro' )
	ALTER TABLE dbo.TB_ObligacionesTitulares ADD 	estado_registro char(2) NULL


-- Modificamos la definicion del campo  nrLicencia
ALTER TABLE TB_ObligacionesCuotas ALTER COLUMN nrLicencia int;
	