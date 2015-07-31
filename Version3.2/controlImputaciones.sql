USE dbSG2000

go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_obtiene_saldo_caja_lic_3]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_obtiene_saldo_caja_lic_3]

go 
create  procedure sp_obtiene_saldo_caja_lic_3  
@nrCaja_param numeric
as
begin
declare @fecha_corte datetime

		SELECT --dtCupon, nrLicencia,
		       a.tpCupon,
		       suma_vlPagoPesos = CASE a.tpCupon
			 WHEN 'Contado' THEN  isnull(SUM(a.vlPagoPesos)- sum(a.vlComision+isnull(a.vlIVA,0)),0)
		         WHEN 'Cuenta Corriente' THEN isnull(SUM(a.vlMontoCupon)- sum(vlComision+isnull(a.vlIVA,0)),0)
		         WHEN 'Retorno' THEN isnull(SUM(0)- sum(vlComision+isnull(a.vlIVA,0)),0)
		         WHEN 'Cobro en Destino' THEN isnull(SUM(0)- sum(vlComision+isnull(a.vlIVA,0)),0)
		       END,
		       isnull(SUM(a.vlPagoEuros),0)   AS   suma_vlPagoEuros, 
		       isnull(SUM(a.vlPagoDolares),0) AS   suma_vlPagoDolares INTO #tb_falta_compensar_agrupado_sin_restri1
		FROM TB_Cupones a, tb_cajas b, tb_Comprobantes c  ---, #tmp_Licencias b
		WHERE  (c.flAnulado = 0) AND 
		    a.tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND 
		    a.nrLicencia not in (998,999) and c.nrCaja = b.nrCaja  and 
		    c.nrCaja = @nrCaja_param	and
		    a.nrTalonarioCliente = c.nrTalonario       and
		    a.nrComprabanteCliente = c.nrComprobante   and
		    a.tpLetraCliente = c.tpLetra               and
		    a.tpComprobanteCliente = c.tpComprobante

		Group by tpCupon

		select isnull(sum(suma_vlPagoPesos),0) as suma_vlPagoPesos,
		       isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares,
		       isnull(sum(suma_vlPagoEuros),0) as suma_vlPagoEuros
		from #tb_falta_compensar_agrupado_sin_restri1

end -- fin de procedure


GO



go 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_obtiene_saldo_caja_lic_4]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_obtiene_saldo_caja_lic_4]

go



create procedure sp_obtiene_saldo_caja_lic_4 
@nrCaja_param numeric
as
begin 

  select a.tpOperacion , abs(sum(vlPesoS)) as suma_vlPagoPesos, abs(sum(a.vlDolares)) AS   suma_vlPagoDolares , abs(sum(a.vlEuros))   AS   suma_vlPagoEuros
  into #tb_falta_compensar_agrupado_sin_restri2
  from tb_movimientosContables a, tb_conceptos b
  where a.nrCajaPuesto = @nrCaja_param   and  a.tpOperacion='Entrada de Dinero' and  a.tpCajaImputacion='Caja de los Licenciatarios'
	and b.flSumaenCajaLicenciatarios=1 and
	a.cdConcepto = b.cdConcepto
  group by a.tpOperacion

  insert into #tb_falta_compensar_agrupado_sin_restri2
  select a.tpOperacion , -abs(sum(a.vlPesoS)) as suma_vlPagoPesos, -abs(sum(a.vlDolares)) AS   suma_vlPagoDolares , -abs(sum(a.vlEuros))   AS   suma_vlPagoEuros
  from tb_movimientosContables a, tb_conceptos b
  where a.nrCajaPuesto = @nrCaja_param   and  a.tpOperacion='Salida de Dinero'   and   a.tpCajaImputacion='Caja de los Licenciatarios' 
	and b.flSumaenCajaLicenciatarios=1 and
	a.cdConcepto = b.cdConcepto
  group by a.tpOperacion


  select sum(suma_vlPagoPesos) * (-1) as suma_vlPagoPesos ,  sum(suma_vlPagoDolares)* (-1) as suma_vlPagoDolares,  sum(suma_vlPagoEuros) * (-1) as suma_vlPagoEuros from 
  #tb_falta_compensar_agrupado_sin_restri2

