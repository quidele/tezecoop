



select * into  TB_ComprobantesDetalle_ from   TB_ComprobantesDetalle    where   nrComprobante ='00000101' and nrTalonario = '0001' and tpComprobante ='m' and tpletra='m'

select * into  tb_comprobantes_  from   tb_comprobantes    where   nrComprobante ='00000101' and nrTalonario = '0001' and tpComprobante ='m' and tpletra='m'

select * into  TB_Cupones_  from   TB_Cupones    where   nrComprabanteCliente  ='00000101' and nrTalonarioCliente  = '0001'
															and tpComprobanteCliente  ='M' and tpLetraCliente ='M'


select * from   TB_ComprobantesDetalle    where   nrComprobante ='00000101' and nrTalonario = '0001' and tpComprobante ='m' and tpletra='m'

select flCompensado ,  * from   TB_Cupones    where   nrComprabanteCliente  ='00000101' and nrTalonarioCliente  = '0001'
 and tpComprobanteCliente  ='m' and tpLetraCliente ='m'

select * from   tb_comprobantes    where   nrComprobante ='00000101' and nrTalonario = '0001' and tpComprobante ='m' and tpletra='m'




begin tran 
 
delete   TB_ComprobantesDetalle    where   nrComprobante ='00000101' and nrTalonario = '0001' and tpComprobante ='m' and tpletra='m'

delete from   tb_comprobantes    where   nrComprobante ='00000101' and nrTalonario = '0001' and tpComprobante ='m' and tpletra='m'

delete from   TB_Cupones    where   nrComprabanteCliente  ='00000101' and nrTalonarioCliente  = '0001'
 and tpComprobanteCliente  ='m' and tpLetraCliente ='m'

commit tran 

