-- Cambios de DDL version 3.7
use dbSG2000_Pruebas
go
    
   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='vlPagoReales')
ALTER TABLE  [TB_Comprobantes] ADD  vlPagoReales [float] NULL;

go 

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='vlPagoReales')
ALTER TABLE  [TB_Cupones] ADD  vlPagoReales [float] NULL;

go 

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_RecibosDetalle' and COLUMN_NAME='vlPagoReales')
ALTER TABLE  [TB_RecibosDetalle] ADD  vlPagoReales [float] NULL;


go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlDiaReal')
ALTER TABLE  TB_Cajas ADD  vlDiaReal [float] NULL;


go


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='vlDiaReal')
ALTER TABLE  [TB_Comprobantes] ADD  vlDiaReal [float] NULL;

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes_Imprime' and COLUMN_NAME='vlPagoReales')
ALTER TABLE  [TB_Comprobantes_Imprime] ADD  vlPagoReales [float] NULL;

go 

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes_Imprime' and COLUMN_NAME='vlDiaReal')
ALTER TABLE  [TB_Comprobantes_Imprime] ADD  vlDiaReal [float] NULL;



go


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlSaldoInicialReales')
ALTER TABLE  TB_Cajas ADD  vlSaldoInicialReales [float] NULL;

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlSaldoFinalReales')
ALTER TABLE  TB_Cajas ADD  vlSaldoFinalReales [float] NULL;

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlSaldoFinalRealReales')
ALTER TABLE  TB_Cajas ADD  vlSaldoFinalRealReales [float] NULL;

go 


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlCierreReales')
ALTER TABLE  TB_Cajas ADD  vlCierreReales [float] NULL;

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlFondoFijoReales')
ALTER TABLE  TB_Cajas ADD  vlFondoFijoReales [float] NULL;

go 


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_ValoresDesimputacionesCajasPuestos' and COLUMN_NAME='vlCierreReales')
ALTER TABLE  TB_ValoresDesimputacionesCajasPuestos ADD  vlCierreReales [float] NULL;

go 

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlSumaCajasPuestosCierreReales')
ALTER TABLE  TB_Cajas ADD  vlSumaCajasPuestosCierreReales [float] NULL;


go 


ALTER TABLE dbo.TB_Comprobantes ADD CONSTRAINT
	DF_TB_Comprobantes_vlPagoReales DEFAULT 0 FOR vlPagoReales
go 

ALTER TABLE dbo.TB_Cupones ADD CONSTRAINT
	DF_TB_Cupones_vlPagoReales DEFAULT 0 FOR vlPagoReales

go 

ALTER TABLE dbo.TB_RecibosDetalle ADD CONSTRAINT
	DF_TB_RecibosDetalle_vlPagoReales DEFAULT 0 FOR vlPagoReales
go 

ALTER TABLE dbo.TB_Cajas ADD CONSTRAINT
	DF_TB_Cajas_vlDiaReal DEFAULT 0 FOR vlDiaReal

go 

ALTER TABLE dbo.TB_Comprobantes ADD CONSTRAINT
	DF_TB_Comprobantes_vlDiaReal DEFAULT 0 FOR vlDiaReal
go 

ALTER TABLE dbo.TB_Comprobantes_Imprime ADD CONSTRAINT
	DF_TB_Comprobantes_Imprime_vlDiaReal DEFAULT 0 FOR vlDiaReal
go 

ALTER TABLE dbo.TB_Cajas ADD CONSTRAINT
	DF_TB_Cajas_vlSaldoInicialReales DEFAULT 0 FOR vlSaldoInicialReales

go 

ALTER TABLE dbo.TB_Cajas ADD CONSTRAINT
	DF_TB_Cajas_vlSaldoFinalReales DEFAULT 0 FOR vlSaldoFinalReales

go 

ALTER TABLE dbo.TB_Cajas ADD CONSTRAINT
	DF_TB_Cajas_vlCierreReales DEFAULT 0 FOR vlCierreReales	

go 

ALTER TABLE dbo.TB_Cajas ADD CONSTRAINT
	DF_TB_Cajas_vlFondoFijoReales DEFAULT 0 FOR vlFondoFijoReales

go 

ALTER TABLE dbo.TB_ValoresDesimputacionesCajasPuestos ADD CONSTRAINT
	DF_TB_ValoresDesimputacionesCajasPuestos_vlCierreReales
	 DEFAULT 0 FOR vlCierreReales

go 

ALTER TABLE dbo.TB_Cajas ADD CONSTRAINT
	DF_TB_Cajas_vlSumaCajasPuestosCierreReales
	 DEFAULT 0 FOR vlSumaCajasPuestosCierreReales

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_PrepararReimpresiondeComprobante_v3_7]'))
drop procedure [dbo].[SP_PrepararReimpresiondeComprobante_v3_7]

go

/****************************************************************/
create PROCEDURE [dbo].[SP_PrepararReimpresiondeComprobante_v3_7] 
@nrTalonario char(4),
@nrComprobante char(12),
@tpComprobante char(2), 
@tpLetra char(1)
AS
begin 

	DELETE TB_ComprobantesDetalle_Imprime FROM TB_Comprobantes_Imprime,  TB_ComprobantesDetalle_Imprime
	WHERE TB_Comprobantes_Imprime.nrTalonario = TB_ComprobantesDetalle_Imprime.nrTalonario and
	 TB_Comprobantes_Imprime.nrComprobante = TB_ComprobantesDetalle_Imprime.nrComprobante and
	 TB_Comprobantes_Imprime.tpComprobante = TB_ComprobantesDetalle_Imprime.tpComprobante and
	 TB_Comprobantes_Imprime.tpLetra = TB_ComprobantesDetalle_Imprime.tpLetra
	and  datediff(minute,TB_Comprobantes_Imprime.dtInsercion, getdate())>2

	DELETE  TB_Comprobantes_Imprime FROM TB_Comprobantes_Imprime WHERE
	 datediff(minute,dtInsercion, getdate())>2


	DELETE TB_ComprobantesDetalle_Imprime FROM  TB_ComprobantesDetalle_Imprime
	WHERE  TB_ComprobantesDetalle_Imprime.nrTalonario=@nrTalonario AND
	TB_ComprobantesDetalle_Imprime.nrComprobante=@nrComprobante AND 
	TB_ComprobantesDetalle_Imprime.tpComprobante=@tpComprobante AND
	TB_ComprobantesDetalle_Imprime.tpLetra=@tpLetra 

	DELETE TB_Comprobantes_Imprime FROM  TB_Comprobantes_Imprime
	WHERE  TB_Comprobantes_Imprime.nrTalonario=@nrTalonario AND
	TB_Comprobantes_Imprime.nrComprobante=@nrComprobante AND 
	TB_Comprobantes_Imprime.tpComprobante=@tpComprobante AND
	TB_Comprobantes_Imprime.tpLetra=@tpLetra;

	INSERT INTO [TB_Comprobantes_Imprime]
	    (nrTalonario, nrComprobante, tpComprobante, tpLetra, 
	    dtComprobante, cdCondVenta, tpComision, cdCliente, 
	    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
	    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
	    flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
	    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
	    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
	    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
	    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
	    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
	    nmEmpleado,vlIVA,vlSubTotal,vlPagoReales,vlDiaReal)
	SELECT nrTalonario, nrComprobante, tpComprobante, tpLetra, 
	    dtComprobante, cdCondVenta, tpComision, cdCliente, 
	    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
	    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
	    flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
	    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
	    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
	    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
	    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
	    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
	    nmEmpleado,vlIVA,vlSubTotal, vlPagoReales, vlDiaReal
	FROM TB_Comprobantes WHERE TB_Comprobantes.nrTalonario=@nrTalonario AND
	TB_Comprobantes.nrComprobante=@nrComprobante AND 
	TB_Comprobantes.tpComprobante=@tpComprobante AND
	TB_Comprobantes.tpLetra=@tpLetra;


	INSERT INTO [TB_ComprobantesDetalle_Imprime]
	    (nrTalonario, nrComprobante, tpComprobante, tpLetra, nrItem, 
	    cdProducto, dsProducto, tpOperacion, qtCantidad, vlPorcentaje, 
	    vlPrecioPeaje, vlPrecioViaje, vlTotalItem, dtInsercion, 
	    flSincronizado)
	SELECT nrTalonario, nrComprobante, tpComprobante, tpLetra, 
	    nrItem, cdProducto, dsProducto, tpOperacion, qtCantidad, 
	    vlPorcentaje, vlPrecioPeaje, vlPrecioViaje, vlTotalItem, 
	    dtInsercion, flSincronizado
	FROM TB_ComprobantesDetalle WHERE TB_ComprobantesDetalle.nrTalonario=@nrTalonario AND
	TB_ComprobantesDetalle.nrComprobante=@nrComprobante AND 
	TB_ComprobantesDetalle.tpComprobante=@tpComprobante AND
	TB_ComprobantesDetalle.tpLetra=@tpLetra ;
	
	
	update  a
	set a.nrTelLicenciatario = isnull(b.nrTel,'5480-0066') 
	from TB_Comprobantes_Imprime a , TB_proveedores b
	where a.nrLicencia = b.nrLicencia and
	      a.nrTalonario=@nrTalonario  and
	      a.nrComprobante=@nrComprobante and
	      a.tpComprobante=@tpComprobante and 
	      a.tpLetra=@tpLetra;

return 1; 

end

go 



--select * from TB_Comprobantes_Imprime 
--select * from TB_Comprobantes where nrComprobante = '00000056'



go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes_ResumenCajaPuesto' and COLUMN_NAME='vlPagoReales')
ALTER TABLE  [TB_Comprobantes_ResumenCajaPuesto] ADD  vlPagoReales [float] NULL;

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes_ResumenCajaPuesto' and COLUMN_NAME='vlDiaReal')
ALTER TABLE  [TB_Comprobantes_ResumenCajaPuesto] ADD  vlDiaReal [float] NULL;

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_ObtenerResumenCajaPuesto_v3_7]'))
drop procedure [dbo].[SP_ObtenerResumenCajaPuesto_v3_7] 

go


CREATE PROCEDURE [SP_ObtenerResumenCajaPuesto_v3_7] @nrCaja as numeric 
AS  
begin 
	  
	/* poner la parte de eliminar de Registros Viejos , esto es para mejorar la perfomance*/  
	Delete  FROM TB_ComprobantesDetalle_ResumenCajaPuesto WHERE datediff(minute, TB_ComprobantesDetalle_ResumenCajaPuesto.dtInsercion,getdate())>3  
	  
	DELETE TB_ComprobantesDetalle_ResumenCajaPuesto FROM TB_ComprobantesDetalle_ResumenCajaPuesto,  
	TB_Comprobantes_ResumenCajaPuesto WHERE TB_Comprobantes_ResumenCajaPuesto.nrCaja =@nrCaja  
	  
	Delete  FROM TB_Comprobantes_ResumenCajaPuesto WHERE datediff(minute, TB_Comprobantes_ResumenCajaPuesto.dtInsercion,getdate())>3  
	Delete  FROM TB_Comprobantes_ResumenCajaPuesto WHERE TB_Comprobantes_ResumenCajaPuesto.nrCaja=@nrCaja  
	  
	  
	INSERT INTO [TB_Comprobantes_ResumenCajaPuesto]  
		(nrTalonario, nrComprobante, tpComprobante, tpLetra,   
		dtComprobante, cdCliente, cdCondVenta, tpComision,   
		tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros,   
		vlPagoDolares, dsLeyenda, flManual, dtInsercion,   
		flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto,   
		dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc,   
		dsRazonSocial, nmNombre, nmApellido, nmLicenciatario,   
		cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI,   
		dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1,   
		dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado,   
		nmEmpleado,  vlPagoReales,   vlDiaReal)  
	SELECT nrTalonario, nrComprobante, tpComprobante, tpLetra,   
		dtComprobante, cdCliente, cdCondVenta, tpComision,   
		tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros,   
		vlPagoDolares, dsLeyenda, flManual, getdate() as dtInsercion,   
		flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto,   
		dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc,   
		left(dsRazonSocial,100), nmNombre, nmApellido, nmLicenciatario,   
		cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI,   
		dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1,   
		left(dsOpcional2,100), dsOpcional3, dsOpcional4, flAnulado, dtAnulado,   
		nmEmpleado, vlPagoReales,   vlDiaReal
	FROM TB_Comprobantes  
	WHERE TB_Comprobantes.nrCaja=@nrCaja  
	  

	INSERT INTO TB_ComprobantesDetalle_ResumenCajaPuesto  
		(nrTalonario, nrComprobante, tpComprobante, tpLetra, nrItem,   
		cdProducto, dsProducto, tpOperacion, qtCantidad, vlPorcentaje,   
		vlPrecioPeaje, vlPrecioViaje, vlTotalItem, dtInsercion,   
		flSincronizado,nrCaja)   
	SELECT TB_ComprobantesDetalle.nrTalonario, TB_ComprobantesDetalle.nrComprobante,   
	TB_ComprobantesDetalle.tpComprobante, TB_ComprobantesDetalle.tpLetra,   
		TB_ComprobantesDetalle.nrItem, TB_ComprobantesDetalle.cdProducto,  
	 left(TB_ComprobantesDetalle.dsProducto,100), TB_ComprobantesDetalle.tpOperacion,   
	TB_ComprobantesDetalle.qtCantidad,   
		TB_ComprobantesDetalle.vlPorcentaje, TB_ComprobantesDetalle.vlPrecioPeaje,   
	TB_ComprobantesDetalle.vlPrecioViaje, TB_ComprobantesDetalle.vlTotalItem,   
		getdate() as dtInsercion, TB_ComprobantesDetalle.flSincronizado, TB_Comprobantes.nrCaja  
	FROM TB_ComprobantesDetalle, TB_Comprobantes   
	WHERE TB_Comprobantes.nrCaja=@nrCaja AND   
	TB_ComprobantesDetalle.nrTalonario=TB_Comprobantes.nrTalonario       AND  
	TB_ComprobantesDetalle.nrComprobante=TB_Comprobantes.nrComprobante   AND  
	TB_ComprobantesDetalle.tpComprobante=TB_Comprobantes.tpComprobante   AND   
	TB_ComprobantesDetalle.tpLetra=TB_Comprobantes.tpLetra  
	
	
	select * from [TB_Comprobantes_ResumenCajaPuesto]
	return 1;  


