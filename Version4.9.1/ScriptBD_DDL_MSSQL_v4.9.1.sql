-- Cambios de DDL version 4.9.1
use dbSG2000
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='nrCuponPosnet')
	ALTER TABLE dbo.TB_Cupones ADD  nrCuponPosnet nchar(25) NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='nrCuponPosnet')
	ALTER TABLE dbo.TB_Comprobantes ADD  nrCuponPosnet nchar(25) NULL;




go



ALTER TABLE [dbo].[TB_ArchivoTarjetaDetalle] DROP CONSTRAINT [FK_TB_ArchivoTarjetaDetalle_TB_ArchivoTarjeta]
GO

/****** Object:  Table [dbo].[TB_ArchivoTarjetaDetalle]    Script Date: 05/09/2016 10:05:33  ******/
DROP TABLE [dbo].[TB_ArchivoTarjetaDetalle]
GO

/****** Object:  Table [dbo].[TB_ArchivoTarjeta]    Script Date: 05/09/2016 10:05:33  ******/
DROP TABLE [dbo].[TB_ArchivoTarjeta]
GO

/****** Object:  Table [dbo].[TB_ArchivoTarjeta]    Script Date: 05/09/2016 10:05:33  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_ArchivoTarjeta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[formato] [char](15) NULL,
	[nombrearchivo] [varchar](50) NULL,
	[dtproceso] [datetime] NULL,
	[dsUsuario] [varchar](20) NULL,
 CONSTRAINT [PK_TB_ArchivoTarjeta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[TB_ArchivoTarjetaDetalle]    Script Date: 05/09/2016 10:05:33  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_ArchivoTarjetaDetalle](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[idarchivo] [int] NULL,
	[fechaPresentacion] [date] NULL,
	[importe] [decimal](18, 3) NULL,
	[fechaPago] [date] NULL,
	[tarjeta] [char](4) NULL,
	[comprobante] [char](10) NULL,
	[moneda] [char](3) NULL,
	[contenido] [varchar](300) NULL,
	[dtInsercion] [datetime] NULL,
	[nrCupon] [decimal](18, 0) NULL,
 CONSTRAINT [PK_TB_ArchivoTarjetaDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TB_ArchivoTarjetaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TB_ArchivoTarjetaDetalle_TB_ArchivoTarjeta] FOREIGN KEY([idarchivo])
REFERENCES [dbo].[TB_ArchivoTarjeta] ([id])
GO

ALTER TABLE [dbo].[TB_ArchivoTarjetaDetalle] CHECK CONSTRAINT [FK_TB_ArchivoTarjetaDetalle_TB_ArchivoTarjeta]
GO







if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_conciliarAutomaticamente' )
	drop procedure  dbo.spu_conciliarAutomaticamente

go
		
--exec dbo.spu_conciliarAutomaticamente 2 

create procedure dbo.spu_conciliarAutomaticamente (@idArchivo int) 
as
begin 
	
	select 'OK' as resultado , 'en el store debemos desarrollar toda la logica de la conciliacion' descripcion_error 
end
