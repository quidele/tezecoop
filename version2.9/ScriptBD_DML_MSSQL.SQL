-- cambios de DML version 2.9
use dbSG2000
go


/****************************************************/
/* División de cajas: 				    */
/****************************************************/
/* 

cdConcepto	tpConcepto	dsConcepto	tpOperacion	tpCajaImputacion	tpCreadoPor	flSumaenAdm
1028	Caja de la Cooperativa	Ingreso de dinero por comisiones 	Entrada de Dinero	Caja de la Cooperativa	Sistema	1
1063	Caja de la Cooperativa	Cobro de Cta. cte.	Entrada de Dinero	Caja de la Cooperativa	Sistema	1
1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
1064	Caja de la Cooperativa	Cobro IVA al Licenciatario	Entrada de Dinero	Caja de la Cooperativa	Sistema	1
2000	Caja de los Licenciatarios	Ingreso de dinero caja de los puestos (Contado)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2001	Caja de la Cooperativa	Diferencia operadora(+)	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
2002	Caja de la Cooperativa	Diferencia operadora(-)	Salida de Dinero	Caja de la Cooperativa	Sistema	0
2004	Caja de la Cooperativa	Ingreso Retención IVA	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
2005	Caja de la Cooperativa	Diferencia Fondo Fijo(+)	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
2006	Caja de la Cooperativa	Diferencia Fondo Fijo(-)	Salida de Dinero	Caja de la Cooperativa	Sistema	0
2007	Caja de los Licenciatarios	Egreso de dinero por comisiones (Contado)	Salida de Dinero	Caja de los Licenciatarios	Sistema	0
2008	Caja de los Licenciatarios	Egreso Retención IVA	Salida de Dinero	Caja de los Licenciatarios	Sistema	0
2010	Caja de la Cooperativa	Ingreso de dinero por comisiones (Retorno)	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
2011	Caja de los Licenciatarios	Ingreso de dinero caja de los puestos (Retorno)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2012	Caja de los Licenciatarios	Ingreso de dinero caja de los puestos (CD)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2013	Caja de los Licenciatarios	Ingreso de dinero caja de los puestos (CC)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2015	Caja de la Cooperativa	Ingreso de dinero por comisiones(CC)	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
2016	Caja de los Licenciatarios	Egreso de dinero por comisiones (Retorno)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2017	Caja de los Licenciatarios	Egreso de dinero por comisiones (CD)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2018	Caja de los Licenciatarios	Egreso de dinero por comisiones (CC)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2019	Caja de la Cooperativa	Ingreso de dinero por comisiones(Contado)	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
2014	Caja de la Cooperativa	Ingreso de dinero por comisiones(CD)	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
						

*/


select * from tb_movimientoscontables where nrcajapuesto is not null  or cdConcepto =2020
--delete from tb_movimientoscontables where nrcajapuesto is not null  or cdConcepto =2020

delete from TB_Conceptos where tpCreadoPor='Sistema'  and  (cdConcepto NOT IN (1027, 1028, 1063, 1064))

update TB_Conceptos set tpCajaImputacion='Caja de la Cooperativa',
			tpCreadoPor='Usuario',
			/* flSumaenAdm=1 */
			flSumaenCajaAdm=1,
			flSumaenCajaCooperativa=1,
			flSumaenCajaLicenciatarios=1,
			flOcultadoenCajaAdm=0,
			flOcultadoCajaLicenciatario=0,
			flOcultadoCajaCooperativa=0

update TB_Conceptos set tpCreadoPor='Sistema'
where  (cdConcepto IN (1027, 1028, 1063, 1064))

set dateformat dmy

INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2000,'Cajas','Ingreso de dinero caja de los puestos (Contado)',0,'Entrada de Dinero','28/08/2009 10:36:41',0,'Caja de los Licenciatarios','Sistema',1,1,1,0,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2001,'Cajas','Diferencia operadora(+)',0,'Entrada de Dinero','14/07/2009 10:22:48',0,'Caja de la Cooperativa','Sistema',1,1,1,0,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2002,'Cajas','Diferencia operadora(-)',0,'Salida de Dinero','14/07/2009 10:22:57',0,'Caja de la Cooperativa','Sistema',1,1,1,0,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2004,'Cajas','Ingreso Retención IVA',0,'Entrada de Dinero','14/07/2009 10:23:34',0,'Caja de la Cooperativa','Sistema',1,1,1,0,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2005,'Cajas','Diferencia Fondo Fijo(+)',0,'Entrada de Dinero','14/07/2009 10:23:42',0,'Caja de la Cooperativa','Sistema',1,1,1,0,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2006,'Cajas','Diferencia Fondo Fijo(-)',0,'Salida de Dinero','14/07/2009 10:23:50',0,'Caja de la Cooperativa','Sistema',1,1,1,0,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2007,'Cajas','Egreso de dinero por comisiones (Contado)',0,'Salida de Dinero','14/07/2009 10:23:58',0,'Caja de los Licenciatarios','Sistema',1,1,1,1,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2008,'Cajas','Egreso Retención IVA',0,'Salida de Dinero','14/07/2009 10:24:07',0,'Caja de los Licenciatarios','Sistema',1,1,1,0,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2010,'Cajas','Ingreso de dinero por comisiones (Retorno)',0,'Entrada de Dinero','14/07/2009 10:24:22',0,'Caja de la Cooperativa','Sistema',1,1,1,1,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2011,'Cajas','Ingreso de dinero caja de los puestos (Retorno)',0,'Entrada de Dinero','28/08/2009 10:36:18',0,'Caja de los Licenciatarios','Sistema',0,0,0,1,1,1,1);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2012,'Cajas','Ingreso de dinero caja de los puestos (CD)',0,'Entrada de Dinero','28/08/2009 10:36:02',0,'Caja de los Licenciatarios','Sistema',0,0,0,1,1,1,1);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2013,'Cajas','Ingreso de dinero de Caja cooperativa (CC)',0,'Entrada de Dinero','28/08/2009 10:40:15',0,'Caja de los Licenciatarios','Sistema',1,0,1,1,0,1,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2014,'Cajas','Ingreso de dinero por comisiones(CD)',0,'Entrada de Dinero','14/07/2009 10:24:22',0,'Caja de la Cooperativa','Sistema',1,1,1,1,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2015,'Cajas','Ingreso de dinero por comisiones(CC)',0,'Entrada de Dinero','27/08/2009 11:46:16',0,'Caja de la Cooperativa','Sistema',1,1,1,1,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2016,'Cajas','Egreso de dinero por comisiones (Retorno)',0,'Salida de Dinero','14/07/2009 10:24:22',0,'Caja de los Licenciatarios','Sistema',1,1,1,1,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2017,'Cajas','Egreso de dinero por comisiones (CD)',0,'Salida de Dinero','14/07/2009 10:24:22',0,'Caja de los Licenciatarios','Sistema',1,1,1,1,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2018,'Cajas','Egreso de dinero por comisiones (CC)',0,'Salida de Dinero','14/07/2009 10:24:22',0,'Caja de los Licenciatarios','Sistema',1,1,1,1,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2019,'Cajas','Ingreso de dinero por comisiones(Contado)',0,'Entrada de Dinero','14/07/2009 10:24:22',0,'Caja de la Cooperativa','Sistema',1,1,1,1,0,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2020,'Cajas','Ingreso Compensatorio por comisiones',0,'Entrada de Dinero','28/08/2009 11:34:30',0,'Caja de la Cooperativa','Sistema',1,1,0,0,1,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2021,'Cajas','Egreso de dinero a Caja Lic. pago (CC)',0,'Salida de Dinero','28/08/2009 11:01:29',0,'Caja de la Cooperativa','Sistema',1,1,0,1,1,0,0);

