

 ALTER  procedure sp_obtiene_saldo_caja_lic_a_hoy
as
begin
declare @fecha_corte datetime

set dateformat dmy
		SELECT --dtCupon, nrLicencia,
		       a.tpCupon,
		       suma_vlPagoPesos = CASE a.tpCupon
			 WHEN 'Contado' THEN  isnull(SUM(a.vlPagoPesos)- sum(a.vlComision+isnull(a.vlIVA,0)),0)
		         WHEN 'Cuenta Corriente' THEN isnull(SUM(a.vlMontoCupon)- sum(vlComision+isnull(a.vlIVA,0)),0)
		         WHEN 'Retorno' THEN isnull(SUM(0)- sum(vlComision+isnull(a.vlIVA,0)),0)
		         WHEN 'Cobro en Destino' THEN isnull(SUM(0)- sum(vlComision+isnull(a.vlIVA,0)),0)
		       END,
		       isnull(SUM(a.vlPagoEuros),0)   AS   suma_vlPagoEuros, 
		       isnull(SUM(a.vlPagoDolares),0) AS   suma_vlPagoDolares INTO #tb_falta_compensar_agrupado_sin_restri
		FROM TB_Cupones a, tb_cajas b ---, #tmp_Licencias b
		WHERE /* (a.flCompensado = 1)   AND (flAnulado = 0) AND */  
		    a.tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND 
		    a.nrLicencia not in (998,999) and a.nrCajaCliente = b.nrCaja  and 
		    not (day(b.dtApertura)=24 and month(b.dtApertura)=9 and   year(b.dtApertura)=2009 and b.nrPuesto<>9)
		    and a.dtCompensado>'25/09/2009 00:00:00.000'  and
                     a.dtCupon<'25/09/2009 00:00:00.000' 
		Group by tpCupon

		select isnull(sum(suma_vlPagoPesos),0) as suma_vlPagoPesos,
		       isnull(sum(suma_vlPagoEuros),0) as suma_vlPagoEuros,
		       isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares,
		       'Sin restricción' as dtcupon_hora_corte
		from #tb_falta_compensar_agrupado_sin_restri

end -- fin de procedure



go

exec sp_obtiene_saldo_caja_lic_a_hoy
