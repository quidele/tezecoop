

	 
	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 10 and vlTotalGeneral > 999  and tpIVA = 'CF'


	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 10  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 10 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 10  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)



	
  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 10 , @anio = 2017

  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes =10 , @anio = 2017


    
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 10 , @anio = 2017, @renglon = 951

  

  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral,    * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001215'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30557479364' from TB_Comprobantes x     where  nrTalonario = '0001'
  and nrComprobante = '00001215'   and tpLetra ='M' and tpComprobante = 'FA'


exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 10 , @anio = 2017, @renglon = 1650



  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral, flAnulado,   * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001209'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30612865333' , dsRazonSocial = 'MAYCAR SA' from TB_Comprobantes x     where  nrTalonario = '0001'
  and nrComprobante = '00001209'   and tpLetra ='M' and tpComprobante = 'FA'

  select nrDoc , dsRazonSocial ,  * from TB_Comprobantes  x 	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 10 and  tpIVA = 'RI'
	and (x.dsRazonSocial_original is  null and   x.nrDoc_original  is  null)



exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 10 , @anio = 2017, @renglon = 3880

	
	0001	00001194    	M	FA

	

  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral, flAnulado,   * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001194'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30661020985'  from TB_Comprobantes x 
     where  nrTalonario = '0001'
  and nrComprobante = '00001194'   and tpLetra ='M' and tpComprobante = 'FA'


  
exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 10 , @anio = 2017, @renglon = 6913

  0001	00001170    	M	FA

  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral, flAnulado,   * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001170'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '20149155946' from TB_Comprobantes x     where  nrTalonario = '0001'
  and nrComprobante = '00001170'   and tpLetra ='M' and tpComprobante = 'FA'
  

  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 10 , @anio = 2017, @renglon = 7644

  0001	00001169    	M	FA


  
  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral, flAnulado,   * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001169'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30710635974' from TB_Comprobantes x     where  nrTalonario = '0001'
  and nrComprobante = '00001169'   and tpLetra ='M' and tpComprobante = 'FA'
  

    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 10 , @anio = 2017, @renglon = 8157

	
	0001	00001168    	M	FA
	  
  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral, flAnulado,   * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001168'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30710635974' from TB_Comprobantes x     where  nrTalonario = '0001'
  and nrComprobante = '00001168'   and tpLetra ='M' and tpComprobante = 'FA'
  














  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 2301


  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00001010'   and tpLetra ='M' and tpComprobante = 'FA'


  update x set x.nrDOC = '20-04194639-4' from TB_Comprobantes x  where  nrTalonario = '0001'
  and nrComprobante = '00001010'   and tpLetra ='M' and tpComprobante = 'FA'


  
    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 3073


	  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000996'   and tpLetra ='M' and tpComprobante = 'FA'

  30-51588124-7         
  30-58558124-7

  update x set x.nrDOC = '30-58558124-7' from TB_Comprobantes x where nrTalonario = '0001'
  and nrComprobante = '00000996'   and tpLetra ='M' and tpComprobante = 'FA'


  
    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 4130

	30714208760

	  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000990'   and tpLetra ='M' and tpComprobante = 'FA'

  30-51588124-7         
  30-58558124-7

  update x set x.nrDOC = '30714208760' from TB_Comprobantes x  where  nrTalonario = '0001'
  and nrComprobante = '00000990'   and tpLetra ='M' and tpComprobante = 'FA'

  5411

  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 5411

	30714208760

  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000982'   and tpLetra ='M' and tpComprobante = 'FA'

  GOYENECHE JOSE VICENTE CATALINO (20-21771739-7), Ezeiza ...
https://www.cuitonline.com/detalle/.../goyeneche-jose-vicente-catalino.html
Principal: 492120 - SERVICIOS DE TRANSPORTE AUTOMOTOR DE PASAJEROS MEDIANTE TAXIS Y REMISES, ALQUILER DE AUTOS CON CHOFER ...

  update x set x.nrDOC = '20-21771739-7' from TB_Comprobantes x  where  nrTalonario = '0001'
  and nrComprobante = '00000982'   and tpLetra ='M' and tpComprobante = 'FA'

 
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 6648

  
  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000971'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30710440413' from TB_Comprobantes x  where  nrTalonario = '0001'
  and nrComprobante = '00000971'   and tpLetra ='M' and tpComprobante = 'FA'

  
  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 6915

  
  select * from TB_Comprobantes  where  nrTalonario = '0006'
  and nrComprobante = '00008698'   and tpLetra ='A' and tpComprobante = 'FA'

  update x set x.nrDOC = '30710440413' from TB_Comprobantes x  where  nrTalonario = '0006'
  and nrComprobante = '00008698'   and tpLetra ='A' and tpComprobante = 'FA'

  

    
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 6916

  
  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000970    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30710440413' from TB_Comprobantes x  where  nrTalonario = '0001'
  and nrComprobante = '00000970    '   and tpLetra ='M' and tpComprobante = 'FA'

  7473

  Resultados de búsqueda
SOLANES GUSTAVO JAVIER (20-18479275-4 ... - Cuit Online

  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 7473

  
  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000965    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '20-18479275-4' from TB_Comprobantes x  where  nrTalonario = '0001'
  and nrComprobante = '00000965    '   and tpLetra ='M' and tpComprobante = 'FA'

  8622

  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 8622

  
  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000959    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30710440413' from TB_Comprobantes x  where  nrTalonario = '0001'
  and nrComprobante = '00000959    '   and tpLetra ='M' and tpComprobante = 'FA'

  8875
  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 8875

  
  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000956    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30600678694' from TB_Comprobantes x  where  nrTalonario = '0001'
  and nrComprobante = '00000956    '   and tpLetra ='M' and tpComprobante = 'FA'

   10720
  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 10720

  
  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000933    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = null  , x.dsRazonSocial  = null  , tpIVA = 'CF'  from TB_Comprobantes x  where  nrTalonario = '0001'
  and nrComprobante = '00000933    '   and tpLetra ='M' and tpComprobante = 'FA'

  11329

  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 11329

  
  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000930    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30-52745070-1'   from TB_Comprobantes x   where  nrTalonario = '0001'
  and nrComprobante = '00000930    '   and tpLetra ='M' and tpComprobante = 'FA'



  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 10720
  
  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000930    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30-52745070-1'   from TB_Comprobantes x   where  nrTalonario = '0001'
  and nrComprobante = '00000930    '   and tpLetra ='M' and tpComprobante = 'FA'



  

	
  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 8 , @anio = 2017

  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes =8 , @anio = 2017



  
  
  

  
  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000933    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = null  , x.dsRazonSocial  = null  , tpIVA = 'CF'  from TB_Comprobantes x  where  nrTalonario = '0001'
  and nrComprobante = '00000933    '   and tpLetra ='M' and tpComprobante = 'FA'

  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 10720
