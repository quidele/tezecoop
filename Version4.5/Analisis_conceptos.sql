		
		select * from   tb_conceptos b   where  b.cdConcepto = 2019 
				
		select * from TB_Conceptos  where flSumaenCajaCooperativa = 1
		select * from TB_Conceptos  where flSumaenCajaAdm = 1 and flSumaenCajaCooperativa = 0
		select * from TB_Conceptos  where flSumaenCajaLicenciatarios  = 1 
		
		select cdConcepto , tpConcepto , dsConcepto , tpOperacion , tpCajaImputacion,
			   flSumaenCajaLicenciatarios, flSumaenCajaCooperativa , flSumaenCajaAdm    
				from TB_Conceptos  where tpCajaImputacion ='Caja de la Cooperativa'
		
		select cdConcepto , tpConcepto , dsConcepto , tpOperacion , tpCajaImputacion ,  
			   flSumaenCajaLicenciatarios, flSumaenCajaCooperativa , flSumaenCajaAdm
				from TB_Conceptos  where tpCajaImputacion ='Caja de los Licenciatarios'
				
		select cdConcepto , tpConcepto , dsConcepto , tpOperacion , tpCajaImputacion ,  
			   flSumaenCajaLicenciatarios, flSumaenCajaCooperativa , flSumaenCajaAdm
				from TB_Conceptos  where tpOperacion = 'NEUTRO'
				
		select * from TB_MovimientosContables  where tpConcepto ='NEUTRO'




select * from   										