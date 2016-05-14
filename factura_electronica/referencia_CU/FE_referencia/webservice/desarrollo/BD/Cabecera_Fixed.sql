select  '1'  as CantReg , 
		a.cod_citi as  CbteTipo ,
		a.serie_doc   as  PtoVta
		
from Magma_ERP_Desa.dbo.cpt_cabgenac  a

Left join Magma_ERP_Desa.dbo.ct_docxletraciti as citi
	on a.cod_doc = citi.cod_doc
	and a.letra_doc = citi.letra_doc 

where	a.nro_doc =  10256  and 
		a.cod_doc = 'fcl' and 	
		a.cod_citi is not null 