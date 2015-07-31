-- cambios de DDL version 1.5
use dbSG2000_pruebas
go


-- Campos para el calculo del IVA
ALTER TABLE [dbo].[tb_Cupones] ADD 
	vlSubtotal  [float] NULL,
	vlIVA  [float] NULL;


go

/*******************************************************************/
/* Modificado en la version 1.5					   */
alter procedure rpt_cierredecaja_v1
@nrCaja_param  numeric
as

declare @Cantidad_Viajes           int
declare @Cantidad_Facturas         int
declare @Cantidad_Facturas_A       int
declare @cantidad_cta_cte          int
declare @Cantidad_Anuladas         int 
declare @Cantidad_Contado          int 
declare @Cantidad_Retorno          int
declare @Cantidad_Cobro_en_Destino int
declare @nro_factura_inicial       varchar(12)
declare @nro_factura_final         varchar(12)
declare @nro_factura_inicial_A     varchar(12)
declare @nro_factura_final_A       varchar(12)
declare @nro_Recibo_inicial        varchar(12)
declare @nro_Recibo_final          varchar(12)
declare @nro_factura_manual_inicial       varchar(12)
declare @nro_factura_manual_final         varchar(12)
declare @nro_factura_manual_inicial_A     varchar(12)
declare @nro_factura_manual_final_A       varchar(12)
declare @nro_Recibo_manual_inicial        varchar(12)
declare @nro_Recibo_manual_final          varchar(12)



	SET @Cantidad_Viajes           = 0
	SET @Cantidad_Facturas         = 0
	SET @Cantidad_Facturas_A       = 0
	SET @cantidad_cta_cte          = 0
	SET @Cantidad_Anuladas         = 0 
	SET @Cantidad_Contado          = 0 
	SET @Cantidad_Retorno          = 0
	SET @Cantidad_Cobro_en_Destino = 0
	SET @nro_factura_inicial       = 0
	SET @nro_factura_final         = 0
	SET @nro_factura_inicial_A     = 0
	SET @nro_factura_final_A       = 0
	SET @nro_Recibo_inicial        = 0
	SET @nro_Recibo_final          = 0
	

	select  a.nrCaja,
		a.nrPuesto,
		a.dsUsuario,
		a.dtApertura,
		a.dtCierre,
		convert(varchar(5),a.dtApertura,108) as hrApertura,
		a.hrCierre, 
		a.flEstado,
		a.flCajaAdm,
		a.vlSaldoInicialPesos,
		a.vlSaldoInicialEuros,
		a.vlDiaDolar,
		a.vlDiaEuro, 
		a.vlSaldoFinalPesos,
		a.vlSaldoInicialDolares,
		a.vlSaldoFinalDolares,
		a.vlSaldoFinalEuros, 
		a.vlSaldoFinalRealPesos,
		a.vlSaldoFinalRealEuros,
		a.vlSaldoFinalRealDolares,
		a.vlCierrePesos, 
		a.vlCierreDolares,
		a.vlCierreEuros,
		a.vlTotalSaldoFinalReal,
		a.vlTotalSaldoFinal,
		a.vlTotalSaldoInicial, 
		a.vlTotalSaldoCierre,
		a.dsDiferenciaDeCierre,
		a.vlDiferenciaDeCierre,
		a.dsObservacion, 
		a.dtObservacion,
		@Cantidad_Viajes   as 'Cantidad_Viajes' ,
		@Cantidad_Contado  as 'Cantidad_Contado',
		@Cantidad_cta_cte  as 'Cantidad_cta_cte',
		@Cantidad_Retorno  as 'Cantidad_Retorno',   
		@Cantidad_Anuladas as 'Cantidad_Anuladas',
		@Cantidad_Cobro_en_Destino as 'Cantidad_Cobro_en_Destino',
		isnull(b.nmNombre,'')+' '+isnull(b.nmApellido,'') as 'Nombre_Cajera', 
		c.dsPuesto	 as 'Descripcion_Puesto',
		@nro_factura_inicial       	as 'nro_factura_inicial',
		@nro_factura_final         	as 'nro_factura_final',
		@nro_factura_inicial_A     	as 'nro_factura_inicial_A',
		@nro_factura_final_A       	as 'nro_factura_final_A',
		@nro_Recibo_inicial        	as 'nro_Recibo_inicial',
		@nro_Recibo_final          	as 'nro_Recibo_final',
		@nro_factura_manual_inicial     as 'nro_factura_manual_inicial',
		@nro_factura_manual_final       as 'nro_factura_manual_final'  ,
		@nro_factura_manual_inicial_A   as 'nro_factura_manual_inicial_A' ,
		@nro_factura_manual_final_A     as 'nro_factura_manual_final_A',
		@nro_Recibo_manual_inicial      as 'nro_Recibo_manual_inicial',
		@nro_Recibo_manual_final        as 'nro_Recibo_manual_final'

	into #Resumen_Caja_Puesto
	from         TB_Cajas a, TB_usuarios b, TB_Puestos c
	where   (a.nrCaja = @nrCaja_param) and 
		 a.dsUsuario=b.dsUsuario   and 
		 a.nrPuesto = c.nrPuesto 
		   

	select @Cantidad_Viajes=count(*) 
	from   TB_Comprobantes 
	where  flAnulado=0 and nrCaja=@nrCaja_param
	

	select @Cantidad_Contado=count(*) 
	from   TB_Comprobantes 
	where  flAnulado=0 and nrCaja=@nrCaja_param and 
	       cdCondVenta='Contado'

	select @Cantidad_cta_cte=count(*) 
	from   TB_Comprobantes 
	where  flAnulado=0 and nrCaja=@nrCaja_param and 
	       cdCondVenta='Cuenta Corriente'

	select @Cantidad_Retorno=count(*) 
	from   TB_Comprobantes 
	where  flAnulado=0 and nrCaja=@nrCaja_param and
	       cdCondVenta='Retorno'

	select @Cantidad_Cobro_en_Destino=count(*) 
	from   TB_Comprobantes 
	where  flAnulado=0 and nrCaja=@nrCaja_param and
	       cdCondVenta='Cobro en Destino'

	select @Cantidad_Anuladas=count(*) 
	from   TB_Comprobantes 
	where  flAnulado=1 and nrCaja=@nrCaja_param 

	select @nro_factura_inicial=min(convert(numeric,nrComprobante)),
	       @nro_factura_final=max(convert(numeric,nrComprobante))
	from   TB_Comprobantes 
	where  nrCaja=@nrCaja_param and
	       tpLetra='B' and flManual='N'


	select @nro_factura_inicial_A=min(convert(numeric,nrComprobante)),
	       @nro_factura_final_A=max(convert(numeric,nrComprobante))
	from   TB_Comprobantes 
	where  nrCaja=@nrCaja_param and
	       tpLetra='A'  and flManual='N'

	select @nro_Recibo_inicial=min(convert(numeric,nrComprobante)),
	       @nro_Recibo_final=max(convert(numeric,nrComprobante))
	from   TB_Comprobantes 
	where  nrCaja=@nrCaja_param and
	       tpLetra='X'  and flManual='N'
	
	-------------------------------------------------------------------
	--- inicio talonario manual ---
	select @nro_factura_manual_inicial=min(convert(numeric,nrComprobante)),
	       @nro_factura_manual_final=max(convert(numeric,nrComprobante))
	from   TB_Comprobantes 
	where  nrCaja=@nrCaja_param and
	       tpLetra='B' and flManual='M'

	select @nro_factura_manual_inicial_A=min(convert(numeric,nrComprobante)),
	       @nro_factura_manual_final_A=max(convert(numeric,nrComprobante))
	from   TB_Comprobantes 
	where  nrCaja=@nrCaja_param and
	       tpLetra='A'  and flManual='M'

	select @nro_Recibo_manual_inicial=min(convert(numeric,nrComprobante)),
	       @nro_Recibo_manual_final=max(convert(numeric,nrComprobante))
	from   TB_Comprobantes 
	where  nrCaja=@nrCaja_param and
	       tpLetra='X'  and flManual='M'
	--- fin talonario manual ---


	select @nro_factura_inicial=isnull(@nro_factura_inicial,'--')
	select @nro_factura_final=isnull(@nro_factura_final,'--')
	select @nro_Recibo_inicial=isnull(@nro_Recibo_inicial,'--')
	select @nro_Recibo_final=isnull(@nro_Recibo_final,'--')
	select @nro_factura_inicial_A =isnull(@nro_factura_inicial_A,'--')
	select @nro_factura_final_A   =isnull(@nro_factura_final_A,'--')

	select @nro_factura_manual_inicial=isnull(@nro_factura_manual_inicial,'--')
	select @nro_factura_manual_final=isnull(@nro_factura_manual_final,'--')
	select @nro_Recibo_manual_inicial=isnull(@nro_Recibo_manual_inicial,'--')
	select @nro_Recibo_manual_final=isnull(@nro_Recibo_manual_final,'--')
	select @nro_factura_manual_inicial_A =isnull(@nro_factura_manual_inicial_A,'--')
	select @nro_factura_manual_final_A   =isnull(@nro_factura_manual_final_A,'--')

	update	#Resumen_Caja_Puesto
	set   Cantidad_Viajes   = @Cantidad_Viajes,
	      Cantidad_Contado  = @Cantidad_Contado,
	      Cantidad_cta_cte  = @Cantidad_cta_cte,
	      Cantidad_Retorno  = @Cantidad_Retorno,   
	      Cantidad_Anuladas = @Cantidad_Anuladas,
	      Cantidad_Cobro_en_Destino=@Cantidad_Cobro_en_Destino,
	      nro_factura_inicial=@nro_factura_inicial,
	      nro_factura_final=@nro_factura_final,
	      nro_factura_inicial_A=@nro_factura_inicial_A,
	      nro_factura_final_A=@nro_factura_final_A,
	      nro_Recibo_inicial=@nro_Recibo_inicial,
	      nro_Recibo_final=@nro_Recibo_final,
	      nro_factura_manual_inicial=@nro_factura_manual_inicial,
	      nro_factura_manual_final=@nro_factura_manual_final,
	      nro_Recibo_manual_inicial=@nro_Recibo_manual_inicial,
	      nro_Recibo_manual_final=@nro_Recibo_manual_final,
	      nro_factura_manual_inicial_A =@nro_factura_manual_inicial_A,
	      nro_factura_manual_final_A   =@nro_factura_manual_final_A
	where nrcaja = @nrCaja_param

	select * from #Resumen_Caja_Puesto



