-- cambios de DDL version 1.3 
use dbSG2000_Pruebas
go



ALTER PROCEDURE SP_ObtenerMaxnrCaja
@nrPuesto  as int,
@MaxnrCaja as numeric OUT
AS
declare @miMaxNumero numeric

	SELECT @MaxnrCaja=MAX(nrCaja)
	FROM TB_Cajas
	WHERE nrPuesto =@nrPuesto

	if @MaxnrCaja is null
        begin
		select @miMaxNumero=convert(numeric,convert(varchar,@nrPuesto)+'000000001')
		select @MaxnrCaja=@miMaxNumero
	end	

	return 1; 	

GO


drop procedure SP_ObtenerMaxnrCaja_v1_3;

go 

create PROCEDURE SP_ObtenerMaxnrCaja_v1_3
@nrPuesto  as int
AS
declare @miMaxNumero numeric
declare @MaxnrCaja numeric

	SELECT @MaxnrCaja=MAX(nrCaja)
	FROM TB_Cajas
	WHERE nrPuesto =@nrPuesto

        if @MaxnrCaja is null
        begin
		select @miMaxNumero=convert(numeric,convert(varchar,@nrPuesto)+'000000001')
		select @MaxnrCaja=@miMaxNumero
       end	

       select @MaxnrCaja as MaxnrCaja;

      return 1;
GO



alter procedure sp_obtiene_falta_compensar
as

	SELECT SUM(vlPagoPesos)   AS   suma_vlPagoPesos, 
	       SUM(vlPagoEuros)   AS   suma_vlPagoEuros, 
	       SUM(vlPagoDolares) AS   suma_vlPagoDolares
	FROM TB_Cupones
	WHERE (flCompensado = 0) AND (flAnulado = 0) AND 
	    tpCupon IN ('Contado', 'Cuenta Corriente') AND 
	    nrLicencia NOT IN (999, 998)



GO



-- MSSQL version 1.3
ALTER TABLE [dbo].[tb_clientes] ADD 
	[dtActualizacion]  [datetime] NULL;

go

ALTER TABLE [dbo].[tb_comisiones] ADD
	[dtActualizacion]  [datetime] NULL;

go

ALTER TABLE [dbo].[tb_conceptos] ADD
	[dtActualizacion]  [datetime] NULL;

go
	
ALTER TABLE [dbo].[tb_productos] ADD 
	[dtActualizacion]  [datetime] NULL;

go

	
ALTER TABLE [dbo].[tb_puestos] ADD
	[dtActualizacion]  [datetime] NULL;

go


ALTER TABLE [dbo].[tb_usuarios] ADD
	[dtActualizacion]  [datetime] NULL;

go

ALTER TABLE [dbo].[tb_proveedores] ADD
	[dtActualizacion]  [datetime] NULL;	

go

ALTER TABLE [dbo].[tb_cajas] ADD
	[dtActualizacion]  [datetime] NULL;

go

ALTER TABLE [dbo].[tb_comprobantes] ADD
	[dtActualizacion]  [datetime] NULL;

go


ALTER TABLE [dbo].[tb_comprobantesDetalle] ADD
	[dtActualizacion]  [datetime] NULL;


go


ALTER TABLE [dbo].[tb_cupones] ADD
	[dtActualizacion]  [datetime] NULL;


go

------------------------------------------------------------
-- RESOLVIENDO EL PROBLEMA DE LA ELIMINACION

ALTER TABLE [dbo].[tb_clientes] ADD 
	[flEliminar]   bit default (0);

go

ALTER TABLE [dbo].[tb_comisiones] ADD
	[flEliminar]   bit default (0);

go

ALTER TABLE [dbo].[tb_conceptos] ADD
	[flEliminar]   bit default (0);

go
	
ALTER TABLE [dbo].[tb_productos] ADD 
	[flEliminar]   bit default (0);

go

	
ALTER TABLE [dbo].[tb_puestos] ADD
	[flEliminar]   bit default (0);

go


ALTER TABLE [dbo].[tb_usuarios] ADD
	[flEliminar]   bit default (0);

go

ALTER TABLE [dbo].[tb_proveedores] ADD
	[flEliminar]   bit default (0);

go 

