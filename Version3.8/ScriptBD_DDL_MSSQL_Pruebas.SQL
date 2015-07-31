-- Cambios de DDL version 3.8
use dbSG2000_Pruebas
go


/****** Object:  Table [dbo].[TB_Auditorias]    Script Date: 04/05/2011 22:55:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_Auditorias]') AND type in (N'U'))
DROP TABLE [dbo].[TB_Auditorias]
GO


/****** Object:  Table [dbo].[TB_Auditorias]    Script Date: 04/05/2011 22:55:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_Auditorias](
	[IdAuditoria] [int] IDENTITY(1,1) NOT NULL,
	[Modulo] [varchar](50) NULL,
	[funcion] [varchar](50) NULL,
	[dsAuditoria] [varchar](300) NULL,
	[dsUsuario] [varchar](50) NULL,
	[nrCaja] [numeric](18, 0) NULL,
	[tsAuditoria] [datetime] NULL,
	[dtAuditoria] [date] NULL,
	[nrPuesto] [int] NULL,
 CONSTRAINT [PK_TB_Auditorias] PRIMARY KEY CLUSTERED 
(
	[IdAuditoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Index [IX_TB_Auditorias_caja]    Script Date: 04/05/2011 22:59:05 ******/
CREATE NONCLUSTERED INDEX [IX_TB_Auditorias_caja] ON [dbo].[TB_Auditorias] 
(
	[nrCaja] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_TB_Auditorias_fecha]    Script Date: 04/05/2011 22:59:05 ******/
CREATE NONCLUSTERED INDEX [IX_TB_Auditorias_fecha] ON [dbo].[TB_Auditorias] 
(
	[dtAuditoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO



