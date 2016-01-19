
use dbSG2000
go 


IF EXISTS ( SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_ValidarCUIT]') )
	begin
	drop function dbo.ufn_ValidarCUIT
	end
GO

create function dbo.ufn_ValidarCUIT (@cuit varchar(13))
returns  bit
as

begin
declare @verificador int
declare @resultado int = 0
declare @cuit_nro varchar(11)
declare @validacion bit
declare @codes varchar(10) = '6789456789'

	set @cuit_nro = REPLACE(@cuit, '-', '')

	if isnumeric(@cuit_nro) <> 1
	begin
		return 0
	end

	if len(@cuit_nro) <> 11
	begin
		set @validacion = 0
	end

	set @verificador = RIGHT(@cuit_nro, 1)

	declare @x int = 0

	while @x < 10
	begin
		declare @digitoValidador int = convert(int, substring(@codes, @x + 1, 1))
		declare @digito int = convert(int, substring(@cuit_nro, @x + 1, 1))
		declare @digitoValidacion int = @digitoValidador * @digito
		set @resultado = @resultado + @digitoValidacion
		set @x = @x + 1
	end

	set @resultado = @resultado % 11

	If @resultado = @verificador
	begin
		set @validacion = 1
	end
	else
	begin
		set @validacion = 0
	End

	return @validacion
end

go


/*

	/* obtenemos los licenciatarios con cuit ok */
		select  nrLicencia ,  nrCUIT ,   dbo.ufn_ValidarCUIT(nrCUIT) cuitOK,  nmNombre +' '+ nmApellido nombre_completo
		from TB_Proveedores  where nrLicencia is not null  and  dbo.ufn_ValidarCUIT(nrCUIT) = 0 
								   order by nrLicencia

*/

		GO

		IF EXISTS ( SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.tmp_licenciaratios_CuitOK') )
			begin
			drop table dbo.tmp_licenciaratios_CuitOK
			end
		GO

		
		/* obtenemos los licenciatarios con cuit ok */
		/* 
		select  nrLicencia ,  nrCUIT ,   dbo.ufn_ValidarCUIT(nrCUIT) cuitOK,  nmNombre +' '+ nmApellido nombre_completo
		into tmp_licenciaratios_CuitOK
		from TB_Proveedores  where nrLicencia is not null  and  dbo.ufn_ValidarCUIT(nrCUIT) = 1 
								   order by nrLicencia
		*/

		IF EXISTS ( SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.tmp_comprobantes_sin_cuit') )
			begin
			drop table dbo.tmp_comprobantes_sin_cuit
			end
		GO

		Select  A.nrTalonario ,  A.nrComprobante , A.tpComprobante , A.tpLetra,  	 
				A.nrLicencia as nrLicenciaProveedor,			
			    B.nrCUIT  as   nrCUIT_proveedor,  
				dbo.ufn_ValidarCUIT (B.nrCUIT)  as   nrCUIT_Proveedor_OK,  
				B.nmNombre + ' ' + B.nmApellido as   nombre_completo_proveedor,
				'000000' as nrLicenciaCliente ,  
			    '00-00.000.000-0XXXX' as   nrCUITCliente,  
				'Eulises Marcelino Quidel                 XXXX' as nombre_completo_cliente
		into tmp_comprobantes_sin_cuit
		FROM TB_Comprobantes A  inner join TB_Proveedores B  on  A.nrLicencia = b.nrLicencia 
		WHERE  year(A.dtComprobante) = 2015  
		AND  vlTotalGeneral   > 999  and   dbo.ufn_ValidarCUIT (A.nrDoc )= 0
		AND tpComprobante  <>'X'

		--- select * from tmp_comprobantes_sin_cuit order by nrLicenciaProveedor 


		alter table tmp_comprobantes_sin_cuit add idtabla int identity(1,1)

		--select * from tmp_comprobantes_sin_cuit
		/****************************************************************************/
		/***** REPROCESAR															*/ 
		/****************************************************************************/

		DECLARE @nrTalonario      varchar(4)
		DECLARE @nrComprobante	  varchar(10)
		DECLARE @tpComprobante	  varchar(2) 
		DECLARE @tpLetra	      char(1) 
		DECLARE @nrLicenciaCliente          varchar(6)
		DECLARE @nrLicenciaProveedor        varchar(6)
		declare @nrCUIT_proveedor			CHAR(13)
		declare @nrCUIT_Proveedor_OK		int
		declare @nombre_completo_proveedor  VARCHAR(60) 
		declare @nrCUITCliente				CHAR(13)  
		declare @nombre_completo_cliente    VARCHAR(60) 

		declare	@maxid			  int 

		DECLARE @nrTalonario_seleccionado     varchar(4)
		DECLARE @nrComprobante_seleccionado	  varchar(10)
		DECLARE @tpComprobante_seleccionado	  varchar(2) 
		DECLARE @tpLetra_seleccionado	      char(1) 			


		/* cursor de comprobante - proveedores involucrados */
		DECLARE cur_01 CURSOR FOR SELECT nrTalonario ,  nrComprobante , tpComprobante , tpLetra, nrLicenciaProveedor ,
		nrCUIT_proveedor, nrCUIT_Proveedor_OK, nombre_completo_proveedor 
		FROM tmp_comprobantes_sin_cuit where nrLicenciaCliente = '000000' ORDER BY nrLicenciaProveedor

		
		OPEN cur_01
	
		FETCH NEXT FROM cur_01 INTO  @nrTalonario, @nrComprobante,  @tpComprobante, @tpLetra, @nrLicenciaProveedor,
									 @nrCUIT_proveedor, @nrCUIT_Proveedor_OK, @nombre_completo_proveedor
	
		WHILE @@fetch_status = 0
		BEGIN

			select  @nrLicenciaCliente = null, @nrCUITCliente = null, @nombre_completo_cliente = null

			--select * from tmp_comprobantes_sin_cuit
			-- Seleccionar talonario a afectar 
			select  
					@nrTalonario_seleccionado = nrTalonario ,     
					@nrComprobante_seleccionado = nrComprobante ,
					@tpComprobante_seleccionado = tpComprobante,	  
					@tpLetra_seleccionado = tpLetra,
					@nrLicenciaCliente = @nrLicenciaProveedor,
					@nrCUITCliente = isnull(@nrCUIT_proveedor,'NO VALIDO') ,
					@nombre_completo_cliente = @nombre_completo_proveedor 
			from    tmp_comprobantes_sin_cuit
			where   nrLicenciaCliente = '000000' and nrLicenciaProveedor <> @nrLicenciaProveedor

			if @nrLicenciaCliente is null
			begin
				print ' sale por break  '
				break
			end

			

			update  tmp_comprobantes_sin_cuit set	nrLicenciaCliente = @nrLicenciaCliente, 
					nrCUITCliente   = @nrCUITCliente ,   nombre_completo_cliente  =  @nombre_completo_cliente
			where nrTalonario =  @nrTalonario_seleccionado and nrComprobante =  @nrComprobante_seleccionado
				and   tpComprobante = @tpComprobante_seleccionado and tpLetra =  @tpLetra_seleccionado	   
			 
   
			 
			FETCH NEXT FROM cur_01 INTO  @nrTalonario, @nrComprobante,  @tpComprobante, @tpLetra, @nrLicenciaProveedor,
									 @nrCUIT_proveedor, @nrCUIT_Proveedor_OK, @nombre_completo_proveedor	     	         
		
		END

		CLOSE cur_01;
		DEALLOCATE cur_01;

		
		

		select * from tmp_comprobantes_sin_cuit ORDER BY nrLicenciaProveedor