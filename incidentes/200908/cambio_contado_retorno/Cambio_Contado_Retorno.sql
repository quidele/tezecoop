
/* Corriendo error de punto */

	select * from tb_comprobantes where nrComprobante = 71689

	select * from tb_comprobantes where nrComprobante ='00078478' and nrLicencia =124

	select * from tb_cupones where nrComprabantecliente ='00078478' and nrLicencia =124

	set dateformat dmy

begin tran 

Exec SP_ActualizarComprobante_v2_5 @nrTalonario_param = '0005' ,
								   @nrComprobante_param = '00078478' ,
								   @tpComprobante_param = 'B' ,
								   @tpLetra_param = 'B' ,
								   @nrTalonario_new_param = '0005' , 
								   @nrComprobante_new_param = '00078478' ,
								   @tpComprobante_new_param = 'B' ,
                                   @tpLetra_new_param = 'B' ,
                                   @dtComprobante_new_param = '21/09/2009' ,
                                   @cdCondVenta_new_param = 'Retorno' ,
                                   @tpComision_new_param = 'Retorno' ,
                                   @vlComision_new_param = 2 ,
                                   @nrCierre_param = null 


Commit tran

rollback tran

sp_helptext 'SP_ActualizarComprobante_v2_5'





select * from tb_conceptos where tpoperacion = 'Neutro'