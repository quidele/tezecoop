-- Cambios de DDL version 2.9
use dbSG2000
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_GenerarNuevasOpcionesdeMenues]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_GenerarNuevasOpcionesdeMenues]
 
go


CREATE procedure SP_GenerarNuevasOpcionesdeMenues
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
	select a.tpNivelAcceso, a.IdOpcionMenu, b.flCajaAdm as flAcceso from 
	#tmp_NuevasOpcionesMenues a , TB_OpcionesMenues b
	where  a.IdOpcionMenu = b.IdOpcionMenu


end 

go 

-- Programacion de las imputaciones, apertura en dos cajas

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='tpCajaImputacion')
	ALTER TABLE  [TB_Conceptos] ADD 
		tpCajaImputacion varchar(50); -- Caja de los Licenciatarios / Caja de la Cooperativa

go 

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='tpCreadoPor')
ALTER TABLE  [TB_Conceptos] ADD 
	tpCreadoPor varchar(20); -- Sistema / Usuario

go 

if exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='flSumaenAdm')
begin
	ALTER TABLE  [TB_Conceptos] DROP CONSTRAINT DF__TB_Concep__flSum__6053ED02;
	ALTER TABLE  [TB_Conceptos] DROP COLUMN flSumaenAdm; 
end 

go

if exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='flOcultado')
begin
	ALTER TABLE  [TB_Conceptos] DROP CONSTRAINT DF__TB_Concep__flOcu__4A64ABE3;
	ALTER TABLE  [TB_Conceptos] DROP COLUMN flOcultado; -- campo para determinar si el movimiento se muestra en la caja de la administracion
end 

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='flSumaenCajaAdm')
	ALTER TABLE  [TB_Conceptos] ADD 
		flSumaenCajaAdm bit DEFAULT(1); 

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='flSumaenCajaCooperativa')
	ALTER TABLE  [TB_Conceptos] ADD 
		flSumaenCajaCooperativa bit DEFAULT(1); 

go 

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='flSumaenCajaLicenciatarios')
	ALTER TABLE  [TB_Conceptos] ADD 
		flSumaenCajaLicenciatarios bit DEFAULT(1); 

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='flOcultadoenCajaAdm')
ALTER TABLE  [TB_Conceptos] ADD 
	flOcultadoenCajaAdm bit default(0); -- campo para determinar si el movimiento se muestra en la caja de la administracion

go 

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='flOcultadoCajaLicenciatario')
ALTER TABLE  [TB_Conceptos] ADD 
	flOcultadoCajaLicenciatario bit default(0); -- campo para determinar si el movimiento se muestra en la caja de la administracion
go
if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='flOcultadoCajaLicenciatario')
ALTER TABLE  [TB_Conceptos] ADD 
	flOcultadoCajaLicenciatario bit default(0); -- campo para determinar si el movimiento se muestra en la caja de la administracion

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='flOcultadoCajaCooperativa')
ALTER TABLE  [TB_Conceptos] ADD 
	flOcultadoCajaCooperativa bit default(0); -- campo para determinar si el movimiento se muestra en la caja de la administracion

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='flOcultadoenRegistracion')
ALTER TABLE  [TB_Conceptos] ADD 
	flOcultadoenRegistracion bit default(0); -- campo para determinar si el movimiento se muestra en la caja de la administracion

go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_MovimientosContables' and COLUMN_NAME='nrCajaPuesto')
ALTER TABLE  [TB_MovimientosContables] ADD 
	nrCajaPuesto  	numeric(18, 0); 


go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_MovimientosContables' and COLUMN_NAME='tpCajaImputacion')
	ALTER TABLE  [TB_MovimientosContables] ADD 
		tpCajaImputacion varchar(50); -- Caja de los Licenciatarios / Caja de la Cooperativa

go


if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_MovimientosContables' and COLUMN_NAME='dsUsuarioCajaPuesto')
ALTER TABLE  [TB_MovimientosContables] ADD 
	dsUsuarioCajaPuesto varchar(50); -- Usuario


go 

-- Eliminamos el campo 
-- if exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Conceptos' and COLUMN_NAME='flOcultado')
-- begin
	-- ALTER TABLE  [TB_Conceptos] DROP DF__TB_Concep__flOcu__5CED7072;
	-- ALTER TABLE  [TB_Conceptos] 
	-- DROP COLUMN
	-- flOcultado; -- campo para determinar si el movimiento se muestra en la caja de la administracion
-- end

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_grabarMovimientoContable_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_grabarMovimientoContable_v2_9]

go 

-- drop procedure SP_grabarMovimientoContable_v2_9

create procedure SP_grabarMovimientoContable_v2_9(
@dsMovimiento_param as  varchar (100),
@IdRecibo_param     as  numeric(18, 0)=null,
@cdConcepto_param   as  int,
@tpConcepto_param   as  varchar (50),
@dsConcepto_param   as  varchar (100),
@tpOperacion_param  as  varchar (50), 
@vlPesos_param      as  float,
@vlDolares_param    as	float,
@vlEuros_param	    as	float,
@nrRecibo_param     as  varchar (50)=null,
@nrFactura_param    as  varchar (50)=null, 
@nrCaja_param       as  numeric(18, 0)=null,
@dsUsuario_param    as  varchar (50)=null,
@dsUsuarioCajaPuesto_param as varchar (50)=null,
@dtMovimiento_param as  datetime=null,
@dsProveedor_param  as  varchar (60)=null,
@IdProveedor_param  as  varchar (50)=null,
@nrCajaPuesto_param as  numeric(18, 0)=null) 
as
begin

declare @IdMovimiento as  numeric(18, 0)

	-- para que compile
	select @IdMovimiento=max(IdMovimiento)+1 from TB_MovimientosContables


	insert into TB_MovimientosContables
	       (IdMovimiento,
			dsMovimiento,
			IdRecibo,
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
			dsProveedor,
			IdProveedor,
			nrCajaPuesto)
	values
	       (@IdMovimiento,
			@dsMovimiento_param,
			@IdRecibo_param,
			@cdConcepto_param,
			@tpConcepto_param,
			@dsConcepto_param,
			@tpOperacion_param,
			@vlPesos_param, 
			@vlDolares_param,
			@vlEuros_param, 
			@nrRecibo_param, 
			@nrFactura_param, 
			@nrCaja_param, 
			@dsUsuario_param, 
			@dtMovimiento_param, 
			@dsProveedor_param,
			@IdProveedor_param,
			@nrCajaPuesto_param)
   
end

go

go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_realizarImputacionCajaPuesto_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_realizarImputacionCajaPuesto_v2_9]

go 

create    procedure SP_realizarImputacionCajaPuesto_v2_9
(@nrCaja_param       as numeric,
@nrCajaADM_param     as numeric,
@dsUsuarioADM_param  as numeric)
as
begin
declare @suma_vlComision    	    as float
declare @suma_vlIVA         	    as float
declare @suma_vlMontoViaje  	    as float
declare @pesos_a_caja_Liceciatarios as float
declare @pesos_a_caja_Cooperativa   as float 
declare @diferencia 		    as float
declare @dsPuesto  		    as varchar(50)
declare @dsUsuarioCajaPuesto	    as varchar
declare @dsMovimiento		    as varchar(100)	

	-- validar si la caja en cuestion de encuentra aprobada para su imputación

	-- aqui se debe tener en cuenta todos los viajes realizados al contado
	select @suma_vlComision=isnull(vlComision,0),   -- Ingreso de dinero por comisiones
	       @suma_vlIVA=isnull(vlIVA,0)              -- cobro del IVA al licenciatario
	from tb_cupones
	where nrCajaCliente=@nrCaja_param and tpCupon ='Contado'


	-- obtener el monto para imputar como Diferencia operadora(+)
	-- obtener el monto para imputar como Diferencia operadora(-)
	select  @diferencia = a.vlTotalSaldoFinalReal - a.vlTotalSaldoFinal,
	        @pesos_a_caja_Liceciatarios = a.vlTotalSaldoCierre - (@suma_vlComision+@suma_vlIVA),
		@pesos_a_caja_Cooperativa  = (@suma_vlComision+@suma_vlIVA), 
		@dsPuesto=b.dsPuesto,
		@dsUsuarioCajaPuesto=a.dsUsuario
	from tb_cajas a, tb_puestos b
	where nrCaja=@nrCaja_param and a.nrPuesto=b.nrPuesto
	-- obtener el monto para imputar como Diferencia Fondo Fijo(+)
	-- obtener el monto para imputar como Diferencia Fondo Fijo(-)
        -- GRABAR EL MOVIMIENTOS CONTABLES CORRESPONDIENTES

        -- se graba la caja de los licenciatarios
	---	2000	Ingreso de dinero caja de los puestos	
	---	Entrada de Dinero	Caja de los Licenciatarios	Sistema
	set @dsMovimiento = 'Transferencia caja: '+ convert(varchar,@nrCaja_param)+ ' Puesto: '+ @dsPuesto +'Usuario CP: '+ @dsUsuarioCajaPuesto
	exec SP_grabarMovimientoContable_v2_9 
		@dsMovimiento_param=@dsMovimiento,
		@IdRecibo_param=null,
		@cdConcepto_param=2000,
		@tpConcepto_param='Entrada de Dinero',
		@dsConcepto_param='Ingreso de dinero caja de los puestos',
		@tpOperacion_param='Caja de los Licenciatarios', 
		@vlPesos_param=@pesos_a_caja_Liceciatarios,
		@vlDolares_param=0,
		@vlEuros_param=0,
		@nrRecibo_param=0,
		@nrFactura_param=0, 
		@nrCaja_param=@nrCajaADM_param,
		@dsUsuario_param=@dsUsuarioADM_param,
		@dsUsuarioCajaPuesto_param=@dsUsuarioCajaPuesto,
		@dtMovimiento_param=getdate,
		@dsProveedor_param=null,
		@IdProveedor_param=null,
		@nrCajaPuesto_param=@nrCaja_param

	
