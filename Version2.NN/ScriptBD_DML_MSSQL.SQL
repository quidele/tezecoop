-- cambios de DML version 1.9
use dbSG2000
go


	delete from TB_Talonarios;
	delete from TB_TiposComprobantes;

	insert TB_TiposComprobantes (tpComprobante, dsTipoComprobante, flActivo, flVisible) 
	select  tpComprobante,
		'Para compatibilidad anterior' as dsComprobante,
	from tb_comprobantes
	group by tpComprobante

	update TB_TiposComprobantes
	set flActivo=1 , flVisible=0
	insert into TB_Talonarios (nrTalonario,
		    tpComprobante,
		    tpLetra,
		    nrComprobante,
		    flManual,
		    flActivo)
	select  nrTalonario,
		tpComprobante,
		tpLetra,
		max(convert(decimal,replace(replace(nrComprobante,'.',''),',',''))),
		max(flManual),
		1 as flActivo
		0 as flVisible
	from tb_comprobantes
	group by nrTalonario,
		 tpComprobante,
		 tpLetra

	update TB_Talonarios
	set flActivo=1 , flVisible=0

GO 

/*****************************************************************/
--
--  Se deberá crear la relación  TB_Comprobantes y TB_Talonarios
--	
/****************************************************************/
/****************************************************************/
/* DICCIONARIO DE DATOS                                         */
-- TB_TiposComprobantes
-- TB_Talonarios
-- TB_TalonariosCAI
-- TB_TalonariosPuesto

DELETE FROM DiccionariodeDatos WHERE nmTabla='TB_Talonarios' 

INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Talonarios','nrTalonario','Talonario','NRO_TALONARIO','4','Yes',null,'Yes',1,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Talonarios','tpComprobante','Tipo','VARCHAR','4','Yes',null,'Yes',2,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Talonarios','tpLetra','Letra','VARCHAR','1','Yes',null,'Yes',3,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Talonarios','nrComprobante','Número','INTEGER','12',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Talonarios','flManual','Manual','CHAR','1',null,null,'Yes',4,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Talonarios','flActivo','Activo','BIT','1',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Talonarios','flVisible','Visible','BIT','1',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Talonarios','flEliminar','flEliminar','BIT','1',null,null,null,null,null,null,null,null,null,null,null,null);

DELETE FROM DiccionariodeDatos WHERE nmTabla='TB_TiposComprobantes' 

INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_TiposComprobantes','tpComprobante','Tipo','NRO_TALONARIO','4','Yes',null,'Yes',1,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_TiposComprobantes','dsTipoComprobante','Descripción','VARCHAR','70',null,null,'Yes',2,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_TiposComprobantes','flActivo','Activo','BIT','1',null,null,'Yes',3,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_TiposComprobantes','flVisible','flVisible','BIT','1',null,null,null,null,null,null,null,null,null,null,null,null);

DELETE FROM DiccionariodeDatos WHERE nmTabla='TB_TalonariosCAI' 

INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES  ('TB_TalonariosCAI','nrTalonario','nrTalonario','NRO_TALONARIO','4','Yes',null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES  ('TB_TalonariosCAI','tpComprobante','tpComprobante','VARCHAR','4','Yes',null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES  ('TB_TalonariosCAI','tpLetra','tpLetra','VARCHAR','1','Yes',null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES  ('TB_TalonariosCAI','nrCAI','nrCAI','INTEGER','14','Yes',null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES  ('TB_TalonariosCAI','dtDesde','dtDesde','SMALLDATETIME','10',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES  ('TB_TalonariosCAI','dtFin','dtFin','SMALLDATETIME','10',null,null,null,null,null,null,null,null,null,null,null,null);

DELETE FROM DiccionariodeDatos WHERE nmTabla='TB_TalonariosPuesto' 

INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES  ('TB_TalonariosPuesto','nrPuesto','nrPuesto','INTEGER','3','Yes',null,'Yes',1,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES  ('TB_TalonariosPuesto','nrTalonario','nrTalonario','NRO_TALONARIO','4','Yes',null,null,2,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES  ('TB_TalonariosPuesto','tpComprobante','tpComprobante','VARCHAR','4','Yes',null,null,3,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_TalonariosPuesto','tpLetra','tpLetra','VARCHAR','1','Yes',null,null,4,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES  ('TB_TalonariosPuesto','tpDestino','tpDestino','VARCHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES  ('TB_TalonariosPuesto','tpFacturacion','tpFacturacion','VARCHAR','50',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_TalonariosPuesto','flVigente','flVigente','BIT','1',null,null,null,null,null,null,null,null,null,null,null,null);


/**************************************************************************/
/* NUEVAS OPCIONES DEL MENU */ 

update TB_OpcionesMenues
set nrorden=99
where nmOpcionMenu='mnVentas'

Delete TB_OpcionesMenues WHERE nmOpcionMenu In ('optTalonarios',
				                'optTalonariosPuestos',
						'optiposComprobantes') 

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (51,'Talonarios','optTalonarios','Supervisor',20,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (52,'Talonarios / Puestos','optTalonariosPuestos','Supervisor',21,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (53,'Tipos de Comprobantes','optiposComprobantes','Supervisor',22,1,1,0);


exec SP_GenerarNuevasOpcionesdeMenues 

Exec sco_AccesosOpcionesMenu @p_tpNivelAcceso = 'Administración' 



-------------------------------------------------------------
--* store procedures

DELETE FROM DiccionariodeDatos WHERE nmTabla='sco_Talonarios' 

INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Talonarios','@nrTalonario_param','Talonario','VARCHAR','4','Yes',null,'Yes',1,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Talonarios','@tpComprobante_param','Tipo','VARCHAR','4','Yes',null,'Yes',2,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Talonarios','@tpLetra_param','Letra','VARCHAR','1','Yes',null,'Yes',3,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('sco_Talonarios','@flManual_param','Manual','CHAR','1',null,null,'Yes',4,null,null,null,null,null,null,null,null);
