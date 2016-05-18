select  '2' id  ,
		'percepcion ingresos brutos' desc1,
         baseimp = case porc_impuesto when 0  then 0 else
		 ABS( sum (  round  (imp_mov_ing  /  (porc_impuesto /100 ),2) * signo)  )  end ,
		 porc_impuesto alic,
		 ABS (sum (imp_mov_ing * signo)) importe
from Magma_ERP_Desa.dbo.cpf_impsimples 
where	cod_doc =  'fcl' and 
		nro_doc = 10256 and 
		cod_impuesto = 'PIBR'
group by  porc_impuesto  

union all

select  '1' id  ,
		'percepcion iva' desc1 , 
		0 baseimp  ,								 
		porc_impuesto alic, 
ABS (sum (imp_mov_ing * signo)) importe

from Magma_ERP_Desa.dbo.cpf_impsimples 

where	cod_doc = 'fcl' and 
		nro_doc = 10256 and 
		cod_impuesto = 'PIVA' and  
		porc_impuesto = 0
group by  porc_impuesto  

union all

select  '1' id  ,
		'percepcion iva' desc1 , 
		ABS( sum ( round (imp_mov_ing  /  ( porc_impuesto /100 ),2) * signo)  )  baseimp  ,								 
		porc_impuesto alic, 
		ABS (sum (imp_mov_ing * signo)) importe
from Magma_ERP_Desa.dbo.cpf_impsimples 

where cod_doc =  'fcl' and nro_doc = 10256
and cod_impuesto = 'PIVA' and  porc_impuesto <> 0

group by  porc_impuesto  