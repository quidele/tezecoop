-- Cambios de DML version 4.7
use dbSG2000
go 

delete from TB_Parametros  where dsParametro = 'PUESTO_FACTURACION_ND'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PUESTO_FACTURACION_ND','4','ENTERO',1,GETDATE(),'creado en la versión 4.7.','Mòdulo de Ventas',1);


delete from TB_Parametros  where dsParametro = 'PUESTO_FACTURACION_NC'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('PUESTO_FACTURACION_NC','4','ENTERO',1,GETDATE(),'creado en la versión 4.7.','Mòdulo de Ventas',1);


delete from diccionariodedatos  where  nmTabla =  'spu_obtener_puntosdeventa_facturacion_v4_7'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v4_7','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v4_7','@tipo_iva','@tipo_iva','VARCHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v4_7','@auto_impresor','@auto_impresor','CHAR','1',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v4_7','@tpFormadePago','@tpFormadePago','CHAR','20',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtener_puntosdeventa_facturacion_v4_7','@tpComprobante','@tpComprobante','CHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);


delete from diccionariodedatos  where  nmTabla =  'sco_Puestos_v4_7'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Puestos_v4_7','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Puestos_v4_7','@dsPuesto_param','@dsPuesto_param','CHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);


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

delete from diccionariodedatos  where  nmTabla =  'sup_Puestos_v4_7' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sup_Puestos_v4_7','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);



delete from diccionariodedatos  where  nmTabla =  'spu_actualizar_puntosdeventa_facturacion_v4_7'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v4_7','@nrPuesto_param','@nrPuesto_param','INTEGER','3',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v4_7','@tipo_iva','@tipo_iva','VARCHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v4_7','@auto_impresor','@auto_impresor','CHAR','1',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v4_7','@tpFormadePago','@tpFormadePago','CHAR','20',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v4_7','@tpComprobante','@tpComprobante','CHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_actualizar_puntosdeventa_facturacion_v4_7','@nrComprobante','@nrComprobante','INTEGER','8',null,null,null,null,null,null,null,null,null,null,null,null);



-- Liberamos la opcion de Menu  que realiza la liquidacion de una cta cte
/* 
SELECT IdOpcionMenu, dsOpcionMenu, nmOpcionMenu, tpNivelJerarquico, nrorden, nrNivelHoja, flvisible, flCajaAdm
FROM   TB_OpcionesMenues   order by nrorden

*/


-- Liberamos la opcion de Menu  que realiza la liquidacion de una cta cte para que la pueda realizar cualquier perfil y
-- no solo el perfil de la adm
update   TB_OpcionesMenues set  flCajaAdm = 0 WHERE  nmOpcionMenu = 'optFacturarCtaCte'

-- Crear opciones de MENU para nd y nc



delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu in ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optNotasCredito')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optNotasCredito'

declare @IdOpcionMenu int

select  @IdOpcionMenu  =  max(IdOpcionMenu) + 1 from TB_OpcionesMenues

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (@IdOpcionMenu,'Notas de Crédito','optNotasCredito','Empleado',102.1,1,1,0);



select  @IdOpcionMenu  =  max(IdOpcionMenu) + 1 from TB_OpcionesMenues

/* nuevas opciones de menu para el manejo de cajas de los puestos */
delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu in ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optNotasDebito')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optNotasDebito'

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (@IdOpcionMenu,'Notas de Dédito','optNotasDebito','Empleado',102.2,1,1,0);


exec SP_GenerarNuevasOpcionesdeMenues


UPDATE   TB_Proveedores SET  nrLicencia = NULL where nmApellido = 'tango' AND nrLicencia = 999

go

delete from diccionariodedatos where nmtabla ='sp_obtenerComision_v4_7' 

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerComision_v4_7','@tpComprobante_param','@tpComprobante_param','CHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerComision_v4_7','@vlTotalGeneral_param','@vlTotalGeneral_param','FLOAT','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerComision_v4_7','@tpComision_param','@tpComision_param','VARCHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerComision_v4_7','@tpCliente_param','@tpCliente_param','VARCHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerComision_v4_7','@dsCodigoDestinos_param','@dsCodigoDestinos_param','VARCHAR','100',null,null,null,null,null,null,null,null,null,null,null,null);

delete from diccionariodedatos where nmtabla ='SP_PrepararReimpresiondeComprobante_v4_7'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v4_7','@nrComprobante','@nrComprobante','VARCHAR','12',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v4_7','@nrTalonario','@nrTalonario','VARCHAR','4',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v4_7','@tpComprobante','@tpComprobante','VARCHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v4_7','@tpLetra','@tpLetra','VARCHAR','1',null,null,null,null,null,null,null,null,null,null,null,null);



INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (1,'FACTURAS A','FA','A');
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (2,'NOTAS DE DEBITO A','ND','A');
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (3,'NOTAS DE CREDITO A','NC','A');
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (4,'RECIBOS A',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (5,'NOTAS DE VENTA AL CONTADO A',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (6,'FACTURAS B','FA','B');
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (7,'NOTAS DE DEBITO B','ND','B');
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (8,'NOTAS DE CREDITO B','NC','B');
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (9,'RECIBOS B',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (10,'NOTAS DE VENTA AL CONTADO B',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (11,'FACTURAS C','FA','C');
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (12,'NOTAS DE DEBITO C','ND','C');
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (13,'NOTAS DE CREDITO C','NC','C');
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (14,'DOCUMENTO ADUANERO',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (15,'RECIBOS C',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (16,'NOTAS DE VENTA AL CONTADO C',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (19,'Factura de Exportación',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (20,'Nota de Débito por Operaciones con el Exterior',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (21,'Nota de Crédito por Operaciones con el Exterior',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (22,'FACTURAS - PERMISO EXPORTACION SIMPLIFICADO - DTO. 855/97',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (30,'COMPROBANTES DE COMPRA DE BIENES USADOS',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (31,'MANDATO - CONSIGNACION',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (32,'COMPROBANTES PARA RECICLAR MATERIALES',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (34,'COMPROBANTES A DEL APARTADO A  INCISO F  R G  N  1415',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (35,'COMPROBANTES B DEL ANEXO I, APARTADO A, INC. F), RG N° 1415',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (36,'COMPROBANTES C DEL Anexo I, Apartado A, INC.F), R.G. N° 1415',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (37,'NOTAS DE DEBITO O DOCUMENTO EQUIVALENTE QUE CUMPLAN CON LA R.G. N° 1415',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (38,'NOTAS DE CREDITO O DOCMENTO EQUIVALENTE QUE CUMPLAN CON LA R.G. N° 1415',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (39,'OTROS COMPROBANTES A QUE CUMPLEN CON LA R G  1415',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (40,'OTROS COMPROBANTES B QUE CUMPLAN CON LA R.G. N° 1415',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (41,'OTROS COMPROBANTES C QUE CUMPLAN CON LA R.G. N° 1415',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (50,'RECIBO FACTURA A  REGIMEN DE FACTURA DE CREDITO',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (51,'FACTURAS M','FA','M');
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (52,'NOTAS DE DEBITO M','NC','M');
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (53,'NOTAS DE CREDITO M','ND','M');
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (54,'RECIBOS M',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (55,'NOTAS DE VENTA AL CONTADO M',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (56,'COMPROBANTES M DEL ANEXO I  APARTADO A  INC F   R G  N  1415',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (57,'OTROS COMPROBANTES M QUE CUMPLAN CON LA R G  N  1415',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (58,'CUENTAS DE VENTA Y LIQUIDO PRODUCTO M',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (59,'LIQUIDACIONES M',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (60,'CUENTAS DE VENTA Y LIQUIDO PRODUCTO A',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (61,'CUENTAS DE VENTA Y LIQUIDO PRODUCTO B',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (63,'LIQUIDACIONES A',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (64,'LIQUIDACIONES B',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (65,'NOTAS DE CREDITO DE COMPROBANTES CON COD. 34, 39, 58, 59, 60, 63, 96, 97',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (66,'DESPACHO DE IMPORTACION',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (67,'IMPORTACION DE SERVICIOS',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (68,'LIQUIDACION C',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (70,'RECIBOS FACTURA DE CREDITO',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (71,'CREDITO FISCAL POR CONTRIBUCIONES PATRONALES',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (73,'FORMULARIO 1116 RT',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (74,'CARTA DE PORTE PARA EL TRANSPORTE AUTOMOTOR PARA GRANOS',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (75,'CARTA DE PORTE PARA EL TRANSPORTE FERROVIARIO PARA GRANOS',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (77,null,null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (78,null,null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (79,null,null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (80,'COMPROBANTE DIARIO DE CIERRE (ZETA)',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (81,'TIQUE FACTURA A   CONTROLADORES FISCALES',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (82,'TIQUE - FACTURA B',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (83,'TIQUE',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (84,'COMPROBANTE   FACTURA DE SERVICIOS PUBLICOS   INTERESES FINANCIEROS',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (85,'NOTA DE CREDITO   SERVICIOS PUBLICOS   NOTA DE CREDITO CONTROLADORES FISCALES',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (86,'NOTA DE DEBITO   SERVICIOS PUBLICOS',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (87,'OTROS COMPROBANTES - SERVICIOS DEL EXTERIOR',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (88,'OTROS COMPROBANTES - DOCUMENTOS EXCEPTUADOS / REMITO ELECTRONICO',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (89,'OTROS COMPROBANTES - DOCUMENTOS EXCEPTUADOS - NOTAS DE DEBITO / RESUMEN DE DATOS',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (90,'OTROS COMPROBANTES - DOCUMENTOS EXCEPTUADOS - NOTAS DE CREDITO',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (91,'REMITOS R',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (92,'AJUSTES CONTABLES QUE INCREMENTAN EL DEBITO FISCAL',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (93,'AJUSTES CONTABLES QUE DISMINUYEN EL DEBITO FISCAL',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (94,'AJUSTES CONTABLES QUE INCREMENTAN EL CREDITO FISCAL',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (95,'AJUSTES CONTABLES QUE DISMINUYEN EL CREDITO FISCAL',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (96,'FORMULARIO 1116 B',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (97,'FORMULARIO 1116 C',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (99,'OTROS COMP  QUE NO CUMPLEN CON LA R G  3419 Y SUS MODIF',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (101,'AJUSTE ANUAL PROVENIENTE DE LA  D J  DEL IVA  POSITIVO',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (102,'AJUSTE ANUAL PROVENIENTE DE LA  D J  DEL IVA  NEGATIVO',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (103,'NOTA DE ASIGNACION',null,null);
INSERT INTO tipo_comprobanteAFIP (cod_tipo_comprobante,Descripción,tpComprobante,tpLetra)  VALUES (104,'NOTA DE CREDITO DE ASIGNACION',null,null);


delete from TB_Parametros  where dsParametro = 'MONTO_EXIGE_CUIT_CUIL_DNI'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('MONTO_EXIGE_CUIT_CUIL_DNI','6','ENTERO',1000,GETDATE(),'creado en la versión 4.7.','Mòdulo de Ventas',1);

