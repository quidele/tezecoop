-- cambios de DML version 3.4
use dbSG2000
go

set dateformat dmy


DELETE FROM DiccionariodeDatos  WHERE  nmtabla='TB_Productos' and nmCampo='tpDestino';

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Productos','tpDestino','Es Viaje','VARCHAR','20','No','No','Yes',9,null,null,null,null,null,null,null,null);

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='SP_obtenerComisionRetorno_v3_4' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerComisionRetorno_v3_4','@dsCodigoDestinos_param','@dsCodigoDestinos_param','VARCHAR','100',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerComisionRetorno_v3_4','@tpCliente_param','@tpCliente_param','VARCHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerComisionRetorno_v3_4','@tpComision_param','@tpComision_param','VARCHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerComisionRetorno_v3_4','@vlTotalGeneral_param','@vlTotalGeneral_param','FLOAT','10',null,null,null,null,null,null,null,null,null,null,null,null);