end

go 
 
	drop table temp_ChequeaSaldosImputados;
	drop table temp_SaldosImputadosIncorrectos;

go 

	create table temp_ChequeaSaldosImputados
                (suma_vlPagoPesos       float null,
		suma_vlPagoDolares     float null,
		suma_vlPagoEuros       float null)


	create table temp_SaldosImputadosIncorrectos
			(nrCajaPuesto          numeric null,
	                suma_vlPagoPesos       float null,
			suma_vlPagoDolares     float null,
			suma_vlPagoEuros       float null)

	declare @nrCajaPuestoImputada numeric 
        declare @suma_vlPagoPesos       float 
        declare @suma_vlPagoDolares     float 
        declare @suma_vlPagoEuros       float 


	declare   tmp_cajas_imputadas cursor for select nrCaja from tb_cajas where flimputado = 1;
		
	-- Abrimos el cursor
	OPEN tmp_cajas_imputadas

	FETCH NEXT FROM tmp_cajas_imputadas INTO @nrCajaPuestoImputada

	WHILE (@@FETCH_STATUS <> -1)
	BEGIN		


		delete from temp_ChequeaSaldosImputados;

	        set @suma_vlPagoPesos       = 0 
	        set @suma_vlPagoDolares     = 0
	        set @suma_vlPagoEuros       = 0

		insert into temp_ChequeaSaldosImputados exec sp_obtiene_saldo_caja_lic_3 @nrCaja_param=@nrCajaPuestoImputada
		insert into temp_ChequeaSaldosImputados exec sp_obtiene_saldo_caja_lic_4 @nrCaja_param=@nrCajaPuestoImputada

		select  @suma_vlPagoPesos=isnull(sum(suma_vlPagoPesos),0) ,
		        @suma_vlPagoDolares=isnull(sum(suma_vlPagoDolares),0) , 
                        @suma_vlPagoEuros=isnull(sum(suma_vlPagoEuros),0)
		from temp_ChequeaSaldosImputados

                if (@suma_vlPagoPesos + @suma_vlPagoDolares  + @suma_vlPagoEuros <>0) 
			insert into temp_SaldosImputadosIncorrectos values  (@nrCajaPuestoImputada,
									     @suma_vlPagoPesos,
						     		             @suma_vlPagoDolares,
							                     @suma_vlPagoEuros)

		FETCH NEXT FROM tmp_cajas_imputadas INTO @nrCajaPuestoImputada
	 
	END

	--Cerramos el cursor
	CLOSE tmp_cajas_imputadas;
	
	
	-- lo sacamos de la memoria
	DEALLOCATE tmp_cajas_imputadas;


	select * from temp_SaldosImputadosIncorrectos 


go 

--Exec SP_obtenerImputacion_v2_9 @nrCaja_param = 3000000032 ,@AsientoModelo_param = 'REGISTRACION_CAJA_PUESTO' 

go
/*
select distinct nrCajapuesto  from tb_cajas a , tb_movimientoscontables b
where  a.dtApertura>'24/09/2009 00:00:00.000'  and
       b.nrCajaPuesto =  a.nrCaja

exec sp_obtiene_saldo_caja_lic_3 @nrCaja_param=2000004632
exec sp_obtiene_saldo_caja_lic_4 @nrCaja_param=2000004632

analisis particular 
	1000004807      
	-4898.0   
	-277.0
	0.0
	
select b.cdConcepto, b.dsConcepto, b.tpOperacion, b.flSumaenCajaLicenciatarios, b.tpCajaimputacion from tb_movimientoscontables a, tb_conceptos b where a.nrCajaPuesto = 2000004632  and  a.dsMovimiento like '%CD%' and
a.cdConcepto = b.cdConcepto   order by b.tpCajaImputacion


select * from tb_Comprobantes where nrCaja = 2000004632  and tpCupon='Cobro en Destino'

select * from tb_Cupones where nrTalonarioCliente = '0005' and nrComprabanteCliente ='00000625' and tpLetraCliente = 'A'


*/

   






