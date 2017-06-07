-- Cambios de DDL version 4.9.800
use dbSG2000
go




if  exists (SELECT * FROM sys.tables where name ='TB_documentos' )
	DROP TABLE [TB_documentos]
GO


SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
--- Nueva tabla de documento
CREATE TABLE [dbo].[TB_documentos](
	[cod_doc] [char](4) NOT NULL,
	[nom_doc] [char](40) NOT NULL,
	[usuario_mod] [char](20) NOT NULL,
	[fecha_mod] [datetime] NULL,
 CONSTRAINT [u494_6178] PRIMARY KEY CLUSTERED 
(
	[cod_doc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


if  exists (SELECT * FROM sys.tables where name ='TB_numeradores' )
	DROP TABLE  [dbo].[TB_numeradores]
GO


/****** Object:  Table [dbo].[gfp_numeradores]    Script Date: 06/06/2017 16:21:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_numeradores](
	[numerador] [varchar](16) NOT NULL,
	[nombre] [varchar](40) NULL,
	[notas] [varchar](250) NULL,
	[valor_asignado] [int] NOT NULL,
	[valor_defecto] [int] NULL,
	[incremento] [smallint] NOT NULL,
	[consecutivos] [varchar](1) NOT NULL,
	[modificable] [varchar](1) NULL,
	[usuario_mod] [varchar](20) NULL,
	[fecha_mod] [datetime] NOT NULL,
	[terminal_mod] [varchar](20) NOT NULL,
	[operacion_mod] [varchar](10) NOT NULL,
	[estado_registro] [varchar](1) NOT NULL,
	[formulario] [varchar](16) NOT NULL,
	[seccion] [varchar](16) NOT NULL,
	[bloque] [varchar](16) NOT NULL,
	[linea] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numerador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


IF exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_validarNroComprobanteManual_v4_9_8'  )
	DROP PROCEDURE  [dbo].spu_validarNroComprobanteManual_v4_9_8
	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- sp_helptext 'SP_ActualizarComprobante_v3_7'


---  Voy por acacacac !!!
--- SP_ActualizarComprobanteManual_v2_4 ->>> SP_ActualizarComprobanteManual_v2_5
-- Actualiza el nro de comprobante y talonario de una carga manual
CREATE     procedure spu_validarNroComprobanteManual_v4_9_8
(@nrTalonario_param        varchar(4),
@nrComprobante_param      varchar(12),
@tpComprobante_param      varchar(4),
@tpLetra_param            varchar(2),
@dtComprobante_new_param  datetime=null) 
AS
BEGIN

	SELECT 'OK'

	
	SELECT vlParametro  FROM TB_Parametros  where dsParametro =  'DESVIO_EN_NUMERACION_CARGA_MANUAL'

	SELECT max(nrComprobante) FROM TB_Comprobantes WHERE   nrTalonario =   @nrTalonario_param
															AND tpComprobante = @tpComprobante_param
																AND tpLetra = @tpLetra_param

END


