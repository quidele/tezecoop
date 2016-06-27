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
	[IdConciliacion] [int] NOT NULL,
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

SET ANSI_PADDING OFF
GO


if exists ( select * from sys.tables where name = 'TB_ConciliacionDetalle' ) 
begin 
	DROP TABLE [dbo].[TB_ConciliacionDetalle]
end

GO

/****** Object:  Table [dbo].[TB_ConciliacionDetalle]    Script Date: 27/06/2016 16:47:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_ConciliacionDetalle](
	[IdConciliacion] [int] NOT NULL,
	[nrCupon] [numeric](18, 0) NULL,
 CONSTRAINT [PK_TB_ConciliacionDetalle] PRIMARY KEY CLUSTERED 
(
	[IdConciliacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
