dbo.SP_ResumenCajaADM_v2_9

sp_helptext SP_ResumenCajaADM_v2_9


exec SP_ResumenCajaADM_v2_9 @tpCajaImputacion_param='', 
						    @nrCaja_param=9000002120,
						    @tpCaja_param='CA'
						    
						    
go 

CREATE procedure [dbo].[SP_ResumenCajaADM_v2_9]
						@tpCajaImputacion_param as varchar(50)=null,
						@nrCaja_param numeric,
						@tpCaja_param char(2)=null
AS


	if @tpCajaImputacion_param =''
		set @tpCajaImputacion_param = null

	if @tpCaja_param is null
		set @tpCaja_param='CA'
	

	if @tpCaja_param =''
		set @tpCaja_param='CA'


	SELECT a.cdConcepto, a.tpOperacion, a.nrCaja, b.tpCajaImputacion, a.dsConcepto, SUM(vlPesos) 
		AS SumaPesos, SUM(vlDolares) AS SumaDolares, 
		SUM(vlEuros) AS SumaEuros
	FROM dbo.TB_MovimientosContables a, tb_conceptos b
	where	a.cdConcepto = b.cdConcepto      and
		    (
				 (@tpCaja_param='CC'  and b.flOcultadoCajaCooperativa=0) or			 
				 (@tpCaja_param='CL'  and b.flOcultadoCajaLicenciatario=0) or
				 (@tpCaja_param='CA'  and b.flOcultadoenCajaAdm=0) 
		    )
			and a.nrCaja =  @nrCaja_param 
			and (b.tpCajaImputacion= @tpCajaImputacion_param or @tpCajaImputacion_param is null)
	GROUP BY a.cdConcepto, a.tpOperacion, a.nrCaja, a.dsConcepto,  b.tpCajaImputacion



go


1027        Salida de Dinero                                   9000002120                              Caja de los Licenciatarios                         PAGO DE COMPROBANTES                                                                                 54241,7                1746                   64



declare @tpCajaImputacion_param as varchar(50)
declare @nrCaja_param numeric
declare @tpCaja_param char(2)

set @tpCajaImputacion_param=null
set @nrCaja_param=9000002120
set @tpCaja_param='CA'


	SELECT a.cdConcepto, a.tpOperacion, a.nrCaja, a.dsConcepto
		, vlPesos
		, vlDolares
		, vlEuros
	FROM dbo.TB_MovimientosContables a /*  tb_conceptos b */ 
	where	 a.nrCaja =  @nrCaja_param 
			and a.cdConcepto = 1027



select * from VW_DetalleMovimientosContablesCupones_1 where 
		tpOperacion='Salida de Dinero' and
					nrCaja=9000002120 and 
					cdConcepto = 1027
                

go 

sp_helptext VW_DetalleMovimientosContablesCupones


go 

Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER VIEW dbo.VW_DetalleMovimientosContablesCupones_1
AS
SELECT DISTINCT     dbo.TB_MovimientosContables.IdMovimiento ,
                      dbo.TB_MovimientosContables.tpOperacion, dbo.TB_MovimientosContables.nrCaja, dbo.TB_MovimientosContables.dsConcepto, 
                      dbo.TB_MovimientosContables.vlPesos , vlDolares , vlEuros, 
                      dbo.TB_MovimientosContables.cdConcepto
FROM         dbo.TB_MovimientosContables INNER JOIN
                      dbo.TB_Cupones ON dbo.TB_MovimientosContables.IdRecibo = dbo.TB_Cupones.IdRecibo 
                      

go


--- analizando recibo en blanco



select * from tb_cupones 
where IdRecibo=1000146462


select * from tb_cupones 
where IdReciboCtacte=1000063037

select * from tb_movimientoscontables where 
IdRecibo = 1000146462

select * from tb_Recibos where 
IdRecibo = 1000146462

select * from tb_RecibosDetalle where 
IdRecibo = 1000146462

					                        
SELECT DISTINCT     dbo.TB_MovimientosContables.IdMovimiento ,     dbo.TB_Cupones.nrCupon                      
FROM         dbo.TB_MovimientosContables INNER JOIN
                      dbo.TB_Cupones ON dbo.TB_MovimientosContables.IdRecibo = dbo.TB_Cupones.IdRecibo and
                      dbo.TB_MovimientosContables.tpOperacion='Salida de Dinero' and
					  dbo.TB_MovimientosContables.nrCaja=9000002120 and 
					  dbo.TB_MovimientosContables.cdConcepto = 1027



SELECT a.IdMovimiento
FROM         dbo.TB_MovimientosContables  a, TB_Recibos b
where  a.nrCaja=9000002120 and 
	   a.cdConcepto = 1027 and
	   a.IdRecibo = b.IdRecibo and
	   b.flAnulado = 1
	   
	   
go

-- analisis recibos en blanco  versus sobrantes


SELECT Sum(vlPesos) as vlPesos  FROM TB_MovimientosContables a
	WHERE a.cdConcepto = 1027 
	      and YEAR(a.dtMovimiento) in (2009, 2010)
	      and a.IdRecibo  not in (SELECT
	      a.IdRecibo FROM TB_Cupones b where Year(b.dtCupon) in (2009, 2010) and b.IdRecibo = a.idrecibo)


SELECT *  FROM TB_MovimientosContables a
	WHERE a.cdConcepto = 1027 
	      and YEAR(a.dtMovimiento) in (2009, 2010)
	      and a.IdRecibo  not in (SELECT
	      a.IdRecibo FROM TB_Cupones b where Year(b.dtCupon) in (2009, 2010) and b.IdRecibo = a.idrecibo)
order by dtMovimiento desc


select SUM(vlPesos) from TB_MovimientosContables 
where dsConcepto like '%Sobrante%'  and YEAR(a.dtMovimiento) in (2009, 2010)
	      

select * from TB_MovimientosContables 
where dsConcepto like '%Sobrante%' and YEAR(a.dtMovimiento) in (2009, 2010)

	   
	   
select * from tb_cupones 
where IdRecibo=1000150083

select * from tb_cupones 
where IdReciboCtacte=1000150083

select * from tb_movimientoscontables where 
IdRecibo = 1000150083

select * from tb_Recibos where 
IdRecibo = 1000150083





	   