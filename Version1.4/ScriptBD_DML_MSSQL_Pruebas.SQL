-- cambios de DML version 1.4
use dbSG2000_Pruebas
go

  update tb_puestos set
  nrTalonario_auto_empresa=0,
  nrTalonario_auto_ctacte=0,
  nrComprobante_auto_ctacte_ult=0,
  nrComprobante_auto_empresa_ult=0,
  nrTalonario_manual_empresa=0,
  nrTalonario_manual_ctacte=0,
  nrComprobante_manual_empresa_ult=0,
  nrComprobante_manual_ctacte_ult=0,
  tpLetraEmpresa = 'A',
  tpLetraRecibo  = 'X',
  tpletra_manual ='B',
  tpLetraEmpresa_manual='A',
  tpLetraRecibo_manual='X'



DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'nrComprobante_auto_empresa_ult' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','nrComprobante_auto_empresa_ult','nrComprobante_auto_empresa_ult','INTEGER','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'nrComprobante_auto_ctacte_ult' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','nrComprobante_auto_ctacte_ult','nrComprobante_auto_ctacte_ult','INTEGER','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'nrTalonario_auto_empresa' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','nrTalonario_auto_empresa','nrTalonario_auto_empresa','INTEGER','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'nrTalonario_auto_ctacte' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','nrTalonario_auto_ctacte','nrTalonario_auto_ctacte','INTEGER','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);




-----------------------------------------------------------------
-----------------------------------------------------------------
DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'nrTalonario_manual_empresa' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','nrTalonario_manual_empresa','nrTalonario_manual_empresa','INTEGER','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'nrTalonario_manual_ctacte' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','nrTalonario_manual_ctacte','nrTalonario_manual_ctacte','INTEGER','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'nrComprobante_manual_empresa_ult' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','nrComprobante_manual_empresa_ult','nrComprobante_manual_empresa_ult','INTEGER','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'nrComprobante_manual_ctacte_ult' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','nrComprobante_manual_ctacte_ult','nrComprobante_manual_ctacte_ult','INTEGER','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'tpLetraEmpresa' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','tpLetraEmpresa','tpLetraEmpresa','VARCHAR','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'tpLetraRecibo' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','tpLetraRecibo','tpLetraRecibo','VARCHAR','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'tpletra_manual' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','tpletra_manual','tpletra_manual','VARCHAR','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'tpLetraEmpresa_manual' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','tpLetraEmpresa_manual','tpLetraEmpresa_manual','VARCHAR','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'tpLetraRecibo_manual' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','tpLetraRecibo_manual','tpLetraRecibo_manual','VARCHAR','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

------------------------------------------------------

