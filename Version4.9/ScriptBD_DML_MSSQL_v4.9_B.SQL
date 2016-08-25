-- Cambios de DML version 4.9 B
use dbSG2000
go 



delete from diccionariodedatos  where  nmTabla =  'spu_obtieneDatosCITIVentas_Alicuotas_v4_9'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtieneDatosCITIVentas_Alicuotas_v4_9','@mes','@mes','int','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtieneDatosCITIVentas_Alicuotas_v4_9','@anio','@anio','int','4',null,null,null,null,null,null,null,null,null,null,null,null);

