-- Cambios de DDL version 4.3
use dbSG2000
go



--- Crear login y usuario USRSG2013   con password ITf0nBD


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_rpt_Productos_v1' )
	drop procedure  [dbo].[SP_rpt_Productos_v1];

go

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*********************************************************************************************************************
create PROCEDURE [SP_rpt_Productos_v1] @flCapitalFederal_param bit
AS

	set dateformat dmy

	exec SP_GeneraTarifas

	if @flCapitalFederal_param=1
		SELECT 
		TB_Productos.cdProducto, TB_Productos.dsProducto, TB_Productos.vlPrecioViaje, TB_Productos.vlPrecioPeaje, TB_Productos.cdOrden, TB_Productos.vlPrecioViajeSinPeaje
		FROM
   		 dbSG2000.dbo.TB_Productos TB_Productos	
		WHERE
    		TB_Productos.flMuestra =1 And TB_Productos.dsProducto LIKE '%CAPITAL FEDERAL%' and  cdOrden is not null
		and TB_Productos.flEliminar =0
		ORDER BY TB_Productos.cdOrden, TB_Productos.dsProducto  ASC
	else
		SELECT 
		TB_Productos.cdProducto, TB_Productos.dsProducto, TB_Productos.vlPrecioViaje, TB_Productos.vlPrecioPeaje, TB_Productos.cdOrden, TB_Productos.vlPrecioViajeSinPeaje
		FROM
   		 dbSG2000.dbo.TB_Productos TB_Productos
		WHERE
    		TB_Productos.flMuestra =1 And TB_Productos.dsProducto <> '99 - PAGO DE CUPONES' And  not TB_Productos.dsProducto LIKE '%CAPITAL FEDERAL%'
		 and  cdOrden is not null
		and TB_Productos.flEliminar =0
		ORDER BY TB_Productos.cdOrden, TB_Productos.dsProducto  ASC


--*****************************************************************************************************************************


GO

/****** Object:  Table [dbo].[Conexion]    Script Date: 05/14/2013 18:33:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

if exists (SELECT * FROM sys.tables  where name ='Conexion' )
	DROP TABLE [dbo].[Conexion];
go 
	

CREATE TABLE [dbo].[Conexion](
	[Id_conexion] [int] NOT NULL,
	[plataforma] [varchar](10) NULL,
	[ambiente] [char](15) NULL,
	[nombre] [varchar](50) NULL,
	[driver] [varchar](60) NULL,
	[url] [varchar](200) NULL,
	[usuario] [varchar](20) NULL,
	[password] [varchar](20) NULL,
 CONSTRAINT [PK_Conexion] PRIMARY KEY CLUSTERED 
(
	[Id_conexion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Conexion]    Script Date: 05/14/2013 18:33:06 ******/


go


if exists (SELECT * FROM sys.tables  where name ='plantillas_excel_detalle' )
	DROP TABLE [dbo].[plantillas_excel_detalle];

go

if exists (SELECT * FROM sys.tables  where name ='plantillas_excel' )
	DROP TABLE [dbo].[plantillas_excel];

GO

/****** Object:  Table [dbo].[plantillas_excel]    Script Date: 05/02/2013 17:13:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[plantillas_excel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aplicacion] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[hoja_xls] [varchar](50) NULL,
	[ruta_archivo] [varchar](80) NULL,
	[fila_datos] [int] NULL,
	[columnas] [int] NULL,
	[filas] [int] NULL,
	[base_destino] [varchar](50) NULL,
	[procedimiento] [varchar](80) NULL,
	[carp_archivo_tmp] [varchar](200) NULL,
	[separador] [char](1) NULL,
 CONSTRAINT [PK__plantillas_excel__4FF1D159] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO





go 

/****** Object:  Table [dbo].[plantillas_excel_detalle]    Script Date: 05/02/2013 17:13:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO



CREATE TABLE [dbo].[plantillas_excel_detalle](
	[id] [int] NULL,
	[tipo_detalle] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[fila] [int] NULL,
	[columna] [int] NULL,
	[valor] [varchar](100) NULL,
	[tipo_dato] [varchar](12) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[plantillas_excel_detalle]  WITH CHECK ADD  CONSTRAINT [FK__plantillas_E__id__51DA19CB] FOREIGN KEY([id])
REFERENCES [dbo].[plantillas_excel] ([id])
GO

ALTER TABLE [dbo].[plantillas_excel_detalle] CHECK CONSTRAINT [FK__plantillas_E__id__51DA19CB]
GO


/*

 Exec  SP_TB_Cupones_Qry_v3_9 @dtCupon_desde_param='10-06-2012 00:00:00.000',
							 @dtCupon_hasta_param='13-05-2013 23:59:59.000',@nrLicencia_param=0,@flAnulado_param=0,
							 @flCompensado_param=0,@flNoPagados_param=0,@flAgrupado=0,@vlMontoCupon_param=0,@flIVA=0

*/
							 