delete from TB_Conceptos where cdConcepto in (2022, 2023)

INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2022,'Caja de la Cooperativa','Egreso a saldo inicial caja licenciatarios',0,'Salida de Dinero','05/09/2009 11:53:08',0,'Caja de la Cooperativa','Usuario',1,1,0,0,1,0,0);
INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,flEliminar,tpCajaImputacion,tpCreadoPor,flSumaenCajaAdm,flSumaenCajaCooperativa,flSumaenCajaLicenciatarios,flOcultadoenCajaAdm,flOcultadoCajaLicenciatario,flOcultadoCajaCooperativa,flOcultadoenRegistracion)  VALUES (2023,'Caja de los Licenciatarios','Carga Saldo Inicial',0,'Entrada de Dinero','05/09/2009 11:53:24',0,'Caja de los Licenciatarios','Usuario',1,0,1,0,0,1,0);




/**************************************/
/* Armando la caja del licenciatario  */
update TB_Conceptos 
set tpCajaImputacion='Caja de los Licenciatarios'
    -- dsConcepto = 'Pago a los Licenciatarios',
    -- tpConcepto='Caja de los Licenciatarios'
where cdConcepto = 1027 


/* ajustamos el tpconcepto */
update  tb_conceptos
set tpConcepto='Cajas'
where tpcreadopor ='Sistema'

update  tb_conceptos
set tpConcepto='Cajas'
where tpConcepto is null


/* ajustamos la configuracion de la nueva opcion de menu */
delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu = ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optRegistracionCajaPuestoCajaADM')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optRegistracionCajaPuestoCajaADM'

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (61,'Registración Caja Puesto -> Caja Adm.','optRegistracionCajaPuestoCajaADM','Empleado',8.3,1,1,0);

exec SP_GenerarNuevasOpcionesdeMenues

delete FROM DiccionariodeDatos WHERE nmTabla = 'VW_CajasPuestos_v2_9'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','flSincronizado','flSincronizado','BIT','1',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','dtEstadoAprobacion','Fecha estado','DATETIME','16','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','tpEstadoAprobacion','Estado','VARCHAR','50','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','dsUsuario','Usuario','VARCHAR','10','No','Yes','Yes',5,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','dtCierre','Fecha de Cierre','DATETIME','18','No','No','Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','nrPuesto','Nro. Puesto','INTEGER','9','No','Yes','Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlSaldoFinalPesos','Saldo Final en Pesos','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','flCajaAdm','Caja de Adm.','BIT','1','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlSaldoInicialEuros','Saldo Inicial en Euros','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','hrCierre','hrCierre','VARCHAR','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlSaldoFinalEuros','Saldo Final en Euros','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','hrApertura','hrApertura','VARCHAR','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlCierreEuros','Cierre Euros','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlDiferenciaDeCierre','Valor de Diferencia de Cierre','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlSaldoFinalRealEuros','vlSaldoFinalRealEuros','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlTotalSaldoFinalReal','vlTotalSaldoFinalReal','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlSaldoFinalPesos','vlSaldoFinalPesos','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlSaldoFinallDolares','vlSaldoFinallDolares','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlCierreDolares','Cierre Dolares','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','dsDiferenciaDeCierre','Obs. Diferencia de Cierre','VARCHAR','50','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlSaldoFinalRealPesos','vlSaldoFinalRealPesos','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlSaldoFinalRealDolares','vlSaldoFinalRealDolares','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlTotalSaldoFinal','vlTotaSaldolFinal','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlSaldoFinalEuros','vlSaldoFinalEuros','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','tpAcceso','tpAcceso','VARCHAR','50','No',null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','dtApertura','Fecha de Apertura','DATETIME','18','No','No','Yes',2,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','nrCaja','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'1000000003','2000000001','3000000000','9000000027',null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlSaldoInicialPesos','Saldo Inicial en Pesos','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','flEstado','Cierre Caja','BIT','1','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlSaldoInicialDolares','Saldo Inicial en Dolares','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlDiaDolar','Cotizacion Dolar','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlSaldoFinalDolares','Saldo Final en Dolares','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlDiaEuro','Cotizacion Euro','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','vlCierrePesos','Cierre Pesos','DOUBLE','6','No','No','No',null,null,null,null,null,null,'0','0',null);

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_CajasPuestos_v2_9','flImputado','flImputado','BIT','1','No','No','No',null,null,null,null,null,null,'0','0',null);


