-- Cambios de DDL version 4.9.3
USE dbSG2000
go


if exists (SELECT * FROM  INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='UDF_obtenerCampoAFIP_cod_dgi_v4_9' )
	drop function  dbo.UDF_obtenerCampoAFIP_cod_dgi_v4_9
GO

CREATE  FUNCTION [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9] (@tpIVA  varchar(4) , 
												@nrDoc as varchar(100), @vlTotalGeneral as float  )
RETURNS varchar(50)
BEGIN
declare @valor_retorno char(2) = '99' 


IF  @tpIVA = 'RI'  
BEGIN
	IF  dbo.ufn_ValidarCUIT(@nrDoc)=1
		set @valor_retorno = '80'
	ELSE
		IF ISNULL(rtrim(@nrDoc),'')='' 
			set @valor_retorno = '99'  -- VERIFICAR ESTA SITUACION
END
BEGIN
	IF ISNULL(rtrim(@nrDoc),'') = ''
		set @valor_retorno = '99' 
	ELSE
	BEGIN
		IF dbo.ufn_ValidarCUIT(@nrDoc)=1
			set @valor_retorno = '80'
		ELSE 
			set @valor_retorno = '80'
	END
END

/* 
@valor_retorno = case  @tpIVA when 'RI'  
							  then (case WHEN dbo.ufn_ValidarCUIT(@nrDoc)=1 
								THEN '80' ELSE  (CASE ISNULL(rtrim(@nrDoc),'') WHEN ''   
										                                       THEN '99' ELSE '90' END)   END)
							   else     (CASE ISNULL(rtrim(@nrDoc),'') WHEN ''   THEN '99' ELSE 
											 (CASE WHEN @vlTotalGeneral > 999  
												THEN	 (case WHEN dbo.ufn_ValidarCUIT(@nrDoc)=1
														       THEN '80' 
															   ELSE '90' END) ELSE   '90'  END ) END)    END  -- As cod_dgi,

*/ 

	RETURN @valor_retorno
END

go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtieneDatosCITIVentas_v4_9' )
	drop procedure  dbo.spu_obtieneDatosCITIVentas_v4_9
GO


--- exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9] @mes = 11 , @anio = 2016

create procedure  [dbo].[spu_obtieneDatosCITIVentas_v4_9](@mes int, @anio int) 
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
							else '90'   END As cod_dgi,
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

		Select  convert(varchar, A.dtComprobante,112) -- as  fec_comp,  -- Fecha de Comprobante
				+ right( replicate('0',3) + dbo.UDF_obtenerCodDOC_CITIT_v4_7(tpComprobante , tpLetra ),3) --  as  cod_citi,  -- Tipo de Comprobante
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( A.nrTalonario,5,0)  --  as  serie_comp,	-- Punto de Venta 
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (rtrim( A.nrComprobante),20,0 )--  as  nro_comp,   -- NUmero de Comprobante}
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (rtrim(  A.nrComprobante),20,0) -- as  nro_comphasta,   -- NUmero de Comprobante hasta
				+ [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9](A.tpIVA, A.nrDoc , A.vlTotalGeneral ) -- As nro_dgi,  --- Código del Documento del Comprador
				+ Left (  case tpIVA when 'RI'  then A.dsRazonSocial   
				else (CASE WHEN a.vlTotalGeneral > 999 THEN	A.dsRazonSocial   ELSE   'Consumidor Final'   END) END   + Replicate(' ',30) , 30) --  as nom_tit,  -- Nombre y Apellido del Comprador
		--vlTotalGeneral,
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (a.vlTotalGeneral, 15, 2)   --    As imp_total,     --  importe total del operacion
		+ CASE isnull(a.vlIVA,0) WHEN 0 THEN dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (a.vlTotalGeneral,15,2) ELSE dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0 ,15,2) END --  ,	--  importe total conceptos que no integran el neto gravado		
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
		-- AND  (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI') and  dbo.ufn_ValidarCUIT('20-25475222-4')
		--AND not (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI')  
		AND tpLetra <>'X'  and flEliminar <> 1
		-- AND a.nrComprobante = '00602178' 

		-- select Renglon  from dbSG2000.dbo.RTMP_auxiliarPermisosRenglones

		declare @nombre_archivo varchar(255)=  'CITIVentas_' + convert(varchar,@anio) + right('0' + convert(varchar,@mes), 2) + '.txt'

		exec  [dbo].[spu_generarArchivo_v4_8] @sql_select = 'select Renglon  from dbSG2000.dbo.RTMP_auxiliarPermisosRenglones' , @nombre_archivo = @nombre_archivo

		return 0; 


end 

