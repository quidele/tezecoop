
/* Corriendo error de punto */

	select * from tb_comprobantes where nrComprobante ='00134552' and nrLicencia =111

	select * from tb_cupones where nrComprabantecliente ='00134552' and nrLicencia =111

	set dateformat dmy

begin tran 

				  Exec SP_ActualizarComprobante_v2_5 @nrTalonario_param = '0006' ,
								   @nrComprobante_param = '00134552' ,
								   @tpComprobante_param = 'B' ,
								   @tpLetra_param = 'B' ,
								   @nrTalonario_new_param = '0006' , 
								   @nrComprobante_new_param = '00134552' ,
								   @tpComprobante_new_param = 'B' ,
				                                   @tpLetra_new_param = 'B' ,
				                                   @dtComprobante_new_param = '10/09/2009' ,
				                                   @cdCondVenta_new_param = 'Retorno' ,
				                                   @tpComision_new_param = 'Retorno' ,
				                                   @vlComision_new_param = 2 ,
				                                   @nrCierre_param = null 


Commit tran

rollback tran





select * from tb_cupones where nrComprabantecliente ='00134552' and nrLicencia =111

	
