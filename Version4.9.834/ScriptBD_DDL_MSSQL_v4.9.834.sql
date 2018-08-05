
-- Cambios de DDL version 4.9.834
use dbSG2000
go

-- Agregamos el campo nro_trans en  TB_Comprobantes
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_Comprobantes'  and  c.Name = 'nro_trans' )
	ALTER TABLE dbo.TB_Comprobantes ADD  nro_trans int NULL

GO

-- Agregamos el campo estado_registro en  TB_ComprobantesDetalle
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_ComprobantesDetalle'  and  c.Name = 'nro_trans' )
	ALTER TABLE dbo.TB_ComprobantesDetalle ADD  nro_trans int NULL
	-- ALTER TABLE dbo.TB_ObligacionesCuotas ALTER COLUMN 	estado_registro char(20) NULL
GO



IF   EXISTS (select * from sys.procedures where name  = 'SP_ObtenerProximoValorNumerador') 
BEGIN
	DROP PROCEDURE  [dbo].[SP_ObtenerProximoValorNumerador]
END
GO
--- EXEC [dbo].[SP_ObtenerProximoValorNumerador] @numerador='nro_trans'
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[SP_ObtenerProximoValorNumerador](@numerador varchar(20))  
AS
BEGIN

DECLARE   @resultado NUMERIC;

	BEGIN TRAN

	SELECT @resultado = isnull(max(valor_asignado), 1)  
		FROM TB_numeradores WHERE numerador = @numerador 

	SET @resultado = @resultado + 1;

	UPDATE  x SET x.valor_asignado = @resultado
		FROM TB_numeradores x WHERE numerador = @numerador 
	
	SELECT @resultado as valor_asignado

	COMMIT TRAN

	RETURN; 

END

GO

