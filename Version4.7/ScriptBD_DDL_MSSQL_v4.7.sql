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

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtener_puntosdeventa_facturacion_v4_7' )
	drop procedure  dbo.spu_obtener_puntosdeventa_facturacion_v4_7

go

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

*/



create procedure dbo.spu_obtener_puntosdeventa_facturacion_v4_7
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


--- agregar try catch para evitar errores por numeros configurados en null	
end;


go

if exists ( SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='sco_Puestos_v4_7' )
	drop procedure  dbo.sco_Puestos_v4_7

go

/*

exec sco_Puestos_v4_7 @nrPuesto_param = 4

*/

create procedure dbo.sco_Puestos_v4_7
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

if exists ( SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='sup_Puestos_v4_7' )
	drop procedure  dbo.sup_Puestos_v4_7

go

create procedure [dbo].[sup_Puestos_v4_7]
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

go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_actualizar_puntosdeventa_facturacion_v4_7' )
	drop procedure  dbo.spu_actualizar_puntosdeventa_facturacion_v4_7


go

---  Exec spu_actualizar_puntosdeventa_facturacion_v4_7 @nrPuesto_param = 4 ,@tipo_iva = 'EX' ,@auto_impresor = 'S' ,@tpComprobante = 'FA' ,@nrComprobante = 134139 
create procedure dbo.spu_actualizar_puntosdeventa_facturacion_v4_7
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
	if @tpFormadePago='Cuenta Corriente' 
	begin
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


go




if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Comprobantes_Imprime' 
			and COLUMN_NAME='dsCodDocAfip')	
			ALTER	TABLE	dbo.TB_Comprobantes_Imprime	ADD	dsCodDocAfip	varchar(10); 

---


go


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='sp_obtenerComision_v4_7' )
	drop procedure  dbo.sp_obtenerComision_v4_7



go


create procedure sp_obtenerComision_v4_7
(@tpComprobante_param     char(2),
 @vlTotalGeneral_param    float,  
 @tpComision_param        varchar(50),  
 @tpCliente_param         varchar(20),  
 @dsCodigoDestinos_param  varchar(1000)=null)  
as
begin
declare @vlComision               as float
declare @total_sin_recargos       as float
declare @vlComision_sin_recargos  as float
declare @vlComision_recargos      as float
declare @factura_comi             as float 



	if @tpComprobante_param ='ND' or @tpComprobante_param ='NC' 
	begin
		select 0 as vlComision
		return; 
	end


	if isnull(@dsCodigoDestinos_param,'')='' 
	begin
		select 0 as vlComision
		return;  
	end
	
	set @dsCodigoDestinos_param = REPLACE (@dsCodigoDestinos_param,'|','),(')	
	create table #tmp_datos_destinos ( tpOperacion varchar(20),  cdComision int, vlPrecioViaje float)
	set @dsCodigoDestinos_param = ' insert  #tmp_datos_destinos(tpOperacion, cdComision, vlPrecioViaje) 
											values (' + @dsCodigoDestinos_param +');'
		
	insert into #tmp_datos_destinos execute(@dsCodigoDestinos_param)
			
	create table #tmp_comision (vlComision float);

	if @tpComision_param = 'RETORNO' 
	begin
		-- print 'Obtenemos la comisión para retorno'
		insert into #tmp_comision exec SP_obtenerComisionRetorno_v3_4 
			 @vlTotalGeneral_param,  
			 @tpComision_param,  
			 @tpCliente_param,  
			 @dsCodigoDestinos_param
		-- informamos la comision de retorno	 
		select 	vlComision from #tmp_comision	
		return;
	end

    print 'Calculamos la comisión para viajes'
    
    select @total_sin_recargos = sum(vlPrecioViaje) from 
						#tmp_datos_destinos where tpOperacion<>'Recargo+Comi' or tpOperacion is null
    
   select @total_sin_recargos = isnull(@total_sin_recargos,0) 
   
   select @vlComision_sin_recargos =  case @tpComision_param
										when  'A Empleados' then isnull(vlComisionEmpleados,0)
										when  'A Clientes'  then isnull(vlComision,0)
									   end 
							from tb_Comisiones
							where  flEliminar = 0  AND  
								   vlMontoMinimo <= @total_sin_recargos AND
								   vlMontoMaximo >= @total_sin_recargos AND 
								   tpComision = 'Viaje'
    
   select @vlComision_sin_recargos = isnull(@vlComision_sin_recargos,0) 
    
   select @vlComision_recargos = case @tpComision_param
										when  'A Empleados' then sum(isnull(vlComisionEmpleados,0))
										when  'A Clientes'  then sum(isnull(vlComision,0))
									   end  from 
								#tmp_datos_destinos desti inner join  TB_Comisiones comi 
								on  desti.cdComision = comi.cdComision
								where tpOperacion='Recargo+Comi'
										and    comi.vlMontoMinimo <= desti.vlPrecioViaje AND
											   comi.vlMontoMaximo >= desti.vlPrecioViaje   
   
   
   select @vlComision_recargos = isnull(@vlComision_recargos,0) 
   
   
   if exists (select * from #tmp_datos_destinos
							where  tpOperacion = 'Factura-Comi')
   begin
	select 0 vlComision
	return;
   end
   
							
   -- comision viajes + recargos
   select (@vlComision_sin_recargos + @vlComision_recargos) vlComision
						  

end

go


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='ufn_obtnerCodComprobanteAFIP_v4_7' )
	drop function  dbo.ufn_obtnerCodComprobanteAFIP_v4_7

go

/*  
	select  dbo.ufn_obtnerCodComprobanteAFIP ('FA','B')
	select  dbo.ufn_obtnerCodComprobanteAFIP ('ND','B')
	select  dbo.ufn_obtnerCodComprobanteAFIP ('NC','B')
	select  dbo.ufn_obtnerCodComprobanteAFIP ('FA','A')
	select  dbo.ufn_obtnerCodComprobanteAFIP ('ND','A')
	select  dbo.ufn_obtnerCodComprobanteAFIP ('NC','A')
	select  dbo.ufn_obtnerCodComprobanteAFIP ('FA','C')
	select  dbo.ufn_obtnerCodComprobanteAFIP ('ND','C')
	select  dbo.ufn_obtnerCodComprobanteAFIP ('NC','C')
*/

