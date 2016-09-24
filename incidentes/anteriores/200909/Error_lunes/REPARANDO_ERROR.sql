

set dateformat dmy


SELECT  'update TB_Cajas SET vlSaldoInicialPesos = ' + CONVERT(VARCHAR,isnull(vlSaldoInicialPesos,0)) +
        ', vlSaldoFinalRealPesos = ' + CONVERT(VARCHAR,isnull(vlSaldoFinalRealPesos,0)) +
        ', vlTotalSaldoInicial = ' + CONVERT(VARCHAR,isnull(vlTotalSaldoInicial,0)) +
        ' WHERE nrCaja = '+  CONVERT(VARCHAR,nrCaja) + ' and flestado=1; ' as sql 
        
FROM         TB_Cajas  where dtApertura <=  '27-09-2009 23:59:00.000'
and  nrCaja not in (9000002023, 9000002022, 9000002024, 9000002025)  and flestado = 1 
order by dtApertura desc 


 update TB_Cajas SET vlSaldoInicialPesos = 500   		WHERE nrCaja = 1000004693;
 update TB_Cajas SET vlSaldoInicialPesos = 500   		WHERE nrCaja = 2000004556;
 update TB_Cajas SET vlSaldoInicialPesos = 90448.964500121772             WHERE nrCaja = 9000002022;

 --Saldo de cierre en pesos ingresado por la operadora para las cajas 1000004693 y 2000004556

 Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CA' ,@tpCajaImputacion_param = null ,@nrCaja_param = 9000002021


select * from  TB_Cajas where nrCaja in (9000002022, 9000002021)
