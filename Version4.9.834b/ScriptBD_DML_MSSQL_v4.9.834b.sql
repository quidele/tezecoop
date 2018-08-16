
-- Cambios de DML version 4.9.834b
use dbSG2000
go 



DELETE FROM DiccionariodeDatos WHERE nmTabla='TB_Comprobantes' and nmCampo = 'nrcae' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('TB_Comprobantes','nrcae','nrcae','VARCHAR','15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


  
DELETE FROM DiccionariodeDatos WHERE nmTabla='TB_Comprobantes' and nmCampo = 'dtVencimientoCAE' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('TB_Comprobantes','dtVencimientoCAE','dtVencimientoCAE','SMALLDATETIME','15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