end

go 

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Cajas' and COLUMN_NAME='flImputado')
ALTER TABLE  [TB_Cajas] ADD 
		[flImputado] [int] default(0) NULL; 

go 


if not  exists (select * from dbo.sysindexes where name = 'IX_flImputado') 
	CREATE  INDEX [IX_flImputado] ON [dbo].[TB_Cajas]([flImputado]) ON [PRIMARY];


go 


if exists (select * from dbo.sysobjects where name = 'f_existeDiferenciaFondoFijo_v2_9')
drop function [dbo].[f_existeDiferenciaFondoFijo_v2_9]

go

CREATE FUNCTION  f_existeDiferenciaFondoFijo_v2_9 (
		@vlSaldoInicialPesos    as float,
		@vlSaldoInicialDolares  as float,
		@vlSaldoInicialEuros    as float,
		@vlFondoFijoPesos		as float,
		@vlFondoFijoDolares		as float,
		@vlFondoFijoEuros		as float,
		@vlDiaEuro				as float, 
		@vlDiaDolar				as float)  
RETURNS INT AS  
BEGIN 
declare @resultado		           as int
declare @vlTotalSaldoInicialPesif  as float
declare @vlTotalFondoFijoPesif     as float

	set @vlTotalSaldoInicialPesif = @vlSaldoInicialPesos +
									(@vlSaldoInicialDolares  * @vlDiaDolar) +
									(@vlSaldoInicialEuros    * @vlDiaEuro)

	set @vlTotalFondoFijoPesif = @vlFondoFijoPesos +
									(@vlFondoFijoDolares  * @vlDiaDolar) + 
									(@vlFondoFijoEuros    * @vlDiaEuro)

	/* determinamos si existe diferencia*/
	if (@vlTotalSaldoInicialPesif<>@vlTotalFondoFijoPesif)
		set @resultado=1;
	else
		set @resultado=0;
	
	return  @resultado; 

END 

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_obtenerDiferenciaFondoFijo_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_obtenerDiferenciaFondoFijo_v2_9]

go 

create procedure [SP_obtenerDiferenciaFondoFijo_v2_9]
(
		@vlSaldoInicialPesos    as float,
		@vlSaldoInicialDolares  as float,
		@vlSaldoInicialEuros    as float,
		@vlFondoFijoPesos		as float,
		@vlFondoFijoDolares		as float,
		@vlFondoFijoEuros		as float,
		@vlDiaEuro				as float, 
		@vlDiaDolar				as float)

as
BEGIN 
declare @resultado		as int
declare @vlTotalSaldoInicialPesif   as float
declare @vlTotalFondoFijoPesif      as float
declare @vlDiferenciaFondoFijoPesif as float 

	set @vlTotalSaldoInicialPesif = @vlSaldoInicialPesos +
									(@vlSaldoInicialDolares  * @vlDiaDolar) +
									(@vlSaldoInicialEuros    * @vlDiaEuro)

	set @vlTotalFondoFijoPesif = @vlFondoFijoPesos +
									(@vlFondoFijoDolares  * @vlDiaDolar) + 
									(@vlFondoFijoEuros    * @vlDiaEuro)

	/* determinamos el signo de la variacion */ 
	if @vlTotalSaldoInicialPesif>@vlTotalFondoFijoPesif
		set @resultado=-1;
	else
		set @resultado=1; 

	set @vlDiferenciaFondoFijoPesif = @vlTotalFondoFijoPesif -  @vlTotalSaldoInicialPesif
	select @resultado as 'vlSigno', @vlDiferenciaFondoFijoPesif as 'vlDiferenciaFondoFijoPesif'
	       

END

			
go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_obtenerCajasRechazadas_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_obtenerCajasRechazadas_v2_9]

go 

create  procedure sp_obtenerCajasRechazadas_v2_9
(@pdsUsuario_param as varchar(50)=null)	
as
begin 

	if @pdsUsuario_param=null 
	begin
		select  nrCaja 
		from    tb_cajas 
		where 	tpEstadoAprobacion='Rechazada'
		return
	end


	select  nrCaja 
	from    tb_cajas 
	where 	tpEstadoAprobacion='Rechazada' and dsUsuario=@pdsUsuario_param 

end

go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_CajasPuestos_v2_9]'))
drop view [dbo].[VW_CajasPuestos_v2_9]


GO

CREATE VIEW dbo.VW_CajasPuestos_v2_9
AS
SELECT     dbo.TB_Cajas.nrCaja, dbo.TB_Cajas.nrPuesto, dbo.TB_Cajas.dsUsuario, dbo.TB_Cajas.dtApertura, dbo.TB_Cajas.dtCierre, dbo.TB_Cajas.hrApertura, 
                      dbo.TB_Cajas.hrCierre, dbo.TB_Cajas.flEstado, dbo.TB_Cajas.flCajaAdm, dbo.TB_Cajas.vlSaldoInicialPesos, dbo.TB_Cajas.vlSaldoInicialDolares, 
                      dbo.TB_Cajas.vlSaldoInicialEuros, dbo.TB_Cajas.vlDiaDolar, dbo.TB_Cajas.vlDiaEuro, dbo.TB_Cajas.vlSaldoFinalPesos, 
                      dbo.TB_Cajas.vlSaldoFinalDolares, dbo.TB_Cajas.vlSaldoFinalEuros, dbo.TB_Cajas.vlSaldoFinalRealPesos, dbo.TB_Cajas.vlSaldoFinalRealEuros, 
                      dbo.TB_Cajas.vlSaldoFinalRealDolares, dbo.TB_Cajas.vlCierrePesos, dbo.TB_Cajas.vlCierreDolares, dbo.TB_Cajas.vlCierreEuros, 
                      dbo.TB_Cajas.vlTotalSaldoFinalReal, dbo.TB_Cajas.vlTotalSaldoFinal, dbo.TB_Cajas.dsDiferenciaDeCierre, dbo.TB_Cajas.vlDiferenciaDeCierre, 
                      dbo.TB_Usuarios.tpAcceso, dbo.TB_Cajas.flSincronizado, dbo.TB_Cajas.tpEstadoAprobacion, flImputado
FROM         dbo.TB_Cajas INNER JOIN
                      dbo.TB_Usuarios ON dbo.TB_Cajas.dsUsuario = dbo.TB_Usuarios.dsUsuario


go

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------

