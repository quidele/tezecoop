

	 
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

	
 -- 0001	00001168    	M	FA
	  
  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral, flAnulado,   * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001168'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30710635974' from TB_Comprobantes x     where  nrTalonario = '0001'
  and nrComprobante = '00001168'   and tpLetra ='M' and tpComprobante = 'FA'
  
exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 10 , @anio = 2017, @renglon = 8995
  -- 0001	00001161    	M	FA

  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral, flAnulado,   * from TB_Comprobantes 
  where  nrTalonario = '0001'   and nrComprobante = '00001161'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30710635974' , dsRazonSocial = 'GRUPO DAFING SRL' from TB_Comprobantes x     where  nrTalonario = '0001'
  and nrComprobante = '00001161'   and tpLetra ='M' and tpComprobante = 'FA'

  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 10 , @anio = 2017, @renglon = 11044

  -- 0001	00001150    	M	FA
  
  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral, flAnulado,   * from TB_Comprobantes 
  where  nrTalonario = '0001'   and nrComprobante = '00001150'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '20-18815577-5'  from TB_Comprobantes x     where  nrTalonario = '0001'
  and nrComprobante = '00001150'   and tpLetra ='M' and tpComprobante = 'FA'


  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 10 , @anio = 2017, @renglon = 11681

  -- 0001	00001145    	M	FA
  -- Ccic South America S.r.l - CUIT 30-71032033-7 | Dateas.com
    
  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral, flAnulado,   * from TB_Comprobantes 
  where  nrTalonario = '0001'   and nrComprobante = '00001145'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30-71032033-7'  from TB_Comprobantes x     where  nrTalonario = '0001'
  and nrComprobante = '00001145'   and tpLetra ='M' and tpComprobante = 'FA'

  

  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 10 , @anio = 2017, @renglon = 11682

  -- 0001	00001146    	M	FA
  -- Ccic South America S.r.l - CUIT 30-71032033-7 | Dateas.com
    
  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral, flAnulado,   * from TB_Comprobantes 
  where  nrTalonario = '0001'   and nrComprobante = '00001146'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30-71032033-7' , dsRazonSocial = 'Ccic South America S.r.l'  from TB_Comprobantes x     where  nrTalonario = '0001'
  and nrComprobante = '00001146'   and tpLetra ='M' and tpComprobante = 'FA'


  


  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 10 , @anio = 2017, @renglon = 13805

  -- 0001	00001130    	M	FA
  -- Ccic South America S.r.l - CUIT 30-71032033-7 | Dateas.com
    
  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral, flAnulado,   * from TB_Comprobantes 
  where  nrTalonario = '0001'   and nrComprobante = '00001130'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30710440413'   from TB_Comprobantes x     where  nrTalonario = '0001'
  and nrComprobante = '00001130'   and tpLetra ='M' and tpComprobante = 'FA'


  
	exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 10 , @anio = 2017, @renglon = 1650

	-- 0001	00001209    	M	FA

  select nrDoc , dsRazonSocial , tpIVA , vlTotalGeneral, flAnulado,   * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001209'   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30612865333' , dsRazonSocial = 'MAYCAR SA' from TB_Comprobantes x     where  nrTalonario = '0001'
  and nrComprobante = '00001209'   and tpLetra ='M' and tpComprobante = 'FA'





  ---------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------
  
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

  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 10720

  
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


  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 8 , @anio = 2017, @renglon = 10720


  select * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00000933    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set x.nrDOC = '30-70951591-4'  , x.dsRazonSocial  = 'QHSE ENERGY SERVICE SA'  , tpIVA = 'RI'  from TB_Comprobantes x  
  where  nrTalonario = '0001'
  and nrComprobante = '00000933    '   and tpLetra ='M' and tpComprobante = 'FA'


  ----------------------------------------------------------------------------------------
  ---------------------- ARREGLANDO MES 09-2-2017  ---------------------------------------
  ----------------------------------------------------------------------------------------


  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 9 , @anio = 2017, @renglon = 4021
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 9 , @anio = 2017, @renglon = 4052
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 9 , @anio = 2017, @renglon = 5178


    ----------------------------------------------------------------------------------------
  ---------------------- ARREGLANDO MES 11-2017  ---------------------------------------
  ----------------------------------------------------------------------------------------


  

	 
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
	and month(dtComprobante) = 11  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 11 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 11  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)

	
	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 12 and vlTotalGeneral > 999  and tpIVA = 'CF'


	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 12  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 12 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 12  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


	NREG_ERR;DESC ERR