go



-- Campos para el calculo del IVA
ALTER TABLE [dbo].[TB_RecibosDetalle] ADD 
	vlSubtotal  [float] NULL,
	vlIVA  [float] NULL;


GO


/***********************************************/
/*      Modificado para la version 1.5          */
create procedure SP_AnularRecibo_v1_5
@idReciboParam       		as numeric,
@dsUsuario_param     		as Varchar(50),
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
		vlIVA)
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
		vlIVA
	from TB_Cupones 
	where IdRecibo=@IdReciboParam

	if @@rowcount=0 
	begin
		select @strError='El recibo '+ convert(varchar,@IdReciboParam)+' no puede anularse ya que presenta información inconsistente.'
		raiserror (@strError,16,1)
		return -1
	end 
	
	-- se ponen a nulo los comprobantes o cupones compenados
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

GO





/*************************************************************/
/* creado en la version 1.5				     */
/* Falta terminar este store				     */
create  PROCEDURE [SP_rpt_PagoLicenciatario_v1_5] @IdRecibo_param numeric
AS
declare @flAnulado int

set dateformat dmy

	select @flAnulado=0

	select @flAnulado=flAnulado 
	from   TB_Recibos
	where  IdRecibo = @IdRecibo_param

	if @flAnulado=0
		select  TB_Cupones.dsDestino,
	            TB_Cupones.nrLicencia,
	            TB_Cupones.nmLicenciatario,
	            TB_Cupones.vlPagoPesos,
	            TB_Cupones.vlPagoEuros,
	            TB_Cupones.vlPagoDolares,
		    TB_Cupones.vlComision,
	            Convert(varchar,TB_Cupones.dtCupon,103) as dtCupon,
		    TB_Cupones.dsHoraViaje,
	            TB_Cupones.vlComision + TB_Cupones.vlIVA as vlRetencion,
	            TB_Cupones.vlIVA,
	            TB_Cupones.nrTalonarioCliente,
	            TB_Cupones.nrComprabanteCliente,
	            TB_Recibos.IdRecibo,
	            TB_Recibos.vlAcumDolares,
	            TB_Recibos.vlSaldoPesos,
	            TB_Recibos.vlSaldoEuros,
	            TB_Recibos.vlAcumPesos,
	            TB_Recibos.vlAcumEuros,
	            TB_Recibos.vlAcumComision,
	            TB_Recibos.vlSaldoDolares,
	            Convert(varchar,TB_Recibos.dtRecibo,103) +' '+
	            Convert(varchar,TB_Recibos.dtRecibo,108) as  dtRecibo,
		    TB_Recibos.flAnulado
		from TB_Cupones, TB_Recibos
		WHERE
		    TB_Cupones.IdRecibo = TB_Recibos.IdRecibo and
		    TB_Cupones.IdRecibo = @IdRecibo_param
		ORDER BY
		    TB_Recibos.IdRecibo ASC
	else
		select  
	            b.dsDestino,
	            b.nrLicencia,
	            b.nmLicenciatario,
	            b.vlPagoPesos,
	            b.vlPagoEuros,
	            b.vlPagoDolares,
	            b.vlComision,
	            b.nrTalonarioCliente,
	            b.nrComprabanteCliente,
	            b.vlComision + b.vlIVA as vlRetencion,
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
		from  TB_RecibosDetalle b, TB_Recibos c
		WHERE
		    b.IdRecibo = c.IdRecibo and
		    b.IdRecibo = @IdRecibo_param
		ORDER BY
		    c.IdRecibo ASC

	
	
