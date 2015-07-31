

use dbSG2000_Pruebas 
go 


select count(*) from TB_MovimientosContables

--delete from TB_MovimientosContables


select * from TB_Cupones  where flCompensado = 1 


update  TB_Cupones set flAnulado = 1, dtAnulado = GETDATE();

update TB_Comprobantes set flAnulado = 1, dtAnulado = GETDATE();




select * from   dbo.TB_ValoresDesimputacionesCajasPuestos
   where nrCaja = 2000002258


exec sco_cajapuesto_v3_7 2000002258