DELETE FROM DiccionariodeDatos WHERE nmTabla = 'SP_obtenerImputacion_v2_9'


INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v2_9','@nrCaja_param','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'1000000003','2000000001','3000000000','9000000027',null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v2_9','@AsientoModelo_param','Asiento Modelo','VARCHAR','50','No','No','No',null,null,null,null,null,null,'0','0',null);

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v2_9','cdConcepto','Cod. Concepto','INTEGER','5','Yes','No','Yes',2,'1028','2000','2000','9136',null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v2_9','dsConcepto','Descripción','VARCHAR','100','No','No','Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v2_9','tpConcepto','Tipo','VARCHAR','30','No','No','Yes',1,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v2_9','vlImporte','vlImporte','DOUBLE','5','No','No','Yes',null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v2_9','tpOperacion','Operación','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v2_9','moneda','Moneda','VARCHAR','10',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerImputacion_v2_9','tpCajaImputacion','tpCajaImputacion','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);



/* sp_obtenerCajasRechazadas_v2_9
 determina si un usuario puede reabrir una caja o no */
DELETE FROM DiccionariodeDatos  WHERE  nmtabla='sp_obtenerCajasRechazadas_v2_9';

INSERT INTO DiccionariodeDatos   ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sp_obtenerCajasRechazadas_v2_9','@pdsUsuario_param','Usuario','VARCHAR','10','No','Yes','Yes',5,null,null,null,null,null,'0','0',null);



/* nuevas opciones de menu para el manejo de cajas de los puestos */
delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu = ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optCajasPendientes')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optCajasPendientes'

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (62,'Cajas Pendientes','optCajasPendientes','Empleado',8.1,1,1,0);


/* nuevas opciones de menu para el manejo de cajas de los puestos */
delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu = ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optCajasRechazadas')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optCajasRechazadas'

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (63,'Cajas Rechazadas','optCajasRechazadas','Empleado',8.2,1,1,0);


exec SP_GenerarNuevasOpcionesdeMenues


update  DiccionariodeDatos
set nrOrdenBusqueda = 1 
WHERE (nmTabla = 'tb_conceptos') AND (nmCampo = 'dsConcepto')

delete FROM DiccionariodeDatos WHERE nmTabla = 'TB_Conceptos' and nmcampo = 'tpCreadoPor'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Conceptos','tpCreadoPor','tpCreadoPor','VARCHAR','50','No','No',null,null,null,null,null,null,null,'0','0',null);

delete FROM DiccionariodeDatos WHERE nmTabla = 'TB_Conceptos' and nmcampo = 'flOcultado'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Conceptos','flOcultado','flOcultado','BIT','1','No','No',null,null,null,null,null,null,null,'0','0',null);


select  *  FROM DiccionariodeDatos WHERE nmTabla = 'TB_Conceptos' 


delete FROM DiccionariodeDatos WHERE nmTabla = 'TB_MovimientosContables' and nmcampo = 'tpCajaImputacion'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_MovimientosContables','tpCajaImputacion','Tipo de Caja','VARCHAR','50',null,null,'Yes',11,null,null,null,null,null,'0','0',null);


delete FROM DiccionariodeDatos WHERE nmTabla = 'TB_MovimientosContables' and nmcampo = 'dsUsuarioCajaPuesto'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_MovimientosContables','dsUsuarioCajaPuesto','Usuario Caja Puesto','VARCHAR','50',null,null,'Yes',12,null,null,null,null,null,'0','0',null);


