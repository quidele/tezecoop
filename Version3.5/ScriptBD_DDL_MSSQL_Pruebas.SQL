-- Cambios de DDL version 3.5
use dbSG2000_Pruebas
go


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='dsLeyenda')
ALTER TABLE  [TB_Cupones] ADD  dsLeyenda varchar(255); -- Retorno / Centro

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_TB_Cupones_Qry_v3_5]'))
drop procedure [dbo].[SP_TB_Cupones_Qry_v3_5]

go 

-- Modificado version 1.6
-- Todos los viajes pagados al Licenciatario @flCompensado_param=1
-- Todos lo Viajes Facturados al Licenciatario @flCompensado_param=0
CREATE procedure [dbo].[SP_TB_Cupones_Qry_v3_5]
@dtCupon_desde_param datetime,
@dtCupon_hasta_param datetime,
@nrLicencia_param    int=0,
@flAnulado_param     bit=0,
@flCompensado_param  bit=1,
@flNoPagados_param   bit=1,
@flAgrupado          int=0,
@vlMontoCupon_param  int=0
as

    if @nrLicencia_param=0
    begin
        if @flAgrupado=0
            if @flCompensado_param=1
	       -- viajes que fueron pagados al licenciatario	
               select nrCupon,
                        nrLicencia,
                        nmLicenciatario,
                        tpCupon,
                        vlMontoCupon,
                        vlPagoPesos,
                        vlPagoEuros,
                        vlPagoDolares,
                        vlComision,
						isnull(vlIVA,0) as vlIVA,
                        vlComision + isnull(vlIVA,0) as vlRetencion,
                        dtCupon,
                        nrTalonarioCliente,
                        nrComprabanteCliente,
                        flCompensado,
                        nrCajaCliente,
                        nrCajaLicenciatario,
                        dtCompensado,
                        dsUsuario,
                        dsObservacion,
                        dsDestino,
                        dsHoraViaje,
			flPosee_obs = CASE dsObservacion
					WHEN null then 0
					WHEN '' then 0
				        ELSE 1 
				    END,
			dsLeyenda	
                From TB_Cupones
                Where
                    flAnulado = @flAnulado_param and
                    flAnulado=@flAnulado_param and
                    flCompensado=@flCompensado_param  and
                    dtcupon>=@dtCupon_desde_param and
                    dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and
		    flEliminar=0 and vlMontoCupon>@vlMontoCupon_param
                order by nrLicencia, dtCupon
            Else
	       -- viajes que fueron facturados (pagados o sin pagar) al Licenciatario
                select nrCupon,
                    nrLicencia,
                    nmLicenciatario,
                    tpCupon,
                    vlMontoCupon,
                    vlPagoPesos,
                    vlPagoEuros,
                    vlPagoDolares,
                    vlComision,
		    isnull(vlIVA,0) as vlIVA,
                    vlComision + isnull(vlIVA,0) as vlRetencion,
                    dtCupon,
                    nrTalonarioCliente,
                    nrComprabanteCliente,
                    flCompensado,
                    nrCajaCliente,
                    nrCajaLicenciatario,
                    dtCompensado,
                    dsUsuario,
                    dsObservacion,
                    dsDestino,
                    dsHoraViaje,
		    flPosee_obs = CASE dsObservacion
					WHEN null then 0
					WHEN '' then 0
				        ELSE 1 
				    END,			
					dsLeyenda  
                    From TB_Cupones
                    Where
						(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0)  and
						flEliminar=0  and
                        flAnulado = @flAnulado_param and
                        flAnulado=@flAnulado_param and
                        dtcupon>=@dtCupon_desde_param and
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and
			((@flNoPagados_param=1 and flCompensado=0) OR 
			(@flNoPagados_param=0)) 
                    order by nrLicencia,  dtCupon
        else -- Agrupado
	    -- viajes que fueron pagados al licenciatario	
            if @flCompensado_param=1
                    select nrLicencia,
                            min(nmLicenciatario) as Licenciatario,
                            COUNT(*) AS CantidadViajes,
                            SUM(vlMontoCupon) as vlSumaPesos ,
                            sum(vlComision) as vlSumaComision,
                            (SUM(vlMontoCupon) - sum(vlComision) - sum(isnull(vlIVA,0)) ) as vlTotalaFacturar,
			    sum(isnull(vlIVA,0))		vlSumaIVA
                    From TB_Cupones
                    Where
						(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0)  and
						flEliminar=0  and
                        flAnulado = @flAnulado_param and
                        flAnulado=@flAnulado_param and
                        flCompensado=@flCompensado_param  and
                        dtcupon>=@dtCupon_desde_param and
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900)
                    GROUP BY nrLicencia
	       order by nrLicencia
            Else
	       -- viajes que fueron facturados (pagados o sin pagar) al Licenciatario
                    select nrLicencia,
                            min(nmLicenciatario) as Licenciatario,
                            COUNT(*) AS CantidadViajes,
                            SUM(vlMontoCupon) as vlSumaPesos ,
                            sum(vlComision) as vlSumaComision,
                            (SUM(vlMontoCupon) - sum(vlComision) - sum(isnull(vlIVA,0)) ) as vlTotalaFacturar,
			    sum(isnull(vlIVA,0))		vlSumaIVA
                    From TB_Cupones
                    Where
						(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0)  and
						flEliminar=0  and
                        flAnulado = @flAnulado_param and
                        flAnulado=@flAnulado_param and
                        dtcupon>=@dtCupon_desde_param and
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and
			((@flNoPagados_param=1 and flCompensado=0) OR 
			(@flNoPagados_param=0))
                    GROUP BY nrLicencia
	       order by nrLicencia
    End
    Else
    begin
	-- 
        if @flAgrupado=0
        begin
                if @flCompensado_param=1
                    select   nrCupon,
                               nrLicencia,
                               nmLicenciatario,
                               tpCupon,
                               vlMontoCupon,
                               vlPagoPesos,
                               vlPagoEuros,
                               vlPagoDolares,
                               vlComision,
							   isnull(vlIVA,0) as vlIVA,
                               vlComision + isnull(vlIVA,0) as vlRetencion,
                               dtCupon,
                               nrTalonarioCliente,
                               nrComprabanteCliente,
                               flCompensado,
                               nrCajaCliente,
                               nrCajaLicenciatario,
                               dtCompensado,
                               dsUsuario,
                               dsObservacion,
                               dsDestino,
                               dsHoraViaje,
			       flPosee_obs = CASE dsObservacion
					WHEN null then 0
					WHEN '' then 0
				        ELSE 1 
				    END,		
					dsLeyenda                        
			    From TB_Cupones
                            Where
							  (vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0)  and
							   flEliminar=0  and
                               flAnulado = @flAnulado_param and
                               nrLicencia=@nrLicencia_param and
                               flAnulado=@flAnulado_param and
	                       flCompensado=@flCompensado_param  and
			       dtcupon>=@dtCupon_desde_param and
                               dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900)
                        order by nrLicencia,dtCupon
                Else
                        select   nrCupon,
                                 nrLicencia,
                                 nmLicenciatario,
                                 tpCupon,
                                 vlMontoCupon,
                                 vlPagoPesos,
								 vlPagoEuros,
								 vlPagoDolares,
                                 vlComision,
							     isnull(vlIVA,0) as vlIVA,
                                 vlComision + isnull(vlIVA,0) as vlRetencion,
                                 dtCupon,
                                 nrTalonarioCliente,
                                 nrComprabanteCliente,
                                 flCompensado,
                                 nrCajaCliente,
                                 nrCajaLicenciatario,
                                 dtCompensado,
                                 dsUsuario,
                                 dsObservacion,
                                 dsDestino,
                                 dsHoraViaje,
								 flPosee_obs = CASE dsObservacion
									WHEN null then 0
									WHEN '' then 0
										ELSE 1 
									END,	
								 dsLeyenda	 
                               From TB_Cupones
                            Where
								(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0) and 
	  							 flEliminar=0  and
                                 flAnulado = @flAnulado_param and
                                 nrLicencia=@nrLicencia_param and
                                 flAnulado=@flAnulado_param and
			         dtcupon>=@dtCupon_desde_param and
                                 dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and
				((@flNoPagados_param=1 and flCompensado=0) OR 
				(@flNoPagados_param=0))
                            order by nrLicencia, dtCupon
			
        End
        else -- Agrupado
                if @flCompensado_param=1
                    select nrLicencia,
                            min(nmLicenciatario) as Licenciatario,
                            COUNT(*) AS CantidadViajes,
                            SUM(vlMontoCupon) as vlSumaPesos ,
                            sum(vlComision) as vlSumaComision,
                            (SUM(vlMontoCupon) - sum(vlComision) - sum(isnull(vlIVA,0)) ) as vlTotalaFacturar,
			    sum(isnull(vlIVA,0))		vlSumaIVA
                    From TB_Cupones
                    Where
						(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0) and 
						flEliminar=0  and
                        flAnulado = @flAnulado_param and
                        nrLicencia=@nrLicencia_param and
                        flAnulado=@flAnulado_param and
                        flCompensado=@flCompensado_param  and
                        dtcupon>=@dtCupon_desde_param and
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900)
                    GROUP BY nrLicencia
	      order by nrLicencia
                Else
                    select  nrLicencia,
                            min(nmLicenciatario) as Licenciatario,
                            COUNT(*) AS CantidadViajes,
                            SUM(vlMontoCupon) as vlSumaPesos ,
                            sum(vlComision) as vlSumaComision,
                            (SUM(vlMontoCupon) - sum(vlComision) - sum(isnull(vlIVA,0)) ) as vlTotalaFacturar,
			    sum(isnull(vlIVA,0))		vlSumaIVA
                    From TB_Cupones
                    Where
						(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0) and 
						flEliminar=0  and
                        flAnulado = @flAnulado_param and
                        nrLicencia=@nrLicencia_param and
                        flAnulado=@flAnulado_param and
                        dtcupon>=@dtCupon_desde_param and
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and
			((@flNoPagados_param=1 and flCompensado=0) OR 
			(@flNoPagados_param=0))
                    GROUP BY nrLicencia
	      order by nrLicencia
    End




go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_rpt_recaudacion_v3_5]'))
drop procedure [dbo].[SP_rpt_recaudacion_v3_5]

go



CREATE procedure [dbo].[SP_rpt_recaudacion_v3_5]   (@dtCupon_desde_param DATETIME,
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


go 


/*

Exec  SP_rpt_recaudacion_v3_5 @dtCupon_desde_param='01-01-2010 00:00:00.000',@dtCupon_hasta_param='31-01-2010 23:59:59.999', @nrLicencia_param=0

set dateformat dmy

declare @dtCupon_desde_param datetime
declare @dtCupon_hasta_param datetime

set @dtCupon_desde_param='01-01-2010 00:00:00.000'
set @dtCupon_hasta_param='31-01-2010 23:59:59.999'

select @dtCupon_hasta_param + 1


select year(@dtCupon_hasta_param)
select month(@dtCupon_hasta_param)
select day(@dtCupon_hasta_param)

select convert(numeric, convert(varchar,@dtCupon_hasta_param,112)) 

select convert(varchar,@dtCupon_hasta_param)

*/










