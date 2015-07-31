-- cambios de DML version 2.0
use dbSG2000
go


alter PROCEDURE SP_ObtenerFacturacionMensual_2_1
@nrMes_param	     int,	
@nrAnio_param	     int,
@nrTalonario_param   int,
@tpComprobante_param char(1),
@tpFacturacion_param char(1) ,
@ordenar_por_param    varchar(50)
as

	-- consultar si debemos tener en cuenta la hora tener en cuenta la hora
	if @ordenar_por_param ='FECHA' 
	begin
		SELECT a.nrTalonario Talonario,
		       a.nrComprobante Comprobante, 
	               a.tpComprobante 'Tipo de Comprobante', 
	               a.dtComprobante Fecha, 
	               a.flAnulado Anulado, 
	               a.nrLicencia Licencia, 
	               a.nmLicenciatario Licenciatario, 
	               a.vlTotalGeneral Importe,
	               b.vlComision Contribucion,
	               a.dsOpcional2 Destino,
		       b.flCompensado 'Pagado al Licenciatario',
		      'Tipo de Facturacion'=CASE a.flManual
		      WHEN 'M' THEN 'Manual'
		      WHEN 'N' THEN 'Automática'
		      WHEN 'S' THEN 'Manual'
		      WHEN 'N' THEN 'Automática'
		      END
		FROM TB_Comprobantes a, TB_Cupones b
		where
		   a.nrComprobante =  b.nrComprabanteCliente and 
		   a.nrTalonario =  b.nrTalonarioCliente  and 
		   a.tpComprobante =  b.tpComprobanteCliente  and 
		   a.tpLetra =  b.tpLetraCliente and
		    month(a.dtComprobante) = @nrMes_param and
		    year(a.dtComprobante) = @nrAnio_param and	
		   (convert(int,replace(a.nrTalonario,'.','')) = @nrTalonario_param
	             or @nrTalonario_param is null) and	
		    a.tpComprobante=isnull(@tpComprobante_param,a.tpComprobante) and
		    a.flManual=isnull(@tpFacturacion_param,a.flManual) and
		    a.flEliminar=0 
		  order by dtComprobante
	end 
	else
	begin
		SELECT a.nrTalonario Talonario,
		       a.nrComprobante Comprobante, 
	               a.tpComprobante 'Tipo de Comprobante', 
	               a.dtComprobante Fecha, 
	               a.flAnulado Anulado, 
	               a.nrLicencia Licencia, 
	               a.nmLicenciatario Licenciatario, 
	               a.vlTotalGeneral Importe,
	               b.vlComision Contribucion,
	               a.dsOpcional2 Destino,
		       b.flCompensado 'Pagado al Licenciatario',
		      'Tipo de Facturacion'=CASE a.flManual
		      WHEN 'M' THEN 'Manual'
		      WHEN 'N' THEN 'Automática'
		      WHEN 'S' THEN 'Manual'
		      WHEN 'N' THEN 'Automática'
		      END
		FROM TB_Comprobantes a, TB_Cupones b
		where
		   a.nrComprobante =  b.nrComprabanteCliente and 
		   a.nrTalonario =  b.nrTalonarioCliente  and 
		   a.tpComprobante =  b.tpComprobanteCliente  and 
		   a.tpLetra =  b.tpLetraCliente and
		    month(a.dtComprobante) = @nrMes_param and
		    year(a.dtComprobante) = @nrAnio_param and	
		   (convert(int,replace(a.nrTalonario,'.','')) = @nrTalonario_param
	             or @nrTalonario_param is null) and	
		    a.tpComprobante=isnull(@tpComprobante_param,a.tpComprobante) and
		    a.flManual=isnull(@tpFacturacion_param,a.flManual) and
		    a.flEliminar=0 
		order by
		  convert(numeric,a.nrComprobante) asc 
	end
	
		              
go


/*******************************************/
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
		  order by convert(datetime,a.dtComprobante + a.dsOpcional1)


go 







