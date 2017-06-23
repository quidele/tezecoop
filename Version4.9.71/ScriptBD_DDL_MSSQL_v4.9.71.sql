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
/*

EXEC spu_validarNroComprobanteManual_v4_9_71 @nrTalonario_param   = '0006',@nrComprobante_param = '00633560',
@tpComprobante_param = 'FA',@tpLetra_param = 'B',@dtComprobante_param= '04/08/2016'


*/ 

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
		SELECT 'ERROR' as Resultado , 'La fecha ingresada ('+ convert(varchar,@dtComprobante_param) +
				 ') es menor a la fecha del último comprobante ingresado para este talonario (Comprobante: ' + 
				 @tpComprobante_param +'-'+ @tpLetra_param +'-'+ @nrTalonario_param  +'-'+ convert(varchar, @maximo_nrComprobante ) +', Fecha: '+ convert(varchar,  @maximo_dtComprobante , 103 ) + ' )'
						  as DescripcionError
		RETURN;
	END

	SELECT 'OK'  as Resultado , null  as DescripcionError 


END


GO

IF exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_actualizar_puntosdeventa_facturacion_v4_9_71'  )
	DROP PROCEDURE  [dbo].spu_actualizar_puntosdeventa_facturacion_v4_9_71
	

GO

	---  Exec spu_actualizar_puntosdeventa_facturacion_v4_7 @nrPuesto_param = 4 ,@tipo_iva = 'EX' ,@auto_impresor = 'S' ,@tpComprobante = 'FA' ,@nrComprobante = 134139 