delete FROM DiccionariodeDatos WHERE nmTabla = 'TB_MovimientosContables' and nmcampo = 'nrCajaPuesto'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_MovimientosContables','nrCajaPuesto','Caja Puesto','INTEGER','9','Yes','No','Yes',10,'1000000003','2000000001','3000000000','9000000027',null,'0','0',null);



Delete from DiccionariodeDatos where  nmTabla ='TB_Cajas'  and nmCampo ='flImputado'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Cajas','flImputado','Imputada','BIT','1','No','No','No',null,null,null,null,null,null,'0','0',null);



/* ajustamos la configuracion de la nueva opcion de menu */
delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu = ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optReversionCajaPuestoCajaADM')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optReversionCajaPuestoCajaADM'

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (64,'Reversión Caja Puesto -> Caja Adm.','optReversionCajaPuestoCajaADM','Empleado',8.4,1,1,0);

-- generando la nueva opcion de la caja de los licenciatarios
delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu = ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optResumenCajadelosLicenciatarios')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optResumenCajadelosLicenciatarios'

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (65,'Resumen Caja de los Licenciatarios','optResumenCajadelosLicenciatarios','Empleado',209.2,1,1,0);

exec SP_GenerarNuevasOpcionesdeMenues

  
--- actualizamos las cajas existentes campos como ya imputadas
update tb_cajas set flImputado=null 

--- creamos los campos para el resumen de los movimientos contables de la caja del licenciatario

delete  from DiccionariodeDatos where nmtabla='SP_SumarMovimientosContablesporPeriodo_v2_9'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumarMovimientosContablesporPeriodo_v2_9','@dtDesde_param','@dtDesde_param','DATETIME','10',null,null,'Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumarMovimientosContablesporPeriodo_v2_9','@dtHasta_param','@dtHasta_param','DATETIME','10',null,null,'Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumarMovimientosContablesporPeriodo_v2_9','@dsUsuario_param','@dsUsuario_param','VARCHAR','50',null,null,null,0,null,null,null,'0',null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumarMovimientosContablesporPeriodo_v2_9','@tpConcepto_param','Tipo Concepto','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumarMovimientosContablesporPeriodo_v2_9','@dsConcepto_param','Descripción','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumarMovimientosContablesporPeriodo_v2_9','@tpOperacion_param','Tipo Operación','VARCHAR','50',null,null,'Yes',6,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumarMovimientosContablesporPeriodo_v2_9','@tpCajaImputacion_param','@tpCajaImputacion_param','VARCHAR','60',null,null,'Yes',14,null,null,null,null,null,'0','0',null);


delete  from DiccionariodeDatos where nmtabla='SP_SaldoInicialMovimientosContablesporPeriodo_v2_9'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SaldoInicialMovimientosContablesporPeriodo_v2_9','@dtHasta_param','@dtHasta_param','DATETIME','10',null,null,'Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SaldoInicialMovimientosContablesporPeriodo_v2_9','@tpCajaImputacion_param','@tpCajaImputacion_param','VARCHAR','60',null,null,'Yes',14,null,null,null,null,null,'0','0',null);


delete  from DiccionariodeDatos where nmtabla='SP_SaldoFinalMovimientosContablesporPeriodo_v2_9'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SaldoFinalMovimientosContablesporPeriodo_v2_9','@tpCajaImputacion_param','@tpCajaImputacion_param','VARCHAR','60',null,null,'Yes',14,null,null,null,null,null,'0','0',null);




