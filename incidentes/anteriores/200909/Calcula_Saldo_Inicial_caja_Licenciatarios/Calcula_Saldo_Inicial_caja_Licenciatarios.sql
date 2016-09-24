use dbSG2000_Pruebas
go 


drop procedure sp_obtiene_saldo_caja_lic

go 


CREATE /* ALTER*/  procedure sp_obtiene_saldo_caja_lic
as
begin
declare @fecha_corte datetime

		SELECT --dtCupon, nrLicencia,
		       a.tpCupon,
		       suma_vlPagoPesos = CASE a.tpCupon
			 WHEN 'Contado' THEN  isnull(SUM(a.vlPagoPesos)- sum(a.vlComision+isnull(a.vlIVA,0)),0)
		         WHEN 'Cuenta Corriente' THEN isnull(SUM(a.vlMontoCupon)- sum(vlComision+isnull(a.vlIVA,0)),0)
		         WHEN 'Retorno' THEN isnull(SUM(0)- sum(vlComision+isnull(a.vlIVA,0)),0)
		         WHEN 'Cobro en Destino' THEN isnull(SUM(0)- sum(vlComision+isnull(a.vlIVA,0)),0)
		       END,
		       isnull(SUM(a.vlPagoEuros),0)   AS   suma_vlPagoEuros, 
		       isnull(SUM(a.vlPagoDolares),0) AS   suma_vlPagoDolares INTO #tb_falta_compensar_agrupado_sin_restri
		FROM TB_Cupones a, tb_cajas b ---, #tmp_Licencias b
		WHERE (a.flCompensado = 0) AND (flAnulado = 0) AND 
		    a.tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND 
		    a.nrLicencia not in (998,999) and a.nrCajaCliente = b.nrCaja  and 
		    not (day(b.dtApertura)=24 and month(b.dtApertura)=9 and   year(b.dtApertura)=2009 and b.nrPuesto<>9)
		Group by tpCupon

		select isnull(sum(suma_vlPagoPesos),0) as suma_vlPagoPesos,
		       isnull(sum(suma_vlPagoEuros),0) as suma_vlPagoEuros,
		       isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares,
		       'Sin restricción' as dtcupon_hora_corte
		from #tb_falta_compensar_agrupado_sin_restri

end -- fin de procedure

go

execute sp_obtiene_saldo_caja_lic
execute sp_obtiene_falta_compensar_2_4




select nrCaja from tb_cajas where day(dtApertura)=24 and month(dtApertura)=9 and   year(dtApertura)=2009 and nrPuesto<>9

select * from tb_cajas where day(dtApertura)=24 and month(dtApertura)=9 and   year(dtApertura)=2009 and nrPuesto<>9

--- saldo en la caja de la administración




select * from tb_usuarios where dsUsuario = 'MARIA'
IBFLNM


Exec SP_SumaCajaADM_v2_9 @nrCaja_param = 9000002021 ,@tpCaja_param = 'CC' ,@tpCajaImputacion_param = 'Caja de la Cooperativa' 

Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CC' ,@tpCajaImputacion_param ='Caja de la Cooperativa' ,@nrCaja_param = 9000002023 


select * from tb_cajas where  flImputada = 0

select * from tb_conceptos where   flSumaenCajaCooperativa=1  and  tpCajaImputacion<>'Caja de la Cooperativa'

select distinct tpCajaImputacion from tb_conceptos 


Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CA' ,@tpCajaImputacion_param = null ,@nrCaja_param = 9000002023


Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CL' ,@tpCajaImputacion_param = 'Caja de los Licenciatarios' ,@nrCaja_param = 9000002023


go

Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CC' ,@tpCajaImputacion_param ='Caja de la Cooperativa' ,@nrCaja_param = 9000002023



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
        and (a.nrCaja <> @nrCaja_Param or @nrCaja_Param is null)  
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


go

drop function dbo.f_conceptoIncluido_v2_9;

go

