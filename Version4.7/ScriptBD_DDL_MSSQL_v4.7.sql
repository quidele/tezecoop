-- Cambios de DDL version 4.7
use dbSG2000
go

    
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_automatico_nd_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_automatico_nd_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_auto_empresa_nd_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_auto_empresa_nd_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_auto_ctacte_nd_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_auto_ctacte_nd_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_nd_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_manual_nd_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_empresa_nd_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_manual_empresa_nd_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_ctacte_nd_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_manual_ctacte_nd_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_auto_empresa_nc_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_automatico_nc_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_auto_ctacte_nc_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_auto_empresa_nc_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_nc_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_auto_ctacte_nc_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_empresa_nc_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_manual_nc_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_ctacte_nc_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_manual_empresa_nc_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_ctacte_nc_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_manual_ctacte_nc_ult	int	null