1227;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR NO PUEDE SER IGUAL A CERO 0  CUANDO EL TIPO DE DOCUMENTO ES DISTINTO A 99
5982;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
7689;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
7936;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
10880;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
11011;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
12203;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES







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
	and month(dtComprobante) = 11  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 11 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 11  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)





	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 12 and vlTotalGeneral > 999  and tpIVA = 'CF'


	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 12  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 12 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 12  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)






  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 11 , @anio = 2017, @renglon = 1227


  --- 0007	00565843    	B	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes  where  nrTalonario = '0007'
  and nrComprobante = '00565843    '   and tpLetra ='B' and tpComprobante = 'FA'

  update x set x.nrDOC = '30-70817886-8'  , x.dsRazonSocial  = 'INDIGO CONSULTING SA'   from TB_Comprobantes x  
where  nrTalonario = '0007'
  and nrComprobante = '00565843    '   and tpLetra ='B' and tpComprobante = 'FA'


  

  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 11 , @anio = 2017, @renglon = 5982


  --- 0001	00001633    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001633    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set x.nrDOC = '30714224952'  , x.dsRazonSocial  = 'BREMEN S.R.L.'   from TB_Comprobantes x  
 where  nrTalonario = '0001'
  and nrComprobante = '00001633    '   and tpLetra ='A' and tpComprobante = 'FA'




  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 11 , @anio = 2017, @renglon = 7689


  ---0006	00782084    	B	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0006'
  and nrComprobante = '00782084    '   and tpLetra ='B' and tpComprobante = 'FA'

  update x set x.nrDOC = '30-71451032-7'     from TB_Comprobantes x  
   where  nrTalonario = '0006'
  and nrComprobante = '00782084    '   and tpLetra ='B' and tpComprobante = 'FA'


  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 11 , @anio = 2017, @renglon = 7936


  --- 0001	00001616    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001616    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set x.nrDOC = '30-71126072-9' , dsRazonSocial = 'DEMEQ SRL'      from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001616    '   and tpLetra ='A' and tpComprobante = 'FA'


  select  dsRazonSocial , NRdoc   from TB_Comprobantes  where dsRazonSocial like '%DEM%'
  ORDER BY dsRazonSocial


  ----------------------------------------------------

  
  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 11 , @anio = 2017, @renglon = 10880


  --- 0001	00001587    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001587    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set x.nrDOC = '20112486934'       from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001587    '   and tpLetra ='A' and tpComprobante = 'FA'


  

  ----------------------------------------------------

  
  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 11 , @anio = 2017, @renglon = 11011


  --- 0001	00001589    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001589    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-71126072-9' , dsRazonSocial = 'DEMEQ SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001589    '   and tpLetra ='A' and tpComprobante = 'FA'



  

  ----------------------------------------------------

  
  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 11 , @anio = 2017, @renglon = 12203


  --- 0001	00001578    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001578    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-71126072-9' , dsRazonSocial = 'DEMEQ SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001578    '   and tpLetra ='A' and tpComprobante = 'FA'



exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 11 , @anio = 2017
exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 11  , @anio = 2017


-------------------------- MES 12-2017 ------------------------------

