
insert into diccionariodedatos
     (nmTabla,   
	nmCampo,                                            
	nmCampoExterno,
	tpTipo,                                             
	nrTamanio ,                                         
	flClave ,
	flClaveForanea ,
	flBusqueda,
	nrOrdenBusqueda,
	vlPuesto1 ,                                         
	vlPuesto2,                                          
	vlPuesto3  ,                                        
	vlPuesto9  ,                                        
	Actualizar ,                                        
	vlPuesto4  ,                                        
	vlPuesto5 ,                                         
	vlPuesto)
select 
	'TB_cupones' as nmTabla,   
	nmCampo,                                            
	nmCampoExterno,
	tpTipo,                                             
	nrTamanio ,                                         
	flClave ,
	flClaveForanea ,
	flBusqueda,
	nrOrdenBusqueda,
	vlPuesto1 ,                                         
	vlPuesto2,                                          
	vlPuesto3  ,                                        
	vlPuesto9  ,                                        
	Actualizar ,                                        
	vlPuesto4  ,                                        
	vlPuesto5 ,                                         
	vlPuesto
	 from diccionariodedatos 
	where nmcampo = 'flManual' and nmtabla = 'TB_Comprobantes'


SELECT * from diccionariodedatos 
	where nmcampo = 'flManual' and nmtabla = 'TB_cupones'
