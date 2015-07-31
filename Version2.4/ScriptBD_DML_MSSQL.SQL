-- cambios de DML version 2.4
use dbSG2000
go

-- Actualiza el nro de comprobante y talonario de una carga manual
alter procedure [SP_ActualizarComprobanteManual_v2_4]
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
	select @nrTalonario_new_param , @nrComprobante_new_param, tpComprobante, tpLetra, 
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
   	    nrComprabanteCliente   = @nrComprobante_new_param
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

/*****************************************/
ALTER PROCEDURE SP_ObtenerIVAVentas_v2_4
@nrMes_param	     int,	
@nrAnio_param	     int,
@tpComprobante_param char(1),
@tpFacturacion_param char(1)
as
begin

	if @tpComprobante_param=' '
		 set @tpComprobante_param=null

	if @tpFacturacion_param=' '
		set @tpFacturacion_param=null


		SELECT convert(varchar,a.dtComprobante,103) as 'FECHA',
		       'FAC' as 'Tipo',
	               rtrim(a.tpComprobante)+
 		       rtrim(a.nrTalonario)+
		       rtrim(a.nrComprobante) as 'Nro COMP', 
		       a.dsRazonSocial 'RAZON_SOCIAL',
		       a.tpIVA 'CAT_IVA',
		       a.nrDOC 'CUIT/DNI',
		       'EXENTO'=Case isnull(a.vlIVA,0)
		       WHEN 0 THEN  convert(decimal(9,2),isnull(a.vlTotalGeneral,0))
		       ELSE convert(decimal(9,2),a.vlTotalGeneral) -
		            convert(decimal(9,2),isnull(a.vlSubTotal,0)) -
   		            convert(decimal(9,2),isnull(a.vlIVA,0)) 
		       END,
		       'GRAVADO'=Case isnull(a.vlIVA,0)
		       WHEN 0 THEN  0 
		       ELSE convert(decimal(9,2),isnull(a.vlSubTotal,0))
		       END,
		       convert(decimal(9,2),isnull(a.vlIVA,0)) as 'IVA',
		       convert(decimal(9,2),a.vlTotalGeneral) as 'IMPORTE',
	              'Anulado'=CASE a.flAnulado
		      WHEN '0' THEN 'NO' 
		      WHEN '1' THEN 'SI' 
		      END/*, 
		      'Tipo de Facturacion'=CASE a.flManual
		      WHEN 'M' THEN 'Manual'
		      WHEN 'N' THEN 'Automática'
		      WHEN 'S' THEN 'Manual'
		      WHEN 'N' THEN 'Automática'
		      END */
		      into #temp_iva_con_Anulados
		FROM TB_Comprobantes a -- , TB_Cupones b
		where
		   /*a.nrComprobante =  b.nrComprabanteCliente and 
		   a.nrTalonario =  b.nrTalonarioCliente  and 
		   a.tpComprobante =  b.tpComprobanteCliente  and 
		   a.tpLetra =  b.tpLetraCliente and*/
		    month(a.dtComprobante) = @nrMes_param and
		    year(a.dtComprobante) = @nrAnio_param and	
		    a.tpComprobante=isnull(@tpComprobante_param,a.tpComprobante) and
		    a.flManual=isnull(@tpFacturacion_param,a.flManual) and
		    a.flEliminar=0 
	            -- and a.vlIva>0
		  order by convert(datetime,convert(varchar, a.dtComprobante, 103) 
		        + ' ' + a.dsOpcional1 + ':00'), a.nrComprobante



	
       select FECHA,
              Tipo,
              [Nro COMP],
	      'RAZON_SOCIAL'=case a.Anulado
	      WHEN 'SI' THEN 'ANULADO'
	      ELSE RAZON_SOCIAL END,
	      CAT_IVA,
	      [CUIT/DNI],
	      'EXENTO'=case a.Anulado
	      WHEN 'SI' THEN 0	
	      ELSE EXENTO END,
	      'GRAVADO'=case a.Anulado
	      WHEN 'SI' THEN 0		
	      ELSE GRAVADO END,
	      'IVA'=case a.Anulado
	      WHEN 'SI' THEN 0	
	      ELSE IVA END,
	      'IMPORTE'=case a.Anulado
	      WHEN 'SI' THEN 0	
	      ELSE IMPORTE END, 
	      a.Anulado 	
       from #temp_iva_con_Anulados a


end
