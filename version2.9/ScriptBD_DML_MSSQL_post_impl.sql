use dbSG2000;

/**************************************/
/* Armando la caja del licenciatario  */
update TB_Conceptos 
set tpCajaImputacion='Caja de los Licenciatarios'
    -- dsConcepto = 'Pago a los Licenciatarios',
    -- tpConcepto='Caja de los Licenciatarios'
where cdConcepto = 1027 


update TB_MovimientosContables
set dsConcepto = 'Pago a los Licenciatarios',
    tpConcepto = 'Caja de los Licenciatarios'
where cdConcepto = 1027 

/**************************************/
/* Armando la caja del Cooperativa  */
update TB_Conceptos 
set  dsConcepto = 'Ingreso de dinero por comisiones'
where cdConcepto = 1028



update TB_MovimientosContables
set dsConcepto = 'Ingreso de dinero por comisiones'
where cdConcepto = 1028



--- 1063	COBRO DE CTA. CTE
--- 1027	Pago a los Licenciatarios
--- 1064	COBRO IVA AL LICENCIATARIO

update TB_Conceptos 
set  dsConcepto = 'Cobro de Cta. cte.'
where cdConcepto = 1063


update TB_MovimientosContables
set dsConcepto = 'Cobro de Cta. cte.'
where cdConcepto = 1063



update TB_Conceptos 
set  dsConcepto = 'Cobro IVA al Licenciatario'
where cdConcepto = 1064



update TB_MovimientosContables
set dsConcepto = 'Cobro IVA al Licenciatario'
where cdConcepto = 1064


/*
para volver a la version 2.8 */
/*
update TB_MovimientosContables
set dsConcepto = 'PAGO DE COMPROBANTES'
where cdConcepto = 1027

update TB_Conceptos
set dsConcepto = 'PAGO DE COMPROBANTES'
where cdConcepto = 1027
*/



