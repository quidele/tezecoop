-- cambios de DDL version 2.5
use dbSG2000
go

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TB_CajasPuestosCierres]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_CajasPuestosCierres]

go 

CREATE TABLE  [TB_CajasPuestosCierres] (
	[nrCaja] [numeric](18, 0) NOT NULL ,
	[nrCierre] [int] NOT NULL ,
	[nrPuesto] [smallint] NULL ,
	[dsUsuario] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dtApertura] [datetime] NULL ,
	[dtCierre] [datetime] NULL ,
	[hrApertura] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hrCierre] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[flEstado] [bit] NULL ,
	[flCajaAdm] [bit] NULL ,
	[vlSaldoInicialPesos] [float] NULL ,
	[vlSaldoInicialDolares] [float] NULL ,
	[vlSaldoInicialEuros] [float] NULL ,
	[vlDiaDolar] [float] NULL ,
	[vlDiaEuro] [float] NULL ,
	[vlSaldoFinalPesos] [float] NULL ,
	[vlSaldoFinalDolares] [float] NULL ,
	[vlSaldoFinalEuros] [float] NULL ,
	[vlSaldoFinalRealPesos] [float] NULL ,
	[vlSaldoFinalRealEuros] [float] NULL ,
	[vlSaldoFinalRealDolares] [float] NULL ,
	[vlCierrePesos] [float] NULL ,
	[vlCierreDolares] [float] NULL ,
	[vlCierreEuros] [float] NULL ,
	[vlTotalSaldoFinalReal] [float] NULL ,
	[vlTotalSaldoFinal] [float] NULL ,
	[vlTotalSaldoInicial] [float] NULL ,
	[vlTotalSaldoCierre] [float] NULL ,
	[dsDiferenciaDeCierre] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[vlDiferenciaDeCierre] [float] NULL ,
	[dsObservacion] [varchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dtObservacion] [datetime] NULL ,
	[dsUsuario_Supervisor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dtActualizacion] [datetime] NULL ,
	[flSincronizado] [bit] NULL ,
	[dtFecha] [datetime] NULL ,
	[nrHora] [datetime] NULL,
	[dtInsercion] [datetime] NULL, 
	vlFondoFijoPesos  [float] NULL ,
	vlFondoFijoDolares  [float] NULL ,
	vlFondoFijoEuros  [float] NULL		
) ON [PRIMARY]
GO

ALTER TABLE  [TB_CajasPuestosCierres] ADD 
	CONSTRAINT [TB_CajasPuestosCierres_flEstado] DEFAULT (0) FOR [flEstado],
	CONSTRAINT [TB_CajasPuestosCierres_flCajaAdm] DEFAULT (0) FOR [flCajaAdm],
	CONSTRAINT [TB_CajasPuestosCierres_flSincronizado] DEFAULT (0) FOR [flSincronizado],
	CONSTRAINT [TB_CajasPuestosCierres_dtInsercion] DEFAULT (getdate()) FOR [dtInsercion],
	CONSTRAINT [PK_TB_CajasPuestosCierres] PRIMARY KEY  CLUSTERED 
	(
		[nrCaja],
		[nrCierre]
	)  ON [PRIMARY] 
GO

ALTER TABLE  [TB_CajasPuestosCierres] ADD 
	CONSTRAINT [FK_TB_CajasPuestosCierres_TB_Cajas] FOREIGN KEY 
	(
		[nrCaja]
	) REFERENCES  [TB_Cajas] (
		[nrCaja]
	)
GO


ALTER TABLE  [TB_Cajas] ADD 
	-- [nrCierre] [int] NULL ;
	vlFondoFijoPesos  [float] NULL ,
	vlFondoFijoDolares  [float] NULL ,
	vlFondoFijoEuros  [float] NULL;

go

ALTER TABLE  [TB_Cajas] ADD 
	dsUsuarioReapertura varchar(50);

go

ALTER TABLE  [TB_Cajas] ADD 
	tpEstadoAprobacion varchar(50), /* Pendiente /  Aprobada / Rechazada  */
	dtEstadoAprobacion datetime;

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TB_ComprobantesCajasPuestosCierres]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_ComprobantesCajasPuestosCierres]

GO

CREATE TABLE [dbo].[TB_ComprobantesCajasPuestosCierres] (
	[nrCierre] [int] NOT NULL ,
	[dtActualizacion] [datetime] NOT NULL ,
	[nrTalonario_modif] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nrComprobante_modif] [char] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tpComprobante_modif] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tpLetra_modif] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nrTalonario] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[nrComprobante] [char] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tpComprobante] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tpLetra] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dtComprobante] [datetime] NULL ,
	[cdCliente] [int] NULL ,
	[cdCondVenta] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tpComision] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tpMoneda] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tpIVA] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[vlTotalGeneral] [float] NULL ,
	[vlPagoPesos] [float] NULL ,
	[vlPagoEuros] [float] NULL ,
	[vlPagoDolares] [float] NULL ,
	[dsLeyenda] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[flManual] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dtInsercion] [datetime] NULL ,
	[flSincronizado] [bit] NOT NULL ,
	[dsUsuario] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dsUsuario_Supervisor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nrCaja] [numeric](18, 0) NOT NULL ,
	[dtCaja] [datetime] NULL ,
	[nrPuesto] [smallint] NULL ,
	[dsDomicilio] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nrLicencia] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nrBultos] [smallint] NULL ,
	[nrPasajeros] [smallint] NULL ,
	[nrDoc] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dsRazonSocial] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nmNombre] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nmApellido] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nmLicenciatario] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cdPostal] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nmLocalidad] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cdCodBar] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dsEmail] [varchar] (70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nrTel] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nrCAI] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dtVencimiento] [datetime] NULL ,
	[vlDiaDolar] [float] NULL ,
	[vlDiaEuro] [float] NULL ,
	[dsOpcional1] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dsOpcional2] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dsOpcional3] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dsOpcional4] [int] NULL ,
	[flAnulado] [bit] NOT NULL ,
	[dtAnulado] [datetime] NULL ,
	[nmEmpleado] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IdReciboCtaCte] [numeric](18, 0) NULL ,
	[flCargaErronea] [bit] NULL ,
	[dtComprobante_hora] [datetime] NULL ,
	[flEliminar] [bit] NULL ,
	[vlSubTotal] [float] NULL ,
	[vlIVA] [float] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_ComprobantesCajasPuestosCierres] WITH NOCHECK ADD 
	CONSTRAINT [PK_TB_ComprobantesCajasPuestosCierres] PRIMARY KEY  CLUSTERED 
	(
		[nrCierre],
		[dtActualizacion],
		[nrTalonario_modif],
		[nrComprobante_modif],
		[tpComprobante_modif],
		[tpLetra_modif]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_ComprobantesCajasPuestosCierres] ADD 
	CONSTRAINT [DF_TB_ComprobantesCajasPuestosCierres_nrCierre] DEFAULT (1) FOR [nrCierre],
	CONSTRAINT [DF_TB_ComprobantesCajasPuestosCierres_tpLetra1] DEFAULT ('C') FOR [tpLetra_modif],
	CONSTRAINT [DF_TB_ComprobantesCajasPuestosCierres_tpLetra] DEFAULT ('C') FOR [tpLetra],
	CONSTRAINT [DF_TB_ComprobantesCajasPuestosCierres_flManual] DEFAULT ('N') FOR [flManual],
	CONSTRAINT [DF_TB_ComprobantesCajasPuestosCierres_flSincronizado] DEFAULT (0) FOR [flSincronizado],
	CONSTRAINT [DF_TB_ComprobantesCajasPuestosCierres_flAnulado] DEFAULT (0) FOR [flAnulado],
	CONSTRAINT [DF_TB_ComprobantesCajasPuestosCierres_flCargaErronea] DEFAULT (0) FOR [flCargaErronea],
	CONSTRAINT [DF__tb_comproCajasPuestosCierres__flEli__10F65906] DEFAULT (0) FOR [flEliminar]