NREG_ERR;DESC ERR
1664;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
7872;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
9094;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
11189;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
11560;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
13188;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO



  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 12 , @anio = 2017, @renglon = 1664


  --- 0001	00001740    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001740    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-71126072-9' , dsRazonSocial = 'DEMEQ SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001740    '   and tpLetra ='A' and tpComprobante = 'FA'

  ----------------------------------


  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 12 , @anio = 2017, @renglon = 7872


  --- 0001	00001717    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001717    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '33680059999' , dsRazonSocial = 'NUCLEOELECTRICA ARGENTINA S.A'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001717    '   and tpLetra ='A' and tpComprobante = 'FA'


  
  ----------------------------------


  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 12 , @anio = 2017, @renglon = 9094


  ---0001	00001711    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001711    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30709804460' , dsRazonSocial = 'PLW WORLD GROUP SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001711    '   and tpLetra ='A' and tpComprobante = 'FA'


  
  ----------------------------------


  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 12 , @anio = 2017, @renglon = 11189


  --- 0001	00001686    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001686    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30710153260' , dsRazonSocial = 'SERGIO BRIZIO S.R.L.'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001686    '   and tpLetra ='A' and tpComprobante = 'FA'


  
  ----------------------------------


  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 12 , @anio = 2017, @renglon = 11560


  --- 0001	00001685    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001685    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30707879013' , dsRazonSocial = 'UPU Y ASOCIADOS'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001685    '   and tpLetra ='A' and tpComprobante = 'FA'


  
  
  ----------------------------------


  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 12 , @anio = 2017, @renglon = 13188


  --- 0001	00001678    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001678    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '20164787363' , dsRazonSocial = 'RUIZ JORGE MARIO'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001678    '   and tpLetra ='A' and tpComprobante = 'FA'


  


exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 12 , @anio = 2017
exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 12  , @anio = 2017




	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 1 and vlTotalGeneral > 999  and tpIVA = 'CF'


	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 1  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 1 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 1  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 1 , @anio = 2018
exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 1  , @anio = 2018

NREG_ERR;DESC ERR
3335;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
6496;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
7497;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
7600;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
10095;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
10138;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
12837;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO


  ----------------------------------


  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 1 , @anio = 2018, @renglon = 3335

  ---  0001	00001797    	A	FA 
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001797    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-61645466-4' , dsRazonSocial = 'PROTECCION CATODICA DEL COMAHUE SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001797    '   and tpLetra ='A' and tpComprobante = 'FA'


  ----------------------------------------

    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 1 , @anio = 2018, @renglon = 6496

  ---  0001	00001779    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001779    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-52674844-8' , dsRazonSocial = 'PROTECCION CATODICA DEL COMAHUE SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001779    '   and tpLetra ='A' and tpComprobante = 'FA'


   ----------------------------------------

    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 1 , @anio = 2018, @renglon = 7497

  --- 0001	00001773    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001773    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '33715222049' , dsRazonSocial = 'JUNAR ARGENTINA S.R.L.'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001773    '   and tpLetra ='A' and tpComprobante = 'FA'


  ----------------------------------------

    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 1 , @anio = 2018, @renglon = 7600

  --- 0001	00001771    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001771    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30707014977' , dsRazonSocial = 'HQ SOLUTIONS SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001771    '   and tpLetra ='A' and tpComprobante = 'FA'



  
  ----------------------------------------

    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 1 , @anio = 2018, @renglon = 10095

  ---0001	00001761    	A	FA
  
  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001761    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '20289163221' , dsRazonSocial = 'BERMUDEZ GUSTAVO SEBASTIAN'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001761    '   and tpLetra ='A' and tpComprobante = 'FA'

   ----------------------------------------

    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 1 , @anio = 2018, @renglon = 10138

  ---0001	00001762    	A	FA


  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001762    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-60737179-9' , dsRazonSocial = 'AUTOSERVICIO MAYORISTA DIARCO S.A'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001762    '   and tpLetra ='A' and tpComprobante = 'FA'



   ----------------------------------------

    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 1 , @anio = 2018, @renglon = 12837

  --- 0001	00001753    	A	FA


  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001753    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30710844468' , dsRazonSocial = 'CAMPO CINE SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001753    '   and tpLetra ='A' and tpComprobante = 'FA'



  
exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 1 , @anio = 2018
exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 1  , @anio = 2018




-------------------------------


	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 2 and vlTotalGeneral > 999  and tpIVA = 'CF'


	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 2  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 2 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 2  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018
exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 2  , @anio = 2018

/*

NREG_ERR;DESC ERR
1138;EL CAMPO CODIGO DE DOCUMENTO DEL COMPRADOR DEBE SER IGUAL A 80 - CUIT
2227;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
3098;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
3599;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
4357;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
7440;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
8897;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
10176;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
10212;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
12714;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES

*/ 




   ----------------------------------------
    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2017, @renglon = 103

  --- 0001	00001753    	A	FA


  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00001753    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30710844468' , dsRazonSocial = 'CAMPO CINE SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00001753    '   and tpLetra ='A' and tpComprobante = 'FA'

  -------------------------------------------------------------
  -------------------------------------------------------------


  -------------------------------------------------------------

	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 2 and vlTotalGeneral > 999  and tpIVA = 'CF'


	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 2  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 2 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 2  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)



---------------------------------------------------------------------------


NREG_ERR;DESC ERR
1138;EL CAMPO CODIGO DE DOCUMENTO DEL COMPRADOR DEBE SER IGUAL A 80 - CUIT
2227;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
3098;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
3599;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
4357;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
7440;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
8897;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
10176;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
10212;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
12714;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES



  -----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018, @renglon = 1138

  --- 0001	00001753    	A	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001753    '   and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30710844468' , dsRazonSocial = 'CAMPO CINE SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001753    '   and tpLetra ='A' and tpComprobante = 'FA'



    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2017, @renglon = 103

  --- 0001	00000705    	M	FA


  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00000705    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30710844468' , dsRazonSocial = 'CAMPO CINE SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00000705    '   and tpLetra ='M' and tpComprobante = 'FA'

  -----------------------------------------------
  
    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2017, @renglon = 6328

  --- 0001	00000672    	M	FA


  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00000672    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30710844468' , dsRazonSocial = 'CAMPO CINE SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00000672    '   and tpLetra ='M' and tpComprobante = 'FA'

  ------------------------------------

  
  -----------------------------------------------
  
    exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2017, @renglon = 6474

  --- 0001	00000670    	M	FA


  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'
  and nrComprobante = '00000670    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30710844468' , dsRazonSocial = 'CAMPO CINE SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'
  and nrComprobante = '00000670    '   and tpLetra ='M' and tpComprobante = 'FA'

  
  -----------------------------------------------



  
exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2017
exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 6  , @anio = 2017

