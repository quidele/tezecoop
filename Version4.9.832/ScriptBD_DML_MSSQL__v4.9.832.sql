
-- Cambios de DML version 4.9.832
use dbSG2000
go 




-- select * from TB_Parametros where grupo_parametro  = 'M�dulo de Ventas'


delete from TB_Parametros  where dsParametro = 'DESVIO_EN_NUMERACION_CARGA_MANUAL'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('DESVIO_EN_NUMERACION_CARGA_MANUAL','100','DECIMAL',10,GETDATE(),'creado en la versi�n 4.9.800','M�dulo de Ventas',1);

