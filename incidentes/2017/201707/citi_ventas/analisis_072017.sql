



	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
	-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
	-- Debemos modificar el store de generacion 

	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 7 and vlTotalGeneral > 999  and tpIVA = 'CF'


select x.dsRazonSocial_original , x.nrDoc_original
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 7 and vlTotalGeneral > 999  and tpIVA = 'CF' and
	( x.dsRazonSocial_original is not  null or   x.nrDoc_original  is not null)

	begin tran 

	update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 7 and vlTotalGeneral > 999  and tpIVA = 'CF'
	

	rollback tran 

	commit tran 

	


	

exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 7 , @anio = 2017 ,  @renglon = 6295


select nrDOC, dsRazonSocial ,  * from TB_Comprobantes
 where nrTalonario = '0001' and nrComprobante = '00000849'
      and  tpLetra = 'M' and tpComprobante = 'FA'



	begin tran 

	update x set  x.nrDoc =  '33714720789'
	 from TB_Comprobantes  x 
	where   year(dtComprobante) = 2017 
	and month(dtComprobante) = 7 and nrTalonario = '0001' and nrComprobante = '00000849'
      and  tpLetra = 'M' and tpComprobante = 'FA'

	commit tran 



	exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 7 , @anio = 2017 ,  @renglon = 6963

	-- 0001	00000846    	M	FA

	
select nrDOC, dsRazonSocial ,  * from TB_Comprobantes
 where nrTalonario = '0001' and nrComprobante = '00000846'
      and  tpLetra = 'M' and tpComprobante = 'FA'
	  --- 30712405437


	  
	begin tran 

	update x set  x.nrDoc =  '30712405437'
	 from TB_Comprobantes  x 
	where   year(dtComprobante) = 2017 
	and month(dtComprobante) = 7 and nrTalonario = '0001' and nrComprobante = '00000846'
      and  tpLetra = 'M' and tpComprobante = 'FA'
--	  rollback tran 
	commit tran 


	exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 7 , @anio = 2017 ,  @renglon = 7384

	--0001	00000842    	M	FA


	
select nrDOC, dsRazonSocial ,  * from TB_Comprobantes
 where nrTalonario = '0001' and nrComprobante = '00000842'
      and  tpLetra = 'M' and tpComprobante = 'FA'
	  --- 30712405437


	  
	begin tran 

	update x set  x.nrDoc =  '30687481751'
	 from TB_Comprobantes  x 
	where   year(dtComprobante) = 2017 
	and month(dtComprobante) = 7 and nrTalonario = '0001' and nrComprobante = '00000842'
      and  tpLetra = 'M' and tpComprobante = 'FA'
--	  rollback tran 
	commit tran 


	
	exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 7 , @anio = 2017 ,  @renglon = 7563

	--0001	00000842    	M	FA


	
select nrDOC, dsRazonSocial ,  * from TB_Comprobantes
 where nrTalonario = '0001' and nrComprobante = '00000844'
      and  tpLetra = 'M' and tpComprobante = 'FA'
	  --- 30712405437


	  
	begin tran 

	update x set  x.nrDoc =  '30652621151'
	 from TB_Comprobantes  x 
	where   year(dtComprobante) = 2017 
	and month(dtComprobante) = 7 and nrTalonario = '0001' and nrComprobante = '00000844'
      and  tpLetra = 'M' and tpComprobante = 'FA'
--	  rollback tran 
	commit tran 


	
	
	exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 7 , @anio = 2017 ,  @renglon = 11355

	--0001	00000816    	M	FA


	
select nrDOC, dsRazonSocial ,  * from TB_Comprobantes
 where nrTalonario = '0001' and nrComprobante = '00000816'
      and  tpLetra = 'M' and tpComprobante = 'FA'
	  --- 30712405437


	  
	begin tran 

	update x set  x.nrDoc =  '30612865333'
	 from TB_Comprobantes  x 
	where   year(dtComprobante) = 2017 
	and month(dtComprobante) = 7 and nrTalonario = '0001' and nrComprobante = '00000816'
      and  tpLetra = 'M' and tpComprobante = 'FA'
--	  rollback tran 
	commit tran 



		
  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 7 , @anio = 2017

  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 7 , @anio = 2017

    exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 8 , @anio = 2017

  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 8 , @anio = 2017