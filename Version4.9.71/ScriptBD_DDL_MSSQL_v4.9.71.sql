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



IF exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_validarNroComprobanteManual_v4_9_71'  )
	DROP PROCEDURE  [dbo].spu_validarNroComprobanteManual_v4_9_71
	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


GO

-- drop procedure spu_validarNroComprobanteManual_v4_9_71


---  Voy por acacacac !!!
--- SP_ActualizarComprobanteManual_v2_4 ->>> SP_ActualizarComprobanteManual_v2_5
-- Actualiza el nro de comprobante y talonario de una carga manual
CREATE     procedure spu_validarNroComprobanteManual_v4_9_71
(@nrTalonario_param        varchar(4),
@nrComprobante_param      varchar(12),
@tpComprobante_param      varchar(4),
@tpLetra_param            varchar(2),
@dtComprobante_param      date=null) 
AS
BEGIN

	

	DECLARE @maximo_nrComprobante   DECIMAL (18,0) 
	DECLARE @vlParametro		    DECIMAL (18,0) 
	DECLARE @maximo_dtComprobante  DATE

	SELECT @vlParametro = vlParametro  FROM TB_Parametros  where dsParametro =  'DESVIO_EN_NUMERACION_CARGA_MANUAL'

	SELECT @maximo_nrComprobante =  max(nrComprobante) FROM TB_Comprobantes WHERE   nrTalonario =   @nrTalonario_param
															AND tpComprobante = @tpComprobante_param
																	AND tpLetra = @tpLetra_param

	IF @nrComprobante_param > @maximo_nrComprobante +  @vlParametro 
	BEGIN
		SELECT 'ERROR' as Resultado , 'El número de comprobante ingresado ('+ convert(varchar,@nrComprobante_param) + ') supera el maximo permitido (' + convert(varchar, @maximo_nrComprobante +  @vlParametro)  + ')'
						  as DescripcionError
		RETURN;
	END

	IF @nrComprobante_param < @maximo_nrComprobante -  @vlParametro 
	BEGIN
		SELECT 'ERROR' as Resultado , 'El número de comprobante ingresado ('+ convert(varchar,@nrComprobante_param) + ') es menor al mínimo permitido (' + convert(varchar, @maximo_nrComprobante +  @vlParametro)  + ')'
						  as DescripcionError
		RETURN;
	END

	SELECT @maximo_dtComprobante =  dtComprobante FROM TB_Comprobantes WHERE   nrTalonario =   @nrTalonario_param
															AND tpComprobante = @tpComprobante_param
																	AND tpLetra = @tpLetra_param
																		 AND  nrComprobante  = @maximo_nrComprobante  

	IF @dtComprobante_param  < @maximo_dtComprobante
	BEGIN
		SELECT 'ERROR' as Resultado , 'La fecha ingresada ('+ convert(varchar,@nrComprobante_param) +
				 ') es menor a la fecha del último comprobante ingresado para este talonario (Comprobante: ' + 
				 @tpComprobante_param +'-'+ @tpLetra_param +'-'+ @nrTalonario_param  +'-'+ convert(varchar, @maximo_nrComprobante ) +', Fecha: '+ convert(varchar,  @maximo_dtComprobante , 103 ) + ' )'
						  as DescripcionError
		RETURN;
	END

	SELECT 'OK'  as Resultado , null  as DescripcionError 


END



