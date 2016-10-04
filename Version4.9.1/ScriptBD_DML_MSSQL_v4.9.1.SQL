-- Cambios de DML version 4.9.1
use dbSG2000
go 




delete diccionariodedatos where nmTabla = 'TB_Comprobantes'  and  nmCampo in  ('nrCuponPosnet')

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Comprobantes','nrCuponPosnet','nrCuponPosnet','NCHAR','25','No','No','No',null,null,null,null,null,null,null,null,null);


delete diccionariodedatos where nmTabla = 'TB_Cupones'  and  nmCampo in  ('nrCuponPosnet')

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','nrCuponPosnet','nrCuponPosnet','NCHAR','25','No','No','No',null,null,null,null,null,null,null,null,null);



delete diccionariodedatos where nmTabla = 'spu_hayViajesenTarjetaconDatosIncompletos_v4_9_1'  

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_hayViajesenTarjetaconDatosIncompletos_v4_9_1','@nrCajaAdmActual','@nrCajaAdmActual','DECIMAL','20',null,null,null,null,null,null,null,null,null,null,null,null);




--- CORRECCION DE LA dtCobradoalCliente para que el programa no arroje ERROR
SELECT nrLicencia,  flCobradoalCliente , dtCobradoalCliente, *
  FROM TB_Cupones  WHERE TB_Cupones.flEliminar = 0   AND  TB_Cupones.flCompensado = 0  
  AND  TB_Cupones.flAnulado = 0  and dtCobradoalCliente is null   and flCobradoalCliente = 1 
  and tpCupon like 'Tarjeta%'




update  c set  c.dtCobradoalCliente  = '20161001'
  FROM TB_Cupones  c WHERE c.flEliminar = 0  AND  c.flCompensado = 0  
  AND  c.flAnulado = 0  and c.dtCobradoalCliente is null   and c.flCobradoalCliente = 1
    and tpCupon like 'Tarjeta%'
