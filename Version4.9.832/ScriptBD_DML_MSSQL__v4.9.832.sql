
-- Cambios de DML version 4.9.832
use dbSG2000
go 



set dateformat dmy 

delete from TB_Parametros  where dsParametro = 'Empresa'

INSERT INTO TB_Parametros (dsParametro,vlParametro,tpParametro,nrTamanio,dtActualizacion,observacion,grupo_parametro,flEditable)  VALUES ('Empresa','TAEZE','TEXTO',10,GETDATE(),'creado en la versi�n 4.9.832','M�dulo de Obligaciones',1);




delete from TB_numeradores



INSERT INTO TB_numeradores (numerador,nombre,notas,valor_asignado,valor_defecto,incremento,consecutivos,modificable,usuario_mod,fecha_mod,terminal_mod,operacion_mod,estado_registro,formulario,seccion,bloque,linea)  VALUES ('nro_trans','nro_trans','nro_trans',0,null,1,'S',null,'quidele','23/02/2018','Pc0157','Nuevo','A','FrmQuidele','seccion','bloque',1);
INSERT INTO TB_numeradores (numerador,nombre,notas,valor_asignado,valor_defecto,incremento,consecutivos,modificable,usuario_mod,fecha_mod,terminal_mod,operacion_mod,estado_registro,formulario,seccion,bloque,linea)  VALUES ('OBAP0TAEZE','OBAP0TAEZE',null,0,null,1,'S',null,'camilap','23/02/2018 16:55:46','PC0157','Nuevo','A','FrmABMDocumentos','seccion','bloque',1);


delete from TB_documentos 

INSERT INTO TB_documentos (cod_doc,nom_doc,usuario_mod,fecha_mod)  VALUES ('OBAP','Oblidaciones a Pagar','quidele','23/02/2018 16:55:45');





