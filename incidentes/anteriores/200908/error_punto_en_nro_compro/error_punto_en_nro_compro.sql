
/* Corriendo error de punto */

	select * from tb_comprobantes where nrComprobante = 71689

	select * from tb_comprobantes where nrComprobante ='00000725'

select * from tb_cupones where nrComprabantecliente = '0000725.'

set dateformat dmy

begin tran 

Exec SP_ActualizarComprobante_v2_5 @nrTalonario_param = '0003' ,
								   @nrComprobante_param = '0000725.' ,
								   @tpComprobante_param = 'B' ,
								   @tpLetra_param = 'M' ,
								   @nrTalonario_new_param = '0003' , 
								   @nrComprobante_new_param = '00000725' ,
								   @tpComprobante_new_param = 'B' ,
                                   @tpLetra_new_param = 'M' ,
                                   @dtComprobante_new_param = '19/10/2006' ,
                                   @cdCondVenta_new_param = 'Contado' ,
                                   @tpComision_new_param = 'A Clientes' ,
                                   @vlComision_new_param = 3 ,
                                   @nrCierre_param = null 
								   


Commit tran

rollback tran


sp_helptext 'SP_ActualizarComprobante_v2_5'