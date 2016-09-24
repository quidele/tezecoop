
use dbSG2000 
go 

set dateformat dmy 


update [dbo].[TB_Comprobantes] 
set dtComprobante_hora=CONVERT(varchar, TB_Comprobantes.dtComprobante, 103) 
		        + ' ' + TB_Comprobantes.dsOpcional1 + ':00'
where dtComprobante_hora is null


set dateformat dmy 

declare @fecha_corte datetime

set  @fecha_corte =  '31/12/2015 23:59:59'



---- Realizados antes del 31/12/2010 23:59:59 yCompensados despues de esa fecha 
SELECT TB_Cupones.nrLicencia as LICENCIA ,
	   TB_Cupones.nmLicenciatario as LICENCIATARIO,
	   TB_Cupones.nrTalonarioCliente as TALON, 
	   TB_Cupones.nrComprabanteCliente as COMPROBANTE, 
	   convert(varchar,TB_Comprobantes.dtComprobante_hora,113) as 'FECHA VIAJE', 
	   convert(varchar,TB_Cupones.dtCompensado,113) as 'FECHA PAGO',
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



set dateformat dmy 

declare @fecha_corte datetime

set  @fecha_corte =  '31/12/2010 23:59:59'

-- No Compensados - pendientes
SELECT    TB_Cupones.nrLicencia as LICENCIA ,
	   TB_Cupones.nmLicenciatario as LICENCIATARIO,
	   TB_Cupones.nrTalonarioCliente as TALON, 
	   TB_Cupones.nrComprabanteCliente as COMPROBANTE, 
	   convert(varchar,TB_Comprobantes.dtComprobante_hora,113) as 'FECHA VIAJE', 
	   convert(varchar,TB_Cupones.dtCompensado,113) as 'FECHA PAGO',
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





select b.dsRazonSocial 'CLIENTE', 
       d.flCompensado 'COBRADO AL CLIENTE', 
       d.dtCompensado 'FECHA COBRO', 
       a.vlMontoCupon 'MONTO' ,
       a.dtCupon 'FECHA LIQ', 
       a.tpLetraCliente +'-'+
       a.nrTalonarioCliente +'-'+
       a.nrComprabanteCliente AS 'RECIBO',
       a.dsDestino 'DETALLE'  ,
       a.IdReciboCtaCte,
       a.flAnulado
       --a.*
       from tb_cupones a 
            inner join  tb_clientes b on a.cdCliente =b.cdCliente
			left join TB_Comprobantes c on a.IdReciboCtaCte = c.IdReciboCtaCte
			left join TB_Cupones d on (c.nrComprobante = d.nrComprabanteCliente and
								       c.nrTalonario = d.nrTalonarioCliente and
								       c.tpComprobante  = d.tpComprobanteCliente and
								       c.tpLetra  = d.tpLetraCliente)							      
where 
	YEAR(a.dtCupon)=2015  and a.nrLicencia<>999
	and a.tpCupon= 'cuenta corriente'
ORDER BY a.dtCupon asc


select * from TB_Comprobantes where IdReciboCtaCte = '1000123582'

select * from TB_Cupones where nrTalonarioCliente = '0000' and  
							   nrComprabanteCliente = '00000035' and 
							   tpLetraCliente = 'X' 
