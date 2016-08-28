-- Cambios de DDL version 4.9.2
use dbSG2000
go

/*

select  top 10 nrCaja,  * from TB_MovimientosContables order by dtMovimiento desc 
exec SP_rpt_resumendecajaadm_v4_9  9000003773

*/


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_rpt_resumendecajaadm_v4_9' )
	drop procedure  dbo.SP_rpt_resumendecajaadm_v4_9

go



CREATE procedure SP_rpt_resumendecajaadm_v4_9
						@nrCaja_param numeric,
						@tpCaja_param char(2)=null,
						@tpCajaImputacion_param varchar(50)=null
as
begin
declare @vlSaldoInicialPesos   as float
declare @vlSaldoInicialDolares as float
declare @vlSaldoInicialEuros   as float
declare @vlSaldoCierrePesos    as float


	if @tpCaja_param is null
		set @tpCaja_param='CA'
	
	if @tpCaja_param =''
		set @tpCaja_param='CA'
	
	if @tpCajaImputacion_param=''  
		set @tpCajaImputacion_param=null


	CREATE TABLE #temp_SaldoInicial (
		[vlSaldoInicialPesos] [float] NULL ,
		[vlSaldoInicialDolares] [float] NULL ,
		[vlSaldoInicialEuros] [float] NULL 
	) 
 
	insert into #temp_SaldoInicial exec SP_CalculaSaldoInicial_v2_9 @nrCaja_param=@nrCaja_param,
									@tpCaja_param=@tpCaja_param,
									@tpCajaImputacion_param=@tpCajaImputacion_param

	CREATE TABLE #temp_SaldoCierre (
		[vlSaldoCierrePesos] [float] NULL 
	)

	insert into #temp_SaldoCierre exec SP_CalculaSaldoCierre_v2_9 @nrCaja_param=@nrCaja_param,
									@tpCaja_param=@tpCaja_param,
									@tpCajaImputacion_param=@tpCajaImputacion_param
		

	select top 1 @vlSaldoCierrePesos=vlSaldoCierrePesos 
	from   #temp_SaldoCierre;
 
	select top 1   @vlSaldoInicialPesos=vlSaldoInicialPesos,
		       @vlSaldoInicialDolares=vlSaldoInicialDolares,
		       @vlSaldoInicialEuros=vlSaldoInicialEuros 
	from #temp_SaldoInicial

	declare @vlSaldoPesosComision   as float
	declare @vlSaldoDolaresComision as float
	declare @vlSaldoEurosComision   as float

	---obtencion del saldo ingresado en conceptos de comisiones
	CREATE TABLE #temp_SaldoComisiones (
		[vlSumaPesos] [float] NULL ,
		[vlSumaDolares] [float] NULL ,
		[vlSumaEuros] [float] NULL 
	) 


	insert into #temp_SaldoComisiones exec SP_obtenerRetenciones_v3_1  @nrCaja_param=@nrCaja_param

	select	 @vlSaldoPesosComision = vlSumaPesos,
		 @vlSaldoDolaresComision = vlSumaDolares,
		 @vlSaldoEurosComision = vlSumaEuros
	from #temp_SaldoComisiones



	-------------------------------------------------------------------------------------------
	--- INICIO - obtencion del saldo de las cajas imputadas 
	declare @vlSumaCierrePesos   as float
	declare @vlSumaCierreDolares as float
	declare @vlSumaCierreEuros   as float
	declare @vlSumaDiferenciaDeCierre   as float
	
	CREATE TABLE #temp_CajasPuestosImputadas (
		vlSumaCierrePesos  [float] NULL ,
		vlSumaCierreDolares [float] NULL , 
		vlSumaCierreEuros  [float] NULL ,
		vlSumaDiferenciaDeCierre [float] NULL 
	) 

	insert into #temp_CajasPuestosImputadas exec SP_obtenerCajasPuestosImputadas_v3_1  @nrCaja_param=@nrCaja_param,@flSumatorio_param=1

	select	 @vlSumaCierrePesos= vlSumaCierrePesos,
		 @vlSumaCierreDolares = vlSumaCierreDolares,
		 @vlSumaCierreEuros = vlSumaCierreEuros,
		 @vlSumaDiferenciaDeCierre = vlSumaDiferenciaDeCierre
	from #temp_CajasPuestosImputadas
	--- FIN - obtencion del saldo de las cajas imputadas 
	-------------------------------------------------------------------------------------------


	SELECT a.tpOperacion, a.nrCaja, b.tpCajaImputacion, a.dsConcepto, SUM(vlPesos) 
		AS SumaPesos, SUM(vlDolares) AS SumaDolares, 
		SUM(vlEuros) AS SumaEuros into  #tmp_ResumenCajaADM_SinPesificar
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
	where	a.cdConcepto = b.cdConcepto      and
		    (
				 (@tpCaja_param='CC'  and b.flSumaenCajaCooperativa=1 and b.flOcultadoCajaCooperativa=0) or			 
				 (@tpCaja_param='CL'  and b.flSumaenCajaLicenciatarios=1 and b.flOcultadoCajaLicenciatario=0) or
				 (@tpCaja_param='CA'  and b.flSumaenCajaAdm=1 and b.flOcultadoenCajaAdm=0) 
		    )
			and a.nrCaja =  @nrCaja_param 
			and (b.tpCajaImputacion= @tpCajaImputacion_param or @tpCajaImputacion_param is null)
	GROUP BY a.tpOperacion, a.nrCaja, a.dsConcepto,  b.tpCajaImputacion

	-- obtener informacion de tajetas 


	select tpCupon , sum(vlMontoCupon) as suma_vlMontoCupon , sum(vlRecargoTarjeta) as suma_vlRecargoTarjeta, count(*) cantViajes
	into #tmpViajesenTarjeta 
	from TB_Cupones where  nrCajaLicenciatario =  @nrCaja_param and tpCupon in ('Tarjeta de Crédito', 'Tarjeta de Débito')
	and flCompensado = 1 and flAnulado = 0 
	group by tpCupon

	
	declare @suma_vlMontoCupon_TD   as float
	declare @suma_vlRecargoTarjeta_TD as float
	declare @cantViajes_TD   as float

	declare @suma_vlMontoCupon_TC   as float
	declare @suma_vlRecargoTarjeta_TC as float
	declare @cantViajes_TC   as float

	
	select  @suma_vlMontoCupon_TD =  suma_vlMontoCupon ,  @suma_vlRecargoTarjeta_TD =  suma_vlRecargoTarjeta,
			@cantViajes_TD   = cantViajes
	from #tmpViajesenTarjeta where tpCupon = 'Tarjeta de Débito'

		select  @suma_vlMontoCupon_TC =  suma_vlMontoCupon ,  @suma_vlRecargoTarjeta_TC =  suma_vlRecargoTarjeta,
			@cantViajes_TC   = cantViajes
	from #tmpViajesenTarjeta where tpCupon = 'Tarjeta de Crédito'


	-- Agregar valor de comisiones
	SELECT  c.nmNombre, 
		c.nmApellido, 
		a.tpOperacion, 
		a.nrCaja, 
		a.dsConcepto, 
		a.SumaPesos, 
		a.SumaDolares, 
		a.SumaEuros, 
		Convert (varchar,b.dtApertura,103) as  'dtApertura',
	        @vlSaldoInicialPesos   as 'vlSaldoInicialPesos',
	        @vlSaldoInicialDolares as 'vlSaldoInicialDolares',
	        @vlSaldoInicialEuros   as 'vlSaldoInicialEuros',
		b.vlSaldoFinalRealPesos, 
		b.vlSaldoFinalRealEuros, 
		b.vlSaldoFinalRealDolares, 
		b.vlCierrePesos, 
		b.vlCierreDolares, 
		b.vlCierreEuros, 
		@vlSaldoCierrePesos + @vlSaldoInicialPesos as 'vlTotalSaldoFinalReal', 
		@vlSaldoCierrePesos as 'vlTotalSaldoFinal', 
		b.vlDiaDolar, 
		b.vlDiaEuro, 
		b.dsObservacion,
		Convert (varchar,b.dtObservacion,103) as  'dtObservacion',
		isnull(@vlSaldoPesosComision,0)   as 'vlSaldoPesosComision',
		isnull(@vlSaldoDolaresComision,0) as 'vlSaldoDolaresComision',
	 	isnull(@vlSaldoEurosComision,0)   as 'vlSaldoEurosComision',
		@vlSumaCierrePesos      as 'vlSumaCajasPuestosCierrePesos',
	 	@vlSumaCierreDolares    as 'vlSumaCajasPuestosCierreDolares',
	 	@vlSumaCierreEuros      as 'vlSumaCajasPuestosCierreEuros',
		@vlSumaDiferenciaDeCierre as 'vlSumaCajasPuestosDiferenciaDeCierre',
		isnull(@suma_vlMontoCupon_TD,0)	as	suma_vlMontoCupon_TD	,
		isnull(@suma_vlRecargoTarjeta_TD,0)	as	suma_vlRecargoTarjeta_TD	,
		isnull(@cantViajes_TD,0)	as	cantViajes_TD	,
		isnull(@suma_vlMontoCupon_TC,0)	as	suma_vlMontoCupon_TC	,
		isnull(@suma_vlRecargoTarjeta_TC,0)	as	suma_vlRecargoTarjeta_TC	,
		isnull(@cantViajes_TC,0)	as	cantViajes_TC	
	FROM #tmp_ResumenCajaADM_SinPesificar a, tb_cajas b, TB_Usuarios c
	WHERE   a.nrCaja    = b.nrCaja and
		b.dsUsuario = c.dsUsuario
	ORDER BY a.tpOperacion asc

end



go



sp_helptext '#tmp_ResumenCajaADM_SinPesificar'



	


