-- Cambios de DDL version 3.8
use dbSG2000
go


/****** Object:  Table [dbo].[TB_Auditorias]    Script Date: 04/05/2011 22:55:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_Auditorias]') AND type in (N'U'))
DROP TABLE [dbo].[TB_Auditorias]
GO


/****** Object:  Table [dbo].[TB_Auditorias]    Script Date: 04/05/2011 22:55:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_Auditorias](
	[IdAuditoria] [int] IDENTITY(1,1) NOT NULL,
	[Modulo] [varchar](50) NULL,
	[funcion] [varchar](50) NULL,
	[dsAuditoria] [varchar](300) NULL,
	[dsUsuario] [varchar](50) NULL,
	[nrCaja] [numeric](18, 0) NULL,
	[tsAuditoria] [datetime] NULL,
	[dtAuditoria] [date] NULL,
	[nrPuesto] [int] NULL,
 CONSTRAINT [PK_TB_Auditorias] PRIMARY KEY CLUSTERED 
(
	[IdAuditoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Index [IX_TB_Auditorias_caja]    Script Date: 04/05/2011 22:59:05 ******/
CREATE NONCLUSTERED INDEX [IX_TB_Auditorias_caja] ON [dbo].[TB_Auditorias] 
(
	[nrCaja] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_TB_Auditorias_fecha]    Script Date: 04/05/2011 22:59:05 ******/
CREATE NONCLUSTERED INDEX [IX_TB_Auditorias_fecha] ON [dbo].[TB_Auditorias] 
(
	[dtAuditoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO



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
                        vlPagoReales,
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
                    vlPagoReales,
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
                               vlPagoReales,
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
								 vlPagoReales,
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








