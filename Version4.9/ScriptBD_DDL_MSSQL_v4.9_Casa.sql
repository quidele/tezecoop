-- Cambios de DDL version 4.9
use dbSG2000
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_RecibosDetalle' and COLUMN_NAME='vlRecargoTarjeta')
	ALTER TABLE dbo.TB_RecibosDetalle ADD  vlRecargoTarjeta [float] NULL;

go
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Recibos' and COLUMN_NAME='vlAcumTarjeta')
	ALTER TABLE dbo.TB_Recibos ADD  vlAcumTarjeta [float] NULL;
go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_rpt_PagoLicenciatario_v4_9' )
	drop procedure  dbo.SP_rpt_PagoLicenciatario_v4_9

go


---exec [dbo].[SP_rpt_PagoLicenciatario_v4_9] @IdRecibo_param =  16

go
/*************************************************************/
/* creado en la version 4.9									 */
/* Falta terminar este store							     */
CREATE PROCEDURE [dbo].[SP_rpt_PagoLicenciatario_v4_9] @IdRecibo_param numeric
AS
declare @flAnulado int

set dateformat dmy

	select @flAnulado=0

	select * into  #tmp_recibos
	from   TB_Recibos
	where  IdRecibo = @IdRecibo_param


        select  @flAnulado=flAnulado  from #tmp_recibos  where  IdRecibo = @IdRecibo_param

	if @flAnulado=0
		select  TB_Cupones.dsDestino,
	            TB_Cupones.nrLicencia,
	            TB_Cupones.nmLicenciatario,
	            TB_Cupones.vlPagoPesos,
	            TB_Cupones.vlPagoEuros,
	            TB_Cupones.vlPagoDolares,
	            isnull(TB_Cupones.vlPagoReales,0) as vlPagoReales,
		        TB_Cupones.vlComision,
	            Convert(varchar,TB_Cupones.dtCupon,103) as dtCupon,
		        TB_Cupones.dsHoraViaje,
	            TB_Cupones.vlComision + isnull(TB_Cupones.vlIVA,0) + isnull(TB_Cupones.vlRecargoTarjeta,0) as vlRetencion,
	            TB_Cupones.vlIVA,
	            TB_Cupones.nrTalonarioCliente,
	            TB_Cupones.nrComprabanteCliente,
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
		        a.flAnulado
		from #tmp_recibos a, TB_Cupones
		WHERE
		       a.IdRecibo = @IdRecibo_param and
		       TB_Cupones.IdRecibo = a.IdRecibo

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
		        c.flAnulado  
		from  #tmp_recibos c, TB_RecibosDetalle b
		WHERE
		    c.IdRecibo = @IdRecibo_param and
		    b.IdRecibo = c.IdRecibo 


	

