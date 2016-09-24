

   execute SP_SumaCajaPuestosCondVenta_v2_5 @pnrCaja_param = 3000001817

--	vlSaldoFinalPesos                                     vlSaldoFinalDolares                                   vlSaldoFinalEuros                                     vlDiaDolar                                            vlDiaEuro                                             nrCaja               
	----------------------------------------------------- ----------------------------------------------------- ----------------------------------------------------- ----------------------------------------------------- ----------------------------------------------------- -------------------- 
--	696.0                                                 133.0                                                 50.0      


    execute SP_SumaCajaPuestosCondVenta_v2_5 @pnrCaja_param = 1000004218


--	vlSaldoFinalPesos                                     vlSaldoFinalDolares                                   vlSaldoFinalEuros                                     vlDiaDolar                                            vlDiaEuro                                             nrCaja               
----------------------------------------------------- ----------------------------------------------------- ----------------------------------------------------- ----------------------------------------------------- ----------------------------------------------------- -------------------- 
--	1970.0                                                156.0                                                 50.0                                                  3.5                                                   4.6500000000000004                                    1000004218


	update tb_cajas
	set vlSaldoFinalPesos = 696.0,
	    vlSaldoFinalDolares = 133.0 ,
	    vlSaldoFinalEuros =  50.0 
	where	nrcaja = 3000001817



	update tb_cajas
	set vlSaldoFinalPesos =1970.0 ,
	    vlSaldoFinalDolares =  156.0 ,
	    vlSaldoFinalEuros =     50.0   
	where	nrcaja = 1000004218

