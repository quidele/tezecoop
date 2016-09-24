

  set dateformat dmy 

  select  a.nrLicencia, a.nmLicenciatario,
          a.tpCupon, a.nrTalonarioCliente, a.nrComprabanteCliente, a.vlMontoCupon,  convert(varchar,a.dtCupon,103) as fecha, a.dsObservacion  from tb_cupones a
  where a.flCompensado = 0 and a.dtCupon <= '31/10/2008' and a.flAnulado = 0 and a.nrLicencia<>999

  
 
  

  
  


  



