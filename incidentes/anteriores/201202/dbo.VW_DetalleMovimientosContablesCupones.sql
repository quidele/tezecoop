
CREATE VIEW dbo.VW_DetalleMovimientosContablesCupones_prueba  
AS  
SELECT DISTINCT   
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
FROM         dbo.TB_MovimientosContables INNER JOIN  
                      dbo.TB_Cupones ON 
                      dbo.TB_MovimientosContables.IdRecibo 
                      = dbo.TB_Cupones.IdRecibo  
  
   
  
  
  
  
  
  
  
  