go
	
	

/*******************************************/
create PROCEDURE SP_ObtenerIVAVentas_v1_5
@nrMes_param	     int,	
@nrAnio_param	     int,
@nrTalonario_param   int=null,
@tpComprobante_param char(1)=null,
@tpFacturacion_param char(1)=null 
as
declare @descri_tipo_fac varchar(50)

	If @tpFacturacion_param = 'M' 
	        select @descri_tipo_fac='Facturado manualmente'
        else
		select @descri_tipo_fac='Facturado por sistema'



	SELECT a.dtComprobante Fecha, 
	       a.dsRazonSocial 'Cliente',
               'Factura' 'Tipo de Comprobante', 
	       a.tpComprobante 'Letra', 
	       a.nrTalonario Talonario,
	       a.nrComprobante Comprobante, 
	       a.nrDoc 'CUIT',
	       a.tpIVA 'CondicionIVA',	               
	       a.vlTotalGeneral Importe,
               b.dsDestino Destino,
	       a.vlIVA as IVA	
	FROM TB_Comprobantes a, TB_Cupones b
	where
	    a.nrComprobante =  b.nrComprabanteCliente and 
	    a.nrTalonario =  b.nrTalonarioCliente  and 
	    a.tpComprobante =  b.tpComprobanteCliente  and 
	    a.tpLetra =  b.tpLetraCliente and
	    a.flAnulado = 0 and
	    month(a.dtComprobante) = @nrMes_param and 
	    year(a.dtComprobante) = @nrAnio_param and
	    (convert(int,replace(@nrTalonario_param,'.',''))=@nrTalonario_param
	     or @nrTalonario_param is null) and
	    (a.tpComprobante=@tpComprobante_param or @tpComprobante_param is null) and
	    (a.flManual=@tpFacturacion_param or @tpFacturacion_param is null ) and
	    a.vlIva>0
	order by
	  convert(numeric,a.nrComprobante) asc 



