-- cambios de DDL version 1.4
use dbSG2000_Pruebas
go


-- MSSQL version 1.4
ALTER TABLE [dbo].[tb_puestos] ADD 

  nrTalonario_manual_empresa int default NULL,
  nrTalonario_manual_ctacte int default NULL,
  nrComprobante_manual_empresa_ult int default NULL,
  nrComprobante_manual_ctacte_ult int default NULL,
  tpLetraEmpresa char(10) default NULL,
  tpLetraRecibo char(10) default NULL;

go

ALTER TABLE [dbo].[tb_puestos] ADD 
	nrTalonario_auto_empresa int default NULL,
	nrTalonario_auto_ctacte int default NULL,
	nrComprobante_auto_ctacte_ult int default NULL,
	nrComprobante_auto_empresa_ult int default NULL


ALTER TABLE [dbo].[tb_puestos] ADD
	tpLetraEmpresa_manual char(10) default NULL,
	tpLetraRecibo_manual char(10) default NULL;

go 

ALTER TABLE [dbo].[tb_puestos] ADD
	tpletra_manual  char(10)  NULL;
	
go

create procedure SP_ObtenerMaxnrPuesto
as
begin
	
	select max(nrPuesto) as nrPuesto from TB_Puestos
	where nrPuesto<9
end 

go 


ALTER TABLE [dbo].[diccionariodedatos] ADD 
	  vlPuesto varchar(50) default NULL;

go


/****************************************************/
/* Creado Sistema EXE  V2			    */
alter procedure dbo.sco_DiccionariodeDatos
@nmtabla_param as varchar(60)
as
begin

	select  idCampo,
		nmTabla,
		nmCampo,
		nmCampoExterno,
		tpTipo,
		nrTamanio,
		flClave,
		flBusqueda , 
		vlPuesto1,
		vlPuesto2, 
		vlPuesto3, 
		vlPuesto4, 
		vlPuesto5, 
		vlPuesto9,
		vlPuesto
	From DiccionariodeDatos 
	where nmTabla = @nmtabla_param
	Order by nmTabla, nrOrdenBusqueda 

end

go

DROP VIEW dbo.VWCajasPuestosdesdelosPuetos;

go

CREATE VIEW dbo.VWCajasPuestosdesdelosPuetos
AS
SELECT TB_Cajas.nrCaja, TB_Cajas.nrPuesto, 
    TB_Cajas.dsUsuario, TB_Cajas.dtApertura, TB_Cajas.dtCierre, 
    TB_Cajas.hrApertura, TB_Cajas.hrCierre, TB_Cajas.flEstado, 
    TB_Cajas.flCajaAdm, TB_Cajas.vlSaldoInicialPesos, 
    TB_Cajas.vlSaldoInicialDolares, 
    TB_Cajas.vlSaldoInicialEuros, TB_Cajas.vlDiaDolar, 
    TB_Cajas.vlDiaEuro, TB_Cajas.vlSaldoFinalPesos, 
    TB_Cajas.vlSaldoFinalDolares, TB_Cajas.vlSaldoFinalEuros, 
    TB_Cajas.vlSaldoFinalRealPesos, 
    TB_Cajas.vlSaldoFinalRealEuros, 
    TB_Cajas.vlSaldoFinalRealDolares, TB_Cajas.vlCierrePesos, 
    TB_Cajas.vlCierreDolares, TB_Cajas.vlCierreEuros, 
    TB_Cajas.vlTotalSaldoFinalReal, TB_Cajas.vlTotalSaldoFinal, 
    TB_Cajas.dsDiferenciaDeCierre, 
    TB_Cajas.vlDiferenciaDeCierre, 
    TB_Usuarios.tpAcceso,
    TB_Cajas.flSincronizado
FROM dbo.TB_Cajas INNER JOIN
    dbo.TB_Usuarios ON 
    dbo.TB_Cajas.dsUsuario = dbo.TB_Usuarios.dsUsuario