/****************************************************/
/* División de cajas: 				    */
/****************************************************/
/*
cdConcepto	tpConcepto	dsConcepto	tpOperacion	tpCajaImputacion	tpCreadoPor	flSumaenAdm
1028	Caja de la Cooperativa	Ingreso de dinero por comisiones 	Entrada de Dinero	Caja de la Cooperativa	Sistema	1
1063	Caja de la Cooperativa	Cobro de Cta. cte.	Entrada de Dinero	Caja de la Cooperativa	Sistema	1
1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
1064	Caja de la Cooperativa	Cobro IVA al Licenciatario	Entrada de Dinero	Caja de la Cooperativa	Sistema	1
2000	Caja de los Licenciatarios	Ingreso de dinero caja de los puestos (Contado)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2001	Caja de la Cooperativa	Diferencia operadora(+)	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
2002	Caja de la Cooperativa	Diferencia operadora(-)	Salida de Dinero	Caja de la Cooperativa	Sistema	0
2004	Caja de la Cooperativa	Ingreso Retención IVA	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
2005	Caja de la Cooperativa	Diferencia Fondo Fijo(+)	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
2006	Caja de la Cooperativa	Diferencia Fondo Fijo(-)	Salida de Dinero	Caja de la Cooperativa	Sistema	0
2007	Caja de los Licenciatarios	Egreso de dinero por comisiones (Contado)	Salida de Dinero	Caja de los Licenciatarios	Sistema	0
2008	Caja de los Licenciatarios	Egreso Retención IVA	Salida de Dinero	Caja de los Licenciatarios	Sistema	0
2010	Caja de la Cooperativa	Ingreso de dinero por comisiones (Retorno)	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
2011	Caja de los Licenciatarios	Ingreso de dinero caja de los puestos (Retorno)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2012	Caja de los Licenciatarios	Ingreso de dinero caja de los puestos (CD)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2013	Caja de los Licenciatarios	Ingreso de dinero caja de los puestos (CC)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2015	Caja de la Cooperativa	Ingreso de dinero por comisiones(CC)	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
2016	Caja de los Licenciatarios	Egreso de dinero por comisiones (Retorno)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2017	Caja de los Licenciatarios	Egreso de dinero por comisiones (CD)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2018	Caja de los Licenciatarios	Egreso de dinero por comisiones (CC)	Entrada de Dinero	Caja de los Licenciatarios	Sistema	0
2019	Caja de la Cooperativa	Ingreso de dinero por comisiones(Contado)	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
2014	Caja de la Cooperativa	Ingreso de dinero por comisiones(CD)	Entrada de Dinero	Caja de la Cooperativa	Sistema	0
*/

go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_obtenerImputacion_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_obtenerImputacion_v2_9]

go 

create procedure SP_obtenerImputacion_v2_9
(
@nrCaja_param         as  numeric,
@AsientoModelo_param  as  varchar(100),
@nrCupon_param		  as  numeric=null 		
)
as
begin 


	if @AsientoModelo_param='REGISTRACION_CAJA_PUESTO' 
	begin

		declare @vlSaldoInicialPesos    as float
		declare @vlSaldoInicialDolares  as float
		declare @vlSaldoInicialEuros    as float	
		declare @vlTotalSaldoFinalReal  as float 
		declare @vlTotalSaldoFinal      as float 

		declare @vlSaldoInicialDolaresPesif  as float
		declare @vlSaldoFinalRealPesos		 as float
		declare @vlSaldoInicialEurosPesif    as float	
		declare @vlSaldoFinalRealDolares     as float
		declare @vlSaldoFinalRealEuro		 as float

		declare @vlFondoFijoPesos			 as float
		declare @vlFondoFijoDolares			 as float
		declare @vlFondoFijoEuros			 as float
													  --- Diferencia en valores de caja
		declare @vlDiferenciaDeCierre		 as float --- (-) Falto dinero a la operadora 
													  --- (+) Sobre dinero a la operadora 

		--- Dinero destinado para la administración 
		declare @vlCierrePesos   as float 
		declare @vlCierreDolares as float 
		declare @vlCierreEuros   as float 
		declare @vlDiaEuro		 as float
		declare @vlDiaDolar		 as float

		SELECT     @vlSaldoFinalRealPesos=vlSaldoFinalRealPesos,
			   @vlSaldoFinalRealDolares=vlSaldoFinalRealDolares,
			   @vlSaldoFinalRealEuro=vlSaldoFinalRealEuros,
			   @vlSaldoInicialPesos=vlSaldoInicialPesos,
			   @vlSaldoInicialDolares=vlSaldoInicialDolares,
			   @vlSaldoInicialEuros=vlSaldoInicialEuros,
			   @vlTotalSaldoFinalReal=vlTotalSaldoFinalReal,  -- Saldo del operador en caja
			   @vlTotalSaldoFinal=vlTotalSaldoFinal,		  -- Saldo del sistema pesificado
			   --- Fondo Fijo otorgado para la caja siguiente
			   @vlFondoFijoPesos=vlFondoFijoPesos,
			   @vlFondoFijoDolares=vlFondoFijoDolares,
			   @vlFondoFijoEuros=vlFondoFijoEuros,
			   @vlDiferenciaDeCierre=vlDiferenciaDeCierre,
			   --- Dinero para la administración 
			   @vlCierrePesos =vlCierrePesos,
			   @vlCierreDolares =vlCierreDolares,
			   @vlCierreEuros =vlCierreEuros,
			   @vlDiaEuro  = vlDiaEuro,
			   @vlDiaDolar = vlDiaDolar
		FROM   TB_Cajas
		WHERE  (nrCaja = @nrCaja_param)

		--- Identificar las cantidaddes enunciadas en el documento
		--- #20090520_División de cuentas y agregado de nuevos controles#		
		---	2000   Ingreso de dinero caja de los puestos	Entrada de Dinero	Caja de los Licenciatarios	Sistema
				
		SELECT 
			isnull(SUM(a.vlPagoPesos),0)    + 
			isnull(SUM(a.vlPagoEuros),0)    * @vlDiaEuro +
			isnull(SUM(a.vlPagoDolares),0)  * @vlDiaDolar as   suma_vlTotalPesificado,
			isnull(SUM(a.vlPagoPesos),0)    as   suma_vlPagoPesos, 
			isnull(SUM(a.vlPagoEuros),0)    as   suma_vlPagoEuros,
			isnull(SUM(a.vlPagoDolares),0)  as   suma_vlPagoDolares,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA

		INTO #tmp_itemconcepto1 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and (tpCupon = 'Contado') 
			and nrCajaCliente = @nrCaja_param 
			
		--- 2019	Ingreso de dinero por comisiones a caja de la cooperativa
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, suma_vlComision as vlImporte, tpOperacion, tpCajaImputacion
		into #tmp_asiento_preeliminar
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2019 

		--- 2000  Ingreso de dinero caja de los puestos a la caja del licenciatario
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'USD' as moneda ,suma_vlPagoDolares as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2000 

		--- 2000  Ingreso de dinero caja de los puestos a la caja del licenciatario
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto  as dsConcepto, 'EUR' as moneda ,suma_vlPagoEuros as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2000 

		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda ,suma_vlPagoPesos as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2000 

		--- 2004 Ingreso Retención IVA a caja de la cooperativa
		insert into #tmp_asiento_preeliminar		
		select cdConcepto, dsConcepto + ' (Contado)' as dsConcepto, 'PES' as moneda, suma_IVA as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2004 

		--- 2008 Egreso Retención IVA Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar		
		select cdConcepto, dsConcepto + ' (Contado)' as dsConcepto, 'PES' as moneda, suma_IVA as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto1 a , tb_conceptos b
		where  b.cdConcepto = 2008

		/* determinamos la diferencia */
		if @vlDiferenciaDeCierre>0
		begin
			--- 2001	Diferencia operadora(+) a caja de la administracion
			insert into #tmp_asiento_preeliminar
			select cdConcepto, dsConcepto, 'PES' as moneda, abs(@vlDiferenciaDeCierre) as vlImporte, tpOperacion, tpCajaImputacion
			from   #tmp_itemconcepto1 a , tb_conceptos b
			where  b.cdConcepto = 2001 
		end

		if @vlDiferenciaDeCierre<0
		begin
			---	2002	Diferencia operadora(-) a caja de la administracion
			insert into #tmp_asiento_preeliminar
			select cdConcepto, dsConcepto, 'PES' as moneda, abs(@vlDiferenciaDeCierre) as vlImporte, tpOperacion, tpCajaImputacion
			from   #tmp_itemconcepto1 a , tb_conceptos b
			where  b.cdConcepto = 2002
		end 

		if dbo.f_existeDiferenciaFondoFijo_v2_9( @vlSaldoInicialPesos,
											 @vlSaldoInicialDolares,
											 @vlSaldoInicialEuros,
											 @vlFondoFijoPesos,
											 @vlFondoFijoDolares,
											 @vlFondoFijoEuros,
											 @vlDiaEuro, 
											 @vlDiaDolar)=1
		begin

			create table #temp_Diferencia (vlSigno int, vlDiferenciaFondoFijoPesif float);

			insert into #temp_Diferencia exec dbo.SP_obtenerDiferenciaFondoFijo_v2_9
											 @vlSaldoInicialPesos,
											 @vlSaldoInicialDolares,
											 @vlSaldoInicialEuros,
											 @vlFondoFijoPesos,
											 @vlFondoFijoDolares,
											 @vlFondoFijoEuros,
											 @vlDiaEuro, 
											 @vlDiaDolar

			--- 2006    Diferencia Fondo Fijo(-)
			--- 2005    Diferencia Fondo Fijo(+)
			--- insert into #tmp_asiento_preeliminar
			--- select cdConcepto, dsConcepto, 'PES' as moneda, abs(a.vlDiferenciaFondoFijoPesif) as vlImporte, tpOperacion, tpCajaImputacion
			--- from   #temp_Diferencia a , tb_conceptos b
			--- where  (b.cdConcepto = 2006 and a.vlSigno=-1) or (b.cdConcepto = 2005 and a.vlSigno=1)
		end


		--- Calculo concepto  2007   Egreso de dinero por comisiones
		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto2 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon='Contado'
			and nrCajaCliente = @nrCaja_param 
		
		---2007  -- Egreso de dinero por comisiones (Contado) --Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto2 a , tb_conceptos b
		where  b.cdConcepto = 2007
	    
		
		--- Calculo concepto  2007   Egreso de dinero por comisiones
		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto3 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon  = 'Retorno'
			and nrCajaCliente = @nrCaja_param 

	
		-- 2010  Ingreso de dinero por comisiones (Retorno) Caja de la Cooperativa
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto3 a , tb_conceptos b
		where  b.cdConcepto = 2010

		-- 2016 Egreso de dinero por comisiones (Retorno)  Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto3 a , tb_conceptos b
		where  b.cdConcepto = 2016


		-- 2011 Ingreso de dinero caja de los puestos (Retorno) Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlMontoCupon) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto3 a , tb_conceptos b
		where  b.cdConcepto = 2011


