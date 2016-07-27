-- Cambios de DML version 4.9
use dbSG2000
go 




delete diccionariodedatos where nmTabla = 'TB_Comprobantes'  and  nmCampo in  ('nrDocTarjeta' , 'nrTarjeta' , 'tpDocTarjeta')

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Comprobantes','nrDocTarjeta','nrDocTarjeta','NCHAR','25','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Comprobantes','tpDocTarjeta','tpDocTarjeta','NCHAR','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Comprobantes','nrTarjeta','nrTarjeta','VARCHAR','50','No','No','No',null,null,null,null,null,null,null,null,null);


delete diccionariodedatos where nmTabla = 'TB_Cupones'  and  nmCampo in  ('nrDocTarjeta' , 'nrTarjeta' , 'tpDocTarjeta')

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','nrDocTarjeta','nrDocTarjeta','NCHAR','25','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','tpDocTarjeta','tpDocTarjeta','NCHAR','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','nrTarjeta','nrTarjeta','VARCHAR','50','No','No','No',null,null,null,null,null,null,null,null,null);

-- select * from  diccionariodedatos where nmTabla = 'TB_Cupones'  and  nmCampo in  ('vlRecargoTarjeta' )
--select * from  diccionariodedatos where nmTabla = 'TB_Cupones'  and  nmCampo in  ('vlComision' )

delete diccionariodedatos where nmTabla = 'TB_Cupones'  and  nmCampo in  ('vlRecargoTarjeta' )

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','vlRecargoTarjeta','vlRecargoTarjeta','DOUBLE','6','No','No','No',null,null,null,null,null,null,null,null,null);

delete diccionariodedatos where nmTabla = 'TB_Comprobantes'  and  nmCampo in  ('vlRecargoTarjeta' )

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Comprobantes','vlRecargoTarjeta','vlRecargoTarjeta','DOUBLE','6','No','No','No',null,null,null,null,null,null,null,null,null);


-- PARAMETROS DE PORCENTAJES DEW RECARGO PARA VENTAS CON TARJETA
delete from TB_Parametros  where dsParametro = 'PORC_RECARGO_TD'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PORC_RECARGO_TD','8,6','DECIMAL',10,GETDATE(),'creado en la versión 4.9.','Mòdulo de Ventas',1);

delete from TB_Parametros  where dsParametro = 'PORC_RECARGO_TC'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PORC_RECARGO_TC','8,7','DECIMAL',10,GETDATE(),'creado en la versión 4.9.','Mòdulo de Ventas',1);



delete diccionariodedatos where nmTabla = 'TB_ComprobantesDetalle'  and  nmCampo in  ('vlPrecioTC'  , 'vlRecargoTC' , 'vlPrecioTD', 'vlRecargoTD')


INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_ComprobantesDetalle','vlPrecioTC','vlPrecioTC','FLOAT','53','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_ComprobantesDetalle','vlPrecioTD','vlPrecioTD','FLOAT','53','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_ComprobantesDetalle','vlRecargoTC','vlRecargoTC','FLOAT','53','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_ComprobantesDetalle','vlRecargoTD','vlRecargoTD','FLOAT','53','No','No','No',null,null,null,null,null,null,null,null,null);



delete diccionariodedatos where nmTabla = 'SP_PrepararReimpresiondeComprobante_v4_9'  

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v4_9','@dsUsuario','@dsUsuario','VARCHAR','20',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v4_9','@nrComprobante','@nrComprobante','VARCHAR','12',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v4_9','@nrTalonario','@nrTalonario','VARCHAR','4',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v4_9','@tpComprobante','@tpComprobante','VARCHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v4_9','@tpLetra','@tpLetra','VARCHAR','1',null,null,null,null,null,null,null,null,null,null,null,null);

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



select * from TB_OpcionesMenues


declare @IdOpcionMenu int


delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu in ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'mnConciliaciones')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'mnConciliaciones'


select  @IdOpcionMenu  =  max(IdOpcionMenu) + 1 from TB_OpcionesMenues

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (@IdOpcionMenu,'Conciliaciones','mnConciliaciones','Empleado',214,0,1,0);

exec SP_GenerarNuevasOpcionesdeMenues

delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu in ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optConciliarViajes')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optConciliarViajes'


select  @IdOpcionMenu  =  max(IdOpcionMenu) + 1 from TB_OpcionesMenues

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (@IdOpcionMenu,'Conciliar Viajes','optConciliarViajes','Empleado',215,1,1,0);

exec SP_GenerarNuevasOpcionesdeMenues

