-- Cambios de DDL version 4.9.3
USE dbSG2000
go

if exists (SELECT * FROM sys.tables where name  ='TB_PresentacionesCAI' )
	drop table   dbo.TB_PresentacionesCAI

SET ANSI_PADDING ON
GO


CREATE TABLE [dbo].[TB_PresentacionesCAI](
	[IdPresentacion] [int] IDENTITY(1,1) NOT NULL,
	[nrAnio] [int] NULL,
	[nrMes] [int] NULL,
	[dtPresentacion] [date] NULL,
	[dsUsuario] [varchar](20) NULL,
	[flestado] [char](1) NULL,
	[dtModificacion] [datetime] NULL,
 CONSTRAINT [PK_TB_PresentacionesCAI] PRIMARY KEY CLUSTERED 
(
	[IdPresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


SET ANSI_PADDING OFF
GO


if exists (SELECT * FROM sys.tables where name  ='TB_PresentacionesCAIDetalle' )
	drop table   dbo.TB_PresentacionesCAIDetalle



CREATE TABLE [dbo].[TB_PresentacionesCAIDetalle](
	[IdPresentacion] [int] NOT NULL,
	[nrCAI] [char](20) NOT NULL,
	[nrUltNroComprobante] [int] NULL,
	[dtInsercion] [datetime] NULL,
 CONSTRAINT [PK_TB_TB_PresentacionesCAIDetalle] PRIMARY KEY CLUSTERED 
(
	[IdPresentacion] ASC,
	[nrCAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TB_PresentacionesCAIDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TB_PresentacionesCAIDetalle_TB_PresentacionesCAI] FOREIGN KEY([IdPresentacion])
REFERENCES [dbo].[TB_PresentacionesCAI] ([IdPresentacion])
GO

ALTER TABLE [dbo].[TB_PresentacionesCAIDetalle] CHECK CONSTRAINT [FK_TB_PresentacionesCAIDetalle_TB_PresentacionesCAI]
GO



if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtenerPresentacionCAIs' )
	drop procedure  dbo.spu_obtenerPresentacionCAIs

go


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---  exec  dbo.spu_obtieneDatosCITIVentas_v4_9 1, 2015
CREATE procedure  [dbo].[spu_obtenerPresentacionCAIs](@mes int, @anio int) 
as
begin
		

		IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'RTMP_auxiliarPermisosRenglones')
					DROP TABLE RTMP_auxiliarPermisosRenglones
		CREATE TABLE RTMP_auxiliarPermisosRenglones (Renglon VARCHAR(400))

		INSERT INTO RTMP_auxiliarPermisosRenglones (Renglon)
		/* Select TOP 10  convert(varchar, A.dtComprobante,112) as  fec_comp,  -- Fecha de Comprobante
				right( replicate('0',3) + dbo.UDF_obtenerCodDOC_CITIT(tpComprobante , tpLetra ),3) as  cod_citi,  -- Tipo de Comprobante
				right( replicate('0',5) + A.nrTalonario,5)  as  serie_comp,	-- Punto de Venta 
				right( replicate('0',20) + A.nrComprobante,20 ) as  nro_comp,   -- NUmero de Comprobante}
				right( replicate('0',20) + A.nrComprobante,20 ) as  nro_comphasta,   -- NUmero de Comprobante hasta
				case  tpIVA when 'RI'  then '80'  
							else '99'   END As cod_dgi,
				case tpIVA when 'RI'   then  replace(A.nrDoc,'-','') 
							else '00000000000' END As nro_dgi,  --- Código del Documento del Comprador
				Left (  case tpIVA when 'RI'  then A.dsRazonSocial  
				else 'Consumidor Final' END   + Replicate(' ',30) , 30)  as nom_tit,  -- Nombre y Apellido del Comprador
		--vlTotalGeneral,
		dbo.UDF_obtenerFormatoNumericoAFIP ( vlTotalGeneral, 15, 2)      As imp_total,     --  importe total del operacion
		dbo.UDF_obtenerFormatoNumericoAFIP (ABS(isnull(A.vlSubtotal,0)),15,2) As imp_neto_no_grabado,				--  importe total conceptos que no integran el neto gravado		
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2) As imp_perc_no_cate,						--  percepcion a no categorizados
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2) As imp_exen,						--  importe operaciones exentas
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2) As imp_perc_ctas ,				--  importe percepciones o pagos a ctas impuestos nacionales
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2) As imp_perc_iibb ,				--  importe percepciones de ingresos brutos
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2) As imp_perc_ip ,					--  importe percepciones de impuestos municipales
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2) As imp_impuestos_internos ,		--  importe impuestos internos
		'PES'      as cod_moneda,					--  codigo de moneda
		dbo.UDF_obtenerFormatoNumericoAFIP (1,10,6)	   as tipo_cambio,			        --  tipo de cambio
		'v'      as cant_alicuotas_iva,			--  cantidad alicuotas iva  
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2)      as otros_tributos,			    --  otros tributos
		convert(varchar, A.dtComprobante + 10,112)  as fecha_venc -- fecha de vencimiento de pago 
		FROM TB_Comprobantes A 
		WHERE month(A.dtComprobante) = @mes  and year(A.dtComprobante) = @anio
		
		SELECT  dbo.UDF_obtenerFormatoCUITAFIP(30501032545,20)  
		*/ 

		Select top 10  convert(varchar, A.dtComprobante,112) -- as  fec_comp,  -- Fecha de Comprobante
				+ right( replicate('0',3) + dbo.UDF_obtenerCodDOC_CITIT_v4_7(tpComprobante , tpLetra ),3) --  as  cod_citi,  -- Tipo de Comprobante
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( A.nrTalonario,5,0)  --  as  serie_comp,	-- Punto de Venta 
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (rtrim( A.nrComprobante),20,0 )--  as  nro_comp,   -- NUmero de Comprobante}
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (rtrim(  A.nrComprobante),20,0) -- as  nro_comphasta,   -- NUmero de Comprobante hasta
				+ case  tpIVA when 'RI'  then (case WHEN dbo.ufn_ValidarCUIT(A.nrDoc)=1 then '80' ELSE '99' END)
							else (CASE WHEN a.vlTotalGeneral > 999 THEN	'80' ELSE   '99'  END )    END -- As cod_dgi,
				--, A.nrDoc
				--, A.vlTotalGeneral, 
				+  case tpIVA when 'RI' then (case WHEN dbo.ufn_ValidarCUIT(A.nrDoc)=1 then dbo.UDF_obtenerFormatoCUITAFIP_v4_7(A.nrDoc,20) ELSE REPLICATE('0',20) END)   
				    else ((CASE WHEN a.vlTotalGeneral > 999 THEN	dbo.UDF_obtenerFormatoCUITAFIP_v4_7(A.nrDoc,20) ELSE    REPLICATE('0',20) END) ) END -- As nro_dgi,  --- Código del Documento del Comprador
				+ Left (  case tpIVA when 'RI'  then A.dsRazonSocial   
				else (CASE WHEN a.vlTotalGeneral > 999 THEN	A.dsRazonSocial   ELSE   'Consumidor Final'   END) END   + Replicate(' ',30) , 30) --  as nom_tit,  -- Nombre y Apellido del Comprador
		--vlTotalGeneral,
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (vlTotalGeneral, 15, 2)   --    As imp_total,     --  importe total del operacion
		+ CASE isnull(a.vlIVA,0) WHEN 0 THEN dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (vlTotalGeneral,15,2) ELSE dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0 ,15,2) END --  ,	--  importe total conceptos que no integran el neto gravado		
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_no_cate,						--  percepcion a no categorizados
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_exen,						--  importe operaciones exentas
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_ctas ,				--  importe percepciones o pagos a ctas impuestos nacionales
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_iibb ,				--  importe percepciones de ingresos brutos
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_ip ,					--  importe percepciones de impuestos municipales
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_impuestos_internos ,		--  importe impuestos internos
		+ 'PES'      -- as cod_moneda,					--  codigo de moneda
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (1,10,6)	--    as tipo_cambio,			        --  tipo de cambio
		+ '1'     -- as cant_alicuotas_iva,			--  cantidad alicuotas iva  
		+ case isnull(a.vlIVA,0) WHEN 0 THEN 'N' ELSE ' '   End  -- as codigo de operacion,			--  codigo de operacion
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2)     --  as otros_tributos,			    --  otros tributos
		+ convert(varchar, DATEADD (day, 10,  A.dtComprobante ) ,112) --  as fecha_venc -- fecha de vencimiento de pago 
		FROM TB_Comprobantes A 
		WHERE month(A.dtComprobante) = @mes    and year(A.dtComprobante) = @anio 
		AND tpLetra <>'X' 
		

		-- select Renglon  from dbSG2000.dbo.RTMP_auxiliarPermisosRenglones

		declare @nombre_archivo varchar(255)=  'CITIVentas_' + convert(varchar,@anio) + right('0' + convert(varchar,@mes), 2) + '.txt'

		exec  [dbo].[spu_generarArchivo_v4_8] @sql_select = 'select Renglon  from dbSG2000.dbo.RTMP_auxiliarPermisosRenglones' , @nombre_archivo = @nombre_archivo

		return 0; 


end 


GO





if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtenerUltNroCAIsUsados' )
	drop procedure  dbo.spu_obtenerUltNroCAIsUsados

go


---------------------------------------------------------------------------
---  exec  dbo.spu_obtenerUltNroCAIsUsados 1, 2017
ALTER procedure  [dbo].[spu_obtenerUltNroCAIsUsados](@mes int, @anio int) 
as
begin
		

		Select  @anio as Anio,
				@mes  as Mes,
				A.nrTalonario as PDV,
				tpLetra       as Letra, 
				a.nrCAI		  as CAI, 
				max(A.nrComprobante) as UltNroComprobante
		FROM TB_Comprobantes A 
		WHERE month(A.dtComprobante) = @mes    and year(A.dtComprobante) = @anio 
				AND tpLetra <>'X'  and nrCAI is not null
				GROUP BY A.nrTalonario , tpLetra, nrCAI 

		return 0; 

end 
