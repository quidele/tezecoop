SELECT [nrCaja]
      ,[nrPuesto]
      ,[dsUsuario]
      ,[dtApertura]
      ,[dtCierre]
      ,[hrApertura]
      ,[hrCierre]
      ,[flEstado]
      ,[flCajaAdm]
      ,[vlSaldoInicialPesos]
      ,[vlSaldoInicialDolares]
      ,[vlSaldoInicialEuros]
      ,[vlDiaDolar]
      ,[vlDiaEuro]
      ,[vlSaldoFinalPesos]
      ,[vlSaldoFinalDolares]
      ,[vlSaldoFinalEuros]
      ,[vlSaldoFinalRealPesos]
      ,[vlSaldoFinalRealEuros]
      ,[vlSaldoFinalRealDolares]
      ,[vlCierrePesos]
      ,[vlCierreDolares]
      ,[vlCierreEuros]
      ,[vlTotalSaldoFinalReal]
      ,[vlTotalSaldoFinal]
      ,[vlTotalSaldoInicial]
      ,[vlTotalSaldoCierre]
      ,[dsDiferenciaDeCierre]
      ,[vlDiferenciaDeCierre]
      ,[dsObservacion]
      ,[dtObservacion]
      ,[dsUsuario_Supervisor]
      ,[dtActualizacion]
      ,[flSincronizado]
      ,[vlFondoFijoPesos]
      ,[vlFondoFijoDolares]
      ,[vlFondoFijoEuros]
      ,[dsUsuarioReapertura]
      ,[tpEstadoAprobacion]
      ,[dtEstadoAprobacion]
      ,[flImputado]
  FROM [dbSG2000].[dbo].[TB_Cajas]
where
nrCaja ='9000002023'


---update TB_Cajas
set
	vlSaldoInicialPesos = 109740.5, 
	vlSaldoFinalRealPesos = 109740.5, 
	vlTotalSaldoInicial = 109740.5 
--select * from TB_Cajas
where
	nrCaja ='9000002024'


select  * from tb_cajas  where nrCaja ='9000002024'


select *
/*update tb_cajas
set vlSaldoInicialPesos=500,
	vlSaldoFinalRealPesos=0,
	vlTotalSaldoInicial=0*/
from tb_cajas
where flestado =0  and nrPuesto in (1,2,3)  and dtCierre is null


select *
--update tb_cajas
set vlSaldoInicialPesos=350,
	vlSaldoFinalRealPesos=0,
	vlTotalSaldoInicial=0
---select *
from tb_cajas
where flestado =0  and nrPuesto in (4) and dtCierre is null



