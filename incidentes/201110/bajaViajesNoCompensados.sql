  use dbSG2000_Pruebas 
  go
  
  
  set dateformat dmy 

  select  a.nrLicencia, a.nmLicenciatario,
          a.tpCupon, a.nrTalonarioCliente, a.nrComprabanteCliente, a.vlMontoCupon,  convert(varchar,a.dtCupon,103) as fecha, a.dsObservacion  from tb_cupones a
  where   a.flCompensado = 0  and a.flAnulado = 0 and   nrLicencia not in (999,900) and  
		  a.dtCupon >= '01/01/2009 00:00:00.000'  and 
		  a.dtCupon <= '01/01/2009 23:59:59.000'  and 
		  fleliminar =0
	
  use dbSG2000_Pruebas 
  go
    
  set dateformat dmy 
  		   
  begin tran
  		  
  update a
  set     flAnulado = 1	,	
  		  flNoCompensado = 1,
		  dtNoCompensado = GETDATE()    
  from tb_cupones a
  where   a.flCompensado = 0  and a.flAnulado = 0 and   nrLicencia not in (999,900) and  
		  a.dtCupon >= '01/01/2009 00:00:00.000'  and 
		  a.dtCupon <= '20/06/2011 23:59:59.000'  and 
		  fleliminar = 0

 rollback tran
 
 commit tran
 
		  