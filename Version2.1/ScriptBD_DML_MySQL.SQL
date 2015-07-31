
use dbSG2000;

go 
/*****************************************/
alter PROCEDURE SP_ObtenerIVAVentas_v2_1
@nrMes_param	     int,	
@nrAnio_param	     int,
@tpComprobante_param char(1),
@tpFacturacion_param char(1)
as

	if @tpComprobante_param=' '
		 set @tpComprobante_param=null

	if @tpFacturacion_param=' '
		set @tpFacturacion_param=null


		SELECT convert(varchar,a.dtComprobante,103) as 'FECHA',
		       'FAC' as 'Tipo',
	               rtrim(a.tpComprobante)+
 		       rtrim(a.nrTalonario)+
		       rtrim(a.nrComprobante) as 'Nro COMP', 
		       a.dsRazonSocial 'RAZON_SOCIAL',
		       a.tpIVA 'CAT_IVA',
		       a.nrDOC 'CUIT/DNI',
		       'EXENTO'=Case isnull(a.vlIVA,0)
		       WHEN 0 THEN  convert(decimal(9,2),isnull(a.vlTotalGeneral,0))
		       ELSE convert(decimal(9,2),a.vlTotalGeneral) -
		            convert(decimal(9,2),isnull(a.vlSubTotal,0)) -
   		            convert(decimal(9,2),isnull(a.vlIVA,0)) 
		       END,
		       'GRAVADO'=Case isnull(a.vlIVA,0)
		       WHEN 0 THEN  0 
		       ELSE convert(decimal(9,2),isnull(a.vlSubTotal,0))
		       END,
		       convert(decimal(9,2),isnull(a.vlIVA,0)) as 'IVA',
		       convert(decimal(9,2),a.vlTotalGeneral) as 'IMPORTE',
	              'Anulado'=CASE a.flAnulado
		      WHEN '0' THEN 'NO' 
		      WHEN '1' THEN 'SI' 
		      END/*, 
		      'Tipo de Facturacion'=CASE a.flManual
		      WHEN 'M' THEN 'Manual'
		      WHEN 'N' THEN 'Automática'
		      WHEN 'S' THEN 'Manual'
		      WHEN 'N' THEN 'Automática'
		      END */
		      into #temp_iva_con_Anulados
		FROM TB_Comprobantes a -- , TB_Cupones b
		where
		   /*a.nrComprobante =  b.nrComprabanteCliente and 
		   a.nrTalonario =  b.nrTalonarioCliente  and 
		   a.tpComprobante =  b.tpComprobanteCliente  and 
		   a.tpLetra =  b.tpLetraCliente and*/
		    month(a.dtComprobante) = @nrMes_param and
		    year(a.dtComprobante) = @nrAnio_param and	
		    a.tpComprobante=isnull(@tpComprobante_param,a.tpComprobante) and
		    a.flManual=isnull(@tpFacturacion_param,a.flManual) and
		    a.flEliminar=0 
	            -- and a.vlIva>0
		  order by convert(datetime,convert(varchar, a.dtComprobante, 103) 
		        + ' ' + a.dsOpcional1 + ':00')



	
       select FECHA,
              Tipo,
              [Nro COMP],
	      'RAZON_SOCIAL'=case a.Anulado
	      WHEN 'SI' THEN 'ANULADO'
	      ELSE RAZON_SOCIAL END,
	      CAT_IVA,
	      [CUIT/DNI],
	      'EXENTO'=case a.Anulado
	      WHEN 'SI' THEN 0	
	      ELSE EXENTO END,
	      'GRAVADO'=case a.Anulado
	      WHEN 'SI' THEN 0		
	      ELSE GRAVADO END,
	      'IVA'=case a.Anulado
	      WHEN 'SI' THEN 0	
	      ELSE IVA END,
	      'IMPORTE'=case a.Anulado
	      WHEN 'SI' THEN 0	
	      ELSE IMPORTE END, 
	      a.Anulado 	
       from #temp_iva_con_Anulados a

