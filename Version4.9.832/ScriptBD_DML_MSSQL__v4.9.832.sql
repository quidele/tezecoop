
-- Cambios de DML version 4.9.832
use dbSG2000
go 

----- delete from tb_cupones where nro_trans is not null
-- UPDATE  dbo.TB_Proveedores  SET flGPS = 1 WHERE nrLicencia in ('10','124','40')


set dateformat dmy 

delete from TB_Parametros  where dsParametro = 'Empresa'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('Empresa','TAE','TEXTO',10,GETDATE(),'creado en la versión 4.9.832','Mòdulo de Obligaciones',1);




delete from TB_numeradores



INSERT INTO TB_numeradores (numerador,nombre,notas,valor_asignado,valor_defecto,incremento,consecutivos,modificable,usuario_mod,fecha_mod,terminal_mod,operacion_mod,estado_registro,formulario,seccion,bloque,linea)  VALUES ('nro_trans','nro_trans','nro_trans',1,null,1,'S',null,'quidele','23/02/2018','Pc0157','Nuevo','A','FrmQuidele','seccion','bloque',1);
INSERT INTO TB_numeradores (numerador,nombre,notas,valor_asignado,valor_defecto,incremento,consecutivos,modificable,usuario_mod,fecha_mod,terminal_mod,operacion_mod,estado_registro,formulario,seccion,bloque,linea)  VALUES ('OBAP0TAE','OBAP0TAEZE',null,1,null,1,'S',null,'camilap','23/02/2018 16:55:46','PC0157','Nuevo','A','FrmABMDocumentos','seccion','bloque',1);


delete from TB_documentos 

INSERT INTO TB_documentos (cod_doc,nom_doc,usuario_mod,fecha_mod)  VALUES ('OBAP','Oblidaciones a Pagar','quidele','23/02/2018 16:55:45');

-- select * from TB_OpcionesMenues

delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu in ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optObligaciones')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optObligaciones'

declare @IdOpcionMenu int

select  @IdOpcionMenu  =  max(IdOpcionMenu) + 1 from TB_OpcionesMenues

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (@IdOpcionMenu,'Carga de Obligaciones','optObligaciones','Empleado',219,1,1,0);

exec SP_GenerarNuevasOpcionesdeMenues




--------------------------------------
--!! ALTA DE NUEVOS CONCEPTOS    !!---
--------------------------------------


delete from TB_Conceptos  where cdConcepto = 3000

INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,
flEliminar,tpCajaImputacion,tpCreadoPor,
flSumaenCajaAdm,
flSumaenCajaCooperativa,
flSumaenCajaLicenciatarios,
flOcultadoenCajaAdm,
flOcultadoCajaLicenciatario,
flOcultadoCajaCooperativa,
flOcultadoenRegistracion)  VALUES (3000,'Cajas','Débito x Obligación',0,'Ingreso de Dinero',getdate(),0,'Caja de la Cooperativa','Sistema',1,1,0,0,0,0,0);


delete from TB_Conceptos  where cdConcepto = 3001

INSERT INTO TB_Conceptos (cdConcepto,tpConcepto,dsConcepto,vlConcepto,tpOperacion,dtActualizacion,
flEliminar,tpCajaImputacion,tpCreadoPor,
flSumaenCajaAdm,
flSumaenCajaCooperativa,
flSumaenCajaLicenciatarios,
flOcultadoenCajaAdm,
flOcultadoCajaLicenciatario,
flOcultadoCajaCooperativa,
flOcultadoenRegistracion)  VALUES 
(3001,'Cajas','Crédito x Obligación',0, 'Entrada de Dinero',getdate(),0,'Caja de la Cooperativa','Sistema', 1,1,0,0,0,0,0);


DELETE FROM DiccionariodeDatos WHERE nmTabla='TB_Proveedores' and nmCampo = 'flGPS' 

INSERT INTO diccionariodedatos (nmTabla, nmCampo, nmCampoExterno, tpTipo, nrTamanio, flClave, flClaveForanea, flBusqueda, nrOrdenBusqueda, vlPuesto1, vlPuesto2, vlPuesto3, vlPuesto9, Actualizar, vlPuesto4, vlPuesto5) VALUES 
  ('TB_Proveedores','flGPS','flGPS','BIT','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);




  select * from tb_cupones

  vlRecargoTarjeta

  select * from TB_Parametros 