CREATE FUNCTION  dbo.f_conceptoIncluido_v2_9(@tpCaja_param            char(2)=null,
					     @cdConcepto_param        int,
                                             @dtMovimiento_param      datetime,
					     @tpCajaImputacion_o_param  varchar(50)=null,
					     @tpCajaImputacion_p_param  varchar(50)=null
)  
RETURNS INT AS  
BEGIN 
	if @tpCaja_param='CC'
	begin
		if  @cdConcepto_param=1027
			begin
				if @dtMovimiento_param<'25/09/2009 00:00:00.000'
					return 1;
				else
					return 0;
			end
		else
			begin
			if @tpCajaImputacion_o_param=@tpCajaImputacion_p_param  or @tpCajaImputacion_p_param is null
				return 1;
			else
				return 0;
			end
	end



	if @tpCaja_param='CL'
	begin
		if  @cdConcepto_param=1027
			begin
				if @dtMovimiento_param>'25/09/2009 00:00:00.000'
					return 1;
				else
					return 0;					
			end
		else
			begin
			if @tpCajaImputacion_o_param=@tpCajaImputacion_p_param  or @tpCajaImputacion_p_param is null
				return 1;
			else
				return 0;
			end
	end

	
	return 1; 

END





go



select * from tb_conceptos c where  c.flSumaenCajaAdm=1

			and   c.flSumaenCajaCooperativa=0
			and    c.flSumaenCajaLicenciatarios=0
	


update tb_conceptos
set  flSumaenCajaAdm=1,
     flSumaenCajaCooperativa=1,
     flSumaenCajaLicenciatarios=1
 where  flSumaenCajaAdm=1
			and   flSumaenCajaCooperativa=0
			and    flSumaenCajaLicenciatarios=0


select * from tb_Conceptos 

select * from tb_movimientosContables  where cdConcepto is null



update tb_cajas 
set flImputado=null
where flImputado=0

select flImputado  from tb_cajas where flImputado=0


update tb_cajas 
set flImputado=0
where nrCaja in 
		(1000004682,
		1000004683,
		1000004684,
		2000004545,
		2000004546,
		2000004547,
		3000002097,
		4000001495,
		4000001496)



SELECT VW_CajasPuestos_v2_9.nrCaja ,VW_CajasPuestos_v2_9.dtApertura ,VW_CajasPuestos_v2_9.dtCierre ,VW_CajasPuestos_v2_9.nrPuesto ,VW_CajasPuestos_v2_9.dsUsuario ,VW_CajasPuestos_v2_9.dsUsuario ,VW_CajasPuestos_v2_9.vlSaldoInicialPesos ,VW_CajasPuestos_v2_9.vlSaldoFinalPesos ,VW_CajasPuestos_v2_9.flSincronizado ,VW_CajasPuestos_v2_9.tpEstadoAprobacion  FROM VW_CajasPuestos_v2_9  WHERE VW_CajasPuestos_v2_9.nrPuesto <> 9 AND VW_CajasPuestos_v2_9.flImputado = 0 AND VW_CajasPuestos_v2_9.flestado = 0 AND VW_CajasPuestos_v2_9.dtApertura >= '09/09/2009 00:00:00'  AND  VW_CajasPuestos_v2_9.dtApertura <= '24/09/2009 23:59:59'  AND   nrCaja Like ('%%%') Order by VW_CajasPuestos_v2_9.dtApertura DESC 



 Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CA' ,@tpCajaImputacion_param = null ,@nrCaja_param = 9000002021 




select * from tb_cajas where nrCaja = 9000002024


vlTotalSaldoFinalReal =  113008.3112726,52450025082  =   113008,3  

Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CA' ,@tpCajaImputacion_param = null ,@nrCaja_param = null 


Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = null ,@tpCajaImputacion_param = null ,@nrCaja_param = null 



Exec SP_SumaCajaADM_v2_9 @nrCaja_param = 9000002024 ,@tpCaja_param = 'CA' ,@tpCajaImputacion_param = null 

go


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



