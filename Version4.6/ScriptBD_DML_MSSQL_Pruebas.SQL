-- Cambios de DML version 4.6
use dbSG2000_pruebas
go 



delete from TB_Parametros  where dsParametro = 'PUESTO_FACTURACION_CTA_CTE'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PUESTO_FACTURACION_CTA_CTE','INTEGER','INTEGER',1,GETDATE(),'creado en la versi�n 4.6.','M�dulo de Ventas',1);
