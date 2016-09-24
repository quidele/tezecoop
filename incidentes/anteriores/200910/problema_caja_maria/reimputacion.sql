
1000140835


INSERT TB_MovimientosContables (IdMovimiento ,dsMovimiento ,IdRecibo ,cdConcepto ,tpConcepto ,dsConcepto ,tpOperacion ,vlPesos ,vlDolares ,vlEuros ,nrRecibo ,
nrFactura ,nrCaja ,dsUsuario ,dtMovimiento ,dsProveedor ,IdProveedor ,tpCajaImputacion ,dsUsuarioCajaPuesto ,nrCajaPuesto )  VALUES (
10135002 ,'Pago a Licenciatario' ,1000063032 ,1027 ,'Cajas' ,'PAGO DE COMPROBANTES' ,'Salida de Dinero' ,128.00 ,72.00 ,72.00 ,'1000063032' ,
null ,2000002239 ,'ROMA' ,'21/10/2009 7:58:03' ,'Licencia Nro. 124' ,null ,'Caja de los Licenciatarios' ,null ,null )

select 0 as IdMovimiento,
       'Pago a Licenciatario' as dsMovimiento, 
	IdRecibo,
        1027 as cdConcepto,
        'Cajas'  as tpConcepto,
        'PAGO DE COMPROBANTES' as dsConcepto
	'Salida de Dinero' as  tpOperacion
         as vlPesos
	 as vlDolares
	 as vlEuros
	 IdRecibo as nrRecibo
	 null as nrFactura
	 nrCaja  
	 'EULISES' as dsUsuario
	 dtRecibo as dtMovimiento,
	 'Licencia Nro. ' as dsProveedor
	 null IdProveedor,
	 'Caja de los Licenciatarios' as tpCajaImputacion
	 nrCajaPuesto null ,
	 dsUsuarioCajaPuesto null

select * from tb_Recibos where  idRecibo = 1000063032

select * from tb_Recibos where  idRecibo = 1000140835



