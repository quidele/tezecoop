CREATE procedure sco_Puestos_v1_8
@nrPuesto_param int=null,
@dsPuesto_param varchar(50)=null
as

	select
		nrPuesto, 
		dsPuesto, 
	        dsIP, 
		dtActualizado, 
		nrTalonario_manual, 
		nrTalonario_automatico, 
		nrComprobante_manual_ult, 
		nrComprobante_automatico_ult, 
		flRespeta_secuencia_carga_manual, 
		tpletra, 
		dtActualizacion, 
		flEliminar, 
		nrTalonario_manual_empresa, 
		nrTalonario_manual_ctacte, 
		nrComprobante_manual_empresa_ult, 
		nrComprobante_manual_ctacte_ult, 
		tpLetraEmpresa, 
		tpLetraRecibo, 
		nrTalonario_auto_empresa, 
		nrTalonario_auto_ctacte, 
		nrComprobante_auto_ctacte_ult, 
		nrComprobante_auto_empresa_ult, 
		tpletra_manual, 
		tpLetraEmpresa_manual, 
		tpLetraRecibo_manual,
		/* campos incluidos en la version 1.8 */
		nrCAI_Talonario_auto,
		dtCAI_Talonario_auto,
		nrCAI_Talonario_auto_empresa,
		dtCAI_Talonario_auto_empresa
	from TB_Puestos
	where  (nrPuesto = @nrPuesto_param OR  @nrPuesto_param is null) 
		and  (dsPuesto =@dsPuesto_param OR @dsPuesto_param is null)
	and flEliminar=0


go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK__TB_Cajas__nrPues__1AF3F935]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TB_Cajas] DROP CONSTRAINT FK__TB_Cajas__nrPues__1AF3F935
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_TB_Clientes_TB_Puestos]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TB_Clientes] DROP CONSTRAINT FK_TB_Clientes_TB_Puestos
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TB_Puestos]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_Puestos]
GO

CREATE TABLE [dbo].[TB_Puestos] (
	[nrPuesto] [smallint] NOT NULL ,
	[dsPuesto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dsIP] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dtActualizado] [datetime] NULL ,
	[nrTalonario_manual] [int] NULL ,
	[nrTalonario_automatico] [int] NULL ,
	[nrCAI_Talonario_auto] [decimal](18, 0) NULL ,
	[dtCAI_Talonario_auto] [datetime] NULL ,
	[nrComprobante_manual_ult] [int] NULL ,
	[nrComprobante_automatico_ult] [int] NULL ,
	[flRespeta_secuencia_carga_manual] [bit] NULL ,
	[tpletra] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dtActualizacion] [datetime] NULL ,
	[flEliminar] [bit] NULL ,
	[nrTalonario_manual_empresa] [int] NULL ,
	[nrTalonario_manual_ctacte] [int] NULL ,
	[nrComprobante_manual_empresa_ult] [int] NULL ,
	[nrComprobante_manual_ctacte_ult] [int] NULL ,
	[tpLetraEmpresa] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tpLetraRecibo] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nrTalonario_auto_empresa] [int] NULL ,
	[nrCAI_Talonario_auto_empresa] [decimal](18, 0) NULL ,
	[dtCAI_Talonario_auto_empresa] [datetime] NULL ,
	[nrTalonario_auto_ctacte] [int] NULL ,
	[nrComprobante_auto_ctacte_ult] [int] NULL ,
	[nrComprobante_auto_empresa_ult] [int] NULL ,
	[tpletra_manual] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tpLetraEmpresa_manual] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tpLetraRecibo_manual] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO





