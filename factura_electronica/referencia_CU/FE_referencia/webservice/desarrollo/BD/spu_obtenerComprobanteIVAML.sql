USE FacturaElectronica_Prueba
GO

CREATE PROCEDURE spu_obtenerComprobanteIVAML
AS
BEGIN

		select    
			cod_sopmg_impu id, 
			ABS( sum ( round (imp_mov_ing  /  ( simp.porc_impuesto /100 ),2) * signo)  )  baseimp  ,								 
			simp.porc_impuesto alic, 
			ABS (sum (imp_mov_ing * signo)) importe
			
		from	Magma_ERP_Desa.dbo.cpf_impsimples  simp, 
				Magma_ERP_Desa.dbo.ct_impuestos impu
		where	cod_doc =  'fcl' and 
				nro_doc = 10256 and 
				cod_impuesto = 'IVA' and 
				simp.cod_tasa_impu  = impu.cod_tasa_impu and 
				cod_impuesto =  cod_tipo_impu 
				
		group by	cod_sopmg_impu, 
					simp.porc_impuesto 


END
GO