USE [dbSG2000]
GO

  --- verificar lo valores de comision 
  select *  from tb_cupones where vlComision = 3 and tpCupon ='Retorno' and
  dtCupon >= GETDATE()-100 and vlMontoCupon = 98 and flCompensado =0  
  order by dtCupon desc
  
  --- actualizamos los valores
  update tb_cupones set vlaFavorAdmin=3 ,vlComision = 3 where vlComision = 0 and tpCupon ='Retorno' and
  dtCupon > GETDATE()-8 and vlMontoCupon = 98 and flCompensado =0  ;

-- ver cajas abiertas
select * from tb_Cajas where flestado =0

select * from tb_usuarios where dsUsuario = 'VRIVEROS'

go 

  -- para retornos de $ 88 
  select *  from tb_cupones where vlComision = 0 and tpCupon ='Retorno' and
  dtCupon >= GETDATE()-100 and vlMontoCupon = 88 and flCompensado =0  
  order by dtCupon desc
  
  --- actualizamos los valores
  update tb_cupones set vlaFavorAdmin=3 ,vlComision = 3 where vlComision = 0 and tpCupon ='Retorno' and
  dtCupon > GETDATE()-8 and vlMontoCupon = 88 and flCompensado =0;
  

GO

ALTER procedure [dbo].[SP_obtenerComisionRetorno_v3_4]
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

exec [dbo].[SP_obtenerComisionRetorno_v3_4]
 @vlTotalGeneral_param   = 98,
 @tpComision_param       = 'Retorno',
 @tpCliente_param        = 'A Clientes',
 @dsCodigoDestinos_param = null