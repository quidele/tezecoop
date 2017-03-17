-- Cambios de DDL version 4.9.3
USE dbSG2000
GO



if exists (SELECT * FROM  INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='ufn_ValidarCUIT_v4_10' )
	drop function  dbo.ufn_ValidarCUIT_V4_10

GO

create function dbo.ufn_ValidarCUIT_v4_10 (@cuit varchar(13))
returns  bit
as

begin
declare @verificador int
declare @resultado int = 0
declare @cuit_nro varchar(11)
declare @validacion bit
declare @codes varchar(10) = '6789456789'

	IF @cuit IS NULL 
		RETURN 0
		 
	set @cuit_nro = REPLACE(RTRIM(@cuit), '-', '')

	if isnumeric(@cuit_nro) <> 1
	begin
		return 0
	end



	if len(@cuit_nro) <> 11
	begin
		set @validacion = 0
		return @validacion
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


if exists (SELECT * FROM  INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='UDF_obtenerCodDOC_CITIT_v4_10' )
	drop function  dbo.UDF_obtenerCodDOC_CITIT_v4_10

GO

CREATE FUNCTION dbo.UDF_obtenerCodDOC_CITIT_v4_10 (@tpComprobante char(2), @tpLetra char(1), @escuitOK int )
RETURNS varchar(2)
AS
BEGIN
	declare @codigo_CITI varchar(2)
	set @codigo_CITI = 0
	if @escuitOK =  1
	BEGIN
		select @codigo_CITI =  case 
					 WHEN @tpComprobante = 'FA' AND @tpLetra =  'A'  THEN  1
					 WHEN @tpComprobante = 'ND' AND @tpLetra =  'A'  THEN  2
					 WHEN @tpComprobante = 'NC' AND @tpLetra =  'A'  THEN  3
					 WHEN @tpComprobante = 'FA' AND @tpLetra =  'B'  THEN  6
					 WHEN @tpComprobante = 'ND' AND @tpLetra =  'B'  THEN  7		 
					 WHEN @tpComprobante = 'NC' AND @tpLetra =  'B'  THEN  8
					 WHEN @tpComprobante = 'A' AND @tpLetra =  'A'  THEN  1
					 WHEN @tpComprobante = 'A' AND @tpLetra =  'A'  THEN  1
					 WHEN @tpComprobante = 'A' AND @tpLetra =  'A'  THEN  1
					 WHEN @tpComprobante = 'B' AND @tpLetra =  'B'  THEN  6
					 WHEN @tpComprobante = 'B' AND @tpLetra =  'B'  THEN  6
					 WHEN @tpComprobante = 'B' AND @tpLetra =  'B'  THEN  6
					 WHEN @tpComprobante = 'FA' AND @tpLetra =  'M'  THEN  51
					END
			return @codigo_CITI
	END


	if @escuitOK =  0
	BEGIN
		select @codigo_CITI =  case 
					 WHEN @tpComprobante = 'FA' AND @tpLetra =  'A'  THEN  6
					 WHEN @tpComprobante = 'ND' AND @tpLetra =  'A'  THEN  7
					 WHEN @tpComprobante = 'NC' AND @tpLetra =  'A'  THEN  8
					 WHEN @tpComprobante = 'FA' AND @tpLetra =  'B'  THEN  6
					 WHEN @tpComprobante = 'ND' AND @tpLetra =  'B'  THEN  7		 
					 WHEN @tpComprobante = 'NC' AND @tpLetra =  'B'  THEN  8
					 WHEN @tpComprobante = 'A' AND @tpLetra =  'A'  THEN  1
					 WHEN @tpComprobante = 'A' AND @tpLetra =  'A'  THEN  1
					 WHEN @tpComprobante = 'A' AND @tpLetra =  'A'  THEN  1
					 WHEN @tpComprobante = 'B' AND @tpLetra =  'B'  THEN  6
					 WHEN @tpComprobante = 'B' AND @tpLetra =  'B'  THEN  6
					 WHEN @tpComprobante = 'B' AND @tpLetra =  'B'  THEN  6
					 WHEN @tpComprobante = 'FA' AND @tpLetra =  'M'  THEN  51
					END
			return @codigo_CITI
	END
	
	return @codigo_CITI
END


Go


if exists (SELECT * FROM  INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='UDF_obtenerCampoAFIP_cod_dgi_v4_9' )
	drop function  dbo.UDF_obtenerCampoAFIP_cod_dgi_v4_9

GO


--  select   [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9] ('CF' , '20100177341         ','580')
CREATE  FUNCTION [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9] (@tpIVA  varchar(4) ,  @nrDoc as varchar(100), @vlTotalGeneral as float  )
RETURNS varchar(50)
BEGIN
declare @valor_retorno char(2) = '99' 