DELETE FROM DiccionariodeDatos
WHERE nmTabla='diccionariodedatos' and nmCampo = 'vlPuesto' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('diccionariodedatos','vlPuesto','vlPuesto','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

------------------------------------------------------


DELETE FROM DiccionariodeDatos
WHERE nmTabla='VWCajasPuestosdesdelosPuetos' and nmCampo = 'flSincronizado' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('VWCajasPuestosdesdelosPuetos','flSincronizado','flSincronizado','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



---------------------------------------------------------------------


DELETE FROM DiccionariodeDatos
WHERE nmTabla='sco_Puestos_v1_4' and nmCampo = 'nrPuesto_param' 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='sco_Puestos_v1_4' and nmCampo = '@nrPuesto_param' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('sco_Puestos_v1_4','nrPuesto_param','nrPuesto_param','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('sco_Puestos_v1_4','@nrPuesto_param','@nrPuesto_param','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

-----------------------------------------------------
--- Campos para Calculo del IVA


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Comprobantes' and nmCampo = 'vlSubTotal' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('TB_Comprobantes','vlSubTotal','vlSubTotal','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Comprobantes' and nmCampo = 'vlIVA' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('TB_Comprobantes','vlIVA','vlIVA','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


--------------------------------------------------------------------
--- proviene de la version 1.3 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_cajas' and nmCampo = 'flSincronizado' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('tb_cajas','flSincronizado','flSincronizado','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0');

--------------------------------------------------------------------
--- proviene de la version 1.3 
DELETE FROM DiccionariodeDatos
WHERE nmTabla='rpt_cierredecaja_v1' and nmCampo = 'nrCaja_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('rpt_cierredecaja_v1','nrCaja_param','nrCaja_param','INTEGER','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


--- proviene de la version 1.3 
DELETE FROM DiccionariodeDatos
WHERE nmTabla='rpt_cierredecaja_v1' and nmCampo = '@nrCaja_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('rpt_cierredecaja_v1','@nrCaja_param','@nrCaja_param','INTEGER','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


--- proviene de la version 1.3 
DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerResumenCajaPuesto' and nmCampo = '@nrCaja' 

--- proviene de la version 1.3 
INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_ObtenerResumenCajaPuesto','@nrCaja','p_nrCaja','INTEGER','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


-------------------------------------------------------------------------------
--- implementacion de la tabla de parametros

delete from TB_OpcionesMenues where IdOpcionMenu=50;

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (50,'Parámetros','optParametros','Supervisor',18,1,1,0);


 
DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Parametros' and nmCampo = 'dsParametro' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('TB_Parametros','dsParametro','dsParametro','VARCHAR','20','Yes',NULL,'Yes',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Parametros' and nmCampo = 'vlParametro' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('TB_Parametros','vlParametro','vlParametro','VARCHAR','50',NULL,NULL,'Yes',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Parametros' and nmCampo = 'tpParametro' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('TB_Parametros','tpParametro','tpParametro','VARCHAR','50',NULL,NULL,'Yes',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Parametros' and nmCampo = 'flNoEditable' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('TB_Parametros','flNoEditable','flNoEditable','BIT','1',NULL,NULL,'Yes',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Parametros' and nmCampo = 'nrTamanio' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('TB_Parametros','nrTamanio','nrTamanio','INTEGER','5',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

--- CARGA DE DIC DE LOS NUEVOS SPS

--SP_obtenerAlicuotaIVA

DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_obtenerAlicuotaIVA' and nmCampo = '@tpCategoriaIVA_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_obtenerAlicuotaIVA','@tpCategoriaIVA_param','@tpCategoriaIVA_param','VARCHAR','5',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

---SP_CalcularSubtotalIVA

DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_CalcularSubtotalIVA' and nmCampo = '@tpCategoriaIVA_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_CalcularSubtotalIVA','@tpCategoriaIVA_param','@tpCategoriaIVA_param','VARCHAR','5',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_CalcularSubtotalIVA' and nmCampo = '@vlMonto_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_CalcularSubtotalIVA','@vlMonto_param','@vlMonto_param','FLOAT','6',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_CalcularSubtotalIVA' and nmCampo = '@vlAlicuota_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_CalcularSubtotalIVA','@vlAlicuota_param','@vlAlicuota_param','FLOAT','6',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


--- SP_CalcularIVA


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_CalcularIVA' and nmCampo = '@tpCategoriaIVA_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_CalcularIVA','@tpCategoriaIVA_param','@tpCategoriaIVA_param','VARCHAR','5',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_CalcularIVA' and nmCampo = '@vlMonto_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_CalcularIVA','@vlMonto_param','@vlMonto_param','FLOAT','6',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_CalcularIVA' and nmCampo = '@vlAlicuota_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_CalcularIVA','@vlAlicuota_param','@vlAlicuota_param','FLOAT','6',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

--- SP_Supera_KM_IVA_segunMonto



DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_Supera_KM_IVA_segunMonto' and nmCampo = '@tpCategoriaIVA_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_Supera_KM_IVA_segunMonto','@tpCategoriaIVA_param','@tpCategoriaIVA_param','VARCHAR','5',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_Supera_KM_IVA_segunMonto' and nmCampo = '@vlKilometros_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_Supera_KM_IVA_segunMonto','@vlKilometros_param','@vlKilometros_param','INTEGER','6',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_Supera_KM_IVA_segunMonto' and nmCampo = '@vlMonto_param' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
('SP_Supera_KM_IVA_segunMonto','@vlMonto_param','@vlMonto_param','FLOAT','6',NULL,NULL,null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

---- SP_GenerarNuevasOpcionesdeMenues
exec SP_GenerarNuevasOpcionesdeMenues

set dateformat dmy 

delete from tb_parametros

INSERT INTO tb_parametros (dsParametro,vlParametro,tpParametro,flNoEditable,nrTamanio,dtActualizacion)  VALUES ('KM_IVA','100','ENTERO',0,5,'12/03/2008 0:50:43');
INSERT INTO tb_parametros (dsParametro,vlParametro,tpParametro,flNoEditable,nrTamanio,dtActualizacion)  VALUES ('PORC_IVA','21','ENTERO',1,5,'11/03/2008 23:20:50');
INSERT INTO tb_parametros (dsParametro,vlParametro,tpParametro,flNoEditable,nrTamanio,dtActualizacion)  VALUES ('PRECIO_KM','2,45','DECIMAL',0,10,'11/03/2008 23:27:44');

delete from diccionariodedatos where nmtabla = 'TB_Usuarios'

INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','flBloqueado','Bloqueado','BIT','1','No','No','Yes',6,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','tpNivelJerarquico','Nivel Jerárquico','VARCHAR','50','No',null,'Yes',5,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('tb_usuarios','dtActualizacion','dtActualizacion','DATETIME','16','No',null,'No',null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('tb_usuarios','dsPassword_OLD','dsPassword_OLD','VARCHAR','8','No',null,'No',null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('tb_usuarios','flEliminar','flEliminar','BIT','1',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','cdPostal','Cod. Postal','VARCHAR','8','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','dsDomicilio','Domicilio','VARCHAR','30','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','dsEmail','E-Mail','VARCHAR','60','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','dsPassword','Password','VARCHAR','8','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','dsUsuario','Usuario','VARCHAR','10','Yes','No','Yes',1,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','nmApellido','Apellido','VARCHAR','50','No','No','Yes',2,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','nmLocalidad','Localidad','VARCHAR','30','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','nmNombre','Nombre','VARCHAR','30','No','No','Yes',3,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','nrCUIL','Nro. CUIL','INTEGER','11','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','nrTelefono','Telefono','VARCHAR','30','No','No',null,null,null,null,null,null,null,'0','0',null);
INSERT INTO diccionariodedatos ( nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Usuarios','tpAcceso','Tipo de Acceso','VARCHAR','50','No','No','Yes',4,null,null,null,null,null,'0','0',null);
