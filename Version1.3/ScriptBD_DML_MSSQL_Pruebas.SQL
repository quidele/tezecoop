-- cambios de DML version 1.3 
use dbSG2000_Pruebas
go


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Clientes' and nmCampo = 'dtActualizacion' 

-- agregado en la tabla de TB_Clientes 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_Clientes','dtActualizacion','dtActualizacion','DATETIME',
16,'No','No',null,null) 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_comisiones' and nmCampo = 'dtActualizacion' 

-- agregado en la tabla de tb_comisiones 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('tb_comisiones','dtActualizacion','dtActualizacion','DATETIME',
16,'No','No',null,null) 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_productos' and nmCampo = 'dtActualizacion' 

-- agregado en la tabla de tb_productos 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('tb_productos','dtActualizacion','dtActualizacion','DATETIME',
16,'No','No',null,null) 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'dtActualizacion' 

-- agregado en la tabla de tb_puestos 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('tb_puestos','dtActualizacion','dtActualizacion','DATETIME',
16,'No','No',null,null) 


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_usuarios' and nmCampo = 'dtActualizacion' 

-- agregado en la tabla de tb_usuarios 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('tb_usuarios','dtActualizacion','dtActualizacion','DATETIME',
16,'No','No',null,null) 


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_proveedores' and nmCampo = 'dtActualizacion' 

-- agregado en la tabla de tb_usuarios 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('tb_proveedores','dtActualizacion','dtActualizacion','DATETIME',
16,'No','No',null,null) 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_conceptos' and nmCampo = 'dtActualizacion' 

-- agregado en la tabla de tb_cajas 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('tb_conceptos','dtActualizacion','dtActualizacion','DATETIME',
16,'No','No',null,null) 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_cajas' and nmCampo = 'dtActualizacion' 

-- agregado en la tabla de tb_cajas 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('tb_cajas','dtActualizacion','dtActualizacion','DATETIME',
16,'No','No',null,null) 


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_comprobantes' and nmCampo = 'dtActualizacion' 

-- agregado en la tabla de tb_cajas 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('tb_comprobantes','dtActualizacion','dtActualizacion','DATETIME',
16,'No','No',null,null) 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_comprobantesDetalle' and nmCampo = 'dtActualizacion' 

-- agregado en la tabla de tb_comprobantesDetalle 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('tb_comprobantesDetalle','dtActualizacion','dtActualizacion','DATETIME',
16,'No','No',null,null) 


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_Cupones' and nmCampo = 'dtActualizacion' 

-- agregado en la tabla de tb_comprobantesDetalle 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('TB_Cupones','dtActualizacion','dtActualizacion','DATETIME',
16,'No','No',null,null) 
----------------------------------------------------------------------

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_comprobantes' and nmCampo = 'dsOpcional4' 

-- agregado en la tabla de tb_comprobantesDetalle 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('tb_comprobantes','dsOpcional4','dsOpcional4','VARCHAR',
40,'No','No',null,null) 

-------------------------------------------------------------------

UPDATE DiccionariodeDatos
set flClave='Yes'
WHERE nmTabla='tb_usuarios' and nmCampo = 'dsUsuario' 


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_usuarios' and nmCampo = 'dsPassword_OLD' 


-- agregado en la tabla de tb_usuarios 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('tb_usuarios','dsPassword_OLD','dsPassword_OLD','VARCHAR',
8,'No','No',null,null) 

-- actualizamos el sicionario de la tabla  tb_sincronizacion

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_sincronizacion' and nmCampo = 'id' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_sincronizacion','id','id','INTEGER','5','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_sincronizacion' and nmCampo = 'flUnidadTransaccional' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_sincronizacion','flUnidadTransaccional','flUnidadTransaccional','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_sincronizacion' and nmCampo = 'flSincronizar' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_sincronizacion','flSincronizar','flSincronizar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_sincronizacion' and nmCampo = 'nmTabla' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_sincronizacion','nmTabla','nmTabla','VARCHAR','50','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_sincronizacion' and nmCampo = 'dtUltSincrozacion' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_sincronizacion','dtUltSincrozacion','dtUltSincrozacion','VARCHAR','20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_sincronizacion' and nmCampo = 'nrOrdenTransaccional' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_sincronizacion','nrOrdenTransaccional','nrOrdenTransaccional','INTEGER','5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_sincronizacion' and nmCampo = 'tpSincronizacion' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_sincronizacion','tpSincronizacion','tpSincronizacion','VARCHAR','20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);





-- cargamos los datos de la tabla  tb_sincronizacion

set dateformat dmy

delete from tb_sincronizacion;

INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional) VALUES
  (1,'tb_cajas','A_CENTRAL',NULL,1,1,1);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional) VALUES
  (2,'tb_clientes','A_PUESTOS','16/01/2008 5:56:37',1,0,NULL);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional) VALUES
  (3,'tb_comisiones','A_PUESTOS','16/01/2008 5:56:38',1,0,NULL);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional) VALUES
  (4,'tb_comprobantes','A_CENTRAL',NULL,1,1,2);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional) VALUES
  (5,'tb_comprobantesdetalle','A_CENTRAL',NULL,1,1,4);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional) VALUES
  (6,'tb_conceptos','A_PUESTOS','16/01/2008 5:56:38',1,0,NULL);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional) VALUES
  (7,'tb_cupones','A_CENTRAL',NULL,1,1,3);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional) VALUES
  (8,'tb_productos','A_PUESTOS','16/01/2008 5:56:38',1,0,NULL);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional) VALUES
  (9,'tb_proveedores','A_PUESTOS','16/01/2008 5:56:38',1,0,NULL);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional,flFiltrarporPuesto) VALUES
  (10,'tb_puestos','BIDIRECCIONAL','16/01/2008 5:56:38',1,0,NULL,1);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional) VALUES
  (11,'tb_usuarios','A_PUESTOS','16/01/2008 5:56:38',1,0,NULL);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional,flFiltrarporPuesto) VALUES
  (12,'tb_cajas','A_PUESTOS',NULL,0,0,10,1);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional,flFiltrarporPuesto) VALUES
  (13,'tb_comprobantes','A_PUESTOS',NULL,0,0,11,1);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional,flFiltrarporPuesto) VALUES
  (14,'tb_comprobantesdetalle','A_PUESTOS',NULL,0,0,12,1);
INSERT INTO tb_sincronizacion ([Id],nmTabla, tpSincronizacion, dtUltSincrozacion, flSincronizar, flUnidadTransaccional, nrOrdenTransaccional,flFiltrarporPuesto) VALUES
  (15,'tb_cupones','A_PUESTOS',NULL,0,0,12,1);


set dateformat dmy
-- para realizar la primera sincronizacion de toda la BD
update TB_Clientes   set dtActualizacion=getdate()
update tb_comisiones set dtActualizacion=getdate()
update tb_conceptos set dtActualizacion=getdate()
update tb_productos  set dtActualizacion=getdate()
update tb_puestos    set dtActualizacion=getdate()
update tb_usuarios   set dtActualizacion=getdate()
update tb_proveedores   set dtActualizacion=getdate()
update tb_sincronizacion   set dtUltSincrozacion=null

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_sincronizacion' and nmCampo = 'id' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_sincronizacion','id','id','INTEGER','6','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

------------------------------------------------------
--- solicionando el problema de la eliminacion

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_clientes' and nmCampo = 'flEliminar' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_clientes','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_comisiones' and nmCampo = 'flEliminar' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_comisiones','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_conceptos' and nmCampo = 'flEliminar' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_conceptos','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_productos' and nmCampo = 'flEliminar' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_productos','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'flEliminar' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_conceptos','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'flEliminar' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_usuarios' and nmCampo = 'flEliminar' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_usuarios','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_comprobantes' and nmCampo = 'flEliminar' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_comprobantes','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_comprobantesDetalle' and nmCampo = 'flEliminar' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_comprobantesDetalle','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_cupones' and nmCampo = 'flEliminar' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_cupones','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_proveedores' and nmCampo = 'flEliminar' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_proveedores','flEliminar','flEliminar','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
----------------------------------------------------------

update tb_clientes set  flEliminar=0 where flEliminar is null;
update tb_comisiones set  flEliminar=0 where flEliminar is null;
update tb_conceptos set  flEliminar=0 where flEliminar is null;
update tb_productos set  flEliminar=0 where flEliminar is null;
update tb_puestos set  flEliminar=0 where flEliminar is null;
update tb_usuarios set  flEliminar=0 where flEliminar is null;
update tb_proveedores set  flEliminar=0 where flEliminar is null;
update tb_comprobantes set  flEliminar=0,flSincronizado=0 where flEliminar is null;

update tb_comprobantesDetalle set  flEliminar=0 where flEliminar is null;
update tb_cupones set  flEliminar=0 where flEliminar is null ;

update tb_comprobantesDetalle set  flSincronizado=0 where flSincronizado is null;
update tb_cupones set flSincronizado=0 where flSincronizado is null;
--------------------------------------------------

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_cupones' and nmCampo = 'flSincronizado' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_cupones','flSincronizado','flSincronizado','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_cupones' and nmCampo = 'flSincronizado' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_cupones','flSincronizado','flSincronizado','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_cupones' and nmCampo = 'flSincronizado' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_cupones','flSincronizado','flSincronizado','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_cupones' and nmCampo = 'flSincronizado' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_cupones','flSincronizado','flSincronizado','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

---------------------------------------------------------------------------

--- FILTRAR POR PUESTOS
--  Agregar campo flFiltrarporPuesto y valores en el diccionario de datos
--  adecuar la tabla TB_ComprobantesDetalle agregar el campo nrPuesto
--  adecuar los DML del programa para que graben nrPuesto

