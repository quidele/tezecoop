sp_helptext 'SP_CalculaSaldoInicial_v2_9'


exec SP_CalculaSaldoInicial_v2_9 'CA',
							      null,
								  9000000012


select top 1  nrCaja from tb_cajas order by nrCaja  desc


