-- Cambios de DDL version 4.9
use dbSG2000
go



if exists ( select * from sys.tables where name = 'TB_Productos_Historico' ) 
begin 
	drop table [dbo].[TB_Productos_Historico]
end

go
/****** Object:  Table [dbo].[TB_Productos_Historico]    Script Date: 14/04/2016 16:55:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_Productos_Historico](
	[idtabla] [int] IDENTITY(1,1) NOT NULL,
	[cdProducto] [int] NOT NULL,
	[dsProducto] [varchar](200) NULL,
	[vlPrecioViaje] [float] NULL,
	[vlPrecioPeaje] [float] NULL,
	[obsHoras] [varchar](50) NULL,
	[vlPorcentaje] [int] NULL,
	[tpOperacion] [varchar](20) NULL,
	[flMuestra] [bit] NOT NULL,
	[cdOrden] [varchar](1) NULL,
	[vlPrecioViajeSinPeaje] [float] NULL,
	[vlKilometros] [float] NULL,
	[dtActualizacion] [datetime] NULL,
	[flEliminar] [bit] NULL,
	[vlPrecioxKilometro] [float] NULL,
	[flMuestraenlaWEB] [bit] NULL,
	[flIncluyeComisionRetorno] [bit] NULL,
	[tpDestino] [varchar](20) NULL,
	[cdComision] [int] NULL,
	[fecha_insercion] [datetime] NULL,
 CONSTRAINT [PK__TB_ProductosHistorico__73DA2C14] PRIMARY KEY NONCLUSTERED 
(
	[idtabla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF_TB_ProductosHistorico_vlPorcentaje]  DEFAULT ((0)) FOR [vlPorcentaje]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF_TB_ProductosHistorico_tpOperacion]  DEFAULT ('Viaje') FOR [tpOperacion]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF_TB_ProductosHistorico_flMuestra]  DEFAULT ((1)) FOR [flMuestra]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF__TB_Produc__flEli__573EB8BD]  DEFAULT ((0)) FOR [flEliminar]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF__TB_Produc__flMue__5832DCF6]  DEFAULT ((0)) FOR [flMuestraenlaWEB]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF__TB_Produc__flInc__5927012F]  DEFAULT ((0)) FOR [flIncluyeComisionRetorno]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] ADD  CONSTRAINT [DF_TB_Productos_Historico_fecha_insercion]  DEFAULT (getdate()) FOR [fecha_insercion]
GO



GO


if exists (select * from sys.triggers where name = 'delupd_tb_productos')
begin
	DROP TRIGGER [dbo].[delupd_tb_productos]
end
GO

/****** Object:  Trigger [dbo].[delupd_tb_productos]    Script Date: 14/04/2016 16:54:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<QUIDEL, Eulises>
-- Create date: <14-04-2016>
-- Description:	<Graba Historico por si hay que recuperar informaci�n>
-- =============================================
CREATE TRIGGER [dbo].[delupd_tb_productos]
   ON  [dbo].[TB_Productos]
   AFTER DELETE,UPDATE
AS 
BEGIN

	insert into dbo.TB_Productos_Historico ([cdProducto]
      ,[dsProducto]
      ,[vlPrecioViaje]
      ,[vlPrecioPeaje]
      ,[obsHoras]
      ,[vlPorcentaje]
      ,[tpOperacion]
      ,[flMuestra]
      ,[cdOrden]
      ,[vlPrecioViajeSinPeaje]
      ,[vlKilometros]
      ,[dtActualizacion]
      ,[flEliminar]
      ,[vlPrecioxKilometro]
      ,[flMuestraenlaWEB]
      ,[flIncluyeComisionRetorno]
      ,[tpDestino]
      ,[cdComision])
	SELECT [cdProducto]
      ,[dsProducto]
      ,[vlPrecioViaje]
      ,[vlPrecioPeaje]
      ,[obsHoras]
      ,[vlPorcentaje]
      ,[tpOperacion]
      ,[flMuestra]
      ,[cdOrden]
      ,[vlPrecioViajeSinPeaje]
      ,[vlKilometros]
      ,[dtActualizacion]
      ,[flEliminar]
      ,[vlPrecioxKilometro]
      ,[flMuestraenlaWEB]
      ,[flIncluyeComisionRetorno]
      ,[tpDestino]
      ,[cdComision]
  FROM deleted 






END

GO




if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_Supera_KM_IVA_segunMonto_4_9' )
	drop procedure  dbo.SP_Supera_KM_IVA_segunMonto_4_9

go
	

CREATE procedure SP_Supera_KM_IVA_segunMonto_4_9
(@tpCategoriaIVA_param varchar(5)=null,
@vlKilometros_param   int=0,
@vlMonto_param	      float=0,
@tpComprobante_param  char(2))
as
begin
declare @precio_km float
declare @Kilometros_IVA int

	if @tpComprobante_param = 'NC' or  @tpComprobante_param = 'NC' 
		select 'N' as RESPUESTA,0  as Kilometros, 'N' as Pregunta
	
	
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

SET ANSI_PADDING OFF
GO


if exists ( select * from sys.tables where name = 'TB_ConciliacionDetalle' ) 
begin 
	DROP TABLE [dbo].[TB_ConciliacionDetalle]
end

GO

if exists ( select * from sys.tables where name = 'TB_Conciliacion' ) 
begin 
	DROP TABLE [dbo].[TB_Conciliacion]
end


GO

/****** Object:  Table [dbo].[TB_Conciliacion]    Script Date: 27/06/2016 16:47:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO


CREATE TABLE [dbo].[TB_Conciliacion](
	[IdConciliacion] [int] IDENTITY(1,1) NOT NULL,
	[dtConciliacion] [date] NULL,
	[dsUsuario] [varchar](20) NULL,
	[nrCajaAdm] [numeric](18, 0) NULL,
	[dtModificacion] [datetime] NULL,
	[flestado] [char](1) NULL,
 CONSTRAINT [PK_TB_Conciliacion] PRIMARY KEY CLUSTERED 
(
	[IdConciliacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[TB_ConciliacionDetalle](
	[IdConciliacion] [int] NOT NULL,
	[nrCupon] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_TB_ConciliacionDetalle] PRIMARY KEY CLUSTERED 
(
	[IdConciliacion] ASC,
	[nrCupon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



ALTER TABLE [dbo].[TB_ConciliacionDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TB_ConciliacionDetalle_TB_Conciliacion] FOREIGN KEY([IdConciliacion])
REFERENCES [dbo].[TB_Conciliacion] ([IdConciliacion])
GO

ALTER TABLE [dbo].[TB_ConciliacionDetalle] CHECK CONSTRAINT [FK_TB_ConciliacionDetalle_TB_Conciliacion]
GO

GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='nrTarjeta')
	ALTER TABLE dbo.TB_Cupones ADD  nrTarjeta varchar(50) NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='tpDocTarjeta')
	ALTER TABLE dbo.TB_Cupones ADD  tpDocTarjeta nchar(10) NULL;


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='nrDocTarjeta')
	ALTER TABLE dbo.TB_Cupones ADD  nrDocTarjeta nchar(25) NULL;



if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='nrTarjeta')
	ALTER TABLE dbo.TB_Comprobantes ADD  nrTarjeta varchar(50) NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='tpDocTarjeta')
	ALTER TABLE dbo.TB_Comprobantes ADD  tpDocTarjeta nchar(10) NULL;


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='nrDocTarjeta')
	ALTER TABLE dbo.TB_Comprobantes ADD  nrDocTarjeta nchar(25) NULL;


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='vlRecargoTarjeta')
	ALTER TABLE dbo.TB_Cupones ADD  vlRecargoTarjeta [float] NULL;


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='vlRecargoTarjeta')
	ALTER TABLE dbo.TB_Comprobantes ADD  vlRecargoTarjeta [float] NULL;


GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_ComprobantesDetalle' and COLUMN_NAME='vlPrecioTC')
	ALTER TABLE dbo.TB_ComprobantesDetalle ADD  [vlPrecioTC] [float] NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_ComprobantesDetalle' and COLUMN_NAME='vlPrecioTD')
	ALTER TABLE dbo.TB_ComprobantesDetalle ADD  [vlPrecioTD] [float] NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_ComprobantesDetalle' and COLUMN_NAME='vlRecargoTC')
	ALTER TABLE dbo.TB_ComprobantesDetalle ADD  vlRecargoTC [float] NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_ComprobantesDetalle' and COLUMN_NAME='vlRecargoTD')
	ALTER TABLE dbo.TB_ComprobantesDetalle ADD  vlRecargoTD [float] NULL;

go



if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_ComprobantesDetalle_Imprime' and COLUMN_NAME='vlPrecioTC')
	ALTER TABLE dbo.TB_ComprobantesDetalle_Imprime ADD  [vlPrecioTC] [float] NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_ComprobantesDetalle_Imprime' and COLUMN_NAME='vlPrecioTD')
	ALTER TABLE dbo.TB_ComprobantesDetalle_Imprime ADD  [vlPrecioTD] [float] NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_ComprobantesDetalle_Imprime' and COLUMN_NAME='vlRecargoTC')
	ALTER TABLE dbo.TB_ComprobantesDetalle_Imprime ADD  vlRecargoTC [float] NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_ComprobantesDetalle_Imprime' and COLUMN_NAME='vlRecargoTD')
	ALTER TABLE dbo.TB_ComprobantesDetalle_Imprime ADD  vlRecargoTD [float] NULL;




go


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_PrepararReimpresiondeComprobante_v4_9' )
	drop procedure  dbo.SP_PrepararReimpresiondeComprobante_v4_9

go

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/****************************************************************/
CREATE PROCEDURE [dbo].SP_PrepararReimpresiondeComprobante_v4_9 
@nrTalonario   char(4),
@nrComprobante char(12),
@tpComprobante char(2), 
@tpLetra	   char(1),
@dsUsuario	   varchar(20) 
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
	    flSincronizado, nrCaja, dtCaja, nrPuesto, 
	    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
	    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
	    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
	    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
	    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
	    nmEmpleado,vlIVA,vlSubTotal,vlPagoReales,vlDiaReal, dsCodDocAfip,
		dsUsuario )
	SELECT nrTalonario, nrComprobante, rtrim(tpComprobante) as tpComprobante, tpLetra, 
	    dtComprobante, cdCondVenta, tpComision, cdCliente, 
	    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
	    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
	    flSincronizado,  nrCaja, dtCaja, nrPuesto, 
	    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
	    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
	    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
	    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
	    dsOpcional2, dsOpcional3,  dsOpcional4, 
		flAnulado, dtAnulado, 
	    nmEmpleado,vlIVA,vlSubTotal, vlPagoReales, vlDiaReal, 
		'COD. ' +  dbo.ufn_obtnerCodComprobanteAFIP_v4_7 (tpComprobante ,tpLetra)  as dsCodDocAfip,  -- Recuperamos el C�digo de AFIP
		@dsUsuario
	FROM TB_Comprobantes WHERE TB_Comprobantes.nrTalonario=@nrTalonario AND
	TB_Comprobantes.nrComprobante=@nrComprobante AND 
	TB_Comprobantes.tpComprobante=@tpComprobante AND
	TB_Comprobantes.tpLetra=@tpLetra;


	INSERT INTO [TB_ComprobantesDetalle_Imprime]
	    (nrTalonario, nrComprobante, tpComprobante, tpLetra, nrItem, 
	    cdProducto, dsProducto, tpOperacion, qtCantidad, vlPorcentaje, 
	    vlPrecioPeaje, vlPrecioViaje, vlTotalItem, dtInsercion, 
	    flSincronizado 
		-- Agregado en la version 4.9
		,  vlPrecioTC  , vlRecargoTC , vlPrecioTD, vlRecargoTD)
	SELECT nrTalonario, nrComprobante, rtrim(tpComprobante) as tpComprobante, tpLetra, 
	    nrItem, cdProducto, dsProducto, tpOperacion, qtCantidad, 
	    vlPorcentaje, vlPrecioPeaje, vlPrecioViaje, vlTotalItem, 
	    dtInsercion, flSincronizado
		-- Agregado en la version 4.9
		, vlPrecioTC  , vlRecargoTC , vlPrecioTD, vlRecargoTD
	FROM TB_ComprobantesDetalle WHERE TB_ComprobantesDetalle.nrTalonario=@nrTalonario AND
	TB_ComprobantesDetalle.nrComprobante=@nrComprobante AND 
	TB_ComprobantesDetalle.tpComprobante=@tpComprobante AND
	TB_ComprobantesDetalle.tpLetra=@tpLetra ;
	
	
	update  a
	set a.nrTelLicenciatario = isnull(b.nrTel,'5480-0066'), 
	    a.dsOpcional4 = (select isnull(vlPrecioViaje, 350)  from tb_productos    where  cdProducto = 90020)
	from TB_Comprobantes_Imprime a , TB_proveedores b
	where a.nrLicencia = b.nrLicencia and
	      a.nrTalonario=@nrTalonario  and
	      a.nrComprobante=@nrComprobante and
	      a.tpComprobante=@tpComprobante and 
	      a.tpLetra=@tpLetra;


	update  a
	set a.nrCAI = b.nrCAI_Talonario_auto_empresa ,
	    a.dtVencimiento  = b.dtCAI_Talonario_auto_empresa
	from TB_Comprobantes_Imprime a inner join TB_Puestos  b on 
							convert(int , a.nrTalonario) = b.nrTalonario_auto_empresa
	where a.nrCAI is null and  (a.tpComprobante = 'A'  or a.tpLetra = 'A')  and a.tpIVA = 'RI' and
	      a.nrTalonario=@nrTalonario  and
	      a.nrComprobante=@nrComprobante and
	      a.tpComprobante=@tpComprobante and 
	      a.tpLetra=@tpLetra;

	

	select 
			x.nrTalonario	,
			x.nrComprobante	,
			x.tpComprobante	,
			x.tpLetra	,
			x.dtComprobante	,
			x.cdCliente	,
			x.cdCondVenta	,
			x.tpComision	,
			x.tpMoneda	,
			x.tpIVA	,
			x.vlTotalGeneral	,
			x.vlPagoPesos	,
			x.vlPagoEuros	,
			x.vlPagoDolares	,
			x.dsLeyenda	,
			x.flManual	,
			x.dtInsercion	,
			x.flSincronizado	,
			x.dsUsuario	,
			x.nrCaja	,
			x.dtCaja	,
			x.nrPuesto	,
			x.dsDomicilio	,
			x.nrLicencia	,
			x.nrBultos	,
			x.nrPasajeros	,
			x.nrDoc	,
			x.dsRazonSocial	,
			x.nmNombre	,
			x.nmApellido	,
			x.nmLicenciatario	,
			x.cdPostal	,
			x.nmLocalidad	,
			x.cdCodBar	,
			x.dsEmail	,
			x.nrTel	,
			x.nrCAI	,
			x.dtVencimiento	,
			x.vlDiaDolar	,
			x.vlDiaEuro	,
			x.dsOpcional1	,
			x.dsOpcional2	,
			x.dsOpcional3	,
			x.dsOpcional4	,
			x.flAnulado	,
			x.dtAnulado	,
			x.nmEmpleado	,
			x.IdReciboCtaCte	,
			x.flCargaErronea	,
			x.problema	,
			x.dsUsuario_Supervisor	,
			x.dtComprobante_hora	,
			x.dtActualizacion	,
			x.flEliminar	,
			x.vlSubtotal	,
			x.vlIVA	,
			x.nrTelLicenciatario	,
			x.vlPagoReales	,
			x.vlDiaReal	,
			x.dsCodDocAfip	,
			y.nrItem	,
			y.cdProducto	,
			y.dsProducto	,
			y.tpOperacion	,
			y.qtCantidad	,
			y.vlPorcentaje	,
			y.vlPrecioPeaje	,
			y.vlPrecioViaje	,
			y.vlTotalItem	,
			y.dtInsercion	,
			y.vlKilometros	
	FROM TB_Comprobantes_Imprime x inner join  TB_ComprobantesDetalle_Imprime y
						on x.nrTalonario = y.nrTalonario and
							x.nrComprobante = y.nrComprobante and
							x.tpComprobante = y.tpComprobante and
							x.tpLetra = y.tpLetra 
	where  x.nrTalonario=@nrTalonario  and
	       x.nrComprobante=@nrComprobante and
	       x.tpComprobante=@tpComprobante and 
	       x.tpLetra=@tpLetra;


	/**sp_help 'TB_Comprobantes_Imprime' 
	sp_help 'TB_ComprobantesDetalle_Imprime' 
	**/

end