CREATE procedure dbo.spu_actualizar_puntosdeventa_facturacion_v4_9_71
@nrPuesto_param    int=null,
@tipo_iva		   char(10)='CF',
@auto_impresor     char(1)='S',
@tpFormadePago	   varchar(20)=null,
@tpComprobante	   char(2)='FA',	  -- FA / ND / NC 
@nrComprobante     int		
as
begin


    
	--- INICIA IF -> if @auto_impresor ='S' 
	if @auto_impresor ='S' 
	begin
		
		-- INICIA @tpComprobante ='ND'  
		if @tpComprobante ='ND'  
		begin
			-- COMPLETAR LOGICA
			/*if @tpFormadePago='Cuenta Corriente' 
			begin
				/* select  @nrTalonario_auto_ctacte    as nrTalonario,
					@nrComprobante_auto_ctacte_nd_ult  as nrComprobante,
					@tpLetraRecibo				    as tpLetra,
					null	as nrCAI,
					null    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
				*/
				update  x set nrComprobante_auto_ctacte_nd_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
				return;	
			end*/
		
			if @tipo_iva = 'CF' or @tipo_iva = 'EX'
			begin
				/* select  @nrTalonario_automatico       as nrTalonario,
						@nrComprobante_automatico_nd_ult as nrComprobante,
						@tpLetra				    as tpLetra,
						@nrCAI_Talonario_auto	as nrCAI,
						@dtCAI_Talonario_auto   as dtCai,
						@flFacturaCtacte	as flFacturaCtacte
				*/
				update  x set nrComprobante_automatico_nd_ult = @nrComprobante  from TB_Puestos x  where  nrPuesto = @nrPuesto_param
				return;					
			end 
						
			if @tipo_iva = 'RI' 						
			begin
				/*
				select  @nrTalonario_auto_empresa       as nrTalonario,
						@nrComprobante_auto_empresa_nd_ult as nrComprobante,
						@tpLetraEmpresa				    as tpLetra,
						@nrCAI_Talonario_auto_empresa	as nrCAI,
						@dtCAI_Talonario_auto_empresa   as dtCai,
						@flFacturaCtacte	as flFacturaCtacte
				*/
				update  x set nrComprobante_auto_empresa_nd_ult = @nrComprobante  from TB_Puestos x  where  nrPuesto = @nrPuesto_param
				return;
			end
		
		
			/* select  @nrTalonario_auto_ctacte       as nrTalonario,
					@nrComprobante_auto_ctacte_nd_ult as nrComprobante,
					@tpLetraRecibo				    as tpLetra,
					null	as nrCAI,
					null    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte */

			update  x set nrComprobante_auto_ctacte_nd_ult = @nrComprobante  from TB_Puestos x  where  nrPuesto = @nrPuesto_param
			return;
			
		end -- FIN @tpComprobante ='ND'  

		-- INICIA   @tpComprobante ='NC'
		if @tpComprobante ='NC'
		begin
			-- COMPLETAR LOGICA
			/* if @tpFormadePago='Cuenta Corriente' 
			begin
				/* select  @nrTalonario_auto_ctacte    as nrTalonario,
					@nrComprobante_auto_ctacte_nc_ult  as nrComprobante,
					@tpLetraRecibo				    as tpLetra,
					null	as nrCAI,
					null    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
				*/
				update  x set nrComprobante_auto_ctacte_nc_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
				return;	
			end*/
		
			if @tipo_iva = 'CF' or @tipo_iva = 'EX'
			begin
				/* select  @nrTalonario_automatico       as nrTalonario,
						@nrComprobante_automatico_nc_ult as nrComprobante,
						@tpLetra				    as tpLetra,
						@nrCAI_Talonario_auto	as nrCAI,
						@dtCAI_Talonario_auto   as dtCai,
						@flFacturaCtacte	as flFacturaCtacte */
				update  x set nrComprobante_automatico_nc_ult = @nrComprobante  from TB_Puestos x  where  nrPuesto = @nrPuesto_param
				return;					
			end 
						
			if @tipo_iva = 'RI' 						
			begin
				/* select  @nrTalonario_auto_empresa       as nrTalonario,
						@nrComprobante_auto_empresa_nc_ult as nrComprobante,
						@tpLetraEmpresa				    as tpLetra,
						@nrCAI_Talonario_auto_empresa	as nrCAI,
						@dtCAI_Talonario_auto_empresa   as dtCai,
						@flFacturaCtacte	as flFacturaCtacte */
				update  x set nrComprobante_auto_empresa_nc_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
				return;
			end

			/*select  @nrTalonario_auto_ctacte       as nrTalonario,
					@nrComprobante_auto_ctacte_nc_ult as nrComprobante,
					@tpLetraRecibo				    as tpLetra,
					null	as nrCAI,
					null    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte */
					update  x set nrComprobante_auto_ctacte_nc_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
			return;

		end -- FIN   @tpComprobante ='NC'
		 
		if @tpFormadePago='Cuenta Corriente' 
		begin
			/* select  @nrTalonario_auto_ctacte    as nrTalonario,
				@nrComprobante_auto_ctacte_ult  as nrComprobante,
				@tpLetraRecibo				    as tpLetra,
				null	as nrCAI,
				null    as dtCai,
				@flFacturaCtacte	as flFacturaCtacte */
			update  x set nrComprobante_auto_ctacte_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
				return;	
		end
		
		if @tipo_iva = 'CF' or @tipo_iva = 'EX'
		begin
			/*select  @nrTalonario_automatico       as nrTalonario,
					@nrComprobante_automatico_ult as nrComprobante,
					@tpLetra				    as tpLetra,
					@nrCAI_Talonario_auto	as nrCAI,
					@dtCAI_Talonario_auto   as dtCai,
					@flFacturaCtacte	as flFacturaCtacte */
			update  x set nrComprobante_automatico_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
			return;					
		end 
						
		if @tipo_iva = 'RI' 						
		begin
			/*select  @nrTalonario_auto_empresa       as nrTalonario,
					@nrComprobante_auto_empresa_ult as nrComprobante,
					@tpLetraEmpresa				    as tpLetra,
					@nrCAI_Talonario_auto_empresa	as nrCAI,
					@dtCAI_Talonario_auto_empresa   as dtCai,
					@flFacturaCtacte	as flFacturaCtacte*/
			update  x set nrComprobante_auto_empresa_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
			return;
		end
		
		/* select  @nrTalonario_auto_ctacte       as nrTalonario,
				@nrComprobante_auto_ctacte_ult as nrComprobante,
				@tpLetraRecibo				    as tpLetra,
				null	as nrCAI,
				null    as dtCai,
				@flFacturaCtacte	as flFacturaCtacte */
		update  x set nrComprobante_auto_ctacte_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
		return;

	end
	--- FIN IF -> if @auto_impresor ='S' 


	--- SI NO ES AUTOIMPRESOR


	
			-- INICIA @tpComprobante ='ND'  
		if @tpComprobante ='ND'    
		begin
			if @tipo_iva = 'CF' or @tipo_iva = 'EX'
			begin
				update  x set nrComprobante_manual_nd_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
				return;					
			end 		
			if @tipo_iva = 'RI' 						
			begin
				update  x set nrComprobante_manual_empresa_nd_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
				return;
			end
			update  x set nrComprobante_auto_ctacte_nd_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param	
			return;
			
		end -- FIN @tpComprobante ='ND'  

		-- INICIA   @tpComprobante ='NC'
		if @tpComprobante ='NC'
		begin
		
			if @tipo_iva = 'CF' or @tipo_iva = 'EX'
			begin
				update  x set nrComprobante_manual_nc_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
				return;					
			end 
						
			if @tipo_iva = 'RI' 						
			begin
				update  x set nrComprobante_manual_empresa_nc_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
				return;
			end

			update  x set nrComprobante_auto_ctacte_nc_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param				
			return;

		end -- FIN   @tpComprobante ='NC'


	if @tpFormadePago='Cuenta Corriente' 
	begin

		   return;	 --- Aregado por Eulises corrige bug carga manual  -- fecha  20/05/2017
		   /*select  @nrTalonario_manual_ctacte       as nrTalonario,
			@nrComprobante_manual_ctacte_ult as nrComprobante,
			@tpLetraRecibo_manual		    as tpLetra,
			null	as nrCAI,
			null    as dtCai,
			@flFacturaCtacte	as flFacturaCtacte	 */
			update  x set nrComprobante_manual_ctacte_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
			return;	
	end
		
	if @tipo_iva = 'CF'  or  @tipo_iva = 'EX'
	begin
		/* select  @nrTalonario_manual       as nrTalonario,
				@nrComprobante_manual_ult as nrComprobante,
				@tpLetra		    as tpLetra,
				null	as nrCAI,
				null    as dtCai,
				@flFacturaCtacte	as flFacturaCtacte */
		update  x set nrComprobante_manual_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
		return;					
	end 
					
	if @tipo_iva = 'RI' 						
	begin
		/* select  @nrTalonario_manual_empresa       as nrTalonario,
				@nrComprobante_manual_empresa_ult as nrComprobante,
				@tpLetraEmpresa_manual				    as tpLetra,
				null	as nrCAI,
				null   as dtCai,
				@flFacturaCtacte	as flFacturaCtacte */
		update  x set nrComprobante_manual_empresa_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param
		return;
	end
	
	/*
	select  @nrTalonario_manual_ctacte       as nrTalonario,
			@nrComprobante_manual_ctacte_ult as nrComprobante,
			@tpLetraRecibo_manual		    as tpLetra,
			null	as nrCAI,
			null    as dtCai,
			@flFacturaCtacte	as flFacturaCtacte
	*/
	update  x set nrComprobante_manual_ctacte_ult = @nrComprobante  from TB_Puestos x where  nrPuesto = @nrPuesto_param

end;


GO

IF exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtener_puntosdeventa_facturacion_v4_9_71'  )
	DROP PROCEDURE  [dbo].spu_obtener_puntosdeventa_facturacion_v4_9_71

GO

/*

	Exec dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S, @tpComprobante	= 'FA'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9,@tipo_iva='RI',@auto_impresor='S', @tpComprobante	= 'FA'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='S', @tpComprobante	= 'FA'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='N', @tpComprobante	= 'FA'
	Exec dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=4, @tipo_iva = CF,  @auto_impresor = S, @tpComprobante	= 'FA', 

	Exec dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S, @tpComprobante	= 'ND'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9,@tipo_iva='RI',@auto_impresor='S', @tpComprobante	= 'ND'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='S', @tpComprobante	= 'ND'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='N', @tpComprobante	= 'ND'
	Exec dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=4, @tipo_iva = CF,  @auto_impresor = S, @tpComprobante	= 'ND'

	Exec dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=4, @tipo_iva = 'RI',  @auto_impresor = S, @tpComprobante	= 'ND', @tpFormadePago =  "Cuenta Corriente"	
	Exec dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S, @tpComprobante	= 'NC'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9,@tipo_iva='RI',@auto_impresor='S', @tpComprobante	= 'NC'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='S', @tpComprobante	= 'NC'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='N', @tpComprobante	= 'NC'
	Exec dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S, @tpComprobante	= 'NC'

	Exec spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param = 4 ,@tipo_iva = 'EX' ,@auto_impresor = 'S' ,
	@tpFormadePago = 'Cuenta Corriente' ,@tpComprobante = 'NC' 

	select * from tb_puestos    where nrPuesto = 4 

	Exec dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=4, @tipo_iva = EX,  @auto_impresor = S, @tpFormadePago = null,  @tpComprobante = 'FA'

Exec spu_obtener_puntosdeventa_facturacion_v4_9_71 @nrPuesto_param = 1 ,@tipo_iva = 'CF' ,@auto_impresor = 'N' ,@tpFormadePago = null ,@tpComprobante = 'ND' 

*/