---------------------------------------------------



  -----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018, @renglon = 1138

  --- 0001	00001305    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001305    '   and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-68266220-0' , dsRazonSocial = 'MARYTIME SERVISES LINE ARGENTINA S.A'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001305    '   and tpLetra ='M' and tpComprobante = 'FA'


   
  -----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018, @renglon = 2227

  --- 0001	00001299    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001299    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30708051477' , dsRazonSocial = 'TANK ALUMINIUM'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001299    '   and tpLetra ='M' and tpComprobante = 'FA'

   
  -----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018, @renglon = 3098

  --- 0001	00001288    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001288    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30715381075' , dsRazonSocial = 'NUSA SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001288    '   and tpLetra ='M' and tpComprobante = 'FA'


   
  -----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018, @renglon = 3599

  --- 0001	00001286    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001286    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '27184210954' , dsRazonSocial = 'ANDREA KARINA RABAGLIATI'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001286    '   and tpLetra ='M' and tpComprobante = 'FA'


  
  
  -----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018, @renglon = 4357

  --- 0001	00001282    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001282    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30715383388' , dsRazonSocial = 'DMCO SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001282    '   and tpLetra ='M' and tpComprobante = 'FA'

   
  -----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018, @renglon = 7440

  --- 0001	00001262    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001262    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-71026509-3' , dsRazonSocial = 'CABBONLINE SA'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001262    '   and tpLetra ='M' and tpComprobante = 'FA'

   
  -----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018, @renglon = 8897

  --- 0001	00001258    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001258    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-71026509-3' , dsRazonSocial = 'CABBONLINE SA'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001258    '   and tpLetra ='M' and tpComprobante = 'FA'

   
  -----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018, @renglon = 10176

  --- 0001	00001844    	A	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001844    ' 
     and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30676108137' , dsRazonSocial = 'EDRA SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001844    '   and tpLetra ='A' and tpComprobante = 'FA'


   
  -----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018, @renglon = 10212

  --- 0001	00001842    	A	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001842    ' 
     and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-68266220-0' , dsRazonSocial = 'MARYTIME SERVISES LINE ARGENTINA S.A'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001842    '   and tpLetra ='A' and tpComprobante = 'FA'


   
  -----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018, @renglon = 12714

  --- 0001	00001824    	A	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001824    ' 
     and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '23123000234' , dsRazonSocial = 'FREJMAN MONICA'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001824    '   and tpLetra ='A' and tpComprobante = 'FA'


   exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 2 , @anio = 2018
exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 2  , @anio = 2018





	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 3 and vlTotalGeneral > 999  and tpIVA = 'CF'


	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 3  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 3 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 3  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 3 , @anio = 2018
exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 3  , @anio = 2018



NREG_ERR;DESC ERR
3157;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
4875;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
5185;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
5589;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
9163;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
11734;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
14514;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO


  ----------------------------------------------------------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 3 , @anio = 2018, @renglon = 3157

  --- 0001	00001824    	A	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001824    ' 
     and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '23123000234' , dsRazonSocial = 'FREJMAN MONICA'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001824    '   and tpLetra ='A' and tpComprobante = 'FA'


   exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 3 , @anio = 2018
   exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 3 , @anio = 2018



   
 exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 3 , @anio = 2018, @renglon = 3157

    --- 0001	00001370    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001370    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30712259333' , dsRazonSocial = 'BTL ARG. SRL'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001370    '  
    and tpLetra ='M' and tpComprobante = 'FA'


-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 3 , @anio = 2018, @renglon = 4875

    --- 0001	00001366    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001366    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '27252268354' , dsRazonSocial = 'WERNING IRINA'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001366    '  
    and tpLetra ='M' and tpComprobante = 'FA'

	
-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 3 , @anio = 2018, @renglon = 5185

    --- 0001	00001364    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001364    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30710440413' , dsRazonSocial = 'GEO CONSULT BUENOS AIRES'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001364    '  
    and tpLetra ='M' and tpComprobante = 'FA'

	
-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 3 , @anio = 2018, @renglon = 5589

    --- 0006	00008704    	A	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0006'  and nrComprobante = '00008704    ' 
     and tpLetra ='A' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30710440413' , dsRazonSocial = 'GEO CONSULT BUENOS AIRES'         from TB_Comprobantes x  
   where  nrTalonario = '0006'   and nrComprobante = '00008704    '  
    and tpLetra ='A' and tpComprobante = 'FA'

	
-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 3 , @anio = 2018, @renglon = 9163

    --- 0001	00001342    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001342    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30710440413' , dsRazonSocial = 'GEO CONSULT BUENOS AIRES'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001342    '  
    and tpLetra ='M' and tpComprobante = 'FA'

	
-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 3 , @anio = 2018, @renglon = 11734

    --- 0001	00001325    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001325    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '27-23803724-2' , dsRazonSocial = 'TABOADA CECILIA ANA'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001325    '  
    and tpLetra ='M' and tpComprobante = 'FA'


	
