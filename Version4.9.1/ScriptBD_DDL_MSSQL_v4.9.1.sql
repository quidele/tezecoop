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




--	select  convert(float,nrCuponposnet),  isnumeric(nrCuponposnet) , nrCuponposnet,  * from tmpViajesesaConciliar
--	where nrCuponposnet like '%.%'


go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_conciliarAutomaticamente' )
	drop procedure  dbo.spu_conciliarAutomaticamente

go
		
--exec [dbo].[spu_conciliarAutomaticamente] @idArchivo=2

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
			nrCupon, convert(int,0) as comprobante_numerico, 
			convert(int,0) as tarjeta_numerico,
			convert(float,0) as importe_numerico
			into #tmpArchivoaConciliar
			  FROM TB_ArchivoTarjetaDetalle WHERE idarchivo = @idArchivo

	update #tmpArchivoaConciliar set comprobante_numerico = convert(int,comprobante) where ISNUMERIC(comprobante) = 1
	update #tmpArchivoaConciliar set tarjeta_numerico = convert(int,comprobante) where ISNUMERIC(tarjeta_numerico) = 1
	update #tmpArchivoaConciliar set importe_numerico = convert(float,comprobante) where ISNUMERIC(importe_numerico) = 1

	-- select top 10 * from #tmpArchivoaConciliar

	select c.nrCupon, c.dtCupon, c.nrLicencia, c.tpComprobanteCliente, 
		   c.tpLetraCliente , c.nrTalonarioCliente , c.nrComprabanteCliente,  c.vlMontoCupon ,
		   c.nrTarjeta, c.tpDocTarjeta,  c.nrDocTarjeta  , nrCuponPosnet , convert(int,0)  nrCuponPosnet_numerico,
		   convert(int,0) as nrTarjeta_numerico,
		   convert(float,0) as vlMontoCupon_numerico
		    into #tmpViajesesaConciliar
			from  TB_Cupones c
					where (c.flCobradoalCliente = 0 ) and  (c.flCompensado = 0)
                           and   (c.flAnulado = 0)
                           and   (tpCupon in  ('Tarjeta de Crédito', 'Tarjeta de Débito')) 
						   -- falta agregar que no haya sido conciliado anteriormente 
    
	--select * from #tmpViajesesaConciliar
	
	update #tmpViajesesaConciliar  set nrCuponPosnet_numerico = convert(int,nrCuponPosnet) where ISNUMERIC(replace(nrCuponPosnet,'.','')) = 1
	update #tmpViajesesaConciliar  set nrTarjeta_numerico = convert(int,nrTarjeta_numerico) where ISNUMERIC(replace(nrTarjeta_numerico,'.','')) = 1
	update #tmpViajesesaConciliar  set vlMontoCupon_numerico = convert(float,vlMontoCupon_numerico) where ISNUMERIC(replace(vlMontoCupon_numerico,'.','')) = 1
	
	--select * from #tmpViajesesaConciliar

	-- nrNivelConciliacion 1 - mas representativo                                   
	-- drop table  #tmpViajesConciliados           
	select  x.Id , y.nrCupon , 1 as nrNivelConciliacion   into #tmpViajesConciliados 
	from #tmpArchivoaConciliar	 x inner join #tmpViajesesaConciliar y
					on x.comprobante = y.nrCuponPosnet  and x.tarjeta = y.nrTarjeta
							and x.importe = y.vlMontoCupon
	
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 1 as nrNivelConciliacion  
	from #tmpArchivoaConciliar	 x inner join #tmpViajesesaConciliar y
					on x.comprobante_numerico = y.nrCuponPosnet_numerico  and x.tarjeta = y.nrTarjeta
							and x.importe = y.vlMontoCupon						
	where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)

	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 1 as nrNivelConciliacion  
	from #tmpArchivoaConciliar	 x inner join #tmpViajesesaConciliar y
					on x.comprobante_numerico = y.nrCuponPosnet_numerico  and x.tarjeta_numerico = y.nrTarjeta_numerico
							and x.importe_numerico = y.vlMontoCupon_numerico	
	where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)

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

	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 2 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.tarjeta = y.nrTarjeta  and x.importe = y.vlMontoCupon
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)


	-- nrNivelConciliacion 2 
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 2 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.tarjeta_numerico = y.nrTarjeta_numerico 
					 and x.importe_numerico = y.vlMontoCupon_numerico
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)
	--select * from #tmpViajesConciliados


-- nrNivelConciliacion 3
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 3 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.tarjeta = y.nrTarjeta
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)
	--select * from #tmpViajesConciliados

-- nrNivelConciliacion 3 
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 3 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.tarjeta_numerico = y.nrTarjeta_numerico 
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)
	--select * from #tmpViajesConciliados



	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 3 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.comprobante = y.nrCuponPosnet
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)


	-- nrNivelConciliacion 2 
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 3 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.comprobante_numerico = y.nrCuponPosnet_numerico
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)
	--select * from #tmpViajesConciliados

	--return; 

	update x set  x.nrCupon = y.nrCupon , x.nrNivelConciliacion = y.nrNivelConciliacion   from TB_ArchivoTarjetaDetalle   x  inner join #tmpViajesConciliados  y
					on x.Id = y.Id 

	update x set  x.nrNivelConciliacion = -1  from TB_ArchivoTarjetaDetalle   x 
	where x.nrNivelConciliacion is null
	 
	select 'OK' as resultado , 'en el store debemos desarrollar toda la logica de la conciliacion' descripcion_error 

end

GO


