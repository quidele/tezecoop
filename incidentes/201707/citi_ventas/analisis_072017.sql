



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

	
  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 7 , @anio = 2017

  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 7 , @anio = 2017

  
