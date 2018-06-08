
-- Cambios de DDL version 4.9.832
use dbSG2000
go


-- Modificamos la definicion del campo  nrLicencia
ALTER TABLE TB_ObligacionesTitulares ALTER COLUMN nrLicencia int;

GO

-- Corregimos la definicion del campo 
ALTER TABLE TB_transCab ALTER COLUMN estado_registro char(20);

/*

estado_registro
CO = COBRADO 
PE = PENDIENTE 
CP = COBRO PARCIAL 
*/

-- Agregamos el campo estado_registro en  TB_ObligacionesCuotas
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_ObligacionesCuotas'  and  c.Name = 'estado_registro' )
	ALTER TABLE dbo.TB_ObligacionesCuotas ADD 	estado_registro char(20) NULL
	-- ALTER TABLE dbo.TB_ObligacionesCuotas ALTER COLUMN 	estado_registro char(20) NULL
GO


-- Agregamos el campo nro_trans 
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_ObligacionesTitulares'  and  c.Name = 'estado_registro' )
	ALTER TABLE dbo.TB_ObligacionesTitulares ADD 	estado_registro char(20) NULL
	-- ALTER TABLE dbo.TB_ObligacionesTitulares ALTER COLUMN 	estado_registro char(20) NULL
GO
-- Modificamos la definicion del campo  nrLicencia
ALTER TABLE TB_ObligacionesCuotas ALTER COLUMN nrLicencia int;
	
Go

IF   EXISTS  (SELECT c.* FROM     sys.triggers  c  
								WHERE      c.Name = 'upd_gestionar_estado_obligacion'   )
	drop trigger upd_gestionar_estado_obligacion

