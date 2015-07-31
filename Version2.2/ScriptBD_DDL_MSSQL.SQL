-- cambios de DDL version 2.2
use dbSG2000
go



alter procedure rpt_ComprobantesManuales_cajapuesto_v2_2
@nrCaja_param  numeric
as
begin 

	SELECT
		a.nrCaja, 
		a.flestado,
		a.nrPuesto,
		b.nmEmpleado,
		b.nrTalonario, 
		b.nrComprobante, 
		b.tpComprobante,
		b.cdCondVenta, 
		b.vlPagoPesos, 
		b.vlPagoEuros,
		b.vlPagoDolares, 
		b.nrLicencia, 
		b.dsOpcional1, 
		b.flAnulado, 
		b.nmEmpleado,
		c.dsProducto,
		b.flManual,
		b.dsOpcional2
	FROM
		TB_Cajas a,
		TB_Comprobantes b,
		TB_ComprobantesDetalle c
	WHERE
		a.nrCaja = b.nrCaja AND
		b.nrTalonario = c.nrTalonario AND
		b.nrComprobante = c.nrComprobante AND
		b.tpComprobante = c.tpComprobante AND
		b.tpLetra = c.tpLetra
		and a.nrCaja =  @nrCaja_param 
		and b.flManual in ('M')
	ORDER BY
	       b.nrComprobante ASC
	     

end


go 


rpt_ComprobantesManuales_cajapuesto_v2_2 9000001096