
EXEC SP_ResumenCajaADM_v2_9		@tpCajaImputacion_param =null ,
						@nrCaja_param =9000002030,
						@tpCaja_param = null

go


ALTER procedure [dbo].[SP_ResumenCajaADM_v2_9]
						@tpCajaImputacion_param as varchar(50)=null,
						@nrCaja_param numeric,
						@tpCaja_param char(2)=null
AS

	if @tpCaja_param is null
		set @tpCaja_param='CA'
	

	SELECT a.cdConcepto, a.tpOperacion, a.nrCaja, b.tpCajaImputacion, a.dsConcepto, SUM(vlPesos) 
		AS SumaPesos, SUM(vlDolares) AS SumaDolares, 
		SUM(vlEuros) AS SumaEuros
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
	where	a.cdConcepto = b.cdConcepto      and
		    (
				 (@tpCaja_param='CC'  and b.flOcultadoCajaCooperativa=0) or			 
				 (@tpCaja_param='CL'  and b.flOcultadoCajaLicenciatario=0) or
				 (@tpCaja_param='CA'  and b.flOcultadoenCajaAdm=0) or
				 (@tpCaja_param is null)
		    )
			and a.nrCaja =  @nrCaja_param 
			and (b.tpCajaImputacion= @tpCajaImputacion_param or @tpCajaImputacion_param is null)
	GROUP BY a.cdConcepto, a.tpOperacion, a.nrCaja, a.dsConcepto,  b.tpCajaImputacion



