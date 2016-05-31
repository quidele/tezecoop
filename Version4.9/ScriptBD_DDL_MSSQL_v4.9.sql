-- Cambios de DDL version 4.9
use dbSG2000
go



ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF_TB_Productos_Historico_fecha_insercion]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF__TB_Produc__flInc__5927012F]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF__TB_Produc__flMue__5832DCF6]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF__TB_Produc__flEli__573EB8BD]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF_TB_ProductosHistorico_flMuestra]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF_TB_ProductosHistorico_tpOperacion]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF_TB_ProductosHistorico_vlPorcentaje]
GO

/****** Object:  Table [dbo].[TB_Productos_Historico]    Script Date: 14/04/2016 16:55:11 ******/
DROP TABLE [dbo].[TB_Productos_Historico]
GO

/****** Object:  Table [dbo].[TB_Productos_Historico]    Script Date: 14/04/2016 16:55:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_Productos_Historico](
	[idtabla] [int] IDENTITY(1,1) NOT NULL,
	[cdProducto] [int] NOT NULL,
	[dsProducto] [varchar](200) NULL,
	[vlPrecioViaje] [float] NULL,
	[vlPrecioPeaje] [float] NULL,
	[obsHoras] [varchar](50) NULL,
	[vlPorcentaje] [int] NULL,
	[tpOperacion] [varchar](20) NULL,
	[flMuestra] [bit] NOT NULL,
	[cdOrden] [varchar](1) NULL,
	[vlPrecioViajeSinPeaje] [float] NULL,
	[vlKilometros] [float] NULL,
	[dtActualizacion] [datetime] NULL,
	[flEliminar] [bit] NULL,
	[vlPrecioxKilometro] [float] NULL,
	[flMuestraenlaWEB] [bit] NULL,
	[flIncluyeComisionRetorno] [bit] NULL,
	[tpDestino] [varchar](20) NULL,
	[cdComision] [int] NULL,
	[fecha_insercion] [datetime] NULL,
 CONSTRAINT [PK__TB_ProductosHistorico__73DA2C14] PRIMARY KEY NONCLUSTERED 
(
	[idtabla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF_TB_ProductosHistorico_vlPorcentaje]  DEFAULT ((0)) FOR [vlPorcentaje]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF_TB_ProductosHistorico_tpOperacion]  DEFAULT ('Viaje') FOR [tpOperacion]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF_TB_ProductosHistorico_flMuestra]  DEFAULT ((1)) FOR [flMuestra]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF__TB_Produc__flEli__573EB8BD]  DEFAULT ((0)) FOR [flEliminar]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF__TB_Produc__flMue__5832DCF6]  DEFAULT ((0)) FOR [flMuestraenlaWEB]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF__TB_Produc__flInc__5927012F]  DEFAULT ((0)) FOR [flIncluyeComisionRetorno]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF_TB_Productos_Historico_fecha_insercion]  DEFAULT (getdate()) FOR [fecha_insercion]
GO



GO

/****** Object:  Trigger [delupd_tb_productos]    Script Date: 14/04/2016 16:54:26 ******/
DROP TRIGGER [dbo].[delupd_tb_productos]
GO

