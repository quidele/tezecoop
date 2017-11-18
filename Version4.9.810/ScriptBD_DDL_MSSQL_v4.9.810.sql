-- Cambios de DDL version 4.9.810
use dbSG2000
go

-- select * from TB_Cupones
-- select * from TB_Comprobantes

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='nmEmpresaTarjeta')
	ALTER TABLE dbo.TB_Cupones ADD  nmEmpresaTarjeta varchar(20) NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='nmEmpresaTarjeta')
	ALTER TABLE dbo.TB_Comprobantes ADD  nmEmpresaTarjeta varchar(20) NULL;