IF  @tpIVA = 'RI'  
BEGIN
	IF  dbo.ufn_ValidarCUIT_V4_10(@nrDoc)=1
		set @valor_retorno = '80'
	ELSE
			set @valor_retorno = '90'  -- VERIFICAR ESTA SITUACION
END
BEGIN
	IF ISNULL(rtrim(@nrDoc),'') = ''
	BEGIN
		IF @vlTotalGeneral > 999 
			SET  @valor_retorno = '90' 
		ELSE
			SET  @valor_retorno = '99' 
	END
	ELSE
	BEGIN
		IF dbo.ufn_ValidarCUIT_V4_10(@nrDoc)=1
			set @valor_retorno = '80'
		ELSE 
			set @valor_retorno = '90'
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

/* +  case tpIVA when 'RI'    then (case WHEN dbo.ufn_ValidarCUIT(A.nrDoc)=1 then dbo.UDF_obtenerFormatoCUITAFIP_v4_7(A.nrDoc,20) ELSE REPLICATE('0',20) END)   
   else ((CASE WHEN a.vlTotalGeneral > 999 THEN	dbo.UDF_obtenerFormatoCUITAFIP_v4_7(A.nrDoc,20) ELSE    REPLICATE('0',20) END) ) END -- As nro_dgi,  --- C�digo del Documento del Comprador
*/


--  select   [dbo].[UDF_obtenerCampoAFIP_nro_dgi_v4_10] ('CF' , '20100177341         ','580')


if exists (SELECT * FROM  INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='UDF_obtenerCampoAFIP_nro_dgi_v4_10' )
	drop function  dbo.UDF_obtenerCampoAFIP_nro_dgi_v4_10
GO

CREATE  FUNCTION [dbo].UDF_obtenerCampoAFIP_nro_dgi_v4_10 (@tpIVA  varchar(4) , 
												@nrDoc as varchar(100), @vlTotalGeneral as float  )
RETURNS char(20)
BEGIN
declare @valor_retorno char(20) =''

select @nrDoc = replace(replace(rtrim(@nrDoc),'.',''),'-','')

IF [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9] (@tpIVA, @nrDoc,@vlTotalGeneral) = '90'
BEGIN
	IF @nrDoc = '' and @nrDoc is not null 
		SET @valor_retorno = dbo.UDF_obtenerFormatoCUITAFIP_v4_7(@nrDoc,20) 
	ELSE
		set @valor_retorno =  dbo.UDF_obtenerFormatoCUITAFIP_v4_7('20254752224',20)   -- VERIFICAR ESTA SITUACION
Return @valor_retorno
END

IF  @tpIVA = 'RI'  
BEGIN
	IF  dbo.ufn_ValidarCUIT_V4_10(@nrDoc)=1
		set @valor_retorno = dbo.UDF_obtenerFormatoCUITAFIP_v4_7(@nrDoc,20) 
	ELSE
		set @valor_retorno =  dbo.UDF_obtenerFormatoCUITAFIP_v4_7('20254752224',20)   -- VERIFICAR ESTA SITUACION
END
BEGIN
	IF @vlTotalGeneral > 999  
	BEGIN
		IF dbo.ufn_ValidarCUIT_V4_10(@nrDoc) = 1 
		BEGIN
			set @valor_retorno = dbo.UDF_obtenerFormatoCUITAFIP_v4_7(@nrDoc,20) 
		END 
		ELSE BEGIN
			set @valor_retorno =  dbo.UDF_obtenerFormatoCUITAFIP_v4_7('20254752224',20)   -- VERIFICAR ESTA SITUACION
		END
	END
	ELSE
	BEGIN
		set @valor_retorno =  dbo.UDF_obtenerFormatoCUITAFIP_v4_7(@nrDoc,20) 
	END

END

	RETURN @valor_retorno


	 /* case tpIVA when 'RI'    then (case WHEN dbo.ufn_ValidarCUIT(A.nrDoc)=1 then dbo.UDF_obtenerFormatoCUITAFIP_v4_7(A.nrDoc,20) ELSE REPLICATE('0',20) END)   
				    else ((CASE WHEN a.vlTotalGeneral > 999 THEN	dbo.UDF_obtenerFormatoCUITAFIP_v4_7(A.nrDoc,20) 
					ELSE    REPLICATE('0',20) END) ) END -- As nro_dgi, 																								  
	*/

END

GO

go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtieneDatosCITIVentas_v4_10' )
	drop procedure  dbo.spu_obtieneDatosCITIVentas_v4_10
GO


