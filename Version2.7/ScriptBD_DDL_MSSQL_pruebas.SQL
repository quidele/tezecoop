-- cambios de DDL version 2.7
use dbSG2000_Pruebas
go



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_ObtenerMaxnrCupon_v2_7]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_ObtenerMaxnrCupon_v2_7]


go 

CREATE PROCEDURE SP_ObtenerMaxnrCupon_v2_7
AS
BEGIN

       select  ISNULL(MAX(nrCupon),0) as nrMaxCupon
       from  TB_Cupones;
       return;
    


END;

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[obtenerCuponesAnulados_v2_7]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[obtenerCuponesAnulados_v2_7]


go 

CREATE PROCEDURE obtenerCuponesAnulados_v2_7
			(@nrLicencia_param as int)
AS
BEGIN

declare @fecha_corte datetime

       select @fecha_corte = min(dtCupon)  from TB_Cupones
       where  flanulado = 0  and flCompensado = 0 
	      and nrlicencia = @nrLicencia_param

       select *
       from  TB_Cupones
       where flanulado = 1 and nrlicencia = @nrLicencia_param
       and  dtCupon>@fecha_corte
    


END;