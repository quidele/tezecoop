
select * from tb_cajas where nrCaja = 3000002103

select * from tb_comprobantes where nrCaja = 3000002103  and tpletra ='A'

select * from tb_comprobantes where nrCaja = 1000004692  and tpletra ='A'


select * from tb_comprobantes where nrTalonario  = 6  and tpletra ='A' and  nrPuesto = 1 and nrComprobante > '00000896'

select * from tb_cupones where nrTalonarioCliente  = 8  and tpletraCliente ='M' and  nrPuesto = 1 and nrComprabanteCliente = '00000067'  


	set dateformat dmy

	begin tran 

				  Exec SP_ActualizarComprobante_v2_5 @nrTalonario_param = '0006' ,
								   @nrComprobante_param = '00000896' ,
								   @tpComprobante_param = 'A' ,
								   @tpLetra_param = 'A' ,
								   @nrTalonario_new_param = '0006' , 
								   @nrComprobante_new_param = '00000896' ,
								   @tpComprobante_new_param = 'A' ,
				                                   @tpLetra_new_param = 'M' ,
				                                   @dtComprobante_new_param = '11/04/2008' ,  
				                                   @cdCondVenta_new_param = 'Contado' ,
				                                   @tpComision_new_param = 'Contado' ,
				                                   @vlComision_new_param = 5 ,
				                                   @nrCierre_param = null 


Commit tran

rollback tran




select * from tb_cupones where nrComprabantecliente ='00134552' and nrLicencia =111
