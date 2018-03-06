




select  flEliminar , * from TB_ComprobantesDetalle  where  nrComprobante = '00001274'  and nrTalonario = '0001'
													and tpLetra = 'M'  and tpComprobante =  'FA'


select  dsUsuario, flEliminar , * from TB_Cupones where  nrComprabanteCliente ='00001274' 
and nrTalonarioCliente = '0001'  and tpLetraCliente = 'M'
 

select  dsUsuario, flEliminar,   * from TB_Comprobantes where  nrComprobante ='00001274'   and nrTalonario = '0001'
													and tpLetra = 'M'



delete x  from TB_ComprobantesDetalle x  where  nrComprobante ='00001274'   and nrTalonario = '0001'
													and tpLetra = 'M' and flEliminar = 1

delete  x from TB_Cupones x  where  nrComprabanteCliente ='00001274' 
and nrTalonarioCliente = '0001'  and tpLetraCliente = 'M'  and flEliminar = 1
 

delete  x from TB_Comprobantes x where  nrComprobante ='00001274'    and nrTalonario = '0001'
													and tpLetra = 'M'  and flEliminar = 1