
use dbSG2000;


DROP PROCEDURE `rpt_cierredecaja_v1`;
CREATE PROCEDURE `rpt_cierredecaja_v1`(IN nrCaja_param DECIMAL(18))
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN

declare l_Cantidad_Viajes           decimal(9,2);
declare l_Cantidad_Facturas         decimal(9,2);
declare l_cantidad_cta_cte          decimal(9,2);
declare l_Cantidad_Anuladas         decimal(9,2);
declare l_Cantidad_Contado          decimal(9,2);
declare l_Cantidad_Retorno          decimal(9,2);
declare l_Cantidad_Cobro_en_Destino decimal(9,2);
declare l_nro_factura_inicial       varchar(12);
declare l_nro_factura_final         varchar(12);
declare l_nro_Recibo_inicial        varchar(12);
declare l_nro_Recibo_final          varchar(12);


	SET l_Cantidad_Viajes           = 0;
	SET l_Cantidad_Facturas         = 0;
	SET l_cantidad_cta_cte          = 0;
	SET l_Cantidad_Anuladas         = 0;
	SET l_Cantidad_Contado          = 0;
	SET l_Cantidad_Retorno          = 0;
	SET l_Cantidad_Cobro_en_Destino = 0;
	SET l_nro_factura_inicial       = 0;
	SET l_nro_factura_final         = 0;
	SET l_nro_Recibo_inicial        = 0;
	SET l_nro_Recibo_final          = 0;
	
	-- creamos una tabla temporal em mysql
	/*DROP TABLE IF EXISTS rpt_Resumen_Caja_Puesto;*/
	DELETE FROM rpt_Resumen_Caja_Puesto;
	
    INSERT INTO rpt_Resumen_Caja_Puesto
	select  a.nrCaja,
		a.nrPuesto,
		a.dsUsuario,
		a.dtApertura,
		a.dtCierre,
		DATE_FORMAT(a.dtApertura,'%H:%i:%s') as hrApertura,
		a.hrCierre,
		a.flEstado,
		a.flCajaAdm,
		a.vlSaldoInicialPesos,
		a.vlSaldoInicialEuros,
		a.vlDiaDolar,
		a.vlDiaEuro,
		a.vlSaldoFinalPesos,
		a.vlSaldoInicialDolares,
		a.vlSaldoFinalDolares,
		a.vlSaldoFinalEuros,
		a.vlSaldoFinalRealPesos,
		a.vlSaldoFinalRealEuros,
		a.vlSaldoFinalRealDolares,
		a.vlCierrePesos,
		a.vlCierreDolares,
		a.vlCierreEuros,
		a.vlTotalSaldoFinalReal,
		a.vlTotalSaldoFinal,
		a.vlTotalSaldoInicial,
		a.vlTotalSaldoCierre,
		a.dsDiferenciaDeCierre,
		a.vlDiferenciaDeCierre,
		a.dsObservacion,
		a.dtObservacion,
		l_Cantidad_Viajes   as 'Cantidad_Viajes' ,
		l_Cantidad_Contado  as 'Cantidad_Contado',
		l_Cantidad_cta_cte  as 'Cantidad_cta_cte',
		l_Cantidad_Retorno  as 'Cantidad_Retorno',
		l_Cantidad_Anuladas as 'Cantidad_Anuladas',
		l_Cantidad_Cobro_en_Destino as 'Cantidad_Cobro_en_Destino',
		concat(concat(IFNULL(b.nmNombre,''),' '),IFNULL(b.nmApellido,'')) as 'Nombre_Cajera',
		c.dsPuesto	 as 'Descripcion_Puesto',
		l_nro_factura_inicial       as 'nro_factura_inicial',
		l_nro_factura_final         as 'nro_factura_final',
		l_nro_Recibo_inicial        as 'nro_Recibo_inicial',
		l_nro_Recibo_final          as 'nro_Recibo_final'
	from  TB_Cajas a, TB_usuarios b, TB_Puestos c
	where   (a.nrCaja = nrCaja_param) and
		 a.dsUsuario=b.dsUsuario   and
		 a.nrPuesto = c.nrPuesto;
		

	select count(*) INTO l_Cantidad_Viajes
	from   TB_Comprobantes
	where  flAnulado=0 and nrCaja=nrCaja_param;
	

	select count(*) INTO l_Cantidad_Contado
	from   TB_Comprobantes
	where  flAnulado=0 and nrCaja=nrCaja_param and
	       cdCondVenta='Contado';
	
    select count(*) INTO l_Cantidad_cta_cte
	from   TB_Comprobantes
	where  flAnulado=0 and nrCaja=nrCaja_param and
	       cdCondVenta='Cuenta Corriente';

	select count(*) INTO l_Cantidad_Retorno
	from   TB_Comprobantes
	where  flAnulado=0 and nrCaja=nrCaja_param and
	       cdCondVenta='Retorno';

	select count(*) INTO l_Cantidad_Cobro_en_Destino
	from   TB_Comprobantes
	where  flAnulado=0 and nrCaja=nrCaja_param and
	       cdCondVenta='Cobro en Destino';

	select count(*) INTO l_Cantidad_Anuladas
	from   TB_Comprobantes
	where  flAnulado=1 and nrCaja=nrCaja_param;

	select min(convert(nrComprobante, decimal(9,2))),
	       max(convert(nrComprobante, decimal(9,2))) INTO l_nro_factura_inicial, l_nro_factura_final
	from   TB_Comprobantes
	where  nrCaja=nrCaja_param and
	       tpLetra='B';

   select  min(convert(nrComprobante, decimal(9,2))),
	       max(convert(nrComprobante, decimal(9,2))) INTO l_nro_Recibo_inicial, l_nro_Recibo_final
	from   TB_Comprobantes
	where  nrCaja=nrCaja_param and
	       tpLetra='X';
	
    select IFNULL(l_nro_factura_inicial,'--') INTO l_nro_factura_inicial;
	select IFNULL(l_nro_factura_final,'--') INTO l_nro_factura_final;
	select IFNULL(l_nro_Recibo_inicial,'--') INTO l_nro_Recibo_inicial;
	select IFNULL(l_nro_Recibo_final,'--') INTO l_nro_Recibo_final;
	
	update	rpt_Resumen_Caja_Puesto
	set   Cantidad_Viajes   = l_Cantidad_Viajes,
	      Cantidad_Contado  = l_Cantidad_Contado,
	      Cantidad_cta_cte  = l_Cantidad_cta_cte,
	      Cantidad_Retorno  = l_Cantidad_Retorno,
	      Cantidad_Anuladas = l_Cantidad_Anuladas,
	      Cantidad_Cobro_en_Destino=l_Cantidad_Cobro_en_Destino,
	      nro_factura_inicial=l_nro_factura_inicial,
	      nro_factura_final=l_nro_factura_final,
	      nro_Recibo_inicial=l_nro_Recibo_inicial,
	      nro_Recibo_final=l_nro_Recibo_final
	where nrcaja = nrCaja_param;

	/* select * from rpt_Resumen_Caja_Puesto; */


END;