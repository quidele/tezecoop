-- Cambios de DDL version 4.2
use dbsg2000
go


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_obtenerImputacion_v4_2' )
	drop procedure  [dbo].[SP_obtenerImputacion_v4_2];

go

 -- Exec SP_obtenerImputacion_v4_2 @nrCaja_param = 2000007517 ,@AsientoModelo_param = 'REGISTRACION_CAJA_PUESTO' 
 -- Exec SP_obtenerImputacion_v4_2 @nrCaja_param = 2000002278 ,@AsientoModelo_param = 'REGISTRACION_CAJA_PUESTO' 
go

create procedure SP_obtenerImputacion_v4_2
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

go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='sp_obtiene_falta_compensar_v4_2' )
	drop procedure  [dbo].[sp_obtiene_falta_compensar_v4_2];
	
go 

--- incluir logica de reales
CREATE  procedure sp_obtiene_falta_compensar_v4_2  
as  
begin  
declare @fecha_corte datetime  
declare @RESTRICCION_COMPENSACION_ACTIVADA    varchar(50)  
declare @RESTRICCION_COMPENSACION_HORA_PAGO   varchar(50)  
declare @RESTRICCION_COMPENSACION_DIAS_PAGO   int  
  
  
 select @RESTRICCION_COMPENSACION_ACTIVADA=vlParametro from TB_Parametros where dsParametro='RESTRICCION_COMPENSACION_ACTIVADA'  
 select @RESTRICCION_COMPENSACION_HORA_PAGO=vlParametro from TB_Parametros where  dsParametro='RESTRICCION_COMPENSACION_HORA_PAGO'  
 select @RESTRICCION_COMPENSACION_DIAS_PAGO=convert(int,vlParametro) from TB_Parametros where  dsParametro='RESTRICCION_COMPENSACION_DIAS_PAGO'  
  
 --print @RESTRICCION_COMPENSACION_ACTIVADA  
 --print @RESTRICCION_COMPENSACION_HORA_PAGO  
 --print @RESTRICCION_COMPENSACION_DIAS_PAGO  
   
  
 if @RESTRICCION_COMPENSACION_ACTIVADA='SI'  
 begin  
  select @RESTRICCION_COMPENSACION_HORA_PAGO=vlParametro from TB_Parametros where  dsParametro='RESTRICCION_COMPENSACION_HORA_PAGO'  
  select @RESTRICCION_COMPENSACION_DIAS_PAGO=convert(int,vlParametro) from TB_Parametros where  dsParametro='RESTRICCION_COMPENSACION_DIAS_PAGO'  
  
   
  ---SET @fecha_corte=Convert(datetime,CONVERT(varchar, getdate()-@RESTRICCION_COMPENSACION_DIAS_PAGO, 103)   
           ---+ ' '+@RESTRICCION_COMPENSACION_HORA_PAGO)  
   
  --PRINT @fecha_corte  
   
  SELECT --dtCupon, nrLicencia,  
         tpCupon,suma_vlPagoPesos = CASE tpCupon  
    WHEN 'Contado' THEN  isnull(SUM(vlPagoPesos)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cuenta Corriente' THEN isnull(SUM(vlMontoCupon)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Retorno' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cobro en Destino' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)  
         END,  
         isnull(SUM(vlPagoEuros),0)   AS   suma_vlPagoEuros,   
         isnull(SUM(vlPagoDolares),0) AS   suma_vlPagoDolares, 
         isnull(SUM(vlPagoReales),0)  AS   suma_vlPagoReales
         INTO #tb_falta_compensar_agrupado  
  FROM TB_Cupones  
  WHERE (flCompensado = 0) AND (flAnulado = 0) AND   
      tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND   
      nrLicencia NOT IN (999, 998, 990)   
      and dbo.f_sepuedecompensar_2_0(dtCupon,@RESTRICCION_COMPENSACION_DIAS_PAGO,@RESTRICCION_COMPENSACION_HORA_PAGO,getdate())=1  
  Group by tpCupon --, dtCupon  
  
  select isnull(sum(suma_vlPagoPesos),0)   as suma_vlPagoPesos,  
         isnull(sum(suma_vlPagoEuros),0)   as suma_vlPagoEuros,  
         isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares,  
         isnull(sum(suma_vlPagoReales),0)  as suma_vlPagoReales, 
         (convert(varchar,getdate() - @RESTRICCION_COMPENSACION_DIAS_PAGO,103) + ' ' + @RESTRICCION_COMPENSACION_HORA_PAGO) as dtcupon_hora_corte  
  from #tb_falta_compensar_agrupado  
  
 end  
 else  
 begin   
  SELECT --dtCupon, nrLicencia,  
         tpCupon,suma_vlPagoPesos = CASE tpCupon  
    WHEN 'Contado' THEN  isnull(SUM(vlPagoPesos)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cuenta Corriente' THEN isnull(SUM(vlMontoCupon)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Retorno' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cobro en Destino' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)  
         END,  
         isnull(SUM(vlPagoEuros),0)   AS   suma_vlPagoEuros,   
         isnull(SUM(vlPagoDolares),0) AS   suma_vlPagoDolares, 
         isnull(SUM(vlPagoReales),0)  AS   suma_vlPagoReales 
         INTO #tb_falta_compensar_agrupado_sin_restri  
  FROM TB_Cupones  
  WHERE (flCompensado = 0) AND (flAnulado = 0) AND   
      tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND   
      nrLicencia NOT IN (999, 998, 990)     
  Group by tpCupon  
  
  select isnull(sum(suma_vlPagoPesos),0)   as suma_vlPagoPesos,  
         isnull(sum(suma_vlPagoEuros),0)   as suma_vlPagoEuros,  
         isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares,  
         isnull(sum(suma_vlPagoReales),0)  as suma_vlPagoReales, 
         'Sin restricción'				   as dtcupon_hora_corte  
  from #tb_falta_compensar_agrupado_sin_restri  
  
   
 end   
  
end -- fin de procedure  
  
  