
use dbSG2000 
go


/*-----------------*/
IF EXISTS (SELECT * FROM SYS.tables   WHERE NAME = 'tb_comproAerolineas')
BEGIN
	DROP TABLE  [dbo].tb_comproAerolineas  
END
GO
/*-----------------*/


select top 10 nrTalonario , nrComprobante , tpComprobante , tpLetra into tb_comproAerolineas
 from TB_Comprobantes  where dsLeyenda like 'AR %'


 delete from tb_comproAerolineas

 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005731    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006238    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006233    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006228    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006249    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006244    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006305    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006295    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006417    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005262    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005275    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006432    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005749    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005756    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006479    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006513    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005837    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005883    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006540    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006545    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005910    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005908    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005902    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006584    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006583    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0008' , '00133140    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005928    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005916    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006591    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006611    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0009' , '00021667    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0009' , '00021675    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0009' , '00021660    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0009' , '00021643    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0009' , '00021644    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0009' , '00021685    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0009' , '00021701    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0009' , '00021696    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0009' , '00021693    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005339    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005338    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005346    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0008' , '00133262    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00004892    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00004924    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00004899    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00004913    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00004886    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006061    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006679    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00004963    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00004983    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00004971    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00004959    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006025    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006694    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005006    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006108    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006109    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006104    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006102    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006117    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005068    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006123    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005097    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005155    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005141    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005140    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005129    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005143    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005147    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005149    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005182    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005167    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005168    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005212    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006160    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005407    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005408    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005377    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005374    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005386    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006187    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006192    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005426    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005437    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006344    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006360    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006333    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006332    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005459    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00006322    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005510    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005469    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005499    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005519    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005487    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005493    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005541    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005560    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005551    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005553    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005606    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005607    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005625    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005695    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005650    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005682    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005668    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005669    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005666    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005701    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00005718    ' , 'A' , 'A')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0006' , '00621569    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0009' , '00022179    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0007' , '00409570    ' , 'B' , 'B')
 insert into tb_comproAerolineas (nrTalonario , nrComprobante , tpComprobante , tpLetra ) Values ('0009' , '00017602    ' , 'B' , 'B')


 --- DEBERIAN EXISTIR lOS 117 viajes
 select cdCliente , nrDoc , dsRazonSocial , x.dsOpcional4   from  tb_comprobantes  x inner join  tb_comproAerolineas  y  
							on  x.nrTalonario = y.nrTalonario 
								and  x.nrComprobante  = y.nrComprobante 
									and  x.tpComprobante   = y.tpComprobante 
										and  x.tpLetra    = y.tpLetra and nrDoc is null



select cdCliente , nrDoc , dsRazonSocial , x.dsOpcional4 into  tb_comprobantes_asigcompro999  from  tb_comprobantes  x inner join  tb_comproAerolineas  y  
							on  x.nrTalonario = y.nrTalonario 
								and  x.nrComprobante  = y.nrComprobante 
									and  x.tpComprobante   = y.tpComprobante 
										and  x.tpLetra    = y.tpLetra and nrDoc is null


 --- DEBERIAN EXISTIR lOS 117 viajes
update x set  cdCliente = 111 , nrDoc = '30-64140555-4', dsRazonSocial = 'AEROLINEAS ARGENTINAS S.A.' , x.dsOpcional4 ='asig 999 masiva'
from  tb_comprobantes  x inner join  tb_comproAerolineas  y  
							on  x.nrTalonario = y.nrTalonario 
								and  x.nrComprobante  = y.nrComprobante 
									and  x.tpComprobante   = y.tpComprobante 
										and  x.tpLetra    = y.tpLetra  
										  --- and  nrDoc is null and (cdCliente = '1' or cdCliente is null)


update x set  cdCliente = 111   --- Actualizamos la tabla de cupones 
from  tb_cupones  x inner join  tb_comproAerolineas  y  
							on  x.nrTalonarioCliente  = y.nrTalonario 
								and  x.nrComprabantecliente  = y.nrComprobante 
									and  x.tpComprobanteCliente   = y.tpComprobante 
										and  x.tpLetraCliente    = y.tpLetra  


select cdCliente   from  TB_Cupones   x inner join  tb_comproAerolineas  y  
							on  x.nrTalonarioCliente = y.nrTalonario 
								and  x.nrComprabanteCliente   = y.nrComprobante 
									and  x.tpComprobanteCliente    = y.tpComprobante 
										and  x.tpLetraCliente     = y.tpLetra 
											--- and  (cdCliente = '1' or cdCliente is null)












