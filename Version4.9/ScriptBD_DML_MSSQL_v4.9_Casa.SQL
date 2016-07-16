-- Cambios de DML version 4.9
use dbSG2000
go 


-- select * from TB_Parametros 

delete from TB_Parametros  where dsParametro = 'RESTRINGE_TARJETAS'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('RESTRINGE_TARJETAS','S','S/N',1,GETDATE(),'creado en la versión 4.9.','Pago a Licenciatario',1);

