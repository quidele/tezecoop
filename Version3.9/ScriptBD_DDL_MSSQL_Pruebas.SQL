-- Cambios de DDL version 3.9
use dbSG2000_Pruebas
go



   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Parametros' and COLUMN_NAME='grupo_parametro')
ALTER TABLE TB_Parametros ADD grupo_parametro char(40) NULL

go 


   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Parametros' and COLUMN_NAME='observacion')
ALTER TABLE TB_Parametros ADD observacion VARCHAR(500) NULL

go 

   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlDineroDolares')
ALTER TABLE TB_Cajas ADD vlDineroDolares  [float] NULL;

go 

   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlDineroEuros')
ALTER TABLE TB_Cajas ADD vlDineroEuros  [float] NULL;


go 


   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='vlDineroReales')
ALTER TABLE TB_Cajas ADD vlDineroReales  [float] NULL;


go 

   
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='dsObservacionCC')
ALTER TABLE TB_Cajas ADD dsObservacionCC VARCHAR(500) NULL


go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sco_cajapuesto_v3_9]'))
drop procedure [dbo].sco_cajapuesto_v3_9

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_parametros' and COLUMN_NAME='flEditable')
ALTER TABLE TB_parametros ADD flEditable bit NULL


if  exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_parametros' and COLUMN_NAME='flNoEditable')
begin
	ALTER TABLE TB_parametros drop DF_tb_Parametros_flNoEditable;
	ALTER TABLE TB_parametros drop column flNoEditable;
end
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Proveedores' and COLUMN_NAME='tpmodeloauto')
ALTER TABLE TB_Proveedores ADD tpmodeloauto CHAR(20) NULL

go 

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Proveedores' and COLUMN_NAME='flcongas')
ALTER TABLE TB_Proveedores ADD flcongas bit NULL DEFAULT(0)


go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sco_cajapuesto_v3_9]'))
drop procedure [dbo].sco_cajapuesto_v3_9