delete  from DiccionariodeDatos where nmtabla='SP_obtenerSaldosyMovimientosdelPeriodo_v2_9'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerSaldosyMovimientosdelPeriodo_v2_9','@dtDesde_param','@dtDesde_param','DATETIME','10',null,null,'Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerSaldosyMovimientosdelPeriodo_v2_9','@dtHasta_param','@dtHasta_param','DATETIME','10',null,null,'Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerSaldosyMovimientosdelPeriodo_v2_9','@dsUsuario_param','@dsUsuario_param','VARCHAR','50',null,null,null,0,null,null,null,'0',null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerSaldosyMovimientosdelPeriodo_v2_9','@tpConcepto_param','Tipo Concepto','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerSaldosyMovimientosdelPeriodo_v2_9','@dsConcepto_param','Descripción','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerSaldosyMovimientosdelPeriodo_v2_9','@tpOperacion_param','Tipo Operación','VARCHAR','50',null,null,'Yes',6,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_obtenerSaldosyMovimientosdelPeriodo_v2_9','@tpCajaImputacion_param','@tpCajaImputacion_param','VARCHAR','60',null,null,'Yes',14,null,null,null,null,null,'0','0',null);




delete  from DiccionariodeDatos where nmtabla='SP_puedeOperarUsuarioCajaPuesto_v2_9'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_puedeOperarUsuarioCajaPuesto_v2_9','@pnrCaja_param','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'9000001098','2000001555','3000000022','9000001087','SI','0','5000000004','1');
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_puedeOperarUsuarioCajaPuesto_v2_9','@pdsUsuario_param','Usuario','VARCHAR','10','No','Yes','Yes',5,null,null,null,null,null,'0','0',null);


delete  from DiccionariodeDatos where nmtabla='SP_TB_MovimientosContables_Qry_v2_9' 


INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','dsObservacion','Observacion','VARCHAR','255',null,null,'Yes',15,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','dsUsuario_Supervisor','dsUsuario_Supervisor','VARCHAR','50',null,null,null,0,null,null,null,'0',null,null,null,null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','IdMovimiento','Código','NUMERIC','9',null,null,'Yes',1,'12','2','41','10134601','SI','0','0','1');
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','IdRecibo','IdRecibo','NUMERIC','10',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','tpConcepto','Tipo Concepto','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','tpOperacion','Tipo Operación','VARCHAR','50',null,null,'Yes',6,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','vlDolares','Dolares','DOUBLE','8',null,null,'Yes',12,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','dsProveedor','Des. Proveedor','VARCHAR','60',null,null,'Yes',14,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','nrFactura','Factura','VARCHAR','50',null,null,'Yes',8,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','dsUsuario','Usuario','VARCHAR','50',null,null,'Yes',10,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','dsMovimiento','Descripción','VARCHAR','100',null,null,'Yes',5,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','cdConcepto','cdConcepto','INTEGER','6',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','dsConcepto','Concepto','VARCHAR','100',null,null,'Yes',2,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','vlPesos','Pesos','DOUBLE','8',null,null,'Yes',11,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','vlEuros','Euros','DOUBLE','8',null,null,'Yes',13,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','nrRecibo','Recibo','VARCHAR','50',null,null,'Yes',7,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','nrCaja','Nro. Caja','NUMERIC','9',null,null,'No',0,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','dtMovimiento','Fecha de Movimiento','DATETIME','10',null,null,'Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','IdProveedor','Id. Proveedor','INTEGER','6',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','dsConceptoBuscado','dsConceptoBuscado','VARCHAR','50',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','tpCajaImputacion','tpCajaImputacion','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','dsUsuarioCajaPuesto','dsUsuarioCajaPuesto','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','nrCajaPuesto','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'1000000003','2000000001','3000000000','9000000027',null,'0','0',null);

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','@strSQL_param','SQL_WHERE','VARCHAR','200',null,null,'Yes',5,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_TB_MovimientosContables_Qry_v2_9','@dsUsuario_param','Descripción','VARCHAR','50',null,null,'Yes',5,null,null,null,null,null,'0','0',null);


delete  from DiccionariodeDatos where nmtabla='VW_SumaCajaADM_v2_9' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_SumaCajaADM_v2_9','SumaEuros','Suma Euros','DOUBLE','6',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_SumaCajaADM_v2_9','nrCaja','Caja','NUMERIC','9',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_SumaCajaADM_v2_9','SumaDolares','Suma Dolares','DOUBLE','6',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_SumaCajaADM_v2_9','tpOperacion','Operacion','VARCHAR','50',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_SumaCajaADM_v2_9','SumaPesos','Suma Pesos','DOUBLE','6',null,null,null,null,null,null,null,null,null,'0','0',null);

