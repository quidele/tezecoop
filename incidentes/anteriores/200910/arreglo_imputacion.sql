exec SP_obtenerImputacion_v2_9 @nrCaja_param=1000004692,
							   @AsientoModelo_param='REGISTRACION_CAJA_PUESTO'


cdConcepto  dsConcepto                                                                                           moneda vlImporte              tpOperacion                                        tpCajaImputacion
----------- ---------------------------------------------------------------------------------------------------- ------ ---------------------- -------------------------------------------------- --------------------------------------------------
2000        Ingreso de dinero caja de los puestos (Contado)                                                      PES    7699                   Entrada de Dinero                                  Caja de los Licenciatarios
2002        Diferencia operadora(-)                                                                              PES    868,4                  Salida de Dinero                                   Caja de la Cooperativa
2007        Egreso de dinero por comisiones (Contado)                                                            PES    616                    Salida de Dinero                                   Caja de los Licenciatarios
2019        Ingreso de dinero por comisiones(Contado)                                                            PES    616                    Entrada de Dinero                                  Caja de la Cooperativa
2000        Ingreso de dinero caja de los puestos (Contado)                                                      USD    391                    Entrada de Dinero                                  Caja de los Licenciatarios
2000        Ingreso de dinero caja de los puestos (Contado)                                                      EUR    117                    Entrada de Dinero                                  Caja de los Licenciatarios
2014        Ingreso de dinero por comisiones(CD)                                                                 PES    35                     Entrada de Dinero                                  Caja de la Cooperativa
2017        Egreso de dinero por comisiones (CD)                                                                 PES    35                     Salida de Dinero                                   Caja de los Licenciatarios
2010        Ingreso de dinero por comisiones (Retorno)                                                           PES    2                      Entrada de Dinero                                  Caja de la Cooperativa
2016        Egreso de dinero por comisiones (Retorno)                                                            PES    2                      Salida de Dinero                                   Caja de los Licenciatarios

(10 filas afectadas)

cdConcepto  dsConcepto                                                                                           moneda vlImporte              tpOperacion                                        tpCajaImputacion
----------- ---------------------------------------------------------------------------------------------------- ------ ---------------------- -------------------------------------------------- --------------------------------------------------
2012        Ingreso de dinero caja de los puestos (CD)                                                           PES    490                    Entrada de Dinero                                  Caja de los Licenciatarios
2011        Ingreso de dinero caja de los puestos (Retorno)                                                      PES    78                     Entrada de Dinero                                  Caja de los Licenciatarios



