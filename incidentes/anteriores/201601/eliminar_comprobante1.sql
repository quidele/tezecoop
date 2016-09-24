use dbSG2000
go


select * from   TB_ComprobantesDetalle    where  nrComprobante  in ('00192351', '00192352','00192353','00192354', '00192878') 
                                      and nrTalonario  = '0003'
 and tpComprobante  ='FA' and tpLetra ='B'

select * from   tb_comprobantes    where   nrComprobante  in ('00192351', '00192352','00192353','00192354', '00192878') 
                                      and nrTalonario  = '0003'
 and tpComprobante  ='FA' and tpLetra  ='B'

select flCompensado ,  * from   TB_Cupones    where  nrComprabanteCliente   in ('00192351', '00192352','00192353','00192354', '00192878') 
                                      and nrTalonarioCliente  = '0003'
 and tpComprobanteCliente  ='FA' and tpLetraCliente ='B'

select *  into  TB_ComprobantesDetalle_192351 from   TB_ComprobantesDetalle   where  nrComprobante  in ('00192351', '00192352','00192353','00192354', '00192878') 
                                      and nrTalonario  = '0003'
 and tpComprobante  ='FA' and tpLetra ='B'

select *  into  tb_comprobantes_192351  from   tb_comprobantes    where   nrComprobante  in ('00192351', '00192352','00192353','00192354', '00192878') 
                                      and nrTalonario  = '0003'
 and tpComprobante  ='FA' and tpLetra  ='B'

select *  into  TB_Cupones_192351   from   TB_Cupones    where  nrComprabanteCliente   in ('00192351', '00192352','00192353','00192354', '00192878') 
                                      and nrTalonarioCliente  = '0003'
 and tpComprobanteCliente  ='FA' and tpLetraCliente ='B'





begin tran 


delete from   TB_ComprobantesDetalle    where  nrComprobante  in ('00192354', '00192878') 
                                      and nrTalonario  = '0003'
 and tpComprobante  ='FA' and tpLetra ='B'

delete from   tb_comprobantes    where   nrComprobante  in ('00192354', '00192878') 
                                      and nrTalonario  = '0003'
 and tpComprobante  ='FA' and tpLetra  ='B'

delete from   TB_Cupones    where  nrComprabanteCliente   in ('00192354', '00192878') 
                                      and nrTalonarioCliente  = '0003'
 and tpComprobanteCliente  ='FA' and tpLetraCliente ='B'
 
commit tran 

go


select * from   TB_ComprobantesDetalle    where   nrComprobante ='00192351' and nrTalonario = '0001' and tpComprobante ='m' and tpletra='m'

select * from   tb_comprobantes    where   nrComprobante ='00192351' and nrTalonario = '0001' and tpComprobante ='m' and tpletra='m'

select flCompensado ,  * from   TB_Cupones    where   nrComprabanteCliente  ='00190360' and nrTalonarioCliente  = '0001'
 and tpComprobanteCliente  ='m' and tpLetraCliente ='m'


begin tran 
 
delete   TB_ComprobantesDetalle    where   nrComprobante ='00190360' and nrTalonario = '0001' and tpComprobante ='m' and tpletra='m'

delete from   tb_comprobantes    where   nrComprobante ='00190360' and nrTalonario = '0001' and tpComprobante ='m' and tpletra='m'

delete from   TB_Cupones    where   nrComprabanteCliente  ='00190360' and nrTalonarioCliente  = '0001'
 and tpComprobanteCliente  ='m' and tpLetraCliente ='m'

commit tran 




select  flCompensado, dtCompensado,  *  from   TB_Cupones    where  nrComprabanteCliente   in ('00192351', '00192352','00192353') 
                                      and nrTalonarioCliente  = '0001'
 and tpComprobanteCliente  ='FA' and tpLetraCliente ='B'
 
 ----------------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------
 
 
 

select * from   TB_ComprobantesDetalle    where  nrComprobante  in ('00192351', '00192352','00192353') 
                                      and nrTalonario  = '0001'
 and tpComprobante  ='FA' and tpLetra ='B'

select * from   tb_comprobantes    where   nrComprobante  in ('00192351', '00192352','00192353') 
                                      and nrTalonario  = '0001'
 and tpComprobante  ='FA' and tpLetra  ='B'

select flCompensado ,  * from   TB_Cupones    where  nrComprabanteCliente   in ('00192351', '00192352','00192353') 
                                      and nrTalonarioCliente  = '0001'
 and tpComprobanteCliente  ='FA' and tpLetraCliente ='B'

 
select *  into  TB_ComprobantesDetalle_0001_192351 from   TB_ComprobantesDetalle   where  nrComprobante  in ('00192351', '00192352','00192353') 
                                      and nrTalonario  = '0001'
 and tpComprobante  ='FA' and tpLetra ='B'

select *  into  tb_comprobantes_0001_192351  from   tb_comprobantes    where   nrComprobante  in ('00192351', '00192352','00192353') 
                                      and nrTalonario  = '0001'
 and tpComprobante  ='FA' and tpLetra  ='B'

select *  into  TB_Cupones_0001_192351   from   TB_Cupones    where  nrComprabanteCliente   in ('00192351', '00192352','00192353') 
                                      and nrTalonarioCliente  = '0001'
 and tpComprobanteCliente  ='FA' and tpLetraCliente ='B'

 
 begin tran 


	delete from   TB_ComprobantesDetalle    where  nrComprobante  in ('00192351', '00192352','00192353') 
										  and nrTalonario  = '0001'
	 and tpComprobante  ='FA' and tpLetra ='B'

	delete from   tb_comprobantes    where   nrComprobante  in ('00192351', '00192352','00192353') 
										  and nrTalonario  = '0001'
	 and tpComprobante  ='FA' and tpLetra  ='B'

	delete from   TB_Cupones    where  nrComprabanteCliente   in ('00192351', '00192352','00192353') 
										  and nrTalonarioCliente  = '0001'
	 and tpComprobanteCliente  ='FA' and tpLetraCliente ='B'
 
commit tran 




exec SP_ActualizarComprobante_v3_7 @nrTalonario_param ='0003',
								   @nrComprobante_param ='00192351',
								   @tpComprobante_param = 'FA',
								   @tpLetra_param = 'B', 
								   @nrTalonario_new_param = '0001',
								   @nrComprobante_new_param = '00192351',
								   @tpComprobante_new_param = 'FA',
								   @tpLetra_new_param = 'B'


exec SP_ActualizarComprobante_v3_7 @nrTalonario_param ='0003',
								   @nrComprobante_param ='00192352',
								   @tpComprobante_param = 'FA',
								   @tpLetra_param = 'B', 
								   @nrTalonario_new_param = '0001',
								   @nrComprobante_new_param = '00192352',
								   @tpComprobante_new_param = 'FA',
								   @tpLetra_new_param = 'B'


exec SP_ActualizarComprobante_v3_7 @nrTalonario_param ='0003',
								   @nrComprobante_param ='00192353',
								   @tpComprobante_param = 'FA',
								   @tpLetra_param = 'B', 
								   @nrTalonario_new_param = '0001',
								   @nrComprobante_new_param = '00192353',
								   @tpComprobante_new_param = 'FA',
								   @tpLetra_new_param = 'B'

 
 



 