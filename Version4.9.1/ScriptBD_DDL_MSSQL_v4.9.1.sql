-- Cambios de DDL version 4.9.1
use dbSG2000
go



if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='nrCuponPosnet')
	ALTER TABLE dbo.TB_Cupones ADD  nrCuponPosnet nchar(25) NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='nrCuponPosnet')
	ALTER TABLE dbo.TB_Comprobantes ADD  nrCuponPosnet nchar(25) NULL;





if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_PrepararReimpresiondeComprobante_v4_9' )
	drop procedure  dbo.SP_PrepararReimpresiondeComprobante_v4_9
go


create procedure   dbo.SP_PrepararReimpresiondeComprobante_v4_9 (@nrCajaAdmActual decimal(12,0))
as
begin	

	select  tpComprobante , tpLetra ,  nrTalonario , nrComprobante  from tb_comprobantes  where nrCaja =  @nrCajaAdmActual and
	cdCondVenta like 'Tarjeta%' 
	and (isnull(nrDocTarjeta,'')='' or isnull(tpDocTarjeta,'') ='' or isnull(nrCuponPosnet,'')='' or  isnull(nrTarjeta,'') ='')

	if @
	select 'SI' as resultado

	select 'SI' as resultado


end