
select x.vlIVA from TB_Comprobantes  x where dsRazonSocial like '%geometry%global%'


update x set x.tpIVA = 'CF'   from TB_Comprobantes x  where dsRazonSocial like '%geometry%global%'


select nrDOC from TB_Comprobantes where dsRazonSocial like '%ARPER EXPRESS SRL%' 
										and nrComprobante = '00004678'



update  x set  nrDOC = '30-68748175-1' from TB_Comprobantes x  where dsRazonSocial like '%ARPER EXPRESS SRL%' 
										and nrComprobante = '00004678'



306874817514 ARPER EXPRESS SRL
30711970114QUIMICA MORENO SA 


select nrDOC, *  from TB_Comprobantes where nrTalonario = '0007' and nrComprobante = '00002800' and nrDoc = '30612844883-2'



update x  set nrDOC = '3061284483'  from TB_Comprobantes x  where nrTalonario = '0007' and nrComprobante = '00002800' and nrDoc = '30612844883-2'



select nrDOC, vlIva ,  dsRazonSocial ,  *  from TB_Comprobantes where nrTalonario = '0006' and nrComprobante = '00004795' 


select nrDOC, vlIva ,  dsRazonSocial ,  *  from TB_Comprobantes where nrTalonario = '0006' and nrComprobante = '00004795' 


update x  set nrDOC = '20-11774792-2'  from TB_Comprobantes x  
                       where nrTalonario = '0006' and nrComprobante = '00004795' 


and nrDoc = '30612844883-2'




select nrDOC, vlIva ,  dsRazonSocial ,   *  from TB_Comprobantes where nrTalonario = '0006' and nrComprobante = '00004809' 
 and nrDoc = '30612844883-2'       


update x  set  x. nrDoc = '3061284483'  from TB_Comprobantes x where nrTalonario = '0006' and nrComprobante = '00004809' 
 and nrDoc = '30612844883-2'       


 select nrDOC, vlIva ,  dsRazonSocial ,   *  from TB_Comprobantes where nrTalonario = '0000' and nrComprobante = '00000001' 
 
 select nrDOC, vlIva ,  dsRazonSocial ,   *  from TB_Comprobantes where nrTalonario = '0006' and nrComprobante = '00000001' 
 

 and nrDoc = '30612844883-2' 
       

	select *  
	 from TB_Comprobantes 
	 where dsRazonSocial = 'AEROLINEAS ARGENTINAS S.A.' and tpIVA = 'RI' and tpLetra = 'A'
	 order by nrTalonario , nrComprobante


	 
	update x set x.tpLetra = 'X'
	 from TB_Comprobantes  x 
 where nrTalonario = '0000' and nrComprobante = '00000001'  and tpComprobante ='A'
 


 
 select nrDOC, vlIva ,  dsRazonSocial ,   *  from TB_Comprobantes where nrTalonario = '0000' and nrComprobante = '00000001' 
 

---  Voy por acacacac !!!
--- SP_ActualizarComprobanteManual_v2_4 ->>> SP_ActualizarComprobanteManual_v2_5
-- Actualiza el nro de comprobante y talonario de una carga manual
exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0000',  /* FORMATO 0000*/
	@nrComprobante_param='00000001',
	@tpComprobante_param ='A',
	@tpLetra_param='A',
	@nrTalonario_new_param    ='0000',
	@nrComprobante_new_param  = '00000001',
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'X',
	@solo_cambio_cabecera_comprobante ='SI'



