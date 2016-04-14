
use dbSG2000 
go


-- select * from tmp_comprobantes_sin_cuit

 --- DEBERIAN EXISTIR lOS 204 viajes
 select cdCliente , nrDoc , dsRazonSocial , x.dsOpcional4  , vlTotalGeneral   from  tb_comprobantes  x inner join  tmp_comprobantes_sin_cuit  y  
							on  x.nrTalonario = y.nrTalonario 
								and  x.nrComprobante  = y.nrComprobante 
									and  x.tpComprobante   = y.tpComprobante 
										and  x.tpLetra    = y.tpLetra 
										-- and nrDoc is null



select cdCliente , nrDoc , dsRazonSocial , x.dsOpcional4 into  tb_comprobantes_Viajesmayor1000sinCUIT  from  tb_comprobantes  x inner join  tb_comproAerolineas  y  
							on  x.nrTalonario = y.nrTalonario 
								and  x.nrComprobante  = y.nrComprobante 
									and  x.tpComprobante   = y.tpComprobante 
										and  x.tpLetra    = y.tpLetra and nrDoc is null


 --- DEBERIAN EXISTIR lOS 204 viajes
update x set  cdCliente = 1 , nrDoc = y.nrCUITCliente  , dsRazonSocial = nombre_completo_cliente  
from  tb_comprobantes  x inner join  tmp_comprobantes_sin_cuit  y  
							on  x.nrTalonario = y.nrTalonario 
								and  x.nrComprobante  = y.nrComprobante 
									and  x.tpComprobante   = y.tpComprobante 
										and  x.tpLetra    = y.tpLetra  


select cdCliente   from  TB_Cupones   x inner join  tmp_comprobantes_sin_cuit  y  
							on  x.nrTalonarioCliente = y.nrTalonario 
								and  x.nrComprabanteCliente   = y.nrComprobante 
									and  x.tpComprobanteCliente    = y.tpComprobante 
										and  x.tpLetraCliente     = y.tpLetra 


update x set  cdCliente = 1   --- Actualizamos la tabla de cupones 
from  tb_cupones  x inner join  tmp_comprobantes_sin_cuit  y  
							on  x.nrTalonarioCliente  = y.nrTalonario 
								and  x.nrComprabantecliente  = y.nrComprobante 
									and  x.tpComprobanteCliente   = y.tpComprobante 
										and  x.tpLetraCliente    = y.tpLetra  


select cdCliente   from  TB_Cupones   x inner join  tmp_comprobantes_sin_cuit  y  
							on  x.nrTalonarioCliente = y.nrTalonario 
								and  x.nrComprabanteCliente   = y.nrComprobante 
									and  x.tpComprobanteCliente    = y.tpComprobante 
										and  x.tpLetraCliente     = y.tpLetra 
											--- and  (cdCliente = '1' or cdCliente is null)












