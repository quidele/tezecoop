select * from PUB.code_mstr  

insert into PUB.code_mstr (code_fldname,code_value,code_cmmt)
values  ('emp_etiq','emp_etiq','CURTIEMBRES FONSECA S.A.')

select  code_cmmt as nombre , '' as base from PUB.code_mstr where  code_fldname='emp_etiq' 

select  pt_part as articulo, pt_desc1 as desc_abrev  from PUB.pt_mstr  where pt_part>=100000  and    pt_part <=199999
order by pt_desc1


select *  from PUB.pt_mstr  where pt_part>=100000  and    pt_part <=199999


select ad_addr , ad_sort, ad_date, ad_mod_date from PUB.ad_mstr where  ad_addr like 'P%'

select  count(pt_part)  from PUB.pt_mstr  where pt_part>=100000  and    pt_part <=199999

SELECT cant_dias  FROM PUB.zarti_quimicos  WHERE articulo =   101129 