end

go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_cierredecaja_v3_7]'))
drop procedure [dbo].rpt_cierredecaja_v3_7


go


 /*******************************************************************/  
/* Modificado en la version 3.7        */  
CREATE procedure rpt_cierredecaja_v3_7  
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

	 
	  
	 select * from #Resumen_Caja_Puesto  

end;
  
 go 
 
 
   
  --- Exec rpt_cierredecaja_v3_7 @nrCaja_param = 2000002245  
 
 

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_ComprobantesManuales_cajapuesto_v3_7]'))
drop procedure [dbo].rpt_ComprobantesManuales_cajapuesto_v3_7

go


create procedure rpt_ComprobantesManuales_cajapuesto_v3_7  
@nrCaja_param  numeric  
as  
begin   
  
 SELECT  
  a.nrCaja,   
  a.flestado,  
  a.nrPuesto,  
  b.nmEmpleado,  
  b.nrTalonario,   
  b.nrComprobante,   
  b.tpComprobante,  
  b.cdCondVenta,   
  b.vlPagoPesos,   
  b.vlPagoEuros,  
  b.vlPagoDolares,   
  b.nrLicencia,   
  b.dsOpcional1,   
  b.flAnulado,   
  b.nmEmpleado,  
  b.flManual,  
  b.dsOpcional2,
  b.vlDiaReal, 
  b.vlPagoReales
 FROM  
  TB_Cajas a,  
  TB_Comprobantes b  
 WHERE  
  a.nrCaja = b.nrCaja  
  and a.nrCaja =  @nrCaja_param   
  and b.flManual in ('M')  
 ORDER BY  
        b.nrComprobante ASC  
        
  
end  
  
  
go

  
 
 -- exec rpt_ComprobantesManuales_cajapuesto_v3_7 2000002241
 
  
  /*
   SELECT  
  a.nrCaja,   
  a.flestado,  
  a.nrPuesto,  
  b.nmEmpleado,  
  b.nrTalonario,   
  b.nrComprobante,   
  b.tpComprobante,  
  b.cdCondVenta,   
  b.vlPagoPesos,   
  b.vlPagoEuros,  
  b.vlPagoDolares,   
  b.nrLicencia,   
  b.dsOpcional1,   
  b.flAnulado,   
  b.nmEmpleado,  
  b.flManual,  
  b.dsOpcional2,
  b.vlDiaReal, 
  b.vlPagoReales
 FROM  
  TB_Cajas a,  
  TB_Comprobantes b  
 WHERE  
  a.nrCaja = b.nrCaja   
  and b.flManual in ('M')  
 ORDER BY  
        b.nrComprobante ASC  
        
       */
       
       
       
go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_SumaCajaPuestosCondVenta_v3_7]'))
drop procedure [dbo].SP_SumaCajaPuestosCondVenta_v3_7

go


create  procedure SP_SumaCajaPuestosCondVenta_v3_7(@pnrCaja_param as numeric)  
as  
begin  
declare @vlPesos				 as float   
declare @vlDolares				 as float   
declare @vlEuros                 as float
declare @vlReales                as float   
declare @vlSaldoInicialPesos     as float  
declare @vlSaldoInicialDolares   as float  
declare @vlSaldoInicialEuros     as float  
declare @vlDiaDolar              as float  
declare @vlDiaEuro               as float  
declare @vlDiaReal               as float  
declare @vlSaldoInicialReales    as float    
/*  
declare   @pnrCaja_param numeric  
set  @pnrCaja_param = 2000002212  
drop table #tmp_suma_valores  
*/  
  
  
 SELECT  vlPesos=CASE cdCondVenta  
   WHEN 'Cobro en Destino'   THEN 0  
   WHEN 'Retorno'      THEN 0   
   WHEN 'Cuenta Corriente'   THEN 0  
   WHEN 'Tarjeta de Crédito' THEN 0   
   WHEN 'Tarjeta de Débito'  THEN 0  
   WHEN 'Contado'            THEN vlPagoPesos  
  END,  
   vlDolares=CASE cdCondVenta  
   WHEN 'Cobro en Destino'   THEN 0  
   WHEN 'Retorno'      THEN 0   
   WHEN 'Cuenta Corriente'   THEN 0  
   WHEN 'Tarjeta de Crédito' THEN 0   
   WHEN 'Tarjeta de Débito'  THEN 0  
   WHEN 'Contado'            THEN vlPagoDolares  
  END,  
  vlEuros=CASE cdCondVenta  
   WHEN 'Cobro en Destino'   THEN 0  
   WHEN 'Retorno'      THEN 0   
   WHEN 'Cuenta Corriente'   THEN 0  
   WHEN 'Tarjeta de Crédito' THEN 0   
   WHEN 'Tarjeta de Débito'  THEN 0  
   WHEN 'Contado'            THEN vlPagoEuros  
  END, 
  vlReales=CASE cdCondVenta  
   WHEN 'Cobro en Destino'   THEN 0  
   WHEN 'Retorno'      THEN 0   
   WHEN 'Cuenta Corriente'   THEN 0  
   WHEN 'Tarjeta de Crédito' THEN 0   
   WHEN 'Tarjeta de Débito'  THEN 0  
   WHEN 'Contado'            THEN vlPagoReales  
  END
 INTO #tmp_suma_valores  
 FROM TB_Comprobantes  
 WHERE flAnulado = 0   
       and flEliminar=0   
       and nrcaja=@pnrCaja_param  
  
 select @vlPesos=sum(vlPesos),    
        @vlDolares=sum(vlDolares),   
        @vlEuros=sum(vlEuros),
        @vlReales=sum(vlReales) 
        from #tmp_suma_valores  
   
  
 select  @vlSaldoInicialPesos=vlSaldoInicialPesos,  
		 @vlSaldoInicialDolares=vlSaldoInicialDolares,  
		 @vlSaldoInicialEuros=vlSaldoInicialEuros,  
		 @vlSaldoInicialReales=vlSaldoInicialReales,
         @vlDiaDolar=vlDiaDolar,  
         @vlDiaEuro=vlDiaEuro,
         @vlDiaReal=vlDiaReal
 from tb_cajas   
 where  nrcaja=@pnrCaja_param  
  
  
 select isnull(@vlPesos,0) + isnull(@vlSaldoInicialPesos,0)     as vlSaldoFinalPesos,  
        isnull(@vlDolares,0)  + isnull(@vlSaldoInicialDolares,0) as vlSaldoFinalDolares,  
        isnull(@vlEuros,0) + isnull(@vlSaldoInicialEuros,0)     as vlSaldoFinalEuros,  
        isnull(@vlReales,0) + isnull(@vlSaldoInicialReales,0)     as vlSaldoFinalReales,  
        @vlDiaDolar as vlDiaDolar,  
        @vlDiaEuro  as vlDiaEuro,     
        @vlDiaReal  as vlDiaReal,
        @pnrCaja_param as nrCaja  
  
end  
  
go

 
 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sco_cajapuesto_v3_7]'))
drop procedure [dbo].sco_cajapuesto_v3_7

  
go



--- obtiene los valore de una caja-puestos
create  procedure sco_cajapuesto_v3_7
@nrCaja_param  numeric
as 
begin
declare @nrCierre integer

	select @nrCierre=count(*)+1  from TB_CajasPuestosCierres
	where  nrCaja=@nrCaja_param

	select  a.[nrCaja], 
		a.[nrPuesto], 
		a.[dsUsuario], 
		a.[dtApertura], 
		a.[dtCierre],
		a.[hrApertura],
		a.[hrCierre],
		a.[flEstado],
		dsEstado=CASE a.[flEstado]
		when 1 then     'Cerrada'
		when 0 then     'Abierta'
		End,		
		a.[flCajaAdm], 
		isnull(a.[vlSaldoInicialPesos],0) as 'vlSaldoInicialPesos',
		isnull(a.[vlSaldoInicialDolares],0) as 'vlSaldoInicialDolares',
		isnull(a.[vlSaldoInicialEuros],0)as 'vlSaldoInicialEuros',
		isnull(a.[vlDiaDolar],0)as 'vlDiaDolar',
		isnull(a.[vlDiaEuro],0)as 'vlDiaEuro',
		isnull(a.[vlDiaReal],0)as 'vlDiaReal',
		isnull(a.[vlSaldoFinalPesos],0)as 'vlSaldoFinalPesos',
		isnull(a.[vlSaldoFinalDolares],0)as 'vlSaldoFinalDolares',
		isnull(a.[vlSaldoFinalEuros],0)as 'vlSaldoFinalEuros',
		isnull(a.[vlSaldoFinalRealPesos],0)as 'vlSaldoFinalRealPesos',
		isnull(a.[vlSaldoFinalRealEuros],0)as 'vlSaldoFinalRealEuros',
		isnull(a.[vlSaldoFinalRealDolares],0)as 'vlSaldoFinalRealDolares', 
		isnull(a.[vlCierrePesos],0)as 'vlCierrePesos',
		isnull(a.[vlCierreDolares],0)as 'vlCierreDolares', 
		isnull(a.[vlCierreEuros],0)as 'vlCierreEuros', 
		isnull(a.[vlTotalSaldoFinalReal],0)as 'vlTotalSaldoFinalReal', 
		isnull(a.[vlTotalSaldoFinal],0)as 'vlTotalSaldoFinal', 
		isnull(a.[vlTotalSaldoInicial],0)as 'vlTotalSaldoInicial', 
		isnull(a.[vlTotalSaldoCierre],0)as 'vlTotalSaldoCierre', 
		a.[dsDiferenciaDeCierre]as 'dsDiferenciaDeCierre', 
		isnull(a.[vlDiferenciaDeCierre],0)as 'vlDiferenciaDeCierre', 
		a.[dsObservacion], 
		a.[dtObservacion], 
		a.[dsUsuario_Supervisor], 
		a.[dtActualizacion], 
		a.[flSincronizado], 
		--a.[nrCierre], 
		isnull(b.nmNombre,'')+' '+isnull(b.nmApellido,'') nmEmpleado,
		c.dsPuesto,
		-- Para la administración = Saldo Operadora - Fondo de la caja
		dbo.f_positivoValorNegativoCero_2_5([vlSaldoFinalRealPesos] - [vlSaldoInicialPesos]) as 'vlSaldoAdmPesos',
		dbo.f_positivoValorNegativoCero_2_5([vlSaldoInicialDolares] - [vlSaldoFinalRealDolares]) as 'vlSaldoAdmDolares',
		dbo.f_positivoValorNegativoCero_2_5([vlSaldoFinalRealEuros] - [vlSaldoInicialEuros]) as 'vlSaldoAdmEuros',
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros,
		@nrCierre as nrCierre,	
		--- columnas agregadas en la version 3.7
		isnull(vlSaldoInicialReales,0) as  vlSaldoInicialReales,
		isnull(vlSaldoFinalReales,0) as vlSaldoFinalReales ,
		isnull(vlSaldoFinalRealReales,0) as vlSaldoFinalRealReales ,
		isnull(vlCierreReales,0) as vlCierreReales  ,
		isnull(vlFondoFijoReales,0) as vlFondoFijoReales  
	FROM TB_Cajas a, tb_usuarios b, tb_puestos c
	WHERE   a.nrcaja = @nrCaja_param 
		and a.dsUsuario = b.dsUsuario
		and a.nrPuesto  = c.nrPuesto
	
end


go


 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sco_FondoFijoCajaAnterior_v3_7]'))
drop procedure [dbo].sco_FondoFijoCajaAnterior_v3_7


go 

CREATE   procedure sco_FondoFijoCajaAnterior_v3_7
@nrPuesto  as int
as
begin

	select a.vlSaldoInicialPesos, 
	       a.vlSaldoInicialDolares, 
	       a.vlSaldoInicialEuros,
	       isnull(a.vlSaldoInicialReales,0) as vlSaldoInicialReales,
	       a.vlFondoFijoPesos,
	       a.vlFondoFijoDolares,
	       a.vlFondoFijoEuros,
	       isnull(a.vlFondoFijoReales,0)  as vlFondoFijoReales
	from TB_Cajas a 
	where a.nrcaja =(select max(b.nrCaja)
			   from TB_Cajas b
			   where b.nrPuesto=@nrPuesto and flestado=1); 

	if @@rowcount<1 
	begin
		select 0 as vlSaldoInicialPesos, 
		       0 as vlSaldoInicialDolares, 
		       0 as vlSaldoInicialEuros,
			   0 as vlSaldoInicialReales

	end
	
end

go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_obtenerImputacion_v3_7'))
drop procedure [dbo].[SP_obtenerImputacion_v3_7]



go 


