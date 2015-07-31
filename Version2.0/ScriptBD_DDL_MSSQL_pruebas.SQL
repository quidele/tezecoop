-- cambios de DDL version 2.0
use dbSG2000_pruebas
go


ALTER procedure sp_obtiene_falta_compensar_2_0
as
declare @fecha_corte datetime
declare @RESTRICCION_COMPENSACION_ACTIVADA varchar(50)
declare @RESTRICCION_COMPENSACION_HORA_PAGO varchar(50)
declare @RESTRICCION_COMPENSACION_DIAS_PAGO int


	select @RESTRICCION_COMPENSACION_ACTIVADA=vlParametro from TB_Parametros where dsParametro='RESTRICCION_COMPENSACION_ACTIVADA'
	select @RESTRICCION_COMPENSACION_HORA_PAGO=vlParametro from TB_Parametros where  dsParametro='RESTRICCION_COMPENSACION_HORA_PAGO'
	select @RESTRICCION_COMPENSACION_DIAS_PAGO=convert(int,vlParametro) from TB_Parametros where  dsParametro='RESTRICCION_COMPENSACION_DIAS_PAGO'

	--print @RESTRICCION_COMPENSACION_ACTIVADA
	--print @RESTRICCION_COMPENSACION_HORA_PAGO
	--print @RESTRICCION_COMPENSACION_DIAS_PAGO
	

	if @RESTRICCION_COMPENSACION_ACTIVADA='SI'
	begin
		select @RESTRICCION_COMPENSACION_HORA_PAGO=vlParametro from TB_Parametros where  dsParametro='RESTRICCION_COMPENSACION_HORA_PAGO'
		select @RESTRICCION_COMPENSACION_DIAS_PAGO=convert(int,vlParametro) from TB_Parametros where  dsParametro='RESTRICCION_COMPENSACION_DIAS_PAGO'

	
		---SET @fecha_corte=Convert(datetime,CONVERT(varchar, getdate()-@RESTRICCION_COMPENSACION_DIAS_PAGO, 103) 
			        ---+ ' '+@RESTRICCION_COMPENSACION_HORA_PAGO)
	
		--PRINT @fecha_corte
	
		SELECT --dtCupon, nrLicencia,
		       tpCupon,suma_vlPagoPesos = CASE tpCupon
			 WHEN 'Contado' THEN  isnull(SUM(vlPagoPesos)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Cuenta Corriente' THEN isnull(SUM(vlMontoCupon)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Retorno' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Cobro en Destino' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)
		       END,
		       isnull(SUM(vlPagoEuros),0)   AS   suma_vlPagoEuros, 
		       isnull(SUM(vlPagoDolares),0) AS   suma_vlPagoDolares INTO #tb_falta_compensar_agrupado
		FROM TB_Cupones
		WHERE (flCompensado = 0) AND (flAnulado = 0) AND 
		    tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND 
		    nrLicencia NOT IN (999, 998) 
		    and dbo.f_sepuedecompensar_2_0(dtCupon,@RESTRICCION_COMPENSACION_DIAS_PAGO,@RESTRICCION_COMPENSACION_HORA_PAGO,getdate())=1
		Group by tpCupon --, dtCupon

		select isnull(sum(suma_vlPagoPesos),0) as suma_vlPagoPesos,
		       isnull(sum(suma_vlPagoEuros),0) as suma_vlPagoEuros,
		       isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares
		from #tb_falta_compensar_agrupado


	end
	else
	begin
	
		SELECT --dtCupon, nrLicencia,
		       tpCupon,suma_vlPagoPesos = CASE tpCupon
			 WHEN 'Contado' THEN  isnull(SUM(vlPagoPesos)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Cuenta Corriente' THEN isnull(SUM(vlMontoCupon)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Retorno' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Cobro en Destino' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)
		       END,
		       isnull(SUM(vlPagoEuros),0)   AS   suma_vlPagoEuros, 
		       isnull(SUM(vlPagoDolares),0) AS   suma_vlPagoDolares INTO #tb_falta_compensar_agrupado_sin_restri
		FROM TB_Cupones
		WHERE (flCompensado = 0) AND (flAnulado = 0) AND 
		    tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND 
		    nrLicencia NOT IN (999, 998) 
		Group by tpCupon

		select isnull(sum(suma_vlPagoPesos),0) as suma_vlPagoPesos,
		       isnull(sum(suma_vlPagoEuros),0) as suma_vlPagoEuros,
		       isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares
		from #tb_falta_compensar_agrupado_sin_restri

	end 



GO


CREATE procedure SP_Supera_KM_IVA_segunMonto_2_0
@tpCategoriaIVA_param varchar(5)=null,
@vlKilometros_param   int=0,
@vlMonto_param	      float=0
as
begin
declare @precio_km float
declare @Kilometros_IVA int

	set @precio_km=0
	set @Kilometros_IVA=0
	
	select @precio_km=replace(vlParametro,',','.') from tb_Parametros where dsParametro='PRECIO_KM'
	select @Kilometros_IVA=replace(vlParametro,',','.') from tb_Parametros where dsParametro='KM_IVA'
	

	if @vlKilometros_param>0 and @vlKilometros_param>=@Kilometros_IVA 
	begin
		select 'S' as RESPUESTA, @vlKilometros_param as Kilometros, 'N' as Pregunta
		return
	end 


	select @precio_km=replace(vlParametro,',','.') from tb_Parametros where dsParametro='PRECIO_KM'

	if @precio_km>0 and (@vlMonto_param/@precio_km)>=@Kilometros_IVA
		select 'S' as RESPUESTA,(@vlMonto_param/@precio_km) as Kilometros, 'S' as Pregunta
	ELSE
		select 'N' as RESPUESTA,0  as Kilometros, 'N' as Pregunta

end 


GO

alter procedure SP_Supera_KM_IVA_segunMonto
@tpCategoriaIVA_param varchar(5)=null,
@vlKilometros_param   int=0,
@vlMonto_param	      float=0
as
begin
declare @precio_km float
declare @Kilometros_IVA int

	set @precio_km=0
	set @Kilometros_IVA=0
	
	select @precio_km=replace(vlParametro,',','.') from tb_Parametros where dsParametro='PRECIO_KM'
	select @Kilometros_IVA=replace(vlParametro,',','.') from tb_Parametros where dsParametro='KM_IVA'
	

	if @vlKilometros_param>0 and @vlKilometros_param>=@Kilometros_IVA 
	begin
		select 'S' as RESPUESTA, @vlKilometros_param as Kilometros, 'N' as Pregunta
		return
	end 


	select @precio_km=replace(vlParametro,',','.') from tb_Parametros where dsParametro='PRECIO_KM'

	if @precio_km>0 and (@vlMonto_param/@precio_km)>=@Kilometros_IVA
		select 'S' as RESPUESTA,(@vlMonto_param/@precio_km) as Kilometros, 'S' as Pregunta
	ELSE
		select 'N' as RESPUESTA,0  as Kilometros, 'N' as Pregunta

end 


go


CREATE FUNCTION  f_sepuedecompensar_2_0 (@dtcupon datetime, @restriccion_dias int, @restriccion_Hora varchar(8), @fecha_de_hoy datetime)  
RETURNS INT AS  
BEGIN 
declare @dtcupon_string        varchar(50)
declare @dtcupon_hora_corte    datetime
declare @sepuedecompensar      int

	set @dtcupon_string = convert(varchar(50),@dtcupon) 
	if len(@dtcupon_string)<=10 
		set @dtcupon_string = @dtcupon_string + ' '+@restriccion_Hora;

	If dateDiff(day, @dtcupon + @restriccion_dias,@fecha_de_hoy ) = 0 
	begin
	        -- si estoy en el mismo dia, analizo la hora
        	set @dtcupon_hora_corte = convert(varchar,@fecha_de_hoy,103) + ' ' + @restriccion_Hora
	        If DateDiff(minute, @dtcupon, @dtcupon_hora_corte)>0 
		    set @sepuedecompensar=1;
		else
	            set @sepuedecompensar=0;
	end
	else
	begin
		If dateDiff(day, @dtcupon + @restriccion_dias,@fecha_de_hoy )>0
	            set @sepuedecompensar=1;
		else
	            set @sepuedecompensar=0;
	end

	return @sepuedecompensar; 
END


go

CREATE PROCEDURE SP_sepuedecompensar_2_0
(@dtcupon_param datetime)  
AS
BEGIN 
declare @RESTRICCION_COMPENSACION_ACTIVADA  varchar(50)
declare @RESTRICCION_COMPENSACION_HORA_PAGO varchar(50)
declare @RESTRICCION_COMPENSACION_DIAS_PAGO int
declare @sepuedecompensar 	            int

	select @RESTRICCION_COMPENSACION_ACTIVADA=vlParametro from TB_Parametros where dsParametro='RESTRICCION_COMPENSACION_ACTIVADA'
	select @RESTRICCION_COMPENSACION_HORA_PAGO=vlParametro from TB_Parametros where  dsParametro='RESTRICCION_COMPENSACION_HORA_PAGO'
	select @RESTRICCION_COMPENSACION_DIAS_PAGO=convert(int,vlParametro) from TB_Parametros where  dsParametro='RESTRICCION_COMPENSACION_DIAS_PAGO'

	--print @RESTRICCION_COMPENSACION_ACTIVADA
	--print @RESTRICCION_COMPENSACION_HORA_PAGO
	--print @RESTRICCION_COMPENSACION_DIAS_PAGO

	if @RESTRICCION_COMPENSACION_ACTIVADA='SI'
		select @sepuedecompensar=dbo.f_sepuedecompensar_2_0(@dtcupon_param,@RESTRICCION_COMPENSACION_DIAS_PAGO,@RESTRICCION_COMPENSACION_HORA_PAGO,getdate());
	else
		select @sepuedecompensar=1;

	select @sepuedecompensar as 'sepuedecompensar'; 

END

go

ALTER FUNCTION  f_sepuedecompensar_2_0(@dtcupon datetime, @restriccion_dias int, @restriccion_Hora varchar(8), @fecha_de_hoy datetime)  
RETURNS INT AS  
BEGIN 

--set dateformat dmy 
--declare @dtcupon datetime
--declare @restriccion_dias int 
--declare @restriccion_Hora varchar(9)
--declare @fecha_de_hoy	  datetime
--set @dtCupon='25/06/2008 05:59:59'
--set @fecha_de_hoy='26/06/2008 11:00:00'
--set @restriccion_dias=2
--set @restriccion_Hora='06:00:00'

declare @dtcupon_hora_corte    datetime
declare @sepuedecompensar      int

	If dateDiff(day, @dtcupon ,@fecha_de_hoy-@restriccion_dias) = 0 
	begin
		--Print dateDiff(day, @dtcupon ,@fecha_de_hoy - @restriccion_dias )
	        -- si estoy en el mismo dia, analizo la hora
        	set @dtcupon_hora_corte = convert(varchar,@fecha_de_hoy - @restriccion_dias,103) + ' ' + @restriccion_Hora
		--print @dtcupon_hora_corte
		--print DateDiff(minute, @dtcupon, @dtcupon_hora_corte)
	        If DateDiff(minute, @dtcupon, @dtcupon_hora_corte)>0 
		    set @sepuedecompensar=1;
		else
	            set @sepuedecompensar=0;
	end
	else
	begin

		--Print dateDiff(day, @dtcupon ,@fecha_de_hoy - @restriccion_dias )
		If dateDiff(day, @dtcupon ,@fecha_de_hoy - @restriccion_dias )>0
	            set @sepuedecompensar=1;
		else
	            set @sepuedecompensar=0;
	end

	--select @sepuedecompensar 'RESULTADO'

	------------------------------
	return @sepuedecompensar; 
END

go
