Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


create   procedure sp_obtenerCondVentayValoresdePagosModificados_v3_7
	(@cdCondVenta_param       as varchar(50), 
	 @cdCondVenta_new_param   as varchar(50),
	 @vlPagoPesos_param        float,
	 @vlPagoDolares_param      float,
	 @vlPagoEuros_param        float,
	 @vlTotalGeneral  as float,
	 @vlPagoReales_param        float)      
as
begin
declare @vlPagoPesos      as float
declare @vlPagoDolares    as float
declare @vlPagoEuros   	  as float
declare @vlPagoReales     as float
declare @vlPagoPesosACP   as float -- ACP Actualizacion Caja Puesto
declare @vlPagoDolaresACP as float
declare @vlPagoEurosACP   as float
declare @vlPagoRealesACP   as float

declare @error            as varchar(100)

	if @cdCondVenta_param=@cdCondVenta_new_param 
	begin 
		select @error = 'La condicion de venta no ha sido modificada.'
		raiserror (@error, 16, 1)
		return 0
	end 

	if @cdCondVenta_param='Contado' 
	begin 
	    select     @vlPagoPesos= 0,	
                   @vlPagoDolares = 0,
       	           @vlPagoEuros = 0,
       	           @vlPagoReales = 0,
		           @vlPagoPesosACP= (-1) * abs(isnull(@vlPagoPesos_param,0)),	  -- actualiza caja puesto
                   @vlPagoDolaresACP = (-1)* abs(isnull(@vlPagoDolares_param,0)),
       	           @vlPagoEurosACP = (-1)* abs(isnull(@vlPagoEuros_param,0)),
				   @vlPagoRealesACP = (-1)* abs(isnull(@vlPagoReales_param,0))
	end

	if @cdCondVenta_param<>'Contado' 
	begin 
	    select  @vlPagoPesos = case @cdCondVenta_new_param    -- actualiza caja puesto
								when 'Contado' then @vlTotalGeneral
							     else 0 
								end,	
				@vlPagoDolares = 0,
				@vlPagoEuros = 0,
				@vlPagoReales = 0,
 				@vlPagoPesosACP= case @cdCondVenta_new_param    -- actualiza caja puesto
								 when 'Contado' then @vlTotalGeneral
								 else 0 
								end,							
                @vlPagoDolaresACP = 0,
   	            @vlPagoEurosACP = 0,
   	            @vlPagoRealesACP = 0
	end

	select 	@vlPagoPesos      as  vlPagoPesos,
		    @vlPagoDolares    as  vlPagoDolares,
		    @vlPagoEuros      as  vlPagoEuros,
		    @vlPagoReales     as  vlPagoReales,
		    @vlPagoPesosACP   as  vlPagoPesosACP,
            @vlPagoDolaresACP as  vlPagoDolaresACP,
            @vlPagoEurosACP   as  vlPagoEurosACP,
            @vlPagoRealesACP  as  vlPagoRealesACP


end

