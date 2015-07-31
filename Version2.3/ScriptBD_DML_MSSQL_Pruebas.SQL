-- cambios de DML version 2.3
use dbSG2000_Pruebas
go


update  diccionariodedatos 
set tpTipo = 'NRO_COMPROBANTE'
where nmCampo = 'nrComprobante'


DELETE FROM DiccionariodeDatos WHERE nmTabla='TB_Comisiones' 
and nmCampo = 'tpComision'

INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Comisiones','tpComision','tpComision','VARCHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);



DELETE FROM DiccionariodeDatos WHERE nmTabla='SP_validarComision' 

INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_validarComision','@cdComision_param','@cdComision_param','INTEGER','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_validarComision','@tpComision_param','@cdComision_param','VARCHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_validarComision','@vlMontoMinimo_param','@vlMontoMinimo_param','FLOAT','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_validarComision','@vlMontoMaximo_param','@vlMontoMaximo_param','FLOAT','10',null,null,null,null,null,null,null,null,null,null,null,null);

update DiccionariodeDatos
set nrTamanio=8 where nmtabla='TB_Cajas' and 
nmcampo in ('vlSaldoFinalRealPesos','vlSaldoFinalRealDolares','vlSaldoFinalRealEuros',
            'vlTotalSaldoFinalReal','vlTotalSaldoFinalReal')


DELETE FROM DiccionariodeDatos WHERE nmTabla='SP_obtenerComisionRetorno' 

INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerComisionRetorno','@vlTotalGeneral_param','@vlTotalGeneral_param','FLOAT','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerComisionRetorno','@tpComision_param','@tpComision_param','VARCHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerComisionRetorno','@tpCliente_param','@tpCliente_param','VARCHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerComisionRetorno','@dsCodigoDestinos_param','@dsCodigoDestinos_param','VARCHAR','100',null,null,null,null,null,null,null,null,null,null,null,null);




DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Productos' and nmCampo = 'flMuestraenlaWEB' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('TB_Productos','flMuestraenlaWEB','Mostrar en la WEB','BIT','1',NULL,NULL,'Yes',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Productos' and nmCampo = 'flIncluyeComisionRetorno' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('TB_Productos','flIncluyeComisionRetorno','Comisión Retorno','BIT','1',NULL,NULL,'Yes',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