Go





if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_TB_Cupones_Qry_v3_9' )
	drop procedure  [dbo].[SP_TB_Cupones_Qry_v3_9];
	

go
	  
-- Modificado version 3.9  
-- Todos los viajes pagados al Licenciatario @flCompensado_param=1  
-- Todos lo Viajes Facturados al Licenciatario @flCompensado_param=0  
create procedure [dbo].[SP_TB_Cupones_Qry_v3_9]  
@dtCupon_desde_param datetime,  
@dtCupon_hasta_param datetime,  
@nrLicencia_param    int=0,  
@flAnulado_param     bit=0,  
@flCompensado_param  bit=1,  
@flNoPagados_param   bit=1,  
@flAgrupado          int=0,  
@vlMontoCupon_param  int=0,  
@flIVA				 int=0
as  


  
    if @nrLicencia_param=0  
    begin  
        if @flAgrupado=0  
            if @flCompensado_param=1  
            begin  
				-- viajes que fueron pagados al licenciatario   
               select   nrCupon,  
                        nrLicencia,  
                        nmLicenciatario,  
                        tpCupon,  
                        vlMontoCupon,  
                        vlPagoPesos,  
                        vlPagoEuros,  
                        vlPagoDolares,  
                        isnull(vlPagoReales,0)   as vlPagoReales,
                        vlComision,  
						isnull(vlIVA,0) as vlIVA,  
                        vlComision + isnull(vlIVA,0) as vlRetencion,  
                        dtCupon,  
                        nrTalonarioCliente,  
                        nrComprabanteCliente,  
                        tpComprobanteCliente,  
                        tpLetraCliente,  
                        flCompensado,  
                        nrCajaCliente,  
                        nrCajaLicenciatario,  
                        dtCompensado,  
                        dsUsuario,  
                        dsObservacion,  
                        dsDestino,  
                        dsHoraViaje,  
						flPosee_obs = CASE  isnull(dsObservacion,'')    
						 WHEN null then 0  
						 WHEN '' then 0  
								ELSE 1
							END, 
						
					    dsLeyenda
				into #tmp_cupones    
                From TB_Cupones  
                Where  
                    flAnulado = @flAnulado_param and  
                    flCompensado=@flCompensado_param  and  
                    dtcupon>=@dtCupon_desde_param and  
                    dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and  
					flEliminar=0 and vlMontoCupon>@vlMontoCupon_param  
					and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
                ---order by  dtCupon, nrLicencia desc --  nrLicencia, dtCupon  
                  
                select a.*, b.flmanual from #tmp_cupones a, TB_Comprobantes b   
                where a.nrComprabanteCliente = b.nrComprobante and   
                      a.nrTalonarioCliente =   b.nrTalonario and  
                      a.tpComprobanteCliente = b.tpComprobante and   
                      a.tpLetraCliente = b.tpLetra  
			   order by a.dtCupon  desc   ---, a.nrLicencia                     
                        
            end      
            Else  
            begin  
				-- viajes que fueron facturados (pagados o sin pagar) al Licenciatario  
                select nrCupon,  
                    nrLicencia,  
                    nmLicenciatario,  
                    tpCupon,  
                    vlMontoCupon,  
                    vlPagoPesos,  
                    vlPagoEuros,  
                    vlPagoDolares,  
                    vlPagoReales,
                    vlComision,  
					isnull(vlIVA,0) as vlIVA,  
                    vlComision + isnull(vlIVA,0) as vlRetencion,  
                    dtCupon,  
                    nrTalonarioCliente,  
                    nrComprabanteCliente,  
                    tpComprobanteCliente,  
                    tpLetraCliente,  
                    flCompensado,  
                    nrCajaCliente,  
                    nrCajaLicenciatario,  
                    dtCompensado,  
                    dsUsuario,  
                    dsObservacion,  
                    dsDestino,  
                    dsHoraViaje,  
					 flPosee_obs = CASE  isnull(dsObservacion,'')    
					 WHEN null then 0  
					 WHEN '' then 0  
							ELSE 1   
						END,     
					dsLeyenda  
					into #tmp_cupones1  
                  From TB_Cupones  
                    Where  
						(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0)  and  
						flEliminar=0  and  
                        flAnulado = @flAnulado_param and  
                        dtcupon>=@dtCupon_desde_param and  
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and  
						((@flNoPagados_param=1 and flCompensado=0) OR   
						(@flNoPagados_param=0))   
						and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
                   -- order by dtCupon, nrLicencia desc -- nrLicencia,  dtCupon  
                      
                              
                select a.*, b.flmanual from #tmp_cupones1 a, TB_Comprobantes b   
                where a.nrComprabanteCliente = b.nrComprobante and   
                      a.nrTalonarioCliente =   b.nrTalonario and  
                      a.tpComprobanteCliente = b.tpComprobante and   
                      a.tpLetraCliente = b.tpLetra  
                order by a.dtCupon desc ---, a.nrLicencia  
                                
        end              
        else -- Agrupado  
     -- viajes que fueron pagados al licenciatario   
            if @flCompensado_param=1  
                    select nrLicencia,  
                            min(nmLicenciatario) as Licenciatario,  
                            COUNT(*) AS CantidadViajes,  
							SUM(vlMontoCupon) as vlSumaPesos ,  
                            sum(vlComision) as vlSumaComision,  
                            (SUM(vlMontoCupon) - sum(vlComision) - sum(isnull(vlIVA,0)) ) as vlTotalaFacturar,  
							sum(isnull(vlIVA,0))  vlSumaIVA  
                    From TB_Cupones  
                    Where  
						 (vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0)  and  
						 flEliminar=0  and  
                        flAnulado = @flAnulado_param and    
                        flCompensado=@flCompensado_param  and  
                        dtcupon>=@dtCupon_desde_param and  
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900)  
                        and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
                    GROUP BY nrLicencia  
        order by nrLicencia  
            Else  
        -- viajes que fueron facturados (pagados o sin pagar) al Licenciatario  
                    select nrLicencia,  
                            min(nmLicenciatario) as Licenciatario,  
                            COUNT(*) AS CantidadViajes,  
                            SUM(vlMontoCupon) as vlSumaPesos ,  
                            sum(vlComision) as vlSumaComision,  
                            (SUM(vlMontoCupon) - sum(vlComision) - sum(isnull(vlIVA,0)) ) as vlTotalaFacturar,  
							sum(isnull(vlIVA,0))  vlSumaIVA  
                    From TB_Cupones  
                    Where  
						(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0)  and  
						flEliminar=0  and  
                        flAnulado=@flAnulado_param and  
                        dtcupon>=@dtCupon_desde_param and  
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and  
						((@flNoPagados_param=1 and flCompensado=0) OR   
						(@flNoPagados_param=0))  
						and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
                    GROUP BY nrLicencia  
        order by nrLicencia  
    End  
    Else  
    begin  
 --   
        if @flAgrupado=0  
        begin  
                if @flCompensado_param=1  
                begin  
                  
                    select   nrCupon,  
                               nrLicencia,  
                               nmLicenciatario,  
                               tpCupon,  
                               vlMontoCupon,  
                               vlPagoPesos,  
                               vlPagoEuros,  
                               vlPagoDolares,
                               isnull(vlPagoReales,0)   as vlPagoReales,  
                               vlComision,  
							   isnull(vlIVA,0) as vlIVA,  
								vlComision + isnull(vlIVA,0) as vlRetencion,  
                               dtCupon,  
                               nrTalonarioCliente,  
                               nrComprabanteCliente,  
                               tpComprobanteCliente,  
								tpLetraCliente,  
                               flCompensado,  
                               nrCajaCliente,                                 
                               nrCajaLicenciatario,  
                               dtCompensado,  
                               dsUsuario,  
                               dsObservacion,  
                               dsDestino,  
                               dsHoraViaje,  
							   flPosee_obs = CASE  isnull(dsObservacion,'')  
								 WHEN null then 0  
								 WHEN '' then 0  
										ELSE 1
									END,    
							  dsLeyenda              
							into #tmp_cupones2  
							From TB_Cupones  
							Where  
							   (vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0)  and  
								flEliminar=0  and  
							   flAnulado = @flAnulado_param and  
							   nrLicencia=@nrLicencia_param and  
							    flCompensado=@flCompensado_param  and  
								dtcupon>=@dtCupon_desde_param and  
							    dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900)  
							    and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
								--order by dtCupon, nrLicencia  desc -- nrLicencia,dtCupon  
       
								 select a.*, b.flmanual from #tmp_cupones2 a, TB_Comprobantes b   
								 where a.nrComprabanteCliente = b.nrComprobante and   
									a.nrTalonarioCliente =   b.nrTalonario and  
									a.tpComprobanteCliente = b.tpComprobante and   
									a.tpLetraCliente = b.tpLetra  
								order by a.dtCupon desc ---, a.nrLicencia  
							                                 
							  
                end          
                Else  
                begin  
                  
                        select   nrCupon,  
                                 nrLicencia,  
                                 nmLicenciatario,  
                                 tpCupon,  
                                 vlMontoCupon,  
                                 vlPagoPesos,  
								 vlPagoEuros,  
							     vlPagoDolares,  
							     isnull(vlPagoReales,0)   as vlPagoReales,
                                 vlComision,  
							     isnull(vlIVA,0) as vlIVA,  
                                 vlComision + isnull(vlIVA,0) as vlRetencion,  
                                 dtCupon,  
                                 nrTalonarioCliente,  
                                 nrComprabanteCliente,  
                                 tpComprobanteCliente,  
								 tpLetraCliente,  
                                 flCompensado,  
                                 nrCajaCliente,  
                                 nrCajaLicenciatario,  
                                 dtCompensado,  
                                 dsUsuario,  
                                 dsObservacion,  
                                 dsDestino,  
                                 dsHoraViaje,  
								 flPosee_obs = CASE isnull(dsObservacion,'')  
								 WHEN null then 0  
								 WHEN '' then 0  
								  ELSE   0
								 END,   
								 dsLeyenda
								into #tmp_cupones3     
								From TB_Cupones  
								Where  
								(vlMontoCupon >= @vlMontoCupon_param or @vlMontoCupon_param = 0) and   
								 flEliminar=0  and  
                                 flAnulado  = @flAnulado_param and  
                                 nrLicencia = @nrLicencia_param and    
								 dtcupon>=@dtCupon_desde_param and  
                                 dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and  
								 ((@flNoPagados_param=1 and flCompensado=0) OR   
								 (@flNoPagados_param=0))  
								 and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
                  
							select a.*, b.flmanual from #tmp_cupones3 a, TB_Comprobantes b   
							where a.nrComprabanteCliente = b.nrComprobante and   
								  a.nrTalonarioCliente =   b.nrTalonario and  
								  a.tpComprobanteCliente = b.tpComprobante and   
								  a.tpLetraCliente = b.tpLetra  
								  order by a.dtCupon desc ---, a.nrLicencia  
                                
   end  
        End  
        else -- Agrupado  
                if @flCompensado_param=1  
                    select nrLicencia,  
                            min(nmLicenciatario) as Licenciatario,  
                            COUNT(*) AS CantidadViajes,  
                            SUM(vlMontoCupon) as vlSumaPesos ,  
                            sum(vlComision) as vlSumaComision,  
                            (SUM(vlMontoCupon) - sum(vlComision) - sum(isnull(vlIVA,0)) ) as vlTotalaFacturar,  
							sum(isnull(vlIVA,0))  vlSumaIVA  
							From TB_Cupones  
							Where  
							(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0) and   
							flEliminar=0  and  
							flAnulado = @flAnulado_param and  
							nrLicencia=@nrLicencia_param and  
							flCompensado=@flCompensado_param  and  
							dtcupon>=@dtCupon_desde_param and  
							dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) 
							and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva 
							GROUP BY nrLicencia  
							order by nrLicencia  
                Else  
                    select  nrLicencia,  
                            min(nmLicenciatario) as Licenciatario,  
                            COUNT(*) AS CantidadViajes,  
                            SUM(vlMontoCupon) as vlSumaPesos ,  
                            sum(vlComision) as vlSumaComision,  
                           (SUM(vlMontoCupon) - sum(vlComision) - sum(isnull(vlIVA,0)) ) as vlTotalaFacturar,  
							sum(isnull(vlIVA,0))  vlSumaIVA  
                    From TB_Cupones  
                    Where  
						(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0) and   
						flEliminar=0  and  
                        flAnulado = @flAnulado_param and  
                        nrLicencia=@nrLicencia_param and  
                        dtcupon>=@dtCupon_desde_param and  
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and  
						((@flNoPagados_param=1 and flCompensado=0) OR   
						(@flNoPagados_param=0))  
						and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
						GROUP BY nrLicencia  
						order by nrLicencia  
    End  