-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 3 , @anio = 2018, @renglon = 14514

    --- 0001	00001314    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001314    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30711295735' , dsRazonSocial = 'WUP SA'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001314    '  
    and tpLetra ='M' and tpComprobante = 'FA'

	----------------------------------
	   exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 3 , @anio = 2018
   exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 3 , @anio = 2018


   --------------------------------------------------

   
	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 4 and vlTotalGeneral > 999  and tpIVA = 'CF'


	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 4  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 4 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 4  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


	  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 4 , @anio = 2018
   exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 4 , @anio = 2018


   NREG_ERR;DESC ERR
1136;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
8675;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
9939;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
10655;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
11567;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
12058;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
13730;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES

   
-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 4 , @anio = 2018, @renglon = 1136

    --- 0001	00001457    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001457    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-65330946-1' , dsRazonSocial = 'FUNDACION OCTUBRE TRABAJADORES DE EDIFICIOS'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001457    '  
    and tpLetra ='M' and tpComprobante = 'FA'

	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 4 , @anio = 2018, @renglon = 8675

    --- 0001	00001416    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001416    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30711538395' , dsRazonSocial = 'CPI &T S.R.L'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001416    '  
    and tpLetra ='M' and tpComprobante = 'FA'


	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 4 , @anio = 2018, @renglon = 9939

    --- 0001	00001399    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001399    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30711538395' , dsRazonSocial = 'CPI &T S.R.L'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001399    '  
    and tpLetra ='M' and tpComprobante = 'FA'


	
	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 4 , @anio = 2018, @renglon = 10655

    --- 0001	00001393    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001393    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30500010912' , dsRazonSocial = 'BANCO NACION'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001393    '  
    and tpLetra ='M' and tpComprobante = 'FA'

	
	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 4 , @anio = 2018, @renglon = 11567

    --- 0001	00001391    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001391    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30696845995' , dsRazonSocial = 'BEC CONSULTING GROUP'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001391    '  
    and tpLetra ='M' and tpComprobante = 'FA'

	
	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 4 , @anio = 2018, @renglon = 12058

    --- 0001	00001386    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001386    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30696845995' , dsRazonSocial = 'BEC CONSULTING GROUP'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001386    '  
    and tpLetra ='M' and tpComprobante = 'FA'
		
	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 4 , @anio = 2018, @renglon = 13730

    --- 0001	00001383    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001383    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '33-71042051-9' , dsRazonSocial = 'ALFALFA Y FORRAJE DE LA PATAGONIA S.A.'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001383    '  
    and tpLetra ='M' and tpComprobante = 'FA'

	
	  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 5 , @anio = 2018
   exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 5 , @anio = 2018


   
   voy por acaC --- LUNES 9 DE JULIO 15.56
	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 5 and vlTotalGeneral > 999  and tpIVA = 'CF'


	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 5  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 5 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 5  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)



	   
   voy por acaC --- LUNES 9 DE JULIO 15.56
	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 5 and vlTotalGeneral > 999  and tpIVA = 'CF'


	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 5  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 5 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 5  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)



   exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 5 , @anio = 2018
   exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 5 , @anio = 2018


   		
	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 5 , @anio = 2018, @renglon = 2366

    --- 0001	00001540    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001540    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30546832151' , dsRazonSocial = 'G E LOMBARDOZZI'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001540    '  
    and tpLetra ='M' and tpComprobante = 'FA'

		-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 5 , @anio = 2018, @renglon = 2547

    --- 0001	00001538    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001538    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30694748534' , dsRazonSocial = 'DX CONTROLS SA'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001538    '  
    and tpLetra ='M' and tpComprobante = 'FA'
	
		-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 5 , @anio = 2018, @renglon = 6677

    --- 0009	00050229    	B	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0009'  and nrComprobante = '00050229    ' 
     and tpLetra ='B' and tpComprobante = 'FA'

  update x set   x.nrDOC = '33714441979' , dsRazonSocial = 'ECHO S.A'         from TB_Comprobantes x  
   where  nrTalonario = '0009'   and nrComprobante = '00050229    '  
    and tpLetra ='B' and tpComprobante = 'FA'

	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 5 , @anio = 2018, @renglon = 9653

    --- 0001	00001504    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001504    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-68266220-0' , dsRazonSocial = 'MARYTIME SERVISES LINE ARGENTINA S.A'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001504    '  
    and tpLetra ='M' and tpComprobante = 'FA'


	
   exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 5 , @anio = 2018
   exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 5 , @anio = 2018


   

	
   exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2018
   exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 6 , @anio = 2018



   
   voy por acaC --- LUNES 9 DE JULIO 15.56
	 	--- SITUACION CON IMPORTE SUPERA LOS 999 PESOS
		-- Debemos poner en null al nrDOC y en dsRazonSocial Consumidor Final
		-- Debemos modificar el store de generacion 
	select dbo.ufn_ValidarCUIT_v4_9_4 (nrDoc) as cuitok, 
	tpIVA, nrDoc , vlTotalGeneral, dsRazonSocial,
	nrTalonario, nrComprobante  ,   tpLetra , tpComprobante 
	 from TB_Comprobantes 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 6 and vlTotalGeneral > 999  and tpIVA = 'CF'


	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 6  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null


	