GO

 CREATE  INDEX [TB_CajasTB_ComprobantesCajasPuestosCierres] ON [dbo].[TB_ComprobantesCajasPuestosCierres]([nrCaja]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [TB_ClientesTB_ComprobantesCajasPuestosCierres] ON [dbo].[TB_ComprobantesCajasPuestosCierres]([cdCliente]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [TB_ComprobantesnrTalonarioCajasPuestosCierres] ON [dbo].[TB_ComprobantesCajasPuestosCierres]([nrTalonario]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [TB_CondicionesDeVentasTB_ComprCajasPuestosCierres] ON [dbo].[TB_ComprobantesCajasPuestosCierres]([cdCondVenta]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [IX_TB_ComprobantesCajasPuestosCierres] ON [dbo].[TB_ComprobantesCajasPuestosCierres]([nrComprobante]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [TB_UsuariosTB_ComprobantesCajasPuestosCierres] ON [dbo].[TB_ComprobantesCajasPuestosCierres]([dsUsuario]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [IX_TB_Comprobantes_1CajasPuestosCierres] ON [dbo].[TB_ComprobantesCajasPuestosCierres]([cdCliente]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

 CREATE  INDEX [IX_TB_Comprobantes_2CajasPuestosCierres] ON [dbo].[TB_ComprobantesCajasPuestosCierres]([nrTalonario]) ON [PRIMARY]
GO

go 

--- creamos una campo el cual alojaro el tipo de modificacion sobre el comprobante
--- /* Agregado, Eliminado, Anulado, Modificado */
ALTER TABLE  [TB_Comprobantes] ADD 
        [tpModificacionCajaPuesto]  varchar(50);


go


ALTER TABLE  [TB_Comprobantes] ADD 
        	[dsObservacionCajaPuesto]      varchar(400);



go 

--- /* Agregado, Eliminado, Anulado, Modificado */
ALTER TABLE  [TB_ComprobantesCajasPuestosCierres] ADD 
        [tpModificacionCajaPuesto]  varchar(50);


go


ALTER TABLE  [TB_ComprobantesCajasPuestosCierres] ADD 
        	[dsObservacionCajaPuesto]      varchar(400);


go 

ALTER TABLE TB_OpcionesMenues
   ALTER COLUMN  nrorden float;

go 


ALTER TABLE Diccionariodedatos
   ALTER COLUMN  nmtabla varchar(100);

go 

/**********************************************************************************************/
/**********************************************************************************************/
/**********************************************************************************************/
/**********************************************************************************************/
/**********************************************************************************************/
/**********************************************************************************************/
/**********************************************************************************************/
/**********************************************************************************************/



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_guardarsaldocajaAnterior]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_guardarsaldocajaAnterior]

go 

create  procedure sp_guardarsaldocajaAnterior(@nrCaja_param numeric)
as
begin
declare @nrCierre int


	select @nrCierre=isnull([nrCierre],1)
	from TB_CajasPuestosSaldosCierre
	where nrCaja=@nrCaja_param


	insert into TB_CajasPuestosCierres 
	        ([nrCaja], 
		[nrCierre],
		[nrPuesto], 
		[dsUsuario], 
		[dtApertura], 
		[dtCierre],
		[hrApertura],
		[hrCierre],
		[flEstado],
		[flCajaAdm],
		[vlSaldoInicialPesos],
		[vlSaldoInicialDolares],
		[vlSaldoInicialEuros],
		[vlDiaDolar], 
		[vlDiaEuro], 
		[vlSaldoFinalPesos], 
		[vlSaldoFinalDolares], 
		[vlSaldoFinalEuros], 
		[vlSaldoFinalRealPesos], 
		[vlSaldoFinalRealEuros], 
		[vlSaldoFinalRealDolares], 
		[vlCierrePesos], 
		[vlCierreDolares], 
		[vlCierreEuros], 
		[vlTotalSaldoFinalReal], 
		[vlTotalSaldoFinal], 
		[vlTotalSaldoInicial], 
		[vlTotalSaldoCierre], 
		[dsDiferenciaDeCierre], 
		[vlDiferenciaDeCierre], 
		[dsObservacion], 
		[dtObservacion], 
		[dsUsuario_Supervisor], 
		[dtActualizacion], 
		[flSincronizado],
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros)
	select 	[nrCaja], 
		@nrCierre,
		[nrPuesto], 
		[dsUsuario], 
		[dtApertura], 
		[dtCierre],
		[hrApertura],
		[hrCierre],
		[flEstado],
		[flCajaAdm],
		[vlSaldoInicialPesos],
		[vlSaldoInicialDolares],
		[vlSaldoInicialEuros],
		[vlDiaDolar], 
		[vlDiaEuro], 
		[vlSaldoFinalPesos], 
		[vlSaldoFinalDolares], 
		[vlSaldoFinalEuros], 
		[vlSaldoFinalRealPesos], 
		[vlSaldoFinalRealEuros], 
		[vlSaldoFinalRealDolares], 
		[vlCierrePesos], 
		[vlCierreDolares], 
		[vlCierreEuros], 
		[vlTotalSaldoFinalReal], 
		[vlTotalSaldoFinal], 
		[vlTotalSaldoInicial], 
		[vlTotalSaldoCierre], 
		[dsDiferenciaDeCierre], 
		[vlDiferenciaDeCierre], 
		[dsObservacion], 
		[dtObservacion], 
		[dsUsuario_Supervisor], 
		[dtActualizacion], 
		[flSincronizado],
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros
	from dbo.TB_Cajas
	where nrCaja=@nrCaja_param




end

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sco_Comprobantes_cajapuesto_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sco_Comprobantes_cajapuesto_v2_5]

go

--- Despliega los comprobantes/viajes de una caja de los puestos
create      procedure sco_Comprobantes_cajapuesto_v2_5
@nrCaja_param  numeric
as
begin 

	SELECT  b.nrTalonario, 
		b.nrComprobante, 
		b.tpComprobante,
		b.tpLetra,
	        b.dtComprobante,
		b.cdCondVenta, 
		b.tpComision, 
		b.vlPagoPesos, 
		b.vlPagoEuros,
		b.vlPagoDolares, 
		b.nrLicencia, 
		b.dsOpcional1, 
		b.flAnulado, 
		b.flEliminar,
		'flManual'=CASE b.flManual
	        WHEN 'M' THEN 'Manual'
	        WHEN 'N' THEN 'Automática'
	        WHEN 'S' THEN 'Manual'
	        WHEN 'N' THEN 'Automática'
		END,
		b.dsOpcional2,
		'NO' flmodificadoreaperturacajapuesto,
		 tpModificacionCajaPuesto, --- /* Agregado, Eliminado, Anulado, Modificado */
		 dsObservacionCajaPuesto 	
	into    #tmp_comprobantes
	FROM
		TB_Cajas a, tb_comprobantes b
	WHERE
		a.nrCaja = b.nrCaja
		and a.nrCaja =  @nrCaja_param 

	    
	update a 
	set    a.flmodificadoreaperturacajapuesto='SI' 
	from   #tmp_comprobantes a, TB_ComprobantesCajasPuestosCierres b
	where  a.nrTalonario=b.nrTalonario_modif and 
	       a.nrComprobante=b.nrComprobante_modif and
	       a.tpComprobante=b.tpComprobante_modif and
	       a.tpLetra=b.tpLetra_modif

	update a 
	set flmodificadoreaperturacajapuesto='SI'
	from #tmp_comprobantes a
	WHERE tpModificacionCajaPuesto is not null and flmodificadoreaperturacajapuesto='NO'

	select * from #tmp_comprobantes
	ORDER BY nrComprobante ASC

end


go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sco_cajapuesto_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sco_cajapuesto_v2_5]

go


--- obtiene los valore de una caja-puestos
create  procedure sco_cajapuesto_v2_5
@nrCaja_param  numeric
as 
begin
declare @nrCierre integer

	select @nrCierre=count(*)+1  from TB_CajasPuestosCierres
	where  nrCaja=@nrCaja_param

	select  a.[nrCaja], 
		a.[nrPuesto], 
		a.[dsUsuario], 
		a.[dtApertura], 
		a.[dtCierre],
		a.[hrApertura],
		a.[hrCierre],
		a.[flEstado],
		dsEstado=CASE a.[flEstado]
		when 1 then     'Cerrada'
		when 0 then     'Abierta'
		End,		
		a.[flCajaAdm], 
		isnull(a.[vlSaldoInicialPesos],0) as 'vlSaldoInicialPesos',
		isnull(a.[vlSaldoInicialDolares],0) as 'vlSaldoInicialDolares',
		isnull(a.[vlSaldoInicialEuros],0)as 'vlSaldoInicialEuros',
		isnull(a.[vlDiaDolar],0)as 'vlDiaDolar',
		isnull(a.[vlDiaEuro],0)as 'vlDiaEuro',
		isnull(a.[vlSaldoFinalPesos],0)as 'vlSaldoFinalPesos',
		isnull(a.[vlSaldoFinalDolares],0)as 'vlSaldoFinalDolares',
		isnull(a.[vlSaldoFinalEuros],0)as 'vlSaldoFinalEuros',
		isnull(a.[vlSaldoFinalRealPesos],0)as 'vlSaldoFinalRealPesos',
		isnull(a.[vlSaldoFinalRealEuros],0)as 'vlSaldoFinalRealEuros',
		isnull(a.[vlSaldoFinalRealDolares],0)as 'vlSaldoFinalRealDolares', 
		isnull(a.[vlCierrePesos],0)as 'vlCierrePesos',
		isnull(a.[vlCierreDolares],0)as 'vlCierreDolares', 
		isnull(a.[vlCierreEuros],0)as 'vlCierreEuros', 
		isnull(a.[vlTotalSaldoFinalReal],0)as 'vlTotalSaldoFinalReal', 
		isnull(a.[vlTotalSaldoFinal],0)as 'vlTotalSaldoFinal', 
		isnull(a.[vlTotalSaldoInicial],0)as 'vlTotalSaldoInicial', 
		isnull(a.[vlTotalSaldoCierre],0)as 'vlTotalSaldoCierre', 
		a.[dsDiferenciaDeCierre]as 'dsDiferenciaDeCierre', 
		isnull(a.[vlDiferenciaDeCierre],0)as 'vlDiferenciaDeCierre', 
		a.[dsObservacion], 
		a.[dtObservacion], 
		a.[dsUsuario_Supervisor], 
		a.[dtActualizacion], 
		a.[flSincronizado], 
		--a.[nrCierre], 
		isnull(b.nmNombre,'')+' '+isnull(b.nmApellido,'') nmEmpleado,
		c.dsPuesto,
		-- Para la administración = Saldo Operadora - Fondo de la caja
		dbo.f_positivoValorNegativoCero_2_5([vlSaldoFinalRealPesos] - [vlSaldoInicialPesos]) as 'vlSaldoAdmPesos',
		dbo.f_positivoValorNegativoCero_2_5([vlSaldoInicialDolares] - [vlSaldoFinalRealDolares]) as 'vlSaldoAdmDolares',
		dbo.f_positivoValorNegativoCero_2_5([vlSaldoFinalRealEuros] - [vlSaldoInicialEuros]) as 'vlSaldoAdmEuros',
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros,
		@nrCierre as nrCierre	
	FROM TB_Cajas a, tb_usuarios b, tb_puestos c
	WHERE   a.nrcaja = @nrCaja_param 
		and a.dsUsuario = b.dsUsuario
		and a.nrPuesto  = c.nrPuesto
	
end

go


go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sco_obtenerCierresCajaPuesto_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sco_obtenerCierresCajaPuesto_v2_5]

go


-- obtener los distintos cierres de la caja-puesto
create    procedure  sco_obtenerCierresCajaPuesto_v2_5
@nrCaja_param  numeric
as
begin
declare @nrCierre  numeric

	--obtener los cierre anterior
	SELECT  a.[nrCaja], 
		'Cierre '+ convert(varchar, nrCierre) as dsCierre, 
		a.[nrPuesto], 
		a.[dsUsuario], 
		a.[dtApertura], 
		a.[dtCierre], 
		a.[hrApertura], 
		a.[hrCierre], 
		a.[flEstado], 
		a.[flCajaAdm], 
		a.[vlSaldoInicialPesos], 
		a.[vlSaldoInicialDolares], 
		a.[vlSaldoInicialEuros], 
		a.[vlDiaDolar], 
		a.[vlDiaEuro], 
		a.[vlSaldoFinalPesos], 
		a.[vlSaldoFinalDolares], 
		a.[vlSaldoFinalEuros], 
		a.[vlSaldoFinalRealPesos], 
		a.[vlSaldoFinalRealEuros], 
		a.[vlSaldoFinalRealDolares], 
		a.[vlCierrePesos], 
		a.[vlCierreDolares], 
		a.[vlCierreEuros], 
		a.[vlTotalSaldoFinalReal], 
		a.[vlTotalSaldoFinal], 
		a.[vlTotalSaldoInicial], 
		a.[vlTotalSaldoCierre], 
		a.[dsDiferenciaDeCierre], 
		a.[vlDiferenciaDeCierre], 
		a.[dsObservacion], 
		a.[dtObservacion], 
		a.[dsUsuario_Supervisor], 
		a.[dtActualizacion], 
		a.[flSincronizado], 
		a.[dtFecha], 
		a.[nrHora], 
		a.[dtInsercion],
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros
		into #tmp_CajasPuestosCierres
	FROM TB_CajasPuestosCierres a
	WHERE   a.nrcaja=@nrCaja_param 

	
	select @nrCierre=count(*)+1  from #tmp_CajasPuestosCierres

	INSERT  INTO  #tmp_CajasPuestosCierres (
		[nrCaja], 
		[dsCierre], 
		[nrPuesto], 
		[dsUsuario], 
		[dtApertura], 
		[dtCierre], 
		[hrApertura], 
		[hrCierre], 
		[flEstado], 
		[flCajaAdm], 
		[vlSaldoInicialPesos], 
		[vlSaldoInicialDolares], 
		[vlSaldoInicialEuros], 
		[vlDiaDolar], 
		[vlDiaEuro], 
		[vlSaldoFinalPesos], 
		[vlSaldoFinalDolares], 
		[vlSaldoFinalEuros], 
		[vlSaldoFinalRealPesos], 
		[vlSaldoFinalRealEuros], 
		[vlSaldoFinalRealDolares], 
		[vlCierrePesos], 
		[vlCierreDolares], 
		[vlCierreEuros], 
		[vlTotalSaldoFinalReal], 
		[vlTotalSaldoFinal], 
		[vlTotalSaldoInicial], 
		[vlTotalSaldoCierre], 
		[dsDiferenciaDeCierre], 
		[vlDiferenciaDeCierre], 
		[dsObservacion], 
		[dtObservacion], 
		[dsUsuario_Supervisor], 
		[dtActualizacion], 
		[flSincronizado],
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros)
	 SELECT [nrCaja], 
     	        'dsCierre'=CASE flEstado
	        WHEN 1 THEN 'Cierre '+ convert(varchar,@nrCierre)
	        WHEN 0 THEN 'Saldo Abierto'
	        END,
		[nrPuesto], 
		[dsUsuario], 
		[dtApertura], 
		[dtCierre], 
		[hrApertura], 
		[hrCierre], 
		[flEstado], 
		[flCajaAdm],
		[vlSaldoInicialPesos], 
		[vlSaldoInicialDolares], 
		[vlSaldoInicialEuros], 
		[vlDiaDolar], 
		[vlDiaEuro], 
		[vlSaldoFinalPesos], 
		[vlSaldoFinalDolares], 
		[vlSaldoFinalEuros], 
		[vlSaldoFinalRealPesos], 
		[vlSaldoFinalRealEuros], 
		[vlSaldoFinalRealDolares], 
		[vlCierrePesos], 
		[vlCierreDolares], 
		[vlCierreEuros], 
		[vlTotalSaldoFinalReal], 
		[vlTotalSaldoFinal], 
		[vlTotalSaldoInicial], 
		[vlTotalSaldoCierre], 
		[dsDiferenciaDeCierre], 
		[vlDiferenciaDeCierre], 
		[dsObservacion], 
		[dtObservacion], 
		[dsUsuario_Supervisor], 
		[dtActualizacion], 
		[flSincronizado],
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros
	FROM TB_Cajas 
	WHERE   nrcaja=@nrCaja_param 

	select 	a.[dsCierre], 
		a.[vlSaldoInicialPesos], 
		a.[vlSaldoInicialDolares], 
		a.[vlSaldoInicialEuros], 
		a.[vlDiaDolar], 
		a.[vlDiaEuro], 
		a.[vlSaldoFinalPesos], 
		a.[vlSaldoFinalDolares], 
		a.[vlSaldoFinalEuros], 
		/* saldo final de la operadora */ 
		isnull(a.[vlSaldoFinalRealPesos],0) as 'vlSaldoFinalRealPesos', 
		isnull(a.[vlSaldoFinalRealEuros],0) as 'vlSaldoFinalRealEuros', 
		isnull(a.[vlSaldoFinalRealDolares],0) as 'vlSaldoFinalRealDolares', 
		a.[vlCierrePesos], 
		a.[vlCierreDolares], 
		a.[vlCierreEuros], 
		a.[vlTotalSaldoFinalReal], 
		a.[vlTotalSaldoFinal], 
		a.[vlTotalSaldoInicial], 
		a.[vlTotalSaldoCierre], 
		a.[vlDiferenciaDeCierre], 
		isnull(a.[dsDiferenciaDeCierre],'')+' '+ isnull(a.[dsObservacion],'') as 'dsDiferenciaDeCierre',
		-- Para la administración = Saldo Operadora - Fondo de la caja
		dbo.f_positivoValorNegativoCero_2_5(a.[vlSaldoFinalRealPesos] - a.[vlSaldoInicialPesos]) as 'vlSaldoAdmPesos',
		dbo.f_positivoValorNegativoCero_2_5( a.[vlSaldoFinalRealDolares] - a.[vlSaldoInicialDolares]) as 'vlSaldoAdmDolares',
		dbo.f_positivoValorNegativoCero_2_5(a.[vlSaldoFinalRealEuros] - a.[vlSaldoInicialEuros]) as 'vlSaldoAdmEuros',
		-- paso el saldo de la operadora a pesos
		dbo.f_positivoValorNegativoCero_2_5(dbo.f_pesificarValores_2_5(a.[vlSaldoFinalRealPesos], a.[vlSaldoFinalRealDolares],
                                           a.[vlSaldoFinalRealEuros], a.[vlDiaDolar], a.[vlDiaEuro]) - 
		-- paso el fondo fijo a pesos
		dbo.f_pesificarValores_2_5(a.[vlSaldoInicialPesos], a.[vlSaldoInicialDolares],
                                           a.[vlSaldoInicialEuros], a.[vlDiaDolar], a.[vlDiaEuro])) as 'vlSaldoAdmPesificado',
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros
	 from #tmp_CajasPuestosCierres a
	 order by dtactualizacion asc


end 

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[f_positivoValorNegativoCero_2_5]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[f_positivoValorNegativoCero_2_5]

go


create function  f_positivoValorNegativoCero_2_5(@valor float)  
RETURNS float AS  
BEGIN 


	If (@valor<0)
		set @valor=0;

	return isnull(@valor,0) 
END

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[f_pesificarValores_2_5]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[f_pesificarValores_2_5]

go


-- Function que pesifica valores monedas utilizados en la cooperativa
create FUNCTION  dbo.f_pesificarValores_2_5(
@vlPesos    float=0, @vlDolares  float=0, @vlEuros    float=0, 
@vlDiaDolar float=0, @vlDiaEuro  float=0)  
RETURNS float AS  
BEGIN 
	
	return isnull(@vlPesos + (@vlDolares * @vlDiaDolar) + (@vlEuros * @vlDiaEuro),0)

END

--Prueba Unitaria:  select  dbo.f_pesificarValores_2_5(100,30,10,3.1,4.5)

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_puedeOperarUsuarioCajaPuesto_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_puedeOperarUsuarioCajaPuesto_v2_5]