GO
/****** Object:  Trigger [dbo].[upd_control_conciliacion]    Script Date: 29/05/2018 15:40:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Eulises Quidel>
-- Create date: <29/06/2018>
-- Description:	<Eulises Quidel>
-- =============================================
CREATE TRIGGER [dbo].[upd_gestionar_estado_obligacion]
   ON  [dbo].[TB_Cupones]
   AFTER UPDATE
AS 
BEGIN

	SET NOCOUNT OFF


	select y.flCompensado,
		   x.nro_trans , 
		   x.nrLicencia , 
		   x.dtCobradoalCliente  as fecha_vencimiento
		   	   into #tmp_registros_modif
		   from deleted x inner join inserted y
			on x.nrCupon = y.nrCupon
			where    x.flCompensado <>  y.flCompensado  and y.tpCupon in ( 'Débito' )
	
	if @@ROWCOUNT = 0  
	begin
		--print ' @@ROWCOUNT = 0  '
		return ;
	end 
	

	UPDATE x SET x.estado_registro =  CASE flCompensado  WHEN 1 THEN 'COBRADO' ELSE 'PENDIENTE' END  FROM TB_ObligacionesCuotas x inner join #tmp_registros_modif Y
						ON x.nrLicencia = y.nrLicencia AND
							x.nro_trans = y.nro_trans AND
							 convert(date , x.fecha_vencimiento)  = convert(date ,y.fecha_vencimiento)



	SELECT y.nro_trans , y.nrLicencia  , count(*) as total , replicate ('X', 20)  as estado_registro
	INTO #TMP_estado_vencimiento_x_obligacion_licencia_totales
	FROM TB_ObligacionesCuotas x inner join #tmp_registros_modif Y
						ON x.nrLicencia = y.nrLicencia AND
							x.nro_trans = y.nro_trans 
	GROUP BY y.nro_trans , y.nrLicencia  
	
	
	SELECT y.nro_trans , y.nrLicencia , estado_registro , count(*) as cantidad 
	INTO #TMP_estado_vencimiento_x_obligacion
	FROM TB_ObligacionesCuotas x inner join #tmp_registros_modif Y
						ON x.nrLicencia = y.nrLicencia AND
							x.nro_trans = y.nro_trans 
	GROUP BY y.nro_trans , y.nrLicencia, estado_registro


	-- PARA UNA OBLIGACION / LICENCIA : TODOS LOS VENCIMIENTO ESTAN COBRADOS  
	UPDATE x SET x.estado_registro = 'COBRADO'   FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales x INNER JOIN
							 #TMP_estado_vencimiento_x_obligacion  y
							 ON x.nro_trans = y.nro_trans AND x.nrLicencia = x.nrLicencia  AND x.total = y.cantidad 
								WHERE y.estado_registro = 'COBRADO'

	-- PARA UNA OBLIGACION / LICENCIA : TODOS LOS VENCIMIENTO ESTAN PENDIENTES
	UPDATE x SET x.estado_registro = 'PENDIENTE'   FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales x INNER JOIN
							 #TMP_estado_vencimiento_x_obligacion  y
							 ON x.nro_trans = y.nro_trans AND x.nrLicencia = x.nrLicencia  AND x.total = y.cantidad 
								WHERE y.estado_registro = 'PENDIENTE'

	-- SINO ACTUALIZADO POR LOS CASOS ANTERIORES
	UPDATE x SET x.estado_registro = 'COBRADO PARCIAL'   FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales x INNER JOIN
							 #TMP_estado_vencimiento_x_obligacion  y
							 ON x.nro_trans = y.nro_trans AND x.nrLicencia = x.nrLicencia  AND x.total = y.cantidad 
								WHERE x.estado_registro = replicate ('X', 20) 


	update x set x.estado_registro = y.estado_registro   FROM TB_ObligacionesTitulares x inner join  #TMP_estado_vencimiento_x_obligacion_licencia_totales y
								on y.nro_trans = x.nro_trans and y.nrLicencia = x.nrLicencia 

	SELECT nro_trans ,  sum(total) as total_obligacion ,replicate ('X', 20)  as estado_registro
	INTO #TMP_estado_vencimiento_x_obligacion_licencia_totales_general
	FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales
	GROUP BY nro_trans 

	SELECT x.nro_trans ,  x.estado_registro , sum(cantidad) as cantidad  
	INTO #TMP_estado_vencimiento_x_obligacion_general
	FROM #TMP_estado_vencimiento_x_obligacion x
	GROUP BY  x.nro_trans ,  x.estado_registro 


	-- PARA UNA OBLIGACION / LICENCIA : TODOS LOS VENCIMIENTO ESTAN COBRADOS  
	UPDATE x SET x.estado_registro = 'COBRADO'   FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales_general x INNER JOIN
							 #TMP_estado_vencimiento_x_obligacion_general  y
							 ON x.nro_trans = y.nro_trans AND   x.total_obligacion = y.cantidad 
								WHERE y.estado_registro = 'COBRADO'

	-- PARA UNA OBLIGACION / LICENCIA : TODOS LOS VENCIMIENTO ESTAN PENDIENTES
	UPDATE x SET x.estado_registro = 'PENDIENTE'   FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales_general x INNER JOIN
							 #TMP_estado_vencimiento_x_obligacion_general  y
							 ON x.nro_trans = y.nro_trans  AND x.total_obligacion = y.cantidad 
								WHERE y.estado_registro = 'PENDIENTE'

	-- SINO FUE ACTUALIZADO POR LOS CASOS ANTERIORES ENTONCES ES COBRO PARCIAL
	UPDATE x SET x.estado_registro = 'COBRADO PARCIAL'   FROM #TMP_estado_vencimiento_x_obligacion_licencia_totales_general x INNER JOIN
							 #TMP_estado_vencimiento_x_obligacion_general  y
							 ON x.nro_trans = y.nro_trans AND  x.total_obligacion = y.cantidad 
								WHERE x.estado_registro = replicate ('X', 20) 
										

update x set x.estado_registro = y.estado_registro   FROM TB_transCab  x inner join  #TMP_estado_vencimiento_x_obligacion_licencia_totales_general y
								on y.nro_trans = x.nro_trans 

END


GO 

-- sp_helptext 'sp_obtenerComision_v4_7'



GO


ALTER procedure [dbo].[sp_obtenerComision_v4_7]
(@tpComprobante_param     char(2),
 @vlTotalGeneral_param    float,  
 @tpComision_param        varchar(50),  
 @tpCliente_param         varchar(20),  
 @dsCodigoDestinos_param  varchar(1000)=null)  
as
begin
declare @vlComision               as float
declare @total_sin_recargos       as float
declare @vlComision_sin_recargos  as float
declare @vlComision_recargos      as float
declare @factura_comi             as float 



	if @tpComprobante_param ='ND' or @tpComprobante_param ='NC' 
	begin
		select 0 as vlComision
		return; 
	end


	if isnull(@dsCodigoDestinos_param,'')='' 
	begin
		select 0 as vlComision
		return;  
	end
	
	set @dsCodigoDestinos_param = REPLACE (@dsCodigoDestinos_param,'|','),(')	
	create table #tmp_datos_destinos ( tpOperacion varchar(20),  cdComision int, vlPrecioViaje float)
	set @dsCodigoDestinos_param = ' insert  #tmp_datos_destinos(tpOperacion, cdComision, vlPrecioViaje) 
											values (' + @dsCodigoDestinos_param +');'
		
	insert into #tmp_datos_destinos execute(@dsCodigoDestinos_param)
			
	CREATE TABLE #tmp_comision (vlComision float);

	DECLARE  @tpOperacion VARCHAR(50)

	IF (select count(*) from #tmp_datos_destinos)=1  
	BEGIN
		select @tpOperacion =   tpOperacion from #tmp_datos_destinos
		IF @tpOperacion = 'RETORNO'  -- NUEVO TIPO DE OPERACION V 4.9.833
		BEGIN
			
			SELECT @vlComision=CASE  @tpCliente_param 
	        WHEN 'A Empleados' THEN vlComisionEmpleados ELSE vlComision END
			FROM  TB_Comisiones WHERE (tpComision = 'Retorno') AND (flEliminar = 0)

			-- informamos la comision de retorno	 
			SELECT 	@vlComision 
			RETURN;
		END
	END

	if @tpComision_param = 'RETORNO' 
	begin
		-- print 'Obtenemos la comisión para retorno'
		insert into #tmp_comision exec SP_obtenerComisionRetorno_v3_4 
			 @vlTotalGeneral_param,  
			 @tpComision_param,  
			 @tpCliente_param,  
			 @dsCodigoDestinos_param
		-- informamos la comision de retorno	 
		select 	vlComision from #tmp_comision	
		return;
	end

    print 'Calculamos la comisión para viajes'
    
    select @total_sin_recargos = sum(vlPrecioViaje) from 
						#tmp_datos_destinos where tpOperacion<>'Recargo+Comi' or tpOperacion is null
    
   select @total_sin_recargos = isnull(@total_sin_recargos,0) 
   
   select @vlComision_sin_recargos =  case @tpComision_param
										when  'A Empleados' then isnull(vlComisionEmpleados,0)
										when  'A Clientes'  then isnull(vlComision,0)
									   end 
							from tb_Comisiones
							where  flEliminar = 0  AND  
								   vlMontoMinimo <= @total_sin_recargos AND
								   vlMontoMaximo >= @total_sin_recargos AND 
								   tpComision = 'Viaje'
    
   select @vlComision_sin_recargos = isnull(@vlComision_sin_recargos,0) 
    
   select @vlComision_recargos = case @tpComision_param
										when  'A Empleados' then sum(isnull(vlComisionEmpleados,0))
										when  'A Clientes'  then sum(isnull(vlComision,0))
									   end  from 
								#tmp_datos_destinos desti inner join  TB_Comisiones comi 
								on  desti.cdComision = comi.cdComision
								where tpOperacion='Recargo+Comi'
										and    comi.vlMontoMinimo <= desti.vlPrecioViaje AND
											   comi.vlMontoMaximo >= desti.vlPrecioViaje   
   
   
   select @vlComision_recargos = isnull(@vlComision_recargos,0) 
   
   
   if exists (select * from #tmp_datos_destinos
							where  tpOperacion = 'Factura-Comi')
   begin
	select 0 vlComision
	return;
   end
   
							
   -- comision viajes + recargos
   select (@vlComision_sin_recargos + @vlComision_recargos) vlComision
						  

end

GO 


 /*******************************************************************/  
