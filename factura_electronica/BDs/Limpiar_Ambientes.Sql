USE [FacturaElectronica]
gO

ALTER PROCEDURE spu_limpiarAmbiente
AS
BEGIN

	return

	TRUNCATE TABLE [dbo].[detalle_iva]
	TRUNCATE TABLE [dbo].[detalle]
	TRUNCATE TABLE [dbo].[detalle_tributos]
	TRUNCATE TABLE [dbo].[cbtesasoc]
	TRUNCATE TABLE [dbo].[detalle_tributos]
	DELETE x FROM  [dbo].[comprobantes_ml] x 
	DELETE x FROM  [dbo].[lote] x 

END