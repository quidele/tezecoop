-- cambios de DML version 2.0
use dbSG2000_Pruebas
go



---update  diccionariodedatos 
---set tpTipo = 'NRO_COMPROBANTE'
---where nmCampo = 'nrComprobante'

delete from diccionariodedatos
where nmtabla = 'SP_Supera_KM_IVA_segunMonto_2_0'

INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_Supera_KM_IVA_segunMonto_2_0','@tpCategoriaIVA_param','@tpCategoriaIVA_param','VARCHAR','5',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_Supera_KM_IVA_segunMonto_2_0','@vlKilometros_param','@vlKilometros_param','INTEGER','6',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_Supera_KM_IVA_segunMonto_2_0','@vlMonto_param','@vlMonto_param','FLOAT','6',null,null,null,null,null,null,null,null,null,null,null,null);


delete from diccionariodedatos
where nmtabla = 'SP_sepuedecompensar_2_0'

INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_sepuedecompensar_2_0','@dtcupon_param','@dtcupon_param','DATETIME','16',null,null,null,null,null,null,null,null,null,null,null,null);