GO

/****** Object:  Table [dbo].[tmp_carga_de_producto]    Script Date: 05/14/2013 10:22:13 ******/
/****** Object:  Table [dbo].[tmp_carga_de_producto]    Script Date: 05/14/2013 10:22:13 ******/
/****** Object:  Table [dbo].[tmp_carga_de_producto]    Script Date: 05/14/2013 10:22:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

if exists (SELECT * FROM sys.tables  where name ='tmp_carga_de_producto' )
	DROP TABLE [dbo].[tmp_carga_de_producto];



GO


CREATE TABLE [dbo].[tmp_carga_de_producto](
	[cdProducto] [int] NOT NULL,
	[dsProducto] [varchar](200) NULL,
	[vlPrecioViajeSinPeaje] [float] NULL,
	[vlPrecioPeaje] [float] NULL,
	[vlPrecioViaje] [float] NULL,
	[flMuestraenlaWEB] [char](10) NULL,
	[flIncluyeComisionRetorno] [char](10) NULL,
	[obsHoras] [varchar](100) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmp_carga_de_producto]    Script Date: 05/14/2013 10:22:13 ******/
/****** Object:  Table [dbo].[tmp_carga_de_producto]    Script Date: 05/14/2013 10:22:13 ******/
/****** Object:  Table [dbo].[tmp_carga_de_producto]    Script Date: 05/14/2013 10:22:13 ******/

