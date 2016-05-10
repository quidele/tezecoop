---- FeCabReq:
select  '1'  as     CantReg , 
		a.cod_citi as  CbteTipo ,
		a.serie_doc   as  PtoVta
from cpt_cabgenac  a
where 	a.cod_citi is not null
left join ct_docxletraciti as citi
on a.cod_doc = citi.cod_doc
and a.letra_doc = citi.letra_doc 
where  a.nro_doc =  10256  and a.cod_doc = 'fcl'


----FeDetReq: El detalle de la factura/lote
--ojo controlar que   ImpTotal  = ImpTotConc  + ImpNeto + ImpIVA
-- EULISES: Comprobantes
-- INICIA: spu_obtenerComprobanteML  id_solicitud => nro_trans
select      
  '01'								as  concepto,
  min(cod_dgi)						as  DocTipo, 
  min(nro_dgi)						as  DocNro , 
  a.nro_doc							as  CbteDesde, 
  a.nro_doc							as  CbteHasta,
  min(a.fec_doc )					as	CbteFch , 
  ImpTotal  =  (select sum (imp_mov_ing  * ctes.signo)  from gl_nodos nod ,  h_config_cuentas  ctas,
cps_ctasctes  as ctes 
where nombre like 'Vencimiento Deudores'
and nod.nodo   = ctas.nodo and nod.clasificacion = 'Config_Cuentas' 
and ctes.cod_cta =  ctas.cod_cta 
and a.nro_trans = ctes.nro_trans 
group by a.nro_trans
),
 abs(sum ( ( case a.cod_tipo_neto   when  '2' then 1  
 else 0 end ) * a.imp_mov_ing *signo)) ImpTotConc  ,
  abs(sum ( ( case a.cod_tipo_neto   when  '2' then 0
 else 1 end ) * a.imp_mov_ing ))  ImpNeto ,
 'o' ImpOpEx  ,
 ImpIVA  =  (select  ABS (sum (imp_mov_ing * signo))    from cpf_impsimples  as simp
     where a.nro_trans = simp.nro_trans  and cod_impuesto  ='IVA'
     group by a.nro_trans ),
 ImpTrib =  (select  ABS (sum (imp_mov_ing * signo))    from cpf_impsimples  as simp
     where a.nro_trans = simp.nro_trans  and cod_impuesto  <>'IVA'
     group by a.nro_trans ),
 MIN  (a.fec_doc )		 FchServDesde,
 MIN  (a.fec_doc )		 FchServHasta,
 MIN  (cab.fec_venc )	 FchVtoPago,
 MIN (mon.cod_mon_rg1361)MonId,
 MIN(a.tc_ing)			 MonCotiz 
  from Magma_desa.dbo.cpf_projobemp  a   --- Cambiar apuntando a DESA
left join cpt_cabgenac as cab
on  a.nro_trans = cab.nro_trans 
left join ct_docxletraciti as citi
on a.cod_doc =  citi.cod_doc
and cab.letra_doc =  citi.letra_doc
left join ct_impuxtit as impu
on a.cod_tit = impu.cod_tit 
left join  ct_titulares    as tit
on a.cod_tit = tit.cod_tit
left join ct_monedas as mon
on mon.cod_moneda = a.cod_moneda_ing 
where a.nro_doc =  10256  and a.cod_doc = 'fcl'
group by    a.nro_trans, a.nro_doc 
-- FIN: spu_obtenerComprobanteML  id_solicitud => nro_trans



-- INICIA: spu_obtenerComprobanteAsociadosML  id_solicitud => nro_trans
--comprobantes asociados
select  citi.cod_citi  , a.serie_doc , a.nro_doc 
from cpt_cabgenac  a
left join cpf_NCredAfect as ncre
on a.nro_trans = ncre.nro_trans 
left join ct_docxletraciti as citi
on a.cod_doc = citi.cod_doc
and a.letra_doc = citi.letra_doc 
where a.nro_doc = 712 and a.cod_doc = 'ncl'
-- INICIA: spu_obtenerComprobanteAsociadosML  id_solicitud => nro_trans
 
--registros de tributos
-- INICIA: spu_obtenerComprobanteTributosML  id_solicitud => nro_trans
select  '2' id  ,'percepcion ingresos brutos' desc1 ,
         baseimp = case porc_impuesto when 0  then 0 
		else
ABS( sum (  round  (imp_mov_ing  /  (porc_impuesto /100 ),2) * signo)  )  end ,
 porc_impuesto alic,
ABS (sum (imp_mov_ing * signo)) importe
from cpf_impsimples 
where cod_doc =  'fcl' and nro_doc = 10256
and cod_impuesto = 'PIBR'
group by  porc_impuesto  
union all
select  '1' id  ,'percepcion iva' desc1 , 
 0 baseimp  ,								 
 porc_impuesto alic, 
 ABS (sum (imp_mov_ing * signo)) importe
from cpf_impsimples 
where cod_doc =  'fcl' and nro_doc = 10256
and cod_impuesto = 'PIVA' and  porc_impuesto = 0
group by  porc_impuesto  
union all
select  '1' id  ,'percepcion iva' desc1 , 
 ABS( sum ( round (imp_mov_ing  /  ( porc_impuesto /100 ),2) * signo)  )  baseimp  ,								 
 porc_impuesto alic, 
 ABS (sum (imp_mov_ing * signo)) importe
from cpf_impsimples 
where cod_doc =  'fcl' and nro_doc = 10256
and cod_impuesto = 'PIVA' and  porc_impuesto <> 0
group by  porc_impuesto  
-- FIN: spu_obtenerComprobanteTributosML  id_solicitud => nro_trans


--IVA: el detalle de alícuotas relacionados a el comprobante a autorizar (array).
-- INICIA: spu_obtenerComprobanteIVAML  id_solicitud => nro_trans
select    cod_sopmg_impu      id  , 
 ABS( sum ( round (imp_mov_ing  /  ( simp.porc_impuesto /100 ),2) * signo)  )  baseimp  ,								 
 simp.porc_impuesto alic, 
 ABS (sum (imp_mov_ing * signo)) importe
from cpf_impsimples  simp, ct_impuestos impu
where cod_doc =  'fcl' and nro_doc = 10256
and cod_impuesto = 'IVA'  and simp.cod_tasa_impu  = impu.cod_tasa_impu 
and cod_impuesto =  cod_tipo_impu 
group by     cod_sopmg_impu , simp.porc_impuesto 
-- FIN: spu_obtenerComprobanteIVAML  id_solicitud => nro_trans
 