/*
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9] @mes = 11 , @anio = 2016 
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_10] @mes = 11 , @anio = 2016 , @renglon = -1

  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_10] @mes = 11 , @anio = 2016 , @renglon = 465

  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_10] @mes = 11 , @anio = 2016 , @renglon = 1638


 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_10] @mes = 11 , @anio = 2016 , @renglon = 182

 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_10] @mes = 11 , @anio = 2016 , @renglon = 6184


 
 
select 
	[dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9] (tpIVA,  nrDoc, vlTotalGeneral ), 
	[dbo].UDF_obtenerCampoAFIP_nro_dgi_v4_10  (tpIVA,  nrDoc, vlTotalGeneral ), *
 from TB_Comprobantes  where nrTalonario  = '0009' and nrComprobante = '00034008'
 

 select dbo.ufn_ValidarCUIT_V4_10('0104162359          ')
 select dbo.ufn_ValidarCUIT_V4_10( '19026155            '  )


 select '0104162359          ' 

 select [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9] ('CF',  '19026155            '          , 1030)


*/


create procedure  [dbo].[spu_obtieneDatosCITIVentas_v4_10](@mes int, @anio int , @renglon int = -1) 
as
begin

declare @nro_linea decimal(18,0) = 0

		IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'RTMP_auxiliarPermisosRenglones_v4_10')
					DROP TABLE RTMP_auxiliarPermisosRenglones_v4_10

		CREATE TABLE RTMP_auxiliarPermisosRenglones_v4_10 (nro_linea decimal(18,0) , Renglon VARCHAR(400)  )

		IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'RTMP_auxiliarPermisosRenglones_v4_10_final')
					DROP TABLE RTMP_auxiliarPermisosRenglones_v4_10_final


		INSERT INTO RTMP_auxiliarPermisosRenglones_v4_10 (nro_linea , Renglon)
		/* Select TOP 10  convert(varchar, A.dtComprobante,112) as  fec_comp,  -- Fecha de Comprobante
				right( replicate('0',3) + dbo.UDF_obtenerCodDOC_CITIT(tpComprobante , tpLetra ),3) as  cod_citi,  -- Tipo de Comprobante
				right( replicate('0',5) + A.nrTalonario,5)  as  serie_comp,	-- Punto de Venta 
				right( replicate('0',20) + A.nrComprobante,20 ) as  nro_comp,   -- NUmero de Comprobante}
				right( replicate('0',20) + A.nrComprobante,20 ) as  nro_comphasta,   -- NUmero de Comprobante hasta
				case  tpIVA when 'RI'  then '80'  
							else '90'   END As cod_dgi,
				case tpIVA when 'RI'   then  replace(A.nrDoc,'-','') 
							else '00000000000' END As nro_dgi,  --- C�digo del Documento del Comprador
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

		
		Select  ROW_NUMBER() OVER ( ORDER BY dtComprobante DESC )   ,  convert(varchar, A.dtComprobante,112) -- as  fec_comp,  -- Fecha de Comprobante
				+ right( replicate('0',3) + dbo.UDF_obtenerCodDOC_CITIT_v4_10(tpComprobante , tpLetra, dbo.ufn_ValidarCUIT_V4_10(A.nrDoc)),3) --  as  cod_citi,  -- Tipo de Comprobante
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( A.nrTalonario,5,0)  --  as  serie_comp,	-- Punto de Venta 
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (rtrim( A.nrComprobante),20,0 )--  as  nro_comp,   -- NUmero de Comprobante}
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (rtrim(  A.nrComprobante),20,0) -- as  nro_comphasta,   -- NUmero de Comprobante hasta
				+ [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9](A.tpIVA, A.nrDoc , A.vlTotalGeneral ) -- As cod_dgi,  --- C�digo del Documento del Comprador
				-- +'EULISES'+
				+ [dbo].UDF_obtenerCampoAFIP_nro_dgi_v4_10 (A.tpIVA, A.nrDoc , A.vlTotalGeneral ) -- As nro_dgi,  --- Documento del Comprador
				+ Left (CASE tpIVA when 'RI'  then A.dsRazonSocial   ELSE (CASE WHEN a.vlTotalGeneral > 999 THEN	A.dsRazonSocial   
						ELSE   'Consumidor Final'   END) END   + Replicate(' ',30) , 30) --  as nom_tit,  -- Nombre y Apellido del Comprador
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


		select * INTO RTMP_auxiliarPermisosRenglones_v4_10_final from  RTMP_auxiliarPermisosRenglones_v4_10
		where (nro_linea = @renglon  OR @renglon = -1)
		-- select Renglon  from dbSG2000.dbo.RTMP_auxiliarPermisosRenglones
		if @renglon <> -1 
		begin 
			select * from RTMP_auxiliarPermisosRenglones_v4_10_final
		end 

		declare @nombre_archivo varchar(255)=  'CITIVentas_' + convert(varchar,@anio) + right('0' + convert(varchar,@mes), 2) + '.txt'

		exec  [dbo].[spu_generarArchivo_v4_8] @sql_select = 'select Renglon  from dbSG2000.dbo.RTMP_auxiliarPermisosRenglones_v4_10_final  ' , @nombre_archivo = @nombre_archivo

		return 0; 


end 
