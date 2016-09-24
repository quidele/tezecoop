
	drop table #tmp_cajas_imputadas
 
	select  nrcajapuesto , min(nrCaja) as cajaorigen into #tmp_cajas_imputadas from tb_movimientoscontables where nrcajapuesto is not null
	group by nrcajapuesto

	update  a
	set a.nrCajaAdmImputaOrigen = b.cajaorigen
	from tb_cajas a,  #tmp_cajas_imputadas b
	where a.nrCaja = b.nrcajapuesto and a.nrCajaAdmImputaOrigen is  null and a.flimputado=1

