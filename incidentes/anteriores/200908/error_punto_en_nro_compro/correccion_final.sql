
/*
   select * from tb_comprobantes where nrComprobante like ('%.%') or
	 nrComprobante like ('%+%')  or
	 nrComprobante like ('%-%') or 
     nrComprobante like ('%.%')
*/

set dateformat dmy


select 'SP_ActualizarComprobante_v2_5        @nrTalonario_param =''' + a.nrTalonario  + ''',',
										   ' @nrComprobante_param = ''' + a.nrComprobante + ''',',
										   ' @tpComprobante_param =''' + a.tpComprobante  + ''',',
										   ' @tpLetra_param = '''+ a.tpLetra  ''',',
										   ' @nrTalonario_new_param ='''+ a.nrTalonario + ''',',
										   ' @nrComprobante_new_param =''0'+ replace(replace(a.nrComprobante,'.',''),'+','')  + ''',',
										   ' @tpComprobante_new_param ='''+ a.tpComprobante + ''',',
										   ' @tpLetra_new_param = ''' +  a.tpLetra + ''',',
										   ' @dtComprobante_new_param = '''+ convert(varchar,a.dtComprobante) + ''',',
										   ' @cdCondVenta_new_param = ''' + a.cdCondventa + ''',',
										   ' @tpComision_new_param = ''' + a.tpComision + + ''',',
										   ' @vlComision_new_param =' + convert(varchar,b.vlComision) + ',' ,
										   ' @nrCierre_param = null '
from 
tb_comprobantes a , tb_cupones b 
where (a.nrComprobante like ('%.%') or
	  a.nrComprobante like ('%+%')  or
	  a.nrComprobante like ('%-%') or 
      a.nrComprobante like ('%.%')) and
	  a.nrComprobante = b.nrComprabanteCliente and
	  a.nrTalonario   = b.nrTalonarioCliente and
	  a.tpComprobante = b.tpComprobanteCliente and
	  a.tpletra       = b.tpletraCliente

/*

	begin tran
	exec SP_ActualizarComprobante_v2_5        @nrTalonario_param ='0002',	 @nrComprobante_param = '0005646.    ',	 @tpComprobante_param ='B',	 @tpLetra_param = 'M',	 @nrTalonario_new_param ='0002',	 @nrComprobante_new_param ='000005646',	 @tpComprobante_new_param ='B',	 @tpLetra_new_param = 'M',	 @dtComprobante_new_param = 'Oct 11 2006 12:00AM',	 @cdCondVenta_new_param = 'Cobro en Destino',	 @tpComision_new_param = 'A Clientes',	 @vlComision_new_param =3,	 @nrCierre_param = null 
	rollback tran

	--Commit tran	  
*/


select * from tb_comprobantes a where nrComprobante = '00048202' and  nrTalonario ='0002'