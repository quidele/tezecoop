-- Cambios de DDL version 3.3
use dbSG2000
go

if not exists (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='TB_ResumenMovimientosContables' and COLUMN_NAME='cdConcepto')
ALTER TABLE  [TB_ResumenMovimientosContables] ADD  cdConcepto  	int;

go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_SumarMovimientosContablesporPeriodo_v3_3]'))
drop procedure [dbo].[SP_SumarMovimientosContablesporPeriodo_v3_3]

go


CREATE PROCEDURE SP_SumarMovimientosContablesporPeriodo_v3_3
@dtDesde    	datetime,
@dtHasta    	datetime,
@dsUsuario  	varchar(50),
@tpConcepto 	varchar(50)=null,
@tpOperacion    varchar(50)=null,
@dsConcepto     varchar(50)=null
AS
begin

	/*  select  @dtDesde=getdate()-60, @dtHasta=getdate(), @dsUsuario='Eulises'  */
	
	delete from TB_ResumenMovimientosContables where dsUsuario =  @dsUsuario 
	
	if  @tpConcepto is not null
	begin
		INSERT INTO TB_ResumenMovimientosContables (cdConcepto, tpConcepto,tpOperacion,dsConcepto,vlSumaPesos,vlSumaDolares,vlSumaEuros,dsUsuario)
		SELECT  cdConcepto, tpConcepto, tpOperacion, dsConcepto, SUM(vlPesos)  as vlSumaPesos, 
		SUM(vlDolares) as vlSumaDolares, SUM(vlEuros) as vlSumaEuros, min(@dsUsuario) from  dbo.TB_MovimientosContables
		WHERE dtMovimiento>=@dtDesde and dtMovimiento<=@dtHasta and  tpConcepto like '%' + @tpConcepto + '%'
		GROUP BY cdConcepto, tpConcepto, tpOperacion, dsConcepto
	end
	 
	
	if  @tpOperacion is not null
	begin
		INSERT INTO TB_ResumenMovimientosContables (cdConcepto, tpConcepto,tpOperacion,dsConcepto,vlSumaPesos,vlSumaDolares,vlSumaEuros,dsUsuario)
		SELECT  cdConcepto, tpConcepto, tpOperacion, dsConcepto, SUM(vlPesos)  as vlSumaPesos, 
		SUM(vlDolares) as vlSumaDolares, SUM(vlEuros) as vlSumaEuros, min(@dsUsuario) from  dbo.TB_MovimientosContables
		WHERE dtMovimiento>=@dtDesde and dtMovimiento<=@dtHasta  and  tpOperacion like '%' + @tpOperacion + '%'
		GROUP BY  cdConcepto, tpConcepto, tpOperacion, dsConcepto
	end
	
	
	if @dsConcepto is not null
	begin
		INSERT INTO TB_ResumenMovimientosContables (cdConcepto, tpConcepto,tpOperacion,dsConcepto,vlSumaPesos,vlSumaDolares,vlSumaEuros,dsUsuario)
		SELECT  cdConcepto, tpConcepto, tpOperacion, dsConcepto, SUM(vlPesos)  as vlSumaPesos, 
		SUM(vlDolares) as vlSumaDolares, SUM(vlEuros) as vlSumaEuros, min(@dsUsuario) from  dbo.TB_MovimientosContables
		WHERE dtMovimiento>=@dtDesde and dtMovimiento<=@dtHasta and  dsConcepto like '%' + @dsConcepto + '%'
		GROUP BY  cdConcepto, tpConcepto, tpOperacion, dsConcepto
	end

	if  @tpConcepto is null and @tpOperacion is null  and @dsConcepto is null 
	begin
	 
		INSERT INTO TB_ResumenMovimientosContables (cdConcepto, tpConcepto,tpOperacion,dsConcepto,vlSumaPesos,vlSumaDolares,vlSumaEuros,dsUsuario)
		SELECT  cdConcepto, tpConcepto, tpOperacion, dsConcepto, SUM(vlPesos)  as vlSumaPesos, 
		SUM(vlDolares) as vlSumaDolares, SUM(vlEuros) as vlSumaEuros, min(@dsUsuario) from  dbo.TB_MovimientosContables
		WHERE dtMovimiento>=@dtDesde and dtMovimiento<=@dtHasta
		GROUP BY  cdConcepto, tpConcepto, tpOperacion, dsConcepto
	
	end	

	--print 'PRNT 0'
	--select a.* from TB_ResumenMovimientosContables a where a.dsUsuario =  @dsUsuario 


	delete a from TB_ResumenMovimientosContables a, tb_conceptos b 
	         where  a.cdConcepto = b.cdConcepto  and  b.flOcultadoenCajaAdm=1
			and a.dsUsuario =  @dsUsuario 

	--print 'PRNT 1 '
	select a.* from TB_ResumenMovimientosContables a where a.dsUsuario =  @dsUsuario 


	SELECT  a.cdConcepto,
		a.tpOperacion,
		a.tpConcepto,
		a.dsConcepto, 
		sum(vlSumaPesos)   as vlSumaPesos,
		SUM(vlSumaDolares) as vlSumaDolares, 
		SUM(vlSumaEuros)   as vlSumaEuros, 
		min(@dsUsuario)    as dsUsuario
			INTO  #tmp_suma_movimientos_de_entrada_salida 
	from  dbo.TB_ResumenMovimientosContables a
	WHERE a.dsUsuario =  @dsUsuario and a.tpOperacion = 'Entrada de Dinero'
	GROUP BY  a.cdConcepto, a.tpConcepto, a.tpOperacion, a.dsConcepto

	INSERT INTO #tmp_suma_movimientos_de_entrada_salida
	SELECT  a.cdConcepto,
		a.tpOperacion,
		a.tpConcepto,
		a.dsConcepto, 
		- SUM(vlSumaPesos)   as vlSumaPesos,
		- SUM(vlSumaDolares) as vlSumaDolares, 
		- SUM(vlSumaEuros)   as vlSumaEuros, 
		min(@dsUsuario)      as dsUsuario
	from  dbo.TB_ResumenMovimientosContables  a
	WHERE a.dsUsuario =  @dsUsuario and a.tpOperacion = 'Salida de Dinero'
	GROUP BY  a.cdConcepto, a.tpConcepto, a.tpOperacion, a.dsConcepto
		
	delete from TB_ResumenMovimientosContables where dsUsuario =  @dsUsuario 


	insert into  TB_ResumenMovimientosContables
		(cdConcepto, tpConcepto, tpOperacion , dsConcepto, vlSumaPesos, vlSumaDolares, vlSumaEuros, dsUsuario)
	select  cdConcepto, 
		tpConcepto, 
		'Entrada / Salida' as tpOperacion,
		dsConcepto, 
		sum(vlSumaPesos)   as vlSumaPesos, 
		sum(vlSumaDolares) as vlSumaDolares,
		sum(vlSumaEuros)   as vlSumaEuros,
		dsUsuario 
	from #tmp_suma_movimientos_de_entrada_salida
	GROUP BY  cdConcepto, tpConcepto, dsConcepto, dsUsuario

	delete from TB_ResumenMovimientosContables where dsUsuario =  @dsUsuario and
							 vlSumaPesos=0 and
							 vlSumaDolares=0 and
							 vlSumaEuros=0


	select a.* from TB_ResumenMovimientosContables a  where a.dsUsuario =  @dsUsuario 

	return 1; 
	
	
end;


go 


---SP_SumarMovimientosContablesporPeriodo_v3_3
/*
exec SP_SumarMovimientosContablesporPeriodo_v3_3
	@dtDesde='01/02/2010 00:00:00',
        @dtHasta='23/02/2010 23:59:59',
	@dsUsuario='ROMA'
    
*/
go 




if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_cuponesCompensadosdelDia_v3_3]'))
drop procedure [dbo].[sp_cuponesCompensadosdelDia_v3_3]

go

CREATE PROCEDURE sp_cuponesCompensadosdelDia_v3_3 (@pnrLicencia as varchar(3))
as
begin

	select count(*) as cupones_compensados from tb_cupones a
	where a.flcompensado=1 and a.flanulado=0 and nrLicencia=@pnrLicencia and
	      convert(varchar,a.dtcompensado,103) =  convert(varchar,getdate(),103) and
	      a.tpCupon in ('Contado','Cobro en Destino')
	

end;

go


exec sp_cuponesCompensadosdelDia_v3_3 10

go 