ALTER TABLE [dbo].[tb_comprobantes] ADD
	[flEliminar]   bit default (0);

go 

ALTER TABLE [dbo].[tb_comprobantesDetalle] ADD
	[flEliminar]   bit default (0);


go


ALTER TABLE [dbo].[tb_cupones] ADD
	[flEliminar]   bit default (0);

go

------------------------------------------------------------


/***************************************************/
/******** Creado para Sistema Ezeiza II  ***********/
/* actualizado en la version 1.3		   */	
create procedure sup_Puestos_v1_3
@nrPuesto_param 	            int=null,
@dsPuesto_param 	            varchar(50)=null,
@dsIP_param     	            varchar(50)=null,
@dtActualizado_param                datetime=null,
@nrTalonario_manual_param           int=null,
@nrTalonario_automatico_param       int=null,
@nrComprobante_manual_ult_param     int=null,
@nrComprobante_automatico_ult_param int=null,
@flRespeta_secuencia_carga_manual_param int=null,
@tpLetra_param				char(1)=null
as

	--- Validaciones 	
	if @nrTalonario_manual_param is not null
	begin
		if exists (select * from TB_Puestos
			   where  nrPuesto <> @nrPuesto_param and 
				  nrTalonario_manual=@nrTalonario_manual_param) 
		begin 
			raiserror ('El número de talonario manual ingresado se encuentra asignado a otro puesto.',16,1)
			return -1
		end 
	end 

	if @nrTalonario_automatico_param is not null
	begin
		if exists (select * from TB_Puestos
			   where  nrPuesto <> @nrPuesto_param and 
				  nrTalonario_automatico=@nrTalonario_automatico_param)
		begin 
			raiserror ('El número de talonario automático ingresado se encuentra asignado a otro puesto.',16,1)
			return -1
		end 
	end

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
		dtActualizacion=getdate()		
	where  nrPuesto = @nrPuesto_param

	if @@rowcount=0 
	begin
		raiserror ('No se ha localizado el puesto ingresado',16,1)
		return -1 
	end 

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tb_sincronizacion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tb_sincronizacion]
GO

CREATE TABLE [dbo].[tb_sincronizacion] (
	[id] [int] NOT NULL ,
	[nmTabla] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tpSincronizacion] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dtUltSincrozacion] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[flSincronizar] [bit] NULL ,
	[flUnidadTransaccional] [bit] NULL ,
	[nrOrdenTransaccional] [int] NULL ,
	[flFiltrarporPuesto] [bit] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_sincronizacion] WITH NOCHECK ADD 
	CONSTRAINT [PK_tb_sincronizacion] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 

GO


alter PROCEDURE [dbo].[sco_TB_Productos] AS
	
	select  cdProducto,
	        dsProducto,
	        vlPrecioViaje,
	        vlPrecioPeaje, 
	        vlPorcentaje, 
	        tpOperacion,
		flMuestra, 
		vlKilometros
	FROM TB_Productos
             Order by dsProducto;
 
GO