go
--- obtiene los valore de una caja-puestos
create  procedure sco_cajapuesto_v3_9
@nrCaja_param  numeric
as 
begin
declare @nrCierre integer

	select @nrCierre=count(*)+1  from TB_CajasPuestosCierres
	where  nrCaja=@nrCaja_param

	select  a.[nrCaja], 
		a.[nrPuesto], 
		a.[dsUsuario], 
		a.[dtApertura], 
		a.[dtCierre],
		a.[hrApertura],
		a.[hrCierre],
		a.[flEstado],
		dsEstado=CASE a.[flEstado]
		when 1 then     'Cerrada'
		when 0 then     'Abierta'
		End,		
		a.[flCajaAdm], 
		isnull(a.[vlSaldoInicialPesos],0) as 'vlSaldoInicialPesos',
		isnull(a.[vlSaldoInicialDolares],0) as 'vlSaldoInicialDolares',
		isnull(a.[vlSaldoInicialEuros],0)as 'vlSaldoInicialEuros',
		isnull(a.[vlDiaDolar],0)as 'vlDiaDolar',
		isnull(a.[vlDiaEuro],0)as 'vlDiaEuro',
		isnull(a.[vlDiaReal],0)as 'vlDiaReal',
		isnull(a.[vlSaldoFinalPesos],0)as 'vlSaldoFinalPesos',
		isnull(a.[vlSaldoFinalDolares],0)as 'vlSaldoFinalDolares',
		isnull(a.[vlSaldoFinalEuros],0)as 'vlSaldoFinalEuros',
		isnull(a.[vlSaldoFinalRealPesos],0)as 'vlSaldoFinalRealPesos',
		isnull(a.[vlSaldoFinalRealEuros],0)as 'vlSaldoFinalRealEuros',
		isnull(a.[vlSaldoFinalRealDolares],0)as 'vlSaldoFinalRealDolares', 
		isnull(a.[vlCierrePesos],0)as 'vlCierrePesos',
		isnull(a.[vlCierreDolares],0)as 'vlCierreDolares', 
		isnull(a.[vlCierreEuros],0)as 'vlCierreEuros', 
		isnull(a.[vlTotalSaldoFinalReal],0)as 'vlTotalSaldoFinalReal', 
		isnull(a.[vlTotalSaldoFinal],0)as 'vlTotalSaldoFinal', 
		isnull(a.[vlTotalSaldoInicial],0)as 'vlTotalSaldoInicial', 
		isnull(a.[vlTotalSaldoCierre],0)as 'vlTotalSaldoCierre', 
		a.[dsDiferenciaDeCierre]as 'dsDiferenciaDeCierre', 
		isnull(a.[vlDiferenciaDeCierre],0)as 'vlDiferenciaDeCierre', 
		a.[dsObservacion], 
		a.[dtObservacion], 
		a.[dsUsuario_Supervisor], 
		a.[dtActualizacion], 
		a.[flSincronizado], 
		--a.[nrCierre], 
		isnull(b.nmNombre,'')+' '+isnull(b.nmApellido,'') nmEmpleado,
		c.dsPuesto,
		-- Para la administración = Saldo Operadora - Fondo de la caja
		dbo.f_positivoValorNegativoCero_2_5([vlSaldoFinalRealPesos] - [vlSaldoInicialPesos]) as 'vlSaldoAdmPesos',
		dbo.f_positivoValorNegativoCero_2_5([vlSaldoInicialDolares] - [vlSaldoFinalRealDolares]) as 'vlSaldoAdmDolares',
		dbo.f_positivoValorNegativoCero_2_5([vlSaldoFinalRealEuros] - [vlSaldoInicialEuros]) as 'vlSaldoAdmEuros',
		vlFondoFijoPesos,
		vlFondoFijoDolares,
		vlFondoFijoEuros,
		@nrCierre as nrCierre,	
		--- columnas agregadas en la version 3.7
		isnull(vlSaldoInicialReales,0) as  vlSaldoInicialReales,
		isnull(vlSaldoFinalReales,0) as vlSaldoFinalReales ,
		isnull(vlSaldoFinalRealReales,0) as vlSaldoFinalRealReales ,
		isnull(vlCierreReales,0) as vlCierreReales  ,
		isnull(vlFondoFijoReales,0) as vlFondoFijoReales,
		vlDineroDolares,
		vlDineroEuros,
		vlDineroReales,
		dsObservacionCC
	FROM TB_Cajas a, tb_usuarios b, tb_puestos c
	WHERE   a.nrcaja = @nrCaja_param 
		and a.dsUsuario = b.dsUsuario
		and a.nrPuesto  = c.nrPuesto
	
end

go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spu_esdifporCotizacionImputadas_v3_9]'))
drop procedure [dbo].spu_esdifporCotizacionImputadas_v3_9

go 

--- exec spu_esdifporCotizacionImputadas_v3_9
go


create procedure spu_esdifporCotizacionImputadas_v3_9(@nrCajaAdmActual numeric(10,0))
as
begin
declare @resultado char(2)
declare @descripcion varchar(100)
	

	select @resultado = 'NO'

	select  @resultado = 'SI'  from TB_MovimientosContables
		 where nrCaja = @nrCajaAdmActual
			and cdConcepto in ('2032',  '2033') 
	
	if @resultado='SI'
		set @descripcion='Asiento por Diferencia de cotización ya realizado' 
	
	select 	@resultado as resultado, @descripcion as descripcion; 	
			
end


