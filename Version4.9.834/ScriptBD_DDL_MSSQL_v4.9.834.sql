
-- Cambios de DDL version 4.9.832
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

Go




IF   EXISTS (select * from sys.procedures where name  = 'ufn_obtnerCodComprobanteAFIP_v4_9_834') 
BEGIN
	DROP FUNCTION  [dbo].ufn_obtnerCodComprobanteAFIP_v4_9_834
END

GO


sp_helptext 'ufn_obtnerCodComprobanteAFIP_v4_7'
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*  
	select  dbo.ufn_obtnerCodComprobanteAFIP_v4_9_834 ('FA','B')
	select  dbo.ufn_obtnerCodComprobanteAFIP_v4_9_834 ('ND','B')
	select  dbo.ufn_obtnerCodComprobanteAFIP_v4_9_834 ('NC','B')
	select  dbo.ufn_obtnerCodComprobanteAFIP_v4_9_834 ('FA','A')
	select  dbo.ufn_obtnerCodComprobanteAFIP_v4_9_834 ('ND','A')
	select  dbo.ufn_obtnerCodComprobanteAFIP_v4_9_834 ('NC','A')
	select  dbo.ufn_obtnerCodComprobanteAFIP_v4_9_834 ('FA','C')
	select  dbo.ufn_obtnerCodComprobanteAFIP_v4_9_834 ('ND','C')
	select  dbo.ufn_obtnerCodComprobanteAFIP_v4_9_834 ('NC','C')
*/

create function  dbo.ufn_obtnerCodComprobanteAFIP_v1 ( @tpcompprobante char(2), @tpLetra char(1))
RETURNS int
AS
BEGIN
declare  @cod_tipo_comprobante int 

	select  @cod_tipo_comprobante = cod_tipo_comprobante  from tipo_comprobanteAFIP  where  tpComprobante = @tpcompprobante
																		and  tpLetra = @tpLetra
	return @cod_tipo_comprobante

END



