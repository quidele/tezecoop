-- Cambios de DDL version 4.9.7
use dbSG2000
go


IF exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_ActualizarComprobante_v4_9_7'  )
	DROP PROCEDURE  [dbo].SP_ActualizarComprobante_v4_9_7
	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


---  Voy por acacacac !!!
--- SP_ActualizarComprobanteManual_v2_4 ->>> SP_ActualizarComprobanteManual_v2_5
-- Actualiza el nro de comprobante y talonario de una carga manual
create     procedure [dbo].[SP_ActualizarComprobante_v4_9_7]
@nrTalonario_param        varchar(4),  /* FORMATO 0000*/
@nrComprobante_param      varchar(12),
@tpComprobante_param      varchar(4),
@tpLetra_param            varchar(2),
@nrTalonario_new_param    varchar(4),
@nrComprobante_new_param  varchar(12),
@tpComprobante_new_param  varchar(4),
@tpLetra_new_param        varchar(2),
@dtComprobante_new_param  datetime=null,
@nrCierre_param		  int=null,
@cdCondVenta_new_param	  varchar(20)=null,
@tpComision_new_param	  varchar(20)=null,
@vlComision_new_param     float=null,
@solo_cambio_cabecera_comprobante char(2)
AS
begin
/*

declare @nrTalonario_param varchar
declare @nrComprobante_param varchar
declare @tpComprobante_param varchar
declare @tpLetra_param      varchar
declare @nrTalonario_new_param varchar
declare @nrComprobante_new_param varchar
declare @tpComprobante_new_param varchar
declare @tpLetra_new_param varchar

set @nrTalonario_param ='0002'
set @nrComprobante_param ='00000063'
set @tpComprobante_param ='A'
set @tpLetra_param      ='A'
set @nrTalonario_new_param ='0002'
set @nrComprobante_new_param ='00000063'
set @tpComprobante_new_param ='B'
set @tpLetra_new_param ='B'

*/
declare @cantidad_registros int
declare @error		    varchar(200)
declare @cdCondVenta        varchar(50)
declare @vlPagoPesos        float
declare @vlPagoDolares      float
declare @vlPagoEuros        float
declare @vlPagoReales       float
declare @vlTotalGeneral      float