/****** Object:  Trigger [dbo].[delupd_tb_productos]    Script Date: 14/04/2016 16:54:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<QUIDEL, Eulises>
-- Create date: <14-04-2016>
-- Description:	<Graba Historico por si hay que recuperar información>
-- =============================================
CREATE TRIGGER [dbo].[delupd_tb_productos]
   ON  [dbo].[TB_Productos]
   AFTER DELETE,UPDATE
AS 
BEGIN

	insert into dbo.TB_Productos_Historico ([cdProducto]
      ,[dsProducto]
      ,[vlPrecioViaje]
      ,[vlPrecioPeaje]
      ,[obsHoras]
      ,[vlPorcentaje]
      ,[tpOperacion]
      ,[flMuestra]
      ,[cdOrden]
      ,[vlPrecioViajeSinPeaje]
      ,[vlKilometros]
      ,[dtActualizacion]
      ,[flEliminar]
      ,[vlPrecioxKilometro]
      ,[flMuestraenlaWEB]
      ,[flIncluyeComisionRetorno]
      ,[tpDestino]
      ,[cdComision])
	SELECT [cdProducto]
      ,[dsProducto]
      ,[vlPrecioViaje]
      ,[vlPrecioPeaje]
      ,[obsHoras]
      ,[vlPorcentaje]
      ,[tpOperacion]
      ,[flMuestra]
      ,[cdOrden]
      ,[vlPrecioViajeSinPeaje]
      ,[vlKilometros]
      ,[dtActualizacion]
      ,[flEliminar]
      ,[vlPrecioxKilometro]
      ,[flMuestraenlaWEB]
      ,[flIncluyeComisionRetorno]
      ,[tpDestino]
      ,[cdComision]
  FROM deleted 






END

GO




if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_Supera_KM_IVA_segunMonto_4_9' )
	drop procedure  dbo.SP_Supera_KM_IVA_segunMonto_4_9

go
	

CREATE procedure SP_Supera_KM_IVA_segunMonto_4_9
(@tpCategoriaIVA_param varchar(5)=null,
@vlKilometros_param   int=0,
@vlMonto_param	      float=0,
@tpComprobante_param  char(2))
as
begin
declare @precio_km float
declare @Kilometros_IVA int

	if @tpComprobante_param = 'NC' or  @tpComprobante_param = 'NC' 
		select 'N' as RESPUESTA,0  as Kilometros, 'N' as Pregunta
	
	
	set @precio_km=0
	set @Kilometros_IVA=0
	
	select @precio_km=replace(vlParametro,',','.') from tb_Parametros where dsParametro='PRECIO_KM'
	select @Kilometros_IVA=replace(vlParametro,',','.') from tb_Parametros where dsParametro='KM_IVA'
	

	if @vlKilometros_param>0 and @vlKilometros_param>=@Kilometros_IVA 
	begin
		select 'S' as RESPUESTA, @vlKilometros_param as Kilometros, 'N' as Pregunta
		return
	end 


	select @precio_km=replace(vlParametro,',','.') from tb_Parametros where dsParametro='PRECIO_KM'

	if @precio_km>0 and (@vlMonto_param/@precio_km)>=@Kilometros_IVA
		select 'S' as RESPUESTA,(@vlMonto_param/@precio_km) as Kilometros, 'S' as Pregunta
	ELSE
		select 'N' as RESPUESTA,0  as Kilometros, 'N' as Pregunta

end 

go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_obtenerImputacion_v4_7' )
	drop procedure  dbo.SP_obtenerImputacion_v4_7

go

create procedure SP_obtenerImputacion_v4_7
(
@nrCaja_param         as  numeric,
@AsientoModelo_param  as  varchar(100),
@nrCupon_param		  as  numeric=null 		
)
as
begin 


	if @AsientoModelo_param='REGISTRACION_CAJA_PUESTO' 
	begin

		declare @vlSaldoInicialPesos    as float
		declare @vlSaldoInicialDolares  as float
		declare @vlSaldoInicialEuros    as float	
		declare @vlTotalSaldoFinalReal  as float 
		declare @vlTotalSaldoFinal      as float 

		declare @vlSaldoInicialDolaresPesif  as float
		declare @vlSaldoFinalRealPesos		 as float
		declare @vlSaldoInicialEurosPesif    as float	
		declare @vlSaldoFinalRealDolares     as float
		declare @vlSaldoFinalRealEuro		 as float

		declare @vlFondoFijoPesos			 as float
		declare @vlFondoFijoDolares			 as float
		declare @vlFondoFijoEuros			 as float
													  --- Diferencia en valores de caja
		declare @vlDiferenciaDeCierre		 as float --- (-) Falto dinero a la operadora 
													  --- (+) Sobre dinero a la operadora 

		--- Dinero destinado para la administración 
		declare @vlCierrePesos   as float 
		declare @vlCierreDolares as float 
		declare @vlCierreEuros   as float 
		declare @vlDiaEuro		 as float
		declare @vlDiaDolar		 as float
		declare @vlDiaReal       as float 
		

		SELECT     @vlSaldoFinalRealPesos=vlSaldoFinalRealPesos,
			   @vlSaldoFinalRealDolares=vlSaldoFinalRealDolares,
			   @vlSaldoFinalRealEuro=vlSaldoFinalRealEuros,
			   @vlSaldoInicialPesos=vlSaldoInicialPesos,
			   @vlSaldoInicialDolares=vlSaldoInicialDolares,
			   @vlSaldoInicialEuros=vlSaldoInicialEuros,
			   @vlTotalSaldoFinalReal=vlTotalSaldoFinalReal,  -- Saldo del operador en caja
			   @vlTotalSaldoFinal=vlTotalSaldoFinal,		  -- Saldo del sistema pesificado
			   --- Fondo Fijo otorgado para la caja siguiente
			   @vlFondoFijoPesos=vlFondoFijoPesos,
			   @vlFondoFijoDolares=vlFondoFijoDolares,
			   @vlFondoFijoEuros=vlFondoFijoEuros,
			   @vlDiferenciaDeCierre=vlDiferenciaDeCierre,
			   --- Dinero para la administración 
			   @vlCierrePesos =vlCierrePesos,
			   @vlCierreDolares =vlCierreDolares,
			   @vlCierreEuros =vlCierreEuros,
			   @vlDiaEuro  = vlDiaEuro,
			   @vlDiaDolar = vlDiaDolar,
			   @vlDiaReal = vlDiaReal
		FROM   TB_Cajas
		WHERE  (nrCaja = @nrCaja_param)

		--- Identificar las cantidaddes enunciadas en el documento
		--- #20090520_División de cuentas y agregado de nuevos controles#		
		---	2000   Ingreso de dinero caja de los puestos	Entrada de Dinero	Caja de los Licenciatarios	Sistema
				
		SELECT 
			isnull(SUM(a.vlPagoPesos),0)    + 
			isnull(SUM(a.vlPagoEuros),0)    * @vlDiaEuro +
			isnull(SUM(a.vlPagoDolares),0)  * @vlDiaDolar as   suma_vlTotalPesificado,
			
			--- modificacion version 3,7 para incluir reales pesificados a los pesos
			isnull(SUM(a.vlPagoPesos),0) + 	(isnull(SUM(a.vlPagoReales),0))  * @vlDiaReal  as   suma_vlPagoPesos, 
			isnull(SUM(a.vlPagoEuros),0)    as   suma_vlPagoEuros,
			isnull(SUM(a.vlPagoDolares),0)  as   suma_vlPagoDolares,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA

		INTO #tmp_itemconcepto1 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and (tpCupon = 'Contado') 
			and nrCajaCliente = @nrCaja_param and nrLicencia <> 990
			
		--- 2019	Ingreso de dinero por comisiones a caja de la cooperativa
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, suma_vlComision as vlImporte, tpOperacion, tpCajaImputacion
		into #tmp_asiento_preeliminar
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2019 

		--- 2000  Ingreso de dinero caja de los puestos a la caja del licenciatario
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'USD' as moneda ,suma_vlPagoDolares as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2000 

		--- 2000  Ingreso de dinero caja de los puestos a la caja del licenciatario
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto  as dsConcepto, 'EUR' as moneda ,suma_vlPagoEuros as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2000 

		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda ,suma_vlPagoPesos as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2000 

		--- 2004 Ingreso Retención IVA a caja de la cooperativa
		insert into #tmp_asiento_preeliminar		
		select cdConcepto, dsConcepto + ' (Contado)' as dsConcepto, 'PES' as moneda, suma_IVA as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2004 

		--- 2008 Egreso Retención IVA Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar		
		select cdConcepto, dsConcepto + ' (Contado)' as dsConcepto, 'PES' as moneda, suma_IVA as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2008

		/* determinamos la diferencia */
		if @vlDiferenciaDeCierre>0
		begin
			--- 2001	Diferencia operadora(+) a caja de la administracion
			insert into #tmp_asiento_preeliminar
			select cdConcepto, dsConcepto, 'PES' as moneda, abs(@vlDiferenciaDeCierre) as vlImporte, tpOperacion, tpCajaImputacion
			from   #tmp_itemconcepto1 a , tb_conceptos b
			where  b.cdConcepto = 2001 
		end

		if @vlDiferenciaDeCierre<0
		begin
			---	2002	Diferencia operadora(-) a caja de la administracion
			insert into #tmp_asiento_preeliminar
			select cdConcepto, dsConcepto, 'PES' as moneda, abs(@vlDiferenciaDeCierre) as vlImporte, tpOperacion, tpCajaImputacion
			from   #tmp_itemconcepto1 a , tb_conceptos b
			where  b.cdConcepto = 2002
		end 

		if dbo.f_existeDiferenciaFondoFijo_v2_9( @vlSaldoInicialPesos,
											 @vlSaldoInicialDolares,
											 @vlSaldoInicialEuros,
											 @vlFondoFijoPesos,
											 @vlFondoFijoDolares,
											 @vlFondoFijoEuros,
											 @vlDiaEuro, 
											 @vlDiaDolar)=1
		begin

			create table #temp_Diferencia (vlSigno int, vlDiferenciaFondoFijoPesif float);

			insert into #temp_Diferencia exec dbo.SP_obtenerDiferenciaFondoFijo_v2_9
											 @vlSaldoInicialPesos,
											 @vlSaldoInicialDolares,
											 @vlSaldoInicialEuros,
											 @vlFondoFijoPesos,
											 @vlFondoFijoDolares,
											 @vlFondoFijoEuros,
											 @vlDiaEuro, 
											 @vlDiaDolar

			--- 2006    Diferencia Fondo Fijo(-)
			--- 2005    Diferencia Fondo Fijo(+)
			--- insert into #tmp_asiento_preeliminar
			--- select cdConcepto, dsConcepto, 'PES' as moneda, abs(a.vlDiferenciaFondoFijoPesif) as vlImporte, tpOperacion, tpCajaImputacion
			--- from   #temp_Diferencia a , tb_conceptos b
			--- where  (b.cdConcepto = 2006 and a.vlSigno=-1) or (b.cdConcepto = 2005 and a.vlSigno=1)
		end


		--- Calculo concepto  2007   Egreso de dinero por comisiones
		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto2 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon='Contado'
			and nrCajaCliente = @nrCaja_param  and nrLicencia <> 990
		
		---2007  -- Egreso de dinero por comisiones (Contado) --Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto2 a , tb_conceptos b
		where  b.cdConcepto = 2007
	    
		
		--- Calculo concepto  2007   Egreso de dinero por comisiones
		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto3 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon  = 'Retorno'
			and nrCajaCliente = @nrCaja_param and nrLicencia <> 990

	
		-- 2010  Ingreso de dinero por comisiones (Retorno) Caja de la Cooperativa
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto3 a , tb_conceptos b
		where  b.cdConcepto = 2010

		-- 2016 Egreso de dinero por comisiones (Retorno)  Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto3 a , tb_conceptos b
		where  b.cdConcepto = 2016


		-- 2011 Ingreso de dinero caja de los puestos (Retorno) Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlMontoCupon) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto3 a , tb_conceptos b
		where  b.cdConcepto = 2011


