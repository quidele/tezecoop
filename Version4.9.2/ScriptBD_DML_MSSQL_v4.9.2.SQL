-- Cambios de DML version 4.9.2
use dbSG2000
go 


delete from TB_Parametros  where dsParametro = 'PORC_RECARGO_TP'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PORC_RECARGO_TP','8,7','DECIMAL',10,GETDATE(),'creado en la versión 4.9.2','Mòdulo de Ventas',1);



delete from  diccionariodedatos where nmTabla = 'rpt_cierredecaja_v4_9_2' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('rpt_cierredecaja_v4_9_2','@nrCaja_param','@nrCaja_param','INTEGER',null,'No','No','No',null,null,null,null,null,null,'0','0',null);

 


 
delete diccionariodedatos where nmTabla = 'TB_ComprobantesDetalle'  and  nmCampo in  ('vlPrecioTP'  , 'vlRecargoTP' )


INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_ComprobantesDetalle','vlPrecioTP','vlPrecioTP','FLOAT','53','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_ComprobantesDetalle','vlRecargoTP','vlRecargoTP','FLOAT','53','No','No','No',null,null,null,null,null,null,null,null,null);




update  diccionariodedatos  set tpTipo ='VARCHAR' where nmTabla in ( 'TB_Comprobantes' , 'TB_Cupones')  and  nmCampo like 'nrDocTarjeta'


update  diccionariodedatos  set tpTipo ='INT' where nmTabla in ( 'TB_Comprobantes' , 'TB_Cupones')  and  nmCampo like 'nrTarjeta'


select * from  diccionariodedatos  
where nmTabla in ( 'TB_Comprobantes' , 'TB_Cupones')   and  nmCampo like 'nrCuponPosnet%'


update  diccionariodedatos  set tpTipo ='INT' where nmTabla in ( 'TB_Comprobantes' , 'TB_Cupones')   and  nmCampo like 'nrCuponPosnet%'

