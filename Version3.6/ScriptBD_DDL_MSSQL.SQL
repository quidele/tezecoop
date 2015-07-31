-- Cambios de DDL version 3.6
use dbSG2000
go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_TB_Cupones_Qry_v3_6]'))
drop procedure [dbo].[SP_TB_Cupones_Qry_v3_6]

go

-- Modificado version 1.6
-- Todos los viajes pagados al Licenciatario @flCompensado_param=1
-- Todos lo Viajes Facturados al Licenciatario @flCompensado_param=0
CREATE procedure [dbo].[SP_TB_Cupones_Qry_v3_6]
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
            begin
				-- viajes que fueron pagados al licenciatario	
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
                        tpComprobanteCliente,
                        tpLetraCliente,
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
				into #tmp_cupones		
                From TB_Cupones
                Where
                    flAnulado = @flAnulado_param and
                    flAnulado=@flAnulado_param and
                    flCompensado=@flCompensado_param  and
                    dtcupon>=@dtCupon_desde_param and
                    dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and
				    flEliminar=0 and vlMontoCupon>@vlMontoCupon_param
                order by nrLicencia, dtCupon
                
                select a.*, b.flmanual from #tmp_cupones a, TB_Comprobantes b 
                where a.nrComprabanteCliente = b.nrComprobante and 
                      a.nrTalonarioCliente =   b.nrTalonario and
                      a.tpComprobanteCliente = b.tpComprobante and 
                      a.tpLetraCliente = b.tpLetra
                      
            end    
            Else
            begin
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
                    tpComprobanteCliente,
                    tpLetraCliente,
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
					into #tmp_cupones1
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
                    
                            
                select a.*, b.flmanual from #tmp_cupones1 a, TB_Comprobantes b 
                where a.nrComprabanteCliente = b.nrComprobante and 
                      a.nrTalonarioCliente =   b.nrTalonario and
                      a.tpComprobanteCliente = b.tpComprobante and 
                      a.tpLetraCliente = b.tpLetra
                              
        end            
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
                begin
                
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
                               tpComprobanteCliente,
							   tpLetraCliente,
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
			    into #tmp_cupones2
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
					
					select a.*, b.flmanual from #tmp_cupones2 a, TB_Comprobantes b 
					where a.nrComprabanteCliente = b.nrComprobante and 
						  a.nrTalonarioCliente =   b.nrTalonario and
						  a.tpComprobanteCliente = b.tpComprobante and 
						  a.tpLetraCliente = b.tpLetra
	                              

                end        
                Else
                begin
                
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
                                 tpComprobanteCliente,
								 tpLetraCliente,
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
							into #tmp_cupones3 	 
                            From TB_Cupones
                            Where
								(vlMontoCupon >= @vlMontoCupon_param or @vlMontoCupon_param = 0) and 
	  							 flEliminar=0  and
                                 flAnulado  = @flAnulado_param and
                                 nrLicencia = @nrLicencia_param and
                                 flAnulado = @flAnulado_param and
			         dtcupon>=@dtCupon_desde_param and
                                 dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and
				((@flNoPagados_param=1 and flCompensado=0) OR 
				(@flNoPagados_param=0))
                            order by nrLicencia, dtCupon
                
                select a.*, b.flmanual from #tmp_cupones3 a, TB_Comprobantes b 
                where a.nrComprabanteCliente = b.nrComprobante and 
                      a.nrTalonarioCliente =   b.nrTalonario and
                      a.tpComprobanteCliente = b.tpComprobante and 
                      a.tpLetraCliente = b.tpLetra
                              
			end
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
 
 
set dateformat dmy
    

Exec  SP_TB_Cupones_Qry_v3_6 @dtCupon_desde_param='07-12-2009 00:00:00.000',@dtCupon_hasta_param='18-07-2010 23:59:59.000',@nrLicencia_param=0,@flAnulado_param=0,@flCompensado_param=0,@flNoPagados_param=0,@flAgrupado=0,@vlMontoCupon_param=0
     
    