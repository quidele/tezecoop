-- cambios de DML version 3.5
use dbSG2000
go

delete from diccionariodedatos  where nmTabla='TB_Cupones' and  nmCampo='dsLeyenda'

INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','dsLeyenda','dsLeyenda','VARCHAR','100','No','No',null,null,null,null,null,null,null,'0','0',null);


/*generamos la configuraciones de la nueva opcion de menu */
delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu = ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optResumenesRecaudaciones')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optResumenesRecaudaciones'

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (68,'Resúmenes Recaudaciones','optResumenesRecaudaciones','Empleado',204.1,1,1,0);

exec SP_GenerarNuevasOpcionesdeMenues 



delete from diccionariodedatos  where nmTabla='SP_rpt_recaudacion_v3_5' 



INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_rpt_recaudacion_v3_5','vlMontoCupon','Monto Cupon','DOUBLE','6',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_rpt_recaudacion_v3_5','vlCantidad','Cantidad','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_rpt_recaudacion_v3_5','vlIVA','IVA','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_rpt_recaudacion_v3_5','vlComision','Comisión','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_rpt_recaudacion_v3_5','flcond_grupo','flcond_grupo','INTEGER','1','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_rpt_recaudacion_v3_5','tpCupon','Tipo de Cupon','VARCHAR','20','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_rpt_recaudacion_v3_5','@dtCupon_desde_param','Fecha Cupón Desde','DATETIME','16','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_rpt_recaudacion_v3_5','@dtCupon_hasta_param','Fecha Cupón Hasta','DATETIME','16','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_rpt_recaudacion_v3_5','@nrLicencia_param','Licencia','INTEGER','3','No','No',null,null,null,null,null,null,null,'0','0',null);