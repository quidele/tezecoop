-- Cambios de DML version 3.9
use dbSG2000_Pruebas
go 

delete from DiccionariodeDatos where nmTabla = 'TB_Parametros' and nmcampo = 'grupo_parametro';
 

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,
flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar
,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Parametros','grupo_parametro','Grupo','VARCHAR','40',
'No','No','No',null,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmTabla = 'TB_Parametros' and nmcampo = 'observacion';
 

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,
flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar
,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Parametros','observacion','Grupo','VARCHAR','500',
'No','No','No',null,null,null,null,null,null,'0','0',null);


delete from TB_Parametros
    where dsParametro in ('Valor Euro', 'Valor Dolar', 'Valor Real')


insert into TB_Parametros (dsParametro, dtActualizacion, grupo_parametro, 
					       tpparametro , nrTamanio, vlParametro)
select dsConcepto     as dsParametro,
       GETDATE()      as dtActualizacion,
       'Cotizaciones' as grupo_parametro,
       'DECIMAL'      as tpparametro,
       10             as nrTamanio,
       replace(convert(varchar,vlConcepto),'.',',')     as vlParametro         
       from TB_Conceptos 
       where dsConcepto in ('Valor Euro', 'Valor Dolar', 'Valor Real')
             and dsConcepto  not in (select dsParametro from TB_Parametros)

delete from TB_Conceptos 
       where dsConcepto in ('Valor Euro', 'Valor Dolar', 'Valor Real')
             and dsConcepto   in (select dsParametro from TB_Parametros)
             

delete from DiccionariodeDatos where nmTabla = 'TB_Cupones' and nmcampo = 'flmanual';
 

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,
flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar
,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cupones','flmanual','Manual','VARCHAR','50',
'No','No','No',null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmTabla = 'TB_Cajas' and nmcampo = 'vlDineroDolares';
 
INSERT INTO DiccionariodeDatos (
nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,
nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,
vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlDineroDolares',
'vlDineroDolares','DOUBLE','8','No','No',null,null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmTabla = 'TB_Cajas' and nmcampo = 'vlDineroEuros';
 

INSERT INTO DiccionariodeDatos (
nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,
nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,
vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlDineroEuros',
'vlDineroEuros','DOUBLE','8','No','No',null,null,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmTabla = 'TB_Cajas' and nmcampo = 'vlDineroReales';
 

INSERT INTO DiccionariodeDatos (
nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,
nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,
vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlDineroReales',
'vlDineroReales','DOUBLE','8','No','No',null,null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmTabla = 'TB_Cajas' and nmcampo = 'dsObservacionCC';
 

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,
flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar
,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','dsObservacionCC','dsObservacionCC','VARCHAR','500',
'No','No','No',null,null,null,null,null,null,'0','0',null);


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


delete from DiccionariodeDatos where nmTabla = 'TB_Cajas' and nmcampo = 'vlDiaDolarNuevo';
 
INSERT INTO DiccionariodeDatos (
	nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,
	nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,
	vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlDiaDolarNuevo',
	'vlDiaDolarNuevo','DOUBLE','8','No','No',null,null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmTabla = 'TB_Cajas' and nmcampo = 'vlDiaEuroNuevo';
 

INSERT INTO DiccionariodeDatos (
	nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,
	nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,
	vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlDiaEuroNuevo',
	'vlDiaEuroNuevo','DOUBLE','8','No','No',null,null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmTabla = 'TB_Cajas' and nmcampo = 'vlDiaRealNuevo';
 
INSERT INTO DiccionariodeDatos (
	nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,
	nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,
	vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','vlDiaRealNuevo',
	'vlDiaRealNuevo','DOUBLE','8','No','No',null,null,null,null,null,null,null,'0','0',null);



delete from DiccionariodeDatos where nmTabla = 'sco_cajapuesto_v3_9';


INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,
 flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,
 vlPuesto)  VALUES ('sco_cajapuesto_v3_9','@nrCaja_param','@nrCaja_param','INTEGER',null,
 'No','No','No',null,null,null,null,null,null,'0','0',null);


delete from TB_Conceptos  where cdConcepto = 2032

INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,
flEliminar,tpCajaImputacion,tpCreadoPor,
flSumaenCajaAdm,
flSumaenCajaCooperativa,
flSumaenCajaLicenciatarios,
flOcultadoenCajaAdm,
flOcultadoCajaLicenciatario,
flOcultadoCajaCooperativa,
flOcultadoenRegistracion)  VALUES 
(2032,'Cajas','Dif. por Cambio de Cotizacion(+)',0,
'Entrada de Dinero',getdate(),0,'Caja de la Cooperativa','Sistema', 1,1,0,0,1,0,1);

delete from TB_Conceptos  where cdConcepto = 2033

INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,
flEliminar,tpCajaImputacion,tpCreadoPor,
flSumaenCajaAdm,
flSumaenCajaCooperativa,
flSumaenCajaLicenciatarios,
flOcultadoenCajaAdm,
flOcultadoCajaLicenciatario,
flOcultadoCajaCooperativa,
flOcultadoenRegistracion)  VALUES 
(2033,'Cajas','Dif. por Cambio de Cotizacion(-)',0,
'Salida de Dinero',getdate(),0,'Caja de la Cooperativa','Sistema', 1,1,0,0,1,0,1);


delete from DiccionariodeDatos where nmTabla = 'spu_esdifporCotizacionImputadas_v3_9';


INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,
 flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,
 vlPuesto)  VALUES ('spu_esdifporCotizacionImputadas_v3_9','@nrCajaAdmActual','@nrCajaAdmActual','INTEGER',null,
 'No','No','No',null,null,null,null,null,null,'0','0',null);
 
 