create procedure SP_obtenerImputacion_v3_7
(
@nrCaja_param         as  numeric,
@AsientoModelo_param  as  varchar(100),
@nrCupon_param		  as  numeric=null 		
)
as
begin 


	if @AsientoModelo_param='REGISTRACION_CAJA_PUESTO' 
	begin

		declare @vlSaldoInicialPesos    as float
		declare @vlSaldoInicialDolares  as float
		declare @vlSaldoInicialEuros    as float	
		declare @vlTotalSaldoFinalReal  as float 
		declare @vlTotalSaldoFinal      as float 

		declare @vlSaldoInicialDolaresPesif  as float
		declare @vlSaldoFinalRealPesos		 as float
		declare @vlSaldoInicialEurosPesif    as float	
		declare @vlSaldoFinalRealDolares     as float
		declare @vlSaldoFinalRealEuro		 as float

		declare @vlFondoFijoPesos			 as float
		declare @vlFondoFijoDolares			 as float
		declare @vlFondoFijoEuros			 as float
													  --- Diferencia en valores de caja
		declare @vlDiferenciaDeCierre		 as float --- (-) Falto dinero a la operadora 
													  --- (+) Sobre dinero a la operadora 

		--- Dinero destinado para la administración 
		declare @vlCierrePesos   as float 
		declare @vlCierreDolares as float 
		declare @vlCierreEuros   as float 
		declare @vlDiaEuro		 as float
		declare @vlDiaDolar		 as float
		declare @vlDiaReal       as float 
		

		SELECT     @vlSaldoFinalRealPesos=vlSaldoFinalRealPesos,
			   @vlSaldoFinalRealDolares=vlSaldoFinalRealDolares,
			   @vlSaldoFinalRealEuro=vlSaldoFinalRealEuros,
			   @vlSaldoInicialPesos=vlSaldoInicialPesos,
			   @vlSaldoInicialDolares=vlSaldoInicialDolares,
			   @vlSaldoInicialEuros=vlSaldoInicialEuros,
			   @vlTotalSaldoFinalReal=vlTotalSaldoFinalReal,  -- Saldo del operador en caja
			   @vlTotalSaldoFinal=vlTotalSaldoFinal,		  -- Saldo del sistema pesificado
			   --- Fondo Fijo otorgado para la caja siguiente
			   @vlFondoFijoPesos=vlFondoFijoPesos,
			   @vlFondoFijoDolares=vlFondoFijoDolares,
			   @vlFondoFijoEuros=vlFondoFijoEuros,
			   @vlDiferenciaDeCierre=vlDiferenciaDeCierre,
			   --- Dinero para la administración 
			   @vlCierrePesos =vlCierrePesos,
			   @vlCierreDolares =vlCierreDolares,
			   @vlCierreEuros =vlCierreEuros,
			   @vlDiaEuro  = vlDiaEuro,
			   @vlDiaDolar = vlDiaDolar,
			   @vlDiaReal = vlDiaReal
		FROM   TB_Cajas
		WHERE  (nrCaja = @nrCaja_param)

		--- Identificar las cantidaddes enunciadas en el documento
		--- #20090520_División de cuentas y agregado de nuevos controles#		
		---	2000   Ingreso de dinero caja de los puestos	Entrada de Dinero	Caja de los Licenciatarios	Sistema
				
		SELECT 
			isnull(SUM(a.vlPagoPesos),0)    + 
			isnull(SUM(a.vlPagoEuros),0)    * @vlDiaEuro +
			isnull(SUM(a.vlPagoDolares),0)  * @vlDiaDolar as   suma_vlTotalPesificado,
			
			--- modificacion version 3,7 para incluir reales pesificados a los pesos
			isnull(SUM(a.vlPagoPesos),0) + 	(isnull(SUM(a.vlPagoReales),0))  * @vlDiaReal  as   suma_vlPagoPesos, 
			isnull(SUM(a.vlPagoEuros),0)    as   suma_vlPagoEuros,
			isnull(SUM(a.vlPagoDolares),0)  as   suma_vlPagoDolares,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA

		INTO #tmp_itemconcepto1 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and (tpCupon = 'Contado') 
			and nrCajaCliente = @nrCaja_param 
			
		--- 2019	Ingreso de dinero por comisiones a caja de la cooperativa
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, suma_vlComision as vlImporte, tpOperacion, tpCajaImputacion
		into #tmp_asiento_preeliminar
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2019 

		--- 2000  Ingreso de dinero caja de los puestos a la caja del licenciatario
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'USD' as moneda ,suma_vlPagoDolares as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2000 

		--- 2000  Ingreso de dinero caja de los puestos a la caja del licenciatario
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto  as dsConcepto, 'EUR' as moneda ,suma_vlPagoEuros as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2000 

		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda ,suma_vlPagoPesos as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2000 

		--- 2004 Ingreso Retención IVA a caja de la cooperativa
		insert into #tmp_asiento_preeliminar		
		select cdConcepto, dsConcepto + ' (Contado)' as dsConcepto, 'PES' as moneda, suma_IVA as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2004 

		--- 2008 Egreso Retención IVA Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar		
		select cdConcepto, dsConcepto + ' (Contado)' as dsConcepto, 'PES' as moneda, suma_IVA as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2008

		/* determinamos la diferencia */
		if @vlDiferenciaDeCierre>0
		begin
			--- 2001	Diferencia operadora(+) a caja de la administracion
			insert into #tmp_asiento_preeliminar
			select cdConcepto, dsConcepto, 'PES' as moneda, abs(@vlDiferenciaDeCierre) as vlImporte, tpOperacion, tpCajaImputacion
			from   #tmp_itemconcepto1 a , tb_conceptos b
			where  b.cdConcepto = 2001 
		end

		if @vlDiferenciaDeCierre<0
		begin
			---	2002	Diferencia operadora(-) a caja de la administracion
			insert into #tmp_asiento_preeliminar
			select cdConcepto, dsConcepto, 'PES' as moneda, abs(@vlDiferenciaDeCierre) as vlImporte, tpOperacion, tpCajaImputacion
			from   #tmp_itemconcepto1 a , tb_conceptos b
			where  b.cdConcepto = 2002
		end 

		if dbo.f_existeDiferenciaFondoFijo_v2_9( @vlSaldoInicialPesos,
											 @vlSaldoInicialDolares,
											 @vlSaldoInicialEuros,
											 @vlFondoFijoPesos,
											 @vlFondoFijoDolares,
											 @vlFondoFijoEuros,
											 @vlDiaEuro, 
											 @vlDiaDolar)=1
		begin

			create table #temp_Diferencia (vlSigno int, vlDiferenciaFondoFijoPesif float);

			insert into #temp_Diferencia exec dbo.SP_obtenerDiferenciaFondoFijo_v2_9
											 @vlSaldoInicialPesos,
											 @vlSaldoInicialDolares,
											 @vlSaldoInicialEuros,
											 @vlFondoFijoPesos,
											 @vlFondoFijoDolares,
											 @vlFondoFijoEuros,
											 @vlDiaEuro, 
											 @vlDiaDolar

			--- 2006    Diferencia Fondo Fijo(-)
			--- 2005    Diferencia Fondo Fijo(+)
			--- insert into #tmp_asiento_preeliminar
			--- select cdConcepto, dsConcepto, 'PES' as moneda, abs(a.vlDiferenciaFondoFijoPesif) as vlImporte, tpOperacion, tpCajaImputacion
			--- from   #temp_Diferencia a , tb_conceptos b
			--- where  (b.cdConcepto = 2006 and a.vlSigno=-1) or (b.cdConcepto = 2005 and a.vlSigno=1)
		end


		--- Calculo concepto  2007   Egreso de dinero por comisiones
		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto2 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon='Contado'
			and nrCajaCliente = @nrCaja_param 
		
		---2007  -- Egreso de dinero por comisiones (Contado) --Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto2 a , tb_conceptos b
		where  b.cdConcepto = 2007
	    
		
		--- Calculo concepto  2007   Egreso de dinero por comisiones
		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto3 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon  = 'Retorno'
			and nrCajaCliente = @nrCaja_param 

	
		-- 2010  Ingreso de dinero por comisiones (Retorno) Caja de la Cooperativa
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto3 a , tb_conceptos b
		where  b.cdConcepto = 2010

		-- 2016 Egreso de dinero por comisiones (Retorno)  Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto3 a , tb_conceptos b
		where  b.cdConcepto = 2016


		-- 2011 Ingreso de dinero caja de los puestos (Retorno) Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlMontoCupon) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto3 a , tb_conceptos b
		where  b.cdConcepto = 2011


---Cobro en Destino


		--- Calculo montos en Cobro en Destino
		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto4 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon  = 'Cobro en Destino'
			and nrCajaCliente = @nrCaja_param 

		-- 2014  Ingreso de dinero por comisiones(CD)  Caja de la Cooperativa
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto4 a , tb_conceptos b
		where  b.cdConcepto = 2014

		-- 2017 Egreso de dinero por comisiones (CD)  Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto4 a , tb_conceptos b
		where  b.cdConcepto = 2017


		-- 2012 Ingreso de dinero caja de los puestos (CD) Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlMontoCupon) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto4 a , tb_conceptos b
		where  b.cdConcepto = 2012


---Cuenta Corriente

		--- Calculo montos en Cuenta Corriente
		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto5 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon  = 'Cuenta Corriente'
			and nrCajaCliente = @nrCaja_param 

		-- 2018  Egreso de dinero por comisiones (CC)  Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto5 a , tb_conceptos b
		where  b.cdConcepto = 2018 

		-- 2015 Ingreso de dinero por comisiones(CC)  Caja de la Cooperativa
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto5 a , tb_conceptos b
		where  b.cdConcepto = 2015


		-- 2013 Ingreso de dinero caja de los puestos (CC) Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlMontoCupon) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto5 a , tb_conceptos b
		where  b.cdConcepto = 2013


		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlMontoCupon) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto5 a , tb_conceptos b
		where  b.cdConcepto = 2021


		-- IVA 
		-- Ingreso a la caja de la cooperativo por ret. de IVA (R,CD,CC)
		-- 'Cuenta Corriente' 'Cobro en Destino'  'Retorno'


		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto6 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon in ('Cuenta Corriente','Cobro en Destino','Retorno')
			and nrCajaCliente = @nrCaja_param 

		insert into #tmp_asiento_preeliminar
		-- 2004 Ingreso Retención IVA  Caja de la Cooperativa
		select cdConcepto, dsConcepto+' (R,CD,CC)' as dsConcepto, 'PES' as moneda, abs(suma_IVA) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto6 a , tb_conceptos b
		where  b.cdConcepto = 2004

		-- 2008 Egreso Retención IVA Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto+' (R,CD,CC)' as dsConcepto, 'PES' as moneda, abs(suma_IVA) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto6 a , tb_conceptos b
		where  b.cdConcepto = 2008

		-----  Tabla de Retorno  -----
		select a.cdConcepto,a.dsConcepto, a.moneda, ROUND(a.vlImporte,3) as 'vlImporte', a.tpOperacion, a.tpCajaImputacion 
		from #tmp_asiento_preeliminar a, tb_conceptos b
		where   a.cdConcepto = b.cdConcepto and
			ROUND(a.vlImporte,3)<>0   and   b.flOcultadoenRegistracion=0
		order by ROUND(a.vlImporte,3) desc

		-----  Tabla de Retorno  OCULTA -----
		select a.cdConcepto, a.dsConcepto, a.moneda, ROUND(a.vlImporte,3) as 'vlImporte', a.tpOperacion, a.tpCajaImputacion 
		from #tmp_asiento_preeliminar a, tb_conceptos b
		where a.cdConcepto = b.cdConcepto and
  		ROUND(a.vlImporte,3)<>0   and   b.flOcultadoenRegistracion=1
		order by ROUND(a.vlImporte,3) desc

	end 
	
	
	if @AsientoModelo_param='REGISTRACION_CUPON' 
	begin

		declare @nrCupon numeric(18, 0)
		declare @tpCupon varchar(20)
		declare @vlMontoCupon float
		declare @vlPagoPesos  float
		declare @vlPagoEuros  float
		declare @vlPagoDolares float
		declare @vlComision   float
		declare @vlSubtotal   float
		declare @vlIVA	      float	

		select   @nrCupon = a.nrCupon,
			 @tpCupon = a.tpCupon,	
			 @vlMontoCupon = a.vlMontoCupon, 
			 @vlPagoPesos = a.vlPagoPesos, 
			 @vlPagoEuros = a.vlPagoEuros,
			 @vlPagoDolares = a.vlPagoDolares,
			 @vlComision = a.vlComision,  
			 @vlSubtotal = a.vlSubtotal,  
			 @vlIVA	= a.vlIVA    	  
		from     tb_cupones a
		where    a.nrCupon = @nrCupon_param 


		if @tpCupon='Contado'
		begin

		--1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
		select cdConcepto, dsConcepto as dsConcepto, 'USD' as moneda, 
		       (@vlPagoEuros)  as vlImporte, tpOperacion, tpCajaImputacion
		into #tmp_asiento_preeliminar_cupones 
		from   tb_conceptos b
		where  b.cdConcepto = 1027


		--1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
		select cdConcepto, dsConcepto as dsConcepto, 'EUR' as moneda, 
		       (@vlPagoDolares)  as vlImporte, tpOperacion, tpCajaImputacion
		from   tb_conceptos b
		where  b.cdConcepto = 1027

			if @vlPagoPesos>0 
				--1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
				insert into #tmp_asiento_preeliminar_cupones
				select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, 
				       (@vlPagoPesos) - (@vlComision + @vlIVA)  as vlImporte, tpOperacion, tpCajaImputacion
				from   tb_conceptos b
				where  b.cdConcepto = 1027
			else
			begin

				--1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
				insert into #tmp_asiento_preeliminar_cupones
				select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, 
				       (@vlPagoPesos) as vlImporte, tpOperacion, tpCajaImputacion
				from   tb_conceptos b
				where  b.cdConcepto = 1027

				insert into #tmp_asiento_preeliminar_cupones
				select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, 
				       (@vlComision + @vlIVA)  as vlImporte, tpOperacion, tpCajaImputacion
				from   tb_conceptos b
				where  b.cdConcepto = 2020
			
			end 

			-----  Tabla de Retorno  -----
			select cdConcepto, dsConcepto, moneda, ROUND(vlImporte,3) as 'vlImporte', tpOperacion, tpCajaImputacion 
			from #tmp_asiento_preeliminar_cupones
			where ROUND(vlImporte,3)<>0  order by ROUND(vlImporte,3) desc

		end 


	end 

end


go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sco_Comprobantes_cajapuesto_v3_7'))
drop procedure [dbo].sco_Comprobantes_cajapuesto_v3_7


go

