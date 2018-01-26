
-- Cambios de DML version 4.9.832
use dbSG2000
go 

delete from TB_Parametros  where dsParametro = 'Empresa'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('Empresa','TAEZE','TEXTO',10,GETDATE(),'creado en la versión 4.9.832','Mòdulo de Obligaciones',1);


