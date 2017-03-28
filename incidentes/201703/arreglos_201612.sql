


 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 101

  select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
 where nrTalonario = '0006' and  nrComprobante = '00008565' and  tpLetra ='A' and
   tpComprobante = 'FA'

 0006	00008565    	A	FA


 select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * 
       from TB_Comprobantes where dsRazonSocial like 'GODALIA%'


	   
update  x set  nrDoc = '20254752224'
       from TB_Comprobantes x  where dsRazonSocial like 'GODALIA%'



 exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 12 , @anio = 2016 , @renglon = 1325

 0002	00012959    	M	FA

   select tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial, * from TB_Comprobantes 
 where nrTalonario = '0002' and  nrComprobante = '00012959' and  tpLetra ='M' and
   tpComprobante = 'FA'
