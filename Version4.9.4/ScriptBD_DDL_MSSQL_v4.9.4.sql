-- Cambios de DDL version 4.9.4
USE dbSG2000
GO



if exists (SELECT * FROM  INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='ufn_ValidarCUIT_v4_9_4' )
	drop function  dbo.ufn_ValidarCUIT_v4_9_4

GO

create function dbo.ufn_ValidarCUIT_v4_9_4 (@cuit varchar(13))
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


if exists (SELECT * FROM  INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='UDF_obtenerCodDOC_CITIT_v4_9_4' )
	drop function  dbo.UDF_obtenerCodDOC_CITIT_v4_9_4

GO

CREATE FUNCTION dbo.UDF_obtenerCodDOC_CITIT_v4_9_4 (@tpComprobante char(2), @tpLetra char(1), @escuitOK int = 1)
RETURNS varchar(2)
AS
BEGIN
	declare @codigo_CITI varchar(2)
	set @codigo_CITI = 0
	--if @escuitOK =  1
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

	-- NUNCA SE VA A LLEGAR ACA

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
	IF  dbo.ufn_ValidarCUIT_v4_9_4(@nrDoc)=1
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
		IF dbo.ufn_ValidarCUIT_v4_9_4(@nrDoc)=1
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
   else ((CASE WHEN a.vlTotalGeneral > 999 THEN	dbo.UDF_obtenerFormatoCUITAFIP_v4_7(A.nrDoc,20) ELSE    REPLICATE('0',20) END) ) END -- As nro_dgi,  --- Código del Documento del Comprador
*/


--  select   [dbo].[UDF_obtenerCampoAFIP_nro_dgi_v4_9_4] ('CF' , '20100177341         ','580')


if exists (SELECT * FROM  INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='UDF_obtenerCampoAFIP_nro_dgi_v4_9_4' )
	drop function  dbo.UDF_obtenerCampoAFIP_nro_dgi_v4_9_4
GO

CREATE  FUNCTION [dbo].UDF_obtenerCampoAFIP_nro_dgi_v4_9_4 (@tpIVA  varchar(4) , 
												@nrDoc as varchar(100), @vlTotalGeneral as float  )
RETURNS char(20)
BEGIN
declare @valor_retorno char(20) =''
declare @cod_dgi char(2) =''

select @nrDoc = replace(replace(rtrim(@nrDoc),'.',''),'-','')

select @cod_dgi = [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9] (@tpIVA, @nrDoc,@vlTotalGeneral) 

IF @cod_dgi = '90'
BEGIN
	IF @nrDoc = '' and @nrDoc is  null 
		set @valor_retorno =  dbo.UDF_obtenerFormatoCUITAFIP_v4_7('99999999999',20)   -- VERIFICAR ESTA SITUACION
	ELSE
		SET @valor_retorno = dbo.UDF_obtenerFormatoCUITAFIP_v4_7(@nrDoc,20) 

	IF  @valor_retorno = '00000000000000000000' 
	BEGIN
		set @valor_retorno =  dbo.UDF_obtenerFormatoCUITAFIP_v4_7('99999999999',20)   -- VERIFICAR ESTA SITUACION
	END
Return @valor_retorno
END

IF  @tpIVA = 'RI'  
BEGIN
	IF  dbo.ufn_ValidarCUIT_v4_9_4(@nrDoc)=1
		set @valor_retorno = dbo.UDF_obtenerFormatoCUITAFIP_v4_7(@nrDoc,20) 
	ELSE
		set @valor_retorno =  dbo.UDF_obtenerFormatoCUITAFIP_v4_7('20254752224',20)   -- VERIFICAR ESTA SITUACION
END
BEGIN
	IF @vlTotalGeneral > 999  
	BEGIN
		IF dbo.ufn_ValidarCUIT_v4_9_4(@nrDoc) = 1 
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

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtieneDatosCITIVentas_v4_9_4' )
	drop procedure  dbo.spu_obtieneDatosCITIVentas_v4_9_4
GO


