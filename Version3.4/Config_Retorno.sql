select * from
TB_Conceptos
where dsConcepto like '%Retorno%'

select* from TB_Productos
where dsProducto like '%ReTorno%'
and flEliminar = 0

$ 88  3 
9135

update TB_Productos
set tpDestino ='Retorno'
where dsProducto like '%Retorno%'
and flEliminar = 0

/*Config comision retorno */

select * from tb_comisiones  where tpComision
is null

update TB_Comisiones
set tpComision ='Viaje'
where tpComision is null



select * from TB_Productos
where dsProducto like '%Centro%'
and flEliminar = 0

$ 88  3 
9135

update TB_Productos
set tpDestino ='Centro'
where dsProducto like '%Centro%'
and flEliminar = 0

/*Config comision retorno */

select * from tb_comisiones  where tpComision
is null

update TB_Comisiones
set tpComision ='Viaje'
where tpComision is null



