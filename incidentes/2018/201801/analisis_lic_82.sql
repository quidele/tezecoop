

select * from  tb_comprobantes  where tpLetra = 'X' and nrComprobante like '00006990'  and nrLicencia = 82


select convert(char(10) , x.dtCupon, 103) as FECHA,
	   x.nrTalonarioCliente     as PDV,
	   x.tpLetraCliente         as LETRA,
	   x.nrComprabanteCliente   as NRO_DOC,
	   x.dtNoCompensado			as FECHA_BAJA,
	   x.vlMontoCupon		    as MONTO,
	   x.dsObservacion          as OBS
	   x.flAnulado			    as ANULADO_CUPON
	  from  tb_cupones  x   where   nrLicencia = 82
and flNoCompensado = 1 

select   convert(char(10) , x.dtCupon, 103) as FECHA,
	   x.nrTalonarioCliente     as PDV,
	   x.tpComprobanteCliente          as DOC,
	   x.tpLetraCliente         as LETRA,
	   x.nrComprabanteCliente   as NRO_DOC,
	   x.dtNoCompensado			as FECHA_BAJA,
	   x.vlMontoCupon		    as MONTO,
	   x.dsObservacion          as OBS, 
	   x.flAnulado			    as ANULADO_CUPON, 
	   y.flAnulado			    AS ANULACION_COMPROBANTE
	  from  tb_cupones  x  inner join tb_comprobantes y 
				ON   x.nrTalonarioCliente   =  y.nrTalonario
				     AND x.tpComprobanteCliente =  y.tpComprobante
					 AND x.tpLetraCliente = y.tpLetra
					 AND  x.nrComprabanteCliente   = y.nrComprobante
	    where   x.nrLicencia = 82  and x.flNoCompensado = 1 