/* Modificado en la version 3.7        */  
ALTER procedure [dbo].[rpt_cierredecaja_v3_7]  
@nrCaja_param  numeric  
as  
begin 
 
	declare @Cantidad_Viajes           int  
	declare @Cantidad_Facturas         int  
	declare @Cantidad_Facturas_A       int  
	declare @cantidad_cta_cte          int  
	declare @Cantidad_Anuladas         int   
	declare @Cantidad_Contado          int   
	declare @Cantidad_Retorno          int  
	declare @Cantidad_Cobro_en_Destino int  
	declare @nro_factura_inicial       varchar(12)  
	declare @nro_factura_final         varchar(12)  
	declare @nro_factura_inicial_A     varchar(12)  
	declare @nro_factura_final_A       varchar(12)  
	declare @nro_Recibo_inicial        varchar(12)  
	declare @nro_Recibo_final          varchar(12)  
	declare @nro_factura_manual_inicial       varchar(12)  
	declare @nro_factura_manual_final         varchar(12)  
	declare @nro_factura_manual_inicial_A     varchar(12)  
	declare @nro_factura_manual_final_A       varchar(12)  
	declare @nro_Recibo_manual_inicial        varchar(12)  
	declare @nro_Recibo_manual_final          varchar(12)  
	declare @vlPagoReales					  float
	declare @vlDiaReal						  float
	declare @vlPesosMenosRealesPesificados    float
	declare @vlCierrePesos                    float   
	declare @vlRealesPesificados                    float 
	
	  
	  
	 SET @Cantidad_Viajes           = 0  
	 SET @Cantidad_Facturas         = 0  
	 SET @Cantidad_Facturas_A       = 0  
	 SET @cantidad_cta_cte          = 0  
	 SET @Cantidad_Anuladas         = 0   
	 SET @Cantidad_Contado          = 0   
	 SET @Cantidad_Retorno          = 0  
	 SET @Cantidad_Cobro_en_Destino = 0  
	 SET @nro_factura_inicial       = 0  
	 SET @nro_factura_final         = 0  
	 SET @nro_factura_inicial_A     = 0  
	 SET @nro_factura_final_A       = 0  
	 SET @nro_Recibo_inicial        = 0  
	 SET @nro_Recibo_final          = 0  
	 
	 
	 set @vlCierrePesos  = 0 
	 set @vlRealesPesificados  = 0
	 set @vlPagoReales =0 
	  
	 select  a.nrCaja,  
	  a.nrPuesto,  
	  a.dsUsuario,  
	  a.dtApertura,  
	  a.dtCierre,  
	  convert(varchar(5),a.dtApertura,108) as hrApertura,  
	  a.hrCierre,   
	  a.flEstado,  
	  a.flCajaAdm,  
	  a.vlSaldoInicialPesos,  
	  a.vlSaldoInicialEuros,  
	  a.vlDiaDolar,  
	  a.vlDiaEuro,   
	  a.vlSaldoFinalPesos,  
	  a.vlSaldoInicialDolares,  
	  a.vlSaldoFinalDolares,  
	  a.vlSaldoFinalEuros,   
	  a.vlSaldoFinalRealPesos,  
	  a.vlSaldoFinalRealEuros,  
	  a.vlSaldoFinalRealDolares,  
	  a.vlCierrePesos,   
	  a.vlCierreDolares,  
	  a.vlCierreEuros,  
	  a.vlTotalSaldoFinalReal,  
	  a.vlTotalSaldoFinal,  
	  a.vlTotalSaldoInicial,   
	  a.vlTotalSaldoCierre,  
	  a.dsDiferenciaDeCierre,  
	  a.vlDiferenciaDeCierre,  
	  a.dsObservacion,   
	  a.dtObservacion,  
	  @Cantidad_Viajes   as 'Cantidad_Viajes' ,  
	  @Cantidad_Contado  as 'Cantidad_Contado',  
	  @Cantidad_cta_cte  as 'Cantidad_cta_cte',  
	  @Cantidad_Retorno  as 'Cantidad_Retorno',     
	  @Cantidad_Anuladas as 'Cantidad_Anuladas',  
	  @Cantidad_Cobro_en_Destino as 'Cantidad_Cobro_en_Destino',  
	  isnull(b.nmNombre,'')+' '+isnull(b.nmApellido,'') as 'Nombre_Cajera',   
	  c.dsPuesto  as 'Descripcion_Puesto',  
	  @nro_factura_inicial        as 'nro_factura_inicial',  
	  @nro_factura_final          as 'nro_factura_final',  
	  @nro_factura_inicial_A      as 'nro_factura_inicial_A',  
	  @nro_factura_final_A        as 'nro_factura_final_A',  
	  @nro_Recibo_inicial         as 'nro_Recibo_inicial',  
	  @nro_Recibo_final           as 'nro_Recibo_final',  
	  @nro_factura_manual_inicial     as 'nro_factura_manual_inicial',  
	  @nro_factura_manual_final       as 'nro_factura_manual_final'  ,  
	  @nro_factura_manual_inicial_A   as 'nro_factura_manual_inicial_A' ,  
	  @nro_factura_manual_final_A     as 'nro_factura_manual_final_A',  
	  @nro_Recibo_manual_inicial      as 'nro_Recibo_manual_inicial',  
	  @nro_Recibo_manual_final        as 'nro_Recibo_manual_final',  
	  @vlPagoReales as  'vlPagoReales',   
	  a.vlDiaReal    as  'vlDiaReal',
	  @vlPesosMenosRealesPesificados as 'vlPesosMenosRealesPesificados', 
	  @vlRealesPesificados as 'vlRealesPesificados',
	   --- columnas agregadas en la version 3.7
	   isnull(vlSaldoInicialReales,0) as  vlSaldoInicialReales,
	   isnull(vlSaldoFinalReales,0) as vlSaldoFinalReales ,
	   isnull(vlSaldoFinalRealReales,0) as vlSaldoFinalRealReales ,
	   isnull(vlCierreReales,0) as vlCierreReales  ,
	   isnull(vlFondoFijoReales,0) as vlFondoFijoReales  
 	 into #Resumen_Caja_Puesto  
	 from         TB_Cajas a, TB_usuarios b, TB_Puestos c  
	 where   (a.nrCaja = @nrCaja_param) and   
	   a.dsUsuario=b.dsUsuario   and   
	   a.nrPuesto = c.nrPuesto   
	            
	  
	 select @Cantidad_Viajes=count(*)   
	 from   TB_Comprobantes   
	 where  flAnulado=0 and nrCaja=@nrCaja_param  
	   
	  
	 select @Cantidad_Contado=count(*)   
	 from   TB_Comprobantes   
	 where  flAnulado=0 and nrCaja=@nrCaja_param and   
			cdCondVenta='Contado'  
	  
	 select @Cantidad_cta_cte=count(*)   
	 from   TB_Comprobantes   
	 where  flAnulado=0 and nrCaja=@nrCaja_param and   
			cdCondVenta='Cuenta Corriente'  
	  
	 select @Cantidad_Retorno=count(*)   
	 from   TB_Comprobantes   
	 where  flAnulado=0 and nrCaja=@nrCaja_param and  
			cdCondVenta='Retorno'  
	  
	 select @Cantidad_Cobro_en_Destino=count(*)   
	 from   TB_Comprobantes   
	 where  flAnulado=0 and nrCaja=@nrCaja_param and  
			cdCondVenta='Cobro en Destino'  
	  
	 select @Cantidad_Anuladas=count(*)   
	 from   TB_Comprobantes   
	 where  flAnulado=1 and nrCaja=@nrCaja_param   
	  
	 select @nro_factura_inicial=min(convert(numeric,nrComprobante)),  
			@nro_factura_final=max(convert(numeric,nrComprobante))  
	 from   TB_Comprobantes   
	 where  nrCaja=@nrCaja_param and  
			tpLetra='B' and flManual='N'  
	  
	  
	 select @nro_factura_inicial_A=min(convert(numeric,nrComprobante)),  
			@nro_factura_final_A=max(convert(numeric,nrComprobante))  
	 from   TB_Comprobantes   
	 where  nrCaja=@nrCaja_param and  
			tpLetra='A'  and flManual='N'  
	  
	 select @nro_Recibo_inicial=min(convert(numeric,nrComprobante)),  
			@nro_Recibo_final=max(convert(numeric,nrComprobante))  
	 from   TB_Comprobantes   
	 where  nrCaja=@nrCaja_param and  
			tpLetra='X'  and flManual='N'  
	   
	 -------------------------------------------------------------------  
	 --- inicio talonario manual ---  
	 select @nro_factura_manual_inicial=min(convert(numeric,nrComprobante)),  
			@nro_factura_manual_final=max(convert(numeric,nrComprobante))  
	 from   TB_Comprobantes   
	 where  nrCaja=@nrCaja_param and  
			tpLetra='B' and flManual='M'  
	  
	 select @nro_factura_manual_inicial_A=min(convert(numeric,nrComprobante)),  
			@nro_factura_manual_final_A=max(convert(numeric,nrComprobante))  
	 from   TB_Comprobantes   
	 where  nrCaja=@nrCaja_param and  
			tpLetra='A'  and flManual='M'  
	  
	 select @nro_Recibo_manual_inicial=min(convert(numeric,nrComprobante)),  
			@nro_Recibo_manual_final=max(convert(numeric,nrComprobante))  
	 from   TB_Comprobantes   
	 where  nrCaja=@nrCaja_param and  
			tpLetra='X'  and flManual='M'  
	 --- fin talonario manual ---  
	  
	  
	 select @nro_factura_inicial=isnull(@nro_factura_inicial,'--')  
	 select @nro_factura_final=isnull(@nro_factura_final,'--')  
	 select @nro_Recibo_inicial=isnull(@nro_Recibo_inicial,'--')  
	 select @nro_Recibo_final=isnull(@nro_Recibo_final,'--')  
	 select @nro_factura_inicial_A =isnull(@nro_factura_inicial_A,'--')  
	 select @nro_factura_final_A   =isnull(@nro_factura_final_A,'--')  
	  
	 select @nro_factura_manual_inicial=isnull(@nro_factura_manual_inicial,'--')  
	 select @nro_factura_manual_final=isnull(@nro_factura_manual_final,'--')  
	 select @nro_Recibo_manual_inicial=isnull(@nro_Recibo_manual_inicial,'--')  
	 select @nro_Recibo_manual_final=isnull(@nro_Recibo_manual_final,'--')  
	 select @nro_factura_manual_inicial_A =isnull(@nro_factura_manual_inicial_A,'--')  
	 select @nro_factura_manual_final_A   =isnull(@nro_factura_manual_final_A,'--')  
	  
	 	  
	 select @vlPagoReales = ISNULL( sum(vlPagoReales) ,0)
	 from   TB_Comprobantes   
	 where  flAnulado=0 and nrCaja=@nrCaja_param  
	 
	 select @vlCierrePesos = vlCierrePesos
	 from   #Resumen_Caja_Puesto 
	 where  nrCaja = @nrCaja_param
	 
	 
	 select top 1 @vlDiaReal =a.vlDiaReal from #Resumen_Caja_Puesto a
	 
	 set @vlPesosMenosRealesPesificados  = @vlCierrePesos - (@vlDiaReal * @vlPagoReales)
	 set @vlRealesPesificados = (@vlDiaReal * @vlPagoReales)
	  
	 update #Resumen_Caja_Puesto  
	 set   Cantidad_Viajes   = @Cantidad_Viajes,  
		   Cantidad_Contado  = @Cantidad_Contado,  
		   Cantidad_cta_cte  = @Cantidad_cta_cte,  
		   Cantidad_Retorno  = @Cantidad_Retorno,     
		   Cantidad_Anuladas = @Cantidad_Anuladas,  
		   Cantidad_Cobro_en_Destino=@Cantidad_Cobro_en_Destino,  
		   nro_factura_inicial=@nro_factura_inicial,  
		   nro_factura_final=@nro_factura_final,  
		   nro_factura_inicial_A=@nro_factura_inicial_A,  
		   nro_factura_final_A=@nro_factura_final_A,  
		   nro_Recibo_inicial=@nro_Recibo_inicial,  
		   nro_Recibo_final=@nro_Recibo_final,  
		   nro_factura_manual_inicial=@nro_factura_manual_inicial,  
		   nro_factura_manual_final=@nro_factura_manual_final,  
		   nro_Recibo_manual_inicial=@nro_Recibo_manual_inicial,  
		   nro_Recibo_manual_final=@nro_Recibo_manual_final,  
		   nro_factura_manual_inicial_A =@nro_factura_manual_inicial_A,  
		   nro_factura_manual_final_A   =@nro_factura_manual_final_A,
		   vlDiaReal = isnull(@vlDiaReal,0), 
		   vlPagoReales = isnull(@vlPagoReales,0),
		   vlPesosMenosRealesPesificados = isnull(@vlPesosMenosRealesPesificados,0),
		   vlRealesPesificados =isnull( @vlRealesPesificados,0)		
	 where nrcaja = @nrCaja_param  

	 
	  
	 select top 1 * from #Resumen_Caja_Puesto  

end;
  