create      procedure sco_Comprobantes_cajapuesto_v3_7
@nrCaja_param  numeric
as
begin 

	SELECT  b.nrTalonario, 
		b.nrComprobante, 
		b.tpComprobante,
		b.tpLetra,
	    b.dtComprobante,
		b.cdCondVenta, 
		b.tpComision, 
		b.vlPagoPesos, 
		b.vlPagoEuros,
		b.vlPagoDolares, 
	    b.vlPagoReales,
		b.nrLicencia, 
		b.dsOpcional1, 
		b.flAnulado, 
		b.flEliminar,
		'flManual'=CASE b.flManual
	        WHEN 'M' THEN 'Manual'
	        WHEN 'N' THEN 'Automática'
	        WHEN 'S' THEN 'Manual'
	        WHEN 'N' THEN 'Automática'
		END,
		b.dsOpcional2,
		'NO' flmodificadoreaperturacajapuesto,
		 tpModificacionCajaPuesto, --- /* Agregado, Eliminado, Anulado, Modificado */
		 dsObservacionCajaPuesto 	
	into    #tmp_comprobantes
	FROM
		TB_Cajas a, tb_comprobantes b
	WHERE
		a.nrCaja = b.nrCaja
		and a.nrCaja =  @nrCaja_param 

	    
	update a 
	set    a.flmodificadoreaperturacajapuesto='SI' 
	from   #tmp_comprobantes a, TB_ComprobantesCajasPuestosCierres b
	where  a.nrTalonario=b.nrTalonario_modif and 
	       a.nrComprobante=b.nrComprobante_modif and
	       a.tpComprobante=b.tpComprobante_modif and
	       a.tpLetra=b.tpLetra_modif

	update a 
	set flmodificadoreaperturacajapuesto='SI'
	from #tmp_comprobantes a
	WHERE tpModificacionCajaPuesto is not null and flmodificadoreaperturacajapuesto='NO'

	select * from #tmp_comprobantes
	ORDER BY nrComprobante ASC

end

go 

---Exec sco_Comprobantes_cajapuesto_v3_7 @nrCaja_param = 2000002254 


go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_rpt_PagoLicenciatario_v3_7]'))
drop procedure [dbo].[SP_rpt_PagoLicenciatario_v3_7]

go

/*************************************************************/
/* creado en la version 3.7									 */
/* Falta terminar este store							     */
CREATE PROCEDURE [dbo].[SP_rpt_PagoLicenciatario_v3_7] @IdRecibo_param numeric
AS
declare @flAnulado int

set dateformat dmy

	select @flAnulado=0

	select * into  #tmp_recibos
	from   TB_Recibos
	where  IdRecibo = @IdRecibo_param


        select  @flAnulado=flAnulado  from #tmp_recibos  where  IdRecibo = @IdRecibo_param

	if @flAnulado=0
		select  TB_Cupones.dsDestino,
	            TB_Cupones.nrLicencia,
	            TB_Cupones.nmLicenciatario,
	            TB_Cupones.vlPagoPesos,
	            TB_Cupones.vlPagoEuros,
	            TB_Cupones.vlPagoDolares,
	            isnull(TB_Cupones.vlPagoReales,0) as vlPagoReales,
		        TB_Cupones.vlComision,
	            Convert(varchar,TB_Cupones.dtCupon,103) as dtCupon,
		        TB_Cupones.dsHoraViaje,
	            TB_Cupones.vlComision + isnull(TB_Cupones.vlIVA,0) as vlRetencion,
	            TB_Cupones.vlIVA,
	            TB_Cupones.nrTalonarioCliente,
	            TB_Cupones.nrComprabanteCliente,
	            a.IdRecibo,
	            a.vlAcumDolares,
	            a.vlSaldoPesos,
	            a.vlSaldoEuros,
	            a.vlAcumPesos,
	            a.vlAcumEuros,
	            a.vlAcumComision,
	            a.vlSaldoDolares,
	            Convert(varchar,a.dtRecibo,103) +' '+
	            Convert(varchar,a.dtRecibo,108) as  dtRecibo,
		        a.flAnulado
		from #tmp_recibos a, TB_Cupones
		WHERE
		       a.IdRecibo = @IdRecibo_param and
		       TB_Cupones.IdRecibo = a.IdRecibo

	else
		select  
	            b.dsDestino,
	            b.nrLicencia,
	            b.nmLicenciatario,
	            b.vlPagoPesos,
	            b.vlPagoEuros,
	            b.vlPagoDolares,
	            isnull(b.vlPagoReales,0) as vlPagoReales,
	            b.vlComision,
	            b.nrTalonarioCliente,
	            b.nrComprabanteCliente,
	            b.vlComision +isnull(b.vlIVA,0)  as vlRetencion,
	            b.vlIVA,
	            Convert(varchar,b.dtCupon,103) as dtCupon,
		    b.dsHoraViaje,
	            c.IdRecibo,
	            c.vlAcumDolares,
	            c.vlSaldoPesos,
	            c.vlSaldoEuros,
	            c.vlAcumPesos,
	            c.vlAcumEuros,
	            c.vlAcumComision,
	            c.vlSaldoDolares,
	            Convert(varchar,c.dtRecibo,103)+' '+
	            Convert(varchar,c.dtRecibo,108) as  dtRecibo,
		    c.flAnulado  
		from  #tmp_recibos c, TB_RecibosDetalle b
		WHERE
		    c.IdRecibo = @IdRecibo_param and
		    b.IdRecibo = c.IdRecibo 


	
go

----exec [dbo].[SP_rpt_PagoLicenciatario_v3_7] @IdRecibo_param = 1000063033


go



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_AnularRecibo_v3_7]'))
drop procedure [dbo].[SP_AnularRecibo_v3_7]
go


/***********************************************/
/*      Modificado para la version 3.7          */
create procedure [dbo].[SP_AnularRecibo_v3_7]
@idReciboParam       		as numeric,
@dsUsuario_param     		as Varchar(50),
@dsUsuario_Supervisor_param     as Varchar(50)=null
as
declare @nrCajaRecibo  numeric
declare @strError      varchar(400)
declare @tpRecibo      varchar(100)
declare @flAnulado     bit 

	select @flAnulado=0

	select @nrCajaRecibo=nrCaja, @tpRecibo=tpRecibo, @flAnulado=flAnulado from TB_Recibos 
	where IdRecibo=@IdReciboParam

	if @flAnulado=1
	begin
		select @strError='El recibo '+ convert(varchar,@IdReciboParam)+' ya se encuentra anulado.'
		raiserror (@strError,16,1)
		return -1
	end
		
	-- verificamos  que la caja no haya sido cerrada
	if not exists(select * from  TB_Cajas 
		      where nrCaja=@nrCajaRecibo 
			    and flCajaAdm=1 and flEstado=0) 
	begin
		select @strError='El recibo '+ convert(varchar,@IdReciboParam)+' no puede anularse ya que la caja que lo creo está cerrada.'
		raiserror (@strError,16,1)
		return -1
	end 


	if @tpRecibo='Detalle de Cobro a Cta. Cte.' 
	begin
		select @strError='No se puede anular un recibo de Detalle de Cobro a Cta. Cte. este recibo se anula en caso de que usted anule la factura que lo generó.'
		raiserror (@strError,16,1)
		return -1
	end 

	-- Solo anulamos recibos 'Detalle de Pago a Licenciatario' 

	-- se copian los detalles
	insert into TB_RecibosDetalle 
		(nrCupon,
		cdCliente,
		nrPuesto,
		nrLicencia,
		nmLicenciatario,
		tpCupon,
		vlMontoCupon,
		vlaFavordelLicenciatario,
		vlafavorAdmin,
		vlPagoPesos, 
		vlPagoEuros,
		vlPagoDolares, 
		vlPagoReales,
		vlComision,
		nrCantidadBultos, 
		nrPasajeros,
		dtCupon,
		nrTalonarioCliente,
		nrComprabanteCliente,
		tpComprobanteCliente, 
		tpLetraCliente,
		flCobradoalCliente, 
		dtCobradoalCliente, 
		nrCajaCliente, 
		dtCajaCliente, 
		nrTalonarioProveedor, 
		nrComprabanteProveedor, 
		tpComprobanteProveedor, 
		tpLetraLetraProveedor, 
		flCompensado, 
		dtCompensado, 
		nrCajaLicenciatario, 
		dtCajaLicenciatario, 
		dsUsuario, 
		nrLiquidacionProveedores,
		nrLiquidacionCliente,
		cdCodBar, 
		flAnulado, 
		dtAnulado, 
		IdRecibo, 
		IdReciboCtaCte, 
		dsObservacion, 
		dsDestino, 
		dsHoraViaje,
		vlSubtotal,
		vlIVA)
	select  nrCupon, 
		cdCliente, 
		nrPuesto, 
		nrLicencia, 
		nmLicenciatario, 
		tpCupon, 
		vlMontoCupon, 
		vlaFavordelLicenciatario, 
		vlafavorAdmin, 
		vlPagoPesos, 
		vlPagoEuros, 
		vlPagoDolares,
	    vlPagoReales, 
		vlComision, 
		nrCantidadBultos, 
		nrPasajeros, 
		dtCupon, 
		nrTalonarioCliente, 
		nrComprabanteCliente, 
		tpComprobanteCliente, 
		tpLetraCliente, 
		flCobradoalCliente, 
		dtCobradoalCliente, 
		nrCajaCliente, 
		dtCajaCliente, 
		nrTalonarioProveedor, 
		nrComprabanteProveedor,            
		tpComprobanteProveedor, 
		tpLetraLetraProveedor, 
		flCompensado, 
		dtCompensado, 
		nrCajaLicenciatario, 
		dtCajaLicenciatario, 
		dsUsuario, 
		nrLiquidacionProveedores, 
		nrLiquidacionCliente, 
		cdCodBar, 
		flAnulado, 
		dtAnulado, 
		IdRecibo, 
		IdReciboCtaCte, 
		dsObservacion, 
		dsDestino, 
		dsHoraViaje,
		vlSubtotal,
		vlIVA
	from TB_Cupones 
	where IdRecibo=@IdReciboParam

	if @@rowcount=0 
	begin
		select @strError='El recibo '+ convert(varchar,@IdReciboParam)+' no puede anularse ya que presenta información inconsistente.'
		raiserror (@strError,16,1)
		return -1
	end 
	
	-- se ponen a nulo los comprobantes o cupones compensados
	update TB_Cupones
	set idRecibo=null,
	vlPagoDolares=0,
	vlPagoEuros=0,
	vlPagoPesos=0,
	flCompensado=0,
	flCobradoalCliente=0,
	dtCobradoalCliente=null,
	dtCompensado=null,
	nrCajaLicenciatario=null,
	dtCajaLicenciatario=null, 
	dsUsuario=@dsUsuario_param
	where IdRecibo=@IdReciboParam and 
	      tpCupon in ('Cobro en Destino', 'Retorno')

	-- se ponen a nulo los comprobantes o cupones compenados
	update TB_Cupones
	set idRecibo=null,
	vlPagoDolares=0,
	vlPagoEuros=0,
	vlPagoPesos=0,
	flCompensado=0,
	dtCompensado=null,
	nrCajaLicenciatario=null,
	dtCajaLicenciatario=null, 
	dsUsuario=@dsUsuario_param
	where IdRecibo=@IdReciboParam and 
	      tpCupon in ('Cuenta Corriente', 'Tarjeta de Crédito', 'Tarjeta de Débito')

	update TB_Cupones
	set idRecibo=null,
	flCompensado=0,
	dtCompensado=null,
	nrCajaLicenciatario=null,
	dtCajaLicenciatario=null, 
	dsUsuario=@dsUsuario_param
	where IdRecibo=@IdReciboParam and 
	      tpCupon in ('Contado')

	-- eliminar los movimentos contables en dicha caja
	delete from TB_MovimientosContables
	where IdRecibo=@IdReciboParam
	
	-- actualizar el flag anulado del recibo
	update TB_Recibos
	set flAnulado=1,
	    dsUsuario=@dsUsuario_param,
	    dsUsuario_Supervisor=@dsUsuario_Supervisor_param
	where IdRecibo=@IdReciboParam


go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_marcarTipodeActualizacionCajaPuesto_v3_7]'))
drop procedure [dbo].[sp_marcarTipodeActualizacionCajaPuesto_v3_7]

go


create  procedure sp_marcarTipodeActualizacionCajaPuesto_v3_7(
@nrTalonario_param   	  	as varchar(4),
@nrComprobante_param 	  	as varchar(8),
@tpComprobante_param 	  	as varchar(4),
@tpLetra_param       	  	as varchar(2),
@tpModificacionCajaPuesto_param  varchar(50), /* Agregado, Eliminado, Anulado, Modificado*/
					      /* En Analisis: Desanulado, Deseliminado */
@dsObservacionCajaPuesto_param   varchar(400)=null)			       
as
begin 

	update  [TB_Comprobantes]
	set	 tpModificacionCajaPuesto = @tpModificacionCajaPuesto_param,
		 dsObservacionCajaPuesto  = left(@tpModificacionCajaPuesto_param+': '+ isnull(@dsObservacionCajaPuesto_param,'') + ' / '+isnull(dsObservacionCajaPuesto,''),400) 
	where 
		 nrTalonario =  @nrTalonario_param    and
		 nrComprobante = @nrComprobante_param and
	         tpComprobante = @tpComprobante_param and
		 tpLetra = @tpComprobante_param


end

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_obtenerCondVentayValoresdePagosModificados_v3_7]'))
drop procedure [dbo].sp_obtenerCondVentayValoresdePagosModificados_v3_7


go


create   procedure sp_obtenerCondVentayValoresdePagosModificados_v3_7
	(@cdCondVenta_param       as varchar(50), 
	 @cdCondVenta_new_param   as varchar(50),
	 @vlPagoPesos_param        float,
	 @vlPagoDolares_param      float,
	 @vlPagoEuros_param        float,
	 @vlTotalGeneral  as float,
	 @vlPagoReales_param        float)      
as
begin
declare @vlPagoPesos      as float
declare @vlPagoDolares    as float
declare @vlPagoEuros   	  as float
declare @vlPagoReales     as float
declare @vlPagoPesosACP   as float -- ACP Actualizacion Caja Puesto
declare @vlPagoDolaresACP as float
declare @vlPagoEurosACP   as float
declare @vlPagoRealesACP   as float

