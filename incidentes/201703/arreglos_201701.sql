


 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 101
 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 1325


  select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
 where nrTalonario = '0006' and  nrComprobante = '00008565' and  tpLetra ='A' and
   tpComprobante = 'FA'

 0006	00008565    	A	FA


 select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * 
       from TB_Comprobantes where dsRazonSocial like 'GODALIA%'



 select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,  dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) , * 
       from TB_Comprobantes where dsRazonSocial like 'GODALIA%'  and tpIVA = 'RI' and tpLetra = 'A' 
							and year(dtComprobante) =  2016


	   
update  x set  nrDoc = '20254752224'
       from TB_Comprobantes x  where dsRazonSocial like 'GODALIA%'



 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 1325

 0002	00012959    	M	FA

   select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
 where nrTalonario = '0002' and  nrComprobante = '00012959' and  tpLetra ='M' and
   tpComprobante = 'FA'
    
 
 select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
	where tpLetra ='M' and  tpComprobante = 'FA'  and year(dtComprobante) = 2016 and month(dtComprobante) = 12


	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial from TB_Comprobantes 
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2016 and month(dtComprobante) = 12


		select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial from TB_Comprobantes 
 where nrTalonario = '0009' and  nrComprobante = '00034582' and  tpLetra ='B' and
   tpComprobante = 'FA'


   update x set  x.nrDoc = '30-70704639-9' from TB_Comprobantes x 
 where nrTalonario = '0009' and  nrComprobante = '00034582' and  tpLetra ='B' and
   tpComprobante = 'FA'

   	    		


	


	select * into zTB_Comprobantes_errores_originales_201612 from TB_Comprobantes 
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2016 and 
	dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) = 0



	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2017 and month(dtComprobante) = 1

	
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where dsRazonSocial like '%PETROTECNA%'



	exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 13129



0008	00171595    	F	FA


exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0008',  /* FORMATO 0000*/
		@nrComprobante_param      = '00171595',
		@tpComprobante_param      = 'FA',
		@tpLetra_param            = 'B',
		@nrTalonario_new_param    = '0008',
		@nrComprobante_new_param  = '00171595',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B',
		@solo_cambio_cabecera_comprobante = 'SI'

------------------------------------------------------------------------------------------



 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 23
 

 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 1438
 

 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 23
 

 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 23
 

 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 23


 
 
	select * into zTB_Comprobantes_errores_originales_201701 from TB_Comprobantes 
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2016 and 
	dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) = 0


	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2017 and month(dtComprobante) = 1


		
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where dsRazonSocial like '%ANDREA CHERNIAVSKY%'


	update x set  x.nrDoc = '27-13211971-1' from TB_Comprobantes x 
where dsRazonSocial like '%ANDREA CHERNIAVSKY%'

   	    		


 
	select * into zTB_Comprobantes_errores_originales_201701 from TB_Comprobantes 
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2016 and 
	dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) = 0


	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 1


	
		
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where dsRazonSocial like '%ANDREA CHERNIAVSKY%'


	 
	select *  from TB_Comprobantes 
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2017 and 
	dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) = 0 and month(dtComprobante) = 1
	

	update x set  x.nrDoc = '27-13211971-1' from TB_Comprobantes x 
where dsRazonSocial like '%ANDREA CHERNIAVSKY%'



	
		
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where dsRazonSocial like '%RUBEN%'



	
 
	select * into zTB_Comprobantes_errores_originales_201702 from TB_Comprobantes 
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2017 and 
	dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) = 0  and month(dtComprobante) = 2


	
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 2


	
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where dsRazonSocial like '%GONZALEZ SERGIO EDUARDO%'
	
	select *  from TB_Comprobantes 
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2017 and 
	dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) = 0  and month(dtComprobante) = 2


---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

	

 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 2 , @anio = 2017 , @renglon = 430
 
 	
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where tpLetra  in ('F') and  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 2



	select 'exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = ''' + nrTalonario   + ''' , 
		@nrComprobante_param      =  ''' + nrComprobante + ''' , 
		@tpComprobante_param      = ''FA'' , 
		@tpLetra_param            = ''' + tpLetra + ''',
		@nrTalonario_new_param    = ''' + nrTalonario   + ''',
		@nrComprobante_new_param  =  '''+ nrComprobante   + ''',
		@tpComprobante_new_param  = ''FA'',
		@tpLetra_new_param        = ''B'', @solo_cambio_cabecera_comprobante = ''SI'' '
		FROM TB_Comprobantes where tpLetra = 'F' and  tpComprobante = 'FA'


		select *  FROM TB_Comprobantes where tpLetra = 'F' and  tpComprobante = 'FA'

exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0008' , 
		@nrComprobante_param      =  '00171595    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0008',
		@nrComprobante_new_param  =  '00171595    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 


(No column name)
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0003' , 
		@nrComprobante_param      =  '00117277    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0003',
		@nrComprobante_new_param  =  '00117277    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00731891    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00731891    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00731908    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00731908    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00731998    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00731998    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00732678    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00732678    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00733976    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00733976    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00734634    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00734634    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00735100    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00735100    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00735416    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00735416    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0006' , 
		@nrComprobante_param      =  '00735939    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0006',
		@nrComprobante_new_param  =  '00735939    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00512587    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00512587    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00512589    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00512589    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00514245    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00514245    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00516735    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00516735    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0007' , 
		@nrComprobante_param      =  '00516741    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0007',
		@nrComprobante_new_param  =  '00516741    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 
exec [dbo].[SP_ActualizarComprobante_v4_9]
		@nrTalonario_param        = '0001' , 
		@nrComprobante_param      =  '00201273    ' , 
		@tpComprobante_param      = 'FA' , 
		@tpLetra_param            = 'F',
		@nrTalonario_new_param    = '0001',
		@nrComprobante_new_param  =  '00201273    ',
		@tpComprobante_new_param  = 'FA',
		@tpLetra_new_param        = 'B', @solo_cambio_cabecera_comprobante = 'SI' 




	

 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 2 , @anio = 2017 , @renglon = 3233


 
	
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where tpLetra  in ('B') and  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 2 and vlTotalGeneral > 999



 	
	0001	00201265    	B	FA
	

  select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok,  tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
 where nrTalonario = '0001' and  nrComprobante = '00201265' and  tpLetra ='B' and   tpComprobante = 'FA'

 

  update c  set c.nrDoc = ''  ,  c.dsRazonSocial = '' from TB_Comprobantes  c 
 where nrTalonario = '0001' and  nrComprobante = '00201265' and  tpLetra ='B' and   tpComprobante = 'FA'


 
 	
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante from TB_Comprobantes 
	where tpLetra  in ('B') and  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 2 and vlTotalGeneral > 999
	and dsRazonSocial ='' and (nrDoc='' or nrDoc is null)


	

 -- para que salgo por cod_dgi 90 tiene que tener 'Consumidor Final' es razon social 
 update c  set c.nrDoc = null  ,  c.dsRazonSocial = 'Consumidor Final' from TB_Comprobantes  c 
 where nrTalonario = '0001' and  nrComprobante = '00201265' and  tpLetra ='B' and   tpComprobante = 'FA'
