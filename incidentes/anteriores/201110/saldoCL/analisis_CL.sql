IP 200.117.248.63


Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CL' ,@tpCajaImputacion_param = 'Caja de los Licenciatarios' ,@nrCaja_param = 9000002637 

Exec SP_SumaCajaADM_v2_9 @nrCaja_param = 9000002637 ,@tpCaja_param = 'CL' ,@tpCajaImputacion_param = 'Caja de los Licenciatarios' 
