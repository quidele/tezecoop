-- cambios de DML version 2.0
use dbSG2000_Pruebas
go


---update  diccionariodedatos 
---set tpTipo = 'NRO_COMPROBANTE'
---where nmCampo = 'nrComprobante'


DELETE FROM DiccionariodeDatos WHERE nmTabla='SP_ObtenerIVAVentas_v2_1' 

INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','Fecha','Fecha','VARCHAR','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','Talonario','Talonario','VARCHAR','4',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','Tipo','Tipo','VARCHAR','4',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','Comprobante','Número','INTEGER','8',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','Cod. Cli.','Cod. Cli.','VARCHAR','3',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','Razon Social','Razon Social','VARCHAR','70',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','C.U.I.T/DNI','C.U.I.T/DNI','VARCHAR','14',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','Cond. IVA','C.U.I.T/DNI','VARCHAR','14',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','IVA','IVA','FLOAT','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','Total','Total','FLOAT','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','Anulado','Anulado','VARCHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);