go


create  procedure SP_puedeOperarUsuarioCajaPuesto_v2_5(@pnrCaja_param numeric, @pdsUsuario_param as varchar(50))
as
begin

--declare @pnrCaja_param as numeric
--declare @pdsUsuario_param as varchar(20)
--set @pnrCaja_param=2000000374
--set @pdsUsuario_param='ROMA' 


declare @dsUsuario as varchar(20)
declare @flEstado as varchar(20)
declare @tpEstadoAprobacion varchar(50)
declare @dsUsuario_Origen varchar(50)

	--obtener los cierre anterior
	SELECT  a.* into #tmp_Cajas
	FROM   TB_Cajas a	
	WHERE  a.nrcaja=@pnrCaja_param



	select @flEstado=flEstado, @dsUsuario_Origen=dsUsuario, @dsUsuario=dsUsuarioReapertura, @tpEstadoAprobacion=tpEstadoAprobacion  from #tmp_Cajas	
	
	if @tpEstadoAprobacion='Pendiente'
	begin
		select  'NO' as Resultado, 'La caja esta en estado pendiente de aprobación, usuario ''' + @dsUsuario_Origen +''', no puede realizar cambios hasta que el usuario apruebe o rechace la misma.' as 'descripcion', 'Cerrada'  as 'dsEstado'
		return;
	end 

	-- verificamos le estado de la caja
	if (@flEstado)=1 
	begin

		-- sabemos que la caja esta abierta, verificamos el usuario en cuestion
		if @dsUsuario_Origen=@pdsUsuario_param
		begin
			-- La caja se encuentra abierta por otro usuario
			select  'NO' as Resultado, 'Un usuario de la caja puesto no puede modificar la caja.' as 'descripcion','CERRADA' as 'dsEstado'
			return;
		end
		-- La caja se encuentra cerrada
		select  'SI' as Resultado, 'La caja esta cerrada, último usuario ' + @dsUsuario as 'descripcion', 'CERRADA' as 'dsEstado'
		return;
	end  

	-- sabemos que la caja esta abierta, verificamos el usuario en cuestion
	if @pdsUsuario_param<>@dsUsuario
	begin
		-- La caja se encuentra abierta por otro usuario
		select  'NO' as Resultado, 'La caja esta en uso por el usuario ''' + @dsUsuario +''', no puede realizar cambios hasta que el usuario cierre la misma.' as 'descripcion', 'ABIERTA'  as 'dsEstado'
		return;
	end



	select  'SI' as Resultado, 'La caja esta abierta por el usuario ' + @dsUsuario as 'descripcion', 'ABIERTA'  as 'dsEstado'
	
end

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_realizarReaperturadelaCajaPuesto_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_realizarReaperturadelaCajaPuesto_v2_5]

go


create procedure SP_realizarReaperturadelaCajaPuesto_v2_5
		       (@pnrCaja_param numeric,
			@pdsUsuario_param as varchar(50),
		        @pdsUsuario_Supervisor_param as varchar(50))
as
begin
declare @error as varchar
declare @nrCierre as integer

	begin tran t1

	create table #tmp_respuesta_sp(Resultado char(2),descripcion varchar(100), dsEstado varchar(20)); 

	-- verificamos si el usuario puede realizar la reapertura de la caja-puesto
	INSERT INTO #tmp_respuesta_sp Exec SP_puedeOperarUsuarioCajaPuesto_v2_5 @pnrCaja_param = @pnrCaja_param ,@pdsUsuario_param = @pdsUsuario_param

	

	if (select Resultado from #tmp_respuesta_sp)='NO'
	begin
		rollback tran t1
		select @error=descripcion from #tmp_respuesta_sp;
		RAISERROR (@error, -- Message text.
                16, -- Severity.
	        1); -- State.  Controlar que rompa con la transacción
		return; 
	end 
	
	if (select dsEstado from #tmp_respuesta_sp)='CERRADA' 
	begin
		/* Averiguar cual fue el ultimo numero de cierre ir a TB_CajasPuestosCierres */
		select @nrCierre=count(*)+1 from TB_CajasPuestosCierres
		WHERE   nrcaja=@pnrCaja_param 

		/* Grabar el nuevo cierre */
		INSERT  INTO  TB_CajasPuestosCierres (
			[nrCaja], 
			[nrCierre], 
			[nrPuesto], 
			[dsUsuario], 
			[dtApertura], 
			[dtCierre], 
			[hrApertura], 
			[hrCierre], 
			[flEstado], 
			[flCajaAdm], 
			[vlSaldoInicialPesos], 
			[vlSaldoInicialDolares], 
			[vlSaldoInicialEuros], 
			[vlDiaDolar], 
			[vlDiaEuro], 
			[vlSaldoFinalPesos], 
			[vlSaldoFinalDolares], 
			[vlSaldoFinalEuros], 
			[vlSaldoFinalRealPesos], 
			[vlSaldoFinalRealEuros], 
			[vlSaldoFinalRealDolares], 
			[vlCierrePesos], 
			[vlCierreDolares], 
			[vlCierreEuros], 
			[vlTotalSaldoFinalReal], 
			[vlTotalSaldoFinal], 
			[vlTotalSaldoInicial], 
			[vlTotalSaldoCierre], 
			[dsDiferenciaDeCierre], 
			[vlDiferenciaDeCierre], 
			[dsObservacion], 
			[dtObservacion], 
			[dsUsuario_Supervisor], 
			[dtActualizacion], 
			[flSincronizado])
		 SELECT [nrCaja], 
	     	        @nrCierre,
			[nrPuesto], 
			[dsUsuario], 
			[dtApertura], 
			[dtCierre], 
			[hrApertura], 
			[hrCierre], 
			[flEstado], 
			[flCajaAdm],
			[vlSaldoInicialPesos], 
			[vlSaldoInicialDolares], 
			[vlSaldoInicialEuros], 
			[vlDiaDolar], 
			[vlDiaEuro], 
			[vlSaldoFinalPesos], 
			[vlSaldoFinalDolares], 
			[vlSaldoFinalEuros], 
			[vlSaldoFinalRealPesos], 
			[vlSaldoFinalRealEuros], 
			[vlSaldoFinalRealDolares], 
			[vlCierrePesos], 
			[vlCierreDolares], 
			[vlCierreEuros], 
			[vlTotalSaldoFinalReal], 
			[vlTotalSaldoFinal], 
			[vlTotalSaldoInicial], 
			[vlTotalSaldoCierre], 
			[dsDiferenciaDeCierre], 
			[vlDiferenciaDeCierre], 
			[dsObservacion], 
			[dtObservacion], 
			[dsUsuario_Supervisor], 
			[dtActualizacion], 
			[flSincronizado]
		FROM TB_Cajas 
		WHERE   nrcaja=@pnrCaja_param 
		if @@error<>0 
		begin 
			rollback tran t1
			set @error='no se pudo insertar el cierre de la caja'
			RAISERROR (@error,16,1);
			return;
		end 

		/* Marcar la caja como abierta en la tabla tb_caja 
		actualizamos el usuario tb_cajas.dsUsuario con quien la esta modificando actualmente 
		ver si no conviene agregar un usuario de creación y un usuario de actualización */

	
		update tb_cajas
		set [flEstado]=0, -- abrimos la caja
		     dsUsuarioReapertura = @pdsUsuario_param,
		    [dsUsuario_Supervisor]=@pdsUsuario_Supervisor_param, -- seteamos el usuario autorizador
		    [dtActualizacion]=getdate(), -- actualizamos al fecha
	 	    tpEstadoAprobacion='Modificando', /* Pendiente /  Aprobada / Rechazada  */
		    dtEstadoAprobacion=getdate()
		where nrCaja = @pnrCaja_param

		if @@error<>0 
		begin 
			rollback tran t1
			set @error='no se pudo actualizar el nuevo estado de la caja'
			RAISERROR (@error,16,1);
			return;
		end 

	end /* cierre si la caja esta CERRADA  */
	else 
	begin /* si la caja esta abierta */

		update tb_cajas
		set [dsUsuario_Supervisor]=@pdsUsuario_Supervisor_param, -- seteamos el usuario autorizador
		    [dtActualizacion]=getdate() -- actualizamos al fecha
		where nrCaja = @pnrCaja_param	
	
		if @@error<>0 
		begin 
			rollback tran t1
			set @error='no se pudo actualizar el nuevo estado de la caja'
			RAISERROR (@error,16,1);
			return;
		end 
	end
	commit tran t1
	
end


go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_realizarCierreCajaPuesto_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_realizarCierreCajaPuesto_v2_5]

go 

/***** Voy Por Acá  20081107 ******/
create   procedure SP_realizarCierreCajaPuesto_v2_5
		       (@pnrCaja_param numeric,
			@pdsUsuario_param as varchar(50),
		        @pdsUsuario_Supervisor_param as varchar(50))
as
begin

declare @error as varchar
declare @nrCierre as integer
declare @flestado as integer
declare @dsUsuario as varchar(50)

--declare @pnrCaja_param numeric
--declare @pdsUsuario_param varchar(50)
--declare @pdsUsuario_Supervisor_param varchar(50)

--set     @pnrCaja_param = 2000002220 
--set 	@pdsUsuario_param = 'ROMA' 
--set 	@pdsUsuario_Supervisor_param = 'USRPARAM' 

 	begin tran t1

	select @flestado=flestado, 
	       @dsUsuario=dsUsuarioReapertura
	from tb_cajas where nrCaja = @pnrCaja_param

	if @flestado=1
	begin
		rollback tran t1
		set @error='la caja ya se encuentra cerrada'
		RAISERROR (@error,16,1);
		return;
	end 

	if @dsUsuario<>@pdsUsuario_param 
	begin
		rollback tran t1
		set @error='usuario de cierre incorrecto.'
		RAISERROR (@error,16,1);
		return;
	end 

	/* Marcar la caja como cerrada en la tabla tb_caja 
	actualizamos el usuario tb_cajas.dsUsuario con quien la esta realizando el cierre*/

	update tb_cajas
	set [flEstado]=1, -- cerramos la caja
	    [dsUsuario_Supervisor]=@pdsUsuario_Supervisor_param, -- seteamos el usuario autorizador
	    tpEstadoAprobacion = 'Pendiente',
	    dtEstadoAprobacion = getdate(),
	    [dtActualizacion]=getdate() -- actualizamos al fecha
	where nrCaja = @pnrCaja_param

	if @@error<>0 
	begin 
		rollback tran t1
		set @error='no se pudo actualizar el nuevo estado de la caja'
		RAISERROR (@error,16,1);
		return;
	end 

	commit tran t1
	
end


go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_SumaCajaPuestosCondVenta_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_SumaCajaPuestosCondVenta_v2_5]

go 

create  procedure SP_SumaCajaPuestosCondVenta_v2_5(@pnrCaja_param as numeric)
as
begin
declare @vlPesos 		 as float 
declare @vlDolares 		 as float 
declare @vlEuros                 as float 
declare @vlSaldoInicialPesos     as float
declare @vlSaldoInicialDolares   as float
declare @vlSaldoInicialEuros     as float
declare @vlDiaDolar              as float
declare @vlDiaEuro               as float


/*
declare   @pnrCaja_param numeric
set  @pnrCaja_param = 2000002212
drop table #tmp_suma_valores
*/


	SELECT  vlPesos=CASE cdCondVenta
			WHEN	'Cobro en Destino'   THEN 0
			WHEN	'Retorno'	     THEN 0	
			WHEN	'Cuenta Corriente'   THEN 0
			WHEN	'Tarjeta de Crédito' THEN 0 
			WHEN	'Tarjeta de Débito'  THEN 0
			WHEN	'Contado'            THEN vlPagoPesos
		END,
 		vlDolares=CASE cdCondVenta
			WHEN	'Cobro en Destino'   THEN 0
			WHEN	'Retorno'	     THEN 0	
			WHEN	'Cuenta Corriente'   THEN 0
			WHEN	'Tarjeta de Crédito' THEN 0 
			WHEN	'Tarjeta de Débito'  THEN 0
			WHEN	'Contado'            THEN vlPagoDolares
		END,
		vlEuros=CASE cdCondVenta
			WHEN	'Cobro en Destino'   THEN 0
			WHEN	'Retorno'	     THEN 0	
			WHEN	'Cuenta Corriente'   THEN 0
			WHEN	'Tarjeta de Crédito' THEN 0 
			WHEN	'Tarjeta de Débito'  THEN 0
			WHEN	'Contado'            THEN vlPagoEuros
		END
	INTO #tmp_suma_valores
	FROM TB_Comprobantes
	WHERE flAnulado = 0 
	      and flEliminar=0 
	      and nrcaja=@pnrCaja_param

	select @vlPesos=sum(vlPesos),  
	       @vlDolares=sum(vlDolares), 
	       @vlEuros=sum(vlEuros)
       	from #tmp_suma_valores
	

	select  @vlSaldoInicialPesos=vlSaldoInicialPesos,
		@vlSaldoInicialDolares=vlSaldoInicialDolares,
		@vlSaldoInicialEuros=vlSaldoInicialEuros,
	        @vlDiaDolar=vlDiaDolar,
	        @vlDiaEuro=vlDiaEuro  		
	from tb_cajas 
	where  nrcaja=@pnrCaja_param


	select isnull(@vlPesos,0) + isnull(@vlSaldoInicialPesos,0)     as vlSaldoFinalPesos,
	       isnull(@vlDolares,0)  + isnull(@vlSaldoInicialDolares,0) as vlSaldoFinalDolares,
	       isnull(@vlEuros,0) + isnull(@vlSaldoInicialEuros,0)     as vlSaldoFinalEuros,
	       @vlDiaDolar as vlDiaDolar,
	       @vlDiaEuro  as vlDiaEuro,   
	       @pnrCaja_param as nrCaja

end


go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sco_FondoFijoCajaAnterior_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sco_FondoFijoCajaAnterior_v2_5]

go 

create   procedure sco_FondoFijoCajaAnterior_v2_5
@nrPuesto  as int
as
begin

	select a.vlSaldoInicialPesos, 
	       a.vlSaldoInicialDolares, 
	       a.vlSaldoInicialEuros,
	       a.vlFondoFijoPesos,
	       a.vlFondoFijoDolares,
	       a.vlFondoFijoEuros
	from TB_Cajas a 
	where a.nrcaja =(select max(b.nrCaja)
			   from TB_Cajas b
			   where b.nrPuesto=@nrPuesto); 

	if @@rowcount<1 
	begin
		select 0 as vlSaldoInicialPesos, 
		       0 as vlSaldoInicialDolares, 
		       0 as vlSaldoInicialEuros


	end
	
end

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_guardarComprobanteCajaPuestoAnterior_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_guardarComprobanteCajaPuestoAnterior_v2_5]


go 

create  procedure sp_guardarComprobanteCajaPuestoAnterior_v2_5(
@nrTalonario_param   	  	as varchar(4),
@nrComprobante_param 	  	as varchar(8),
@tpComprobante_param 	  	as varchar(4),
@tpLetra_param       	  	as varchar(2),
@nrCierre_param      	  	as int,
@nrTalonario_new_param    	as varchar(4),
@nrComprobante_new_param  	as varchar(12),
@tpComprobante_new_param  	as varchar(4),
@tpLetra_new_param        	as varchar(2))
as
begin 
declare @dtActualizacion datetime



	/* grabamnos siempre los cambios realizados */ 
	INSERT INTO [TB_ComprobantesCajasPuestosCierres]
		 (nrCierre,
		 nrTalonario_modif,
		 nrComprobante_modif,
	         tpComprobante_modif,
		 tpLetra_modif, 
	 	 [nrTalonario],
		 [nrComprobante],
		 [tpComprobante],
		 [tpLetra],
		 [dtComprobante],
		 [cdCliente],
		 [cdCondVenta],
		 [tpComision],
		 [tpMoneda],
		 [tpIVA],
		 [vlTotalGeneral],
		 [vlPagoPesos],
		 [vlPagoEuros],
		 [vlPagoDolares],
		 [dsLeyenda],
		 [flManual],
		 [dtInsercion],
		 [flSincronizado],
		 [dsUsuario],
		 [dsUsuario_Supervisor],
		 [nrCaja],
		 [dtCaja],
		 [nrPuesto],
		 [dsDomicilio],
		 [nrLicencia],
		 [nrBultos],
		 [nrPasajeros],
		 [nrDoc],
		 [dsRazonSocial],
		 [nmNombre],
		 [nmApellido],
		 [nmLicenciatario],
		 [cdPostal],
		 [nmLocalidad],
		 [cdCodBar],
		 [dsEmail],
		 [nrTel],
		 [nrCAI],
		 [dtVencimiento],
		 [vlDiaDolar],
		 [vlDiaEuro],
		 [dsOpcional1],
		 [dsOpcional2],
		 [dsOpcional3],
		 [dsOpcional4],
		 [flAnulado],
		 [dtAnulado],
		 [nmEmpleado],
		 [IdReciboCtaCte],
		 [flCargaErronea],
		 [dtComprobante_hora],
		 [dtActualizacion],
		 [flEliminar],
		 [vlSubTotal],
		 [vlIVA],
		 tpModificacionCajaPuesto,
		 dsObservacionCajaPuesto)
	select   @nrCierre_param,
                 @nrTalonario_param, 
		 @nrComprobante_param, 
	         @tpComprobante_param,
		 @tpLetra_param, 
		 [nrTalonario],
		 [nrComprobante],
		 [tpComprobante],
		 [tpLetra],
		 [dtComprobante],
		 [cdCliente],
		 [cdCondVenta],
		 [tpComision],
		 [tpMoneda],
		 [tpIVA],
		 [vlTotalGeneral],
		 [vlPagoPesos],
		 [vlPagoEuros],
		 [vlPagoDolares],
		 [dsLeyenda],
		 [flManual],
		 getdate() dtInsercion,
		 [flSincronizado],
		 [dsUsuario],
		 [dsUsuario_Supervisor],
		 [nrCaja],
		 [dtCaja],
		 [nrPuesto],
		 [dsDomicilio],
		 [nrLicencia],
		 [nrBultos],
		 [nrPasajeros],
		 [nrDoc],
		 [dsRazonSocial],
		 [nmNombre],
		 [nmApellido],
		 [nmLicenciatario],
		 [cdPostal],
		 [nmLocalidad],
		 [cdCodBar],
		 [dsEmail],
		 [nrTel],
		 [nrCAI],
		 [dtVencimiento],
		 [vlDiaDolar],
		 [vlDiaEuro],
		 [dsOpcional1],
		 [dsOpcional2],
		 [dsOpcional3],
		 [dsOpcional4],
		 [flAnulado],
		 [dtAnulado],
		 [nmEmpleado],
		 [IdReciboCtaCte],
		 [flCargaErronea],
		 [dtComprobante_hora],
		 getdate() as dtActualizacion,
		 [flEliminar],
		 [vlSubTotal],
		 [vlIVA],
		 tpModificacionCajaPuesto,
		 dsObservacionCajaPuesto
	from TB_Comprobantes 
	where   nrTalonario = @nrTalonario_param 
		and nrComprobante = @nrComprobante_param 
	        and tpComprobante = @tpComprobante_param 
		and tpLetra = @tpLetra_param 

	update  [TB_ComprobantesCajasPuestosCierres]
	set	 nrTalonario_modif = @nrTalonario_new_param,
		 nrComprobante_modif = @nrComprobante_new_param,
	         tpComprobante_modif = @tpComprobante_new_param,
		 tpLetra_modif = @tpLetra_new_param
	where 
		 nrTalonario_modif =  @nrTalonario_param    and
		 nrComprobante_modif = @nrComprobante_param and
	         tpComprobante_modif = @tpComprobante_param and
		 tpLetra_modif = @tpComprobante_param

end

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sco_ComprobantesModificados_cajapuesto_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sco_ComprobantesModificados_cajapuesto_v2_5]

go

--- obtiene las modificadiones que recibio un comprobnate
create procedure sco_ComprobantesModificados_cajapuesto_v2_5
(@nrTalonario_param   as varchar(4),
 @nrComprobante_param as varchar(8),
 @tpComprobante_param as varchar(4),
 @tpLetra_param       as varchar(2))
as
begin 

	SELECT  b.nrTalonario, 
		b.nrComprobante, 
		b.tpComprobante,
		b.tpLetra,
	        b.dtComprobante,
		b.tpComision,
		b.cdCondVenta, 
		b.vlPagoPesos, 
		b.vlPagoEuros,
		b.vlPagoDolares, 
		b.nrLicencia, 
		b.dsOpcional1, 
		b.flAnulado, 
		b.flEliminar,
		'flManual'=CASE b.flManual
	        WHEN 'M' THEN 'Manual'
	        WHEN 'N' THEN 'Automática'
	        WHEN 'S' THEN 'Manual'
	        WHEN 'N' THEN 'Automática'
		END,
		b.dsOpcional2,
		'NO' flmodificadoreaperturacajapuesto,
		b.dtActualizacion
	into    #tmp_comprobantes
	FROM
		tb_comprobantes b
	WHERE   b.nrTalonario       = @nrTalonario_param
		and b.nrComprobante = @nrComprobante_param
		and b.tpComprobante = @tpComprobante_param 
		and b.tpLetra = @tpLetra_param


	insert into #tmp_comprobantes
		(nrTalonario, 
		nrComprobante, 
		tpComprobante,
		tpLetra,
	        dtComprobante,
		tpComision,
		cdCondVenta, 
		vlPagoPesos, 
		vlPagoEuros,
		vlPagoDolares, 
		nrLicencia, 
		dsOpcional1, 
		flAnulado, 
		flManual,
		dsOpcional2,
		flmodificadoreaperturacajapuesto,
		dtActualizacion,
		flEliminar)	
	SELECT  b.nrTalonario, 
		b.nrComprobante, 
		b.tpComprobante,
		b.tpLetra,
	        b.dtComprobante,
		b.tpComision,
		b.cdCondVenta, 
		b.vlPagoPesos, 
		b.vlPagoEuros,
		b.vlPagoDolares, 
		b.nrLicencia, 
		b.dsOpcional1, 
		b.flAnulado, 
		'flManual'=CASE b.flManual
	        WHEN 'M' THEN 'Manual'
	        WHEN 'N' THEN 'Automática'
	        WHEN 'S' THEN 'Manual'
	        WHEN 'N' THEN 'Automática'
		END,
		b.dsOpcional2,
		'SI' flmodificadoreaperturacajapuesto,
		b.dtActualizacion,
		b.flEliminar
	from TB_ComprobantesCajasPuestosCierres b
	where  b.nrTalonario_modif=@nrTalonario_param and 
	       b.nrComprobante_modif=@nrComprobante_param and
	       b.tpComprobante_modif=@tpComprobante_param and
	       b.tpLetra_modif=@tpLetra_param

	select * from #tmp_comprobantes
	ORDER BY dtActualizacion desc


end

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_ActualizarComprobante_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_ActualizarComprobante_v2_5]

go

---  Voy por acacacac !!!
--- SP_ActualizarComprobanteManual_v2_4 ->>> SP_ActualizarComprobanteManual_v2_5
-- Actualiza el nro de comprobante y talonario de una carga manual
create     procedure [SP_ActualizarComprobante_v2_5]
@nrTalonario_param        varchar(4),
@nrComprobante_param      varchar(12),
@tpComprobante_param      varchar(4),
@tpLetra_param            varchar(2),
@nrTalonario_new_param    varchar(4),
@nrComprobante_new_param  varchar(12),
@tpComprobante_new_param  varchar(4),
@tpLetra_new_param        varchar(2),
@dtComprobante_new_param  datetime=null,
@nrCierre_param		  int=null,
@cdCondVenta_new_param	  varchar(20)=null,
@tpComision_new_param	  varchar(20)=null,
@vlComision_new_param     float=null
AS
begin
/*

declare @nrTalonario_param varchar
declare @nrComprobante_param varchar
declare @tpComprobante_param varchar
declare @tpLetra_param      varchar
declare @nrTalonario_new_param varchar
declare @nrComprobante_new_param varchar
declare @tpComprobante_new_param varchar
declare @tpLetra_new_param varchar

set @nrTalonario_param ='0002'
set @nrComprobante_param ='00000063'
set @tpComprobante_param ='A'
set @tpLetra_param      ='A'
set @nrTalonario_new_param ='0002'
set @nrComprobante_new_param ='00000063'
set @tpComprobante_new_param ='B'
set @tpLetra_new_param ='B'

*/
declare @cantidad_registros int
declare @error		    varchar(200)
declare @cdCondVenta        varchar(50)
declare @vlPagoPesos        float
declare @vlPagoDolares      float
declare @vlPagoEuros        float
declare @vlTotalGeneral      float


	if @nrCierre_param is not null 
	begin
		---- guardar el comprobante anterior 
		exec sp_guardarComprobanteCajaPuestoAnterior_v2_5
			@nrTalonario_param   = @nrTalonario_param,
			@nrComprobante_param = @nrComprobante_param,
			@tpComprobante_param = @tpComprobante_param,
			@tpLetra_param       = @tpLetra_param,
			@nrCierre_param      = @nrCierre_param,	
			@nrTalonario_new_param   = @nrTalonario_new_param,
			@nrComprobante_new_param = @nrComprobante_new_param,
			@tpComprobante_new_param = @tpComprobante_new_param,
			@tpLetra_new_param       = @tpLetra_new_param
	end

	-- verificamos la existencia del comprobante
	select  @cantidad_registros=count(*),
	        @cdCondVenta=max(cdCondVenta), 
		@vlPagoPesos=max(vlPagoPesos),
		@vlPagoDolares=max(vlPagoPesos),
		@vlPagoEuros=max(vlPagoPesos),
		@vlTotalGeneral=max(vlTotalGeneral)
	FROM TB_Comprobantes
	WHERE nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param 
	
	if @cantidad_registros=0 
	begin
		select @error = 'No se ha encontrado el talonario '+ @nrTalonario_param + ' comprobante nro. '+ rtrim(@nrComprobante_param) +'.'
         	raiserror (@error, 16, 1)
		return 0	
	end

	-- si cambia los datos de la clave verificar si ya existe el comprobante
	-- con la nueva clave, si existe hay un error
	-- si el comprobante no existe 
	if      @nrTalonario_param <> @nrTalonario_new_param     or
		@nrComprobante_param  <> @nrComprobante_new_param   or 
		@tpComprobante_param  <> @tpComprobante_new_param   or
		@tpLetra_param        <> @tpLetra_new_param   
	begin
		if dbo.f_existeComprobante(@nrTalonario_new_param, @nrComprobante_new_param, @tpComprobante_new_param,@tpLetra_new_param)='SI'
		begin
			select @error = 'El comprobante modificado ya existe no puede modificarlo en lo que respeta a numeración y letra'
			raiserror (@error, 16, 1)
			return 0	
		end 



		insert into [TB_Comprobantes]
		    (nrTalonario,nrComprobante, tpComprobante, tpLetra, 
		    dtComprobante , cdCliente, cdCondVenta, tpComision, 
		    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
		    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
		    flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
		    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
		    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
		    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
		    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
		    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
		    nmEmpleado, IdReciboCtaCte, flCargaErronea, dtActualizacion)
		select  @nrTalonario_new_param,  @nrComprobante_New_param , 
			@tpComprobante_new_param, @tpLetra_new_param, 
		    dtComprobante, cdCliente, cdCondVenta, tpComision,	
		    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
		    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
		    0 as flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
		    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
		    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
		    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
		    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
		    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
		    nmEmpleado, IdReciboCtaCte, flCargaErronea, getdate () as  dtActualizacion
		from TB_Comprobantes
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param  
	
		if @@rowcount=0 
		begin	
			select @error = 'No se ha insertado el talonario '+ @nrTalonario_new_param + ' comprobante nro. '+ rtrim(@nrComprobante_new_param) +'.'
			raiserror (@error, 16, 1)
			return 0	
		end
	
		if @@error<>0
		begin
			select @error = 'error al insertar el registro en la tabla [TB_Comprobantes].'
			raiserror (@error, 16, 1)
			return 0
		end 	
	
		insert into [TB_ComprobantesDetalle]
		    (nrTalonario, nrComprobante, tpComprobante, tpLetra, nrItem, 
		    cdProducto, dsProducto, tpOperacion, qtCantidad, vlPorcentaje, 
		    vlPrecioPeaje, vlPrecioViaje, vlTotalItem, dtInsercion, 
		   flSincronizado,dtActualizacion)
		select @nrTalonario_new_param , @nrComprobante_new_param, @tpComprobante_new_param, @tpLetra_new_param, 
		    nrItem, cdProducto, dsProducto, tpOperacion, qtCantidad, 
		    vlPorcentaje, vlPrecioPeaje, vlPrecioViaje, vlTotalItem, 
		    dtInsercion, 0, getdate()
		from TB_ComprobantesDetalle
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param 

		update TB_Cupones
		set    nrTalonarioCliente     = @nrTalonario_new_param,
	   	       nrComprabanteCliente   = @nrComprobante_new_param,
		       tpComprobanteCliente = @tpComprobante_new_param,
		       tpLetraCliente       = @tpLetra_new_param 
		where nrTalonarioCliente   = @nrTalonario_param and
		      nrComprabanteCliente = @nrComprobante_param and
		      tpComprobanteCliente = @tpComprobante_param and 		
		      tpLetraCliente       = @tpLetra_param 


	
		if @@error<>0
		begin
			select @error = 'No se pudo grabar la tabla de TB_ComprobantesDetalle.'
			raiserror (@error, 16, 1)
			return 0
		end 
 

		-- Eliminar en la tabla de TB_ComprobantesDetalle el comprobante anterior
		delete from TB_ComprobantesDetalle
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param 
		
		if @@rowcount=0 
		begin	
			select @error = 'No se ha podido eliminar el comprobante anterior'
			raiserror (@error, 16, 1)
			return 0	
		end
		
		--------------------------------------------------------------------
		-- Eliminar en la tabla de TB_Comprobantes el comprobante anterior
		delete from TB_Comprobantes
		where nrTalonario   = @nrTalonario_param and
		nrComprobante = @nrComprobante_param and
		tpComprobante = @tpComprobante_param and 
		tpLetra       = @tpLetra_param 
		
		if @@rowcount=0 
		begin	
			select @error = 'No se ha podido eliminar el comprobante anterior.'
			raiserror (@error, 16, 1)
			rollback tran T1		
			return 0	
		end
		
		if @@error<>0
		begin	
			select @error = 'No se ha podido eliminar el comprobante anterior.'
			raiserror (@error, 16, 1)
			return 0	
		end
	end


	-- verificar si se ha modificado la cond de venta
	if @cdCondVenta<>@cdCondVenta_new_param
	begin
		if @cdCondVenta_new_param='Cuenta Corriente'
		begin
			select @error = 'No se puede modificar la condición de venta a Cuenta Corriente.'
			raiserror (@error, 16, 1)
			return 0	
		end

		select top 1  @vlPagoPesos as vlPagoPesos,
                        @vlPagoDolares as vlPagoDolares,
			@vlPagoEuros as vlPagoEuros ,
			@vlPagoPesos as vlPagoPesosACP,
			@vlPagoDolares as vlPagoDolaresACP ,
			@vlPagoEuros  as vlPagoEurosACP                                 
		into #ValoresdePagos from tb_cajas	

		delete from #ValoresdePagos

		insert #ValoresdePagos  exec sp_obtenerCondVentayValoresdePagosModificados_v2_5	
			@cdCondVenta_param=@cdCondVenta, 
			@cdCondVenta_new_param=@cdCondVenta_new_param,	  
			@vlTotalGeneral=@vlTotalGeneral,
			@vlPagoPesos_param=@vlPagoPesos,
			@vlPagoDolares_param=@vlPagoPesos,
			@vlPagoEuros_param=@vlPagoPesos

		select  @vlPagoPesos=vlPagoPesos,
			@vlPagoDolares=vlPagoDolares,
			@vlPagoEuros=vlPagoEuros
		from #ValoresdePagos 

	end -- cierre if @cdCondVenta<>@cdCondVenta_new_param


	--- analizar los cambios en la fecha, condicion de venta , comision
	-- actualizamos la cta cte del licenciatario
	update TB_Cupones
	set  
            /* Atencion si ya fue compensado no realizado nada*/		
	    dtcupon = CASE flCompensado
			 when 0 then isnull(@dtComprobante_new_param , dtcupon)
			 when 1 then dtcupon
			 End,
	    -- falta el recalculo de la vlcomision 
	    tpCupon = CASE flCompensado
			 when 0 then isnull(@cdCondVenta_new_param , tpCupon)
			 when 1 then tpCupon
			 End,
	    vlComision = CASE flCompensado
			 when 0 then isnull(@vlComision_new_param,vlComision) 
			 when 1 then vlComision
			 End,
            /* Atencion si ya fue compensado no realizado nada - valores de pago */		
	    vlPagoPesos = CASE flCompensado
			 when 0 then @vlPagoPesos
			 when 1 then vlPagoPesos
			 End,
	    -- falta el recalculo de la vlcomision 
	    vlPagoDolares = CASE flCompensado
			 when 0 then @vlPagoDolares
			 when 1 then vlPagoDolares
			 End,
	    vlPagoEuros = CASE flCompensado
			 when 0 then @vlPagoEuros
			 when 1 then vlPagoEuros
			 End
	where nrTalonarioCliente   = @nrTalonario_new_param and
	      nrComprabanteCliente = @nrComprobante_new_param and
	      tpComprobanteCliente = @tpComprobante_new_param and 
	      tpLetraCliente       = @tpLetra_new_param
		

	-- Verificar y correr los update necesarios para
	--  @dtComprobante_new_param  
	--  @cdCondVenta_new_param
	--  @tpComision_new_param
	update tb_comprobantes
	set dtComprobante = isnull( @dtComprobante_new_param , dtComprobante),
	    cdCondVenta	  = isnull( @cdCondVenta_new_param , cdCondVenta),
	    tpComision    = isnull( @tpComision_new_param , tpComision),
	    dtActualizacion = getdate(),
	    vlPagoPesos     = isnull(@vlPagoPesos,vlPagoPesos),
	    vlPagoDolares   = isnull(@vlPagoDolares,vlPagoPesos),
	    vlpagoEuros	    = isnull(@vlPagoEuros,vlPagoPesos)
	where nrTalonario   = @nrTalonario_new_param and
	      nrComprobante = @nrComprobante_new_param and
	      tpComprobante = @tpComprobante_new_param and 
	      tpLetra       = @tpLetra_new_param

	--------------------------------------------------------------------
	--------------------------------------------------------------------
	--------------------------------------------------------------------	



end

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_obtenerCondVentayValoresdePagosModificados_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_obtenerCondVentayValoresdePagosModificados_v2_5]

go


create   procedure sp_obtenerCondVentayValoresdePagosModificados_v2_5
	(@cdCondVenta_param       as varchar(50), 
	 @cdCondVenta_new_param   as varchar(50),
	 @vlPagoPesos_param        float,
	 @vlPagoDolares_param      float,
	 @vlPagoEuros_param        float,
	 @vlTotalGeneral  as float)      
as
begin
declare @vlPagoPesos      as float
declare @vlPagoDolares    as float
declare @vlPagoEuros   	  as float
declare @vlPagoPesosACP   as float -- ACP Actualizacion Caja Puesto
declare @vlPagoDolaresACP as float
declare @vlPagoEurosACP   as float
declare @error            as varchar(100)

	if @cdCondVenta_param=@cdCondVenta_new_param 
	begin 
		select @error = 'La condicion de venta no ha sido modificada.'
		raiserror (@error, 16, 1)
		return 0
	end 

	if @cdCondVenta_param='Contado' 
	begin 
	    select @vlPagoPesos= 0,	
                   @vlPagoDolares = 0,
       	           @vlPagoEuros = 0,
		   @vlPagoPesosACP= (-1) * abs(isnull(@vlPagoPesos_param,0)),	  -- actualiza caja puesto
                   @vlPagoDolaresACP = (-1)* abs(isnull(@vlPagoDolares_param,0)),
       	           @vlPagoEurosACP = (-1)* abs(isnull(@vlPagoEuros_param,0))

	end

	if @cdCondVenta_param<>'Contado' 
	begin 
	    select  @vlPagoPesos = case @cdCondVenta_new_param    -- actualiza caja puesto
			             when 'Contado' then @vlTotalGeneral
				     else 0 
				     end,	
		    @vlPagoDolares = 0,
		    @vlPagoEuros = 0,
 		    @vlPagoPesosACP= case @cdCondVenta_new_param    -- actualiza caja puesto
			             when 'Contado' then @vlTotalGeneral
				     else 0 
				     end,							
                    @vlPagoDolaresACP = 0,
       	            @vlPagoEurosACP = 0
	end

	select 	    @vlPagoPesos      as  vlPagoPesos,
		    @vlPagoDolares    as  vlPagoDolares,
		    @vlPagoEuros      as  vlPagoEuros,
		    @vlPagoPesosACP   as  vlPagoPesosACP,
                    @vlPagoDolaresACP as  vlPagoDolaresACP,
       	            @vlPagoEurosACP   as  vlPagoEurosACP


end

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[f_existeComprobante]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[f_existeComprobante]

go 

create function dbo.f_existeComprobante(
        @nrTalonario_param        varchar(4),
	@nrComprobante_param      varchar(12),
	@tpComprobante_param      varchar(4),
	@tpLetra_param            varchar(2))
returns char(2) as
begin
declare @cantidad_registros int 
declare @resultado          char(2)

	select   @cantidad_registros=count(*)
	FROM TB_Comprobantes
	WHERE nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param 

	if @cantidad_registros>0 
		set @resultado = 'SI';
	else		
		set @resultado =  'NO';	

	return @resultado; 
end

go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_obtenerCajasPendientesdeAprobacion_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_obtenerCajasPendientesdeAprobacion_v2_5]

go 

create  procedure sp_obtenerCajasPendientesdeAprobacion_v2_5
(@pdsUsuario_param as varchar(50))	
as
begin 

	select  nrCaja 
	from    tb_cajas 
	where 	tpEstadoAprobacion='Pendiente'
  	        and dsUsuario = @pdsUsuario_param

end

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_AprobarCajaPuesto_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_AprobarCajaPuesto_v2_5]

go 
 
create procedure sp_AprobarCajaPuesto_v2_5
(@pdsUsuario_param   as varchar(50),
 @pnrCaja_param   as numeric)	
as
begin 

	update tb_cajas 
	set tpEstadoAprobacion='Aprobada',
    	    dtEstadoAprobacion=getdate()
	where dsUsuario = @pdsUsuario_param and 
	      nrCaja = @pnrCaja_param


end

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_RechazarCajaPuesto_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_RechazarCajaPuesto_v2_5]
go

create procedure sp_RechazarCajaPuesto_v2_5
(@pdsUsuario_param   as varchar(50),
 @pnrCaja_param   as numeric)	
as
begin 

	update tb_cajas 
	set tpEstadoAprobacion='Rechazada',
    	    dtEstadoAprobacion=getdate()
	where dsUsuario = @pdsUsuario_param and 
	      nrCaja = @pnrCaja_param

end

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_marcarTipodeActualizacionCajaPuesto_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_marcarTipodeActualizacionCajaPuesto_v2_5]

go

create  procedure sp_marcarTipodeActualizacionCajaPuesto_v2_5(
@nrTalonario_param   	  	as varchar(4),
@nrComprobante_param 	  	as varchar(8),
@tpComprobante_param 	  	as varchar(4),
@tpLetra_param       	  	as varchar(2),
@tpModificacionCajaPuesto_param  varchar(50), /* Agregado, Eliminado, Anulado, Modificado*/
					      /* En Analisis: Desanulado, Deseliminado */
@dsObservacionCajaPuesto_param   varchar(400)=null)			       
as
begin 

	update  [TB_Comprobantes]
	set	 tpModificacionCajaPuesto = @tpModificacionCajaPuesto_param,
		 dsObservacionCajaPuesto  = @tpModificacionCajaPuesto_param+': '+ isnull(@dsObservacionCajaPuesto_param,'') + ' / '+isnull(dsObservacionCajaPuesto,'')
	where 
		 nrTalonario =  @nrTalonario_param    and
		 nrComprobante = @nrComprobante_param and
	         tpComprobante = @tpComprobante_param and
		 tpLetra = @tpComprobante_param


end

go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ActualizarDiferenciaSaldoCajaPuesto_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ActualizarDiferenciaSaldoCajaPuesto_v2_5]

go

create procedure sp_ActualizarDiferenciaSaldoCajaPuesto_v2_5
(@pnrCaja_param   as numeric(18,2))
as
begin
---drop table #temp_SumaCajaPuestosCondVenta_v2_5;
---declare @pnrCaja_param as numeric
---set @pnrCaja_param  =  3000000026 

declare @vlDiferenciaDeCierre as float
declare @dsDiferenciaDeCierre as varchar(100)


	select @vlDiferenciaDeCierre  as vlSaldoFinalPesos,
	       @vlDiferenciaDeCierre  as vlSaldoFinalDolares,
	       @vlDiferenciaDeCierre  as vlSaldoFinalEuros,
	       @vlDiferenciaDeCierre  as  vlDiaDolar,
	       @vlDiferenciaDeCierre  as vlDiaEuro,
	       @pnrCaja_param as nrCaja
               into #temp_SumaCajaPuestosCondVenta_v2_5

	delete from   #temp_SumaCajaPuestosCondVenta_v2_5

	insert into #temp_SumaCajaPuestosCondVenta_v2_5 exec SP_SumaCajaPuestosCondVenta_v2_5 @pnrCaja_param=@pnrCaja_param


	select @vlDiferenciaDeCierre =  dbo.f_positivoValorNegativoCero_2_5(dbo.f_pesificarValores_2_5(a.[vlSaldoFinalRealPesos], a.[vlSaldoFinalRealDolares],
                                                    a.[vlSaldoFinalRealEuros], a.[vlDiaDolar], a.[vlDiaEuro])) 
					 -  dbo.f_positivoValorNegativoCero_2_5(dbo.f_pesificarValores_2_5(b.[vlSaldoFinalPesos], b.[vlSaldoFinalDolares],
                                                    b.[vlSaldoFinalEuros], b.[vlDiaDolar], b.[vlDiaEuro])) 
	from tb_cajas  a, #temp_SumaCajaPuestosCondVenta_v2_5 b
	where  a.nrcaja=@pnrCaja_param and a.nrcaja = b.nrcaja



	if @vlDiferenciaDeCierre>0 
	begin
		set @dsDiferenciaDeCierre = 'Sobrante de dinero'
	end
	else
	begin	
		if @vlDiferenciaDeCierre<0
		begin
			set @dsDiferenciaDeCierre ='Faltante de dinero'	
		end
	end

	update tb_cajas  
	set vlDiferenciaDeCierre = abs(@vlDiferenciaDeCierre),
	    dsDiferenciaDeCierre = @dsDiferenciaDeCierre
	where  nrcaja=@pnrCaja_param


	select   vlDiferenciaDeCierre,
		 dsDiferenciaDeCierre
	from tb_cajas  
	where  nrcaja=@pnrCaja_param

end

go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_CajasPuestos_v2_5]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_CajasPuestos_v2_5]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.VW_CajasPuestos_v2_5
AS
SELECT     dbo.TB_Cajas.nrCaja, dbo.TB_Cajas.nrPuesto, dbo.TB_Cajas.dsUsuario, dbo.TB_Cajas.dtApertura, dbo.TB_Cajas.dtCierre, dbo.TB_Cajas.hrApertura, 
                      dbo.TB_Cajas.hrCierre, dbo.TB_Cajas.flEstado, dbo.TB_Cajas.flCajaAdm, dbo.TB_Cajas.vlSaldoInicialPesos, dbo.TB_Cajas.vlSaldoInicialDolares, 
                      dbo.TB_Cajas.vlSaldoInicialEuros, dbo.TB_Cajas.vlDiaDolar, dbo.TB_Cajas.vlDiaEuro, dbo.TB_Cajas.vlSaldoFinalPesos, 
                      dbo.TB_Cajas.vlSaldoFinalDolares, dbo.TB_Cajas.vlSaldoFinalEuros, dbo.TB_Cajas.vlSaldoFinalRealPesos, dbo.TB_Cajas.vlSaldoFinalRealEuros, 
                      dbo.TB_Cajas.vlSaldoFinalRealDolares, dbo.TB_Cajas.vlCierrePesos, dbo.TB_Cajas.vlCierreDolares, dbo.TB_Cajas.vlCierreEuros, 
                      dbo.TB_Cajas.vlTotalSaldoFinalReal, dbo.TB_Cajas.vlTotalSaldoFinal, dbo.TB_Cajas.dsDiferenciaDeCierre, dbo.TB_Cajas.vlDiferenciaDeCierre, 
                      dbo.TB_Usuarios.tpAcceso, dbo.TB_Cajas.flSincronizado, dbo.TB_Cajas.tpEstadoAprobacion
FROM         dbo.TB_Cajas INNER JOIN
                      dbo.TB_Usuarios ON dbo.TB_Cajas.dsUsuario = dbo.TB_Usuarios.dsUsuario

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_eliminarFisicamenteunComprobanteEliminadoLogicamente_v2_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_eliminarFisicamenteunComprobanteEliminadoLogicamente_v2_5]

go 

create procedure sp_eliminarFisicamenteunComprobanteEliminadoLogicamente_v2_5
							(@nrTalonario_param        varchar(4),
							@nrComprobante_param      varchar(12),
							@tpComprobante_param      varchar(4),
							@tpLetra_param            varchar(2))
as
begin
declare @error as varchar(200)


		/* verificamos si es un comprobado eliminado logicamente*/
		if (select count(*) from
			TB_Comprobantes
			where nrTalonario   = @nrTalonario_param and
			nrComprobante = @nrComprobante_param and
			tpComprobante = @tpComprobante_param and 
			tpLetra       = @tpLetra_param  and
			tpModificacionCajaPuesto ='Eliminado' and 
			flEliminar =1)=0 return 0;
		 

		delete TB_ComprobantesCajasPuestosCierres
		where nrTalonario_modif    = @nrTalonario_param and
		      nrComprobante_modif  = @nrComprobante_param and
		      tpComprobante_modif  = @tpComprobante_param and 		
		      tpLetra_modif = @tpLetra_param

		if @@error<>0
		begin
			select @error = 'No se pudieron eliminar las modificaciones del  comprobante eliminado logicamente.'
			raiserror (@error, 16, 1)
			return 0
		end 
 


		delete TB_Cupones
		where nrTalonarioCliente   = @nrTalonario_param and
		      nrComprabanteCliente = @nrComprobante_param and
		      tpComprobanteCliente = @tpComprobante_param and 		
		      tpLetraCliente       = @tpLetra_param 
	
		if @@error<>0
		begin
			select @error = 'No se pudo eliminar el comprobante eliminado logicamente en la cuenta corriente.'
			raiserror (@error, 16, 1)
			return 0
		end 
 

		-- Eliminar en la tabla de TB_ComprobantesDetalle el comprobante anterior
		delete from TB_ComprobantesDetalle
		where nrTalonario   = @nrTalonario_param and
		      nrComprobante = @nrComprobante_param and
		      tpComprobante = @tpComprobante_param and 
		      tpLetra       = @tpLetra_param 
		
		if @@rowcount=0 
		begin	
			select @error = 'No se ha podido eliminar el detalle de comprobante eliminado logicamente'
			raiserror (@error, 16, 1)
			return 0	
		end
		
		--------------------------------------------------------------------
		-- Eliminar en la tabla de TB_Comprobantes el comprobante anterior
		delete from TB_Comprobantes
		where nrTalonario   = @nrTalonario_param and
		nrComprobante = @nrComprobante_param and
		tpComprobante = @tpComprobante_param and 
		tpLetra       = @tpLetra_param 
		
		if @@rowcount=0 
		begin	
			select @error = 'No se ha podido eliminar el comprobante eliminado logicamente.'
			raiserror (@error, 16, 1)
			rollback tran T1		
			return 0	
		end
	

end 

