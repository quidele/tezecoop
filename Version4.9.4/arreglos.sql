

 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 11 , @anio = 2016 , @renglon = 101
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 11 , @anio = 2016 , @renglon = 1325


 30-63020908-7 ⋆ CUIT Online

  select dbo.ufn_ValidarCUIT_v4_9_4('2022611521')
 select   [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9_4] ('RI' , '306302209087        ','710')

 select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
 where nrTalonario = '0006' and  nrComprobante = '00008329' and tpIVA = 'CF'


 sp_helptext '[dbo].[spu_obtieneDatosCITIVentas_v4_9_4]'

 update x set nrDoc = '20124651809' from TB_Comprobantes x 
   where nrTalonario = '0006' and  nrComprobante = '00008365' and tpIVA = 'RI'

   RODRIGUEZ JOSE MARIA


    update  x set  dsRazonSocial = 'Eulises Quidel' from TB_Comprobantes  x 
 where nrTalonario = '0006' and  nrComprobante = '00117198' and tpIVA = 'CF'




    exec  dbo.spu_obtenerUltNroCAIsUsados 11, 2016


	 select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,* from TB_Comprobantes 
 where tpLetra in ('A') and nrTalonario = '0006'  and nrComprobante  in ('00008329') 
 
 
  
	 update  x  set   nrDoc = '30710440413'  from TB_Comprobantes  x 
 where tpLetra in ('A') and nrTalonario = '0006'  and nrComprobante  in ('00008329')       

   select dbo.ufn_ValidarCUIT_v4_9_4('30710440413        ')


   ---------------------------------------------------------------------------

   

