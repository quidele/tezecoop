-- Cambios de DDL version 4.9
use dbSG2000
go

if exists (SELECT * FROM INFORMATION_SCHEMA.ROUTINES where SPECIFIC_NAME ='SP_Supera_KM_IVA_segunMonto_4_9' )
	drop procedure  dbo.SP_Supera_KM_IVA_segunMonto_4_9

go
	

CREATE procedure SP_Supera_KM_IVA_segunMonto_4_9
(@tpCategoriaIVA_param varchar(5)=null,
@vlKilometros_param   int=0,
@vlMonto_param	      float=0,
@tpComprobante_param  char(2))
as
begin
declare @precio_km float
declare @Kilometros_IVA int

	if @tpComprobante_param = 'NC' or  @tpComprobante_param = 'NC' 
		select 'N' as RESPUESTA,0  as Kilometros, 'N' as Pregunta
	
	
	set @precio_km=0
	set @Kilometros_IVA=0
	
	select @precio_km=replace(vlParametro,',','.') from tb_Parametros where dsParametro='PRECIO_KM'
	select @Kilometros_IVA=replace(vlParametro,',','.') from tb_Parametros where dsParametro='KM_IVA'
	

	if @vlKilometros_param>0 and @vlKilometros_param>=@Kilometros_IVA 
	begin
		select 'S' as RESPUESTA, @vlKilometros_param as Kilometros, 'N' as Pregunta
		return
	end 


	select @precio_km=replace(vlParametro,',','.') from tb_Parametros where dsParametro='PRECIO_KM'

	if @precio_km>0 and (@vlMonto_param/@precio_km)>=@Kilometros_IVA
		select 'S' as RESPUESTA,(@vlMonto_param/@precio_km) as Kilometros, 'S' as Pregunta
	ELSE
		select 'N' as RESPUESTA,0  as Kilometros, 'N' as Pregunta

end 