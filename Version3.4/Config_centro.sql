select* from TB_Productos
where dsProducto like '%Centro%'
and flEliminar = 0

update TB_Productos
set tpDestino ='Centro'
where dsProducto like '%Centro%'
and flEliminar = 0