-- Cambios de DDL version 4.9.72
use dbSG2000
go

-- sp_helptext 'dbo.f_sepuedecompensar_2_0' 

IF exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='f_sepuedecompensar_2_1'  )
	DROP FUNCTION  [dbo].f_sepuedecompensar_2_1  

GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE FUNCTION  dbo.f_sepuedecompensar_2_1(@dtcupon DATETIME, @restriccion_dias INT, 
										@restriccion_Hora VARCHAR(8), @fecha_de_hoy DATETIME, @tpCupon CHAR(20),
										@flCobradoCliente as BIT, @dtCobradoCliente as DATE)  
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

DECLARE @dtcupon_hora_corte    DATETIME
DECLARE @sepuedecompensar      INT

	IF (@tpCupon = 'Tarjeta de Crédito' Or @tpCupon = 'Tarjeta de Débito' Or @tpCupon = 'Todo Pago' )
	BEGIN
		if @flCobradoCliente = 0 
		BEGIN
			SET @sepuedecompensar=0
			return @sepuedecompensar; 
		END
		If @dtCobradoCliente <= @fecha_de_hoy 
			SET @sepuedeCompensar = 1
        ELSE  
			SET @sepuedeCompensar = 0
		RETURN @sepuedecompensar; 
	END


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


/*

If (ptpCupon = "Tarjeta de Crédito" Or ptpCupon = "Tarjeta de Débito" Or ptpCupon = "Todo Pago") Then
            
            ' Aqui tambien se debe Analizar la dtflCobradoalCliente
            ' MsgBox "Aquí tambien se debe Analizar la Fecha de Cobro del viaje en tarjeta ", vbCritical
            
            If pflCobradoalCliente = "SI" Then
                Dim fecha_del_dia As Date
                pdtCobradoCliente = Left(pdtCobradoCliente, 10)
                fecha_del_dia = CDate(Left(Now(), 10))
            
                If CDate(pdtCobradoCliente) <= fecha_del_dia Then
                    sepuedeCompensar = True
                Else
                    sepuedeCompensar = False
                End If
            Else
                sepuedeCompensar = False
            End If
        End If

*/




-- sp_helptext 'sp_obtiene_falta_compensar_v4_2' 


GO



IF exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='sp_obtiene_falta_compensar_v4_9_72'  )
	DROP PROCEDURE  [dbo].sp_obtiene_falta_compensar_v4_9_72  

GO
	

