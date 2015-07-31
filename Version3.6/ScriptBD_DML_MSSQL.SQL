-- cambios de DML version 3.6
use dbSG2000

go 

update DiccionariodeDatos
set nrOrdenBusqueda = 7 ,
    flBusqueda = 'Yes',
    nmCampoExterno ='Bloqueado',
    nrTamanio =15
where nmCampo ='flBloqueado'  and nmTabla ='tb_clientes'


update DiccionariodeDatos
set nrOrdenBusqueda = 8 ,
    flBusqueda = 'Yes',
    nmCampoExterno ='Bloqueado',
    nrTamanio =15
where nmCampo ='flBloqueado'  and nmTabla ='tb_proveedores'



		/*


	select * 
		from DiccionariodeDatos
		where 
		 -- nmCampo ='flBloqueado' and 
		 nmTabla ='tb_proveedores'


select * from tb_proveedores


		select * 
		from DiccionariodeDatos
		where 
		   -- nmCampo ='flBloqueado' and 
		 nmTabla ='tb_clientes'

		*/