-- modificado version 1.3
-- Todos los viajes pagados al Licenciatario @flCompensado_param=1
-- Todos lo Viajes Facturados al Licenciatario @flCompensado_param=0
Alter procedure dbo.SP_TB_Cupones_Qry
@dtCupon_desde_param datetime,
@dtCupon_hasta_param datetime,
@nrLicencia_param    int=0,
@flAnulado_param     bit=0,
@flCompensado_param  bit=1,
@flNoPagados_param   bit=1,
@flAgrupado          int=0
as

    if @nrLicencia_param=0
    begin
        if @flAgrupado=0
            if @flCompensado_param=1
	       -- viajes que fueron pagados al licenciatario	
               select nrCupon,
                        nrLicencia,
                        nmLicenciatario,
                        tpCupon,
                        vlMontoCupon,
                        vlPagoPesos,
                        vlPagoEuros,
                        vlPagoDolares,
                        vlComision,
                        dtCupon,
                        nrTalonarioCliente,
                        nrComprabanteCliente,
                        flCompensado,
                        nrCajaCliente,
                        nrCajaLicenciatario,
                        dtCompensado,
                        dsUsuario,
                        dsObservacion,
                        dsDestino,
                        dsHoraViaje
                From TB_Cupones
                Where
                    flAnulado = @flAnulado_param and
                    flAnulado=@flAnulado_param and
                    flCompensado=@flCompensado_param  and
                    dtcupon>=@dtCupon_desde_param and
                    dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and
		    flEliminar=0
                order by nrLicencia, dtCupon
            Else
	       -- viajes que fueron facturados (pagados o sin pagar) al Licenciatario
                select nrCupon,
                    nrLicencia,
                    nmLicenciatario,
                    tpCupon,
                    vlMontoCupon,
                    vlPagoPesos,
                    vlPagoEuros,
                    vlPagoDolares,
                    vlComision,
                    dtCupon,
                    nrTalonarioCliente,
                    nrComprabanteCliente,
                    flCompensado,
                    nrCajaCliente,
                    nrCajaLicenciatario,
                    dtCompensado,
                    dsUsuario,
                    dsObservacion,
                    dsDestino,
                    dsHoraViaje
                    From TB_Cupones
                    Where
			flEliminar=0  and
                        flAnulado = @flAnulado_param and
                        flAnulado=@flAnulado_param and
                        dtcupon>=@dtCupon_desde_param and
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and
			((@flNoPagados_param=1 and flCompensado=0) OR 
			(@flNoPagados_param=0)) 
                    order by nrLicencia,  dtCupon
        else -- Agrupado
	    -- viajes que fueron pagados al licenciatario	
            if @flCompensado_param=1
                    select nrLicencia,
                            min(nmLicenciatario) as Licenciatario,
                            COUNT(*) AS CantidadViajes,
                            SUM(vlMontoCupon) as vlSumaPesos ,
                            sum(vlComision) as vlSumaComision,
                            (SUM(vlMontoCupon) - sum(vlComision)) as vlTotalaFacturar
                    From TB_Cupones
                    Where
			flEliminar=0  and
                        flAnulado = @flAnulado_param and
                        flAnulado=@flAnulado_param and
                        flCompensado=@flCompensado_param  and
                        dtcupon>=@dtCupon_desde_param and
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900)
                    GROUP BY nrLicencia
	       order by nrLicencia
            Else
	       -- viajes que fueron facturados (pagados o sin pagar) al Licenciatario
                    select nrLicencia,
                            min(nmLicenciatario) as Licenciatario,
                            COUNT(*) AS CantidadViajes,
                            SUM(vlMontoCupon) as vlSumaPesos ,
                            sum(vlComision) as vlSumaComision,
                            (SUM(vlMontoCupon) - sum(vlComision)) as vlTotalaFacturar
                    From TB_Cupones
                    Where
			flEliminar=0  and
                        flAnulado = @flAnulado_param and
                        flAnulado=@flAnulado_param and
                        dtcupon>=@dtCupon_desde_param and
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and
			((@flNoPagados_param=1 and flCompensado=0) OR 
			(@flNoPagados_param=0))
                    GROUP BY nrLicencia
	       order by nrLicencia
    End
    Else
    begin
	-- 
        if @flAgrupado=0
        begin
                if @flCompensado_param=1
                    select   nrCupon,
                               nrLicencia,
                               nmLicenciatario,
                               tpCupon,
                               vlMontoCupon,
                               vlPagoPesos,
                               vlPagoEuros,
                               vlPagoDolares,
                               vlComision,
                               dtCupon,
                               nrTalonarioCliente,
                               nrComprabanteCliente,
                               flCompensado,
                               nrCajaCliente,
                               nrCajaLicenciatario,
                               dtCompensado,
                               dsUsuario,
                               dsObservacion,
                               dsDestino,
                               dsHoraViaje
                            From TB_Cupones
                            Where
			       flEliminar=0  and
                               flAnulado = @flAnulado_param and
                               nrLicencia=@nrLicencia_param and
                               flAnulado=@flAnulado_param and
	                       flCompensado=@flCompensado_param  and
			       dtcupon>=@dtCupon_desde_param and
                               dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900)
                        order by nrLicencia,dtCupon
                Else
                        select   nrCupon,
                                 nrLicencia,
                                 nmLicenciatario,
                                 tpCupon,
                                 vlMontoCupon,
                                 vlPagoPesos,
                                 vlPagoEuros,
                                 vlPagoDolares,
                                 vlComision,
                                 dtCupon,
                                 nrTalonarioCliente,
                                 nrComprabanteCliente,
                                 flCompensado,
                                 nrCajaCliente,
                                 nrCajaLicenciatario,
                                 dtCompensado,
                                 dsUsuario,
                                 dsObservacion,
                                 dsDestino,
                                 dsHoraViaje
                               From TB_Cupones
                            Where
	  			 flEliminar=0  and
                                 flAnulado = @flAnulado_param and
                                 nrLicencia=@nrLicencia_param and
                                 flAnulado=@flAnulado_param and
			         dtcupon>=@dtCupon_desde_param and
                                 dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and
				((@flNoPagados_param=1 and flCompensado=0) OR 
				(@flNoPagados_param=0))
                            order by nrLicencia, dtCupon
			
        End
        else -- Agrupado
                if @flCompensado_param=1
                    select nrLicencia,
                            min(nmLicenciatario) as Licenciatario,
                            COUNT(*) AS CantidadViajes,
                            SUM(vlMontoCupon) as vlSumaPesos ,
                            sum(vlComision) as vlSumaComision,
                            (SUM(vlMontoCupon) - sum(vlComision)) as vlTotalaFacturar
                    From TB_Cupones
                    Where
			flEliminar=0  and
                        flAnulado = @flAnulado_param and
                        nrLicencia=@nrLicencia_param and
                        flAnulado=@flAnulado_param and
                        flCompensado=@flCompensado_param  and
                        dtcupon>=@dtCupon_desde_param and
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900)
                    GROUP BY nrLicencia
	      order by nrLicencia
                Else
                    select  nrLicencia,
                            min(nmLicenciatario) as Licenciatario,
                            COUNT(*) AS CantidadViajes,
                            SUM(vlMontoCupon) as vlSumaPesos ,
                            sum(vlComision) as vlSumaComision,
                            (SUM(vlMontoCupon) - sum(vlComision)) as vlTotalaFacturar
                    From TB_Cupones
                    Where
			flEliminar=0  and
                        flAnulado = @flAnulado_param and
                        nrLicencia=@nrLicencia_param and
                        flAnulado=@flAnulado_param and
                        dtcupon>=@dtCupon_desde_param and
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and
			((@flNoPagados_param=1 and flCompensado=0) OR 
			(@flNoPagados_param=0))
                    GROUP BY nrLicencia
	      order by nrLicencia
    End


