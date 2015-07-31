-- cambios de DDL version 1.9
use dbSG2000
go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_TB_Talonarios_TB_TiposComprobantes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TB_Talonarios] DROP CONSTRAINT FK_TB_Talonarios_TB_TiposComprobantes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TB_TiposComprobantes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TiposComprobantes]
GO

CREATE TABLE [dbo].[TB_TiposComprobantes] (
	[tpComprobante] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dsTipoComprobante] [varchar] (70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[flActivo] [bit] NULL ,
	[flVisible] [bit] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_TiposComprobantes] WITH NOCHECK ADD 
	CONSTRAINT [PK_TB_TipoComprobantes] PRIMARY KEY  CLUSTERED 
	(
		[tpComprobante]
	)  ON [PRIMARY] 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_TB_Comprobantes_TB_Talonarios]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TB_Comprobantes] DROP CONSTRAINT FK_TB_Comprobantes_TB_Talonarios
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_TB_TalonariosCAI_TB_Talonarios]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TB_TalonariosCAI] DROP CONSTRAINT FK_TB_TalonariosCAI_TB_Talonarios
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_TB_TalonariosPuesto_TB_Talonarios]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TB_TalonariosPuesto] DROP CONSTRAINT FK_TB_TalonariosPuesto_TB_Talonarios
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TB_Talonarios]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_Talonarios]
GO

CREATE TABLE [dbo].[TB_Talonarios] (
	[nrTalonario] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tpComprobante] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tpLetra] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nrComprobante] [decimal](10, 0) NOT NULL ,
	[flManual] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[flActivo] [bit] NULL ,
	[flVisible] [bit] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_Talonarios] WITH NOCHECK ADD 
	CONSTRAINT [PK_TB_Talonarios] PRIMARY KEY  CLUSTERED 
	(
		[nrTalonario],
		[tpComprobante],
		[tpLetra]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_Talonarios] ADD 
	CONSTRAINT [FK_TB_Talonarios_TB_TiposComprobantes] FOREIGN KEY 
	(
		[tpComprobante]
	) REFERENCES [dbo].[TB_TiposComprobantes] (
		[tpComprobante]
	)
GO




if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TB_TalonariosCAI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TalonariosCAI]
GO

CREATE TABLE [dbo].[TB_TalonariosCAI] (
	[nrTalonario] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tpComprobante] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tpLetra] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nrCAI] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dtDesde] [datetime] NOT NULL ,
	[dtFin] [datetime] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_TalonariosCAI] WITH NOCHECK ADD 
	CONSTRAINT [PK_TB_TalonariosCAI] PRIMARY KEY  CLUSTERED 
	(
		[nrTalonario],
		[tpComprobante],
		[tpLetra],
		[nrCAI]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_TalonariosCAI] ADD 
	CONSTRAINT [FK_TB_TalonariosCAI_TB_Talonarios] FOREIGN KEY 
	(
		[nrTalonario],
		[tpComprobante],
		[tpLetra]
	) REFERENCES [dbo].[TB_Talonarios] (
		[nrTalonario],
		[tpComprobante],
		[tpLetra]
	)
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TB_TalonariosPuesto]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_TalonariosPuesto]
GO

CREATE TABLE [dbo].[TB_TalonariosPuesto] (
	[nrPuesto] [smallint] NOT NULL ,
	[nrTalonario] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tpComprobante] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tpLetra] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_TalonariosPuesto] WITH NOCHECK ADD 
	CONSTRAINT [PK_TB_TalonariosPuesto] PRIMARY KEY  CLUSTERED 
	(
		[nrPuesto],
		[nrTalonario],
		[tpComprobante],
		[tpLetra]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_TalonariosPuesto] ADD 
	CONSTRAINT [FK_TB_TalonariosPuesto_TB_Talonarios] FOREIGN KEY 
	(
		[nrTalonario],
		[tpComprobante],
		[tpLetra]
	) REFERENCES [dbo].[TB_Talonarios] (
		[nrTalonario],
		[tpComprobante],
		[tpLetra]
	)
GO

GO

ALTER TABLE [dbo].[TB_Talonarios] ADD 
	CONSTRAINT [DF_TB_Talonarios_flVisible] DEFAULT (1) FOR [flVisible]
GO

ALTER TABLE [dbo].[TB_TiposComprobantes] ADD 
	CONSTRAINT [DF_TB_TiposComprobantes_flVisible] DEFAULT (1) FOR [flVisible]
GO


---------------------------------------------------------------
---------------------------------------------------------------

alter procedure sco_TiposComprobantes
as
begin

	select tpComprobante
	from TB_TiposComprobantes
	where  flVisible=1

end

go 


alter procedure sco_Talonarios (
@nrTalonario_param varchar(4),
@tpComprobante_param varchar(4),
@tpLetra_param	     varchar(1),
@flManual_param      varchar(1))
as
begin
	
	SELECT [nrTalonario], 
	       [tpComprobante], 
	       [tpLetra], 
	       [nrComprobante], 
	       'flManual'  = CASE flManual
		WHEN 'A' THEN 'Automático'
		WHEN 'M' THEN 'Manual'
		ELSE 'No definido'
	        END, 
	       [flActivo], 
	       [flVisible] 
	FROM TB_Talonarios
	WHERE
		nrTalonario = isnull(@nrTalonario_param,nrTalonario) and
		tpComprobante = isnull(@tpComprobante_param,tpComprobante) and
		tpLetra = isnull(@tpLetra_param,tpLetra) and
		flManual = isnull(@flManual_param,flManual) and
 		flVisible=1 

end

