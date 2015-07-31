-- cambios de DML version 1.6
use dbSG2000_pruebas
go


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerIVAVentas_v1_5' and nmCampo = 'Cliente' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerIVAVentas_v1_5','Cliente','Cliente','VARCHAR','70',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerIVAVentas_v1_5' and nmCampo =  'Tipo de Comprobante'


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerIVAVentas_v1_5', 'Tipo de Comprobante', 'Tipo de Comprobante','VARCHAR','20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerIVAVentas_v1_5' and nmCampo =  'Talonario'

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerIVAVentas_v1_5', 'Talonario', 'Talonario','VARCHAR','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerIVAVentas_v1_5' and nmCampo =  'Comprobante'

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerIVAVentas_v1_5', 'Comprobante', 'Comprobante','VARCHAR','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerIVAVentas_v1_5' and nmCampo =  'CUIT'

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerIVAVentas_v1_5', 'CUIT', 'CUIT','VARCHAR','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerIVAVentas_v1_5' and nmCampo =  'CondicionIVA'

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerIVAVentas_v1_5', 'CondicionIVA', 'CondicionIVA','VARCHAR','20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerIVAVentas_v1_5' and nmCampo =  'Importe'

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerIVAVentas_v1_5', 'Importe', 'Importe','DOUBLE',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerIVAVentas_v1_5' and nmCampo =  'IVA'

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerIVAVentas_v1_5', 'IVA', 'IVA','DOUBLE',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerIVAVentas_v1_5' and nmCampo =  'FECHA'

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerIVAVentas_v1_5', 'FECHA', 'FECHA','DATETIME',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerIVAVentas_v1_5' and nmCampo =  'LETRA'

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerIVAVentas_v1_5', 'LETRA', 'LETRA','DATETIME',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerIVAVentas_v1_5' and nmCampo = 'Destino' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerIVAVentas_v1_5','Destino','Destino','VARCHAR','200',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

----------------------------------

set dateformat dmy; 

DELETE FROM tb_parametros WHERE  dsParametro ='CANT_VIAJES_A_COMP'

INSERT INTO tb_parametros (dsParametro,vlParametro,tpParametro,flNoEditable,nrTamanio,dtActualizacion)  VALUES ('CANT_VIAJES_A_COMP','40','DECIMAL',0,3,'03/04/2008 12:51:31');


UPDATE  diccionariodedatos
SET nmCampoExterno='Parámetro'
 WHERE nmTabla='tb_parametros' and nmCampo = 'dsParametro' 


UPDATE  diccionariodedatos
SET nmCampoExterno='Tipo de Dato'
WHERE  nmTabla='tb_parametros' and nmCampo = 'tpParametro' 


UPDATE  diccionariodedatos
SET nmCampoExterno='Tipo de Dato'
WHERE  nmTabla='tb_parametros' and nmCampo = 'tpParametro' 

UPDATE  diccionariodedatos
SET nmCampoExterno='No Editable'
WHERE  nmTabla='tb_parametros' and nmCampo = 'flNoEditable' 



DELETE FROM tb_parametros WHERE  dsParametro ='CTROL_CANT_VIAJES'

INSERT INTO tb_parametros (dsParametro,vlParametro,tpParametro,flNoEditable,nrTamanio,dtActualizacion)  VALUES ('CTROL_CANT_VIAJES','40','DECIMAL',0,3,'03/04/2008 12:51:31');



DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_parametros' and nmCampo =  'dtActualizacion'

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_parametros', 'dtActualizacion', 'dtActualizacion','DATETIME',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_productos' and nmCampo =  'vlPrecioxKilometro'

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_productos', 'vlPrecioxKilometro', 'vlPrecioxKilometro','DOUBLE',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


---------------------

DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_CalcularIVA' and nmCampo = '@precio_menos_iva_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_CalcularIVA','@precio_menos_iva_param','@precio_menos_iva_param','FLOAT','6',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_CalcularIVA' and nmCampo = '@tpCategoriaIVA_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_CalcularIVA','@tpCategoriaIVA_param','@tpCategoriaIVA_param','VARCHAR','5',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

---------------------------------

DELETE FROM DiccionariodeDatos
WHERE nmTabla='VW_DetalleMovimientosContablesCupones' and nmCampo =  'vlIVA'

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('VW_DetalleMovimientosContablesCupones', 'vlIVA', 'IVA','DOUBLE',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

-------------------------------------------


DELETE FROM DiccionariodeDatos
WHERE nmTabla='VW_DetalleMovimientosContablesCupones' and nmCampo =  'vlIVA'

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('VW_DetalleMovimientosContablesCupones', 'vlIVA', 'IVA','DOUBLE',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

