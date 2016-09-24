select dateadd(yyyy,1,  getdate())

select *,dateadd(yyyy,5,dtapertura), dtapertura , dtCierre  from tb_cajas 
where  nrcaja in ('4000001090','4000001089','4000001091')
and year(dtapertura) = 2009

/*

update tb_cajas
set dtapertura=dateadd(yyyy,5,dtapertura)
where  nrcaja in ('4000001090','4000001089','4000001091')
and year(dtapertura) = 2004


update tb_cajas
set dtCierre=dateadd(yyyy,5,dtCierre)
where  nrcaja in ('4000001090','4000001089','4000001091')
and year(dtCierre) = 2004
*/


select  dtinsercion, dtComprobante, dtCaja, dtAnulado  from tb_Comprobantes
where  nrcaja in ('4000001090','4000001089','4000001091')
and year(dtComprobante) = 2004

/*

update tb_Comprobantes 
set dtinsercion=dateadd(yyyy,5,dtinsercion),
    dtComprobante=dateadd(yyyy,5,dtComprobante),
    dtCaja=dateadd(yyyy,5,dtCaja),
	dtAnulado=dateadd(yyyy,5,dtAnulado)
where  nrcaja in ('4000001090','4000001089','4000001091')
and year(dtComprobante) = 2004

*/


/*

update tb_Cupones 
set dtcupon = dateadd(yyyy,5,dtcupon),
	dtCobradoalCliente = dateadd(yyyy,5,dtCobradoalCliente),
	dtCajacliente = dateadd(yyyy,5,dtCajacliente),
	dtAnulado = dateadd(yyyy,5,dtAnulado)
where  nrcajacliente in ('4000001090','4000001089','4000001091')
and year(dtCupon) = 2004

*/

select *, dtcupon, dtCobradoalCliente, dtCajacliente,  dtAnulado from tb_Cupones
where  nrcajacliente in ('4000001090','4000001089','4000001091')
and year(dtCupon) = 2004

/******************************************************************/
/******************************************************************/
/******************************************************************/
/* Modificando el Mes                                             */
/******************************************************************/


select dateadd(mm,3, dtapertura)

select *,dateadd(mm,3,dtapertura), dtapertura , dtCierre  from tb_cajas 
where  nrcaja in ('4000001090','4000001089','4000001091')
and year(dtapertura) = 2009

------- update tb_cajas

update tb_cajas
set dtapertura=dateadd(mm,3, dtapertura)
where  nrcaja in ('4000001090','4000001089','4000001091')
and year(dtapertura) = 2009 and month(dtapertura)=1

----  update tb_cajas
update tb_cajas
set dtCierre=dateadd(mm,3, dtCierre)
where  nrcaja in ('4000001090','4000001089','4000001091')
and year(dtCierre) = 2009 and month(dtCierre)=1



select  dtinsercion, dtComprobante, dtCaja, dtAnulado  from tb_Comprobantes
where  nrcaja in ('4000001090','4000001089','4000001091')
and year(dtComprobante) = 2009 and month(dtComprobante)=1

---------------------------------------
--- update tb_Comprobantes 

update tb_Comprobantes 
set dtinsercion=dateadd(mm,3, dtinsercion),
    dtComprobante=dateadd(mm,3, dtComprobante),
    dtCaja=dateadd(mm,3, dtCaja),
	dtAnulado=dateadd(mm,3, dtAnulado)
where  nrcaja in ('4000001090','4000001089','4000001091')
and year(dtComprobante) = 2009 and month(dtComprobante)=1

---------------------------------------
--- update tb_Cupones 

update tb_Cupones 
set dtcupon = dateadd(mm,3, dtcupon),
	dtCobradoalCliente = dateadd(mm,3, dtCobradoalCliente),
	dtCajacliente =dateadd(mm,3, dtCajacliente),
	dtAnulado = dateadd(mm,3, dtAnulado)
where  nrcajacliente in ('4000001090','4000001089','4000001091')
and year(dtCupon) = 2009 and month(dtCupon)=1


select *, dtcupon, dtCobradoalCliente, dtCajacliente,  dtAnulado from tb_Cupones
where  nrcajacliente in ('4000001090','4000001089','4000001091')
and year(dtCupon) = 2009
