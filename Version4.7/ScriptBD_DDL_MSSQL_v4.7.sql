-- Cambios de DDL version 4.7
use dbSG2000
go

    
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_automatico_nd_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_automatico_nd_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_auto_empresa_nd_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_auto_empresa_nd_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_auto_ctacte_nd_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_auto_ctacte_nd_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_nd_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_manual_nd_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_empresa_nd_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_manual_empresa_nd_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_ctacte_nd_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_manual_ctacte_nd_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_auto_empresa_nc_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_automatico_nc_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_auto_ctacte_nc_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_auto_empresa_nc_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_nc_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_auto_ctacte_nc_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_empresa_nc_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_manual_nc_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_ctacte_nc_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_manual_empresa_nc_ult	int	null
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='nrComprobante_manual_ctacte_nc_ult')	ALTER	TABLE	dbo.TB_Puestos	ADD	nrComprobante_manual_ctacte_nc_ult	int	null


go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtener_puntosdeventa_facturacion_v2_0' )
	drop procedure  dbo.spu_obtener_puntosdeventa_facturacion_v2_0


go



--sp_help 'TB_Puestos'
--  exec  dbo.spu_obtener_puntosdeventa_facturacion_v1_0 @nrPuesto_param=9,@tipo_iva='RI',@auto_impresor='S'
--  exec  dbo.spu_obtener_puntosdeventa_facturacion_v1_0 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='S'
--- exec  dbo.spu_obtener_puntosdeventa_facturacion_v1_0 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='N'
--  select distinct  tpIVA  from tb_clientes

/*
	Exec dbo.spu_obtener_puntosdeventa_facturacion_v1_0 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v1_0 @nrPuesto_param=9,@tipo_iva='RI',@auto_impresor='S'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v1_0 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='S'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v1_0 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='N'
	Exec dbo.spu_obtener_puntosdeventa_facturacion_v1_0 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S


	Exec dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S, @tpComprobante	= 'FA'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9,@tipo_iva='RI',@auto_impresor='S', @tpComprobante	= 'FA'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='S', @tpComprobante	= 'FA'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='N', @tpComprobante	= 'FA'
	Exec dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S, @tpComprobante	= 'FA'

	Exec dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S, @tpComprobante	= 'ND'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9,@tipo_iva='RI',@auto_impresor='S', @tpComprobante	= 'ND'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='S', @tpComprobante	= 'ND'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='N', @tpComprobante	= 'ND'
	Exec dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S, @tpComprobante	= 'ND'

	Exec dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S, @tpComprobante	= 'NC'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9,@tipo_iva='RI',@auto_impresor='S', @tpComprobante	= 'NC'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='S', @tpComprobante	= 'NC'
	exec  dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='N', @tpComprobante	= 'NC'
	Exec dbo.spu_obtener_puntosdeventa_facturacion_v2_0 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S, @tpComprobante	= 'NC'

*/



create procedure dbo.spu_obtener_puntosdeventa_facturacion_v2_0
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
			if @tpFormadePago='Cuenta Corriente' 
			begin
				select  @nrTalonario_auto_ctacte    as nrTalonario,
					@nrComprobante_auto_ctacte_nd_ult  as nrComprobante,
					@tpLetraRecibo				    as tpLetra,
					null	as nrCAI,
					null    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
					return;	
			end
		
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
			if @tpFormadePago='Cuenta Corriente' 
			begin
				select  @nrTalonario_auto_ctacte    as nrTalonario,
					@nrComprobante_auto_ctacte_nc_ult  as nrComprobante,
					@tpLetraRecibo				    as tpLetra,
					null	as nrCAI,
					null    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
					return;	
			end
		
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
		
		select  @nrTalonario_auto_ctacte       as nrTalonario,
				@nrComprobante_auto_ctacte_ult as nrComprobante,
				@tpLetraRecibo				    as tpLetra,
				null	as nrCAI,
				null    as dtCai,
				@flFacturaCtacte	as flFacturaCtacte
		return;

	end
	--- FIN IF -> if @auto_impresor ='S' 


	--- SI NO ES AUTOIMPRESOR
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
	
