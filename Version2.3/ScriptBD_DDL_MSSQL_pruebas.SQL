-- cambios de DDL version 2.3
use dbSG2000_Pruebas
go

-- MSSQL version 2.3
ALTER TABLE [dbo].[TB_Comisiones] ADD 
	[tpComision] [varchar]  (50) NULL;


go


alter procedure SP_validarComision(
@cdComision_param  int,
@tpComision_param  varchar(50),
@vlMontoMinimo_param float, 
@vlMontoMaximo_param float)
as

/*
declare @cdComision_param int 
declare @tpComision_param  varchar(50)
declare @vlMontoMinimo_param float 
declare @vlMontoMaximo_param float


set @cdComision_param=4003
set @tpComision_param='Viaje' 
set @vlMontoMinimo_param=33
set @vlMontoMaximo_param= 44.99 


select *
		       from   TB_Comisiones
		       where  flEliminar=0 
			      and cdComision<>@cdComision_param
			      and tpComision=@tpComision_param 
			      and
			        ((@vlMontoMinimo_param between vlMontoMinimo and vlMontoMaximo)
			         OR
			        (@vlMontoMaximo_param between vlMontoMinimo and vlMontoMaximo))

*/

     if @tpComision_param='Retorno'
     begin
	  if exists (select  1 from   TB_Comisiones
			       where  flEliminar=0 
				      and cdComision<>@cdComision_param
				      and tpComision=@tpComision_param)
			select 'NO' as 'Resultado', 'Ya existe una comisión para retorno, imposible ingresar otra.' as 'Mensaje' 
	      else
			select 'SI' as 'Resultado';
	      return 1; 
     end


     if exists (select  1 from   TB_Comisiones
		       where  flEliminar=0 
			      and cdComision<>@cdComision_param
			      and tpComision=@tpComision_param 
			      and
			        ((@vlMontoMinimo_param between vlMontoMinimo and vlMontoMaximo)
			         OR
			        (@vlMontoMaximo_param between vlMontoMinimo and vlMontoMaximo))) 
		select 'NO' as 'Resultado', 'El rango de ''Monto Mínimo'' y ''Monto Máximo'' ingresado no es válido' as 'Mensaje'
      else
		select 'SI' as 'Resultado'
 
     
GO

-- obtiene la comision para los casos de retornos
alter procedure SP_obtenerComisionRetorno
(@vlTotalGeneral_param    float,
 @tpComision_param       varchar(50),
 @tpCliente_param        varchar(20),
 @dsCodigoDestinos_param varchar(100)=null)
as
begin

  -- version anterior
  select vlConcepto  as 'vlComision' from TB_Conceptos
  where tpConcepto='Valor Comisión Retorno' and  flEliminar=0

  return;

  if exists (select  1 from   TB_Comisiones
			       where  flEliminar=0 
				      and tpComision=@tpComision_param
				      and @vlTotalGeneral_param = vlMontoMinimo
				      -- and @vlTotalGeneral_param between vlMontoMinimo and vlMontoMaximo
				      )
  	select 'vlComision'=CASE  @tpCliente_param 
	        WHEN 'A Empleados' THEN vlComisionEmpleados 		 
	        ELSE vlComision
		END
	        from TB_Comisiones
			       where  flEliminar=0 
				      and tpComision=@tpComision_param
				      and @vlTotalGeneral_param = vlMontoMinimo
				      --and @vlTotalGeneral_param between vlMontoMinimo and vlMontoMaximo
  else
	select 'vlComision'=CASE @tpCliente_param 
	        WHEN 'A Empleados' THEN vlComisionEmpleados 		 
	        ELSE vlComision
		END
	        from TB_Comisiones
			       where  flEliminar=0 
				      and @vlTotalGeneral_param between vlMontoMinimo and vlMontoMaximo	
  if @@rowcount<=0
	  select 'vlComision'=0


end -- fin del procedure SP_obtenerComisionRetorno

go 


--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
-- para el disenadoir de sitio
CREATE VIEW dbo.VW_Productos
AS
SELECT cdProducto, dsProducto, vlPrecioViaje, vlPrecioPeaje, 
    vlPorcentaje, tpOperacion, flMuestra
FROM TB_Productos where
flMuestraenlaWEB =1 and flEliminar=0



go

ALTER TABLE [dbo].[TB_Productos] ADD 
	[flMuestraenlaWEB]   bit default (0);


go 



alter procedure sco_ExisteVoucherRetorno(@nrVoucherRetorno_param int)
as
begin


	select  * into #tmp_VouchersRetorno_Existe from   TB_VouchersRetorno
		       where nrVoucherRetorno=@nrVoucherRetorno_param and
			     nrAnio=year(getdate())
	if @@rowcount>0
		select 'SI' as 'Resultado',* from #tmp_VouchersRetorno_Existe
      else
		select 'NO' as 'Resultado'


end

go 

ALTER TABLE [dbo].[TB_Productos] ADD 
	[flIncluyeComisionRetorno]   bit default (0);


go 


create procedure rpt_ComprobantesManuales_cajapuesto_v2_3
@nrCaja_param  numeric
as
begin 

	SELECT
		a.nrCaja, 
		a.flestado,
		a.nrPuesto,
		b.nmEmpleado,
		b.nrTalonario, 
		b.nrComprobante, 
		b.tpComprobante,
		b.cdCondVenta, 
		b.vlPagoPesos, 
		b.vlPagoEuros,
		b.vlPagoDolares, 
		b.nrLicencia, 
		b.dsOpcional1, 
		b.flAnulado, 
		b.nmEmpleado,
		b.flManual,
		b.dsOpcional2
	FROM
		TB_Cajas a,
		TB_Comprobantes b
	WHERE
		a.nrCaja = b.nrCaja
		and a.nrCaja =  @nrCaja_param 
		and b.flManual in ('M')
	ORDER BY
	       b.nrComprobante ASC
	     

end
