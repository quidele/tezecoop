-- Cambios de DML version 4.9
use dbSG2000
go 

delete DiccionariodeDatos  where nmTabla = 'SP_Supera_KM_IVA_segunMonto_4_9'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_Supera_KM_IVA_segunMonto_4_9','@tpCategoriaIVA_param','@tpCategoriaIVA_param','VARCHAR','5',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_Supera_KM_IVA_segunMonto_4_9','@vlKilometros_param','@vlKilometros_param','INTEGER','6',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_Supera_KM_IVA_segunMonto_4_9','@vlMonto_param','@vlMonto_param','FLOAT','6',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_Supera_KM_IVA_segunMonto_4_9','@tpComprobante_param','@tpComprobante_param','VARCHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