end;


go

if exists ( SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='sco_Puestos_v4_2' )
	drop procedure  dbo.sco_Puestos_v4_2

go


create procedure dbo.sco_Puestos_v4_2
@nrPuesto_param int=null,
@dsPuesto_param varchar(50)=null
as
begin


	select
		nrPuesto, 
		dsPuesto, 
	    dsIP, 
		dtActualizado, 
		nrTalonario_manual, 
		nrTalonario_automatico, 
		nrComprobante_manual_ult, 
		nrComprobante_automatico_ult, 
		flRespeta_secuencia_carga_manual, 
		tpletra, 
		dtActualizacion, 
		flEliminar, 
		nrTalonario_manual_empresa, 
		nrTalonario_manual_ctacte, 
		nrComprobante_manual_empresa_ult, 
		nrComprobante_manual_ctacte_ult, 
		tpLetraEmpresa, 
		tpLetraRecibo, 
		nrTalonario_auto_empresa, 
		nrTalonario_auto_ctacte, 
		nrComprobante_auto_ctacte_ult, 
		nrComprobante_auto_empresa_ult, 
		tpletra_manual, 
		tpLetraEmpresa_manual, 
		tpLetraRecibo_manual,
		/* campos incluidos en la version 1.8 */
		nrCAI_Talonario_auto,
		dtCAI_Talonario_auto,
		nrCAI_Talonario_auto_empresa,
		dtCAI_Talonario_auto_empresa,
		flFacturaCtacte,
		nrComprobante_automatico_nd_ult	,
		nrComprobante_auto_empresa_nd_ult	,
		nrComprobante_auto_ctacte_nd_ult	,
		nrComprobante_manual_nd_ult	,
		nrComprobante_manual_empresa_nd_ult	,
		nrComprobante_manual_ctacte_nd_ult	,
		nrComprobante_automatico_nc_ult	,
		nrComprobante_auto_empresa_nc_ult	,
		nrComprobante_auto_ctacte_nc_ult	,
		nrComprobante_manual_nc_ult	,
		nrComprobante_manual_empresa_nc_ult	,
		nrComprobante_manual_ctacte_nc_ult	
	from TB_Puestos
	where  (nrPuesto = @nrPuesto_param OR  @nrPuesto_param is null) 
		and  (dsPuesto =@dsPuesto_param OR @dsPuesto_param is null)
	and flEliminar=0


end;

go

if exists ( SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='sup_Puestos_v4_2' )
	drop procedure  dbo.sup_Puestos_v4_2

go

create procedure [dbo].[sup_Puestos_v4_2]
@nrPuesto_param 	                int,
@dsPuesto_param 	                varchar(50),
@dsIP_param     	                varchar(50)=null,
@dtActualizado_param                    datetime,
@nrTalonario_manual_param               int,
@nrTalonario_automatico_param           int,
@nrComprobante_manual_ult_param         int,
@nrComprobante_automatico_ult_param     int,
@flRespeta_secuencia_carga_manual_param int,
@tpLetra_param							char(1),
-- nuevos parametros
@nrTalonario_manual_empresa_param	int,
@nrTalonario_manual_ctacte_param	int,
@nrComprobante_manual_empresa_ult_param int,
@nrComprobante_manual_ctacte_ult_param	int,
@tpLetraEmpresa_param				char(10),
@tpLetraRecibo_param				char(10),
@nrTalonario_auto_empresa_param		int,
@nrTalonario_auto_ctacte_param	        int,
@nrComprobante_auto_ctacte_ult_param	int,
@nrComprobante_auto_empresa_ult_param	int,
@tpletra_manual_param	                char(10),
@tpLetraEmpresa_manual_param	        char(10),
@tpLetraRecibo_manual_param       	char(10),
@nrCAI_Talonario_auto_param		decimal(18,0),
@dtCAI_Talonario_auto_param 		datetime,
@nrCAI_Talonario_auto_empresa_param 	decimal(18,0),
@dtCAI_Talonario_auto_empresa_param     datetime,
@flFacturaCtacte					     bit,
@nrComprobante_automatico_nd_ult	as int,
@nrComprobante_auto_empresa_nd_ult	as int,
@nrComprobante_auto_ctacte_nd_ult	as int,
@nrComprobante_manual_nd_ult		as int,
@nrComprobante_manual_empresa_nd_ult	as int,
@nrComprobante_manual_ctacte_nd_ult	as int,
@nrComprobante_automatico_nc_ult	as int,
@nrComprobante_auto_empresa_nc_ult	as int,
@nrComprobante_auto_ctacte_nc_ult	as int,
@nrComprobante_manual_nc_ult		as int,
@nrComprobante_manual_empresa_nc_ult	as int,
@nrComprobante_manual_ctacte_nc_ult	as int
as
begin

