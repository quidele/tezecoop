use Magma_ERP
go 

select * from fon.factura_electronica_ml_temp  

go 

drop procedure fon.spu_carga_factura_electronica_ml

go 


create procedure fon.spu_carga_factura_electronica_ml
(@nro_trans varchar(10),
 @serie_doc char(4),
 @nro_doc   char(8),
 @cod_doc   char(4))
as
begin
declare @strError   varchar(400)
declare @nro_trans_aux     int
declare @serie_doc_aux int
declare @nro_doc_aux   int

declare @pdv_afip			   char(8)
declare @nro_doc_afip		   char(8)
declare @cae_afip			   char(14)
declare @fecha_venc_cae_afip   char(8)
declare @fecha_emision_afip    char(8)

	if @cod_doc not in ('NDL','FCL','NCL') 
	begin
		RAISERROR ('ERROR: El documento ingresado nos es válido, no pertenece al mercado local.', 16, 1) 
		return 1;
	end
	

	delete from fon.factura_electronica_ml_temp  
	
	BULK INSERT fon.factura_electronica_ml_temp  FROM '\\Svr-magma-bd\Temp\fe_mercadolocal.txt' 
		WITH (FIRSTROW = 1,  FIELDTERMINATOR = ',' ) 
	
	/* validamos los parametros de entrada */
	if ISNUMERIC (@nro_trans) = 0 
	begin
		RAISERROR ('ERROR: El parámetro @nro_trans debe ser numérico ', 16, 1) 
		return 1;
	end 
	if ISNUMERIC (@nro_doc) = 0 
	begin
		RAISERROR ('ERROR: El parámetro @nro_doc debe ser numérico ', 16, 1) 
		return 1;
	end 
	if ISNUMERIC (@serie_doc) = 0 
	begin
		RAISERROR ('ERROR: El parámetro @serie_doc debe ser numérico ', 16, 1) 
		return 1;
	end
	
	if @nro_doc < 1000000 
	begin
		RAISERROR ('ERROR: el nro. de documento a actualizar debe ser mayor al 1.000.000', 16, 1) 
		return 1;
	end 
	
	set @nro_trans_aux = @nro_trans
	set @serie_doc_aux = @serie_doc
	set @nro_doc_aux   = @nro_doc
	/* validamos si existe el documento en cuestión */			
	
	if (select  COUNT(*) 
		from dbo.cpt_cabgenac where	 
			nro_trans = @nro_trans_aux  and 
			nro_doc   = @nro_doc_aux    and
			serie_doc = @serie_doc_aux) = 0 
	begin
		RAISERROR ('ERROR: El documento no existe, verifique los parametros ingresados', 16, 1) 
		return 1;
	end 		
	
		 
	
	/* obtenemos los datos provenientes del archivo */
	
	select  top 1
			@pdv_afip			 = pdv,
			@nro_doc_afip		 = numero,
			@cae_afip	         = cae,		   
			@fecha_venc_cae_afip = fecha_venc_cae,
			@fecha_emision_afip  = fecha_emision
		from fon.factura_electronica_ml_temp  
	
	set @strError = 'ERROR: El documento ' + @pdv_afip + ' - ' 
					+ @nro_doc_afip + ' - ' + 
					+ @cae_afip + ' - ' + 
					+ @fecha_venc_cae_afip + ' - ' + 
					+ @fecha_emision_afip 
					
	
	if ISNUMERIC (@pdv_afip) = 0 
	begin
		RAISERROR ('ERROR: El campo pdv de AFIP debe ser numérico ', 16, 1) 
		return 1;
	end 
	if ISNUMERIC (@cae_afip) = 0 
	begin
		RAISERROR ('ERROR: El campo cae de AFIP debe ser numérico ', 16, 1) 
		return 1;
	end 
	if ISNUMERIC (@nro_doc_afip) = 0 
	begin
		RAISERROR ('ERROR: El campo nro_doc de AFIP debe ser numérico ', 16, 1) 
		return 1;
	end 
	
	
	begin tran
	
	exec FacturaElectronica.dbo.ufn_actualizarDatosFacturaElectronica_v1_2 
			 @Nro_Trans   = @nro_trans_aux,
			 @Fec_vto     = @fecha_venc_cae_afip,
			 @cae         = @cae_afip,
			 @nvo_nro_fac = @nro_doc_afip, 
			 @Fec_Emision = @fecha_emision_afip
			 
	if @@ERROR <> 0
	begin
		rollback tran
		return 1;
	end 	
	
	commit tran
	
	select 1;

end 

go 


