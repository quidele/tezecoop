-- cambios de DDL version 2.6
use dbSG2000
go

-- Programacion de las imputaciones, apertura en dos cajas

ALTER TABLE  [TB_Conceptos] ADD 
	tpCajaImputacion varchar(50); -- Caja de los Licenciatarios / Caja de la Cooperativa

go 


ALTER TABLE  [TB_Conceptos] ADD 
	tpCreadoPor varchar(20); -- Sistema / Usuario

go 

ALTER TABLE  [TB_MovimientosContables] ADD 
	nrCajaPuesto  	numeric(18, 0); 

go 

/**********************************************************/
/*  Division de cajas 					  */

---	cdConcepto	dsConcepto			tpOperacion		tpCajaImputacion		tpCreadoPor
---	1028	Ingreso de dinero por comisiones	Entrada de Dinero	Caja de la Cooperativa		Sistema
---	1063	Cobro de Cta. cte.			Entrada de Dinero	Caja de la Cooperativa		Sistema
---	1027	Pago a los Licenciatarios		Salida de Dinero	Caja de los Licenciatarios	Sistema
---	1064	Cobro IVA al Licenciatario		Entrada de Dinero	Caja de la Cooperativa		Sistema
---	2000	Ingreso de dinero caja de los puestos	Entrada de Dinero	Caja de los Licenciatarios	Sistema
---	2001	Diferencia operadora(+) 		Entrada de Dinero	Caja de la Cooperativa		Sistema
---	2002	Diferencia operadora(-) 		Salida de Dinero	Caja de la Cooperativa		Sistema

go 

-- drop procedure SP_grabarMovimientoContable_v2_5

alter /* create */  procedure SP_grabarMovimientoContable_v2_5(
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

/**********************************************************/
/*  Division de cajas 					  */

---	cdConcepto	dsConcepto			tpOperacion		tpCajaImputacion		tpCreadoPor
---	1028	Ingreso de dinero por comisiones	Entrada de Dinero	Caja de la Cooperativa		Sistema
---	1063	Cobro de Cta. cte.			Entrada de Dinero	Caja de la Cooperativa		Sistema
---	1027	Pago a los Licenciatarios		Salida de Dinero	Caja de los Licenciatarios	Sistema
---	1064	Cobro IVA al Licenciatario		Entrada de Dinero	Caja de la Cooperativa		Sistema
---	2000	Ingreso de dinero caja de los puestos	Entrada de Dinero	Caja de los Licenciatarios	Sistema
---	2001	Diferencia operadora(+) 		Entrada de Dinero	Caja de la Cooperativa		Sistema
---	2002	Diferencia operadora(-) 		Salida de Dinero	Caja de la Cooperativa		Sistema


-- drop procedure SP_realizarImputacionCajaPuesto_v2_5

alter /* create */   procedure SP_realizarImputacionCajaPuesto_v2_5
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
	exec SP_grabarMovimientoContable_v2_5 
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


		---    1028			Ingreso de dinero por comisiones	
		---    Entrada de Dinero	Caja de la Cooperativa		Sistema


		---	2001	Diferencia operadora(+) 		
		---     Entrada de Dinero	Caja de la Cooperativa		Sistema
		---	2002	Diferencia operadora(-) 		
		---     Salida de Dinero	Caja de la Cooperativa		Sistema

	
end

go 