select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 6 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2018 
	and month(dtComprobante) = 6  and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


	  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2018
   exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 6 , @anio = 2018



   
	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2018, @renglon = 5501

    --- 0001	00001598    	M	FA


  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001598    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30-68266220-0' , dsRazonSocial = 'MARYTIME SERVISES LINE ARGENTINA S.A'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001598    '  
    and tpLetra ='M' and tpComprobante = 'FA'

	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2018, @renglon = 8140

    --- 0001	00001585    	M	FA


  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001585    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30712907203' , dsRazonSocial = 'LOZE EMERIC PHILIPPE MARIE'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001585    '  
    and tpLetra ='M' and tpComprobante = 'FA'

	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2018, @renglon = 9100

    --- 0001	00001573    	M	FA


  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001573    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30711272360' , dsRazonSocial = 'LOZE EMERIC PHILIPPE MARIE'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001573    '  
    and tpLetra ='M' and tpComprobante = 'FA'


	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2018, @renglon = 9699

    --- 0001	00001568    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001568    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.tpIVA ='CF' , x.nrDoc = null , x.dsRazonSocial =    'Consumidor Final'      from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001568    '  
    and tpLetra ='M' and tpComprobante = 'FA'

	-----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2018, @renglon = 11136

    --- 0001	00001563    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001563    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.nrDOC = '30710440413' , dsRazonSocial = 'GEO CONSULT BUENOS AIRES'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001563    '  
    and tpLetra ='M' and tpComprobante = 'FA'




	----------------------------------------------
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2018, @renglon = 9699

    --- 0001	00001568    	M	FA

  select flAnulado ,  tpIVA, nrDOC, dsRazonSocial,  vlTotalGeneral,  * from TB_Comprobantes 
   where  nrTalonario = '0001'  and nrComprobante = '00001568    ' 
     and tpLetra ='M' and tpComprobante = 'FA'

  update x set   x.tpIVA ='CF' , x.nrDoc = null , x.dsRazonSocial =    'Consumidor Final'      from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001568    '  
    and tpLetra ='M' and tpComprobante = 'FA'

	

	
  update x set   x.nrDOC = '30-68266220-0' , dsRazonSocial = 'MARYTIME SERVISES LINE ARGENTINA S.A'         from TB_Comprobantes x  
   where  nrTalonario = '0001'   and nrComprobante = '00001568    '  
    and tpLetra ='M' and tpComprobante = 'FA'

   exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 6 , @anio = 2018
   exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes = 6 , @anio = 2018