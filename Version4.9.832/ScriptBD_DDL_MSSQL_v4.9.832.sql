
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


-- select * from [dbo].[TB_documentos]


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

DROP INDEX TB_ComprobantesTB_Licenciatari ON dbo.TB_Cupones

ALTER TABLE [dbo].[TB_Cupones] DROP CONSTRAINT [FK__TB_Cupones__05F8DC4F]

--- SOLO CORRER EN SERVIDOR

select  host_name()

IF host_name()
ALTER TABLE TB_CUPONES ALTER COLUMN tpComprobanteCliente CHAR(4);

CREATE NONCLUSTERED INDEX TB_ComprobantesTB_Licenciatari ON dbo.TB_Cupones
	(
	nrTalonarioCliente,
	nrComprabanteCliente,
	tpComprobanteCliente,
	tpLetraCliente
	) WITH( PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]



--- LA FOREIGN KEY NO PODRA VOLVER A CREARSE	
/* 
    ALTER TABLE [dbo].[TB_Cupones]  WITH NOCHECK ADD  CONSTRAINT [FK__TB_Cupones__05F8DC4F] FOREIGN KEY([nrTalonarioCliente], [nrComprabanteCliente], [tpComprobanteCliente], [tpLetraCliente])
	REFERENCES [dbo].[TB_Comprobantes] ([nrTalonario], [nrComprobante], [tpComprobante], [tpLetra])
*/

GO

