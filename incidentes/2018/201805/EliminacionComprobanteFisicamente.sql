

select  flAnulado , flEliminar ,  * from  TB_Comprobantes  where nrComprobante = '00001490' and tpLetra = 'M'
and nrTalonario = '0001'


select  flAnulado , flEliminar ,  * from  TB_Cupones  where nrComprabanteCliente = '00001490'
 and tpLetraCliente = 'M'
and nrTalonarioCliente = '0001'


exec   sp_eliminarFisicamenteunComprobanteEliminadoLogicamente_v2_5
							@nrTalonario_param     = '0001',
							@nrComprobante_param    = '00001490',
							@tpComprobante_param    = 'FA',
							@tpLetra_param          = 'M'