declare @error            as varchar(100)

	if @cdCondVenta_param=@cdCondVenta_new_param 
	begin 
		select @error = 'La condicion de venta no ha sido modificada.'
		raiserror (@error, 16, 1)
		return 0
	end 

	if @cdCondVenta_param='Contado' 
	begin 
	    select     @vlPagoPesos= 0,	
                   @vlPagoDolares = 0,
       	           @vlPagoEuros = 0,
       	           @vlPagoReales = 0,
		           @vlPagoPesosACP= (-1) * abs(isnull(@vlPagoPesos_param,0)),	  -- actualiza caja puesto
                   @vlPagoDolaresACP = (-1)* abs(isnull(@vlPagoDolares_param,0)),
       	           @vlPagoEurosACP = (-1)* abs(isnull(@vlPagoEuros_param,0)),
				   @vlPagoRealesACP = (-1)* abs(isnull(@vlPagoReales_param,0))
	end

	if @cdCondVenta_param<>'Contado' 
	begin 
	    select  @vlPagoPesos = case @cdCondVenta_new_param    -- actualiza caja puesto
								when 'Contado' then @vlTotalGeneral
							     else 0 
								end,	
				@vlPagoDolares = 0,
				@vlPagoEuros = 0,
				@vlPagoReales = 0,
 				@vlPagoPesosACP= case @cdCondVenta_new_param    -- actualiza caja puesto
								 when 'Contado' then @vlTotalGeneral
								 else 0 
								end,							
                @vlPagoDolaresACP = 0,
   	            @vlPagoEurosACP = 0,
   	            @vlPagoRealesACP = 0
	end

	select 	@vlPagoPesos      as  vlPagoPesos,
		    @vlPagoDolares    as  vlPagoDolares,
		    @vlPagoEuros      as  vlPagoEuros,
		    @vlPagoReales     as  vlPagoReales,
		    @vlPagoPesosACP   as  vlPagoPesosACP,
            @vlPagoDolaresACP as  vlPagoDolaresACP,
            @vlPagoEurosACP   as  vlPagoEurosACP,
            @vlPagoRealesACP  as  vlPagoRealesACP


end


go 

 --Exec sp_obtenerCondVentayValoresdePagosModificados_v3_7 @cdCondVenta_param = 'Contado' ,@cdCondVenta_new_param = 'Cobro en Destino' ,@vlPagoPesos_param = 0.00 ,@vlPagoDolares_param = 0.00 ,@vlPagoEuros_param = 0.00 ,@vlPagoReales_param = 45.00 ,@vlTotalGeneral = 95.00 


go



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_ActualizarComprobante_v3_7]'))
drop procedure [dbo].[SP_ActualizarComprobante_v3_7]

go

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---  Voy por acacacac !!!
--- SP_ActualizarComprobanteManual_v2_4 ->>> SP_ActualizarComprobanteManual_v2_5
-- Actualiza el nro de comprobante y talonario de una carga manual
create     procedure [SP_ActualizarComprobante_v3_7]
@nrTalonario_param        varchar(4),
@nrComprobante_param      varchar(12),
@tpComprobante_param      varchar(4),
@tpLetra_param            varchar(2),
@nrTalonario_new_param    varchar(4),
@nrComprobante_new_param  varchar(12),
@tpComprobante_new_param  varchar(4),
@tpLetra_new_param        varchar(2),
@dtComprobante_new_param  datetime=null,
@nrCierre_param		  int=null,
@cdCondVenta_new_param	  varchar(20)=null,
@tpComision_new_param	  varchar(20)=null,
@vlComision_new_param     float=null
AS
begin
/*

declare @nrTalonario_param varchar
declare @nrComprobante_param varchar
declare @tpComprobante_param varchar
declare @tpLetra_param      varchar
declare @nrTalonario_new_param varchar
declare @nrComprobante_new_param varchar
declare @tpComprobante_new_param varchar
declare @tpLetra_new_param varchar

set @nrTalonario_param ='0002'
set @nrComprobante_param ='00000063'
set @tpComprobante_param ='A'
set @tpLetra_param      ='A'
set @nrTalonario_new_param ='0002'
set @nrComprobante_new_param ='00000063'
set @tpComprobante_new_param ='B'
set @tpLetra_new_param ='B'

*/
declare @cantidad_registros int
declare @error		    varchar(200)
declare @cdCondVenta        varchar(50)
declare @vlPagoPesos        float
declare @vlPagoDolares      float
declare @vlPagoEuros        float
declare @vlPagoReales       float
declare @vlTotalGeneral      float


	if @nrCierre_param is not null 
	begin
		---- guardar el comprobante anterior 
		exec sp_guardarComprobanteCajaPuestoAnterior_v2_5
			@nrTalonario_param   = @nrTalonario_param,
			@nrComprobante_param = @nrComprobante_param,
			@tpComprobante_param = @tpComprobante_param,
			@tpLetra_param       = @tpLetra_param,
			@nrCierre_param      = @nrCierre_param,	
			@nrTalonario_new_param   = @nrTalonario_new_param,
			@nrComprobante_new_param = @nrComprobante_new_param,
			@tpComprobante_new_param = @tpComprobante_new_param,
			@tpLetra_new_param       = @tpLetra_new_param
	end

	-- verificamos la existencia del comprobante
	select  @cantidad_registros=count(*),
	        @cdCondVenta=max(cdCondVenta), 
		@vlPagoPesos=max(vlPagoPesos),
		@vlPagoDolares=max(vlPagoPesos),
		@vlPagoEuros=max(vlPagoPesos),
		@vlPagoReales=max(vlPagoPesos),
		@vlTotalGeneral=max(vlTotalGeneral)
	FROM TB_Comprobantes
	WHERE nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param 
	
	if @cantidad_registros=0 
	begin
		select @error = 'No se ha encontrado el talonario '+ @nrTalonario_param + ' comprobante nro. '+ rtrim(@nrComprobante_param) +'.'
         	raiserror (@error, 16, 1)
		return 0	
	end

	-- si cambia los datos de la clave verificar si ya existe el comprobante
	-- con la nueva clave, si existe hay un error
	-- si el comprobante no existe 
	if      @nrTalonario_param <> @nrTalonario_new_param     or
		@nrComprobante_param  <> @nrComprobante_new_param   or 
		@tpComprobante_param  <> @tpComprobante_new_param   or
		@tpLetra_param        <> @tpLetra_new_param   
	begin
		if dbo.f_existeComprobante(@nrTalonario_new_param, @nrComprobante_new_param, @tpComprobante_new_param,@tpLetra_new_param)='SI'
		begin
			select @error = 'El comprobante modificado ya existe no puede modificarlo en lo que respeta a numeración y letra'
			raiserror (@error, 16, 1)
			return 0	
		end 



		insert into [TB_Comprobantes]
		    (nrTalonario,nrComprobante, tpComprobante, tpLetra, 
		    dtComprobante , cdCliente, cdCondVenta, tpComision, 
		    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
		    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
		    flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
		    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
		    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
		    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
		    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
		    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
		    nmEmpleado, IdReciboCtaCte, flCargaErronea, dtActualizacion, vlPagoReales)
		select  @nrTalonario_new_param,  @nrComprobante_New_param , 
			@tpComprobante_new_param, @tpLetra_new_param, 
		    dtComprobante, cdCliente, cdCondVenta, tpComision,	
		    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
		    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
		    0 as flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
		    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
		    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
		    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
		    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
		    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
		    nmEmpleado, IdReciboCtaCte, flCargaErronea, getdate () as  dtActualizacion, vlPagoReales
		from TB_Comprobantes
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param  
	
		if @@rowcount=0 
		begin	
			select @error = 'No se ha insertado el talonario '+ @nrTalonario_new_param + ' comprobante nro. '+ rtrim(@nrComprobante_new_param) +'.'
			raiserror (@error, 16, 1)
			return 0	
		end
	
		if @@error<>0
		begin
			select @error = 'error al insertar el registro en la tabla [TB_Comprobantes].'
			raiserror (@error, 16, 1)
			return 0
		end 	
	
		insert into [TB_ComprobantesDetalle]
		    (nrTalonario, nrComprobante, tpComprobante, tpLetra, nrItem, 
		    cdProducto, dsProducto, tpOperacion, qtCantidad, vlPorcentaje, 
		    vlPrecioPeaje, vlPrecioViaje, vlTotalItem, dtInsercion, 
		   flSincronizado,dtActualizacion)
		select @nrTalonario_new_param , @nrComprobante_new_param, @tpComprobante_new_param, @tpLetra_new_param, 
		    nrItem, cdProducto, dsProducto, tpOperacion, qtCantidad, 
		    vlPorcentaje, vlPrecioPeaje, vlPrecioViaje, vlTotalItem, 
		    dtInsercion, 0, getdate()
		from TB_ComprobantesDetalle
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param 

		update TB_Cupones
		set    nrTalonarioCliente     = @nrTalonario_new_param,
	   	       nrComprabanteCliente   = @nrComprobante_new_param,
		       tpComprobanteCliente = @tpComprobante_new_param,
		       tpLetraCliente       = @tpLetra_new_param 
		where nrTalonarioCliente   = @nrTalonario_param and
		      nrComprabanteCliente = @nrComprobante_param and
		      tpComprobanteCliente = @tpComprobante_param and 		
		      tpLetraCliente       = @tpLetra_param 


	
		if @@error<>0
		begin
			select @error = 'No se pudo grabar la tabla de TB_ComprobantesDetalle.'
			raiserror (@error, 16, 1)
			return 0
		end 
 

		-- Eliminar en la tabla de TB_ComprobantesDetalle el comprobante anterior
		delete from TB_ComprobantesDetalle
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param 
		
		if @@rowcount=0 
		begin	
			select @error = 'No se ha podido eliminar el comprobante anterior'
			raiserror (@error, 16, 1)
			return 0	
		end
		
		--------------------------------------------------------------------
		-- Eliminar en la tabla de TB_Comprobantes el comprobante anterior
		delete from TB_Comprobantes
		where nrTalonario   = @nrTalonario_param and
		nrComprobante = @nrComprobante_param and
		tpComprobante = @tpComprobante_param and 
		tpLetra       = @tpLetra_param 
		
		if @@rowcount=0 
		begin	
			select @error = 'No se ha podido eliminar el comprobante anterior.'
			raiserror (@error, 16, 1)
			rollback tran T1		
			return 0	
		end
		
		if @@error<>0
		begin	
			select @error = 'No se ha podido eliminar el comprobante anterior.'
			raiserror (@error, 16, 1)
			return 0	
		end
	end


	-- verificar si se ha modificado la cond de venta
	if @cdCondVenta<>@cdCondVenta_new_param
	begin
		/* extraemos esta validacion version 3.7 
		if @cdCondVenta_new_param='Cuenta Corriente'
		begin
			select @error = 'No se puede modificar la condición de venta a Cuenta Corriente.'
			raiserror (@error, 16, 1)
			return 0	
		end
		*/

		select top 1  @vlPagoPesos as vlPagoPesos,
                        @vlPagoDolares as vlPagoDolares,
			@vlPagoEuros as vlPagoEuros ,
			@vlPagoReales as vlPagoReales ,
			@vlPagoPesos as vlPagoPesosACP,
			@vlPagoDolares as vlPagoDolaresACP ,
			@vlPagoEuros  as vlPagoEurosACP,
			@vlPagoReales as vlPagoRealesACP                                 
		into #ValoresdePagos from tb_cajas	

		delete from #ValoresdePagos

		insert #ValoresdePagos  exec sp_obtenerCondVentayValoresdePagosModificados_v3_7	
			@cdCondVenta_param=@cdCondVenta, 
			@cdCondVenta_new_param=@cdCondVenta_new_param,	  
			@vlTotalGeneral=@vlTotalGeneral,
			@vlPagoPesos_param=@vlPagoPesos,
			@vlPagoDolares_param=@vlPagoPesos,
			@vlPagoEuros_param=@vlPagoEuros,
			@vlPagoReales_param=@vlPagoReales
			
			

		select  @vlPagoPesos=vlPagoPesos,
			    @vlPagoDolares=vlPagoDolares,
			    @vlPagoEuros=vlPagoEuros,
			    @vlPagoReales=vlPagoReales
		from #ValoresdePagos 

	end -- cierre if @cdCondVenta<>@cdCondVenta_new_param


	--- analizar los cambios en la fecha, condicion de venta , comision
	-- actualizamos la cta cte del licenciatario
	update TB_Cupones
	set  
            /* Atencion si ya fue compensado no realizado nada*/		
	    dtcupon = CASE flCompensado
			 when 0 then isnull(@dtComprobante_new_param , dtcupon)
			 when 1 then dtcupon
			 End,
	    -- falta el recalculo de la vlcomision 
	    tpCupon = CASE flCompensado
			 when 0 then isnull(@cdCondVenta_new_param , tpCupon)
			 when 1 then tpCupon
			 End,
	    vlComision = CASE flCompensado
			 when 0 then isnull(@vlComision_new_param,vlComision) 
			 when 1 then vlComision
			 End,
            /* Atencion si ya fue compensado no realizado nada - valores de pago */		
	    vlPagoPesos = CASE flCompensado
			 when 0 then @vlPagoPesos
			 when 1 then vlPagoPesos
			 End,
	    -- falta el recalculo de la vlcomision 
	    vlPagoDolares = CASE flCompensado
			 when 0 then @vlPagoDolares
			 when 1 then vlPagoDolares
			 End,
	    vlPagoEuros = CASE flCompensado
			 when 0 then @vlPagoEuros
			 when 1 then vlPagoEuros
			 End,
		vlPagoReales  = CASE flCompensado
			 when 0 then @vlPagoReales 
			 when 1 then vlPagoReales
			 End
	where nrTalonarioCliente   = @nrTalonario_new_param and
	      nrComprabanteCliente = @nrComprobante_new_param and
	      tpComprobanteCliente = @tpComprobante_new_param and 
	      tpLetraCliente       = @tpLetra_new_param
		
	if @cdCondVenta<>@cdCondVenta_new_param and
	   @cdCondVenta='Cuenta Corriente' and @cdCondVenta_new_param='Contado'
	begin
		update TB_Cupones
		set flCobradoalCliente = 1,
			dtCobradoalCliente = dtCupon
		where nrTalonarioCliente   = @nrTalonario_new_param and
	      nrComprabanteCliente = @nrComprobante_new_param and
	      tpComprobanteCliente = @tpComprobante_new_param and 
	      tpLetraCliente       = @tpLetra_new_param
		
	end 	
	
	if @cdCondVenta<>@cdCondVenta_new_param and
	   @cdCondVenta='Contado' and @cdCondVenta_new_param='Cuenta Corriente'
	begin
		update TB_Cupones
		set flCobradoalCliente = 0,
			dtCobradoalCliente = null
		where nrTalonarioCliente   = @nrTalonario_new_param and
	      nrComprabanteCliente	   = @nrComprobante_new_param and
	      tpComprobanteCliente	   = @tpComprobante_new_param and 
	      tpLetraCliente           = @tpLetra_new_param
		
	end 
	
	
	-- Verificar y correr los update necesarios para
	--  @dtComprobante_new_param  
	--  @cdCondVenta_new_param
	--  @tpComision_new_param
	update tb_comprobantes
	set dtComprobante = isnull( @dtComprobante_new_param , dtComprobante),
	    cdCondVenta	  = isnull( @cdCondVenta_new_param , cdCondVenta),
	    tpComision    = isnull( @tpComision_new_param , tpComision),
	    dtActualizacion = getdate(),
	    vlPagoPesos     = isnull(@vlPagoPesos,vlPagoPesos),
	    vlPagoDolares   = isnull(@vlPagoDolares,vlPagoPesos),
	    vlpagoEuros	    = isnull(@vlPagoEuros,vlPagoPesos),
	    vlpagoReales	= isnull(@vlPagoReales,vlPagoReales)
	where nrTalonario   = @nrTalonario_new_param and
	      nrComprobante = @nrComprobante_new_param and
	      tpComprobante = @tpComprobante_new_param and 
	      tpLetra       = @tpLetra_new_param

	--------------------------------------------------------------------
	--------------------------------------------------------------------
	--------------------------------------------------------------------	



