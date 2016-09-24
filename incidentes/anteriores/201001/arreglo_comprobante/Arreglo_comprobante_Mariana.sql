
select * from tb_Comprobantes 
where nrComprobante = '00090219'
and nrTalonario  = '0003' 



	set dateformat dmy

	begin tran 

				  Exec SP_ActualizarComprobante_v2_5 @nrTalonario_param = '0003' ,
								   @nrComprobante_param = '00090219' ,
								   @tpComprobante_param = 'B' ,
								   @tpLetra_param = 'E' ,
								   @nrTalonario_new_param = '0003' , 
								   @nrComprobante_new_param = '00090219' ,
								   @tpComprobante_new_param = 'E' ,
				                                   @tpLetra_new_param = 'E' ,
				                                   @dtComprobante_new_param = '10/05/2007' ,  
				                                   @cdCondVenta_new_param = 'Contado' ,
				                                   @tpComision_new_param = 'A Clientes' ,
				                                   @vlComision_new_param = 4 ,
				                                   @nrCierre_param = null 



select * from tb_Comprobantes 
where nrComprobante = '00090219'
and nrTalonario  = '0003' 

Commit tran



rollback tran

