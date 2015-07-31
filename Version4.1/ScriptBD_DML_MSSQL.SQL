-- Cambios de DML version 4.1
use dbSG2000
go 

delete from diccionariodedatos where nmtabla ='TB_Productos' 
and nmCampo = 'cdComision'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,
		flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,
		vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  
		VALUES ('TB_Productos','cdComision','Comision','INT','10','No','No','Yes',10,null,null,null,null,null,null,null,null);


delete from diccionariodedatos where nmtabla ='sp_obtenerComision_v4_1' 

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerComision_v4_1','@vlTotalGeneral_param','@vlTotalGeneral_param','FLOAT','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerComision_v4_1','@tpComision_param','@tpComision_param','VARCHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerComision_v4_1','@tpCliente_param','@tpCliente_param','VARCHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerComision_v4_1','@dsCodigoDestinos_param','@dsCodigoDestinos_param','VARCHAR','100',null,null,null,null,null,null,null,null,null,null,null,null);


delete from diccionariodedatos where nmtabla ='rpt_ComprobantesManuales_cajapuesto_v3_7' 

INSERT INTO diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda)  VALUES ('rpt_ComprobantesManuales_cajapuesto_v3_7','@nrCaja_param','@nrCaja_param','INTEGER','10',null,null,null,null);

delete from diccionariodedatos where nmtabla ='TB_Puestos' 
and nmCampo = 'flFacturaCtacte'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,
		flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,
		vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  
		VALUES ('TB_Puestos','flFacturaCtacte','Factura Cta. cte.','BIT','1',
		'No','No','Yes',8,null,null,null,null,null,null,null,null);


update TB_Puestos set flFacturaCtacte = 0



delete from diccionariodedatos where nmtabla ='sco_Puestos_v4_1' 
and nmCampo = '@nrPuesto_param'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  
VALUES ('sco_Puestos_v4_1','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);



delete from diccionariodedatos where nmtabla ='sco_Puestos_v4_1' 
and nmCampo = '@nrPuesto_param'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  
VALUES ('sco_Puestos_v4_1','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);

delete from diccionariodedatos where nmtabla ='sup_Puestos_v4_1' 
and nmCampo = '@nrPuesto_param'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  
VALUES ('sup_Puestos_v4_1','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);

