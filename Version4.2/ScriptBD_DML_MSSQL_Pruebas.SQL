-- Cambios de DML version 4.2
use dbSG2000_Pruebas
go 


delete from TB_Conceptos  where cdConcepto = 2034

INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,
flEliminar,tpCajaImputacion,tpCreadoPor,
flSumaenCajaAdm,
flSumaenCajaCooperativa,
flSumaenCajaLicenciatarios,
flOcultadoenCajaAdm,
flOcultadoCajaLicenciatario,
flOcultadoCajaCooperativa,
flOcultadoenRegistracion)  VALUES 
(2034,'Cajas','Cobro de Cta. Cte. 990',0,
'Entrada de Dinero',getdate(),0,'Caja de la Cooperativa','Sistema', 1,1,0,0,1,0,1);


delete from diccionariodedatos  where nmtabla = 'SP_obtenerImputacion_v4_2' 


INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v4_2','@nrCaja_param','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'1000000003','2000000001','3000000000','9000000027',null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v4_2','@AsientoModelo_param','Asiento Modelo','VARCHAR','50','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v4_2','@nrCupon_param','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'1000000003','2000000001','3000000000','9000000027',null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v4_2','cdConcepto','Cod. Concepto','INTEGER','5','Yes','No','Yes',2,'1028','2000','2000','9136',null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v4_2','dsConcepto','Descripción','VARCHAR','100','No','No','Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v4_2','tpConcepto','Tipo','VARCHAR','30','No','No','Yes',1,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v4_2','vlImporte','vlImporte','DOUBLE','5','No','No','Yes',null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v4_2','tpOperacion','Operación','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v4_2','moneda','Moneda','VARCHAR','10',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v4_2','tpCajaImputacion','tpCajaImputacion','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);




delete from TB_Parametros  where dsParametro = 'CALCULA_IVA_LIC_990'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('CALCULA_IVA_LIC_990','N','S/N',1,GETDATE(),'creado en la versión 4.2.','Mòdulo de Ventas',1);
