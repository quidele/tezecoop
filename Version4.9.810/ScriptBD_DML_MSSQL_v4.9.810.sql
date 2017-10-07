
-- Cambios de DML version 4.9.810
use dbSG2000
go 

delete diccionariodedatos where nmTabla = 'TB_Comprobantes'  and  nmCampo in  ('nmEmpresaTarjeta')

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Comprobantes','nmEmpresaTarjeta','nmEmpresaTarjeta','CHAR','10','No','No','No',null,null,null,null,null,null,null,null,null);


delete diccionariodedatos where nmTabla = 'TB_Cupones'  and  nmCampo in  ('nmEmpresaTarjeta')

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','nmEmpresaTarjeta','nmEmpresaTarjeta','CHAR','10','No','No','No',null,null,null,null,null,null,null,null,null);



SELECT * from TB_Comprobantes  where nmEmpresaTarjeta is not null



SELECT * from TB_Cupones  where nmEmpresaTarjeta is not null