delete  from DiccionariodeDatos where nmtabla='VW_ResumenCajaADM_v2_9' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_ResumenCajaADM_v2_9','tpOperacion','Operación','VARCHAR','50',null,null,'Yes',1,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_ResumenCajaADM_v2_9','nrCaja','Nro. de Caja','NUMERIC','9',null,null,'Yes',2,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_ResumenCajaADM_v2_9','dsConcepto','Concepto','VARCHAR','100',null,null,'Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_ResumenCajaADM_v2_9','SumaPesos','Pesos','DOUBLE','6',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_ResumenCajaADM_v2_9','SumaDolares','Dolares','DOUBLE','6',null,null,'Yes',5,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('VW_ResumenCajaADM_v2_9','SumaEuros','Euros','DOUBLE','6',null,null,'Yes',6,null,null,null,null,null,'0','0',null);


delete  from DiccionariodeDatos where nmtabla='SP_CalculaSaldoInicial_v2_9' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_CalculaSaldoInicial_v2_9','@tpCaja_param','@tpCaja_param','VARCHAR','2','No','No','No',5,null,null,null,null,null,'0','0',null);

DELETE FROM DiccionariodeDatos WHERE nmtabla='SP_SumaCajaADM_v2_9' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumaCajaADM_v2_9','@tpCajaImputacion_param','@tpCajaImputacion_param','VARCHAR','50',null,null,'Yes',14,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumaCajaADM_v2_9','@nrCaja_param','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'1000000003','2000000001','3000000000','9000000027',null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumaCajaADM_v2_9','SumaEuros','Suma Euros','DOUBLE','6',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumaCajaADM_v2_9','nrCaja','Caja','NUMERIC','9',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumaCajaADM_v2_9','SumaDolares','Suma Dolares','DOUBLE','6',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumaCajaADM_v2_9','tpOperacion','Operacion','VARCHAR','50',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumaCajaADM_v2_9','SumaPesos','Suma Pesos','DOUBLE','6',null,null,null,null,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_SumaCajaADM_v2_9','@tpCaja_param','@tpCaja_param','VARCHAR','2','No','No','No',5,null,null,null,null,null,'0','0',null);

delete  from DiccionariodeDatos where nmtabla='SP_ResumenCajaADM_v2_9' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ResumenCajaADM_v2_9','@nrCaja_param','Nro. de Caja','INTEGER','9','No','No','No',0,'','','','',null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ResumenCajaADM_v2_9','nrCaja','Nro. de Caja','NUMERIC','9',null,null,'Yes',2,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ResumenCajaADM_v2_9','dsConcepto','Concepto','VARCHAR','100',null,null,'Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ResumenCajaADM_v2_9','tpOperacion','Operación','VARCHAR','50',null,null,'Yes',1,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ResumenCajaADM_v2_9','SumaPesos','Pesos','DOUBLE','6',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ResumenCajaADM_v2_9','SumaDolares','Dolares','DOUBLE','6',null,null,'Yes',5,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ResumenCajaADM_v2_9','SumaEuros','Euros','DOUBLE','6',null,null,'Yes',6,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ResumenCajaADM_v2_9','@tpCaja_param','@tpCaja_param','VARCHAR','2','No','No','No',5,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ResumenCajaADM_v2_9','@tpCajaImputacion_param ','tpCajaImputacion','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);

delete  from DiccionariodeDatos where nmtabla='VW_ResumenCajaADM_v2_9' 
delete  from DiccionariodeDatos where nmtabla='VW_SumaCajaADM_v2_9' 



