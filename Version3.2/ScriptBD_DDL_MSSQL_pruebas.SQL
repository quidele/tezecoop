-- Cambios de DDL version 3.2
use dbSG2000_Pruebas
go
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='nrCajaCtacte')
ALTER TABLE  [TB_Cupones] ADD 
	nrCajaCtaCte  	numeric(18, 0);
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cupones' and COLUMN_NAME='dtCajaCtaCte')
ALTER TABLE  [TB_Cupones] ADD 
	dtCajaCtaCte  	datetime;

go 

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='desimputada')
ALTER TABLE  [TB_Cajas] ADD 
	desimputada  	char(1);


go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='nrCajaAdmDesimputa')
ALTER TABLE  [TB_Cajas] ADD 
	nrCajaAdmDesimputa  	numeric(18, 0);

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_MovimientosContables' and COLUMN_NAME='tpMovimiento')
ALTER TABLE  [TB_MovimientosContables] ADD 
	tpMovimiento  	varchar(20);

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlSumaCajasPuestosCierrePesos')
ALTER TABLE  [TB_Cajas] ADD vlSumaCajasPuestosCierrePesos  	float;
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlSumaCajasPuestosCierreDolares')
ALTER TABLE  [TB_Cajas] ADD vlSumaCajasPuestosCierreDolares  	float;
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlSumaCajasPuestosCierreEuros')
ALTER TABLE  [TB_Cajas] ADD vlSumaCajasPuestosCierreEuros  	float;
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlSumaCajasPuestosDiferencia')
ALTER TABLE  [TB_Cajas] ADD vlSumaCajasPuestosDiferencia  	float;
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlDiferenciaCajasPuestosReimputadasPesos')
ALTER TABLE  [TB_Cajas] ADD vlDiferenciaCajasPuestosReimputadasPesos  	float;
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlDiferenciaCajasPuestosReimputadasDolares')
ALTER TABLE  [TB_Cajas] ADD vlDiferenciaCajasPuestosReimputadasDolares  	float;
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlDiferenciaCajasPuestosReimputadasEuros')
ALTER TABLE  [TB_Cajas] ADD vlDiferenciaCajasPuestosReimputadasEuros  	float;
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlDiferenciaCajasPuestosReimputadasDiferencia')
ALTER TABLE  [TB_Cajas] ADD vlDiferenciaCajasPuestosReimputadasDiferencia  	float;
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='nrCajaAdmImputaOrigen')
ALTER TABLE  [TB_Cajas] ADD nrCajaAdmImputaOrigen numeric(18, 0);

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TB_ValoresDesimputacionesCajasPuestos]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_ValoresDesimputacionesCajasPuestos]
GO

