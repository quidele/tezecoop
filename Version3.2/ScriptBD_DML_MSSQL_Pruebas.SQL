-- cambios de DML version 3.2
use dbSG2000_Pruebas
go



-- Ingresar los siguientes datos
-- nrCajaCtaCte	numeric	9 1
-- dtCajaCtaCte	datetime 8 1

delete from DiccionariodeDatos where nmtabla='TB_Cupones'  and  nmCampo='dtCajaCtaCte'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','dtCajaCtaCte','dtCajaCliente','SMALLDATETIME','10','No','No',null,null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmtabla='TB_Cupones'  and  nmCampo='nrCajaCtaCte'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','nrCajaCtaCte','nrCajaCliente','INTEGER','9','No','Yes',null,null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmtabla='sp_desimputarcajapuesto_v3_2'  

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_desimputarcajapuesto_v3_2','@nrCajaPuesto_param','@nrCajaPuesto_param','INTEGER','9','No','No','No',0,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_desimputarcajapuesto_v3_2','@nrCajaAdmActual','@nrCajaAdmActual','NUMERIC','9',null,null,'Yes',2,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_desimputarcajapuesto_v3_2','@dsUsuario_param','@dsUsuario_param','VARCHAR','100',null,null,'Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_desimputarcajapuesto_v3_2','@dsUsuarioCajaPuesto_param','@dsUsuarioCajaPuesto_param','VARCHAR','100',null,null,'Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_desimputarcajapuesto_v3_2','@dsUsuario_Supervisor_param','@dsUsuario_Supervisor_param','VARCHAR','100',null,null,'Yes',3,null,null,null,null,null,'0','0',null);

    
delete from DiccionariodeDatos where nmtabla='sp_obtiene_saldo_cajapuestoimputada_v3_2'  


INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtiene_saldo_cajapuestoimputada_v3_2','@nrCajaPuesto_param','@nrCajaPuesto_param','INTEGER','9','No','No','No',0,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtiene_saldo_cajapuestoimputada_v3_2','@nrCajaAdm_param','@nrCajaAdm_param','NUMERIC','9',null,null,'Yes',2,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtiene_saldo_cajapuestoimputada_v3_2','@tpCajaImputacion_param','@tpCajaImputacion_param','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmtabla='sp_existen_cajas_desimputadas_v3_2'  

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_existen_cajas_desimputadas_v3_2','@nrCajaAdmActual','@nrCajaAdmActual','NUMERIC','9',null,null,'Yes',2,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmtabla='TB_Cajas'   and nmCampo='desimputada'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','desimputada','desimputada','VARCHAR','1',null,null,'No',0,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmtabla='TB_Cajas'   and nmCampo='nrCajaAdmDesimputa'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','nrCajaAdmDesimputa','nrCajaAdmDesimputa','NUMERIC','9',null,null,'No',0,null,null,null,null,null,'0','0',null);


-- campo que identifica el tipo de movimiento: en particular nos interesa la desimputación
delete from DiccionariodeDatos where nmtabla='TB_MovimientosContables'   and nmCampo='tpMovimiento'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_MovimientosContables','tpMovimiento','tpMovimiento','VARCHAR','50','No',null,null,null,null,null,null,null,null,'0','0',null);

delete  from DiccionariodeDatos where nmtabla='SP_puedeOperarUsuarioCajaPuesto_v3_2'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_puedeOperarUsuarioCajaPuesto_v3_2','@pnrCaja_param','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'9000001098','2000001555','3000000022','9000001087','SI','0','5000000004','1');
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_puedeOperarUsuarioCajaPuesto_v3_2','@pdsUsuario_param','Usuario','VARCHAR','10','No','Yes','Yes',5,null,null,null,null,null,'0','0',null);



/* SP_realizarReaperturadelaCajaPuesto_v2_5
 determina si un usuario puede reabrir una caja o no */
DELETE FROM DiccionariodeDatos  WHERE  nmtabla='SP_realizarReaperturadelaCajaPuesto_v3_2';

INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_realizarReaperturadelaCajaPuesto_v3_2','@pnrCaja_param','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'9000001098','2000001555','3000000022','9000001087','SI','0','5000000004','1');
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_realizarReaperturadelaCajaPuesto_v3_2','@pdsUsuario_param','Usuario','VARCHAR','10','No','Yes','Yes',5,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_realizarReaperturadelaCajaPuesto_v3_2','@pdsUsuario_Supervisor_param','dsUsuario_Supervisor','VARCHAR','50',null,null,null,0,null,null,null,'0',null,null,null,null);


--- Campos para manejar los valores imputados/reimputados por las cajas puestos a la caja adm
DELETE FROM DiccionariodeDatos  WHERE  nmtabla='TB_Cajas' and nmCampo='vlSumaCajasPuestosCierrePesos';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlSumaCajasPuestosCierrePesos','vlSumaCajasPuestosCierrePesos','DOUBLE','9','No','No','No',0,'0','0','0','0','SI','0','0','1');

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='TB_Cajas' and nmCampo='vlSumaCajasPuestosCierreDolares';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlSumaCajasPuestosCierreDolares','vlSumaCajasPuestosCierreDolares','DOUBLE','9','No','No','No',0,'0','0','0','0','SI','0','0','1');

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='TB_Cajas' and nmCampo='vlSumaCajasPuestosCierreEuros';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlSumaCajasPuestosCierreEuros','vlSumaCajasPuestosCierreEuros','DOUBLE','9','No','No','No',0,'0','0','0','0','SI','0','0','1');

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='TB_Cajas' and nmCampo='vlSumaCajasPuestosDiferencia';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlSumaCajasPuestosDiferencia','vlSumaCajasPuestosDiferencia','DOUBLE','9','No','No','NO',0,'0','0','0','0','SI','0','0','1');

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='TB_Cajas' and nmCampo='vlDiferenciaCajasPuestosReimputadasPesos';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlDiferenciaCajasPuestosReimputadasPesos','vlDiferenciaCajasPuestosReimputadasPesos','DOUBLE','9','No','No','No',0,'0','0','0','0','SI','0','0','1');

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='TB_Cajas' and nmCampo='vlDiferenciaCajasPuestosReimputadasDolares';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlDiferenciaCajasPuestosReimputadasDolares','vlDiferenciaCajasPuestosReimputadasDolares','DOUBLE','9','No','No','No',0,'0','0','0','0','SI','0','0','1');

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='TB_Cajas' and nmCampo='vlDiferenciaCajasPuestosReimputadasEuros';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlDiferenciaCajasPuestosReimputadasEuros','vlDiferenciaCajasPuestosReimputadasEuros','DOUBLE','9','No','No','No',0,'0','0','0','0','SI','0','0','1');

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='TB_Cajas' and nmCampo='vlDiferenciaCajasPuestosReimputadasDiferencia';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlDiferenciaCajasPuestosReimputadasDiferencia','vlDiferenciaCajasPuestosReimputadasDiferencia','DOUBLE','9','No','No','No',0,'0','0','0','0','SI','0','0','1');

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='TB_Cajas' and nmCampo='nrCajaAdmImputaOrigen';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','nrCajaAdmImputaOrigen','nrCajaAdmImputaOrigen','INTEGER','9','No','No','No',0,'0','0','0','0','SI','0','0','1');

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2' and nmCampo='@nrCajaAdmActual';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2','@nrCajaAdmActual','@nrCajaAdmActual','INTEGER','9','No','No','No',0,'0','0','0','0','SI','0','0','1');

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2' and nmCampo='@nrCajaPuesto_param';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2','@nrCajaPuesto_param','@nrCajaPuesto_param','INTEGER','9','No','No','No',0,'0','0','0','0','SI','0','0','1');

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2' and nmCampo='@tpAccion';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2','@tpAccion','@tpAccion','VARCHAR','30','No','No','No',0,'0','0','0','0','SI','0','0','1');

DELETE FROM DiccionariodeDatos  WHERE  nmtabla='sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2' and nmCampo='@esCajaActual';
INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2','@esCajaActual','@esCajaActual','INTEGER','9','No','No','No',0,'0','0','0','0','SI','0','0','1');


delete from DiccionariodeDatos where nmtabla='sp_versionreporte_v3_2'  and  nmCampo='@dtFechaOperacion'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_versionreporte_v3_2','@dtFechaOperacion','@dtFechaOperacion','SMALLDATETIME','10','No','No',null,null,null,null,null,null,null,'0','0',null);