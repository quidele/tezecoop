-- Cambios de DDL version 4.9.1
use dbSG2000
go



if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='nrCuponPosnet')
	ALTER TABLE dbo.TB_Cupones ADD  nrCuponPosnet nchar(25) NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='nrCuponPosnet')
	ALTER TABLE dbo.TB_Comprobantes ADD  nrCuponPosnet nchar(25) NULL;


go


go


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*************************************************************/
/* creado en la version 4.9									 */
/* Falta terminar este store							     */
alter PROCEDURE [dbo].[SP_rpt_PagoLicenciatario_v4_9] @IdRecibo_param numeric
AS
begin

declare @flAnulado int

set dateformat dmy

	select @flAnulado=0

	select * into  #tmp_recibos
	from   TB_Recibos
	where  IdRecibo = @IdRecibo_param


        select  @flAnulado=flAnulado  from #tmp_recibos  where  IdRecibo = @IdRecibo_param

	if @flAnulado=0
		select  b.dsDestino,
	            b.nrLicencia,
	            b.nmLicenciatario,
	            b.vlPagoPesos,
	            b.vlPagoEuros,
	            b.vlPagoDolares,
	            isnull(b.vlPagoReales,0) as vlPagoReales,
		        b.vlComision,
	            Convert(varchar,b.dtCupon,103) as dtCupon,
		        b.dsHoraViaje,
	            b.vlComision + isnull(b.vlIVA,0) + isnull(b.vlRecargoTarjeta,0) as vlRetencion,
	            b.vlIVA,
	            b.nrTalonarioCliente,
	            b.nrComprabanteCliente,
	            a.IdRecibo,
	            a.vlAcumDolares,
	            a.vlSaldoPesos,
	            a.vlSaldoEuros,
	            a.vlAcumPesos,
	            a.vlAcumEuros,
	            a.vlAcumComision,
	            a.vlSaldoDolares,
	            Convert(varchar,a.dtRecibo,103) +' '+
	            Convert(varchar,a.dtRecibo,108) as  dtRecibo,
		        a.flAnulado,
				b.tpCupon,
				b.vlRecargoTarjeta
		from #tmp_recibos a, TB_Cupones b
		WHERE
		       a.IdRecibo = @IdRecibo_param and
		       b.IdRecibo = a.IdRecibo

	else
		select  
	            b.dsDestino,
	            b.nrLicencia,
	            b.nmLicenciatario,
	            b.vlPagoPesos,
	            b.vlPagoEuros,
	            b.vlPagoDolares,
	            isnull(b.vlPagoReales,0) as vlPagoReales,
	            b.vlComision,
	            b.nrTalonarioCliente,
	            b.nrComprabanteCliente,
	            b.vlComision +isnull(b.vlIVA,0)  + isnull(b.vlRecargoTarjeta,0)   as vlRetencion,
	            b.vlIVA,
	            Convert(varchar,b.dtCupon,103) as dtCupon,
		       b.dsHoraViaje,
	            c.IdRecibo,
	            c.vlAcumDolares,
	            c.vlSaldoPesos,
	            c.vlSaldoEuros,
	            c.vlAcumPesos,
	            c.vlAcumEuros,
	            c.vlAcumComision,
	            c.vlSaldoDolares,
	            Convert(varchar,c.dtRecibo,103)+' '+
	            Convert(varchar,c.dtRecibo,108) as  dtRecibo,
				c.flAnulado,
				b.tpCupon,
				b.vlRecargoTarjeta
		from  #tmp_recibos c, TB_RecibosDetalle b
		WHERE
		    c.IdRecibo = @IdRecibo_param and
		    b.IdRecibo = c.IdRecibo 


	
end

go




	