-- generando la nueva opcion de la caja de los licenciatarios
delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu = ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optCajaDiariaLicenciatario')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optCajaDiariaLicenciatario'

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (66,'Caja Diara Licenciatarios  (Caja Actual)','optCajaDiariaLicenciatario','Empleado',207.2,1,1,1);


delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu = ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optCajaDiariaCooperativa')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optCajaDiariaCooperativa'

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (67,'Caja Diara Cooperativa   (Caja Actual)','optCajaDiariaCooperativa','Empleado',207.3,1,1,1);


exec SP_GenerarNuevasOpcionesdeMenues


Exec sco_AccesosOpcionesMenu @p_tpNivelAcceso = 'Administración' ,@p_operaconcaja = 1 


delete  from DiccionariodeDatos where nmtabla='SP_CalculaSaldoInicial_v2_9' 

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_CalculaSaldoInicial_v2_9','@nrCaja_param','Nro. de Caja','INTEGER','9','No','No','No',0,'','','','',null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_CalculaSaldoInicial_v2_9','vlSaldoInicialEuros','vlSaldoInicialEuros','DOUBLE','6',null,null,'Yes',4,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_CalculaSaldoInicial_v2_9','vlSaldoInicialDolares','vlSaldoInicialDolares','DOUBLE','6',null,null,'Yes',5,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_CalculaSaldoInicial_v2_9','vlSaldoInicialPesos','vlSaldoInicialPesos','DOUBLE','6',null,null,'Yes',6,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_CalculaSaldoInicial_v2_9','@tpCaja_param','@tpCaja_param','VARCHAR','2','No','No','No',5,null,null,null,null,null,'0','0',null);
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_CalculaSaldoInicial_v2_9','@tpCajaImputacion_param ','tpCajaImputacion','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);




delete from DiccionariodeDatos where nmtabla = 'TB_Conceptos'  and   nmcampo = 'tpCajaImputacion'
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Conceptos','tpCajaImputacion','tpCajaImputacion','VARCHAR','50',null,null,'YES',5,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmtabla = 'TB_Conceptos'  and   nmcampo = 'flOcultadoenRegistracion'
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Conceptos','flOcultadoenRegistracion','flOcultadoenRegistracion','BIT','1',null,null,'NO',null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmtabla = 'TB_Conceptos'  and   nmcampo = 'flSumaenCajaAdm'
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Conceptos','flSumaenCajaAdm','flSumaenCajaAdm','BIT','1',null,null,'NO',null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmtabla = 'TB_Conceptos'  and   nmcampo = 'flSumaenCajaCooperativa'
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Conceptos','flSumaenCajaCooperativa','flSumaenCajaCooperativa','BIT','1',null,null,'NO',null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmtabla = 'TB_Conceptos'  and   nmcampo = 'flSumaenCajaLicenciatarios'
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Conceptos','flSumaenCajaLicenciatarios','flSumaenCajaLicenciatarios','BIT','1',null,null,'NO',null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmtabla = 'TB_Conceptos'  and   nmcampo = 'flOcultadoenCajaAdm'
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Conceptos','flOcultadoenCajaAdm','flOcultadoenCajaAdm','BIT','1',null,null,'NO',null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmtabla = 'TB_Conceptos'  and   nmcampo = 'flOcultadoCajaLicenciatario'
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Conceptos','flOcultadoCajaLicenciatario','flOcultadoCajaLicenciatario','BIT','1',null,null,'NO',null,null,null,null,null,null,'0','0',null);

delete from DiccionariodeDatos where nmtabla = 'TB_Conceptos'  and   nmcampo = 'flOcultadoCajaCooperativa'
INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Conceptos','flOcultadoCajaCooperativa','flOcultadoCajaCooperativa','BIT','1',null,null,'NO',null,null,null,null,null,null,'0','0',null);
	
	
	


update  tb_movimientosContables
set 	cdConcepto  = 9001,
	tpConcepto   = 'Cajas'
--- select * from tb_movimientosContables 
where   idMovimiento  in (1,2) 
 





