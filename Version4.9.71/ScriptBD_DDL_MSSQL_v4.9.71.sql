-- Cambios de DDL version 4.9.7
use dbSG2000
go


IF exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_ObtenerFacturacionMensual_v4_9_71'  )
	DROP PROCEDURE  [dbo].SP_ObtenerFacturacionMensual_v4_9_71
	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

EXEC SP_ObtenerFacturacionMensual_v4_9_71 01,2017,6,null,null,'COMPROBANTE',null


select * from tb_comprobantes

*/

CREATE PROCEDURE SP_ObtenerFacturacionMensual_v4_9_71
@nrMes_param	     int,	
@nrAnio_param	     int,
@nrTalonario_param   int,
@tpComprobante_param varchar(5),
@tpFacturacion_param char(1) ,
@ordenar_por_param    varchar(50),
@tpLetra_param			 varchar(2)
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
			a.tpLetra=isnull(@tpLetra_param,a.tpLetra) and
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
			a.tpLetra=isnull(@tpLetra_param,a.tpLetra) and
		    a.flManual=isnull(@tpFacturacion_param,a.flManual) and
		    a.flEliminar=0 
		order by
		  convert(numeric,a.nrComprobante) asc 
	end
	
		              

GO


-- sp_helptext 'SP_ObtenerIVAVentas_v2_1' 


IF exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_ObtenerIVAVentas__v4_9_71'  )
	DROP PROCEDURE  [dbo].SP_ObtenerIVAVentas__v4_9_71
	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*****************************************/
CREATE PROCEDURE SP_ObtenerIVAVentas__v4_9_71
@nrMes_param	     int,	
@nrAnio_param	     int,
@tpComprobante_param varchar(5),
@tpFacturacion_param char(1),
@tpLetra_param			 varchar(2)
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
			a.tpLetra=isnull(@tpLetra_param,a.tpLetra) and
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



GO