-- cambios de DML version 2.0
use dbSG2000
go


---update  diccionariodedatos 
---set tpTipo = 'NRO_COMPROBANTE'
---where nmCampo = 'nrComprobante'

DELETE FROM DiccionariodeDatos WHERE nmTabla='SP_ObtenerIVAVentas_v2_1' 

INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','FECHA','FECHA','VARCHAR','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','Tipo','Tipo','VARCHAR','4',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','Nro COMP','Nro COMP','VARCHAR','13',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','RAZON_SOCIAL','RAZON_SOCIAL','VARCHAR','70',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','CAT_IVA','CAT_IVA','VARCHAR','4',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','CUIT/DNI','CUIT/DNI','VARCHAR','14',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','EXENTO','EXENTO','FLOAT','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','GRAVADO','GRAVADO','FLOAT','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','IVA','IVA','FLOAT','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','IMPORTE','IMPORTE','FLOAT','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerIVAVentas_v2_1','ANULADO','ANULADO','VARCHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);

