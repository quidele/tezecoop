SELECT     IdMovimiento, dsMovimiento, IdRecibo, IdProveedor, dsProveedor, cdConcepto, tpConcepto, dsConcepto, tpOperacion, vlPesos, vlDolares, vlEuros, nrRecibo, 
                      nrFactura, nrCaja, dsUsuario, dtMovimiento, dsObservacion, nrAnio, dsUsuario_Supervisor, nrCajaPuesto, tpCajaImputacion, dsUsuarioCajaPuesto, 
                      tpMovimiento
FROM         TB_MovimientosContables
WHERE     (dsConcepto LIKE 'DONACION%') AND (dtMovimiento > GETDATE() - 1)