 update TB_Cajas SET vlSaldoInicialPesos = 500   		WHERE nrCaja = 1000004693;
 update TB_Cajas SET vlSaldoInicialPesos = 500   		WHERE nrCaja = 2000004556;
 update TB_Cajas SET vlSaldoInicialPesos = 90448.96             WHERE nrCaja = 9000002022;


 --Saldo de cierre en pesos ingresado por la operadora para las cajas 1000004693 y 2000004556

 Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CA' ,@tpCajaImputacion_param = null ,@nrCaja_param = 9000002020


 Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CA' ,@tpCajaImputacion_param = null ,@nrCaja_param = 9000002022

 select * from tb_cajas where nrCaja in (9000002022, 9000002021)

go 


ALTER PROCEDURE [SP_CalculaSaldoInicial_v2_9] 
					       @tpCaja_param char(2)=null,
					       @tpCajaImputacion_param varchar(50)=null,
					       @nrCaja_Param numeric
AS

 declare @vlSaldoInicialPesos    float
 declare @vlSaldoInicialDolares  float 
 declare @vlSaldoInicialEuros    float

 declare @vlSumaPesos_SAL float
 declare @vlSumaDolares_SAL float
 declare @vlSumaEuros_SAL float
 declare @vlSumaPesos_ENT float
 declare @vlSumaDolares_ENT float
 declare @vlSumaEuros_ENT float

 if @tpCaja_param is null
 	set @tpCaja_param ='CA'

 set dateformat dmy 

 SELECT @vlSumaPesos_ENT=  SUM (a.vlPesos)
                         + SUM(a.vlDolares * b.vlDiaDolar)
					     + SUM(a.vlEuros   * b.vlDiaEuro)
 FROM TB_MovimientosContables a, TB_Cajas b  , tb_conceptos c
 WHERE a.tpOperacion = 'Entrada de Dinero'      and 
	   a.nrCaja = b.nrCaja                  and
	   a.cdConcepto = c.cdConcepto          and
	   			(
				 (@tpCaja_param='CC'  and c.flSumaenCajaCooperativa=1) or		
				 (@tpCaja_param='CL'  and c.flSumaenCajaLicenciatarios=1) or
				 (@tpCaja_param='CA'  and c.flSumaenCajaAdm=1) 
				)
	-- and (c.tpCajaImputacion = @tpCajaImputacion_param or  @tpCajaImputacion_param is null)
        and (a.nrCaja < @nrCaja_Param or @nrCaja_Param is null)  
        and dbo.f_conceptoIncluido_v2_9(@tpCaja_param, c.cdConcepto , dtMovimiento,c.tpCajaImputacion, @tpCajaImputacion_param)=1

 SELECT @vlSumaPesos_SAL=SUM(a.vlPesos)
						 + SUM(a.vlDolares * b.vlDiaDolar)
						 + SUM(a.vlEuros * b.vlDiaEuro)
 FROM TB_MovimientosContables a, TB_Cajas b , tb_conceptos c
 WHERE a.tpOperacion = 'Salida de Dinero'       and 
	   a.nrCaja = b.nrCaja                  and
	   a.cdConcepto = c.cdConcepto          and
			(
				 (@tpCaja_param='CC'  and c.flSumaenCajaCooperativa=1)  or 
				 (@tpCaja_param='CL'  and c.flSumaenCajaLicenciatarios=1) or
				 (@tpCaja_param='CA'  and c.flSumaenCajaAdm=1) 
			)
        and (a.nrCaja < @nrCaja_Param or @nrCaja_Param is null) 
        and dbo.f_conceptoIncluido_v2_9(@tpCaja_param, c.cdConcepto , dtMovimiento,c.tpCajaImputacion, @tpCajaImputacion_param)=1

 SELECT  @vlSaldoInicialPesos   = isnull(@vlSumaPesos_ENT-@vlSumaPesos_SAL,0), 
	 @vlSaldoInicialDolares = 0,
	 @vlSaldoInicialEuros   = 0 

 SELECT @vlSaldoInicialPesos   as 'vlSaldoInicialPesos',
        @vlSaldoInicialDolares as 'vlSaldoInicialDolares',
	@vlSaldoInicialEuros   as 'vlSaldoInicialEuros'


 return 1;