WHERE dbo.TB_Cajas.nrCaja IN
        (SELECT TOP 30 TB_Cajas.nrCaja
      FROM TB_Cajas
      ORDER BY dtApertura DESC)


go 

create procedure sco_Puestos_v1_4
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
		tpLetraRecibo_manual 
	from TB_Puestos
	where  (nrPuesto = @nrPuesto_param OR  @nrPuesto_param is null) 
		and  (dsPuesto =@dsPuesto_param OR @dsPuesto_param is null)
	and flEliminar=0



GO

create procedure sup_Puestos_v1_4
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
@tpLetraRecibo_manual_param       	char(10)
as

	--------------------------------------------------------------
	--- Validaciones para los comprobantes automáticos
	--- AUTOMATICO: Para Consumidores Finales
	if exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_automatico=@nrTalonario_automatico_param and
			  tpLetra=@tpLetra_param)
	begin 
		raiserror ('El número de talonario automático ingresado, para Consumidor Final,  se encuentra asignado a otro puesto.',16,1)
		return -1
	end 

	--- AUTOMATICO: Para Empresas
	if exists (select * from TB_Puestos
		   where  nrPuesto <> @nrPuesto_param and 
			  nrTalonario_auto_empresa=@nrTalonario_manual_empresa_param and
			  tpLetraEmpresa=@tpLetraEmpresa_param)
	begin 
		raiserror ('El número de talonario automático ingresado, para Empresas,  se encuentra asignado a otro puesto.',16,1)
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
		raiserror ('El número de talonario manual ingresado, para Consumidores Finales, se encuentra asignado a otro puesto.',16,1)
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
		raiserror ('El número de talonario manual ingresado, para Recibos, se encuentra asignado a otro puesto.',16,1)
		return -1
	end 
	--------------------------------------------------------------


	--------------------------------------------------------------
	--- Validacion de Fin de talonario
	if @nrComprobante_manual_ult_param is not null  and @nrComprobante_manual_ult_param>99999999 
	begin
		raiserror ('El talonario ha llegado a su fin, por favor de aviso a la administración',16,1) 
		return -1 
	end
	if @nrComprobante_automatico_ult_param is not null and  @nrComprobante_automatico_ult_param>99999999 
	begin
		raiserror ('El talonario ha llegado a su fin, por favor de aviso a la administración',16,1) 
		return -1 
	end
	--------------------------------------------------------------

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
		tpLetraRecibo_manual=isnull(@tpLetraRecibo_manual_param,tpLetraRecibo_manual)
	where  nrPuesto = @nrPuesto_param

	if @@rowcount=0 
	begin
		raiserror ('No se ha localizado el puesto ingresado',16,1)
		return -1 
	end 




GO

-- Campos para el calculo del IVA
ALTER TABLE [dbo].[tb_Comprobantes] ADD 
	vlSubtotal  [float] NULL,
	vlIVA  [float] NULL;


go

CREATE PROCEDURE SP_ObtenerTalonarioMaximo_v1_4 AS
declare @nrTalonario_manual	        int 
declare @nrTalonario_manual_empresa	int 

	select @nrTalonario_manual=max(nrTalonario_manual) from TB_Puestos 
	select @nrTalonario_manual_empresa=max(nrTalonario_manual_empresa)  from TB_Puestos

	if @nrTalonario_manual>=@nrTalonario_manual_empresa 
		select @nrTalonario_manual as nrTalonarioMaximo
	else
		select @nrTalonario_manual_empresa as nrTalonarioMaximo
		
go
		

/*******************************************************************/
/* Creado para el cambio de cierre de caja solicitado por Adrian   */
alter procedure rpt_cierredecaja_v1
@nrCaja_param  numeric
as

