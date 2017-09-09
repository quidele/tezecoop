select * from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000601' and tpLetra = 'M'

select * from TB_Recibos where  cdCliente = '4033'

select * from TB_Recibos where  IdRecibo = 1000322910

select * from TB_RecibosDetalle where  IdRecibo = 1000322910

select * from TB_Cupones where IdReciboCtaCte = 1000322910

select * from TB_Cupones where IdRecibo = 1000322910


select * from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000601' and tpLetra = 'M'
select * from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000601' and tpLetraCliente = 'M'

-- ELIMINAR - MAL CARGADA
select * from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000620' and tpLetra = 'M'
select * from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000620' and tpLetraCliente = 'M'

-- ELIMINAR  - MAL CARGADA
select * from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000611' and tpLetra = 'M'
select * from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000611' and tpLetraCliente = 'M'

-- CORREGIR -
select * from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000677' and tpLetra = 'M'
select * from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000677' and tpLetraCliente = 'M'





-- ELIMINAR - MAL CARGADA
select * from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000620' and tpLetra = 'M'
select flCompensado , * from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000620' and tpLetraCliente = 'M'

-- ELIMINAR  - MAL CARGADA
select * from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000611' and tpLetra = 'M'
select flCompensado , * from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000611' and tpLetraCliente = 'M'


-- CORREGIR -
select * from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000677' and tpLetra = 'M'
select flCompensado , * from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000677' and tpLetraCliente = 'M'

-- ELIMINAR - MAL CARGADA


select *  into zTB_Comprobantes_bkp_21062017 from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000620' and tpLetra = 'M' and nrTalonario = '0001'
select *  into zTB_ComprobantesDetalle_bkp_21062017  from TB_ComprobantesDetalle   where tpComprobante = 'FA' and  nrComprobante = '00000620' and tpLetra = 'M' and nrTalonario = '0001'
select *  into zTB_Cupones_bkp_21062017 from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000620' and tpLetraCliente = 'M'  and nrTalonarioCliente = '0001'

-- BEGIN TRAN 

delete from TB_ComprobantesDetalle   where tpComprobante = 'FA' and  nrComprobante = '00000620' and tpLetra = 'M' and nrTalonario = '0001'
delete from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000620' and tpLetraCliente = 'M'  and nrTalonarioCliente = '0001'
delete from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000620' and tpLetra = 'M' and nrTalonario = '0001'

-- ROLLBACK TRAN 
-- COMMIT TRAN 

-- ELIMINAR  - MAL CARGADA

insert into zTB_Comprobantes_bkp_21062017 select *   from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000611' and tpLetra = 'M' and nrTalonario = '0001'
insert into zTB_ComprobantesDetalle_bkp_21062017 select *   from TB_ComprobantesDetalle   where tpComprobante = 'FA' and  nrComprobante = '00000611' and tpLetra = 'M' and nrTalonario = '0001'
insert into zTB_Cupones_bkp_21062017 select *   from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000611' and tpLetraCliente = 'M'  and nrTalonarioCliente = '0001'

-- BEGIN TRAN 

delete from TB_ComprobantesDetalle   where tpComprobante = 'FA' and  nrComprobante = '00000611' and tpLetra = 'M' and nrTalonario = '0001'
delete from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000611' and tpLetraCliente = 'M'  and nrTalonarioCliente = '0001'
delete from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000611' and tpLetra = 'M' and nrTalonario = '0001'

-- ROLLBACK TRAN 
-- COMMIT TRAN 





-- CORREGIR -

insert into zTB_Comprobantes_bkp_21062017 select *   from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000677' and tpLetra = 'M' and nrTalonario = '0001'
insert into zTB_ComprobantesDetalle_bkp_21062017 select *   from TB_ComprobantesDetalle   where tpComprobante = 'FA' and  nrComprobante = '00000677' and tpLetra = 'M' and nrTalonario = '0001'
insert into zTB_Cupones_bkp_21062017 select *   from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000677' and tpLetraCliente = 'M'  and nrTalonarioCliente = '0001'

GO 


select cdCliente ,  *   from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000677' and tpLetra = 'M' and nrTalonario = '0001'
select *   from TB_ComprobantesDetalle   where tpComprobante = 'FA' and  nrComprobante = '00000677' and tpLetra = 'M' and nrTalonario = '0001'
select cdCliente ,  *   from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000677' and tpLetraCliente = 'M'  and nrTalonarioCliente = '0001'


delete from TB_ComprobantesDetalle   where tpComprobante = 'FA' and  nrComprobante = '00000677' and tpLetra = 'M' and nrTalonario = '0001'
delete from TB_Cupones  where tpComprobanteCliente = 'FA' and  nrComprabanteCliente = '00000677' and tpLetraCliente = 'M'  and nrTalonarioCliente = '0001'
delete from TB_Comprobantes  where tpComprobante = 'FA' and  nrComprobante = '00000677' and tpLetra = 'M' and nrTalonario = '0001'



select cdCliente ,  *   from TB_Clientes  where cdCliente = 5042





