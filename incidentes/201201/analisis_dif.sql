select * from TB_Puestos 

select * from TB_Cajas where dtApertura > GETDATE()-3
order by dtApertura

select * from TB_Comprobantes where nrCaja = 1000007091

/*
Hola Eulises, como estás.
Te comento que ese movimiento de Pago de Comprobantes que aparece como salida tiene fecha 10/01, cuando debería ser 19/01
El número de caja es 2718, del día jueves 19/01 */

select * from TB_Cajas where flCajaAdm = 1 and flEstado = 0

select * from TB_Cajas where nrCaja =  9000002718



select tpMovimiento, tpOperacion , sum(vlPesos) , sum(vlDolares), sum(vlEuros) from TB_MovimientosContables  where nrCaja = 9000002718 and 
   nrCajaPuesto = -1000007056
   group by tpMovimiento , tpOperacion  
   order by tpMovimiento , tpOperacion  asc



select * from TB_MovimientosContables  where nrCaja = 9000002718 and dsMovimiento like '%pago%'
and tpOperacion ='Entrada de Dinero'


select SUM(vlPesos), sum(vlDolares),  SUM(vlEuros) from TB_MovimientosContables  where nrCaja = 9000002718 and dsMovimiento like '%pago%'
and tpOperacion ='Entrada de Dinero'



select * from TB_MovimientosContables  where dsMovimiento like '%pago%'
and nrCajaPuesto = -1000007056

1027
2030

select * from TB_MovimientosContables  where nrCaja = 9000002718 and dsMovimiento like '%pago%'
and tpOperacion ='Salida de Dinero'



select * from TB_MovimientosContables  where  dsMovimiento like '%pago%'
		and tpOperacion ='Entrada de Dinero' and nrCajaPuesto < 0






select tpMovimiento, tpOperacion , sum(vlPesos) , sum(vlDolares), sum(vlEuros)
from TB_MovimientosContables  where nrCaja = 9000002710 and 
   nrCajaPuesto = -1000007056  and tpMovimiento is null
   group by tpMovimiento , tpOperacion  
   order by tpMovimiento , tpOperacion  asc

select * from TB_MovimientosContables  where nrCaja = 9000002710 and 
   nrCajaPuesto = -1000007056  and tpMovimiento is null
      and dsProveedor is not null
   
   select * from tb_cajas where  nrCaja = 9000002718
  
 
select SUM(vlPesos), sum(vlDolares), sum(vlEuros) from TB_MovimientosContables  where nrCaja = 9000002710 and 
   nrCajaPuesto = -1000007056  and tpMovimiento is null
   and dsProveedor is not null

  
select * from tb_zmovimientosDesimputacion_1000007056

select * from TB_MovimientosContables  where 
   nrCajaPuesto = -1000007056     and dsProveedor is not null 


   
  /* 
   begin tran

delete from TB_MovimientosContables  where nrCaja = 9000002718 and 
   nrCajaPuesto = -1000007056  and tpMovimiento ='Desimputacion' and dsProveedor is not null
   
  commit tran
  
  rollback tran

*/



select * from TB_MovimientosContables  where nrCaja = 9000002710 and 
   nrCajaPuesto = -1000007056  and tpMovimiento is null
      and dsProveedor is not null