delete from DiccionariodeDatos where nmTabla = 'SP_obtenerCajasPuestosImputadas_v3_7';
 
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerCajasPuestosImputadas_v3_7','@nrCaja_param','@nrCaja_param','INTEGER','9','No','No','No',0,'0','0','0','0','SI','0','0','1');
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerCajasPuestosImputadas_v3_7','@flSumatorio_param','@flSumatorio_param','INTEGER','9','No','No','No',0,'0','0','0','0','SI','0','0','1');



delete from DiccionariodeDatos where nmTabla = 'TB_parametros' and nmcampo = 'flNoEditable';
delete from DiccionariodeDatos where nmTabla = 'TB_parametros' and nmcampo = 'flEditable'; 
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Parametros','flEditable','No Editable','BIT','1',null,null,'Yes',4,null,null,null,null,null,null,null,null);

update TB_parametros set flEditable = '1'



delete from DiccionariodeDatos where nmTabla = 'TB_Proveedores' and nmcampo = 'chofer1';

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto) 
 VALUES ('TB_Proveedores','chofer1','chofer1','VARCHAR','50','No','No','No',null,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmTabla = 'TB_Proveedores' and nmcampo = 'chofer2';

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto) 
 VALUES ('TB_Proveedores','chofer2','chofer2','VARCHAR','50','No','No','No',null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmTabla = 'TB_Proveedores' and nmcampo = 'chofer3';

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto) 
 VALUES ('TB_Proveedores','chofer3','chofer3','VARCHAR','50','No','No','No',null,null,null,null,null,null,'0','0',null);



delete from DiccionariodeDatos where nmTabla = 'TB_Proveedores' and nmcampo = 'telchofer1';

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto) 
 VALUES ('TB_Proveedores','telchofer1','telchofer1','VARCHAR','50','No','No','No',null,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmTabla = 'TB_Proveedores' and nmcampo = 'telchofer2';

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto) 
 VALUES ('TB_Proveedores','telchofer2','telchofer2','VARCHAR','50','No','No','No',null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmTabla = 'TB_Proveedores' and nmcampo = 'telchofer3';

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto) 
 VALUES ('TB_Proveedores','telchofer3','telchofer3','VARCHAR','50','No','No','No',null,null,null,null,null,null,'0','0',null);



delete from DiccionariodeDatos where nmTabla = 'spu_obtenerLicenciatariosTelefonosChoferes_v3_9' and nmcampo = '@pnrLicencia';

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto) 
 VALUES ('spu_obtenerLicenciatariosTelefonosChoferes_v3_9','@pnrLicencia','@pnrLicencia','VARCHAR','50','No','No','No',null,null,null,null,null,null,'0','0',null);


delete from DiccionariodeDatos where nmTabla = 'TB_Proveedores' and nmcampo = 'flcongas'; 

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,
Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Proveedores','flcongas','Con Gas','BIT','1',null,null,'Yes',9,null,null,null,null,null,null,null,null);


delete from DiccionariodeDatos where nmTabla = 'TB_Proveedores' and nmcampo = 'tpmodeloauto';

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto) 
 VALUES ('TB_Proveedores','tpmodeloauto','Modelo de Auto','VARCHAR','20',null,null,'Yes',10,null,null,null,null,null,null,null,null);


delete from DiccionariodeDatos where nmTabla = 'TB_Cupones' and nmcampo = 'datotellic';

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto) 
 VALUES ('TB_Cupones','datotellic','datotellic','VARCHAR','20',null,null,null,null,null,null,null,null,null,null,null,null);



delete from DiccionariodeDatos where nmTabla = 'TB_Cupones' and nmcampo = 'datostelchoferes';

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto) 
 VALUES ('TB_Cupones','datostelchoferes','datostelchoferes','VARCHAR','20',null,null,null,null,null,null,null,null,null,null,null,null);


