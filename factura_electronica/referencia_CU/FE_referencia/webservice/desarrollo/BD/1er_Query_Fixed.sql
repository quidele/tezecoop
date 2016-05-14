select
	'01' as  concepto, 
	min(cod_dgi) as  DocTipo, 
	min(nro_dgi) as  DocNro , 
	a.nro_doc as  CbteDesde, 
	a.nro_doc as  CbteHasta, 
	min(a.fec_doc )	as	CbteFch , 
	ImpTotal  =  (select sum (imp_mov_ing  * ctes.signo)  
				from Magma_ERP_Desa.dbo.gl_nodos nod ,  
				Magma_ERP_Desa.dbo.h_config_cuentas  ctas,
				Magma_ERP_Desa.dbo.cps_ctasctes as ctes 
				where nombre like 'Vencimiento Deudores' and 
				nod.nodo   = ctas.nodo and 
				nod.clasificacion = 'Config_Cuentas' and 
				ctes.cod_cta =  ctas.cod_cta and 
				a.nro_trans = ctes.nro_trans 
				group by a.nro_trans),
	abs(sum ( ( case a.cod_tipo_neto   when  '2' then 1 else 0 end ) * a.imp_mov_ing *signo))
	ImpTotConc,
	abs(sum ( ( case a.cod_tipo_neto   when  '2' then 0 else 1 end ) * a.imp_mov_ing ))  
	ImpNeto ,
	'o' ImpOpEx ,
	ImpIVA  =  (select  ABS (sum (imp_mov_ing * signo))    
				from Magma_ERP_Desa.dbo.cpf_impsimples  as simp
				where a.nro_trans = simp.nro_trans  and cod_impuesto  ='IVA'
				group by a.nro_trans ),
	ImpTrib =  (select  ABS (sum (imp_mov_ing * signo))   
				from Magma_ERP_Desa.dbo.cpf_impsimples  as simp
				where a.nro_trans = simp.nro_trans  and cod_impuesto  <>'IVA'
				group by a.nro_trans ),
	MIN (a.fec_doc)	FchServDesde,
	MIN (a.fec_doc)	FchServHasta,
	MIN (cab.fec_venc) FchVtoPago,
	MIN (mon.cod_mon_rg1361) MonId,
	MIN(a.tc_ing) MonCotiz 
	
from Magma_ERP_Desa.dbo.cpf_projobemp a  
left join Magma_ERP_Desa.dbo.cpt_cabgenac as cab
on  a.nro_trans = cab.nro_trans 
left join Magma_ERP_Desa.dbo.ct_docxletraciti as citi
on a.cod_doc =  citi.cod_doc
and cab.letra_doc =  citi.letra_doc
left join Magma_ERP_Desa.dbo.ct_impuxtit as impu
on a.cod_tit = impu.cod_tit 
left join  Magma_ERP_Desa.dbo.ct_titulares as tit
on a.cod_tit = tit.cod_tit
left join Magma_ERP_Desa.dbo.ct_monedas as mon
on mon.cod_moneda = a.cod_moneda_ing 

where a.nro_doc =  10256  and a.cod_doc = 'fcl'
group by a.nro_trans, a.nro_doc