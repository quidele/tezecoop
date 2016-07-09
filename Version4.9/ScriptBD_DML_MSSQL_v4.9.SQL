-- Cambios de DML version 4.9
use dbSG2000
go 




delete diccionariodedatos where nmTabla = 'TB_Comprobantes'  and  nmCampo in  ('nrDocTarjeta' , 'nrTarjeta' , 'tpDocTarjeta')

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Comprobantes','nrDocTarjeta','nrDocTarjeta','NCHAR','25','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Comprobantes','tpDocTarjeta','tpDocTarjeta','NCHAR','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Comprobantes','nrTarjeta','nrTarjeta','VARCHAR','50','No','No','No',null,null,null,null,null,null,null,null,null);


delete diccionariodedatos where nmTabla = 'TB_Cupones'  and  nmCampo in  ('nrDocTarjeta' , 'nrTarjeta' , 'tpDocTarjeta')

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','nrDocTarjeta','nrDocTarjeta','NCHAR','25','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','tpDocTarjeta','tpDocTarjeta','NCHAR','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','nrTarjeta','nrTarjeta','VARCHAR','50','No','No','No',null,null,null,null,null,null,null,null,null);

-- select * from  diccionariodedatos where nmTabla = 'TB_Cupones'  and  nmCampo in  ('vlRecargoTarjeta' )
--select * from  diccionariodedatos where nmTabla = 'TB_Cupones'  and  nmCampo in  ('vlComision' )

delete diccionariodedatos where nmTabla = 'TB_Cupones'  and  nmCampo in  ('vlRecargoTarjeta' )


INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','vlRecargoTarjeta','vlRecargoTarjeta','DOUBLE','6','No','No','No',null,null,null,null,null,null,null,null,null);



-- PARAMETROS DE PORCENTAJES DEW RECARGO PARA VENTAS CON TARJETA
delete from TB_Parametros  where dsParametro = 'PORC_RECARGO_TD'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PORC_RECARGO_TD','8,6','DECIMAL',10,GETDATE(),'creado en la versión 4.9.','Mòdulo de Ventas',1);

delete from TB_Parametros  where dsParametro = 'PORC_RECARGO_TC'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PORC_RECARGO_TC','8,7','DECIMAL',10,GETDATE(),'creado en la versión 4.9.','Mòdulo de Ventas',1);


