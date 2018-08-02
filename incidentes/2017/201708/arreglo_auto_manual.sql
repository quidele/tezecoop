
declare @p1 int
set @p1=0
declare @p3 int
set @p3=1
declare @p4 int
set @p4=8196
declare @p5 int
set @p5=0
exec sp_cursoropen @p1 output,N'Exec SP_ObtenerFacturacionMensual_v4_9_71 07,2017,1,''FA'',''N'',''COMPROBANTE'',null',@p3 output,@p4 output,@p5 output
select @p1, @p3, @p4, @p5


select * from TB_Comprobantes where nrTalonario = '0001' and 
nrComprobante in (  '00000826'  ,
'00000827',    
'00000828' ,  
'00000829'  ,  
'00000836'   , 
'00000837') 
and tpComprobante = 'FA'


00000826    
00000827    
00000828    
00000829    
00000836    
00000837    