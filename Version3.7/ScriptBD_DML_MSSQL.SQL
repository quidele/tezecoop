-- Cambios de DML version 3.7
use dbSG2000  
go 

declare @maxid as integer

select @maxid = MAX(cdConcepto)+1 from TB_Conceptos 

delete from TB_Conceptos where tpConcepto ='VALOR REAL'

INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,
dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,
flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,
flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion) 
 VALUES (@maxid,'Valor Real','VALOR REAL',2.12,'Neutro',GETDATE(),0,'Caja de la Cooperativa','Usuario',1,1,1,0,0,0,0);
 
 
delete from DiccionariodeDatos where nmTabla = 'TB_Comprobantes' and nmcampo = 'vlPagoReales';
 

INSERT INTO DiccionariodeDatos (
nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,
nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,
vlPuesto5,vlPuesto)  VALUES ('TB_Comprobantes','vlPagoReales',
'Pago Reales','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);

 
delete from DiccionariodeDatos where nmTabla = 'TB_Comprobantes' and nmcampo = 'vlDiaReal';
 

INSERT INTO DiccionariodeDatos (
nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,
nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,
vlPuesto5,vlPuesto)  VALUES ('TB_Comprobantes','vlDiaReal',
'Cotiz Real','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmTabla = 'SP_ObtenerResumenCajaPuesto_v3_7' and nmcampo = '@nrCaja';
 
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ObtenerResumenCajaPuesto_v3_7','@nrCaja','@nrCaja','INTEGER','10',null,null,null,null,null,null,null,null,null,null,null,null);

delete from DiccionariodeDatos where nmTabla = 'SP_PrepararReimpresiondeComprobante_v3_7';
 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v3_7','@nrTalonario','@nrTalonario','VARCHAR','4',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v3_7','@nrComprobante','@nrComprobante','VARCHAR','12',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v3_7','@tpComprobante','@tpComprobante','VARCHAR','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_PrepararReimpresiondeComprobante_v3_7','@tpLetra','@tpLetra','VARCHAR','1',null,null,null,null,null,null,null,null,null,null,null,null);


delete from DiccionariodeDatos where nmTabla = 'rpt_cierredecaja_v3_7';
 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,
            flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5
            ,vlPuesto)  VALUES
             ('rpt_cierredecaja_v3_7','@nrCaja_param','@nrCaja_param','INTEGER',null,
             'No','No','No',null,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmTabla = 'TB_Cajas'  and nmCampo='vlDiaReal';

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,
flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  
VALUES ('TB_Cajas','vlDiaReal','Cotizacion Real','DOUBLE','6','No','No','No',null,null,null,null,
null,null,'0','0',null);



delete from DiccionariodeDatos where nmTabla = 'TB_Cajas'  and nmCampo='vlSaldoFinalRealReales';


INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea
		,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)
	    VALUES ('TB_Cajas','vlSaldoFinalRealReales','vlSaldoFinalRealReales','DOUBLE','8','No','No','No',
	    null,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmTabla = 'TB_Cajas'  and nmCampo='vlSaldoFinalReales';

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,
		flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,
		vlPuesto)  VALUES ('TB_Cajas','vlSaldoFinalReales','vlSaldoFinalReales','DOUBLE','6','No','No','No',
		null,null,null,null,null,null,'0','0',null);


DELETE from DiccionariodeDatos where nmTabla = 'TB_Cajas'  and nmCampo='vlDiferenciaDeCierre';

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlDiferenciaDeCierre','Valor de Diferencia de Cierre','DOUBLE','6','No','No','Yes',6,null,null,null,null,null,'0','0',null);


DELETE from DiccionariodeDatos where nmTabla = 'SP_SumaCajaPuestosCondVenta_v3_7'  and nmCampo='@pnrCaja_param';

INSERT INTO Diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumaCajaPuestosCondVenta_v3_7','@pnrCaja_param','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'9000001098','2000001555','3000000022','9000001087','SI','0','5000000004','1');


DELETE from DiccionariodeDatos where nmTabla = 'sco_cajapuesto_v3_7'  and nmCampo='@nrCaja_param';

INSERT INTO Diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_cajapuesto_v3_7','@nrCaja_param','@nrCaja_param','INTEGER',null,'No','No','No',null,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmTabla = 'TB_Cajas'  and nmCampo='vlFondoFijoReales';

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,
		flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,
		vlPuesto)  VALUES ('TB_Cajas','vlFondoFijoReales','vlFondoFijoReales','DOUBLE','6','No','No','No',
		null,null,null,null,null,null,'0','0',null);
		
		
delete from DiccionariodeDatos where nmTabla = 'sco_FondoFijoCajaAnterior_v3_7'  and nmCampo='@nrPuesto';

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_FondoFijoCajaAnterior_v3_7','@nrPuesto','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'9000001098','2000001555','3000000022','9000001087','SI','0','5000000004','1');


