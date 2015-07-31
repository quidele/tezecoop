USE [dbSG2000]
GO

drop index  [IX_TB_Cupones_2] ON [dbo].[TB_Cupones]; 

go 

/****** Object:  Index [IX_TB_Cupones_2]    Script Date: 12/13/2010 23:21:27 ******/
CREATE NONCLUSTERED INDEX [IX_TB_Cupones_2] ON [dbo].[TB_Cupones] 
(
	[nrLicencia] ASC,
	[tpCupon] ASC,
	[flCompensado] ASC,
	[flAnulado] ASC



)
INCLUDE (
  nrCupon, cdCliente, nmLicenciatario,  vlMontoCupon,
  vlaFavordelLicenciatario, vlafavorAdmin, vlPagoPesos, vlPagoEuros,
  vlPagoDolares, vlComision, dtCupon, nrTalonarioCliente, nrComprabanteCliente, 
  flCobradoalCliente, cdCodBar,  dsObservacion, 
  vlIVA, vlPagoReales, fleliminar)
 
 WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO





drop index  [IX_TB_Cupones_7] ON [dbo].[TB_Cupones]; 

go 

/****** Object:  Index [IX_TB_Cupones_2]    Script Date: 12/13/2010 23:21:27 ******/
CREATE NONCLUSTERED INDEX [IX_TB_Cupones_7] ON [dbo].[TB_Cupones] 
(

	[flCompensado] ASC,
	[flAnulado] ASC,
	[nrLicencia] ASC,
	[tpCupon] ASC

)
INCLUDE ( vlMontoCupon, vlPagoPesos, vlPagoEuros, vlPagoDolares, 
          vlComision, dtCupon, vlIVA)
 
 WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, 
 SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, 
 ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
 ON [PRIMARY]
GO