GO

create procedure dbo.spu_obtener_puntosdeventa_facturacion_v4_9_71
@nrPuesto_param    int=null,
@tipo_iva		   char(10)='CF',
@auto_impresor     char(1)='S',
@tpFormadePago	   varchar(20)=null,
@tpComprobante	   char(2)='FA'	  -- FA / ND / NC 
as
begin
declare 	@nrPuesto 	as		smallint			
declare 	@dsPuesto 	as		varchar	(50)
declare 	@dsIP 		as		varchar	(15)
declare 	@dtActualizado 	as		datetime			
declare 	@nrTalonario_manual 	as		int			
declare 	@nrTalonario_automatico 	as		int			
declare 	@nrComprobante_manual_ult 	as		int			
declare 	@nrComprobante_automatico_ult 	as		int			
declare 	@flRespeta_secuencia_carga_manual 	as		bit			
declare 	@tpletra 	as		char			
declare 	@dtActualizacion 	as		datetime			
declare 	@flEliminar 	as		bit			
declare 	@nrTalonario_manual_empresa 	as		int			
declare 	@nrTalonario_manual_ctacte 	as		int			
declare 	@nrComprobante_manual_empresa_ult 	as		int			
declare 	@nrComprobante_manual_ctacte_ult 	as		int			
declare 	@tpLetraEmpresa 	as		char	(10)
declare 	@tpLetraRecibo 	as		char	(10)
declare 	@nrTalonario_auto_empresa 	as		int			
declare 	@nrTalonario_auto_ctacte 	as		int			
declare 	@nrComprobante_auto_ctacte_ult 	as		int			
declare 	@nrComprobante_auto_empresa_ult 	as		int			
declare 	@tpletra_manual 	as		char	(10)
declare 	@tpLetraEmpresa_manual 	as		char	(10)
declare 	@tpLetraRecibo_manual	as		char	(10)
declare 	@nrCAI_Talonario_auto	as		decimal			
declare 	@dtCAI_Talonario_auto	as		datetime			
declare 	@nrCAI_Talonario_auto_empresa	as		decimal			
declare 	@dtCAI_Talonario_auto_empresa	as		datetime			
declare 	@flFacturaCtacte	as		bit			
declare	    @nrComprobante_automatico_nd_ult	as int
declare	    @nrComprobante_auto_empresa_nd_ult	as int
declare	    @nrComprobante_auto_ctacte_nd_ult	as int
declare	    @nrComprobante_manual_nd_ult	as int
declare	    @nrComprobante_manual_empresa_nd_ult	as int
declare	    @nrComprobante_manual_ctacte_nd_ult	as int
declare	    @nrComprobante_automatico_nc_ult	as int
declare	    @nrComprobante_auto_empresa_nc_ult	as int
declare	    @nrComprobante_auto_ctacte_nc_ult	as int
declare	    @nrComprobante_manual_nc_ult	as int
declare	    @nrComprobante_manual_empresa_nc_ult	as int
declare	    @nrComprobante_manual_ctacte_nc_ult	as int

    /* COMENTADO version v2.0
	   if @nrPuesto_param= 9
		set @nrPuesto_param = 4
	*/

	select
		@nrPuesto  = nrPuesto,
		@dsPuesto  = dsPuesto,
		@dsIP  =  dsIP,
		@dtActualizado  = dtActualizado,
		@nrTalonario_manual  = nrTalonario_manual,
		@nrTalonario_automatico  = nrTalonario_automatico,
		@nrComprobante_manual_ult  = nrComprobante_manual_ult,
		@nrComprobante_automatico_ult  = nrComprobante_automatico_ult,
		@flRespeta_secuencia_carga_manual  = flRespeta_secuencia_carga_manual,
		@tpletra  = tpletra,
		@dtActualizacion  = dtActualizacion,
		@flEliminar  = flEliminar,
		@nrTalonario_manual_empresa  = nrTalonario_manual_empresa,
		@nrTalonario_manual_ctacte  = nrTalonario_manual_ctacte,
		@nrComprobante_manual_empresa_ult  = nrComprobante_manual_empresa_ult,
		@nrComprobante_manual_ctacte_ult  = nrComprobante_manual_ctacte_ult,
		@tpLetraEmpresa  = tpLetraEmpresa,
		@tpLetraRecibo  = tpLetraRecibo,
		@nrTalonario_auto_empresa  = nrTalonario_auto_empresa,
		@nrTalonario_auto_ctacte  = nrTalonario_auto_ctacte,
		@nrComprobante_auto_ctacte_ult  = nrComprobante_auto_ctacte_ult,
		@nrComprobante_auto_empresa_ult  = nrComprobante_auto_empresa_ult,
		@tpletra_manual  = tpletra_manual,
		@tpLetraEmpresa_manual  = tpLetraEmpresa_manual,
		@tpLetraRecibo_manual	=	tpLetraRecibo_manual	,
		@nrCAI_Talonario_auto	=	nrCAI_Talonario_auto	,
		@dtCAI_Talonario_auto	=	dtCAI_Talonario_auto	,
		@nrCAI_Talonario_auto_empresa	=	nrCAI_Talonario_auto_empresa	,
		@dtCAI_Talonario_auto_empresa	=	dtCAI_Talonario_auto_empresa	,
		@flFacturaCtacte	=	flFacturaCtacte,
		@nrComprobante_automatico_nd_ult	=	nrComprobante_automatico_nd_ult	,
		@nrComprobante_auto_empresa_nd_ult	=	nrComprobante_auto_empresa_nd_ult	,
		@nrComprobante_auto_ctacte_nd_ult	=	nrComprobante_auto_ctacte_nd_ult	,
		@nrComprobante_manual_nd_ult	=	nrComprobante_manual_nd_ult	,
		@nrComprobante_manual_empresa_nd_ult	=	nrComprobante_manual_empresa_nd_ult	,
		@nrComprobante_manual_ctacte_nd_ult	=	nrComprobante_manual_ctacte_nd_ult	,
		@nrComprobante_automatico_nc_ult	=	nrComprobante_automatico_nc_ult	,
		@nrComprobante_auto_empresa_nc_ult	=	nrComprobante_auto_empresa_nc_ult	,
		@nrComprobante_auto_ctacte_nc_ult	=	nrComprobante_auto_ctacte_nc_ult	,
		@nrComprobante_manual_nc_ult	=	nrComprobante_manual_nc_ult	,
		@nrComprobante_manual_empresa_nc_ult =	nrComprobante_manual_empresa_nc_ult	,
		@nrComprobante_manual_ctacte_nc_ult	=	nrComprobante_manual_ctacte_nc_ult	
	from TB_Puestos
	where  (nrPuesto = @nrPuesto_param OR  @nrPuesto_param is null) 
	and flEliminar=0
	
	
	--- INICIA IF -> if @auto_impresor ='S' 
	if @auto_impresor ='S' 
	begin
		
		-- INICIA @tpComprobante ='ND'  
		if @tpComprobante ='ND'  
		begin
			-- COMPLETAR LOGICA
			/* if @tpFormadePago='Cuenta Corriente' 
			begin
				select  @nrTalonario_auto_ctacte    as nrTalonario,
					@nrComprobante_auto_ctacte_nd_ult  as nrComprobante,
					@tpLetraRecibo				    as tpLetra,
					null	as nrCAI,
					null    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
					return;	
			end */
		
			if @tipo_iva = 'CF' or @tipo_iva = 'EX'
			begin
				select  @nrTalonario_automatico       as nrTalonario,
						@nrComprobante_automatico_nd_ult as nrComprobante,
						@tpLetra				    as tpLetra,
						@nrCAI_Talonario_auto	as nrCAI,
						@dtCAI_Talonario_auto   as dtCai,
						@flFacturaCtacte	as flFacturaCtacte
				return;					
			end 
						
			if @tipo_iva = 'RI' 						
			begin
				select  @nrTalonario_auto_empresa       as nrTalonario,
						@nrComprobante_auto_empresa_nd_ult as nrComprobante,
						@tpLetraEmpresa				    as tpLetra,
						@nrCAI_Talonario_auto_empresa	as nrCAI,
						@dtCAI_Talonario_auto_empresa   as dtCai,
						@flFacturaCtacte	as flFacturaCtacte
				return;
			end
		
		
			select  @nrTalonario_auto_ctacte       as nrTalonario,
					@nrComprobante_auto_ctacte_nd_ult as nrComprobante,
					@tpLetraRecibo				    as tpLetra,
					null	as nrCAI,
					null    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
			return;
			
		end -- FIN @tpComprobante ='ND'  

		-- INICIA   @tpComprobante ='NC'
		if @tpComprobante ='NC'
		begin
			-- COMPLETAR LOGICA
			/*if @tpFormadePago='Cuenta Corriente' 
			begin
				select  @nrTalonario_auto_ctacte    as nrTalonario,
					@nrComprobante_auto_ctacte_nc_ult  as nrComprobante,
					@tpLetraRecibo				    as tpLetra,
					null	as nrCAI,
					null    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
					return;	
			end */
		
			if @tipo_iva = 'CF' or @tipo_iva = 'EX'
			begin
				select  @nrTalonario_automatico       as nrTalonario,
						@nrComprobante_automatico_nc_ult as nrComprobante,
						@tpLetra				    as tpLetra,
						@nrCAI_Talonario_auto	as nrCAI,
						@dtCAI_Talonario_auto   as dtCai,
						@flFacturaCtacte	as flFacturaCtacte
				return;					
			end 
						
			if @tipo_iva = 'RI' 						
			begin
				select  @nrTalonario_auto_empresa       as nrTalonario,
						@nrComprobante_auto_empresa_nc_ult as nrComprobante,
						@tpLetraEmpresa				    as tpLetra,
						@nrCAI_Talonario_auto_empresa	as nrCAI,
						@dtCAI_Talonario_auto_empresa   as dtCai,
						@flFacturaCtacte	as flFacturaCtacte
				return;
			end

			select  @nrTalonario_auto_ctacte       as nrTalonario,
					@nrComprobante_auto_ctacte_nc_ult as nrComprobante,
					@tpLetraRecibo				    as tpLetra,
					null	as nrCAI,
					null    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
			return;

		end -- FIN   @tpComprobante ='NC'
		 
		if @tpFormadePago='Cuenta Corriente' 
		begin
			select  @nrTalonario_auto_ctacte    as nrTalonario,
				@nrComprobante_auto_ctacte_ult  as nrComprobante,
				@tpLetraRecibo				    as tpLetra,
				null	as nrCAI,
				null    as dtCai,
				@flFacturaCtacte	as flFacturaCtacte
				return;	
		end
		
		if @tipo_iva = 'CF' or @tipo_iva = 'EX'
		begin
			print 'Sale por ACA - 1'
			select  @nrTalonario_automatico       as nrTalonario,
					@nrComprobante_automatico_ult as nrComprobante,
					@tpLetra				    as tpLetra,
					@nrCAI_Talonario_auto	as nrCAI,
					@dtCAI_Talonario_auto   as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
			return;					
		end 
						
		if @tipo_iva = 'RI' 						
		begin
			select  @nrTalonario_auto_empresa       as nrTalonario,
					@nrComprobante_auto_empresa_ult as nrComprobante,
					@tpLetraEmpresa				    as tpLetra,
					@nrCAI_Talonario_auto_empresa	as nrCAI,
					@dtCAI_Talonario_auto_empresa   as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
			return;
		end
		
		select  @nrTalonario_manual_ctacte         as nrTalonario,
				@nrComprobante_auto_ctacte_ult as nrComprobante,
				@tpLetraRecibo				    as tpLetra,
				null	as nrCAI,
				null    as dtCai,
				@flFacturaCtacte	as flFacturaCtacte
		return;

	end
	--- FIN IF -> if @auto_impresor ='S' 


	    --- SI NO ES AUTOIMPRESOR

			-- INICIA @tpComprobante ='ND'  
		if @tpComprobante ='ND'    
		begin
			
		
			if @tipo_iva = 'CF' or @tipo_iva = 'EX'
			begin
				select  @nrTalonario_manual         as nrTalonario,
						@nrComprobante_manual_nd_ult	 as nrComprobante,
						@tpletra_manual  				    as tpLetra,
						null	as nrCAI,
						null   as dtCai,
						@flFacturaCtacte	as flFacturaCtacte
				return;					
			end 
						
			if @tipo_iva = 'RI' 						
			begin
				select  @nrTalonario_manual_empresa           as nrTalonario,
						@nrComprobante_manual_empresa_nd_ult  as nrComprobante,
						@tpLetraEmpresa_manual  			  as tpLetra,
						null	as nrCAI,
						null   as dtCai,
						@flFacturaCtacte	as flFacturaCtacte
				return;
			end
		
		
			select  @nrTalonario_manual_ctacte         as nrTalonario,
					@nrComprobante_auto_ctacte_nd_ult  as nrComprobante,
					@tpLetraRecibo_manual		       as tpLetra,
					null	as nrCAI,
					null    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
			return;
			
		end -- FIN @tpComprobante ='ND'  

		-- INICIA   @tpComprobante ='NC'
		if @tpComprobante ='NC'
		begin
		
			if @tipo_iva = 'CF' or @tipo_iva = 'EX'
			begin
				select  @nrTalonario_manual         as nrTalonario,
						@nrComprobante_manual_nc_ult	 as nrComprobante,
						@tpletra_manual  				    as tpLetra,
						null	as nrCAI,
						null   as dtCai,
						@flFacturaCtacte	as flFacturaCtacte
				return;					
			end 
						
			if @tipo_iva = 'RI' 						
			begin
				select  @nrTalonario_manual_empresa           as nrTalonario,
						@nrComprobante_manual_empresa_nc_ult  as nrComprobante,
						@tpLetraEmpresa_manual  			  as tpLetra,
						null	as nrCAI,
						null   as dtCai,
						@flFacturaCtacte	as flFacturaCtacte
				return;
			end
		
		
			select  @nrTalonario_manual_ctacte         as nrTalonario,
					@nrComprobante_auto_ctacte_nc_ult  as nrComprobante,
					@tpLetraRecibo_manual		       as tpLetra,
					null	as nrCAI,
					null    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
			return;

		end -- FIN   @tpComprobante ='NC'


	if @tpFormadePago='Cuenta Corriente' 
	begin
	select  @nrTalonario_manual_ctacte       as nrTalonario,
			@nrComprobante_manual_ctacte_ult as nrComprobante,
			@tpLetraRecibo_manual		    as tpLetra,
			null	as nrCAI,
			null    as dtCai,
			@flFacturaCtacte	as flFacturaCtacte	
			return;	
	end
		
	if @tipo_iva = 'CF'  or  @tipo_iva = 'EX'
	begin
		select  @nrTalonario_manual       as nrTalonario,
				@nrComprobante_manual_ult as nrComprobante,
				@tpLetra		    as tpLetra,
				null	as nrCAI,
				null    as dtCai,
				@flFacturaCtacte	as flFacturaCtacte
		return;					
	end 
					
	if @tipo_iva = 'RI' 						
	begin
		select  @nrTalonario_manual_empresa       as nrTalonario,
				@nrComprobante_manual_empresa_ult as nrComprobante,
				@tpLetraEmpresa_manual				    as tpLetra,
				null	as nrCAI,
				null   as dtCai,
				@flFacturaCtacte	as flFacturaCtacte
		return;
	end
	
	
	select  @nrTalonario_manual_ctacte       as nrTalonario,
			@nrComprobante_manual_ctacte_ult as nrComprobante,
			@tpLetraRecibo_manual		    as tpLetra,
			null	as nrCAI,
			null    as dtCai,
			@flFacturaCtacte	as flFacturaCtacte


--- agregar try catch para evitar errores por numeros configurados en null	
end;




