-- cambios de DML version 2.6
use dbSG2000
go



/****************************************************/
/* División de cajas: 				    */
/****************************************************/
--- conceptos modificados
---	cdConcepto	dsConcepto
---	1028	Ingreso de dinero por comisiones
---	1063	Cobro de Cta. cte.
---	1027	Pago a los Licenciatarios
---	1064	Cobro IVA al Licenciatario
---	2000	Ingreso de dinero caja de los puestos
---	2001	Diferencia operadora(+) 
---	2002	Diferencia operadora(-) 
	

update TB_Conceptos set tpCajaImputacion='Caja de la Cooperativa'
update TB_Conceptos set tpCreadoPor='Usuario'

update TB_Conceptos set tpCreadoPor='Sistema'
where  (cdConcepto IN (1027, 1028, 1063, 1064))


/**************************************/
/* Armando la caja del licenciatario  */
update TB_Conceptos 
set tpCajaImputacion='Caja de los Licenciatarios',
    dsConcepto = 'Pago a los Licenciatarios',
    tpConcepto='Caja de los Licenciatarios'
where cdConcepto = 1027 

update TB_MovimientosContables
set dsConcepto = 'Pago a los Licenciatarios',
    tpConcepto = 'Caja de los Licenciatarios'
where cdConcepto = 1027 


delete from tb_Conceptos where dsConcepto = 'Ingreso de dinero caja de los puestos' 


insert into tb_Conceptos (cdConcepto, tpConcepto, dsConcepto, vlConcepto,
		          tpOperacion, dtActualizacion, tpCajaImputacion, flEliminar,tpCreadoPor) 
values (2000, 'Caja de los Licenciatarios','Ingreso de dinero caja de los puestos', 0,'Entrada de Dinero',
 getdate(),'Caja de los Licenciatarios', 0, 'Sistema')

/**************************************/
/* Armando la caja del Cooperativa  */
update TB_Conceptos 
set  dsConcepto = 'Ingreso de dinero por comisiones',
     tpConcepto = 'Caja de la Cooperativa'
where cdConcepto = 1028

update TB_MovimientosContables
set dsConcepto = 'Ingreso de dinero por comisiones',
     tpConcepto = 'Caja de la Cooperativa'
where cdConcepto = 1028

delete from tb_Conceptos where dsConcepto = 'Diferencia operadora(+)' 


insert into tb_Conceptos (cdConcepto, tpConcepto, dsConcepto, vlConcepto,
		          tpOperacion, dtActualizacion, tpCajaImputacion, flEliminar,tpCreadoPor) 
values (2001, 'Caja de la Cooperativa','Diferencia operadora(+) ', 0,'Entrada de Dinero',
 getdate(),'Caja de la Cooperativa', 0, 'Sistema')


delete from tb_Conceptos where dsConcepto = 'Diferencia operadora(-)' 


insert into tb_Conceptos (cdConcepto, tpConcepto, dsConcepto, vlConcepto,
		          tpOperacion, dtActualizacion, tpCajaImputacion, flEliminar,tpCreadoPor) 
values (2002, 'Caja de la Cooperativa','Diferencia operadora(-) ', 0,'Salida de Dinero',
 getdate(),'Caja de la Cooperativa', 0, 'Sistema')


update TB_Conceptos 
set  dsConcepto = 'Cobro de Cta. cte.',
     tpConcepto = 'Caja de la Cooperativa'
where cdConcepto = 1063

update TB_MovimientosContables
set dsConcepto = 'Cobro de Cta. cte.',
     tpConcepto = 'Caja de la Cooperativa'

where cdConcepto = 1063

update TB_Conceptos 
set  dsConcepto = 'Cobro IVA al Licenciatario',
     tpConcepto = 'Caja de la Cooperativa'
where cdConcepto = 1064

update TB_MovimientosContables
set dsConcepto = 'Cobro IVA al Licenciatario',
     tpConcepto = 'Caja de la Cooperativa'
where cdConcepto = 1064

--- 1063	COBRO DE CTA. CTE
--- 1027	Pago a los Licenciatarios
--- 1064	COBRO IVA AL LICENCIATARIO

