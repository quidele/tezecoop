

declare @vlConcepto decimal(5,2)

set @vlConcepto = 2.41

update TB_Conceptos set vlConcepto = @vlConcepto  where tpConcepto = 'Valor REAL'


update tb_cajas set vlDiaReal = @vlConcepto  where convert(varchar,dtApertura,103) =  convert(varchar,GETDATE(),103)
and vlDiaReal = 0 and flEstado = 0