---Cobro en Destino


		--- Calculo montos en Cobro en Destino
		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto4 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon  = 'Cobro en Destino'
			and nrCajaCliente = @nrCaja_param 

		-- 2014  Ingreso de dinero por comisiones(CD)  Caja de la Cooperativa
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto4 a , tb_conceptos b
		where  b.cdConcepto = 2014

		-- 2017 Egreso de dinero por comisiones (CD)  Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto4 a , tb_conceptos b
		where  b.cdConcepto = 2017


		-- 2012 Ingreso de dinero caja de los puestos (CD) Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlMontoCupon) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto4 a , tb_conceptos b
		where  b.cdConcepto = 2012


---Cuenta Corriente

		--- Calculo montos en Cuenta Corriente
		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto5 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon  = 'Cuenta Corriente'
			and nrCajaCliente = @nrCaja_param 

		-- 2018  Egreso de dinero por comisiones (CC)  Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto5 a , tb_conceptos b
		where  b.cdConcepto = 2018 

		-- 2015 Ingreso de dinero por comisiones(CC)  Caja de la Cooperativa
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlComision) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto5 a , tb_conceptos b
		where  b.cdConcepto = 2015


		-- 2013 Ingreso de dinero caja de los puestos (CC) Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlMontoCupon) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto5 a , tb_conceptos b
		where  b.cdConcepto = 2013


		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, abs(suma_vlMontoCupon) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto5 a , tb_conceptos b
		where  b.cdConcepto = 2021


		-- IVA 
		-- Ingreso a la caja de la cooperativo por ret. de IVA (R,CD,CC)
		-- 'Cuenta Corriente' 'Cobro en Destino'  'Retorno'


		SELECT  isnull(SUM(vlMontoCupon),0)	as   suma_vlMontoCupon,
			isnull(SUM(vlComision),0)	as   suma_vlComision,
			isnull(SUM(vlIVA),0)		as   suma_IVA
		INTO #tmp_itemconcepto6 -- paso 1 de la generación
		FROM    dbo.TB_Cupones a
		WHERE   (flAnulado = 0) AND (flEliminar = 0) and tpCupon in ('Cuenta Corriente','Cobro en Destino','Retorno')
			and nrCajaCliente = @nrCaja_param 

		insert into #tmp_asiento_preeliminar
		-- 2004 Ingreso Retención IVA  Caja de la Cooperativa
		select cdConcepto, dsConcepto+' (R,CD,CC)' as dsConcepto, 'PES' as moneda, abs(suma_IVA) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto6 a , tb_conceptos b
		where  b.cdConcepto = 2004

		-- 2008 Egreso Retención IVA Caja de los Licenciatarios
		insert into #tmp_asiento_preeliminar
		select cdConcepto, dsConcepto+' (R,CD,CC)' as dsConcepto, 'PES' as moneda, abs(suma_IVA) as vlImporte, tpOperacion, tpCajaImputacion
		from   #tmp_itemconcepto6 a , tb_conceptos b
		where  b.cdConcepto = 2008

		-----  Tabla de Retorno  -----
		select a.cdConcepto,a.dsConcepto, a.moneda, ROUND(a.vlImporte,3) as 'vlImporte', a.tpOperacion, a.tpCajaImputacion 
		from #tmp_asiento_preeliminar a, tb_conceptos b
		where   a.cdConcepto = b.cdConcepto and
			ROUND(a.vlImporte,3)<>0   and   b.flOcultadoenRegistracion=0
		order by ROUND(a.vlImporte,3) desc

		-----  Tabla de Retorno  OCULTA -----
		select a.cdConcepto, a.dsConcepto, a.moneda, ROUND(a.vlImporte,3) as 'vlImporte', a.tpOperacion, a.tpCajaImputacion 
		from #tmp_asiento_preeliminar a, tb_conceptos b
		where a.cdConcepto = b.cdConcepto and
  		ROUND(a.vlImporte,3)<>0   and   b.flOcultadoenRegistracion=1
		order by ROUND(a.vlImporte,3) desc

	end 
	
	
	if @AsientoModelo_param='REGISTRACION_CUPON' 
	begin

		declare @nrCupon numeric(18, 0)
		declare @tpCupon varchar(20)
		declare @vlMontoCupon float
		declare @vlPagoPesos  float
		declare @vlPagoEuros  float
		declare @vlPagoDolares float
		declare @vlComision   float
		declare @vlSubtotal   float
		declare @vlIVA	      float	

		select   @nrCupon = a.nrCupon,
			 @tpCupon = a.tpCupon,	
			 @vlMontoCupon = a.vlMontoCupon, 
			 @vlPagoPesos = a.vlPagoPesos, 
			 @vlPagoEuros = a.vlPagoEuros,
			 @vlPagoDolares = a.vlPagoDolares,
			 @vlComision = a.vlComision,  
			 @vlSubtotal = a.vlSubtotal,  
			 @vlIVA	= a.vlIVA    	  
		from     tb_cupones a
		where    a.nrCupon = @nrCupon_param 


		if @tpCupon='Contado'
		begin

		--1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
		select cdConcepto, dsConcepto as dsConcepto, 'USD' as moneda, 
		       (@vlPagoEuros)  as vlImporte, tpOperacion, tpCajaImputacion
		into #tmp_asiento_preeliminar_cupones 
		from   tb_conceptos b
		where  b.cdConcepto = 1027


		--1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
		select cdConcepto, dsConcepto as dsConcepto, 'EUR' as moneda, 
		       (@vlPagoDolares)  as vlImporte, tpOperacion, tpCajaImputacion
		from   tb_conceptos b
		where  b.cdConcepto = 1027

			if @vlPagoPesos>0 
				--1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
				insert into #tmp_asiento_preeliminar_cupones
				select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, 
				       (@vlPagoPesos) - (@vlComision + @vlIVA)  as vlImporte, tpOperacion, tpCajaImputacion
				from   tb_conceptos b
				where  b.cdConcepto = 1027
			else
			begin

				--1027	Caja de los Licenciatarios	Pago a los Licenciatarios	Salida de Dinero	Caja de los Licenciatarios	Sistema	1
				insert into #tmp_asiento_preeliminar_cupones
				select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, 
				       (@vlPagoPesos) as vlImporte, tpOperacion, tpCajaImputacion
				from   tb_conceptos b
				where  b.cdConcepto = 1027

				insert into #tmp_asiento_preeliminar_cupones
				select cdConcepto, dsConcepto as dsConcepto, 'PES' as moneda, 
				       (@vlComision + @vlIVA)  as vlImporte, tpOperacion, tpCajaImputacion
				from   tb_conceptos b
				where  b.cdConcepto = 2020
			
			end 

			-----  Tabla de Retorno  -----
			select cdConcepto, dsConcepto, moneda, ROUND(vlImporte,3) as 'vlImporte', tpOperacion, tpCajaImputacion 
			from #tmp_asiento_preeliminar_cupones
			where ROUND(vlImporte,3)<>0  order by ROUND(vlImporte,3) desc

		end 


	end 

