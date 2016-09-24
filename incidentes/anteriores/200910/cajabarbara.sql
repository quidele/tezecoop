

	select *  from TB_ComprobantesCajasPuestosCierres
	where nrCaja ='1000004692'

	select 
	*  from tb_comprobantes  
	where  nrTalonario ='0001' and 	
	       nrComprobante ='00168138' and
	       tpComprobante ='B'
		

        update tb_comprobantes
	set    vlPagoEuros = 0,                                           
	       vlPagoDolares   = 0
	where  nrTalonario ='0001' and 	
	       nrComprobante ='00168138' and
	       tpComprobante ='B'
		

---begin tran 

     select * 
     from      TB_ComprobantesCajasPuestosCierres
     where     nrTalonario ='0001' and 	
	       nrComprobante ='00166638' and
	       tpComprobante ='B'

     update TB_ComprobantesCajasPuestosCierres
	set    vlPagoEuros = 0,                                           
	       vlPagoDolares   = 0
	where  nrTalonario ='0001' and 	
	       nrComprobante ='00166638' and
	       tpComprobante ='B'


-- commit tran


	select 
	*  from tb_Cupones  
	where  nrTalonarioCliente ='0001' and 	
	       nrComprabanteCliente ='00168138' and
	       tpComprobanteCliente ='B'
	
begin tran 
	

        update tb_Cupones
	set    vlPagoEuros = 0,                                           
	       vlPagoDolares   = 0
	where  nrTalonarioCliente ='0001' and 	
	       nrComprabanteCliente ='00168138' and
	       tpComprobanteCliente ='B'

commit tran