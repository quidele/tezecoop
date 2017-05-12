
-- Cambios de DML version 4.9.6
use dbSG2000
go 



select * from TB_OpcionesMenues
delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu in ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'mnVarios')
delete from TB_OpcionesMenues where nmOpcionMenu = 'mnVarios'

declare @IdOpcionMenu int
select  @IdOpcionMenu  =  max(IdOpcionMenu) + 1 from TB_OpcionesMenues
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (@IdOpcionMenu,'Varios','mnVarios','Empleado',216,0,1,0);

select * from TB_OpcionesMenues
delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu in ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'optCargaTarifas')
delete from TB_OpcionesMenues where nmOpcionMenu = 'optCargaTarifas'

select  @IdOpcionMenu  =  max(IdOpcionMenu) + 1 from TB_OpcionesMenues
INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  VALUES (@IdOpcionMenu,'Carga de Tarifas','optCargaTarifas','Empleado',217,1,1,0);

exec SP_GenerarNuevasOpcionesdeMenues

select * from TB_OpcionesMenues