
-- Cambios de DML version 4.9.7
use dbSG2000
go 




declare @IdOpcionMenu int

select * from TB_OpcionesMenues

delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu in ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optModifComprobante')
delete from TB_OpcionesMenues where nmOpcionMenu = 'optModifComprobante'

select  @IdOpcionMenu  =  max(IdOpcionMenu) + 1 from TB_OpcionesMenues
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (@IdOpcionMenu,'Modificar Datos del Comprobante','optModifComprobante','Empleado',218,1,1,0);

exec SP_GenerarNuevasOpcionesdeMenues

select * from TB_OpcionesMenues


DELETE FROM  DiccionariodeDatos where nmtabla  = 'SP_ActualizarComprobante_v4_9_7'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@nrComprobante_param','Nro. Comprobante','NRO_COMPROBANTE','12','Yes','No','Yes',2,'115','412','97','50','SI','0','750',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@nrTalonario_param','Nro. Talonario','VARCHAR','4','Yes','No','Yes',7,'1','2','3','4','SI','0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@tpComprobante_param','Tipo de Comprobante','VARCHAR','2','Yes','No','Yes',8,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@tpLetra_param','Letra','VARCHAR','1','Yes','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@nrComprobante_new_param','Nro. Comprobante','NRO_COMPROBANTE','12','Yes','No','Yes',2,'115','412','97','50','SI','0','750',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@nrTalonario_new_param','Nro. Talonario','VARCHAR','4','Yes','No','Yes',7,'1','2','3','4','SI','0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@tpLetra_new_param','Letra','VARCHAR','1','Yes','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@cdCondVenta_new_param','Cond Venta','VARCHAR','20','No','Yes','Yes',10,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@tpComision_new_param','Comisión','VARCHAR','20','No','Yes','Yes',10,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@nrCierre_param','nrCierre','INTEGER','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@dtComprobante_new_param','Fecha Comprobante','SMALLDATETIME','10','No','No','Yes',1,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@vlComision_new_param','@vlComision_new_param','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@tpComprobante_new_param','Tipo de Comprobante','VARCHAR','2','Yes','No','Yes',8,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v4_9_7','@solo_cambio_cabecera_comprobante','solo_cambio_cabecera_comprobante','VARCHAR','2','Yes','No','Yes',8,null,null,null,null,null,'0','0',null);
