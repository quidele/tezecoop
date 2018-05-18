

create procedure [dbo].[sp_eliminarFisicamenteunComprobanteEliminadoLogicamente_v2_5_EULISES]
							(@nrTalonario_param        varchar(4),
							@nrComprobante_param      varchar(12),
							@tpComprobante_param      varchar(4),
							@tpLetra_param            varchar(2))
as
begin
declare @error as varchar(200)


		/* verificamos si es un comprobado eliminado logicamente*/
		if (select count(*) from
			TB_Comprobantes
			where nrTalonario   = @nrTalonario_param and
			nrComprobante = @nrComprobante_param and
			tpComprobante = @tpComprobante_param and 
			tpLetra       = @tpLetra_param  and
			flAnulado =0) = 1
		begin 
			Print 'El comprobante no esta ANULADO, Debe anularse'
			return;
		end 
		 

		delete TB_ComprobantesCajasPuestosCierres
		where nrTalonario_modif    = @nrTalonario_param and
		      nrComprobante_modif  = @nrComprobante_param and
		      tpComprobante_modif  = @tpComprobante_param and 		
		      tpLetra_modif = @tpLetra_param

		if @@error<>0
		begin
			select @error = 'No se pudieron eliminar las modificaciones del  comprobante eliminado logicamente.'
			raiserror (@error, 16, 1)
			return 0
		end 
 


		delete TB_Cupones
		where nrTalonarioCliente   = @nrTalonario_param and
		      nrComprabanteCliente = @nrComprobante_param and
		      tpComprobanteCliente = @tpComprobante_param and 		
		      tpLetraCliente       = @tpLetra_param 
	
		if @@error<>0
		begin
			select @error = 'No se pudo eliminar el comprobante eliminado logicamente en la cuenta corriente.'
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
			select @error = 'No se ha podido eliminar el detalle de comprobante eliminado logicamente'
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
			select @error = 'No se ha podido eliminar el comprobante eliminado logicamente.'
			raiserror (@error, 16, 1)
			rollback tran T1		
			return 0	
		end
	

end 

GO
EXEC [dbo].[sp_eliminarFisicamenteunComprobanteEliminadoLogicamente_v2_5_EULISES]
							@nrTalonario_param = '0001',
							@nrComprobante_param = '00203654',
							@tpComprobante_param  = 'FA',
							@tpLetra_param = 'B'