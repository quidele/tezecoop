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
		FROM TB_Cupones a---, #tmp_Licencias b
		WHERE (a.flCompensado = 0) AND (flAnulado = 0) AND 
		    a.dtCupon>
		    a.tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND 
		    a.nrLicencia not in (998,999)
		Group by tpCupon
