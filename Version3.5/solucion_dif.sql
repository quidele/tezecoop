USE [dbSG2000_Pruebas]
GO
/****** Object:  StoredProcedure [dbo].[SP_rpt_recaudacion_v3_5]    Script Date: 06/22/2010 20:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER procedure [dbo].[SP_rpt_recaudacion_v3_5]   (@dtCupon_desde_param DATETIME,
					            @dtCupon_hasta_param DATETIME,
						    @nrLicencia_param    int=0)
as
begin

	---PRINT @dtCupon_desde_param
	---PRINT @dtCupon_hasta_param


	select tpCupon,
	       count(*) as vlCantidad,
	       sum(vlMontoCupon) as vlMontoCupon, 
	       sum(vlComision)   as vlComision,
	       sum(vliva)        as vliva,
	       flcond_grupo = CASE tpCupon
					WHEN 'Retorno' then 2
				        ELSE 1 
				    END	
	from   tb_cupones
	where  dtCupon >= @dtCupon_desde_param   and 
	       dtCupon <= @dtCupon_hasta_param and 
           flAnulado = 0 and 
           nrLicencia not in (999,900) and  (nrLicencia=@nrLicencia_param or @nrLicencia_param=0) and
           flEliminar=0
		
	group by tpCupon



end


GO


 set dateformat dmy 
 
 Exec SP_rpt_recaudacion_v3_5 @dtCupon_desde_param = '01-01-2010 00:00:00.000' ,@dtCupon_hasta_param = '31-01-2010 23:59:59.000' ,@nrLicencia_param = 0 
 
 Exec SP_rpt_recaudacion_v3_5 @dtCupon_desde_param = '01-01-2010 00:00:00' ,@dtCupon_hasta_param = '31-01-2010 23:59:59' ,@nrLicencia_param = 0 
 
 Exec SP_rpt_recaudacion_v3_5 @dtCupon_desde_param = '01-01-2010  00:00:00' ,@dtCupon_hasta_param = '31-01-2010  23:59:59' ,@nrLicencia_param = 0 
 
update a
set esta=1
from tmp_resultado1 a, tmp_resultado2 b
where a.nrCupon = b.nrCupon


select * from tmp_resultado1  where esta='N'

