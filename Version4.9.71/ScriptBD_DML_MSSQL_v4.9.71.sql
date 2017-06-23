
-- Cambios de DML version 4.9.71
use dbSG2000
go 




-- select * from TB_Parametros where grupo_parametro  = 'Mòdulo de Ventas'


delete from TB_Parametros  where dsParametro = 'DESVIO_EN_NUMERACION_CARGA_MANUAL'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('DESVIO_EN_NUMERACION_CARGA_MANUAL','1000','DECIMAL',10,GETDATE(),'creado en la versión 4.9.800','Mòdulo de Ventas',1);


DELETE FROM DiccionariodeDatos where  nmTabla =  'spu_actualizar_puntosdeventa_facturacion_v4_9_71' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v4_9_71','@auto_impresor','@auto_impresor','CHAR','1',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v4_9_71','@nrComprobante','@nrComprobante','INTEGER','8',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v4_9_71','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v4_9_71','@tipo_iva','@tipo_iva','VARCHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v4_9_71','@tpComprobante','@tpComprobante','CHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v4_9_71','@tpFormadePago','@tpFormadePago','CHAR','20',null,null,null,null,null,null,null,null,null,null,null,null);



DELETE FROM DiccionariodeDatos where  nmTabla =  'spu_obtener_puntosdeventa_facturacion_v4_9_71' 



INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v4_9_71','@auto_impresor','@auto_impresor','CHAR','1',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v4_9_71','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v4_9_71','@tipo_iva','@tipo_iva','VARCHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v4_9_71','@tpComprobante','@tpComprobante','CHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v4_9_71','@tpFormadePago','@tpFormadePago','CHAR','20',null,null,null,null,null,null,null,null,null,null,null,null);
