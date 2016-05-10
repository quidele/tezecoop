select  citi.cod_citi  , a.serie_doc , a.nro_doc 
from Magma_ERP_Desa.dbo.cpt_cabgenac  a
left join Magma_ERP_Desa.dbo.cpf_NCredAfect as ncre
on a.nro_trans = ncre.nro_trans 
left join Magma_ERP_Desa.dbo.ct_docxletraciti as citi
on a.cod_doc = citi.cod_doc
and a.letra_doc = citi.letra_doc 
where a.nro_doc = 712 and a.cod_doc = 'ncl'