CREATE TABLE [dbo].[TB_ValoresDesimputacionesCajasPuestos] (
	[nrCajaAdm] [numeric](18, 0) NOT NULL ,
	[nrCaja] [numeric](18, 0) NOT NULL ,
	[tpAccion] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[vlCierrePesos] [float] NULL ,
	[vlCierreDolares] [float] NULL ,
	[vlCierreEuros] [float] NULL ,
	[vlDiferenciaDeCierre] [float] NULL ,
	[dsObservacion] [varchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[esCajaActual] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_ValoresDesimputacionesCajasPuestos] ADD 
	CONSTRAINT [DF_TB_ValoresDesimputacionesCajasPuestos_esCajaActual] DEFAULT (1) FOR [esCajaActual],
	CONSTRAINT [PK_TB_ValoresDesimputacionesCajasPuestos] PRIMARY KEY  CLUSTERED 
	(
		[nrCajaAdm],
		[nrCaja],
		[tpAccion]
	)  ON [PRIMARY] 
GO


if exists (select * from dbo.sysobjects where name  = 'sp_desimputarcajapuesto_v3_2')
drop procedure [dbo].[sp_desimputarcajapuesto_v3_2];
 
go

create procedure sp_desimputarcajapuesto_v3_2 
	@nrCajaPuesto_param     as  numeric(18, 0),
	@nrCajaAdmActual        as  numeric(18, 0),
	@dsUsuario_param        as  varchar(50),
	@dsUsuarioCajaPuesto_param as  varchar(50)=null,
	@dsUsuario_Supervisor_param as varchar(50)
as
begin
declare @nrCajaAdmOrigen as numeric(18,0)
declare @strError	 as varchar(100)

	set @nrCajaAdmOrigen=null

	select  @nrCajaAdmOrigen=max(nrCaja) from tb_movimientoscontables  where nrcajapuesto=@nrCajaPuesto_param

	if  @nrCajaAdmOrigen is null
	begin
		set @strError = 'Error la caja puesto '+ convert(varchar,@nrCajaPuesto_param)+' no se encuentra imputada'
		raiserror (@strError,1,16)
		return;
	end 
	
	-- verificamos si se esta en la misma caja
	if @nrCajaAdmActual=@nrCajaAdmOrigen
	begin
	
		-- eliminamos los registros en forma fisica
		delete from  TB_MovimientosContables where  nrCajaPuesto=@nrCajaPuesto_param and nrCaja = @nrCajaAdmActual 
	        and (tpMovimiento<>'Desimputacion' or tpMovimiento is null)  -- verificamos que no se trata de una desimputacion
		select 'OK' as resultado

		UPDATE TB_Cajas SET TB_Cajas.nrCajaAdmImputaOrigen  = null
		WHERE nrCaja = @nrCajaPuesto_param and TB_Cajas.nrCajaAdmImputaOrigen=@nrCajaAdmActual


		delete from  TB_ValoresDesimputacionesCajasPuestos where  
			    nrCajaAdm = @nrCajaAdmActual
			and nrCaja=@nrCajaPuesto_param
			and tpAccion='Imputación'
			
		return;
	end 
	else
	begin
		print 'llamamos al sp sp_grabarValoresDesimputacionesCajasPuestos_v3_2'			
		exec sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2 @tpAccion='Desimputación',
								          @nrCajaAdmActual=@nrCajaAdmActual,
									  @nrCajaPuesto_param=@nrCajaPuesto_param,
									  @esCajaActual=0
	end	

	declare @nrCajaPuestoImputada numeric 
        declare @suma_vlPagoPesos       float 
        declare @suma_vlPagoDolares     float 
        declare @suma_vlPagoEuros       float 


	create table #temp_MovimientosaDesimputar
			([IdMovimiento] [numeric](18, 0) NOT NULL ,
			[dsMovimiento] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[IdRecibo] [numeric](18, 0) NULL ,
			[IdProveedor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[dsProveedor] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[cdConcepto] [int] NULL ,
			[tpConcepto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[dsConcepto] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[tpOperacion] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[vlPesos] [float] NULL ,
			[vlDolares] [float] NULL ,
			[vlEuros] [float] NULL ,
			[nrRecibo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[nrFactura] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[nrCaja] [numeric](18, 0) NULL ,
			[dsUsuario] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[dtMovimiento] [datetime] NULL ,
			[dsObservacion] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[nrAnio] [int] NULL ,
			[dsUsuario_Supervisor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[nrCajaPuesto] [numeric](18, 0) NULL ,
			[tpCajaImputacion] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[dsUsuarioCajaPuesto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL)

	declare @IdMovimiento [numeric](18, 0)
	declare @dsMovimiento [varchar] (100)  
	declare @IdRecibo [numeric](18, 0)  
	declare @IdProveedor [varchar] (50)  
	declare @dsProveedor [varchar] (60)  
	declare @cdConcepto [int]   
	declare @tpConcepto [varchar] (50)  
	declare @dsConcepto [varchar] (100)  
	declare @tpOperacion [varchar] (50)  
	declare @vlPesos [float]   
	declare @vlDolares [float]   
	declare @vlEuros [float]   
	declare @nrRecibo [varchar] (50)  
	declare @nrFactura [varchar] (50)  
	declare @nrCaja [numeric](18, 0)   
	declare @dsUsuario [varchar] (50)  
	declare @dtMovimiento [datetime]   
	declare @dsObservacion [varchar] (255)  
	declare @nrAnio [int]   
	declare @dsUsuario_Supervisor  [varchar] (50)  
	declare @nrCajaPuesto [numeric](18, 0)   
	declare @tpCajaImputacion [varchar] (50)  
	declare @dsUsuarioCajaPuesto  [varchar] (50)

	-- obtenemos los valores imputados en la caja de los licenciatarios y caja de la cooperativa
	insert into #temp_MovimientosaDesimputar exec sp_obtiene_saldo_cajapuestoimputada_v3_2
		@nrCajaPuesto_param=@nrCajaPuesto_param,
		@nrCajaAdm_param=@nrCajaAdmOrigen

	declare @maxIdMovimiento       numeric 
	select @maxIdMovimiento=max(IdMovimiento)+1 from TB_MovimientosContables 

	-- preparamos cursos para realizar la insercion
	declare  cur_MovimientosaDesimputar cursor for select * from #temp_MovimientosaDesimputar

	OPEN cur_MovimientosaDesimputar


	FETCH NEXT FROM cur_MovimientosaDesimputar 
	INTO 	@IdMovimiento,
			@dsMovimiento, 
			@IdRecibo,
			@IdProveedor, 
			@dsProveedor,
			@cdConcepto, 
			@tpConcepto, 
			@dsConcepto, 
			@tpOperacion, 
			@vlPesos,
			@vlDolares,  
			@vlEuros, 
			@nrRecibo,
			@nrFactura, 
			@nrCaja,
			@dsUsuario, 
			@dtMovimiento,
			@dsObservacion, 
			@nrAnio,
			@dsUsuario_Supervisor, 
			@nrCajaPuesto,
			@tpCajaImputacion, 
			@dsUsuarioCajaPuesto


	-- REALIZAR PRUEBAS DE TESTING
	
	WHILE @@FETCH_STATUS = 0
	BEGIN

		--realizar el movimiento de desimputacion 
		INSERT TB_MovimientosContables (
			IdMovimiento,			
			dsMovimiento, 
			IdRecibo,
			IdProveedor, 
			dsProveedor,
			cdConcepto, 
			tpConcepto, 
			dsConcepto, 
			tpOperacion, 
			vlPesos,
			vlDolares,  
			vlEuros, 
			nrRecibo,
			nrFactura, 
			nrCaja,
			dsUsuario, 
			dtMovimiento,
			dsObservacion, 
			nrAnio,
			dsUsuario_Supervisor, 
			nrCajaPuesto,
			tpCajaImputacion, 
			dsUsuarioCajaPuesto,
			tpMovimiento)
		values  
			(@maxIdMovimiento,
			@dsMovimiento, 
			@IdRecibo,
			@IdProveedor, 
			@dsProveedor,
			@cdConcepto, 
			@tpConcepto, 
			@dsConcepto, 
			@tpOperacion, 
			@vlPesos,
			@vlDolares,  
			@vlEuros, 
			@nrRecibo,
			@nrFactura, 
			@nrCajaAdmActual, -- damos de alta los contraasientos para la caja actual
			@dsUsuario, 
			@dtMovimiento,
			@dsObservacion, 
			@nrAnio,
			@dsUsuario_Supervisor_param, -- actualizamos el usuarios supervisor que autorizo la desimputacion
			@nrCajaPuesto,
			@tpCajaImputacion, 
			@dsUsuarioCajaPuesto,
			'Desimputacion' )
		
		FETCH NEXT FROM cur_MovimientosaDesimputar 
			INTO 		@IdMovimiento,
					@dsMovimiento, 
					@IdRecibo,
					@IdProveedor, 
					@dsProveedor,
					@cdConcepto, 
					@tpConcepto, 
					@dsConcepto, 
					@tpOperacion, 
					@vlPesos,
					@vlDolares,  
					@vlEuros, 
					@nrRecibo,
					@nrFactura, 
					@nrCaja,
					@dsUsuario, 
					@dtMovimiento,
					@dsObservacion, 
					@nrAnio,
					@dsUsuario_Supervisor, 
					@nrCajaPuesto,
					@tpCajaImputacion, 
					@dsUsuarioCajaPuesto

	   select @maxIdMovimiento = @maxIdMovimiento + 1

	END  --- cierra el while del cursor


	CLOSE cur_MovimientosaDesimputar
	DEALLOCATE cur_MovimientosaDesimputar

	update tb_cajas
	set  desimputada = 'S',
	     nrCajaAdmDesimputa=@nrCajaAdmActual
	where nrCaja = @nrCajaPuesto_param

    select 'OK' as resultado

end 

print ' grabar en el diccionario de datos al sp sp_grabarValoresDesimputacionesCajasPuestos_v3_2'

go

if exists (select * from dbo.sysobjects where name  = 'sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2')
drop procedure [dbo].[sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2]

go

create procedure sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2 (@tpAccion varchar(50),
									       @nrCajaAdmActual as numeric(18, 0),
								               @nrCajaPuesto_param as numeric(18, 0),
									       @esCajaActual as int=1)
as
begin
 
	
	
	delete from  TB_ValoresDesimputacionesCajasPuestos where  
			    nrCajaAdm = @nrCajaAdmActual
			and nrCaja=@nrCajaPuesto_param
			and tpAccion=@tpAccion

	insert into  TB_ValoresDesimputacionesCajasPuestos
	       (nrCaja,
	       vlCierrePesos,		
	       vlCierreDolares,
	       vlCierreEuros,
	       vlDiferenciaDeCierre,
	       nrCajaAdm,
	       tpAccion,
	       dsObservacion,
	       esCajaActual)
	select nrCaja,
	       isnull(vlCierrePesos,0)         as vlCierrePesos,
	       isnull(vlCierreDolares,0)       as vlCierreDolares,
	       isnull(vlCierreEuros,0)         as vlCierreEuros,
	       isnull(vlDiferenciaDeCierre,0)  as vlDiferenciaDeCierre,
	       @nrCajaAdmActual as nrCajaAdm,
	       @tpAccion,
	       dsDiferenciaDeCierre as dsObservacion,
	       @esCajaActual
	from tb_cajas	
	where nrCaja = @nrCajaPuesto_param

end




go 
 


if exists (select * from dbo.sysobjects where name  = 'sp_obtiene_saldo_cajapuestoimputada_v3_2')
drop procedure [dbo].[sp_obtiene_saldo_cajapuestoimputada_v3_2]

go



create procedure sp_obtiene_saldo_cajapuestoimputada_v3_2 
	@nrCajaPuesto_param numeric(18, 0),
	@nrCajaAdm_param numeric(18, 0)
as
begin 


	create table #tmp_obtiene_saldo_cajapuestoimputada
			([IdMovimiento] [numeric](18, 0) NOT NULL ,
			[dsMovimiento] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[IdRecibo] [numeric](18, 0) NULL ,
			[IdProveedor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[dsProveedor] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[cdConcepto] [int] NULL ,
			[tpConcepto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[dsConcepto] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[tpOperacion] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[vlPesos] [float] NULL ,
			[vlDolares] [float] NULL ,
			[vlEuros] [float] NULL ,
			[nrRecibo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[nrFactura] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[nrCaja] [numeric](18, 0) NULL ,
			[dsUsuario] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[dtMovimiento] [datetime] NULL ,
			[dsObservacion] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[nrAnio] [int] NULL ,
			[dsUsuario_Supervisor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[nrCajaPuesto] [numeric](18, 0) NULL ,
			[tpCajaImputacion] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
			[dsUsuarioCajaPuesto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL)

  -- obtenemos todos los registros que se grabaron y revertimos la registracion

  -- lo que era entrada pasar a ser de salida
  insert into #tmp_obtiene_saldo_cajapuestoimputada
  select 
	a.[IdMovimiento],
	a.[dsMovimiento] as 'dsMovimiento',
	a.[IdRecibo],
	a.[IdProveedor],
	a.[dsProveedor],
	a.[cdConcepto],
	a.[tpConcepto],
	a.[dsConcepto] as dsConcepto,
	'Salida de Dinero' as 'tpOperacion',
	a.[vlPesos],
	a.[vlDolares],
	a.[vlEuros],
	a.[nrRecibo],
	a.[nrFactura],
	a.[nrCaja],
	a.[dsUsuario],
	a.[dtMovimiento],
	a.[dsObservacion],
	a.[nrAnio],
	a.[dsUsuario_Supervisor],
	a.[nrCajaPuesto],
	a.[tpCajaImputacion],
	a.[dsUsuarioCajaPuesto]
  from tb_movimientosContables a, tb_conceptos b
  where a.nrCajaPuesto = @nrCajaPuesto_param   
	and  a.tpOperacion='Entrada de Dinero' 
        and  a.nrCaja = @nrCajaAdm_param
	and  a.cdConcepto=b.cdConcepto  
        and (a.tpMovimiento<>'Desimputacion'  or a.tpMovimiento is null)

  -- lo que era salida pasar a ser de entrada
  insert into #tmp_obtiene_saldo_cajapuestoimputada
  select 
	a.[IdMovimiento],
	a.[dsMovimiento] as 'dsMovimiento',
	a.[IdRecibo],
	a.[IdProveedor],
	a.[dsProveedor],
	a.[cdConcepto],
	a.[tpConcepto],
	a.[dsConcepto] as dsConcepto,
	'Entrada de Dinero' as 'tpOperacion',
	a.[vlPesos],
	a.[vlDolares],
	a.[vlEuros],
	a.[nrRecibo],
	a.[nrFactura],
	a.[nrCaja],
	a.[dsUsuario],
	a.[dtMovimiento],
	a.[dsObservacion],
	a.[nrAnio],
	a.[dsUsuario_Supervisor],
	a.[nrCajaPuesto],
	a.[tpCajaImputacion],
	a.[dsUsuarioCajaPuesto]
  from tb_movimientosContables a, tb_conceptos b
  where a.nrCajaPuesto = @nrCajaPuesto_param   
	and  a.tpOperacion='Salida de Dinero'   
        and   a.nrCaja = @nrCajaAdm_param
	and  a.cdConcepto=b.cdConcepto  
	and (a.tpMovimiento<>'Desimputacion'  or a.tpMovimiento is null)

  select  
	a.[IdMovimiento],
	a.[dsMovimiento],
	a.[IdRecibo],
	a.[IdProveedor],
	a.[dsProveedor],
	a.[cdConcepto],
	a.[tpConcepto],
	a.[dsConcepto],
	a.tpOperacion,
	a.[vlPesos],
	a.[vlDolares],
	a.[vlEuros],
	a.[nrRecibo],
	a.[nrFactura],
	a.[nrCaja],
	a.[dsUsuario],
	a.[dtMovimiento],
	a.[dsObservacion],
	a.[nrAnio],
	a.[dsUsuario_Supervisor],
	a.[nrCajaPuesto],
	a.[tpCajaImputacion],
	a.[dsUsuarioCajaPuesto]
	from #tmp_obtiene_saldo_cajapuestoimputada a


end

go


if exists (select * from dbo.sysobjects where name  = 'sp_existen_cajas_desimputadas_v3_2')
drop procedure [dbo].[sp_existen_cajas_desimputadas_v3_2]
 
go

create procedure sp_existen_cajas_desimputadas_v3_2 
	@nrCajaAdmActual        as  numeric(18, 0)
as
begin


	if exists (	select nrCaja  from tb_cajas
			where   flimputado = 0  and 
				desimputada = 'S' and 
				nrCajaAdmDesimputa=@nrCajaAdmActual)
	begin
		---print 'EXISTEN CAJA DESIMPUTADAS / SIN IMPUTAR'
		select 'SI' as resultado,'Existen cajas desimputadas que debe registrar' as 'descripcion'
		return
	end	

	select 'NO' as resultado, 'No existen cajas desimputadas' as 'descripcion'

end


go


/* Correccion del bug en la modificacion de los numeros de talonarios */


if exists (select * from dbo.sysobjects where name  = 'sup_Puestos_v1_8')
drop procedure [dbo].[sup_Puestos_v1_8]

go 

CREATE procedure sup_Puestos_v1_8
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


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------ MODIFICACIONES PARA REALIZAR UNA DESIMPUTACION DETALLADA --------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

go 


/*  

	rpt_resumendecajaadm_v3_2.rpt =>  Informar las diferencias provocadas por las desimputaciones
		Generar el SP SP_rpt_resumendecajaadm_v3_2
	rpt_cajaspuestosimputadas_v3_2.rpt => informar cajas imputadas y desimputadas
		Generar el SP SP_rpt_resumendecajaadm_v3_2
		Generar el SP_obtenerCajasPuestosImputadas_v3_2

*/

go


if exists (select * from dbo.sysobjects where name  = 'SP_obtenerRetenciones_v3_2')
drop procedure [dbo].[SP_obtenerRetenciones_v3_2];

go

-- Version 3.1 creamos un store procedure para obtener en detalle de las comisiones de la caja diara de la administración 
-- Version 3.2 tenemos en cuenta las desimputaciones
create procedure [dbo].[SP_obtenerRetenciones_v3_2] (@nrCaja_param numeric)
as
begin


	---obtencion del saldo ingresado en conceptos de comisiones
	CREATE TABLE #temp_SaldoComisiones (
		[vlSumaPesos] [float] NULL ,
		[vlSumaDolares] [float] NULL ,
		[vlSumaEuros] [float] NULL 
	) 


	INSERT INTO #temp_SaldoComisiones ([vlSumaPesos], [vlSumaDolares], [vlSumaEuros])
	SELECT isnull(SUM(a.vlPesos),0)   AS vlSumaPesos, 
	       isnull(SUM(a.vlDolares),0) As vlSumaDolares, 
	       isnull(SUM(a.vlEuros),0)   AS vlSumaEuros
	FROM dbo.TB_MovimientosContables a
		where	a.cdConcepto in (2010,2014,2015,2019,2020)
			and a.nrCaja =  @nrCaja_param 
			and (a.tpMovimiento<>'Desimputacion'  or a.tpMovimiento is null)
        union all
	SELECT -abs(isnull(SUM(a.vlPesos),0))   AS vlSumaPesos, 
	       -abs(isnull(SUM(a.vlDolares),0)) As vlSumaDolares, 
	       -abs(isnull(SUM(a.vlEuros),0))   AS vlSumaEuros
	FROM dbo.TB_MovimientosContables a
		where	a.cdConcepto in (2010,2014,2015,2019,2020)
			and a.nrCaja =  @nrCaja_param 
			and a.tpMovimiento='Desimputacion'

	select  sum(vlSumaPesos)    as vlSumaPesos,
   		sum(vlSumaDolares)  as vlSumaDolares,
   		sum(vlSumaEuros)    as vlSumaEuros
	from #temp_SaldoComisiones

end

go


go

if exists (select * from dbo.sysobjects where name  = 'SP_obtenerRetencionesCajasDesimputadas_v3_2')
drop procedure [dbo].[SP_obtenerRetencionesCajasDesimputadas_v3_2];

go


if exists (select * from dbo.sysobjects where name  = 'ufn_obtenerRetencionesIVA_v3_2')
drop function [dbo].[ufn_obtenerRetencionesIVA_v3_2];

go

if exists (select * from dbo.sysobjects where name  = 'SP_obtenerRetencionesIVA_v3_2')
drop procedure [dbo].[SP_obtenerRetencionesIVA_v3_2];


GO

-- Version 3.2 creamos un store para tener en cuenta las comisiones de las cajas desimputaciones
create procedure [dbo].[SP_obtenerRetencionesIVA_v3_2] (@nrCaja_param numeric)
as
begin

	declare @vlSumaPesos  float


	---obtencion del saldo ingresado en conceptos de comisiones
	CREATE TABLE #temp_SaldoRetencionIVA (
		[vlSumaPesos] [float] NULL ,
		[vlSumaDolares] [float] NULL ,
		[vlSumaEuros] [float] NULL 
	) 


	INSERT INTO #temp_SaldoRetencionIVA ([vlSumaPesos], [vlSumaDolares], [vlSumaEuros])
	SELECT isnull(SUM(a.vlPesos),0)   AS vlSumaPesos, 
	       isnull(SUM(a.vlDolares),0) As vlSumaDolares, 
	       isnull(SUM(a.vlEuros),0)   AS vlSumaEuros
	FROM dbo.TB_MovimientosContables a
		where	a.cdConcepto in (2004)
			and a.nrCaja =  @nrCaja_param 
			and (a.tpMovimiento<>'Desimputacion'  or a.tpMovimiento is null)
        union all
	SELECT -abs(isnull(SUM(a.vlPesos),0))   AS vlSumaPesos, 
	       -abs(isnull(SUM(a.vlDolares),0)) As vlSumaDolares, 
	       -abs(isnull(SUM(a.vlEuros),0))   AS vlSumaEuros
	FROM dbo.TB_MovimientosContables a
		where	a.cdConcepto in (2004)
			and a.nrCaja =  @nrCaja_param 
			and a.tpMovimiento='Desimputacion'

	select  sum(vlSumaPesos)    as vlSumaPesos,
   		sum(vlSumaDolares)  as vlSumaDolares,
   		sum(vlSumaEuros)    as vlSumaEuros
	from #temp_SaldoRetencionIVA



end

go

if exists (select * from dbo.sysobjects where name  = 'SP_rpt_resumendecajaadm_v3_2')
drop procedure [dbo].[SP_rpt_resumendecajaadm_v3_2];

go


CREATE procedure SP_rpt_resumendecajaadm_v3_2
						@nrCaja_param numeric,
						@tpCaja_param char(2)=null,
						@tpCajaImputacion_param varchar(50)=null
as
begin
declare @vlSaldoInicialPesos   as float
declare @vlSaldoInicialDolares as float
declare @vlSaldoInicialEuros   as float
declare @vlSaldoCierrePesos    as float

declare @vlSumaCajasPuestosCierrePesos as float
declare @vlSumaCajasPuestosCierreDolares as float
declare @vlSumaCajasPuestosCierreEuros as float
declare @vlSumaCajasPuestosDiferencia as float

declare @vlDiferenciaCajasPuestosReimputadasPesos as float
declare @vlDiferenciaCajasPuestosReimputadasDolares as float
declare @vlDiferenciaCajasPuestosReimputadasEuros as float
declare @vlDiferenciaCajasPuestosReimputadasDiferencia as float

declare @flestado as integer

	if @tpCaja_param is null
		set @tpCaja_param='CA'
	
	if @tpCaja_param =''
		set @tpCaja_param='CA'
	
	if @tpCajaImputacion_param=''  
		set @tpCajaImputacion_param=null

	---obtenemos datos de la caja adm
	select 
		@vlSumaCajasPuestosCierrePesos = vlSumaCajasPuestosCierrePesos,
		@vlSumaCajasPuestosCierreDolares = vlSumaCajasPuestosCierreDolares,
		@vlSumaCajasPuestosCierreEuros = vlSumaCajasPuestosCierreEuros,
		@vlSumaCajasPuestosDiferencia = vlSumaCajasPuestosDiferencia,
		@vlDiferenciaCajasPuestosReimputadasPesos = vlDiferenciaCajasPuestosReimputadasPesos,
		@vlDiferenciaCajasPuestosReimputadasDolares = vlDiferenciaCajasPuestosReimputadasDolares,
		@vlDiferenciaCajasPuestosReimputadasEuros = vlDiferenciaCajasPuestosReimputadasEuros,
		@vlDiferenciaCajasPuestosReimputadasDiferencia = vlDiferenciaCajasPuestosReimputadasDiferencia,
		@flestado = flestado
	from tb_cajas
	where nrCaja = @nrCaja_param
 

	CREATE TABLE #temp_SaldoInicial (
		[vlSaldoInicialPesos] [float] NULL ,
		[vlSaldoInicialDolares] [float] NULL ,
		[vlSaldoInicialEuros] [float] NULL 
	) 
 
	insert into #temp_SaldoInicial exec SP_CalculaSaldoInicial_v2_9 @nrCaja_param=@nrCaja_param,
									@tpCaja_param=@tpCaja_param,
									@tpCajaImputacion_param=@tpCajaImputacion_param

	CREATE TABLE #temp_SaldoCierre (
		[vlSaldoCierrePesos] [float] NULL 
	)

	insert into #temp_SaldoCierre exec SP_CalculaSaldoCierre_v2_9 @nrCaja_param=@nrCaja_param,
									@tpCaja_param=@tpCaja_param,
									@tpCajaImputacion_param=@tpCajaImputacion_param
		

	select top 1 @vlSaldoCierrePesos=vlSaldoCierrePesos 
	from   #temp_SaldoCierre;
 
	select top 1   @vlSaldoInicialPesos=vlSaldoInicialPesos,
		       @vlSaldoInicialDolares=vlSaldoInicialDolares,
		       @vlSaldoInicialEuros=vlSaldoInicialEuros 
	from #temp_SaldoInicial

	declare @vlSaldoPesosComision   as float
	declare @vlSaldoDolaresComision as float
	declare @vlSaldoEurosComision   as float

	---obtencion del saldo ingresado en conceptos de comisiones
	CREATE TABLE #temp_SaldoComisiones (
		[vlSumaPesos] [float] NULL ,
		[vlSumaDolares] [float] NULL ,
		[vlSumaEuros] [float] NULL 
	) 


	insert into #temp_SaldoComisiones exec SP_obtenerRetenciones_v3_2  @nrCaja_param=@nrCaja_param

	select	 @vlSaldoPesosComision = vlSumaPesos,
		 @vlSaldoDolaresComision = vlSumaDolares,
		 @vlSaldoEurosComision = vlSumaEuros
	from #temp_SaldoComisiones


	declare @vlSumaRetencionIVA float

	delete from #temp_SaldoComisiones

	insert into #temp_SaldoComisiones exec SP_obtenerRetencionesIVA_v3_2  @nrCaja_param=@nrCaja_param
	
	select  @vlSumaRetencionIVA = vlSumaPesos from #temp_SaldoComisiones

	-------------------------------------------------------------------------------------------
	--- INICIO - obtencion del saldo de las cajas imputadas 
	declare @vlSumaCierrePesos   as float
	declare @vlSumaCierreDolares as float
	declare @vlSumaCierreEuros   as float
	declare @vlSumaDiferenciaDeCierre   as float
	
	CREATE TABLE #temp_CajasPuestosImputadas (
		vlSumaCierrePesos  [float] NULL ,
		vlSumaCierreDolares [float] NULL , 
		vlSumaCierreEuros  [float] NULL ,
		vlSumaDiferenciaDeCierre [float] NULL 
	) 



	--- verificamos si la caja es abierta o cerrada
	if @flestado=0
	begin
	        -- obtenemos las cajas imputadas  - ---- agregar logica para obtener  la sumatorio de los saldos sin tener en cuenta la desimputaciones de cajas puestos
		insert into #temp_CajasPuestosImputadas exec SP_obtenerCajasPuestosImputadas_v3_2  @nrCaja_param=@nrCaja_param,@flSumatorio_param=1
	
		select	 @vlSumaCierrePesos=isnull(vlSumaCierrePesos,0),
			 @vlSumaCierreDolares =isnull(vlSumaCierreDolares,0),
			 @vlSumaCierreEuros =isnull(vlSumaCierreEuros,0),
			 @vlSumaDiferenciaDeCierre =isnull(vlSumaDiferenciaDeCierre,0)
		from #temp_CajasPuestosImputadas
		--- FIN - obtencion del saldo de las cajas imputadas 
		update tb_cajas
		set 
			vlSumaCajasPuestosCierrePesos = @vlSumaCierrePesos,
			vlSumaCajasPuestosCierreDolares = @vlSumaCierreDolares,
			vlSumaCajasPuestosCierreEuros = @vlSumaCierreEuros,
			vlSumaCajasPuestosDiferencia = @vlSumaDiferenciaDeCierre
		where nrCaja = @nrCaja_param
	end
	else
	begin
		select	 @vlSumaCierrePesos= @vlSumaCajasPuestosCierrePesos,
			 @vlSumaCierreDolares = @vlSumaCajasPuestosCierreDolares,
			 @vlSumaCierreEuros = @vlSumaCajasPuestosCierreEuros,
			 @vlSumaDiferenciaDeCierre = @vlSumaCajasPuestosDiferencia
		-- print '@flestado=1 caja cerrada Entra por la logica de else'
	end 
	-------------------------------------------------------------------------------------------


	-------------------------------------------------------------------------------------------
	--- INICIO - obtencion del saldo de las cajas Desimputadas 
	declare @vlSumaCierrePesosDesimputado          as float
	declare @vlSumaCierreDolaresDesimputado        as float
	declare @vlSumaCierreEurosDesimputado          as float
	declare @vlSumaDiferenciaDeCierreDesimputado   as float
	
	CREATE TABLE #temp_CajasPuestosDesImputadas (
		vlSumaCierrePesos  [float] NULL ,
		vlSumaCierreDolares [float] NULL , 
		vlSumaCierreEuros  [float] NULL ,
		vlSumaDiferenciaDeCierre [float] NULL 
	) 

        -- obtenemos las cajas imputadas 
	insert into #temp_CajasPuestosDesImputadas exec SP_obtenerCajasPuestosImputadasyDesImputadas_v3_2  @nrCaja_param=@nrCaja_param,@flSumatorio_param=1

	select	 @vlSumaCierrePesosDesimputado = vlSumaCierrePesos,
		 @vlSumaCierreDolaresDesimputado = vlSumaCierreDolares,
		 @vlSumaCierreEurosDesimputado = vlSumaCierreEuros,
		 @vlSumaDiferenciaDeCierreDesimputado = vlSumaDiferenciaDeCierre
	from #temp_CajasPuestosDesImputadas
	--- FIN - obtencion del saldo de las cajas imputadas 
	-------------------------------------------------------------------------------------------


	SELECT a.tpOperacion, a.nrCaja, b.tpCajaImputacion, a.dsConcepto, SUM(vlPesos) 
		AS SumaPesos, SUM(vlDolares) AS SumaDolares, 
		SUM(vlEuros) AS SumaEuros into  #tmp_ResumenCajaADM_SinPesificar
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
	where	a.cdConcepto = b.cdConcepto      and
		    (
				 (@tpCaja_param='CC'  and b.flSumaenCajaCooperativa=1 and b.flOcultadoCajaCooperativa=0) or			 
				 (@tpCaja_param='CL'  and b.flSumaenCajaLicenciatarios=1 and b.flOcultadoCajaLicenciatario=0) or
				 (@tpCaja_param='CA'  and b.flSumaenCajaAdm=1 and b.flOcultadoenCajaAdm=0) 
		    )
			and a.nrCaja =  @nrCaja_param 
			and (b.tpCajaImputacion= @tpCajaImputacion_param or @tpCajaImputacion_param is null)
	GROUP BY a.tpOperacion, a.nrCaja, a.dsConcepto,  b.tpCajaImputacion



	-- Agregar valor de comisiones
	SELECT  c.nmNombre, 
		c.nmApellido, 
		a.tpOperacion, 
		a.nrCaja, 
		a.dsConcepto, 
		a.SumaPesos, 
		a.SumaDolares, 
		a.SumaEuros, 
		Convert (varchar,b.dtApertura,103) as  'dtApertura',
	        @vlSaldoInicialPesos   as 'vlSaldoInicialPesos',
	        @vlSaldoInicialDolares as 'vlSaldoInicialDolares',
	        @vlSaldoInicialEuros   as 'vlSaldoInicialEuros',
		b.vlSaldoFinalRealPesos, 
		b.vlSaldoFinalRealEuros, 
		b.vlSaldoFinalRealDolares, 
		b.vlCierrePesos, 
		b.vlCierreDolares, 
		b.vlCierreEuros, 
		@vlSaldoCierrePesos + @vlSaldoInicialPesos as 'vlTotalSaldoFinalReal', 
		@vlSaldoCierrePesos as 'vlTotalSaldoFinal', 
		b.vlDiaDolar, 
		b.vlDiaEuro, 
		b.dsObservacion,
		Convert (varchar,b.dtObservacion,103) as  'dtObservacion',
		isnull(@vlSaldoPesosComision,0)   as 'vlSaldoPesosComision',
		isnull(@vlSaldoDolaresComision,0) as 'vlSaldoDolaresComision',
	 	isnull(@vlSaldoEurosComision,0)   as 'vlSaldoEurosComision',
		@vlSumaCierrePesos      as 'vlSumaCajasPuestosCierrePesos',
	 	@vlSumaCierreDolares    as 'vlSumaCajasPuestosCierreDolares',
	 	@vlSumaCierreEuros      as 'vlSumaCajasPuestosCierreEuros',
		@vlSumaDiferenciaDeCierre as 'vlSumaCajasPuestosDiferenciaDeCierre',
	 	(0)   as 'vlSaldoPesosComisionDesimputaciones' ,
		(0)   as 'vlSaldoDolaresComisionDesimputaciones',  
		(0)   as 'vlSaldoEurosComisionDesimputaciones',
                isnull(@vlSumaCierrePesosDesimputado,0) as 'vlSumaCierrePesosDesimputado',
		isnull(@vlSumaCierreDolaresDesimputado,0) as 'vlSumaCierreDolaresDesimputado',
		isnull(@vlSumaCierreEurosDesimputado,0) as 'vlSumaCierreEurosDesimputado',
		isnull(@vlSumaDiferenciaDeCierreDesimputado,0) as 'vlSumaDiferenciaDeCierreDesimputado',
		@vlSumaRetencionIVA as 'vlSumaRetencionIVA'
	FROM #tmp_ResumenCajaADM_SinPesificar a, tb_cajas b, TB_Usuarios c
	WHERE   a.nrCaja    = b.nrCaja and
		b.dsUsuario = c.dsUsuario
	ORDER BY a.tpOperacion asc

end

go 

/*
exec SP_rpt_resumendecajaadm_v3_2
						@nrCaja_param=9000001103,
						@tpCaja_param='CA',
						@tpCajaImputacion_param=null
*/

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_obtenerCajasPuestosImputadas_v3_2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_obtenerCajasPuestosImputadas_v3_2]


go

-- store procedure para para obtener en las cajas puestos en la caja diara de la administración 
create procedure [dbo].[SP_obtenerCajasPuestosImputadas_v3_2] (@nrCaja_param numeric, @flSumatorio_param as int=0)
as
begin

declare @nombre     varchar(50)
declare @apellido   varchar(50)
declare @dtApertura varchar(50)
declare @dtCierre   varchar(50)

		select 	@nombre   = b.nmNombre,
   			@apellido = b.nmApellido,
			@dtApertura = CONVERT(VARCHAR,a.dtApertura,103),
			@dtCierre   = CONVERT(VARCHAR,a.dtCierre,103)
		from    tb_Cajas a, TB_Usuarios b
		where   a.dsUsuario = b.dsUsuario and
			a.nrCaja    = @nrCaja_param

	SELECT 
		[nrCajaAdm],
		[nrCaja] as nrCajaPuesto ,
		[vlCierrePesos],
		[vlCierreDolares],
		[vlCierreEuros],
		[vlDiferenciaDeCierre],
		[tpAccion],
		[dsObservacion] 
	into #tmpCajaPuestosImputadas
	FROM TB_ValoresDesimputacionesCajasPuestos
		where	nrCajaAdm=@nrCaja_param and tpAccion='Imputación'  and esCajaActual=1


	if @flSumatorio_param=0
		select  @nrCaja_param as nrCaja,
			b.nrCajaPuesto,
			c.nmNombre, 
			c.nmApellido, 
			b.vlCierrePesos,
			b.vlCierreDolares,
			b.vlCierreEuros,
			a.dsDiferenciaDeCierre,
			a.vlDiferenciaDeCierre,
			a.vlDiaEuro,
			a.vlDiaDolar,
			b.tpAccion,
			@dtApertura as  dtApertura,
			@dtCierre   as  dtCierre
		from    tb_Cajas a, #tmpCajaPuestosImputadas b, TB_Usuarios c
		where   a.nrCaja = b.nrCajaPuesto and
			a.dsUsuario = c.dsUsuario
			order by nrCajapuesto asc, tpAccion desc 
	else
		select  isnull(sum(a.vlCierrePesos),0)        as vlSumaCierrePesos,
			isnull(sum(a.vlCierreDolares),0)      as vlSumaCierreDolares,
			isnull(sum(a.vlCierreEuros),0)        as vlSumaCierreEuros,
			isnull(sum(a.vlDiferenciaDeCierre),0) as vlSumaDiferenciaDeCierre
		from   #tmpCajaPuestosImputadas a 						


end

go

exec SP_obtenerCajasPuestosImputadas_v3_2 @nrCaja_param=9000001139,@flSumatorio_param=0


go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_obtenerCajasPuestosDesImputadas_v3_2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_obtenerCajasPuestosDesImputadas_v3_2]

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_obtenerCajasPuestosImputadasyDesImputadas_v3_2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_obtenerCajasPuestosImputadasyDesImputadas_v3_2]

go 


PRINT 'FALTA TERMINAR SP_obtenerCajasPuestosImputadasyDesImputadas_v3_2 @flSumatorio_param = 0 '

go

-- store procedure para para obtener en las cajas puestos en la caja diara de la administración 
create procedure [dbo].[SP_obtenerCajasPuestosImputadasyDesImputadas_v3_2] (@nrCaja_param numeric, @flSumatorio_param as int=0)
as
begin
declare @nombre   varchar(50)
declare @apellido varchar(50)
declare @dtApertura varchar(50)
declare @dtCierre   varchar(50)
declare @vlDiaDolar float
declare @vlDiaEuro  float

		select 	@nombre   = b.nmNombre,
   				@apellido = b.nmApellido,
				@dtApertura = CONVERT(VARCHAR,a.dtApertura,103),
				@dtCierre   = CONVERT(VARCHAR,a.dtCierre,103),
				@vlDiaDolar = a.vlDiaDolar, 
				@vlDiaEuro =  a.vlDiaEuro
		from    tb_Cajas a, TB_Usuarios b
		where   a.dsUsuario = b.dsUsuario and
			    a.nrCaja  = @nrCaja_param

	select  nrCaja as nrCajaPuesto,
	        vlCierrePesos,
		vlCierreDolares,
	        vlCierreEuros,
	        vlDiferenciaDeCierre,
		tpAccion,
		dsObservacion,
		nrCajaAdm,
		esCajaActual
	into #tmp_ValoresDesimputacionesCajasPuestos
	from TB_ValoresDesimputacionesCajasPuestos
	where nrCajaAdm=@nrCaja_param

	if @flSumatorio_param=0
	begin
		select 
			a.nrCajaPuesto,
		        a.vlCierrePesos,
			a.vlCierreDolares,
		        a.vlCierreEuros,
		        a.vlDiferenciaDeCierre,
			a.tpAccion,
			a.dsObservacion,
			@nombre as nmNombre, 
			@apellido as nmApellido, 
			@dtApertura as  dtApertura,
			@dtCierre   as  dtCierre,
			@vlDiaDolar as vlDiaDolar, 
			@vlDiaEuro as vlDiaEuro,
			c.nmNombre as nmNombre_cp, 
			c.nmApellido as nmApellido_cp,
			nrCajaAdm as nrCaja,
			esCajaActual
		from  #tmp_ValoresDesimputacionesCajasPuestos a, TB_Cajas b, TB_Usuarios c
		where a.nrCajaPuesto = b.nrCaja  and
			  b.dsUsuario = c.dsUsuario
		order by  esCajaActual desc, a.nrCajaPuesto asc, tpAccion asc
	end
	else
	begin

		--- eliminamos aquellas que son solamente imputaciones
		delete a from #tmp_ValoresDesimputacionesCajasPuestos a
		where  esCajaActual=1

		select  - vlCierrePesos as vlCierrePesos,
			- vlCierreDolares as vlCierreDolares,
		        - vlCierreEuros as vlCierreEuros,
		        - vlDiferenciaDeCierre as vlDiferenciaDeCierre
		into #tmp_al_desimputar_imputar
		from #tmp_ValoresDesimputacionesCajasPuestos
		where tpAccion='Desimputación';

		insert into  #tmp_al_desimputar_imputar
		select  vlCierrePesos,
		        vlCierreDolares,
		        vlCierreEuros,
		        vlDiferenciaDeCierre
		from #tmp_ValoresDesimputacionesCajasPuestos
		where tpAccion='Imputación'
		
		select     isnull(SUM(vlCierrePesos),0) as vlCierrePesos,
			   isnull(SUM(vlCierreDolares),0) as vlCierrePesos ,
			   isnull(SUM(vlCierreEuros),0) as vlCierreEuros,
			   isnull(SUM(vlDiferenciaDeCierre),0) as vlDiferenciaDeCierre
		from #tmp_al_desimputar_imputar
		
	end

end


go


Exec SP_obtenerCajasPuestosImputadasyDesImputadas_v3_2 9000001139,0



go 

--declare @vlSumaRetencionIVA float
	
--	select   dbo.ufn_obtenerRetencionesIVA_v3_2 (9000001123)



go



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_realizarReaperturadelaCajaPuesto_v3_2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_realizarReaperturadelaCajaPuesto_v3_2]

