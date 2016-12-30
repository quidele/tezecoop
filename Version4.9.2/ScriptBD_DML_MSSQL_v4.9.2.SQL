-- Cambios de DML version 4.9
use dbSG2000
go 


delete from TB_Parametros  where dsParametro = 'PORC_RECARGO_TP'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PORC_RECARGO_TP','8,7','DECIMAL',10,GETDATE(),'creado en la versión 4.9.2','Mòdulo de Ventas',1);





