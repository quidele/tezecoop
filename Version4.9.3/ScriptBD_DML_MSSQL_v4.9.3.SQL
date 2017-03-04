-- Cambios de DML version 4.9.2
use dbSG2000
go 




delete from TB_Parametros  where dsParametro = 'ELIMINA_RECIBO_DE_OTRA_CAJA'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('ELIMINA_RECIBO_DE_OTRA_CAJA','S','S/N',10,GETDATE(),'creado en la versión 4.9.3','Mòdulo de Pago a Licenciatarios',1);

