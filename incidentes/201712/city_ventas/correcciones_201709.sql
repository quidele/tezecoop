


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
	and month(dtComprobante) = 8 and vlTotalGeneral > 999  and tpIVA = 'CF'



	update x set x.dsRazonSocial_original = x.dsRazonSocial , x.nrDoc_original =  x.nrDoc
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 8 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and x.dsRazonSocial_original is null and  x.nrDoc_original  is null



select *
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 8 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)


update x set  x.dsRazonSocial = 'Consumidor Final' , x.nrDoc =  null
	 from TB_Comprobantes  x 
	where  tpComprobante = 'FA'  and year(dtComprobante) = 2017 
	and month(dtComprobante) = 8 and vlTotalGeneral > 999  and tpIVA = 'CF'
	and (x.dsRazonSocial_original is not null or   x.nrDoc_original  is not null)



	
  exec  [dbo].[spu_obtieneDatosCITIVentas_v4_9_4] @mes = 9 , @anio = 2017

  exec spu_obtieneDatosCITIVentas_Alicuotas_v4_9 @mes =9 , @anio = 2017


/*
  NREG_ERR;DESC ERR
4021;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
4052;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
5178;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
7074;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
7161;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
7703;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
8115;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
8249;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
8250;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
9249;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
9250;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
10676;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
10769;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR DEBE SER NUMERICO Y DE 11 POSICIONES
13241;EL CAMPO NUMERO DE IDENTIFICACION DEL COMPRADOR ES INVALIDO
*/


  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 9 , @anio = 2017, @renglon = 4021

  
 -- 0001	00001095    	M	FA
  select  dsRazonSocial ,  nrDOC  , * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00001095'   and tpLetra ='M' and tpComprobante = 'FA'

  
  update x set x.nrDOC = null  , x.dsRazonSocial  = null  , tpIVA = 'CF'  from TB_Comprobantes x 
  where  nrTalonario = '0001'
  and nrComprobante = '00001095'   and tpLetra ='M' and tpComprobante = 'FA'


  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 9 , @anio = 2017, @renglon = 5178

  -- 0001	00001098    	M	FA
   select  dsRazonSocial ,  nrDOC  , flAnulado , * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00001098'   and tpLetra ='M' and tpComprobante = 'FA'

    
  update x set x.nrDOC = null  , x.dsRazonSocial  = null  , tpIVA = 'CF'  from TB_Comprobantes x 
  where  nrTalonario = '0001'
  and nrComprobante = '00001098'   and tpLetra ='M' and tpComprobante = 'FA'


  
  exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 9 , @anio = 2017, @renglon = 5178

  -- 0001	00001090    	M	FA
   select  dsRazonSocial ,  nrDOC  , flAnulado , * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00001090'   and tpLetra ='M' and tpComprobante = 'FA'

    
  update x set x.nrDOC = null  , x.dsRazonSocial  = null  , tpIVA = 'CF'  from TB_Comprobantes x 
  where  nrTalonario = '0001'
  and nrComprobante = '00001090'   and tpLetra ='M' and tpComprobante = 'FA'

   exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 9 , @anio = 2017, @renglon = 7074

  -- 0001	00001071    	M	FA
   select  dsRazonSocial ,  nrDOC  , flAnulado , * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00001071'   and tpLetra ='M' and tpComprobante = 'FA'

    
	--G L CONSULTING S.R.L. (30-70993506-9), Sarandi (Buenos Aires ...

  update x set  x.dsRazonSocial  = '30709935069'   from TB_Comprobantes x 
  where  nrTalonario = '0001'
  and nrComprobante = '00001071'   and tpLetra ='M' and tpComprobante = 'FA'


   exec spu_obtieneDatosCITIVentas_v4_9_4 @mes = 9 , @anio = 2017, @renglon = 7161

  -- 0001	00001090    	M	FA
   select  dsRazonSocial ,  nrDOC  , flAnulado , * from TB_Comprobantes  where  nrTalonario = '0001'
  and nrComprobante = '00001090'   and tpLetra ='M' and tpComprobante = 'FA'

    
  update x set x.nrDOC = null  , x.dsRazonSocial  = null  , tpIVA = 'CF'  from TB_Comprobantes x 
  where  nrTalonario = '0001'
  and nrComprobante = '00001090'   and tpLetra ='M' and tpComprobante = 'FA'

  



  ---------------------------------------------
  ---------------------------------------------
  ---------------------------------------------

  
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