go


create procedure SP_realizarReaperturadelaCajaPuesto_v3_2
		       (@pnrCaja_param numeric,
			@pdsUsuario_param as varchar(50),
		        @pdsUsuario_Supervisor_param as varchar(50))
as
begin
declare @error as varchar(700)
declare @nrCierre as integer

	begin tran t1

	create table #tmp_respuesta_sp(Resultado char(2),descripcion varchar(700), dsEstado varchar(20)); 

	-- verificamos si el usuario puede realizar la reapertura de la caja-puesto
	INSERT INTO #tmp_respuesta_sp Exec SP_puedeOperarUsuarioCajaPuesto_v3_2 @pnrCaja_param = @pnrCaja_param ,@pdsUsuario_param = @pdsUsuario_param

	

	if (select Resultado from #tmp_respuesta_sp)='NO'
	begin
		rollback tran t1
		select @error=descripcion from #tmp_respuesta_sp;
		RAISERROR (@error, -- Message text.
                16, -- Severity.
	        1); -- State.  Controlar que rompa con la transacción
		return; 
	end 
	
	if (select dsEstado from #tmp_respuesta_sp)='CERRADA' 
	begin
		/* Averiguar cual fue el ultimo numero de cierre ir a TB_CajasPuestosCierres */
		select @nrCierre=count(*)+1 from TB_CajasPuestosCierres
		WHERE   nrcaja=@pnrCaja_param 

		/* Grabar el nuevo cierre */
		INSERT  INTO  TB_CajasPuestosCierres (
			[nrCaja], 
			[nrCierre], 
			[nrPuesto], 
			[dsUsuario], 
			[dtApertura], 
			[dtCierre], 
			[hrApertura], 
			[hrCierre], 
			[flEstado], 
			[flCajaAdm], 
			[vlSaldoInicialPesos], 
			[vlSaldoInicialDolares], 
			[vlSaldoInicialEuros], 
			[vlDiaDolar], 
			[vlDiaEuro], 
			[vlSaldoFinalPesos], 
			[vlSaldoFinalDolares], 
			[vlSaldoFinalEuros], 
			[vlSaldoFinalRealPesos], 
			[vlSaldoFinalRealEuros], 
			[vlSaldoFinalRealDolares], 
			[vlCierrePesos], 
			[vlCierreDolares], 
			[vlCierreEuros], 
			[vlTotalSaldoFinalReal], 
			[vlTotalSaldoFinal], 
			[vlTotalSaldoInicial], 
			[vlTotalSaldoCierre], 
			[dsDiferenciaDeCierre], 
			[vlDiferenciaDeCierre], 
			[dsObservacion], 
			[dtObservacion], 
			[dsUsuario_Supervisor], 
			[dtActualizacion], 
			[flSincronizado])
		 SELECT [nrCaja], 
	     	        @nrCierre,
			[nrPuesto], 
			[dsUsuario], 
			[dtApertura], 
			[dtCierre], 
			[hrApertura], 
			[hrCierre], 
			[flEstado], 
			[flCajaAdm],
			[vlSaldoInicialPesos], 
			[vlSaldoInicialDolares], 
			[vlSaldoInicialEuros], 
			[vlDiaDolar], 
			[vlDiaEuro], 
			[vlSaldoFinalPesos], 
			[vlSaldoFinalDolares], 
			[vlSaldoFinalEuros], 
			[vlSaldoFinalRealPesos], 
			[vlSaldoFinalRealEuros], 
			[vlSaldoFinalRealDolares], 
			[vlCierrePesos], 
			[vlCierreDolares], 
			[vlCierreEuros], 
			[vlTotalSaldoFinalReal], 
			[vlTotalSaldoFinal], 
			[vlTotalSaldoInicial], 
			[vlTotalSaldoCierre], 
			[dsDiferenciaDeCierre], 
			[vlDiferenciaDeCierre], 
			[dsObservacion], 
			[dtObservacion], 
			[dsUsuario_Supervisor], 
			[dtActualizacion], 
			[flSincronizado]
		FROM TB_Cajas 
		WHERE   nrcaja=@pnrCaja_param 
		if @@error<>0 
		begin 
			rollback tran t1
			set @error='no se pudo insertar el cierre de la caja'
			RAISERROR (@error,16,1);
			return;
		end 

		/* Marcar la caja como abierta en la tabla tb_caja 
		actualizamos el usuario tb_cajas.dsUsuario con quien la esta modificando actualmente 
		ver si no conviene agregar un usuario de creación y un usuario de actualización */

	
		update tb_cajas
		set [flEstado]=0, -- abrimos la caja
		     dsUsuarioReapertura = @pdsUsuario_param,
		    [dsUsuario_Supervisor]=@pdsUsuario_Supervisor_param, -- seteamos el usuario autorizador
		    [dtActualizacion]=getdate(), -- actualizamos al fecha
	 	    tpEstadoAprobacion='Modificando', /* Pendiente /  Aprobada / Rechazada  */
		    dtEstadoAprobacion=getdate()
		where nrCaja = @pnrCaja_param

		if @@error<>0 
		begin 
			rollback tran t1
			set @error='no se pudo actualizar el nuevo estado de la caja'
			RAISERROR (@error,16,1);
			return;
		end 

	end /* cierre si la caja esta CERRADA  */
	else 
	begin /* si la caja esta abierta */

		update tb_cajas
		set [dsUsuario_Supervisor]=@pdsUsuario_Supervisor_param, -- seteamos el usuario autorizador
		    [dtActualizacion]=getdate() -- actualizamos al fecha
		where nrCaja = @pnrCaja_param	
	
		if @@error<>0 
		begin 
			rollback tran t1
			set @error='no se pudo actualizar el nuevo estado de la caja'
			RAISERROR (@error,16,1);
			return;
		end 
	end
	commit tran t1
	
end




go

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_puedeOperarUsuarioCajaPuesto_v3_2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_puedeOperarUsuarioCajaPuesto_v3_2]

go


create  procedure SP_puedeOperarUsuarioCajaPuesto_v3_2(@pnrCaja_param numeric, @pdsUsuario_param as varchar(50))
as
begin

--declare @pnrCaja_param as numeric
--declare @pdsUsuario_param as varchar(20)
--set @pnrCaja_param=2000000374
--set @pdsUsuario_param='ROMA' 


declare @dsUsuario as varchar(20)
declare @flEstado as varchar(20)
declare @tpEstadoAprobacion varchar(50)
declare @dsUsuario_Origen varchar(50)
declare @flImputado       integer

	--obtener los cierre anterior
	SELECT  a.* into #tmp_Cajas
	FROM   TB_Cajas a	
	WHERE  a.nrcaja=@pnrCaja_param



	select @flEstado=flEstado, @dsUsuario_Origen=dsUsuario, 
	       @dsUsuario=dsUsuarioReapertura, @tpEstadoAprobacion=tpEstadoAprobacion,
	       @flImputado=flImputado
	from #tmp_Cajas	
	
	if @flImputado=1
	begin
		select  'NO' as Resultado, 'La caja esta se encuentra imputada, para realizar cambios debe desimputar la misma' as 'descripcion', 'Imputada'  as 'dsEstado'
		return;
	end 

	-- verificamos le estado de la caja
	if (@flEstado)=1 
	begin

		-- sabemos que la caja esta abierta, verificamos el usuario en cuestion
		if @dsUsuario_Origen=@pdsUsuario_param
		begin
			-- La caja se encuentra abierta por otro usuario
			select  'NO' as Resultado, 'Un usuario de la caja puesto no puede modificar la caja.' as 'descripcion','CERRADA' as 'dsEstado'
			return;
		end
		-- La caja se encuentra cerrada
		select  'SI' as Resultado, 'La caja esta cerrada, último usuario ' + @dsUsuario as 'descripcion', 'CERRADA' as 'dsEstado'
		return;
	end  

	-- sabemos que la caja esta abierta, verificamos el usuario en cuestion
	if @pdsUsuario_param<>@dsUsuario
	begin
		-- La caja se encuentra abierta por otro usuario
		select  'NO' as Resultado, 'La caja esta en uso por el usuario ''' + @dsUsuario +''', no puede realizar cambios hasta que el usuario cierre la misma.' as 'descripcion', 'ABIERTA'  as 'dsEstado'
		return;
	end



	select  'SI' as Resultado, 'La caja esta abierta por el usuario ' + @dsUsuario as 'descripcion', 'ABIERTA'  as 'dsEstado'
	
end



go


/*

begin tran

Exec SP_realizarReaperturadelaCajaPuesto_v3_2 @pnrCaja_param = 2000002245 ,@pdsUsuario_param = 'ROMA' ,@pdsUsuario_Supervisor_param = 'USRPARAM' 

begin tran


Exec SP_puedeOperarUsuarioCajaPuesto_v2_5 @pnrCaja_param =  2000002245 ,@pdsUsuario_param =  'ROMA' 

rollback tran

*/


exec SP_rpt_resumendecajaadm_v3_2   	@nrCaja_param = 9000001129,
					@tpCaja_param = 'CA',
					@tpCajaImputacion_param=null






go



-- obtener los distintos cierres de la caja-puesto
alter    procedure  sco_obtenerCierresCajaPuesto_v2_5
@nrCaja_param  numeric
as
begin
declare @nrCierre  numeric

	--obtener los cierre anterior
	SELECT  a.[nrCaja], 
		'Cierre '+ convert(varchar, nrCierre) as dsCierre, 
		a.[nrPuesto], 
		a.[dsUsuario], 
		a.[dtApertura], 
		a.[dtCierre], 
		a.[hrApertura], 
		a.[hrCierre], 
		a.[flEstado], 
		a.[flCajaAdm], 
		a.[vlSaldoInicialPesos], 
		a.[vlSaldoInicialDolares], 
		a.[vlSaldoInicialEuros], 
		a.[vlDiaDolar], 
		a.[vlDiaEuro], 
		a.[vlSaldoFinalPesos], 
		a.[vlSaldoFinalDolares], 
		a.[vlSaldoFinalEuros], 
		a.[vlSaldoFinalRealPesos], 
		a.[vlSaldoFinalRealEuros], 
		a.[vlSaldoFinalRealDolares], 
		a.[vlCierrePesos], 
		a.[vlCierreDolares], 
		a.[vlCierreEuros], 
		a.[vlTotalSaldoFinalReal], 
		a.[vlTotalSaldoFinal], 
		a.[vlTotalSaldoInicial], 
		a.[vlTotalSaldoCierre], 
		a.[dsDiferenciaDeCierre], 
		a.[vlDiferenciaDeCierre], 
		a.[dsObservacion], 
		a.[dtObservacion], 
		a.[dsUsuario_Supervisor], 
		a.[dtActualizacion], 
		a.[flSincronizado], 
		a.[dtFecha], 
		a.[nrHora], 
		a.[dtInsercion],
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros
		into #tmp_CajasPuestosCierres
	FROM TB_CajasPuestosCierres a
	WHERE   a.nrcaja=@nrCaja_param 

	
	select @nrCierre=count(*)+1  from #tmp_CajasPuestosCierres

	INSERT  INTO  #tmp_CajasPuestosCierres (
		[nrCaja], 
		[dsCierre], 
		[nrPuesto], 
		[dsUsuario], 
		[dtApertura], 
		[dtCierre], 
		[hrApertura], 
		[hrCierre], 
		[flEstado], 
		[flCajaAdm], 
		[vlSaldoInicialPesos], 
		[vlSaldoInicialDolares], 
		[vlSaldoInicialEuros], 
		[vlDiaDolar], 
		[vlDiaEuro], 
		[vlSaldoFinalPesos], 
		[vlSaldoFinalDolares], 
		[vlSaldoFinalEuros], 
		[vlSaldoFinalRealPesos], 
		[vlSaldoFinalRealEuros], 
		[vlSaldoFinalRealDolares], 
		[vlCierrePesos], 
		[vlCierreDolares], 
		[vlCierreEuros], 
		[vlTotalSaldoFinalReal], 
		[vlTotalSaldoFinal], 
		[vlTotalSaldoInicial], 
		[vlTotalSaldoCierre], 
		[dsDiferenciaDeCierre], 
		[vlDiferenciaDeCierre], 
		[dsObservacion], 
		[dtObservacion], 
		[dsUsuario_Supervisor], 
		[dtActualizacion], 
		[flSincronizado],
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros)
	 SELECT [nrCaja], 
     	        'dsCierre'=CASE flEstado
	        WHEN 1 THEN 'Cierre '+ convert(varchar,@nrCierre)
	        WHEN 0 THEN 'Saldo Abierto'
	        END,
		[nrPuesto], 
		[dsUsuario], 
		[dtApertura], 
		[dtCierre], 
		[hrApertura], 
		[hrCierre], 
		[flEstado], 
		[flCajaAdm],
		[vlSaldoInicialPesos], 
		[vlSaldoInicialDolares], 
		[vlSaldoInicialEuros], 
		[vlDiaDolar], 
		[vlDiaEuro], 
		[vlSaldoFinalPesos], 
		[vlSaldoFinalDolares], 
		[vlSaldoFinalEuros], 
		[vlSaldoFinalRealPesos], 
		[vlSaldoFinalRealEuros], 
		[vlSaldoFinalRealDolares], 
		[vlCierrePesos], 
		[vlCierreDolares], 
		[vlCierreEuros], 
		[vlTotalSaldoFinalReal], 
		[vlTotalSaldoFinal], 
		[vlTotalSaldoInicial], 
		[vlTotalSaldoCierre], 
		[dsDiferenciaDeCierre], 
		[vlDiferenciaDeCierre], 
		[dsObservacion], 
		[dtObservacion], 
		[dsUsuario_Supervisor], 
		[dtActualizacion], 
		[flSincronizado],
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros
	FROM TB_Cajas 
	WHERE   nrcaja=@nrCaja_param 

	select 	a.[dsCierre], 
		a.[vlSaldoInicialPesos], 
		a.[vlSaldoInicialDolares], 
		a.[vlSaldoInicialEuros], 
		a.[vlDiaDolar], 
		a.[vlDiaEuro], 
		a.[vlSaldoFinalPesos], 
		a.[vlSaldoFinalDolares], 
		a.[vlSaldoFinalEuros], 
		/* saldo final de la operadora */ 
		isnull(a.[vlSaldoFinalRealPesos],0) as 'vlSaldoFinalRealPesos', 
		isnull(a.[vlSaldoFinalRealEuros],0) as 'vlSaldoFinalRealEuros', 
		isnull(a.[vlSaldoFinalRealDolares],0) as 'vlSaldoFinalRealDolares', 
		a.[vlCierrePesos], 
		a.[vlCierreDolares], 
		a.[vlCierreEuros], 
		a.[vlTotalSaldoFinalReal], 
		a.[vlTotalSaldoFinal], 
		a.[vlTotalSaldoInicial], 
		a.[vlTotalSaldoCierre], 
		a.[vlDiferenciaDeCierre], 
		isnull(a.[dsDiferenciaDeCierre],'')+' '+ isnull(a.[dsObservacion],'') as 'dsDiferenciaDeCierre',
		-- Para la administración = Saldo Operadora - Fondo de la caja
		dbo.f_positivoValorNegativoCero_2_5(a.[vlSaldoFinalRealPesos] - a.[vlSaldoInicialPesos]) as 'vlSaldoAdmPesos',
		dbo.f_positivoValorNegativoCero_2_5( a.[vlSaldoFinalRealDolares] - a.[vlSaldoInicialDolares]) as 'vlSaldoAdmDolares',
		dbo.f_positivoValorNegativoCero_2_5(a.[vlSaldoFinalRealEuros] - a.[vlSaldoInicialEuros]) as 'vlSaldoAdmEuros',
		-- paso el saldo de la operadora a pesos
		dbo.f_positivoValorNegativoCero_2_5(dbo.f_pesificarValores_2_5(a.[vlSaldoFinalRealPesos], a.[vlSaldoFinalRealDolares],
                                           a.[vlSaldoFinalRealEuros], a.[vlDiaDolar], a.[vlDiaEuro]) - 
		-- paso el fondo fijo a pesos
		dbo.f_pesificarValores_2_5(a.[vlSaldoInicialPesos], a.[vlSaldoInicialDolares],
                                           a.[vlSaldoInicialEuros], a.[vlDiaDolar], a.[vlDiaEuro])) as 'vlSaldoAdmPesificado',
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros
	 from #tmp_CajasPuestosCierres a
	 order by dsCierre asc


end 

go 


Exec sco_obtenerCierresCajaPuesto_v2_5 @nrCaja_param = 3000000033 

go 



/*************************************************************/
/* creado en la version 1.5				     */
/* Falta terminar este store				     */
ALTER PROCEDURE [dbo].[SP_rpt_PagoLicenciatario_v1_5] @IdRecibo_param numeric
AS
declare @flAnulado int

set dateformat dmy

	select @flAnulado=0

	select * into  #tmp_recibos
	from   TB_Recibos
	where  IdRecibo = @IdRecibo_param


        select  @flAnulado=flAnulado  from #tmp_recibos  where  IdRecibo = @IdRecibo_param

	if @flAnulado=0
		select  TB_Cupones.dsDestino,
	            TB_Cupones.nrLicencia,
	            TB_Cupones.nmLicenciatario,
	            TB_Cupones.vlPagoPesos,
	            TB_Cupones.vlPagoEuros,
	            TB_Cupones.vlPagoDolares,
		    TB_Cupones.vlComision,
	            Convert(varchar,TB_Cupones.dtCupon,103) as dtCupon,
		    TB_Cupones.dsHoraViaje,
	            TB_Cupones.vlComision + isnull(TB_Cupones.vlIVA,0) as vlRetencion,
	            TB_Cupones.vlIVA,
	            TB_Cupones.nrTalonarioCliente,
	            TB_Cupones.nrComprabanteCliente,
	            a.IdRecibo,
	            a.vlAcumDolares,
	            a.vlSaldoPesos,
	            a.vlSaldoEuros,
	            a.vlAcumPesos,
	            a.vlAcumEuros,
	            a.vlAcumComision,
	            a.vlSaldoDolares,
	            Convert(varchar,a.dtRecibo,103) +' '+
	            Convert(varchar,a.dtRecibo,108) as  dtRecibo,
		        a.flAnulado
		from #tmp_recibos a, TB_Cupones
		WHERE
		       a.IdRecibo = @IdRecibo_param and
		       TB_Cupones.IdRecibo = a.IdRecibo

	else
		select  
	            b.dsDestino,
	            b.nrLicencia,
	            b.nmLicenciatario,
	            b.vlPagoPesos,
	            b.vlPagoEuros,
	            b.vlPagoDolares,
	            b.vlComision,
	            b.nrTalonarioCliente,
	            b.nrComprabanteCliente,
	            b.vlComision +isnull(b.vlIVA,0)  as vlRetencion,
	            b.vlIVA,
	            Convert(varchar,b.dtCupon,103) as dtCupon,
		    b.dsHoraViaje,
	            c.IdRecibo,
	            c.vlAcumDolares,
	            c.vlSaldoPesos,
	            c.vlSaldoEuros,
	            c.vlAcumPesos,
	            c.vlAcumEuros,
	            c.vlAcumComision,
	            c.vlSaldoDolares,
	            Convert(varchar,c.dtRecibo,103)+' '+
	            Convert(varchar,c.dtRecibo,108) as  dtRecibo,
		    c.flAnulado
		from  #tmp_recibos c, TB_RecibosDetalle b
		WHERE
		    c.IdRecibo = @IdRecibo_param and
		    b.IdRecibo = c.IdRecibo 


	
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_versionreporte_v3_2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_versionreporte_v3_2]

go

-- obtener los distintos cierres de la caja-puesto
create   procedure  sp_versionreporte_v3_2
@dtFechaOperacion  as datetime=null
as
begin

	set dateformat dmy 

	if DB_NAME() ='dbSG2000_Pruebas'
	begin
		select 'v3_2' as version
		return
	end
	

	if @dtFechaOperacion is null
	begin
		select 'v3_2' as version
		return
	end
	
	if @dtFechaOperacion>='16/02/2010 00:00:00.000' 
		select 'v3_2' as version
	else
		select 'v3_1' as version


end

go 

Exec sp_versionreporte_v3_2 @dtFechaOperacion = null 

go