go 


/*************************************************************/
/* creado en la version 1.5				     */
/* Falta terminar este store				     */
alter  PROCEDURE [SP_rpt_PagoLicenciatario_v1_5] @IdRecibo_param numeric
AS
declare @flAnulado int

set dateformat dmy

	select @flAnulado=0

	select @flAnulado=flAnulado 
	from   TB_Recibos
	where  IdRecibo = @IdRecibo_param

	if @flAnulado=0
		select  TB_Cupones.dsDestino,
	            TB_Cupones.nrLicencia,
	            TB_Cupones.nmLicenciatario,
	            TB_Cupones.vlPagoPesos,
	            TB_Cupones.vlPagoEuros,
	            TB_Cupones.vlPagoDolares,
		    TB_Cupones.vlComision,
	            Convert(varchar,TB_Cupones.dtCupon,103) as dtCupon,
		    TB_Cupones.dsHoraViaje,
	            TB_Cupones.vlComision + isnull(TB_Cupones.vlIVA,0) as vlRetencion,
	            TB_Cupones.vlIVA,
	            TB_Cupones.nrTalonarioCliente,
	            TB_Cupones.nrComprabanteCliente,
	            TB_Recibos.IdRecibo,
	            TB_Recibos.vlAcumDolares,
	            TB_Recibos.vlSaldoPesos,
	            TB_Recibos.vlSaldoEuros,
	            TB_Recibos.vlAcumPesos,
	            TB_Recibos.vlAcumEuros,
	            TB_Recibos.vlAcumComision,
	            TB_Recibos.vlSaldoDolares,
	            Convert(varchar,TB_Recibos.dtRecibo,103) +' '+
	            Convert(varchar,TB_Recibos.dtRecibo,108) as  dtRecibo,
		    TB_Recibos.flAnulado
		from TB_Cupones, TB_Recibos
		WHERE
		    TB_Cupones.IdRecibo = TB_Recibos.IdRecibo and
		    TB_Cupones.IdRecibo = @IdRecibo_param
		ORDER BY
		    TB_Recibos.IdRecibo ASC
	else
		select  
	            b.dsDestino,
	            b.nrLicencia,
	            b.nmLicenciatario,
	            b.vlPagoPesos,
	            b.vlPagoEuros,
	            b.vlPagoDolares,
	            b.vlComision,
	            b.nrTalonarioCliente,
	            b.nrComprabanteCliente,
	            b.vlComision +isnull(b.vlIVA,0)  as vlRetencion,
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
		from  TB_RecibosDetalle b, TB_Recibos c
		WHERE
		    b.IdRecibo = c.IdRecibo and
		    b.IdRecibo = @IdRecibo_param
		ORDER BY
		    c.IdRecibo ASC

	
