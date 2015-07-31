# SQL Manager 2005 Lite for MySQL 3.7.7.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : dbSG2000


SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `dbSG2000`;

CREATE DATABASE `dbSG2000`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE `dbSG2000`;

#
# Structure for the `diccionariodedatos` table : 
#

DROP TABLE IF EXISTS `diccionariodedatos`;

CREATE TABLE `diccionariodedatos` (
  `IdCampo` int(11) NOT NULL auto_increment,
  `nmTabla` varchar(50) default NULL,
  `nmCampo` varchar(50) default NULL,
  `nmCampoExterno` varchar(50) default NULL,
  `tpTipo` varchar(50) default NULL,
  `nrTamanio` varchar(50) default NULL,
  `flClave` varchar(3) default NULL,
  `flClaveForanea` varchar(3) default NULL,
  `flBusqueda` varchar(3) default NULL,
  `nrOrdenBusqueda` int(11) default NULL,
  `vlPuesto1` varchar(50) default NULL,
  `vlPuesto2` varchar(50) default NULL,
  `vlPuesto3` varchar(50) default NULL,
  `vlPuesto9` varchar(50) default NULL,
  `Actualizar` varchar(50) default NULL,
  `vlPuesto4` varchar(50) default NULL,
  `vlPuesto5` varchar(50) default NULL,
  PRIMARY KEY  (`IdCampo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for the `diccionariodedatos` table  (LIMIT 0,500)
#

INSERT INTO `diccionariodedatos` (`IdCampo`, `nmTabla`, `nmCampo`, `nmCampoExterno`, `tpTipo`, `nrTamanio`, `flClave`, `flClaveForanea`, `flBusqueda`, `nrOrdenBusqueda`, `vlPuesto1`, `vlPuesto2`, `vlPuesto3`, `vlPuesto9`, `Actualizar`, `vlPuesto4`, `vlPuesto5`) VALUES 
  (12,'TB_Cajas','dsUsuario','Usuario','VARCHAR','10','No','Yes','Yes',5,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (13,'TB_Cajas','dtApertura','Fecha de Apertura','DATETIME','18','No','No','Yes',2,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (14,'TB_Cajas','dtCierre','Fecha de Cierre','DATETIME','18','No','No','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (15,'TB_Cajas','nrCaja','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'9000001088','2000001555','3000000000','9000001085','SI','0','5000000004'),
  (16,'TB_Cajas','nrPuesto','Nro. Puesto','INTEGER','9','No','Yes','Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (17,'TB_Cajas','vlSaldoInicialPesos','Saldo Inicial en Pesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (18,'TB_Cajas','vlSaldoFinalPesos','Saldo Final en Pesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (19,'TB_Clientes','cdCliente','Cliente','INTEGER','6','Yes','No','Yes',4,'400000','200000','300000','122','SI','0','0'),
  (20,'TB_Clientes','cdPostal','Código Postal','VARCHAR','8','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (21,'TB_Clientes','dsCargo','Cargo','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (22,'TB_Clientes','dsDomicilio','Domicilio','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (23,'TB_Clientes','dsEmail','E-mail','VARCHAR','60','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (24,'TB_Clientes','dsLetraII','Letra IIBB','VARCHAR','3','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (25,'TB_Clientes','dsRazonSocial','Razón Social','VARCHAR','100','No','No','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (26,'TB_Clientes','dtAlta','Fecha de Alta','SMALLDATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (27,'TB_Clientes','dtBaja','Fecha de Baja','SMALLDATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (28,'TB_Clientes','dtFinOrdenanza','Fecha Fin de Ordenanza','SMALLDATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (29,'TB_Clientes','flBloqueado','Bloqueado','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (30,'TB_Clientes','nmApellido','Apellido','VARCHAR','50','No','No','Yes',2,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (31,'TB_Clientes','nmLocalidad','Localidad','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (32,'TB_Clientes','nmNombre','Nombre','VARCHAR','50','No','No','Yes',1,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (33,'TB_Clientes','nrDoc','Documento','INTEGER','20','No','No','Yes',5,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (34,'TB_Clientes','nrFax','Fax','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (35,'TB_Clientes','nrIIBB','Nro. de IIBB','INTEGER','9','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (36,'TB_Clientes','nrTel','Teléfono','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (37,'TB_Clientes','tpCliente','Tipo de Cliente','VARCHAR','50','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (38,'TB_Clientes','tpDoc','Tipo de Doc','VARCHAR','4','No','No','No',6,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (39,'TB_Clientes','tpEstado','Estado','VARCHAR','3','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (40,'TB_Clientes','tpIIBB','Tipo IIBB','VARCHAR','1','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (42,'TB_Clientes','vlOrdenanza3337','% R3337','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (43,'TB_Clientes','vlSaldo','Saldo ','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (44,'TB_Clientes','vlTopeCredito','Tope de Crédito','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (98,'TB_Comprobantes','cdCliente','Cod. Cliente','INTEGER','9','No','Yes','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (99,'TB_Comprobantes','cdCondVenta','Cond Venta','VARCHAR','20','No','Yes','Yes',10,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (100,'TB_Comprobantes','dsUsuario','Usuario','VARCHAR','20','No','Yes','Yes',14,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (101,'TB_Comprobantes','dsLeyenda','Leyenda','VARCHAR','255','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (102,'TB_Comprobantes','dtCaja','Fecha Caja','DATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (103,'TB_Comprobantes','dtComprobante','Fecha Comprobante','SMALLDATETIME','10','No','No','Yes',1,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (104,'TB_Comprobantes','dtInsercion','Fecha de Inserción','DATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (105,'TB_Comprobantes','flManual','Factura Manual','VARCHAR','255','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (106,'TB_Comprobantes','flSincronizado','flSincronizado','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (107,'TB_Comprobantes','nrCaja','Nro. Caja','INTEGER','9','No','Yes','Yes',9,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (108,'TB_Comprobantes','nrComprobante','Nro. Comprobante','VARCHAR','12','Yes','No','Yes',2,'107557','8434','35','12','SI','0','5'),
  (109,'TB_Comprobantes','nrPuesto','Nro. Puesto','INTEGER','9','No','Yes','Yes',6,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (110,'TB_Comprobantes','nrTalonario','Nro. Talonario','VARCHAR','4','Yes','No','Yes',7,'1','2','3','4','SI','0','0'),
  (111,'TB_Comprobantes','tpComprobante','Tipo de Comprobante','VARCHAR','2','Yes','No','Yes',8,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (112,'TB_Comprobantes','tpIVA','Tipo de IVA','VARCHAR','255','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (113,'TB_Comprobantes','tpLetra','Letra','VARCHAR','1','Yes','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (114,'TB_Comprobantes','vlGrabado','Grabado','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (115,'TB_Comprobantes','vlPorcentajeIIBB','Porcentaje IIBB','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (116,'TB_Comprobantes','vlPorcentajeIVA','Porcentaje IVA','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (117,'TB_Comprobantes','vlPorcentajeIVAB','Porcentaje IVAB','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (118,'TB_Comprobantes','vlR3337','R3337','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (119,'TB_Comprobantes','vlSubtotal','Sub total','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (120,'TB_Comprobantes','vlTotalGeneral','Total General','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (121,'TB_Comprobantes','vlPagoPesos','Pago Pesos','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (122,'TB_Comprobantes','vlPagoEuros','Pago Euros','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (123,'TB_Comprobantes','vlTotalIVAB','Total IVAB','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (124,'TB_Comprobantes','vlTotalR3337','Total R3337','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (125,'TB_ComprobantesDetalle','cdProducto','cdProducto','INTEGER','9','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (126,'TB_ComprobantesDetalle','dsProducto','dsProducto','VARCHAR','100','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (127,'TB_ComprobantesDetalle','dtInsercion','dtInsercion','SMALLDATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (128,'TB_ComprobantesDetalle','flSincronizado','flSincronizado','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (129,'TB_ComprobantesDetalle','nrComprobante','Nro. Comprobante','VARCHAR','12','Yes','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (130,'TB_ComprobantesDetalle','nrItem','nrItem','INTEGER','4','Yes','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (131,'TB_ComprobantesDetalle','nrTalonario','Nro. Talonario','VARCHAR','4','Yes','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (132,'TB_ComprobantesDetalle','qtCantidad','qtCantidad','INTEGER','4','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (133,'TB_ComprobantesDetalle','tpComprobante','tpComprobante','VARCHAR','2','Yes','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (134,'TB_ComprobantesDetalle','tpLetra','tpLetra','VARCHAR','1','Yes','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (135,'TB_ComprobantesDetalle','vlPrecioViaje','vlPrecioViaje','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (136,'TB_ComprobantesDetalle','vlTotalItem','vlTotalItem','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (140,'TB_Cupones','cdCliente','Cliente','INTEGER','9','No','Yes','Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (141,'TB_Cupones','dsUsuario','Usuario','VARCHAR','50','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (143,'TB_Cupones','dtCajaCliente','dtCajaCliente','DATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (144,'TB_Cupones','dtCajaLicenciatario','dtCajaLicenciatario','DATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (145,'TB_Cupones','dtCobradoalCliente','dtCobradoalCliente','DATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (146,'TB_Cupones','dtCupon','Fecha Cupón','DATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (148,'TB_Cupones','dtCompensado','dtCompensado','DATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (149,'TB_Cupones','flCobradoalCliente','Cobrado al Cliente','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (150,'TB_Cupones','flCompensado','Pagado al Licenciatario','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (151,'TB_Cupones','nrCajaCliente','nrCajaCliente','INTEGER','9','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (152,'TB_Cupones','nrCajaLicenciatario','nrCajaLicenciatario','INTEGER','9','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (153,'TB_Cupones','nrCantidadBultos','nrCantidadBultos','INTEGER','9','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (154,'TB_Cupones','nrComprabanteCliente','Nro. Comprobante','VARCHAR','12','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (155,'TB_Cupones','nrComprabanteProveedor','nrComprabanteProveedor','VARCHAR','12','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (156,'TB_Cupones','nrCupon','nrCupon','INTEGER','10','Yes','No',NULL,NULL,'1000039794','9000164471','3000000000','45','SI','0','9000164516'),
  (158,'TB_Cupones','nrLiquidacionCliente','nrLiquidacionCliente','INTEGER','9','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (159,'TB_Cupones','nrLiquidacionProveedores','nrLiquidacionProveedores','INTEGER','9','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (160,'TB_Cupones','nrLicencia','Nro. de Licencia','INTEGER','9','No','Yes','Yes',2,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (161,'TB_Cupones','nrPuesto','nrPuesto','INTEGER','9','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (162,'TB_Cupones','nrTalonarioCliente','Talonario','VARCHAR','4','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (163,'TB_Cupones','nrTalonarioProveedor','nrTalonarioProveedor','VARCHAR','4','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (164,'TB_Cupones','tpComprobanteCliente','tpComprobanteCliente','VARCHAR','2','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (165,'TB_Cupones','tpComprobanteProveedor','tpComprobanteProveedor','VARCHAR','2','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (166,'TB_Cupones','tpCupon','Tipo de Cupon','VARCHAR','20','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (167,'TB_Cupones','tpLetraCliente','tpLetraCliente','VARCHAR','1','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (168,'TB_Cupones','tpLetraLetraProveedor','tpLetraLetraProveedor','VARCHAR','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (169,'TB_Cupones','vlMontoCupon','Monto Cupón','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (192,'TB_Productos','cdProducto','Cod. Prod.','INTEGER','4','Yes','No','Yes',1,'20482','30190','40100','90042',NULL,'0','0'),
  (193,'TB_Productos','dsProducto','Descripción','VARCHAR','100','No','No','Yes',2,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (194,'TB_Productos','vlPrecioViaje','Precio Viaje','DOUBLE','6','No','No','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (195,'TB_Productos','vlPrecioPeaje','Precio Peaje','DOUBLE','6','No','No','Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (196,'TB_Proveedores','cdPostal','Código Postal','VARCHAR','8','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (197,'TB_Proveedores','dsCargo','Cargo','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (198,'TB_Proveedores','dsDomicilio','Domicilio','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (199,'TB_Proveedores','dsEmail','E-mail','VARCHAR','60','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (200,'TB_Proveedores','nrSocio','Nro. Socio','VARCHAR','10','No','No','Yes',7,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (201,'TB_Proveedores','dsRazonSocial','Razón Social','VARCHAR','100','No','No','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (202,'TB_Proveedores','dtAlta','Fecha de Alta','SMALLDATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (203,'TB_Proveedores','dtBaja','Fecha de Baja','SMALLDATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (204,'TB_Proveedores','dtFinOrdenanza','Fecha Fin de Ordenanza','SMALLDATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (205,'TB_Proveedores','flBloqueado','Bloqueado','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (206,'TB_Proveedores','nmApellido','Apellido','VARCHAR','50','No','No','Yes',2,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (207,'TB_Proveedores','nmLocalidad','Localidad','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (208,'TB_Proveedores','nmNombre','Nombre','VARCHAR','50','No','No','Yes',6,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (209,'TB_Proveedores','nrCUIT','Nro. CUIT','VARCHAR','20','No','No','Yes',5,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (210,'TB_Proveedores','nrFax','Fax','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (211,'TB_Proveedores','nrIIBB','Nro. de IIBB','INTEGER','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (212,'TB_Proveedores','cdProveedor','Cod.  Proveedor','INTEGER','9','Yes','No','Yes',4,'100001','200001','300001','900024',NULL,'0','0'),
  (213,'TB_Proveedores','nrTel','Teléfono','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (214,'TB_Proveedores','tpCategoria','Tipo Proveedor','VARCHAR','50','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (215,'TB_Proveedores','tpEstado','Estado','VARCHAR','3','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (216,'TB_Proveedores','tpIIBB','Tipo IIBB','VARCHAR','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (217,'TB_Proveedores','tpIVA','Tipo de IVA','INTEGER','9','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (218,'TB_Proveedores','vlOrdenanza3337','% R3337','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (298,'TB_Usuarios','cdPostal','Cod. Postal','VARCHAR','8','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (300,'TB_Usuarios','dsDomicilio','Domicilio','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (301,'TB_Usuarios','dsEmail','E-Mail','VARCHAR','60','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (302,'TB_Usuarios','dsPassword','Password','VARCHAR','8','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (303,'TB_Usuarios','dsUsuario','Usuario','VARCHAR','10','Yes','No','Yes',1,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (304,'TB_Usuarios','nmApellido','Apellido','VARCHAR','50','No','No','Yes',2,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (305,'TB_Usuarios','nmLocalidad','Localidad','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (306,'TB_Usuarios','nmNombre','Nombre','VARCHAR','30','No','No','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (307,'TB_Usuarios','nrCUIL','Nro. CUIL','INTEGER','11','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (308,'TB_Usuarios','nrTelefono','Telefono','VARCHAR','30','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (309,'DiccionariodeDatos','nmTabla',NULL,'VARCHAR','255','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (310,'DiccionariodeDatos','nmCampo',NULL,'VARCHAR','255','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (311,'DiccionariodeDatos','vlPuesto1','vlPuesto1','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (312,'DiccionariodeDatos','vlPuesto2','vlPuesto2','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (313,'DiccionariodeDatos','vlPuesto3','vlPuesto3','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (314,'DiccionariodeDatos','vlPuesto9','vlPuesto9','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (315,'TB_Cajas','flEstado','Cierre Caja','BIT','1','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (316,'TB_Cajas','flCajaAdm','Caja de Adm.','BIT','1','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (317,'TB_Productos','ObsHoras','Observaciones Horas','VARCHAR','50','No','No','Yes',5,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (318,'TB_Proveedores','nrLicencia','Nro. Licencia','INTEGER','4','No','No','Yes',1,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (319,'TB_Comprobantes','dsDomicilio','Domicilio','VARCHAR','70','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (320,'TB_Comprobantes','nrLicencia','Nro. Licencia','INTEGER','3','No','No','Yes',5,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (321,'TB_Comprobantes','nrBultos','Cantidad de Bultos','INTEGER','2','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (322,'TB_Comprobantes','nrPasajeros','Cantidad de Pasajeros','INTEGER','2','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (323,'TB_Comprobantes','tpMoneda','Tipo de Moneda','VARCHAR','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (324,'TB_Comprobantes','nrDoc','Nro. CUIT o Doc.','VARCHAR','20','No','No','Yes',11,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (325,'TB_Comprobantes','dsRazonSocial','Razón Social','VARCHAR','100','No','No','Yes',12,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (326,'TB_Comprobantes','nmLicenciatario','Licenciatario','VARCHAR','60','No','No','Yes',13,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (327,'TB_Comprobantes','nmLocalidad','Localidad','VARCHAR','50','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (328,'TB_Cajas','vlSaldoInicialDolares','Saldo Inicial en Dolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (329,'TB_Cajas','vlSaldoFinalDolares','Saldo Final en Dolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (330,'TB_Cajas','vlSaldoInicialEuros','Saldo Inicial en Euros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (331,'TB_Cajas','vlSaldoFinalEuros','Saldo Final en Euros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (332,'TB_Cajas','vlDiaDolar','Cotizacion Dolar','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (333,'TB_Cajas','vlDiaEuro','Cotizacion Euro','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (334,'TB_ComprobantesDetalle','vlPorcentaje','vlPorcentaje','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (335,'TB_Cupones','nmLicenciatario','Licenciatario','VARCHAR','70','No','No','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (336,'TB_Cupones','nrPasajeros','nrPasajeros','INTEGER','9','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (337,'TB_Comprobantes','vlPagoDolares','Pago Dolares','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (338,'TB_Cupones','cdCodBar','Cod. de Barras','VARCHAR','20','No','No','Yes',1,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (339,'TB_Comprobantes','cdCodBar','Codigo de Barras','VARCHAR','20','Yes','No','Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (340,'TB_Cupones','vlaFavordelLicenciatario','Debe','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (341,'TB_Cupones','vlafavorAdmin','Haber','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (343,'TB_Cupones','vlComision','Comisión','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (395,'TB_Comprobantes','dsEmail','Email','VARCHAR','70','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (396,'TB_Comprobantes','nrTel','Teléfono','VARCHAR','50','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (397,'TB_Comprobantes','cdPostal','Postal','VARCHAR','50','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (398,'TB_Comprobantes','nrCAI','CAI','VARCHAR','14','No','No',NULL,NULL,'062141575','062141575','062141575','062141575',NULL,'062141575','062141575'),
  (399,'TB_Comprobantes','dtVencimiento','Fecha Vencimiento CAI','SMALLDATETIME','10','No','No',NULL,NULL,'17/01/2005','17/01/2005','17/01/2005','17/01/2005',NULL,'17/01/2005','17/01/2005'),
  (400,'TB_Comprobantes','vlDiaDolar','vlDiaDolar','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (401,'TB_Comprobantes','vlDiaEuro','vlDiaEuro','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (402,'TB_Comprobantes','nmApellido','Apellido','VARCHAR','50','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (403,'TB_Comprobantes','nmNombre','Nombre','VARCHAR','50','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (404,'TB_Comprobantes','dsOpcional1','Hora Impresión','VARCHAR','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (405,'TB_Cajas','hrApertura','hrApertura','VARCHAR','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (406,'TB_Cajas','hrCierre','hrCierre','VARCHAR','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (408,'TB_Comprobantes','dsOpcional2','Destino','VARCHAR','100','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (410,'TB_Comprobantes','dsOpcional3','Cod. Barras AFIP','VARCHAR','40','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (412,'TB_Productos','vlPorcentaje','vlPorcentaje','INTEGER','3','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (413,'TB_Productos','tpOperacion','Operacion','VARCHAR','20','No','No','',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (415,'TB_Comisiones','cdComision','Código','INTEGER','4','Yes','No','Yes',2,'1000','2000','3000','4008',NULL,'0','0'),
  (416,'TB_Comisiones','dsComision','Descripción','VARCHAR','50','No','No','Yes',1,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (417,'TB_Comisiones','vlMontoMinimo','Monto Mínimo','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (418,'TB_Comisiones','vlMontoMaximo','Monto Máximo','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (420,'TB_Comisiones','dsUsuario','Usuario','VARCHAR','50','No','No','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (421,'TB_Comisiones','vlComision','Valor Comision','DOUBLE','6','No','No','Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (422,'TB_Conceptos','cdConcepto','Cod. Concepto','INTEGER','5','Yes','No','Yes',2,'1028','2000','2000','9135',NULL,'0','0'),
  (423,'TB_Conceptos','tpConcepto','Tipo ','VARCHAR','30','No','No','Yes',1,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (424,'TB_Conceptos','dsConcepto','Descripción','VARCHAR','100','No','No','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (425,'TB_Conceptos','vlConcepto','Valor','DOUBLE','5','No','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (426,'TB_Comprobantes','flAnulado','Anulado ','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (427,'TB_Comprobantes','dtAnulado','Fecha de Anulación','DATETIME','18','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (428,'TB_Usuarios','tpAcceso','Tipo de Acceso','VARCHAR','50','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (429,'TB_Cajas','vlCierrePesos','Cierre Pesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (430,'TB_Cajas','vlCierreDolares','Cierre Dolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (431,'TB_Cajas','vlCierreEuros','Cierre Euros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (432,'TB_Cajas','dsDiferenciaDeCierre','Obs. Diferencia de Cierre','VARCHAR','50','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (433,'TB_Cajas','vlDiferenciaDeCierre','Valor de Diferencia de Cierre','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (434,'TB_Cajas','vlSaldoFinalRealPesos','vlSaldoFinalRealPesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (435,'TB_Cajas','vlSaldoFinalRealEuros','vlSaldoFinalRealEuros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (436,'TB_Cajas','vlSaldoFinalRealDolares','vlSaldoFinalRealDolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (437,'TB_Cajas','vlTotalSaldoFinalReal','vlTotalSaldoFinalReal','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (438,'TB_Cajas','vlTotalSaldoFinal','vlTotaSaldolFinal','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (439,'TB_Cajas','vlSaldoFinalPesos','vlSaldoFinalPesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (440,'TB_Cajas','vlSaldoFinalEuros','vlSaldoFinalEuros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (441,'TB_Cajas','vlSaldoFinallDolares','vlSaldoFinallDolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (442,'TB_Cupones','vlPagoPesos','Pago Pesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (443,'TB_Cupones','vlPagoEuros','Pago Euros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (444,'TB_Cupones','vlPagoDolares','Pago Dolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (447,'TB_Cupones','flAnulado','flAnulado','BIT','1','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (448,'TB_Cupones','dtAnulado','dtAnulado','DATETIME','10','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (449,'TB_Recibos','IdRecibo','Cod. Recibo','INTEGER','10','Yes','No','Yes',1,'9000000180','3000000516','3000000000','1000062823','SI','0','0'),
  (460,'TB_Cupones','IdRecibo','IdRecibo','INTEGER','10','No','No','No',0,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (461,'TB_Productos','dsProductoBuscado','Descripción2','VARCHAR','100','No','No','No',0,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (462,'VW_Cupones','nrCupon','nrCupon','INTEGER','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (463,'VW_Cupones','nrLicencia','nrLicencia','INTEGER','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (464,'VW_Cupones','nmLicenciatario','nmLicenciatario','VARCHAR','70',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (465,'VW_Cupones','tpCupon','tpCupon','VARCHAR','60',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (466,'VW_Cupones','vlMontoCupon','vlMontoCupon','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (467,'VW_Cupones','vlPagoPesos','vlPagoPesos','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (468,'VW_Cupones','vlPagoEuros','vlPagoEuros','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (469,'VW_Cupones','vlPagoDolares','vlPagoDolares','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (470,'VW_Cupones','vlComision','vlComision','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (471,'VW_Cupones','dtCupon','dtCupon','DATETIME','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (472,'VW_Cupones','nrTalonarioCliente','nrTalonarioCliente','VARCHAR','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (473,'VW_Cupones','nrComprabanteCliente','nrComprabanteCliente','VARCHAR','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (474,'VW_Cupones','dsOpcional2','dsOpcional2','VARCHAR','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (475,'VW_Cupones','flCompensado','flCompensado','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (476,'VW_Cupones','dtComprobante','dtComprobante','SMALLDATETIME','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (477,'TB_Comisiones','vlComisionEmpleados','Comisión a Empleados','DOUBLE','6','No',NULL,'Yes',5,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (478,'TB_Comprobantes','tpComision','tpComision','VARCHAR','20','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (479,'TB_ComprobantesDetalle','tpOperacion','tpOperacion','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (480,'TB_ComprobantesDetalle','vlPrecioPeaje','vlPrecioPeaje','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (481,'VW_Cupones','dtComprobante_Numerico','dtComprobante_Numerico','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (482,'TB_Conceptos','tpOperacion','Operación','VARCHAR','50',NULL,NULL,'Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (483,'TB_MovimientosContables','IdMovimiento','Código','NUMERIC','9',NULL,NULL,'Yes',1,NULL,NULL,'','10134524','SI','0','0'),
  (484,'TB_MovimientosContables','dsMovimiento','Descripción','VARCHAR','100',NULL,NULL,'Yes',5,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (485,'TB_MovimientosContables','IdRecibo','IdRecibo','NUMERIC','10',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (486,'TB_MovimientosContables','cdConcepto','cdConcepto','INTEGER','6',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (487,'TB_MovimientosContables','tpConcepto','Tipo Concepto','VARCHAR','50',NULL,NULL,'Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (488,'TB_MovimientosContables','dsConcepto','Concepto','VARCHAR','100',NULL,NULL,'Yes',2,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (489,'TB_MovimientosContables','tpOperacion','Tipo Operación','VARCHAR','50',NULL,NULL,'Yes',6,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (490,'TB_MovimientosContables','vlPesos','Pesos','DOUBLE','8',NULL,NULL,'Yes',11,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (491,'TB_MovimientosContables','vlDolares','Dolares','DOUBLE','8',NULL,NULL,'Yes',12,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (492,'TB_MovimientosContables','vlEuros','Euros','DOUBLE','8',NULL,NULL,'Yes',13,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (494,'TB_MovimientosContables','nrRecibo','Recibo','VARCHAR','50',NULL,NULL,'Yes',7,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (495,'TB_MovimientosContables','nrFactura','Factura','VARCHAR','50',NULL,NULL,'Yes',8,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (496,'TB_MovimientosContables','nrCaja','Nro. Caja','NUMERIC','9',NULL,NULL,'No',0,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (497,'TB_MovimientosContables','dsUsuario','Usuario','VARCHAR','50',NULL,NULL,'Yes',10,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (498,'TB_MovimientosContables','dtMovimiento','Fecha de Movimiento','DATETIME','10',NULL,NULL,'Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (499,'TB_MovimientosContables','dsProveedor','Des. Proveedor','VARCHAR','60',NULL,NULL,'Yes',14,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (500,'TB_MovimientosContables','IdProveedor','Id. Proveedor','INTEGER','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (501,'TB_MovimientosContables','dsConceptoBuscado','dsConceptoBuscado','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (502,'VW_UltimaCajaAdm','nrCaja','nrCaja','NUMERIC','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (503,'VW_UltimaCajaAdm','vlSaldoFinalRealPesos','vlSaldoFinalRealPesos','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (504,'VW_UltimaCajaAdm','vlSaldoFinalRealEuros','vlSaldoFinalRealEuros','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (505,'VW_UltimaCajaAdm','vlSaldoFinalRealDolares','vlSaldoFinalRealDolares','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (506,'VW_Productos','cdProducto','Cod. Prod.','INTEGER','4','Yes','No','Yes',1,'20000','30000','40000','90003',NULL,'0','0'),
  (507,'VW_Productos','dsProducto','Descripción','VARCHAR','100','No','No','Yes',2,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (508,'VW_Productos','vlPrecioViaje','Precio Viaje','DOUBLE','6','No','No','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (509,'VW_Productos','vlPrecioPeaje','Precio Peaje','DOUBLE','6','No','No','Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (510,'VW_Productos','ObsHoras','Observaciones Horas','VARCHAR','50','No','No','Yes',5,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (511,'VW_Productos','vlPorcentaje','vlPorcentaje','INTEGER','3','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (512,'VW_Productos','tpOperacion','Operacion','VARCHAR','20','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (513,'VW_Productos','dsProductoBuscado','Descripción2','VARCHAR','100','No','No','No',0,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (517,'VW_SumaCajaADM','SumaDolares','Suma Dolares','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (518,'VW_SumaCajaADM','SumaEuros','Suma Euros','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (519,'VW_SumaCajaADM','tpOperacion','Operacion','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (520,'VW_SumaCajaADM','nrCaja','Caja','NUMERIC','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (521,'VW_SumaCajaADM','SumaPesos','Suma Pesos','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (522,'VW_CajasPuestos','dsUsuario','Usuario','VARCHAR','10','No','Yes','Yes',5,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (523,'VW_CajasPuestos','dtApertura','Fecha de Apertura','DATETIME','18','No','No','Yes',2,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (524,'VW_CajasPuestos','dtCierre','Fecha de Cierre','DATETIME','18','No','No','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (525,'VW_CajasPuestos','nrCaja','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'1000000003','2000000001','3000000000','9000000027',NULL,'0','0'),
  (526,'VW_CajasPuestos','nrPuesto','Nro. Puesto','INTEGER','9','No','Yes','Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (527,'VW_CajasPuestos','vlSaldoInicialPesos','Saldo Inicial en Pesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (528,'VW_CajasPuestos','vlSaldoFinalPesos','Saldo Final en Pesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (529,'VW_CajasPuestos','flEstado','Cierre Caja','BIT','1','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (530,'VW_CajasPuestos','flCajaAdm','Caja de Adm.','BIT','1','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (531,'VW_CajasPuestos','vlSaldoInicialDolares','Saldo Inicial en Dolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (532,'VW_CajasPuestos','vlSaldoInicialEuros','Saldo Inicial en Euros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (533,'VW_CajasPuestos','vlDiaDolar','Cotizacion Dolar','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (534,'VW_CajasPuestos','hrCierre','hrCierre','VARCHAR','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (535,'VW_CajasPuestos','vlSaldoFinalDolares','Saldo Final en Dolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (536,'VW_CajasPuestos','vlSaldoFinalEuros','Saldo Final en Euros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (537,'VW_CajasPuestos','vlDiaEuro','Cotizacion Euro','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (538,'VW_CajasPuestos','hrApertura','hrApertura','VARCHAR','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (539,'VW_CajasPuestos','vlCierrePesos','Cierre Pesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (540,'VW_CajasPuestos','vlCierreEuros','Cierre Euros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (541,'VW_CajasPuestos','vlDiferenciaDeCierre','Valor de Diferencia de Cierre','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (542,'VW_CajasPuestos','vlSaldoFinalRealEuros','vlSaldoFinalRealEuros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (543,'VW_CajasPuestos','vlTotalSaldoFinalReal','vlTotalSaldoFinalReal','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (544,'VW_CajasPuestos','vlSaldoFinalPesos','vlSaldoFinalPesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (545,'VW_CajasPuestos','vlSaldoFinallDolares','vlSaldoFinallDolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (546,'VW_CajasPuestos','vlCierreDolares','Cierre Dolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (547,'VW_CajasPuestos','dsDiferenciaDeCierre','Obs. Diferencia de Cierre','VARCHAR','50','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (548,'VW_CajasPuestos','vlSaldoFinalRealPesos','vlSaldoFinalRealPesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (549,'VW_CajasPuestos','vlSaldoFinalRealDolares','vlSaldoFinalRealDolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (550,'VW_CajasPuestos','vlTotalSaldoFinal','vlTotaSaldolFinal','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (551,'VW_CajasPuestos','vlSaldoFinalEuros','vlSaldoFinalEuros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (552,'VW_CajasPuestos','tpAcceso','tpAcceso','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (553,'VW_ResumenCajaADM','tpOperacion','Operación','VARCHAR','50',NULL,NULL,'Yes',1,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (554,'VW_ResumenCajaADM','nrCaja','Nro. de Caja','NUMERIC','9',NULL,NULL,'Yes',2,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (555,'VW_ResumenCajaADM','dsConcepto','Concepto','VARCHAR','100',NULL,NULL,'Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (556,'VW_ResumenCajaADM','SumaPesos','Pesos','DOUBLE','6',NULL,NULL,'Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (557,'VW_ResumenCajaADM','SumaDolares','Dolares','DOUBLE','6',NULL,NULL,'Yes',5,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (558,'VW_ResumenCajaADM','SumaEuros','Euros','DOUBLE','6',NULL,NULL,'Yes',6,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (559,'VW_CuponesClientes','cdCliente','cdCliente','NUMERIC','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (560,'VW_CuponesClientes','nrCupon','nrCupon','NUMERIC','9','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (561,'VW_CuponesClientes','nrLicencia','nrLicencia','VARCHAR','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (562,'VW_CuponesClientes','nmLicenciatario','nmLicenciatario','VARCHAR','60',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (563,'VW_CuponesClientes','tpCupon','tpCupon','VARCHAR','60',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (564,'VW_CuponesClientes','vlMontoCupon','vlMontoCupon','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (565,'VW_CuponesClientes','vlPagoPesos','vlPagoPesos ','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (566,'VW_CuponesClientes','vlPagoEuros','vlPagoEuros ','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (567,'VW_CuponesClientes','vlPagoDolares','vlPagoDolares','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (568,'VW_CuponesClientes','vlComision','vlComision','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (569,'VW_CuponesClientes','dtCupon','dtCupon','DATETIME','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (570,'VW_CuponesClientes','nrTalonarioCliente','nrTalonarioCliente','VARCHAR','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (571,'VW_CuponesClientes','nrComprabanteCliente','nrComprabanteCliente','VARCHAR','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (572,'VW_CuponesClientes','dsOpcional2','dsOpcional2','VARCHAR','200',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (573,'VW_CuponesClientes','flCompensado','flCompensado','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (574,'VW_CuponesClientes','dtComprobante','dtComprobante','DATETIME','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (575,'VW_CuponesClientes','dtComprobante_Numerico','dtComprobante_Numerico','NUMERIC','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (576,'VW_CuponesClientes','dsOpcional1','dsOpcional1','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (577,'VW_CuponesClientes','dsRazonSocial','dsRazonSocial','VARCHAR','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (579,'TB_Comprobantes','nmEmpleado','Empleado','VARCHAR','60','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (580,'VW_CajadeADMAbierta','nrCaja','nrCaja','NUMERIC','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (581,'VW_CajadeADMAbierta','vlSaldoFinalRealPesos','vlSaldoFinalRealPesos','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (582,'VW_CajadeADMAbierta','vlSaldoFinalRealEuros','vlSaldoFinalRealEuros','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (583,'VW_CajadeADMAbierta','vlSaldoFinalRealDolares','vlSaldoFinalRealDolares','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (584,'VW_CajadeADMAbierta','dsUsuario','dsUsuario','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (585,'VW_SumaCajaPuestosCondVenta','nrCaja','nrCaja','NUMERIC','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (586,'VW_SumaCajaPuestosCondVenta','cdCondVenta','cdCondVenta','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (587,'VW_SumaCajaPuestosCondVenta','SumaPesos','SumaPesos','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (588,'VW_SumaCajaPuestosCondVenta','SumaEuros','SumaEuros','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (589,'VW_SumaCajaPuestosCondVenta','SumaDolares','SumaDolares','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (590,'VW_Cupones','nrCajaCliente','nrCajaCliente','NUMERIC','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (591,'VW_Cupones','nrCajaLicenciatario','nrCajaLicenciatario','NUMERIC','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (592,'TB_Comprobantes_Imprime','cdCliente','Cod. Cliente','INTEGER','9','No','Yes','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (593,'TB_Comprobantes_Imprime','cdCondVenta','Cond Venta','VARCHAR','20','No','Yes','Yes',10,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (594,'TB_Comprobantes_Imprime','dsUsuario','Usuario','VARCHAR','20','No','Yes','Yes',14,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (595,'TB_Comprobantes_Imprime','dsLeyenda','Leyenda','VARCHAR','255','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (596,'TB_Comprobantes_Imprime','dtCaja','Fecha Caja','SMALLDATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (597,'TB_Comprobantes_Imprime','dtComprobante','Fecha Comprobante','SMALLDATETIME','10','No','No','Yes',1,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (598,'TB_Comprobantes_Imprime','dtInsercion','Fecha de Inserción','SMALLDATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (599,'TB_Comprobantes_Imprime','flManual','Factura Manual','VARCHAR','255','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (600,'TB_Comprobantes_Imprime','flSincronizado','flSincronizado','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (601,'TB_Comprobantes_Imprime','nrCaja','Nro. Caja','INTEGER','9','No','Yes','Yes',9,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (602,'TB_Comprobantes_Imprime','nrComprobante','Nro. Comprobante','VARCHAR','12','Yes','No','Yes',2,'515','142','0','1','SI','0','0'),
  (603,'TB_Comprobantes_Imprime','nrPuesto','Nro. Puesto','INTEGER','9','No','Yes','Yes',6,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (604,'TB_Comprobantes_Imprime','nrTalonario','Nro. Talonario','VARCHAR','4','Yes','No','Yes',7,'1','2','4','3','SI','0','0'),
  (605,'TB_Comprobantes_Imprime','tpComprobante','Tipo de Comprobante','VARCHAR','2','Yes','No','Yes',8,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (606,'TB_Comprobantes_Imprime','tpIVA','Tipo de IVA','VARCHAR','255','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (607,'TB_Comprobantes_Imprime','tpLetra','Letra','VARCHAR','1','Yes','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (608,'TB_Comprobantes_Imprime','vlGrabado','Grabado','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (609,'TB_Comprobantes_Imprime','vlPorcentajeIIBB','Porcentaje IIBB','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (610,'TB_Comprobantes_Imprime','vlPorcentajeIVA','Porcentaje IVA','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (611,'TB_Comprobantes_Imprime','vlPorcentajeIVAB','Porcentaje IVAB','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (612,'TB_Comprobantes_Imprime','vlR3337','R3337','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (613,'TB_Comprobantes_Imprime','vlSubtotal','Sub total','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (614,'TB_Comprobantes_Imprime','vlTotalGeneral','Total General','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (615,'TB_Comprobantes_Imprime','vlPagoPesos','Pago Pesos','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (616,'TB_Comprobantes_Imprime','vlPagoEuros','Pago Euros','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (617,'TB_Comprobantes_Imprime','vlTotalIVAB','Total IVAB','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (618,'TB_Comprobantes_Imprime','vlTotalR3337','Total R3337','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (619,'TB_Comprobantes_Imprime','tpMoneda','Tipo de Moneda','VARCHAR','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (620,'TB_Comprobantes_Imprime','dsDomicilio','Domicilio','VARCHAR','70','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (621,'TB_Comprobantes_Imprime','dsRazonSocial','Razón Social','VARCHAR','100','No','No','Yes',12,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (622,'TB_Comprobantes_Imprime','nmLicenciatario','Licenciatario','VARCHAR','60','No','No','Yes',13,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (623,'TB_Comprobantes_Imprime','nmLocalidad','Localidad','VARCHAR','50','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (624,'TB_Comprobantes_Imprime','dsEmail','Email','VARCHAR','70','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (625,'TB_Comprobantes_Imprime','cdPostal','Postal','VARCHAR','50','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (626,'TB_Comprobantes_Imprime','dtVencimiento','Fecha Vencimiento CAI','SMALLDATETIME','10','No','No',NULL,NULL,'17/01/2005','17/01/2005','17/01/2005','17/01/2005',NULL,'0','0'),
  (627,'TB_Comprobantes_Imprime','vlDiaDolar','vlDiaDolar','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (628,'TB_Comprobantes_Imprime','nmApellido','Apellido','VARCHAR','50','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (629,'TB_Comprobantes_Imprime','nmNombre','Nombre','VARCHAR','50','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (630,'TB_Comprobantes_Imprime','dsOpcional1','Hora Impresión','VARCHAR','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (631,'TB_Comprobantes_Imprime','nrLicencia','Nro. Licencia','INTEGER','3','No','No','Yes',5,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (632,'TB_Comprobantes_Imprime','nrBultos','Cantidad de Bultos','INTEGER','2','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (633,'TB_Comprobantes_Imprime','nrPasajeros','Cantidad de Pasajeros','INTEGER','2','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (634,'TB_Comprobantes_Imprime','nrDoc','Nro. CUIT o Doc.','INTEGER','20','No','No','Yes',11,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (635,'TB_Comprobantes_Imprime','vlPagoDolares','Pago Dolares','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (636,'TB_Comprobantes_Imprime','cdCodBar','Codigo de Barras','VARCHAR','20','Yes','No','Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (637,'TB_Comprobantes_Imprime','nrTel','Teléfono','VARCHAR','50','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (638,'TB_Comprobantes_Imprime','nrCAI','CAI','VARCHAR','14','No','No',NULL,NULL,'062141575','062141575','062141575','062141575',NULL,'0','0'),
  (639,'TB_Comprobantes_Imprime','vlDiaEuro','vlDiaEuro','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (640,'TB_Comprobantes_Imprime','dsOpcional2','Destino','VARCHAR','100','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (641,'TB_Comprobantes_Imprime','dsOpcional3','Cod. Barras AFIP','VARCHAR','40','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (642,'TB_Comprobantes_Imprime','flAnulado','Anulado ','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (643,'TB_Comprobantes_Imprime','dtAnulado','Fecha de Anulación','DATETIME','18','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (644,'TB_Comprobantes_Imprime','tpComision','tpComision','VARCHAR','20','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (645,'TB_Comprobantes_Imprime','nmEmpleado','Empleado','VARCHAR','60','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (646,'TB_ComprobantesDetalle_Imprime','cdProducto','cdProducto','INTEGER','9','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (647,'TB_ComprobantesDetalle_Imprime','dsProducto','dsProducto','VARCHAR','100','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (648,'TB_ComprobantesDetalle_Imprime','dtInsercion','dtInsercion','SMALLDATETIME','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (649,'TB_ComprobantesDetalle_Imprime','flSincronizado','flSincronizado','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (650,'TB_ComprobantesDetalle_Imprime','nrComprobante','Nro. Comprobante','VARCHAR','12','Yes','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (651,'TB_ComprobantesDetalle_Imprime','nrItem','nrItem','INTEGER','4','Yes','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (652,'TB_ComprobantesDetalle_Imprime','nrTalonario','Nro. Talonario','VARCHAR','4','Yes','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (653,'TB_ComprobantesDetalle_Imprime','qtCantidad','qtCantidad','INTEGER','4','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (654,'TB_ComprobantesDetalle_Imprime','tpComprobante','tpComprobante','VARCHAR','2','Yes','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (655,'TB_ComprobantesDetalle_Imprime','tpLetra','tpLetra','VARCHAR','1','Yes','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (656,'TB_ComprobantesDetalle_Imprime','vlPrecioViaje','vlPrecioViaje','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (657,'TB_ComprobantesDetalle_Imprime','vlTotalItem','vlTotalItem','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (658,'TB_ComprobantesDetalle_Imprime','vlPorcentaje','vlPorcentaje','DOUBLE','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (659,'TB_ComprobantesDetalle_Imprime','tpOperacion','tpOperacion','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (660,'TB_ComprobantesDetalle_Imprime','vlPrecioPeaje','vlPrecioPeaje','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (661,'TB_Cajas','vlTotalSaldoCierre\r\n','vlTotalSaldoCierre\r\n','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (662,'TB_Cajas','vlTotalSaldoCierre','vlTotalSaldoCierre','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (663,'VW_Productos','flMuestra','flMuestra','BIT','1','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (664,'TB_Cajas','vlTotalSaldoInicial','vlTotalSaldoInicial','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (665,'TB_Productos','flMuestra','flMuestra','BIT','1','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (666,'VW_Cupones','dtCompensado','dtCompensado','DATETIME','16','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (667,'VW_Cupones','dsUsuario','Usuario','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (668,'VW_DetalleMovimientosContables','tpOperacion','tpOperacion','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (669,'VW_DetalleMovimientosContables ','nrCaja','nrCaja','NUMERIC','9','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (670,'VW_DetalleMovimientosContables','dsConcepto','dsConcepto','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (671,'VW_DetalleMovimientosContables ','vlPesos','vlPesos','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (672,'VW_DetalleMovimientosContables ','vlDolares','vlDolares','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (673,'VW_DetalleMovimientosContables ','vlEuros','vlEuros','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (674,'VW_DetalleMovimientosContables ','nrRecibo','nrRecibo','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (675,'VW_DetalleMovimientosContables ','dtMovimiento','dtMovimiento','DATETIME','16','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (676,'VW_DetalleMovimientosContables ','dsProveedor','dsProveedor','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (677,'VW_DetalleMovimientosContables ','nrFactura','nrFactura','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (678,'VW_DetalleMovimientosContables ','dsUsuario','dsUsuario','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (680,'VW_DetalleMovimientosContablesCupones','tpOperacion','tpOperacion','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (681,'VW_DetalleMovimientosContablesCupones','nrCaja','nrCaja','NUMERIC','9','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (682,'VW_DetalleMovimientosContablesCupones','dsConcepto','dsConcepto','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (683,'VW_DetalleMovimientosContablesCupones','nrLicencia','nrLicencia','VARCHAR','3','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (684,'VW_DetalleMovimientosContablesCupones','tpCupon','tpCupon','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (685,'VW_DetalleMovimientosContablesCupones','nrTalonarioCliente','nrTalonarioCliente','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (686,'VW_DetalleMovimientosContablesCupones','nrComprabanteCliente','nrComprabanteCliente ','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (687,'VW_DetalleMovimientosContablesCupones','vlPesos','vlPesos','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (688,'VW_DetalleMovimientosContablesCupones','vlDolares','vlDolares','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (689,'VW_DetalleMovimientosContablesCupones','vlEuros','vlEuros','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (690,'VW_DetalleMovimientosContablesCupones','vlComision','vlComision','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (691,'VW_DetalleMovimientosContablesCupones','vlMontoCupon','vlMontoCupon','DOUBLE','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (692,'VW_DetalleMovimientosContablesCupones','nrRecibo','nrRecibo','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (693,'VW_DetalleMovimientosContablesCupones','flCompensado','flCompensado','BIT','1','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (694,'VW_DetalleMovimientosContablesCupones','dtCompensado','dtCompensado','DATETIME','16','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (695,'VW_DetalleMovimientosContablesCupones','dsUsuario','dsUsuario','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (696,'VWCajasPuestosdesdelosPuetos','dsUsuario','Usuario','VARCHAR','10','No','Yes','Yes',5,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (697,'VWCajasPuestosdesdelosPuetos','dtCierre','Fecha de Cierre','DATETIME','18','No','No','Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (698,'VWCajasPuestosdesdelosPuetos','nrPuesto','Nro. Puesto','INTEGER','9','No','Yes','Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (699,'VWCajasPuestosdesdelosPuetos','vlSaldoFinalPesos','Saldo Final en Pesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (700,'VWCajasPuestosdesdelosPuetos','flCajaAdm','Caja de Adm.','BIT','1','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (701,'VWCajasPuestosdesdelosPuetos','vlSaldoInicialEuros','Saldo Inicial en Euros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (702,'VWCajasPuestosdesdelosPuetos','hrCierre','hrCierre','VARCHAR','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (703,'VWCajasPuestosdesdelosPuetos','vlSaldoFinalEuros','Saldo Final en Euros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (704,'VWCajasPuestosdesdelosPuetos','hrApertura','hrApertura','VARCHAR','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (705,'VWCajasPuestosdesdelosPuetos','vlCierreEuros','Cierre Euros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (706,'VWCajasPuestosdesdelosPuetos','vlDiferenciaDeCierre','Valor de Diferencia de Cierre','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (707,'VWCajasPuestosdesdelosPuetos','vlSaldoFinalRealEuros','vlSaldoFinalRealEuros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (708,'VWCajasPuestosdesdelosPuetos','vlTotalSaldoFinalReal','vlTotalSaldoFinalReal','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (709,'VWCajasPuestosdesdelosPuetos','vlSaldoFinalPesos','vlSaldoFinalPesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (710,'VWCajasPuestosdesdelosPuetos','vlSaldoFinallDolares','vlSaldoFinallDolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (711,'VWCajasPuestosdesdelosPuetos','vlCierreDolares','Cierre Dolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (712,'VWCajasPuestosdesdelosPuetos','dsDiferenciaDeCierre','Obs. Diferencia de Cierre','VARCHAR','50','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (713,'VWCajasPuestosdesdelosPuetos','vlSaldoFinalRealPesos','vlSaldoFinalRealPesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (714,'VWCajasPuestosdesdelosPuetos','vlSaldoFinalRealDolares','vlSaldoFinalRealDolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (715,'VWCajasPuestosdesdelosPuetos','vlTotalSaldoFinal','vlTotaSaldolFinal','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (716,'VWCajasPuestosdesdelosPuetos','vlSaldoFinalEuros','vlSaldoFinalEuros','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (717,'VWCajasPuestosdesdelosPuetos','tpAcceso','tpAcceso','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (718,'VWCajasPuestosdesdelosPuetos','dtApertura','Fecha de Apertura','DATETIME','18','No','No','Yes',2,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (719,'VWCajasPuestosdesdelosPuetos','nrCaja','Nro. de Caja','INTEGER','9','Yes','No','Yes',1,'1000000003','2000000001','3000000000','9000000027',NULL,'0','0'),
  (720,'VWCajasPuestosdesdelosPuetos','vlSaldoInicialPesos','Saldo Inicial en Pesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (721,'VWCajasPuestosdesdelosPuetos','flEstado','Cierre Caja','BIT','1','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (722,'VWCajasPuestosdesdelosPuetos','vlSaldoInicialDolares','Saldo Inicial en Dolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (723,'VWCajasPuestosdesdelosPuetos','vlDiaDolar','Cotizacion Dolar','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (724,'VWCajasPuestosdesdelosPuetos','vlSaldoFinalDolares','Saldo Final en Dolares','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (725,'VWCajasPuestosdesdelosPuetos','vlDiaEuro','Cotizacion Euro','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (726,'VWCajasPuestosdesdelosPuetos','vlCierrePesos','Cierre Pesos','DOUBLE','6','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (727,'TB_Cajas','dsObservacion','dsObservacion','VARCHAR','400','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (728,'TB_Cajas','dtObservacion','dtObservacion','DATETIME','16','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (729,'TB_Productos','cdOrden','cdOrden','VARCHAR','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (730,'TB_Productos','vlPrecioViajeSinPeaje','Precio Viaje Sin Peaje','DOUBLE','6','No','No','Yes',6,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (731,'TB_ResumenMovimientosContables','IdTabla','IdTabla','NUMERIC','9','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (732,'TB_ResumenMovimientosContables','tpOperacion','Operación','VARCHAR','50',NULL,NULL,'Yes',2,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (733,'TB_ResumenMovimientosContables','vlSumaPesos','vlSumaPesos','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (734,'TB_ResumenMovimientosContables','vlSumaEuros','vlSumaEuros','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (735,'TB_ResumenMovimientosContables','tpConcepto','Tipo','VARCHAR','50',NULL,NULL,'Yes',1,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (736,'TB_ResumenMovimientosContables','dsConcepto','Concepto','VARCHAR','60',NULL,NULL,'Yes',3,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (737,'TB_ResumenMovimientosContables','vlSumaDolares','vlSumaDolares','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (738,'TB_ResumenMovimientosContables','dsUsuario','dsUsuario','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (739,'TB_Cupones','dsObservacion','Observación de Pago','VARCHAR','500','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (740,'VW_Cupones','dsObservacion','Observación de Pago','VARCHAR','400','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (744,'TB_Cupones','IdReciboCtaCte','IdReciboCtaCte','NUMERIC','10','No','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (745,'SalidaEstudioContable','nrTalonario','nrTalonario','INTEGER','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (746,'SalidaEstudioContable','nrMes','nrMes','INTEGER','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (747,'SalidaEstudioContable','cdCondVenta','cdCondVenta','VARCHAR','20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (748,'SalidaEstudioContable','nrAnio','nrAnio','INTEGER','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (749,'TB_Comprobantes','IdReciboCtaCte','IdReciboCtaCte','INTEGER','9','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (752,'TB_Cupones','dsDestino','dsDestino','VARCHAR','100','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (754,'TB_Cupones','dsHoraViaje','dsDestino','CHAR','10','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0');

COMMIT;

#
# Data for the `diccionariodedatos` table  (LIMIT 500,500)
#

INSERT INTO `diccionariodedatos` (`IdCampo`, `nmTabla`, `nmCampo`, `nmCampoExterno`, `tpTipo`, `nrTamanio`, `flClave`, `flClaveForanea`, `flBusqueda`, `nrOrdenBusqueda`, `vlPuesto1`, `vlPuesto2`, `vlPuesto3`, `vlPuesto9`, `Actualizar`, `vlPuesto4`, `vlPuesto5`) VALUES 
  (755,'SP_ObtenerFacturacionMensual','Talonario','Talonario','VARCHAR','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (756,'SP_ObtenerFacturacionMensual','Tipo de Comprobante','Tipo de Comprobante','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (757,'SP_ObtenerFacturacionMensual','Anulado','Anulado','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (758,'SP_ObtenerFacturacionMensual','Licenciatario','Licenciatario','VARCHAR','60',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (759,'SP_ObtenerFacturacionMensual','Contribucion','Contribucion','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (760,'SP_ObtenerFacturacionMensual','Pagado al Licenciatario','Pagado al Licenciatario','VARCHAR','60',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (761,'SP_ObtenerFacturacionMensual','Comprobante','Comprobante','VARCHAR','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (762,'SP_ObtenerFacturacionMensual','Fecha','Fecha','SMALLDATETIME','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (763,'SP_ObtenerFacturacionMensual','Licencia','Licencia','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (764,'SP_ObtenerFacturacionMensual','Importe','Importe','DOUBLE','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (765,'SP_ObtenerFacturacionMensual','Destino','Destino','VARCHAR','255',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (766,'SP_ObtenerFacturacionMensual','Tipo de Facturacion','Tipo de Facturacion','VARCHAR','30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (767,'TB_MovimientosContables','dsObservacion','Observacion','VARCHAR','255',NULL,NULL,'Yes',15,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (775,'TB_Usuarios','flBloqueado','Bloqueado','BIT','1','No','No','Yes',4,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (776,'TB_Comprobantes','flCargaErronea','Carga Erronea','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'SI','0','0'),
  (777,'TB_Puestos','tpletra','Letra','CHAR','1',NULL,NULL,'Yes',7,NULL,NULL,NULL,NULL,'SI','0','0'),
  (778,'TB_Puestos','flRespeta_secuencia_carga_manual','Respeta Secuencia Carga Manual','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SI','0','0'),
  (779,'TB_Puestos','dsPuesto','Descripción','VARCHAR','50',NULL,NULL,'Yes',2,NULL,NULL,NULL,NULL,'SI','0','0'),
  (780,'TB_Puestos','dtActualizado','Fecha','DATETIME','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SI','0','0'),
  (782,'TB_Puestos','dsIP','IP','VARCHAR','20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SI','0','0'),
  (783,'TB_Puestos','nrTalonario_manual','Nro Talonario Factura','INTEGER','4',NULL,NULL,'Yes',3,NULL,NULL,NULL,NULL,'SI','0','0'),
  (784,'TB_Puestos','nrComprobante_manual_ult','Comprobante Manual Siguiente','INTEGER','8',NULL,NULL,'Yes',5,NULL,NULL,NULL,NULL,'SI','0','0'),
  (785,'TB_Puestos','nrComprobante_automatico_ult','Comprobante Automático Siguiente','INTEGER','8',NULL,NULL,'Yes',6,NULL,NULL,NULL,NULL,'SI','0','0'),
  (786,'TB_Puestos','nrTalonario_automatico','Nro Talonario Recibo','INTEGER','4',NULL,NULL,'Yes',4,NULL,NULL,NULL,NULL,'SI','0','0'),
  (787,'TB_Comprobantes','flCargaErronea','Carga Erronea','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'SI','0','0'),
  (788,'TB_Puestos','nrPuesto','Nro. de Puesto','NUMERIC','3',NULL,NULL,'Yes',1,NULL,NULL,NULL,NULL,'SI','0','0'),
  (798,'TB_Recibos','vlAcumPesos','Acum. Pesos','DOUBLE','6','No',NULL,'Yes',5,NULL,NULL,NULL,NULL,'SI','0','0'),
  (799,'TB_Recibos','vlAcumDolares','Acum. Dolares','DOUBLE','6','No',NULL,'Yes',2,NULL,NULL,NULL,NULL,'SI','0','0'),
  (800,'TB_Recibos','vlAcumEuros','Acum. Euros','DOUBLE','6','No',NULL,'Yes',6,NULL,NULL,NULL,NULL,'SI','0','0'),
  (801,'TB_Recibos','vlAcumComision','Acum. Comision','DOUBLE','6','No',NULL,'Yes',7,NULL,NULL,NULL,NULL,'SI','0','0'),
  (802,'TB_Recibos','vlSaldoPesos','Saldo Pesos','DOUBLE','6','No',NULL,'Yes',3,NULL,NULL,NULL,NULL,'SI','0','0'),
  (803,'TB_Recibos','vlSaldoDolares','Saldo Dolares','DOUBLE','6','No',NULL,'Yes',8,NULL,NULL,NULL,NULL,'SI','0','0'),
  (804,'TB_Recibos','vlSaldoEuros','Saldo Euros','DOUBLE','6','No',NULL,'Yes',4,NULL,NULL,NULL,NULL,'SI','0','0'),
  (805,'TB_Recibos','dtRecibo','Fecha de Recibo','DATETIME','10','No',NULL,'Yes',9,NULL,NULL,NULL,NULL,'SI','0','0'),
  (806,'TB_Recibos','tpRecibo','Tipo de Recibo','VARCHAR','50','No',NULL,'Yes',5,NULL,NULL,NULL,NULL,'SI','0','0'),
  (807,'TB_Recibos','cdCliente','Cod. de Cliente','VARCHAR','50','No','No','Yes',3,NULL,NULL,NULL,NULL,'SI','0','0'),
  (808,'TB_Recibos','dsRazonSocial','Razón Social','VARCHAR','100','No','No','Yes',4,NULL,NULL,NULL,NULL,'SI','0','0'),
  (809,'TB_Recibos','flAnulado','Anulado','BIT','1','No','No','Yes',10,NULL,NULL,NULL,NULL,'SI','0','0'),
  (810,'TB_Recibos','nrCaja','Nro. de Caja','INTEGER','10','No',NULL,'Yes',11,NULL,NULL,NULL,NULL,'SI','0','0'),
  (811,'TB_Recibos','dsUsuario','Usuario','VARCHAR','50','No',NULL,'Yes',12,NULL,NULL,NULL,NULL,'SI','0','0'),
  (812,'TB_Clientes','tpIVA','Tipo de IVA','VARCHAR','50','No','Yes',NULL,NULL,NULL,NULL,NULL,NULL,'SI','0','0'),
  (813,'TB_ComprobantesDetalle','vlKilometros','vlKilometro','INTEGER','6','No','No',NULL,NULL,NULL,NULL,NULL,NULL,'SI','0','0'),
  (814,'TB_Productos','vlKilometros','vlKilometro','INTEGER','6','No','No','Yes',6,NULL,NULL,NULL,NULL,'SI','0','0'),
  (821,'DiccionariodeDatos','vlPuesto4','vlPuesto4','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (822,'DiccionariodeDatos','vlPuesto5','vlPuesto5','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (886,'TB_OpcionesMenues','IdOpcionMenu','Código de Menú','INTEGER','4','Yes',NULL,'Yes',2,NULL,NULL,NULL,'0',NULL,NULL,NULL),
  (887,'TB_OpcionesMenues','dsOpcionMenu','Descripción','VARCHAR','200','No',NULL,'Yes',1,NULL,NULL,NULL,'0',NULL,NULL,NULL),
  (888,'TB_OpcionesMenues','nmOpcionMenu','nombre vb','VARCHAR','60','No',NULL,'Yes',3,NULL,NULL,NULL,'0',NULL,NULL,NULL),
  (889,'TB_OpcionesMenues','tpNivelJerarquico','Nvel Jerárquico','VARCHAR','50','No',NULL,'Yes',4,NULL,NULL,NULL,'0',NULL,NULL,NULL),
  (890,'TB_OpcionesMenues','nrorden','Orden','INTEGER','4','No',NULL,'Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (891,'TB_OpcionesMenues','nrNivelHoja','Orden','INTEGER','4','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (892,'TB_OpcionesMenues','flvisible','flvisible','BIT','1','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (893,'TB_OpcionesMenues','flCajaAdm','flCajaAdm','BIT','1','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (894,'TB_Usuarios','tpNivelJerarquico','Nivel Jerárquico','VARCHAR','50','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (895,'sco_AccesosOpcionesMenu','@p_tpNivelAcceso','Nivel Jerárquico','VARCHAR','60','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (896,'sco_AccesosOpcionesMenu','@p_operaconcaja','opera con caja','INTEGER','1','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (897,'TB_NivelAcceso','tpNivelAcceso','Tipo de Nivel de Acceso','VARCHAR','60','Yes',NULL,'Yes',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (898,'TB_NivelAccesoOpcionesMenu','tpNivelAcceso','Tipo de Nivel de Acceso','VARCHAR','60','Yes',NULL,'Yes',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (899,'TB_NivelAccesoOpcionesMenu','IdOpcionMenu','IdOpcionMenu','INTEGER','5','Yes',NULL,'Yes',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (900,'TB_NivelAccesoOpcionesMenu','flAcceso','flAcceso','BIT','60','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (901,'TB_Cajas','dsUsuario_Supervisor','dsUsuario_Supervisor','VARCHAR','50',NULL,NULL,NULL,0,NULL,NULL,NULL,'0',NULL,NULL,NULL),
  (902,'TB_Comprobantes','dsUsuario_Supervisor','dsUsuario_Supervisor','VARCHAR','50',NULL,NULL,NULL,0,NULL,NULL,NULL,'0',NULL,NULL,NULL),
  (903,'TB_Recibos','dsUsuario_Supervisor','dsUsuario_Supervisor','VARCHAR','50',NULL,NULL,NULL,0,NULL,NULL,NULL,'0',NULL,NULL,NULL),
  (904,'TB_MovimientosContables','dsUsuario_Supervisor','dsUsuario_Supervisor','VARCHAR','50',NULL,NULL,NULL,0,NULL,NULL,NULL,'0',NULL,NULL,NULL),
  (905,'sco_Puestos','nrPuesto_param','nrPuesto_param','INTEGER','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (906,'sco_Puestos','dsPuesto_param','dsPuesto_param','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (907,'SP_PrepararReimpresiondeComprobante','p_tpLetra','p_tpLetra','VARCHAR','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (908,'SP_PrepararReimpresiondeComprobante','p_tpComprobante','p_tpComprobante','VARCHAR','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (909,'SP_PrepararReimpresiondeComprobante','p_nrComprobante','p_nrComprobante','INTEGER','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (910,'SP_PrepararReimpresiondeComprobante','p_nrTalonario','p_nrTalonario','INTEGER','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (911,'SP_ObtenerResumenCajaPuesto','p_nrCaja','p_nrCaja','INTEGER','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (912,'SP_ObtenerMaxnrCaja_v1_3','p_nrPuesto','p_nrPuesto','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (913,'rpt_cierredecaja_v1','nrCaja_param','nrCaja_param','INTEGER','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (914,'SP_ObtenerMaxnrCaja_v1_3','@nrPuesto','@nrPuesto','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (915,'sco_Puestos','@nrPuesto_param','@nrPuesto_param','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (916,'SP_PrepararReimpresiondeComprobante','@nrTalonario','@nrTalonario','VARCHAR','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (917,'SP_PrepararReimpresiondeComprobante','@nrComprobante','@nrComprobante','VARCHAR','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (918,'SP_PrepararReimpresiondeComprobante','@tpComprobante','@tpComprobante','VARCHAR','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (919,'SP_PrepararReimpresiondeComprobante','@tpLetra','@tpLetra','VARCHAR','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (920,'SP_ObtenerResumenCajaPuesto','@nrCaja','@nrCaja','INTEGER','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (922,'rpt_cierredecaja_v1','@nrCaja_param','@nrCaja_param','INTEGER','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (923,'tb_cajas','flSincronizado','flSincronizado','BIT','1','No','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),
  (924,'tb_cupones','flSincronizado','flSincronizado','BIT','1','No','No','No',NULL,'0','0','0','0','',NULL,NULL),
  (926,'tb_sincronizacion','flUnidadTransaccional','flUnidadTransaccional','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (927,'tb_sincronizacion','flSincronizar','flSincronizar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (928,'tb_sincronizacion','nmTabla','nmTabla','VARCHAR','50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (929,'tb_sincronizacion','dtUltSincrozacion','dtUltSincrozacion','VARCHAR','20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (930,'tb_sincronizacion','nrOrdenTransaccional','nrOrdenTransaccional','INTEGER','5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (931,'tb_sincronizacion','tpSincronizacion','tpSincronizacion','VARCHAR','20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1030,'TB_Clientes','dtActualizacion','dtActualizacion','DATETIME','16','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1031,'tb_comisiones','dtActualizacion','dtActualizacion','DATETIME','16','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1032,'tb_productos','dtActualizacion','dtActualizacion','DATETIME','16','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1033,'TB_Puestos','dtActualizacion','dtActualizacion','DATETIME','16','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1034,'tb_usuarios','dtActualizacion','dtActualizacion','DATETIME','16','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1035,'tb_proveedores','dtActualizacion','dtActualizacion','DATETIME','16','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1036,'tb_usuarios','dsPassword_OLD','dsPassword_OLD','VARCHAR','8','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1038,'tb_conceptos','dtActualizacion','dtActualizacion','DATETIME','16','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1039,'tb_sincronizacion','id','id','INTEGER','6','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1040,'tb_cajas','dtActualizacion','dtActualizacion','DATETIME','16','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1041,'tb_comprobantes','dtActualizacion','dtActualizacion','DATETIME','16','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1042,'tb_comprobantesDetalle','dtActualizacion','dtActualizacion','DATETIME','16','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1043,'TB_Cupones','dtActualizacion','dtActualizacion','DATETIME','16','No',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1045,'TB_Comprobantes','dsOpcional4','dsOpcional4','VARCHAR','40','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1046,'tb_clientes','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1047,'tb_comisiones','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1048,'tb_conceptos','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1049,'tb_productos','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1050,'tb_conceptos','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1051,'tb_puestos','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1052,'tb_usuarios','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1053,'tb_comprobantes','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1054,'tb_comprobantesDetalle','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1055,'tb_cupones','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1056,'tb_sincronizacion','flFiltrarporPuesto     ','flFiltrarporPuesto     ','BIT','1','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1057,'tb_proveedores','flEliminar','flEliminar','BIT','1','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1058,'TB_ComprobantesDetalle','nrPuesto','nrPuesto','INTEGER','6','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1059,'VWCajasPuestosdesdelosPuetos','flSincronizado','flSincronizado','BIT','1','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1060,'VWCajasPuestosdesdelosPuetos','dtActualizacion','dtActualizacion','DATETIME','16','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1061,'tb_comprobantesDetalle','nrCaja','nrCaja','NUMERIC','18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1062,'SP_ObtenerMaxnrCupon_v1_3','@nrPuesto','@nrPuesto','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1063,'SP_ObtenerMaxnrCupon_v1_3','p_nrPuesto','p_nrPuesto','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1064,'tb_logs','dsLog','dsLog','VARCHAR','500',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1065,'tb_logs','dtLog','dtLog','DATETIME','16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1066,'tb_logs','idTabla','idTabla','INTEGER','18','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

COMMIT;

#
# Structure for the `rpt_resumen_caja_puesto` table : 
#

DROP TABLE IF EXISTS `rpt_resumen_caja_puesto`;

CREATE TABLE `rpt_resumen_caja_puesto` (
  `nrCaja` decimal(18,0) NOT NULL,
  `nrPuesto` smallint(6) default NULL,
  `dsUsuario` varchar(50) default NULL,
  `dtApertura` datetime default NULL,
  `dtCierre` datetime default NULL,
  `hrApertura` varbinary(13) default NULL,
  `hrCierre` varchar(6) default NULL,
  `flEstado` bit(1) NOT NULL default '\0',
  `flCajaAdm` bit(1) NOT NULL default '\0',
  `vlSaldoInicialPesos` double default NULL,
  `vlSaldoInicialEuros` double default NULL,
  `vlDiaDolar` double default NULL,
  `vlDiaEuro` double default NULL,
  `vlSaldoFinalPesos` double default NULL,
  `vlSaldoInicialDolares` double default NULL,
  `vlSaldoFinalDolares` double default NULL,
  `vlSaldoFinalEuros` double default NULL,
  `vlSaldoFinalRealPesos` double default NULL,
  `vlSaldoFinalRealEuros` double default NULL,
  `vlSaldoFinalRealDolares` double default NULL,
  `vlCierrePesos` double default NULL,
  `vlCierreDolares` double default NULL,
  `vlCierreEuros` double default NULL,
  `vlTotalSaldoFinalReal` double default NULL,
  `vlTotalSaldoFinal` double default NULL,
  `vlTotalSaldoInicial` double default NULL,
  `vlTotalSaldoCierre` double default NULL,
  `dsDiferenciaDeCierre` varchar(50) default NULL,
  `vlDiferenciaDeCierre` double default NULL,
  `dsObservacion` varchar(100) default NULL,
  `dtObservacion` datetime default NULL,
  `Cantidad_Viajes` decimal(9,2) default NULL,
  `Cantidad_Contado` decimal(9,2) default NULL,
  `Cantidad_cta_cte` decimal(9,2) default NULL,
  `Cantidad_Retorno` decimal(9,2) default NULL,
  `Cantidad_Anuladas` decimal(9,2) default NULL,
  `Cantidad_Cobro_en_Destino` decimal(9,2) default NULL,
  `Nombre_Cajera` varchar(81) NOT NULL default '',
  `Descripcion_Puesto` varchar(50) default NULL,
  `nro_factura_inicial` varchar(12) default NULL,
  `nro_factura_final` varchar(12) default NULL,
  `nro_Recibo_inicial` varchar(12) default NULL,
  `nro_Recibo_final` varchar(12) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for the `rpt_resumen_caja_puesto` table  (LIMIT 0,500)
#

INSERT INTO `rpt_resumen_caja_puesto` (`nrCaja`, `nrPuesto`, `dsUsuario`, `dtApertura`, `dtCierre`, `hrApertura`, `hrCierre`, `flEstado`, `flCajaAdm`, `vlSaldoInicialPesos`, `vlSaldoInicialEuros`, `vlDiaDolar`, `vlDiaEuro`, `vlSaldoFinalPesos`, `vlSaldoInicialDolares`, `vlSaldoFinalDolares`, `vlSaldoFinalEuros`, `vlSaldoFinalRealPesos`, `vlSaldoFinalRealEuros`, `vlSaldoFinalRealDolares`, `vlCierrePesos`, `vlCierreDolares`, `vlCierreEuros`, `vlTotalSaldoFinalReal`, `vlTotalSaldoFinal`, `vlTotalSaldoInicial`, `vlTotalSaldoCierre`, `dsDiferenciaDeCierre`, `vlDiferenciaDeCierre`, `dsObservacion`, `dtObservacion`, `Cantidad_Viajes`, `Cantidad_Contado`, `Cantidad_cta_cte`, `Cantidad_Retorno`, `Cantidad_Anuladas`, `Cantidad_Cobro_en_Destino`, `Nombre_Cajera`, `Descripcion_Puesto`, `nro_factura_inicial`, `nro_factura_final`, `nro_Recibo_inicial`, `nro_Recibo_final`) VALUES 
  (1000001723,1,'VSAC','2008-01-18 22:35:37','2008-01-25 17:50:46','22:35:37','17:50',True,False,125,10,3,3.6,545,40,40,10,0,0,0,-125,-40,-10,0,701,NULL,-281,'Faltante de dinero',701,NULL,'2008-01-25 17:50:46',9,7,1,1,2,0,'VIRGINIA SAC','Internacional','32419.00','32420.00','27.00','28.00');

COMMIT;

#
# Structure for the `tb_usuarios` table : 
#

DROP TABLE IF EXISTS `tb_usuarios`;

CREATE TABLE `tb_usuarios` (
  `dsUsuario` varchar(50) NOT NULL,
  `tpAcceso` varchar(50) default NULL,
  `nmNombre` varchar(30) default NULL,
  `nmApellido` varchar(50) default NULL,
  `dsPassword` varchar(8) default NULL,
  `dsDomicilio` varchar(30) default NULL,
  `nmLocalidad` varchar(30) default NULL,
  `cdPostal` varchar(10) default NULL,
  `nrTelefono` varchar(30) default NULL,
  `dsEmail` varchar(60) default NULL,
  `dsPassword_OLD` varchar(8) default NULL,
  `nrCUIL` double default NULL,
  `tpNivelJerarquico` varchar(50) default NULL,
  `flBloqueado` bit(1) default NULL,
  `dtActualizacion` datetime default NULL,
  `flEliminar` bit(1) default '\0',
  PRIMARY KEY  (`dsUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for the `tb_usuarios` table  (LIMIT 0,500)
#

INSERT INTO `tb_usuarios` (`dsUsuario`, `tpAcceso`, `nmNombre`, `nmApellido`, `dsPassword`, `dsDomicilio`, `nmLocalidad`, `cdPostal`, `nrTelefono`, `dsEmail`, `dsPassword_OLD`, `nrCUIL`, `tpNivelJerarquico`, `flBloqueado`, `dtActualizacion`, `flEliminar`) VALUES 
  ('ADRIAN','Contabilidad','ADRIAN','Spagliardi','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',True,'2008-02-07 23:06:39',False),
  ('ADRIANG','Administración',NULL,NULL,'prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('ALEJANDRA','Puestos','ALEJANDRA','CONTARINA','prueba',NULL,NULL,NULL,NULL,NULL,NULL,254755333,'Empleado',True,'2008-02-07 23:06:39',False),
  ('ANDREA','Puestos','ANDREA','CORBIJN','prueba','GARZON 620','MONTE GRANDE','1842','4290-1742',NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('BFAZZALARI','Puestos','BARBARA','FAZZALARI','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('CAROLINA','Puestos',NULL,NULL,'prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('CAYALA','Puestos','CANDELARIA','AYALA','prueba',NULL,NULL,NULL,'4290-0841',NULL,NULL,NULL,'Empleado',True,'2008-02-07 23:06:39',False),
  ('CECILIA','Puestos','CECILIA','VERGES','prueba','EL FEDERAL 1580','CIUDAD EVITA','1778','44873164',NULL,NULL,24299403,'Empleado',False,'2008-02-07 23:06:39',False),
  ('CMENDOZA','Puestos','CLAUDIA','MENDOZA','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('CRISTIAN','SISTEMAS','RODRIGUEZ','CRISTIAN','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('CSOSA','Puestos','CLAUDIA','SOSA','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('EDUARDO','Contabilidad','EDUARDO','BRITOS','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Supervisor',False,'2008-02-07 23:06:39',False),
  ('EUGENIA','Administración',NULL,NULL,'prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('EULISES','Administración','EULISES','QUIDEL','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('EZEPALAZZI','Puestos','EZEQUIEL','PALAZZINI','prueba','CANALE 210','TRISTAN SUAREZ',NULL,'4234-9219',NULL,NULL,33404737,'Empleado',True,'2008-02-07 23:06:39',False),
  ('FABI','Contabilidad','FABIANA','RICCIARDI','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('FABIANA','Administración','FABIANA','RICCIARDI','prueba','ANA MARIA JANER 1944',NULL,NULL,NULL,NULL,NULL,32232151,'Empleado',False,'2008-02-07 23:06:39',False),
  ('FFERNANDEZ','Puestos','FLORENCIA','FERNANDEZ','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',True,'2008-02-07 23:06:39',False),
  ('FRICCIARDI','Puestos','FABIANA','RICCIARDI','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('GABY','Puestos','GABRIELA','LEDESMA','prueba','NEUQUEN 39','MONTE GRANDE',NULL,NULL,NULL,NULL,30237552,'Empleado',False,'2008-02-07 23:06:39',False),
  ('GMARCEL','Puestos','GISELLE NADIA','MARCEL','prueba','HUMAHUACA 849','ALDO BONZI','1770',NULL,NULL,NULL,27336602349,'Empleado',False,'2008-02-07 23:06:39',False),
  ('GPEREZ','Puestos','GISELA','PEREZ','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',True,'2008-02-07 23:06:39',False),
  ('INTER','Puestos','INTER','INTER','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('JESICA','Puestos','JESICA','ALOI','prueba','PASAJE 3 CASA 52','BARRIO UNO',NULL,NULL,NULL,NULL,24420891,'Empleado',True,'2008-02-07 23:06:39',False),
  ('JLUGO','Puestos','JESICA','LUGO','prueba',NULL,NULL,NULL,NULL,NULL,NULL,27309609021,'Empleado',False,'2008-02-07 23:06:39',False),
  ('JORGEM','Contabilidad','JORGE','MIRAMONTES','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('JOSE','Contabilidad','JOSE','CAÑOTO','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Supervisor',False,'2008-02-07 23:06:39',False),
  ('KAREN','Puestos','KAREN','MENDEZ','prueba','TENIENTE RUIZ 1899','LUIS GUILLON',NULL,'429',NULL,NULL,NULL,'Empleado',True,'2008-02-07 23:06:39',False),
  ('LEO','Puestos','LEONARDO','RODRIGUEZ','prueba',NULL,NULL,NULL,NULL,NULL,NULL,20244961917,'Empleado',False,'2008-02-07 23:06:39',False),
  ('LLOPEZ','Puestos','LORENA','LOPEZ','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('LUCAS','Puestos','LUCAS','SCIOLLA','prueba','CORDOBA 183',NULL,NULL,NULL,NULL,NULL,35186144,'Empleado',False,'2008-02-07 23:06:39',False),
  ('MAR','Contabilidad','MARIA','GODOY','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('MARCELO','Contabilidad','MARCELO','LAFRANCONI','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Supervisor',False,'2008-02-07 23:06:39',False),
  ('MARIA','Administración','MARIA','GODOY','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('MBONNIN','Puestos','MARINA','BONNIN','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',True,'2008-02-07 23:06:39',False),
  ('MCGARRY','Puestos','YESICA','MC GARRY','prueba',NULL,'VILLA CELINA','1772',NULL,NULL,NULL,27327577951,'Empleado',False,'2008-02-07 23:06:39',False),
  ('MELISA','Puestos','MELISA','VARRONE','prueba','PIEDRABUENA 5388','LUGANO',NULL,'1560463003',NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('MGODOY','Puestos','MARIA','GODOY','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('MLLANOS','Puestos','MARTA','LLANOS','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('MPARODI','Puestos','MARTA','PARODI','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('MTEDESCO','Puestos','MARIANA','TEDESCO','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('MVARRONE','Administración','MELISA','VARRONE','prueba','PIEDRABUENA 5388','CAP.FED.','1439','4605-1982',NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('NIGLESIAS','Puestos','NORMA BEATRIZ','IGLESIAS','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('NORMA','Puestos','NORMA','LOZANO','prueba','ITUZAINGO 529','EZEIZA',NULL,NULL,NULL,NULL,11917656,'Empleado',False,'2008-02-07 23:06:39',False),
  ('Operador1','Puestos','Operador1','Operador1','prueba','DON BOSCO 3755 8 D','CAPITAL FEDERAL','1206AAA','4834-433434',NULL,NULL,0,'Empleado',False,'2008-02-07 23:06:39',False),
  ('OPERADOR2','Puestos','Operador1','Operador1','prueba','DON BOSCO 3755 8 D','CAPITAL FEDERAL','1206AAA','4834-433434',NULL,NULL,0,'Empleado',False,'2008-02-07 23:06:39',False),
  ('PABLO','Puestos','PABLO','ALONSO','prueba','MARIANO ALEGRE 812','MONTE GRANDE','1842','4290-8489',NULL,NULL,-30136216,'Empleado',True,'2008-02-07 23:06:39',False),
  ('PAMELA','Puestos','PAMELA','ACOSTA','prueba','12 DE OCTUBRE 2980','MONTE GRANDE',NULL,NULL,NULL,NULL,32872197,'Empleado',False,'2008-02-07 23:06:39',False),
  ('SABRINA','Puestos','SABRINA','FERNANDEZ','prueba','AZCUENAGA 229','TURDERA',NULL,NULL,NULL,NULL,32868615,'Empleado',False,'2008-02-07 23:06:39',False),
  ('SDIANO','Puestos','SANDRA','DIANO','prueba',NULL,NULL,NULL,'4442-1753',NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('SERGIO','SISTEMAS','SERGIO','GAROBBIO','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('SGAR','Contabilidad','SER','GAR','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('SSOLEDAD','Puestos','SABRINA','CORRALES','prueba','BELISARIO ROLDAN 247','EZEIZA','1804','44800058',NULL,NULL,27324806208,'Empleado',True,'2008-02-07 23:06:39',False),
  ('SSUHR','Puestos','SOLEDAD','SUHR','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('Supervisor','Administración','Supervisor','Supervisor','prueba','DINKELDEIN 957','RIO CUARTO','5800','058661231',NULL,NULL,23333232323,'Empleado',False,'2008-02-07 23:06:39',False),
  ('TATO','Contabilidad','DAGOSTINO','VICTOR','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Supervisor',False,'2008-02-07 23:06:39',False),
  ('TOPO','Contabilidad','OMAR','MILIANTI','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Supervisor',False,'2008-02-07 23:06:39',False),
  ('USRPARAM','Parametrización','Usuario','Parametrización','prueba',NULL,NULL,NULL,NULL,NULL,NULL,0,'Supervisor',False,'2008-02-07 23:06:39',False),
  ('VERONICAB','Administración','VERONICA','BEREZOWSKI','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',True,'2008-02-07 23:06:39',False),
  ('VSAC','Puestos','VIRGINIA','SAC','prueba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('XIMENA','Puestos','XIMENA','DELGADO','prueba','TEODORO FELS 945','EZEIZA','1804','42955744',NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False),
  ('YEMINA','Puestos','YEMINA','CARRIZO','prueba','DIEGO LAURE 686',NULL,'1804',NULL,NULL,NULL,30826624,'Empleado',True,'2008-02-07 23:06:39',False),
  ('YNOCHETTI','Puestos','YANINA','NOCHETI','prueba',NULL,NULL,NULL,'4454-3777',NULL,NULL,NULL,'Empleado',False,'2008-02-07 23:06:39',False);

COMMIT;

#
# Structure for the `tb_cajas` table : 
#

DROP TABLE IF EXISTS `tb_cajas`;

CREATE TABLE `tb_cajas` (
  `nrCaja` decimal(18,0) NOT NULL,
  `nrPuesto` smallint(6) default NULL,
  `dsUsuario` varchar(50) default NULL,
  `dtApertura` datetime default NULL,
  `dtCierre` datetime default NULL,
  `hrApertura` varchar(6) default NULL,
  `hrCierre` varchar(6) default NULL,
  `flEstado` bit(1) NOT NULL default '\0',
  `flCajaAdm` bit(1) NOT NULL default '\0',
  `vlSaldoInicialPesos` double default NULL,
  `vlSaldoInicialDolares` double default NULL,
  `vlSaldoInicialEuros` double default NULL,
  `vlDiaDolar` double default NULL,
  `vlDiaEuro` double default NULL,
  `vlSaldoFinalPesos` double default NULL,
  `vlSaldoFinalDolares` double default NULL,
  `vlSaldoFinalEuros` double default NULL,
  `vlSaldoFinalRealPesos` double default NULL,
  `vlSaldoFinalRealEuros` double default NULL,
  `vlSaldoFinalRealDolares` double default NULL,
  `vlCierrePesos` double default NULL,
  `vlCierreDolares` double default NULL,
  `vlCierreEuros` double default NULL,
  `vlTotalSaldoFinalReal` double default NULL,
  `vlTotalSaldoFinal` double default NULL,
  `vlTotalSaldoInicial` double default NULL,
  `vlTotalSaldoCierre` double default NULL,
  `dsDiferenciaDeCierre` varchar(50) default NULL,
  `vlDiferenciaDeCierre` double default NULL,
  `dsObservacion` varchar(100) default NULL,
  `dtObservacion` datetime default NULL,
  `dsUsuario_Supervisor` varchar(50) default NULL,
  `flSincronizado` bit(1) default '\0',
  `dtActualizacion` datetime default NULL,
  PRIMARY KEY  (`nrCaja`),
  KEY `dsUsuario` (`dsUsuario`),
  CONSTRAINT `tb_cajas_fk` FOREIGN KEY (`dsUsuario`) REFERENCES `tb_usuarios` (`dsUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `tb_clientes` table : 
#

DROP TABLE IF EXISTS `tb_clientes`;

CREATE TABLE `tb_clientes` (
  `cdCliente` int(11) NOT NULL,
  `tpCliente` varchar(50) default NULL,
  `nmNombre` varchar(50) default NULL,
  `nmApellido` varchar(50) default NULL,
  `dsRazonSocial` varchar(100) default NULL,
  `dsDomicilio` varchar(30) default NULL,
  `cdPostal` varchar(8) default NULL,
  `nmLocalidad` varchar(30) default NULL,
  `nrTel` varchar(30) default NULL,
  `nrFax` varchar(30) default NULL,
  `dsCargo` varchar(30) default NULL,
  `dsEmail` varchar(60) default NULL,
  `dtAlta` datetime default NULL,
  `dtBaja` datetime default NULL,
  `tpDoc` varchar(4) default NULL,
  `nrDoc` varchar(20) default NULL,
  `tpIIBB` varchar(1) default NULL,
  `nrIIBB` decimal(18,0) default NULL,
  `dsLetraII` varchar(3) default NULL,
  `vlOrdenanza3337` double default NULL,
  `dtFinOrdenanza` datetime default NULL,
  `flBloqueado` bit(1) NOT NULL,
  `tpEstado` varchar(3) default NULL,
  `vlTopeCredito` double default NULL,
  `vlSaldo` double default NULL,
  `tpIVA` varchar(50) default NULL,
  `dtActualizacion` datetime default NULL,
  `flEliminar` bit(1) default '\0',
  PRIMARY KEY  (`cdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `tb_comisiones` table : 
#

DROP TABLE IF EXISTS `tb_comisiones`;

CREATE TABLE `tb_comisiones` (
  `cdComision` int(11) NOT NULL,
  `dsComision` varchar(50) NOT NULL,
  `vlMontoMinimo` double NOT NULL,
  `vlMontoMaximo` double NOT NULL,
  `vlComision` double NOT NULL,
  `vlComisionEmpleados` double NOT NULL,
  `dsUsuario` varchar(50) NOT NULL,
  `dtActualizacion` datetime default NULL,
  `flEliminar` bit(1) default '\0',
  PRIMARY KEY  (`cdComision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `tb_comprobantes` table : 
#

DROP TABLE IF EXISTS `tb_comprobantes`;

CREATE TABLE `tb_comprobantes` (
  `nrTalonario` char(4) NOT NULL,
  `nrComprobante` char(12) NOT NULL,
  `tpComprobante` varchar(2) NOT NULL,
  `tpLetra` varchar(1) NOT NULL,
  `dtComprobante` datetime default NULL,
  `cdCliente` int(11) default NULL,
  `cdCondVenta` varchar(20) default NULL,
  `tpComision` varchar(20) default NULL,
  `tpMoneda` varchar(10) default NULL,
  `tpIVA` tinytext,
  `vlTotalGeneral` double default NULL,
  `vlPagoPesos` double default NULL,
  `vlPagoEuros` double default NULL,
  `vlPagoDolares` double default NULL,
  `dsLeyenda` tinytext,
  `flManual` char(1) default 'N',
  `dtInsercion` datetime default NULL,
  `dsUsuario` varchar(50) default NULL,
  `dsUsuario_Supervisor` varchar(50) default NULL,
  `nrCaja` decimal(18,0) NOT NULL,
  `dtCaja` datetime default NULL,
  `nrPuesto` smallint(6) default NULL,
  `dsDomicilio` varchar(60) default NULL,
  `nrLicencia` varchar(3) default NULL,
  `nrBultos` smallint(6) default NULL,
  `nrPasajeros` smallint(6) default NULL,
  `nrDoc` char(20) default NULL,
  `dsRazonSocial` varchar(100) default NULL,
  `nmNombre` varchar(50) default NULL,
  `nmApellido` varchar(50) default NULL,
  `nmLicenciatario` varchar(60) default NULL,
  `cdPostal` varchar(10) default NULL,
  `nmLocalidad` varchar(50) default NULL,
  `cdCodBar` varchar(20) default NULL,
  `dsEmail` varchar(70) default NULL,
  `nrTel` varchar(50) default NULL,
  `nrCAI` varchar(20) default NULL,
  `dtVencimiento` datetime default NULL,
  `vlDiaDolar` double default NULL,
  `vlDiaEuro` double default NULL,
  `dsOpcional1` varchar(50) default NULL,
  `dsOpcional2` varchar(100) default NULL,
  `dsOpcional3` varchar(40) default NULL,
  `dsOpcional4` int(11) default NULL,
  `flAnulado` bit(1) NOT NULL default '\0',
  `dtAnulado` datetime default NULL,
  `nmEmpleado` varchar(60) default NULL,
  `IdReciboCtaCte` decimal(18,0) default NULL,
  `flCargaErronea` bit(1) default '\0',
  `flSincronizado` bit(1) default NULL,
  `dtSincronizacion` datetime default NULL,
  `flEliminar` bit(1) default '\0',
  `dtActualizacion` datetime default NULL,
  PRIMARY KEY  (`nrTalonario`,`nrComprobante`,`tpComprobante`,`tpLetra`),
  KEY `dsUsuario` (`dsUsuario`),
  KEY `nrCaja` (`nrCaja`),
  CONSTRAINT `tb_comprobantes_fk` FOREIGN KEY (`dsUsuario`) REFERENCES `tb_usuarios` (`dsUsuario`),
  CONSTRAINT `tb_comprobantes_fk1` FOREIGN KEY (`nrCaja`) REFERENCES `tb_cajas` (`nrCaja`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `tb_comprobantes_imprime` table : 
#

DROP TABLE IF EXISTS `tb_comprobantes_imprime`;

CREATE TABLE `tb_comprobantes_imprime` (
  `nrTalonario` char(4) NOT NULL,
  `nrComprobante` char(12) NOT NULL,
  `tpComprobante` varchar(2) NOT NULL,
  `tpLetra` varchar(1) NOT NULL,
  `dtComprobante` datetime default NULL,
  `cdCliente` int(11) default NULL,
  `cdCondVenta` varchar(20) default NULL,
  `tpComision` varchar(20) default NULL,
  `tpMoneda` varchar(10) default NULL,
  `tpIVA` tinytext,
  `vlTotalGeneral` double default NULL,
  `vlPagoPesos` double default NULL,
  `vlPagoEuros` double default NULL,
  `vlPagoDolares` double default NULL,
  `dsLeyenda` tinytext,
  `flManual` char(1) default NULL,
  `dtInsercion` datetime default NULL,
  `flSincronizado` bit(1) NOT NULL default '\0',
  `dsUsuario` varchar(50) default NULL,
  `nrCaja` decimal(18,0) NOT NULL,
  `dtCaja` datetime default NULL,
  `nrPuesto` smallint(6) default NULL,
  `dsDomicilio` varchar(60) default NULL,
  `nrLicencia` varchar(3) default NULL,
  `nrBultos` smallint(6) default NULL,
  `nrPasajeros` smallint(6) default NULL,
  `nrDoc` char(20) default NULL,
  `dsRazonSocial` varchar(100) default NULL,
  `nmNombre` varchar(50) default NULL,
  `nmApellido` varchar(50) default NULL,
  `nmLicenciatario` varchar(60) default NULL,
  `nrTelLicenciatario` varchar(30) default NULL,
  `cdPostal` varchar(10) default NULL,
  `nmLocalidad` varchar(50) default NULL,
  `cdCodBar` varchar(20) default NULL,
  `dsEmail` varchar(70) default NULL,
  `nrTel` varchar(50) default NULL,
  `nrCAI` varchar(20) default NULL,
  `dtVencimiento` datetime default NULL,
  `vlDiaDolar` double default NULL,
  `vlDiaEuro` double default NULL,
  `dsOpcional1` varchar(50) default NULL,
  `dsOpcional2` varchar(100) default NULL,
  `dsOpcional3` varchar(40) default NULL,
  `dsOpcional4` int(11) default NULL,
  `flAnulado` bit(1) NOT NULL default '\0',
  `dtAnulado` datetime default NULL,
  `nmEmpleado` varchar(60) default NULL,
  PRIMARY KEY  (`nrTalonario`,`nrComprobante`,`tpComprobante`,`tpLetra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for the `tb_comprobantes_imprime` table  (LIMIT 0,500)
#

INSERT INTO `tb_comprobantes_imprime` (`nrTalonario`, `nrComprobante`, `tpComprobante`, `tpLetra`, `dtComprobante`, `cdCliente`, `cdCondVenta`, `tpComision`, `tpMoneda`, `tpIVA`, `vlTotalGeneral`, `vlPagoPesos`, `vlPagoEuros`, `vlPagoDolares`, `dsLeyenda`, `flManual`, `dtInsercion`, `flSincronizado`, `dsUsuario`, `nrCaja`, `dtCaja`, `nrPuesto`, `dsDomicilio`, `nrLicencia`, `nrBultos`, `nrPasajeros`, `nrDoc`, `dsRazonSocial`, `nmNombre`, `nmApellido`, `nmLicenciatario`, `nrTelLicenciatario`, `cdPostal`, `nmLocalidad`, `cdCodBar`, `dsEmail`, `nrTel`, `nrCAI`, `dtVencimiento`, `vlDiaDolar`, `vlDiaEuro`, `dsOpcional1`, `dsOpcional2`, `dsOpcional3`, `dsOpcional4`, `flAnulado`, `dtAnulado`, `nmEmpleado`) VALUES 
  ('0001','00107557','B','B','2008-01-29',1,'Contado','A Clientes',NULL,'CF',68,68,0,0,NULL,'N','2008-01-29 21:34:36',False,'VSAC',9000001315,'2008-01-29 21:34:36',1,NULL,'124',NULL,NULL,NULL,'Consumidor Final',NULL,NULL,'Giliberti PASCUAL','15-4090-8736',NULL,NULL,'000100107557124',NULL,NULL,'062141575','2005-01-17',3,4,'21:34','CENTRO - CAPITAL FEDERAL CON PEAJES  (1 DESTINO)','3070824991901000106214157517012005',NULL,False,NULL,'VIRGINIA SAC');

COMMIT;

#
# Structure for the `tb_comprobantes_resumencajapuesto` table : 
#

DROP TABLE IF EXISTS `tb_comprobantes_resumencajapuesto`;

CREATE TABLE `tb_comprobantes_resumencajapuesto` (
  `nrTalonario` char(4) NOT NULL,
  `nrComprobante` char(12) NOT NULL,
  `tpComprobante` varchar(2) NOT NULL,
  `tpLetra` varchar(1) NOT NULL,
  `dtComprobante` datetime default NULL,
  `cdCliente` int(11) default NULL,
  `cdCondVenta` varchar(20) default NULL,
  `tpComision` varchar(20) default NULL,
  `tpMoneda` varchar(10) default NULL,
  `tpIVA` tinytext,
  `vlTotalGeneral` double default NULL,
  `vlPagoPesos` double default NULL,
  `vlPagoEuros` double default NULL,
  `vlPagoDolares` double default NULL,
  `dsLeyenda` tinytext,
  `flManual` char(1) default NULL,
  `dtInsercion` datetime default NULL,
  `flSincronizado` bit(1) NOT NULL default '\0',
  `dsUsuario` varchar(50) default NULL,
  `nrCaja` decimal(18,0) NOT NULL,
  `dtCaja` datetime default NULL,
  `nrPuesto` smallint(6) default NULL,
  `dsDomicilio` varchar(60) default NULL,
  `nrLicencia` varchar(3) default NULL,
  `nrBultos` smallint(6) default NULL,
  `nrPasajeros` smallint(6) default NULL,
  `nrDoc` char(20) default NULL,
  `dsRazonSocial` varchar(100) default NULL,
  `nmNombre` varchar(50) default NULL,
  `nmApellido` varchar(50) default NULL,
  `nmLicenciatario` varchar(60) default NULL,
  `cdPostal` varchar(10) default NULL,
  `nmLocalidad` varchar(50) default NULL,
  `cdCodBar` varchar(20) default NULL,
  `dsEmail` varchar(70) default NULL,
  `nrTel` varchar(50) default NULL,
  `nrCAI` varchar(20) default NULL,
  `dtVencimiento` datetime default NULL,
  `vlDiaDolar` double default NULL,
  `vlDiaEuro` double default NULL,
  `dsOpcional1` varchar(50) default NULL,
  `dsOpcional2` varchar(100) default NULL,
  `dsOpcional3` varchar(40) default NULL,
  `dsOpcional4` int(11) default NULL,
  `flAnulado` bit(1) NOT NULL default '\0',
  `dtAnulado` datetime default NULL,
  `nmEmpleado` varchar(60) default NULL,
  PRIMARY KEY  (`nrTalonario`,`nrComprobante`,`tpComprobante`,`tpLetra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for the `tb_comprobantes_resumencajapuesto` table  (LIMIT 0,500)
#

INSERT INTO `tb_comprobantes_resumencajapuesto` (`nrTalonario`, `nrComprobante`, `tpComprobante`, `tpLetra`, `dtComprobante`, `cdCliente`, `cdCondVenta`, `tpComision`, `tpMoneda`, `tpIVA`, `vlTotalGeneral`, `vlPagoPesos`, `vlPagoEuros`, `vlPagoDolares`, `dsLeyenda`, `flManual`, `dtInsercion`, `flSincronizado`, `dsUsuario`, `nrCaja`, `dtCaja`, `nrPuesto`, `dsDomicilio`, `nrLicencia`, `nrBultos`, `nrPasajeros`, `nrDoc`, `dsRazonSocial`, `nmNombre`, `nmApellido`, `nmLicenciatario`, `cdPostal`, `nmLocalidad`, `cdCodBar`, `dsEmail`, `nrTel`, `nrCAI`, `dtVencimiento`, `vlDiaDolar`, `vlDiaEuro`, `dsOpcional1`, `dsOpcional2`, `dsOpcional3`, `dsOpcional4`, `flAnulado`, `dtAnulado`, `nmEmpleado`) VALUES 
  ('0001','00107553','B','B','2008-01-10',1,'Contado','A Clientes',NULL,'CF',65,65,0,0,NULL,NULL,'2008-01-11 00:02:00',False,'VSAC',1000000003,'2008-01-10 23:44:45',1,NULL,'124',NULL,NULL,NULL,'Consumidor Final',NULL,NULL,'Giliberti PASCUAL',NULL,NULL,'000100107553124',NULL,NULL,'062141575','2005-01-17',3,4,'23:44','OLIMPO - LOMAS DE ZAMORA  (1 DESTINO)','3070824991901000106214157517012005',NULL,True,'2008-01-10 23:48:41','VIRGINIA SAC'),
  ('0001','00107554','B','B','2008-01-11',1,'Contado','A Clientes',NULL,'CF',65,65,0,0,NULL,NULL,'2008-01-11 00:02:00',False,'VSAC',1000000003,'2008-01-11 00:00:32',1,NULL,'124',NULL,NULL,NULL,'Consumidor Final',NULL,NULL,'Giliberti PASCUAL',NULL,NULL,'000100107554124',NULL,NULL,'062141575','2005-01-17',3,4,'00:00','OLIMPO - LOMAS DE ZAMORA  (1 DESTINO)','3070824991901000106214157517012005',NULL,True,'2008-01-11 00:01:43','VIRGINIA SAC');

COMMIT;

#
# Structure for the `tb_comprobantesdetalle` table : 
#

DROP TABLE IF EXISTS `tb_comprobantesdetalle`;

CREATE TABLE `tb_comprobantesdetalle` (
  `nrTalonario` char(4) NOT NULL,
  `nrComprobante` char(12) NOT NULL,
  `tpComprobante` varchar(2) NOT NULL,
  `tpLetra` varchar(1) NOT NULL,
  `nrItem` smallint(6) NOT NULL,
  `cdProducto` int(11) default NULL,
  `dsProducto` varchar(100) default NULL,
  `tpOperacion` varchar(50) default NULL,
  `qtCantidad` smallint(6) default NULL,
  `vlPorcentaje` double default NULL,
  `vlPrecioPeaje` double default NULL,
  `vlPrecioViaje` double default NULL,
  `vlTotalItem` double default NULL,
  `dtInsercion` datetime default NULL,
  `vlKilometros` double default NULL,
  `flSincronizado` bit(1) default '\0',
  `dtActualizacion` datetime default NULL,
  `flEliminar` bit(1) default '\0',
  `nrPuesto` int(11) default NULL,
  `nrCaja` decimal(18,0) default NULL,
  PRIMARY KEY  (`nrTalonario`,`nrComprobante`,`tpComprobante`,`tpLetra`,`nrItem`),
  KEY `nrTalonario` (`nrTalonario`,`nrComprobante`,`tpComprobante`,`tpLetra`),
  CONSTRAINT `tb_comprobantesdetalle_fk` FOREIGN KEY (`nrTalonario`, `nrComprobante`, `tpComprobante`, `tpLetra`) REFERENCES `tb_comprobantes` (`nrTalonario`, `nrComprobante`, `tpComprobante`, `tpLetra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `tb_comprobantesdetalle_imprime` table : 
#

DROP TABLE IF EXISTS `tb_comprobantesdetalle_imprime`;

CREATE TABLE `tb_comprobantesdetalle_imprime` (
  `nrTalonario` char(4) NOT NULL,
  `nrComprobante` char(12) NOT NULL,
  `tpComprobante` varchar(2) NOT NULL,
  `tpLetra` varchar(1) NOT NULL,
  `nrItem` smallint(6) NOT NULL,
  `cdProducto` int(11) default NULL,
  `dsProducto` varchar(100) default NULL,
  `tpOperacion` varchar(50) default NULL,
  `qtCantidad` smallint(6) default NULL,
  `vlPorcentaje` double default NULL,
  `vlPrecioPeaje` double default NULL,
  `vlPrecioViaje` double default NULL,
  `vlTotalItem` double default NULL,
  `dtInsercion` datetime default NULL,
  `flSincronizado` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`nrTalonario`,`nrComprobante`,`tpComprobante`,`tpLetra`,`nrItem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for the `tb_comprobantesdetalle_imprime` table  (LIMIT 0,500)
#

INSERT INTO `tb_comprobantesdetalle_imprime` (`nrTalonario`, `nrComprobante`, `tpComprobante`, `tpLetra`, `nrItem`, `cdProducto`, `dsProducto`, `tpOperacion`, `qtCantidad`, `vlPorcentaje`, `vlPrecioPeaje`, `vlPrecioViaje`, `vlTotalItem`, `dtInsercion`, `flSincronizado`) VALUES 
  ('0001','00107557','B','B',1,90001,'CENTRO - CAPITAL FEDERAL CON PEAJES  (1 DESTINO)','Viaje',NULL,0,0,68,NULL,'2008-01-29',False);

COMMIT;

#
# Structure for the `tb_comprobantesdetalle_resumencajapuesto` table : 
#

DROP TABLE IF EXISTS `tb_comprobantesdetalle_resumencajapuesto`;

CREATE TABLE `tb_comprobantesdetalle_resumencajapuesto` (
  `nrTalonario` char(4) NOT NULL,
  `nrComprobante` char(12) NOT NULL,
  `tpComprobante` varchar(2) NOT NULL,
  `tpLetra` varchar(1) NOT NULL,
  `nrItem` smallint(6) NOT NULL,
  `cdProducto` int(11) default NULL,
  `dsProducto` varchar(100) default NULL,
  `tpOperacion` varchar(50) default NULL,
  `qtCantidad` smallint(6) default NULL,
  `vlPorcentaje` double default NULL,
  `vlPrecioPeaje` double default NULL,
  `vlPrecioViaje` double default NULL,
  `vlTotalItem` double default NULL,
  `dtInsercion` datetime default NULL,
  `flSincronizado` bit(1) NOT NULL default '\0',
  `nrCaja` decimal(18,0) default NULL,
  KEY `nrTalonario` (`nrTalonario`,`nrComprobante`,`tpComprobante`,`tpLetra`,`nrItem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for the `tb_comprobantesdetalle_resumencajapuesto` table  (LIMIT 0,500)
#

INSERT INTO `tb_comprobantesdetalle_resumencajapuesto` (`nrTalonario`, `nrComprobante`, `tpComprobante`, `tpLetra`, `nrItem`, `cdProducto`, `dsProducto`, `tpOperacion`, `qtCantidad`, `vlPorcentaje`, `vlPrecioPeaje`, `vlPrecioViaje`, `vlTotalItem`, `dtInsercion`, `flSincronizado`, `nrCaja`) VALUES 
  ('0001','00107553','B','B',1,200,'OLIMPO - LOMAS DE ZAMORA  (1 DESTINO)','Viaje',NULL,0,0,65,NULL,'2008-01-11 00:02:00',False,1000000003),
  ('0001','00107554','B','B',1,200,'OLIMPO - LOMAS DE ZAMORA  (1 DESTINO)','Viaje',NULL,0,0,65,NULL,'2008-01-11 00:02:00',False,1000000003);

COMMIT;

#
# Structure for the `tb_conceptos` table : 
#

DROP TABLE IF EXISTS `tb_conceptos`;

CREATE TABLE `tb_conceptos` (
  `cdConcepto` int(11) NOT NULL,
  `tpConcepto` varchar(50) default NULL,
  `dsConcepto` varchar(100) default NULL,
  `vlConcepto` double default NULL,
  `tpOperacion` varchar(50) default NULL,
  `dtActualizacion` datetime default NULL,
  `flEliminar` bit(1) default '\0',
  PRIMARY KEY  (`cdConcepto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `tb_cupones` table : 
#

DROP TABLE IF EXISTS `tb_cupones`;

CREATE TABLE `tb_cupones` (
  `nrCupon` decimal(18,0) NOT NULL,
  `cdCliente` int(11) default NULL,
  `nrPuesto` smallint(6) default NULL,
  `nrLicencia` int(11) NOT NULL,
  `nmLicenciatario` varchar(70) default NULL,
  `tpCupon` varchar(20) default NULL,
  `vlMontoCupon` double default '0',
  `vlaFavordelLicenciatario` double default '0',
  `vlafavorAdmin` double default '0',
  `vlPagoPesos` double default '0',
  `vlPagoEuros` double default '0',
  `vlPagoDolares` double default '0',
  `vlComision` double default '0',
  `nrCantidadBultos` smallint(6) default NULL,
  `nrPasajeros` smallint(6) default NULL,
  `dtCupon` datetime default NULL,
  `nrTalonarioCliente` char(4) default NULL,
  `nrComprabanteCliente` char(12) default NULL,
  `tpComprobanteCliente` varchar(2) default NULL,
  `tpLetraCliente` varchar(1) default NULL,
  `flCobradoalCliente` bit(1) NOT NULL default '\0',
  `dtCobradoalCliente` datetime default NULL,
  `nrCajaCliente` decimal(18,0) default NULL,
  `dtCajaCliente` datetime default NULL,
  `nrTalonarioProveedor` double default NULL,
  `nrComprabanteProveedor` double default NULL,
  `tpComprobanteProveedor` varchar(2) default NULL,
  `tpLetraLetraProveedor` varchar(1) default NULL,
  `flCompensado` bit(1) NOT NULL default '\0',
  `dtCompensado` datetime default NULL,
  `nrCajaLicenciatario` decimal(18,0) default NULL,
  `dtCajaLicenciatario` datetime default NULL,
  `dsUsuario` varchar(50) default NULL,
  `nrLiquidacionProveedores` smallint(6) default NULL,
  `nrLiquidacionCliente` smallint(6) default NULL,
  `cdCodBar` varchar(20) default NULL,
  `flAnulado` bit(1) NOT NULL default '\0',
  `dtAnulado` datetime default NULL,
  `IdRecibo` int(11) default NULL,
  `IdReciboCtaCte` decimal(18,0) default NULL,
  `dsObservacion` longtext,
  `dsDestino` varchar(100) default NULL,
  `dsHoraViaje` char(10) default NULL,
  `flSincronizado` bit(1) default NULL,
  `dtActualizacion` datetime default NULL,
  `flEliminar` bit(1) default '\0',
  PRIMARY KEY  (`nrCupon`),
  KEY `nrTalonarioCliente` (`nrTalonarioCliente`,`nrComprabanteCliente`,`tpComprobanteCliente`,`tpLetraCliente`),
  CONSTRAINT `tb_cupones_fk` FOREIGN KEY (`nrTalonarioCliente`, `nrComprabanteCliente`, `tpComprobanteCliente`, `tpLetraCliente`) REFERENCES `tb_comprobantes` (`nrTalonario`, `nrComprobante`, `tpComprobante`, `tpLetra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `tb_logs` table : 
#

DROP TABLE IF EXISTS `tb_logs`;

CREATE TABLE `tb_logs` (
  `idTabla` int(11) NOT NULL auto_increment,
  `dtLog` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `dsLog` varchar(500) default NULL,
  PRIMARY KEY  (`idTabla`),
  UNIQUE KEY `idTabla` (`idTabla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for the `tb_logs` table  (LIMIT 0,500)
#

INSERT INTO `tb_logs` (`idTabla`, `dtLog`, `dsLog`) VALUES 
  (2,'2008-02-07 23:23:10','[TCP/IP Sockets]No existe el servidor SQL Server o se ha denegado el acceso al mismo.'),
  (3,'2008-02-07 23:31:30','Error al replicar la tabla tb_cupones, comunique este error al administrador del sistema\r\nError Extentido: Error: No se pueden obtener los campo de la tabla tb_cupones , Error extendidoTabla no existe en el diccionario Error al replicar la tabla tb_clientes, comunique este error al administrador del sistema\r\nError Extentido: [TCP/IP Sockets]ConnectionRead (recv()).\r\nSQL: \r\n SELECT * FROM tb_clientes Where dtActualizacion>=getdate()-2'),
  (4,'2008-02-07 23:34:33','Error al replicar la tabla tb_cupones, comunique este error al administrador del sistema\r\nError Extentido: Error: No se pueden obtener los campo de la tabla tb_cupones , Error extendidoTabla no existe en el diccionario Error al replicar la tabla tb_clientes, comunique este error al administrador del sistema\r\nError Extentido: [TCP/IP Sockets]ConnectionRead (recv()).\r\nSQL: \r\n SELECT * FROM tb_clientes Where dtActualizacion>=getdate()-2'),
  (5,'2008-02-07 23:40:41','Error al replicar la tabla tb_cupones, comunique este error al administrador del sistema\r\nError Extentido: Error: No se pueden obtener los campo de la tabla tb_cupones , Error extendidoTabla no existe en el diccionario Error al replicar la tabla tb_clientes, comunique este error al administrador del sistema\r\nError Extentido: [TCP/IP Sockets]ConnectionRead (recv()).\r\nSQL: \r\n SELECT * FROM tb_clientes Where dtActualizacion>=getdate()-2'),
  (6,'2008-02-07 23:44:47','Error al replicar la tabla tb_cupones, comunique este error al administrador del sistema\r\nError Extentido: Error: No se pueden obtener los campo de la tabla tb_cupones , Error extendidoTabla no existe en el diccionario Error al replicar la tabla tb_clientes, comunique este error al administrador del sistema\r\nError Extentido: [TCP/IP Sockets]ConnectionRead (recv()).\r\nSQL: \r\n SELECT * FROM tb_clientes Where dtActualizacion>=getdate()-2');

COMMIT;

#
# Structure for the `tb_productos` table : 
#

DROP TABLE IF EXISTS `tb_productos`;

CREATE TABLE `tb_productos` (
  `cdProducto` int(11) NOT NULL,
  `dsProducto` varchar(200) default NULL,
  `vlPrecioViaje` double default NULL,
  `vlPrecioPeaje` double default NULL,
  `obsHoras` varchar(50) default NULL,
  `vlPorcentaje` int(11) default NULL,
  `tpOperacion` varchar(20) default NULL,
  `flMuestra` bit(1) NOT NULL,
  `cdOrden` varchar(1) default NULL,
  `vlPrecioViajeSinPeaje` double default NULL,
  `vlKilometros` double default NULL,
  `dtActualizacion` datetime default NULL,
  `flEliminar` bit(1) default '\0',
  KEY `cdProducto` (`cdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `tb_proveedores` table : 
#

DROP TABLE IF EXISTS `tb_proveedores`;

CREATE TABLE `tb_proveedores` (
  `cdProveedor` int(11) NOT NULL,
  `nrSocio` varchar(10) default NULL,
  `tpCategoria` varchar(50) default NULL,
  `nmNombre` varchar(50) default NULL,
  `nmApellido` varchar(50) default NULL,
  `dsRazonSocial` varchar(100) default NULL,
  `dsDomicilio` varchar(30) default NULL,
  `cdPostal` varchar(8) default NULL,
  `nmLocalidad` varchar(30) default NULL,
  `nrTel` varchar(30) default NULL,
  `nrFax` varchar(30) default NULL,
  `dsCargo` varchar(30) default NULL,
  `dsEmail` varchar(60) default NULL,
  `dtAlta` datetime default NULL,
  `dtBaja` datetime default NULL,
  `tpIVA` smallint(6) default NULL,
  `nrCUIT` varchar(20) default NULL,
  `tpIIBB` varchar(1) default NULL,
  `nrIIBB` double default NULL,
  `vlOrdenanza3337` double default NULL,
  `dtFinOrdenanza` datetime default NULL,
  `flBloqueado` bit(1) NOT NULL,
  `tpEstado` varchar(3) default NULL,
  `nrLicencia` varchar(3) default NULL,
  `dtActualizacion` datetime default NULL,
  `flEliminar` bit(1) default '\0',
  PRIMARY KEY  (`cdProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `tb_puestos` table : 
#

DROP TABLE IF EXISTS `tb_puestos`;

CREATE TABLE `tb_puestos` (
  `nrPuesto` smallint(6) NOT NULL,
  `dsPuesto` varchar(50) default NULL,
  `dsIP` varchar(15) default NULL,
  `dtActualizado` datetime default NULL,
  `nrTalonario_manual` int(11) default NULL,
  `nrTalonario_automatico` int(11) default NULL,
  `nrComprobante_manual_ult` int(11) default NULL,
  `nrComprobante_automatico_ult` int(11) default NULL,
  `flRespeta_secuencia_carga_manual` bit(1) default NULL,
  `tpletra` char(1) default NULL,
  `nrTalonario_manual_empresa` int(11) default NULL,
  `nrTalonario_manual_ctacte` int(11) default NULL,
  `nrComprobante_manual_empresa_ult` int(11) default NULL,
  `nrComprobante_manual_ctacte_ult` int(11) default NULL,
  `tpLetraEmpresa` char(10) default NULL,
  `tpLetraRecibo` char(10) default NULL,
  `dtActualizacion` datetime default NULL,
  `flEliminar` bit(1) default '\0',
  PRIMARY KEY  (`nrPuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for the `tb_puestos` table  (LIMIT 0,500)
#

INSERT INTO `tb_puestos` (`nrPuesto`, `dsPuesto`, `dsIP`, `dtActualizado`, `nrTalonario_manual`, `nrTalonario_automatico`, `nrComprobante_manual_ult`, `nrComprobante_automatico_ult`, `flRespeta_secuencia_carga_manual`, `tpletra`, `nrTalonario_manual_empresa`, `nrTalonario_manual_ctacte`, `nrComprobante_manual_empresa_ult`, `nrComprobante_manual_ctacte_ult`, `tpLetraEmpresa`, `tpLetraRecibo`, `dtActualizacion`, `flEliminar`) VALUES 
  (4,'Pergola',NULL,'2008-02-07 23:45:01',4,4,0,4710,False,'B',NULL,NULL,NULL,NULL,NULL,NULL,'2008-02-07 23:06:39',False);

COMMIT;

#
# Structure for the `tb_sincronizacion` table : 
#

DROP TABLE IF EXISTS `tb_sincronizacion`;

CREATE TABLE `tb_sincronizacion` (
  `id` int(11) NOT NULL auto_increment,
  `nmTabla` varchar(50) NOT NULL,
  `tpSincronizacion` varchar(20) default NULL,
  `dtUltSincrozacion` varchar(20) default NULL,
  `flSincronizar` bit(1) default '\0',
  `flUnidadTransaccional` bit(1) default '\0',
  `nrOrdenTransaccional` int(11) default NULL,
  `flFiltrarporPuesto` bit(1) default '\0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for the `tb_sincronizacion` table  (LIMIT 0,500)
#

INSERT INTO `tb_sincronizacion` (`id`, `nmTabla`, `tpSincronizacion`, `dtUltSincrozacion`, `flSincronizar`, `flUnidadTransaccional`, `nrOrdenTransaccional`, `flFiltrarporPuesto`) VALUES 
  (1,'tb_cajas','A_CENTRAL',NULL,True,True,1,False),
  (2,'tb_clientes','A_PUESTOS',NULL,True,False,2,False),
  (3,'tb_comisiones','A_PUESTOS',NULL,True,False,3,False),
  (4,'tb_comprobantes','A_CENTRAL',NULL,True,True,2,False),
  (5,'tb_comprobantesdetalle','A_CENTRAL',NULL,True,True,4,False),
  (6,'tb_conceptos','A_PUESTOS',NULL,True,False,4,False),
  (7,'tb_cupones','A_CENTRAL',NULL,True,True,3,False),
  (8,'tb_productos','A_PUESTOS',NULL,True,False,5,False),
  (9,'tb_proveedores','A_PUESTOS',NULL,True,False,6,False),
  (10,'tb_puestos','BIDIRECCIONAL','07/02/2008 23:45:00',True,False,0,True),
  (11,'tb_usuarios','A_PUESTOS','07/02/2008 23:45:01',True,False,1,False),
  (12,'tb_cajas','A_PUESTOS',NULL,True,False,10,True),
  (13,'tb_comprobantes','A_PUESTOS',NULL,True,False,11,True),
  (14,'tb_comprobantesdetalle','A_PUESTOS',NULL,True,False,12,True),
  (15,'tb_cupones','A_PUESTOS',NULL,True,False,13,True);

COMMIT;

#
# Definition for the `rpt_cierredecaja_v1` procedure : 
#

DROP PROCEDURE IF EXISTS `rpt_cierredecaja_v1`;

CREATE PROCEDURE `rpt_cierredecaja_v1`(IN nrCaja_param DECIMAL(18))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

declare l_Cantidad_Viajes           decimal(9,2);
declare l_Cantidad_Facturas         decimal(9,2);
declare l_cantidad_cta_cte          decimal(9,2);
declare l_Cantidad_Anuladas         decimal(9,2);
declare l_Cantidad_Contado          decimal(9,2);
declare l_Cantidad_Retorno          decimal(9,2);
declare l_Cantidad_Cobro_en_Destino decimal(9,2);
declare l_nro_factura_inicial       varchar(12);
declare l_nro_factura_final         varchar(12);
declare l_nro_Recibo_inicial        varchar(12);
declare l_nro_Recibo_final          varchar(12);


	SET l_Cantidad_Viajes           = 0;
	SET l_Cantidad_Facturas         = 0;
	SET l_cantidad_cta_cte          = 0;
	SET l_Cantidad_Anuladas         = 0;
	SET l_Cantidad_Contado          = 0;
	SET l_Cantidad_Retorno          = 0;
	SET l_Cantidad_Cobro_en_Destino = 0;
	SET l_nro_factura_inicial       = 0;
	SET l_nro_factura_final         = 0;
	SET l_nro_Recibo_inicial        = 0;
	SET l_nro_Recibo_final          = 0;
	
	-- creamos una tabla temporal em mysql
	/*DROP TABLE IF EXISTS rpt_Resumen_Caja_Puesto;*/
	DELETE FROM rpt_Resumen_Caja_Puesto;
	
    INSERT INTO rpt_Resumen_Caja_Puesto
	select  a.nrCaja,
		a.nrPuesto,
		a.dsUsuario,
		a.dtApertura,
		a.dtCierre,
		DATE_FORMAT(a.dtApertura,'%H:%i:%s') as hrApertura,
		a.hrCierre,
		a.flEstado,
		a.flCajaAdm,
		a.vlSaldoInicialPesos,
		a.vlSaldoInicialEuros,
		a.vlDiaDolar,
		a.vlDiaEuro,
		a.vlSaldoFinalPesos,
		a.vlSaldoInicialDolares,
		a.vlSaldoFinalDolares,
		a.vlSaldoFinalEuros,
		a.vlSaldoFinalRealPesos,
		a.vlSaldoFinalRealEuros,
		a.vlSaldoFinalRealDolares,
		a.vlCierrePesos,
		a.vlCierreDolares,
		a.vlCierreEuros,
		a.vlTotalSaldoFinalReal,
		a.vlTotalSaldoFinal,
		a.vlTotalSaldoInicial,
		a.vlTotalSaldoCierre,
		a.dsDiferenciaDeCierre,
		a.vlDiferenciaDeCierre,
		a.dsObservacion,
		a.dtObservacion,
		l_Cantidad_Viajes   as 'Cantidad_Viajes' ,
		l_Cantidad_Contado  as 'Cantidad_Contado',
		l_Cantidad_cta_cte  as 'Cantidad_cta_cte',
		l_Cantidad_Retorno  as 'Cantidad_Retorno',
		l_Cantidad_Anuladas as 'Cantidad_Anuladas',
		l_Cantidad_Cobro_en_Destino as 'Cantidad_Cobro_en_Destino',
		concat(concat(IFNULL(b.nmNombre,''),' '),IFNULL(b.nmApellido,'')) as 'Nombre_Cajera',
		c.dsPuesto	 as 'Descripcion_Puesto',
		l_nro_factura_inicial       as 'nro_factura_inicial',
		l_nro_factura_final         as 'nro_factura_final',
		l_nro_Recibo_inicial        as 'nro_Recibo_inicial',
		l_nro_Recibo_final          as 'nro_Recibo_final'
	from  TB_Cajas a, TB_usuarios b, TB_Puestos c
	where   (a.nrCaja = nrCaja_param) and
		 a.dsUsuario=b.dsUsuario   and
		 a.nrPuesto = c.nrPuesto;
		

	select count(*) INTO l_Cantidad_Viajes
	from   TB_Comprobantes
	where  flAnulado=0 and nrCaja=nrCaja_param;
	

	select count(*) INTO l_Cantidad_Contado
	from   TB_Comprobantes
	where  flAnulado=0 and nrCaja=nrCaja_param and
	       cdCondVenta='Contado';
	
    select count(*) INTO l_Cantidad_cta_cte
	from   TB_Comprobantes
	where  flAnulado=0 and nrCaja=nrCaja_param and
	       cdCondVenta='Cuenta Corriente';

	select count(*) INTO l_Cantidad_Retorno
	from   TB_Comprobantes
	where  flAnulado=0 and nrCaja=nrCaja_param and
	       cdCondVenta='Retorno';

	select count(*) INTO l_Cantidad_Cobro_en_Destino
	from   TB_Comprobantes
	where  flAnulado=0 and nrCaja=nrCaja_param and
	       cdCondVenta='Cobro en Destino';

	select count(*) INTO l_Cantidad_Anuladas
	from   TB_Comprobantes
	where  flAnulado=1 and nrCaja=nrCaja_param;

	select min(convert(nrComprobante, decimal(9,2))),
	       max(convert(nrComprobante, decimal(9,2))) INTO l_nro_factura_inicial, l_nro_factura_final
	from   TB_Comprobantes
	where  flAnulado=0 and nrCaja=nrCaja_param and
	       tpLetra='B';

   select  min(convert(nrComprobante, decimal(9,2))),
	       max(convert(nrComprobante, decimal(9,2))) INTO l_nro_Recibo_inicial, l_nro_Recibo_final
	from   TB_Comprobantes
	where  flAnulado=0 and nrCaja=nrCaja_param and
	       tpLetra='X';
	
    select IFNULL(l_nro_factura_inicial,'--') INTO l_nro_factura_inicial;
	select IFNULL(l_nro_factura_final,'--') INTO l_nro_factura_final;
	select IFNULL(l_nro_Recibo_inicial,'--') INTO l_nro_Recibo_inicial;
	select IFNULL(l_nro_Recibo_final,'--') INTO l_nro_Recibo_final;
	
	update	rpt_Resumen_Caja_Puesto
	set   Cantidad_Viajes   = l_Cantidad_Viajes,
	      Cantidad_Contado  = l_Cantidad_Contado,
	      Cantidad_cta_cte  = l_Cantidad_cta_cte,
	      Cantidad_Retorno  = l_Cantidad_Retorno,
	      Cantidad_Anuladas = l_Cantidad_Anuladas,
	      Cantidad_Cobro_en_Destino=l_Cantidad_Cobro_en_Destino,
	      nro_factura_inicial=l_nro_factura_inicial,
	      nro_factura_final=l_nro_factura_final,
	      nro_Recibo_inicial=l_nro_Recibo_inicial,
	      nro_Recibo_final=l_nro_Recibo_final
	where nrcaja = nrCaja_param;

	/* select * from rpt_Resumen_Caja_Puesto; */


END;

#
# Definition for the `sco_Puestos` procedure : 
#

DROP PROCEDURE IF EXISTS `sco_Puestos`;

CREATE PROCEDURE `sco_Puestos`(IN nrPuesto_param INTEGER(11))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

	select	nrPuesto,
		dsPuesto,
		dsIP,
		dtActualizado,
		nrTalonario_manual,
		nrTalonario_automatico,
		nrComprobante_manual_ult,
		nrComprobante_automatico_ult,
		flRespeta_secuencia_carga_manual,
		tpletra	
	from TB_Puestos
	where    (nrPuesto = nrPuesto_param OR  nrPuesto_param is null);
END;

#
# Definition for the `sco_TB_Productos` procedure : 
#

DROP PROCEDURE IF EXISTS `sco_TB_Productos`;

CREATE PROCEDURE `sco_TB_Productos`()
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

	select  cdProducto,
	        dsProducto,
	        vlPrecioViaje,
	        vlPrecioPeaje,
	        vlPorcentaje,
	        tpOperacion,
  		    flMuestra,
		    vlKilometros
	FROM TB_Productos
	Order by dsProducto;

END;

#
# Definition for the `SP_ObtenerMaxnrCaja_v1_3` procedure : 
#

DROP PROCEDURE IF EXISTS `SP_ObtenerMaxnrCaja_v1_3`;

CREATE PROCEDURE `SP_ObtenerMaxnrCaja_v1_3`(IN p_nrPuesto INTEGER(11))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
declare l_MaxNumero decimal(18);
declare numero int;

	SELECT MAX(nrCaja) INTO l_MaxNumero
	FROM TB_Cajas
	WHERE nrPuesto=p_nrPuesto;
	
	IF ISNULL(l_MaxNumero) THEN
       select convert(concat(convert(p_nrPuesto,CHAR),'000000001'), decimal(18)) INTO l_MaxNumero;
    END IF;
    
    select l_MaxNumero as MaxnrCaja;

END;

#
# Definition for the `SP_ObtenerMaxnrCupon_v1_3` procedure : 
#

DROP PROCEDURE IF EXISTS `SP_ObtenerMaxnrCupon_v1_3`;

CREATE PROCEDURE `SP_ObtenerMaxnrCupon_v1_3`(IN p_nrPuesto INTEGER(11))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

	CASE p_nrPuesto
	    WHEN 9 THEN
           select  IFNULL(MAX(nrCupon),0) as nrMaxCupon
           from  TB_Cupones;
	    WHEN 1 THEN
		   select  IFNULL(MAX(nrCupon),1000039774) as nrMaxCupon
	       from  TB_Cupones
		   WHERE nrPuesto=p_nrPuesto and nrCupon<9000000000;
	    WHEN 2 THEN
		   select  IFNULL(MAX(nrCupon),2000015836) as nrMaxCupon
	       from  TB_Cupones
		   WHERE nrPuesto=p_nrPuesto and nrCupon<9000000000;
	    ELSE 
	       select  IFNULL(MAX(nrCupon),0) as nrMaxCupon
	       from  TB_Cupones
	       WHERE nrPuesto=p_nrPuesto and nrCupon<9000000000;
	END CASE;





END;

#
# Definition for the `SP_ObtenerResumenCajaPuesto` procedure : 
#

DROP PROCEDURE IF EXISTS `SP_ObtenerResumenCajaPuesto`;

CREATE PROCEDURE `SP_ObtenerResumenCajaPuesto`(IN p_nrCaja DECIMAL(18))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

DELETE  FROM TB_ComprobantesDetalle_ResumenCajaPuesto;

Delete  FROM TB_Comprobantes_ResumenCajaPuesto;

INSERT INTO TB_Comprobantes_ResumenCajaPuesto
    (nrTalonario, nrComprobante, tpComprobante, tpLetra,
    dtComprobante, cdCliente, cdCondVenta, tpComision,
    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros,
    vlPagoDolares, dsLeyenda, flManual, dtInsercion,
    flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto,
    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc,
    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario,
    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI,
    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1,
    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado,
    nmEmpleado)
SELECT nrTalonario, nrComprobante, tpComprobante, tpLetra,
    dtComprobante, cdCliente, cdCondVenta, tpComision,
    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros,
    vlPagoDolares, dsLeyenda, flManual, NOW() as dtInsercion,
    0, dsUsuario, nrCaja, dtCaja, nrPuesto,
    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc,
    left(dsRazonSocial,100), nmNombre, nmApellido, nmLicenciatario,
    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI,
    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1,
    left(dsOpcional2,100), dsOpcional3, dsOpcional4, flAnulado, dtAnulado,
    nmEmpleado
FROM TB_Comprobantes
WHERE TB_Comprobantes.nrCaja=p_nrCaja;


INSERT INTO TB_ComprobantesDetalle_ResumenCajaPuesto
    (nrTalonario, nrComprobante, tpComprobante, tpLetra, nrItem,
    cdProducto, dsProducto, tpOperacion, qtCantidad, vlPorcentaje,
    vlPrecioPeaje, vlPrecioViaje, vlTotalItem, dtInsercion,
    flSincronizado,nrCaja)
SELECT TB_ComprobantesDetalle.nrTalonario, TB_ComprobantesDetalle.nrComprobante,
TB_ComprobantesDetalle.tpComprobante, TB_ComprobantesDetalle.tpLetra,
    TB_ComprobantesDetalle.nrItem, TB_ComprobantesDetalle.cdProducto,
 left(TB_ComprobantesDetalle.dsProducto,100), TB_ComprobantesDetalle.tpOperacion,
TB_ComprobantesDetalle.qtCantidad,
    TB_ComprobantesDetalle.vlPorcentaje, TB_ComprobantesDetalle.vlPrecioPeaje,
TB_ComprobantesDetalle.vlPrecioViaje, TB_ComprobantesDetalle.vlTotalItem,
    NOW() as dtInsercion, 0, TB_Comprobantes.nrCaja
FROM TB_ComprobantesDetalle, TB_Comprobantes
WHERE TB_Comprobantes.nrCaja=p_nrCaja AND
TB_ComprobantesDetalle.nrTalonario=TB_Comprobantes.nrTalonario       AND
TB_ComprobantesDetalle.nrComprobante=TB_Comprobantes.nrComprobante   AND
TB_ComprobantesDetalle.tpComprobante=TB_Comprobantes.tpComprobante   AND
TB_ComprobantesDetalle.tpLetra=TB_Comprobantes.tpLetra;



END;

#
# Definition for the `SP_ObtenerTalonarioMaximo` procedure : 
#

DROP PROCEDURE IF EXISTS `SP_ObtenerTalonarioMaximo`;

CREATE PROCEDURE `SP_ObtenerTalonarioMaximo`()
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

	select max(nrTalonario_manual) 'nrTalonarioMaximo'
    from TB_Puestos;
			

END;

#
# Definition for the `SP_PrepararReimpresiondeComprobante` procedure : 
#

DROP PROCEDURE IF EXISTS `SP_PrepararReimpresiondeComprobante`;

CREATE PROCEDURE `SP_PrepararReimpresiondeComprobante`(IN p_nrTalonario INTEGER(11), IN p_nrComprobante INTEGER(11), IN p_tpComprobante CHAR(2), IN p_tpLetra CHAR(1))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

    DELETE FROM TB_ComprobantesDetalle_Imprime;

	DELETE  FROM TB_Comprobantes_Imprime;

	INSERT INTO TB_Comprobantes_Imprime
	    (nrTalonario, nrComprobante, tpComprobante, tpLetra,
	    dtComprobante, cdCondVenta, tpComision, cdCliente,
	    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros,
	    vlPagoDolares, dsLeyenda, flManual, dtInsercion,
	    flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto,
	    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc,
	    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario,
	    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI,
	    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1,
	    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado,
	    nmEmpleado)
	SELECT nrTalonario, nrComprobante, tpComprobante, tpLetra,
	    dtComprobante, cdCondVenta, tpComision, cdCliente,
	    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros,
	    vlPagoDolares, dsLeyenda, flManual, dtInsercion,
	    flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto,
	    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc,
	    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario,
	    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI,
	    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1,
	    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado,
	    nmEmpleado
	FROM TB_Comprobantes WHERE TB_Comprobantes.nrTalonario=p_nrTalonario AND
	TB_Comprobantes.nrComprobante=p_nrComprobante AND
	TB_Comprobantes.tpComprobante=p_tpComprobante AND
	TB_Comprobantes.tpLetra=p_tpLetra;


	INSERT INTO TB_ComprobantesDetalle_Imprime
	    (nrTalonario, nrComprobante, tpComprobante, tpLetra, nrItem,
	    cdProducto, dsProducto, tpOperacion, qtCantidad, vlPorcentaje,
	    vlPrecioPeaje, vlPrecioViaje, vlTotalItem, dtInsercion,
	    flSincronizado)
	SELECT nrTalonario, nrComprobante, tpComprobante, tpLetra,
	    nrItem, cdProducto, dsProducto, tpOperacion, qtCantidad,
	    vlPorcentaje, vlPrecioPeaje, vlPrecioViaje, vlTotalItem,
	    dtInsercion, flSincronizado
	FROM TB_ComprobantesDetalle WHERE TB_ComprobantesDetalle.nrTalonario=p_nrTalonario AND
	TB_ComprobantesDetalle.nrComprobante=p_nrComprobante AND
	TB_ComprobantesDetalle.tpComprobante=p_tpComprobante AND
	TB_ComprobantesDetalle.tpLetra=p_tpLetra;
	
	
	update  TB_Comprobantes_Imprime a , TB_proveedores b
	set a.nrTelLicenciatario = IFNULL(b.nrTel,'5480-0066')
	where a.nrLicencia = b.nrLicencia and
	      a.nrTalonario=p_nrTalonario  and
	   a.nrComprobante=p_nrComprobante and
	      a.tpComprobante=p_tpComprobante and
	      a.tpLetra=p_tpLetra;

END;

#
# Definition for the `SP_ValorPromoRetorno` procedure : 
#

DROP PROCEDURE IF EXISTS `SP_ValorPromoRetorno`;

CREATE PROCEDURE `SP_ValorPromoRetorno`()
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

	select IFNULL(vlConcepto,0) as ValorPromo
	from TB_Conceptos
	where tpOperacion='Neutro'
	      and tpConcepto='Valor Promo';
	      
END;

#
# Definition for the `vw_cajaspuestos` view : 
#

DROP VIEW IF EXISTS `vw_cajaspuestos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_cajaspuestos` AS 
  select 
    `tb_cajas`.`nrCaja` AS `nrCaja`,
    `tb_cajas`.`nrPuesto` AS `nrPuesto`,
    `tb_cajas`.`dsUsuario` AS `dsUsuario`,
    `tb_cajas`.`dtApertura` AS `dtApertura`,
    `tb_cajas`.`dtCierre` AS `dtCierre`,
    `tb_cajas`.`hrApertura` AS `hrApertura`,
    `tb_cajas`.`hrCierre` AS `hrCierre`,
    `tb_cajas`.`flEstado` AS `flEstado`,
    `tb_cajas`.`flCajaAdm` AS `flCajaAdm`,
    `tb_cajas`.`vlSaldoInicialPesos` AS `vlSaldoInicialPesos`,
    `tb_cajas`.`vlSaldoInicialDolares` AS `vlSaldoInicialDolares`,
    `tb_cajas`.`vlSaldoInicialEuros` AS `vlSaldoInicialEuros`,
    `tb_cajas`.`vlDiaDolar` AS `vlDiaDolar`,
    `tb_cajas`.`vlDiaEuro` AS `vlDiaEuro`,
    `tb_cajas`.`vlSaldoFinalPesos` AS `vlSaldoFinalPesos`,
    `tb_cajas`.`vlSaldoFinalDolares` AS `vlSaldoFinalDolares`,
    `tb_cajas`.`vlSaldoFinalEuros` AS `vlSaldoFinalEuros`,
    `tb_cajas`.`vlSaldoFinalRealPesos` AS `vlSaldoFinalRealPesos`,
    `tb_cajas`.`vlSaldoFinalRealEuros` AS `vlSaldoFinalRealEuros`,
    `tb_cajas`.`vlSaldoFinalRealDolares` AS `vlSaldoFinalRealDolares`,
    `tb_cajas`.`vlCierrePesos` AS `vlCierrePesos`,
    `tb_cajas`.`vlCierreDolares` AS `vlCierreDolares`,
    `tb_cajas`.`vlCierreEuros` AS `vlCierreEuros`,
    `tb_cajas`.`vlTotalSaldoFinalReal` AS `vlTotalSaldoFinalReal`,
    `tb_cajas`.`vlTotalSaldoFinal` AS `vlTotalSaldoFinal`,
    `tb_cajas`.`dsDiferenciaDeCierre` AS `dsDiferenciaDeCierre`,
    `tb_cajas`.`vlDiferenciaDeCierre` AS `vlDiferenciaDeCierre`,
    `tb_usuarios`.`tpAcceso` AS `tpAcceso` 
  from 
    (`tb_cajas` join `tb_usuarios` on((`tb_cajas`.`dsUsuario` = `tb_usuarios`.`dsUsuario`)));

#
# Definition for the `vw_sumacajapuestoscondventa` view : 
#

DROP VIEW IF EXISTS `vw_sumacajapuestoscondventa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_sumacajapuestoscondventa` AS 
  select 
    `tb_comprobantes`.`nrCaja` AS `nrCaja`,
    `tb_comprobantes`.`cdCondVenta` AS `cdCondVenta`,
    sum(`tb_comprobantes`.`vlPagoPesos`) AS `SumaPesos`,
    sum(`tb_comprobantes`.`vlPagoEuros`) AS `SumaEuros`,
    sum(`tb_comprobantes`.`vlPagoDolares`) AS `SumaDolares` 
  from 
    `tb_comprobantes` 
  where 
    (`tb_comprobantes`.`flAnulado` = 0) 
  group by 
    `tb_comprobantes`.`nrCaja`,`tb_comprobantes`.`cdCondVenta`;

#
# Definition for the `vwcajaspuestosdesdelospuetos` view : 
#

DROP VIEW IF EXISTS `vwcajaspuestosdesdelospuetos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwcajaspuestosdesdelospuetos` AS 
  select 
    `tb_cajas`.`nrCaja` AS `nrCaja`,
    `tb_cajas`.`nrPuesto` AS `nrPuesto`,
    `tb_cajas`.`dsUsuario` AS `dsUsuario`,
    `tb_cajas`.`dtApertura` AS `dtApertura`,
    `tb_cajas`.`dtCierre` AS `dtCierre`,
    `tb_cajas`.`hrApertura` AS `hrApertura`,
    `tb_cajas`.`hrCierre` AS `hrCierre`,
    `tb_cajas`.`flEstado` AS `flEstado`,
    `tb_cajas`.`flCajaAdm` AS `flCajaAdm`,
    `tb_cajas`.`vlSaldoInicialPesos` AS `vlSaldoInicialPesos`,
    `tb_cajas`.`vlSaldoInicialDolares` AS `vlSaldoInicialDolares`,
    `tb_cajas`.`vlSaldoInicialEuros` AS `vlSaldoInicialEuros`,
    `tb_cajas`.`vlDiaDolar` AS `vlDiaDolar`,
    `tb_cajas`.`vlDiaEuro` AS `vlDiaEuro`,
    `tb_cajas`.`vlSaldoFinalPesos` AS `vlSaldoFinalPesos`,
    `tb_cajas`.`vlSaldoFinalDolares` AS `vlSaldoFinalDolares`,
    `tb_cajas`.`vlSaldoFinalEuros` AS `vlSaldoFinalEuros`,
    `tb_cajas`.`vlSaldoFinalRealPesos` AS `vlSaldoFinalRealPesos`,
    `tb_cajas`.`vlSaldoFinalRealEuros` AS `vlSaldoFinalRealEuros`,
    `tb_cajas`.`vlSaldoFinalRealDolares` AS `vlSaldoFinalRealDolares`,
    `tb_cajas`.`vlCierrePesos` AS `vlCierrePesos`,
    `tb_cajas`.`vlCierreDolares` AS `vlCierreDolares`,
    `tb_cajas`.`vlCierreEuros` AS `vlCierreEuros`,
    `tb_cajas`.`vlTotalSaldoFinalReal` AS `vlTotalSaldoFinalReal`,
    `tb_cajas`.`vlTotalSaldoFinal` AS `vlTotalSaldoFinal`,
    `tb_cajas`.`dsDiferenciaDeCierre` AS `dsDiferenciaDeCierre`,
    `tb_cajas`.`vlDiferenciaDeCierre` AS `vlDiferenciaDeCierre`,
    `tb_usuarios`.`tpAcceso` AS `tpAcceso`,
    `tb_cajas`.`flSincronizado` AS `flSincronizado`,
    `tb_cajas`.`dtActualizacion` AS `dtActualizacion` 
  from 
    (`tb_cajas` join `tb_usuarios` on((`tb_cajas`.`dsUsuario` = `tb_usuarios`.`dsUsuario`))) 
  where 
    `tb_cajas`.`nrCaja` in (
  select 
    `tb_cajas`.`nrCaja` AS `nrCaja` 
  from 
    `tb_cajas`);

