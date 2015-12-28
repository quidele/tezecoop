
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


		GO

		IF EXISTS ( SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.tmp_licenciaratios_CuitOK') )
			begin
			drop table dbo.tmp_licenciaratios_CuitOK
			end
		GO

		
		/* obtenemos los licenciatarios con cuit ok */
		select  nrLicencia ,  nrCUIT ,   dbo.ufn_ValidarCUIT(nrCUIT) cuitOK,  nmNombre +' '+ nmApellido nombre_completo
		into tmp_licenciaratios_CuitOK
		from TB_Proveedores  where nrLicencia is not null  and  dbo.ufn_ValidarCUIT(nrCUIT) = 1 
								   order by nrLicencia

		IF EXISTS ( SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.tmp_comprobantes_sin_cuit') )
			begin
			drop table dbo.tmp_comprobantes_sin_cuit
			end
		GO

		Select top 10  A.nrTalonario ,  A.nrComprobante , A.tpComprobante , A.tpLetra,  	 
			   '000' as nrLicencia ,  
			   '00-00.000.000-0' as   nrCUIT,  
			   'Eulises Marcelino Quidel ' as nombre_completo
		into tmp_comprobantes_sin_cuit
		FROM TB_Comprobantes A  inner join TB_Proveedores B  on  A.nrLicencia = b.nrLicencia 
		WHERE  year(A.dtComprobante) = 2015  
		AND  vlTotalGeneral   > 1000  and   dbo.ufn_ValidarCUIT (A.nrDoc )= 0
		AND tpComprobante  <>'X'


		/****************************************************************************/
		/***** REPROCESAR															*/ 
		/****************************************************************************/
		DECLARE @nrTalonario      varchar(4)
		DECLARE @nrComprobante	  varchar(10)
		DECLARE @tpComprobante	  varchar(2) 
		DECLARE @tpLetra	      char(1) 
		DECLARE @nrLicencia       varchar(3)
		DECLARE @nrCUIT			  CHAR(13)
		declare	@nombre_completo  VARCHAR(40) 

		DECLARE cur_01 CURSOR FOR SELECT nrTalonario ,  nrComprobante , tpComprobante , tpLetra  	 
		FROM tmp_comprobantes_sin_cuit where nrLicencia = '000'

		
		OPEN cur_01
	
		FETCH NEXT FROM cur_01 INTO  @nrTalonario, @nrComprobante,  @tpComprobante, @tpLetra	     
	
		WHILE @@fetch_status = 0
		BEGIN
		
			select  @nrLicencia = null , @nrCUIT = null , @nombre_completo  = null
			select @nrLicencia =  min(nrLicencia)  from  tmp_licenciaratios_CuitOK 
							where nrLicencia not in ( select nrLicencia from tmp_comprobantes_sin_cuit)

			if @nrLicencia is null  
			begin 
				break
			end

			select  @nrCUIT = nrCUIT , @nombre_completo  = nombre_completo from  tmp_licenciaratios_CuitOK 
							where nrLicencia = @nrLicencia


			update  tmp_comprobantes_sin_cuit set	nrLicencia = @nrLicencia, 
					nrCUIT  = @nrCUIT ,   nombre_completo =  @nombre_completo
				where nrTalonario =  @nrTalonario and nrComprobante =  @nrComprobante
			 and   @tpComprobante = tpComprobante and tpLetra =  @tpLetra	      

			FETCH NEXT FROM cur_01 INTO  @nrTalonario, @nrComprobante,  @tpComprobante, @tpLetra	         
		
		END

		CLOSE cur_01;
		DEALLOCATE cur_01;


		select * from tmp_comprobantes_sin_cuit