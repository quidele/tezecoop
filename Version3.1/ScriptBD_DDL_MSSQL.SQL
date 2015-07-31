-- Cambios de DDL version 3.1
use dbSG2000
go


ALTER procedure [dbo].[SP_SumaCajaADM_v2_9]
						@nrCaja_param numeric,
						@tpCaja_param char(2)=null,
						@tpCajaImputacion_param varchar(50)=null
AS


	if @tpCajaImputacion_param =''
		set @tpCajaImputacion_param = null

	if @tpCaja_param is null
		set @tpCaja_param='CA'
	
	if @tpCaja_param =''
		set @tpCaja_param='CA'

	SELECT SUM(a.vlPesos) AS SumaPesos, SUM(a.vlDolares) 
	    AS SumaDolares, SUM(a.vlEuros) AS SumaEuros, a.tpOperacion, 
	    a.nrCaja
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
		where	a.cdConcepto = b.cdConcepto      and
				(
					 (@tpCaja_param='CC'  and b.flSumaenCajaCooperativa=1) or			 
					 (@tpCaja_param='CL'  and b.flSumaenCajaLicenciatarios=1) or
					 (@tpCaja_param='CA'  and b.flSumaenCajaAdm=1) 
				)
			and (b.tpCajaImputacion=@tpCajaImputacion_param or @tpCajaImputacion_param is null)
			and a.nrCaja =  @nrCaja_param 
	GROUP BY a.tpOperacion, a.nrCaja


 
go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_obtenerRetenciones_v3_1]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_obtenerRetenciones_v3_1]


go

-- crear un store procedure para para obtener en detalle de las comisiones de la caja diara de la administración 
create procedure [dbo].[SP_obtenerRetenciones_v3_1] (@nrCaja_param numeric)
as
begin

	SELECT isnull(SUM(a.vlPesos),0) AS vlSumaPesos, 
	       isnull(SUM(a.vlDolares),0) as vlSumaDolares, 
	       isnull(SUM(a.vlEuros),0) AS vlSumaEuros
	FROM dbo.TB_MovimientosContables a
		where	a.cdConcepto in (2010,2014,2015,2019)
			and a.nrCaja =  @nrCaja_param 
	GROUP BY a.tpOperacion, a.nrCaja


end

go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_obtenerCajasPuestosImputadas_v3_1]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_obtenerCajasPuestosImputadas_v3_1]


go 

-- store procedure para para obtener en las cajas puestos en la caja diara de la administración 
create procedure [dbo].[SP_obtenerCajasPuestosImputadas_v3_1] (@nrCaja_param numeric, @flSumatorio_param as int=0)
as
begin
declare @nombre   varchar(50)
declare @apellido varchar(50)


	select 	@nombre   = b.nmNombre,
		@apellido = b.nmApellido
		from    tb_Cajas a, TB_Usuarios b
		where   a.dsUsuario = b.dsUsuario and
			a.nrCaja    = @nrCaja_param

	SELECT nrCajaPuesto  into #tmpCajaPuestosImputadas
	FROM dbo.TB_MovimientosContables a
		where	a.nrCaja =  @nrCaja_param 
			and a.nrCajaPuesto is not null
	GROUP BY nrCajaPuesto

	if @flSumatorio_param=0
		select  @nrCaja_param as nrCaja,
			a.nrCaja as nrCajaPuesto,
			a.dtApertura,
			a.dtCierre,
			c.nmNombre, 
			c.nmApellido, 
			a.vlCierrePesos,
			a.vlCierreDolares,
			a.vlCierreEuros,
			a.dsDiferenciaDeCierre,
			a.vlDiferenciaDeCierre,
			a.vlDiaEuro,
			a.vlDiaDolar,
			@nombre     as nombreUsuarioAdm,
			@apellido   as apellidoUsuarioAdm
		from    tb_Cajas a, #tmpCajaPuestosImputadas b, TB_Usuarios c
		where   a.nrCaja = b.nrCajaPuesto and
			a.dsUsuario = c.dsUsuario
	else
		select  isnull(sum(vlCierrePesos),0)        as vlSumaCierrePesos,
			isnull(sum(vlCierreDolares),0)      as vlSumaCierreDolares,
			isnull(sum(vlCierreEuros),0)        as vlSumaCierreEuros,
			isnull(sum(vlDiferenciaDeCierre),0) as vlSumaDiferenciaDeCierre
		from   tb_Cajas a, #tmpCajaPuestosImputadas b
		where  a.nrCaja = b.nrCajaPuesto


end


go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_rpt_resumendecajaadm_v3_1]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_rpt_resumendecajaadm_v3_1]

go


CREATE procedure SP_rpt_resumendecajaadm_v3_1
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
		@vlSumaDiferenciaDeCierre as 'vlSumaCajasPuestosDiferenciaDeCierre'
	FROM #tmp_ResumenCajaADM_SinPesificar a, tb_cajas b, TB_Usuarios c
	WHERE   a.nrCaja    = b.nrCaja and
		b.dsUsuario = c.dsUsuario
	ORDER BY a.tpOperacion asc

end

go 
--TU 
exec SP_rpt_resumendecajaadm_v3_1
						@nrCaja_param =2000002239,
						@tpCaja_param ='CA',
						@tpCajaImputacion_param =null




	SELECT *
	FROM dbo.TB_MovimientosContables a
		where	a.cdConcepto in (2010,2014,2015,2019)
			and a.nrCaja =  2000002239 



go


-- crear un sp que obtenga los montos de dinero imputados desde la caja puesto a la caja de la administracion imprimir estos valores en la caja de la
-- en el formulario de cierre de la caja de la administracion
-- crear un store procedure que informe los valores que provienen de una caja puesto dinero a imputarse


go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_DetalleMovimientosContables_v3_1]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_DetalleMovimientosContables_v3_1]


go


CREATE VIEW dbo.VW_DetalleMovimientosContables_v3_1
AS

	SELECT  tpOperacion, 
		nrCaja, 
		dsConcepto, 
		vlPesos, 
		vlDolares, 
		vlEuros, 
		nrRecibo, 
		dtMovimiento, 
		dsProveedor, 
		nrFactura, 
		dsUsuario, 
		nrCajaPuesto, 
	    tpCajaImputacion, 
	    dsUsuarioCajaPuesto
	FROM  dbo.TB_MovimientosContables

go
