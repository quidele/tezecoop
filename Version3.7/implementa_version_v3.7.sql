


update TB_Cupones set vlPagoReales =0 where flCompensado = 0

ALTER TABLE dbo.TB_Cajas ADD CONSTRAINT
	DF_TB_Cajas_vlDiaReal DEFAULT 0 FOR vlDiaReal
go 

ALTER TABLE dbo.TB_Comprobantes ADD CONSTRAINT
	DF_TB_Comprobantes_vlDiaReal DEFAULT 0 FOR vlDiaReal
go 

ALTER TABLE dbo.TB_Comprobantes_Imprime ADD CONSTRAINT
	DF_TB_Comprobantes_Imprime_vlDiaReal DEFAULT 0 FOR vlDiaReal
go 

ALTER TABLE dbo.TB_Cajas ADD CONSTRAINT
	DF_TB_Cajas_vlSaldoInicialReales DEFAULT 0 FOR vlSaldoInicialReales

go 

ALTER TABLE dbo.TB_Cajas ADD CONSTRAINT
	DF_TB_Cajas_vlSaldoFinalReales DEFAULT 0 FOR vlSaldoFinalReales

go 

ALTER TABLE dbo.TB_Cajas ADD CONSTRAINT
	DF_TB_Cajas_vlCierreReales DEFAULT 0 FOR vlCierreReales	

go 

ALTER TABLE dbo.TB_Cajas ADD CONSTRAINT
	DF_TB_Cajas_vlFondoFijoReales DEFAULT 0 FOR vlFondoFijoReales

go 

ALTER TABLE dbo.TB_ValoresDesimputacionesCajasPuestos ADD CONSTRAINT
	DF_TB_ValoresDesimputacionesCajasPuestos_vlCierreReales
	 DEFAULT 0 FOR vlCierreReales

go 

ALTER TABLE dbo.TB_Cajas ADD CONSTRAINT
	DF_TB_Cajas_vlSumaCajasPuestosCierreReales
	 DEFAULT 0 FOR vlSumaCajasPuestosCierreReales