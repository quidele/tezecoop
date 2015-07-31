-- cambios de DML version 1.7
use dbSG2000_Pruebas
go

set dateformat dmy; 

DELETE FROM tb_parametros WHERE  dsParametro ='RESTRICCION_COMPENSACION_ACTIVADA'

INSERT INTO tb_parametros (dsParametro,vlParametro,tpParametro,flNoEditable,nrTamanio,dtActualizacion)  VALUES ('RESTRICCION_COMPENSACION_ACTIVADA','SI','TEXTO',0,2,getdate());


DELETE FROM tb_parametros WHERE  dsParametro ='RESTRICCION_COMPENSACION_HORA_PAGO'

INSERT INTO tb_parametros (dsParametro,vlParametro,tpParametro,flNoEditable,nrTamanio,dtActualizacion)  VALUES ('RESTRICCION_COMPENSACION_HORA_PAGO','06:01:00','TEXTO',0,10,getdate());


DELETE FROM tb_parametros WHERE  dsParametro ='RESTRICCION_COMPENSACION_DIAS_PAGO'

INSERT INTO tb_parametros (dsParametro,vlParametro,tpParametro,flNoEditable,nrTamanio,dtActualizacion)  VALUES ('RESTRICCION_COMPENSACION_DIAS_PAGO','1','ENTERO',0,2,getdate());


UPDATE  diccionariodedatos
SET nmCampoExterno='valor'
 WHERE nmTabla='tb_parametros' and nmCampo = 'vlParametro' 


UPDATE  diccionariodedatos
SET nrTamanio=70
 WHERE nmTabla='tb_parametros' and nmCampo = 'dsParametro' 