go

DROP VIEW dbo.VW_DetalleMovimientosContablesCupones;

go 

CREATE VIEW dbo.VW_DetalleMovimientosContablesCupones
AS
SELECT DISTINCT 
                      dbo.TB_MovimientosContables.tpOperacion, dbo.TB_MovimientosContables.nrCaja, dbo.TB_MovimientosContables.dsConcepto, 
                      dbo.TB_Cupones.nrLicencia, dbo.TB_Cupones.tpCupon, dbo.TB_Cupones.nrTalonarioCliente, dbo.TB_Cupones.nrComprabanteCliente, 
                      dbo.TB_Cupones.vlPagoPesos AS vlPesos, dbo.TB_Cupones.vlPagoDolares AS vlDolares, dbo.TB_Cupones.vlPagoEuros AS vlEuros, 
                      dbo.TB_Cupones.vlComision, dbo.TB_Cupones.vlMontoCupon, dbo.TB_MovimientosContables.nrRecibo, dbo.TB_Cupones.flCompensado, 
                      dbo.TB_Cupones.dtCompensado, dbo.TB_MovimientosContables.dsUsuario, dbo.TB_Cupones.vlIVA
FROM         dbo.TB_MovimientosContables INNER JOIN
                      dbo.TB_Cupones ON dbo.TB_MovimientosContables.IdRecibo = dbo.TB_Cupones.IdRecibo

	


