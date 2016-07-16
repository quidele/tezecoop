-- Cambios de DML version 4.9
use dbSG2000
go 


-- select * from TB_Parametros 

delete from TB_Parametros  where dsParametro = 'RESTRINGE_TARJETAS'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('RESTRINGE_TARJETAS','S','S/N',1,GETDATE(),'creado en la versión 4.9.','Pago a Licenciatario',1);


delete diccionariodedatos where nmTabla = 'TB_RecibosDetalle'  and  nmCampo in  ('vlRecargoTarjeta' )

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_RecibosDetalle','vlRecargoTarjeta','vlRecargoTarjeta','DOUBLE','6','No','No','No',null,null,null,null,null,null,null,null,null);


delete diccionariodedatos where nmTabla = 'TB_Recibos'  and  nmCampo in  ('vlAcumTarjeta' )

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Recibos','vlAcumTarjeta','vlAcumTarjeta','DOUBLE','6','No','No','No',null,null,null,null,null,null,null,null,null);

