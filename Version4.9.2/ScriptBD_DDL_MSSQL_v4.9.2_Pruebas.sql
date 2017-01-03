-- Cambios de DDL version 4.9
use dbSG2000_Pruebas
go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='rpt_cierredecaja_v4_9_2' )
	drop procedure  dbo.rpt_cierredecaja_v4_9_2

go


/*
  select  top 100  nrCaja , * from TB_Comprobantes  order by dtComprobante desc
  exec rpt_cierredecaja_v4_9 @nrCaja_param= 1000010084
 */

go 

 /*******************************************************************/  
/* Modificado en la version 3.7        */  
CREATE procedure rpt_cierredecaja_v4_9_2  
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
	
	-- Tarjeta de Débito / Tarjeta de Crédito

	-- variables de la version 4.9 
	declare @Cantidad_Tarjeta_de_Debito  float  	  
	declare @Cantidad_Tarjeta_de_Credito float  
	declare @Cantidad_Todo_Pago		     float
	    
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
	   isnull(vlFondoFijoReales,0) as vlFondoFijoReales  ,
	  @Cantidad_Tarjeta_de_Debito  as Cantidad_Tarjeta_de_Debito,   	  
	  @Cantidad_Tarjeta_de_Credito as Cantidad_Tarjeta_de_Credito,
	  @Cantidad_Todo_Pago as Cantidad_Todo_Pago
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


	-- Tarjeta de Débito / Tarjeta de Crédito
	 
	 select @Cantidad_Tarjeta_de_Debito=count(*)   
	 from   TB_Comprobantes   
	 where  flAnulado=0 and nrCaja=@nrCaja_param and  
			cdCondVenta='Tarjeta de Débito'  

	 select @Cantidad_Tarjeta_de_Credito=count(*)   
	 from   TB_Comprobantes   
	 where  flAnulado=0 and nrCaja=@nrCaja_param and  
			cdCondVenta='Tarjeta de Crédito'  
			

	 select @Cantidad_Todo_Pago =count(*)   
	 from   TB_Comprobantes   
	 where  flAnulado=0 and nrCaja=@nrCaja_param and  
			cdCondVenta='Todo Pago'  			


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
		   vlRealesPesificados =isnull( @vlRealesPesificados,0),		
		   Cantidad_Tarjeta_de_Debito = @Cantidad_Tarjeta_de_Debito,
		   Cantidad_Tarjeta_de_Credito = @Cantidad_Tarjeta_de_Credito,
		   Cantidad_Todo_Pago = @Cantidad_Todo_Pago
	 where nrcaja = @nrCaja_param  

	 
	 select * from #Resumen_Caja_Puesto  

end;