end

go		
			

-- CASO DE PRUEBA
exec SP_obtenerImputacion_v2_9 @nrCaja_param=2000002241,
			@AsientoModelo_param='REGISTRACION_CAJA_PUESTO'

go
			
exec SP_obtenerImputacion_v2_9 @nrCaja_param=2000002233,
			@AsientoModelo_param='REGISTRACION_CAJA_PUESTO'


--select * from dbo.TB_Conceptos
--select * from dbo.TB_MovimientosContables where nrcajapuesto is not null


go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_SaldoInicialMovimientosContablesporPeriodo_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_SaldoInicialMovimientosContablesporPeriodo_v2_9]

go 

create procedure SP_SaldoInicialMovimientosContablesporPeriodo_v2_9
(@dtHasta_param    	datetime,
 @tpCajaImputacion_param      varchar(70)=null,
 @tpCaja_param char(2)=null)
AS
begin

	SELECT Abs(SUM(isnull(a.vlPesos,0)))   AS SumaPesos, 
	       Abs(SUM(isnull(a.vlDolares,0))) AS SumaDolares, 
	       Abs(SUM(isnull(a.vlEuros,0)))   AS SumaEuros  into #tmp_sumasaldo
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
	WHERE a.dtMovimiento<=@dtHasta_param and a.tpOperacion = 'Entrada de Dinero' 
		and  (b.tpCajaImputacion = @tpCajaImputacion_param or @tpCajaImputacion_param is null)
		and  a.cdConcepto = b.cdConcepto 
	    and	(
				 (@tpCaja_param='CC'  and b.flSumaenCajaCooperativa=1) or			 
				 (@tpCaja_param='CL'  and b.flSumaenCajaLicenciatarios=1) or
				 (@tpCaja_param='CA'  and b.flSumaenCajaAdm=1) or
				 (@tpCaja_param is null)
			)

	insert into #tmp_sumasaldo
	SELECT -Abs(SUM(isnull(a.vlPesos,0)))   AS SumaPesos, 
	       -Abs(SUM(isnull(a.vlDolares,0))) AS SumaDolares, 
	       -Abs(SUM(isnull(a.vlEuros,0))) AS SumaEuros
	FROM dbo.TB_MovimientosContables a,  tb_conceptos b
	WHERE a.dtMovimiento<=@dtHasta_param and a.tpOperacion = 'Salida de Dinero' 		   
               and 	(b.tpCajaImputacion = @tpCajaImputacion_param or @tpCajaImputacion_param is null) 
		   and a.cdConcepto = b.cdConcepto
		   and	(
					 (@tpCaja_param='CC'  and b.flSumaenCajaCooperativa=0) or			 
					 (@tpCaja_param='CL'  and b.flSumaenCajaLicenciatarios=0) or
					 (@tpCaja_param='CA'  and b.flSumaenCajaAdm=0) or
					 (@tpCaja_param is null)
				)


	select '---- Saldo Inicial' as tpOperacion,
	       ' ' as dsConcepto,
	       ' hasta la fecha '+ convert(varchar,@dtHasta_param,103) as  dsMovimiento,   
	       isnull(sum(SumaPesos),0)   as vlSumaPesos,
	       isnull(sum(SumaDolares),0) as vlSumaDolares,
	       isnull(sum(SumaEuros),0)   as vlSumaEuros
	from #tmp_sumasaldo
		
end 

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_SumarMovimientosContablesporPeriodo_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_SumarMovimientosContablesporPeriodo_v2_9]


go

CREATE PROCEDURE SP_SumarMovimientosContablesporPeriodo_v2_9
@dtDesde_param    	  datetime,
@dtHasta_param    	  datetime,
@dsUsuario_param  	  varchar(50)=null,
@tpConcepto_param 	  varchar(50)=null,
@tpOperacion_param        varchar(50)=null,
@dsConcepto_param         varchar(50)=null,
@tpCajaImputacion_param   varchar(50)=null,
@tpCaja_param char(2)=null
AS
begin

 	
		SELECT   a.tpOperacion, a.dsConcepto, a.dsMovimiento, SUM(a.vlPesos)  as vlSumaPesos, 
			     SUM(a.vlDolares) as vlSumaDolares, SUM(a.vlEuros) as vlSumaEuros 
		from  dbo.TB_MovimientosContables a, tb_conceptos b
		WHERE a.dtMovimiento>=@dtDesde_param  and a.dtMovimiento<=@dtHasta_param  and
		(a.tpConcepto like '%' + @tpConcepto_param  + '%'  or @tpConcepto_param  is null) and
		(b.tpCajaImputacion = @tpCajaImputacion_param   or @tpCajaImputacion_param  is null) and
		(a.tpOperacion  = @tpOperacion_param   or @tpOperacion_param  is null) and
		(a.dsConcepto = @dsConcepto_param  or @dsConcepto_param  is null) and
		 a.cdConcepto = b.cdConcepto and
		    (
				 (@tpCaja_param='CC'  and b.flOcultadoCajaCooperativa=0) or			 
				 (@tpCaja_param='CL'  and b.flOcultadoCajaLicenciatario=0) or
				 (@tpCaja_param='CA'  and b.flOcultadoenCajaAdm=0) or
				 (@tpCaja_param is null)
			)
		GROUP BY a.tpConcepto, a.tpOperacion, a.dsConcepto, a.dsMovimiento
	
	

end;


go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_SaldoFinalMovimientosContablesporPeriodo_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_SaldoFinalMovimientosContablesporPeriodo_v2_9]

go 

create procedure SP_SaldoFinalMovimientosContablesporPeriodo_v2_9
(@tpCajaImputacion_param      varchar(70)=null,
 @dtHasta_param		      datetime=null,
 @tpCaja_param char(2)=null)
AS
begin

	set @dtHasta_param = isnull(@dtHasta_param,getdate())

	SELECT Abs(SUM(isnull(a.vlPesos,0)))   AS SumaPesos, 
	       Abs(SUM(isnull(a.vlDolares,0))) AS SumaDolares, 
	       Abs(SUM(isnull(a.vlEuros,0)))   AS SumaEuros  into #tmp_sumasaldo
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
	WHERE a.dtMovimiento<=@dtHasta_param  and a.tpOperacion = 'Entrada de Dinero' 
		and  (b.tpCajaImputacion = @tpCajaImputacion_param or @tpCajaImputacion_param is null) 
		and a.cdConcepto = b.cdConcepto and
		(
			 (@tpCaja_param='CC'  and b.flSumaenCajaCooperativa=1) or			 
			 (@tpCaja_param='CL'  and b.flSumaenCajaLicenciatarios=1) or
			 (@tpCaja_param='CA'  and b.flSumaenCajaAdm=1) or
			 (@tpCaja_param is null)
		)

	insert into #tmp_sumasaldo
	SELECT -Abs(SUM(isnull(a.vlPesos,0)))   AS SumaPesos, 
	       -Abs(SUM(isnull(a.vlDolares,0))) AS SumaDolares, 
	       -Abs(SUM(isnull(a.vlEuros,0))) AS SumaEuros
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
	WHERE  a.dtMovimiento<=@dtHasta_param and  a.tpOperacion = 'Salida de Dinero' 
	       and 	(b.tpCajaImputacion = @tpCajaImputacion_param or @tpCajaImputacion_param is null) 
	  		and a.cdConcepto = b.cdConcepto and
			(
					 (@tpCaja_param='CC'  and b.flSumaenCajaCooperativa=1) or			 
					 (@tpCaja_param='CL'  and b.flSumaenCajaLicenciatarios=1) or
					 (@tpCaja_param='CA'  and b.flSumaenCajaAdm=1) or
					 (@tpCaja_param is null)
			)

	select '---- Saldo Final' as tpOperacion, 
	       ' ' as dsConcepto  ,
	       ' hasta la fecha '+ convert(varchar,@dtHasta_param,103) as dsMovimiento,   
	       isnull(sum(SumaPesos),0)   as vlSumaPesos,
	       isnull(sum(SumaDolares),0) as vlSumaDolares,
	       isnull(sum(SumaEuros),0)   as vlSumaEuros
	from #tmp_sumasaldo
		
