


    9000002043

Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CC' ,@tpCajaImputacion_param = 'Caja de la Cooperativa' ,@nrCaja_param = 9000002044


exec SP_SumaCajaADM_v2_9 @nrCaja_param = 9000002044 ,@tpCaja_param = 'CC' ,@tpCajaImputacion_param =  'Caja de la Cooperativa'


Exec SP_ResumenCajaADM_v2_9 @nrCaja_param = 9000002044 ,@tpCaja_param = 'CC' ,@tpCajaImputacion_param =  'Caja de la Cooperativa'


	SELECT a.cdConcepto, a.tpOperacion, a.nrCaja, b.tpCajaImputacion, a.dsConcepto, SUM(vlPesos) 
		AS SumaPesos, SUM(vlDolares) AS SumaDolares, 
		SUM(vlEuros) AS SumaEuros
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
		where	a.cdConcepto = b.cdConcepto      and
				(
					 (b.flSumaenCajaAdm=1) 
				)
			and (b.tpCajaImputacion='Caja de la Cooperativa')
			and a.nrCaja =  9000002043 
	GROUP BY a.cdConcepto, a.tpOperacion, a.nrCaja, b.tpCajaImputacion, a.dsConcepto

 

Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CA' ,@tpCajaImputacion_param = null ,@nrCaja_param = 2000002237