create function  dbo.ufn_obtnerCodComprobanteAFIP_v4_7 ( @tpcompprobante char(2), @tpLetra char(1))
RETURNS char(2)
AS
BEGIN
declare  @cod_tipo_comprobante int 

	select  @cod_tipo_comprobante = cod_tipo_comprobante  from tipo_comprobanteAFIP  where  tpComprobante = @tpcompprobante
																		and  tpLetra = @tpLetra
	return RIGHT('0' + convert(varchar,@cod_tipo_comprobante),2)

END

go


-- select * from tipo_comprobanteAFIP

go



if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='UDF_MontoEscrito_v4_7' )
	drop function  dbo.[UDF_MontoEscrito_v4_7]

go


CREATE FUNCTION [dbo].[UDF_MontoEscrito_v4_7]
(
       @Numero decimal(18,2)
)
RETURNS nvarchar(512)
AS
BEGIN
      DECLARE @lnEntero INT,
  @lcRetorno VARCHAR(512),
  @lnTerna INT,
  @lcMiles VARCHAR(512),
  @lcCadena VARCHAR(512),
  @lnUnidades INT,
  @lnDecenas INT,
  @lnCentenas INT,
  @lnFraccion INT
 
  SELECT @lnEntero = CAST(@Numero AS INT),
    @lnFraccion = (@Numero - @lnEntero) * 100,
    @lcRetorno = '',
    @lnTerna = 1
 
  WHILE @lnEntero > 0
  BEGIN
 
    SELECT @lcCadena = ''
    SELECT @lnUnidades = @lnEntero % 10
    SELECT @lnEntero = CAST(@lnEntero/10 AS INT)
    SELECT @lnDecenas = @lnEntero % 10
    SELECT @lnEntero = CAST(@lnEntero/10 AS INT)
    SELECT @lnCentenas = @lnEntero % 10
    SELECT @lnEntero = CAST(@lnEntero/10 AS INT)
 
 
    SELECT @lcCadena =
    CASE
      WHEN @lnUnidades = 1 AND @lnTerna = 1 THEN 'UNO ' + @lcCadena
      WHEN @lnUnidades = 1 AND @lnTerna <> 1 THEN 'UN ' + @lcCadena
      WHEN @lnUnidades = 2 THEN 'DOS ' + @lcCadena
      WHEN @lnUnidades = 3 THEN 'TRES ' + @lcCadena
      WHEN @lnUnidades = 4 THEN 'CUATRO ' + @lcCadena
      WHEN @lnUnidades = 5 THEN 'CINCO ' + @lcCadena
      WHEN @lnUnidades = 6 THEN 'SEIS ' + @lcCadena
      WHEN @lnUnidades = 7 THEN 'SIETE ' + @lcCadena
      WHEN @lnUnidades = 8 THEN 'OCHO ' + @lcCadena
      WHEN @lnUnidades = 9 THEN 'NUEVE ' + @lcCadena
      ELSE @lcCadena
    END  
 
    SELECT @lcCadena =
    CASE
      WHEN @lnDecenas = 1 THEN
        CASE @lnUnidades
          WHEN 0 THEN 'DIEZ '
          WHEN 1 THEN 'ONCE '
          WHEN 2 THEN 'DOCE '
          WHEN 3 THEN 'TRECE '
          WHEN 4 THEN 'CATORCE '
          WHEN 5 THEN 'QUINCE '
          ELSE 'DIECI' + @lcCadena
        END
      WHEN @lnDecenas = 2 AND @lnUnidades = 0 THEN 'VEINTE ' + @lcCadena
      WHEN @lnDecenas = 2 AND @lnUnidades <> 0 THEN 'VEINTI' + @lcCadena
      WHEN @lnDecenas = 3 AND @lnUnidades = 0 THEN 'TREINTA ' + @lcCadena
      WHEN @lnDecenas = 3 AND @lnUnidades <> 0 THEN 'TREINTA Y ' + @lcCadena
      WHEN @lnDecenas = 4 AND @lnUnidades = 0 THEN 'CUARENTA ' + @lcCadena
      WHEN @lnDecenas = 4 AND @lnUnidades <> 0 THEN 'CUARENTA Y ' + @lcCadena
      WHEN @lnDecenas = 5 AND @lnUnidades = 0 THEN 'CINCUENTA ' + @lcCadena
      WHEN @lnDecenas = 5 AND @lnUnidades <> 0 THEN 'CINCUENTA Y ' + @lcCadena
      WHEN @lnDecenas = 6 AND @lnUnidades = 0 THEN 'SESENTA ' + @lcCadena
      WHEN @lnDecenas = 6 AND @lnUnidades <> 0 THEN 'SESENTA Y ' + @lcCadena
      WHEN @lnDecenas = 7 AND @lnUnidades = 0 THEN 'SETENTA ' + @lcCadena
      WHEN @lnDecenas = 7 AND @lnUnidades <> 0 THEN 'SETENTA Y ' + @lcCadena
      WHEN @lnDecenas = 8 AND @lnUnidades = 0 THEN 'OCHENTA ' + @lcCadena
      WHEN @lnDecenas = 8 AND @lnUnidades <> 0 THEN 'OCHENTA Y ' + @lcCadena
      WHEN @lnDecenas = 9 AND @lnUnidades = 0 THEN 'NOVENTA ' + @lcCadena
      WHEN @lnDecenas = 9 AND @lnUnidades <> 0 THEN 'NOVENTA Y ' + @lcCadena
      ELSE @lcCadena
    END
 
 
 
    SELECT @lcCadena =
    CASE
      WHEN @lnCentenas = 1 AND @lnUnidades = 0 AND @lnDecenas = 0 THEN 'CIEN ' + @lcCadena
      WHEN @lnCentenas = 1 AND NOT(@lnUnidades = 0 AND @lnDecenas = 0) THEN 'CIENTO ' + @lcCadena
      WHEN @lnCentenas = 2 THEN 'DOSCIENTOS ' + @lcCadena
      WHEN @lnCentenas = 3 THEN 'TRESCIENTOS ' + @lcCadena
      WHEN @lnCentenas = 4 THEN 'CUATROCIENTOS ' + @lcCadena
      WHEN @lnCentenas = 5 THEN 'QUINIENTOS ' + @lcCadena
      WHEN @lnCentenas = 6 THEN 'SEISCIENTOS ' + @lcCadena
      WHEN @lnCentenas = 7 THEN 'SETECIENTOS ' + @lcCadena
      WHEN @lnCentenas = 8 THEN 'OCHOCIENTOS ' + @lcCadena
      WHEN @lnCentenas = 9 THEN 'NOVECIENTOS ' + @lcCadena
      ELSE @lcCadena
    END
 
 
    SELECT @lcCadena =
    CASE
      WHEN @lnTerna = 1 THEN @lcCadena
      WHEN @lnTerna = 2 AND (@lnUnidades + @lnDecenas + @lnCentenas <> 0) THEN @lcCadena + ' MIL '
      WHEN @lnTerna = 3 AND (@lnUnidades + @lnDecenas + @lnCentenas <> 0) AND
        @lnUnidades = 1 AND @lnDecenas = 0 AND @lnCentenas = 0 THEN @lcCadena + ' MILLON '
      WHEN @lnTerna = 3 AND (@lnUnidades + @lnDecenas + @lnCentenas <> 0) AND
        NOT (@lnUnidades = 1 AND @lnDecenas = 0 AND @lnCentenas = 0) THEN @lcCadena + ' MILLONES '
      WHEN @lnTerna = 4 AND (@lnUnidades + @lnDecenas + @lnCentenas <> 0) THEN @lcCadena + ' MIL MILLONES '
      ELSE ''
    END
 
 
    SELECT @lcRetorno = @lcCadena  + @lcRetorno
    SELECT @lnTerna = @lnTerna + 1
 
  END
 
  IF @lnTerna = 1 
    SELECT @lcRetorno = 'CERO'
 
  set @lcRetorno = RTRIM(@lcRetorno) + ' CON ' + LTRIM(STR(@lnFraccion,2)) + '/100'
     
      RETURN @lcRetorno