declare @Cantidad_Viajes           int
declare @Cantidad_Facturas         int
declare @Cantidad_Facturas_A       int
declare @cantidad_cta_cte          int
declare @Cantidad_Anuladas         int 
declare @Cantidad_Contado          int 
declare @Cantidad_Retorno          int
declare @Cantidad_Cobro_en_Destino int
declare @nro_factura_inicial       varchar(12)
declare @nro_factura_final         varchar(12)
declare @nro_factura_inicial_A     varchar(12)
declare @nro_factura_final_A       varchar(12)
declare @nro_Recibo_inicial        varchar(12)
declare @nro_Recibo_final          varchar(12)



	SET @Cantidad_Viajes           = 0
	SET @Cantidad_Facturas         = 0
	SET @Cantidad_Facturas_A       = 0
	SET @cantidad_cta_cte          = 0
	SET @Cantidad_Anuladas         = 0 
	SET @Cantidad_Contado          = 0 
	SET @Cantidad_Retorno          = 0
	SET @Cantidad_Cobro_en_Destino = 0
	SET @nro_factura_inicial       = 0
	SET @nro_factura_final         = 0
	SET @nro_factura_inicial_A     = 0
	SET @nro_factura_final_A       = 0
	SET @nro_Recibo_inicial        = 0
	SET @nro_Recibo_final          = 0
	

	select  a.nrCaja,
		a.nrPuesto,
		a.dsUsuario,
		a.dtApertura,
		a.dtCierre,
		convert(varchar(5),a.dtApertura,108) as hrApertura,
		a.hrCierre, 
		a.flEstado,
		a.flCajaAdm,
		a.vlSaldoInicialPesos,
		a.vlSaldoInicialEuros,
		a.vlDiaDolar,
		a.vlDiaEuro, 
		a.vlSaldoFinalPesos,
		a.vlSaldoInicialDolares,
		a.vlSaldoFinalDolares,
		a.vlSaldoFinalEuros, 
		a.vlSaldoFinalRealPesos,
		a.vlSaldoFinalRealEuros,
		a.vlSaldoFinalRealDolares,
		a.vlCierrePesos, 
		a.vlCierreDolares,
		a.vlCierreEuros,
		a.vlTotalSaldoFinalReal,
		a.vlTotalSaldoFinal,
		a.vlTotalSaldoInicial, 
		a.vlTotalSaldoCierre,
		a.dsDiferenciaDeCierre,
		a.vlDiferenciaDeCierre,
		a.dsObservacion, 
		a.dtObservacion,
		@Cantidad_Viajes   as 'Cantidad_Viajes' ,
		@Cantidad_Contado  as 'Cantidad_Contado',
		@Cantidad_cta_cte  as 'Cantidad_cta_cte',
		@Cantidad_Retorno  as 'Cantidad_Retorno',   
		@Cantidad_Anuladas as 'Cantidad_Anuladas',
		@Cantidad_Cobro_en_Destino as 'Cantidad_Cobro_en_Destino',
		isnull(b.nmNombre,'')+' '+isnull(b.nmApellido,'') as 'Nombre_Cajera', 
		c.dsPuesto	 as 'Descripcion_Puesto',
		@nro_factura_inicial       as 'nro_factura_inicial',
		@nro_factura_final         as 'nro_factura_final',
		@nro_factura_inicial_A     as 'nro_factura_inicial_A',
		@nro_factura_final_A       as 'nro_factura_final_A',
		@nro_Recibo_inicial        as 'nro_Recibo_inicial',
		@nro_Recibo_final          as 'nro_Recibo_final'
	into #Resumen_Caja_Puesto
	from         TB_Cajas a, TB_usuarios b, TB_Puestos c
	where   (a.nrCaja = @nrCaja_param) and 
		 a.dsUsuario=b.dsUsuario   and 
		 a.nrPuesto = c.nrPuesto 
		   

	select @Cantidad_Viajes=count(*) 
	from   TB_Comprobantes 
	where  flAnulado=0 and nrCaja=@nrCaja_param
	

	select @Cantidad_Contado=count(*) 
	from   TB_Comprobantes 
	where  flAnulado=0 and nrCaja=@nrCaja_param and 
	       cdCondVenta='Contado'

	select @Cantidad_cta_cte=count(*) 
	from   TB_Comprobantes 
	where  flAnulado=0 and nrCaja=@nrCaja_param and 
	       cdCondVenta='Cuenta Corriente'

	select @Cantidad_Retorno=count(*) 
	from   TB_Comprobantes 
	where  flAnulado=0 and nrCaja=@nrCaja_param and
	       cdCondVenta='Retorno'

	select @Cantidad_Cobro_en_Destino=count(*) 
	from   TB_Comprobantes 
	where  flAnulado=0 and nrCaja=@nrCaja_param and
	       cdCondVenta='Cobro en Destino'

	select @Cantidad_Anuladas=count(*) 
	from   TB_Comprobantes 
	where  flAnulado=1 and nrCaja=@nrCaja_param 

	select @nro_factura_inicial=min(convert(numeric,nrComprobante)),
	       @nro_factura_final=max(convert(numeric,nrComprobante))
	from   TB_Comprobantes 
	where  nrCaja=@nrCaja_param and
	       tpLetra='B'


	select @nro_factura_inicial_A=min(convert(numeric,nrComprobante)),
	       @nro_factura_final_A=max(convert(numeric,nrComprobante))
	from   TB_Comprobantes 
	where  nrCaja=@nrCaja_param and
	       tpLetra='A'

	select @nro_Recibo_inicial=min(convert(numeric,nrComprobante)),
	       @nro_Recibo_final=max(convert(numeric,nrComprobante))
	from   TB_Comprobantes 
	where  nrCaja=@nrCaja_param and
	       tpLetra='X'
	
	select @nro_factura_inicial=isnull(@nro_factura_inicial,'--')
	select @nro_factura_final=isnull(@nro_factura_final,'--')
	select @nro_Recibo_inicial=isnull(@nro_Recibo_inicial,'--')
	select @nro_Recibo_final=isnull(@nro_Recibo_final,'--')

	update	#Resumen_Caja_Puesto
	set   Cantidad_Viajes   = @Cantidad_Viajes,
	      Cantidad_Contado  = @Cantidad_Contado,
	      Cantidad_cta_cte  = @Cantidad_cta_cte,
	      Cantidad_Retorno  = @Cantidad_Retorno,   
	      Cantidad_Anuladas = @Cantidad_Anuladas,
	      Cantidad_Cobro_en_Destino=@Cantidad_Cobro_en_Destino,
	      nro_factura_inicial=@nro_factura_inicial,
	      nro_factura_final=@nro_factura_final,
	      nro_factura_inicial_A=@nro_factura_inicial_A,
	      nro_factura_final_A=@nro_factura_final_A,
	      nro_Recibo_inicial=@nro_Recibo_inicial,
	      nro_Recibo_final=@nro_Recibo_final

	where nrcaja = @nrCaja_param

	select * from #Resumen_Caja_Puesto



