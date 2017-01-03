-- Cambios de DML version 4.9
use dbSG2000
go 


delete from TB_Parametros  where dsParametro = 'PORC_RECARGO_TP'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PORC_RECARGO_TP','8,7','DECIMAL',10,GETDATE(),'creado en la versión 4.9.2','Mòdulo de Ventas',1);



delete from  diccionariodedatos where nmTabla = 'rpt_cierredecaja_v4_9_2' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('rpt_cierredecaja_v4_9_2','@nrCaja_param','@nrCaja_param','INTEGER',null,'No','No','No',null,null,null,null,null,null,'0','0',null);

 