end 

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_obtenerSaldosyMovimientosdelPeriodo_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_obtenerSaldosyMovimientosdelPeriodo_v2_9]

go 

create procedure SP_obtenerSaldosyMovimientosdelPeriodo_v2_9
(@dtDesde_param    	  datetime,
@dtHasta_param    	  datetime,
@dsUsuario_param  	  varchar(50)=null,
@tpConcepto_param 	  varchar(50)=null,
@tpOperacion_param        varchar(50)=null,
@dsConcepto_param         varchar(50)=null,
@tpCajaImputacion_param   varchar(50)=null)
as
begin


	CREATE TABLE #temp_ResumenMovimientosContables (
		[tpOperacion] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[dsConcepto] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[dsMovimiento] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
		[vlSumaPesos] [float] NULL ,
		[vlSumaDolares] [float] NULL ,
		[vlSumaEuros] [float] NULL 
	) ON [PRIMARY]

	insert into #temp_ResumenMovimientosContables exec SP_SaldoInicialMovimientosContablesporPeriodo_v2_9 @dtHasta_param=@dtDesde_param, @tpCajaImputacion_param=@tpCajaImputacion_param

	insert into #temp_ResumenMovimientosContables exec SP_SumarMovimientosContablesporPeriodo_v2_9 @dtDesde_param = @dtDesde_param ,
                              @dtHasta_param = @dtHasta_param ,@tpCajaImputacion_param = @tpCajaImputacion_param

	insert into #temp_ResumenMovimientosContables exec SP_SaldoFinalMovimientosContablesporPeriodo_v2_9 @tpCajaImputacion_param, @dtHasta_param


	select * from #temp_ResumenMovimientosContables 

end;

go 



Exec SP_SumarMovimientosContablesporPeriodo_v2_9 @dtDesde_param = '01/07/2009 00:00:00' ,@dtHasta_param = '10/07/2009 23:59:59' ,@tpCajaImputacion_param = 'Caja de los Licenciatarios' 

go 

set dateformat dmy 
exec SP_SaldoInicialMovimientosContablesporPeriodo_v2_9 '01/07/2009 00:00:00', 'Caja de los Licenciatarios'

go 

set dateformat dmy  
declare @dtHasta_param    	  datetime

set @dtHasta_param = getdate()

exec SP_SaldoFinalMovimientosContablesporPeriodo_v2_9 'Caja de los Licenciatarios', @dtHasta_param

go
set dateformat dmy 
exec SP_obtenerSaldosyMovimientosdelPeriodo_v2_9
	@dtDesde_param = '01/07/2009 00:00:00' ,@dtHasta_param = '13/07/2009 23:59:59' ,@tpCajaImputacion_param = 'Caja de los Licenciatarios' 


go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_puedeOperarUsuarioCajaPuesto_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_puedeOperarUsuarioCajaPuesto_v2_9]

go 


create  procedure SP_puedeOperarUsuarioCajaPuesto_v2_9(@pnrCaja_param numeric, @pdsUsuario_param as varchar(50))
as
begin

--declare @pnrCaja_param as numeric
--declare @pdsUsuario_param as varchar(20)
--set @pnrCaja_param=2000000374
--set @pdsUsuario_param='ROMA' 


declare @dsUsuario 	    as varchar(20)
declare @flEstado 	    as varchar(20)
declare @tpEstadoAprobacion varchar(50)
declare @dsUsuario_Origen   varchar(50)
declare @flImputado         int

	--obtener los cierre anterior
	SELECT  a.* into #tmp_Cajas
	FROM   TB_Cajas a	
	WHERE  a.nrcaja=@pnrCaja_param



	select @flEstado=flEstado, @dsUsuario_Origen=dsUsuario, @dsUsuario=dsUsuarioReapertura, @tpEstadoAprobacion=tpEstadoAprobacion, @flImputado=flImputado  from #tmp_Cajas	
	
	if @flImputado=1
	begin
		select  'NO' as Resultado, 'La caja puesto se encuentra imputada, para realizar cambios debe reversar de la imputación.' as 'descripcion', 'Cerrada'  as 'dsEstado'
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

Exec SP_puedeOperarUsuarioCajaPuesto_v2_9 @pnrCaja_param = 2000002235 ,@pdsUsuario_param = 'ROMA' 

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_TB_MovimientosContables_Qry_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_TB_MovimientosContables_Qry_v2_9]

go

create procedure [dbo].[SP_TB_MovimientosContables_Qry_v2_9] 
									@strSQL_param      varchar (1000)='Reporte',
									@dsUsuario_param   varchar (50)='Ezeiza',
									@tpCaja_param      char(2)=null
									-- CL = Caja de los Licenciatarios / CC = Caja de la Cooperativa
									-- CA = Caja de la Administración	
as
begin

/* declare @strSQL_param     as varchar (1000)
declare @dsUsuario_param  as varchar (50)

set @strSQL_param  = ' WHERE nrCaja=9000001101' 
set @dsUsuario_param = 'ROMA' 

		exec ('select IdMovimiento,
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
			  '''+  @dsUsuario_param + '''		
			  from TB_Movimientoscontables '+ @strSQL_param ) 	

*/

	set dateformat dmy

	select		[IdMovimiento]
				,[dsMovimiento]
				,[IdRecibo]
				,[IdProveedor]
				,[dsProveedor]
				,[cdConcepto]
				,[tpConcepto]
				,[dsConcepto]
				,[tpOperacion]
				,[vlPesos]
				,[vlDolares]
				,[vlEuros]
				,[nrRecibo]
				,[nrFactura]
				,[nrCaja]
				,[dsUsuario]
				,[dtMovimiento]
				,[dsObservacion]
				,[nrAnio]
				,[dsUsuario_Supervisor]
				,[nrCajaPuesto]
				,[tpCajaImputacion]
				,[dsUsuarioCajaPuesto] into #rpt_movimientoscontables
	from TB_Movimientoscontables where 1=2


	  insert into #rpt_movimientoscontables  
		   ([IdMovimiento]
			,[dsMovimiento]
			,[IdRecibo]
			,[IdProveedor]
			,[dsProveedor]
			,[cdConcepto]
			,[tpConcepto]
			,[dsConcepto]
			,[tpOperacion]
			,[vlPesos]
			,[vlDolares]
			,[vlEuros]
			,[nrRecibo]
			,[nrFactura]
			,[nrCaja]
			,[dsUsuario]
			,[dtMovimiento]
			,[dsObservacion]
			,[nrAnio]
			,[dsUsuario_Supervisor]
			,[nrCajaPuesto]
			,[tpCajaImputacion]
			,[dsUsuarioCajaPuesto]) 
		exec (' select
				 [IdMovimiento]
				,[dsMovimiento]
				,[IdRecibo]
				,[IdProveedor]
				,[dsProveedor]
				,[cdConcepto]
				,[tpConcepto]
				,[dsConcepto]
				,[tpOperacion]
				,[vlPesos]
				,[vlDolares]
				,[vlEuros]
				,[nrRecibo]
				,[nrFactura]
				,[nrCaja]
				,[dsUsuario]
				,[dtMovimiento]
				,[dsObservacion]
				,[nrAnio]
				,[dsUsuario_Supervisor]
				,[nrCajaPuesto]
				,[tpCajaImputacion]
				,[dsUsuarioCajaPuesto]
			  from TB_Movimientoscontables '+ @strSQL_param ) 		
		/* */

	   select a.*		
	   from #rpt_movimientoscontables a, tb_conceptos b
	   where a.cdConcepto = b.cdConcepto      and
		    (
				 (@tpCaja_param='CC'  and flOcultadoCajaCooperativa=0) or			 
				 (@tpCaja_param='CL'  and flOcultadoCajaLicenciatario=0) or
				 (@tpCaja_param='CA'  and flOcultadoenCajaAdm=0) or
				 (@tpCaja_param is null)
			)

	

end


go
/* cambiar las pantallas para que hagan uso de [SP_TB_MovimientosContables_Qry_v2_9]
	cada vez que requieren visualizar los movimientos contables */ 
Exec SP_TB_MovimientosContables_Qry_v2_9 @strSQL_param = ' WHERE nrCajaPuesto Like (''%%%'')  AND nrCaja=9000001101 ' ,@dsUsuario_param = 'ROMA' 

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_ResumenCajaADM_v2_9]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_ResumenCajaADM_v2_9]