go



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TB_Parametros]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_Parametros]
GO

CREATE TABLE [dbo].[TB_Parametros] (
	[dsParametro] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[vlParametro] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tpParametro] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[flNoEditable] [bit] NULL ,
	[nrTamanio] [int] NULL ,
	[dtActualizacion] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_Parametros] WITH NOCHECK ADD 
	CONSTRAINT [PK_tb_Parametros] PRIMARY KEY  CLUSTERED 
	(
		[dsParametro]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_Parametros] ADD 
	CONSTRAINT [DF_tb_Parametros_flNoEditable] DEFAULT (0) FOR [flNoEditable]
GO





create procedure SP_GenerarNuevasOpcionesdeMenues
as
begin

	declare @tpNiveldeAcceso as varchar(70);
	DECLARE c_tpniveldeacceso CURSOR FOR
	SELECT tpNivelAcceso FROM TB_NivelAcceso;
	
	SELECT tpNivelAcceso, IdOpcionMenu into #tmp_NuevasOpcionesMenues FROM TB_NivelAccesoOpcionesMenu where 1<>1


	OPEN c_tpniveldeacceso


	FETCH NEXT FROM c_tpniveldeacceso
	INTO @tpNiveldeAcceso


	WHILE @@FETCH_STATUS = 0
	BEGIN

		INSERT #tmp_NuevasOpcionesMenues (tpNivelAcceso, IdOpcionMenu)
		SELECT @tpNiveldeAcceso, IdOpcionMenu FROM TB_OpcionesMenues
		where flVisible=1 and IdOpcionMenu not in 
		(select IdOpcionMenu from TB_NivelAccesoOpcionesMenu where tpNivelAcceso=@tpNiveldeAcceso)

		FETCH NEXT FROM c_tpniveldeacceso
		INTO @tpNiveldeAcceso

	END

	
	CLOSE c_tpniveldeacceso
	DEALLOCATE c_tpniveldeacceso


	INSERT TB_NivelAccesoOpcionesMenu (tpNivelAcceso, IdOpcionMenu, flAcceso)
	select tpNivelAcceso, IdOpcionMenu, 0 as flAcceso from 
	#tmp_NuevasOpcionesMenues


