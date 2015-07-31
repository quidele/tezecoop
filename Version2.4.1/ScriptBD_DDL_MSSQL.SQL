-- cambios de DDL version 2.4.1
use dbSG2000
go



ALTER /* CREATE*/  procedure sp_obtiene_falta_compensar_2_4
as
begin
declare @fecha_corte datetime
declare @RESTRICCION_COMPENSACION_ACTIVADA varchar(50)
declare @RESTRICCION_COMPENSACION_HORA_PAGO varchar(50)
declare @RESTRICCION_COMPENSACION_DIAS_PAGO int


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
		       tpCupon,
		       suma_vlPagoPesos = CASE tpCupon
			 WHEN 'Contado' THEN  isnull(SUM(vlPagoPesos)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Cuenta Corriente' THEN isnull(SUM(vlMontoCupon)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Retorno' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Cobro en Destino' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)
		       END,
		       isnull(SUM(vlPagoEuros),0)   AS   suma_vlPagoEuros, 
		       isnull(SUM(vlPagoDolares),0) AS   suma_vlPagoDolares INTO #tb_falta_compensar_agrupado
		FROM TB_Cupones
		WHERE (flCompensado = 0) AND (flAnulado = 0) AND 
		    tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND 
		    nrLicencia NOT IN (999, 998) 
		    and dbo.f_sepuedecompensar_2_0(dtCupon,@RESTRICCION_COMPENSACION_DIAS_PAGO,@RESTRICCION_COMPENSACION_HORA_PAGO,getdate())=1
		Group by tpCupon --, dtCupon

		select isnull(sum(suma_vlPagoPesos),0) as suma_vlPagoPesos,
		       isnull(sum(suma_vlPagoEuros),0) as suma_vlPagoEuros,
		       isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares,
		       (convert(varchar,getdate() - @RESTRICCION_COMPENSACION_DIAS_PAGO,103) + ' ' + @RESTRICCION_COMPENSACION_HORA_PAGO) as dtcupon_hora_corte
		from #tb_falta_compensar_agrupado


	end
	else
	begin	
		SELECT --dtCupon, nrLicencia,
		       tpCupon,
		       suma_vlPagoPesos = CASE tpCupon
			 WHEN 'Contado' THEN  isnull(SUM(vlPagoPesos)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Cuenta Corriente' THEN isnull(SUM(vlMontoCupon)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Retorno' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Cobro en Destino' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)
		       END,
		       isnull(SUM(vlPagoEuros),0)   AS   suma_vlPagoEuros, 
		       isnull(SUM(vlPagoDolares),0) AS   suma_vlPagoDolares INTO #tb_falta_compensar_agrupado_sin_restri
		FROM TB_Cupones
		WHERE (flCompensado = 0) AND (flAnulado = 0) AND 
		    tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND 
		    nrLicencia NOT IN (999, 998) 
		Group by tpCupon

		select isnull(sum(suma_vlPagoPesos),0) as suma_vlPagoPesos,
		       isnull(sum(suma_vlPagoEuros),0) as suma_vlPagoEuros,
		       isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares,
		       'Sin restricción' as dtcupon_hora_corte
		from #tb_falta_compensar_agrupado_sin_restri

	
	end 

end -- fin de procedure



go 

--exec sp_obtiene_falta_compensar_2_4

-- inconsistencia hallada por sergio
-- set dateformat dmy
-- select *,  from tb_cupones where dtCupon>getdate() and flCompensado=0