
go
alter PROCEDURE [SP_CalculaSaldoCierre_v2_9] 
					       @tpCaja_param char(2)=null,
					       @tpCajaImputacion_param varchar(50)=null,
					       @nrCaja_Param numeric
AS

 declare @vlSaldoCierrePesos    float

 declare @vlSumaPesos_SAL float
 declare @vlSumaDolares_SAL float
 declare @vlSumaEuros_SAL float
 declare @vlSumaPesos_ENT float
 declare @vlSumaDolares_ENT float
 declare @vlSumaEuros_ENT float

 set dateformat dmy 

 SELECT @vlSumaPesos_ENT=  SUM (a.vlPesos)
                         + SUM(a.vlDolares * b.vlDiaDolar)
					     + SUM(a.vlEuros   * b.vlDiaEuro)
 FROM TB_MovimientosContables a, TB_Cajas b, tb_conceptos c
 WHERE a.tpOperacion = 'Entrada de Dinero'  and 
	   a.nrCaja = b.nrCaja                  and
	   a.cdConcepto = c.cdConcepto          and
	   			(
				 (@tpCaja_param='CC'  and c.flSumaenCajaCooperativa=1 and a.dtMovimiento>'19/08/2009'  ) or			 
				 (@tpCaja_param='CL'  and c.flSumaenCajaLicenciatarios=1) or
				 (@tpCaja_param='CA'  and c.flSumaenCajaAdm=1) or
				 (@tpCaja_param is null)
				)
	and (c.tpCajaImputacion = @tpCajaImputacion_param or  @tpCajaImputacion_param is null)
        and (a.nrCaja = @nrCaja_Param)


 SELECT @vlSumaPesos_SAL=SUM(a.vlPesos)
			  + SUM(a.vlDolares * b.vlDiaDolar)
			  + SUM(a.vlEuros * b.vlDiaEuro)
 FROM TB_MovimientosContables a, TB_Cajas b, tb_conceptos c
 WHERE a.tpOperacion = 'Salida de Dinero'  and 
	   a.nrCaja = b.nrCaja                  and
	   a.cdConcepto = c.cdConcepto          and
			(
				 (@tpCaja_param='CC'  and c.flSumaenCajaCooperativa=1) or			 
				 (@tpCaja_param='CL'  and c.flSumaenCajaLicenciatarios=1) or
				 (@tpCaja_param='CA'  and c.flSumaenCajaAdm=1) or
				 (@tpCaja_param is null)
			)
	and (c.tpCajaImputacion = @tpCajaImputacion_param or  @tpCajaImputacion_param is null)
        and (a.nrCaja = @nrCaja_Param)

 SELECT  @vlSaldoCierrePesos   = isnull(@vlSumaPesos_ENT,0)-isnull(@vlSumaPesos_SAL,0)

 SELECT @vlSaldoCierrePesos   as '@vlSaldoCierrePesos'

 return 1;