/*
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 11 , @anio = 2016 , @renglon = 12812

 30-63020908-7 ? CUIT Online

  select dbo.ufn_ValidarCUIT_v4_9_4('2022611521')
 select   [dbo].[UDF_obtenerCampoAFIP_cod_dgi_v4_9_4] ('RI' , '306302209087        ','710')

 select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
 where nrTalonario = '0006' and  nrComprobante = '00008329' and tpIVA = 'CF'

 sp_helptext '[dbo].[spu_obtieneDatosCITIVentas_v4_9_4]'

 update x set nrDoc = '20124651809' from TB_Comprobantes x 
   where nrTalonario = '0006' and  nrComprobante = '00008365' and tpIVA = 'RI'

    update  x set  dsRazonSocial = 'Eulises Quidel' from TB_Comprobantes  x 
 where nrTalonario = '0006' and  nrComprobante = '00117198' and tpIVA = 'CF'


    exec  dbo.spu_obtenerUltNroCAIsUsados 11, 2016

	 select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,* from TB_Comprobantes 
 where tpLetra in ('A') and nrTalonario = '0006'  and nrComprobante  in ('00008329') 
 
  
	 update  x  set   nrDoc = '30710440413'  from TB_Comprobantes  x 
 where tpLetra in ('A') and nrTalonario = '0006'  and nrComprobante  in ('00008329')       

   select dbo.ufn_ValidarCUIT_v4_9_4('30710440413        ')


9910	NULL	0008	00170091    	F	FA
10335	201611130060000300000000000000117198000000000000001171989000000000099999999999*                             000000000103000000000000103000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000PES00010000001N00000000000000020161123	0003	00117198    	B	FA
14397	201611060010000600000000000000008309000000000000000083098000000000099999999999GEO CONSULT BUENOS AIRES      000000000058000000000000058000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000PES00010000001N00000000000000020161116	0006	00008309    	A	FA
16913	201611010010000600000000000000008284000000000000000082848000000000099999999999GEO CONSULT BUENOS AIRES      000000000048000000000000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000PES00010000001N00000000000000020161111	0006	00008284    	A	FA
16914	201611010010000600000000000000008285000000000000000082858000000000099999999999GEO CONSULT BUENOS AIRES      000000000048000000000000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000PES00010000001N00000000000000020161111	0006	00008285    	A	FA


9910	0008	00170091    	F	FA
10335	0003	00117198    	B	FA
14397	0006	00008309    	A	FA
16913	0006	00008284    	A	FA
16914	0006	00008285    	A	FA

 select * from zTB_Comprobantes_201611_corrige_errores 

 drop table zTB_Comprobantes_201611_corrige_errores 

 select '0008' as nrTalonario , 	'00170091' as nrComprobante, 	'F' as tpLetra  , 	'FA' as tpComprobante  into zTB_Comprobantes_201611_corrige_errores

 insert into zTB_Comprobantes_201611_corrige_errores
 select '0003' as nrTalonario , 	'00117198' as nrComprobante, 	'B' as tpLetra  , 	'FA' as tpComprobante 
 
 insert into zTB_Comprobantes_201611_corrige_errores
 select '0006' as nrTalonario , 	'00008309' as nrComprobante, 	'A' as tpLetra  , 	'FA' as tpComprobante 
 
 insert into zTB_Comprobantes_201611_corrige_errores
 select '0006' as nrTalonario , 	'00008284' as nrComprobante, 	'A' as tpLetra  , 	'FA' as tpComprobante 
 
 insert into zTB_Comprobantes_201611_corrige_errores
 select '0006' as nrTalonario , 	'00008285' as nrComprobante, 	'A' as tpLetra  , 	'FA' as tpComprobante 
 

select x.tpIVA , x.nrDOC , x.dsRazonsocial  , x.vlTotalGeneral,  * from tb_comprobantes  x inner join  zTB_Comprobantes_201611_corrige_errores y
						on  x.nrTalonario = y.nrTalonario
						and  x.nrComprobante = y.nrComprobante
						and  x.tpLetra = y.tpLetra
						and  x.tpComprobante = y.tpComprobante


*/




 drop table zTB_Comprobantes_201611_corrige_errores 

 select '0008' as nrTalonario , 	'00170091' as nrComprobante, 	'F' as tpLetra  , 	'FA' as tpComprobante  into zTB_Comprobantes_201611_corrige_errores

 insert into zTB_Comprobantes_201611_corrige_errores
 select '0003' as nrTalonario , 	'00117198' as nrComprobante, 	'B' as tpLetra  , 	'FA' as tpComprobante 
 
 insert into zTB_Comprobantes_201611_corrige_errores
 select '0006' as nrTalonario , 	'00008309' as nrComprobante, 	'A' as tpLetra  , 	'FA' as tpComprobante 
 
 insert into zTB_Comprobantes_201611_corrige_errores
 select '0006' as nrTalonario , 	'00008284' as nrComprobante, 	'A' as tpLetra  , 	'FA' as tpComprobante 
 
 insert into zTB_Comprobantes_201611_corrige_errores
 select '0006' as nrTalonario , 	'00008285' as nrComprobante, 	'A' as tpLetra  , 	'FA' as tpComprobante 
 
  select * from zTB_Comprobantes_201611_corrige_errores 


select x.tpIVA , x.nrDOC , x.dsRazonsocial  , x.vlTotalGeneral,  * from tb_comprobantes  x inner join  zTB_Comprobantes_201611_corrige_errores y
						on  x.nrTalonario = y.nrTalonario
						and  x.nrComprobante = y.nrComprobante
						and  x.tpLetra = y.tpLetra
						and  x.tpComprobante = y.tpComprobante



select * from  TB_Comprobantes  where  nrTalonario =  '0008'  
											and  nrComprobante = '00170091'  
											and tpLetra = 'F'	 
											and  tpComprobante =  'FA'


