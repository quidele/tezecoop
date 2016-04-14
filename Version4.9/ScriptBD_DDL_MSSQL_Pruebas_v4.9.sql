-- Cambios de DDL version 4.9
use dbSG2000_Pruebas
go


ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF_TB_Productos_Historico_fecha_insercion]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF__TB_Produc__flInc__5927012F]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF__TB_Produc__flMue__5832DCF6]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF__TB_Produc__flEli__573EB8BD]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF_TB_ProductosHistorico_flMuestra]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF_TB_ProductosHistorico_tpOperacion]
GO

ALTER TABLE [dbo].[TB_Productos_Historico] DROP CONSTRAINT [DF_TB_ProductosHistorico_vlPorcentaje]
GO

/****** Object:  Table [dbo].[TB_Productos_Historico]    Script Date: 14/04/2016 16:55:11 ******/
DROP TABLE [dbo].[TB_Productos_Historico]
GO

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

/****** Object:  Trigger [delupd_tb_productos]    Script Date: 14/04/2016 16:54:26 ******/
DROP TRIGGER [dbo].[delupd_tb_productos]
GO

/****** Object:  Trigger [dbo].[delupd_tb_productos]    Script Date: 14/04/2016 16:54:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<QUIDEL, Eulises>
-- Create date: <14-04-2016>
-- Description:	<Graba Historico por si hay que recuperar información>
-- =============================================
CREATE TRIGGER [dbo].[delupd_tb_productos]
   ON  [dbo].[TB_Productos]
   AFTER DELETE,UPDATE
AS 
BEGIN

	insert into dbo.tb_productos  ([cdProducto]
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


