
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

	