end


go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_CierredeCajaADMDetalleControl2_v3_7]'))
drop procedure [dbo].rpt_CierredeCajaADMDetalleControl2_v3_7


go 
 

create procedure rpt_CierredeCajaADMDetalleControl2_v3_7    @nrCaja_param numeric  
as  
begin  
  
  
 SELECT DISTINCT   
        a.nrCaja,   
        b.nrLicencia,   
        b.tpCupon,   
        b.nrTalonarioCliente,   
        b.nrComprabanteCliente,   
        b.vlPagoPesos   AS vlPesos,   
        b.vlPagoDolares AS vlDolares,  
        b.vlPagoEuros   AS vlEuros,   
        b.vlComision,   
        b.vlMontoCupon,  
	    a.nrRecibo,   
	    b.flCompensado,     
	    a.dsUsuario,   
	    b.vlIVA  
 FROM      TB_MovimientosContables  a, TB_Cupones  b  
 where  a.IdRecibo = b.IdRecibo  
  and a.nrCaja = @nrCaja_param  
  order by nrComprabanteCliente 
  
end  
 
go
 
 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[rpt_CierredeCajaADMDetalleControl1_v3_7]'))
drop procedure [dbo].rpt_CierredeCajaADMDetalleControl1_v3_7


go 
  
create procedure rpt_CierredeCajaADMDetalleControl1_v3_7  
      @tpCajaImputacion_param as varchar(50)=null,  
      @nrCaja_param numeric,  
      @tpCaja_param char(2)=null  
AS  
begin  
  
 if @tpCajaImputacion_param=' '   
   set @tpCajaImputacion_param=null  
 if @tpCaja_param=' '   
   set @tpCaja_param=null  
  
  
   
 SELECT convert(varchar,a.dtMovimiento,103) + substring(convert(varchar,a.dtMovimiento,121),11,6) as fechayhora  , a.tpOperacion, a.nrCaja, b.tpCajaImputacion, A.cdConcepto, a.dsConcepto, vlPesos, vlDolares, vlEuros  
 FROM dbo.TB_MovimientosContables a, tb_conceptos b  
 where a.cdConcepto = b.cdConcepto      and  
      (  
     (@tpCaja_param='CC'  and b.flOcultadoCajaCooperativa=0) or      
     (@tpCaja_param='CL'  and b.flOcultadoCajaLicenciatario=0) or  
     (@tpCaja_param='CA'  and b.flOcultadoenCajaAdm=0) or  
     (@tpCaja_param is null)  
      )  
   and a.nrCaja =  @nrCaja_param   
   and (b.tpCajaImputacion= @tpCajaImputacion_param or @tpCajaImputacion_param is null)  
   and b.cdConcepto not in (1027)  
  
  
end  
  
go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_7]'))
drop procedure [dbo].sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_7


go

 -- agregamos la info de campo vlCierreReales,  
create procedure sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_7 (@tpAccion varchar(50),  
                @nrCajaAdmActual as numeric(18, 0),  
                       @nrCajaPuesto_param as numeric(18, 0),  
                @esCajaActual as int=1)  
as  
begin  
   
   
   
 delete from  TB_ValoresDesimputacionesCajasPuestos where    
       nrCajaAdm = @nrCajaAdmActual  
   and nrCaja=@nrCajaPuesto_param  
   and tpAccion=@tpAccion  
  
 insert into  TB_ValoresDesimputacionesCajasPuestos  
        (nrCaja,  
        vlCierrePesos,    
        vlCierreDolares,  
        vlCierreEuros,  
        vlCierreReales,
        vlDiferenciaDeCierre,  
        nrCajaAdm,  
        tpAccion,  
        dsObservacion,  
        esCajaActual)  
 select nrCaja,  
        isnull(vlCierrePesos,0)         as vlCierrePesos,  
        isnull(vlCierreDolares,0)       as vlCierreDolares,  
        isnull(vlCierreEuros,0)         as vlCierreEuros,  
        isnull(vlCierreReales,0)        as vlCierreReales,  
        isnull(vlDiferenciaDeCierre,0)  as vlDiferenciaDeCierre,  
        @nrCajaAdmActual as nrCajaAdm,  
        @tpAccion,  
        dsDiferenciaDeCierre as dsObservacion,  
        @esCajaActual  
 from tb_cajas   
 where nrCaja = @nrCajaPuesto_param  
  
end  


go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_desimputarcajapuesto_v3_7]'))
drop procedure [dbo].sp_desimputarcajapuesto_v3_7

  
go 

 -- agregamos la info de campo vlCierreReales,
create procedure sp_desimputarcajapuesto_v3_7   
 @nrCajaPuesto_param     as  numeric(18, 0),  
 @nrCajaAdmActual        as  numeric(18, 0),  
 @dsUsuario_param        as  varchar(50),  
 @dsUsuarioCajaPuesto_param as  varchar(50)=null,  
 @dsUsuario_Supervisor_param as varchar(50)  