go

ALTER TABLE [dbo].[tb_comprobantes] ADD
	[flSincronizado]   bit default (0);

go


ALTER TABLE [dbo].[tb_comprobantesDetalle] ADD
	[flSincronizado]  bit default (0)

go


ALTER TABLE [dbo].[tb_cupones] ADD
	[flSincronizado]  bit default (0);

go

/***************************************************/
/******** Creado para Sistema Ezeiza II  ***********/
/* actualizado a la version 1.3 		   */
alter procedure sco_Puestos
@nrPuesto_param int=null,
@dsPuesto_param varchar(50)=null
as

	select	nrPuesto,
		dsPuesto,
		dsIP,
		dtActualizado,
		nrTalonario_manual,
		nrTalonario_automatico,
		nrComprobante_manual_ult,
		nrComprobante_automatico_ult,
		flRespeta_secuencia_carga_manual,
		tpletra	
	from TB_Puestos
	where  (nrPuesto = @nrPuesto_param OR  @nrPuesto_param is null) 
		and  (dsPuesto =@dsPuesto_param OR @dsPuesto_param is null)
	and flEliminar=0

go


-- Actualiza el nro de comprobante y talonario de una carga manual
-- actualizado a la version 1.3
alter procedure [SP_ActualizarComprobanteManual]
@nrTalonario_param        char(4),
@nrComprobante_param      char(12),
@tpComprobante_param      char(2),
@tpLetra_param            char(1),
@nrTalonario_new_param    char(4),
@nrComprobante_new_param  char(12)
AS
declare @cantidad_registros int
declare @error		    varchar(200)


	if @nrTalonario_param = @nrTalonario_new_param and
	   @nrComprobante_param = @nrComprobante_new_param 
	begin
		return 0	
	end

	begin tran T1

	select   @cantidad_registros=count(*)
	FROM TB_Comprobantes
	WHERE nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param and 
	      flManual      = 'M' 

	if @cantidad_registros=0 
	begin
		select @error = 'No se ha encontrado el talonario '+ @nrTalonario_param + ' comprobante nro. '+ rtrim(@nrComprobante_param) +'.'
         	raiserror (@error, 16, 1)
		rollback tran T1		
		return 0	
	end


	select   @cantidad_registros=count(*)
	FROM TB_Comprobantes
	WHERE nrTalonario   = @nrTalonario_new_param and
	      nrComprobante = @nrComprobante_new_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param and 
	      flManual      = 'M' 

	if @cantidad_registros>0 
	begin
		select @error = 'Ya existe el talonario '+ @nrTalonario_new_param + ' comprobante nro. '+ rtrim(@nrComprobante_new_param)+'.'
		raiserror (@error, 16, 1)
		rollback tran T1	
		return 0	
	end


	INSERT INTO [TB_Comprobantes]
	    (nrTalonario,nrComprobante, tpComprobante, tpLetra, 
	    dtComprobante , cdCliente, cdCondVenta, tpComision, 
	    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
	    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
	    flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
	    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
	    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
	    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
	    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
	    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
	    nmEmpleado, IdReciboCtaCte, flCargaErronea, dtActualizacion)
	SELECT  @nrTalonario_new_param,  @nrComprobante_New_param , tpComprobante, tpLetra, 
	    dtComprobante, cdCliente, cdCondVenta, tpComision, 
	    tpMoneda, tpIVA, vlTotalGeneral, vlPagoPesos, vlPagoEuros, 
	    vlPagoDolares, dsLeyenda, flManual, dtInsercion, 
	    0 as flSincronizado, dsUsuario, nrCaja, dtCaja, nrPuesto, 
	    dsDomicilio, nrLicencia, nrBultos, nrPasajeros, nrDoc, 
	    dsRazonSocial, nmNombre, nmApellido, nmLicenciatario, 
	    cdPostal, nmLocalidad, cdCodBar, dsEmail, nrTel, nrCAI, 
	    dtVencimiento, vlDiaDolar, vlDiaEuro, dsOpcional1, 
	    dsOpcional2, dsOpcional3, dsOpcional4, flAnulado, dtAnulado, 
	    nmEmpleado, IdReciboCtaCte, flCargaErronea,getdate () as  dtActualizacion
	FROM TB_Comprobantes
	WHERE nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param and 
	      flManual      = 'M' 

	if @@rowcount=0 
	begin	
		select @error = 'No se ha insertado el talonario '+ @nrTalonario_new_param + ' comprobante nro. '+ rtrim(@nrComprobante_new_param) +'.'
		raiserror (@error, 16, 1)
		rollback tran T1	
		return 0	
	end

	if @@error<>0
	begin
		select @error = 'error al insertar el registro en la tabla [TB_Comprobantes].'
		raiserror (@error, 16, 1)
		rollback tran T1	
		return 0
	end 	

	insert into [TB_ComprobantesDetalle]
	    (nrTalonario, nrComprobante, tpComprobante, tpLetra, nrItem, 
	    cdProducto, dsProducto, tpOperacion, qtCantidad, vlPorcentaje, 
	    vlPrecioPeaje, vlPrecioViaje, vlTotalItem, dtInsercion, 
	    flSincronizado,dtActualizacion)
	select @nrTalonario_new_param , @nrComprobante_new_param, tpComprobante, tpLetra, 
	    nrItem, cdProducto, dsProducto, tpOperacion, qtCantidad, 
	    vlPorcentaje, vlPrecioPeaje, vlPrecioViaje, vlTotalItem, 
	    dtInsercion, 0, getdate()
	from TB_ComprobantesDetalle
	where nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param 


	if @@error<>0
	begin
		select @error = 'No se pudo grabar la tabla de TB_ComprobantesDetalle.'
		raiserror (@error, 16, 1)
		rollback tran T1	
		return 0
	end 

	update TB_Cupones
	set nrTalonarioCliente     = @nrTalonario_new_param,
   	    nrComprabanteCliente   = @nrComprobante_new_param
	where nrTalonarioCliente   = @nrTalonario_param and
	      nrComprabanteCliente = @nrComprobante_param and
	      tpComprobanteCliente = @tpComprobante_param and 		
	      tpLetraCliente       = @tpLetra_param 
	
	--------------------------------------------------------------------
	--------------------------------------------------------------------
	--------------------------------------------------------------------

	-- Eliminar en la tabla de TB_ComprobantesDetalle
	delete from TB_ComprobantesDetalle
	where nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param 
	
	if @@rowcount=0 
	begin	
		select @error = 'No se ha eliminado el talonario '+ @nrTalonario_param + ' comprobante nro. '+ rtrim(@nrComprobante_param) +' de la tabla TB_ComprobantesDetalle.'
		raiserror (@error, 16, 1)
		rollback tran T1		
		return 0	
	end

	--------------------------------------------------------------------
	-- Eliminar en la tabla de TB_Comprobantes
	delete from TB_Comprobantes
	where nrTalonario   = @nrTalonario_param and
	      nrComprobante = @nrComprobante_param and
	      tpComprobante = @tpComprobante_param and 
	      tpLetra       = @tpLetra_param and 
	      flManual      = 'M' 

	if @@rowcount=0 
	begin	
		select @error = 'No se ha eliminado el talonario '+ @nrTalonario_param + ' comprobante nro. '+ rtrim(@nrComprobante_param) +' de la tabla TB_Comprobantes.'
		raiserror (@error, 16, 1)
		rollback tran T1		
		return 0	
	end

	if @@error<>0
	begin	
		select @error = 'No se ha insertado el talonario '+ @nrTalonario_new_param + ' comprobante nro. '+ rtrim(@nrComprobante_new_param) +'.'
		raiserror (@error, 16, 1)
		rollback tran T1		
		return 0	
	end
	else
	begin	-- todo OK 
		commit tran T1		
	end
		
	
