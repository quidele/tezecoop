-- Cambios de DML version 4.7
use dbSG2000
go 

delete from TB_Parametros  where dsParametro = 'PUESTO_FACTURACION_ND'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PUESTO_FACTURACION_ND','4','ENTERO',1,GETDATE(),'creado en la versión 4.7.','Mòdulo de Ventas',1);


delete from TB_Parametros  where dsParametro = 'PUESTO_FACTURACION_NC'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PUESTO_FACTURACION_NC','4','ENTERO',1,GETDATE(),'creado en la versión 4.7.','Mòdulo de Ventas',1);


delete from diccionariodedatos  where  nmTabla =  'spu_obtener_puntosdeventa_facturacion_v2_0'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v2_0','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v2_0','@tipo_iva','@tipo_iva','VARCHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v2_0','@auto_impresor','@auto_impresor','CHAR','1',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v2_0','@tpFormadePago','@tpFormadePago','CHAR','20',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v2_0','@tpComprobante','@tpComprobante','CHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);


delete from diccionariodedatos  where  nmTabla =  'sco_Puestos_v4_2'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Puestos_v4_2','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Puestos_v4_2','@dsPuesto_param','@dsPuesto_param','CHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);


--select * from diccionariodedatos  where  nmTabla =  'TB_Puestos' and (nmCampo like '%_nd_ult' or  nmCampo like '%_nc_ult')

delete from diccionariodedatos  where  nmTabla =  'TB_Puestos' and (nmCampo like '%_nd_ult' or  nmCampo like '%_nc_ult')

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','nrComprobante_auto_ctacte_nc_ult','nrComprobante_auto_ctacte_nc_ult','INT','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','nrComprobante_auto_ctacte_nd_ult','nrComprobante_auto_ctacte_nd_ult','INT','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','nrComprobante_auto_empresa_nc_ult','nrComprobante_auto_empresa_nc_ult','INT','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','nrComprobante_auto_empresa_nd_ult','nrComprobante_auto_empresa_nd_ult','INT','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','nrComprobante_automatico_nc_ult','nrComprobante_automatico_nc_ult','INT','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','nrComprobante_automatico_nd_ult','nrComprobante_automatico_nd_ult','INT','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','nrComprobante_manual_ctacte_nc_ult','nrComprobante_manual_ctacte_nc_ult','INT','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','nrComprobante_manual_ctacte_nd_ult','nrComprobante_manual_ctacte_nd_ult','INT','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','nrComprobante_manual_empresa_nc_ult','nrComprobante_manual_empresa_nc_ult','INT','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','nrComprobante_manual_empresa_nd_ult','nrComprobante_manual_empresa_nd_ult','INT','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','nrComprobante_manual_nc_ult','nrComprobante_manual_nc_ult','INT','10','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Puestos','nrComprobante_manual_nd_ult','nrComprobante_manual_nd_ult','INT','10','No','No','No',null,null,null,null,null,null,null,null,null);

delete from diccionariodedatos  where  nmTabla =  'sup_Puestos_v4_2' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sup_Puestos_v4_2','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);



delete from diccionariodedatos  where  nmTabla =  'spu_actualizar_puntosdeventa_facturacion_v2_0'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v2_0','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v2_0','@tipo_iva','@tipo_iva','VARCHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v2_0','@auto_impresor','@auto_impresor','CHAR','1',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v2_0','@tpFormadePago','@tpFormadePago','CHAR','20',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v2_0','@tpComprobante','@tpComprobante','CHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v2_0','@nrComprobante','@nrComprobante','INTEGER','8',null,null,null,null,null,null,null,null,null,null,null,null);



-- Liberamos la opcion de Menu  que realiza la liquidacion de una cta cte
SELECT IdOpcionMenu, dsOpcionMenu, nmOpcionMenu, tpNivelJerarquico, nrorden, nrNivelHoja, flvisible, flCajaAdm
FROM   TB_OpcionesMenues
WHERE  nmOpcionMenu = 'optFacturarCtaCte'


-- Liberamos la opcion de Menu  que realiza la liquidacion de una cta cte para que la pueda realizar cualquier perfil y
-- no solo el perfil de la adm
update   TB_OpcionesMenues set  flCajaAdm = 0 WHERE  nmOpcionMenu = 'optFacturarCtaCte'

-- Crear opciones de MENU para nd y nc
