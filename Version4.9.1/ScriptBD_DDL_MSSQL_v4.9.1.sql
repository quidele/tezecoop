-- Cambios de DDL version 4.9.1
use dbSG2000
go



if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='nrCuponPosnet')
	ALTER TABLE dbo.TB_Cupones ADD  nrCuponPosnet nchar(25) NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='nrCuponPosnet')
	ALTER TABLE dbo.TB_Comprobantes ADD  nrCuponPosnet nchar(25) NULL;

go


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_AnularRecibo_v4_9_1' )
	drop procedure  dbo.SP_AnularRecibo_v4_9_1
go


-- sp_help 'TB_RecibosDetalle'

go

/************************************************/
/*      Modificado para la version 3.7          */
create procedure [dbo].SP_AnularRecibo_v4_9_1
@idReciboParam       			as numeric,
@dsUsuario_param     			as Varchar(50),
@dsUsuario_Supervisor_param     as Varchar(50)=null
as
declare @nrCajaRecibo  numeric
declare @strError      varchar(400)
declare @tpRecibo      varchar(100)
declare @flAnulado     bit 

	select @flAnulado=0

	select @nrCajaRecibo=nrCaja, @tpRecibo=tpRecibo, @flAnulado=flAnulado from TB_Recibos 
	where IdRecibo=@IdReciboParam

	if @flAnulado=1
	begin
		select @strError='El recibo '+ convert(varchar,@IdReciboParam)+' ya se encuentra anulado.'
		raiserror (@strError,16,1)
		return -1
	end
		
	-- verificamos  que la caja no haya sido cerrada
	if not exists(select * from  TB_Cajas 
		      where nrCaja=@nrCajaRecibo 
			    and flCajaAdm=1 and flEstado=0) 
	begin
		select @strError='El recibo '+ convert(varchar,@IdReciboParam)+' no puede anularse ya que la caja que lo creo está cerrada.'
		raiserror (@strError,16,1)
		return -1
	end 


	if @tpRecibo='Detalle de Cobro a Cta. Cte.' 
	begin
		select @strError='No se puede anular un recibo de Detalle de Cobro a Cta. Cte. este recibo se anula en caso de que usted anule la factura que lo generó.'
		raiserror (@strError,16,1)
		return -1
	end 

	-- Solo anulamos recibos 'Detalle de Pago a Licenciatario' 

	-- se copian los detalles
	insert into TB_RecibosDetalle 
		(nrCupon,
		cdCliente,
		nrPuesto,
		nrLicencia,
		nmLicenciatario,
		tpCupon,
		vlMontoCupon,
		vlaFavordelLicenciatario,
		vlafavorAdmin,
		vlPagoPesos, 
		vlPagoEuros,
		vlPagoDolares, 
		vlPagoReales,
		vlComision,
		nrCantidadBultos, 
		nrPasajeros,
		dtCupon,
		nrTalonarioCliente,
		nrComprabanteCliente,
		tpComprobanteCliente, 
		tpLetraCliente,
		flCobradoalCliente, 
		dtCobradoalCliente, 
		nrCajaCliente, 
		dtCajaCliente, 
		nrTalonarioProveedor, 
		nrComprabanteProveedor, 
		tpComprobanteProveedor, 
		tpLetraLetraProveedor, 
		flCompensado, 
		dtCompensado, 
		nrCajaLicenciatario, 
		dtCajaLicenciatario, 
		dsUsuario, 
		nrLiquidacionProveedores,
		nrLiquidacionCliente,
		cdCodBar, 
		flAnulado, 
		dtAnulado, 
		IdRecibo, 
		IdReciboCtaCte, 
		dsObservacion, 
		dsDestino, 
		dsHoraViaje,
		vlSubtotal,
		vlIVA,
		vlRecargoTarjeta )
	select  nrCupon, 
		cdCliente, 
		nrPuesto, 
		nrLicencia, 
		nmLicenciatario, 
		tpCupon, 
		vlMontoCupon, 
		vlaFavordelLicenciatario, 
		vlafavorAdmin, 
		vlPagoPesos, 
		vlPagoEuros, 
		vlPagoDolares,
	    vlPagoReales, 
		vlComision, 
		nrCantidadBultos, 
		nrPasajeros, 
		dtCupon, 
		nrTalonarioCliente, 
		nrComprabanteCliente, 
		tpComprobanteCliente, 
		tpLetraCliente, 
		flCobradoalCliente, 
		dtCobradoalCliente, 
		nrCajaCliente, 
		dtCajaCliente, 
		nrTalonarioProveedor, 
		nrComprabanteProveedor,            
		tpComprobanteProveedor, 
		tpLetraLetraProveedor, 
		flCompensado, 
		dtCompensado, 
		nrCajaLicenciatario, 
		dtCajaLicenciatario, 
		dsUsuario, 
		nrLiquidacionProveedores, 
		nrLiquidacionCliente, 
		cdCodBar, 
		flAnulado, 
		dtAnulado, 
		IdRecibo, 
		IdReciboCtaCte, 
		dsObservacion, 
		dsDestino, 
		dsHoraViaje,
		vlSubtotal,
		vlIVA,
		vlRecargoTarjeta
	from TB_Cupones 
	where IdRecibo=@IdReciboParam

	if @@rowcount=0 
	begin
		select @strError='El recibo '+ convert(varchar,@IdReciboParam)+' no puede anularse ya que presenta información inconsistente.'
		raiserror (@strError,16,1)
		return -1
	end 
	
	-- se ponen a nulo los comprobantes o cupones compensados
	update TB_Cupones
	set idRecibo=null,
	vlPagoDolares=0,
	vlPagoEuros=0,
	vlPagoPesos=0,
	flCompensado=0,
	flCobradoalCliente=0,
	dtCobradoalCliente=null,
	dtCompensado=null,
	nrCajaLicenciatario=null,
	dtCajaLicenciatario=null, 
	dsUsuario=@dsUsuario_param
	where IdRecibo=@IdReciboParam and 
	      tpCupon in ('Cobro en Destino', 'Retorno')

	-- se ponen a nulo los comprobantes o cupones compenados
	update TB_Cupones
	set idRecibo=null,
	vlPagoDolares=0,
	vlPagoEuros=0,
	vlPagoPesos=0,
	flCompensado=0,
	dtCompensado=null,
	nrCajaLicenciatario=null,
	dtCajaLicenciatario=null, 
	dsUsuario=@dsUsuario_param
	where IdRecibo=@IdReciboParam and 
	      tpCupon in ('Cuenta Corriente', 'Tarjeta de Crédito', 'Tarjeta de Débito')

	update TB_Cupones
	set idRecibo=null,
	flCompensado=0,
	dtCompensado=null,
	nrCajaLicenciatario=null,
	dtCajaLicenciatario=null, 
	dsUsuario=@dsUsuario_param
	where IdRecibo=@IdReciboParam and 
	      tpCupon in ('Contado')

	-- eliminar los movimentos contables en dicha caja
	delete from TB_MovimientosContables
	where IdRecibo=@IdReciboParam
	
	-- actualizar el flag anulado del recibo
	update TB_Recibos
	set flAnulado=1,
	    dsUsuario=@dsUsuario_param,
	    dsUsuario_Supervisor=@dsUsuario_Supervisor_param
	where IdRecibo=@IdReciboParam
