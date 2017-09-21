
-- Cambios de DDL version 4.9.900
use dbSG2000
go




if  exists (SELECT * FROM sys.tables where name ='TB_documentos' )
	DROP TABLE [TB_documentos]
GO


SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
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


/**

	La conciliación para AMCA graba la cuenta corriente con el documento CONC numero de conciliación
	con la cantidad de dinero que se le debe pagar de comision
	1 Registro para ingreso de dinero para Caja Adm, por la Diferencia

	
**/


IF EXISTS (SELECT * FROM SYS.objects   WHERE NAME = 'spu_obtenerDeudoresaFecha')
BEGIN
	DROP procedure  dbo.spu_obtenerDeudoresaFecha
END


GO

--- EXEC  dbo.spu_obtenerDeudoresaFecha '20170101'


CREATE PROCEDURE dbo.spu_obtenerDeudoresaFecha (@fecha as date) 
AS
BEGIN

	SELECT top 10   tpCupon  ,  count(*) as cantidad  , sum(vlMontoCupon) as sumavlMontoCupon
	FROM TB_Cupones  WHERE convert(date,dtCobradoalCliente) > @fecha
	GROUP BY tpCupon

END


GO

	
--exec [dbo].[spu_conciliarAutomaticamente_v4_9_900] @idArchivo=414
-- exec [dbo].[spu_conciliarAutomaticamente_v4_9_900] @idArchivo=416

if NOT EXISTS (select * from sys.procedures where name  = 'spu_conciliarAutomaticamente_bkp_antes_v4_9_900') 
	EXEC sp_rename 'spu_conciliarAutomaticamente' , 'spu_conciliarAutomaticamente_bkp_antes_v4_9_900'
-- drop procedure spu_conciliarAutomaticamente_bkp_antes_v4_9_900
/*
sp_help 'dbo.spu_conciliarAutomaticamente'
sp_help 'dbo.spu_conciliarAutomaticamente_bkp_antes_v4_9_900'
*/
GO

IF   EXISTS (select * from sys.procedures where name  = 'spu_conciliarAutomaticamente') 
BEGIN
	DROP PROCEDURE  dbo.spu_conciliarAutomaticamente
END

GO

create procedure dbo.spu_conciliarAutomaticamente (@idArchivo int) 
as
begin 
DECLARE @formato VARCHAR(10)

	/* select 'OK' as resultado , 'en el store debemos desarrollar toda la logica de la conciliacion' descripcion_error 
	return; 
	-- SP_HELP 'TB_ArchivoTarjetaDetalle'
	drop table #tmpArchivoaConciliar
	drop table #tmpViajesesaConciliar
	drop table #tmpViajesConciliados 
	*/

	
	SELECT @formato = formato 
			  FROM TB_ArchivoTarjeta WHERE id = @idArchivo



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
                           and   ((tpCupon in  ('Tarjeta de Crédito', 'Tarjeta de Débito')   and  @formato <>'AMCA' ) 
									OR
								   (tpCupon in  ('Todo Pago')   and  @formato = 'AMCA' )) 
								   
						   -- falta agregar que no haya sido conciliado anteriormente 
    
	/* 
	select * from #tmpViajesesaConciliar
	return;
	*/

	update #tmpViajesesaConciliar  set nrCuponPosnet_numerico = convert(int,replace(nrCuponPosnet, '.','')) where ISNUMERIC(replace(nrCuponPosnet,'.','')) = 1
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
	 
	
	select 'OK' as resultado , 'EULISES' descripcion_error 

end