if  exists (SELECT * FROM sys.tables where name ='TB_MovimientosContablesPosdatados' )
	ALTER TABLE [dbo].[TB_MovimientosContablesPosdatados] DROP CONSTRAINT [FK_TB_MovimientosContablesPosdatados_TB_Usuarios]
GO
if  exists (SELECT * FROM sys.tables where name ='TB_MovimientosContablesPosdatados' )
	ALTER TABLE [dbo].[TB_MovimientosContablesPosdatados] DROP CONSTRAINT [DF_TB_MovimientosContablesPosdatados_flProcesado]
GO

/****** Object:  Table [dbo].[TB_MovimientosContablesPosdatados]    Script Date: 17/09/2016 8:35:41  ******/
if  exists (SELECT * FROM sys.tables where name ='TB_MovimientosContablesPosdatados' )
DROP TABLE [dbo].[TB_MovimientosContablesPosdatados]
GO

/****** Object:  Table [dbo].[TB_MovimientosContablesPosdatados]    Script Date: 17/09/2016 8:35:41  ******/
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
	[dtFechaPosdata] [date] NOT NULL,
	[nrCupon] [decimal](18, 0) NULL,
	[IdConciliacion] [int] NULL,
	[flProcesado] [bit] NULL,
	[dtProcesado] [datetime] NULL,
	[IdMovimiento_Procesado] [numeric](18, 0) NOT NULL,
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



if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_MovimientosContables' and COLUMN_NAME='dtFechaPosdata')
	ALTER TABLE dbo.TB_MovimientosContables ADD  dtFechaPosdata date NULL;

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_MovimientosContables' and COLUMN_NAME='nrCupon')
	ALTER TABLE dbo.TB_MovimientosContables ADD  nrCupon decimal(18, 0) NULL;

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_MovimientosContables' and COLUMN_NAME='IdConciliacion')
	ALTER TABLE dbo.TB_MovimientosContables ADD  IdConciliacion int  NULL

go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_procesarMovimientosPosdatados' )
	drop procedure  dbo.spu_procesarMovimientosPosdatados

go

create procedure spu_procesarMovimientosPosdatados (@nrCaja decimal , 
                                                    @dsUsuario [varchar](50))

as
begin
begin tran 
declare @max_id decimal(18,0)

	select @max_id = max(IdMovimiento)  + 1 from TB_MovimientosContables

	-- generamos movimiento para tarjeta de crédito
	select	[IdMovimiento]
			,[dsMovimiento]
			,x.[IdRecibo]
			,[IdProveedor]
			,[dsProveedor]
			,[cdConcepto]
			,[tpConcepto]
			,[dsConcepto]
			,[tpOperacion]
			,[vlPesos]
			,[vlDolares]
			,[vlEuros]
			,[nrRecibo]
			,[nrFactura]
			,[nrCaja]
			,x.[dsUsuario]
			,[dtMovimiento]
			,x.[dsObservacion]
			,[nrAnio]
			,[dsUsuario_Supervisor]
			,[nrCajaPuesto]
			,[tpCajaImputacion]
			,[dsUsuarioCajaPuesto]
			,[tpMovimiento]
			,[dtFechaPosdata]
			,x.[nrCupon]
			,[IdConciliacion]
			into #tmp_TB_MovimientosContablesPosdatados
	from TB_MovimientosContablesPosdatados x  inner join TB_Cupones y
							on x.nrCupon = y.nrCupon
			 where flProcesado = 0  and [dtFechaPosdata]<= getdate()  -- se gewnera el movimeiento
	group by y.tpCupon --// Agrupamos por tarjeta de Credito y Debito

	INSERT INTO [dbo].[TB_MovimientosContables]
           ([IdMovimiento]
           ,[dsMovimiento]
           ,[IdRecibo]
           ,[IdProveedor]
           ,[dsProveedor]
           ,[cdConcepto]
           ,[tpConcepto]
           ,[dsConcepto]
           ,[tpOperacion]
           ,[vlPesos]
           ,[vlDolares]
           ,[vlEuros]
           ,[nrRecibo]
           ,[nrFactura]
           ,[nrCaja]
           ,[dsUsuario]
           ,[dtMovimiento]
           ,[dsObservacion]
           ,[nrAnio]
           ,[dsUsuario_Supervisor]
           ,[nrCajaPuesto]
           ,[tpCajaImputacion]
           ,[dsUsuarioCajaPuesto]
           ,[tpMovimiento]
           ,[dtFechaPosdata]
           ,[nrCupon]
           ,[IdConciliacion])
	select [IdMovimiento]
           ,[dsMovimiento]
           ,[IdRecibo]
           ,[IdProveedor]
           ,[dsProveedor]
           ,[cdConcepto]
           ,[tpConcepto]
           ,[dsConcepto]
           ,[tpOperacion]
           ,[vlPesos]
           ,[vlDolares]
           ,[vlEuros]
           ,[nrRecibo]
           ,[nrFactura]
           ,[nrCaja]
           ,[dsUsuario]
           , getdate() as [dtMovimiento]
           ,[dsObservacion]
           ,[nrAnio]
           ,[dsUsuario_Supervisor]
           ,[nrCajaPuesto]
           ,[tpCajaImputacion]
           ,[dsUsuarioCajaPuesto]
           ,[tpMovimiento]
           ,[dtFechaPosdata]
           ,[nrCupon]
           ,[IdConciliacion]
	from #tmp_TB_MovimientosContablesPosdatados


	update x set x.flProcesado = 1 ,  dtProcesado = getdate() 
		from  TB_MovimientosContablesPosdatados x inner join #tmp_TB_MovimientosContablesPosdatados y 
								on x.IdMovimiento = y.IdMovimiento 

commit tran 

end

GO



