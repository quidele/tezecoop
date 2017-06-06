

SELECT * FROM cps_provsusp  WHERE     fec_doc  > '20170101'

SELECT * FROM cps_provsusp  WHERE     cod_doca = 'recm' and nro_doca = 138758 

Conciliación 
	(+) Monto por Viaje			
	(-) Monto comisión AMCA     
Pagos AMCA
	(+) Monto de los Pagos  	
Saldo Anteriores 
	(+) Créditos a favor AMCA   
	(-) Débitos a por favor de la Cooperativa por diferencias 

	
select * from cps_provsusp  where fec_doc  > '20170101'
	
select * from cps_provsusp  where     cod_doca = 'recm' and nro_doca = 138782 

select * from cps_ctasctes   where     cod_doca = 'FEP' and nro_doca = 23807  and cod_tit = 7687


select * from cpp_afec_venc  where fec_venc > '20170101' and   formulario = 'M_OrdendePago' and seccion = 'CreditosyAnticip'



select * from cpf_contabilidad  where nro_trans = 2793786 and  imp_mov_mn <>0 
order by signo 



select * from cps_ctasctes   where nro_trans = 2793786 and  imp_mov_mn <>0 
order by signo 


