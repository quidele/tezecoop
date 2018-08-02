


select  flEliminar , * from TB_ComprobantesDetalle  where  nrComprobante = '00001680'  and nrTalonario = '0001'
													and tpLetra = 'A'

select  dsUsuario, flEliminar , * from TB_Cupones where  nrComprabanteCliente = '00001680'  
and nrTalonarioCliente = '0001'  and tpLetraCliente = 'A'
 

select  dsUsuario, flEliminar,   * from TB_Comprobantes where  nrComprobante = '00001680'  and nrTalonario = '0001'
													and tpLetra = 'A'





delete x  from TB_ComprobantesDetalle x  where  nrComprobante = '00001680'  and nrTalonario = '0001'
													and tpLetra = 'A'

delete  x from TB_Cupones x  where  nrComprabanteCliente = '00001680'  
and nrTalonarioCliente = '0001'  and tpLetraCliente = 'A'
 

delete  x from TB_Comprobantes x where  nrComprobante = '00001680'  and nrTalonario = '0001'
													and tpLetra = 'A'