exec  [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        =  '0008'   , 
		@nrComprobante_param      =  '00170091'  ,
		@tpComprobante_param      =  'FA'	,
		@tpLetra_param            = 'F'	 ,
		@nrTalonario_new_param    = '0008' ,
		@nrComprobante_new_param  =  '00170091'  ,
		@tpComprobante_new_param  =  'FA'	,
		@tpLetra_new_param        = 'B'	 ,
		@solo_cambio_cabecera_comprobante = 'SI'



select x.tpIVA , x.nrDOC , x.dsRazonsocial  , x.vlTotalGeneral, * from  TB_Comprobantes x  where  nrTalonario =  '0003'  
											and  nrComprobante = '00117198    '  
											and tpLetra = 'B'	 
											and  tpComprobante =  'FA'




update x  set  x.nrDOC = null , x.dsRazonsocial = null  from  TB_Comprobantes x  where  nrTalonario =  '0003'  
											and  nrComprobante = '00117198    '  
											and tpLetra = 'B'	 
											and  tpComprobante =  'FA'



select x.tpIVA , x.nrDOC , x.dsRazonsocial  , x.vlTotalGeneral,  * from tb_comprobantes  x inner join  zTB_Comprobantes_201611_corrige_errores y
						on  x.nrTalonario = y.nrTalonario
						and  x.nrComprobante = y.nrComprobante
						and  x.tpLetra = y.tpLetra
						and  x.tpComprobante = y.tpComprobante
						where  x.nrDOC = '3071044041/3        '


update x set  x.nrDOC = '30710440413'  from tb_comprobantes  x inner join  zTB_Comprobantes_201611_corrige_errores y
						on  x.nrTalonario = y.nrTalonario
						and  x.nrComprobante = y.nrComprobante
						and  x.tpLetra = y.tpLetra
						and  x.tpComprobante = y.tpComprobante
						where  x.nrDOC = '3071044041/3        '


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------


	select * 
	from TB_Comprobantes 
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2016 and 
	dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) = 0 and month(dtComprobante) =12

	 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 101

	   select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
 where nrTalonario = '0006' and  nrComprobante = '00008565' and  tpLetra ='A' and
   tpComprobante = 'FA'


   SELECT        dbo.ufn_ValidarCUIT_v4_9_4(nrDoc) AS cuitok, tpIVA, nrDoc, vlTotalGeneral, dsRazonSocial, nrTalonario, nrComprobante, tpLetra, tpComprobante
FROM            TB_Comprobantes
WHERE        (tpLetra IN ('A', 'M')) AND (tpComprobante = 'FA') AND (YEAR(dtComprobante) = 2016) AND (MONTH(dtComprobante) = 12)


      update x set nrDoc= null  from TB_Comprobantes x
 where nrTalonario = '0006' and  nrComprobante = '00008565' and  tpLetra ='A' and
   tpComprobante = 'FA'

    exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 1325


	0002	00012959    	M	FA

	
	   select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
 where nrTalonario = '0002' and  nrComprobante = '00012959' and  tpLetra ='M' and
   tpComprobante = 'FA'



   
    exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 1750

	   select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
 where dsRazonSocial like 'GODALIA%'

  update  x set  nrDoc = null from TB_Comprobantes  x 
 where dsRazonSocial like 'GODALIA%'

  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 11695

  
   update x set  x.nrDoc = '30-70704639-9' from TB_Comprobantes x 
 where nrTalonario = '0009' and  nrComprobante = '00034582' and  tpLetra ='B' and
   tpComprobante = 'FA'

   	exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 13129

	

		select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial from TB_Comprobantes 
 where nrTalonario = '0006' and  nrComprobante = '00008452' and  tpLetra ='A' and
   tpComprobante = 'FA'

   
	   select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
 where dsRazonSocial like '%sesta%'


 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 14151

   
   0008	00171595    	F	FA

		select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial from TB_Comprobantes 
 where nrTalonario = '0008' and  nrComprobante = '00171595' and  tpLetra ='F' and
   tpComprobante = 'FA'

   exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0008',  /* FORMATO 0000*/
		@nrComprobante_param      = '00171595',
		@tpComprobante_param      = 'FA',
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0008',
		@nrComprobante_new_param  = '00171595',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B',
		@solo_cambio_cabecera_comprobante = 'SI'



exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 1325


  select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
 where nrTalonario = '0002' and  nrComprobante = '00012959' and  tpLetra ='M' and
   tpComprobante = 'FA'

    
