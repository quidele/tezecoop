select a.*, flCompensado, dtCompensado, Problema, Mellizo  from 
dbo.viajes_No_comp_al_311008 a, tb_cupones b
where b.nrtalonarioCliente = a.[Talon] and
      b.nrcomprabantecliente = a.Comprobante and
      b.nrlicencia = a.lic and
	  b.tpCupon = a.Cond_Venta and
      Convert(varchar,b.dtCupon,103) = a.fecha

/*
update   dbo.viajes_No_comp_al_311008 
set Talon = '000'+Talon

update dbo.viajes_No_comp_al_311008 
set Comprobante = '0000000' + Comprobante
where len(Comprobante)=1

update dbo.viajes_No_comp_al_311008 
set Comprobante = '000000' + Comprobante
where len(Comprobante)=2

update dbo.viajes_No_comp_al_311008 
set Comprobante = '00000' + Comprobante
where len(Comprobante)=3

update dbo.viajes_No_comp_al_311008 
set Comprobante = '0000' + Comprobante
where len(Comprobante)=4

update dbo.viajes_No_comp_al_311008 
set Comprobante = '000' + Comprobante
where len(Comprobante)=5

update dbo.viajes_No_comp_al_311008 
set Comprobante = '00' + Comprobante
where len(Comprobante)=6
*/

select * from  dbo.viajes_No_comp_al_311008 


go 


set dateformat dmy

declare @fecha_corte datetime

		set  @fecha_corte =  '31/12/2008 06:00:00'

		drop table #tb_falta_compensar_agrupado;

	
		SELECT --dtCupon, nrLicencia,
		       a.tpCupon,
		       suma_vlPagoPesos = CASE a.tpCupon
			 WHEN 'Contado' THEN  isnull(SUM(a.vlPagoPesos)- sum(a.vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Cuenta Corriente' THEN isnull(SUM(a.vlMontoCupon)- sum(vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Retorno' THEN isnull(SUM(0)- sum(a.vlComision+isnull(vlIVA,0)),0)
		         WHEN 'Cobro en Destino' THEN isnull(SUM(0)- sum(vlComision+isnull(vlIVA,0)),0)
		       END,
		       isnull(SUM(a.vlPagoEuros),0)   AS   suma_vlPagoEuros, 
		       isnull(SUM(a.vlPagoDolares),0) AS   suma_vlPagoDolares INTO #tb_falta_compensar_agrupado
		FROM TB_Cupones a --,  --#tmp_Licencias b
		WHERE (a.flCompensado = 1) AND (a.flAnulado = 0) AND 
		    a.tpCupon IN ('Contado', 'Cuenta Corriente', 'Retorno','Cobro en Destino') 
		    and a.nrLicencia not in (998,999)
		    and a.dtCupon<=@fecha_corte and dtCompensado>@fecha_corte
		Group by tpCupon--, dtCupon

		select isnull(sum(suma_vlPagoPesos),0) as suma_vlPagoPesos,
		       isnull(sum(suma_vlPagoEuros),0) as suma_vlPagoEuros,
		       isnull(sum(suma_vlPagoDolares),0) as suma_vlPagoDolares
			
		from #tb_falta_compensar_agrupado

go

set dateformat dmy

declare @fecha_corte datetime

		set  @fecha_corte =  '31/12/2008 06:00:00'

SELECT     TOP 1 *
FROM         [dbo].[TB_Cajas] where nrPuesto =  9  and dtapertura >=@fecha_corte order by nrcaja asc

