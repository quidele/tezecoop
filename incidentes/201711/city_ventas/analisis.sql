


--Agregamos campos para la nueva regneracion 	   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='dsRazonSocial_original')
     ALTER TABLE TB_Comprobantes ADD dsRazonSocial_original VARCHAR(100) NULL

	   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes' and COLUMN_NAME='nrDoc_original')
     ALTER TABLE TB_Comprobantes ADD nrDoc_original CHAR(20) NULL


	 
	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 11 and vlTotalGeneral > 999  and tpIVA = 'CF'



	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 11 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null



select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 11 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 11 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)



	
  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 11 , @anio = 2017

  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes =11 , @anio = 2017


  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 11 , @anio = 2017, @renglon = 1277
 
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 11 , @anio = 2017, @renglon = 1416




