
	RECIBO: 
	1000320804
	0007-00525680

	select *  from tb_movimientoscontables where idrecibo = 1000320804

	select *  from tb_cupones where nrTalonarioCliente  = '0007' and  nrComprabanteCliente = '00525680'

	
	select *  from tb_movimientoscontables where idrecibo = 1000320804

	select max( nrCaja )   from TB_Cajas   


	select * from TB_MovimientosContables where nrCaja = 9000004292


	select *  into bkp_tb_cupones_02052017 from tb_cupones where nrTalonarioCliente  = '0007' and  nrComprabanteCliente = '00525680'

	select *  from tb_cupones where nrTalonarioCliente  = '0007' and  nrComprabanteCliente = '00525680'

	update   x  set flCompensado = 0 , dtCompensado = null , IdRecibo = null , nrCajaLicenciatario = null , dtCajaLicenciatario = null   from tb_cupones  x  where nrTalonarioCliente  = '0007' and  nrComprabanteCliente = '00525680'


	update   x  set flCompensado = 0 , dtCompensado = null , IdRecibo = null , nrCajaLicenciatario = null , dtCajaLicenciatario = null   from tb_cupones  x  where nrTalonarioCliente  = '0007' and  nrComprabanteCliente = '00525680'