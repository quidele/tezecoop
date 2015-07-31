use dbSG2000_Pruebas
go

ALTER TABLE [dbo].[TB_Usuarios] ADD 
	[tpNivelJerarquico] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL

ALTER TABLE [dbo].[TB_MovimientosContables] ADD 
	[dsUsuario_Supervisor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL


ALTER TABLE [dbo].[TB_Usuarios] ALTER COLUMN  
	[tpAcceso] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL

ALTER TABLE [dbo].[TB_Recibos] ALTER COLUMN  
	[dsUsuario] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL


GO

-------------------------------------------------------------
---------------------------------------------------------------

go

ALTER TABLE [dbo].[TB_Cajas] 
	ADD [dsUsuario_Supervisor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL; 

GO

ALTER TABLE [dbo].[TB_Comprobantes] 
	ADD [dsUsuario_Supervisor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

CREATE TABLE [dbo].[TB_NivelAcceso] (
	[tpNivelAcceso] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_NivelAccesoOpcionesMenu] (
	[tpNivelAcceso] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[IdOpcionMenu] [int] NOT NULL ,
	[flAcceso] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_NivelJerarquico] (
	[tpNivelJerarquico] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_OpcionesMenues] (
	[IdOpcionMenu] [int] NOT NULL ,
	[dsOpcionMenu] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nmOpcionMenu] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tpNivelJerarquico] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nrorden] [numeric](18, 0) NULL ,
	[nrNivelHoja] [int] NULL ,
	[flvisible] [bit] NULL ,
	[flCajaAdm] [bit] NULL 
) ON [PRIMARY]
GO



