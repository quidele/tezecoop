


select * from TB_MovimientosContables 
where vlPesos < 0



select * from TB_MovimientosContables 
where vlPesos < 0





select * from TB_MovimientosContables 
where vlPesos in (-316.2,-308.2) and nrCaja in (9000002690,9000002689)

select *  from  TB_MovimientosContables 
where  nrCaja in (9000002689) and vlPesos = 308.2


update TB_MovimientosContables set vlPesos = -1 *  vlPesos
where  nrCaja in (9000002689) and   vlPesos = 308.2

update  TB_MovimientosContables set vlPesos = 1501.51   where vlPesos = 1501.51 + 308.2   and nrCaja in (9000002689) and cdConcepto =9004



sp_help TB_MovimientosContables

declare @nromovi numeric
select @nromovi = MAX(idmovimiento) + 1 from TB_MovimientosContables
print @nromovi

INSERT INTO TB_MovimientosContables
	  ([IdMovimiento]
      ,[dsMovimiento]
      ,[IdRecibo]
      ,[IdProveedor]
      ,[dsProveedor]
      ,[cdConcepto]
      ,[tpConcepto]
      ,[dsConcepto]
      ,[tpOperacion]
      ,[vlPesos]
      ,[vlDolares]
      ,[vlEuros]
      ,[nrRecibo]
      ,[nrFactura]
      ,[nrCaja]
      ,[dsUsuario]
      ,[dtMovimiento]
      ,[dsObservacion]
      ,[nrAnio]
      ,[dsUsuario_Supervisor]
      ,[nrCajaPuesto]
      ,[tpCajaImputacion]
      ,[dsUsuarioCajaPuesto]
      ,[tpMovimiento])
SELECT @nromovi AS [IdMovimiento]
      ,[dsMovimiento]
      ,[IdRecibo]
      ,[IdProveedor]
      ,[dsProveedor]
      ,[cdConcepto]
      ,[tpConcepto]
      ,[dsConcepto]
      ,[tpOperacion]
      ,abs([vlPesos]) AS vlPesos
      ,[vlDolares]
      ,[vlEuros]
      ,[nrRecibo]
      ,[nrFactura]
      ,9000002692 AS [nrCaja]
      ,[dsUsuario]
      ,[dtMovimiento]
      ,[dsObservacion]
      ,[nrAnio]
      ,[dsUsuario_Supervisor]
      ,[nrCajaPuesto]
      ,[tpCajaImputacion]
      ,[dsUsuarioCajaPuesto]
      ,[tpMovimiento]
from  TB_MovimientosContables 
where  nrCaja in (9000002689) and vlPesos = -308.2


declare @nromovi numeric
select @nromovi = MAX(idmovimiento) + 1 from TB_MovimientosContables
print @nromovi

INSERT INTO TB_MovimientosContables
	  ([IdMovimiento]
      ,[dsMovimiento]
      ,[IdRecibo]
      ,[IdProveedor]
      ,[dsProveedor]
      ,[cdConcepto]
      ,[tpConcepto]
      ,[dsConcepto]
      ,[tpOperacion]
      ,[vlPesos]
      ,[vlDolares]
      ,[vlEuros]
      ,[nrRecibo]
      ,[nrFactura]
      ,[nrCaja]
      ,[dsUsuario]
      ,[dtMovimiento]
      ,[dsObservacion]
      ,[nrAnio]
      ,[dsUsuario_Supervisor]
      ,[nrCajaPuesto]
      ,[tpCajaImputacion]
      ,[dsUsuarioCajaPuesto]
      ,[tpMovimiento])
SELECT @nromovi AS [IdMovimiento]
      ,[dsMovimiento]
      ,[IdRecibo]
      ,[IdProveedor]
      ,[dsProveedor]
      ,[cdConcepto]
      ,[tpConcepto]
      ,[dsConcepto]
      ,[tpOperacion]
      ,abs([vlPesos]) AS vlPesos
      ,[vlDolares]
      ,[vlEuros]
      ,[nrRecibo]
      ,[nrFactura]
      ,9000002692 AS [nrCaja]
      ,[dsUsuario]
      ,[dtMovimiento]
      ,[dsObservacion]
      ,[nrAnio]
      ,[dsUsuario_Supervisor]
      ,[nrCajaPuesto]
      ,[tpCajaImputacion]
      ,[dsUsuarioCajaPuesto]
      ,[tpMovimiento]
from  TB_MovimientosContables 
where  nrCaja in (9000002690) and vlPesos < 0

9000002690


update  TB_Conceptos  set  tpCreadoPOr ='Usuario' where cdConcepto in (2032,2033)
select * from TB_Conceptos where cdConcepto > 2032
SELECT * FROM TB_Usuarios WHERE dsUsuario = 'USRPARAM'

update  TB_Conceptos  set  tpCreadoPOr ='Sistema' where cdConcepto in (2032,2033)