/*
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9] @mes = 11 , @anio = 2016 
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 11 , @anio = 2016 , @renglon = -1

  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 11 , @anio = 2016 , @renglon = 465

  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 11 , @anio = 2016 , @renglon = 1638


 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 11 , @anio = 2016 , @renglon = 182

 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 11 , @anio = 2016 , @renglon = 6184

 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 11 , @anio = 2016 , @renglon = 465


 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 11 , @anio = 2016 , @renglon = 9910
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 11 , @anio = 2016 , @renglon = 10335


 
 
select 
	[dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9] (tpIVA,  nrDoc, vlTotalGeneral ), 
	[dbo].UDF_obtenerCampoAFIP_nro_dgi_v4_9_4  (tpIVA,  nrDoc, vlTotalGeneral ), *
 from TB_Comprobantes  where nrTalonario  = '0009' and nrComprobante = '00034008'

 select dbo.ufn_ValidarCUIT_v4_9_4('0104162359          ')
 select dbo.ufn_ValidarCUIT_v4_9_4( '19026155            '  )


 select '0104162359          ' 

 select [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9] ('CF',  '19026155            '          , 1030)


	Select   convert(varchar, A.dtComprobante,112) ,
						A.tpComprobante , A.tpLetra, A.nrDoc  ,
						 A.nrTalonario , --  as  serie_comp,	-- Punto de Venta 
						 A.nrComprobante ,  --  as  nro_comp,   -- NUmero de Comprobante
						 A.vlTotalGeneral , -- As cod_dgi,  --- Código del Documento del Comprador
						 a.tpIVA, 
						 a.vlIVA, *
				FROM TB_Comprobantes A WHERE
							a.nrTalonario  ='0008'
							and  a.nrComprobante = '00170091    '
							and  a.tpLetra = 'F'
							and  a.tpComprobante  = 'FA'
							
select * from tb_puestos


 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = -1
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 1 , @anio = 2017 , @renglon = -1
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 10 , @anio = 2016 , @renglon = -1

*/


create procedure  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4](@mes int, @anio int , @renglon int = -1) 
as
begin

