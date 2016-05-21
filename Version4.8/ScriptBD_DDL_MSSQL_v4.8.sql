-- Cambios de DDL version 4.8
use dbSG2000
go

sp_helptext 'dbo.ufn_ValidarCUIT'


select dbo.ufn_ValidarCUIT ('1792463661001')

go

Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create function dbo.ufn_ValidarCUIT (@cuit varchar(13))
returns  bit
as

begin
declare @verificador int
declare @resultado int = 0
declare @cuit_nro varchar(11)
declare @validacion bit
declare @codes varchar(10) = '6789456789'

	set @cuit_nro = REPLACE(@cuit, '-', '')

	if isnumeric(@cuit_nro) <> 1
	begin
		return 0
	end

	if len(@cuit_nro) <> 11
	begin
		set @validacion = 0
	end

	set @verificador = RIGHT(@cuit_nro, 1)

	declare @x int = 0

	while @x < 10
	begin
		declare @digitoValidador int = convert(int, substring(@codes, @x + 1, 1))
		declare @digito int = convert(int, substring(@cuit_nro, @x + 1, 1))
		declare @digitoValidacion int = @digitoValidador * @digito
		set @resultado = @resultado + @digitoValidacion
		set @x = @x + 1
	end

	set @resultado = @resultado % 11

	If @resultado = @verificador
	begin
		set @validacion = 1
	end
	else
	begin
		set @validacion = 0
	End

	return @validacion
end
go

-- Mejora de Perfomance ALTER TABLE TB_Comprobantes ALTER COLUMN dtComprobante date



if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtieneDatosCITIVentas_v4_8' )
	drop procedure  dbo.spu_obtieneDatosCITIVentas_v4_8
	

go

---  exec  dbo.spu_obtieneDatosCITIVentas_v4_8 3, 2015

create procedure  dbo.spu_obtieneDatosCITIVentas_v4_8(@mes int, @anio int) 
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
		dbo.UDF_obtenerFormatoNumericoAFIP (ABS(isnull(A.vlIVA,0)),15,2) As imp_iva,				--  importe total conceptos que no integran el neto gravado		
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
				+ case  tpIVA when 'RI'  then (case WHEN dbo.ufn_ValidarCUIT(A.nrDoc)=1 then '80' ELSE '99' END)
							else (CASE WHEN a.vlTotalGeneral > 999 THEN	'80' ELSE   '99'  END )    END -- As cod_dgi,
				--, A.nrDoc
				--, A.vlTotalGeneral, 
				+  case tpIVA when 'RI'    then (case WHEN dbo.ufn_ValidarCUIT(A.nrDoc)=1 then dbo.UDF_obtenerFormatoCUITAFIP_v4_7(A.nrDoc,20) ELSE REPLICATE('0',20) END)   
				    else ((CASE WHEN a.vlTotalGeneral > 999 THEN	dbo.UDF_obtenerFormatoCUITAFIP_v4_7(A.nrDoc,20) ELSE    REPLICATE('0',20) END) ) END -- As nro_dgi,  --- Código del Documento del Comprador
				+ Left (  case tpIVA when 'RI'  then A.dsRazonSocial   
				else (CASE WHEN a.vlTotalGeneral > 999 THEN	A.dsRazonSocial   ELSE   'Consumidor Final'   END) END   + Replicate(' ',30) , 30) --  as nom_tit,  -- Nombre y Apellido del Comprador
		--vlTotalGeneral,
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( vlTotalGeneral, 15, 2)   --    As imp_total,     --  importe total del operacion
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (ABS(isnull(A.vlIVA,0)),15,2) --  As imp_iva,				--  importe total conceptos que no integran el neto gravado		
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_no_cate,						--  percepcion a no categorizados
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_exen,						--  importe operaciones exentas
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_ctas ,				--  importe percepciones o pagos a ctas impuestos nacionales
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_iibb ,				--  importe percepciones de ingresos brutos
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_ip ,					--  importe percepciones de impuestos municipales
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_impuestos_internos ,		--  importe impuestos internos
		+ 'PES'      -- as cod_moneda,					--  codigo de moneda
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (1,10,6)	--    as tipo_cambio,			        --  tipo de cambio
		+ '1'     -- as cant_alicuotas_iva,			--  cantidad alicuotas iva  
		+ ' '     -- as cant_alicuotas_iva,			--  codigo de operacion
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2)     --  as otros_tributos,			    --  otros tributos
		+ convert(varchar, DATEADD (day, 10,  A.dtComprobante ) ,112) --  as fecha_venc -- fecha de vencimiento de pago 
		FROM TB_Comprobantes A 
		WHERE month(A.dtComprobante) = @mes    and year(A.dtComprobante) = @anio 
		-- AND  (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI') and  dbo.ufn_ValidarCUIT('20-25475222-4')
		--AND not (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI')  
		AND tpLetra <>'X' 
		AND A.nrComprobante =  '00004668' and A.nrTalonario = '0006'
		

	    select Renglon  from dbSG2000.dbo.RTMP_auxiliarPermisosRenglones

		declare @nombre_archivo varchar(255)=  'CITIVentas_' + convert(varchar,@anio) + right('0' + convert(varchar,@mes), 2) + '.txt'

		exec  [dbo].[spu_generarArchivo_v4_8] @sql_select = 'select Renglon  from dbSG2000.dbo.RTMP_auxiliarPermisosRenglones' , @nombre_archivo = @nombre_archivo

		return 0; 


end 


go

go





go


-- To allow advanced options to be changed.
EXEC sp_configure 'show advanced options', 1;
GO
-- To update the currently configured value for advanced options.
RECONFIGURE;
GO
-- To enable the feature.
EXEC sp_configure 'xp_cmdshell', 1;
GO
-- To update the currently configured value for this feature.
RECONFIGURE;
GO


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_generarArchivo_v4_8' )
	drop procedure  [dbo].[spu_generarArchivo_v4_8]


go


--   exec  [dbo].[spu_generarArchivo] @sql_select = 'select nmNombre +'' ''+ nmApellido from  dbSG2000.DBO.TB_Proveedores'
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[spu_generarArchivo_v4_8]
(
	@sql_select      VARCHAR(400),
	@ruta_archivo	 VARCHAR(400) = 'C:\Gestion\AFIP\',
	@nombre_archivo  VARCHAR(80)='salidaAFIP.txt'
)
AS
BEGIN 

		DECLARE @query VARCHAR(500)
		
		
	
		SET @query = 'bcp "' + @sql_select + '" queryout '+@ruta_archivo+@nombre_archivo+' -c -t -T' 
		print @query
		EXEC xp_cmdshell @query, NO_OUTPUT 

END


