-- Cambios de DML version 3.8
use dbSG2000_Pruebas
go 


update TB_OpcionesMenues 
set dsOpcionMenu = 'Traspaso de Caja'
where nmOpcionMenu = 'optTraspasoPuestos'


select * from TB_OpcionesMenues where nmOpcionMenu = 'optTraspasoPuestos'



if (select COUNT(*) from TB_OpcionesMenues where nmOpcionMenu = 'optRealizarTraspaso')=0
begin
	INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (200,'Realizar Traspaso','optRealizarTraspaso','Empleado',10.1,2,1,0);
end


if (select COUNT(*) from TB_OpcionesMenues where nmOpcionMenu = 'optTraspasoCajaAuditorias')=0
begin
	INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (201,'Visor de Auditoria','optTraspasoCajaAuditorias','Empleado',10.2,2,1,0);
end



exec [dbo].[SP_GenerarNuevasOpcionesdeMenues] 
 
 
delete diccionariodedatos where nmTabla = 'TB_Auditorias'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Auditorias','dsAuditoria','Descripción','VARCHAR','300','No','No','Yes',7,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Auditorias','dtAuditoria','Fecha','DATE','10','No','No','Yes',6,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Auditorias','funcion','Función','VARCHAR','50','No','No','Yes',3,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Auditorias','IdAuditoria','Id','INT','10','Yes','No','Yes',1,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Auditorias','Modulo','Módulo','VARCHAR','50','No','No','Yes',4,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Auditorias','nrCaja','Caja Nro.','NUMERIC','18','No','No','Yes',2,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Auditorias','nrPuesto','Puesto','INT','10','No','No','Yes',5,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Auditorias','tsAuditoria','Fecha y Hora','DATETIME','16','No','No','No',null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('TB_Auditorias','dsUsuario','Usuario','VARCHAR','50','No','No','Yes',0,null,null,null,null,null,null,null,null);



select tpTipo from diccionariodedatos where nmCampo ='nrLicencia'

update diccionariodedatos set tpTipo = 'INT_CERO_POSITIVO' where nmCampo ='nrLicencia'


select tpTipo from diccionariodedatos where nmCampo ='nrBultos'

update diccionariodedatos set tpTipo = 'INT_CERO_POSITIVO' where nmCampo ='nrBultos'

select tpTipo from diccionariodedatos where nmCampo ='nrPasajeros'

update diccionariodedatos set tpTipo = 'INT_CERO_POSITIVO' where nmCampo ='nrPasajeros'
