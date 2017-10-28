-- Cambios de DDL version 4.9.830
use dbSG2000
go



--exec [dbo].[spu_conciliarAutomaticamente_v4_9_900] @idArchivo=414
-- exec [dbo].[spu_conciliarAutomaticamente_v4_9_900] @idArchivo=416

if NOT EXISTS (select * from sys.procedures where name  = 'spu_conciliarAutomaticamente_bkp_antes_v4_9_830') 
	EXEC sp_rename 'spu_conciliarAutomaticamente' , 'spu_conciliarAutomaticamente_bkp_antes_v4_9_830'
-- drop procedure spu_conciliarAutomaticamente_bkp_antes_v4__830
/*
sp_help 'dbo.spu_conciliarAutomaticamente'
sp_help 'dbo.spu_conciliarAutomaticamente_bkp_antes_v4__830'
*/
GO

IF   EXISTS (select * from sys.procedures where name  = 'spu_conciliarAutomaticamente') 
BEGIN
	DROP PROCEDURE  dbo.spu_conciliarAutomaticamente
END

GO

create procedure dbo.spu_conciliarAutomaticamente (@idArchivo int) 
as
begin 
DECLARE @formato VARCHAR(10)

	/* select 'OK' as resultado , 'en el store debemos desarrollar toda la logica de la conciliacion' descripcion_error 
	return; 
	-- SP_HELP 'TB_ArchivoTarjetaDetalle'
	drop table #tmpArchivoaConciliar
	drop table #tmpViajesesaConciliar
	drop table #tmpViajesConciliados 
	*/

	
	SELECT @formato = formato 
			  FROM TB_ArchivoTarjeta WHERE id = @idArchivo



	SELECT Id, idarchivo, fechaPresentacion, importe, fechaPago, 
		    tarjeta, comprobante, moneda, contenido, dtInsercion, 
			nrCupon, convert(int,0) as comprobante_numerico, 
			convert(int,0) as tarjeta_numerico,
			convert(float,0) as importe_numerico
			into #tmpArchivoaConciliar
			  FROM TB_ArchivoTarjetaDetalle WHERE idarchivo = @idArchivo

	update #tmpArchivoaConciliar set comprobante_numerico = convert(int,comprobante) where ISNUMERIC(comprobante) = 1
	update #tmpArchivoaConciliar set tarjeta_numerico = convert(int,comprobante) where ISNUMERIC(tarjeta_numerico) = 1
	update #tmpArchivoaConciliar set importe_numerico = convert(float,comprobante) where ISNUMERIC(importe_numerico) = 1

	-- select top 10 * from #tmpArchivoaConciliar

	select c.nrCupon, c.dtCupon, c.nrLicencia, c.tpComprobanteCliente, 
		   c.tpLetraCliente , c.nrTalonarioCliente , c.nrComprabanteCliente,  c.vlMontoCupon ,
		   c.nrTarjeta, c.tpDocTarjeta,  c.nrDocTarjeta  , nrCuponPosnet , convert(int,0)  nrCuponPosnet_numerico,
		   convert(int,0) as nrTarjeta_numerico,
		   convert(float,0) as vlMontoCupon_numerico
		    into #tmpViajesesaConciliar
			from  TB_Cupones c
					where (c.flCobradoalCliente = 0 ) and  (c.flCompensado = 0)
                           and   (c.flAnulado = 0)
                           and   ((tpCupon in  ('Tarjeta de Crédito', 'Tarjeta de Débito')   and  @formato <>'AMCA' ) 
									OR
								   (tpCupon in  ('Todo Pago')   and  @formato = 'AMCA' )) 
								   
						   -- falta agregar que no haya sido conciliado anteriormente 
    
	/* 
	select * from #tmpViajesesaConciliar
	return;
	*/

	update #tmpViajesesaConciliar  set nrCuponPosnet_numerico = convert(int,replace(nrCuponPosnet, '.','')) where ISNUMERIC(replace(nrCuponPosnet,'.','')) = 1
	update #tmpViajesesaConciliar  set nrTarjeta_numerico = convert(int,nrTarjeta_numerico) where ISNUMERIC(replace(nrTarjeta_numerico,'.','')) = 1
	update #tmpViajesesaConciliar  set vlMontoCupon_numerico = convert(float,vlMontoCupon_numerico) where ISNUMERIC(replace(vlMontoCupon_numerico,'.','')) = 1
	
	--select * from #tmpViajesesaConciliar

	-- nrNivelConciliacion 1 - mas representativo                                   
	-- drop table  #tmpViajesConciliados           
	select  x.Id , y.nrCupon , 1 as nrNivelConciliacion   into #tmpViajesConciliados 
	from #tmpArchivoaConciliar	 x inner join #tmpViajesesaConciliar y
					on x.comprobante = y.nrCuponPosnet  and x.tarjeta = y.nrTarjeta
							and x.importe = y.vlMontoCupon
	
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 1 as nrNivelConciliacion  
	from #tmpArchivoaConciliar	 x inner join #tmpViajesesaConciliar y
					on x.comprobante_numerico = y.nrCuponPosnet_numerico  and x.tarjeta = y.nrTarjeta
							and x.importe = y.vlMontoCupon						
	where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)

	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 1 as nrNivelConciliacion  
	from #tmpArchivoaConciliar	 x inner join #tmpViajesesaConciliar y
					on x.comprobante_numerico = y.nrCuponPosnet_numerico  and x.tarjeta_numerico = y.nrTarjeta_numerico
							and x.importe_numerico = y.vlMontoCupon_numerico	
	where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)

	--select * from #tmpViajesConciliados

	-- nrNivelConciliacion 2 
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 2 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on (x.comprobante = y.nrCuponPosnet  and x.tarjeta = y.nrTarjeta )
							-- and x.importe = y.vlMontoCupon
							where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)

	--select * from #tmpViajesConciliados

	-- nrNivelConciliacion 2 
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 2 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.comprobante = y.nrCuponPosnet  and x.importe = y.vlMontoCupon
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)

	--select * from #tmpViajesConciliados

	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 2 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.tarjeta = y.nrTarjeta  and x.importe = y.vlMontoCupon
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)


	-- nrNivelConciliacion 2 
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 2 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.tarjeta_numerico = y.nrTarjeta_numerico 
					 and x.importe_numerico = y.vlMontoCupon_numerico
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)
	--select * from #tmpViajesConciliados


