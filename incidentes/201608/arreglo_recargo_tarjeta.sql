


select vlRecargoTarjeta , *  from tb_cupones   where vlRecargoTarjeta >0  and flCompensado = 0
 and vlRecargoTarjeta = vlMontoCupon 



 select convert(decimal(10,2)  , replace(vlParametro,',','.')) / 100 from TB_Parametros  where dsParametro  like 'PORC_RECARGO_TC'
 
 
 update x   set  vlRecargoTarjeta =  round(vlMontoCupon * 
      case tpCupon when 'Tarjeta de Crédito' then 
			(select convert(decimal(10,2)  , replace(vlParametro,',','.')) / 100 from TB_Parametros  where dsParametro  like 'PORC_RECARGO_TC') 
       when 'Tarjeta de Débito' then 
	  			(select convert(decimal(10,2)  , replace(vlParametro,',','.')) / 100 from TB_Parametros  where dsParametro  like 'PORC_RECARGO_TD')
      End,0)
   from tb_cupones   x  where vlRecargoTarjeta >0  and flCompensado = 0
 and vlRecargoTarjeta = vlMontoCupon  


 -- Correccion partiendo del detalle del comprobante 

 select y.vlPrecioViaje , vlPrecioTD , vlPrecioTC, vlRecargoTC , vlRecargoTD, x.vlRecargoTarjeta from tb_comprobantes  x inner join TB_ComprobantesDetalle  y 
						on   x.nrComprobante = y.nrComprobante and x.nrTalonario = y.nrTalonario
					     	and  x.tpComprobante = y.tpComprobante and x.tpLetra =  y.tpLetra 
							and cdCondVenta in ('Tarjeta de Débito') 
							where y.vlPrecioTD = vlRecargoTD
							and (isnull(x.vlRecargoTarjeta,0) =0   or  x.vlRecargoTarjeta = x.vlTotalGeneral)





select  x.nrComprobante ,  x.nrTalonario , x.tpComprobante , x.tpLetra ,    x.cdCondVenta , sum(vlRecargoTC) as vlRecargoTD 
		into tb_comprobantes_correccion_recargoTarjetaDe
from tb_comprobantes  x inner join TB_ComprobantesDetalle  y 
						on   x.nrComprobante = y.nrComprobante and x.nrTalonario = y.nrTalonario
					     	and  x.tpComprobante = y.tpComprobante and x.tpLetra =  y.tpLetra 
							and cdCondVenta in ('Tarjeta de Débito') 
							where y.vlPrecioTD = vlRecargoTD 
							and (isnull(x.vlRecargoTarjeta,0) =0   or  x.vlRecargoTarjeta = x.vlTotalGeneral)
group by  x.nrComprobante ,  x.nrTalonario , x.tpComprobante , x.tpLetra ,    x.cdCondVenta 
							     


select vlRecargoTarjeta , vlRecargoTD , y.flCompensado from tb_comprobantes_correccion_recargoTarjetaDe  x inner join TB_Cupones  y 
						on   x.nrComprobante = y.nrComprabanteCliente and x.nrTalonario = y.nrTalonarioCliente
					     	and  x.tpComprobante = y.tpComprobanteCliente and x.tpLetra =  y.tpLetraCliente
							and cdCondVenta in ('Tarjeta de Débito') --and y.vlRecargoTarjeta  <> vlRecargoTD  
										 and y.vlRecargoTarjeta  = vlRecargoTD 
										 	and y.flCompensado = 0

select * from tb_comprobantes_correccion_recargoTarjetaDe 


begin tran 

update  y set    y.vlRecargoTarjeta  = vlRecargoTD 
from tb_comprobantes_correccion_recargoTarjetaDe  x inner join TB_Cupones  y 
						on   x.nrComprobante = y.nrComprabanteCliente and x.nrTalonario = y.nrTalonarioCliente
					     	and  x.tpComprobante = y.tpComprobanteCliente and x.tpLetra =  y.tpLetraCliente
							and x.cdCondVenta = y.tpCupon
							and y.flCompensado = 0
							 and y.vlRecargoTarjeta  = vlRecargoTD 

commit tran

