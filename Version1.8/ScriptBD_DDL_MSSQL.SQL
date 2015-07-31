-- cambios de DDL version 1.8
use dbSG2000
go


create procedure sco_FondoFijoCajaAnterior_v1_8
@nrPuesto  as int
as
begin

	select a.vlSaldoInicialPesos, 
	       a.vlSaldoInicialDolares, 
	       a.vlSaldoInicialEuros
	from TB_Cajas a 
	where a.nrcaja =(select max(b.nrCaja)
			   from TB_Cajas b
			   where b.nrPuesto=@nrPuesto); 

	if @@rowcount<1 
	begin
		select 0 as vlSaldoInicialPesos, 
		       0 as vlSaldoInicialDolares, 
		       0 as vlSaldoInicialEuros

	end
	
end


go


-- Acrtualizamos la forma de pagos en la tabla de clientes
ALTER TABLE [dbo].[tb_clientes] ADD 
	tpFormadePago  varchar(20)null;

go 


ALTER TABLE [dbo].[tb_clientes] ADD 
	[nrPuesto] [smallint] NULL; 

go


create  PROCEDURE SP_ObtenerMaxcdCliente_v1_8 
@nrPuesto  as Integer
AS
declare @MaxcdCliente int

   SELECT @MaxcdCliente=MAX(cdCliente)
   FROM TB_Clientes where nrPuesto=@nrPuesto

   if @MaxcdCliente is null
   begin
	set @MaxcdCliente = convert(int,convert(varchar,@nrPuesto)+'000')
   end

   Select  @MaxcdCliente as MaxcdCliente 


GO

ALTER TABLE [dbo].[TB_Clientes] ADD 
	CONSTRAINT [FK_TB_Clientes_TB_Puestos] FOREIGN KEY 
	(
		[nrPuesto]
	) REFERENCES [dbo].[TB_Puestos] (
		[nrPuesto]
	)

go


ALTER TABLE [dbo].[TB_Puestos] ADD 
	[nrCAI_Talonario_auto] [decimal](18, 0) NULL ,
	[dtCAI_Talonario_auto] [datetime] NULL ,
	[nrCAI_Talonario_auto_empresa] [decimal](18, 0) NULL ,
	[dtCAI_Talonario_auto_empresa] [datetime] NULL;

go 


alter procedure sup_Puestos_v1_8
@nrPuesto_param 	                int,
@dsPuesto_param 	                varchar(50),
@dsIP_param     	                varchar(50)=null,
@dtActualizado_param                    datetime,
@nrTalonario_manual_param               int,
@nrTalonario_automatico_param           int,
@nrComprobante_manual_ult_param         int,
@nrComprobante_automatico_ult_param     int,
@flRespeta_secuencia_carga_manual_param int,
@tpLetra_param				char(1),
-- nuevos parametros
@nrTalonario_manual_empresa_param	int,
@nrTalonario_manual_ctacte_param	int,
@nrComprobante_manual_empresa_ult_param int,
@nrComprobante_manual_ctacte_ult_param	int,
@tpLetraEmpresa_param			char(10),
@tpLetraRecibo_param			char(10),
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
@dtCAI_Talonario_auto_empresa_param     datetime
as
declare @error_msg varchar(200)

	--------------------------------------------------------------
	--- Validaciones para los comprobantes automáticos
	--- AUTOMATICO: Para Consumidores Finales
	if exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_automatico=@nrTalonario_automatico_param and
			  tpLetra=@tpLetra_param)
	begin 
		raiserror (' El número de talonario automático ingresado, para Consumidor Final,  se encuentra asignado a otro puesto.',16,1)
		return -1
	end 

	--- AUTOMATICO: Para Empresas
	if exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_auto_empresa=@nrTalonario_manual_empresa_param and
			  tpLetraEmpresa=@tpLetraEmpresa_param)
	begin 
		raiserror (' El número de talonario automático ingresado, para Empresas,  se encuentra asignado a otro puesto. ',16,1)
		return -1
	end 

	
	--- AUTOMATICO: Para Recibos
	if exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_auto_ctacte=@nrTalonario_auto_ctacte_param and
			  tpLetraRecibo=@tpLetraRecibo_param)
	begin 
		raiserror ('El número de talonario automático ingresado, para Recibos,  se encuentra asignado a otro puesto.',16,1)
		return -1
	end 

	--- MANUAL: Para Consumidores Finales
	if exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_manual=@nrTalonario_manual_param and
			  tpLetra_manual=@tpLetra_param) 
	begin 
		raiserror (' El número de talonario manual ingresado, para Consumidores Finales, se encuentra asignado a otro puesto.',16,1)
		return -1
	end 

	--- MANUAL: Para Empresas
	if exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_manual_empresa=@nrTalonario_manual_empresa_param and
			  tpLetraEmpresa_manual=@tpLetraEmpresa_manual_param) 
	begin 
		raiserror ('El número de talonario manual ingresado, para Empresas, se encuentra asignado a otro puesto.',16,1)
		return -1
	end 


	--- MANUAL: Para Recibos
	if exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_manual_ctacte=@nrTalonario_manual_ctacte_param and
			  tpLetraRecibo_manual=@tpLetraRecibo_manual_param) 
	begin 
		raiserror (' El número de talonario manual ingresado, para Recibos, se encuentra asignado a otro puesto.',16,1)
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


	--------------------------------------------------------------
	/*******************************************************/	
	/* validacion surgida de la version 1.8 */
	if @nrCAI_Talonario_auto_param is not null and @dtCAI_Talonario_auto_param is null
	begin
		set @error_msg = ' Falta la fecha de vencimiento del nro de CAI '+ convert(varchar,@nrCAI_Talonario_auto_param)+'.'
		raiserror (@error_msg,16,1) 
		return -1 
	end 


	/* validacion surgida de la version 1.8 */
	if @nrCAI_Talonario_auto_empresa_param is not null and @dtCAI_Talonario_auto_empresa_param is null
	begin
		set @error_msg = ' Falta la fecha de vencimiento del nro de CAI '+ convert(varchar,@nrCAI_Talonario_auto_empresa_param)
		raiserror (@error_msg,16,1) 
		return -1 
	end 

	if @dtCAI_Talonario_auto_param<getdate()
	begin
		set @error_msg = ' La fecha de vencimiento del CAI '+  convert(varchar,@nrCAI_Talonario_auto_param) +' no puede ser menor a la fecha actual '+ convert(varchar,@nrCAI_Talonario_auto_empresa_param)+'.'
		raiserror (@error_msg,16,1) 
		return -1 

	end

	if @nrCAI_Talonario_auto_empresa_param<getdate()
	begin
		set @error_msg = ' La fecha de vencimiento del CAI '+  convert(varchar,@nrCAI_Talonario_auto_empresa_param) +' no puede ser menor a la fecha actual '+ convert(varchar,@nrCAI_Talonario_auto_empresa_param)+'.'
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
		dtCAI_Talonario_auto_empresa=@dtCAI_Talonario_auto_empresa_param

	where  nrPuesto = @nrPuesto_param

	if @@rowcount=0 
	begin
		raiserror ('No se ha localizado el puesto ingresado',16,1)
		return -1 
	end 


go 

create procedure sup_Puestos_v1_8
@nrPuesto_param 	                int,
@dsPuesto_param 	                varchar(50),
@dsIP_param     	                varchar(50)=null,
@dtActualizado_param                    datetime,
@nrTalonario_manual_param               int,
@nrTalonario_automatico_param           int,
@nrComprobante_manual_ult_param         int,
@nrComprobante_automatico_ult_param     int,
@flRespeta_secuencia_carga_manual_param int,
@tpLetra_param				char(1),
-- nuevos parametros
@nrTalonario_manual_empresa_param	int,
@nrTalonario_manual_ctacte_param	int,
@nrComprobante_manual_empresa_ult_param int,
@nrComprobante_manual_ctacte_ult_param	int,
@tpLetraEmpresa_param			char(10),
@tpLetraRecibo_param			char(10),
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
@dtCAI_Talonario_auto_empresa_param     datetime
as
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


	--------------------------------------------------------------
	/*******************************************************/	
	/* validacion surgida de la version 1.8 */
	if @nrCAI_Talonario_auto_param is not null and @dtCAI_Talonario_auto_param is null
	begin
		set @error_msg = ' Falta la fecha de vencimiento del nro de CAI '+ convert(varchar,@nrCAI_Talonario_auto_param)+'.'
		raiserror (@error_msg,16,1) 
		return -1 
	end 


	/* validacion surgida de la version 1.8 */
	if @nrCAI_Talonario_auto_empresa_param is not null and @dtCAI_Talonario_auto_empresa_param is null
	begin
		set @error_msg = ' Falta la fecha de vencimiento del nro de CAI '+ convert(varchar,@nrCAI_Talonario_auto_empresa_param)
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
		set @error_msg = ' La fecha de vencimiento del CAI '+  convert(varchar,@nrCAI_Talonario_auto_param) +' no puede ser menor a la fecha actual '+ convert(varchar,@nrCAI_Talonario_auto_empresa_param)+'.'
		raiserror (@error_msg,16,1) 
		return -1 

	end

	if @dtCAI_Talonario_auto_empresa_param<getdate()
	begin
		set @error_msg = ' La fecha de vencimiento del CAI '+  convert(varchar,@nrCAI_Talonario_auto_empresa_param) +' no puede ser menor a la fecha actual '+ convert(varchar,@nrCAI_Talonario_auto_empresa_param)+'.'
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
		dtCAI_Talonario_auto_empresa=@dtCAI_Talonario_auto_empresa_param

	where  nrPuesto = @nrPuesto_param

	if @@rowcount=0 
	begin
		raiserror ('No se ha localizado el puesto ingresado',16,1)
		return -1 
	end 



go



create procedure sco_Puestos_v1_8
@nrPuesto_param int=null,
@dsPuesto_param varchar(50)=null
as

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
		dtCAI_Talonario_auto_empresa
	from TB_Puestos
	where  (nrPuesto = @nrPuesto_param OR  @nrPuesto_param is null) 
		and  (dsPuesto =@dsPuesto_param OR @dsPuesto_param is null)
	and flEliminar=0
