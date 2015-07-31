-- Cambios de DDL version 3.4
use dbSG2000
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_Productos' and COLUMN_NAME='tpDestino')
ALTER TABLE  [TB_Productos] ADD  tpDestino varchar(20); -- Retorno / Centro

go


select * from tb_productos where dsProducto like '%retorno%'
select * from tb_productos where dsProducto like '%centro%'

go 

ALTER PROCEDURE [dbo].[sco_TB_Productos] AS
	
	select  cdProducto,
	        dsProducto,
	        vlPrecioViaje,
	        vlPrecioPeaje, 
	        vlPorcentaje, 
	        tpOperacion,
			flMuestra, 
			vlKilometros,
			tpDestino 
	FROM TB_Productos
	where flEliminar=0 and
	      flMuestra=1
	Order by dsProducto;


go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_obtenerComisionRetorno_v3_4]'))
drop procedure [dbo].[SP_obtenerComisionRetorno_v3_4]

go

CREATE procedure SP_obtenerComisionRetorno_v3_4
(@vlTotalGeneral_param    float,
 @tpComision_param       varchar(50),
 @tpCliente_param        varchar(20),
 @dsCodigoDestinos_param varchar(100)=null)
as
begin
declare @destinos_predefinidos as integer
declare @vlComision           as float

  set @destinos_predefinidos=0


  
  SELECT @vlComision=CASE  @tpCliente_param 
	        WHEN 'A Empleados' THEN vlComisionEmpleados 		 
	        ELSE vlComision
		END
  FROM  TB_Comisiones
  WHERE (tpComision = 'Retorno') AND (flEliminar = 0)

  select @destinos_predefinidos=count(*) from tb_productos 
	where tpDestino='Retorno' and  vlPrecioViaje=@vlTotalGeneral_param


  if @destinos_predefinidos>0 
  begin
	  print 'INGRESA POR @destinos_predefinidos'
	  select @vlComision 'vlComision'
	  return;
  end	

  print 'INGRESA POR sale por valores segun tabla'

  SELECT 'vlComision'=CASE  @tpCliente_param 
	        WHEN 'A Empleados' THEN a.vlComisionEmpleados 		 
	        ELSE a.vlComision
		END
  FROM   TB_Comisiones   a
  WHERE  a.flEliminar = 0  AND
         a.vlMontoMinimo <= @vlTotalGeneral_param  AND
         a.vlMontoMaximo >= @vlTotalGeneral_param  AND
	 a.tpComision = 'Viaje'

  if @@rowcount<=0
	  select 'vlComision'=0


end -- fin del procedure SP_obtenerComisionRetorno

go

Exec SP_obtenerComisionRetorno_v3_4 @vlTotalGeneral_param = 88 ,@tpComision_param = 'Retorno' ,@tpCliente_param = 'A Empleados' ,@dsCodigoDestinos_param = '90044' 


