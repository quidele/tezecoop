
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



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

 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 10 , @anio = 2016 , @renglon = 9910
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 10 , @anio = 2016 , @renglon = 10335
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 10 , @anio = 2016 , @renglon = 14397
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 10 , @anio = 2016 , @renglon = 16913
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 10 , @anio = 2016 , @renglon = 16914
 


  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 3 , @anio = 2017, @renglon = 1004
  


*/



select * from sys.procedures where name like   '%Alicuo%'

CREATE procedure  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4](@mes int, @anio int , @renglon int = -1) 
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
				+ [dbo].UDF_obtenerCampoAFIP_cod_dgi_v4_9_4(A.tpIVA, A.nrDoc , A.vlTotalGeneral ) -- As cod_dgi,  --- Código del Documento del Comprador
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
		+  case WHEN tpLetra = 'M' THEN '00000000' ELSE
				convert(varchar, DATEADD (day, 10,  A.dtComprobante ) ,112) END, --  as fecha_venc -- fecha de vencimiento de pago 
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


--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 2 and vlTotalGeneral > 999


	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 3 and vlTotalGeneral > 999  and tpIVA = 'CF'



--Agregamos campos para la nueva regneracion 	   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='dsRazonSocial_original')
     ALTER TABLE TB_Comprobantes ADD dsRazonSocial_original VARCHAR(100) NULL

	   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='nrDoc_original')
     ALTER TABLE TB_Comprobantes ADD nrDoc_original CHAR(20) NULL



	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 3 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 3 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null
	and dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) = 0


go 


--Agregamos campos para la nueva regneracion 	   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='dsRazonSocial_original')
     ALTER TABLE TB_Comprobantes ADD dsRazonSocial_original VARCHAR(100) NULL

	   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='nrDoc_original')
     ALTER TABLE TB_Comprobantes ADD nrDoc_original CHAR(20) NULL



	 	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 3 and vlTotalGeneral > 999  and tpIVA = 'CF'



	
	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 3 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null

select * from TB_Comprobantes x  where 	
 x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null
 and   tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 3 and vlTotalGeneral > 999  and tpIVA = 'CF'
	
	update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 3 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) = 0



	
  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 3 , @anio = 2017


  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 3 , @anio = 2017

  


select * from sys.procedures where name like   '%Alicuo%'


  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 3 , @anio = 2017, @renglon = 1277
 
  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 3 , @anio = 2017, @renglon = 1416

  
  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 3 , @anio = 2017, @renglon = 8496

  
  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 3 , @anio = 2017, @renglon = 8516

  
  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 3 , @anio = 2017, @renglon = 14747