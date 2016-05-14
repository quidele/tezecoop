use FacturaElectronica_homo
go 

GO
/****** Object:  Table [dbo].[tipos_responsables]    Script Date: 05/02/2011 12:43:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipos_responsables]') AND type in (N'U'))
DROP TABLE [dbo].[tipos_responsables]
GO

/****** Object:  Table [dbo].[tipos_responsables]    Script Date: 05/02/2011 12:43:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tipos_responsables](
	[codigo] [int] NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_tipos_responsables] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[condicion_iva]    Script Date: 05/02/2011 12:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[condicion_iva]') AND type in (N'U'))
DROP TABLE [dbo].[condicion_iva]
GO


/****** Object:  Table [dbo].[condicion_iva]    Script Date: 05/02/2011 12:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[condicion_iva](
	[codigo] [int] NOT NULL,
	[descripcion] [char](12) NULL,
 CONSTRAINT [PK_conducion_iva] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[paises]    Script Date: 05/02/2011 12:44:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paises]') AND type in (N'U'))
DROP TABLE [dbo].[paises]
GO

/****** Object:  Table [dbo].[paises]    Script Date: 05/02/2011 12:44:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[paises](
	[codigo] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[denominacion] [varchar](100) NULL,
 CONSTRAINT [PK_paises] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



GO

/****** Object:  Table [dbo].[cuit_paises]    Script Date: 05/02/2011 12:45:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuit_paises]') AND type in (N'U'))
DROP TABLE [dbo].[cuit_paises]
GO

/****** Object:  Table [dbo].[cuit_paises]    Script Date: 05/02/2011 12:45:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[cuit_paises](
	[cuit] [char](13) NULL,
	[pais] [varchar](100) NULL,
	[tipo_sujeto] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_comprobantes_ml_conceptos]') AND parent_object_id = OBJECT_ID(N'[dbo].[comprobantes_ml]'))
ALTER TABLE [dbo].[comprobantes_ml] DROP CONSTRAINT [FK_comprobantes_ml_conceptos]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_comprobantes_ml_moneda]') AND parent_object_id = OBJECT_ID(N'[dbo].[comprobantes_ml]'))
ALTER TABLE [dbo].[comprobantes_ml] DROP CONSTRAINT [FK_comprobantes_ml_moneda]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_comprobantes_ml_tipo_comprobante]') AND parent_object_id = OBJECT_ID(N'[dbo].[comprobantes_ml]'))
ALTER TABLE [dbo].[comprobantes_ml] DROP CONSTRAINT [FK_comprobantes_ml_tipo_comprobante]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_comprobantes_ml_tipo_documento]') AND parent_object_id = OBJECT_ID(N'[dbo].[comprobantes_ml]'))
ALTER TABLE [dbo].[comprobantes_ml] DROP CONSTRAINT [FK_comprobantes_ml_tipo_documento]
GO


/****** Object:  Table [dbo].[comprobantes_ml]    Script Date: 05/02/2011 13:00:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[comprobantes_ml]') AND type in (N'U'))
DROP TABLE [dbo].[comprobantes_ml]
GO


/****** Object:  Table [dbo].[comprobantes_ml]    Script Date: 05/02/2011 13:00:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[comprobantes_ml](
	[idsolicitud] [int] NOT NULL,
	[CbteTipo] [int] NOT NULL,
	[PtoVta] [int] NOT NULL,
	[Concepto] [int] NOT NULL,
	[DocTipo] [int] NOT NULL,
	[DocNro] [numeric](11, 0) NOT NULL,
	[CbteDesde] [numeric](8, 0) NOT NULL,
	[CbteHasta] [numeric](8, 0) NOT NULL,
	[CbteFch] [date] NULL,
	[ImpTotal] [numeric](13, 2) NOT NULL,
	[ImpTotConc] [numeric](13, 2) NOT NULL,
	[ImpNeto] [numeric](13, 2) NOT NULL,
	[ImpOpEx] [numeric](13, 2) NOT NULL,
	[ImpIVA] [numeric](13, 2) NOT NULL,
	[ImpTrib] [numeric](13, 2) NOT NULL,
	[FchServDesde] [date] NULL,
	[FchServHasta] [date] NULL,
	[FchVtoPago] [date] NULL,
	[MonId] [char](3) NULL,
	[MonCotiz] [float] NOT NULL,
	[estado_envio] [nchar](11) NULL,
	[CAE] [nvarchar](14) NULL,
	[CAEFchVto] [nvarchar](8) NULL,
	[nro_doc_afip] [numeric](8, 0) NULL,
 CONSTRAINT [PK_comprobantes_ml] PRIMARY KEY CLUSTERED 
(
	[idsolicitud] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[comprobantes_ml]  WITH CHECK ADD  CONSTRAINT [FK_comprobantes_ml_conceptos] FOREIGN KEY([Concepto])
REFERENCES [dbo].[conceptos] ([cod_concepto])
GO

ALTER TABLE [dbo].[comprobantes_ml] CHECK CONSTRAINT [FK_comprobantes_ml_conceptos]
GO

ALTER TABLE [dbo].[comprobantes_ml]  WITH CHECK ADD  CONSTRAINT [FK_comprobantes_ml_moneda] FOREIGN KEY([MonId])
REFERENCES [dbo].[moneda] ([cod_moneda])
GO

ALTER TABLE [dbo].[comprobantes_ml] CHECK CONSTRAINT [FK_comprobantes_ml_moneda]
GO

ALTER TABLE [dbo].[comprobantes_ml]  WITH CHECK ADD  CONSTRAINT [FK_comprobantes_ml_tipo_comprobante] FOREIGN KEY([CbteTipo])
REFERENCES [dbo].[tipo_comprobante] ([cod_tipo_comprobante])
GO

ALTER TABLE [dbo].[comprobantes_ml] CHECK CONSTRAINT [FK_comprobantes_ml_tipo_comprobante]
GO

ALTER TABLE [dbo].[comprobantes_ml]  WITH CHECK ADD  CONSTRAINT [FK_comprobantes_ml_tipo_documento] FOREIGN KEY([DocTipo])
REFERENCES [dbo].[tipo_documento] ([cod_tipo_documento])
GO

ALTER TABLE [dbo].[comprobantes_ml] CHECK CONSTRAINT [FK_comprobantes_ml_tipo_documento]
GO



IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_cbtesasoc_comprobantes_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[cbtesasoc]'))
ALTER TABLE [dbo].[cbtesasoc] DROP CONSTRAINT [FK_cbtesasoc_comprobantes_ml]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_cbtesasoc_tipo_comprobante]') AND parent_object_id = OBJECT_ID(N'[dbo].[cbtesasoc]'))
ALTER TABLE [dbo].[cbtesasoc] DROP CONSTRAINT [FK_cbtesasoc_tipo_comprobante]
GO

/****** Object:  Table [dbo].[cbtesasoc]    Script Date: 05/02/2011 13:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cbtesasoc]') AND type in (N'U'))
DROP TABLE [dbo].[cbtesasoc]
GO



/****** Object:  Table [dbo].[cbtesasoc]    Script Date: 05/02/2011 13:01:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cbtesasoc](
	[idsolicitud] [int] NOT NULL,
	[Tipo] [int] NOT NULL,
	[PtoVta] [int] NOT NULL,
	[Nro] [numeric](8, 0) NOT NULL,
 CONSTRAINT [PK_cbtesasoc] PRIMARY KEY CLUSTERED 
(
	[idsolicitud] ASC,
	[Tipo] ASC,
	[PtoVta] ASC,
	[Nro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[cbtesasoc]  WITH CHECK ADD  CONSTRAINT [FK_cbtesasoc_comprobantes_ml] FOREIGN KEY([idsolicitud])
REFERENCES [dbo].[comprobantes_ml] ([idsolicitud])
GO

ALTER TABLE [dbo].[cbtesasoc] CHECK CONSTRAINT [FK_cbtesasoc_comprobantes_ml]
GO

ALTER TABLE [dbo].[cbtesasoc]  WITH CHECK ADD  CONSTRAINT [FK_cbtesasoc_tipo_comprobante] FOREIGN KEY([Tipo])
REFERENCES [dbo].[tipo_comprobante] ([cod_tipo_comprobante])
GO

ALTER TABLE [dbo].[cbtesasoc] CHECK CONSTRAINT [FK_cbtesasoc_tipo_comprobante]
GO



IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_iva_comprobantes_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle_iva]'))
ALTER TABLE [dbo].[detalle_iva] DROP CONSTRAINT [FK_detalle_iva_comprobantes_ml]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_iva_condicion_iva]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle_iva]'))
ALTER TABLE [dbo].[detalle_iva] DROP CONSTRAINT [FK_detalle_iva_condicion_iva]
GO


/****** Object:  Table [dbo].[detalle_iva]    Script Date: 05/02/2011 13:03:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detalle_iva]') AND type in (N'U'))
DROP TABLE [dbo].[detalle_iva]
GO

/****** Object:  Table [dbo].[detalle_iva]    Script Date: 05/02/2011 13:03:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[detalle_iva](
	[idsolicitud] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[BaseImp] [numeric](13, 2) NOT NULL,
	[Importe] [numeric](13, 2) NOT NULL,
 CONSTRAINT [PK_detalle_iva] PRIMARY KEY CLUSTERED 
(
	[idsolicitud] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[detalle_iva]  WITH CHECK ADD  CONSTRAINT [FK_detalle_iva_comprobantes_ml] FOREIGN KEY([idsolicitud])
REFERENCES [dbo].[comprobantes_ml] ([idsolicitud])
GO

ALTER TABLE [dbo].[detalle_iva] CHECK CONSTRAINT [FK_detalle_iva_comprobantes_ml]
GO

ALTER TABLE [dbo].[detalle_iva]  WITH CHECK ADD  CONSTRAINT [FK_detalle_iva_condicion_iva] FOREIGN KEY([Id])
REFERENCES [dbo].[condicion_iva] ([codigo])
GO

ALTER TABLE [dbo].[detalle_iva] CHECK CONSTRAINT [FK_detalle_iva_condicion_iva]
GO



IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_tributos_comprobantes_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle_tributos]'))
ALTER TABLE [dbo].[detalle_tributos] DROP CONSTRAINT [FK_detalle_tributos_comprobantes_ml]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_detalle_tributos_tributos]') AND parent_object_id = OBJECT_ID(N'[dbo].[detalle_tributos]'))
ALTER TABLE [dbo].[detalle_tributos] DROP CONSTRAINT [FK_detalle_tributos_tributos]
GO


/****** Object:  Table [dbo].[detalle_tributos]    Script Date: 05/02/2011 13:03:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detalle_tributos]') AND type in (N'U'))
DROP TABLE [dbo].[detalle_tributos]
GO


/****** Object:  Table [dbo].[detalle_tributos]    Script Date: 05/02/2011 13:03:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[detalle_tributos](
	[idsolicitud] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[Descripcion] [nvarchar](80) NULL,
	[BaseImp] [numeric](13, 2) NOT NULL,
	[Alic] [numeric](3, 2) NOT NULL,
	[Importe] [numeric](13, 2) NOT NULL,
 CONSTRAINT [PK_detalle_tributos] PRIMARY KEY CLUSTERED 
(
	[idsolicitud] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[detalle_tributos]  WITH CHECK ADD  CONSTRAINT [FK_detalle_tributos_comprobantes_ml] FOREIGN KEY([idsolicitud])
REFERENCES [dbo].[comprobantes_ml] ([idsolicitud])
GO

ALTER TABLE [dbo].[detalle_tributos] CHECK CONSTRAINT [FK_detalle_tributos_comprobantes_ml]
GO

ALTER TABLE [dbo].[detalle_tributos]  WITH CHECK ADD  CONSTRAINT [FK_detalle_tributos_tributos] FOREIGN KEY([Id])
REFERENCES [dbo].[tributos] ([codigo])
GO

ALTER TABLE [dbo].[detalle_tributos] CHECK CONSTRAINT [FK_detalle_tributos_tributos]
GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tipo_comprobante' and COLUMN_NAME='permitidoenfonseca')
ALTER TABLE  dbo.tipo_comprobante ADD  [permitidoenfonseca] [bit] NULL;

go


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tipo_comprobante' and COLUMN_NAME='permitidoenfonseca')
ALTER TABLE  dbo.tipo_comprobante ADD  [permitidoenfonseca] [bit] NULL;

go 


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='tipo_comprobante' and COLUMN_NAME='requiere_cmp_asociado')
ALTER TABLE  dbo.tipo_comprobante ADD  [requiere_cmp_asociado] [bit] NULL;

go 



IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_observaciones_comprobantes_ml]') AND parent_object_id = OBJECT_ID(N'[dbo].[observaciones]'))
ALTER TABLE [dbo].[observaciones] DROP CONSTRAINT [FK_observaciones_comprobantes_ml]
GO

/****** Object:  Table [dbo].[observaciones]    Script Date: 05/02/2011 15:27:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[observaciones]') AND type in (N'U'))
DROP TABLE [dbo].[observaciones]
GO

/****** Object:  Table [dbo].[observaciones]    Script Date: 05/02/2011 15:27:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[observaciones](
	[idObservacion] [int] IDENTITY(1,1) NOT NULL,
	[idsolicitud] [int] NOT NULL,
	[Code] [int] NOT NULL,
	[Msg] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_observaciones] PRIMARY KEY CLUSTERED 
(
	[idObservacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[observaciones]  WITH CHECK ADD  CONSTRAINT [FK_observaciones_comprobantes_ml] FOREIGN KEY([idsolicitud])
REFERENCES [dbo].[comprobantes_ml] ([idsolicitud])
GO

ALTER TABLE [dbo].[observaciones] CHECK CONSTRAINT [FK_observaciones_comprobantes_ml]
GO