go



--- FILTRAR POR PUESTOS
--  Agregar campo flFiltrarporPuesto y valores en el diccionario de datos
--  adecuar la tabla TB_ComprobantesDetalle agregar el campo nrPuesto
--  adecuar los DML del programa para que graben nrPuesto

ALTER TABLE [dbo].[tb_comprobantesDetalle] ADD
	[nrPuesto]  int Null;

go 

------------------------------------------------------
------ agregados para la  Sincroniza cionManual

ALTER TABLE [dbo].[tb_comprobantesDetalle] ADD
	[nrCaja] [numeric](18, 0) NULL;

go

ALTER TABLE [dbo].[tb_cajas] ADD
	[flSincronizado]  bit default (0);

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_CajasPuestos]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_CajasPuestos]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.VW_CajasPuestos
AS
SELECT     dbo.TB_Cajas.nrCaja, dbo.TB_Cajas.nrPuesto, dbo.TB_Cajas.dsUsuario, dbo.TB_Cajas.dtApertura, dbo.TB_Cajas.dtCierre, dbo.TB_Cajas.hrApertura, 
                      dbo.TB_Cajas.hrCierre, dbo.TB_Cajas.flEstado, dbo.TB_Cajas.flCajaAdm, dbo.TB_Cajas.vlSaldoInicialPesos, dbo.TB_Cajas.vlSaldoInicialDolares, 
                      dbo.TB_Cajas.vlSaldoInicialEuros, dbo.TB_Cajas.vlDiaDolar, dbo.TB_Cajas.vlDiaEuro, dbo.TB_Cajas.vlSaldoFinalPesos, 
                      dbo.TB_Cajas.vlSaldoFinalDolares, dbo.TB_Cajas.vlSaldoFinalEuros, dbo.TB_Cajas.vlSaldoFinalRealPesos, dbo.TB_Cajas.vlSaldoFinalRealEuros, 
                      dbo.TB_Cajas.vlSaldoFinalRealDolares, dbo.TB_Cajas.vlCierrePesos, dbo.TB_Cajas.vlCierreDolares, dbo.TB_Cajas.vlCierreEuros, 
                      dbo.TB_Cajas.vlTotalSaldoFinalReal, dbo.TB_Cajas.vlTotalSaldoFinal, dbo.TB_Cajas.dsDiferenciaDeCierre, dbo.TB_Cajas.vlDiferenciaDeCierre, 
                      dbo.TB_Usuarios.tpAcceso, dbo.TB_Cajas.flSincronizado
