
use dbSG2000
 go
   
     		   
 begin tran

  set dateformat dmy 		

  Exec  sp_obtiene_falta_compensar_v4_2
		

  -- LICENCIATARIO	CONDVENTA	PDV	COMPROBANTE	MONTO	FECHA



  select  a.nrLicencia as LICENCIA, a.nmLicenciatario as LICENCIATARIO ,		
          a.tpCupon as CONDVENTA , a.nrTalonarioCliente as PDV, a.nrComprabanteCliente, 
		  a.vlMontoCupon as MONTO,  convert(varchar,a.dtCupon,103) as FECHA, a.dsObservacion as OBS  from tb_cupones a		
  where   a.flCompensado = 0  and a.flAnulado = 0 and   nrLicencia not in (999,900) and  		
		  year(a.dtCupon) = 2016
		  fleliminar = 0  


  		  
  update a
  set     flAnulado = 1	,	
  		  flNoCompensado = 1,
		  dtNoCompensado = GETDATE(),
		  dsObservacion = 'Compensado por Sistema'  
  from tb_cupones a
  where   a.flCompensado = 0  and a.flAnulado = 0 and   nrLicencia not in (999,900) and  		
		  year(a.dtCupon) = 2016
		  fleliminar = 0  

 

  Exec  sp_obtiene_falta_compensar_v4_2


-- rollback tran

-- commit tran 
