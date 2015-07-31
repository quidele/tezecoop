use dbSG2000_Pruebas
go



DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_OpcionesMenues'


INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_OpcionesMenues','IdOpcionMenu','Código de Menú','INTEGER',
4,'Yes','Yes',2,0) 

INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_OpcionesMenues','dsOpcionMenu','Descripción','VARCHAR',
200,'No','Yes',1,0) 

INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_OpcionesMenues','nmOpcionMenu','nombre vb','VARCHAR',
60,'No','Yes',3,0) 

INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_OpcionesMenues','tpNivelJerarquico','Nvel Jerárquico','VARCHAR',
50,'No','Yes',4,0) 

INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_OpcionesMenues','nrorden','Orden','INTEGER',
4,'No','Yes',null,null) 

INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_OpcionesMenues','nrNivelHoja','Orden','INTEGER',
4,'No','No',null,null) 

INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_OpcionesMenues','flvisible','flvisible','BIT',
1,'No','No',null,null) 

INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_OpcionesMenues','flCajaAdm','flCajaAdm','BIT',
1,'No','No',null,null) 



DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Usuarios' and nmCampo = 'tpNivelJerarquico' 

-- agregado en la tabla de usuarios 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_Usuarios','tpNivelJerarquico','Nivel Jerárquico','VARCHAR',
50,'No','No',null,null) 


DELETE FROM DiccionariodeDatos
WHERE nmTabla='sco_AccesosOpcionesMenu' and nmCampo = '@p_tpNivelAcceso' 



INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('sco_AccesosOpcionesMenu','@p_tpNivelAcceso','Nivel Jerárquico','VARCHAR',
60,'No','No',null,null) 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='sco_AccesosOpcionesMenu' and nmCampo = '@p_operaconcaja' 


INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('sco_AccesosOpcionesMenu','@p_operaconcaja','opera con caja','INTEGER',
1,'No','No',null,null) 


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_NivelAcceso' 


INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_NivelAcceso','tpNivelAcceso','Tipo de Nivel de Acceso','VARCHAR',
60,'Yes','Yes',1,null) 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_NivelAccesoOpcionesMenu' 


INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_NivelAccesoOpcionesMenu','tpNivelAcceso','Tipo de Nivel de Acceso','VARCHAR',
60,'Yes','Yes',1,null) 

INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_NivelAccesoOpcionesMenu','IdOpcionMenu','IdOpcionMenu','INTEGER',
5,'Yes','Yes',2,null) 

INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_NivelAccesoOpcionesMenu','flAcceso','flAcceso','BIT',
60,'No','No',null,null) 



delete from TB_NivelAccesoOpcionesMenu
delete from TB_OpcionesMenues
delete from TB_NivelJerarquico
delete from TB_NivelAcceso

INSERT INTO TB_NivelAcceso (tpNivelAcceso)  VALUES ('Administración');
INSERT INTO TB_NivelAcceso (tpNivelAcceso)  VALUES ('Auxiliar Administración');
INSERT INTO TB_NivelAcceso (tpNivelAcceso)  VALUES ('Contabilidad');
INSERT INTO TB_NivelAcceso (tpNivelAcceso)  VALUES ('Parametrización');
INSERT INTO TB_NivelAcceso (tpNivelAcceso)  VALUES ('Puestos');


INSERT INTO TB_NivelJerarquico (tpNivelJerarquico)  VALUES ('Empleado');
INSERT INTO TB_NivelJerarquico (tpNivelJerarquico)  VALUES ('Supervisor');


INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (1,'Maestros','mnMaestros','Empleado',1,0,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (2,'Clientes','mnMaestrosClientes','Empleado',2,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (3,'Proveedores','nmMaestrosProveedores','Empleado',3,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (4,'Productos','nmMaestroProductos','Empleado',4,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (5,'Usuarios','nmUsuario','Supervisor',5,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (6,'Manejo de Caja','nmManejodeCaja','Empleado',7,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (7,'Cajas de los Puestos','optcajasPuestos','Empleado',8,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (8,'Cajas de Administración','optCajaAdministración','Empleado',9,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (9,'Traspaso de Caja','optTraspasoPuestos','Empleado',10,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (10,'Comisiones','optComisiones','Supervisor',11,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (11,'Conceptos','optConceptos','Supervisor',12,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (12,'Puestos','optPuestos','Empleado',13,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (13,'Cerrar Caja','optCerrarCaja','Empleado',14,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (14,'Usuario','mnu_Usuario','Empleado',15,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (15,'Cambiar de Usuario','optCambioUsuario','Empleado',16,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (16,'Cambiar Clave de Acceso','opt_cambiarClave','Empleado',17,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (17,'Guia Filcar Digital','optGuiaFilcar','Empleado',18,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (18,'Salir','nmMaestroSalir','Empleado',19,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (19,'Ventas','mnVentas','Empleado',20,0,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (20,'Venta de Viajes','mnVentaViajes','Empleado',100,1,1,1);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (21,'Reimpresión de Comprobantes','optComprobantes','Empleado',101,1,1,1);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (22,'Anular Comprobante','optAnular','Empleado',102,1,1,1);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (23,'Impresión de Facturas','optImpresionEnblanco','Empleado',103,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (24,'Formulario Continuo','opt_imprime_factura','Empleado',104,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (25,'Preimpreso laser','opt_imprime_factura','Empleado',105,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (26,'Hoja Blanco Laser','opt_imprime_factura','Empleado',106,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (27,'Carga Manual Para Pago de Comprobantes','optCargaManual','Empleado',107,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (28,'Carga Manual de Comprobantes Pagados','optCargaComprobantesPagados','Empleado',108,1,0,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (29,'Corregir o Eliminar un Comprobante mal Cargado Manualmente','optEliminarComprobantesMalCargados','Empleado',109,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (30,'Marcar Comprobantes como una carga manual erronea','opt_MarcaComprobanteErroneo','Empleado',110,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (31,'Hoja A4','mn_HojaA4','Empleado',111,1,0,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (32,'Venta de Viajes (Hoja Entera - A4)','optVentadeViajesFacturaA4','Empleado',112,1,0,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (33,'Reimpresión de Comprobantes (Hoja Entera - A4)','optComprobantesHojaA4','Empleado',113,1,0,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (34,'Anular Comprobante (Hoja Entera - A4)','optAnularA4','Empleado',114,1,0,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (35,'Administración','mnAdministracion','Empleado',115,0,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (36,'Pago Licenciatarios y Cobro a Cta. Cte.','optLicenciatarios','Empleado',200,1,1,1);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (37,'Facturar las Cta. Cte.','optFacturarCtaCte','Empleado',201,1,1,1);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (38,'Reimpresión de Recibos','optReimpresionRecibos','Empleado',202,1,1,1);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (39,'Pagos de la Caja Actual','optPagosdelaCajaActual','Empleado',203,1,1,1);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (40,'Resúmenes Licenciatarios','optResumenes','Empleado',204,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (41,'Resúmenes Clientes','optResumenesClientes','Empleado',205,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (42,'Movimientos Contables (Caja Actual)','optMovimientosContables','Empleado',206,1,1,1);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (43,'Cajas Diarias de Adm.   (Caja Actual)','optCajasDiariasAdm','Empleado',207,1,1,1);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (44,'Busqueda de Movimientos','opt_BusquedaMovimientosContables','Empleado',208,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (45,'Resumen Movimientos Contables','opt_ResumenMovimientosContables','Supervisor',209,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (46,'Estudio Contable','mnuEstudioContable','Empleado',210,0,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (47,'Facturación Mensual','optFacturacionMensual','Empleado',211,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (48,'IVA Ventas','optIVAVentas','Empleado',212,1,1,0);
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (49,'Niveles de Acceso','optNivelesdeAcceso','Supervisor',6,1,1,0);



INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',1,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',2,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',3,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',4,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',5,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',6,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',7,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',8,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',9,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',10,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',11,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',12,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',13,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',14,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',15,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',16,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',17,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',18,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',19,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',20,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',21,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',22,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',23,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',24,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',25,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',26,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',27,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',28,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',29,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',30,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',31,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',32,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',33,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',34,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',35,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',36,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',37,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',38,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',39,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',40,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',41,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',42,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',43,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',44,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',45,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',46,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',47,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Administración',48,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',1,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',2,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',3,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',4,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',5,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',6,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',7,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',8,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',9,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',10,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',11,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',12,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',13,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',14,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',15,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',16,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',17,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',18,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',19,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',20,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',21,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',22,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',23,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',24,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',25,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',26,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',27,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',28,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',29,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',30,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',31,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',32,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',33,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',34,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',35,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',36,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',37,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',38,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',39,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',40,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',41,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',42,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',43,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',44,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',45,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',46,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',47,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Auxiliar Administración',48,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',1,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',2,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',3,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',4,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',5,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',6,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',7,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',8,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',9,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',10,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',11,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',12,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',13,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',14,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',15,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',16,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',17,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',18,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',19,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',20,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',21,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',22,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',23,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',24,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',25,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',26,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',27,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',28,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',29,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',30,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',31,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',32,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',33,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',34,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',35,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',36,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',37,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',38,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',39,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',40,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',41,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',42,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',43,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',44,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',45,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',46,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',47,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Contabilidad',48,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',1,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',2,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',3,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',4,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',5,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',6,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',7,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',8,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',9,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',10,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',11,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',12,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',13,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',14,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',15,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',16,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',17,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',18,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',19,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',20,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',21,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',22,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',23,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',24,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',25,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',26,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',27,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',28,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',29,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',30,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',31,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',32,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',33,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',34,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',35,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',36,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',37,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',38,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',39,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',40,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',41,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',42,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',43,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',44,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',45,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',46,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',47,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',48,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Parametrización',49,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',1,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',2,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',3,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',4,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',5,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',6,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',7,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',8,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',9,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',10,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',11,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',12,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',13,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',14,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',15,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',16,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',17,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',18,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',19,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',20,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',21,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',22,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',23,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',24,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',25,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',26,1);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',27,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',28,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',29,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',30,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',31,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',32,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',33,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',34,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',35,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',36,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',37,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',38,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',39,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',40,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',41,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',42,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',43,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',44,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',45,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',46,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',47,0);
INSERT INTO TB_NivelAccesoOpcionesMenu (tpNivelAcceso,IdOpcionMenu,flAcceso)  VALUES ('Puestos',48,0);



GO

ALTER TABLE [dbo].[TB_Usuarios] ADD 
	CONSTRAINT [FK_TB_Usuarios_TB_NivelAcceso] FOREIGN KEY 
	(
		[tpAcceso]
	) REFERENCES [dbo].[TB_NivelAcceso] (
		[tpNivelAcceso]
	),
	CONSTRAINT [FK_TB_Usuarios_TB_NivelJerarquico] FOREIGN KEY 
	(
		[tpNivelJerarquico]
	) REFERENCES [dbo].[TB_NivelJerarquico] (
		[tpNivelJerarquico]
	)


go

-- configuramos a todos los usarios actuales como empleados 
update TB_Usuarios set tpNivelJerarquico='Empleado'


update TB_Usuarios set tpNivelJerarquico='Empleado'


-- generarmos el usuario supervisor 
INSERT INTO TB_Usuarios (dsUsuario,tpAcceso,nmNombre,nmApellido,dsPassword,dsDomicilio,nmLocalidad,cdPostal,nrTelefono,dsEmail,dsPassword_OLD,nrCUIL,tpNivelJerarquico,flBloqueado) 
VALUES ('USRPARAM','Parametrización','Usuario','Parametrización','1234',null,null,null,null,null,null,0,'Supervisor',0);


-- actualizando el diccionario de datos 
UPDATE DiccionariodeDatos
set nrTamanio = 50
WHERE nmTabla='TB_Usuarios' and nmCampo = 'tpAcceso' 

UPDATE DiccionariodeDatos
set nrTamanio = 50
WHERE nmTabla='TB_Recibos' and nmCampo = 'dsUsuario' 



---------------------------------------------------------------------------
---------------------------------------------------------------------------


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Cajas' and nmCampo = 'dsUsuario_Supervisor' 


INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_Cajas','dsUsuario_Supervisor','dsUsuario_Supervisor','VARCHAR',
50,null,null,0,0) 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Comprobantes' and nmCampo = 'dsUsuario_Supervisor' 

INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_Comprobantes','dsUsuario_Supervisor','dsUsuario_Supervisor','VARCHAR',
50,null,null,0,0) 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Recibos' and nmCampo = 'dsUsuario_Supervisor' 


INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_Recibos','dsUsuario_Supervisor','dsUsuario_Supervisor','VARCHAR',
50,null,null,0,0) 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_MovimientosContables' and nmCampo = 'dsUsuario_Supervisor' 


INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_MovimientosContables','dsUsuario_Supervisor','dsUsuario_Supervisor','VARCHAR',
50,null,null,0,0) 



