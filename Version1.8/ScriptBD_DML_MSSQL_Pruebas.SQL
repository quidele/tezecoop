-- cambios de DML version 1.8
use dbSG2000_pruebas
go


DELETE FROM DiccionariodeDatos
WHERE nmTabla='sco_FondoFijoCajaAnterior_v1_8' and nmCampo = 'p_nrPuesto' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('sco_FondoFijoCajaAnterior_v1_8','p_nrPuesto','p_nrPuesto','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='sco_FondoFijoCajaAnterior_v1_8' and nmCampo = '@nrPuesto' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('sco_FondoFijoCajaAnterior_v1_8','@nrPuesto','@nrPuesto','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_clientes' and nmCampo = 'tpFormadePago' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_clientes','tpFormadePago','tpFormadePago','VARCHAR','20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_clientes' and nmCampo = 'nrPuesto' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_clientes','nrPuesto','nrPuesto','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='sco_Puestos_v1_8' and nmCampo = '@nrPuesto_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('sco_Puestos_v1_8','@nrPuesto_param','@nrPuesto_param','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);





/* actualizar los valores de los numeros de puestos en la tabla de cliente*/

update tb_clientes
set nrPuesto=9


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerMaxcdCliente_v1_8' and nmCampo = '@nrPuesto' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerMaxcdCliente_v1_8','@nrPuesto','@nrPuesto','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_clientes','nrDoc','nrDoc','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


update diccionariodedatos
set tpTipo='VARCHAR', nrTamanio=20
where nmtabla = 'tb_clientes' and nmCampo= 'nrDoc'



DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_Puestos' and nmCampo = 'nrCAI_Talonario_auto' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_Puestos','nrCAI_Talonario_auto','tpFormadePago','INTEGER','14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_Puestos' and nmCampo = 'dtCAI_Talonario_auto' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_Puestos','dtCAI_Talonario_auto','dtCAI_Talonario_auto','SMALLDATIME','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_Puestos' and nmCampo = 'nrCAI_Talonario_auto_empresa' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_Puestos','nrCAI_Talonario_auto_empresa','tpFormadePago','INTEGER','14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_Puestos' and nmCampo = 'dtCAI_Talonario_auto_empresa' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_Puestos','dtCAI_Talonario_auto_empresa','dtCAI_Talonario_auto','SMALLDATIME','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


update diccionariodedatos
set nrOrdenBusqueda=1
where nmtabla = 'tb_clientes' and nmCampo= 'cdCliente'

update diccionariodedatos
set nrOrdenBusqueda=4
where nmtabla = 'tb_clientes' and nmCampo= 'nmNombre'


set dateformat dmy

update tb_puestos
set 
	nrCAI_Talonario_auto=97849156910160,
	dtCAI_Talonario_auto='29/10/2010'
where
	nrTalonario_automatico<>0 and nrTalonario_automatico is not null

update tb_puestos
set 
	nrCAI_Talonario_auto_empresa=97849156910160,
	dtCAI_Talonario_auto_empresa='29/10/2010'
where
	nrTalonario_manual_empresa<>0 and nrTalonario_manual_empresa is not null
