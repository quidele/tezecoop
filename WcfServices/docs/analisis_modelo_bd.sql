USE [FacturaElectronica]
GO

SELECT [idsolicitud]
      ,[CbteTipo]
      ,[PtoVta]
      ,[Concepto]
      ,[DocTipo]
      ,[DocNro]
      ,[CbteDesde]
      ,[CbteHasta]
      ,[CbteFch]
      ,[ImpTotal]
      ,[ImpTotConc]
      ,[ImpNeto]
      ,[ImpOpEx]
      ,[ImpIVA]
      ,[ImpTrib]
      ,[FchServDesde]
      ,[FchServHasta]
      ,[FchVtoPago]
      ,[MonId]
      ,[MonCotiz]
      ,[estado_envio]
      ,[CAE]
      ,[CAEFchVto]
      ,[nro_doc_afip]
  FROM [dbo].[comprobantes_ml]
  where estado_envio = 'Asignado' 
GO



SELECT *  FROM [dbo].[comprobantes_ml] WHERE idsolicitud = 3077787

select * from detalle_iva  where idsolicitud  = 3077787

select * from detalle_tributos   where idsolicitud  = 3077787

select * from cbtesasoc   where idsolicitud  = 3077787