as  
begin  
declare @nrCajaAdmOrigen as numeric(18,0)  
declare @strError  as varchar(100)  
  
 set @nrCajaAdmOrigen=null  
  
 select  @nrCajaAdmOrigen=max(nrCaja) from tb_movimientoscontables  where nrcajapuesto=@nrCajaPuesto_param  
  
 if  @nrCajaAdmOrigen is null  
 begin  
  set @strError = 'Error la caja puesto '+ convert(varchar,@nrCajaPuesto_param)+' no se encuentra imputada'  
  raiserror (@strError,1,16)  
  return;  
 end   
   
 -- verificamos si se esta en la misma caja  
 if @nrCajaAdmActual=@nrCajaAdmOrigen  
 begin  
   
  -- eliminamos los registros en forma fisica  
  delete from  TB_MovimientosContables where  nrCajaPuesto=@nrCajaPuesto_param and nrCaja = @nrCajaAdmActual   
         and (tpMovimiento<>'Desimputacion' or tpMovimiento is null)  -- verificamos que no se trata de una desimputacion  
  select 'OK' as resultado  
  
  UPDATE TB_Cajas SET TB_Cajas.nrCajaAdmImputaOrigen  = null  
  WHERE nrCaja = @nrCajaPuesto_param and TB_Cajas.nrCajaAdmImputaOrigen=@nrCajaAdmActual  
  
  
  delete from  TB_ValoresDesimputacionesCajasPuestos where    
       nrCajaAdm = @nrCajaAdmActual  
   and nrCaja=@nrCajaPuesto_param  
   and tpAccion='Imputación'  
     
  return;  
 end   
 else  
 begin  
  print 'llamamos al sp sp_grabarValoresDesimputacionesCajasPuestos_v3_2'     
  exec sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_7 @tpAccion='Desimputación',  
                  @nrCajaAdmActual=@nrCajaAdmActual,  
           @nrCajaPuesto_param=@nrCajaPuesto_param,  
           @esCajaActual=0  
 end   
  
 declare @nrCajaPuestoImputada numeric   
        declare @suma_vlPagoPesos       float   
        declare @suma_vlPagoDolares     float   
        declare @suma_vlPagoEuros       float   
  
  
 create table #temp_MovimientosaDesimputar  
   ([IdMovimiento] [numeric](18, 0) NOT NULL ,  
   [dsMovimiento] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,  
   [IdRecibo] [numeric](18, 0) NULL ,  
   [IdProveedor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,  
   [dsProveedor] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,  
   [cdConcepto] [int] NULL ,  
   [tpConcepto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,  
   [dsConcepto] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,  
   [tpOperacion] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,  
   [vlPesos] [float] NULL ,  
   [vlDolares] [float] NULL ,  
   [vlEuros] [float] NULL ,  
   [nrRecibo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,  
   [nrFactura] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,  
   [nrCaja] [numeric](18, 0) NULL ,  
   [dsUsuario] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,  
   [dtMovimiento] [datetime] NULL ,  
   [dsObservacion] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,  
   [nrAnio] [int] NULL ,  
   [dsUsuario_Supervisor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,  
   [nrCajaPuesto] [numeric](18, 0) NULL ,  
   [tpCajaImputacion] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,  
   [dsUsuarioCajaPuesto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL)  
  
 declare @IdMovimiento [numeric](18, 0)  
 declare @dsMovimiento [varchar] (100)    
 declare @IdRecibo [numeric](18, 0)    
 declare @IdProveedor [varchar] (50)    
 declare @dsProveedor [varchar] (60)    
 declare @cdConcepto [int]     
 declare @tpConcepto [varchar] (50)    
 declare @dsConcepto [varchar] (100)    
 declare @tpOperacion [varchar] (50)    
 declare @vlPesos [float]     
 declare @vlDolares [float]     
 declare @vlEuros [float]     
 declare @nrRecibo [varchar] (50)    
 declare @nrFactura [varchar] (50)    
 declare @nrCaja [numeric](18, 0)     
 declare @dsUsuario [varchar] (50)    
 declare @dtMovimiento [datetime]     
 declare @dsObservacion [varchar] (255)    
 declare @nrAnio [int]     
 declare @dsUsuario_Supervisor  [varchar] (50)    
 declare @nrCajaPuesto [numeric](18, 0)     
 declare @tpCajaImputacion [varchar] (50)    
 declare @dsUsuarioCajaPuesto  [varchar] (50)  
  
 -- obtenemos los valores imputados en la caja de los licenciatarios y caja de la cooperativa  
 insert into #temp_MovimientosaDesimputar exec sp_obtiene_saldo_cajapuestoimputada_v3_2  
  @nrCajaPuesto_param=@nrCajaPuesto_param,  
  @nrCajaAdm_param=@nrCajaAdmOrigen  
  
 declare @maxIdMovimiento       numeric   
 select @maxIdMovimiento=max(IdMovimiento)+1 from TB_MovimientosContables   
  
 -- preparamos cursos para realizar la insercion  
 declare  cur_MovimientosaDesimputar cursor for select * from #temp_MovimientosaDesimputar  
  
 OPEN cur_MovimientosaDesimputar  
  
  
 FETCH NEXT FROM cur_MovimientosaDesimputar   
 INTO  @IdMovimiento,  
   @dsMovimiento,   
   @IdRecibo,  
   @IdProveedor,   
   @dsProveedor,  
   @cdConcepto,   
   @tpConcepto,   
   @dsConcepto,   
   @tpOperacion,   
   @vlPesos,  
   @vlDolares,    
   @vlEuros,   
   @nrRecibo,  
   @nrFactura,   
   @nrCaja,  
   @dsUsuario,   
   @dtMovimiento,  
   @dsObservacion,   
   @nrAnio,  
   @dsUsuario_Supervisor,   
   @nrCajaPuesto,  
   @tpCajaImputacion,   
   @dsUsuarioCajaPuesto  
  
  
 -- REALIZAR PRUEBAS DE TESTING  
   
 WHILE @@FETCH_STATUS = 0  
 BEGIN  
  
  --realizar el movimiento de desimputacion   
  INSERT TB_MovimientosContables (  
   IdMovimiento,     
   dsMovimiento,   
   IdRecibo,  
   IdProveedor,   
   dsProveedor,  
   cdConcepto,   
   tpConcepto,   
   dsConcepto,   
   tpOperacion,   
   vlPesos,  
   vlDolares,    
   vlEuros,   
   nrRecibo,  
   nrFactura,   
   nrCaja,  
   dsUsuario,   
   dtMovimiento,  
   dsObservacion,   
   nrAnio,  
   dsUsuario_Supervisor,   
   nrCajaPuesto,  
   tpCajaImputacion,   
   dsUsuarioCajaPuesto,  
   tpMovimiento)  
  values    
   (@maxIdMovimiento,  
   @dsMovimiento,   
   @IdRecibo,  
   @IdProveedor,   
   @dsProveedor,  
   @cdConcepto,   
   @tpConcepto,   
   @dsConcepto,   
   @tpOperacion,   
   @vlPesos,  
   @vlDolares,    
   @vlEuros,   
   @nrRecibo,  
   @nrFactura,   
   @nrCajaAdmActual, -- damos de alta los contraasientos para la caja actual  
   @dsUsuario,   
   @dtMovimiento,  
   @dsObservacion,   
   @nrAnio,  
   @dsUsuario_Supervisor_param, -- actualizamos el usuarios supervisor que autorizo la desimputacion  
   @nrCajaPuesto,  
   @tpCajaImputacion,   
   @dsUsuarioCajaPuesto,  
   'Desimputacion' )  
    
  FETCH NEXT FROM cur_MovimientosaDesimputar   
   INTO   @IdMovimiento,  
     @dsMovimiento,   
     @IdRecibo,  
     @IdProveedor,   
     @dsProveedor,  
     @cdConcepto,   
     @tpConcepto,   
     @dsConcepto,   
     @tpOperacion,   
     @vlPesos,  
     @vlDolares,    
     @vlEuros,   
     @nrRecibo,  
     @nrFactura,   
     @nrCaja,  
     @dsUsuario,   
     @dtMovimiento,  
     @dsObservacion,   
     @nrAnio,  
     @dsUsuario_Supervisor,   
     @nrCajaPuesto,  
     @tpCajaImputacion,   
     @dsUsuarioCajaPuesto  
  
    select @maxIdMovimiento = @maxIdMovimiento + 1  
  
 END  --- cierra el while del cursor  
  
  
 CLOSE cur_MovimientosaDesimputar  
 DEALLOCATE cur_MovimientosaDesimputar  
  
 update tb_cajas  
 set  desimputada = 'S',  
      nrCajaAdmDesimputa=@nrCajaAdmActual  
 where nrCaja = @nrCajaPuesto_param  
  
    select 'OK' as resultado  
  
end   
  
print ' grabar en el diccionario de datos al sp sp_grabarValoresDesimputacionesCajasPuestos_v3_2'  
  

go 
 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_obtenerCajasPuestosImputadas_v3_7]'))
drop procedure [dbo].SP_obtenerCajasPuestosImputadas_v3_7

go 


  
-- store procedure para para obtener en las cajas puestos en la caja diara de la administración   
create procedure [dbo].[SP_obtenerCajasPuestosImputadas_v3_7] (@nrCaja_param numeric, @flSumatorio_param as int=0)  
as  
begin  
  
declare @nombre     varchar(50)  
declare @apellido   varchar(50)  
declare @dtApertura varchar(50)  
declare @dtCierre   varchar(50)  
  
  select  @nombre   = b.nmNombre,  
          @apellido = b.nmApellido,  
          @dtApertura = CONVERT(VARCHAR,a.dtApertura,103),  
          @dtCierre   = CONVERT(VARCHAR,a.dtCierre,103)  
  from    tb_Cajas a, TB_Usuarios b  
  where   a.dsUsuario = b.dsUsuario and  
   a.nrCaja    = @nrCaja_param  
  
 SELECT   
  [nrCajaAdm],  
  [nrCaja] as nrCajaPuesto ,  
  [vlCierrePesos],  
  [vlCierreDolares],  
  [vlCierreEuros],
  [vlCierreReales],
  [vlDiferenciaDeCierre],  
  [tpAccion],  
  [dsObservacion]   
 into #tmpCajaPuestosImputadas  
 FROM TB_ValoresDesimputacionesCajasPuestos  
  where nrCajaAdm=@nrCaja_param and tpAccion='Imputación'  and esCajaActual=1  
  
  
 if @flSumatorio_param=0  
	  select  @nrCaja_param as nrCaja,  
	   b.nrCajaPuesto,  
	   c.nmNombre,   
	   c.nmApellido,   
	   b.vlCierrePesos,  
	   b.vlCierreDolares,  
	   b.vlCierreEuros,  
	   b.vlCierreReales,
	   a.dsDiferenciaDeCierre,  
	   a.vlDiferenciaDeCierre,  
	   a.vlDiaEuro,  
	   a.vlDiaDolar,  
	   b.tpAccion,  
	   @dtApertura as  dtApertura,  
	   @dtCierre   as  dtCierre  
	  from    tb_Cajas a, #tmpCajaPuestosImputadas b, TB_Usuarios c  
	  where   a.nrCaja = b.nrCajaPuesto and  
	   a.dsUsuario = c.dsUsuario  
	   order by nrCajapuesto asc, tpAccion desc   
 else  
	  select  isnull(sum(a.vlCierrePesos),0)        as vlSumaCierrePesos,  
			  isnull(sum(a.vlCierreDolares),0)      as vlSumaCierreDolares,  
			  isnull(sum(a.vlCierreEuros),0)        as vlSumaCierreEuros,  
			  isnull(sum(a.vlCierreReales),0)       as vlCierreReales,  
			  isnull(sum(a.vlDiferenciaDeCierre),0) as vlSumaDiferenciaDeCierre  
	  from   #tmpCajaPuestosImputadas a         
  
  
end  
  
go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_obtenerCajasPuestosImputadasyDesImputadas_v3_7]'))
drop procedure [dbo].SP_obtenerCajasPuestosImputadasyDesImputadas_v3_7


go 


  
-- store procedure para para obtener en las cajas puestos en la caja diara de la administración   
create procedure [dbo].SP_obtenerCajasPuestosImputadasyDesImputadas_v3_7 (@nrCaja_param numeric, @flSumatorio_param as int=0)  
as  
begin  
declare @nombre   varchar(50)  
declare @apellido varchar(50)  
declare @dtApertura varchar(50)  
declare @dtCierre   varchar(50)  
declare @vlDiaDolar float  
declare @vlDiaEuro  float  
declare @vlDiaReal  float
  
  select  @nombre   = b.nmNombre,  
       @apellido = b.nmApellido,  
    @dtApertura = CONVERT(VARCHAR,a.dtApertura,103),  
    @dtCierre   = CONVERT(VARCHAR,a.dtCierre,103),  
    @vlDiaDolar = a.vlDiaDolar,   
    @vlDiaEuro =  a.vlDiaEuro,  
    @vlDiaReal = a.vlDiaReal 
  from    tb_Cajas a, TB_Usuarios b  
  where   a.dsUsuario = b.dsUsuario and  
       a.nrCaja  = @nrCaja_param  
  
 select  nrCaja as nrCajaPuesto,  
         vlCierrePesos,  
		 vlCierreDolares,  
         vlCierreEuros,  
         vlCierreReales,
         vlDiferenciaDeCierre,  
		 tpAccion,  
		 dsObservacion,  
		 nrCajaAdm,  
		 esCajaActual  
 into #tmp_ValoresDesimputacionesCajasPuestos  
 from TB_ValoresDesimputacionesCajasPuestos  
 where nrCajaAdm=@nrCaja_param  
  
 if @flSumatorio_param=0  
 begin  
  select   
		a.nrCajaPuesto,  
		a.vlCierrePesos,  
		a.vlCierreDolares,  
		a.vlCierreEuros,
		a.vlCierreReales,  
		a.vlDiferenciaDeCierre,  
		a.tpAccion,  
		a.dsObservacion,  
		@nombre     as nmNombre,   
		@apellido   as nmApellido,   
		@dtApertura as  dtApertura,  
		@dtCierre   as  dtCierre,  
		@vlDiaDolar as vlDiaDolar,   
		@vlDiaEuro as vlDiaEuro,  
		c.nmNombre as nmNombre_cp,   
		c.nmApellido as nmApellido_cp,  
		nrCajaAdm as nrCaja,  
		esCajaActual,
		@vlDiaReal as vlDiaReal  
	  from  #tmp_ValoresDesimputacionesCajasPuestos a, TB_Cajas b, TB_Usuarios c  
	  where a.nrCajaPuesto = b.nrCaja  and  
		 b.dsUsuario = c.dsUsuario  
	  order by  esCajaActual desc, a.nrCajaPuesto asc, tpAccion asc  
 end  
 else  
 begin  
  
  --- eliminamos aquellas que son solamente imputaciones  
  delete a from #tmp_ValoresDesimputacionesCajasPuestos a  
  where  esCajaActual=1  
  
  select  - vlCierrePesos as vlCierrePesos,  
		  - vlCierreDolares as vlCierreDolares,  
          - vlCierreEuros as vlCierreEuros,  
          - vlCierreReales as vlCierreReales,  
          - vlDiferenciaDeCierre as vlDiferenciaDeCierre  
  into #tmp_al_desimputar_imputar  
  from #tmp_ValoresDesimputacionesCajasPuestos  
  where tpAccion='Desimputación';  
  
  insert into  #tmp_al_desimputar_imputar  
  select  vlCierrePesos,  
          vlCierreDolares,  
          vlCierreEuros,  
          vlCierreReales,
          vlDiferenciaDeCierre  
  from #tmp_ValoresDesimputacionesCajasPuestos  
  where tpAccion='Imputación'  
    
  select  isnull(SUM(vlCierrePesos),0) as vlCierrePesos,  
		  isnull(SUM(vlCierreDolares),0) as vlCierrePesos ,  
		  isnull(SUM(vlCierreEuros),0) as vlCierreEuros,  
		  isnull(SUM(vlCierreReales),0) as vlCierreReales, 
		  isnull(SUM(vlDiferenciaDeCierre),0) as vlDiferenciaDeCierre  
  from #tmp_al_desimputar_imputar  
    
 end  
  
end  


go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_rpt_resumendecajaadm_v3_7]'))
drop procedure [dbo].SP_rpt_resumendecajaadm_v3_7

go 

go   
  
  
CREATE procedure SP_rpt_resumendecajaadm_v3_7  
      @nrCaja_param numeric,  
      @tpCaja_param char(2)=null,  
      @tpCajaImputacion_param varchar(50)=null  
as  
begin  
declare @vlSaldoInicialPesos   as float  
declare @vlSaldoInicialDolares as float  
declare @vlSaldoInicialEuros   as float  
declare @vlSaldoCierrePesos    as float  
  
declare @vlSumaCajasPuestosCierrePesos as float  
declare @vlSumaCajasPuestosCierreDolares as float  
declare @vlSumaCajasPuestosCierreEuros as float  
declare @vlSumaCajasPuestosCierreReales as float 
declare @vlSumaCajasPuestosDiferencia as float  
  
  
  
declare @flestado as integer  
  
 if @tpCaja_param is null  
  set @tpCaja_param='CA'  
   
 if @tpCaja_param =''  
  set @tpCaja_param='CA'  
   
 if @tpCajaImputacion_param=''    
  set @tpCajaImputacion_param=null  
  
 ---obtenemos datos de la caja adm  
 select   
  @vlSumaCajasPuestosCierrePesos = vlSumaCajasPuestosCierrePesos,  
  @vlSumaCajasPuestosCierreDolares = vlSumaCajasPuestosCierreDolares,  
  @vlSumaCajasPuestosCierreEuros = vlSumaCajasPuestosCierreEuros,  
  @vlSumaCajasPuestosCierreReales = vlSumaCajasPuestosCierreReales,
  @vlSumaCajasPuestosDiferencia = vlSumaCajasPuestosDiferencia,  
  @flestado = flestado  
 from tb_cajas  
 where nrCaja = @nrCaja_param  
   
  
 CREATE TABLE #temp_SaldoInicial (  
  [vlSaldoInicialPesos] [float] NULL ,  
  [vlSaldoInicialDolares] [float] NULL ,  
  [vlSaldoInicialEuros] [float] NULL   
 )   
   
 insert into #temp_SaldoInicial exec SP_CalculaSaldoInicial_v2_9 @nrCaja_param=@nrCaja_param,  
         @tpCaja_param=@tpCaja_param,  
         @tpCajaImputacion_param=@tpCajaImputacion_param  
  
 CREATE TABLE #temp_SaldoCierre (  
  [vlSaldoCierrePesos] [float] NULL   
 )  
  
 insert into #temp_SaldoCierre exec SP_CalculaSaldoCierre_v2_9 @nrCaja_param=@nrCaja_param,  
         @tpCaja_param=@tpCaja_param,  
         @tpCajaImputacion_param=@tpCajaImputacion_param  
    
  
 select top 1 @vlSaldoCierrePesos=vlSaldoCierrePesos   
 from   #temp_SaldoCierre;  
   
 select top 1   @vlSaldoInicialPesos=vlSaldoInicialPesos,  
         @vlSaldoInicialDolares=vlSaldoInicialDolares,  
         @vlSaldoInicialEuros=vlSaldoInicialEuros   
 from #temp_SaldoInicial  
  
 declare @vlSaldoPesosComision   as float  
 declare @vlSaldoDolaresComision as float  
 declare @vlSaldoEurosComision   as float  
  
 ---obtencion del saldo ingresado en conceptos de comisiones  
 CREATE TABLE #temp_SaldoComisiones (  
  [vlSumaPesos] [float] NULL ,  
  [vlSumaDolares] [float] NULL ,  
  [vlSumaEuros] [float] NULL   
 )   
  
  
 insert into #temp_SaldoComisiones exec SP_obtenerRetenciones_v3_7  @nrCaja_param=@nrCaja_param  
  
 select  @vlSaldoPesosComision = vlSumaPesos,  
   @vlSaldoDolaresComision = vlSumaDolares,  
   @vlSaldoEurosComision = vlSumaEuros  
 from #temp_SaldoComisiones  
  
  
 declare @vlSumaRetencionIVA float  
  
 delete from #temp_SaldoComisiones  
  
 insert into #temp_SaldoComisiones exec SP_obtenerRetencionesIVA_v3_2  @nrCaja_param=@nrCaja_param  
   
 select  @vlSumaRetencionIVA = vlSumaPesos from #temp_SaldoComisiones  
  
 -------------------------------------------------------------------------------------------  
 --- INICIO - obtencion del saldo de las cajas imputadas   
 declare @vlSumaCierrePesos   as float  
 declare @vlSumaCierreDolares as float  
 declare @vlSumaCierreEuros   as float  
 declare @vlSumaCierreReales  as float
 declare @vlSumaDiferenciaDeCierre   as float  
   
 CREATE TABLE #temp_CajasPuestosImputadas (  
  vlSumaCierrePesos  [float] NULL ,  
  vlSumaCierreDolares [float] NULL ,   
  vlSumaCierreEuros  [float] NULL , 
  vlSumaCierreReales [float] NULL,
  vlSumaDiferenciaDeCierre [float] NULL   
 )   
  
  
  
 --- verificamos si la caja es abierta o cerrada  
 if @flestado=0  
 begin  
         -- obtenemos las cajas imputadas  - ---- agregar logica para obtener  la sumatorio de los saldos sin tener en cuenta la desimputaciones de cajas puestos  
	  insert into #temp_CajasPuestosImputadas exec SP_obtenerCajasPuestosImputadas_v3_7  @nrCaja_param=@nrCaja_param,@flSumatorio_param=1  
	   
	  select  @vlSumaCierrePesos=isnull(vlSumaCierrePesos,0),  
			  @vlSumaCierreDolares =isnull(vlSumaCierreDolares,0),  
			  @vlSumaCierreEuros =isnull(vlSumaCierreEuros,0),  
			  @vlSumaCierreReales =isnull(vlSumaCierreReales,0),  
			  @vlSumaDiferenciaDeCierre =isnull(vlSumaDiferenciaDeCierre,0)  
	  from #temp_CajasPuestosImputadas  
	  --- FIN - obtencion del saldo de las cajas imputadas   
	  update tb_cajas  
	  set   
		   vlSumaCajasPuestosCierrePesos = @vlSumaCierrePesos,  
		   vlSumaCajasPuestosCierreDolares = @vlSumaCierreDolares,  
		   vlSumaCajasPuestosCierreEuros = @vlSumaCierreEuros,  
		   vlSumaCajasPuestosCierreReales = @vlSumaCierreReales,  
		   vlSumaCajasPuestosDiferencia = @vlSumaDiferenciaDeCierre
	  where nrCaja = @nrCaja_param  
 end  
 else  
 begin  
  select  @vlSumaCierrePesos= @vlSumaCajasPuestosCierrePesos,  
		  @vlSumaCierreDolares = @vlSumaCajasPuestosCierreDolares,  
		  @vlSumaCierreEuros = @vlSumaCajasPuestosCierreEuros,
		  @vlSumaCierreReales = @vlSumaCajasPuestosCierreReales,
		  @vlSumaDiferenciaDeCierre = @vlSumaCajasPuestosDiferencia  
  -- print '@flestado=1 caja cerrada Entra por la logica de else'  
 end   
 -------------------------------------------------------------------------------------------  
  
  
 -------------------------------------------------------------------------------------------  
 --- INICIO - obtencion del saldo de las cajas Desimputadas   
 declare @vlSumaCierrePesosDesimputado          as float  
 declare @vlSumaCierreDolaresDesimputado        as float  
 declare @vlSumaCierreEurosDesimputado          as float  
 declare @vlSumaCierreRealesDesimputado          as float
 declare @vlSumaDiferenciaDeCierreDesimputado   as float  
   
 CREATE TABLE #temp_CajasPuestosDesImputadas (  
  vlSumaCierrePesos  [float] NULL ,  
  vlSumaCierreDolares [float] NULL ,   
  vlSumaCierreEuros  [float] NULL ,  
  vlSumaCierreReales  [float] NULL ,  
  vlSumaDiferenciaDeCierre [float] NULL   
 )   
  
        -- obtenemos las cajas imputadas   
 insert into #temp_CajasPuestosDesImputadas exec SP_obtenerCajasPuestosImputadasyDesImputadas_v3_7  @nrCaja_param=@nrCaja_param,@flSumatorio_param=1  
  
 select    @vlSumaCierrePesosDesimputado = vlSumaCierrePesos,  
		   @vlSumaCierreDolaresDesimputado = vlSumaCierreDolares,  
		   @vlSumaCierreEurosDesimputado = vlSumaCierreEuros,  
		   @vlSumaCierreRealesDesimputado = vlSumaCierreReales,  
		   @vlSumaDiferenciaDeCierreDesimputado = vlSumaDiferenciaDeCierre  
 from #temp_CajasPuestosDesImputadas  
 --- FIN - obtencion del saldo de las cajas imputadas   
 -------------------------------------------------------------------------------------------  
  
  
 SELECT a.tpOperacion, a.nrCaja, b.tpCajaImputacion, a.dsConcepto, SUM(vlPesos)   
  AS SumaPesos, SUM(vlDolares) AS SumaDolares,   
  SUM(vlEuros) AS SumaEuros into  #tmp_ResumenCajaADM_SinPesificar  
 FROM dbo.TB_MovimientosContables a, tb_conceptos b  
 where a.cdConcepto = b.cdConcepto      and  
      (  
     (@tpCaja_param='CC'  and b.flSumaenCajaCooperativa=1 and b.flOcultadoCajaCooperativa=0) or      
     (@tpCaja_param='CL'  and b.flSumaenCajaLicenciatarios=1 and b.flOcultadoCajaLicenciatario=0) or  
     (@tpCaja_param='CA'  and b.flSumaenCajaAdm=1 and b.flOcultadoenCajaAdm=0)   
      )  
   and a.nrCaja =  @nrCaja_param   
   and (b.tpCajaImputacion= @tpCajaImputacion_param or @tpCajaImputacion_param is null)  
 GROUP BY a.tpOperacion, a.nrCaja, a.dsConcepto,  b.tpCajaImputacion  
  
  
  
 -- Agregar valor de comisiones  
 SELECT  
  c.nmNombre,   
  c.nmApellido,   
  a.tpOperacion,   
  a.nrCaja,   
  a.dsConcepto,   
  a.SumaPesos,   
  a.SumaDolares,   
  a.SumaEuros,   
  Convert (varchar,b.dtApertura,103) as  'dtApertura',  
  @vlSaldoInicialPesos   as 'vlSaldoInicialPesos',  
  @vlSaldoInicialDolares as 'vlSaldoInicialDolares',  
  @vlSaldoInicialEuros   as 'vlSaldoInicialEuros',  
  b.vlSaldoFinalRealPesos,   
  b.vlSaldoFinalRealEuros,   
  b.vlSaldoFinalRealDolares,   
  b.vlCierrePesos,   
  b.vlCierreDolares,   
  b.vlCierreEuros,   
  @vlSaldoCierrePesos + @vlSaldoInicialPesos as 'vlTotalSaldoFinalReal',   
  @vlSaldoCierrePesos as 'vlTotalSaldoFinal',   
  b.vlDiaDolar,   
  b.vlDiaEuro,   
  b.vlDiaReal,
  b.dsObservacion,  
  Convert (varchar,b.dtObservacion,103) as  'dtObservacion',  
  isnull(@vlSaldoPesosComision,0)   as 'vlSaldoPesosComision',  
  isnull(@vlSaldoDolaresComision,0) as 'vlSaldoDolaresComision',  
   isnull(@vlSaldoEurosComision,0)   as 'vlSaldoEurosComision',  
  @vlSumaCierrePesos      as 'vlSumaCajasPuestosCierrePesos',  
  @vlSumaCierreDolares    as 'vlSumaCajasPuestosCierreDolares',  
  @vlSumaCierreEuros      as 'vlSumaCajasPuestosCierreEuros',  
  @vlSumaCierreReales     as 'vlSumaCajasPuestosCierreReales',
  @vlSumaDiferenciaDeCierre as 'vlSumaCajasPuestosDiferenciaDeCierre',  
  (0)   as 'vlSaldoPesosComisionDesimputaciones' ,  
  (0)   as 'vlSaldoDolaresComisionDesimputaciones',    
  (0)   as 'vlSaldoEurosComisionDesimputaciones',  
  (0)   as 'vlSaldoRealesComisionDesimputaciones',  
  isnull(@vlSumaCierrePesosDesimputado,0) as 'vlSumaCierrePesosDesimputado',  
  isnull(@vlSumaCierreDolaresDesimputado,0) as 'vlSumaCierreDolaresDesimputado',  
  isnull(@vlSumaCierreEurosDesimputado,0) as 'vlSumaCierreEurosDesimputado',  
  isnull(@vlSumaCierreRealesDesimputado,0) as 'vlSumaCierreRealesDesimputado',  
  isnull(@vlSumaDiferenciaDeCierreDesimputado,0) as 'vlSumaDiferenciaDeCierreDesimputado',  
  @vlSumaRetencionIVA as 'vlSumaRetencionIVA'  
 FROM #tmp_ResumenCajaADM_SinPesificar a, tb_cajas b, TB_Usuarios c  
 WHERE   a.nrCaja    = b.nrCaja and  
  b.dsUsuario = c.dsUsuario  
 ORDER BY a.tpOperacion asc  
  