---Cobro en Destino


		--- Calculo montos en Cobro en Destino
		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto4 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon  = 'Cobro en Destino'
			and nrCajaCliente = @nrCaja_param and nrLicencia <> 990

		-- 2014  Ingreso de dinero por comisiones(CD)  Caja de la Cooperativa
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto4 a , tb_conceptos b
		where  b.cdConcepto = 2014

		-- 2017 Egreso de dinero por comisiones (CD)  Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto4 a , tb_conceptos b
		where  b.cdConcepto = 2017


		-- 2012 Ingreso de dinero caja de los puestos (CD) Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlMontoCupon) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto4 a , tb_conceptos b
		where  b.cdConcepto = 2012


---Cuenta Corriente

		--- Calculo montos en Cuenta Corriente
		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto5 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon  = 'Cuenta Corriente'
			and nrCajaCliente = @nrCaja_param and nrLicencia <> 990

		-- 2018  Egreso de dinero por comisiones (CC)  Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto5 a , tb_conceptos b
		where  b.cdConcepto = 2018 

		-- 2015 Ingreso de dinero por comisiones(CC)  Caja de la Cooperativa
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto5 a , tb_conceptos b
		where  b.cdConcepto = 2015


		-- 2013 Ingreso de dinero caja de los puestos (CC) Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlMontoCupon) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto5 a , tb_conceptos b
		where  b.cdConcepto = 2013


		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlMontoCupon) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto5 a , tb_conceptos b
		where  b.cdConcepto = 2021


		-- IVA 
		-- Ingreso a la caja de la cooperativo por ret. de IVA (R,CD,CC)
		-- 'Cuenta Corriente' 'Cobro en Destino'  'Retorno'


		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto6 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon in ('Cuenta Corriente','Cobro en Destino','Retorno')
			and nrCajaCliente = @nrCaja_param and nrLicencia <> 990

		insert into #tmp_asiento_preeliminar
		-- 2004 Ingreso Retención IVA  Caja de la Cooperativa
		select cdConcepto, dsConcepto+' (R,CD,CC)' as dsConcepto, 'PES' as moneda, abs(suma_IVA) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto6 a , tb_conceptos b
		where  b.cdConcepto = 2004

		-- 2008 Egreso Retención IVA Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto+' (R,CD,CC)' as dsConcepto, 'PES' as moneda, abs(suma_IVA) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto6 a , tb_conceptos b
		where  b.cdConcepto = 2008

		-----  Tabla de Retorno  -----
		select a.cdConcepto,a.dsConcepto, a.moneda, ROUND(a.vlImporte,3) as 'vlImporte', a.tpOperacion, a.tpCajaImputacion 
		from #tmp_asiento_preeliminar a, tb_conceptos b
		where   a.cdConcepto = b.cdConcepto and
			ROUND(a.vlImporte,3)<>0   and   b.flOcultadoenRegistracion=0
		order by ROUND(a.vlImporte,3) desc

		-----  Tabla de Retorno  OCULTA -----
		select a.cdConcepto, a.dsConcepto, a.moneda, ROUND(a.vlImporte,3) as 'vlImporte', a.tpOperacion, a.tpCajaImputacion 
		from #tmp_asiento_preeliminar a, tb_conceptos b
		where a.cdConcepto = b.cdConcepto and
  		ROUND(a.vlImporte,3)<>0   and   b.flOcultadoenRegistracion=1
		order by ROUND(a.vlImporte,3) desc

	end 
	
	
	if @AsientoModelo_param='REGISTRACION_CUPON' 
	begin

		declare @nrCupon numeric(18, 0)
		declare @tpCupon varchar(20)
		declare @vlMontoCupon float
		declare @vlPagoPesos  float
		declare @vlPagoEuros  float
		declare @vlPagoDolares float
		declare @vlComision   float
		declare @vlSubtotal   float
		declare @vlIVA	      float	

		select   @nrCupon = a.nrCupon,
			 @tpCupon = a.tpCupon,	
			 @vlMontoCupon = a.vlMontoCupon, 
			 @vlPagoPesos = a.vlPagoPesos, 
			 @vlPagoEuros = a.vlPagoEuros,
			 @vlPagoDolares = a.vlPagoDolares,
			 @vlComision = a.vlComision,  
			 @vlSubtotal = a.vlSubtotal,  
			 @vlIVA	= a.vlIVA    	  
		from     tb_cupones a
		where    a.nrCupon = @nrCupon_param 


		if @tpCupon='Contado'
		begin

		--1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
		select cdConcepto, dsConcepto as dsConcepto, 'USD' as moneda, 
		       (@vlPagoEuros)  as vlImporte, tpOperacion, tpCajaImputacion
		into #tmp_asiento_preeliminar_cupones 
		from   tb_conceptos b
		where  b.cdConcepto = 1027


		--1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
		select cdConcepto, dsConcepto as dsConcepto, 'EUR' as moneda, 
		       (@vlPagoDolares)  as vlImporte, tpOperacion, tpCajaImputacion
		from   tb_conceptos b
		where  b.cdConcepto = 1027

			if @vlPagoPesos>0 
				--1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
				insert into #tmp_asiento_preeliminar_cupones
				select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, 
				       (@vlPagoPesos) - (@vlComision + @vlIVA)  as vlImporte, tpOperacion, tpCajaImputacion
				from   tb_conceptos b
				where  b.cdConcepto = 1027
			else
			begin

				--1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
				insert into #tmp_asiento_preeliminar_cupones
				select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, 
				       (@vlPagoPesos) as vlImporte, tpOperacion, tpCajaImputacion
				from   tb_conceptos b
				where  b.cdConcepto = 1027

				insert into #tmp_asiento_preeliminar_cupones
				select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, 
				       (@vlComision + @vlIVA)  as vlImporte, tpOperacion, tpCajaImputacion
				from   tb_conceptos b
				where  b.cdConcepto = 2020
			
			end 

			-----  Tabla de Retorno  -----
			select cdConcepto, dsConcepto, moneda, ROUND(vlImporte,3) as 'vlImporte', tpOperacion, tpCajaImputacion 
			from #tmp_asiento_preeliminar_cupones
			where ROUND(vlImporte,3)<>0  order by ROUND(vlImporte,3) desc

		end 


	end 

end