declare @nro_linea decimal(18,0) = 0

		IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'RTMP_auxiliarPermisosRenglones_v4_9_4')
					DROP TABLE RTMP_auxiliarPermisosRenglones_v4_9_4

		CREATE TABLE RTMP_auxiliarPermisosRenglones_v4_9_4 (nro_linea decimal(18,0) , Renglon VARCHAR(400),
		nrTalonario varchar(6) , nrComprobante varchar(12) , tpLetra  varchar(4),  tpComprobante  varchar(5)  )

		IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'RTMP_auxiliarPermisosRenglones_v4_9_4_final')
					DROP TABLE RTMP_auxiliarPermisosRenglones_v4_9_4_final


		INSERT INTO RTMP_auxiliarPermisosRenglones_v4_9_4 (nro_linea , Renglon, 
							nrTalonario , nrComprobante , tpLetra , tpComprobante  )
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

		
		Select  ROW_NUMBER() OVER ( ORDER BY dtComprobante DESC )   ,  convert(varchar, A.dtComprobante,112) -- as  fec_comp,  -- Fecha de Comprobante
				+ right( replicate('0',3) + dbo.UDF_obtenerCodDOC_CITIT_v4_9_4(tpComprobante , tpLetra, dbo.ufn_ValidarCUIT_v4_9_4(A.nrDoc)),3) --  as  cod_citi,  -- Tipo de Comprobante
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( A.nrTalonario,5,0)  --  as  serie_comp,	-- Punto de Venta 
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (rtrim( A.nrComprobante),20,0 )--  as  nro_comp,   -- NUmero de Comprobante}
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (rtrim(  A.nrComprobante),20,0) -- as  nro_comphasta,   -- NUmero de Comprobante hasta
				+ [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9](A.tpIVA, A.nrDoc , A.vlTotalGeneral ) -- As cod_dgi,  --- Código del Documento del Comprador
				-- +'EULISES'+
				+ [dbo].UDF_obtenerCampoAFIP_nro_dgi_v4_9_4 (A.tpIVA, A.nrDoc , A.vlTotalGeneral ) -- As nro_dgi,  --- Documento del Comprador
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
		+ convert(varchar, DATEADD (day, 10,  A.dtComprobante ) ,112), --  as fecha_venc -- fecha de vencimiento de pago 
		a.nrTalonario , a.nrComprobante , a.tpLetra , a.tpComprobante 
		FROM TB_Comprobantes A 
		WHERE month(A.dtComprobante) = @mes    and year(A.dtComprobante) = @anio 
		 
		-- AND  (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI') and  dbo.ufn_ValidarCUIT('20-25475222-4')
		--AND not (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI')  
		AND tpLetra <>'X'  and flEliminar <> 1
		-- AND a.nrComprobante = '00602178' 


		select * INTO RTMP_auxiliarPermisosRenglones_v4_9_4_final from  RTMP_auxiliarPermisosRenglones_v4_9_4
		where (nro_linea = @renglon  OR @renglon = -1)
		-- select Renglon  from dbSG2000.dbo.RTMP_auxiliarPermisosRenglones
		if @renglon <> -1 
		begin 
			select * from RTMP_auxiliarPermisosRenglones_v4_9_4_final

			
 			Select   convert(varchar, A.dtComprobante,112) ,
						A.tpComprobante , A.tpLetra, A.nrDoc  ,
						 A.nrTalonario , --  as  serie_comp,	-- Punto de Venta 
						 A.nrComprobante ,  --  as  nro_comp,   -- NUmero de Comprobante
						 A.vlTotalGeneral , -- As cod_dgi,  --- Código del Documento del Comprador
						 a.tpIVA, 
						 a.vlIVA, *
				FROM TB_Comprobantes A  INNER JOIN  RTMP_auxiliarPermisosRenglones_v4_9_4_final b ON
							a.nrTalonario  = b.nrTalonario  
							and  a.nrComprobante = b.nrComprobante  
							and  a.tpLetra = b.tpLetra
							and  a.tpComprobante  = b.tpComprobante
							where nro_linea = @nro_linea 


		end 

		declare @nombre_archivo varchar(255) =  'CITIVentas_' + convert(varchar,@anio) + right('0' + convert(varchar,@mes), 2) + '.txt'

		exec  [dbo].[spu_generarArchivo_v4_8] @sql_select = 'select Renglon  from dbSG2000.dbo.RTMP_auxiliarPermisosRenglones_v4_9_4_final  ' , @nombre_archivo = @nombre_archivo

		return 0; 


end 



GO


if exists (SELECT * FROM sys.tables where name  ='TB_PresentacionesCAI' )
	drop table   dbo.TB_PresentacionesCAIDetalle


GO

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
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPresentacion] [int] NOT NULL,
	[tpComprobante] [char](2) NULL,
	[nrCAI] [char](20) NOT NULL,
	[PDV] [char](10) NULL,
	[Letra] [char](1) NULL,
	[nrUltNroComprobante] [int] NULL,
	[dtInsercion] [datetime] NULL,
 CONSTRAINT [PK_TB_TB_PresentacionesCAIDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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



if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_generarPresentacionCAI_v4_9_4' )
	drop procedure  dbo.spu_generarPresentacionCAI_v4_9_4
GO

/*

select  * from [TB_PresentacionesCAI]
select  * from [TB_PresentacionesCAIDetalle]  where idPresentacion = 2
exec [dbo].[spu_generarPresentacionCAI_v4_9_4] @IdPresentacion = 2  , @realizarLOG = 'S'


*/

create procedure  [dbo].[spu_generarPresentacionCAI_v4_9_4](@IdPresentacion integer, @realizarLOG char(1)='N') 
as
begin

declare @nro_linea decimal(18,0) = 0
declare @nrMes  int
declare @nrAnio int


	    select  @nrMes = nrMes , @nrAnio = nrAnio   from [TB_PresentacionesCAI]  
					 where  IdPresentacion =  @IdPresentacion

		IF @@ROWCOUNT = 0 
		BEGIN
				select 'ERROR' as resultado , 'No existe la presentación ' + convert(varchar,@IdPresentacion) as Descrip 
			return;
		END
		
		IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'RTMP_auxiliarPermisosRenglonesCAI')
					DROP TABLE RTMP_auxiliarPermisosRenglonesCAI

		CREATE TABLE RTMP_auxiliarPermisosRenglonesCAI( Renglon VARCHAR(400))

		INSERT INTO RTMP_auxiliarPermisosRenglonesCAI ( Renglon )
		Select  /*'TIPOREGISTRO: */ '4'      --    as 'TipodeRegistro' 4- ALTA / 5-MODIFICACION
				/*+ 'TIPODECOMPROBANTE: '*/ + right( replicate('0',3) + dbo.UDF_obtenerCodDOC_CITIT_v4_9_4(y.tpComprobante , y.Letra , 1 ),3) --  as  cod_citi,  -- Tipo de Comprobante
				/*+ 'PERIODO:  '*/  + convert(varchar,x.nrAnio)  +  right ('0' + convert(varchar,x.nrMes),2)  -- Periodo
				/*+ 'CUIT:*/ + '30708249919'
				/*+ 'PDV: '*/ + dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( y.PDV ,5,0) +
				/*+ 'ULTNRO:'*/ + dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( y.nrUltNroComprobante  ,8,0) 
				/*+ 'EN_USO: */ +'S'+ 
				/*+ 'REGIMEN '*/  + dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0  ,14,0) 
		FROM TB_PresentacionesCAI x INNER JOIN   TB_PresentacionesCAIDetalle y 
							ON x.IdPresentacion  = y.IdPresentacion
		WHERE X.IdPresentacion = @IdPresentacion 
		
		IF @realizarLOG = 'S' 
		BEGIN
				TRUNCATE TABLE RTMP_auxiliarPermisosRenglonesCAI
				INSERT INTO RTMP_auxiliarPermisosRenglonesCAI ( Renglon )
				Select  'TIPOREGISTRO: 4'      --    as 'TipodeRegistro' 4- ALTA / 5-MODIFICACION
				+ 'TIPODECOMPROBANTE: ' + right( replicate('0',3) + dbo.UDF_obtenerCodDOC_CITIT_v4_9_4(y.tpComprobante , y.Letra , 1 ),3) --  as  cod_citi,  -- Tipo de Comprobante
				+ 'PERIODO:  ' + convert(varchar,x.nrAnio)  +  right ('0' + convert(varchar,x.nrMes),2)  -- Periodo
				+ 'CUIT: 30708249919'
				+ 'PDV: ' + dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( y.PDV ,5,0) +
				+ 'ULTNRO:' + dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( y.nrUltNroComprobante  ,8,0) 
				+ 'EN_USO: S'+ 
				+ 'REGIMEN + ' + dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0  ,14,0) 
				FROM TB_PresentacionesCAI x INNER JOIN   TB_PresentacionesCAIDetalle y 
									ON x.IdPresentacion  = y.IdPresentacion
				WHERE X.IdPresentacion = @IdPresentacion 
			select * from  RTMP_auxiliarPermisosRenglonesCAI 
		END

		declare @nombre_archivo varchar(255)=  'CAIComprobantesxLote_' + convert(varchar,@nrAnio)  +  right ('0' + convert(varchar,@nrMes),2) 
		+'_'  + right( '000000' + convert(varchar,@IdPresentacion),6)+ '.txt'

		exec  [dbo].[spu_generarArchivo_v4_8] @sql_select = 'select Renglon  from dbSG2000.dbo.RTMP_auxiliarPermisosRenglones  ' , @nombre_archivo = @nombre_archivo
		

		select 'OK' as resultado , 'El archivo se ha generado con éxito, verifique el archivo '+ @nombre_archivo as Descrip 
		return 0; 


end 



GO


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtenerUltNroCAIsUsados' )
	drop procedure  dbo.spu_obtenerUltNroCAIsUsados

GO

---------------------------------------------------------------------------
---  exec  dbo.spu_obtenerUltNroCAIsUsados 1, 2017
create procedure  [dbo].[spu_obtenerUltNroCAIsUsados](@mes int, @anio int) 
as
begin
		

		Select  @anio as 'AÑO',
				@mes  as 'MES',
				A.tpComprobante as DOC,
				A.nrTalonario   as PDV,
				tpLetra         as LETRA, 
				a.nrCAI		    as CAI, 
				max(A.nrComprobante) as UltNroComprobante
		FROM TB_Comprobantes A 
		WHERE month(A.dtComprobante) = @mes    and year(A.dtComprobante) = @anio 
				AND tpLetra <>'X'  and nrCAI is not null
				GROUP BY A.nrTalonario , tpLetra, nrCAI , A.tpComprobante

		return 0; 

end 

GO