END
 

go


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_rpt_DetalleFacturaCtaCte_v4_7' )
	drop procedure  dbo.SP_rpt_DetalleFacturaCtaCte_v4_7

go

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- exec [SP_rpt_DetalleFacturaCtaCte_v4_7] 1000275545 ,0
-- exec [SP_rpt_DetalleFacturaCtaCte_v4_7] 1000275544 ,0
-- exec [SP_rpt_DetalleFacturaCtaCte_v4_7] 1000275549 ,1

--select * from tb_recibos where  IdRecibo =  1000275547


CREATE PROCEDURE [SP_rpt_DetalleFacturaCtaCte_v4_7]
@IdRecibo_param numeric,
@esIdRecibo_param numeric=null
AS

set dateformat dmy

	select @esIdRecibo_param=isnull(@esIdRecibo_param,0)
	

	SELECT TB_Comprobantes.dtComprobante,
			 TB_Comprobantes.dsOpcional1,
			 TB_Comprobantes.dsOpcional2,
		     case TB_Comprobantes.tpComprobante  when 'NC' then -1 * TB_Cupones.vlMontoCupon else TB_Cupones.vlMontoCupon End as vlMontoCupon, 
			 TB_Cupones.nrTalonarioCliente,
			 TB_Cupones.nrComprabanteCliente,
			 TB_Recibos.IdRecibo,
			 TB_Recibos.dtRecibo,
			 TB_Recibos.cdCliente,
			 TB_Comprobantes.dsRazonSocial,
			 TB_Comprobantes.tpComprobante,
			 TB_Comprobantes.tpLetra
			 INTo #tmp_resultados
		FROM
			 TB_Comprobantes TB_Comprobantes,
			 TB_Cupones TB_Cupones,
			 TB_Recibos TB_Recibos
		WHERE
		    TB_Comprobantes.nrTalonario = TB_Cupones.nrTalonarioCliente AND
		    TB_Comprobantes.nrComprobante = TB_Cupones.nrComprabanteCliente AND
		    TB_Comprobantes.tpLetra = TB_Cupones.tpLetraCliente AND
		    TB_Comprobantes.tpComprobante = TB_Cupones.tpComprobanteCliente AND
		    TB_Cupones.IdReciboCtaCte = TB_Recibos.IdRecibo and
		    TB_Recibos.IdRecibo = @IdRecibo_param

	delete from #tmp_resultados

	if @esIdRecibo_param=0
		insert into #tmp_resultados
		SELECT TB_Comprobantes.dtComprobante,
			 TB_Comprobantes.dsOpcional1,
			 TB_Comprobantes.dsOpcional2,
		     case TB_Comprobantes.tpComprobante  when 'NC' then -1 * TB_Cupones.vlMontoCupon else TB_Cupones.vlMontoCupon End as vlMontoCupon, 
			 TB_Cupones.nrTalonarioCliente,
			 TB_Cupones.nrComprabanteCliente,
			 TB_Recibos.IdRecibo,
			 TB_Recibos.dtRecibo,
			 TB_Recibos.cdCliente,
			 TB_Comprobantes.dsRazonSocial,
			 TB_Comprobantes.tpComprobante,
			 TB_Comprobantes.tpLetra
		FROM
			 TB_Comprobantes TB_Comprobantes,
			 TB_Cupones TB_Cupones,
			 TB_Recibos TB_Recibos
		WHERE
		    TB_Comprobantes.nrTalonario = TB_Cupones.nrTalonarioCliente AND
		    TB_Comprobantes.nrComprobante = TB_Cupones.nrComprabanteCliente AND
		    TB_Comprobantes.tpLetra = TB_Cupones.tpLetraCliente AND
		    TB_Comprobantes.tpComprobante = TB_Cupones.tpComprobanteCliente AND
		    TB_Cupones.IdReciboCtaCte = TB_Recibos.IdRecibo and
		    TB_Recibos.IdRecibo = @IdRecibo_param
		ORDER BY
		    TB_Recibos.IdRecibo ASC
	else
		insert into #tmp_resultados
		SELECT TB_Comprobantes.dtComprobante,
			 TB_Comprobantes.dsOpcional1,
			 TB_Comprobantes.dsOpcional2,
			 case TB_Comprobantes.tpComprobante  when 'NC' then -1 * TB_Cupones.vlMontoCupon else TB_Cupones.vlMontoCupon End as vlMontoCupon, 
			 TB_Cupones.nrTalonarioCliente,
			 TB_Cupones.nrComprabanteCliente,
			 TB_Recibos.IdRecibo,
			 TB_Recibos.dtRecibo,
			 TB_Recibos.cdCliente,
			 TB_Comprobantes.dsRazonSocial,
			 TB_Comprobantes.tpComprobante,
			 TB_Comprobantes.tpLetra
		FROM
			TB_Comprobantes TB_Comprobantes,
			TB_Cupones TB_Cupones,
			TB_Recibos TB_Recibos
		WHERE
		    TB_Comprobantes.nrTalonario = TB_Cupones.nrTalonarioCliente AND
		    TB_Comprobantes.nrComprobante = TB_Cupones.nrComprabanteCliente AND
		    TB_Comprobantes.tpLetra = TB_Cupones.tpLetraCliente AND
		    TB_Comprobantes.tpComprobante = TB_Cupones.tpComprobanteCliente AND
		    TB_Cupones.IdRecibo = TB_Recibos.IdRecibo and
		    TB_Recibos.IdRecibo = @IdRecibo_param
		ORDER BY
		    TB_Recibos.IdRecibo ASC

	declare @vlTotal decimal(12,2)
	declare @descripcion_vlTotal varchar(60)

	select @vlTotal =  sum(vlMontoCupon), 
		   @descripcion_vlTotal ='PESOS '+ dbo.[UDF_MontoEscrito_v4_7] (sum(vlMontoCupon))
		from #tmp_resultados

	select *, @vlTotal as vlTotal, @descripcion_vlTotal as descripcion_vlTotal from  #tmp_resultados
	order by  tpLetra, nrTalonarioCliente , nrComprabanteCliente