-- nrNivelConciliacion 3
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 3 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.tarjeta = y.nrTarjeta
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)
	--select * from #tmpViajesConciliados

-- nrNivelConciliacion 3 
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 3 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.tarjeta_numerico = y.nrTarjeta_numerico 
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)
	--select * from #tmpViajesConciliados



	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 3 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.comprobante = y.nrCuponPosnet
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)


	-- nrNivelConciliacion 2 
	insert into  #tmpViajesConciliados 
	select  x.Id , y.nrCupon , 3 as nrNivelConciliacion   
	from #tmpArchivoaConciliar x inner join #tmpViajesesaConciliar y
					on x.comprobante_numerico = y.nrCuponPosnet_numerico
						where  y.nrCupon not in (select nrCupon from #tmpViajesConciliados)
	--select * from #tmpViajesConciliados

	--return; 

	update x set  x.nrCupon = y.nrCupon , x.nrNivelConciliacion = y.nrNivelConciliacion  from TB_ArchivoTarjetaDetalle   x  inner join #tmpViajesConciliados  y
					on x.Id = y.Id 

	-- para AMEX asignamos la fecha de pago como fecha de cupon mas 10 dias
	update x set  x.fechaPago = y.dtCupon + 10  from TB_ArchivoTarjetaDetalle   x  inner join tb_cupones  y 
										ON  x.nrCupon = y.nrCupon 
					where x.idarchivo = @idArchivo and  @formato like  '%Amca%' 

	update x set  x.fechaPago = x.fechaPresentacion FROM TB_ArchivoTarjetaDetalle   x  
					where x.idarchivo = @idArchivo and  x.fechaPago is null


	update x set  x.nrNivelConciliacion = -1  from TB_ArchivoTarjetaDetalle   x 
	where x.nrNivelConciliacion is null
	 
	
	select 'OK' as resultado , 'EULISES' descripcion_error 

end