update a
set a.nrPuesto=b.nrPuesto
from TB_ComprobantesDetalle a  , TB_Comprobantes b where
a.nrTalonario = b.nrTalonario and
a.nrComprobante = b.nrComprobante and
a.tpComprobante = b.tpComprobante and
a.tpLetra = b.tpLetra 
and b.dtActualizacion is not null

update a
set a.nrPuesto=b.nrPuesto
from TB_Cajas a  , TB_Comprobantes b where
a.nrCaja = b.nrCaja and b.dtActualizacion is not null


DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_sincronizacion' and nmCampo = 'flFiltrarporPuesto' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_sincronizacion','flFiltrarporPuesto','flFiltrarporPuesto','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


------ agregados para la  Sincronizacion Manual

DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_comprobantesDetalle' and nmCampo = 'nrCaja' 

-- agregado en la tabla de tb_usuarios 
INSERT INTO DiccionariodeDatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, 
 nrTamanio, flClave, flBusqueda, nrOrdenBusqueda, vlPuesto9)
VALUES ('tb_comprobantesDetalle','nrCaja','nrCaja','NUMERIC',
18,'No','No',null,null) 


update a
set a.nrCaja=b.nrCaja
from TB_ComprobantesDetalle a  , TB_Comprobantes b where
a.nrTalonario = b.nrTalonario and
a.nrComprobante = b.nrComprobante and
a.tpComprobante = b.tpComprobante and
a.tpLetra = b.tpLetra 

------ agregados para la  Sincronizacion Manual------//


DELETE FROM DiccionariodeDatos
WHERE nmTabla='VW_CajasPuestos' and nmCampo = 'flSincronizado' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('VW_CajasPuestos','flSincronizado','flSincronizado','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

update a
set a.flSincronizado=1
from TB_Cajas a 

-------------------------------------------------------------
-- agregar la clave de la tabla cupon

DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerMaxnrCaja_v1_3' and nmCampo = 'p_nrPuesto' 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerMaxnrCaja_v1_3' and nmCampo = '@nrPuesto' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerMaxnrCaja_v1_3','p_nrPuesto','p_nrPuesto','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerMaxnrCaja_v1_3','@nrPuesto','@nrPuesto','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerMaxnrCupon_v1_3' and nmCampo = 'p_nrPuesto' 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_ObtenerMaxnrCupon_v1_3' and nmCampo = '@nrPuesto' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerMaxnrCupon_v1_3','p_nrPuesto','p_nrPuesto','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_ObtenerMaxnrCupon_v1_3','@nrPuesto','@nrPuesto','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



-----------------------------------------------------


DELETE FROM DiccionariodeDatos
WHERE nmTabla='sco_Puestos' and nmCampo = 'nrPuesto_param' 

DELETE FROM DiccionariodeDatos
WHERE nmTabla='sco_Puestos' and nmCampo = '@nrPuesto_param' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('sco_Puestos','nrPuesto_param','nrPuesto_param','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('sco_Puestos','@nrPuesto_param','@nrPuesto_param','INTEGER','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



-------------------------------------------------------

DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_PrepararReimpresiondeComprobante' and nmCampo = '@nrTalonario' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_PrepararReimpresiondeComprobante','@nrTalonario','@nrTalonario','VARCHAR','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_PrepararReimpresiondeComprobante' and nmCampo = '@nrComprobante' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_PrepararReimpresiondeComprobante','@nrComprobante','@nrComprobante','VARCHAR','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_PrepararReimpresiondeComprobante' and nmCampo = '@tpComprobante' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_PrepararReimpresiondeComprobante','@tpComprobante','@tpComprobante','VARCHAR','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='SP_PrepararReimpresiondeComprobante' and nmCampo = '@tpLetra' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('SP_PrepararReimpresiondeComprobante','@tpLetra','@tpLetra','VARCHAR','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



DELETE FROM DiccionariodeDatos
WHERE nmTabla='tb_puestos' and nmCampo = 'nrPuesto' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('tb_puestos','nrPuesto','nrPuesto','INTEGER','3','Yes',NULL,'Yes',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM DiccionariodeDatos
WHERE nmTabla='TB_ComprobantesDetalle' and nmCampo = 'nrPuesto' 


INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('TB_ComprobantesDetalle','nrPuesto','nrPuesto','INTEGER','3','Yes',NULL,'Yes',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



update  TB_OpcionesMenues 
set dsOpcionMenu='Búsquedas de Comprobantes'
where   dsOpcionMenu = 'Reimpresión de Comprobantes'

update  TB_OpcionesMenues 
set dsOpcionMenu='Búsqueda y  Anulación de Recibos'
where   dsOpcionMenu = 'Reimpresión de Recibos'


update DiccionariodeDatos
set flBusqueda='Yes',
    nrOrdenBusqueda=5
WHERE nmTabla='tb_usuarios' and nmCampo = 'tpAcceso' 


update DiccionariodeDatos
set flBusqueda='Yes',
    nrOrdenBusqueda=6
WHERE nmTabla='tb_usuarios' and nmCampo = 'tpNivelJerarquico' 