/*
select * from tb_cupones where tpCupon = 'Todo Pago' and ( vlPagoEuros = 0 OR vlPagoDolares = 0 or vlPagoReales = 0  )  


set dateformat dmy
Exec sp_obtiene_falta_compensar_v4_2
Exec sp_obtiene_falta_compensar_v4_9_72 @mostrar_detalles = 'S'


*/
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- incluir logica de reales
CREATE  procedure sp_obtiene_falta_compensar_v4_9_72   ( @mostrar_detalles as CHAR(1)='N' ) 
as  
begin  
declare @fecha_corte datetime  
declare @RESTRICCION_COMPENSACION_ACTIVADA    varchar(50)  
declare @RESTRICCION_COMPENSACION_HORA_PAGO   varchar(50)  
declare @RESTRICCION_COMPENSACION_DIAS_PAGO   int  
  
  
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
         tpCupon ,suma_vlPagoPesos = CASE tpCupon  
		   WHEN 'Contado' THEN  isnull(SUM(vlPagoPesos)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cuenta Corriente' THEN isnull(SUM(vlMontoCupon)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Retorno' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cobro en Destino'   THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)  
		   WHEN 'Tarjeta de Crédito' THEN isnull(SUM(vlMontoCupon)- sum( vlComision+isnull(vlIVA,0) +  vlRecargoTarjeta  ),0)  
		   WHEN 'Tarjeta de Débito'  THEN isnull(SUM(vlMontoCupon)- sum( vlComision+isnull(vlIVA,0) +  vlRecargoTarjeta  ),0)  
		   WHEN 'Todo Pago'			 THEN isnull(SUM(vlMontoCupon)- sum( vlComision+isnull(vlIVA,0) + vlRecargoTarjeta ),0)  
         END,  
         isnull(SUM(vlPagoEuros),0)   AS   suma_vlPagoEuros,   
         isnull(SUM(vlPagoDolares),0) AS   suma_vlPagoDolares, 
         isnull(SUM(vlPagoReales),0)  AS   suma_vlPagoReales
         INTO #tb_falta_compensar_agrupado  
  FROM TB_Cupones  
  WHERE (flCompensado = 0) AND (flAnulado = 0) AND   
      tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino', 'Tarjeta de Crédito' ,  'Tarjeta de Débito' , 'Todo Pago') AND   
      nrLicencia NOT IN (999, 998, 990)   
      and dbo.f_sepuedecompensar_2_1(dtCupon,@RESTRICCION_COMPENSACION_DIAS_PAGO,@RESTRICCION_COMPENSACION_HORA_PAGO,getdate()
									 , tpCupon, flCobradoalCliente , dtCobradoalCliente)=1  
  Group by tpCupon --, dtCupon  
  
  select isnull(sum(suma_vlPagoPesos),0)   as suma_vlPagoPesos,  
         isnull(sum(suma_vlPagoEuros),0)   as suma_vlPagoEuros,  
         isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares,  
         isnull(sum(suma_vlPagoReales),0)  as suma_vlPagoReales, 
         (convert(varchar,getdate() - @RESTRICCION_COMPENSACION_DIAS_PAGO,103) + ' ' + @RESTRICCION_COMPENSACION_HORA_PAGO) as dtcupon_hora_corte  
  from #tb_falta_compensar_agrupado  
  
 end  
 else  
 begin   
  SELECT --dtCupon, nrLicencia,  
         tpCupon,suma_vlPagoPesos = CASE tpCupon  
		   WHEN 'Contado' THEN  isnull(SUM(vlPagoPesos)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cuenta Corriente' THEN isnull(SUM(vlMontoCupon)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Retorno' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cobro en Destino'   THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)  
		   WHEN 'Tarjeta de Crédito' THEN isnull(SUM(vlMontoCupon)- sum( vlComision+isnull(vlIVA,0) +  vlRecargoTarjeta  ),0)  
		   WHEN 'Tarjeta de Débito'  THEN isnull(SUM(vlMontoCupon)- sum( vlComision+isnull(vlIVA,0) +  vlRecargoTarjeta  ),0)  
		   WHEN 'Todo Pago'			 THEN isnull(SUM(vlMontoCupon)- sum( vlComision+isnull(vlIVA,0) + vlRecargoTarjeta ),0) 
         END,  
         isnull(SUM(vlPagoEuros),0)   AS   suma_vlPagoEuros,   
         isnull(SUM(vlPagoDolares),0) AS   suma_vlPagoDolares, 
         isnull(SUM(vlPagoReales),0)  AS   suma_vlPagoReales 
         INTO #tb_falta_compensar_agrupado_sin_restri  
  FROM TB_Cupones  
  WHERE (flCompensado = 0) AND (flAnulado = 0) AND   
      tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND   
      nrLicencia NOT IN (999, 998, 990)   
  Group by tpCupon  
  
  select isnull(sum(suma_vlPagoPesos),0)   as suma_vlPagoPesos,  
         isnull(sum(suma_vlPagoEuros),0)   as suma_vlPagoEuros,  
         isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares,  
         isnull(sum(suma_vlPagoReales),0)  as suma_vlPagoReales, 
         'Sin restricción'				   as dtcupon_hora_corte  
  from #tb_falta_compensar_agrupado_sin_restri  
  
 end   

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-- mostramos detalle del saldo  
 IF  ( @mostrar_detalles ='N' ) 
		RETURN; 



 if @RESTRICCION_COMPENSACION_ACTIVADA='SI'  
 begin  
  select @RESTRICCION_COMPENSACION_HORA_PAGO=vlParametro from TB_Parametros where  dsParametro='RESTRICCION_COMPENSACION_HORA_PAGO'  
  select @RESTRICCION_COMPENSACION_DIAS_PAGO=convert(int,vlParametro) from TB_Parametros where  dsParametro='RESTRICCION_COMPENSACION_DIAS_PAGO'  
  
   
  ---SET @fecha_corte=Convert(datetime,CONVERT(varchar, getdate()-@RESTRICCION_COMPENSACION_DIAS_PAGO, 103)   
           ---+ ' '+@RESTRICCION_COMPENSACION_HORA_PAGO)  
   
  PRINT 'DETALLE VIAJES SALDO A COMPENSAR'  
   
  SELECT tpComprobanteCliente as 'DOC' , tpLetraCliente as 'LETRA' ,  nrTalonarioCliente as 'PDV' , nrComprabanteCliente 'NRO',   dtCupon as 'FECHA', 
		 nrLicencia as 'LICENCIA',  tpCupon 'COND.VENTA', 'PESOS' = CASE tpCupon  
		   WHEN 'Contado' THEN  isnull((vlPagoPesos)- (vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cuenta Corriente' THEN isnull((vlMontoCupon)- (vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Retorno' THEN isnull((0)- (vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cobro en Destino'   THEN isnull((0)- (vlComision+isnull(vlIVA,0)),0)  
		   WHEN 'Tarjeta de Crédito' THEN isnull((vlMontoCupon)- ( vlComision+isnull(vlIVA,0) +  vlRecargoTarjeta  ),0)  
		   WHEN 'Tarjeta de Débito'  THEN isnull((vlMontoCupon)- ( vlComision+isnull(vlIVA,0) +  vlRecargoTarjeta  ),0)  
		   WHEN 'Todo Pago'			 THEN isnull((vlMontoCupon)- ( vlComision+isnull(vlIVA,0) + vlRecargoTarjeta ),0)  
         END,  
         isnull(vlPagoEuros,0)   AS   'EUROS',   
         isnull(vlPagoDolares,0) AS   'DOLARES', 
         isnull(vlPagoReales,0)  AS   'REALES',
		 flCobradoalCliente      AS 'COBRO_CONCILIADO',
		 dtCobradoalCliente      AS 'FECHA_COBRO_CONCILIADO'
  FROM TB_Cupones  
  WHERE (flCompensado = 0) AND (flAnulado = 0) AND   
      tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino', 'Tarjeta de Crédito' ,  'Tarjeta de Débito' , 'Todo Pago') AND   
      nrLicencia NOT IN (999, 998, 990)   
	  and dbo.f_sepuedecompensar_2_1(dtCupon,@RESTRICCION_COMPENSACION_DIAS_PAGO,@RESTRICCION_COMPENSACION_HORA_PAGO,getdate()
									 , tpCupon, flCobradoalCliente , dtCobradoalCliente)=1  
  
    PRINT 'DETALLE VIAJES SALDO A COMPENSAR - NO LLEGO A FECHA '  

    SELECT tpComprobanteCliente as 'DOC' , tpLetraCliente as 'LETRA' ,  nrTalonarioCliente as 'PDV' , nrComprabanteCliente 'NRO',   dtCupon as 'FECHA', 
		 nrLicencia as 'LICENCIA',  tpCupon 'COND.VENTA', 'PESOS' = CASE tpCupon  
		   WHEN 'Contado' THEN  isnull((vlPagoPesos)- (vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cuenta Corriente' THEN isnull((vlMontoCupon)- (vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Retorno' THEN isnull((0)- (vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cobro en Destino'   THEN isnull((0)- (vlComision+isnull(vlIVA,0)),0)  
		   WHEN 'Tarjeta de Crédito' THEN isnull((vlMontoCupon)- ( vlComision+isnull(vlIVA,0) +  vlRecargoTarjeta  ),0)  
		   WHEN 'Tarjeta de Débito'  THEN isnull((vlMontoCupon)- ( vlComision+isnull(vlIVA,0) +  vlRecargoTarjeta  ),0)  
		   WHEN 'Todo Pago'			 THEN isnull((vlMontoCupon)- ( vlComision+isnull(vlIVA,0) + vlRecargoTarjeta ),0)  
         END,  
         isnull(vlPagoEuros,0)   AS   'EUROS',   
         isnull(vlPagoDolares,0) AS   'DOLARES', 
         isnull(vlPagoReales,0)  AS   'REALES',
		 flCobradoalCliente      AS 'COBRO_CONCILIADO',
		 dtCobradoalCliente      AS 'FECHA_COBRO_CONCILIADO'
  FROM TB_Cupones  
  WHERE (flCompensado = 0) AND (flAnulado = 0) AND   
      tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino', 'Tarjeta de Crédito' ,  'Tarjeta de Débito' , 'Todo Pago') AND   
      nrLicencia NOT IN (999, 998, 990)   
	  and dbo.f_sepuedecompensar_2_1(dtCupon,@RESTRICCION_COMPENSACION_DIAS_PAGO,@RESTRICCION_COMPENSACION_HORA_PAGO,getdate()
									 , tpCupon, flCobradoalCliente , dtCobradoalCliente)=0 

 
 end  
 else  
 begin   


PRINT 'DETALLE VIAJES SALDO A COMPENSAR - SIN RESTRICCION DE FECHA DE CORTE '  

  SELECT tpComprobanteCliente as 'DOC' , tpLetraCliente as 'LETRA' ,  nrTalonarioCliente as 'PDV' , nrComprabanteCliente 'NRO',   dtCupon as 'FECHA', 
		 nrLicencia as 'LICENCIA',  tpCupon 'COND.VENTA', 'PESOS' = CASE tpCupon  
		   WHEN 'Contado' THEN  isnull((vlPagoPesos)- (vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cuenta Corriente' THEN isnull((vlMontoCupon)- (vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Retorno' THEN isnull((0)- (vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cobro en Destino'   THEN isnull((0)- (vlComision+isnull(vlIVA,0)),0)  
		   WHEN 'Tarjeta de Crédito' THEN isnull((vlMontoCupon)- ( vlComision+isnull(vlIVA,0) +  vlRecargoTarjeta  ),0)  
		   WHEN 'Tarjeta de Débito'  THEN isnull((vlMontoCupon)- ( vlComision+isnull(vlIVA,0) +  vlRecargoTarjeta  ),0)  
		   WHEN 'Todo Pago'			 THEN isnull((vlMontoCupon)- ( vlComision+isnull(vlIVA,0) + vlRecargoTarjeta ),0)  
         END,  
         isnull(vlPagoEuros,0)   AS   'EUROS',   
         isnull(vlPagoDolares,0) AS   'DOLARES', 
         isnull(vlPagoReales,0)  AS   'REALES',
		 flCobradoalCliente      AS 'COBRO_CONCILIADO',
		 dtCobradoalCliente      AS 'FECHA_COBRO_CONCILIADO'
  FROM TB_Cupones  
  WHERE (flCompensado = 0) AND (flAnulado = 0) AND   
      tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND   
      nrLicencia NOT IN (999, 998, 990)   

  
 end   


end -- fin de procedure  
  


GO


IF exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_rpt_Productos_v4_9_72'  )
	DROP PROCEDURE  [dbo].spu_rpt_Productos_v4_9_72  

GO
	
/*
		sp_helptext 'SP_GeneraTarifas'
		sp_helptext 'SP_ActualizarProductos'
*/


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************************************************
/*

exec [spu_rpt_Productos_v4_9_72]  @flCapitalFederal_param = 1 
 
*/
CREATE PROCEDURE [spu_rpt_Productos_v4_9_72] @flCapitalFederal_param bit
AS


	/* 

	Me.vlRecargo_TD = Round(lmProductos(nI).vlPrecioViaje * Me.PORC_RECARGO_TD / 100, 0)
	Me.vlRecargo_TC = Round(lmProductos(nI).vlPrecioViaje * Me.PORC_RECARGO_TC / 100, 0)
	Me.vlRecargo_TP = Round(lmProductos(nI).vlPrecioViaje * Me.PORC_RECARGO_TP / 100, 0)
	Me.vlPrecio_TD = Round(lmProductos(nI).vlPrecioViaje + (lmProductos(nI).vlPrecioViaje * Me.PORC_RECARGO_TD / 100), 0)
	Me.vlPrecio_TC = Round(lmProductos(nI).vlPrecioViaje + (lmProductos(nI).vlPrecioViaje * Me.PORC_RECARGO_TC / 100), 0)
	Me.vlPrecio_TP = Round(lmProductos(nI).vlPrecioViaje + (lmProductos(nI).vlPrecioViaje * Me.PORC_RECARGO_TP / 100), 0)

	PORC_RECARGO_TD 
    PORC_RECARGO_TC 
    PORC_RECARGO_TP 

	select @PORC_RECARGO_TD = vlParametro from tb_parametros  where dsParametro = 'PORC_RECARGO_TD'
	select @PORC_RECARGO_TC = vlParametro from tb_parametros  where dsParametro = 'PORC_RECARGO_TC'
	select @PORC_RECARGO_TP = vlParametro  from tb_parametros  where dsParametro = 'PORC_RECARGO_TP'

	*/

set dateformat dmy
exec SP_GeneraTarifas


declare  @PORC_RECARGO_TD  as decimal(5,2)
declare  @PORC_RECARGO_TC  as decimal(5,2)
declare  @PORC_RECARGO_TP  as decimal(5,2)


	select @PORC_RECARGO_TD = replace(isnull(vlParametro,0) , ',', '.') from tb_parametros  where dsParametro = 'PORC_RECARGO_TD'
	select @PORC_RECARGO_TC = replace(isnull(vlParametro,0)  , ',', '.') from tb_parametros  where dsParametro = 'PORC_RECARGO_TC'
	select @PORC_RECARGO_TP =  replace(isnull(vlParametro,0)  , ',', '.')  from tb_parametros  where dsParametro = 'PORC_RECARGO_TP'

	print @PORC_RECARGO_TD
	print @PORC_RECARGO_TC
	print @PORC_RECARGO_TP

if @flCapitalFederal_param=1
	SELECT  TB_Productos.cdProducto, 
			TB_Productos.dsProducto, 
			TB_Productos.vlPrecioViaje, 
			TB_Productos.vlPrecioPeaje, 
			TB_Productos.cdOrden, 
			TB_Productos.vlPrecioViajeSinPeaje,
			'vlPrecio_TD' = Round(TB_Productos.vlPrecioViaje +  isnull( ( TB_Productos.vlPrecioViaje *  @PORC_RECARGO_TD ) / 100 , 0 ),0),
			'vlPrecio_TC' = Round(TB_Productos.vlPrecioViaje +  isnull( ( TB_Productos.vlPrecioViaje *  @PORC_RECARGO_TC ) / 100 , 0 ),0),
			'vlPrecio_TP' = Round(TB_Productos.vlPrecioViaje +  isnull( ( TB_Productos.vlPrecioViaje *  @PORC_RECARGO_TP ) / 100 , 0 ),0)
	FROM
   			TB_Productos TB_Productos
	WHERE
    	TB_Productos.flMuestra =1 And TB_Productos.dsProducto LIKE '%CAPITAL FEDERAL%' and  cdOrden is not null
	and TB_Productos.flEliminar =0
	ORDER BY TB_Productos.cdOrden ASC
else
	SELECT  TB_Productos.cdProducto, 
			TB_Productos.dsProducto, 
			TB_Productos.vlPrecioViaje, 
			TB_Productos.vlPrecioPeaje, 
			TB_Productos.cdOrden, 
			TB_Productos.vlPrecioViajeSinPeaje,
			'vlPrecio_TD' = Round(TB_Productos.vlPrecioViaje +  isnull( ( TB_Productos.vlPrecioViaje *  @PORC_RECARGO_TD ) / 100 , 0 ),0),
			'vlPrecio_TC' = Round(TB_Productos.vlPrecioViaje +  isnull( ( TB_Productos.vlPrecioViaje *  @PORC_RECARGO_TC ) / 100 , 0 ),0),
			'vlPrecio_TP' = Round(TB_Productos.vlPrecioViaje +  isnull( ( TB_Productos.vlPrecioViaje *  @PORC_RECARGO_TP ) / 100 , 0 ),0)
	FROM
   		TB_Productos TB_Productos
	WHERE
    	TB_Productos.flMuestra =1 And TB_Productos.dsProducto <> '99 - PAGO DE CUPONES' And  not TB_Productos.dsProducto LIKE '%CAPITAL FEDERAL%'
	 and  cdOrden is not null
	and TB_Productos.flEliminar =0
	ORDER BY TB_Productos.cdOrden ASC


--*****************************************************************************************************************************