FROM         dbo.TB_Cajas INNER JOIN
                      dbo.TB_Usuarios ON dbo.TB_Cajas.dsUsuario = dbo.TB_Usuarios.dsUsuario

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

-----------------------------------------------------------------

drop PROCEDURE SP_ObtenerMaxnrCupon_v1_3; 

go

CREATE PROCEDURE SP_ObtenerMaxnrCupon_v1_3
@nrPuesto INTEGER
AS
BEGIN

    if @nrPuesto=9 
    begin
	   select  ISNULL(MAX(nrCupon),0) as nrMaxCupon
       from  TB_Cupones;
       return;
    end
    
    if @nrPuesto=1
    begin
	   select  ISNULL(MAX(nrCupon),1000039774) as nrMaxCupon
       from  TB_Cupones
	   WHERE nrPuesto=@nrPuesto and nrCupon<9000000000;   
       return;
    end 		
   
    if @nrPuesto=2
    begin
	   select  ISNULL(MAX(nrCupon),2000015836) as nrMaxCupon
       from  TB_Cupones
	   WHERE nrPuesto=@nrPuesto and nrCupon<9000000000;   
       return;
    end 
   
    select  ISNULL(MAX(nrCupon),0) as nrMaxCupon
    from  TB_Cupones
    WHERE nrPuesto=@nrPuesto and nrCupon<9000000000;   


