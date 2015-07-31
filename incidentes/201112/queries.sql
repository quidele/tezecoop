--Exec SP_obtenerImputacion_v3_7 @nrCaja_param = 1000006895 ,@AsientoModelo_param = 'REGISTRACION_CAJA_PUESTO' 

select sum(vlPagoDolares) , sum(vlPagoEuros), sum(vlPagoReales),sum( vlPagoPesos)
 from TB_Comprobantes 
where nrCaja = 1000006895 

select * from TB_Conceptos where cdConcepto in (2012,2011)