go 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_ResumenCajaADM_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_ResumenCajaADM_v2_9]


GO

CREATE procedure [dbo].[SP_ResumenCajaADM_v2_9]
						@tpCajaImputacion_param as varchar(50)=null,
						@nrCaja_param numeric,
						@tpCaja_param char(2)=null
AS

	SELECT a.tpOperacion, a.nrCaja, b.tpCajaImputacion, a.dsConcepto, SUM(vlPesos) 
		AS SumaPesos, SUM(vlDolares) AS SumaDolares, 
		SUM(vlEuros) AS SumaEuros
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
	where	a.cdConcepto = b.cdConcepto      and
		    (
				 (@tpCaja_param='CC'  and b.flOcultadoCajaCooperativa=0) or			 
				 (@tpCaja_param='CL'  and b.flOcultadoCajaLicenciatario=0) or
				 (@tpCaja_param='CA'  and b.flOcultadoenCajaAdm=0) or
				 (@tpCaja_param is null)
		    )
			and a.nrCaja =  @nrCaja_param 
			and (b.tpCajaImputacion= @tpCajaImputacion_param or @tpCajaImputacion_param is null)
	GROUP BY a.tpOperacion, a.nrCaja, a.dsConcepto,  b.tpCajaImputacion

go 

Exec SP_ResumenCajaADM_v2_9 @nrCaja_param = 9000001101 ,@tpCaja_param = 'CA' , @tpCajaImputacion_param = null
--@tpCajaImputacion_param ='Caja de la Cooperativa' 


go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_SumaCajaADM_v2_9]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_SumaCajaADM_v2_9]

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_SumaCajaADM_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_SumaCajaADM_v2_9]

go

CREATE procedure [dbo].[SP_SumaCajaADM_v2_9]
						@nrCaja_param numeric,
						@tpCaja_param char(2)=null,
						@tpCajaImputacion_param varchar(50)=null
AS
	SELECT SUM(a.vlPesos) AS SumaPesos, SUM(a.vlDolares) 
	    AS SumaDolares, SUM(a.vlEuros) AS SumaEuros, a.tpOperacion, 
	    a.nrCaja
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
		where	a.cdConcepto = b.cdConcepto      and
				(
					 (@tpCaja_param='CC'  and b.flSumaenCajaCooperativa=1) or			 
					 (@tpCaja_param='CL'  and b.flSumaenCajaLicenciatarios=1) or
					 (@tpCaja_param='CA'  and b.flSumaenCajaAdm=1) or
					 (@tpCaja_param is null)
				)
			and (b.tpCajaImputacion=@tpCajaImputacion_param or @tpCajaImputacion_param is null)
			and a.nrCaja =  @nrCaja_param 
	GROUP BY a.tpOperacion, a.nrCaja

GO

Exec SP_SumaCajaADM_v2_9 @nrCaja_param = 9000001101 ,@tpCaja_param = 'CA', @tpCajaImputacion_param=null

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_CalculaSaldoInicial_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_CalculaSaldoInicial_v2_9]

go 

CREATE PROCEDURE [SP_CalculaSaldoInicial_v2_9] 
					       @tpCaja_param char(2)=null,
					       @tpCajaImputacion_param varchar(50)=null,
					       @nrCaja_Param numeric
AS

 declare @vlSaldoInicialPesos    float
 declare @vlSaldoInicialDolares  float 
 declare @vlSaldoInicialEuros    float

 declare @vlSumaPesos_SAL float
 declare @vlSumaDolares_SAL float
 declare @vlSumaEuros_SAL float
 declare @vlSumaPesos_ENT float
 declare @vlSumaDolares_ENT float
 declare @vlSumaEuros_ENT float

 set dateformat dmy 

 SELECT @vlSumaPesos_ENT=  SUM (a.vlPesos)
                         + SUM(a.vlDolares * b.vlDiaDolar)
					     + SUM(a.vlEuros   * b.vlDiaEuro)
 FROM TB_MovimientosContables a, TB_Cajas b, tb_conceptos c
 WHERE a.tpOperacion = 'Entrada de Dinero'  and 
	   a.nrCaja = b.nrCaja                  and
	   a.cdConcepto = c.cdConcepto          and
	   			(
				 (@tpCaja_param='CC'  and c.flSumaenCajaCooperativa=1) or			 
				 (@tpCaja_param='CL'  and c.flSumaenCajaLicenciatarios=1) or
				 (@tpCaja_param='CA'  and c.flSumaenCajaAdm=1) or
				 (@tpCaja_param is null)
				)
	and (c.tpCajaImputacion = @tpCajaImputacion_param or  @tpCajaImputacion_param is null)
        and (a.nrCaja <> @nrCaja_Param or @nrCaja_Param is null)


 SELECT @vlSumaPesos_SAL=  SUM(a.vlPesos)
						 + SUM(a.vlDolares * b.vlDiaDolar)
						 + SUM(a.vlEuros * b.vlDiaEuro)
 FROM TB_MovimientosContables a, TB_Cajas b, tb_conceptos c
 WHERE a.tpOperacion = 'Salida de Dinero'  and 
	   a.nrCaja = b.nrCaja                  and
	   a.cdConcepto = c.cdConcepto          and
			(
				 (@tpCaja_param='CC'  and c.flSumaenCajaCooperativa=1) or			 
				 (@tpCaja_param='CL'  and c.flSumaenCajaLicenciatarios=1) or
				 (@tpCaja_param='CA'  and c.flSumaenCajaAdm=1) or
				 (@tpCaja_param is null)
			)
	and (c.tpCajaImputacion = @tpCajaImputacion_param or  @tpCajaImputacion_param is null)
        and (a.nrCaja <> @nrCaja_Param or @nrCaja_Param is null)

 SELECT  @vlSaldoInicialPesos   = isnull(@vlSumaPesos_ENT-@vlSumaPesos_SAL,0), 
	 @vlSaldoInicialDolares = 0,
	 @vlSaldoInicialEuros   = 0 

 SELECT @vlSaldoInicialPesos   as 'vlSaldoInicialPesos',
        @vlSaldoInicialDolares as 'vlSaldoInicialDolares',
	@vlSaldoInicialEuros   as 'vlSaldoInicialEuros'


 return 1;

go 


exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param=null,
			       	 @tpCajaImputacion_param=null,
	 			 @nrCaja_Param=9000001101

go 

Exec SP_CalculaSaldoInicial_v2_9 @tpCaja_param = 'CL' ,@tpCajaImputacion_param = 'Caja de los Licenciatarios' ,@nrCaja_param = null

go 



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_CalculaSaldoCierre_v2_9]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_CalculaSaldoCierre_v2_9]

go 

CREATE PROCEDURE [SP_CalculaSaldoCierre_v2_9] 
					       @tpCaja_param char(2)=null,
					       @tpCajaImputacion_param varchar(50)=null,
					       @nrCaja_Param numeric
AS

 declare @vlSaldoCierrePesos    float

 declare @vlSumaPesos_SAL float
 declare @vlSumaDolares_SAL float
 declare @vlSumaEuros_SAL float
 declare @vlSumaPesos_ENT float
 declare @vlSumaDolares_ENT float
 declare @vlSumaEuros_ENT float

 set dateformat dmy 

 SELECT @vlSumaPesos_ENT=  SUM (a.vlPesos)
                         + SUM(a.vlDolares * b.vlDiaDolar)
					     + SUM(a.vlEuros   * b.vlDiaEuro)
 FROM TB_MovimientosContables a, TB_Cajas b, tb_conceptos c
 WHERE a.tpOperacion = 'Entrada de Dinero'  and 
	   a.nrCaja = b.nrCaja                  and
	   a.cdConcepto = c.cdConcepto          and
	   			(
				 (@tpCaja_param='CC'  and c.flSumaenCajaCooperativa=1 and a.dtMovimiento>'19/08/2009'  ) or			 
				 (@tpCaja_param='CL'  and c.flSumaenCajaLicenciatarios=1) or
				 (@tpCaja_param='CA'  and c.flSumaenCajaAdm=1) or
				 (@tpCaja_param is null)
				)
	and (c.tpCajaImputacion = @tpCajaImputacion_param or  @tpCajaImputacion_param is null)
        and (a.nrCaja = @nrCaja_Param)


 SELECT @vlSumaPesos_SAL=SUM(a.vlPesos)
			  + SUM(a.vlDolares * b.vlDiaDolar)
			  + SUM(a.vlEuros * b.vlDiaEuro)
 FROM TB_MovimientosContables a, TB_Cajas b, tb_conceptos c
 WHERE a.tpOperacion = 'Salida de Dinero'  and 
	   a.nrCaja = b.nrCaja                  and
	   a.cdConcepto = c.cdConcepto          and
			(
				 (@tpCaja_param='CC'  and c.flSumaenCajaCooperativa=1) or			 
				 (@tpCaja_param='CL'  and c.flSumaenCajaLicenciatarios=1) or
				 (@tpCaja_param='CA'  and c.flSumaenCajaAdm=1) or
				 (@tpCaja_param is null)
			)
	and (c.tpCajaImputacion = @tpCajaImputacion_param or  @tpCajaImputacion_param is null)
        and (a.nrCaja = @nrCaja_Param)

 SELECT  @vlSaldoCierrePesos   = isnull(@vlSumaPesos_ENT-@vlSumaPesos_SAL,0)

 SELECT @vlSaldoCierrePesos   as '@vlSaldoCierrePesos'

 return 1;

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_rpt_resumendecajaadm_v2_9') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_rpt_resumendecajaadm_v2_9]