END;

GO 


alter PROCEDURE [SP_ObtenerTalonarioMaximo] AS

	select max(nrTalonario_manual) 'nrTalonarioMaximo' from TB_Puestos 
			
	
go



CREATE procedure rpt_CierredeCajaADMDetalleControl1_v1
@nrCaja_param  numeric
as

SELECT
    TB_Cajas.nrCaja,
    TB_MovimientosContables.dsConcepto,
    TB_MovimientosContables.tpOperacion,
    TB_MovimientosContables.vlPesos,
    TB_MovimientosContables.vlDolares,
    TB_MovimientosContables.vlEuros,
    TB_MovimientosContables.dtMovimiento
FROM
    dbo.TB_Cajas TB_Cajas,
    dbo.TB_MovimientosContables TB_MovimientosContables
WHERE
    TB_Cajas.nrCaja = @nrCaja_param AND
    TB_Cajas.nrCaja = TB_MovimientosContables.nrCaja AND
    (TB_MovimientosContables.dsConcepto <> 'PAGO DE COMPROBANTES' AND
    TB_MovimientosContables.dsConcepto <> 'COMISIÓN COOPERATIVA')



go


CREATE procedure rpt_CierredeCajaADMDetalleControl2_v1
@nrCaja_param  numeric
as

	select  VW_DetalleMovimientosContablesCupones.nrCaja, 
		VW_DetalleMovimientosContablesCupones.dsConcepto, 
		VW_DetalleMovimientosContablesCupones.nrLicencia,
	        VW_DetalleMovimientosContablesCupones.tpCupon,
		VW_DetalleMovimientosContablesCupones.nrTalonarioCliente,
		VW_DetalleMovimientosContablesCupones.nrComprabanteCliente,
		VW_DetalleMovimientosContablesCupones.vlPesos,
		VW_DetalleMovimientosContablesCupones.vlDolares,
		VW_DetalleMovimientosContablesCupones.vlEuros,	
	VW_DetalleMovimientosContablesCupones.vlComision,
		VW_DetalleMovimientosContablesCupones.vlMontoCupon,
    		TB_Cajas.nrCaja
FROM
    	 dbSG2000.dbo.VW_DetalleMovimientosContablesCupones VW_DetalleMovimientosContablesCupones 
	 inner JOIN dbSG2000.dbo.TB_Cajas TB_Cajas on
	 VW_DetalleMovimientosContablesCupones.nrCaja = TB_Cajas.nrCaja
	 where VW_DetalleMovimientosContablesCupones.dsConcepto ='PAGO DE COMPROBANTES' and
	 TB_Cajas.nrCaja = @nrCaja_param



