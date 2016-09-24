select * from tb_usuarios where dsUsuario='maria'

/*
te paso los saldos de mis cajas 
nº 2023 EN CAJA 109.458 pero  el saldo inicial no coincide con el cierre de la caja 2022 
nº 2024 EN CAJA 112.726 tampoco coincide el saldo inicial
*/


exec dbo.SP_CalculaSaldoInicial_v2_9 
			       @tpCaja_param ='CA',
			       @tpCajaImputacion_param = null,
			       @nrCaja_Param = 9000002020

Resultado: 80103.364500135183

exec dbo.SP_CalculaSaldoInicial_v2_9 
			       @tpCaja_param ='CA',
			       @tpCajaImputacion_param = null,
			       @nrCaja_Param = 9000002021

Resultado: 90448.964500114322

exec dbo.SP_CalculaSaldoInicial_v2_9 
			       @tpCaja_param ='CA',
			       @tpCajaImputacion_param = null,
			       @nrCaja_Param = 9000002022

Resultado: 90448.964500114322

exec dbo.SP_CalculaSaldoInicial_v2_9 
			       @tpCaja_param ='CA',
			       @tpCajaImputacion_param = null,
			       @nrCaja_Param = 9000002023

Saldo final   9000002022: 100.321,80
Saldo Inicial 9000002023: 100321.81450011581



select * from tb_cajas where nrCaja = 9000002022


exec dbo.SP_CalculaSaldoInicial_v2_9 
			       @tpCaja_param ='CA',
			       @tpCajaImputacion_param = null,
			       @nrCaja_Param = 9000002024

Saldo final   9000002023: 	109.458,80
Resultado: 109458.81450012326 

exec dbo.SP_CalculaSaldoInicial_v2_9 
			       @tpCaja_param ='CA',
			       @tpCajaImputacion_param = null,
			       @nrCaja_Param = 9000002025

Resultado: 112726.52450013161



Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = null ,@tpCajaImputacion_param = null ,@nrCaja_param = null 