go 

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Proveedores' and COLUMN_NAME='chofer1')
ALTER TABLE TB_Proveedores ADD chofer1 VARCHAR(100) NULL
go
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Proveedores' and COLUMN_NAME='chofer2')
ALTER TABLE TB_Proveedores ADD chofer2 VARCHAR(100) NULL
go
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Proveedores' and COLUMN_NAME='chofer3')
ALTER TABLE TB_Proveedores ADD chofer3 VARCHAR(100) NULL
go
 
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Proveedores' and COLUMN_NAME='telchofer1')
ALTER TABLE TB_Proveedores ADD telchofer1 VARCHAR(100) NULL
go
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Proveedores' and COLUMN_NAME='telchofer2')
ALTER TABLE TB_Proveedores ADD telchofer2 VARCHAR(100) NULL
go
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Proveedores' and COLUMN_NAME='telchofer3')
ALTER TABLE TB_Proveedores ADD telchofer3 VARCHAR(100) NULL
go



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_TB_Cupones_Qry_v3_9]'))
drop procedure [dbo].SP_TB_Cupones_Qry_v3_9

go

  
-- Modificado version 3.9  
-- Todos los viajes pagados al Licenciatario @flCompensado_param=1  
-- Todos lo Viajes Facturados al Licenciatario @flCompensado_param=0  
CREATE procedure [dbo].[SP_TB_Cupones_Qry_v3_9]  
@dtCupon_desde_param datetime,  
@dtCupon_hasta_param datetime,  
@nrLicencia_param    int=0,  
@flAnulado_param     bit=0,  
@flCompensado_param  bit=1,  
@flNoPagados_param   bit=1,  
@flAgrupado          int=0,  
@vlMontoCupon_param  int=0,  
@flIVA				 int=0
as  


  
    if @nrLicencia_param=0  
    begin  
        if @flAgrupado=0  
            if @flCompensado_param=1  
            begin  
				-- viajes que fueron pagados al licenciatario   
               select   nrCupon,  
                        nrLicencia,  
                        nmLicenciatario,  
                        tpCupon,  
                        vlMontoCupon,  
                        vlPagoPesos,  
                        vlPagoEuros,  
                        vlPagoDolares,  
                        isnull(vlPagoReales,0)   as vlPagoReales,
                        vlComision,  
						isnull(vlIVA,0) as vlIVA,  
                        vlComision + isnull(vlIVA,0) as vlRetencion,  
                        dtCupon,  
                        nrTalonarioCliente,  
                        nrComprabanteCliente,  
                        tpComprobanteCliente,  
                        tpLetraCliente,  
                        flCompensado,  
                        nrCajaCliente,  
                        nrCajaLicenciatario,  
                        dtCompensado,  
                        dsUsuario,  
                        dsObservacion,  
                        dsDestino,  
                        dsHoraViaje,  
						flPosee_obs = CASE  isnull(dsObservacion,'')    
						 WHEN null then 0  
						 WHEN '' then 0  
								ELSE 1
							END, 
						
					    dsLeyenda
				into #tmp_cupones    
                From TB_Cupones  
                Where  
                    flAnulado = @flAnulado_param and  
                    flCompensado=@flCompensado_param  and  
                    dtcupon>=@dtCupon_desde_param and  
                    dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and  
					flEliminar=0 and vlMontoCupon>@vlMontoCupon_param  
					and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
                order by nrLicencia, dtCupon  
                  
                select a.*, b.flmanual from #tmp_cupones a, TB_Comprobantes b   
                where a.nrComprabanteCliente = b.nrComprobante and   
                      a.nrTalonarioCliente =   b.nrTalonario and  
                      a.tpComprobanteCliente = b.tpComprobante and   
                      a.tpLetraCliente = b.tpLetra  
                        
            end      
            Else  
            begin  
				-- viajes que fueron facturados (pagados o sin pagar) al Licenciatario  
                select nrCupon,  
                    nrLicencia,  
                    nmLicenciatario,  
                    tpCupon,  
                    vlMontoCupon,  
                    vlPagoPesos,  
                    vlPagoEuros,  
                    vlPagoDolares,  
                    vlPagoReales,
                    vlComision,  
					isnull(vlIVA,0) as vlIVA,  
                    vlComision + isnull(vlIVA,0) as vlRetencion,  
                    dtCupon,  
                    nrTalonarioCliente,  
                    nrComprabanteCliente,  
                    tpComprobanteCliente,  
                    tpLetraCliente,  
                    flCompensado,  
                    nrCajaCliente,  
                    nrCajaLicenciatario,  
                    dtCompensado,  
                    dsUsuario,  
                    dsObservacion,  
                    dsDestino,  
                    dsHoraViaje,  
					 flPosee_obs = CASE  isnull(dsObservacion,'')    
					 WHEN null then 0  
					 WHEN '' then 0  
							ELSE 1   
						END,     
					dsLeyenda  
					into #tmp_cupones1  
                  From TB_Cupones  
                    Where  
						(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0)  and  
						flEliminar=0  and  
                        flAnulado = @flAnulado_param and  
                        dtcupon>=@dtCupon_desde_param and  
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and  
						((@flNoPagados_param=1 and flCompensado=0) OR   
						(@flNoPagados_param=0))   
						and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
                    order by nrLicencia,  dtCupon  
                      
                              
                select a.*, b.flmanual from #tmp_cupones1 a, TB_Comprobantes b   
                where a.nrComprabanteCliente = b.nrComprobante and   
                      a.nrTalonarioCliente =   b.nrTalonario and  
                      a.tpComprobanteCliente = b.tpComprobante and   
                      a.tpLetraCliente = b.tpLetra  
                                
        end              
        else -- Agrupado  
     -- viajes que fueron pagados al licenciatario   
            if @flCompensado_param=1  
                    select nrLicencia,  
                            min(nmLicenciatario) as Licenciatario,  
                            COUNT(*) AS CantidadViajes,  
							SUM(vlMontoCupon) as vlSumaPesos ,  
                            sum(vlComision) as vlSumaComision,  
                            (SUM(vlMontoCupon) - sum(vlComision) - sum(isnull(vlIVA,0)) ) as vlTotalaFacturar,  
							sum(isnull(vlIVA,0))  vlSumaIVA  
                    From TB_Cupones  
                    Where  
						 (vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0)  and  
						 flEliminar=0  and  
                        flAnulado = @flAnulado_param and    
                        flCompensado=@flCompensado_param  and  
                        dtcupon>=@dtCupon_desde_param and  
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900)  
                        and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
                    GROUP BY nrLicencia  
        order by nrLicencia  
            Else  
        -- viajes que fueron facturados (pagados o sin pagar) al Licenciatario  
                    select nrLicencia,  
                            min(nmLicenciatario) as Licenciatario,  
                            COUNT(*) AS CantidadViajes,  
                            SUM(vlMontoCupon) as vlSumaPesos ,  
                            sum(vlComision) as vlSumaComision,  
                            (SUM(vlMontoCupon) - sum(vlComision) - sum(isnull(vlIVA,0)) ) as vlTotalaFacturar,  
							sum(isnull(vlIVA,0))  vlSumaIVA  
                    From TB_Cupones  
                    Where  
						(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0)  and  
						flEliminar=0  and  
                        flAnulado=@flAnulado_param and  
                        dtcupon>=@dtCupon_desde_param and  
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and  
						((@flNoPagados_param=1 and flCompensado=0) OR   
						(@flNoPagados_param=0))  
						and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
                    GROUP BY nrLicencia  
        order by nrLicencia  
    End  
    Else  
    begin  
 --   
        if @flAgrupado=0  
        begin  
                if @flCompensado_param=1  
                begin  
                  
                    select   nrCupon,  
                               nrLicencia,  
                               nmLicenciatario,  
                               tpCupon,  
                               vlMontoCupon,  
                               vlPagoPesos,  
                               vlPagoEuros,  
                               vlPagoDolares,
                               isnull(vlPagoReales,0)   as vlPagoReales,  
                               vlComision,  
							   isnull(vlIVA,0) as vlIVA,  
								vlComision + isnull(vlIVA,0) as vlRetencion,  
                               dtCupon,  
                               nrTalonarioCliente,  
                               nrComprabanteCliente,  
                               tpComprobanteCliente,  
								tpLetraCliente,  
                               flCompensado,  
                               nrCajaCliente,                                 
                               nrCajaLicenciatario,  
                               dtCompensado,  
                               dsUsuario,  
                               dsObservacion,  
                               dsDestino,  
                               dsHoraViaje,  
							   flPosee_obs = CASE  isnull(dsObservacion,'')  
								 WHEN null then 0  
								 WHEN '' then 0  
										ELSE 1
									END,    
							  dsLeyenda              
							into #tmp_cupones2  
							From TB_Cupones  
							Where  
							   (vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0)  and  
								flEliminar=0  and  
							   flAnulado = @flAnulado_param and  
							   nrLicencia=@nrLicencia_param and  
							    flCompensado=@flCompensado_param  and  
								dtcupon>=@dtCupon_desde_param and  
							    dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900)  
							    and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
								order by nrLicencia,dtCupon  
       
								 select a.*, b.flmanual from #tmp_cupones2 a, TB_Comprobantes b   
								 where a.nrComprabanteCliente = b.nrComprobante and   
									a.nrTalonarioCliente =   b.nrTalonario and  
									a.tpComprobanteCliente = b.tpComprobante and   
									a.tpLetraCliente = b.tpLetra  
							                                 
							  
                end          
                Else  
                begin  
                  
                        select   nrCupon,  
                                 nrLicencia,  
                                 nmLicenciatario,  
                                 tpCupon,  
                                 vlMontoCupon,  
                                 vlPagoPesos,  
								 vlPagoEuros,  
							     vlPagoDolares,  
							     isnull(vlPagoReales,0)   as vlPagoReales,
                                 vlComision,  
							     isnull(vlIVA,0) as vlIVA,  
                                 vlComision + isnull(vlIVA,0) as vlRetencion,  
                                 dtCupon,  
                                 nrTalonarioCliente,  
                                 nrComprabanteCliente,  
                                 tpComprobanteCliente,  
								 tpLetraCliente,  
                                 flCompensado,  
                                 nrCajaCliente,  
                                 nrCajaLicenciatario,  
                                 dtCompensado,  
                                 dsUsuario,  
                                 dsObservacion,  
                                 dsDestino,  
                                 dsHoraViaje,  
								 flPosee_obs = CASE isnull(dsObservacion,'')  
								 WHEN null then 0  
								 WHEN '' then 0  
								  ELSE   0
								 END,   
								 dsLeyenda
								into #tmp_cupones3     
								From TB_Cupones  
								Where  
								(vlMontoCupon >= @vlMontoCupon_param or @vlMontoCupon_param = 0) and   
								 flEliminar=0  and  
                                 flAnulado  = @flAnulado_param and  
                                 nrLicencia = @nrLicencia_param and    
								 dtcupon>=@dtCupon_desde_param and  
                                 dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and  
								 ((@flNoPagados_param=1 and flCompensado=0) OR   
								 (@flNoPagados_param=0))  
								 and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
                            order by nrLicencia, dtCupon  
                  
							select a.*, b.flmanual from #tmp_cupones3 a, TB_Comprobantes b   
							where a.nrComprabanteCliente = b.nrComprobante and   
								  a.nrTalonarioCliente =   b.nrTalonario and  
								  a.tpComprobanteCliente = b.tpComprobante and   
								  a.tpLetraCliente = b.tpLetra  
                                
   end  
        End  
        else -- Agrupado  
                if @flCompensado_param=1  
                    select nrLicencia,  
                            min(nmLicenciatario) as Licenciatario,  
                            COUNT(*) AS CantidadViajes,  
                            SUM(vlMontoCupon) as vlSumaPesos ,  
                            sum(vlComision) as vlSumaComision,  
                            (SUM(vlMontoCupon) - sum(vlComision) - sum(isnull(vlIVA,0)) ) as vlTotalaFacturar,  
							sum(isnull(vlIVA,0))  vlSumaIVA  
							From TB_Cupones  
							Where  
							(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0) and   
							flEliminar=0  and  
							flAnulado = @flAnulado_param and  
							nrLicencia=@nrLicencia_param and  
							flCompensado=@flCompensado_param  and  
							dtcupon>=@dtCupon_desde_param and  
							dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) 
							and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva 
							GROUP BY nrLicencia  
							order by nrLicencia  
                Else  
                    select  nrLicencia,  
                            min(nmLicenciatario) as Licenciatario,  
                            COUNT(*) AS CantidadViajes,  
                            SUM(vlMontoCupon) as vlSumaPesos ,  
                            sum(vlComision) as vlSumaComision,  
                           (SUM(vlMontoCupon) - sum(vlComision) - sum(isnull(vlIVA,0)) ) as vlTotalaFacturar,  
							sum(isnull(vlIVA,0))  vlSumaIVA  
                    From TB_Cupones  
                    Where  
						(vlMontoCupon>=@vlMontoCupon_param or @vlMontoCupon_param=0) and   
						flEliminar=0  and  
                        flAnulado = @flAnulado_param and  
                        nrLicencia=@nrLicencia_param and  
                        dtcupon>=@dtCupon_desde_param and  
                        dtcupon<=@dtCupon_hasta_param and nrLicencia not in (999,900) and  
						((@flNoPagados_param=1 and flCompensado=0) OR   
						(@flNoPagados_param=0))  
						and (@flIVA = 0  or vlIVA > 0)  -- filtro de iva
						GROUP BY nrLicencia  
						order by nrLicencia  
    End  

