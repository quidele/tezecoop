


select vlComision  from TB_Cupones 
				where nrComprabanteCliente = 10291
							and nrTalonarioCliente = '0004'

select *  from TB_Comprobantes 
				where nrComprObante = 10291
							and nrTalonario = '0004'


exec sp_obtenerComision_v4_1

sp_helptext 'sp_obtenerComision_v4_1'



exec sp_obtenerComision_v4_1
 @vlTotalGeneral_param    = 305, 
 @tpComision_param        = 'A Clientes',  
 @tpCliente_param         = 'RA',  
 @dsCodigoDestinos_param  = '''Contado'',4008,305' 
 
 
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



