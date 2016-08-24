


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