ALTER TABLE [dbo].[TB_Recibos] 
	ADD [dsUsuario_Supervisor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
GO


ALTER TABLE [dbo].[TB_NivelAcceso] WITH NOCHECK ADD 
	CONSTRAINT [PK_TB_NivelAcceso] PRIMARY KEY  CLUSTERED 
	(
		[tpNivelAcceso]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_NivelAccesoOpcionesMenu] WITH NOCHECK ADD 
	CONSTRAINT [PK_TB_NivelAccesoOpcionesMenu] PRIMARY KEY  CLUSTERED 
	(
		[tpNivelAcceso],
		[IdOpcionMenu]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_NivelJerarquico] WITH NOCHECK ADD 
	CONSTRAINT [PK_TB_NivelJerarquico] PRIMARY KEY  CLUSTERED 
	(
		[tpNivelJerarquico]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_OpcionesMenues] WITH NOCHECK ADD 
	CONSTRAINT [PK_TB_OpcionesMenues] PRIMARY KEY  CLUSTERED 
	(
		[IdOpcionMenu]
	)  ON [PRIMARY] 
GO


ALTER TABLE [dbo].[TB_Cajas] ADD 
	CONSTRAINT [FK_TB_Cajas_TB_Usuarios] FOREIGN KEY 
	(
		[dsUsuario_Supervisor]
	) REFERENCES [dbo].[TB_Usuarios] (
		[dsUsuario]
	)
GO

ALTER TABLE [dbo].[TB_Comprobantes] ADD 
	CONSTRAINT [FK_TB_Comprobantes_TB_Usuarios] FOREIGN KEY 
	(
		[dsUsuario_Supervisor]
	) REFERENCES [dbo].[TB_Usuarios] (
		[dsUsuario]
	)
GO

ALTER TABLE [dbo].[TB_NivelAccesoOpcionesMenu] ADD 
	CONSTRAINT [FK_TB_NivelAccesoOpcionesMenu_TB_NivelAcceso] FOREIGN KEY 
	(
		[tpNivelAcceso]
	) REFERENCES [dbo].[TB_NivelAcceso] (
		[tpNivelAcceso]
	),
	CONSTRAINT [FK_TB_NivelAccesoOpcionesMenu_TB_OpcionesMenues] FOREIGN KEY 
	(
		[IdOpcionMenu]
	) REFERENCES [dbo].[TB_OpcionesMenues] (
		[IdOpcionMenu]
	)
GO

ALTER TABLE [dbo].[TB_OpcionesMenues] ADD 
	CONSTRAINT [FK_TB_OpcionesMenues_TB_NivelJerarquico] FOREIGN KEY 
	(
		[tpNivelJerarquico]
	) REFERENCES [dbo].[TB_NivelJerarquico] (
		[tpNivelJerarquico]
	)
GO



ALTER TABLE [dbo].[TB_Recibos] ADD 
	CONSTRAINT [FK_TB_Recibos_TB_Usuarios] FOREIGN KEY 
	(
		[dsUsuario]
	) REFERENCES [dbo].[TB_Usuarios] (
		[dsUsuario]
	),
	CONSTRAINT [FK_TB_Recibos_TB_Usuarios1] FOREIGN KEY 
	(
		[dsUsuario_Supervisor]
	) REFERENCES [dbo].[TB_Usuarios] (
		[dsUsuario]
	)

GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE  procedure sco_acceso_permitido
@p_tpNivelAcceso        varchar(50),
@p_nmOpcionMenu         varchar(60),
@p_tpNivelJerarquico    varchar(60)
as
begin
declare @flAcceso int;
declare @flAcceso_texto   char(2);
declare @dsErrorAcceso     varchar(2);
declare @tpNivelJerarquico varchar;

	select @flAcceso=0;
 
	select @flAcceso=a.flAcceso, @tpNivelJerarquico=b.tpNivelJerarquico
	from TB_NivelAccesoOpcionesMenu a, TB_OpcionesMenues b
	where a.IdOpcionMenu=b.IdOpcionMenu and
	      a.tpNivelAcceso=@p_tpNivelAcceso and
	      b.flvisible=1
	
	-- comparo los niveles jerarquicos
	if @tpNivelJerarquico<>@p_tpNivelJerarquico
	begin
		select @flAcceso_texto='NO';
		select @dsErrorAcceso='El nivel jeráquico no es el adecuado'
		return;
	end

	if @flAcceso=0
	begin
		select @flAcceso_texto='NO';
		select @dsErrorAcceso='Usted no tiene acceso a esta opción del sistema'	
		return;
	end

	select @flAcceso_texto='SI';
	select @dsErrorAcceso='Acceso permitido'

	select @flAcceso_texto as flAcceso,
	       @dsErrorAcceso  as dsErrorAcceso


end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE procedure sco_TipodeAcceso AS

	SELECT     tpNivelAcceso
	FROM         TB_NivelAcceso
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE procedure sco_NivelJerarquico AS

	SELECT tpNivelJerarquico
	FROM         TB_NivelJerarquico
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO






create  procedure sco_AccesosOpcionesMenu
@p_tpNivelAcceso varchar(50),
@p_operaconcaja  int=0
as
begin

	if @p_tpNivelAcceso is null
	begin
		SELECT dsOpcionMenu, nmOpcionMenu, tpNivelJerarquico,
	            nrNivelHoja, idOpcionMenu, flCajaAdm, 0 as flAcceso
		FROM   TB_OpcionesMenues
		WHERE flvisible = 1 and (flCajaAdm=0 or flCajaAdm is null)
		ORDER BY nrorden;
		return; 
	end

	if @p_operaconcaja=1
		SELECT tpNivelAcceso, dsOpcionMenu, nmOpcionMenu, flAcceso, tpNivelJerarquico,
	            nrNivelHoja, idOpcionMenu, flCajaAdm
		FROM   VW_AccesoOpcionesMenu
		WHERE tpNivelAcceso = @p_tpNivelAcceso 	and flvisible = 1 
		ORDER BY nrorden
	else
		SELECT tpNivelAcceso, dsOpcionMenu, nmOpcionMenu, flAcceso, tpNivelJerarquico,
	            nrNivelHoja, idOpcionMenu, flCajaAdm
		FROM   VW_AccesoOpcionesMenu
		WHERE tpNivelAcceso = @p_tpNivelAcceso 	and flvisible = 1 and (flCajaAdm=0 or flCajaAdm is null)
		ORDER BY nrorden


end










go

create procedure sco_CajadeADMActiva
as

	SELECT     nrCaja
	FROM         TB_Cajas
	WHERE     (flEstado = 0) AND (flCajaAdm = 1) AND (nrCaja <> 1)


go

/***************************************************/
/*      modificado version 1.2 - seguridad         */
create procedure SP_AnularRecibo
@idReciboParam       		as numeric,
@dsUsuario_param     		as Varchar(50),
@dsUsuario_Supervisor_param     as Varchar(50)=null
as
declare @nrCajaRecibo  numeric
declare @strError      varchar(400)
declare @tpRecibo      varchar(100)
declare @flAnulado     bit 

	select @flAnulado=0

	select @nrCajaRecibo=nrCaja, @tpRecibo=tpRecibo, @flAnulado=flAnulado from TB_Recibos 
	where IdRecibo=@IdReciboParam

	if @flAnulado=1
	begin
		select @strError='El recibo '+ convert(varchar,@IdReciboParam)+' ya se encuentra anulado.'
		raiserror (@strError,16,1)
		return -1
	end
		
	-- verificamos  que la caja no haya sido cerrada
	if not exists(select * from  TB_Cajas 
		      where nrCaja=@nrCajaRecibo 
			    and flCajaAdm=1 and flEstado=0) 
	begin
		select @strError='El recibo '+ convert(varchar,@IdReciboParam)+' no puede anularse ya que la caja que lo creo está cerrada.'
		raiserror (@strError,16,1)
		return -1
	end 


	if @tpRecibo='Detalle de Cobro a Cta. Cte.' 
	begin
		select @strError='No se puede anular un recibo de Detalle de Cobro a Cta. Cte. este recibo se anula en caso de que usted anule la factura que lo generó.'
		raiserror (@strError,16,1)
		return -1
	end 

	-- Solo anulamos recibos 'Detalle de Pago a Licenciatario' 

	-- se copian los detalles
	insert into TB_RecibosDetalle 
		(nrCupon,
		cdCliente,
		nrPuesto,
		nrLicencia,
		nmLicenciatario,
		tpCupon,
		vlMontoCupon,
		vlaFavordelLicenciatario,
		vlafavorAdmin,
		vlPagoPesos, 
		vlPagoEuros,
		vlPagoDolares, 
		vlComision,
		nrCantidadBultos, 
		nrPasajeros,
		dtCupon,
		nrTalonarioCliente,
		nrComprabanteCliente,
		tpComprobanteCliente, 
		tpLetraCliente,
		flCobradoalCliente, 
		dtCobradoalCliente, 
		nrCajaCliente, 
		dtCajaCliente, 
		nrTalonarioProveedor, 
		nrComprabanteProveedor, 
		tpComprobanteProveedor, 
		tpLetraLetraProveedor, 
		flCompensado, 
		dtCompensado, 
		nrCajaLicenciatario, 
		dtCajaLicenciatario, 
		dsUsuario, 
		nrLiquidacionProveedores,
		nrLiquidacionCliente,
		cdCodBar, 
		flAnulado, 
		dtAnulado, 
		IdRecibo, 
		IdReciboCtaCte, 
		dsObservacion, 
		dsDestino, 
		dsHoraViaje)
	select  nrCupon, 
		cdCliente, 
		nrPuesto, 
		nrLicencia, 
		nmLicenciatario, 
		tpCupon, 
		vlMontoCupon, 
		vlaFavordelLicenciatario, 
		vlafavorAdmin, 
		vlPagoPesos, 
		vlPagoEuros, 
		vlPagoDolares, 
		vlComision, 
		nrCantidadBultos, 
		nrPasajeros, 
		dtCupon, 
		nrTalonarioCliente, 
		nrComprabanteCliente, 
		tpComprobanteCliente, 
		tpLetraCliente, 
		flCobradoalCliente, 
		dtCobradoalCliente, 
		nrCajaCliente, 
		dtCajaCliente, 
		nrTalonarioProveedor, 
		nrComprabanteProveedor,            
		tpComprobanteProveedor, 
		tpLetraLetraProveedor, 
		flCompensado, 
		dtCompensado, 
		nrCajaLicenciatario, 
		dtCajaLicenciatario, 
		dsUsuario, 
		nrLiquidacionProveedores, 
		nrLiquidacionCliente, 
		cdCodBar, 
		flAnulado, 
		dtAnulado, 
		IdRecibo, 
		IdReciboCtaCte, 
		dsObservacion, 
		dsDestino, 
		dsHoraViaje
	from TB_Cupones 
	where IdRecibo=@IdReciboParam

	if @@rowcount=0 
	begin
		select @strError='El recibo '+ convert(varchar,@IdReciboParam)+' no puede anularse ya que presenta información inconsistente.'
		raiserror (@strError,16,1)
		return -1
	end 
	
	-- se ponen a nulo los comprobantes o cupones compenados
	update TB_Cupones
	set idRecibo=null,
	vlPagoDolares=0,
	vlPagoEuros=0,
	vlPagoPesos=0,
	flCompensado=0,
	flCobradoalCliente=0,
	dtCobradoalCliente=null,
	dtCompensado=null,
	nrCajaLicenciatario=null,
	dtCajaLicenciatario=null, 
	dsUsuario=@dsUsuario_param
	where IdRecibo=@IdReciboParam and 
	      tpCupon in ('Cobro en Destino', 'Retorno')

	-- se ponen a nulo los comprobantes o cupones compenados
	update TB_Cupones
	set idRecibo=null,
	vlPagoDolares=0,
	vlPagoEuros=0,
	vlPagoPesos=0,
	flCompensado=0,
	dtCompensado=null,
	nrCajaLicenciatario=null,
	dtCajaLicenciatario=null, 
	dsUsuario=@dsUsuario_param
	where IdRecibo=@IdReciboParam and 
	      tpCupon in ('Cuenta Corriente', 'Tarjeta de Crédito', 'Tarjeta de Débito')

	update TB_Cupones
	set idRecibo=null,
	flCompensado=0,
	dtCompensado=null,
	nrCajaLicenciatario=null,
	dtCajaLicenciatario=null, 
	dsUsuario=@dsUsuario_param
	where IdRecibo=@IdReciboParam and 
	      tpCupon in ('Contado')

	-- eliminar los movimentos contables en dicha caja
	delete from TB_MovimientosContables
	where IdRecibo=@IdReciboParam
	
	-- actualizar el flag anulado del recibo
	update TB_Recibos
	set flAnulado=1,
	    dsUsuario=@dsUsuario_param,
	    dsUsuario_Supervisor=@dsUsuario_Supervisor_param
	where IdRecibo=@IdReciboParam


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

ALTER TABLE [dbo].[TB_MovimientosContables] ADD 
	CONSTRAINT [FK_TB_MovimientosContables_TB_Usuarios] FOREIGN KEY 
	(
		[dsUsuario_Supervisor]
	) REFERENCES [dbo].[TB_Usuarios] (
		[dsUsuario]
	)

GO


CREATE VIEW dbo.VW_AccesoOpcionesMenu
AS
SELECT     dbo.TB_NivelAccesoOpcionesMenu.tpNivelAcceso, dbo.TB_OpcionesMenues.dsOpcionMenu, dbo.TB_OpcionesMenues.nmOpcionMenu, 
                      dbo.TB_NivelAccesoOpcionesMenu.flAcceso, dbo.TB_OpcionesMenues.tpNivelJerarquico, dbo.TB_NivelAccesoOpcionesMenu.IdOpcionMenu, 
                      dbo.TB_OpcionesMenues.nrorden, dbo.TB_OpcionesMenues.flvisible, dbo.TB_OpcionesMenues.flCajaAdm, 
                      dbo.TB_OpcionesMenues.nrNivelHoja
FROM         dbo.TB_NivelAccesoOpcionesMenu INNER JOIN
                      dbo.TB_OpcionesMenues ON dbo.TB_NivelAccesoOpcionesMenu.IdOpcionMenu = dbo.TB_OpcionesMenues.IdOpcionMenu


go