end  


go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_obtiene_falta_compensar_v3_7]'))
drop procedure [dbo].sp_obtiene_falta_compensar_v3_7


go 
--- incluir logica de reales
CREATE  procedure sp_obtiene_falta_compensar_v3_7  
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
         tpCupon,suma_vlPagoPesos = CASE tpCupon  
    WHEN 'Contado' THEN  isnull(SUM(vlPagoPesos)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cuenta Corriente' THEN isnull(SUM(vlMontoCupon)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Retorno' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)  
           WHEN 'Cobro en Destino' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)  
         END,  
         isnull(SUM(vlPagoEuros),0)   AS   suma_vlPagoEuros,   
         isnull(SUM(vlPagoDolares),0) AS   suma_vlPagoDolares, 
         isnull(SUM(vlPagoReales),0)  AS   suma_vlPagoReales
         INTO #tb_falta_compensar_agrupado  
  FROM TB_Cupones  
  WHERE (flCompensado = 0) AND (flAnulado = 0) AND   
      tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND   
      nrLicencia NOT IN (999, 998)   
      and dbo.f_sepuedecompensar_2_0(dtCupon,@RESTRICCION_COMPENSACION_DIAS_PAGO,@RESTRICCION_COMPENSACION_HORA_PAGO,getdate())=1  
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
           WHEN 'Cobro en Destino' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)  
         END,  
         isnull(SUM(vlPagoEuros),0)   AS   suma_vlPagoEuros,   
         isnull(SUM(vlPagoDolares),0) AS   suma_vlPagoDolares, 
         isnull(SUM(vlPagoReales),0)  AS   suma_vlPagoReales 
         INTO #tb_falta_compensar_agrupado_sin_restri  
  FROM TB_Cupones  
  WHERE (flCompensado = 0) AND (flAnulado = 0) AND   
      tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND   
      nrLicencia NOT IN (999, 998)   
  Group by tpCupon  
  
  select isnull(sum(suma_vlPagoPesos),0)   as suma_vlPagoPesos,  
         isnull(sum(suma_vlPagoEuros),0)   as suma_vlPagoEuros,  
         isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares,  
         isnull(sum(suma_vlPagoReales),0)  as suma_vlPagoReales, 
         'Sin restricción'				   as dtcupon_hora_corte  
  from #tb_falta_compensar_agrupado_sin_restri  
  
   
 end   
  
end -- fin de procedure  
  
 
go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_obtenerRetenciones_v3_7]'))
drop procedure [dbo].SP_obtenerRetenciones_v3_7


go 
-- Version 3.1 creamos un store procedure para obtener en detalle de las comisiones de la caja diara de la administración   
-- Version 3.2 tenemos en cuenta las desimputaciones  
-- Version 3.7 excluimos el concepto 
create procedure [dbo].[SP_obtenerRetenciones_v3_7] (@nrCaja_param numeric)  
as  
begin  
  
  
 ---obtencion del saldo ingresado en conceptos de comisiones  
 CREATE TABLE #temp_SaldoComisiones (  
  [vlSumaPesos] [float] NULL ,  
  [vlSumaDolares] [float] NULL ,  
  [vlSumaEuros] [float] NULL   
 )   
  
  
 INSERT INTO #temp_SaldoComisiones ([vlSumaPesos], [vlSumaDolares], [vlSumaEuros])  
 SELECT isnull(SUM(a.vlPesos),0)   AS vlSumaPesos,   
        isnull(SUM(a.vlDolares),0) As vlSumaDolares,   
        isnull(SUM(a.vlEuros),0)   AS vlSumaEuros  
 FROM dbo.TB_MovimientosContables a  
  where a.cdConcepto in (2010,2014,2015,2019)   --  version 3.7 excluimos al concepto 2020  
   and a.nrCaja =  @nrCaja_param   
   and (a.tpMovimiento<>'Desimputacion'  or a.tpMovimiento is null)  
        union all  
 SELECT -abs(isnull(SUM(a.vlPesos),0))   AS vlSumaPesos,   
        -abs(isnull(SUM(a.vlDolares),0)) As vlSumaDolares,   
        -abs(isnull(SUM(a.vlEuros),0))   AS vlSumaEuros  
 FROM dbo.TB_MovimientosContables a  
  where a.cdConcepto in (2010,2014,2015,2019)  --  version 3.7 excluimos al concepto 2020  
   and a.nrCaja =  @nrCaja_param   
   and a.tpMovimiento='Desimputacion'  
  
 select  sum(vlSumaPesos)    as vlSumaPesos,  
     sum(vlSumaDolares)  as vlSumaDolares,  
     sum(vlSumaEuros)    as vlSumaEuros  
 from #temp_SaldoComisiones  
  
end  
  

 

  

---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------
--------------------------------------------------------------
---- TEST INTEGRAL EULISES 11-02-2010


go 

drop view  dbo.VW_CajadeADMAbierta;

go

CREATE VIEW dbo.VW_CajadeADMAbierta
AS
SELECT nrCaja, vlSaldoFinalRealPesos, vlSaldoFinalRealEuros, 
    vlSaldoFinalRealDolares, vlSaldoFinalRealReales, dsUsuario
FROM dbo.TB_Cajas
WHERE (flEstado = 0) AND (flCajaAdm = 1) AND (nrCaja =
        (SELECT MAX(nrcaja)
      FROM dbo.TB_Cajas
      WHERE (flEstado = 0) AND (flCajaAdm = 1)))

go




 

  


  


  