sp_helptext SP_obtenerImputacion_v2_9
`
select vlDiaDolar, vlDiaEuro from tb_cajas where nrCaja = 1000004692

go

select * from tb_cajas where nrCaja = 1000004692


		SELECT 
			isnull(SUM(a.vlPagoPesos),0)    as   suma_vlPagoPesos, 
			isnull(SUM(a.vlPagoEuros),0)    as   suma_vlPagoEuros,
			isnull(SUM(a.vlPagoDolares),0)  as   suma_vlPagoDolares,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and (tpCupon = 'Contado') 
			and nrCajaCliente = 1000004692 

go 


alter procedure SP_obtenerImputacion_v2_9
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
			   @vlDiaDolar = vlDiaDolar
		FROM   TB_Cajas
		WHERE  (nrCaja = @nrCaja_param)

		--- Identificar las cantidaddes enunciadas en el documento
		--- #20090520_División de cuentas y agregado de nuevos controles#		
		---	2000   Ingreso de dinero caja de los puestos	Entrada de Dinero	Caja de los Licenciatarios	Sistema
				
		SELECT 
			isnull(SUM(a.vlPagoPesos),0)    + 
			isnull(SUM(a.vlPagoEuros),0)    * @vlDiaEuro +
			isnull(SUM(a.vlPagoDolares),0)  * @vlDiaDolar as   suma_vlTotalPesificado,
			isnull(SUM(a.vlPagoPesos),0)    as   suma_vlPagoPesos, 
			isnull(SUM(a.vlPagoEuros),0)    as   suma_vlPagoEuros,
			isnull(SUM(a.vlPagoDolares),0)  as   suma_vlPagoDolares,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA

		INTO #tmp_itemconcepto1 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and (tpCupon = 'Contado') 
			and nrCajaCliente = @nrCaja_param 
			
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
			and nrCajaCliente = @nrCaja_param 
		
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
			and nrCajaCliente = @nrCaja_param 

	
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
			and nrCajaCliente = @nrCaja_param 

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
			and nrCajaCliente = @nrCaja_param 

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
			and nrCajaCliente = @nrCaja_param 

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


Exec SP_ActualizarComprobante_v2_5 @nrTalonario_param = '0004' ,@nrComprobante_param = '00000078' ,@tpComprobante_param = 'B' ,@tpLetra_param = 'B' ,@nrTalonario_new_param = '0004' ,@nrComprobante_new_param = '00000079' ,@tpComprobante_new_param = 'B' ,@tpLetra_new_param = 'B' ,@dtComprobante_new_param = '10/10/2009' ,@cdCondVenta_new_param = 'Contado' ,@tpComision_new_param = 'A Clientes' ,@vlComision_new_param = 4 ,@nrCierre_param = 2 


go 



---  Voy por acacacac !!!
--- SP_ActualizarComprobanteManual_v2_4 ->>> SP_ActualizarComprobanteManual_v2_5
-- Actualiza el nro de comprobante y talonario de una carga manual
alter     procedure [SP_ActualizarComprobante_v2_5]
@nrTalonario_param        varchar(4),
@nrComprobante_param      varchar(12),
@tpComprobante_param      varchar(4),
@tpLetra_param            varchar(2),
@nrTalonario_new_param    varchar(4),
@nrComprobante_new_param  varchar(12),
@tpComprobante_new_param  varchar(4),
@tpLetra_new_param        varchar(2),
@dtComprobante_new_param  datetime=null,
@nrCierre_param		  int=null,
@cdCondVenta_new_param	  varchar(20)=null,
@tpComision_new_param	  varchar(20)=null,
@vlComision_new_param     float=null
AS
begin
/*

declare @nrTalonario_param varchar
declare @nrComprobante_param varchar
declare @tpComprobante_param varchar
declare @tpLetra_param      varchar
declare @nrTalonario_new_param varchar
declare @nrComprobante_new_param varchar
declare @tpComprobante_new_param varchar
declare @tpLetra_new_param varchar

set @nrTalonario_param ='0002'
set @nrComprobante_param ='00000063'
set @tpComprobante_param ='A'
set @tpLetra_param      ='A'
set @nrTalonario_new_param ='0002'
set @nrComprobante_new_param ='00000063'
set @tpComprobante_new_param ='B'
set @tpLetra_new_param ='B'

*/
declare @cantidad_registros int
declare @error		    varchar(200)
declare @cdCondVenta        varchar(50)
declare @vlPagoPesos        float
declare @vlPagoDolares      float
declare @vlPagoEuros        float
declare @vlTotalGeneral      float


	if @nrCierre_param is not null 
	begin
		---- guardar el comprobante anterior 
		exec sp_guardarComprobanteCajaPuestoAnterior_v2_5
			@nrTalonario_param   = @nrTalonario_param,
			@nrComprobante_param = @nrComprobante_param,
			@tpComprobante_param = @tpComprobante_param,
			@tpLetra_param       = @tpLetra_param,
			@nrCierre_param      = @nrCierre_param,	
			@nrTalonario_new_param   = @nrTalonario_new_param,
			@nrComprobante_new_param = @nrComprobante_new_param,
			@tpComprobante_new_param = @tpComprobante_new_param,
			@tpLetra_new_param       = @tpLetra_new_param
	end

	-- verificamos la existencia del comprobante
	select  @cantidad_registros=count(*),
	        @cdCondVenta=max(cdCondVenta), 
		@vlPagoPesos=max(vlPagoPesos),
		@vlPagoDolares=max(vlPagoDolares),
		@vlPagoEuros=max(vlPagoEuros),
		@vlTotalGeneral=max(vlTotalGeneral)
	FROM TB_Comprobantes
	WHERE nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param 
	
	if @cantidad_registros=0 
	begin
		select @error = 'No se ha encontrado el talonario '+ @nrTalonario_param + ' comprobante nro. '+ rtrim(@nrComprobante_param) +'.'
         	raiserror (@error, 16, 1)
		return 0	
	end

	-- si cambia los datos de la clave verificar si ya existe el comprobante
	-- con la nueva clave, si existe hay un error
	-- si el comprobante no existe 
	if      @nrTalonario_param <> @nrTalonario_new_param     or
		@nrComprobante_param  <> @nrComprobante_new_param   or 
		@tpComprobante_param  <> @tpComprobante_new_param   or
		@tpLetra_param        <> @tpLetra_new_param   
	begin
		if dbo.f_existeComprobante(@nrTalonario_new_param, @nrComprobante_new_param, @tpComprobante_new_param,@tpLetra_new_param)='SI'
		begin
			select @error = 'El comprobante modificado ya existe no puede modificarlo en lo que respeta a numeración y letra'
			raiserror (@error, 16, 1)
			return 0	
		end 



		insert into [TB_Comprobantes]
		    (nrTalonario,nrComprobante, tpComprobante, tpLetra, 
		    dtComprobante , cdCliente, cdCondVenta, tpComision, 
		    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
		    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
		    flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
		    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
		    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
		    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
		    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
		    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
		    nmEmpleado, IdReciboCtaCte, flCargaErronea, dtActualizacion)
		select  @nrTalonario_new_param,  @nrComprobante_New_param , 
			@tpComprobante_new_param, @tpLetra_new_param, 
		    dtComprobante, cdCliente, cdCondVenta, tpComision,	
		    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
		    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
		    0 as flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
		    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
		    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
		    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
		    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
		    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
		    nmEmpleado, IdReciboCtaCte, flCargaErronea, getdate () as  dtActualizacion
		from TB_Comprobantes
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param  
	
		if @@rowcount=0 
		begin	
			select @error = 'No se ha insertado el talonario '+ @nrTalonario_new_param + ' comprobante nro. '+ rtrim(@nrComprobante_new_param) +'.'
			raiserror (@error, 16, 1)
			return 0	
		end
	
		if @@error<>0
		begin
			select @error = 'error al insertar el registro en la tabla [TB_Comprobantes].'
			raiserror (@error, 16, 1)
			return 0
		end 	
	
		insert into [TB_ComprobantesDetalle]
		    (nrTalonario, nrComprobante, tpComprobante, tpLetra, nrItem, 
		    cdProducto, dsProducto, tpOperacion, qtCantidad, vlPorcentaje, 
		    vlPrecioPeaje, vlPrecioViaje, vlTotalItem, dtInsercion, 
		   flSincronizado,dtActualizacion)
		select @nrTalonario_new_param , @nrComprobante_new_param, @tpComprobante_new_param, @tpLetra_new_param, 
		    nrItem, cdProducto, dsProducto, tpOperacion, qtCantidad, 
		    vlPorcentaje, vlPrecioPeaje, vlPrecioViaje, vlTotalItem, 
		    dtInsercion, 0, getdate()
		from TB_ComprobantesDetalle
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param 

		update TB_Cupones
		set    nrTalonarioCliente     = @nrTalonario_new_param,
	   	       nrComprabanteCliente   = @nrComprobante_new_param,
		       tpComprobanteCliente = @tpComprobante_new_param,
		       tpLetraCliente       = @tpLetra_new_param 
		where nrTalonarioCliente   = @nrTalonario_param and
		      nrComprabanteCliente = @nrComprobante_param and
		      tpComprobanteCliente = @tpComprobante_param and 		
		      tpLetraCliente       = @tpLetra_param 


	
		if @@error<>0
		begin
			select @error = 'No se pudo grabar la tabla de TB_ComprobantesDetalle.'
			raiserror (@error, 16, 1)
			return 0
		end 
 

		-- Eliminar en la tabla de TB_ComprobantesDetalle el comprobante anterior
		delete from TB_ComprobantesDetalle
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param 
		
		if @@rowcount=0 
		begin	
			select @error = 'No se ha podido eliminar el comprobante anterior'
			raiserror (@error, 16, 1)
			return 0	
		end
		
		--------------------------------------------------------------------
		-- Eliminar en la tabla de TB_Comprobantes el comprobante anterior
		delete from TB_Comprobantes
		where nrTalonario   = @nrTalonario_param and
		nrComprobante = @nrComprobante_param and
		tpComprobante = @tpComprobante_param and 
		tpLetra       = @tpLetra_param 
		
		if @@rowcount=0 
		begin	
			select @error = 'No se ha podido eliminar el comprobante anterior.'
			raiserror (@error, 16, 1)
			rollback tran T1		
			return 0	
		end
		
		if @@error<>0
		begin	
			select @error = 'No se ha podido eliminar el comprobante anterior.'
			raiserror (@error, 16, 1)
			return 0	
		end
	end


	-- verificar si se ha modificado la cond de venta
	if @cdCondVenta<>@cdCondVenta_new_param
	begin
		if @cdCondVenta_new_param='Cuenta Corriente'
		begin
			select @error = 'No se puede modificar la condición de venta a Cuenta Corriente.'
			raiserror (@error, 16, 1)
			return 0	
		end

		select top 1  @vlPagoPesos as vlPagoPesos,
                        @vlPagoDolares as vlPagoDolares,
			@vlPagoEuros as vlPagoEuros ,
			@vlPagoPesos as vlPagoPesosACP,
			@vlPagoDolares as vlPagoDolaresACP ,
			@vlPagoEuros  as vlPagoEurosACP                                 
		into #ValoresdePagos from tb_cajas	

		delete from #ValoresdePagos

		insert #ValoresdePagos  exec sp_obtenerCondVentayValoresdePagosModificados_v2_5	
			@cdCondVenta_param=@cdCondVenta, 
			@cdCondVenta_new_param=@cdCondVenta_new_param,	  
			@vlTotalGeneral=@vlTotalGeneral,
			@vlPagoPesos_param=@vlPagoPesos,
			@vlPagoDolares_param=@vlPagoDolares,
			@vlPagoEuros_param=@vlPagoEuros

		select  @vlPagoPesos=vlPagoPesos,
			@vlPagoDolares=vlPagoDolares,
			@vlPagoEuros=vlPagoEuros
		from #ValoresdePagos 

	end -- cierre if @cdCondVenta<>@cdCondVenta_new_param


	--- analizar los cambios en la fecha, condicion de venta , comision
	-- actualizamos la cta cte del licenciatario
	update TB_Cupones
	set  
            /* Atencion si ya fue compensado no realizado nada*/		
	    dtcupon = CASE flCompensado
			 when 0 then isnull(@dtComprobante_new_param , dtcupon)
			 when 1 then dtcupon
			 End,
	    -- falta el recalculo de la vlcomision 
	    tpCupon = CASE flCompensado
			 when 0 then isnull(@cdCondVenta_new_param , tpCupon)
			 when 1 then tpCupon
			 End,
	    vlComision = CASE flCompensado
			 when 0 then isnull(@vlComision_new_param,vlComision) 
			 when 1 then vlComision
			 End,
            /* Atencion si ya fue compensado no realizado nada - valores de pago */		
	    vlPagoPesos = CASE flCompensado
			 when 0 then @vlPagoPesos
			 when 1 then vlPagoPesos
			 End,
	    -- falta el recalculo de la vlcomision 
	    vlPagoDolares = CASE flCompensado
			 when 0 then @vlPagoDolares
			 when 1 then vlPagoDolares
			 End,
	    vlPagoEuros = CASE flCompensado
			 when 0 then @vlPagoEuros
			 when 1 then vlPagoEuros
			 End
	where nrTalonarioCliente   = @nrTalonario_new_param and
	      nrComprabanteCliente = @nrComprobante_new_param and
	      tpComprobanteCliente = @tpComprobante_new_param and 
	      tpLetraCliente       = @tpLetra_new_param
		

	-- Verificar y correr los update necesarios para
	--  @dtComprobante_new_param  
	--  @cdCondVenta_new_param
	--  @tpComision_new_param
	update tb_comprobantes
	set dtComprobante = isnull( @dtComprobante_new_param , dtComprobante),
	    cdCondVenta	  = isnull( @cdCondVenta_new_param , cdCondVenta),
	    tpComision    = isnull( @tpComision_new_param , tpComision),
	    dtActualizacion = getdate(),
	    vlPagoPesos     = isnull(@vlPagoPesos,0),
	    vlPagoDolares   = isnull(@vlPagoDolares,0),
	    vlpagoEuros	    = isnull(@vlPagoEuros,0)
	where nrTalonario   = @nrTalonario_new_param and
	      nrComprobante = @nrComprobante_new_param and
	      tpComprobante = @tpComprobante_new_param and 
	      tpLetra       = @tpLetra_new_param

	--------------------------------------------------------------------
	--------------------------------------------------------------------
	--------------------------------------------------------------------	



end





GO

/*
BEGIN TRAN
Exec SP_ActualizarComprobante_v2_5 @nrTalonario_param = '0004' ,@nrComprobante_param = '00000123' ,@tpComprobante_param = 'B' ,@tpLetra_param = 'B' ,@nrTalonario_new_param = '0004' ,@nrComprobante_new_param = '00000124' ,@tpComprobante_new_param = 'B' ,@tpLetra_new_param = 'B' ,@dtComprobante_new_param = '11/10/2009' ,@cdCondVenta_new_param = 'Contado' ,@tpComision_new_param = 'A Clientes' ,@vlComision_new_param = 4 ,@nrCierre_param = 2 
SELECT * FROM tb_comprobantes where nrTalonario = '0004' and nrComprobante= '00000124' and tpComprobante = 'B'
SELECT * FROM tb_comprobantes where nrTalonario = '0004' and nrComprobante= '00000123' and tpComprobante = 'B'
ROLLBACK TRAN
*/




