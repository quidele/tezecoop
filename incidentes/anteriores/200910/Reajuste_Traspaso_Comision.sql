
Exec SP_ResumenCajaADM_v2_9 @nrCaja_param = 9000002039 ,@tpCaja_param = 'CL' ,@tpCajaImputacion_param = 'Caja de los Licenciatarios' 

Exec SP_SumaCajaADM_v2_9 @nrCaja_param = 9000002039 ,@tpCaja_param = 'CL' ,@tpCajaImputacion_param = 'Caja de los Licenciatarios'

1027	Salida de Dinero	9000002039	Caja de los Licenciatarios	PAGO DE COMPROBANTES	76149.400000000009	2678.0	193.0
2000	Entrada de Dinero	9000002039	Caja de los Licenciatarios	Ingreso de dinero caja de los puestos (Contado)	45219.450000000004	1131.0	214.0
2007	Salida de Dinero	9000002039	Caja de los Licenciatarios	Egreso de dinero por comisiones (Contado)	3496.0	0.0	0.0
2016	Salida de Dinero	9000002039	Caja de los Licenciatarios	Egreso de dinero por comisiones (Retorno)	116.0	0.0	0.0
2017	Salida de Dinero	9000002039	Caja de los Licenciatarios	Egreso de dinero por comisiones (CD)	171.0	0.0	0.0
2018	Salida de Dinero	9000002039	Caja de los Licenciatarios	Egreso de dinero por comisiones (CC)	7.0	0.0	0.0

45317.450000000004	1131.0	214.0	Entrada de Dinero	9000002039
79939.400000000009	2678.0	193.0	Salida de Dinero	9000002039

sp_helptext 'SP_SumaCajaADM_v2_9'

ALTER procedure [dbo].[SP_SumaCajaADM_v2_9]
						@nrCaja_param numeric,
						@tpCaja_param char(2)=null,
						@tpCajaImputacion_param varchar(50)=null
AS

	if @tpCaja_param  is null
		set @tpCaja_param='CA'

	SELECT SUM(a.vlPesos) AS SumaPesos, SUM(a.vlDolares) 
	    AS SumaDolares, SUM(a.vlEuros) AS SumaEuros, a.tpOperacion, 
	    a.nrCaja
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
		where	a.nrCaja =  @nrCaja_param and
			a.cdConcepto = b.cdConcepto      and
				(
					 (@tpCaja_param='CC'  and b.flSumaenCajaCooperativa=1) or			 
					 (@tpCaja_param='CL'  and b.flSumaenCajaLicenciatarios=1) or
					 (@tpCaja_param='CA'  and b.flSumaenCajaAdm=1) 
				)
			and (b.tpCajaImputacion=@tpCajaImputacion_param or @tpCajaImputacion_param is null)
			and a.nrCaja =  @nrCaja_param 
	GROUP BY a.tpOperacion, a.nrCaja

go 


delete from DiccionariodeDatos 
where nmcampo = 'tpCajaImputacion'  and nmtabla ='SP_ResumenCajaADM_v2_9'

INSERT INTO DiccionariodeDatos (nmTabla,nmCampo,nmCampoExterno,tpTipo,nrTamanio,flClave,flClaveForanea,flBusqueda,nrOrdenBusqueda,vlPuesto1,vlPuesto2,vlPuesto3,vlPuesto9,Actualizar,vlPuesto4,vlPuesto5,vlPuesto)  VALUES ('SP_ResumenCajaADM_v2_9','tpCajaImputacion','tpCajaImputacion','VARCHAR','50',null,null,'Yes',4,null,null,null,null,null,'0','0',null);

go


Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CL' ,@tpCajaImputacion_param = 'Caja de los Licenciatarios' ,@nrCaja_param = 9000002041 

go

SP_CalculaSaldoInicial_v2_9

go 


CREATE PROCEDURE [SP_CalculaSaldoInicial_v2_9] 
					       @tpCaja_param char(2)=null,
					       @tpCajaImputacion_param varchar(50)=null,
					       @nrCaja_Param numeric
AS

declare @tpCaja_param char(2)
declare	@tpCajaImputacion_param varchar(50)
declare	@nrCaja_Param numeric

set @tpCaja_param='CL'
set @tpCajaImputacion_param='Caja de los Licenciatarios'
set @nrCaja_Param=9000002041


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

 SELECT  a.dsConcepto, a.tpOperacion,   SUM (a.vlPesos)
                         + SUM(a.vlDolares * b.vlDiaDolar)
					     + SUM(a.vlEuros   * b.vlDiaEuro) as vlSumaPesos_ENT
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
GROUP BY a.dsConcepto, a.tpOperacion

 SELECT a.dsConcepto, a.tpOperacion, SUM(a.vlPesos)
						 + SUM(a.vlDolares * b.vlDiaDolar)
						 + SUM(a.vlEuros * b.vlDiaEuro) as vlSumaPesos_SAL
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
GROUP BY a.dsConcepto, a.tpOperacion



go


set dateformat dmy 

select * from tb_cupones where    flCompensado =1 and flAnulado=0 and dtCupon<'17/10/2009 06:00:00.000' and
dtCupon>'01/09/2009 06:00:00.000'  and 

select * from tb_MovimientosContables where cdConcepto in (2020)

66604,040000000008
