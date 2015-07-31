-- cambios de DDL version 1.6
use dbSG2000
go


-- MSSQL version 1.6
ALTER TABLE [dbo].[tb_productos] ADD 
	[vlPrecioxKilometro] [float] NULL;


go


ALTER procedure SP_CalcularIVA
@tpCategoriaIVA_param varchar(5),
@vlMonto_param float,
@vlAlicuota_param float,
@precio_menos_iva_param int=1
as
begin
declare @vlSubtotal float

	if @precio_menos_iva_param=1
	begin
		if @vlAlicuota_param>=1
			set @vlAlicuota_param=@vlAlicuota_param/100
		
		set @vlSubtotal = @vlMonto_param / (@vlAlicuota_param + 1)
	        select @vlSubtotal * @vlAlicuota_param as  IVA
	end

	if @precio_menos_iva_param=0
	begin
		if @vlAlicuota_param>=1
			set @vlAlicuota_param=@vlAlicuota_param/100
		
		set @vlSubtotal =@vlMonto_param * @vlAlicuota_param 
	        select @vlSubtotal  as IVA
	end


end 

go

alter PROCEDURE [dbo].[sco_TB_Productos] AS
	
	select  cdProducto,
	        dsProducto,
	        vlPrecioViaje,
	        vlPrecioPeaje, 
	        vlPorcentaje, 
	        tpOperacion,
		flMuestra, 
		vlKilometros
	FROM TB_Productos
	where flEliminar=0 and
	      flMuestra=1
	Order by dsProducto;

go



-- Modificado version 1.6
-- Todos los viajes pagados al Licenciatario @flCompensado_param=1
-- Todos lo Viajes Facturados al Licenciatario @flCompensado_param=0
alter procedure dbo.SP_TB_Cupones_Qry_v1_6
@dtCupon_desde_param datetime,
@dtCupon_hasta_param datetime,
@nrLicencia_param    int=0,
@flAnulado_param     bit=0,
@flCompensado_param  bit=1,
@flNoPagados_param   bit=1,
@flAgrupado          int=0,
@vlMontoCupon_param  int=-1
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
				    END			
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
				    END			
                    From TB_Cupones
                    Where
			vlMontoCupon>@vlMontoCupon_param and
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
			vlMontoCupon>@vlMontoCupon_param and
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
		        vlMontoCupon>@vlMontoCupon_param and
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
				    END		
                            From TB_Cupones
                            Where
			       vlMontoCupon>@vlMontoCupon_param and
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
				    END		 
                               From TB_Cupones
                            Where
				 vlMontoCupon>@vlMontoCupon_param and 
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
			vlMontoCupon>@vlMontoCupon_param and
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
			vlMontoCupon>@vlMontoCupon_param and
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



DROP VIEW dbo.VW_DetalleMovimientosContablesCupones;

go 

CREATE VIEW dbo.VW_DetalleMovimientosContablesCupones
AS
SELECT DISTINCT 
                      dbo.TB_MovimientosContables.tpOperacion, dbo.TB_MovimientosContables.nrCaja, dbo.TB_MovimientosContables.dsConcepto, 
                      dbo.TB_Cupones.nrLicencia, dbo.TB_Cupones.tpCupon, dbo.TB_Cupones.nrTalonarioCliente, dbo.TB_Cupones.nrComprabanteCliente, 
                      dbo.TB_Cupones.vlPagoPesos AS vlPesos, dbo.TB_Cupones.vlPagoDolares AS vlDolares, dbo.TB_Cupones.vlPagoEuros AS vlEuros, 
                      dbo.TB_Cupones.vlComision, dbo.TB_Cupones.vlMontoCupon, dbo.TB_MovimientosContables.nrRecibo, dbo.TB_Cupones.flCompensado, 
                      dbo.TB_Cupones.dtCompensado, dbo.TB_MovimientosContables.dsUsuario, dbo.TB_Cupones.vlIVA
FROM         dbo.TB_MovimientosContables INNER JOIN
                      dbo.TB_Cupones ON dbo.TB_MovimientosContables.IdRecibo = dbo.TB_Cupones.IdRecibo

	







