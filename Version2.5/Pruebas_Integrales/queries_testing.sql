Exec sp_eliminarFisicamenteunComprobanteEliminadoLogicamente_v2_5 @nrTalonario_param = '0003' ,@nrComprobante_param = '00012347' ,@tpComprobante_param = 'B' ,@tpLetra_param = 'B' 



declare @nrTalonario_param        varchar(4)
declare @nrComprobante_param      varchar(12)
declare @tpComprobante_param      varchar(4)
declare @tpLetra_param            varchar(2)

set @nrTalonario_param='0003'
set @nrComprobante_param= '00012347'
set @tpComprobante_param= 'B' 
set @tpLetra_param= 'B' 



select count(*) from
			TB_Comprobantes
			where nrTalonario   = @nrTalonario_param and
			nrComprobante = @nrComprobante_param and
			tpComprobante = @tpComprobante_param and 
			tpLetra       = @tpLetra_param  and
			tpModificacionCajaPuesto ='Eliminado' and 
			flEliminar =1
		

		select * from  TB_ComprobantesCajasPuestosCierres
		where nrTalonario_modif    = @nrTalonario_param and
		      nrComprobante_modif  = @nrComprobante_param and
		      tpComprobante_modif  = @tpComprobante_param and 		
		      tpLetra_modif = @tpLetra_param

 


		select * from TB_Cupones
		where nrTalonarioCliente   = @nrTalonario_param and
		      nrComprabanteCliente = @nrComprobante_param and
		      tpComprobanteCliente = @tpComprobante_param and 		
		      tpLetraCliente       = @tpLetra_param 
 

		-- Eliminar en la tabla de TB_ComprobantesDetalle el comprobante anterior
		SELECT * from TB_ComprobantesDetalle
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param 
		
		

		SELECT * from TB_Comprobantes
		where nrTalonario   = @nrTalonario_param and
		nrComprobante = @nrComprobante_param and
		tpComprobante = @tpComprobante_param and 
		tpLetra       = @tpLetra_param 




