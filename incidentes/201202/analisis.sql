
SELECT  DISTINCT   
                      dbo.TB_MovimientosContables.tpOperacion, 
                      dbo.TB_MovimientosContables.nrCaja, 
                      dbo.TB_MovimientosContables.dsConcepto,   
                      dbo.TB_Cupones.nrLicencia, 
                      dbo.TB_Cupones.tpCupon, 
                      dbo.TB_Cupones.nrTalonarioCliente, 
                      dbo.TB_Cupones.nrComprabanteCliente,   
                      dbo.TB_Cupones.vlPagoPesos   AS vlPesos, 
                      dbo.TB_Cupones.vlPagoDolares AS vlDolares, 
                      dbo.TB_Cupones.vlPagoEuros   AS vlEuros,   
                      dbo.TB_Cupones.vlComision, 
                      dbo.TB_Cupones.vlMontoCupon, 
                      dbo.TB_MovimientosContables.nrRecibo, 
                      dbo.TB_Cupones.flCompensado,   
                      dbo.TB_Cupones.dtCompensado, 
                      dbo.TB_MovimientosContables.dsUsuario, 
                      dbo.TB_Cupones.vlIVA  
FROM             dbo.TB_Cupones  INNER JOIN dbo.TB_MovimientosContables
                       ON dbo.TB_MovimientosContables.IdRecibo = dbo.TB_Cupones.IdRecibo  
                      where   dsMovimiento like ('%Pago a Licenciatario en Reales%')
                         and TB_Cupones.nrCajaLicenciatario  = 9000002739
                       and TB_MovimientosContables.nrCaja = 9000002739

                      
                       and
  ( dbo.TB_MovimientosContables.IdRecibo is null or dbo.TB_Cupones.IdRecibo  is null)
   
  select SUM(vlComision) from 
  TB_Cupones where               TB_Cupones.nrCajaLicenciatario  = 9000002739
  
  
  
  select sum(vlPagoPesos ), SUM(vlComision ) from TB_Cupones  
  where TB_Cupones.nrCajaLicenciatario  = 9000002739
  
  select SUM(vlPesos) from TB_MovimientosContables where 
  nrCaja = 9000002739
  and dsMovimiento ='Pago a Licenciatario'
  
  
    select * from TB_MovimientosContables where 
  nrCaja = 9000002739
  and dsMovimiento ='Pago a Licenciatario'
  and IdRecibo not in (select nrRecibo 
   from TB_Cupones  
  where nrCajaLicenciatario  = 9000002739)
  
  select nrCupon    
   from TB_Cupones  
  where nrCajaLicenciatario  = 9000002739
  and IdRecibo not in 
  ( select IdRecibo  from TB_MovimientosContables where 
  nrCaja = 9000002739  and dsConcepto = 'PAGO DE COMPROBANTES')
  
  select * from TB_MovimientosContables where IdRecibo = 1000196243
  
  select * from tb_cupones where nrCupon = 9001067497
  
  select * from TB_Cupones  where IdRecibo = 1000196243
   
   