delete from DiccionariodeDatos where nmTabla = 'TB_Cajas'  and nmCampo='vlSaldoInicialReales';


INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlSaldoInicialReales','vlSaldoInicialReales','DOUBLE','53','No','No','No',null,null,null,null,null,null,null,null,null);


delete from DiccionariodeDatos where nmTabla = 'TB_Cajas'  and nmCampo='vlCierreReales';


INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlCierreReales','vlCierreReales','DOUBLE','53','No','No','No',null,null,null,null,null,null,null,null,null);


delete from DiccionariodeDatos where nmTabla = 'TB_Cupones' and nmcampo = 'vlPagoReales';
 

INSERT INTO DiccionariodeDatos (
nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,
nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,
vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','vlPagoReales',
'Pago Reales','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);


 
delete from DiccionariodeDatos where nmTabla = 'TB_Cupones' and nmcampo = 'vlDiaReal';
 




INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v3_7','@nrCaja_param','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'1000000003','2000000001','3000000000','9000000027',null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v3_7','@AsientoModelo_param','Asiento Modelo','VARCHAR','50','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v3_7','@nrCupon_param','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'1000000003','2000000001','3000000000','9000000027',null,'0','0',null);


INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v3_7','cdConcepto','Cod. Concepto','INTEGER','5','Yes','No','Yes',2,'1028','2000','2000','9136',null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v3_7','dsConcepto','Descripción','VARCHAR','100','No','No','Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v3_7','tpConcepto','Tipo','VARCHAR','30','No','No','Yes',1,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v3_7','vlImporte','vlImporte','DOUBLE','5','No','No','Yes',null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v3_7','tpOperacion','Operación','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v3_7','moneda','Moneda','VARCHAR','10',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v3_7','tpCajaImputacion','tpCajaImputacion','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmTabla = 'sco_Comprobantes_cajapuesto_v3_7';


INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','@nrCaja_param','@nrCaja_param','INTEGER',null,'No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','flCargaErronea','Carga Erronea','BIT','1','No','No',null,null,null,null,null,null,'SI','0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','IdReciboCtaCte','IdReciboCtaCte','INTEGER','9','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','flCargaErronea','Carga Erronea','BIT','1','No','No',null,null,null,null,null,null,'SI','0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dsUsuario_Supervisor','dsUsuario_Supervisor','VARCHAR','50',null,null,null,0,null,null,null,'0',null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dtActualizacion','dtActualizacion','DATETIME','16','No',null,'No',null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dsOpcional4','dsOpcional4','VARCHAR','40','No',null,'No',null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','flEliminar','flEliminar','BIT','1',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlSubTotal','vlSubTotal','DOUBLE','6',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlIVA','vlIVA','DOUBLE','6',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','cdCliente','Cod. Cliente','INTEGER','9','No','Yes','Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','cdCondVenta','Cond Venta','VARCHAR','20','No','Yes','Yes',10,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','tpComision','Comisión','VARCHAR','20','No','Yes','Yes',10,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dsUsuario','Usuario','VARCHAR','20','No','Yes','Yes',14,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dsLeyenda','Leyenda','VARCHAR','255','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dtCaja','Fecha Caja','SMALLDATETIME','10','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dtComprobante','Fecha Comprobante','SMALLDATETIME','10','No','No','Yes',1,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dtInsercion','Fecha de Inserción','SMALLDATETIME','10','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','flManual','Factura Manual','VARCHAR','255','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','flSincronizado','flSincronizado','BIT','1','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nrCaja','Nro. Caja','INTEGER','9','No','Yes','Yes',9,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nrComprobante','Nro. Comprobante','NRO_COMPROBANTE','12','Yes','No','Yes',2,'115','412','97','50','SI','0','750',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nrPuesto','Nro. Puesto','INTEGER','9','No','Yes','Yes',6,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nrTalonario','Nro. Talonario','VARCHAR','4','Yes','No','Yes',7,'1','2','3','4','SI','0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','tpComprobante','Tipo de Comprobante','VARCHAR','2','Yes','No','Yes',8,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','tpIVA','Tipo de IVA','VARCHAR','255','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','tpLetra','Letra','VARCHAR','1','Yes','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlGrabado','Grabado','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlPorcentajeIIBB','Porcentaje IIBB','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlPorcentajeIVA','Porcentaje IVA','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlPorcentajeIVAB','Porcentaje IVAB','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlR3337','R3337','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlTotalGeneral','Total General','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlPagoPesos','Pago Pesos','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlPagoEuros','Pago Euros','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlTotalIVAB','Total IVAB','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlTotalR3337','Total R3337','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','tpMoneda','Tipo de Moneda','VARCHAR','10','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dsDomicilio','Domicilio','VARCHAR','70','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dsRazonSocial','Razón Social','VARCHAR','100','No','No','Yes',12,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nmLicenciatario','Licenciatario','VARCHAR','60','No','No','Yes',13,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nmLocalidad','Localidad','VARCHAR','50','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dsEmail','Email','VARCHAR','70','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','cdPostal','Postal','VARCHAR','50','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dtVencimiento','Fecha Vencimiento CAI','SMALLDATETIME','10','No','No',null,null,'17/01/2005','17/01/2005','17/01/2005','17/01/2005',null,'17/01/2005','17/01/2005',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlDiaDolar','vlDiaDolar','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nmApellido','Apellido','VARCHAR','50','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nmNombre','Nombre','VARCHAR','50','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dsOpcional1','Hora Impresión','VARCHAR','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nrLicencia','Nro. Licencia','INTEGER','3','No','No','Yes',5,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nrBultos','Cantidad de Bultos','INTEGER','2','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nrPasajeros','Cantidad de Pasajeros','INTEGER','2','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nrDoc','Nro. CUIT o Doc.','VARCHAR','20','No','No','Yes',11,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlPagoDolares','Pago Dolares','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','cdCodBar','Codigo de Barras','VARCHAR','20','No','No','Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nrTel','Teléfono','VARCHAR','50','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nrCAI','CAI','VARCHAR','14','No','No',null,null,'062141575','062141575','062141575','062141575',null,'062141575','062141575',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlDiaEuro','vlDiaEuro','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dsOpcional2','Destino','VARCHAR','100','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dsOpcional3','Cod. Barras AFIP','VARCHAR','40','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','flAnulado','Anulado','BIT','1','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dtAnulado','Fecha de Anulación','DATETIME','18','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','tpComision','tpComision','VARCHAR','20','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','nmEmpleado','Empleado','VARCHAR','60','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','flmodificadoreaperturacajapuesto','Modificado','VARCHAR','60','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','tpModificacionCajaPuesto','tpModificacionCajaPueso','VARCHAR','50','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','dsObservacionCajaPuesto','dsObservacionCajaPuesto','VARCHAR','400','No','No',null,null,null,null,null,null,null,'0','0',null);


INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Comprobantes_cajapuesto_v3_7','vlPagoReales','Pago Reales','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);



delete from TB_Conceptos where cdConcepto = 2030


INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,
			flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,
			flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)
			 VALUES (2030, 'Cajas','Pago a los Licenciatarios en Reales',0
			 ,'Salida de Dinero','02/02/2008 03:18:19',0,
			'Caja de los Licenciatarios','Sistema',1,1,1,0,0,0,0);



delete from  diccionariodedatos where nmTabla = 'sp_marcarTipodeActualizacionCajaPuesto_v3_7'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_marcarTipodeActualizacionCajaPuesto_v3_7','@nrComprobante_param','Nro. Comprobante','NRO_COMPROBANTE','12','Yes','No','Yes',2,'115','412','97','50','SI','0','750',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_marcarTipodeActualizacionCajaPuesto_v3_7','@nrTalonario_param','Nro. Talonario','VARCHAR','4','Yes','No','Yes',7,'1','2','3','4','SI','0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_marcarTipodeActualizacionCajaPuesto_v3_7','@tpComprobante_param','Tipo de Comprobante','VARCHAR','2','Yes','No','Yes',8,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_marcarTipodeActualizacionCajaPuesto_v3_7','@tpLetra_param','Letra','VARCHAR','1','Yes','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_marcarTipodeActualizacionCajaPuesto_v3_7','@tpModificacionCajaPuesto_param','@tpModificacionCajaPuesto_param','VARCHAR','50','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_marcarTipodeActualizacionCajaPuesto_v3_7','@dsObservacionCajaPuesto_param','@dsObservacionCajaPuesto_param','VARCHAR','400','No','No',null,null,null,null,null,null,null,'0','0',null);

delete from  diccionariodedatos where nmTabla = 'sp_obtenerCondVentayValoresdePagosModificados_v3_7'


INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerCondVentayValoresdePagosModificados_v3_7','@cdCondVenta_param','@cdCondVenta_param','VARCHAR','400','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerCondVentayValoresdePagosModificados_v3_7','@cdCondVenta_new_param','@cdCondVenta_new_param','VARCHAR','400','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerCondVentayValoresdePagosModificados_v3_7','@vlTotalGeneral','@vlTotalGeneral','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerCondVentayValoresdePagosModificados_v3_7','@vlPagoPesos_param','Pago Pesos','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerCondVentayValoresdePagosModificados_v3_7','@vlPagoEuros_param','Pago Euros','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerCondVentayValoresdePagosModificados_v3_7','@vlPagoDolares_param','Pago Dolares','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerCondVentayValoresdePagosModificados_v3_7','@vlPagoReales_param','Pago Reales','DOUBLE','6','No','No',null,null,null,null,null,null,null,'0','0',null);


