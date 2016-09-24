

set transaction isolation level read uncommitted

	select COUNT(*) from tb_cajas
			where  vlSaldoRecalculado is not null 


	select nrCaja, dtApertura ,  vlSaldoInicialPesos ,  vlSaldoRecalculado from tb_cajas
			where  vlSaldoRecalculado is not null order  by  nrCaja Desc
			
	
	
	
	select nrCaja, dtApertura ,  vlSaldoInicialPesos ,  vlSaldoRecalculado from tb_cajas
			where  vlSaldoRecalculado is not null
			   and vlSaldoInicialPesos -  vlSaldoRecalculado > 1
			 order  by  nrCaja Desc
			 
			 
			 
			
	
	-- update tb_cajas  set  vlSaldoRecalculado = null
	--		where  vlSaldoRecalculado is not null
	
	
	
			select COUNT(*) from tb_cajas 
			 where vlSaldoRecalculado is null and flcajaadm =1 		
			
	
	go
	


select MIN(nrCajaADM)  from TB_ValoresDesimputacionesCajasPuestos
select * from TB_Cajas where nrCaja = 9000002144
where nrCajaADM  = 9000002021



select distinct cdConcepto  into  #tmp_Conceptos from TB_MovimientosContables


select cdConcepto from #tmp_Conceptos 
				where cdConcepto not in (select cdConcepto from tb_conceptos) 


select * from #tmp_Conceptos x inner join tb_conceptos y
			 on  x.cdConcepto = y.cdConcepto 
			 where flSumaenCajaAdm = 0
			 

set dateformat  dmy 

SELECT VW_CajasPuestos_v2_5.nrCaja ,VW_CajasPuestos_v2_5.dtApertura ,VW_CajasPuestos_v2_5.dtCierre ,VW_CajasPuestos_v2_5.nrPuesto ,VW_CajasPuestos_v2_5.dsUsuario ,VW_CajasPuestos_v2_5.vlDiferenciaDeCierre ,VW_CajasPuestos_v2_5.dsUsuario ,VW_CajasPuestos_v2_5.vlSaldoInicialPesos ,VW_CajasPuestos_v2_5.vlTotalSaldoFinalReal  FROM VW_CajasPuestos_v2_5  WHERE VW_CajasPuestos_v2_5.dtApertura >= '09/09/2009 00:00:00'  AND  VW_CajasPuestos_v2_5.dtApertura <= '20/01/2010 23:59:59'  AND   nrCaja Like ('%%%') AND VW_CajasPuestos_v2_5.tpAcceso = 'Administración'   Order by VW_CajasPuestos_v2_5.nrCaja asc 



select 
exec  [dbo].[SP_CalculaSaldoInicial_v2_9] 
					       @tpCaja_param = 'CA',
					       @tpCajaImputacion_param = null,
					       @nrCaja_Param = 9000002117
 

 
 go 
 
	select nrCaja, vlSaldoInicialPesos ,  vlSaldoRecalculado from tb_cajas
			where  vlSaldoRecalculado is not null order  by  nrCaja Desc
			
	
	update tb_cajas  set  vlSaldoRecalculado = null
			where  vlSaldoRecalculado is not null
			
			

go



drop table #tmp_resultado


create table #tmp_resultado
	(vlSaldoInicialPesos     float,    
	 vlSaldoInicialDolares   float,
	 vlSaldoInicialEuros     float)
	 

declare @nrCaja numeric
declare @vlSaldoRecalculado float


declare cursor_cajasADM CURSOR for 
			select top 100 nrCaja, vlSaldoRecalculado from tb_cajas 
			 where vlSaldoRecalculado is null and flcajaadm =1 order by nrCaja desc
			  

open cursor_cajasADM
FETCH NEXT FROM cursor_cajasADM 
INTO @nrCaja, @vlSaldoRecalculado

WHILE @@FETCH_STATUS = 0
BEGIN

	delete from #tmp_resultado

	
	insert into #tmp_resultado 
			(vlSaldoInicialPesos,
			 vlSaldoInicialDolares,
			 vlSaldoInicialEuros)
		exec  [dbo].[SP_CalculaSaldoInicial_v2_9] 
							   @tpCaja_param = 'CA',
							   @tpCajaImputacion_param = null,
							   @nrCaja_Param = @nrCaja
	
	select @vlSaldoRecalculado = vlSaldoInicialPesos from #tmp_resultado
	
	update tb_cajas set vlSaldoRecalculado  =   @vlSaldoRecalculado where
					nrCaja = @nrCaja  
	    


	FETCH NEXT FROM cursor_cajasADM 
	INTO @nrCaja, @vlSaldoRecalculado
	
						       
END		


CLOSE cursor_cajasADM;
DEALLOCATE cursor_cajasADM;