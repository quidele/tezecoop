SELECT [IdMovimiento]
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
  FROM [dbSG2000].[dbo].[TB_MovimientosContables]
where nrCajaPuesto in  (1000004752,1000004753, 1000004749) order by dtMovimiento 



select * from tb_cajas where nrPuesto<9 and flimputado=1  and dsUsuario in ('LEO', 'MTEDESCO')
order by dtApertura desc


---drop table tmpRecibosProblema1
drop table tmpRecibosProblema

set dateformat dmy
 
select IdRecibo , 'N' as estaenMovim
---into tmpRecibosProblema3
 from tb_recibos  where convert(varchar,dtRecibo,103) = '20/10/2009'   or  convert(varchar,dtRecibo,103) = '19/10/2009'  
order by dtRecibo asc 



update tmpRecibosProblema1  
set estaenMovim ='S'
from tmpRecibosProblema1 a, tb_MovimientosContables b
where  a.idRecibo =  b.idRecibo



select  *  from tb_recibos a , tmpRecibosProblema1 b    where  a.idRecibo=b.idRecibo and  b.estaenMovim='N'


select  sum(vlSaldoPesos  + (vlSaldoEuros    *   5.15) + (vlSaldoDolares  *  3.64))   from tb_recibos a , tmpRecibosProblema1 b    where  a.idRecibo=b.idRecibo and  b.estaenMovim='N'

select  vlSaldoPesos , vlSaldoEuros  , vlSaldoDolares    from tb_recibos a , tmpRecibosProblema1 b    where  a.idRecibo=b.idRecibo and  b.estaenMovim='N'




                               


SELECT *  from tb_Cajas  where nrCaja = 9000002043


select top 1000 * from tb_MovimientosContables order by idMovimiento desc


select max(idRecibo) from tb_recibos

select dsPassword from tb_Usuarios where dsUsuario = 'MARIA'


exec dbo.SP_CalculaSaldoInicial_v2_9 
			       @tpCaja_param ='CA',
			       @tpCajaImputacion_param = null,
			       @nrCaja_Param = 9000002043


Antes de Arreglar el Quilombo de MARIA
vlSaldoInicialPesos                                   vlSaldoInicialDolares                                 vlSaldoInicialEuros                                   
----------------------------------------------------- ----------------------------------------------------- ----------------------------------------------------- 
149613.90450020134                                    0.0                                                   0.0

64337.26


update a  
set a.nrLicencia =b.nrLicencia
from tmpRecibosProblema1 a, tb_Cupones b
where  a.idRecibo =  b.idRecibo


select * from tmpRecibosProblema1


select * from tb_cupones where 
idRecibo = 1000140710


insert into tb_MovimientosContables
	(IdMovimiento ,dsMovimiento ,IdRecibo ,cdConcepto ,tpConcepto ,dsConcepto ,tpOperacion ,vlPesos ,vlDolares ,vlEuros ,nrRecibo ,
	nrFactura ,nrCaja ,dsUsuario ,dtMovimiento ,dsProveedor ,IdProveedor ,tpCajaImputacion ,dsUsuarioCajaPuesto ,nrCajaPuesto)
select
	b.IdMovimiento,
       'Pago a Licenciatario' as dsMovimiento, 
	a.IdRecibo,
        1027 as cdConcepto,
        'Cajas'  as tpConcepto,
        'PAGO DE COMPROBANTES' as dsConcepto,
	'Salida de Dinero' as  tpOperacion,
         vlSaldoPesos as vlPesos,                                                                                       
	 vlSaldoDolares as vlDolares,
	 vlSaldoEuros as vlEuros,
	 a.IdRecibo as nrRecibo,
	 null as nrFactura,
	 a.nrCaja,
	 'EULISES' as dsUsuario,
	 a.dtRecibo as dtMovimiento,
	 'Licencia Nro. '+ b.nrLicencia  as dsProveedor,
	 null IdProveedor,
	 'Caja de los Licenciatarios' as tpCajaImputacion,
	 null as nrCajaPuesto,
	 null as dsUsuarioCajaPuesto
from tb_recibos a , tmpRecibosProblema1 b    where  a.idRecibo=b.idRecibo and  b.estaenMovim='N'


--select * from tb_usuarios where dsUsuario='MARIA'


select * from tb_movimientosContables where dsUsuario = 'EULISES'

select * from tb_Recibos where  idRecibo = 1000140836


select * into tmpRecibosProblema2 from tmpRecibosProblema1       

update a
set    a.IdMovimiento = b.IdMovimiento
from   tmpRecibosProblema1 a , tmpRecibosProblema2 b
where a.IdRecibo = b.IdRecibo

select * from tmpRecibosProblema1



CREATE TABLE [dbo].[TB_MovimientosContables_Eliminados] (
	[IdMovimiento] [numeric](18, 0) NOT NULL ,
	[dsMovimiento] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IdRecibo] [numeric](18, 0) NULL ,
	[IdProveedor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dsProveedor] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cdConcepto] [int] NULL ,
	[tpConcepto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dsConcepto] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[tpOperacion] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[vlPesos] [float] NULL ,
	[vlDolares] [float] NULL ,
	[vlEuros] [float] NULL ,
	[nrRecibo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nrFactura] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nrCaja] [numeric](18, 0) NULL ,
	[dsUsuario] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dtMovimiento] [datetime] NULL ,
	[dsObservacion] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nrAnio] [int] NULL ,
	[dsUsuario_Supervisor] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nrCajaPuesto] [numeric](18, 0) NULL ,
	[tpCajaImputacion] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[dsUsuarioCajaPuesto] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO



CREATE TRIGGER [Tri_grabaMovimientoContableEliminado] ON [dbo].[TB_MovimientosContables] 
FOR DELETE 
AS
begin
	insert into TB_MovimientosContables_Eliminados
		([IdMovimiento],
		[dsMovimiento],
		[IdRecibo], 
		[IdProveedor], 
		[dsProveedor], 
		[cdConcepto], 
		[tpConcepto], 
		[dsConcepto],
		[tpOperacion], 
		[vlPesos], 
		[vlDolares], 
		[vlEuros], 
		[nrRecibo], 
		[nrFactura], 
		[nrCaja],
		[dsUsuario], 
		[dtMovimiento], 
		[dsObservacion],
		[nrAnio],
		[dsUsuario_Supervisor],
		[nrCajaPuesto],
		[tpCajaImputacion], 
		[dsUsuarioCajaPuesto])
	select  
		[IdMovimiento],
		[dsMovimiento],
		[IdRecibo], 
		[IdProveedor], 
		[dsProveedor], 
		[cdConcepto], 
		[tpConcepto], 
		[dsConcepto],
		[tpOperacion], 
		[vlPesos], 
		[vlDolares], 
		[vlEuros], 
		[nrRecibo], 
		[nrFactura], 
		[nrCaja],
		[dsUsuario], 
		[dtMovimiento], 
		[dsObservacion],
		[nrAnio],
		[dsUsuario_Supervisor],
		[nrCajaPuesto] [numeric],
		[tpCajaImputacion], 
		[dsUsuarioCajaPuesto]
	from deleted
end