GO


----EXEC spu_carga_destinos 'C:\limpiar\2013-5-14_presupuestos.txt',10,'|',null,null,'QUIDELE'
----select * from tmp_carga_de_producto

/*

 
 begin tran
 
 EXEC spu_carga_destinos 'C:\limpiar\2013-5-22_presupuestos.txt',10,'|',null,null,'QUIDELE'
 
 
 rollback tran
 
*/
 
GO


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_carga_destinos' )
	drop procedure  [dbo].[spu_carga_destinos];
	
	
GO


create PROCEDURE [dbo].[spu_carga_destinos] (  @rutaArchivo VARCHAR(100),
											@idPlantilla INT,
											@separador CHAR(1),
											@ejercicio VARCHAR(7),
											@version int,
											@usuario VARCHAR(20)=null)

AS
BEGIN
	--DECLARE @rutaArchivo VARCHAR(100)
	--DECLARE @idPlantilla INT
	--DECLARE @separador CHAR(1)
	--DECLARE @ejercicio VARCHAR(7)
	--DECLARE @version int
	--DECLARE @usuario VARCHAR(20)
	--SET @rutaArchivo = '\\192.1.1.205\Datos$\COMUN\Eulises\2011-11-17_presupuestos.txt'
	--SET @idPlantilla = 1
	--SET @separador = '|'
	--SET @ejercicio = '2011/12'
	--SET @version = 1
	--SET @usuario = 'turinad'


	DECLARE @TablaManejo varchar(25)
	SET @TablaManejo = 'tmp_carga_de_producto'


	truncate TABLE tmp_carga_de_producto
	
	------------------Insertamos desde el archivo de texto---------------------------------
	DECLARE @SQL VARCHAR(200) 
	DECLARE @ruta VARCHAR(200) 
	
	--SET @ruta = REPLACE(@rutaArchivo,'f:','\\192.1.1.205\datos$')
	SET @ruta = @rutaArchivo
	
	
	--Se ARMA EL INSERT   
	SET @SQL = 'BULK INSERT  '+@TablaManejo+'  FROM ''' + @ruta + ''' WITH (FIRSTROW = 0, FIELDTERMINATOR = ''' + CONVERT(VARCHAR,@separador) + ''') '
	--PRINT @SQL
	--Se ejecuta el BULK
	EXEC (@SQL)
	
	
	
	select 
		[cdProducto],
		[dsProducto],
		[vlPrecioViajeSinPeaje],
		[vlPrecioPeaje],
		[vlPrecioViaje],
		[flMuestraenlaWEB],
		[flIncluyeComisionRetorno],
		[obsHoras],
		'OK       '			as resultado,
		replicate(' ',50)   as obs_resultado
	into #tmp_carga_de_producto from tmp_carga_de_producto  
	
	--- realizamos validaciones
	select x.cdProducto into  #tmp_valida_codigo_producto
	from  tmp_carga_de_producto x where x.cdProducto not in (select cdProducto from  TB_Productos) 
	     
	
	update x
	set    x.resultado = 'ERROR',
		   x.obs_resultado = 'Código de Producto Inexistente: '+ CONVERT(varchar(10),  x.cdProducto )	
	from  #tmp_carga_de_producto x inner join  #tmp_valida_codigo_producto  y on x.cdProducto = y.cdProducto     
	


	select x.[cdProducto] into  #tmp_valida_precio_viaje
	from  #tmp_carga_de_producto x where (x.vlPrecioViajeSinPeaje is null or x.vlPrecioViajeSinPeaje = 0)
											and   (x.vlPrecioViaje is null or x.vlPrecioViaje = 0)
											and x.resultado <> 'OK       '
			
	update x
	set    x.resultado = 'ERROR',
		   x.obs_resultado = 'Monto del Viaje no válido, Precio Viaje Sin Peaje = '+ CONVERT(varchar(10),vlPrecioViajeSinPeaje)	
							  + ' Precio Viaje = '+ CONVERT(varchar(10),vlPrecioViaje)
	from  #tmp_carga_de_producto x inner join  #tmp_valida_precio_viaje  y on x.cdProducto = y.cdProducto     
	
	
	select x.* into  #tmp_valida_resultado
	from  #tmp_carga_de_producto x where x.resultado = 'ERROR'
	
	if @@ROWCOUNT >0 
	begin
		
		declare @datos        XML
		declare @strMSG		  varchar(4000)
		declare @datos_char   varchar(4000)

		set @strMSG	=''
		set @datos_char  =''
		
		set @datos = (select top 20  
		    obs_resultado as 'Error' ,
			[cdProducto] as 'Producto',
			[dsProducto] as 'Descripción',
			convert(decimal(6,2), [vlPrecioViajeSinPeaje]) as 'Importe',
			convert(decimal(6,2),[vlPrecioPeaje]) as 'Peajes',
			convert(decimal(6,2),[vlPrecioViaje]) as Total	 from #tmp_valida_resultado RESULTADOS  FOR XML AUTO, TYPE) 
		 
		set @datos_char =   CONVERT(varchar(4000),@datos)
		set @strMSG = 'Error al intentar actualizar la base de datos: '  + @datos_char  
	
		raiserror (@strMSG,16,1)
		return 0
	end
	
	--- realizamos la insercion en la base de datos
		
	update x
	set    x.[vlPrecioViajeSinPeaje]      = y.[vlPrecioViajeSinPeaje],
		   x.[vlPrecioPeaje]			  = y.[vlPrecioPeaje],
		   x.[vlPrecioViaje]			  = y.[vlPrecioViaje]   
	from  TB_Productos  x inner join  #tmp_carga_de_producto  y on x.cdProducto = y.cdProducto     
	

END	

go
