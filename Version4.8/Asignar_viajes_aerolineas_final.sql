
use dbSG2000 
go


/*-----------------*/
IF EXISTS (SELECT * FROM SYS.tables   WHERE NAME = 'tb_comprobantesFinales')
BEGIN
	DROP TABLE  [dbo].tb_comprobantesFinales  
END
GO
/*-----------------*/


/*-----------------*/
IF EXISTS (SELECT * FROM SYS.tables   WHERE NAME = 'tb_comprobantes_asigcomproFinales')
BEGIN
	DROP TABLE  [dbo].tb_comprobantes_asigcomproFinales  
END
GO
/*-----------------*/



select top 10 nrTalonario , nrComprobante , tpComprobante , tpLetra , '00-00000000-00' as nrDoc  into tb_comprobantesFinales
 from TB_Comprobantes  where dsLeyenda like 'AR %'


 delete from tb_comprobantesFinales

 insert into tb_comprobantesFinales (nrTalonario , nrComprobante , tpComprobante , tpLetra, nrDoc ) Values ('0006' , '00655752' , 'B' , 'B','30-71154186-8')
 insert into tb_comprobantesFinales (nrTalonario , nrComprobante , tpComprobante , tpLetra, nrDoc ) Values ('0006' , '00655742' , 'B' , 'B','30-71154186-8')

 insert into tb_comprobantesFinales (nrTalonario , nrComprobante , tpComprobante , tpLetra, nrDoc ) Values ('0006' , '00657228' , 'B' , 'B','30-70710640-5')
 insert into tb_comprobantesFinales (nrTalonario , nrComprobante , tpComprobante , tpLetra, nrDoc ) Values ('0006' , '00657226' , 'B' , 'B','30-70710640-5')
 insert into tb_comprobantesFinales (nrTalonario , nrComprobante , tpComprobante , tpLetra, nrDoc ) Values ('0006' , '00657223' , 'B' , 'B','30-70710640-5')
 insert into tb_comprobantesFinales (nrTalonario , nrComprobante , tpComprobante , tpLetra, nrDoc ) Values ('0006' , '00655739' , 'B' , 'B','30-70710640-5')
 
 

 --- DEBERIAN EXISTIR lOS 6 viajes
 select cdCliente , x.nrDoc , dsRazonSocial , x.dsOpcional4,  y.*  from  tb_comprobantes  x inner join  tb_comprobantesFinales  y  
							on  x.nrTalonario = y.nrTalonario 
								and  x.nrComprobante  = y.nrComprobante 
										and  x.tpLetra    = y.tpLetra 



select cdCliente , x.nrDoc , dsRazonSocial , x.dsOpcional4 into  tb_comprobantes_asigcomproFinales  from  tb_comprobantes  x inner join  tb_comprobantesFinales  y  
							on  x.nrTalonario = y.nrTalonario 
								and  x.nrComprobante  = y.nrComprobante 
										and  x.tpLetra    = y.tpLetra 


 --- DEBERIAN EXISTIR lOS 6 viajes
update x set   x.nrDoc = y.nrDoc  
from  tb_comprobantes  x inner join  tb_comprobantesFinales  y  
							on  x.nrTalonario = y.nrTalonario 
								and  x.nrComprobante  = y.nrComprobante 
									and  x.tpComprobante   = y.tpComprobante 
										and  x.tpLetra    = y.tpLetra  
										  





select nrCUIT , * from TB_Proveedores  where nrLicencia = 42
select nrCUIT , * from TB_Proveedores  where nrLicencia = 96