go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[f_obtenerLeyendaGas]'))
drop function [dbo].f_obtenerLeyendaGas
go

create function  [dbo].f_obtenerLeyendaGas(@flcongas int)
RETURNS VARCHAR(20) AS  
begin
	if @flcongas is null 
		return '';
		
	if @flcongas = 0
		return ''
	else
		return ' - CON GAS'
	
	return '';
end

go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spu_obtenerLicenciatariosTelefonosChoferes_v3_9]'))
drop procedure [dbo].spu_obtenerLicenciatariosTelefonosChoferes_v3_9


go


create procedure spu_obtenerLicenciatariosTelefonosChoferes_v3_9(@pnrLicencia int)
as
begin

	/*
	select '(' + CONVERT(varchar,@pnrLicencia) +') - '+ isnull(nmNombre,'') + ' ' + isnull(nmApellido,' ') as nombre_completo , 
		   isnull(nrTel,'') as nrTel,
		   1 as orden 
	into #tmp_datostelefonos
		from TB_Proveedores  where nrLicencia = @pnrLicencia
	union
	*/
	
	select  '(' + CONVERT(varchar,@pnrLicencia) +') - ' as nombre_completo, 
	        rtrim(isnull(tpmodeloauto,'')) + ' '+ dbo.f_obtenerLeyendaGas(flConGas)   as nrTel,
		1 as orden 
		into #tmp_datostelefonos
		from TB_Proveedores  where nrLicencia = @pnrLicencia
	union	
	select   chofer1 as nombre_completo, 
	    ' - ' + ISNULL(telchofer1,'')   as nrTel,
		2 as orden 
		from TB_Proveedores  where nrLicencia = @pnrLicencia and (chofer1 is not null or chofer1<>'')
	union
	select chofer2 as nombre_completo, ' - ' + ISNULL(telchofer2,'')  as nrTel,
		3 as orden
		from TB_Proveedores  where nrLicencia = @pnrLicencia and (chofer2 is not null or chofer2<>'')
	union
	select chofer3 as nombre_completo,  ' - ' + ISNULL(telchofer3,'') as nrTel,
		4 as orden
		from TB_Proveedores  where nrLicencia = @pnrLicencia and (chofer3 is not null or chofer3<>'')
		 
	select * from #tmp_datostelefonos
	order by orden 
end


go

	