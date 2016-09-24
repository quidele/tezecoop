


select * from tb_comprobantes
 where	nrComprobante ='00006511'  
	and flEliminar=1 
	and nrTalonario = '0004'
	and tpComprobante = 'B'


select * from tb_cupones
where	nrComprabanteCliente ='00006511'  
	and flEliminar=1 
	and nrTalonarioCliente = '0004'
	and tpComprobanteCliente = 'B'

select * from tb_comprobantesdetalle
where	nrComprobante ='00006511'  
	and flEliminar=1 
	and nrTalonario = '0004'
	and tpComprobante = 'B'
 
/* Codigo de la Eliminación */

delete from tb_cupones
where	nrComprabanteCliente ='00006511'  
	and flEliminar=1 
	and nrTalonarioCliente = '0004'
	and tpComprobanteCliente = 'B'

delete from tb_comprobantesdetalle
where	nrComprobante ='00006511'  
	and flEliminar=1 
	and nrTalonario = '0004'
	and tpComprobante = 'B'
 
delete from tb_comprobantes
 where	nrComprobante ='00006511'  
	and flEliminar=1 
	and nrTalonario = '0004'
	and tpComprobante = 'B'

/* Verificacion */



select * from tb_comprobantes
 where	nrComprobante ='00006511'  
	and flEliminar=1 
	and nrTalonario = '0004'
	and tpComprobante = 'B'


select * from tb_cupones
where	nrComprabanteCliente ='00006511'  
	and flEliminar=1 
	and nrTalonarioCliente = '0004'
	and tpComprobanteCliente = 'B'

select * from tb_comprobantesdetalle
where	nrComprobante ='00006511'  
	and flEliminar=1 
	and nrTalonario = '0004'
	and tpComprobante = 'B'

