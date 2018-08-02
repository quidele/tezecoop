
use dbSG2000
  go
   
     		   
 begin tran

  set dateformat dmy 		

  Exec  sp_obtiene_falta_compensar_v4_2
		
  select  convert(varchar,a.dtCupon,103) as FECHA , a.nrLicencia as LICENCIA, a.nmLicenciatario as LICENCIATARIO,		
          a.tpCupon as CONDDEVENTA, a.nrTalonarioCliente as PDV, a.nrComprabanteCliente
		  as NRO, a.vlMontoCupon as MONTO,  a.dsObservacion AS OBS  from tb_cupones a		
  where   a.flCompensado = 0  and a.flAnulado = 0 and   nrLicencia not in (999,900) and  		
		  a.dtCupon >= '01/01/2009 00:00:00.000'  and 
		  a.dtCupon <= '31/07/2017 00:00:00.000'  and 
		  fleliminar =0  


  	/*	  
  update a
  set     flAnulado = 1	,	
  		  flNoCompensado = 1,
		  dtNoCompensado = GETDATE(),
		  dsObservacion = 'Compensado por Sistema'  
  from tb_cupones a
  where   a.flCompensado = 0  and a.flAnulado = 0 and   nrLicencia not in (999,900) and  		
		  a.dtCupon >= '01/01/2009 00:00:00.000'  and 
		  a.dtCupon <= '01/01/2016 00:00:00.000'  and 
		  fleliminar = 0  
*/
 

Exec  sp_obtiene_falta_compensar_v4_2



-- rollback tran

commit tran 