go 

CREATE procedure SP_rpt_resumendecajaadm_v2_9
						@nrCaja_param numeric,
						@tpCaja_param char(2)=null,
						@tpCajaImputacion_param varchar(50)=null
as
begin
declare @vlSaldoInicialPesos   as float
declare @vlSaldoInicialDolares as float
declare @vlSaldoInicialEuros   as float
declare @vlSaldoCierrePesos    as float


	if @tpCaja_param=''  
		set @tpCaja_param=null

	if @tpCajaImputacion_param=''  
		set @tpCajaImputacion_param=null


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


	SELECT a.tpOperacion, a.nrCaja, b.tpCajaImputacion, a.dsConcepto, SUM(vlPesos) 
		AS SumaPesos, SUM(vlDolares) AS SumaDolares, 
		SUM(vlEuros) AS SumaEuros into  #tmp_ResumenCajaADM_SinPesificar
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
	where	a.cdConcepto = b.cdConcepto      and
		    (
				 (@tpCaja_param='CC'  and b.flSumaenCajaCooperativa=1) or			 
				 (@tpCaja_param='CL'  and b.flSumaenCajaLicenciatarios=1) or
				 (@tpCaja_param='CA'  and b.flSumaenCajaAdm=1) or
				 (@tpCaja_param is null)
		    )
			and a.nrCaja =  @nrCaja_param 
			and (b.tpCajaImputacion= @tpCajaImputacion_param or @tpCajaImputacion_param is null)
	GROUP BY a.tpOperacion, a.nrCaja, a.dsConcepto,  b.tpCajaImputacion



	SELECT  c.nmNombre, 
			c.nmApellido, 
			a.tpOperacion, 
			a.nrCaja, 
			a.dsConcepto, 
			a.SumaPesos, 
			a.SumaDolares, 
			a.SumaEuros, 
			Convert (varchar,b.dtApertura,103) as  'dtApertura',
		        @vlSaldoInicialPesos as 'vlSaldoInicialPesos',
		        @vlSaldoInicialDolares as 'vlSaldoInicialDolares',
		        @vlSaldoInicialEuros as 'vlSaldoInicialEuros',
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
			Convert (varchar,b.dtObservacion,103) as  'dtObservacion'
	FROM #tmp_ResumenCajaADM_SinPesificar a, tb_cajas b, TB_Usuarios c
	WHERE   a.nrCaja    = b.nrCaja and
			b.dsUsuario = c.dsUsuario
	ORDER BY a.tpOperacion asc

end

go 

Exec SP_rpt_resumendecajaadm_v2_9 @tpCaja_param = 'CA' ,@tpCajaImputacion_param = null ,@nrCaja_param = 2000002237


Exec SP_CalculaSaldoCierre_v2_9 @tpCaja_param ='CA' ,@tpCajaImputacion_param = null ,@nrCaja_param = 2000002237

go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].rpt_CierredeCajaADMDetalleControl2_v2_9') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[rpt_CierredeCajaADMDetalleControl2_v2_9]

go 

CREATE procedure rpt_CierredeCajaADMDetalleControl2_v2_9  @nrCaja_param numeric
as
begin



	SELECT DISTINCT 
		      a.nrCaja,
              a.tpOperacion, 
		      a.dsConcepto, 
              b.nrLicencia, 
		      b.tpCupon, 
		      b.nrTalonarioCliente, 
		      b.nrComprabanteCliente, 
              b.vlPagoPesos   AS vlPesos, 
		      b.vlPagoDolares AS vlDolares,
              b.vlPagoEuros   AS vlEuros, 
              b.vlComision, 
		      b.vlMontoCupon,
              a.nrRecibo, 
              b.flCompensado, 
              b.dtCompensado, 
              a.dsUsuario, 
              b.vlIVA
	FROM      TB_MovimientosContables  a, TB_Cupones  b
	where  a.IdRecibo = b.IdRecibo
		and a.nrCaja = @nrCaja_param


end

GO

EXEC rpt_CierredeCajaADMDetalleControl2_v2_9  @nrCaja_param = '9000001101'



go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].rpt_CierredeCajaADMDetalleControl1_v2_9') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[rpt_CierredeCajaADMDetalleControl1_v2_9]


go

CREATE procedure rpt_CierredeCajaADMDetalleControl1_v2_9
						@tpCajaImputacion_param as varchar(50)=null,
						@nrCaja_param numeric,
						@tpCaja_param char(2)=null
AS
begin

	if @tpCajaImputacion_param=' ' 
		 set @tpCajaImputacion_param=null
	if @tpCaja_param=' ' 
		 set @tpCaja_param=null


	
	SELECT convert(varchar,a.dtMovimiento,103) + substring(convert(varchar,a.dtMovimiento,121),11,6) as fechayhora  , a.tpOperacion, a.nrCaja, b.tpCajaImputacion, A.cdConcepto, a.dsConcepto, vlPesos, vlDolares, vlEuros
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
	where	a.cdConcepto = b.cdConcepto      and
		    (
				 (@tpCaja_param='CC'  and b.flOcultadoCajaCooperativa=0) or			 
				 (@tpCaja_param='CL'  and b.flOcultadoCajaLicenciatario=0) or
				 (@tpCaja_param='CA'  and b.flOcultadoenCajaAdm=0) or
				 (@tpCaja_param is null)
		    )
			and a.nrCaja =  @nrCaja_param 
			and (b.tpCajaImputacion= @tpCajaImputacion_param or @tpCajaImputacion_param is null)
			and b.cdConcepto not in (1027, 2020)


end

go

exec rpt_CierredeCajaADMDetalleControl1_v2_9
				 @tpCaja_param='CA',
			     @tpCajaImputacion_param=null,
	 			 @nrCaja_Param=9000001101
go



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_rpt_DetalleFacturaCtaCte_v1') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_rpt_DetalleFacturaCtaCte_v1]

go


CREATE PROCEDURE [SP_rpt_DetalleFacturaCtaCte_v1]
@IdRecibo_param numeric,
@esIdRecibo_param numeric=null
AS

set dateformat dmy

	select @esIdRecibo_param=isnull(@esIdRecibo_param,0)
	
	if @esIdRecibo_param=0
		SELECT TB_Comprobantes.dtComprobante,
			 TB_Comprobantes.dsOpcional1,
			 TB_Comprobantes.dsOpcional2,
		         TB_Cupones.vlMontoCupon, 
			 TB_Cupones.nrTalonarioCliente,
			 TB_Cupones.nrComprabanteCliente,
			 TB_Recibos.IdRecibo,
			 TB_Recibos.dtRecibo,
			 TB_Recibos.cdCliente,
			 TB_Comprobantes.dsRazonSocial
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
		SELECT TB_Comprobantes.dtComprobante,
			 TB_Comprobantes.dsOpcional1,
			 TB_Comprobantes.dsOpcional2,
		              TB_Cupones.vlMontoCupon, 
			 TB_Cupones.nrTalonarioCliente,
			 TB_Cupones.nrComprabanteCliente,
			 TB_Recibos.IdRecibo,
			 TB_Recibos.dtRecibo,
			 TB_Recibos.cdCliente,
			 TB_Comprobantes.dsRazonSocial
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
	
	
go

SP_rpt_DetalleFacturaCtaCte_v1 1000063025

