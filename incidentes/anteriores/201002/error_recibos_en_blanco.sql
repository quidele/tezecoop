
-- analisis recibos en blanco  versus sobrantes


SELECT Sum(vlPesos) as vlPesos  FROM TB_MovimientosContables a
	WHERE a.cdConcepto = 1027 
	      and YEAR(a.dtMovimiento) in (2009, 2010)
	      and a.IdRecibo  not in (SELECT
	      a.IdRecibo FROM TB_Cupones b where b.IdRecibo = a.idrecibo)

SELECT Sum(vlDolares) as vlPesos  FROM TB_MovimientosContables a
	WHERE a.cdConcepto = 1027 
	      and YEAR(a.dtMovimiento) in (2009, 2010)
	      and a.IdRecibo  not in (SELECT
	      a.IdRecibo FROM TB_Cupones b where b.IdRecibo = a.idrecibo)
	      
SELECT Sum(vlEuros) as vlPesos  FROM TB_MovimientosContables a
	WHERE a.cdConcepto = 1027 
	      and YEAR(a.dtMovimiento) in (2009, 2010)
	      and a.IdRecibo  not in (SELECT
	      a.IdRecibo FROM TB_Cupones b where b.IdRecibo = a.idrecibo)

SELECT *  FROM TB_MovimientosContables a
	WHERE a.cdConcepto = 1027 
	      and YEAR(a.dtMovimiento) in  (2009, 2010)
	      and a.IdRecibo  not in (SELECT
	      a.IdRecibo FROM TB_Cupones b where b.IdRecibo = a.idrecibo)
order by dtMovimiento desc


select SUM(a.vlPesos) from TB_MovimientosContables a
where a.dsConcepto like '%Sobrante%'  and YEAR(a.dtMovimiento) in  (2009, 2010)


select SUM(a.vlEuros) from TB_MovimientosContables a
where a.dsConcepto like '%Sobrante%'  and YEAR(a.dtMovimiento) in  (2009, 2010)


select * from TB_MovimientosContables a
where a.dsConcepto like '%Sobrante%' and YEAR(a.dtMovimiento) in  (2009, 2010)

SELECT * FROM TB_Cupones b where b.IdRecibo = 1000147245
order by dtMovimiento desc