BEGIN TRY

	if @nrCierre_param is not null 
	begin
		---- guardar el comprobante anterior 
		exec sp_guardarComprobanteCajaPuestoAnterior_v2_5
			@nrTalonario_param   = @nrTalonario_param,
			@nrComprobante_param = @nrComprobante_param,
			@tpComprobante_param = @tpComprobante_param,
			@tpLetra_param       = @tpLetra_param,
			@nrCierre_param      = @nrCierre_param,	
			@nrTalonario_new_param   = @nrTalonario_new_param,
			@nrComprobante_new_param = @nrComprobante_new_param,
			@tpComprobante_new_param = @tpComprobante_new_param,
			@tpLetra_new_param       = @tpLetra_new_param
	end

	-- verificamos la existencia del comprobante
	select  @cantidad_registros=count(*),
	        @cdCondVenta=max(cdCondVenta), 
		@vlPagoPesos=max(vlPagoPesos),
		@vlPagoDolares=max(vlPagoDolares),
		@vlPagoEuros=max(vlPagoEuros),
		@vlPagoReales=max(vlPagoReales),
		@vlTotalGeneral=max(vlTotalGeneral)
	FROM TB_Comprobantes
	WHERE nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param 
	
	if @cantidad_registros=0 
	begin
		select @error = 'No se ha encontrado el talonario '+ @nrTalonario_param + ' comprobante nro. '+ rtrim(@nrComprobante_param) +'.'
        raiserror (@error, 16, 1)
		return 0	
	end

	-- si cambia los datos de la clave verificar si ya existe el comprobante
	-- con la nueva clave, si existe hay un error
	-- si el comprobante no existe 
	if      @nrTalonario_param <> @nrTalonario_new_param     or
		@nrComprobante_param  <> @nrComprobante_new_param   or 
		@tpComprobante_param  <> @tpComprobante_new_param   or
		@tpLetra_param        <> @tpLetra_new_param   
	begin
		if dbo.f_existeComprobante(@nrTalonario_new_param, @nrComprobante_new_param, @tpComprobante_new_param,@tpLetra_new_param)='SI'
		begin
			select @error = 'El comprobante modificado ya existe no puede modificarlo en lo que respeta a numeración y letra'
			raiserror (@error, 16, 1)
			return 0	
		end 



		insert into [TB_Comprobantes]
		    (nrTalonario,nrComprobante, tpComprobante, tpLetra, 
		    dtComprobante , cdCliente, cdCondVenta, tpComision, 
		    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
		    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
		    flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
		    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
		    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
		    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
		    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
		    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
		    nmEmpleado, IdReciboCtaCte, flCargaErronea, dtActualizacion, vlPagoReales)
		select  @nrTalonario_new_param,  @nrComprobante_New_param , 
			@tpComprobante_new_param, @tpLetra_new_param, 
		    @dtComprobante_new_param, cdCliente, cdCondVenta, tpComision,	
		    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
		    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
		    0 as flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
		    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
		    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
		    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
		    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
		    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
		    nmEmpleado, IdReciboCtaCte, flCargaErronea, getdate () as  dtActualizacion, vlPagoReales
		from TB_Comprobantes
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param  
	
		if @@rowcount=0 
		begin	
			select @error = 'No se ha insertado el talonario '+ @nrTalonario_new_param + ' comprobante nro. '+ rtrim(@nrComprobante_new_param) +'.'
			raiserror (@error, 16, 1)
			return 0	
		end
	
		if @@error<>0
		begin
			select @error = 'error al insertar el registro en la tabla [TB_Comprobantes].'
			raiserror (@error, 16, 1)
			return 0
		end 	
	
		insert into [TB_ComprobantesDetalle]
		    (nrTalonario, nrComprobante, tpComprobante, tpLetra, nrItem, 
		    cdProducto, dsProducto, tpOperacion, qtCantidad, vlPorcentaje, 
		    vlPrecioPeaje, vlPrecioViaje, vlTotalItem, dtInsercion, 
		   flSincronizado,dtActualizacion)
		select @nrTalonario_new_param , @nrComprobante_new_param, @tpComprobante_new_param, @tpLetra_new_param, 
		    nrItem, cdProducto, dsProducto, tpOperacion, qtCantidad, 
		    vlPorcentaje, vlPrecioPeaje, vlPrecioViaje, vlTotalItem, 
		    dtInsercion, 0, getdate()
		from TB_ComprobantesDetalle
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param 

		update TB_Cupones
		set    nrTalonarioCliente     = @nrTalonario_new_param,
	   	       nrComprabanteCliente   = @nrComprobante_new_param,
		       tpComprobanteCliente = @tpComprobante_new_param,
		       tpLetraCliente       = @tpLetra_new_param 
		where nrTalonarioCliente   = @nrTalonario_param and
		      nrComprabanteCliente = @nrComprobante_param and
		      tpComprobanteCliente = @tpComprobante_param and 		
		      tpLetraCliente       = @tpLetra_param 


	
		if @@error<>0
		begin
			select @error = 'No se pudo grabar la tabla de TB_ComprobantesDetalle.'
			raiserror (@error, 16, 1)
			return 0
		end 
 

		-- Eliminar en la tabla de TB_ComprobantesDetalle el comprobante anterior
		delete from TB_ComprobantesDetalle
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param 
		
		if @@rowcount=0 
		begin	
			select @error = 'No se ha podido eliminar el comprobante anterior'
			raiserror (@error, 16, 1)
			return 0	
		end
		
		--------------------------------------------------------------------
		-- Eliminar en la tabla de TB_Comprobantes el comprobante anterior
		delete from TB_Comprobantes
		where nrTalonario   = @nrTalonario_param and
		nrComprobante = @nrComprobante_param and
		tpComprobante = @tpComprobante_param and 
		tpLetra       = @tpLetra_param 
		
		if @@rowcount=0 
		begin	
			select @error = 'No se ha podido eliminar el comprobante anterior.'
			raiserror (@error, 16, 1)
			rollback tran T1		
			return 0	
		end
		
		if @@error<>0
		begin	
			select @error = 'No se ha podido eliminar el comprobante anterior.'
			raiserror (@error, 16, 1)
			return 0	
		end
	end

	if @solo_cambio_cabecera_comprobante ='SI' 
		return 0
	

	-- verificar si se ha modificado la cond de venta
	if @cdCondVenta<>@cdCondVenta_new_param
	begin
		/* extraemos esta validacion version 3.7 
		if @cdCondVenta_new_param='Cuenta Corriente'
		begin
			select @error = 'No se puede modificar la condición de venta a Cuenta Corriente.'
			raiserror (@error, 16, 1)
			return 0	
		end
		*/

		select top 1  @vlPagoPesos as vlPagoPesos,
                        @vlPagoDolares as vlPagoDolares,
			@vlPagoEuros as vlPagoEuros ,
			@vlPagoReales as vlPagoReales ,
			@vlPagoPesos as vlPagoPesosACP,
			@vlPagoDolares as vlPagoDolaresACP ,
			@vlPagoEuros  as vlPagoEurosACP,
			@vlPagoReales as vlPagoRealesACP                                 
		into #ValoresdePagos from tb_cajas	

		delete from #ValoresdePagos

		insert #ValoresdePagos  exec sp_obtenerCondVentayValoresdePagosModificados_v3_7	
			@cdCondVenta_param=@cdCondVenta, 
			@cdCondVenta_new_param=@cdCondVenta_new_param,	  
			@vlTotalGeneral=@vlTotalGeneral,
			@vlPagoPesos_param=@vlPagoPesos,
			@vlPagoDolares_param=@vlPagoPesos,
			@vlPagoEuros_param=@vlPagoEuros,
			@vlPagoReales_param=@vlPagoReales
			
			

		select  @vlPagoPesos=vlPagoPesos,
			    @vlPagoDolares=vlPagoDolares,
			    @vlPagoEuros=vlPagoEuros,
			    @vlPagoReales=vlPagoReales
		from #ValoresdePagos 

	end -- cierre if @cdCondVenta<>@cdCondVenta_new_param


	--- analizar los cambios en la fecha, condicion de venta , comision
	-- actualizamos la cta cte del licenciatario
	update TB_Cupones
	set  
            /* Atencion si ya fue compensado no realizado nada*/		
	    dtcupon = CASE flCompensado
			 when 0 then isnull(@dtComprobante_new_param , dtcupon)
			 when 1 then dtcupon
			 End,
	    -- falta el recalculo de la vlcomision 
	    tpCupon = CASE flCompensado
			 when 0 then isnull(@cdCondVenta_new_param , tpCupon)
			 when 1 then tpCupon
			 End,
	    vlComision = CASE flCompensado
			 when 0 then isnull(@vlComision_new_param,vlComision) 
			 when 1 then vlComision
			 End,
            /* Atencion si ya fue compensado no realizado nada - valores de pago */		
	    vlPagoPesos = CASE flCompensado
			 when 0 then @vlPagoPesos
			 when 1 then vlPagoPesos
			 End,
	    -- falta el recalculo de la vlcomision 
	    vlPagoDolares = CASE flCompensado
			 when 0 then @vlPagoDolares
			 when 1 then vlPagoDolares
			 End,
	    vlPagoEuros = CASE flCompensado
			 when 0 then @vlPagoEuros
			 when 1 then vlPagoEuros
			 End,
		vlPagoReales  = CASE flCompensado
			 when 0 then @vlPagoReales 
			 when 1 then vlPagoReales
			 End
	where nrTalonarioCliente   = @nrTalonario_new_param and
	      nrComprabanteCliente = @nrComprobante_new_param and
	      tpComprobanteCliente = @tpComprobante_new_param and 
	      tpLetraCliente       = @tpLetra_new_param
		
	if @cdCondVenta<>@cdCondVenta_new_param and
	   @cdCondVenta='Cuenta Corriente' and @cdCondVenta_new_param='Contado'
	begin
		update TB_Cupones
		set flCobradoalCliente = 1,
			dtCobradoalCliente = dtCupon
		where nrTalonarioCliente   = @nrTalonario_new_param and
	      nrComprabanteCliente = @nrComprobante_new_param and
	      tpComprobanteCliente = @tpComprobante_new_param and 
	      tpLetraCliente       = @tpLetra_new_param
		
	end 	
	
	if @cdCondVenta<>@cdCondVenta_new_param and
	   @cdCondVenta='Contado' and @cdCondVenta_new_param='Cuenta Corriente'
	begin
		update TB_Cupones
		set flCobradoalCliente = 0,
			dtCobradoalCliente = null
		where nrTalonarioCliente   = @nrTalonario_new_param and
	      nrComprabanteCliente	   = @nrComprobante_new_param and
	      tpComprobanteCliente	   = @tpComprobante_new_param and 
	      tpLetraCliente           = @tpLetra_new_param
		
	end 
	
	
	-- Verificar y correr los update necesarios para
	--  @dtComprobante_new_param  
	--  @cdCondVenta_new_param
	--  @tpComision_new_param
	update tb_comprobantes
	set dtComprobante = isnull( @dtComprobante_new_param , dtComprobante),
	    cdCondVenta	  = isnull( @cdCondVenta_new_param , cdCondVenta),
	    tpComision    = isnull( @tpComision_new_param , tpComision),
	    dtActualizacion = getdate(),
	    vlPagoPesos     = isnull(@vlPagoPesos,vlPagoPesos),
	    vlPagoDolares   = isnull(@vlPagoDolares,vlPagoDolares),
	    vlpagoEuros	    = isnull(@vlPagoEuros,vlPagoEuros),
	    vlpagoReales	= isnull(@vlPagoReales,vlPagoReales)
	where nrTalonario   = @nrTalonario_new_param and
	      nrComprobante = @nrComprobante_new_param and
	      tpComprobante = @tpComprobante_new_param and 
	      tpLetra       = @tpLetra_new_param

	--------------------------------------------------------------------
	--------------------------------------------------------------------
	--------------------------------------------------------------------	

	SELECT 'OK' as  Resultado , null as DescripcionError

END TRY
BEGIN CATCH


	SELECT 'ERROR' as  Resultado , ERROR_MESSAGE()   as DescripcionError


END CATCH


end
