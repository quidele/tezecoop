-- Cambios de DDL version 4.9.1
use dbSG2000
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='nrCuponPosnet')
	ALTER TABLE dbo.TB_Cupones ADD  nrCuponPosnet nchar(25) NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='nrCuponPosnet')
	ALTER TABLE dbo.TB_Comprobantes ADD  nrCuponPosnet nchar(25) NULL;



if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conciliacion' and COLUMN_NAME='idArchivo')
	ALTER TABLE dbo.TB_Conciliacion ADD  idArchivo int NULL;


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_ConciliacionDetalle' and COLUMN_NAME='IdArchivoTarjetaDetalle')
	ALTER TABLE dbo.TB_ConciliacionDetalle ADD  IdArchivoTarjetaDetalle bigint NULL;

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_ConciliacionDetalle' and COLUMN_NAME='fechaPago')
	ALTER TABLE dbo.TB_ConciliacionDetalle ADD  fechaPago date NULL;


		
go



ALTER TABLE [dbo].[TB_ArchivoTarjetaDetalle] DROP CONSTRAINT [FK_TB_ArchivoTarjetaDetalle_TB_ArchivoTarjeta]
GO

/****** Object:  Table [dbo].[TB_ArchivoTarjetaDetalle]    Script Date: 05/09/2016 10:05:33  ******/
DROP TABLE [dbo].[TB_ArchivoTarjetaDetalle]
GO

/****** Object:  Table [dbo].[TB_ArchivoTarjeta]    Script Date: 05/09/2016 10:05:33  ******/
DROP TABLE [dbo].[TB_ArchivoTarjeta]
GO

/****** Object:  Table [dbo].[TB_ArchivoTarjeta]    Script Date: 05/09/2016 10:05:33  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_ArchivoTarjeta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[formato] [char](15) NULL,
	[nombrearchivo] [varchar](50) NULL,
	[dtproceso] [datetime] NULL,
	[dsUsuario] [varchar](20) NULL,
	nombreArchivoCompleto [varchar](500),
 CONSTRAINT [PK_TB_ArchivoTarjeta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[TB_ArchivoTarjetaDetalle]    Script Date: 05/09/2016 10:05:33  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_ArchivoTarjetaDetalle](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[idarchivo] [int] NULL,
	[fechaPresentacion] [date] NULL,
	[importe] [decimal](18, 3) NULL,
	[fechaPago] [date] NULL,
	[tarjeta] [char](4) NULL,
	[comprobante] [char](10) NULL,
	[moneda] [char](3) NULL,
	[contenido] [varchar](300) NULL,
	[dtInsercion] [datetime] NULL,
	[nrCupon] [decimal](18, 0) NULL,
	[nrNivelConciliacion] [smallint] NULL,
 CONSTRAINT [PK_TB_ArchivoTarjetaDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TB_ArchivoTarjetaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TB_ArchivoTarjetaDetalle_TB_ArchivoTarjeta] FOREIGN KEY([idarchivo])
REFERENCES [dbo].[TB_ArchivoTarjeta] ([id])
GO

ALTER TABLE [dbo].[TB_ArchivoTarjetaDetalle] CHECK CONSTRAINT [FK_TB_ArchivoTarjetaDetalle_TB_ArchivoTarjeta]
GO



if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_conciliarAutomaticamente' )
	drop procedure  dbo.spu_conciliarAutomaticamente

go
		
--exec [dbo].[spu_conciliarAutomaticamente] @idArchivo=15 

create procedure dbo.spu_conciliarAutomaticamente (@idArchivo int) 
as
begin 

	/* select 'OK' as resultado , 'en el store debemos desarrollar toda la logica de la conciliacion' descripcion_error 
	return; 
	-- SP_HELP 'TB_ArchivoTarjetaDetalle'

	drop table #tmpArchivoaConciliar
	drop table #tmpViajesesaConciliar
	drop table #tmpViajesConciliados 
	*/

	SELECT Id, idarchivo, fechaPresentacion, importe, fechaPago, 
		    tarjeta, comprobante, moneda, contenido, dtInsercion, 
			nrCupon into #tmpArchivoaConciliar  FROM TB_ArchivoTarjetaDetalle WHERE idarchivo = @idArchivo

	-- select top 10 * from #tmpArchivoaConciliar

	select c.nrCupon, c.dtCupon, c.nrLicencia, c.tpComprobanteCliente, 
		   c.tpLetraCliente , c.nrTalonarioCliente , c.nrComprabanteCliente,  c.vlMontoCupon ,
		   c.nrTarjeta, c.tpDocTarjeta,  c.nrDocTarjeta  , nrCuponPosnet 
		    into #tmpViajesesaConciliar
			from  TB_Cupones c
					where (c.flCobradoalCliente = 0 ) and  (c.flCompensado = 0)
                           and   (c.flAnulado = 0)
                           and   (tpCupon in  ('Tarjeta de Crédito', 'Tarjeta de Débito')) 
						   -- falta agregar que no haya sido conciliado anteriormente 
    
	--select * from #tmpViajesesaConciliar

	-- nrNivelConciliacion 1 - mas representativo                                   
	-- drop table  #tmpViajesConciliados           
	select  x.Id , y.nrCupon , 1 as nrNivelConciliacion   into #tmpViajesConciliados 
	from #tmpArchivoaConciliar	 x inner join #tmpViajesesaConciliar y
					on x.comprobante = y.nrCuponPosnet  and x.tarjeta = y.nrTarjeta
							and x.importe = y.vlMontoCupon
								

	--select * from #tmpViajesConciliados

	-- nrNivelConciliacion 2 
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 2 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on (x.comprobante = y.nrCuponPosnet  and x.tarjeta = y.nrTarjeta )
							-- and x.importe = y.vlMontoCupon
							where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)

	--select * from #tmpViajesConciliados

	-- nrNivelConciliacion 2 
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 2 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.comprobante = y.nrCuponPosnet  and x.importe = y.vlMontoCupon
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)

	--select * from #tmpViajesConciliados

	-- nrNivelConciliacion 2 
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 3 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.tarjeta = y.nrTarjeta  and x.importe = y.vlMontoCupon
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)
	--select * from #tmpViajesConciliados

	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 2 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.tarjeta = y.nrTarjeta  and convert(date , x.fechaPresentacion  )  = convert( date ,  y.dtCupon )
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)

	--select * from #tmpViajesConciliados

	--return; 

	update x set  x.nrCupon = y.nrCupon , x.nrNivelConciliacion = y.nrNivelConciliacion   from TB_ArchivoTarjetaDetalle   x  inner join #tmpViajesConciliados  y
					on x.Id = y.Id 

	select 'OK' as resultado , 'en el store debemos desarrollar toda la logica de la conciliacion' descripcion_error 

