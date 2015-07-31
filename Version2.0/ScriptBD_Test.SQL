
use dbSG2000_Pruebas
go 

update TB_Comprobantes
set flAnulado=1, dtanulado=getdate()
where flAnulado=0

update TB_Cupones
set flAnulado=1, dtanulado=getdate()
where flAnulado=0

