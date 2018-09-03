
-- Cambios de DDL version 4.9.834b
use dbSG2000
go

-- Agregamos el campo nro_trans en  TB_Comprobantes
IF NOT  EXISTS  (SELECT   o.Name, c.Name FROM     sys.columns c  JOIN sys.objects o ON o.object_id = c.object_id 
								WHERE    o.type = 'U'   and o.Name = 'TB_puestos'  and  c.Name = 'flFacturaManualElectronica' )
BEGIN
	ALTER TABLE [dbo].[TB_Puestos] ADD [flFacturaManualElectronica] [bit] NULL
	ALTER TABLE [dbo].[TB_Puestos] ADD  CONSTRAINT [DF_TB_Puestos_flFacturaManualElectronica]  DEFAULT ((0)) FOR [flFacturaManualElectronica]
END


GO


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER procedure [dbo].[sup_Puestos_v4_9_831]
@nrPuesto_param 	                int,
@dsPuesto_param 	                varchar(50),
@dsIP_param     	                varchar(50)=null,
@dtActualizado_param                    datetime,
@nrTalonario_manual_param               int=null,
@nrTalonario_automatico_param           int=null,
@nrComprobante_manual_ult_param         int=null,
@nrComprobante_automatico_ult_param     int=null,
@flRespeta_secuencia_carga_manual_param int=null,
@tpLetra_param							char(1)=null,
-- nuevos parametros
@nrTalonario_manual_empresa_param	int,
@nrTalonario_manual_ctacte_param	int,
@nrComprobante_manual_empresa_ult_param int=null,
@nrComprobante_manual_ctacte_ult_param	int=null,
@tpLetraEmpresa_param				char(10),
@tpLetraRecibo_param				char(10),
@nrTalonario_auto_empresa_param		int,
@nrTalonario_auto_ctacte_param	        int,
@nrComprobante_auto_ctacte_ult_param	int=null,
@nrComprobante_auto_empresa_ult_param	int=null,
@tpletra_manual_param	                char(10),
@tpLetraEmpresa_manual_param	        char(10),
@tpLetraRecibo_manual_param       	char(10),
@nrCAI_Talonario_auto_param		decimal(18,0),
@dtCAI_Talonario_auto_param 		datetime,
@nrCAI_Talonario_auto_empresa_param 	decimal(18,0),
@dtCAI_Talonario_auto_empresa_param     datetime,
@flFacturaCtacte					     bit,
@nrComprobante_automatico_nd_ult	as int=null,
@nrComprobante_auto_empresa_nd_ult	as int=null,
@nrComprobante_auto_ctacte_nd_ult	as int=null,
@nrComprobante_manual_nd_ult		as int=null,
@nrComprobante_manual_empresa_nd_ult	as int=null,
@nrComprobante_manual_ctacte_nd_ult	as int=null,
@nrComprobante_automatico_nc_ult	as int=null,
@nrComprobante_auto_empresa_nc_ult	as int=null,
@nrComprobante_auto_ctacte_nc_ult	as int=null,
@nrComprobante_manual_nc_ult		as int=null,
@nrComprobante_manual_empresa_nc_ult	as int=null,
@nrComprobante_manual_ctacte_nc_ult	as int=null,
@flFacturaManualElectronica         bit
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

	--if @dtCAI_Talonario_auto_empresa_param<getdate()
	--begin
	--	set @error_msg = ' La fecha de vencimiento del CAI '+  convert(varchar,@nrCAI_Talonario_auto_empresa_param) +' no puede ser menor a la fecha actual. Fecha asignada '+ convert(varchar(10),@dtCAI_Talonario_auto_param,105)+'.'
	--	raiserror (@error_msg,16,1) 
	--	return -1 
	--end

	/*******************************************************/


	

	update TB_Puestos
	set dsPuesto=isnull(@dsPuesto_param,dsPuesto),
		dsIP=isnull(@dsIP_param,dsIP),
		dtActualizado = isnull(@dtActualizado_param,dtActualizado),
		nrTalonario_manual = isnull(@nrTalonario_manual_param,nrTalonario_manual),
		nrTalonario_automatico = isnull(@nrTalonario_automatico_param,nrTalonario_automatico),
		nrComprobante_manual_ult = isnull(@nrComprobante_manual_ult_param,nrComprobante_manual_ult),
		nrComprobante_automatico_ult = isnull(@nrComprobante_automatico_ult_param,nrComprobante_automatico_ult),
		flRespeta_secuencia_carga_manual = isnull(@flRespeta_secuencia_carga_manual_param,flRespeta_secuencia_carga_manual),
		tpLetra=isnull(@tpLetra_param,tpLetra),
		dtActualizacion=getdate(),
		nrTalonario_manual_empresa = isnull(@nrTalonario_manual_empresa_param,nrTalonario_manual_empresa),
		nrTalonario_manual_ctacte = isnull(@nrTalonario_manual_ctacte_param,nrTalonario_manual_ctacte),
		nrComprobante_manual_empresa_ult = isnull(@nrComprobante_manual_empresa_ult_param,nrComprobante_manual_empresa_ult),
		nrComprobante_manual_ctacte_ult = isnull(@nrComprobante_manual_ctacte_ult_param,nrComprobante_manual_ctacte_ult),
		tpLetraEmpresa = isnull(@tpLetraEmpresa_param,tpLetraEmpresa),
		tpLetraRecibo = isnull(@tpLetraRecibo_param,tpLetraRecibo),
		nrTalonario_auto_empresa = CASE WHEN  @nrTalonario_auto_empresa_param > nrTalonario_auto_empresa THEN isnull(@nrTalonario_auto_empresa_param,nrTalonario_auto_empresa) ELSE nrTalonario_auto_empresa END,
		nrTalonario_auto_ctacte = isnull(@nrTalonario_auto_ctacte_param,nrTalonario_auto_ctacte),
		nrComprobante_auto_ctacte_ult = isnull(@nrComprobante_auto_ctacte_ult_param,nrComprobante_auto_ctacte_ult),
		nrComprobante_auto_empresa_ult = isnull(@nrComprobante_auto_empresa_ult_param,nrComprobante_auto_empresa_ult),
		tpletra_manual=isnull(@tpletra_manual_param,tpletra_manual),
		tpLetraEmpresa_manual=isnull(@tpLetraEmpresa_manual_param,tpLetraEmpresa_manual),
		tpLetraRecibo_manual=isnull(@tpLetraRecibo_manual_param,tpLetraRecibo_manual),
		/* campos incluidos en la version 1.8 */
		nrCAI_Talonario_auto=@nrCAI_Talonario_auto_param,
		dtCAI_Talonario_auto=@dtCAI_Talonario_auto_param,
		nrCAI_Talonario_auto_empresa=@nrCAI_Talonario_auto_empresa_param,
		dtCAI_Talonario_auto_empresa=@dtCAI_Talonario_auto_empresa_param,
		flFacturaCtacte = @flFacturaCtacte,
		nrComprobante_automatico_nd_ult = isnull(@nrComprobante_automatico_nd_ult , nrComprobante_automatico_nd_ult ) ,
		nrComprobante_auto_empresa_nd_ult = isnull(@nrComprobante_auto_empresa_nd_ult , nrComprobante_auto_empresa_nd_ult ) ,
		nrComprobante_auto_ctacte_nd_ult = isnull(@nrComprobante_auto_ctacte_nd_ult , nrComprobante_auto_ctacte_nd_ult ) ,
		nrComprobante_manual_nd_ult = isnull(@nrComprobante_manual_nd_ult , nrComprobante_manual_nd_ult ) ,
		nrComprobante_manual_empresa_nd_ult = isnull(@nrComprobante_manual_empresa_nd_ult , nrComprobante_manual_empresa_nd_ult ) ,
		nrComprobante_manual_ctacte_nd_ult = isnull(@nrComprobante_manual_ctacte_nd_ult , nrComprobante_manual_ctacte_nd_ult ) ,
		nrComprobante_automatico_nc_ult = isnull(@nrComprobante_automatico_nc_ult , nrComprobante_automatico_nc_ult ) ,
		nrComprobante_auto_empresa_nc_ult = isnull(@nrComprobante_auto_empresa_nc_ult , nrComprobante_auto_empresa_nc_ult ) ,
		nrComprobante_auto_ctacte_nc_ult = isnull(@nrComprobante_auto_ctacte_nc_ult , nrComprobante_auto_ctacte_nc_ult ) ,
		nrComprobante_manual_nc_ult = isnull(@nrComprobante_manual_nc_ult , nrComprobante_manual_nc_ult ) ,
		nrComprobante_manual_empresa_nc_ult = isnull(@nrComprobante_manual_empresa_nc_ult , nrComprobante_manual_empresa_nc_ult ) ,
		nrComprobante_manual_ctacte_nc_ult = isnull(@nrComprobante_manual_ctacte_nc_ult , nrComprobante_manual_ctacte_nc_ult),
		flFacturaManualElectronica = @flFacturaManualElectronica
	where  nrPuesto = @nrPuesto_param

	if @@rowcount=0 
	begin
		raiserror ('No se ha localizado el puesto ingresado',16,1)
		return -1 
	end 



end;









