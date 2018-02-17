
-- Cambios de DDL version 4.9.832
use dbSG2000
go


if  exists (SELECT * FROM sys.tables where name ='TB_documentos' )
	DROP TABLE [TB_documentos]
GO


SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

-- SELECT * FROM [dbo].[TB_documentos]


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


-- select * from [dbo].[TB_numeradores]

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




if  EXISTS  (SELECT * FROM sys.tables where name ='TB_transCab' )
	DROP TABLE [dbo].[TB_transCab]
GO

/****** Object:  Table [dbo].[TB_transCab]    Script Date: 31/01/2018 12:39:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_transCab](
	[cod_emp] [char](4) NOT NULL,
	[cod_tit] [int] NOT NULL,
	[letra_doc] [char](1) NULL,
	[fec_valor] [datetime] NOT NULL,
	[com_mov] [varchar](400) NULL,
	[cod_moneda_ing] [char](4) NULL,
	[tc_ing] [decimal](12, 6) NULL,
	[imp_subtot_ing] [decimal](14, 2) NULL,
	[imp_ivatot_ing] [decimal](14, 2) NULL,
	[imp_tot_ing] [decimal](14, 2) NULL,
	[nro_int] [int] NULL,
	[nro_trans] [int] NOT NULL,
	[cod_doc] [char](4) NOT NULL,
	[nro_doc] [int] NOT NULL,
	[fec_doc] [datetime] NOT NULL,
	[serie_doc] [smallint] NOT NULL,
	[formulario] [char](16) NOT NULL,
	[seccion] [char](16) NOT NULL,
	[bloque] [char](16) NOT NULL,
	[linea] [smallint] NOT NULL,
	[usuario_mod] [char](20) NOT NULL,
	[fecha_mod] [datetime] NOT NULL,
	[terminal_mod] [char](20) NOT NULL,
	[operacion_mod] [char](10) NOT NULL,
	[estado_registro] [char](1) NOT NULL,
	[cuotas] [smallint] NULL,
	[periodo] [char](20) NULL,
 CONSTRAINT [TB_transCab_1] PRIMARY KEY NONCLUSTERED 
(
	[nro_trans] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--------------------------------------------------------
------------------------ ATENCION  ---------------------
----- EN DESARROLLO LA OPERACION DEMORA 1,43 MINUTOS  ----

if EXISTS (select * from sys.indexes  where name ='TB_ComprobantesTB_Licenciatari')
	DROP INDEX TB_ComprobantesTB_Licenciatari ON dbo.TB_Cupones

--- SOLO CORRER EN SERVIDOR
if EXISTS (select * from sys.objects    where name ='FK__TB_Cupones__05F8DC4F')
	ALTER TABLE [dbo].[TB_Cupones] DROP CONSTRAINT [FK__TB_Cupones__05F8DC4F]



-- PRIMERO CORRER EN PRUEBAS - REALIZAR BACKUP DE LA BD 
ALTER TABLE TB_CUPONES ALTER COLUMN tpComprobanteCliente CHAR(4);


CREATE NONCLUSTERED INDEX TB_ComprobantesTB_Licenciatari ON dbo.TB_Cupones
	(
	nrTalonarioCliente,
	nrComprabanteCliente,
	tpComprobanteCliente,
	tpLetraCliente
	) WITH( PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO


IF  EXISTS  (SELECT * FROM sys.tables where name ='TB_ObligacionesTitulares' )
	DROP TABLE [dbo].TB_ObligacionesTitulares

/****** Object:  Table [dbo].[TB_ObligacionesTitulares]    Script Date: 15/02/2018 17:07:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_ObligacionesTitulares](
	[nro_trans] [int] NOT NULL,
	[cod_tit] [int] NOT NULL,
	[nrLicencia] [char](3) NULL,
	[nrTelefono] [varchar](50) NULL,
 CONSTRAINT [PK_TB_ObligacionesTitulares] PRIMARY KEY CLUSTERED 
(
	[nro_trans] ASC,
	[cod_tit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


IF  EXISTS  (SELECT * FROM sys.tables where name ='TB_ObligacionesCuotas' )
	DROP TABLE [dbo].TB_ObligacionesCuotas

GO 



/****** Object:  Table [dbo].[TB_ObligacionesCuotas]    Script Date: 17/02/2018 15:52:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_ObligacionesCuotas](
	[nro_trans] [int] NOT NULL,
	[cod_tit] [int] NOT NULL,
	[nro_cuota] [int] NULL,
	[fecha_vencimiento] [date] NULL,
	[importe] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TB_ObligacionesCuotas] PRIMARY KEY CLUSTERED 
(
	[nro_trans] ASC,
	[cod_tit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


