


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
	where tpLetra  in ('A','M') and  tpComprobante = 'FA'  and year(dtComprobante) = 2016 and month(dtComprobante) = 12

	
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
