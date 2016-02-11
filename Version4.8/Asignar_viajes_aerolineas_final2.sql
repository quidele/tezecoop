
use dbSG2000 
go


/*-----------------*/
IF EXISTS (SELECT * FROM SYS.tables   WHERE NAME = 'tb_comprobantesFinales2')
BEGIN
	DROP TABLE  [dbo].tb_comprobantesFinales2
END
GO
/*-----------------*/


/*-----------------*/
IF EXISTS (SELECT * FROM SYS.tables   WHERE NAME = 'tb_comprobantes_asigcomproFinales2')
BEGIN
	DROP TABLE  [dbo].tb_comprobantes_asigcomproFinales2
END
GO
/*-----------------*/



select top 10 nrTalonario , nrComprobante , tpComprobante , tpLetra , '00-00000000-00' as nrDoc  into tb_comprobantesFinales2
 from TB_Comprobantes  where dsLeyenda like 'AR %'


 delete from tb_comprobantesFinales2

 insert into tb_comprobantesFinales2 (nrTalonario , nrComprobante , tpComprobante , tpLetra, nrDoc ) Values ('0006' , '00655752' , 'B' , 'B','30-71154186-8')
 insert into tb_comprobantesFinales2 (nrTalonario , nrComprobante , tpComprobante , tpLetra, nrDoc ) Values ('0006' , '00655742' , 'B' , 'B','30-71154186-8')

 insert into tb_comprobantesFinales2 (nrTalonario , nrComprobante , tpComprobante , tpLetra, nrDoc ) Values ('0006' , '00657228' , 'B' , 'B','30-70710640-5')
 insert into tb_comprobantesFinales2 (nrTalonario , nrComprobante , tpComprobante , tpLetra, nrDoc ) Values ('0006' , '00657226' , 'B' , 'B','30-70710640-5')
 insert into tb_comprobantesFinales2 (nrTalonario , nrComprobante , tpComprobante , tpLetra, nrDoc ) Values ('0006' , '00657223' , 'B' , 'B','30-70710640-5')
 insert into tb_comprobantesFinales2 (nrTalonario , nrComprobante , tpComprobante , tpLetra, nrDoc ) Values ('0006' , '00657739' , 'B' , 'B','30-70710640-5')
 
 

 --- DEBERIAN EXISTIR lOS 6 viajes
 select cdCliente , x.nrDoc , dsRazonSocial , x.dsOpcional4,  y.*  from  tb_comprobantes  x inner join  tb_comprobantesFinales2  y  
							on  x.nrTalonario = y.nrTalonario 
								and  x.nrComprobante  = y.nrComprobante 
										and  x.tpLetra    = y.tpLetra 



select cdCliente , x.nrDoc , dsRazonSocial , x.dsOpcional4 into  tb_comprobantes_asigcomproFinales2  from  tb_comprobantes  x inner join  tb_comprobantesFinales2  y  
							on  x.nrTalonario = y.nrTalonario 
								and  x.nrComprobante  = y.nrComprobante 
										and  x.tpLetra    = y.tpLetra 


 --- DEBERIAN EXISTIR lOS 6 viajes
update x set   x.nrDoc = y.nrDoc  
from  tb_comprobantes  x inner join  tb_comprobantesFinales2  y  
							on  x.nrTalonario = y.nrTalonario 
								and  x.nrComprobante  = y.nrComprobante 
								--	and  x.tpComprobante   = y.tpComprobante 
										and  x.tpLetra    = y.tpLetra  
										  








