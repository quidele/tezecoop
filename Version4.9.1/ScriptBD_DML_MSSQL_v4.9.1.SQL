-- Cambios de DML version 4.9.1
use dbSG2000
go 




delete diccionariodedatos where nmTabla = 'TB_Comprobantes'  and  nmCampo in  ('nrCuponPosnet')

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Comprobantes','nrCuponPosnet','nrCuponPosnet','NCHAR','25','No','No','No',null,null,null,null,null,null,null,null,null);


delete diccionariodedatos where nmTabla = 'TB_Cupones'  and  nmCampo in  ('nrCuponPosnet')

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','nrCuponPosnet','nrCuponPosnet','NCHAR','25','No','No','No',null,null,null,null,null,null,null,null,null);



delete diccionariodedatos where nmTabla = 'spu_hayViajesenTarjetaconDatosIncompletos_v4_9_1'  

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_hayViajesenTarjetaconDatosIncompletos_v4_9_1','@nrCajaAdmActual','@nrCajaAdmActual','DECIMAL','20',null,null,null,null,null,null,null,null,null,null,null,null);

