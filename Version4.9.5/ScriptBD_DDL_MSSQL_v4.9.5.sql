-- Cambios de DDL version 4.9.5
USE dbSG2000
GO


-- sp_helptext 'spu_obtener_puntosdeventa_facturacion_v4_7'



IF exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtener_puntosdeventa_facturacion_v4_9_5'  )
	DROP PROCEDURE  [dbo].spu_obtener_puntosdeventa_facturacion_v4_9_5

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


	Exec dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=4, @tipo_iva = 'RI',  @auto_impresor = 'N', @tpFormadePago = null,  @tpComprobante = 'FA'


	--- Exec dbo.spu_obtener_puntosdeventa_facturacion_v4_7 @nrPuesto_param=1, @tipo_iva = 'RI',  @auto_impresor = 'N', @tpFormadePago =  null,  @tpComprobante = 'FA'

*/



create procedure dbo.spu_obtener_puntosdeventa_facturacion_v4_9_5
@nrPuesto_param    int=null,
@tipo_iva		   char(10)='CF',
@auto_impresor     char(1)='S',
@tpFormadePago	   varchar(20)=null,  -- 'Cuenta Corriente'  / ''
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
					''	as nrCAI,
					''    as dtCai,
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
					''	as nrCAI,
					''    as dtCai,
					@flFacturaCtacte	as flFacturaCtacte
			return;

		end -- FIN   @tpComprobante ='NC'
		 
		if @tpFormadePago='Cuenta Corriente' 
		begin
			select  @nrTalonario_auto_ctacte    as nrTalonario,
				@nrComprobante_auto_ctacte_ult  as nrComprobante,
				@tpLetraRecibo				    as tpLetra,
				''	as nrCAI,
				''    as dtCai,
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
				''	as nrCAI,
				''    as dtCai,
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
			''	as nrCAI,
			''    as dtCai,
			@flFacturaCtacte	as flFacturaCtacte	
			return;	
	end
		
	if @tipo_iva = 'CF'  or  @tipo_iva = 'EX'
	begin
		select  @nrTalonario_manual       as nrTalonario,
				@nrComprobante_manual_ult as nrComprobante,
				@tpLetra		    as tpLetra,
				''	as nrCAI,
				''    as dtCai,
				@flFacturaCtacte	as flFacturaCtacte
		return;					
	end 
					
	if @tipo_iva = 'RI' 						
	begin
		select  @nrTalonario_manual_empresa       as nrTalonario,
				@nrComprobante_manual_empresa_ult as nrComprobante,
				@tpLetraEmpresa_manual				    as tpLetra,
				''	as nrCAI,
				''   as dtCai,
				@flFacturaCtacte	as flFacturaCtacte
		return;
	end
	
	
	select  @nrTalonario_manual_ctacte       as nrTalonario,
			@nrComprobante_manual_ctacte_ult as nrComprobante,
			@tpLetraRecibo_manual		    as tpLetra,
			''    as nrCAI,
			''    as dtCai,
			@flFacturaCtacte	as flFacturaCtacte


--- agregar try catch para evitar errores por numeros configurados en null	
end;



