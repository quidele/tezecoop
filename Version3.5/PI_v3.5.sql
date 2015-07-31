

Resumenes de Licenciatarios
Exec  SP_TB_Cupones_Qry_v3_5 @dtCupon_desde_param='01-01-2010 00:00:00.000',@dtCupon_hasta_param='30-05-2010 23:59:59.999',@nrLicencia_param=0,@flAnulado_param=0,@flCompensado_param=0,@flNoPagados_param=0,@flAgrupado=1,@vlMontoCupon_param=0

Resumenes Recaudaciones
 Exec  SP_rpt_recaudacion_v3_5 @dtCupon_desde_param='01-01-2010 00:00:00.000',@dtCupon_hasta_param='30-05-2010 23:59:59.999'

sp_helptext 'SP_TB_Cupones_Qry_v3_5'

sp_helptext 'SP_rpt_recaudacion_v3_5'


---Recaudacion Febrero 2010

set dateformat dmy

Exec  SP_TB_Cupones_Qry_v3_5 @dtCupon_desde_param='01/02/2010 00:00:00.000',@dtCupon_hasta_param='28/02/2010 23:59:59.999',@nrLicencia_param=0,@flAnulado_param=0,@flCompensado_param=0,@flNoPagados_param=0,@flAgrupado=0,@vlMontoCupon_param=0



---Resumenes Recaudaciones
 Exec  SP_rpt_recaudacion_v3_5 @dtCupon_desde_param='01/02/2010 00:00:00.000',@dtCupon_hasta_param='28/02/2010 23:59:59.999'


go

set dateformat dmy


Exec  SP_TB_Cupones_Qry_v3_5 @dtCupon_desde_param='01-12-2009 00:00:00.000',@dtCupon_hasta_param='31-12-2009 23:59:59.999',@nrLicencia_param=0,@flAnulado_param=0,@flCompensado_param=0,@flNoPagados_param=0,@flAgrupado=0,@vlMontoCupon_param=0
Exec  SP_rpt_recaudacion_v3_5 @dtCupon_desde_param='01-12-2009 00:00:00.000',@dtCupon_hasta_param='31-12-2009 23:59:59.999'

go
sp_helptext SP_rpt_recaudacion_v3_5

Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


set dateformat dmy

	select		nrCupon,  
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
					WHEN '' then   0  
							ELSE   1   
					END,     
					dsLeyenda  
	from   tb_cupones
	where dtCupon >= '01-12-2009 00:00:00.000' and 
		  dtCupon <= '31-12-2009 23:59:59.999' and
           flAnulado = 0 and 
           nrLicencia not in (999,900) and 
           flEliminar=0





Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create procedure SP_rpt_recaudacion_v3_5   (@dtCupon_desde_param datetime,
					    @dtCupon_hasta_param datetime)
as
begin
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
	where  dtCupon >= @dtCupon_desde_param  and 
	       dtCupon <= @dtCupon_hasta_param  and 
           flAnulado = 0 and 
           nrLicencia not in (999,900)		
	group by tpCupon





end

