-- Cambios de DML version 4.4
use dbSG2000
go 


exec [SP_ValorPromoRetorno]  

go

alter PROCEDURE [SP_ValorPromoRetorno] 
AS
begin
declare @vlConcepto as float 

	select @vlConcepto=vlConcepto
	from TB_Conceptos 
	where tpOperacion = 'Neutro' 
	      and tpConcepto='Valor Promo'
  	
  	select @vlConcepto = vlPrecioViaje  from TB_Productos  where tpDestino ='Retorno'

	select @vlConcepto=isnull(@vlConcepto,0)

	select @vlConcepto 'ValorPromo'
end	
	