end

GO



ALTER TABLE [dbo].[TB_MovimientosContablesPosdatados] DROP CONSTRAINT [FK_TB_MovimientosContablesPosdatados_TB_Usuarios]
GO

ALTER TABLE [dbo].[TB_MovimientosContablesPosdatados] DROP CONSTRAINT [DF_TB_MovimientosContablesPosdatados_flProcesado]
GO

/****** Object:  Table [dbo].[TB_MovimientosContablesPosdatados]    Script Date: 14/09/2016 17:42:46 ******/
DROP TABLE [dbo].[TB_MovimientosContablesPosdatados]
GO

/****** Object:  Table [dbo].[TB_MovimientosContablesPosdatados]    Script Date: 14/09/2016 17:42:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TB_MovimientosContablesPosdatados](
	[IdMovimiento] [numeric](18, 0) NOT NULL,
	[dsMovimiento] [varchar](100) NULL,
	[IdRecibo] [numeric](18, 0) NULL,
	[IdProveedor] [varchar](50) NULL,
	[dsProveedor] [varchar](60) NULL,
	[cdConcepto] [int] NULL,
	[tpConcepto] [varchar](50) NULL,
	[dsConcepto] [varchar](100) NULL,
	[tpOperacion] [varchar](50) NULL,
	[vlPesos] [float] NULL,
	[vlDolares] [float] NULL,
	[vlEuros] [float] NULL,
	[nrRecibo] [varchar](50) NULL,
	[nrFactura] [varchar](50) NULL,
	[nrCaja] [numeric](18, 0) NULL,
	[dsUsuario] [varchar](50) NULL,
	[dtMovimiento] [datetime] NULL,
	[dsObservacion] [varchar](255) NULL,
	[nrAnio] [int] NULL,
	[dsUsuario_Supervisor] [varchar](50) NULL,
	[nrCajaPuesto] [numeric](18, 0) NULL,
	[tpCajaImputacion] [varchar](50) NULL,
	[dsUsuarioCajaPuesto] [varchar](50) NULL,
	[tpMovimiento] [varchar](20) NULL,
	[flProcesado] [bit] NULL,
 CONSTRAINT [PK_TB_MovimientosContablesPosdatados] PRIMARY KEY NONCLUSTERED 
(
	[IdMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TB_MovimientosContablesPosdatados] ADD  CONSTRAINT [DF_TB_MovimientosContablesPosdatados_flProcesado]  DEFAULT ((0)) FOR [flProcesado]
GO

ALTER TABLE [dbo].[TB_MovimientosContablesPosdatados]  WITH CHECK ADD  CONSTRAINT [FK_TB_MovimientosContablesPosdatados_TB_Usuarios] FOREIGN KEY([dsUsuario_Supervisor])
REFERENCES [dbo].[TB_Usuarios] ([dsUsuario])
GO

ALTER TABLE [dbo].[TB_MovimientosContablesPosdatados] CHECK CONSTRAINT [FK_TB_MovimientosContablesPosdatados_TB_Usuarios]
GO


