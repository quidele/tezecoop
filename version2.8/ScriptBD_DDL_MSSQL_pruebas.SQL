-- cambios de DDL version 2.8
use dbSG2000_Pruebas
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_ObtenerMaxnrCaja_v2_8]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_ObtenerMaxnrCaja_v2_8]

go 



go 

CREATE PROCEDURE SP_ObtenerMaxnrCaja_v2_8
@nrPuesto  as int
AS
declare @miMaxNumero numeric
declare @MaxnrCaja numeric

	SELECT @MaxnrCaja=MAX(abs(nrCaja))
	FROM TB_Cajas
	WHERE nrPuesto =@nrPuesto

        if @MaxnrCaja is null
        begin
		select @miMaxNumero=convert(numeric,convert(varchar,@nrPuesto)+'000000001')
		select @MaxnrCaja=@miMaxNumero
       end	

       select @MaxnrCaja as MaxnrCaja;

      return 1;

go 
  
  