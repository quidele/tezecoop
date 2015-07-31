-- Cambios de DDL version 4.1
use dbsg2000
go

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
GO

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Productos' and COLUMN_NAME='cdComision')
begin
	ALTER TABLE dbo.TB_Productos ADD cdComision int NULL
	ALTER TABLE dbo.TB_Productos SET (LOCK_ESCALATION = TABLE)
end
GO


go 


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='sco_TB_Productos_v4_1' )
	drop procedure  [dbo].[sco_TB_Productos_v4_1];

go 

CREATE PROCEDURE [dbo].[sco_TB_Productos_v4_1] AS	
begin
	select  cdProducto,
	        dsProducto,
	        vlPrecioViaje,
	        vlPrecioPeaje, 
	        vlPorcentaje, 
	        tpOperacion,
			flMuestra, 
			vlKilometros,
			tpDestino,
			cdComision
	FROM TB_Productos
	where flEliminar=0 and
	      flMuestra=1
	Order by dsProducto;
end 
go


go



if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='sp_obtenerComision_v4_1' )
	drop procedure  [dbo].sp_obtenerComision_v4_1;

go

--Exec sp_obtenerComision_v4_1 @vlTotalGeneral_param = 78 ,@tpComision_param = 'A Clientes' ,@tpCliente_param = 'A Clientes' ,@dsCodigoDestinos_param = '''Viaje'',null,60|''Recargo+Comi'',4007,18' 

go

create procedure sp_obtenerComision_v4_1
(@vlTotalGeneral_param    float,  
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


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_rpt_cierredecaja_imprime_valores_v4_1' )
	drop procedure  [dbo].SP_rpt_cierredecaja_imprime_valores_v4_1;


go 

---exec  SP_rpt_cierredecaja_imprime_valores_v4_1 2000002269

go

CREATE procedure SP_rpt_cierredecaja_imprime_valores_v4_1
(@nrCaja as numeric(18,0))
as
begin


	SELECT
		TB_Cajas.nrCaja, TB_Cajas.nrPuesto, 
		Convert(varchar(10),TB_Cajas.dtApertura,105) as dtApertura, 
		Convert(varchar(10),TB_Cajas.dtCierre,105) as dtCierre, 
		Convert(varchar(5),TB_Cajas.dtApertura, 108) as hrApertura,
		Convert(varchar(5),TB_Cajas.dtCierre, 108) as hrCierre,
		TB_Cajas.flEstado, TB_Cajas.vlSaldoInicialPesos, TB_Cajas.vlSaldoInicialDolares, TB_Cajas.vlSaldoInicialEuros, TB_Cajas.vlDiaDolar, TB_Cajas.vlDiaEuro, TB_Cajas.vlSaldoFinalPesos, TB_Cajas.vlSaldoFinalDolares, TB_Cajas.vlSaldoFinalEuros, TB_Cajas.vlSaldoFinalRealPesos, TB_Cajas.vlSaldoFinalRealEuros, TB_Cajas.vlSaldoFinalRealDolares, TB_Cajas.vlCierrePesos, TB_Cajas.vlCierreDolares, TB_Cajas.vlCierreEuros, TB_Cajas.vlTotalSaldoFinalReal, TB_Cajas.vlTotalSaldoFinal, TB_Cajas.vlTotalSaldoCierre, TB_Cajas.dsDiferenciaDeCierre, TB_Cajas.vlDiferenciaDeCierre, TB_Cajas.vlDiaReal, TB_Cajas.vlSaldoInicialReales, TB_Cajas.vlSaldoFinalReales, TB_Cajas.vlSaldoFinalRealReales, TB_Cajas.vlCierreReales,
		TB_Comprobantes_ResumenCajaPuesto.nrTalonario, TB_Comprobantes_ResumenCajaPuesto.nrComprobante, TB_Comprobantes_ResumenCajaPuesto.tpComprobante, TB_Comprobantes_ResumenCajaPuesto.cdCondVenta, TB_Comprobantes_ResumenCajaPuesto.vlPagoPesos, TB_Comprobantes_ResumenCajaPuesto.vlPagoEuros, TB_Comprobantes_ResumenCajaPuesto.vlPagoDolares, TB_Comprobantes_ResumenCajaPuesto.dsLeyenda, TB_Comprobantes_ResumenCajaPuesto.nrLicencia, TB_Comprobantes_ResumenCajaPuesto.dsOpcional1, TB_Comprobantes_ResumenCajaPuesto.flAnulado, TB_Comprobantes_ResumenCajaPuesto.nmEmpleado, TB_Comprobantes_ResumenCajaPuesto.vlPagoReales,
		TB_ComprobantesDetalle_ResumenCajaPuesto.dsProducto
	FROM
		TB_Cajas,
		TB_Comprobantes_ResumenCajaPuesto,
		TB_ComprobantesDetalle_ResumenCajaPuesto
	WHERE
		TB_Cajas.nrCaja = TB_Comprobantes_ResumenCajaPuesto.nrCaja AND
		TB_Comprobantes_ResumenCajaPuesto.nrTalonario = TB_ComprobantesDetalle_ResumenCajaPuesto.nrTalonario AND
		TB_Comprobantes_ResumenCajaPuesto.nrComprobante = TB_ComprobantesDetalle_ResumenCajaPuesto.nrComprobante AND
		TB_Comprobantes_ResumenCajaPuesto.tpComprobante = TB_ComprobantesDetalle_ResumenCajaPuesto.tpComprobante AND
		TB_Comprobantes_ResumenCajaPuesto.tpLetra = TB_ComprobantesDetalle_ResumenCajaPuesto.tpLetra
		and TB_Cajas.nrCaja = @nrCaja
	ORDER BY
		TB_Comprobantes_ResumenCajaPuesto.nrComprobante ASC
		
		
end


go


   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Puestos' and COLUMN_NAME='flFacturaCtacte')
ALTER TABLE dbo.TB_Puestos ADD	flFacturaCtacte bit NULL

go 


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where 
					SPECIFIC_NAME ='sup_Puestos_v4_1' )
	drop procedure  [dbo].sup_Puestos_v4_1;
	
go

/*

set dateformat dmy

Exec   sup_Puestos_v4_1  @nrPuesto_param=2 ,  @dsPuesto_param='Aerolineas' ,  @dtActualizado_param='25/06/2012 11:26:48',   @nrTalonario_manual_param=2 ,  @nrTalonario_automatico_param=5 ,  @nrComprobante_manual_ult_param=null ,  @nrComprobante_automatico_ult_param=null,  @flRespeta_secuencia_carga_manual_param=0, @tpLetra_param='B',@nrTalonario_manual_empresa_param=2, @nrTalonario_manual_ctacte_param=2, @nrComprobante_manual_empresa_ult_param=null, @nrComprobante_manual_ctacte_ult_param=null, @tpLetraEmpresa_param='A', @tpLetraRecibo_param='X', @nrTalonario_auto_empresa_param=5, @nrTalonario_auto_ctacte_param=5, @nrComprobante_auto_ctacte_ult_param=null, @nrComprobante_auto_empresa_ult_param=null, @tpletra_manual_param='B', @tpLetraEmpresa_manual_param='A', @tpLetraRecibo_manual_param='X',@nrCAI_Talonario_auto_param=97849156910160, @dtCAI_Talonario_auto_param='24/06/2012', @nrCAI_Talonario_auto_empresa_param=null, @dtCAI_Talonario_auto_empresa_param=null, @flFacturaCtacte=1

*/

go

CREATE procedure sup_Puestos_v4_1
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
@dtCAI_Talonario_auto_empresa_param     datetime,
@flFacturaCtacte					     bit
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
		flFacturaCtacte = @flFacturaCtacte

	where  nrPuesto = @nrPuesto_param

	if @@rowcount=0 
	begin
		raiserror ('No se ha localizado el puesto ingresado',16,1)
		return -1 
	end 



end;


go 

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where 
					SPECIFIC_NAME ='sco_Puestos_v4_1' )
	drop procedure  [dbo].sco_Puestos_v4_1;

go



create procedure sco_Puestos_v4_1
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
		flFacturaCtacte
	from TB_Puestos
	where  (nrPuesto = @nrPuesto_param OR  @nrPuesto_param is null) 
		and  (dsPuesto =@dsPuesto_param OR @dsPuesto_param is null)
	and flEliminar=0


end;


go 


if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where 
					SPECIFIC_NAME ='sco_validarVencimientosCAI_v4_1' )
	drop procedure  [dbo].sco_validarVencimientosCAI_v4_1;
---exec [dbo].sco_validarVencimientosCAI;
go 

create procedure sco_validarVencimientosCAI_v4_1
as
begin


	select
		nrPuesto, 
		dsPuesto, 
		nrCAI_Talonario_auto as nrCAI,
			convert(varchar(10),dtCAI_Talonario_auto,105) as dtVencimintoCAI
	from TB_Puestos
	where 
		(nrCAI_Talonario_auto is not null and  dtCAI_Talonario_auto< GETDATE() - 60 )
			and flEliminar=0
	union
		select
		nrPuesto, 
		dsPuesto, 
		nrCAI_Talonario_auto as nrCAI,
		convert(varchar(10),dtCAI_Talonario_auto,105) as dtVencimintoCAI
	from TB_Puestos
	where (nrCAI_Talonario_auto_empresa is not null and dtCAI_Talonario_auto_empresa< GETDATE() - 60 )
			and flEliminar=0

end;


go 