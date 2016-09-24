

  set dateformat dmy 

  select  a.nrLicencia, a.nmLicenciatario,
          a.tpCupon, a.nrTalonarioCliente, a.nrComprabanteCliente, a.vlMontoCupon,  convert(varchar,a.dtCupon,103) as fecha, a.dsObservacion  from tb_cupones a
  where a.flCompensado = 0 and a.dtCupon <= '31/07/2009' and a.flAnulado = 0 and a.nrLicencia<>999


  select  count(*) from tb_cupones a
  where a.flCompensado = 0 and a.dtCupon <= '31/07/2009' and a.flAnulado = 0 and a.nrLicencia<>999



  select  *  from tb_cupones a
  where a.flCompensado = 0 and a.dtCupon <= '31/07/2009' and a.flAnulado = 0 and a.nrLicencia<>999

  -- Eliminar Cupones
  Update TB_Cupones  
  set    flCompensado=1, dtCompensado = getdate(),  dsObservacion = 'Excluídos previo desdoble de cajas', problema =1
  ---select Count(*) from TB_Cupones 
  where flCompensado = 0 and dtCupon <= '31/07/2009' and flAnulado = 0 and nrLicencia<>999

  
  


  



