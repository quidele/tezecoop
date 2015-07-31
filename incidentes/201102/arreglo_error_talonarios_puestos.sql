
use dbSG2000
go 


select * from TB_Comprobantes where 
					convert(decimal,rtrim(nrComprobante)) between 93801 and 93850 and nrPuesto = 2  
					and nrTalonario ='0002'
					
-- pasamos de 2 a 3 
update TB_Comprobantes set nrPuesto=3  where 
					convert(decimal,rtrim(nrComprobante)) between 93801 and 93850 and nrPuesto = 2  
					and nrTalonario ='0002'


select * from TB_Comprobantes where 
					convert(decimal,rtrim(nrComprobante)) between 93801 and 93850 and nrPuesto = 3  
					and nrTalonario ='0003'
					
					
-- pasamos de 3 a 2 
update TB_Comprobantes set nrPuesto=2  where 
					convert(decimal,rtrim(nrComprobante)) between 93801 and 93850 and nrPuesto = 3
					and nrTalonario ='0003'


select * from TB_Comprobantes where 
					convert(decimal,rtrim(nrComprobante)) between 93851 and 93852 and nrPuesto = 3
					and nrTalonario ='0003'

-- pasamos de 3 a 2 
update TB_Comprobantes set nrPuesto=2   where 
					convert(decimal,rtrim(nrComprobante)) between 93851 and 93852 and nrPuesto = 3
					and nrTalonario ='0003'