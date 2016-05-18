USE [FacturaElectronica_Prueba]
GO

/****** Object:  View [dbo].[v_cmpasociados_EX]    Script Date: 05/05/2011 12:05:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_cmpasociados_EX]
AS
	SELECT [idsolicitud] 
      ,[ptovtaasoc] as 'Cbte_punto_vta'
      ,[nroasoc] as 'Cbte_nro'
      ,[Cbte_tipo] as 'Cbte_tipo'
	FROM [FacturaElectronica_Prueba].[dbo].[cmpasociados]
GO


CREATE VIEW [dbo].[v_Comprobantes_EX]
AS
	SELECT
		C.idsolicitud as 'Id',
		C.tipo as 'Tipo_cbte',
		C.fechaemision as 'Fecha_cbte',
		C.ptovta as 'Punto_vta' ,
		C.nro_doc as 'Cbt_nro' ,
		C.concepto as 'Tipo_expo' ,
		C.ape as 'Permiso_existente' ,
		C.destinocmp as 'Dst_cmp' ,
		C.receptor as 'Cliente' ,
		C.nrodocreceptor as 'Cuit_pais_cliente' ,
		C.domicilioreceptor as 'Domicilio_cliente' ,
		C.idimpositivoreceptor as 'ID_impositivo' ,
		C.moneda as 'Moneda_ID' ,
		C.tipocambio as 'Moneda_Ctz' ,
		C.otrosdatoscomerciales as 'Obs_comerciales',
		C.importetotal as 'Imp_total',
		C.observa_envio as 'Obs',
		C.incoterms as 'Incoterms' ,
		C.detalleincoterms as 'Incoterms_Ds' ,
		C.idioma as 'Idioma_cbte',
		FP.descripcion as 'formaspago'
	FROM [FacturaElectronica_Prueba].[dbo].[comprobante] C, [FacturaElectronica_Prueba].[dbo].[formaspago] FP
	WHERE C.idsolicitud = fp.idsolicitud 

GO


CREATE VIEW [dbo].[v_Items_EX]
AS
	SELECT 
		PR.[cod] as 'Pro_codigo',
		PR.[desc] as 'Pro_ds',
		PR.[cant]	as 'Pro_qty',
		PR.[unimed] as 'Pro_umed',
		PR.[preciounit] as 'Pro_precio_uni',
		PR.[importe] as 'Pro_total_item'	

	FROM [FacturaElectronica_Prueba].[dbo].[detalle] PR

GO


CREATE VIEW [dbo].[v_PermisoDestino_EX]
AS
SELECT [idsolicitud] 
      ,[permisoemb] as 'Id_permisos'
      ,[destino] as 'Dst_merc'
  FROM [FacturaElectronica_Prueba].[dbo].[permisodestino]

GO


