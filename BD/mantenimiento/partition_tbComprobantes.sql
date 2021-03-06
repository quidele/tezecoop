USE [dbSG2000_Pruebas]
GO
BEGIN TRANSACTION
CREATE PARTITION FUNCTION [pf_dtComprobante](datetime) AS RANGE RIGHT
 FOR VALUES (N'2008-01-01T00:00:00', N'2009-01-01T00:00:00', N'2010-01-01T00:00:00')


CREATE PARTITION SCHEME [ps_tbcomprobantes] 
AS PARTITION [pf_dtComprobante] TO ([partfile_1FG], [partfile_2FG], [partfile_3FG], [partfile_4FG])


CREATE CLUSTERED INDEX [ClusteredIndex_on_ps_tbcomprobantes_634262362798455100]
 ON [dbo].[TB_Comprobantes] 
(
	[dtComprobante]
)WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, 
DROP_EXISTING = OFF, ONLINE = OFF) ON [ps_tbcomprobantes]([dtComprobante])


DROP INDEX [ClusteredIndex_on_ps_tbcomprobantes_634262362798455100] ON
 [dbo].[TB_Comprobantes] WITH ( ONLINE = OFF )


COMMIT TRANSACTION


select year(dtComprobante) , count(*) from TB_Comprobantes 
group by year(dtComprobante)

2008	218491
2009	218747
2010	72412


select year(dtComprobante), $PARTITION.pf_dtComprobante(dtComprobante), COUNT(*)
 from TB_Comprobantes
 group by year(dtComprobante),  $PARTITION.pf_dtComprobante(dtComprobante)
 order by COUNT(*) desc
 
 
 select $PARTITION.pf_dtComprobante(dtComprobante) as particion, COUNT(*) as cantidad
  from TB_Comprobantes
  group by   $PARTITION.pf_dtComprobante(dtComprobante)
  order by COUNT(*) desc
 