exec  SP_rpt_resumendecajaadm_v2_9 @nrCaja_Param=9000002024, @tpCaja_Param=null, @tpCajaImputacion_param=null

go 


alter procedure SP_rpt_resumendecajaadm_v2_9
						@nrCaja_param numeric,
						@tpCaja_param char(2)=null,
						@tpCajaImputacion_param varchar(50)=null
as
begin
declare @vlSaldoInicialPesos   as float
declare @vlSaldoInicialDolares as float
declare @vlSaldoInicialEuros   as float
declare @vlSaldoCierrePesos    as float



	if @tpCaja_param=''  
		set @tpCaja_param=null

	if @tpCajaImputacion_param=''  
		set @tpCajaImputacion_param=null

	if @tpCaja_param is null
		set @tpCaja_param ='CA'
 

	CREATE TABLE #temp_SaldoCierre (
		[vlSaldoCierrePesos] [float] NULL 
	)

	insert into #temp_SaldoCierre exec SP_CalculaSaldoCierre_v2_9 @nrCaja_param=@nrCaja_param,
									@tpCaja_param=@tpCaja_param,
									@tpCajaImputacion_param=@tpCajaImputacion_param
		

	select top 1 @vlSaldoCierrePesos=vlSaldoCierrePesos 
	from   #temp_SaldoCierre;



	SELECT a.tpOperacion, a.nrCaja, b.tpCajaImputacion, a.dsConcepto, SUM(vlPesos) 
		AS SumaPesos, SUM(vlDolares) AS SumaDolares, 
		SUM(vlEuros) AS SumaEuros into  #tmp_ResumenCajaADM_SinPesificar
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
	where	a.cdConcepto = b.cdConcepto      and
		    (
				 (@tpCaja_param='CC'  and b.flSumaenCajaCooperativa=1) or			 
				 (@tpCaja_param='CL'  and b.flSumaenCajaLicenciatarios=1) or
				 (@tpCaja_param='CA'  and b.flSumaenCajaAdm=1) 
		    )
			and a.nrCaja =  @nrCaja_param 
			and (b.tpCajaImputacion= @tpCajaImputacion_param or @tpCajaImputacion_param is null)
	GROUP BY a.tpOperacion, a.nrCaja, a.dsConcepto,  b.tpCajaImputacion



	SELECT  c.nmNombre, 
			c.nmApellido, 
			a.tpOperacion, 
			a.nrCaja, 
			a.dsConcepto, 
			a.SumaPesos, 
			a.SumaDolares, 
			a.SumaEuros, 
			Convert (varchar,b.dtApertura,103) as  'dtApertura',
		        b.vlSaldoInicialPesos as 'vlSaldoInicialPesos',
		        b.vlSaldoInicialDolares as 'vlSaldoInicialDolares',
		        b.vlSaldoInicialEuros as 'vlSaldoInicialEuros',
			b.vlSaldoFinalRealPesos, 
			b.vlSaldoFinalRealEuros, 
			b.vlSaldoFinalRealDolares, 
			b.vlCierrePesos, 
			b.vlCierreDolares, 
			b.vlCierreEuros, 
			@vlSaldoCierrePesos + vlSaldoInicialPesos as 'vlTotalSaldoFinalReal', 
			@vlSaldoCierrePesos as 'vlTotalSaldoFinal', 
			b.vlDiaDolar, 
			b.vlDiaEuro, 
			b.dsObservacion,
			Convert (varchar,b.dtObservacion,103) as  'dtObservacion'
	FROM #tmp_ResumenCajaADM_SinPesificar a, tb_cajas b, TB_Usuarios c
	WHERE   a.nrCaja    = b.nrCaja and
			b.dsUsuario = c.dsUsuario
	ORDER BY a.tpOperacion asc

end

go

---delete from tb_cajas where nrCaja=9000002025
IBFLNM



Exec SP_SumaCajaADM_v2_9 @nrCaja_param = 9000002024 ,@tpCaja_param = 'CA' ,@tpCajaImputacion_param = null 

select *  from  tb_cajas where nrCaja=9000002025