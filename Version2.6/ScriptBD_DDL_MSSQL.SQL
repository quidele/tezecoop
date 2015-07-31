-- cambios de DDL version 2.6
use dbSG2000
go




if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_realizarCierreCajaPuesto_v2_6]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_realizarCierreCajaPuesto_v2_6]

go


/***** Voy Por Acá  20081107 ******/
create   procedure SP_realizarCierreCajaPuesto_v2_6
		       (@pnrCaja_param numeric,
			@pdsUsuario_param as varchar(50),
		        @pdsUsuario_Supervisor_param as varchar(50))
as
begin

declare @error as varchar
declare @nrCierre as integer
declare @flestado as integer
declare @dsUsuario as varchar(50)

--declare @pnrCaja_param numeric
--declare @pdsUsuario_param varchar(50)
--declare @pdsUsuario_Supervisor_param varchar(50)

--set     @pnrCaja_param = 2000002220 
--set 	@pdsUsuario_param = 'ROMA' 
--set 	@pdsUsuario_Supervisor_param = 'USRPARAM' 

 	begin tran t1

	select @flestado=flestado, 
	       @dsUsuario=dsUsuarioReapertura
	from tb_cajas where nrCaja = @pnrCaja_param

	if @flestado=1
	begin
		rollback tran t1
		set @error='la caja ya se encuentra cerrada'
		RAISERROR (@error,16,1);
		return;
	end 

	if @dsUsuario<>@pdsUsuario_param 
	begin
		rollback tran t1
		set @error='usuario de cierre incorrecto.'
		RAISERROR (@error,16,1);
		return;
	end 

	/* Marcar la caja como cerrada en la tabla tb_caja 
	actualizamos el usuario tb_cajas.dsUsuario con quien la esta realizando el cierre*/

	update tb_cajas
	set [flEstado]=1, -- cerramos la caja
	    [dsUsuario_Supervisor]=@pdsUsuario_Supervisor_param, -- seteamos el usuario autorizador
	    tpEstadoAprobacion = 'Pendiente',
	    dtEstadoAprobacion = getdate(),
	    [dtActualizacion]=getdate(), -- actualizamos al fecha
            dtCierre = isnull(dtCierre, getdate()) 
	where nrCaja = @pnrCaja_param

	if @@error<>0 
	begin 
		rollback tran t1
		set @error='no se pudo actualizar el nuevo estado de la caja'
		RAISERROR (@error,16,1);
		return;
	end 

	commit tran t1
	
end

