-- cambios de DDL version 2.4
use dbSG2000
go

-- Actualiza el nro de comprobante y talonario de una carga manual
create procedure [SP_ActualizarComprobanteManual_v2_4]
@nrTalonario_param        varchar(4),
@nrComprobante_param      varchar(12),
@tpComprobante_param      varchar(4),
@tpLetra_param            varchar(2),
@nrTalonario_new_param    varchar(4),
@nrComprobante_new_param  varchar(12),
@tpComprobante_new_param  varchar(4),
@tpLetra_new_param        varchar(2)
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


	if @nrTalonario_param = @nrTalonario_new_param and
	   @nrComprobante_param = @nrComprobante_new_param and 
	   @tpLetra_param = @tpLetra_new_param 
	begin
		return 0	
	end

	begin tran T1

	select   @cantidad_registros=count(*)
	FROM TB_Comprobantes
	WHERE nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param and 
	      flManual      = 'M' 

	if @cantidad_registros=0 
	begin
		select @error = 'No se ha encontrado el talonario '+ @nrTalonario_param + ' comprobante nro. '+ rtrim(@nrComprobante_param) +'.'
         	raiserror (@error, 16, 1)
		rollback tran T1		
		return 0	
	end


	select   @cantidad_registros=count(*)
	FROM TB_Comprobantes
	WHERE nrTalonario   = @nrTalonario_new_param and
	      nrComprobante = @nrComprobante_new_param and
	      tpComprobante = @tpComprobante_new_param and 
	      tpLetra       = @tpLetra_new_param and 
	      flManual      = 'M' 

	if @cantidad_registros>0 
	begin
		select @error = 'Ya existe el talonario '+ @nrTalonario_new_param + ' comprobante nro. '+ rtrim(@nrComprobante_new_param)+'.'
		raiserror (@error, 16, 1)
		rollback tran T1	
		return 0	
	end


	INSERT INTO [TB_Comprobantes]
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
	    nmEmpleado, IdReciboCtaCte, flCargaErronea, dtActualizacion)
	SELECT  @nrTalonario_new_param,  @nrComprobante_New_param , @tpComprobante_new_param, @tpLetra_new_param, 
	    dtComprobante, cdCliente, cdCondVenta, tpComision, 
	    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
	    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
	    0 as flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
	    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
	    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
	    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
	    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
	    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
	    nmEmpleado, IdReciboCtaCte, flCargaErronea,getdate () as  dtActualizacion
	FROM TB_Comprobantes
	WHERE nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param and 
	      flManual      = 'M' 

	if @@rowcount=0 
	begin	
		select @error = 'No se ha insertado el talonario '+ @nrTalonario_new_param + ' comprobante nro. '+ rtrim(@nrComprobante_new_param) +'.'
		raiserror (@error, 16, 1)
		rollback tran T1	
		return 0	
	end

	if @@error<>0
	begin
		select @error = 'error al insertar el registro en la tabla [TB_Comprobantes].'
		raiserror (@error, 16, 1)
		rollback tran T1	
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


	if @@error<>0
	begin
		select @error = 'No se pudo grabar la tabla de TB_ComprobantesDetalle.'
		raiserror (@error, 16, 1)
		rollback tran T1	
		return 0
	end 

	update TB_Cupones
	set nrTalonarioCliente     = @nrTalonario_new_param,
   	    nrComprabanteCliente   = @nrComprobante_new_param,
	    tpComprobanteCliente = @tpComprobante_new_param,
	    tpLetraCliente       = @tpLetra_new_param 
	where nrTalonarioCliente   = @nrTalonario_param and
	      nrComprabanteCliente = @nrComprobante_param and
	      tpComprobanteCliente = @tpComprobante_param and 		
	      tpLetraCliente       = @tpLetra_param 
	
	--------------------------------------------------------------------
	--------------------------------------------------------------------
	--------------------------------------------------------------------

	-- Eliminar en la tabla de TB_ComprobantesDetalle
	delete from TB_ComprobantesDetalle
	where nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param 
	
	if @@rowcount=0 
	begin	
		select @error = 'No se ha eliminado el talonario '+ @nrTalonario_param + ' comprobante nro. '+ rtrim(@nrComprobante_param) +' de la tabla TB_ComprobantesDetalle.'
		raiserror (@error, 16, 1)
		rollback tran T1		
		return 0	
	end

	--------------------------------------------------------------------
	-- Eliminar en la tabla de TB_Comprobantes
	delete from TB_Comprobantes
	where nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param and 
	      flManual      = 'M' 

	if @@rowcount=0 
	begin	
		select @error = 'No se ha eliminado el talonario '+ @nrTalonario_param + ' comprobante nro. '+ rtrim(@nrComprobante_param) +' de la tabla TB_Comprobantes.'
		raiserror (@error, 16, 1)
		rollback tran T1		
		return 0	
	end

	if @@error<>0
	begin	
		select @error = 'No se ha insertado el talonario '+ @nrTalonario_new_param + ' comprobante nro. '+ rtrim(@nrComprobante_new_param) +'.'
		raiserror (@error, 16, 1)
		rollback tran T1		
		return 0	
	end
	else
	begin	-- todo OK 
		commit tran T1		
	end
		
	

end

go 
