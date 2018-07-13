
-- Cambios de DML version 4.9.833
use dbSG2000
go 


delete from TB_NivelAccesoOpcionesMenu where IdOpcionMenu in ( select IdOpcionMenu from TB_OpcionesMenues where nmOpcionMenu = 'opt_estadodecuenta')
 
delete from TB_OpcionesMenues where nmOpcionMenu = 'opt_estadodecuenta'

declare @IdOpcionMenu int

select  @IdOpcionMenu  =  max(IdOpcionMenu) + 1 from TB_OpcionesMenues

INSERT INTO TB_OpcionesMenues (IdOpcionMenu,dsOpcionMenu,nmOpcionMenu,tpNivelJerarquico,nrorden,nrNivelHoja,flvisible,flCajaAdm)  
VALUES (@IdOpcionMenu,'Estado de Cuenta - Obligaciones','opt_estadodecuenta','Empleado',220,1,1,0);

exec SP_GenerarNuevasOpcionesdeMenues
