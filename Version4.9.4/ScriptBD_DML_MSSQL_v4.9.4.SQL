-- Cambios de DML version 4.9.4
use dbSG2000
go 


delete from diccionariodedatos  where  nmTabla =  'spu_obtieneDatosCITIVentas_v4_9_4'

INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtieneDatosCITIVentas_v4_9_4','@mes','@mes','int','2',null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO  diccionariodedatos  (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('spu_obtieneDatosCITIVentas_v4_9_4','@anio','@anio','int','4',null,null,null,null,null,null,null,null,null,null,null,null);


go 



select * from TB_OpcionesMenues

delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu in ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optPresentacionesCAIAFIP')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'optPresentacionesCAIAFIP'

declare @IdOpcionMenu int

select  @IdOpcionMenu  =  max(IdOpcionMenu) + 1 from TB_OpcionesMenues

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (@IdOpcionMenu,'Presentaciones CAI','optPresentacionesCAIAFIP','Empleado',213.1,1,1,0);

exec SP_GenerarNuevasOpcionesdeMenues

select * from TB_OpcionesMenues