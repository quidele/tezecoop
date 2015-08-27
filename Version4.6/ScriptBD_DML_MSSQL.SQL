-- Cambios de DML version 4.6
use dbSG2000
go 




delete from TB_Parametros  where dsParametro = 'PUESTO_FACTURACION_CTA_CTE'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PUESTO_FACTURACION_CTA_CTE','4','ENTERO',1,GETDATE(),'creado en la versión 4.6.','Mòdulo de Ventas',1);