GO



/****** Object:  Table [dbo].[tipo_comprobanteAFIP]    Script Date: 14/11/2015 17:30:26 ******/
if exists (select * from sys.tables  where name = 'tipo_comprobanteAFIP')
	DROP TABLE [dbo].[tipo_comprobanteAFIP]

GO

/****** Object:  Table [dbo].[tipo_comprobanteAFIP]    Script Date: 14/11/2015 17:30:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tipo_comprobanteAFIP](
	[cod_tipo_comprobante] [int] NOT NULL,
	[Descripción] [nvarchar](255) NULL,
	[tpComprobante] [nchar](2) NULL,
	[tpLetra] [nchar](10) NULL,
 CONSTRAINT [PK_tipo_comprobanteAFIP] PRIMARY KEY CLUSTERED 
(
	[cod_tipo_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO




-- NUEVO SP para generar el CITI ventas 

go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='UDF_obtenerCodDOC_CITIT_v4_7' )
	drop function  dbo.UDF_obtenerCodDOC_CITIT_v4_7

go


CREATE FUNCTION dbo.UDF_obtenerCodDOC_CITIT_v4_7 (@tpComprobante char(2), @tpLetra char(1))
RETURNS varchar(2)
AS
BEGIN
	declare @codigo_CITI varchar(2)
	set @codigo_CITI = 0
	select @codigo_CITI =  case 
				 WHEN @tpComprobante = 'FA' AND @tpLetra =  'A'  THEN  1
				 WHEN @tpComprobante = 'ND' AND @tpLetra =  'A'  THEN  2
				 WHEN @tpComprobante = 'NC' AND @tpLetra =  'A'  THEN  3
				 WHEN @tpComprobante = 'FA' AND @tpLetra =  'B'  THEN  6
				 WHEN @tpComprobante = 'ND' AND @tpLetra =  'B'  THEN  7		 
				 WHEN @tpComprobante = 'NC' AND @tpLetra =  'B'  THEN  8
				 WHEN @tpComprobante = 'A' AND @tpLetra =  'A'  THEN  1
				 WHEN @tpComprobante = 'A' AND @tpLetra =  'A'  THEN  1
				 WHEN @tpComprobante = 'A' AND @tpLetra =  'A'  THEN  1
				 WHEN @tpComprobante = 'B' AND @tpLetra =  'B'  THEN  6
				 WHEN @tpComprobante = 'B' AND @tpLetra =  'B'  THEN  6
				 WHEN @tpComprobante = 'B' AND @tpLetra =  'B'  THEN  6
				 
				END
	
	return @codigo_CITI
END

go

		

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='UDF_obtenerFormatoNumericoAFIP_v4_7' )
	drop function  dbo.UDF_obtenerFormatoNumericoAFIP_v4_7

go


-- select  dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (123.4534, 20, 2) 
-- select  dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (123.4, 20, 2) 
-- select  len(dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (123.4, 20, 2))
-- select  LEN(dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (123.4, 20, 2)) 



-- select  dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (123.4534, 20, 3) 
-- select  dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (123.4, 20, 3) 
-- select  len(dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (123.4, 20, 3))
-- select  LEN(dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (123.4, 20, 3)) 
-- SELECT  dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( 60, 15, 2)
-- SELECT  dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( 60, 15, 5)
-- SELECT  LEN(dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( 60, 15, 5))
-- SELECT  dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( 60.000, 20, 5)

-- SELECT CHARINDEX('.','60');


CREATE FUNCTION dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (@numero as varchar(100), @tamanio as integer, @decimales integer)
RETURNS varchar(50)
AS
BEGIN
	
	declare  @numero_formateado  varchar(50)
	declare  @posicion_decimal    int
	declare  @parte_entera        int
	declare  @parte_decimal       int
	
	set @posicion_decimal = CHARINDEX('.',@numero);
	IF @posicion_decimal = 0 
	begin
		SET  @numero_formateado = right( replicate ('0',@tamanio) + convert(varchar,@numero)  + replicate('0', @decimales) ,@tamanio) 
		return @numero_formateado
	end
	
	set  @parte_entera  = SUBSTRING(@numero,1,@posicion_decimal - 1)
	set  @parte_decimal = SUBSTRING(@numero,@posicion_decimal + 1 , len(@numero))
	
	set @numero_formateado = replicate ('0',@tamanio) + convert(varchar,@parte_entera) +   left(left(convert(varchar,@parte_decimal), @decimales)  + replicate('0', @decimales), @decimales)
	set @numero_formateado = right(@numero_formateado,@tamanio) 
	
	-- print @parte_entera
	-- print @parte_decimal
	return @numero_formateado

END

GO


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='UDF_obtenerFormatoCUITAFIP_v4_7' )
	drop function  dbo.UDF_obtenerFormatoCUITAFIP_v4_7

go

-- select  dbo.UDF_obtenerFormatoCUITAFIP (123.4534, 20) 


CREATE FUNCTION dbo.UDF_obtenerFormatoCUITAFIP_v4_7 (@numero as varchar(100), @tamanio as integer)
RETURNS varchar(50)
AS
BEGIN
	
	declare  @numero_formateado  varchar(50)
	declare  @posicion_decimal    int
	declare  @parte_entera        int
	declare  @parte_decimal       int
	
	if @numero is null  
	begin	
		set @numero_formateado  = replicate  ('0', @tamanio)
		return @numero_formateado
	end

	set @numero_formateado = replace (lTRIM(RTRIM(@numero)),'-','')
	set @numero_formateado = replace (@numero_formateado,'.','')

	if isnumeric(@numero_formateado)=1 
		set @numero_formateado =  right(replicate('0', @tamanio) +  @numero_formateado,@tamanio)
	else
		set @numero_formateado =  replicate('0', @tamanio)

	return @numero_formateado

END

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



if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtieneDatosCITIVentas_v4_7' )
	drop procedure  dbo.spu_obtieneDatosCITIVentas_v4_7
	

go

---  exec  dbo.spu_obtieneDatosCITIVentas_v4_7 1, 2015

create procedure  dbo.spu_obtieneDatosCITIVentas_v4_7(@mes int, @anio int) 
as
begin

		/* Select TOP 10  convert(varchar, A.dtComprobante,112) as  fec_comp,  -- Fecha de Comprobante
				right( replicate('0',3) + dbo.UDF_obtenerCodDOC_CITIT(tpComprobante , tpLetra ),3) as  cod_citi,  -- Tipo de Comprobante
				right( replicate('0',5) + A.nrTalonario,5)  as  serie_comp,	-- Punto de Venta 
				right( replicate('0',20) + A.nrComprobante,20 ) as  nro_comp,   -- NUmero de Comprobante}
				right( replicate('0',20) + A.nrComprobante,20 ) as  nro_comphasta,   -- NUmero de Comprobante hasta
				case  tpIVA when 'RI'  then '80'  
							else '99'   END As cod_dgi,
				case tpIVA when 'RI'   then  replace(A.nrDoc,'-','') 
							else '00000000000' END As nro_dgi,  --- Código del Documento del Comprador
				Left (  case tpIVA when 'RI'  then A.dsRazonSocial  
				else 'Consumidor Final' END   + Replicate(' ',30) , 30)  as nom_tit,  -- Nombre y Apellido del Comprador
		--vlTotalGeneral,
		dbo.UDF_obtenerFormatoNumericoAFIP ( vlTotalGeneral, 15, 2)      As imp_total,     --  importe total del operacion
		dbo.UDF_obtenerFormatoNumericoAFIP (ABS(isnull(A.vlIVA,0)),15,2) As imp_iva,				--  importe total conceptos que no integran el neto gravado		
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2) As imp_perc_no_cate,						--  percepcion a no categorizados
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2) As imp_exen,						--  importe operaciones exentas
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2) As imp_perc_ctas ,				--  importe percepciones o pagos a ctas impuestos nacionales
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2) As imp_perc_iibb ,				--  importe percepciones de ingresos brutos
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2) As imp_perc_ip ,					--  importe percepciones de impuestos municipales
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2) As imp_impuestos_internos ,		--  importe impuestos internos
		'PES'      as cod_moneda,					--  codigo de moneda
		dbo.UDF_obtenerFormatoNumericoAFIP (1,10,6)	   as tipo_cambio,			        --  tipo de cambio
		'v'      as cant_alicuotas_iva,			--  cantidad alicuotas iva  
		dbo.UDF_obtenerFormatoNumericoAFIP (0,15,2)      as otros_tributos,			    --  otros tributos
		convert(varchar, A.dtComprobante + 10,112)  as fecha_venc -- fecha de vencimiento de pago 
		FROM TB_Comprobantes A 
		WHERE month(A.dtComprobante) = @mes  and year(A.dtComprobante) = @anio
		
		SELECT  dbo.UDF_obtenerFormatoCUITAFIP(30501032545,20)  
		*/ 

		Select    convert(varchar, A.dtComprobante,112) -- as  fec_comp,  -- Fecha de Comprobante
				+ right( replicate('0',3) + dbo.UDF_obtenerCodDOC_CITIT_v4_7(tpComprobante , tpLetra ),3) --  as  cod_citi,  -- Tipo de Comprobante
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( A.nrTalonario,5,0)  --  as  serie_comp,	-- Punto de Venta 
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (rtrim( A.nrComprobante),20,0 )--  as  nro_comp,   -- NUmero de Comprobante}
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (rtrim(  A.nrComprobante),20,0) -- as  nro_comphasta,   -- NUmero de Comprobante hasta
				+ case  tpIVA when 'RI'  then (case WHEN dbo.ufn_ValidarCUIT(A.nrDoc)=1 then '80' ELSE '99' END)
							else '99'   END -- As cod_dgi,
				--, A.nrDoc
				--, A.vlTotalGeneral, 
				+  case tpIVA when 'RI'   then (case WHEN dbo.ufn_ValidarCUIT(A.nrDoc)=1 then dbo.UDF_obtenerFormatoCUITAFIP_v4_7(A.nrDoc,20) ELSE REPLICATE('0',20) END)   else REPLICATE('0',20) END -- As nro_dgi,  --- Código del Documento del Comprador
				+ Left (  case tpIVA when 'RI'  then A.dsRazonSocial   
				else 'Consumidor Final' END   + Replicate(' ',30) , 30) --  as nom_tit,  -- Nombre y Apellido del Comprador
		--vlTotalGeneral,
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( vlTotalGeneral, 15, 2)   --    As imp_total,     --  importe total del operacion
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (ABS(isnull(A.vlIVA,0)),15,2) --  As imp_iva,				--  importe total conceptos que no integran el neto gravado		
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_no_cate,						--  percepcion a no categorizados
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_exen,						--  importe operaciones exentas
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_ctas ,				--  importe percepciones o pagos a ctas impuestos nacionales
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_iibb ,				--  importe percepciones de ingresos brutos
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_ip ,					--  importe percepciones de impuestos municipales
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_impuestos_internos ,		--  importe impuestos internos
		+ 'PES'      -- as cod_moneda,					--  codigo de moneda
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (1,10,6)	--    as tipo_cambio,			        --  tipo de cambio
		+ '1'     -- as cant_alicuotas_iva,			--  cantidad alicuotas iva  
		+ ' '     -- as cant_alicuotas_iva,			--  codigo de operacion
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2)     --  as otros_tributos,			    --  otros tributos
		+ convert(varchar, A.dtComprobante + 10,112) --  as fecha_venc -- fecha de vencimiento de pago 
		FROM TB_Comprobantes A 
		WHERE month(A.dtComprobante) = @mes    and year(A.dtComprobante) = @anio 
		-- AND  (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI') and  dbo.ufn_ValidarCUIT('20-25475222-4')
		AND not (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI')  
		AND tpLetra <>'X' 


		return 0; 


end 


go


Select *
		FROM TB_Comprobantes A 
		WHERE month(A.dtComprobante) = 1   and year(A.dtComprobante) = 2015 
		-- AND  (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI') and  dbo.ufn_ValidarCUIT('20-25475222-4')
		AND not (vlTotalGeneral   > 1000 AND  tpIVA <> 'RI')  
			AND ( convert(varchar, A.dtComprobante,112) 
				+ right( replicate('0',3) + dbo.UDF_obtenerCodDOC_CITIT_v4_7(tpComprobante , tpLetra ),3) --  as  cod_citi,  -- Tipo de Comprobante
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( A.nrTalonario,5,0)  --  as  serie_comp,	-- Punto de Venta 
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (rtrim( A.nrComprobante),20,0 )--  as  nro_comp,   -- NUmero de Comprobante}
				+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (rtrim(  A.nrComprobante),20,0) -- as  nro_comphasta,   -- NUmero de Comprobante hasta
				+ case  tpIVA when 'RI'  then '80'  
							else '99'   END -- As cod_dgi,
				--, A.nrDoc
				--, A.vlTotalGeneral, 
				+  case tpIVA when 'RI'   then dbo.UDF_obtenerFormatoCUITAFIP_v4_7(A.nrDoc,20)  else REPLICATE('0',20) END -- As nro_dgi,  --- Código del Documento del Comprador
				+ Left (  case tpIVA when 'RI'  then A.dsRazonSocial   
				else 'Consumidor Final' END   + Replicate(' ',30) , 30) --  as nom_tit,  -- Nombre y Apellido del Comprador
		--vlTotalGeneral,
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 ( vlTotalGeneral, 15, 2)   --    As imp_total,     --  importe total del operacion
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (ABS(isnull(A.vlIVA,0)),15,2) --  As imp_iva,				--  importe total conceptos que no integran el neto gravado		
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_no_cate,						--  percepcion a no categorizados
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_exen,						--  importe operaciones exentas
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_ctas ,				--  importe percepciones o pagos a ctas impuestos nacionales
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_iibb ,				--  importe percepciones de ingresos brutos
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_perc_ip ,					--  importe percepciones de impuestos municipales
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2) -- As imp_impuestos_internos ,		--  importe impuestos internos
		+ 'PES'      -- as cod_moneda,					--  codigo de moneda
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (1,10,6)	--    as tipo_cambio,			        --  tipo de cambio
		+ '1'     -- as cant_alicuotas_iva,			--  cantidad alicuotas iva  
		+ ' '     -- as cant_alicuotas_iva,			--  codigo de operacion
		+ dbo.UDF_obtenerFormatoNumericoAFIP_v4_7 (0,15,2)) is null      --  as otros_tributos,			    --  otros tributos 


/*
	DECLARE @cPathDecidir VARCHAR(80)='F:\DEPARTAMENTOS\IMPOEXPO\ROMANEOS'
	DECLARE @barra AS VARCHAR(1)
	DECLARE @nNameFile AS VARCHAR(30)
	DECLARE @query VARCHAR(300)
	DECLARE @rom VARCHAR(6)

	SET @cPathDecidir = replace(@cPathDecidir,'F:','\\stg-dmz-fs\datos$')

	---------------- BLOQUE 12 -----------------	
	IF EXISTS (SELECT * FROM sys.tables WHERE name = 'RTMP_SubTotGradetTOT') DROP TABLE RTMP_SubTotGradetTOT
	CREATE TABLE RTMP_SubTotGradetTOT(Bloque INT, Linea INT, Renglon CHAR(99))


	INSERT INTO RTMP_SubTotGradetTOT (Bloque, Linea, Renglon)

	SELECT Bloque, Linea, Renglon /* * INTO #SubTotGradetTOT */
	FROM(
	SELECT 12 AS Bloque,
		   1 AS LINEA,
			SPACE(71) + 
			REPLICATE('-', 18) AS Renglon
	UNION	    
	SELECT DISTINCT 
		   12 AS Bloque,
		   2 AS LINEA,	
		   SPACE(79) + 
		   REPLICATE(' ', 10 - LEN(CAST(CAST(TOTAL as decimal(38,2)) AS varchar))) + ---Espacios en blanco a la derecha
		   CAST(CAST(TOTAL as decimal(38,2)) AS varchar) AS Renglon 
	FROM RTMP_SubTotGrade_2/*#SubTotGrade */
	) t1


	INSERT INTO rtmp_PackingList_GenerarArchivo
	SELECT Bloque, Renglon FROM RTMP_SubTotGradetTOT /*#SubTotGradetTOT*/ ORDER BY Linea	    
	    
	          	    

	--SELECT Renglon FROM Magma_ERP.dbo.tmp_PackingList_GenerarArchivo ORDER BY Bloque
	set @query = 'bcp "SELECT Renglon FROM Magma_ERP.dbo.rtmp_PackingList_GenerarArchivo ORDER BY Bloque" queryout '+@cPathDecidir+@nNameFile+' -c -t -T' 
	exec xp_cmdshell @query--, NO_OUTPUT 
*/

go

/*

Eliminado versiones originales con nombre erroneos
drop function  dbo.ufn_obtnerCodComprobanteAFIP
drop function  dbo.[UDF_MontoEscrito]
drop function  dbo.UDF_obtenerCodDOC_CITIT
drop procedure  dbo.spu_obtieneDatosCITIVentas
drop function  dbo.UDF_obtenerFormatoCUITAFIP
drop function dbo.UDF_obtenerFormatoNumericoAFIP

*/


go



alter  procedure sp_marcarTipodeActualizacionCajaPuesto_v3_7(
@nrTalonario_param   	  	as varchar(4),
@nrComprobante_param 	  	as varchar(8),
@tpComprobante_param 	  	as varchar(4),
@tpLetra_param       	  	as varchar(2),
@tpModificacionCajaPuesto_param  varchar(50), /* Agregado, Eliminado, Anulado, Modificado*/
					      /* En Analisis: Desanulado, Deseliminado */
@dsObservacionCajaPuesto_param   varchar(400)=null)			       
as
begin 

	update  [TB_Comprobantes]
	set	 tpModificacionCajaPuesto = @tpModificacionCajaPuesto_param,
		 dsObservacionCajaPuesto  = left(@tpModificacionCajaPuesto_param+': '+ isnull(@dsObservacionCajaPuesto_param,'') + ' / '+isnull(dsObservacionCajaPuesto,''),400) 
	where 
		 nrTalonario =  @nrTalonario_param    and
		 nrComprobante = @nrComprobante_param and
	         tpComprobante = @tpComprobante_param and
		 tpLetra = @tpLetra_param


end


go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_eliminarTablasImpresion_v4_7' )
	drop procedure SP_eliminarTablasImpresion_v4_7
go


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/****************************************************************/
CREATE PROCEDURE [dbo].[SP_eliminarTablasImpresion_v4_7] (@dsUsuario as varchar(25))
AS
BEGIN

	
	DELETE TB_ComprobantesDetalle_Imprime FROM TB_Comprobantes_Imprime,  TB_ComprobantesDetalle_Imprime
	WHERE TB_Comprobantes_Imprime.nrTalonario = TB_ComprobantesDetalle_Imprime.nrTalonario and
	 TB_Comprobantes_Imprime.nrComprobante = TB_ComprobantesDetalle_Imprime.nrComprobante and
	 TB_Comprobantes_Imprime.tpComprobante = TB_ComprobantesDetalle_Imprime.tpComprobante and
	 TB_Comprobantes_Imprime.tpLetra = TB_ComprobantesDetalle_Imprime.tpLetra
		AND TB_Comprobantes_Imprime.dsUsuario = @dsUsuario

	DELETE  TB_Comprobantes_Imprime FROM TB_Comprobantes_Imprime WHERE
						 TB_Comprobantes_Imprime.dsUsuario = @dsUsuario
END


GO


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_PrepararReimpresiondeComprobante_v4_7' )
	drop procedure  dbo.SP_PrepararReimpresiondeComprobante_v4_7


go

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/****************************************************************/
CREATE PROCEDURE [dbo].[SP_PrepararReimpresiondeComprobante_v4_7] 
@nrTalonario   char(4),
@nrComprobante char(12),
@tpComprobante char(2), 
@tpLetra	   char(1),
@dsUsuario	   varchar(20) 
AS
begin 

	DELETE TB_ComprobantesDetalle_Imprime FROM TB_Comprobantes_Imprime,  TB_ComprobantesDetalle_Imprime
	WHERE TB_Comprobantes_Imprime.nrTalonario = TB_ComprobantesDetalle_Imprime.nrTalonario and
	 TB_Comprobantes_Imprime.nrComprobante = TB_ComprobantesDetalle_Imprime.nrComprobante and
	 TB_Comprobantes_Imprime.tpComprobante = TB_ComprobantesDetalle_Imprime.tpComprobante and
	 TB_Comprobantes_Imprime.tpLetra = TB_ComprobantesDetalle_Imprime.tpLetra
	and  datediff(minute,TB_Comprobantes_Imprime.dtInsercion, getdate())>2

	DELETE  TB_Comprobantes_Imprime FROM TB_Comprobantes_Imprime WHERE
						datediff(minute,dtInsercion, getdate())>2


	DELETE TB_ComprobantesDetalle_Imprime FROM  TB_ComprobantesDetalle_Imprime
	WHERE  TB_ComprobantesDetalle_Imprime.nrTalonario=@nrTalonario AND
	TB_ComprobantesDetalle_Imprime.nrComprobante=@nrComprobante AND 
	TB_ComprobantesDetalle_Imprime.tpComprobante=@tpComprobante AND
	TB_ComprobantesDetalle_Imprime.tpLetra=@tpLetra 

	DELETE TB_Comprobantes_Imprime FROM  TB_Comprobantes_Imprime
	WHERE  TB_Comprobantes_Imprime.nrTalonario=@nrTalonario AND
	TB_Comprobantes_Imprime.nrComprobante=@nrComprobante AND 
	TB_Comprobantes_Imprime.tpComprobante=@tpComprobante AND
	TB_Comprobantes_Imprime.tpLetra=@tpLetra;

	INSERT INTO [TB_Comprobantes_Imprime]
	    (nrTalonario, nrComprobante, tpComprobante, tpLetra, 
	    dtComprobante, cdCondVenta, tpComision, cdCliente, 
	    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
	    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
	    flSincronizado, nrCaja, dtCaja, nrPuesto, 
	    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
	    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
	    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
	    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
	    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
	    nmEmpleado,vlIVA,vlSubTotal,vlPagoReales,vlDiaReal, dsCodDocAfip,
		dsUsuario)
	SELECT nrTalonario, nrComprobante, rtrim(tpComprobante) as tpComprobante, tpLetra, 
	    dtComprobante, cdCondVenta, tpComision, cdCliente, 
	    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
	    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
	    flSincronizado,  nrCaja, dtCaja, nrPuesto, 
	    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
	    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
	    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
	    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
	    dsOpcional2, dsOpcional3,  dsOpcional4, 
		flAnulado, dtAnulado, 
	    nmEmpleado,vlIVA,vlSubTotal, vlPagoReales, vlDiaReal, 
		'COD. ' +  dbo.ufn_obtnerCodComprobanteAFIP_v4_7 (tpComprobante ,tpLetra)  as dsCodDocAfip,  -- Recuperamos el Código de AFIP
		@dsUsuario
	FROM TB_Comprobantes WHERE TB_Comprobantes.nrTalonario=@nrTalonario AND
	TB_Comprobantes.nrComprobante=@nrComprobante AND 
	TB_Comprobantes.tpComprobante=@tpComprobante AND
	TB_Comprobantes.tpLetra=@tpLetra;


	INSERT INTO [TB_ComprobantesDetalle_Imprime]
	    (nrTalonario, nrComprobante, tpComprobante, tpLetra, nrItem, 
	    cdProducto, dsProducto, tpOperacion, qtCantidad, vlPorcentaje, 
	    vlPrecioPeaje, vlPrecioViaje, vlTotalItem, dtInsercion, 
	    flSincronizado )
	SELECT nrTalonario, nrComprobante, rtrim(tpComprobante) as tpComprobante, tpLetra, 
	    nrItem, cdProducto, dsProducto, tpOperacion, qtCantidad, 
	    vlPorcentaje, vlPrecioPeaje, vlPrecioViaje, vlTotalItem, 
	    dtInsercion, flSincronizado
	FROM TB_ComprobantesDetalle WHERE TB_ComprobantesDetalle.nrTalonario=@nrTalonario AND
	TB_ComprobantesDetalle.nrComprobante=@nrComprobante AND 
	TB_ComprobantesDetalle.tpComprobante=@tpComprobante AND
	TB_ComprobantesDetalle.tpLetra=@tpLetra ;
	
	
	update  a
	set a.nrTelLicenciatario = isnull(b.nrTel,'5480-0066'), 
	    a.dsOpcional4 = (select isnull(vlPrecioViaje, 350)  from tb_productos    where  cdProducto = 90020)
	from TB_Comprobantes_Imprime a , TB_proveedores b
	where a.nrLicencia = b.nrLicencia and
	      a.nrTalonario=@nrTalonario  and
	      a.nrComprobante=@nrComprobante and
	      a.tpComprobante=@tpComprobante and 
	      a.tpLetra=@tpLetra;


	update  a
	set a.nrCAI = b.nrCAI_Talonario_auto_empresa ,
	    a.dtVencimiento  = b.dtCAI_Talonario_auto_empresa
	from TB_Comprobantes_Imprime a inner join TB_Puestos  b on 
							convert(int , a.nrTalonario) = b.nrTalonario_auto_empresa
	where a.nrCAI is null and  (a.tpComprobante = 'A'  or a.tpLetra = 'A')  and a.tpIVA = 'RI' and
	      a.nrTalonario=@nrTalonario  and
	      a.nrComprobante=@nrComprobante and
	      a.tpComprobante=@tpComprobante and 
	      a.tpLetra=@tpLetra;

	

	select 
			x.nrTalonario	,
			x.nrComprobante	,
			x.tpComprobante	,
			x.tpLetra	,
			x.dtComprobante	,
			x.cdCliente	,
			x.cdCondVenta	,
			x.tpComision	,
			x.tpMoneda	,
			x.tpIVA	,
			x.vlTotalGeneral	,
			x.vlPagoPesos	,
			x.vlPagoEuros	,
			x.vlPagoDolares	,
			x.dsLeyenda	,
			x.flManual	,
			x.dtInsercion	,
			x.flSincronizado	,
			x.dsUsuario	,
			x.nrCaja	,
			x.dtCaja	,
			x.nrPuesto	,
			x.dsDomicilio	,
			x.nrLicencia	,
			x.nrBultos	,
			x.nrPasajeros	,
			x.nrDoc	,
			x.dsRazonSocial	,
			x.nmNombre	,
			x.nmApellido	,
			x.nmLicenciatario	,
			x.cdPostal	,
			x.nmLocalidad	,
			x.cdCodBar	,
			x.dsEmail	,
			x.nrTel	,
			x.nrCAI	,
			x.dtVencimiento	,
			x.vlDiaDolar	,
			x.vlDiaEuro	,
			x.dsOpcional1	,
			x.dsOpcional2	,
			x.dsOpcional3	,
			x.dsOpcional4	,
			x.flAnulado	,
			x.dtAnulado	,
			x.nmEmpleado	,
			x.IdReciboCtaCte	,
			x.flCargaErronea	,
			x.problema	,
			x.dsUsuario_Supervisor	,
			x.dtComprobante_hora	,
			x.dtActualizacion	,
			x.flEliminar	,
			x.vlSubtotal	,
			x.vlIVA	,
			x.nrTelLicenciatario	,
			x.vlPagoReales	,
			x.vlDiaReal	,
			x.dsCodDocAfip	,
			y.nrItem	,
			y.cdProducto	,
			y.dsProducto	,
			y.tpOperacion	,
			y.qtCantidad	,
			y.vlPorcentaje	,
			y.vlPrecioPeaje	,
			y.vlPrecioViaje	,
			y.vlTotalItem	,
			y.dtInsercion	,
			y.vlKilometros	
	FROM TB_Comprobantes_Imprime x inner join  TB_ComprobantesDetalle_Imprime y
						on x.nrTalonario = y.nrTalonario and
							x.nrComprobante = y.nrComprobante and
							x.tpComprobante = y.tpComprobante and
							x.tpLetra = y.tpLetra 
	where  x.nrTalonario=@nrTalonario  and
	       x.nrComprobante=@nrComprobante and
	       x.tpComprobante=@tpComprobante and 
	       x.tpLetra=@tpLetra;


	/**sp_help 'TB_Comprobantes_Imprime' 
	sp_help 'TB_ComprobantesDetalle_Imprime' 
	**/

end





select top 10 * from TB_Comprobantes  where tpComprobante = 'FA' order by dtComprobante desc

0006
00632568    
FA
B


select * from sys.procedures  where name like '%sco%_v3_7%'

sco_Comprobantes_cajapuesto_v3_7