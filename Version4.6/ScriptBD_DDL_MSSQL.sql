-- Cambios de DDL version 4.3
use dbSG2000
go






if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='spu_obtener_puntosdeventa_facturacion_v1_0' )
	drop procedure  dbo.spu_obtener_puntosdeventa_facturacion_v1_0


go

--sp_help 'TB_Puestos'
--  exec  dbo.spu_obtener_puntosdeventa_facturacion_v1_0 @nrPuesto_param=9,@tipo_iva='RI',@auto_impresor='S'
--  exec  dbo.spu_obtener_puntosdeventa_facturacion_v1_0 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='S'
--- exec  dbo.spu_obtener_puntosdeventa_facturacion_v1_0 @nrPuesto_param=9,@tipo_iva='X',@auto_impresor='N'
--  select distinct  tpIVA  from tb_clientes
--  Exec dbo.spu_obtener_puntosdeventa_facturacion_v1_0 @nrPuesto_param=9, @tipo_iva = CF,  @auto_impresor = S
create procedure dbo.spu_obtener_puntosdeventa_facturacion_v1_0
@nrPuesto_param    int=null,
@tipo_iva		   char(10)='RI',
@auto_impresor     char(1)='S'
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
		@flFacturaCtacte	=	flFacturaCtacte	
	from TB_Puestos
	where  (nrPuesto = @nrPuesto_param OR  @nrPuesto_param is null) 
	and flEliminar=0
	
	
	if @auto_impresor ='S' 
	begin
	
		if @tipo_iva = 'CF' 
		begin
			select  @nrTalonario_automatico       as nrTalonario,
					@nrComprobante_automatico_ult as nrComprobante,
					@tpLetra				    as tpLetra,
					@nrCAI_Talonario_auto	as nrCAI,
					@dtCAI_Talonario_auto   as dtCai
			return;					
		end 
						
		if @tipo_iva = 'RI' 						
		begin
			select  @nrTalonario_auto_empresa       as nrTalonario,
					@nrComprobante_auto_empresa_ult as nrComprobante,
					@tpLetraEmpresa				    as tpLetra,
					@nrCAI_Talonario_auto_empresa	as nrCAI,
					@dtCAI_Talonario_auto_empresa   as dtCai
			return;
		end
		
		
		select  @nrTalonario_auto_ctacte       as nrTalonario,
				@nrComprobante_auto_ctacte_ult as nrComprobante,
				@tpLetraRecibo				    as tpLetra,
				null	as nrCAI,
				null    as dtCai
		
		return;
	end


	--- Si no es autoimpesor
	if @tipo_iva = 'CF' 
	begin
		select  @nrTalonario_manual       as nrTalonario,
				@nrComprobante_manual_ult as nrComprobante,
				@tpLetra_manual			 as tpLetra,
				null	as nrCAI,
				null    as dtCai
		return;					
	end 
					
	if @tipo_iva = 'RI' 						
	begin
		select  @nrTalonario_manual_empresa       as nrTalonario,
				@nrComprobante_manual_empresa_ult as nrComprobante,
				@tpLetraEmpresa_manual				    as tpLetra,
				null	as nrCAI,
				null   as dtCai
		return;
	end
	
	
	select  @nrTalonario_manual_ctacte       as nrTalonario,
			@nrComprobante_manual_ctacte_ult as nrComprobante,
			@tpLetraRecibo_manual		    as tpLetra,
			null	as nrCAI,
			null    as dtCai
	
	
end;


go