end 



GO 

create procedure SP_obtenerAlicuotaIVA
@tpCategoriaIVA_param varchar(5)=null
as
begin

	select vlParametro as PORC_IVA from tb_Parametros where dsParametro='PORC_IVA'

	return;

	if @tpCategoriaIVA_param='RI' 
		select vlParametro as PORC_IVA from tb_Parametros where dsParametro='PORC_IVA'
	else
		select 0 as PORC_IVA


end 

go

create procedure SP_CalcularSubtotalIVA
@tpCategoriaIVA_param varchar(5),
@vlMonto_param float,
@vlAlicuota_param float
as
begin

	if @vlAlicuota_param>=1
		set @vlAlicuota_param=@vlAlicuota_param/100
	
	if @tpCategoriaIVA_param='RI'
		select  @vlMonto_param / (@vlAlicuota_param + 1) as subtotal
	else
		select  @vlMonto_param as subtotal

end 

go


create procedure SP_CalcularIVA
@tpCategoriaIVA_param varchar(5),
@vlMonto_param float,
@vlAlicuota_param float
as
begin
declare @vlSubtotal float

	if @vlAlicuota_param>=1
		set @vlAlicuota_param=@vlAlicuota_param/100
	
	set @vlSubtotal = @vlMonto_param / (@vlAlicuota_param + 1)
        select @vlSubtotal * @vlAlicuota_param as  IVA

end 



go 

create procedure SP_Supera_KM_IVA_segunMonto
@tpCategoriaIVA_param varchar(5)=null,
@vlKilometros_param   int=0,
@vlMonto_param	      float=0
as
begin
declare @precio_km float
declare @Kilometros_IVA int

	set @precio_km=0
	set @Kilometros_IVA=0
	
	select @precio_km=replace(vlParametro,',','.') from tb_Parametros where dsParametro='PRECIO_KM'
	select @Kilometros_IVA=replace(vlParametro,',','.') from tb_Parametros where dsParametro='KM_IVA'
	

	if @vlKilometros_param>0 and @vlKilometros_param>=@Kilometros_IVA 
	begin
		select 'S' as RESPUESTA, @vlKilometros_param as Kilometros, 'N' as Pregunta
		return
	end 


	select @precio_km=replace(vlParametro,',','.') from tb_Parametros where dsParametro='PRECIO_KM'

	if @precio_km>0 and (@vlMonto_param/@precio_km)>=100
		select 'S' as RESPUESTA,(@vlMonto_param/@precio_km) as Kilometros, 'S' as Pregunta
	ELSE
		select 'N' as RESPUESTA,0  as Kilometros, 'N' as Pregunta

end 


