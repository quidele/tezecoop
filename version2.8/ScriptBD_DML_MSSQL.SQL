-- cambios de DML version 2.8
use dbSG2000
go


delete from DiccionariodeDatos where nmtabla  = 'SP_ObtenerMaxnrCaja_v2_8'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerMaxnrCaja_v2_8','p_nrPuesto','p_nrPuesto','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerMaxnrCaja_v2_8','@nrPuesto','@nrPuesto','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);


