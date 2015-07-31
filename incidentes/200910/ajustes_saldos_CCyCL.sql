


select * from tb_usuarios where dsUsuario='maria'

exec dbo.SP_CalculaSaldoInicial_v2_9 
			       @tpCaja_param ='CA',
			       @tpCajaImputacion_param = null,
			       @nrCaja_Param = 9000002031

vlSaldoInicialPesos = 88697.774500116706  (9000002030)
Saldo Final = 108312.12450014055

exec dbo.SP_CalculaSaldoInicial_v2_9 
			       @tpCaja_param ='CC',
			       @tpCajaImputacion_param = null,
			       @nrCaja_Param = 9000002031


EXEC SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CL' ,@tpCajaImputacion_param = 'Caja de los Licenciatarios' ,@nrCaja_param = 9000002031 

Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CC' ,@tpCajaImputacion_param = 'Caja de la Cooperativa' ,@nrCaja_param = 9000002031 



set dateformat dmy 

SELECT sum(vlTotalSaldoCierre)
FROM  TB_Cajas
WHERE (nrPuesto <> 9) AND (flImputado = 0) AND (dtApertura < '28/09/2009') 