declare @error_msg varchar(200)

	--------------------------------------------------------------
	--- Validaciones para los comprobantes automáticos
	--- AUTOMATICO: Para Consumidores Finales
	if @nrTalonario_automatico_param<>0 and exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_automatico=@nrTalonario_automatico_param and
			  tpLetra=@tpLetra_param)
	begin 
		raiserror ('El número de talonario automático ingresado, para Consumidor Final,  se encuentra asignado a otro puesto.',16,1)
		return -1
	end 

	--- AUTOMATICO: Para Empresas
	if @nrTalonario_manual_empresa_param<>0 and exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_auto_empresa=@nrTalonario_manual_empresa_param and
			  tpLetraEmpresa=@tpLetraEmpresa_param)
	begin 
		raiserror ('El número de talonario automático ingresado, para Empresas,  se encuentra asignado a otro puesto.',16,1)
		return -1
	end 

	
	--- AUTOMATICO: Para Recibos
	if @nrTalonario_auto_ctacte_param<>0 and exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_auto_ctacte=@nrTalonario_auto_ctacte_param and
			  tpLetraRecibo=@tpLetraRecibo_param)
	begin 
		raiserror ('El número de talonario automático ingresado, para Recibos,  se encuentra asignado a otro puesto.',16,1)
		return -1
	end 

	--- MANUAL: Para Consumidores Finales
	if @nrTalonario_manual_param<>0 and exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_manual=@nrTalonario_manual_param and
			  tpLetra_manual=@tpLetra_param) 
	begin 
		raiserror ('El número de talonario manual ingresado, para Consumidores Finales, se encuentra asignado a otro puesto.',16,1)
		return -1
	end 

	--- MANUAL: Para Empresas
	if @nrTalonario_manual_empresa_param<>0 and exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_manual_empresa=@nrTalonario_manual_empresa_param and
			  tpLetraEmpresa_manual=@tpLetraEmpresa_manual_param) 
	begin 
		raiserror ('El número de talonario manual ingresado, para Empresas, se encuentra asignado a otro puesto.',16,1)
		return -1
	end 


	--- MANUAL: Para Recibos
	if @nrTalonario_manual_ctacte_param<>0 and exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_manual_ctacte=@nrTalonario_manual_ctacte_param and
			  tpLetraRecibo_manual=@tpLetraRecibo_manual_param) 
	begin 
		raiserror ('El número de talonario manual ingresado, para Recibos, se encuentra asignado a otro puesto.',16,1)
		return -1
	end 
	--------------------------------------------------------------


	--------------------------------------------------------------
	--- Validacion de Fin de talonario
	if @nrComprobante_manual_ult_param is not null  and @nrComprobante_manual_ult_param>99999999 
	begin
		raiserror (' El talonario ha llegado a su fin, por favor de aviso a la administración.',16,1) 
		return -1 
	end
	if @nrComprobante_automatico_ult_param is not null and  @nrComprobante_automatico_ult_param>99999999 
	begin
		raiserror (' El talonario ha llegado a su fin, por favor de aviso a la administración.',16,1) 
		return -1 
	end
	if @nrComprobante_manual_empresa_ult_param is not null  and @nrComprobante_manual_empresa_ult_param>99999999 
	begin
		raiserror (' El talonario ha llegado a su fin, por favor de aviso a la administración.',16,1) 
		return -1 
	end
	if @nrComprobante_auto_ctacte_ult_param is not null  and @nrComprobante_auto_ctacte_ult_param>99999999 
	begin
		raiserror (' El talonario ha llegado a su fin, por favor de aviso a la administración.',16,1) 
		return -1 
	end
	if @nrComprobante_auto_empresa_ult_param is not null  and @nrComprobante_auto_empresa_ult_param>99999999 
	begin
		raiserror (' El talonario ha llegado a su fin, por favor de aviso a la administración.',16,1) 
		return -1 
	end

	--------------------------------------------------------------
	/*******************************************************/	
	/* validacion surgida de la version 1.8 */
	if @nrCAI_Talonario_auto_param is not null and @dtCAI_Talonario_auto_param is null
	begin
		set @error_msg = ' Falta la fecha de vencimiento del nro de CAI '+ convert(varchar,isnull(@nrCAI_Talonario_auto_param,''))+'.'
		raiserror (@error_msg,16,1) 
		return -1 
	end 


	/* validacion surgida de la version 1.8 */
	if @nrCAI_Talonario_auto_empresa_param is not null and @dtCAI_Talonario_auto_empresa_param is null
	begin
		set @error_msg = ' Falta la fecha de vencimiento del nro de CAI '+ convert(varchar,isnull(@nrCAI_Talonario_auto_empresa_param,''))
		raiserror (@error_msg,16,1) 
		return -1 
	end 

	/*******************************************************/	
	/* validacion surgida de la version 1.8 */
	if @nrCAI_Talonario_auto_param is null 
	begin
		set @dtCAI_Talonario_auto_param=null
	end 


	/* validacion surgida de la version 1.8 */
	if @nrCAI_Talonario_auto_empresa_param is null 
	begin
		set @dtCAI_Talonario_auto_empresa_param=null
	end 


	if @dtCAI_Talonario_auto_param<getdate()
	begin
		set @error_msg = ' La fecha de vencimiento del CAI '+  convert(varchar, isnull(@nrCAI_Talonario_auto_param,'')) +' no puede ser menor a la fecha actual, Fecha asignada '+ convert(varchar(10), @dtCAI_Talonario_auto_param,105)+'.'
		raiserror (@error_msg,16,1) 
		return -1 

	end

	if @dtCAI_Talonario_auto_empresa_param<getdate()
	begin
		set @error_msg = ' La fecha de vencimiento del CAI '+  convert(varchar,@nrCAI_Talonario_auto_empresa_param) +' no puede ser menor a la fecha actual. Fecha asignada '+ convert(varchar(10),@dtCAI_Talonario_auto_param,105)+'.'
		raiserror (@error_msg,16,1) 
		return -1 
	end


	/*******************************************************/


	update TB_Puestos
	set 	dsPuesto=isnull(@dsPuesto_param,dsPuesto),
		dsIP=isnull(@dsIP_param,dsIP),
		dtActualizado=isnull(@dtActualizado_param,dtActualizado),
		nrTalonario_manual=isnull(@nrTalonario_manual_param,nrTalonario_manual),
		nrTalonario_automatico=isnull(@nrTalonario_automatico_param,nrTalonario_automatico),
		nrComprobante_manual_ult=isnull(@nrComprobante_manual_ult_param,nrComprobante_manual_ult),
		nrComprobante_automatico_ult=isnull(@nrComprobante_automatico_ult_param,nrComprobante_automatico_ult),
		flRespeta_secuencia_carga_manual=isnull(@flRespeta_secuencia_carga_manual_param,flRespeta_secuencia_carga_manual),
		tpLetra=isnull(@tpLetra_param,tpLetra),
		dtActualizacion=getdate(),
		nrTalonario_manual_empresa=isnull(@nrTalonario_manual_empresa_param,nrTalonario_manual_empresa),
		nrTalonario_manual_ctacte=isnull(@nrTalonario_manual_ctacte_param,nrTalonario_manual_ctacte),
		nrComprobante_manual_empresa_ult=isnull(@nrComprobante_manual_empresa_ult_param,nrComprobante_manual_empresa_ult),
		nrComprobante_manual_ctacte_ult=isnull(@nrComprobante_manual_ctacte_ult_param,nrComprobante_manual_ctacte_ult),
		tpLetraEmpresa=isnull(@tpLetraEmpresa_param,tpLetraEmpresa),
		tpLetraRecibo=isnull(@tpLetraRecibo_param,tpLetraRecibo),
		nrTalonario_auto_empresa=isnull(@nrTalonario_auto_empresa_param,nrTalonario_auto_empresa),
		nrTalonario_auto_ctacte=isnull(@nrTalonario_auto_ctacte_param,nrTalonario_auto_ctacte),
		nrComprobante_auto_ctacte_ult=isnull(@nrComprobante_auto_ctacte_ult_param,nrComprobante_auto_ctacte_ult),
		nrComprobante_auto_empresa_ult=isnull(@nrComprobante_auto_empresa_ult_param,nrComprobante_auto_empresa_ult),
		tpletra_manual=isnull(@tpletra_manual_param,tpletra_manual),
		tpLetraEmpresa_manual=isnull(@tpLetraEmpresa_manual_param,tpLetraEmpresa_manual),
		tpLetraRecibo_manual=isnull(@tpLetraRecibo_manual_param,tpLetraRecibo_manual),
		/* campos incluidos en la version 1.8 */
		nrCAI_Talonario_auto=@nrCAI_Talonario_auto_param,
		dtCAI_Talonario_auto=@dtCAI_Talonario_auto_param,
		nrCAI_Talonario_auto_empresa=@nrCAI_Talonario_auto_empresa_param,
		dtCAI_Talonario_auto_empresa=@dtCAI_Talonario_auto_empresa_param,
		flFacturaCtacte = @flFacturaCtacte,
		nrComprobante_automatico_nd_ult =isnull(@nrComprobante_automatico_nd_ult , nrComprobante_automatico_nd_ult ) ,
		nrComprobante_auto_empresa_nd_ult =isnull(@nrComprobante_auto_empresa_nd_ult , nrComprobante_auto_empresa_nd_ult ) ,
		nrComprobante_auto_ctacte_nd_ult =isnull(@nrComprobante_auto_ctacte_nd_ult , nrComprobante_auto_ctacte_nd_ult ) ,
		nrComprobante_manual_nd_ult =isnull(@nrComprobante_manual_nd_ult , nrComprobante_manual_nd_ult ) ,
		nrComprobante_manual_empresa_nd_ult =isnull(@nrComprobante_manual_empresa_nd_ult , nrComprobante_manual_empresa_nd_ult ) ,
		nrComprobante_manual_ctacte_nd_ult =isnull(@nrComprobante_manual_ctacte_nd_ult , nrComprobante_manual_ctacte_nd_ult ) ,
		nrComprobante_automatico_nc_ult =isnull(@nrComprobante_automatico_nc_ult , nrComprobante_automatico_nc_ult ) ,
		nrComprobante_auto_empresa_nc_ult =isnull(@nrComprobante_auto_empresa_nc_ult , nrComprobante_auto_empresa_nc_ult ) ,
		nrComprobante_auto_ctacte_nc_ult =isnull(@nrComprobante_auto_ctacte_nc_ult , nrComprobante_auto_ctacte_nc_ult ) ,
		nrComprobante_manual_nc_ult =isnull(@nrComprobante_manual_nc_ult , nrComprobante_manual_nc_ult ) ,
		nrComprobante_manual_empresa_nc_ult =isnull(@nrComprobante_manual_empresa_nc_ult , nrComprobante_manual_empresa_nc_ult ) ,
		nrComprobante_manual_ctacte_nc_ult =isnull(@nrComprobante_manual_ctacte_nc_ult , nrComprobante_manual_ctacte_nc_ult)
	where  nrPuesto = @nrPuesto_param

	if @@rowcount=0 
	begin
		raiserror ('No se ha localizado el puesto ingresado',16,1)
		return -1 
	end 



end;






