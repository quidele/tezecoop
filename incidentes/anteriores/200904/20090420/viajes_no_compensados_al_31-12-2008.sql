
set dateformat dmy 

/*
update [dbo].[TB_Comprobantes] 
set dtComprobante_hora=CONVERT(varchar, TB_Comprobantes.dtComprobante, 103) 
		        + ' ' + TB_Comprobantes.dsOpcional1 + ':00'
where dtComprobante_hora is null
*/

declare @fecha_corte datetime

set  @fecha_corte =  '31/12/2008 06:00:00'

/*

---- Compensados
SELECT    TB_Cupones.nrLicencia as LICENCIA ,
	   TB_Cupones.nmLicenciatario as LICENCIATARIO,
	   TB_Cupones.nrTalonarioCliente as TALON, 
	   TB_Cupones.nrComprabanteCliente as COMPROBANTE, 
	   TB_Comprobantes.dtComprobante_hora as 'FECHA VIAJE', 
	   TB_Cupones.dtCompensado as 'FECHA PAGO',
	   vlComision as 'RETENCION',
	   TB_Cupones.vlIVA as 'IVA',
	   tpCupon,
	   Convert(decimal(8,2),TB_Cupones.vlPagoPesos + TB_Cupones.vlPagoEuros * TB_Cajas.vlDiaEuro + TB_Cupones.vlPagoDolares * TB_Cajas.vlDiaDolar)
                      AS 'PAGADO AL LIC',
	   vlMontoCupon as 'MONTO VIAJE',
	   TB_Cupones.Problema,
           TB_Cupones.Mellizo		
FROM         TB_Cupones INNER JOIN
                      TB_Comprobantes ON TB_Cupones.nrTalonarioCliente = TB_Comprobantes.nrTalonario AND 
                      TB_Cupones.nrComprabanteCliente = TB_Comprobantes.nrComprobante AND 
                      TB_Cupones.tpComprobanteCliente = TB_Comprobantes.tpComprobante AND TB_Cupones.tpLetraCliente = TB_Comprobantes.tpLetra INNER JOIN
                      TB_Cajas ON TB_Comprobantes.nrCaja = TB_Cajas.nrCaja
WHERE     (TB_Cupones.flAnulado = 0) AND (TB_Comprobantes.dtComprobante_hora <= 
		@fecha_corte) AND (TB_Cupones.flCompensado = 1) AND 
                      (TB_Cupones.dtCompensado>=@fecha_corte) and
	  dtInsercion<@fecha_corte

*/


-- No Compensados - pendientes
SELECT    TB_Cupones.nrLicencia as LICENCIA ,
	   TB_Cupones.nmLicenciatario as LICENCIATARIO,
	   TB_Cupones.nrTalonarioCliente as TALON, 
	   TB_Cupones.nrComprabanteCliente as COMPROBANTE, 
	   TB_Comprobantes.dtComprobante_hora as 'FECHA VIAJE', 
	   TB_Cupones.dtCompensado as 'FECHA PAGO',
	   vlComision as 'RETENCION',
	   TB_Cupones.vlIVA as 'IVA', 
	   tpCupon,
	   TB_Cupones.vlPagoPesos + TB_Cupones.vlPagoEuros * TB_Cajas.vlDiaEuro + TB_Cupones.vlPagoDolares * TB_Cajas.vlDiaDolar
                      AS 'PAGADO AL LIC',
	   vlMontoCupon as 'MONTO VIAJE',
	   TB_Cupones.Problema,
           TB_Cupones.Mellizo		
FROM         TB_Cupones INNER JOIN
                      TB_Comprobantes ON TB_Cupones.nrTalonarioCliente = TB_Comprobantes.nrTalonario AND 
                      TB_Cupones.nrComprabanteCliente = TB_Comprobantes.nrComprobante AND 
                      TB_Cupones.tpComprobanteCliente = TB_Comprobantes.tpComprobante AND TB_Cupones.tpLetraCliente = TB_Comprobantes.tpLetra INNER JOIN
                      TB_Cajas ON TB_Comprobantes.nrCaja = TB_Cajas.nrCaja
WHERE     (TB_Cupones.flAnulado = 0) AND (TB_Comprobantes.dtComprobante_hora <= 
		@fecha_corte) AND (TB_Cupones.flCompensado = 0) AND 
                      (TB_Cupones.dtCompensado>=@fecha_corte) and
	  dtInsercion<@fecha_corte