Select  TOP 10  convert(varchar, A.dtComprobante,112) as  fec_comp,  -- Fecha de Comprobante
				right( replicate('0',3) + dbo.UDF_obtenerCodDOC_CITIT_v4_7(tpComprobante , tpLetra ),3) as  cod_citi,  -- Tipo de Comprobante
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
		dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( vlTotalGeneral, 15, 2)      As imp_total,     --  importe total del operacion
		dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (ABS(isnull(A.vlSubtotal,0)),15,2) As imp_neto_no_grabado,				--  importe total conceptos que no integran el neto gravado		
		dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) As imp_perc_no_cate,						--  percepcion a no categorizados
		dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) As imp_exen,						--  importe operaciones exentas
		dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) As imp_perc_ctas ,				--  importe percepciones o pagos a ctas impuestos nacionales
		dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) As imp_perc_iibb ,				--  importe percepciones de ingresos brutos
		dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) As imp_perc_ip ,					--  importe percepciones de impuestos municipales
		dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) As imp_impuestos_internos ,		--  importe impuestos internos
		'PES'      as cod_moneda,					--  codigo de moneda
		dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (1,10,6)	   as tipo_cambio,			        --  tipo de cambio
		'v'      as cant_alicuotas_iva,			--  cantidad alicuotas iva  
		dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2)      as otros_tributos,			    --  otros tributos
		convert(varchar, A.dtComprobante + 10,112)  as fecha_venc -- fecha de vencimiento de pago 
		FROM TB_Comprobantes A 
		WHERE month(A.dtComprobante) = 12    and year(A.dtComprobante) = 2015 
		-- AND  (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI') and  dbo.ufn_ValidarCUIT('20-25475222-4')
		--AND not (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI')  
		AND tpLetra <>'X' 
		AND ( convert(varchar, A.dtComprobante,112) -- as  fec_comp,  -- Fecha de Comprobante
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
		+ convert(varchar, DATEADD (day, 10,  A.dtComprobante ) ,112)) IS NULL --  as fecha_venc -- fecha de vencimiento de pago 
		
 

 
Select  * FROM TB_Comprobantes A 
		WHERE month(A.dtComprobante) = 12    and year(A.dtComprobante) = 2015 
		-- AND  (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI') and  dbo.ufn_ValidarCUIT('20-25475222-4')
		--AND not (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI')  
		AND tpLetra <>'X' 
		AND ( convert(varchar, A.dtComprobante,112) -- as  fec_comp,  -- Fecha de Comprobante
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
		+ convert(varchar, DATEADD (day, 10,  A.dtComprobante ) ,112)) IS NULL --  as fecha_venc -- fecha de vencimiento de pago 
		
 

 select * from TB_Comprobantes where tpLetra ='F'
 
 
select  ' exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param =''' +  rtrim(nrTalonario) + ''' ,  
	@nrComprobante_param='''  +  rtrim( nrComprobante)  + ''' , 
	@tpComprobante_param =''FA'',
	@tpLetra_param=''F'',
	@nrTalonario_new_param = '''  +  rtrim(  nrTalonario ) + ''' ,  
	@nrComprobante_new_param='''  +  rtrim(  nrComprobante ) +  ''' , 
	@tpComprobante_new_param  = ''A'',
	@tpLetra_new_param      = ''B'',
	@solo_cambio_cabecera_comprobante =''SI''' from TB_Comprobantes where tpLetra ='F' 


 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0006' ,  
	@nrComprobante_param='00705824' , 
	@tpComprobante_param ='FA',
	@tpLetra_param='F',
	@nrTalonario_new_param = '0006' ,  
	@nrComprobante_new_param='00705824' , 
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0001' ,  
	@nrComprobante_param='00192858' , 
	@tpComprobante_param ='FA',
	@tpLetra_param='F',
	@nrTalonario_new_param = '0001' ,  
	@nrComprobante_new_param='00192858' , 
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0001' ,  
	@nrComprobante_param='00199222' , 
	@tpComprobante_param ='FA',
	@tpLetra_param='F',
	@nrTalonario_new_param = '0001' ,  
	@nrComprobante_new_param='00199222' , 
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0001' ,  
	@nrComprobante_param='00199633' , 
	@tpComprobante_param ='FA',
	@tpLetra_param='F',
	@nrTalonario_new_param = '0001' ,  
	@nrComprobante_new_param='00199633' , 
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0004' ,  
	@nrComprobante_param='00013098' , 
	@tpComprobante_param ='FA',
	@tpLetra_param='F',
	@nrTalonario_new_param = '0004' ,  
	@nrComprobante_new_param='00013098' , 
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0004' ,  
	@nrComprobante_param='00014227' , 
	@tpComprobante_param ='FA',
	@tpLetra_param='F',
	@nrTalonario_new_param = '0004' ,  
	@nrComprobante_new_param='00014227' , 
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0003' ,  
	@nrComprobante_param='00110141' , 
	@tpComprobante_param ='FA',
	@tpLetra_param='F',
	@nrTalonario_new_param = '0003' ,  
	@nrComprobante_new_param='00110141' , 
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0003' ,  
	@nrComprobante_param='00116176' , 
	@tpComprobante_param ='FA',
	@tpLetra_param='F',
	@nrTalonario_new_param = '0003' ,  
	@nrComprobante_new_param='00116176' , 
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0008' ,  
	@nrComprobante_param='00151066' , 
	@tpComprobante_param ='FA',
	@tpLetra_param='F',
	@nrTalonario_new_param = '0008' ,  
	@nrComprobante_new_param='00151066' , 
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0008' ,  
	@nrComprobante_param='00160921' , 
	@tpComprobante_param ='FA',
	@tpLetra_param='F',
	@nrTalonario_new_param = '0008' ,  
	@nrComprobante_new_param='00160921' , 
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0008' ,  
	@nrComprobante_param='00163319' , 
	@tpComprobante_param ='FA',
	@tpLetra_param='F',
	@nrTalonario_new_param = '0008' ,  
	@nrComprobante_new_param='00163319' , 
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0008' ,  
	@nrComprobante_param='00164331' , 
	@tpComprobante_param ='FA',
	@tpLetra_param='F',
	@nrTalonario_new_param = '0008' ,  
	@nrComprobante_new_param='00164331' , 
	@tpComprobante_new_param  = 'A',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'


	----------------------------------------=----



	
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0001' ,  
	@nrComprobante_param='00192858' , 
	@tpComprobante_param ='A',
	@tpLetra_param='B',
	@nrTalonario_new_param = '0001' ,  
	@nrComprobante_new_param='00192858' , 
	@tpComprobante_new_param  = 'FA',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'

 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0004' ,  
	@nrComprobante_param='00013098' , 
	@tpComprobante_param ='A',
	@tpLetra_param='B',
	@nrTalonario_new_param = '0004' ,  
	@nrComprobante_new_param='00013098' , 
	@tpComprobante_new_param  = 'FA',
	@tpLetra_new_param      = 'B',
	@solo_cambio_cabecera_comprobante ='SI'






 select nrDOC, vlIva ,  dsRazonSocial ,   *  from TB_Comprobantes where
  nrTalonario = '0000' and nrComprobante = '00000001' 
 
 select nrTalonario, nrComprobante , tpLetra --, tpComprobante
 -- into tmpDuplicadosAFIP122015
 from TB_Comprobantes  A
 where 
 month(A.dtComprobante) = 12   and year(A.dtComprobante) = 2015
		AND tpLetra <>'X'
group by  nrTalonario, nrComprobante , tpLetra --, tpComprobante
having count(*)>1


 select a.* , b.*
 from TB_Comprobantes  A  inner join  tmpDuplicadosAFIP122015  B
			on A.nrTalonario = B.nrTalonario
			and A.nrComprobante = B.nrComprobante
			and  A.tpLetra = B.tpLetra
 where 
 month(A.dtComprobante) = 12   and year(A.dtComprobante) = 2015
		AND A.tpLetra <>'X' and A.flEliminar = 1 and A.flAnulado = 0



 delete  Y
 from TB_Comprobantes  A  inner join TB_ComprobantesDetalle Y
				 on A.nrTalonario = y.nrTalonario
			and A.nrComprobante = y.nrComprobante
			and  A.tpLetra = y.tpLetra
			and  A.tpComprobante = y.tpComprobante
  inner join  tmpDuplicadosAFIP122015  B
			on A.nrTalonario = B.nrTalonario
			and A.nrComprobante = B.nrComprobante
			and  A.tpLetra = B.tpLetra
 where 
 month(A.dtComprobante) = 12   and year(A.dtComprobante) = 2015
		AND A.tpLetra <>'X' and A.flEliminar = 1 and A.flAnulado = 0


 delete  a 
 from TB_Comprobantes  A  inner join  tmpDuplicadosAFIP122015  B
			on A.nrTalonario = B.nrTalonario
			and A.nrComprobante = B.nrComprobante
			and  A.tpLetra = B.tpLetra
 where 
 month(A.dtComprobante) = 12   and year(A.dtComprobante) = 2015
		AND A.tpLetra <>'X' and A.flEliminar = 1 and A.flAnulado = 0



 
select  ' exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param =''' +  rtrim(A.nrTalonario) + ''' ,  
	@nrComprobante_param='''  +  rtrim( A.nrComprobante)  + ''' , 
	@tpComprobante_param =''' +  rtrim( A.tpComprobante)    + ''',
	@tpLetra_param=''' +  rtrim( A.tpLetra)    + ''',
	@nrTalonario_new_param =''' +  rtrim(A.nrTalonario) + ''' ,  
	@nrComprobante_new_param='''  +  rtrim( A.nrComprobante)  + ''' , 
	@tpComprobante_new_param =''FA'',
	@tpLetra_new_param=''X'',
	@solo_cambio_cabecera_comprobante =''SI''' 
	from TB_Comprobantes  A  inner join  tmpDuplicadosAFIP122015  B
			on A.nrTalonario = B.nrTalonario
			and A.nrComprobante = B.nrComprobante
			and  A.tpLetra = B.tpLetra
 where 
 month(A.dtComprobante) = 12   and year(A.dtComprobante) = 2015
		AND A.tpLetra <>'X' and A.flEliminar = 1 and A.flAnulado = 0


 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0001' ,  
	@nrComprobante_param='00191770' , 
	@tpComprobante_param ='B',
	@tpLetra_param='B',
	@nrTalonario_new_param ='0001' ,  
	@nrComprobante_new_param='00191770' , 
	@tpComprobante_new_param ='FA',
	@tpLetra_new_param='X',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0003' ,  
	@nrComprobante_param='00108466' , 
	@tpComprobante_param ='B',
	@tpLetra_param='B',
	@nrTalonario_new_param ='0003' ,  
	@nrComprobante_new_param='00108466' , 
	@tpComprobante_new_param ='FA',
	@tpLetra_new_param='X',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0003' ,  
	@nrComprobante_param='00108783' , 
	@tpComprobante_param ='B',
	@tpLetra_param='B',
	@nrTalonario_new_param ='0003' ,  
	@nrComprobante_new_param='00108783' , 
	@tpComprobante_new_param ='FA',
	@tpLetra_new_param='X',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0003' ,  
	@nrComprobante_param='00108787' , 
	@tpComprobante_param ='B',
	@tpLetra_param='B',
	@nrTalonario_new_param ='0003' ,  
	@nrComprobante_new_param='00108787' , 
	@tpComprobante_new_param ='FA',
	@tpLetra_new_param='X',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0004' ,  
	@nrComprobante_param='00012853' , 
	@tpComprobante_param ='B',
	@tpLetra_param='B',
	@nrTalonario_new_param ='0004' ,  
	@nrComprobante_new_param='00012853' , 
	@tpComprobante_new_param ='FA',
	@tpLetra_new_param='X',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0004' ,  
	@nrComprobante_param='00012872' , 
	@tpComprobante_param ='B',
	@tpLetra_param='B',
	@nrTalonario_new_param ='0004' ,  
	@nrComprobante_new_param='00012872' , 
	@tpComprobante_new_param ='FA',
	@tpLetra_new_param='X',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0004' ,  
	@nrComprobante_param='00012880' , 
	@tpComprobante_param ='B',
	@tpLetra_param='B',
	@nrTalonario_new_param ='0004' ,  
	@nrComprobante_new_param='00012880' , 
	@tpComprobante_new_param ='FA',
	@tpLetra_new_param='X',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0004' ,  
	@nrComprobante_param='00012876' , 
	@tpComprobante_param ='B',
	@tpLetra_param='B',
	@nrTalonario_new_param ='0004' ,  
	@nrComprobante_new_param='00012876' , 
	@tpComprobante_new_param ='FA',
	@tpLetra_new_param='X',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0003' ,  
	@nrComprobante_param='00108864' , 
	@tpComprobante_param ='B',
	@tpLetra_param='B',
	@nrTalonario_new_param ='0003' ,  
	@nrComprobante_new_param='00108864' , 
	@tpComprobante_new_param ='FA',
	@tpLetra_new_param='X',
	@solo_cambio_cabecera_comprobante ='SI'
 exec [dbo].[SP_ActualizarComprobante_v4_9]
	@nrTalonario_param ='0004' ,  
	@nrComprobante_param='00013052' , 
	@tpComprobante_param ='B',
	@tpLetra_param='B',
	@nrTalonario_new_param ='0004' ,  
	@nrComprobante_new_param='00013052' , 
	@tpComprobante_new_param ='FA',
	@tpLetra_new_param='X',
	@solo_cambio_cabecera_comprobante ='SI'




 select nrTalonario, nrComprobante , tpLetra --, tpComprobante
 -- into tmpDuplicadosAFIP122015
 from TB_Comprobantes  A
 where 
 month(A.dtComprobante) = 12   and year(A.dtComprobante) = 2015
		AND tpLetra <>'X' and flEliminar =1
group by  nrTalonario, nrComprobante , tpLetra --, tpComprobante
having count(*)>1



 select *
 from TB_Comprobantes  A
 where 
 month(A.dtComprobante) = 12   and year(A.dtComprobante) = 2015
		AND tpLetra <>'X' and flEliminar =0
			and nrComprobante = '00192426'
