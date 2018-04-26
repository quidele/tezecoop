
-- Cambios de DDL version 4.9.832
use dbSG2000_Pruebas
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
	[fec_valor] [date] NOT NULL,
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
	[fec_doc] [date] NOT NULL,
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
	[descripcion] [varchar](50) NULL,
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
ALTER TABLE TB_CUPONES ALTER COLUMN tpComprobanteCliente VARCHAR(4);

-- NO CORRER HASTA CORROBORAR SI ES NECESAERIO  EJECUCION Y CANCELACION 3 MINUTOS
-- UPDATE  TB_CUPONES SET  tpComprobanteCliente = RTRIM(tpComprobanteCliente) ;


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
	[nmNombre] [varchar](50) NULL,
	[nmApellido] [varchar](50) NULL,
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
	[nro_cuota] [int] NOT NULL,
	[fecha_vencimiento] [date] NULL,
	[importe] [decimal](18, 2) NULL,
	[nrLicencia] char(3),
	[comentarios] varchar(200)
 CONSTRAINT [PK_TB_ObligacionesCuotas] PRIMARY KEY CLUSTERED 
(
	[nro_trans] ASC,
	[cod_tit] ASC,
	[nro_cuota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


-- Agregamos el campo nro_trans 
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_Cupones'  and  c.Name = 'nro_trans' )
	ALTER TABLE dbo.TB_Cupones ADD 	nro_trans int NULL;

GO



-- Agregamos el campo flGPS para identificar los titulares que han instalado GPS en sus vehiculos  
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_Proveedores'  and  c.Name = 'flGPS' )
	ALTER TABLE dbo.TB_Proveedores ADD 	flGPS bit NOT NULL  DEFAULT 0;

GO


-- PRIMERO CORRER EN PRUEBAS - REALIZAR BACKUP DE LA BD 
ALTER TABLE TB_RecibosDetalle ALTER COLUMN tpComprobanteCliente CHAR(4);


Go

IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'SP_AnularRecibo_v4_9_832')
	DROP  PROCEDURE SP_AnularRecibo_v4_9_832
GO

/************************************************/
/*      Modificado para la version 3.7          */
create  procedure [dbo].SP_AnularRecibo_v4_9_832
@idReciboParam       			as numeric,
@dsUsuario_param     			as Varchar(50),
@dsUsuario_Supervisor_param     as Varchar(50)=null
AS
BEGIN
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
	--if not exists(select * from  TB_Cajas 
	--	      where nrCaja=@nrCajaRecibo 
	--		    and flCajaAdm=1 and flEstado=0) 
	--begin
	--	select @strError='El recibo '+ convert(varchar,@IdReciboParam)+' no puede anularse ya que la caja que lo creo está cerrada.'
	--	raiserror (@strError,16,1)
	--	return -1
	--end 


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
		vlPagoReales,
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
		dsHoraViaje,
		vlSubtotal,
		vlIVA,
		vlRecargoTarjeta )
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
	    vlPagoReales, 
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
		dsHoraViaje,
		vlSubtotal,
		vlIVA,
		vlRecargoTarjeta
	from TB_Cupones 
	where IdRecibo=@IdReciboParam

	if @@rowcount=0 
	begin
		select @strError='El recibo '+ convert(varchar,@IdReciboParam)+' no puede anularse ya que presenta información inconsistente.'
		raiserror (@strError,16,1)
		return -1
	end 
	
	-- se ponen a nulo los comprobantes o cupones compensados
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
	      tpCupon in ('Cuenta Corriente', 'Tarjeta de Crédito', 'Tarjeta de Débito','Todo Pago')

	update TB_Cupones
	set idRecibo=null,
	flCompensado=0,
	dtCompensado=null,
	nrCajaLicenciatario=null,
	dtCajaLicenciatario=null, 
	dsUsuario=@dsUsuario_param
	where IdRecibo=@IdReciboParam and 
	      tpCupon in ('Contado', 'Débito','Crédito')

	-- eliminar los movimentos contables en dicha caja
	delete from TB_MovimientosContables
	where IdRecibo=@IdReciboParam
	
	-- actualizar el flag anulado del recibo
	update TB_Recibos
	set flAnulado=1,
	    dsUsuario=@dsUsuario_param,
	    dsUsuario_Supervisor=@dsUsuario_Supervisor_param
	where IdRecibo=@IdReciboParam

END

GO



ALTER VIEW dbo.VW_DetalleMovimientosContablesCupones
AS
SELECT DISTINCT 
                      dbo.TB_MovimientosContables.tpOperacion, dbo.TB_MovimientosContables.nrCaja, dbo.TB_MovimientosContables.dsConcepto, 
                      dbo.TB_Cupones.nrLicencia, dbo.TB_Cupones.tpCupon, dbo.TB_Cupones.nrTalonarioCliente, dbo.TB_Cupones.nrComprabanteCliente, 
                      dbo.TB_Cupones.vlPagoPesos AS vlPesos, dbo.TB_Cupones.vlPagoDolares AS vlDolares, dbo.TB_Cupones.vlPagoEuros AS vlEuros, 
                      dbo.TB_Cupones.vlComision, dbo.TB_Cupones.vlMontoCupon, dbo.TB_MovimientosContables.nrRecibo, dbo.TB_Cupones.flCompensado, 
                      dbo.TB_Cupones.dtCompensado, dbo.TB_MovimientosContables.dsUsuario, dbo.TB_Cupones.vlIVA
FROM         dbo.TB_MovimientosContables INNER JOIN
                      dbo.TB_Cupones ON dbo.TB_MovimientosContables.IdRecibo = dbo.TB_Cupones.IdRecibo
					  WHERE  dbo.TB_Cupones.tpCupon not in ('Débito')