go


 

Create procedure SP_InicializarSincroADMPuestoxPuesto
@nrPuesto_Param as integer
as
begin
-- Obtener la ultima caja de cada puesto y dejarla lista para la sincronizacion
-- inicial 

-- actualizamos la tabla de TB_Cajas
UPDATE a
set    a.dtActualizacion=null
from   TB_Cajas a 
where  a.nrPuesto=@nrPuesto_Param and
       a.dtActualizacion is not null 

-- actualizamos la tabla de TB_Comprobantes
UPDATE a
set a.dtActualizacion=null
from  TB_Comprobantes a  where a.dtActualizacion is not null 
and a.nrPuesto=@nrPuesto_Param

-- actualizamos la tabla de TB_ComprobantesDetalle
UPDATE a
set a.dtActualizacion=null
from  TB_ComprobantesDetalle a
where a.dtActualizacion is not null and
a.nrPuesto=@nrPuesto_Param
	
-- actualizamos la tabla de TB_Cupones
UPDATE a
set    a.dtActualizacion=null
from   TB_Cupones a 
where  a.dtActualizacion is not null and 
       a.nrPuesto=@nrPuesto_Param


SELECT     TB_Cajas.nrPuesto, MAX(TB_Cajas.nrCaja) AS nrCaja into #tmp_ultimasCajas
FROM         TB_Puestos INNER JOIN
                      TB_Cajas ON TB_Puestos.nrPuesto = TB_Cajas.nrPuesto
WHERE  TB_Puestos.nrPuesto=@nrPuesto_Param
GROUP BY TB_Cajas.nrPuesto

-- actualizamos la tabla de TB_Cajas
UPDATE a
set a.dtActualizacion=getdate()
from  TB_Cajas a , #tmp_ultimasCajas b
where a.nrCaja = b.nrCaja

-- actualizamos la tabla de TB_Comprobantes
UPDATE a
set    a.dtActualizacion=getdate()
from   TB_Comprobantes a , #tmp_ultimasCajas b
where  a.nrCaja = b.nrCaja 


-- actualizamos la tabla de TB_ComprobantesDetalle
UPDATE a
set a.dtActualizacion=getdate(), a.nrCaja = c.nrCaja, a.nrPuesto = c.nrPuesto
from  TB_ComprobantesDetalle a, TB_Comprobantes b , #tmp_ultimasCajas c
where c.nrCaja = b.nrCaja and
      a.nrTalonario = b.nrTalonario     and 
      a.nrComprobante = b.nrComprobante and 
      a.tpComprobante = b.tpComprobante and 
      a.tpLetra = b.tpLetra
	
-- actualizamos la tabla de TB_Cupones
UPDATE a
set a.dtActualizacion=getdate()
from  TB_Cupones a , #tmp_ultimasCajas b
where a.nrCajaCliente = b.nrCaja

update TB_Puestos
set dtActualizacion=getdate()
WHERE  TB_Puestos.nrPuesto=@nrPuesto_Param

-- para realizar la primera sincronizacion de toda la BD
update TB_Clientes   set dtActualizacion=getdate()
update tb_comisiones set dtActualizacion=getdate()
update tb_conceptos set dtActualizacion=getdate()
update tb_productos  set dtActualizacion=getdate()
update tb_usuarios   set dtActualizacion=getdate()
update tb_proveedores   set dtActualizacion=getdate()
update tb_sincronizacion   set dtUltSincrozacion=null

end


alter procedure sp_obtiene_falta_compensar
as	
declare @fecha_corte datetime

	set dateformat dmy


	SET @fecha_corte=Convert(datetime,CONVERT(varchar, getdate(), 103) 
		        + ' 06:01:00')

	SELECT SUM(vlPagoPesos)   AS   suma_vlPagoPesos, 
	       SUM(vlPagoEuros)   AS   suma_vlPagoEuros, 
	       SUM(vlPagoDolares) AS   suma_vlPagoDolares
	FROM TB_Cupones
	WHERE (flCompensado = 0) AND
	      (flAnulado = 0) AND 
	      tpCupon IN ('Contado', 'Cuenta Corriente') AND 
	      nrLicencia NOT IN (999, 998) AND
              dtCupon<=@fecha_corte