delete from  diccionariodedatos where nmTabla = 'SP_ActualizarComprobante_v3_7'


INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@nrComprobante_param','Nro. Comprobante','NRO_COMPROBANTE','12','Yes','No','Yes',2,'115','412','97','50','SI','0','750',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@nrTalonario_param','Nro. Talonario','VARCHAR','4','Yes','No','Yes',7,'1','2','3','4','SI','0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@tpComprobante_param','Tipo de Comprobante','VARCHAR','2','Yes','No','Yes',8,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@tpLetra_param','Letra','VARCHAR','1','Yes','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@nrComprobante_new_param','Nro. Comprobante','NRO_COMPROBANTE','12','Yes','No','Yes',2,'115','412','97','50','SI','0','750',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@nrTalonario_new_param','Nro. Talonario','VARCHAR','4','Yes','No','Yes',7,'1','2','3','4','SI','0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@tpLetra_new_param','Letra','VARCHAR','1','Yes','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@cdCondVenta_new_param','Cond Venta','VARCHAR','20','No','Yes','Yes',10,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@tpComision_new_param','Comisión','VARCHAR','20','No','Yes','Yes',10,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@nrCierre_param','nrCierre','INTEGER','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@dtComprobante_new_param','Fecha Comprobante','SMALLDATETIME','10','No','No','Yes',1,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@vlComision_new_param','@vlComision_new_param','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ActualizarComprobante_v3_7','@tpComprobante_new_param','Tipo de Comprobante','VARCHAR','2','Yes','No','Yes',8,null,null,null,null,null,'0','0',null);


update TB_Conceptos set 
dsConcepto = 'PAGO DE COMPROBANTES EN REALES' where dsConcepto
 like 'Pago a los licenciatarios en Reales%'
 
 

delete from  diccionariodedatos where nmTabla = 'sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_7'


 
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_7','@nrCajaAdmActual','@nrCajaAdmActual','INTEGER','9','No','No','No',0,'0','0','0','0','SI','0','0','1');
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_7','@nrCajaPuesto_param','@nrCajaPuesto_param','INTEGER','9','No','No','No',0,'0','0','0','0','SI','0','0','1');
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_7','@tpAccion','@tpAccion','VARCHAR','30','No','No','No',0,'0','0','0','0','SI','0','0','1');
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_7','@esCajaActual','@esCajaActual','INTEGER','9','No','No','No',0,'0','0','0','0','SI','0','0','1');



---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------
--------------------------------------------------------------
---- TEST INTEGRAL EULISES 11-02-2010


delete from DiccionariodeDatos where nmTabla = 'VW_CajadeADMAbierta'  and nmCampo='vlSaldoFinalRealReales';


INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea
		,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)
	    VALUES ('VW_CajadeADMAbierta','vlSaldoFinalRealReales','vlSaldoFinalRealReales','DOUBLE','8','No','No','No',
	    null,null,null,null,null,null,'0','0',null);
	    

delete from DiccionariodeDatos where nmTabla = 'sp_desimputarcajapuesto_v3_7' 


INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_desimputarcajapuesto_v3_7','@dsUsuario_param','@dsUsuario_param','VARCHAR','100',null,null,'Yes',3,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_desimputarcajapuesto_v3_7','@dsUsuario_Supervisor_param','@dsUsuario_Supervisor_param','VARCHAR','100',null,null,'Yes',3,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_desimputarcajapuesto_v3_7','@dsUsuarioCajaPuesto_param','@dsUsuarioCajaPuesto_param','VARCHAR','100',null,null,'Yes',3,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_desimputarcajapuesto_v3_7','@nrCajaAdmActual','@nrCajaAdmActual','NUMERIC','9',null,null,'Yes',2,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_desimputarcajapuesto_v3_7','@nrCajaPuesto_param','@nrCajaPuesto_param','INTEGER','9','No','No','No',0,null,null,null,null,null,null,null,null);



Exec SP_ActualizarComprobante_v3_7 @nrTalonario_param = '0006' ,@nrComprobante_param = '00282585' ,@tpComprobante_param = 'B' ,@tpLetra_param = 'B' ,@nrTalonario_new_param = '0006' ,@nrComprobante_new_param = '00282585' ,@tpComprobante_new_param = 'B' ,@tpLetra_new_param = 'B' ,@dtComprobante_new_param = '08/02/2011' ,@cdCondVenta_new_param = 'Cuenta Corriente' ,@tpComision_new_param = 'A Clientes' ,@vlComision_new_param = 12 ,@nrCierre_param = 3 

