-- Obtener el ingreso por comisión de los viajes pagados posterior a la fecha de 
-- la implementación de la nueva versión, que pertenecen a las cajas no imputadas por el nuevo método.



	 --No imputados nuevo metodo - Viajes ya Compensados 

		set dateformat dmy

		SELECT sum(a.vlComision+isnull(a.vlIVA,0)) [Comisión + Iva], count(*) [Cantidad de viajes]
		FROM TB_Cupones a, tb_cajas b
		WHERE  (flAnulado = 0) AND 
		    a.tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND 
		    a.nrLicencia not in (998,999)
		    and   a.flCompensado = 1  and   dtCompensado >= '25/09/2009 00:00:00.000'  and  
		    a.nrCajaCliente = b.nrCaja and 
		    b.flImputado is null and b.dtApertura<'25/09/2009 00:00:00.000' and b.nrPuesto<>9


			set dateformat dmy


			select top 100 *   from tb_cajas  where flImputado is null and dtApertura<'25/09/2009 00:00:00.000' and nrPuesto<>9
			order by dtApertura desc 
			
			
			
			select * from tb_MovimientosContables   where 
			cdConcepto in (2022,2023)


	 	-- No imputados nuevo metodo - Viajes No Compensados 

		set dateformat dmy

		SELECT sum(a.vlComision+isnull(a.vlIVA,0)) [Comisión + Iva], count(*) [Cantidad de viajes]
		FROM TB_Cupones a, tb_cajas b
		WHERE  (flAnulado = 0) AND 
		    a.tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') AND 
		    a.nrLicencia not in (998,999)
		    and   a.flCompensado = 0  and  /* dtCompensado >= '25/09/2009 00:00:00.000'  and */ 
		    a.nrCajaCliente = b.nrCaja and 
		    b.flImputado is null and b.dtApertura<'25/09/2009 00:00:00.000' and b.nrPuesto<>9



		-- Suma Retenciones cajas del 26 y 27 - Viajes Compensados y No Compensados


		set dateformat dmy

		SELECT sum(a.vlComision+isnull(a.vlIVA,0)) [Comisión + Iva], count(*) [Cantidad de viajes]
		FROM TB_Cupones a
		WHERE  (flAnulado = 0) AND 
		    a.tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino')  and
		    a.nrLicencia not in (998,999) AND
		    a.nrCajaCliente  in (       2000004551,
						1000004688,
						3000002100,
						4000001499,
						1000004689,
						3000002101,
						2000004552,
						4000001500,
						1000004690,
						2000004553,
						4000001501,
						2000004554,
						1000004691,
						3000002102,
						4000001502,
						2000004555,
						1000004692,
						3000002103,
						4000001503,
						1000004693,
						2000004556)

